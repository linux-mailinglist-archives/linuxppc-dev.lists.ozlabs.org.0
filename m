Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C19127F2BDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 12:36:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UzNpmr1v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZMl44bmrz3dJX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 22:36:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UzNpmr1v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloudflare.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ignat@cloudflare.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZKFs4v8xz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 20:44:00 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cf52e5e07eso17804195ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 01:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700559837; x=1701164637; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeX6LBtHobyx/lTsQiwAAEvgonswp+TnKesxqxWL11M=;
        b=UzNpmr1vOEBDe6gSPpxAT2oSKSkTh6tGTzxj1IgE8Z8JDkuVFVd8EqMYhPUwPHxrk1
         K0yP55pxrdLgEEQTk858fHLDgy3kz/8iPQlfkS9NIOGwj62Ool2IKcNg6/ckiPOuS3Mh
         pQyQuiq5tijDLE0atJtBKl+1BM3tVAHaCExlGGiuqXYGuToHVhTdXznd14MRvfjjLXgb
         xfHUM0+yk16zucqjlWc8+C9QXzsBiqWD4dFQLwVHQZnW+bFAUCKVUVumw1E3TygMt+lU
         O6wJgB2hvwOBcBB8eg6zBMAVfxsf/lPcbjemFWCIeAl47f6MlKdGvyI9y6LaLPItL6Qu
         HwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700559837; x=1701164637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeX6LBtHobyx/lTsQiwAAEvgonswp+TnKesxqxWL11M=;
        b=r/21vNuVCY0rQqVw3W/8rCl0cEmT0IkJqXIOrMCex3s0e6xtnsdhJWW79WCOlAZ5EO
         f0VKH+BvZSIAIG0HiKaz7dJ45ybYINmHfliAm4ChW2J4B4K+Hu1Ir4MC1lGad2qAwQL3
         NuRILuz8bTTfVl6wN0X8LYEzoSX3d1r9YPBzhi6vyWDCDD9IMBoq7wg0MNbVpMjGDxJO
         prDM5cZthCZa8rdfBc5quexY/Q5MSPVXvoNks5wUeNYo9iSpX5+4hOEKWU3gTel2cimS
         otYEjZXFZKg5KcUTX4FadXiIyIIBiwUCGrXkpRwxnipYEbcm8VjT0BQJkepSIN2nDQHK
         +fDw==
X-Gm-Message-State: AOJu0YzpDahCISO0w9feOGAaHuA3nj/NHVKm8cuTwBN8M0mtl2pG554c
	6HKIDWzBnL81rGPxsqW6ClqXCNu4SyNqHJkZji74cg==
X-Google-Smtp-Source: AGHT+IEcUNpIPdW1r2zWS/VP7g/MssGikpOuJYLZxDVK+bKJDUZATHNuI3hhP6xrYrzf7teMAwRZk2h/7jc/ROLL0jw=
X-Received: by 2002:a17:90b:4d0a:b0:283:2d65:f231 with SMTP id
 mw10-20020a17090b4d0a00b002832d65f231mr3047813pjb.22.1700559836764; Tue, 21
 Nov 2023 01:43:56 -0800 (PST)
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv> <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
In-Reply-To: <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 21 Nov 2023 09:43:45 +0000
Message-ID: <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>, eric_devolder@yahoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Nov 2023 22:35:16 +1100
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, kernel-team <kernel-team@cloudflare.com>, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, Ingo Molnar <mingo@redhat.com>, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, Ard Biesheuvel <ardb@kernel.org>, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, go
 r@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel <linux-kernel@vger.kernel.org>, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 7:53=E2=80=AFAM Ignat Korchagin <ignat@cloudflare.c=
om> wrote:
>
> On Tue, Nov 21, 2023 at 1:50=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote=
:
> >
> > Eric DeVolder's Oracle mail address is not available anymore, add his
> > current mail address he told me.
>
> Thank you!
>
> > On 11/20/23 at 10:52pm, Ignat Korchagin wrote:
> > > Good day!
> > >
> > > We have recently started to evaluate Linux 6.6 and noticed that we
> > > cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> > > enabled. It seems to be related to commit 89cde455 ("kexec:
> > > consolidate kexec and crash options into kernel/Kconfig.kexec"), wher=
e
> > > a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
> > >
> > > In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
> > > with enforced signature check to support the kernel crash dumping
> > > functionality and would like to keep CONFIG_KEXEC disabled for
> > > security reasons [1].
> > >
> > > I was reading the long commit message, but the reason for adding
> > > CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
> > > believe from the implementation perspective CONFIG_KEXEC_FILE should
> > > suffice here (as we successfully used it for crashdumps on Linux 6.1)=
.
> > >
> > > Is there a reason for adding this dependency or is it just an
> > > oversight? Would some solution of requiring either CONFIG_KEXEC or
> > > CONFIG_KEXEC_FILE work here?
> >
> > I searched the patch history, found Eric didn't add the dependency on
> > CONFIG_KEXEC at the beginning. Later a linux-next building failure with
> > randconfig was reported, in there CONFIG_CRASH_DUMP enabled, while
> > CONFIG_KEXEC is disabled. Finally Eric added the KEXEC dependency for
> > CRASH_DUMP. Please see below link for more details:
> >
> > https://lore.kernel.org/all/3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle=
.com/T/#u
>
> Thank you for digging this up. However I'm still confused, because
> this is exactly how we configure Linux 6.1 (although we do have
> CONFIG_KEXEC_FILE enabled) and we don't have any problems. I believe
> we did not investigate this issue properly.

I did some preliminary investigation for this. If I patch out the
dependency on CONFIG_KEXEC the kernel builds just fine for x86
(without CONFIG_CRASH_HOTPLUG - which is probably another issue) - so
this was the previous behaviour. I can see that the reported error is
for arm architecture and was able to reproduce it with a simple cross
compiler in Debian. However, I think it is still somehow related to
this patchset as the previous kernels (up to 6.5) build fine with just
CONFIG_CRASH_DUMP and without CONFIG_KEXEC for arm as well. So even
for arm it was introduced in 6.6.

> > And besides, the newly added CONFIG_CRASH_HOTPLUG also needs
> > CONFIG_KEXEC if the elfcorehdr is allowed to be manipulated when
> > cpu/memory hotplug hapened.
>
> This still feels like a regression to me: any crash dump support
> should be independent of KEXEC syscalls being present. While probably
> the common case (including us) that the crashing kernel and recovery
> kernel are the same, they don't have to be. We need kexec syscall in
> the crashing kernel, but crashdump support in the recovery kernel (but
> the recovery kernel not having the kexec syscalls should be totally
> fine). If we do require some code definitions from kexec - at most we
> should put them under CONFIG_KEXEC_CORE.
>
> > Thanks
> > Baoquan
> >

Ignat
