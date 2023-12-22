Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49B81C7B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 10:59:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JU4oHzW/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxN7Z4ybjz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 20:59:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JU4oHzW/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxN6l2mFhz2xQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 20:58:53 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6d3165ac96bso1246005b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 01:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703239131; x=1703843931; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTcCxUJL27ddH6D5M9oVZhfnGUHce9L/DOCN/1SMV+s=;
        b=JU4oHzW/HlSDuOp9e8Uwx5Z4gO5uVo4AZ7vgffMMkxlkIverxoeeE2sono15nYM+mU
         oQLqfgFNm5mdXZkllhPc02ooya+pjzk3X+Kvx5re00xIfx1juMRKHKUIo2a/Fuyhl1Aw
         UqG5NXWy/nl0UuUDv9vxaSAFeZynXGTkyH4K73G62B0N/kd9Btop9jQ37saNaqGedD30
         svRX5M96Q9Ru+SQ5ZCyEDMp4smpbpdoBpFWOCMGVKPQoByMlVWukk81Tovl09zkr5Dob
         LaOP8Q7Id9XI3Xw76lZ+iCrrSG7gI8p2P1xrRUZYkUWep/Qgjdtjb3eqw2Rletwrpk0g
         RQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703239131; x=1703843931;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTcCxUJL27ddH6D5M9oVZhfnGUHce9L/DOCN/1SMV+s=;
        b=W2WcUCYGYkqq4zwm+QVhqr9SegkFcQHSpAIaBL2YM0TixE1pbLhzrNpCF8mMywsTYF
         lms8dAitDkIGD7su3Vj+G+jqY3QOmkuricQQtIbqB8DTTnJ/ZxgLLGy+rxfLf78zNgoU
         pXINE13NeisZk48qM28rzo+xmXBYZsP+9l3+XG5WWoqF7gE6Cl4UxjT7quOxfRZA7rpZ
         s9WYcb2F27NlZCMvbESkA2z95nGY+jOu49pVe6ZvfgJqTy6h6y5VEx1LYDJN3KW1/YR5
         EniFYi4Iz/uPjegyw4Bh+BrxLELKru+JR3er7VKXL5nCzs99T4o/aDhFWH2SF6sMF4JT
         B6Yg==
X-Gm-Message-State: AOJu0Yz9ZZ7awOmoY95+jNI5VXN7GHrk5BKyuFlvuXH43EmtnakxDGBW
	RAirQEVkLSTQYqkTzPJY96Q=
X-Google-Smtp-Source: AGHT+IGOXE3Ldg+t9qQs+zrxUZCTaS3wif1/k2EocGhfOSk6zUmeSDem9TPtdES9niPNcG25Gjq6FA==
X-Received: by 2002:a05:6a20:9304:b0:186:aac2:26b9 with SMTP id r4-20020a056a20930400b00186aac226b9mr683682pzh.30.1703239131096;
        Fri, 22 Dec 2023 01:58:51 -0800 (PST)
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id qi10-20020a17090b274a00b0028b005bf19esm7061986pjb.34.2023.12.22.01.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 01:58:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 19:58:45 +1000
Message-Id: <CXURVO6COZBK.2YISETA5D0C2@wheely>
Subject: Re: [kvm-unit-tests PATCH v5 24/29] powerpc: interrupt tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-25-npiggin@gmail.com>
 <feab6612-31f6-41bd-8ee9-89a19aa0e76c@redhat.com>
