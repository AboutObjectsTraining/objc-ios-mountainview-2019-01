#import "ANSICBasics.h"

void PrintMyArray(char *a, int length) {
    for (int i = 0; i < length; i++) {
        printf("address: %p, value: %c\n", &a[i], a[i]);
    }
}
void PrintIntArray(int *a, int length) {
    for (int i = 0; i < length; i++) {
        printf("address: %p, value: %d\n", &a[i], a[i]);
    }
}

void DoUnthinkablyDangerousThings() {
    
    int numbers[10] = { 1, 2, 3 };
    PrintIntArray(numbers, 10);
    
    char foo[] = "Hello";
    char *word = "Hello";
    char *bar = "Hello";
    
    foo[0] = 'J';

//    word[0] = 'B';
    
    printf("%s\n", word);
    printf("%s\n", foo);
    
    PrintMyArray(word, 6);
    PrintMyArray(foo, 6);
}

int main(int argc, const char * argv[]) {
    RunANSICBasics01();
    RunANSICBasics02();
    
    DoUnthinkablyDangerousThings();
    
    return 0;
}
