Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FF481891E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 14:58:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ee+GSLH5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MkZh8oj8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvdZL33bsz3cWY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 00:58:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ee+GSLH5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MkZh8oj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvdYS2qHhz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 00:57:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702994247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MnEkB3YngTbNnJEADr4KAVUClYyGSXeKM6nM2RaFhVM=;
	b=Ee+GSLH5WBADBV4n01obUS/Yb8TnIhTlVnnP8Q+NgwLMMYPpQBFpJ2pleMthknWJ1v1dKH
	cZYYvZv4GWqwtJR65/DcO8GPWQPNe01DWl7ax4+IoXiVzSAysH96sjnUprDyf0fjE2iVR6
	DKIquzYp2oNFZW56TC+fY4LO9532t6Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702994248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MnEkB3YngTbNnJEADr4KAVUClYyGSXeKM6nM2RaFhVM=;
	b=MkZh8oj8Ht5MhiNykP+7LzUsS8bUSM3z4LmUwQLXcZVcWgicraTKuJh2DjL6eSwa2H9tns
	f7wdBEt19R0/og9u6fNTwBiNo/qVNqrX3DZtssEIVX7P6snAO3JqthDsJeIx4xEs2+7uxO
	HQ53cMBjUk9l2zWVDvofFR1XOSGh+p0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-lMx19mMsM7W1KtiiZwve2w-1; Tue, 19 Dec 2023 08:57:26 -0500
X-MC-Unique: lMx19mMsM7W1KtiiZwve2w-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-77f52d63028so431971485a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 05:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702994246; x=1703599046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnEkB3YngTbNnJEADr4KAVUClYyGSXeKM6nM2RaFhVM=;
        b=qc1BOo3DMRTMC9T0yNnGtpKbC4rHIXsGCkOMTP+rOTC39O9G0hT6a0OVJiFALgZmg8
         z++HBAMwkWnhy3+x9tLJf0Bvr+nvaExFkvrNF22h8/RfLbVH2ds9yP86qR/sVDXjVzS1
         R/Pv44cbhRXwkTpBR7dD9vDigQ2odZ5T+BeQvyB8HHnzQe2wGROcrHAwSfnprdRaC9SM
         FobEGVlZ6xzqMv5zbr8rkYpSW3jAiSyNQvubL2CVOg6FIAts3XUvdsSWosjjYQYypLEf
         6KCwgr3lsHWacXClIz+V+8FTuFVQKI9NdCO8EF/boOYPjWS0UicC9HJlgdr1++IY/uou
         ED0A==
X-Gm-Message-State: AOJu0YzeFrGjgSAVezVrMwsehSSEcoFyOdzmj8mRspN2Ivndza3fQjId
	WQUYfSciV/cfnOSXjiy3tUwNcY6yPBIltrkAoh78iKmmYM2NgTZk3/sfqRbXFAmzWeihnrC6Fdh
	30F7YIIr4AGRy/PIsupbouarqrw==
X-Received: by 2002:a05:620a:640e:b0:77e:fba3:a7bb with SMTP id pz14-20020a05620a640e00b0077efba3a7bbmr16666930qkn.153.1702994245786;
        Tue, 19 Dec 2023 05:57:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgT7LhlFykkK+d5SObE8MJ1RW0dahd9/hlzsXLOy7kpOXSaaZZhegEjcCJo2py8dhf/C5vkA==
X-Received: by 2002:a05:620a:640e:b0:77e:fba3:a7bb with SMTP id pz14-20020a05620a640e00b0077efba3a7bbmr16666919qkn.153.1702994245481;
        Tue, 19 Dec 2023 05:57:25 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-45.web.vodafone.de. [109.43.177.45])
        by smtp.gmail.com with ESMTPSA id oo22-20020a05620a531600b0077703f31496sm9113615qkn.92.2023.12.19.05.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 05:57:25 -0800 (PST)
