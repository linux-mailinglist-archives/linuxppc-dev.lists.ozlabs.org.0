Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3917F4D25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 17:48:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FnqR3YgM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb6dB0Y04z3dBG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 03:48:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FnqR3YgM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloudflare.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ignat@cloudflare.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZxHs1bKWz301f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 20:47:52 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ce627400f6so37962445ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 01:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700646466; x=1701251266; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnfP4RJbON+lj35IXs9J/yXXOpNJWed6Pm5g2c+cjNg=;
        b=FnqR3YgMqYfke4oGOACfMl6E3Ruhf4yXG5v+y5Bx4u8dAz7DAcD5mrPDeP4eKaf63R
         Owoq5pOnLicaqoD4Vfex5+zUUO7w1MfEMlpAPZE8Fn6FBosgnKedlLZuLko2syNuwWus
         m5MS5TmTFmgft7SacXzmdCoR4mJaxeMVIjBTCLVvtEq4mJyPkH9Zbo6V9Y4DuXM18yZz
         YnKhXjwJU9pMvLw88xs4k2xOEIxS98FjwpKsumtf/qMFOxMpKDPqkHXA4cMjkf4C/LLJ
         cWwzhZHYDKD95OH4Fjheabd0H+nZsuJ2ozOLhXNmrgcoHH6xUj6Dik3gkTKKi3+F5ykg
         A5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646466; x=1701251266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnfP4RJbON+lj35IXs9J/yXXOpNJWed6Pm5g2c+cjNg=;
        b=b620RO60+GJZRUXOWs5xb68X61krmBogp6hTmdHzld1uputmlQKCkzqg8hmbArsaA0
         O/ISI7PEAc+zVqqqPx4bs3X3a7V23jgUZTQFZkQ9PpNck/7krsqNTjk6mG4WvU3gQqSB
         3cpfjFG+JEEVL5sj+/K4be6zWP3llORf0i9K47rfVXQChk6nDznVHXWUjUqBZmq2hQJY
         kQpo3bYuYoltRKmbr8YAEZQM854f2urzRcFhsLEJ09zxY44b0ua5A95kxkV4wR3y7+TI
         JkYpUmi/hZIU9mVgA2SI5QI27CSdFFtIe3begxfnjTEK4FJeGVOUtA2o6KKo0gPFOYv6
         bLQg==
X-Gm-Message-State: AOJu0YwpIUwPvWoOOQz28HYwg1607S7iNy6cOUeCtNfvXG2E0l/TOMkP
	o8OZlzo7IKgqkeUEAMje91trCcB18vz5rd0kYQgKoA==
X-Google-Smtp-Source: AGHT+IEoe5dhUWpYOgp49hInJ/tXkDzht17Dpr4KVAZ7DyJBSpmejqoRh7l88C3hHutZlPs8wlq5Gnw1rhenR1f8+40=
X-Received: by 2002:a17:90b:1d04:b0:27d:5946:5e2c with SMTP id
 on4-20020a17090b1d0400b0027d59465e2cmr1934810pjb.12.1700646466036; Wed, 22
 Nov 2023 01:47:46 -0800 (PST)
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv> <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
 <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com> <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
In-Reply-To: <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 22 Nov 2023 09:47:34 +0000
Message-ID: <CALrw=nGadgbwuNAFacatz-agpGn9NvtgaCUXu73MzAzZq07k-g@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 23 Nov 2023 03:46:57 +1100
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, dalias@libc.org, eric_devolder@yahoo.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, hpa@zytor.com, paulmck@kernel.org, ysato@users.sourceforge.jp, kernel-team <kernel-team@cloudflare.com>, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, Ingo Molnar <mingo@redhat.com>, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, Ard Biesheuvel <ardb@kernel.org>, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, 
 keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel <linux-kernel@vger.kernel.org>, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 9:34=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
