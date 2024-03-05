Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82287138B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:20:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AI2UN90z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpfRR2YLKz3dDn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AI2UN90z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpfQk0Fk8z2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:19:40 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ce942efda5so4236514a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709605179; x=1710209979; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoJ8PMFG+qLmT7z1XiSRXTkrr7OydTzzYFpmF/A+8/k=;
        b=AI2UN90zZv7x8GWZqro03KwkFEEQ9B26kj0lB/YGUK7abv06wrISoL6C/VmiRf9w7h
         CTQtD8oKkAuG7mQZU7Q3YivCGtOEWlz5FGp6aqohzfZ3u4/8KBdgXhxezkFTMckGblkQ
         VgFVgcthtYWIIOcpo3HHZgJ9x1WF26IP7z5YlMg3TBQYo7Jpvx0n0ZJ0wuaJacPAKkbG
         s/bggHiN78k13nu5jV+ZUZWM7xyfguKxuxIimbWF9qy59QvTGhMaCzNylMKj/m7mJdda
         WPWaaaROU9riUmzBwHdS9W9J7TEj7qOoEAUQwonGUpnEU9OnJaJov6UaqyJA6zfnxXvy
         2nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709605179; x=1710209979;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eoJ8PMFG+qLmT7z1XiSRXTkrr7OydTzzYFpmF/A+8/k=;
        b=PU35k3dHrsoqLD8cqH+k+/RdUd7RSnWjpQosr/5F5BOxsQd+IzCSLz+JwZ+/gGYjVB
         8fbOcDE6hqua0z3JbToH0JZ06mLRzwwYFk76+Lak8e4bNrFfo69SI4UsBJIUpf+qfXYn
         +vokdilpCom22TpPHtrkQTAV9zsCdeH3GfIgdnxYeTSnkh9K/3QwFTRgD6WEKAjCbgop
         8cJCAoqPR0P360BJqCH9U81HvwiWZgUIXxSrR6VdrPT3cbKPGKTyWROduUXrDE2DAUao
         kEz4zLLpCg7fA99Fnb1mLY0zPf/hABu9eAJcCOwse/mPp4UlW54xTkyUXtR7Pary0OAP
         Z2Og==
X-Forwarded-Encrypted: i=1; AJvYcCV1IIM8AZvYCQYeSJP0RWJ37sUSKzsDGarrtB8HvzBFSAvd1MAUG87/GrtrvFT/XirO8z2aMqNnkYsYzUvoYVVjVm+x5H3lrNfYUU9lKw==
X-Gm-Message-State: AOJu0Yzl/PLJeAq2S1xe2YwEyhBfSHcLnfuHCiRc5ya2WLg6eLlPhBvB
	5PMM7CGv3MzUlfzBxk4zKul3kS/p+6fkSZ6QZElgJurDaVWmWNGq
X-Google-Smtp-Source: AGHT+IHgpjCWKep0JPfgj37yDf77qRqL+JTEAVLUknvmT32wbjHdHn49KfPQi5Vfs9R9lc6DQCU2ig==
X-Received: by 2002:a05:6a20:9587:b0:1a1:48df:e19a with SMTP id iu7-20020a056a20958700b001a148dfe19amr600895pzb.35.1709605178648;
        Mon, 04 Mar 2024 18:19:38 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id j4-20020a635944000000b005e43cce33f8sm7984554pgm.88.2024.03.04.18.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:19:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:19:32 +1000
Message-Id: <CZLGGDYWE8P0.VKR8WWH6B6LM@wheely>
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
In-Reply-To: <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel
 Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 1, 2024 at 10:41 PM AEST, Thomas Huth wrote:
> On 26/02/2024 11.12, Nicholas Piggin wrote:
> > Add basic testing of various kinds of interrupts, machine check,
> > page fault, illegal, decrementer, trace, syscall, etc.
> >=20
> > This has a known failure on QEMU TCG pseries machines where MSR[ME]
> > can be incorrectly set to 0.
>
> Two questions out of curiosity:
>
> Any chance that this could be fixed easily in QEMU?

Yes I have a fix on the mailing list. It should get into 9.0 and
probably stable.

> Or is there a way to detect TCG from within the test? (for example, we ha=
ve=20
> a host_is_tcg() function for s390x so we can e.g. use report_xfail() for=
=20
> tests that are known to fail on TCG there)