Message-ID: <feab6612-31f6-41bd-8ee9-89a19aa0e76c@redhat.com>
Date: Tue, 19 Dec 2023 14:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v5 24/29] powerpc: interrupt tests
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-25-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231216134257.1743345-25-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 16/12/2023 14.42, Nicholas Piggin wrote:
> Add basic testing of various kinds of interrupts, machine check,
> page fault, illegal, decrementer, trace, syscall, etc.
> 
> This has a known failure on QEMU TCG pseries machines where MSR[ME]
> can be incorrectly set to 0.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/ppc_asm.h |  21 +-
>   powerpc/Makefile.common   |   3 +-
>   powerpc/interrupts.c      | 422 ++++++++++++++++++++++++++++++++++++++
>   powerpc/unittests.cfg     |   3 +
>   4 files changed, 445 insertions(+), 4 deletions(-)
>   create mode 100644 powerpc/interrupts.c
> 
> diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
> index ef2d91dd..778e78ee 100644
> --- a/lib/powerpc/asm/ppc_asm.h
> +++ b/lib/powerpc/asm/ppc_asm.h
> @@ -35,17 +35,32 @@
>   
>   #endif /* __BYTE_ORDER__ */
>   
> +#define SPR_DSISR	0x012
> +#define SPR_DAR		0x013
> +#define SPR_DEC		0x016
> +#define SPR_SRR0	0x01A
> +#define SPR_SRR1	0x01B
> +#define SPR_FSCR	0x099
> +#define   FSCR_PREFIX	0x2000
> +#define SPR_HDEC	0x136
>   #define SPR_HSRR0	0x13A
>   #define SPR_HSRR1	0x13B
> +#define SPR_LPCR	0x13E
> +#define   LPCR_HDICE	0x1UL
> +#define SPR_HEIR	0x153
> +#define SPR_SIAR	0x31C
>   
>   /* Machine State Register definitions: */
>   #define MSR_LE_BIT	0
>   #define MSR_EE_BIT	15			/* External Interrupts Enable */
>   #define MSR_HV_BIT	60			/* Hypervisor mode */
>   #define MSR_SF_BIT	63			/* 64-bit mode */
> -#define MSR_ME		0x1000ULL
>   
> -#define SPR_HSRR0	0x13A
> -#define SPR_HSRR1	0x13B
> +#define MSR_DR		0x0010ULL
> +#define MSR_IR		0x0020ULL
> +#define MSR_BE		0x0200ULL		/* Branch Trace Enable */
> +#define MSR_SE		0x0400ULL		/* Single Step Enable */
> +#define MSR_EE		0x8000ULL
> +#define MSR_ME		0x1000ULL
>   
>   #endif /* _ASMPOWERPC_PPC_ASM_H */
> diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
> index a7af225b..b340a53b 100644
> --- a/powerpc/Makefile.common
> +++ b/powerpc/Makefile.common
> @@ -11,7 +11,8 @@ tests-common = \
>   	$(TEST_DIR)/rtas.elf \
>   	$(TEST_DIR)/emulator.elf \
>   	$(TEST_DIR)/tm.elf \
> -	$(TEST_DIR)/sprs.elf
> +	$(TEST_DIR)/sprs.elf \
> +	$(TEST_DIR)/interrupts.elf
>   
>   tests-all = $(tests-common) $(tests)
>   all: directories $(TEST_DIR)/boot_rom.bin $(tests-all)
> diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
> new file mode 100644
> index 00000000..3217b15e
> --- /dev/null
> +++ b/powerpc/interrupts.c
> @@ -0,0 +1,422 @@
> +/*
> + * Test interrupts
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.
> + */
> +#include <libcflat.h>
> +#include <util.h>
> +#include <migrate.h>
> +#include <alloc.h>
> +#include <asm/handlers.h>
> +#include <asm/hcall.h>
> +#include <asm/processor.h>
> +#include <asm/barrier.h>
> +
> +#define SPR_LPCR	0x13E
> +#define LPCR_HDICE	0x1UL
> +#define SPR_DEC		0x016
> +#define SPR_HDEC	0x136
> +
> +#define MSR_DR		0x0010ULL
> +#define MSR_IR		0x0020ULL
> +#define MSR_EE		0x8000ULL
> +#define MSR_ME		0x1000ULL

Why don't you use the definitions from ppc_asm.h above?