In-Reply-To: <feab6612-31f6-41bd-8ee9-89a19aa0e76c@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Dec 19, 2023 at 11:57 PM AEST, Thomas Huth wrote:
> On 16/12/2023 14.42, Nicholas Piggin wrote:
> > Add basic testing of various kinds of interrupts, machine check,
> > page fault, illegal, decrementer, trace, syscall, etc.
> >=20
> > This has a known failure on QEMU TCG pseries machines where MSR[ME]
> > can be incorrectly set to 0.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   lib/powerpc/asm/ppc_asm.h |  21 +-
> >   powerpc/Makefile.common   |   3 +-
> >   powerpc/interrupts.c      | 422 +++++++++++++++++++++++++++++++++++++=
+
> >   powerpc/unittests.cfg     |   3 +
> >   4 files changed, 445 insertions(+), 4 deletions(-)
> >   create mode 100644 powerpc/interrupts.c
> >=20
> > diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
> > index ef2d91dd..778e78ee 100644
> > --- a/lib/powerpc/asm/ppc_asm.h
> > +++ b/lib/powerpc/asm/ppc_asm.h
> > @@ -35,17 +35,32 @@
> >  =20
> >   #endif /* __BYTE_ORDER__ */
> >  =20
> > +#define SPR_DSISR	0x012
> > +#define SPR_DAR		0x013
> > +#define SPR_DEC		0x016
> > +#define SPR_SRR0	0x01A
> > +#define SPR_SRR1	0x01B
> > +#define SPR_FSCR	0x099
> > +#define   FSCR_PREFIX	0x2000
> > +#define SPR_HDEC	0x136
> >   #define SPR_HSRR0	0x13A
> >   #define SPR_HSRR1	0x13B
> > +#define SPR_LPCR	0x13E
> > +#define   LPCR_HDICE	0x1UL
> > +#define SPR_HEIR	0x153
> > +#define SPR_SIAR	0x31C
> >  =20
> >   /* Machine State Register definitions: */
> >   #define MSR_LE_BIT	0
> >   #define MSR_EE_BIT	15			/* External Interrupts Enable */
> >   #define MSR_HV_BIT	60			/* Hypervisor mode */
> >   #define MSR_SF_BIT	63			/* 64-bit mode */
> > -#define MSR_ME		0x1000ULL
> >  =20
> > -#define SPR_HSRR0	0x13A
> > -#define SPR_HSRR1	0x13B
> > +#define MSR_DR		0x0010ULL
> > +#define MSR_IR		0x0020ULL
> > +#define MSR_BE		0x0200ULL		/* Branch Trace Enable */
> > +#define MSR_SE		0x0400ULL		/* Single Step Enable */
> > +#define MSR_EE		0x8000ULL
> > +#define MSR_ME		0x1000ULL
> >  =20
> >   #endif /* _ASMPOWERPC_PPC_ASM_H */
> > diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
> > index a7af225b..b340a53b 100644
> > --- a/powerpc/Makefile.common
> > +++ b/powerpc/Makefile.common
> > @@ -11,7 +11,8 @@ tests-common =3D \
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
> > index 00000000..3217b15e
> > --- /dev/null
> > +++ b/powerpc/interrupts.c
> > @@ -0,0 +1,422 @@
> > +/*
> > + * Test interrupts
> > + *
> > + * This work is licensed under the terms of the GNU LGPL, version 2.
> > + */
> > +#include <libcflat.h>
> > +#include <util.h>
> > +#include <migrate.h>
> > +#include <alloc.h>
> > +#include <asm/handlers.h>
> > +#include <asm/hcall.h>
> > +#include <asm/processor.h>
> > +#include <asm/barrier.h>
> > +
> > +#define SPR_LPCR	0x13E
> > +#define LPCR_HDICE	0x1UL
> > +#define SPR_DEC		0x016
> > +#define SPR_HDEC	0x136
> > +
> > +#define MSR_DR		0x0010ULL
> > +#define MSR_IR		0x0020ULL
> > +#define MSR_EE		0x8000ULL
> > +#define MSR_ME		0x1000ULL
>
> Why don't you use the definitions from ppc_asm.h above?

Yeah, should be more consistent with those. I'll take a look.

