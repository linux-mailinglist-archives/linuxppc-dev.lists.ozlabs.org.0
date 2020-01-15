Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8FF13C6D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 16:01:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yVsB5H1LzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:01:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=dvyukov@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MZYzePp+; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yVm41TmSzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:57:07 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id w30so15941186qtd.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 06:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nCNJXe7yG41T3Zx4qiLeK6GwZVm1UZIhPymZyFVUSUg=;
 b=MZYzePp+G9uMZZtCkJs3BN18L8Uy/SlwPp0BPIpi4RBU6sN1Vitf1SinfGeC5StsWT
 Z+DgDe/gtQRwx+noRqxt2Eo16a7eTjKCysp0SJdnuIkJQGc30PN4IbvgV9Swav791+6g
 hlmR/q5g7ooX+VC/KKb/auNwuqRO0/2A8oBBXL3Dl5oHqV0HME2247CPNlxEBNGwRym/
 bWG1QqZ52X1FdXp1OwrDNokbty1u+yf9IlKvOWNfASAznqgtveydrA/L2ihMX3H/vSQN
 opr1TJbT5KY1Ou3sjuIYmjkgV+XhFmQEn7CEzo5emyuuqAX4rVPV0VewJ1dzX3W6Kutt
 ZpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nCNJXe7yG41T3Zx4qiLeK6GwZVm1UZIhPymZyFVUSUg=;
 b=pVfrm2G8MT5x4sc9pNM6JF+zS5mgjKp3jWcJ/yw/z40cIL1jeNM4RvR4yJbU63wTnS
 LnLrU0GLHtPVtsBeuSOWZrY/UmbgfgonvDjvB09k70d0KZcnf+mtAs7S19TDIhV4Ce6d
 9MtUy3QQmXAkzEZRV58Dg9Yii1bSvk2dYGmqlQJRHpatsFMAZSzKlOwyV65bS3hJwxiX
 2fJco/CvzkFjhwzkVlv9tx/ARjYKl4ChyrPLBK5VaHfT65diC9iLykL3yQZIb8nEVDp+
 uO7zSZtdOMTRxJ8Ul8fw+C2vFkg1vN9+7nvb/mi8+hPbvDXuUsJ+X7uxy70LpmPEwFa/
 yP3g==
X-Gm-Message-State: APjAAAVa6TB/6RMjWFx125P1okSXn1TGDWE97tNp6Ay8VXTZ3+9d8Pb9
 zcs8/cyDQ+ireQYUmRHbReA6v+FEo7uXCrf2fBEqDw==
X-Google-Smtp-Source: APXvYqxQTWzYvkElabm8IyCFVQzPYUT+BDucF6OEPohh4HYG/YcvsVzOs4frNe1iogvOv72FHumMy5az1cSGHe9J00c=
X-Received: by 2002:ac8:24c1:: with SMTP id t1mr3865061qtt.257.1579100222741; 
 Wed, 15 Jan 2020 06:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20200115063710.15796-1-dja@axtens.net>
 <20200115063710.15796-3-dja@axtens.net>
In-Reply-To: <20200115063710.15796-3-dja@axtens.net>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 15 Jan 2020 15:56:51 +0100
Message-ID: <CACT4Y+bxh1OmV64Z-EZrYk-otW9q_fxiHnvrE_VMYj-=YAk2Bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] string.h: fix incompatibility between FORTIFY_SOURCE
 and KASAN
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>,
 Daniel Micay <danielmicay@gmail.com>, Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 15, 2020 at 7:37 AM Daniel Axtens <dja@axtens.net> wrote:
>
> The memcmp KASAN self-test fails on a kernel with both KASAN and
> FORTIFY_SOURCE.
>
> When FORTIFY_SOURCE is on, a number of functions are replaced with
> fortified versions, which attempt to check the sizes of the operands.
> However, these functions often directly invoke __builtin_foo() once they
> have performed the fortify check. Using __builtins may bypass KASAN
> checks if the compiler decides to inline it's own implementation as
> sequence of instructions, rather than emit a function call that goes out
> to a KASAN-instrumented implementation.
>
> Why is only memcmp affected?
> ============================
>
> Of the string and string-like functions that kasan_test tests, only memcmp
> is replaced by an inline sequence of instructions in my testing on x86 with
> gcc version 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2).
>
> I believe this is due to compiler heuristics. For example, if I annotate
> kmalloc calls with the alloc_size annotation (and disable some fortify
> compile-time checking!), the compiler will replace every memset except the
> one in kmalloc_uaf_memset with inline instructions. (I have some WIP
> patches to add this annotation.)
>
> Does this affect other functions in string.h?
> =============================================
>
> Yes. Anything that uses __builtin_* rather than __real_* could be
> affected. This looks like:
>
>  - strncpy
>  - strcat
>  - strlen
>  - strlcpy maybe, under some circumstances?
>  - strncat under some circumstances
>  - memset
>  - memcpy
>  - memmove
>  - memcmp (as noted)
>  - memchr
>  - strcpy
>
> Whether a function call is emitted always depends on the compiler. Most
> bugs should get caught by FORTIFY_SOURCE, but the missed memcmp test shows
> that this is not always the case.
>
> Isn't FORTIFY_SOURCE disabled with KASAN?
> ========================================-
>
> The string headers on all arches supporting KASAN disable fortify with
> kasan, but only when address sanitisation is _also_ disabled. For example
> from x86:
>
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>  /*
>   * For files that are not instrumented (e.g. mm/slub.c) we
>   * should use not instrumented version of mem* functions.
>   */
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
>  #define memmove(dst, src, len) __memmove(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
>
>  #ifndef __NO_FORTIFY
>  #define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
>  #endif
>
>  #endif
>
> This comes from commit 6974f0c4555e ("include/linux/string.h: add the
> option of fortified string.h functions"), and doesn't work when KASAN is
> enabled and the file is supposed to be sanitised - as with test_kasan.c

Hi Daniel,

Thanks for addressing this. And special kudos for description detail level! :)

Phew, this layering of checking tools is a bit messy...

> I'm pretty sure this is backwards: we shouldn't be using __builtin_memcpy
> when we have a KASAN instrumented file, but we can use __builtin_* - and in
> many cases all fortification - in files where we don't have
> instrumentation.

I think if we use __builtin_* in a non-instrumented file, the compiler
can emit a call to normal mem* function which will be intercepted by
kasan and we will get instrumentation in a file which should not be
instrumented. Moreover this behavior will depend on optimization level
and compiler internals.
But as far as I see this does not affect any of the following and the
code change.



> What is correct behaviour?
> ==========================
>
> Firstly, there is some overlap between fortification and KASAN: both
> provide some level of _runtime_ checking. Only fortify provides
> compile-time checking.
>
> KASAN and fortify can pick up different things at runtime:
>
>  - Some fortify functions, notably the string functions, could easily be
>    modified to consider sub-object sizes (e.g. members within a struct),
>    and I have some WIP patches to do this. KASAN cannot detect these
>    because it cannot insert poision between members of a struct.
>
>  - KASAN can detect many over-reads/over-writes when the sizes of both
>    operands are unknown, which fortify cannot.
>
> So there are a couple of options:
>
>  1) Flip the test: disable fortify in santised files and enable it in
>     unsanitised files. This at least stops us missing KASAN checking, but
>     we lose the fortify checking.
>
>  2) Make the fortify code always call out to real versions. Do this only
>     for KASAN, for fear of losing the inlining opportunities we get from
>     __builtin_*.
>
> (We can't use kasan_check_{read,write}: because the fortify functions are
> _extern inline_, you can't include _static_ inline functions without a
> compiler warning. kasan_check_{read,write} are static inline so we can't
> use them even when they would otherwise be suitable.)
>
> Take approach 2 and call out to real versions when KASAN is enabled.