> +static bool cpu_has_heir(void)
> +{
> +	uint32_t pvr = mfspr(287);	/* Processor Version Register */
> +
> +	if (!machine_is_powernv())
> +		return false;
> +
> +	/* POWER6 has HEIR, but QEMU powernv support does not go that far */
> +	switch (pvr >> 16) {
> +	case 0x4b:			/* POWER8E */
> +	case 0x4c:			/* POWER8NVL */
> +	case 0x4d:			/* POWER8 */
> +	case 0x4e:			/* POWER9 */
> +	case 0x80:			/* POWER10 */

I'd suggest to introduce some #defines for those PVR values instead of using 
magic numbers all over the place?

> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool cpu_has_prefix(void)
> +{
> +	uint32_t pvr = mfspr(287);	/* Processor Version Register */
> +	switch (pvr >> 16) {
> +	case 0x80:			/* POWER10 */
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool cpu_has_lev_in_srr1(void)
> +{
> +	uint32_t pvr = mfspr(287);	/* Processor Version Register */
> +	switch (pvr >> 16) {
> +	case 0x80:			/* POWER10 */
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool regs_is_prefix(volatile struct pt_regs *regs)
> +{
> +	return (regs->msr >> (63-34)) & 1;

You introduced a bunch of new #define MSR_xx statements ... why not for this 
one, too?

> +}
> +
> +static void regs_advance_insn(struct pt_regs *regs)
> +{
> +	if (regs_is_prefix(regs))
> +		regs->nip += 8;
> +	else
> +		regs->nip += 4;
> +}
> +
> +static volatile bool got_interrupt;
> +static volatile struct pt_regs recorded_regs;
> +
> +static void mce_handler(struct pt_regs *regs, void *opaque)
> +{
> +	got_interrupt = true;
> +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> +	regs_advance_insn(regs);
> +}
> +
> +static void test_mce(void)
> +{
> +	unsigned long addr = -4ULL;
> +	uint8_t tmp;
> +
> +	handle_exception(0x200, mce_handler, NULL);
> +
> +	if (machine_is_powernv()) {
> +		enable_mcheck();
> +	} else {
> +		report(mfmsr() & MSR_ME, "pseries machine has MSR[ME]=1");
> +		if (!(mfmsr() & MSR_ME)) { /* try to fix it */
> +			enable_mcheck();
> +		}
> +		if (mfmsr() & MSR_ME) {
> +			disable_mcheck();
> +			report(mfmsr() & MSR_ME, "pseries is unable to change MSR[ME]");
> +			if (!(mfmsr() & MSR_ME)) { /* try to fix it */
> +				enable_mcheck();
> +			}
> +		}
> +	}
> +
> +	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
> +
> +	report(got_interrupt, "MCE on access to invalid real address");
> +	report(mfspr(SPR_DAR) == addr, "MCE sets DAR correctly");
> +	got_interrupt = false;
> +}
> +
> +static void dseg_handler(struct pt_regs *regs, void *data)
> +{
> +	got_interrupt = true;
> +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> +	regs_advance_insn(regs);
> +	regs->msr &= ~MSR_DR;
> +}
> +
> +static void test_dseg(void)
> +{
> +	uint64_t msr, tmp;
> +
> +	report_prefix_push("data segment");
> +
> +	/* Some HV start in radix mode and need 0x300 */
> +	handle_exception(0x300, &dseg_handler, NULL);
> +	handle_exception(0x380, &dseg_handler, NULL);
> +
> +	asm volatile(
> +"		mfmsr	%0		\n \
> +		ori	%0,%0,%2	\n \
> +		mtmsrd	%0		\n \
> +		lbz	%1,0(0)		"
> +		: "=r"(msr), "=r"(tmp) : "i"(MSR_DR): "memory");
> +
> +	report(got_interrupt, "interrupt on NULL dereference");
> +	got_interrupt = false;
> +
> +	handle_exception(0x300, NULL, NULL);
> +	handle_exception(0x380, NULL, NULL);
> +
> +	report_prefix_pop();
> +}
> +
> +static void dec_handler(struct pt_regs *regs, void *data)
> +{
> +	got_interrupt = true;
> +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> +	regs->msr &= ~MSR_EE;
> +}
> +
> +static void test_dec(void)
> +{
> +	uint64_t msr;
> +
> +	report_prefix_push("decrementer");
> +
> +	handle_exception(0x900, &dec_handler, NULL);
> +
> +	asm volatile(
> +"		mtdec	%1		\n \
> +		mfmsr	%0		\n \
> +		ori	%0,%0,%2	\n \
> +		mtmsrd	%0,1		"
> +		: "=r"(msr) : "r"(10000), "i"(MSR_EE): "memory");
> +
> +	while (!got_interrupt)
> +		;

Maybe add a timeout (in case the interrupt never fires)?

> +	report(got_interrupt, "interrupt on decrementer underflow");
> +	got_interrupt = false;
> +
> +	handle_exception(0x900, NULL, NULL);
> +
> +	if (!machine_is_powernv())
> +		goto done;
> +
> +	handle_exception(0x980, &dec_handler, NULL);
> +
> +	mtspr(SPR_LPCR, mfspr(SPR_LPCR) | LPCR_HDICE);
> +	asm volatile(
> +"		mtspr	0x136,%1	\n \
> +		mtdec	%3		\n \
> +		mfmsr	%0		\n \
> +		ori	%0,%0,%2	\n \
> +		mtmsrd	%0,1		"
> +		: "=r"(msr) : "r"(10000), "i"(MSR_EE), "r"(0x7fffffff): "memory");
> +
> +	while (!got_interrupt)
> +		;

dito?

> +	mtspr(SPR_LPCR, mfspr(SPR_LPCR) & ~LPCR_HDICE);
> +
> +	report(got_interrupt, "interrupt on hdecrementer underflow");
> +	got_interrupt = false;
> +
> +	handle_exception(0x980, NULL, NULL);
> +
> +done:
> +	report_prefix_pop();
> +}

  Thomas


