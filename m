Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D54489B3E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 15:29:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXbn24wJgz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 01:29:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXbmb41q3z2xBZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 01:29:01 +1100 (AEDT)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M6YEz-1n0dCy3T33-006sQQ for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan
 2022 15:28:57 +0100
Received: by mail-wr1-f50.google.com with SMTP id q8so27037790wra.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 06:28:57 -0800 (PST)
X-Gm-Message-State: AOAM531uw2zxC3k3HiR9A/JptF4YqAFoZlKu1o6oxjmvsPtotDJUXp9M
 qEE13F2yVnw5FmHQq2fIBNDTg//vWt61lbjFxzQ=
X-Google-Smtp-Source: ABdhPJwP2dj7vwEXcQpaQSkksNl0ZEmP7KqS5c95/LhZe5KvkABgHfbU/HDC2zAjxcbRJXknKfqyiFGKdYDX7S/ttBs=
X-Received: by 2002:a05:6000:16c7:: with SMTP id
 h7mr17539097wrf.317.1641824936821; 
 Mon, 10 Jan 2022 06:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-12-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-12-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 15:28:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0H2Nq=bFdzWGzzGuFWP85JA7=Td6_rb8GqOF3bYCRJBw@mail.gmail.com>
Message-ID: <CAK8P3a0H2Nq=bFdzWGzzGuFWP85JA7=Td6_rb8GqOF3bYCRJBw@mail.gmail.com>
Subject: Re: [PATCH V2 11/17] riscv: compat: Add elf.h implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0xG9b1RspXENxVvIUAz8uEUUvjxHsPglytF+f5yOY/sa7JLjobW
 JfZWGdx3UBeUlh2CsZ3PpMd2vIjnAaJgu8P8h197SYFop76A26mtoxEQrrLpBDDjbysqV77
 q6IfArD0e8TumQMAHp0IPylmT2verWL/F4aYiYRy2mv8ikZBXxiGqEXh8tCvFJDJHCwPiIZ
 wZQd+BgqKpIujfiXwvzfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TrQq5ztPIRg=:YFswH+69cse02KpEsbkazK
 yJ388TmIbiQxEIj2pJYyjFR5MP1LQT4BMoaalmlz60dvPzuzBxrkX4ldvpQSXRNP+HyKzWI7K
 aDb2kgRZUGpX2b+GPJJG/fAN7vqL/ksrUmUs0eApWiBB5r30eHlJdw23yLhlcSyzLF7f51hFv
 ss+i9TJdWq8Bp5TrrWHDHtUyCrl+Nr+No8rGru7lM5ZjE7gBBEie8la7KdEGLOj3ZONNPrEht
 OhtQb5nxfEqlJmEManWdwAGJPFmpTbGxrCBrMJNx3C1YbZS+kfkBkX0x9GkG8KxGvlgyGzTjb
 Md2G6LWbHIi8sl8hGXhuzMatmxIpcdz90P5QJnOPhqI/RoHGdxthbcHrEUgUTTQlYPHFezZIA
 JXjabuuXWeIODj2uyzzFoLWvuY8QsCIUimpZ5NJTR8DZ7qiMvcQhMiL4BGsE/vPDTi2xOckCK
 W4nqGfTbewZHqc1Nlb5tiaUsMl508amufpYRX/RR0fVL7aOL1jG879i/uZ5P4bHxW4HEcoUCA
 Wa94LyF8/U21F9nHcLzrp55A38dSAvGdvFii3g2KQxFbY4kdcMVoWV8EYl1m786ToXi/B3rnH
 KXc67BkU0m0/gFZiDHIcWnQBnfhFsruQu+wwlB/TRYOnpoi3DBbn0FK28Td3+FDB634ckOQh4
 1xoodFNWp4hYNq1WxgQwpHVWVeTAoiXNlX4BlehVoMczaQepIYSrQg8xr5GZta64ns8sWBmxx
 YttlurB/KhYOuaTgm9EAjcE2MnbUpyakG4IDwCqrvplNezMnrkOh0s5zSHD1fK+XFjfiGi7AX
 aZtkmgrr6pI9WUniEbiW/DSxnTiHSteC9o9fPmXKBfAztSAvI4=
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement necessary type and macro for compat elf. See the code
> comment for detail.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

