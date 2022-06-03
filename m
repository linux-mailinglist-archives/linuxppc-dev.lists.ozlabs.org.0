Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118DB53C73B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 11:05:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDxmG6kKkz3brQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 19:05:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.135; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDxls2330z2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 19:04:40 +1000 (AEST)
Received: from mail-yb1-f176.google.com ([209.85.219.176]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MnWx3-1nXN332Oov-00jbPa for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun
 2022 11:04:36 +0200
Received: by mail-yb1-f176.google.com with SMTP id i11so12630967ybq.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 02:04:35 -0700 (PDT)
X-Gm-Message-State: AOAM531Ev/ZY0KVpGlOEm0b/3c3iDVI8OBIGV+je6OM1XFLMrfW+olMb
	fmhgfJ6BKZpv8PDFHF6qAsL3OinTuyetwhixT3U=
X-Google-Smtp-Source: ABdhPJxGeAN8L2TTa0OmtBnvf4prUEPKeEHwR00kai2asR+SRjF378BlWEUj7OqmnmyKUf8fALtBotqjUdd/y3nsm5s=
X-Received: by 2002:a25:69c4:0:b0:65c:ed2b:9106 with SMTP id
 e187-20020a2569c4000000b0065ced2b9106mr9755993ybc.394.1654247074548; Fri, 03
 Jun 2022 02:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220601054850.250287-1-rmclure@linux.ibm.com> <20220601054850.250287-2-rmclure@linux.ibm.com>
In-Reply-To: <20220601054850.250287-2-rmclure@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 3 Jun 2022 11:04:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jm=02geTcJcfLNpshx1bR1jAnLTzimaaAhB=mGHfJzg@mail.gmail.com>
Message-ID: <CAK8P3a3jm=02geTcJcfLNpshx1bR1jAnLTzimaaAhB=mGHfJzg@mail.gmail.com>
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
To: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vVWg/yClqwrF7SlejYbyLhSLJnwkrA/T6muVkZXl6nQHpOOETMk
 EutWxUppeC40vbVX7jBfoX0fmOZCrc5af3Qsm+q4vu8p802/2yjCW+x3FupN/9QUHubmr59
 NDj721X7Ln6SjOtl1S7Xmzg8o1TDjSA1sZwnmtoETqP+6xZnZKnTJNMcaMsNWtNDr1yy7cX
 GdVC5uORClartCY0weAgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCqq3D4A/OM=:uT+uBUC1Of0w6NFgwMfqUd
 3Yh/ijgHnE+ahB/Zsqc0VdJn1shiB5XwGlgSptyB0QmWiFspxTga4f93IWcOz2cYphXP3wmuG
 R7radOCNOLORcsj5tkLoSEqkiKh1E0MYtM99K9zPLNCYI2lBIUwCEb1fT3T+JZj2jEEizc6eP
 V0ePVprmBZT5XcPGtgqMlb5kk0eFQe7e4L3DjRaxZbhKVPvx0V/AFeTsPSSdsQl3sKTdYQz5l
 6al8MPVmmgC9tb6s0dOaMR/QpiPyp+x52ICGSZcAx/7j2vxgeN8a/ivH3Hnmd6EFHF5qNR84c
 nhjtCjqaWjKPQBaLu2OIf0a6VtYzOt4T2HgcYi4fFfj57ydQF3bH6pLjaEHYXoXdD6zfm/sY0
 xhN8cvrMicK/K1oZopPrTTayrrDdvR6qc015xhP7hWye64gZ6tzRrlgPg9rZK0GJGYT/AccZ5
 jatvO3219Osn2f9/A+l/MnTWt1tU5M0plJ48w47PU1wMCQP4fvFd9ciTO9341qy5EErSvo1io
 4rE2l6Cjto5WIIk6zsIByOrwToLGZYEEQcU/groUn1UYvvziGcZSqRy3cJAJwy/q8bj0mEkUY
 hQWBFgyFoB+PuOhzxeyx/Mcgaqy+ogxG63xT2lveZlFAlXQ5WYA1daHMPrcWxR3b1fLAvDncg
 OhLPOtk/HJeaidBfrjoOVgvcWqm1Ygkll5blqjFXJdc86ybsd5ZQp2APuEJ9LRJCqyILRwgBQ
 +ciLF/qLD2bZJGT0vU8hAXmJju9EfhN4EuyO4w==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Andrew Donnellan <ajd@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 1, 2022 at 7:48 AM Rohan McLure <rmclure@linux.ibm.com> wrote:
>
> Syscall wrapper implemented as per s390, x86, arm64, providing the
> option for gprs to be cleared on entry to the kernel, reducing caller
> influence influence on speculation within syscall routine. The wrapper
> is a macro that emits syscall handler implementations with parameters
> passed by stack pointer.
>
> For platforms supporting this syscall wrapper, emit symbols with usual
> in-register parameters (`sys...`) to support calls to syscall handlers
> from within the kernel.

Nice work!

> Syscalls are wrapped on all platforms except Cell processor. SPUs require
> access syscall prototypes which are omitted with ARCH_HAS_SYSCALL_WRAPPER
> enabled.

Right, I think it's ok to leave out the SPU side. In the long run, I
would like to
go back to requiring the prototypes for everything on all architectures, to
enforce type checking, but that's a separate piece of work.

> +/*
> + * For PowerPC specific syscall implementations, wrapper takes exact name and
> + * return type for a given function.
> + */
> +
> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
> +#define PPC_SYSCALL_DEFINE(x, type, name, ...)                                 \
> +       asmlinkage type __powerpc_##name(const struct pt_regs *regs);           \
> +       ALLOW_ERROR_INJECTION(__powerpc_##name, ERRNO);                         \
> +       type sys_##name(__MAP(x,__SC_DECL,__VA_ARGS__));                        \
> +       static type __se_##name(__MAP(x,__SC_LONG,__VA_ARGS__));                \
> +       static inline type __do_##name(__MAP(x,__SC_DECL,__VA_ARGS__));         \

What is the benefit of having a separate set of macros for this? I think that
adds more complexity than it saves in the end.

> @@ -68,52 +69,63 @@ unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
>  #define merge_64(high, low) ((u64)high << 32) | low
>  #endif
>
> -compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
> -                            u32 reg6, u32 pos1, u32 pos2)
> +PPC_SYSCALL_DEFINE(6, compat_ssize_t, compat_sys_pread64,
> +                  unsigned int, fd,
> +                  char __user *, ubuf, compat_size_t, count,
> +                  u32, reg6, u32, pos1, u32, pos2)
>  {
>         return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
>  }

We now have generalized versions of most of these system calls, as of 5.19-rc1
with the addition of the riscv compat support. I think it would be
best to try removing
the powerpc private versions wherever possible and use the common version,
modifying it further where necessary.

If this doesn't work for some of the syscalls, can you use the
COMPAT_SYSCALL_DEFINE for those in place of PPC_SYSCALL_DEFINE?

     Arnd