>
> On 11/21/23 at 09:43am, Ignat Korchagin wrote:
> > On Tue, Nov 21, 2023 at 7:53=E2=80=AFAM Ignat Korchagin <ignat@cloudfla=
re.com> wrote:
> > >
> > > On Tue, Nov 21, 2023 at 1:50=E2=80=AFAM Baoquan He <bhe@redhat.com> w=
rote:
> > > >
> > > > Eric DeVolder's Oracle mail address is not available anymore, add h=
is
> > > > current mail address he told me.
> > >
> > > Thank you!
> > >
> > > > On 11/20/23 at 10:52pm, Ignat Korchagin wrote:
> > > > > Good day!
> > > > >
> > > > > We have recently started to evaluate Linux 6.6 and noticed that w=
e
> > > > > cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> > > > > enabled. It seems to be related to commit 89cde455 ("kexec:
> > > > > consolidate kexec and crash options into kernel/Kconfig.kexec"), =
where
> > > > > a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
> > > > >
> > > > > In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FIL=
E
> > > > > with enforced signature check to support the kernel crash dumping
> > > > > functionality and would like to keep CONFIG_KEXEC disabled for
> > > > > security reasons [1].
> > > > >
> > > > > I was reading the long commit message, but the reason for adding
> > > > > CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And=
 I
> > > > > believe from the implementation perspective CONFIG_KEXEC_FILE sho=
uld
> > > > > suffice here (as we successfully used it for crashdumps on Linux =
6.1).
> > > > >
> > > > > Is there a reason for adding this dependency or is it just an
> > > > > oversight? Would some solution of requiring either CONFIG_KEXEC o=
r
> > > > > CONFIG_KEXEC_FILE work here?
> > > >
> > > > I searched the patch history, found Eric didn't add the dependency =
on
> > > > CONFIG_KEXEC at the beginning. Later a linux-next building failure =
with
> > > > randconfig was reported, in there CONFIG_CRASH_DUMP enabled, while
> > > > CONFIG_KEXEC is disabled. Finally Eric added the KEXEC dependency f=
or
> > > > CRASH_DUMP. Please see below link for more details:
> > > >
> > > > https://lore.kernel.org/all/3e8eecd1-a277-2cfb-690e-5de2eb7b988e@or=
acle.com/T/#u
> > >
> > > Thank you for digging this up. However I'm still confused, because
> > > this is exactly how we configure Linux 6.1 (although we do have
> > > CONFIG_KEXEC_FILE enabled) and we don't have any problems. I believe
> > > we did not investigate this issue properly.
> >
> > I did some preliminary investigation for this. If I patch out the
> > dependency on CONFIG_KEXEC the kernel builds just fine for x86
> > (without CONFIG_CRASH_HOTPLUG - which is probably another issue) - so
> > this was the previous behaviour. I can see that the reported error is
> > for arm architecture and was able to reproduce it with a simple cross
> > compiler in Debian. However, I think it is still somehow related to
> > this patchset as the previous kernels (up to 6.5) build fine with just
> > CONFIG_CRASH_DUMP and without CONFIG_KEXEC for arm as well. So even
> > for arm it was introduced in 6.6.
>
> Thanks for the information.
>
> I haven't run the reproducer of issue reported on Eric's old patchset,
> while checkout to kernel 6.1, only s390 selected KEXEC for CRASH_DUMP
> already. And with the ARM building breakage, the simplest idea is
> to select KEXEC only for ARM or S390 CRASH_DUMP. I plan to try the
> reproducer later. If you have any idea or draft patch, please feel free
> to post.

The thing is - before 6.6 even ARM did not require KEXEC for
CRASH_DUMP (at least to successfully compile), so I think we should
understand what changed first before adding a dependency for ARM. I'll
try to investigate more, if I have time.

> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 7aff28ded2f4..382dcd8d7a9d 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -97,7 +97,7 @@ config CRASH_DUMP
>         depends on ARCH_SUPPORTS_KEXEC
>         select CRASH_CORE
>         select KEXEC_CORE
> -       select KEXEC
> +       select KEXEC if (ARM || S390)
>
>
> arch/s390/Kconfig in kernel 6.1:
> config CRASH_DUMP
>         bool "kernel crash dumps"
>         select KEXEC
>         help
>           Generate crash dump after being started by kexec.
>           Crash dump kernels are loaded in the main kernel with kexec-too=
ls
>           into a specially reserved region and then later executed after
>           a crash by kdump/kexec.
>           Refer to <file:Documentation/s390/zfcpdump.rst> for more detail=
s on this.
>           This option also enables s390 zfcpdump.
>           See also <file:Documentation/s390/zfcpdump.rst>
>
> >
> > > > And besides, the newly added CONFIG_CRASH_HOTPLUG also needs
> > > > CONFIG_KEXEC if the elfcorehdr is allowed to be manipulated when
> > > > cpu/memory hotplug hapened.
> > >
> > > This still feels like a regression to me: any crash dump support
> > > should be independent of KEXEC syscalls being present. While probably
> > > the common case (including us) that the crashing kernel and recovery
> > > kernel are the same, they don't have to be. We need kexec syscall in
> > > the crashing kernel, but crashdump support in the recovery kernel (bu=
t
> > > the recovery kernel not having the kexec syscalls should be totally
> > > fine). If we do require some code definitions from kexec - at most we
> > > should put them under CONFIG_KEXEC_CORE.
> > >
> > > > Thanks
> > > > Baoquan
> > > >
> >
> > Ignat
> >
>