This looks mostly correct,

> +/*
> + * FIXME: not sure SET_PERSONALITY for compat process is right!
> + */
> +#define SET_PERSONALITY(ex)                                               \
> +do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)                         \
> +               set_thread_flag(TIF_32BIT);                                \
> +       else                                                               \
> +               clear_thread_flag(TIF_32BIT);                              \
> +       set_personality(PER_LINUX | (current->personality & (~PER_MASK))); \
> +} while (0)

This means the personality after exec is always set to PER_LINUX, not
PER_LINUX32, which I think is wrong: you want the PER_LINUX32
setting to stick, just like the upper bits do in the default implementation.

What the other ones do is:

| arch/parisc/include/asm/elf.h-
set_personality((current->personality & ~PER_MASK) | PER_LINUX); \

This looks like the same problem you introduce here: always forcing PER_LINUX
instead of PER_LINUX32 makes it impossible to use PER_LINUX32.

| arch/alpha/include/asm/elf.h:#define SET_PERSONALITY(EX)
                           \
| arch/alpha/include/asm/elf.h-   set_personality(((EX).e_flags &
EF_ALPHA_32BIT)         \
| arch/alpha/include/asm/elf.h-      ? PER_LINUX_32BIT : PER_LINUX)
| arch/csky/include/asm/elf.h:#define SET_PERSONALITY(ex)
set_personality(PER_LINUX)
| arch/nds32/include/asm/elf.h:#define SET_PERSONALITY(ex)
set_personality(PER_LINUX)

These look even worse: instead of forcing the lower bits to
PER_LINUX/PER_LINUX32 and
leaving the upper bits untouched, these also clear the upper bits
unconditionally.

| arch/arm64/include/asm/elf.h:#define SET_PERSONALITY(ex)
                                   \
| arch/arm64/include/asm/elf.h-   current->personality &=
~READ_IMPLIES_EXEC;                     \
| arch/x86/um/asm/elf.h:#define SET_PERSONALITY(ex) do {} while(0)
| arch/x86/include/asm/elf.h:#define set_personality_64bit()      do {
} while (0)
| arch/x86/kernel/process_64.c:static void __set_personality_ia32(void)
|         current->personality |= force_personality32;

Inconsistent: does not enforce PER_LINUX/PER_LINUX32 as the default
implementation
does, but just leaves the value untouched (other than (re)setting
READ_IMPLIES_EXEC).
I think this is harmless otherwise, as we generally ignore the lower
bits, except for the
bit of code that checks for PER_LINUX32 in override_architecture() to mangle the
output of sys_newuname() or in /proc/cpuinfo.

| arch/s390/include/asm/elf.h-    if
(personality(current->personality) != PER_LINUX32)   \
| arch/s390/include/asm/elf.h-            set_personality(PER_LINUX |
                   \
| arch/s390/include/asm/elf.h-
(current->personality & ~PER_MASK));    \
| arch/powerpc/include/asm/elf.h- if
(personality(current->personality) != PER_LINUX32)   \
| arch/powerpc/include/asm/elf.h-         set_personality(PER_LINUX |
                   \
| arch/powerpc/include/asm/elf.h-
(current->personality & (~PER_MASK)));  \
| arch/sparc/include/asm/elf_64.h-        if
(personality(current->personality) != PER_LINUX32)   \
| arch/sparc/include/asm/elf_64.h-
set_personality(PER_LINUX |             \
| arch/sparc/include/asm/elf_64.h-
(current->personality & (~PER_MASK)));  \

This is probably the behavior you want to copy.

      Arnd