I do have a half-done patch which adds exactly this.

One (minor) annoyance is that it doesn't seem possible to detect QEMU
version to add workarounds. E.g., we would like to test the fixed
functionality, but older qemu should not. Maybe that's going too much
into a rabbit hole. We *could* put a QEMU version into device tree
to deal with this though...

Thanks,
Nick
>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   lib/powerpc/asm/processor.h |   4 +
> >   lib/powerpc/asm/reg.h       |  17 ++
> >   lib/powerpc/setup.c         |  11 +
> >   lib/ppc64/asm/ptrace.h      |  16 ++
> >   powerpc/Makefile.common     |   3 +-
> >   powerpc/interrupts.c        | 415 +++++++++++++++++++++++++++++++++++=
+
> >   powerpc/unittests.cfg       |   3 +
> >   7 files changed, 468 insertions(+), 1 deletion(-)
> >   create mode 100644 powerpc/interrupts.c
> >=20
> > diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
> > index cf1b9d8ff..eed37d1f4 100644
> > --- a/lib/powerpc/asm/processor.h
> > +++ b/lib/powerpc/asm/processor.h
> > @@ -11,7 +11,11 @@ void do_handle_exception(struct pt_regs *regs);
> >   #endif /* __ASSEMBLY__ */
> >  =20
> >   extern bool cpu_has_hv;
> > +extern bool cpu_has_power_mce;
> > +extern bool cpu_has_siar;
> >   extern bool cpu_has_heai;
> > +extern bool cpu_has_prefix;
> > +extern bool cpu_has_sc_lev;
> >  =20
> >   static inline uint64_t mfspr(int nr)
> >   {
> > diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
> > index 782e75527..d6097f48f 100644
> > --- a/lib/powerpc/asm/reg.h
> > +++ b/lib/powerpc/asm/reg.h
> > @@ -5,8 +5,15 @@
> >  =20
> >   #define UL(x) _AC(x, UL)
> >  =20
> > +#define SPR_DSISR	0x012
> > +#define SPR_DAR		0x013
> > +#define SPR_DEC		0x016
> >   #define SPR_SRR0	0x01a
> >   #define SPR_SRR1	0x01b
> > +#define   SRR1_PREFIX		UL(0x20000000)
> > +#define SPR_FSCR	0x099
> > +#define   FSCR_PREFIX		UL(0x2000)
> > +#define SPR_HFSCR	0x0be
> >   #define SPR_TB		0x10c
> >   #define SPR_SPRG0	0x110
> >   #define SPR_SPRG1	0x111
> > @@ -22,12 +29,17 @@
> >   #define   PVR_VER_POWER8	UL(0x004d0000)
> >   #define   PVR_VER_POWER9	UL(0x004e0000)
> >   #define   PVR_VER_POWER10	UL(0x00800000)
> > +#define SPR_HDEC	0x136
> >   #define SPR_HSRR0	0x13a
> >   #define SPR_HSRR1	0x13b
> > +#define SPR_LPCR	0x13e
> > +#define   LPCR_HDICE		UL(0x1)
> > +#define SPR_HEIR	0x153
> >   #define SPR_MMCR0	0x31b
> >   #define   MMCR0_FC		UL(0x80000000)
> >   #define   MMCR0_PMAE		UL(0x04000000)
> >   #define   MMCR0_PMAO		UL(0x00000080)
> > +#define SPR_SIAR	0x31c
> >  =20
> >   /* Machine State Register definitions: */
> >   #define MSR_LE_BIT	0
> > @@ -35,6 +47,11 @@
> >   #define MSR_HV_BIT	60			/* Hypervisor mode */
> >   #define MSR_SF_BIT	63			/* 64-bit mode */
> >  =20
> > +#define MSR_DR		UL(0x0010)
> > +#define MSR_IR		UL(0x0020)
> > +#define MSR_BE		UL(0x0200)		/* Branch Trace Enable */
> > +#define MSR_SE		UL(0x0400)		/* Single Step Enable */
> > +#define MSR_EE		UL(0x8000)
> >   #define MSR_ME		UL(0x1000)
> >  =20
> >   #endif
> > diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
> > index 3c81aee9e..9b665f59c 100644
> > --- a/lib/powerpc/setup.c
> > +++ b/lib/powerpc/setup.c
> > @@ -87,7 +87,11 @@ static void cpu_set(int fdtnode, u64 regval, void *i=
nfo)
> >   }
> >  =20
> >   bool cpu_has_hv;
> > +bool cpu_has_power_mce; /* POWER CPU machine checks */
> > +bool cpu_has_siar;
> >   bool cpu_has_heai;
> > +bool cpu_has_prefix;
> > +bool cpu_has_sc_lev; /* sc interrupt has LEV field in SRR1 */
> >  =20
> >   static void cpu_init(void)
> >   {
> > @@ -112,15 +116,22 @@ static void cpu_init(void)
> >  =20
> >   	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
> >   	case PVR_VER_POWER10:
> > +		cpu_has_prefix =3D true;
> > +		cpu_has_sc_lev =3D true;
> >   	case PVR_VER_POWER9:
> >   	case PVR_VER_POWER8E:
> >   	case PVR_VER_POWER8NVL:
> >   	case PVR_VER_POWER8:
> > +		cpu_has_power_mce =3D true;
> >   		cpu_has_heai =3D true;
> > +		cpu_has_siar =3D true;
> >   		break;
> >   	default:
> >   		break;
> >   	}
> > +
> > +	if (!cpu_has_hv) /* HEIR is HV register */
> > +		cpu_has_heai =3D false;
> >   }
> >  =20
> >   static void mem_init(phys_addr_t freemem_start)
> > diff --git a/lib/ppc64/asm/ptrace.h b/lib/ppc64/asm/ptrace.h
> > index 12de7499b..db263a59e 100644
> > --- a/lib/ppc64/asm/ptrace.h
> > +++ b/lib/ppc64/asm/ptrace.h
> > @@ -5,6 +5,9 @@
> >   #define STACK_FRAME_OVERHEAD    112     /* size of minimum stack fram=
e */
> >  =20
> >   #ifndef __ASSEMBLY__
> > +
> > +#include <asm/reg.h>
> > +
> >   struct pt_regs {
> >   	unsigned long gpr[32];
> >   	unsigned long nip;
> > @@ -17,6 +20,19 @@ struct pt_regs {
> >   	unsigned long _pad; /* stack must be 16-byte aligned */
> >   };
> >  =20
> > +static inline bool regs_is_prefix(volatile struct pt_regs *regs)
> > +{
> > +	return regs->msr & SRR1_PREFIX;
> > +}
> > +
> > +static inline void regs_advance_insn(struct pt_regs *regs)
> > +{
> > +	if (regs_is_prefix(regs))
> > +		regs->nip +=3D 8;
> > +	else
> > +		regs->nip +=3D 4;
> > +}
> > +
> >   #define STACK_INT_FRAME_SIZE    (sizeof(struct pt_regs) + \
> >   				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
> >  =20
> > diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
> > index 1e181da69..68165fc25 100644
> > --- a/powerpc/Makefile.common
> > +++ b/powerpc/Makefile.common
> > @@ -12,7 +12,8 @@ tests-common =3D \
> >   	$(TEST_DIR)/rtas.elf \
> >   	$(TEST_DIR)/emulator.elf \
> >   	$(TEST_DIR)/tm.elf \
> > -	$(TEST_DIR)/sprs.elf
> > +	$(TEST_DIR)/sprs.elf \
> > +	$(TEST_DIR)/interrupts.elf
> >  =20
> >   tests-all =3D $(tests-common) $(tests)
> >   all: directories $(TEST_DIR)/boot_rom.bin $(tests-all)
> > diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
> > new file mode 100644
> > index 000000000..442f8c569
> > --- /dev/null
> > +++ b/powerpc/interrupts.c
> > @@ -0,0 +1,415 @@
> > +/*
> > + * Test interrupts
> > + *
> > + * Copyright 2024 Nicholas Piggin, IBM Corp.
> > + *
> > + * This work is licensed under the terms of the GNU LGPL, version 2.
>
> I know, we're using this line in a lot of source files ... but maybe we=
=20
> should do better for new files at least: "LGPL, version 2" is a little bi=
t=20
> ambiguous: Does it mean the "Library GPL version 2.0" or the "Lesser GPL=
=20
> version 2.1"? Maybe you could clarify by additionally providing a SPDX=20
> identifier here, or by explicitly writing 2.0 or 2.1.

Sure I'll try to improve this for all the new files.

Thanks,
Nick