I support option 2.
For KASAN build we don't care about inlining/performance that much,
getting it to work reliably and with reasonable complexity is more
important.
And it's better to leave prod build as it is now (proving that any
change is harmless is impossible).



> Use __underlying_foo to distinguish from __real_foo: __real_foo always
> refers to the kernel's implementation of foo, __underlying_foo could be
> either the kernel implementation or the __builtin_foo implementation.
>
> Remove all the attempted disablement code in arch string headers.
>
> This makes all the tests succeed with FORTIFY_SOURCE enabled.
>
> Cc: Daniel Micay <danielmicay@gmail.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Fixes: 6974f0c4555e ("include/linux/string.h: add the option of fortified string.h functions")
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> ---
>
> Dmitry, this might cause a few new syzkaller splats - I first picked it up
> building from a syskaller config. Or it might not, it just depends what gets
> replaced with an inline sequence of instructions.
>
> checkpatch complains about some over-long lines, happy to change the format
> if anyone has better ideas for how to lay it out.
> ---
>  arch/arm64/include/asm/string.h   |  4 ---
>  arch/powerpc/include/asm/string.h |  4 ---
>  arch/s390/include/asm/string.h    |  4 ---
>  arch/x86/include/asm/string_64.h  |  4 ---
>  arch/xtensa/include/asm/string.h  |  3 --
>  include/linux/string.h            | 49 +++++++++++++++++++++++--------
>  6 files changed, 37 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm64/include/asm/string.h b/arch/arm64/include/asm/string.h
> index b31e8e87a0db..eafb2c4771fc 100644
> --- a/arch/arm64/include/asm/string.h
> +++ b/arch/arm64/include/asm/string.h
> @@ -59,10 +59,6 @@ void memcpy_flushcache(void *dst, const void *src, size_t cnt);
>  #define memmove(dst, src, len) __memmove(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
>
> -#ifndef __NO_FORTIFY
> -#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
> -#endif
> -
>  #endif
>
>  #endif
> diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
> index b72692702f35..952c5934596b 100644
> --- a/arch/powerpc/include/asm/string.h
> +++ b/arch/powerpc/include/asm/string.h
> @@ -43,10 +43,6 @@ void *__memmove(void *to, const void *from, __kernel_size_t n);
>  #define memmove(dst, src, len) __memmove(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
>
> -#ifndef __NO_FORTIFY
> -#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
> -#endif
> -
>  #endif
>
>  #ifdef CONFIG_PPC64
> diff --git a/arch/s390/include/asm/string.h b/arch/s390/include/asm/string.h
> index 4c0690fc5167..e0b66d8c89a1 100644
> --- a/arch/s390/include/asm/string.h
> +++ b/arch/s390/include/asm/string.h
> @@ -75,10 +75,6 @@ extern void *__memmove(void *dest, const void *src, size_t n);
>
>  #define __no_sanitize_prefix_strfunc(x) __##x
>
> -#ifndef __NO_FORTIFY
> -#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
> -#endif
> -
>  #else
>  #define __no_sanitize_prefix_strfunc(x) x
>  #endif /* defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__) */
> diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
> index 75314c3dbe47..ec63d11e1f04 100644
> --- a/arch/x86/include/asm/string_64.h
> +++ b/arch/x86/include/asm/string_64.h
> @@ -76,10 +76,6 @@ int strcmp(const char *cs, const char *ct);
>  #define memmove(dst, src, len) __memmove(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
>
> -#ifndef __NO_FORTIFY
> -#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
> -#endif
> -
>  #endif
>
>  #define __HAVE_ARCH_MEMCPY_MCSAFE 1
> diff --git a/arch/xtensa/include/asm/string.h b/arch/xtensa/include/asm/string.h
> index 89b51a0c752f..8cf04c5a33fb 100644
> --- a/arch/xtensa/include/asm/string.h
> +++ b/arch/xtensa/include/asm/string.h
> @@ -132,9 +132,6 @@ extern void *__memmove(void *__dest, __const__ void *__src, size_t __n);
>  #define memmove(dst, src, len) __memmove(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
>
> -#ifndef __NO_FORTIFY
> -#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
> -#endif
>  #endif
>
>  #endif /* _XTENSA_STRING_H */
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 3b8e8b12dd37..4364c106355e 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -317,6 +317,31 @@ void __read_overflow3(void) __compiletime_error("detected read beyond size of ob
>  void __write_overflow(void) __compiletime_error("detected write beyond size of object passed as 1st parameter");
>
>  #if !defined(__NO_FORTIFY) && defined(__OPTIMIZE__) && defined(CONFIG_FORTIFY_SOURCE)
> +
> +#ifdef CONFIG_KASAN
> +extern void *__underlying_memchr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);