>
> > +static bool cpu_has_heir(void)
> > +{
> > +	uint32_t pvr =3D mfspr(287);	/* Processor Version Register */
> > +
> > +	if (!machine_is_powernv())
> > +		return false;
> > +
> > +	/* POWER6 has HEIR, but QEMU powernv support does not go that far */
> > +	switch (pvr >> 16) {
> > +	case 0x4b:			/* POWER8E */
> > +	case 0x4c:			/* POWER8NVL */
> > +	case 0x4d:			/* POWER8 */
> > +	case 0x4e:			/* POWER9 */
> > +	case 0x80:			/* POWER10 */
>
> I'd suggest to introduce some #defines for those PVR values instead of us=
ing=20
> magic numbers all over the place?

Yeah you're right.

>
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool cpu_has_prefix(void)
> > +{
> > +	uint32_t pvr =3D mfspr(287);	/* Processor Version Register */
> > +	switch (pvr >> 16) {
> > +	case 0x80:			/* POWER10 */
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool cpu_has_lev_in_srr1(void)
> > +{
> > +	uint32_t pvr =3D mfspr(287);	/* Processor Version Register */
> > +	switch (pvr >> 16) {
> > +	case 0x80:			/* POWER10 */
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> > +static bool regs_is_prefix(volatile struct pt_regs *regs)
> > +{
> > +	return (regs->msr >> (63-34)) & 1;
>
> You introduced a bunch of new #define MSR_xx statements ... why not for t=
his=20
> one, too?

It's an interrupt-specific bit so SRR1_xx, but yes it should be a
define.

>
> > +}
> > +
> > +static void regs_advance_insn(struct pt_regs *regs)
> > +{
> > +	if (regs_is_prefix(regs))
> > +		regs->nip +=3D 8;
> > +	else
> > +		regs->nip +=3D 4;
> > +}
> > +
> > +static volatile bool got_interrupt;
> > +static volatile struct pt_regs recorded_regs;
> > +
> > +static void mce_handler(struct pt_regs *regs, void *opaque)
> > +{
> > +	got_interrupt =3D true;
> > +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> > +	regs_advance_insn(regs);
> > +}
> > +
> > +static void test_mce(void)
> > +{
> > +	unsigned long addr =3D -4ULL;
> > +	uint8_t tmp;
> > +
> > +	handle_exception(0x200, mce_handler, NULL);
> > +
> > +	if (machine_is_powernv()) {
> > +		enable_mcheck();
> > +	} else {
> > +		report(mfmsr() & MSR_ME, "pseries machine has MSR[ME]=3D1");
> > +		if (!(mfmsr() & MSR_ME)) { /* try to fix it */
> > +			enable_mcheck();
> > +		}
> > +		if (mfmsr() & MSR_ME) {
> > +			disable_mcheck();
> > +			report(mfmsr() & MSR_ME, "pseries is unable to change MSR[ME]");
> > +			if (!(mfmsr() & MSR_ME)) { /* try to fix it */
> > +				enable_mcheck();
> > +			}
> > +		}
> > +	}
> > +
> > +	asm volatile("lbz %0,0(%1)" : "=3Dr"(tmp) : "r"(addr));
> > +
> > +	report(got_interrupt, "MCE on access to invalid real address");
> > +	report(mfspr(SPR_DAR) =3D=3D addr, "MCE sets DAR correctly");
> > +	got_interrupt =3D false;
> > +}
> > +
> > +static void dseg_handler(struct pt_regs *regs, void *data)
> > +{
> > +	got_interrupt =3D true;
> > +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> > +	regs_advance_insn(regs);
> > +	regs->msr &=3D ~MSR_DR;
> > +}
> > +
> > +static void test_dseg(void)
> > +{
> > +	uint64_t msr, tmp;
> > +
> > +	report_prefix_push("data segment");
> > +
> > +	/* Some HV start in radix mode and need 0x300 */
> > +	handle_exception(0x300, &dseg_handler, NULL);
> > +	handle_exception(0x380, &dseg_handler, NULL);
> > +
> > +	asm volatile(
> > +"		mfmsr	%0		\n \
> > +		ori	%0,%0,%2	\n \
> > +		mtmsrd	%0		\n \
> > +		lbz	%1,0(0)		"
> > +		: "=3Dr"(msr), "=3Dr"(tmp) : "i"(MSR_DR): "memory");
> > +
> > +	report(got_interrupt, "interrupt on NULL dereference");
> > +	got_interrupt =3D false;
> > +
> > +	handle_exception(0x300, NULL, NULL);
> > +	handle_exception(0x380, NULL, NULL);
> > +
> > +	report_prefix_pop();
> > +}
> > +
> > +static void dec_handler(struct pt_regs *regs, void *data)
> > +{
> > +	got_interrupt =3D true;
> > +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> > +	regs->msr &=3D ~MSR_EE;
> > +}
> > +
> > +static void test_dec(void)
> > +{
> > +	uint64_t msr;
> > +
> > +	report_prefix_push("decrementer");
> > +
> > +	handle_exception(0x900, &dec_handler, NULL);
> > +
> > +	asm volatile(
> > +"		mtdec	%1		\n \
> > +		mfmsr	%0		\n \
> > +		ori	%0,%0,%2	\n \
> > +		mtmsrd	%0,1		"
> > +		: "=3Dr"(msr) : "r"(10000), "i"(MSR_EE): "memory");
> > +
> > +	while (!got_interrupt)
> > +		;
>
> Maybe add a timeout (in case the interrupt never fires)?

Yeah that would improve things.

> > +	report(got_interrupt, "interrupt on decrementer underflow");
> > +	got_interrupt =3D false;
> > +
> > +	handle_exception(0x900, NULL, NULL);
> > +
> > +	if (!machine_is_powernv())
> > +		goto done;
> > +
> > +	handle_exception(0x980, &dec_handler, NULL);
> > +
> > +	mtspr(SPR_LPCR, mfspr(SPR_LPCR) | LPCR_HDICE);
> > +	asm volatile(
> > +"		mtspr	0x136,%1	\n \
> > +		mtdec	%3		\n \
> > +		mfmsr	%0		\n \
> > +		ori	%0,%0,%2	\n \
> > +		mtmsrd	%0,1		"
> > +		: "=3Dr"(msr) : "r"(10000), "i"(MSR_EE), "r"(0x7fffffff): "memory");
> > +
> > +	while (!got_interrupt)
> > +		;
>
> dito?

Will do.

Thanks,
Nick