arch headers do:

#if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
#define memcpy(dst, src, len) __memcpy(dst, src, len)
...

to disable instrumentation. Does this still work with this change?
Previously they disabled fortify. What happens now? Will define of
memcpy to __memcpy also affect __RENAME(memcpy), so that
__underlying_memcpy will be an alias to __memcpy?



> +extern int __underlying_memcmp(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);

All of these macros are leaking from the header file. Tomorrow we will
discover __underlying_memcpy uses somewhere in the wild, which will
not making understanding what actually happens simpler :)
Perhaps undef all of them at the bottom?



> +extern void *__underlying_memcpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
> +extern void *__underlying_memmove(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
> +extern void *__underlying_memset(void *p, int c, __kernel_size_t size) __RENAME(memset);
> +extern char *__underlying_strcat(char *p, const char *q) __RENAME(strcat);
> +extern char *__underlying_strcpy(char *p, const char *q) __RENAME(strcpy);
> +extern __kernel_size_t __underlying_strlen(const char *p) __RENAME(strlen);
> +extern char *__underlying_strncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
> +extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
> +#else
> +#define __underlying_memchr    __builtin_memchr
> +#define __underlying_memcmp    __builtin_memcmp
> +#define __underlying_memcpy    __builtin_memcpy
> +#define __underlying_memmove   __builtin_memmove
> +#define __underlying_memset    __builtin_memset
> +#define __underlying_strcat    __builtin_strcat
> +#define __underlying_strcpy    __builtin_strcpy
> +#define __underlying_strlen    __builtin_strlen
> +#define __underlying_strncat   __builtin_strncat
> +#define __underlying_strncpy   __builtin_strncpy
> +#endif
> +
>  __FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_size_t size)
>  {
>         size_t p_size = __builtin_object_size(p, 0);
> @@ -324,14 +349,14 @@ __FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_size_t size)
>                 __write_overflow();
>         if (p_size < size)
>                 fortify_panic(__func__);
> -       return __builtin_strncpy(p, q, size);
> +       return __underlying_strncpy(p, q, size);
>  }
>
>  __FORTIFY_INLINE char *strcat(char *p, const char *q)
>  {
>         size_t p_size = __builtin_object_size(p, 0);
>         if (p_size == (size_t)-1)
> -               return __builtin_strcat(p, q);
> +               return __underlying_strcat(p, q);
>         if (strlcat(p, q, p_size) >= p_size)
>                 fortify_panic(__func__);
>         return p;
> @@ -345,7 +370,7 @@ __FORTIFY_INLINE __kernel_size_t strlen(const char *p)
>         /* Work around gcc excess stack consumption issue */
>         if (p_size == (size_t)-1 ||
>             (__builtin_constant_p(p[p_size - 1]) && p[p_size - 1] == '\0'))
> -               return __builtin_strlen(p);
> +               return __underlying_strlen(p);
>         ret = strnlen(p, p_size);
>         if (p_size <= ret)
>                 fortify_panic(__func__);
> @@ -378,7 +403,7 @@ __FORTIFY_INLINE size_t strlcpy(char *p, const char *q, size_t size)
>                         __write_overflow();
>                 if (len >= p_size)
>                         fortify_panic(__func__);
> -               __builtin_memcpy(p, q, len);
> +               __underlying_memcpy(p, q, len);
>                 p[len] = '\0';
>         }
>         return ret;
> @@ -391,12 +416,12 @@ __FORTIFY_INLINE char *strncat(char *p, const char *q, __kernel_size_t count)
>         size_t p_size = __builtin_object_size(p, 0);
>         size_t q_size = __builtin_object_size(q, 0);
>         if (p_size == (size_t)-1 && q_size == (size_t)-1)
> -               return __builtin_strncat(p, q, count);
> +               return __underlying_strncat(p, q, count);
>         p_len = strlen(p);
>         copy_len = strnlen(q, count);
>         if (p_size < p_len + copy_len + 1)
>                 fortify_panic(__func__);
> -       __builtin_memcpy(p + p_len, q, copy_len);
> +       __underlying_memcpy(p + p_len, q, copy_len);
>         p[p_len + copy_len] = '\0';
>         return p;
>  }
> @@ -408,7 +433,7 @@ __FORTIFY_INLINE void *memset(void *p, int c, __kernel_size_t size)
>                 __write_overflow();
>         if (p_size < size)
>                 fortify_panic(__func__);
> -       return __builtin_memset(p, c, size);
> +       return __underlying_memset(p, c, size);
>  }
>
>  __FORTIFY_INLINE void *memcpy(void *p, const void *q, __kernel_size_t size)
> @@ -423,7 +448,7 @@ __FORTIFY_INLINE void *memcpy(void *p, const void *q, __kernel_size_t size)
>         }
>         if (p_size < size || q_size < size)
>                 fortify_panic(__func__);
> -       return __builtin_memcpy(p, q, size);
> +       return __underlying_memcpy(p, q, size);
>  }
>
>  __FORTIFY_INLINE void *memmove(void *p, const void *q, __kernel_size_t size)
> @@ -438,7 +463,7 @@ __FORTIFY_INLINE void *memmove(void *p, const void *q, __kernel_size_t size)
>         }
>         if (p_size < size || q_size < size)
>                 fortify_panic(__func__);
> -       return __builtin_memmove(p, q, size);
> +       return __underlying_memmove(p, q, size);
>  }
>
>  extern void *__real_memscan(void *, int, __kernel_size_t) __RENAME(memscan);
> @@ -464,7 +489,7 @@ __FORTIFY_INLINE int memcmp(const void *p, const void *q, __kernel_size_t size)
>         }
>         if (p_size < size || q_size < size)
>                 fortify_panic(__func__);
> -       return __builtin_memcmp(p, q, size);
> +       return __underlying_memcmp(p, q, size);
>  }
>
>  __FORTIFY_INLINE void *memchr(const void *p, int c, __kernel_size_t size)
> @@ -474,7 +499,7 @@ __FORTIFY_INLINE void *memchr(const void *p, int c, __kernel_size_t size)
>                 __read_overflow();
>         if (p_size < size)
>                 fortify_panic(__func__);
> -       return __builtin_memchr(p, c, size);
> +       return __underlying_memchr(p, c, size);
>  }
>
>  void *__real_memchr_inv(const void *s, int c, size_t n) __RENAME(memchr_inv);
> @@ -505,7 +530,7 @@ __FORTIFY_INLINE char *strcpy(char *p, const char *q)
>         size_t p_size = __builtin_object_size(p, 0);
>         size_t q_size = __builtin_object_size(q, 0);
>         if (p_size == (size_t)-1 && q_size == (size_t)-1)
> -               return __builtin_strcpy(p, q);
> +               return __underlying_strcpy(p, q);
>         memcpy(p, q, strlen(q) + 1);
>         return p;
>  }
> --
> 2.20.1
>
