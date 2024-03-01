Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D886E137
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 13:42:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYAGrolK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYAGrolK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmSQt3Tdfz3vd3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 23:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYAGrolK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYAGrolK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmSQ50m3Nz3vXH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 23:41:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709296888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6IaCGh6ZtXd4qLYJr0P2224MdJzU6iImHxFEOxYooC0=;
	b=YYAGrolKCeJM0I4vqRAfNvMai4UB7bSjZ+2001Myn2LBHlCyowSQBWm/U3Nb6TrbkXOE7f
	qwBvJjV2qJTTd4doKfz0RNycWRE+7CoJoVUzyUjLlcG9hSikbqIfvsK5ckPl4jmRMNgGXs
	PRGNIilf1oolGOk1PxZm6v+/6Kjwdvk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709296888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6IaCGh6ZtXd4qLYJr0P2224MdJzU6iImHxFEOxYooC0=;
	b=YYAGrolKCeJM0I4vqRAfNvMai4UB7bSjZ+2001Myn2LBHlCyowSQBWm/U3Nb6TrbkXOE7f
	qwBvJjV2qJTTd4doKfz0RNycWRE+7CoJoVUzyUjLlcG9hSikbqIfvsK5ckPl4jmRMNgGXs
	PRGNIilf1oolGOk1PxZm6v+/6Kjwdvk=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-Tr7hyAiiORu1fFbcmFsvQw-1; Fri, 01 Mar 2024 07:41:26 -0500
X-MC-Unique: Tr7hyAiiORu1fFbcmFsvQw-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5a061ace71fso1773609eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 04:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709296886; x=1709901686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IaCGh6ZtXd4qLYJr0P2224MdJzU6iImHxFEOxYooC0=;
        b=ByfOzHlaq4stl4hNhYVkG/b/faGMxKO/6dmgOJtTjeClHgRnbW0uAou8EKRJQX4TWd
         ffEvIZ6QFHh0mxYr25dfEpxQ7Ehh1miHkJ7IAYF1f2bOUxFvtRr+Td2g8kYrd1y/FKAI
         qrIb2Q5BeGV5UWL5NwS9FUsFawJd5agrvkdE2E7o96HeIH28Vc/3fT/tzrxNLBWcxbS4
         +1q+1DljAQTZgZUuyuA7UFaba3NRS4rAf1phVGlZD/11FrrxbR3PP5lk+AX9DqZyXqHZ
         izxOqEz2bTDQyZDll90YCJZQSlHLlyIpdi6JhXVKRLR6EjRudaSzrUq8zXSCTtn9jv2w
         91VA==
X-Forwarded-Encrypted: i=1; AJvYcCW/yI+w7th0PNVXPIhEPbIBQlp0hHi3dnVAcymxlLG26SA1vK9Wj7qzdFRpeOfXsxvHrIlTSOIvKY913fK1Nyfhd2EbkLSo4irDVgCdcw==
X-Gm-Message-State: AOJu0YwF5gcetti6zh4fhvH5rB0obWrOo0gqeFlssETGrmXMYtR/l4p9
	z1F50L3oJi+9eizxC07i/xxJqqu/nCCF2za3v0P4XtzQTrFTUb7au9a6b9GpGObxnPsEJAgd0sL
	bmKxMZjjUTBc8dxYnLquZz+dGoIoTy4IACm8PPFfRw7gHCj7u/yAI7pwmyLnCsOk=
X-Received: by 2002:a05:6358:d59b:b0:17b:f0c3:a592 with SMTP id ms27-20020a056358d59b00b0017bf0c3a592mr1177744rwb.32.1709296886173;
        Fri, 01 Mar 2024 04:41:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGelwt2TDZcBmoThPETuCd3vgXm0IwgjlKPqBhm5H/Opd+/L+VYKlikWvpz88pGT2msCp3YBw==
X-Received: by 2002:a05:6358:d59b:b0:17b:f0c3:a592 with SMTP id ms27-20020a056358d59b00b0017bf0c3a592mr1177721rwb.32.1709296885774;
        Fri, 01 Mar 2024 04:41:25 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id ld8-20020a056214418800b0068fef1264f6sm1800943qvb.101.2024.03.01.04.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 04:41:25 -0800 (PST)
Message-ID: <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
Date: Fri, 1 Mar 2024 13:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226101218.1472843-15-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/02/2024 11.12, Nicholas Piggin wrote:
> Add basic testing of various kinds of interrupts, machine check,
> page fault, illegal, decrementer, trace, syscall, etc.
> 
> This has a known failure on QEMU TCG pseries machines where MSR[ME]
> can be incorrectly set to 0.

Two questions out of curiosity:

Any chance that this could be fixed easily in QEMU?

Or is there a way to detect TCG from within the test? (for example, we have 
a host_is_tcg() function for s390x so we can e.g. use report_xfail() for 
tests that are known to fail on TCG there)

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/processor.h |   4 +
>   lib/powerpc/asm/reg.h       |  17 ++
>   lib/powerpc/setup.c         |  11 +
>   lib/ppc64/asm/ptrace.h      |  16 ++
>   powerpc/Makefile.common     |   3 +-
>   powerpc/interrupts.c        | 415 ++++++++++++++++++++++++++++++++++++
>   powerpc/unittests.cfg       |   3 +
>   7 files changed, 468 insertions(+), 1 deletion(-)
>   create mode 100644 powerpc/interrupts.c
> 
> diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
> index cf1b9d8ff..eed37d1f4 100644
> --- a/lib/powerpc/asm/processor.h
> +++ b/lib/powerpc/asm/processor.h
> @@ -11,7 +11,11 @@ void do_handle_exception(struct pt_regs *regs);
>   #endif /* __ASSEMBLY__ */
>   
>   extern bool cpu_has_hv;
> +extern bool cpu_has_power_mce;
> +extern bool cpu_has_siar;
>   extern bool cpu_has_heai;
> +extern bool cpu_has_prefix;
> +extern bool cpu_has_sc_lev;
>   
>   static inline uint64_t mfspr(int nr)
>   {
> diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
> index 782e75527..d6097f48f 100644
> --- a/lib/powerpc/asm/reg.h
> +++ b/lib/powerpc/asm/reg.h
> @@ -5,8 +5,15 @@
>   
>   #define UL(x) _AC(x, UL)
>   
> +#define SPR_DSISR	0x012
> +#define SPR_DAR		0x013
> +#define SPR_DEC		0x016
>   #define SPR_SRR0	0x01a
>   #define SPR_SRR1	0x01b
> +#define   SRR1_PREFIX		UL(0x20000000)
> +#define SPR_FSCR	0x099
> +#define   FSCR_PREFIX		UL(0x2000)
> +#define SPR_HFSCR	0x0be
>   #define SPR_TB		0x10c
>   #define SPR_SPRG0	0x110
>   #define SPR_SPRG1	0x111
> @@ -22,12 +29,17 @@
>   #define   PVR_VER_POWER8	UL(0x004d0000)
>   #define   PVR_VER_POWER9	UL(0x004e0000)
>   #define   PVR_VER_POWER10	UL(0x00800000)
> +#define SPR_HDEC	0x136
>   #define SPR_HSRR0	0x13a
>   #define SPR_HSRR1	0x13b
> +#define SPR_LPCR	0x13e
> +#define   LPCR_HDICE		UL(0x1)
> +#define SPR_HEIR	0x153
>   #define SPR_MMCR0	0x31b
>   #define   MMCR0_FC		UL(0x80000000)
>   #define   MMCR0_PMAE		UL(0x04000000)
>   #define   MMCR0_PMAO		UL(0x00000080)
> +#define SPR_SIAR	0x31c
>   
>   /* Machine State Register definitions: */
>   #define MSR_LE_BIT	0
> @@ -35,6 +47,11 @@
>   #define MSR_HV_BIT	60			/* Hypervisor mode */
>   #define MSR_SF_BIT	63			/* 64-bit mode */
>   
> +#define MSR_DR		UL(0x0010)
> +#define MSR_IR		UL(0x0020)
> +#define MSR_BE		UL(0x0200)		/* Branch Trace Enable */
> +#define MSR_SE		UL(0x0400)		/* Single Step Enable */
> +#define MSR_EE		UL(0x8000)
>   #define MSR_ME		UL(0x1000)
>   
>   #endif
> diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
> index 3c81aee9e..9b665f59c 100644
> --- a/lib/powerpc/setup.c
> +++ b/lib/powerpc/setup.c
> @@ -87,7 +87,11 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
>   }
>   
>   bool cpu_has_hv;
> +bool cpu_has_power_mce; /* POWER CPU machine checks */
> +bool cpu_has_siar;
>   bool cpu_has_heai;
> +bool cpu_has_prefix;
> +bool cpu_has_sc_lev; /* sc interrupt has LEV field in SRR1 */
>   
>   static void cpu_init(void)
>   {
> @@ -112,15 +116,22 @@ static void cpu_init(void)
>   
>   	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
>   	case PVR_VER_POWER10:
> +		cpu_has_prefix = true;
> +		cpu_has_sc_lev = true;
>   	case PVR_VER_POWER9:
>   	case PVR_VER_POWER8E:
>   	case PVR_VER_POWER8NVL:
>   	case PVR_VER_POWER8:
> +		cpu_has_power_mce = true;
>   		cpu_has_heai = true;
> +		cpu_has_siar = true;
>   		break;
>   	default:
>   		break;
>   	}
> +
> +	if (!cpu_has_hv) /* HEIR is HV register */
> +		cpu_has_heai = false;
>   }
>   
>   static void mem_init(phys_addr_t freemem_start)
> diff --git a/lib/ppc64/asm/ptrace.h b/lib/ppc64/asm/ptrace.h
> index 12de7499b..db263a59e 100644
> --- a/lib/ppc64/asm/ptrace.h
> +++ b/lib/ppc64/asm/ptrace.h
> @@ -5,6 +5,9 @@
>   #define STACK_FRAME_OVERHEAD    112     /* size of minimum stack frame */
>   
>   #ifndef __ASSEMBLY__
> +
> +#include <asm/reg.h>
> +
>   struct pt_regs {
>   	unsigned long gpr[32];
>   	unsigned long nip;
> @@ -17,6 +20,19 @@ struct pt_regs {
>   	unsigned long _pad; /* stack must be 16-byte aligned */
>   };
>   
> +static inline bool regs_is_prefix(volatile struct pt_regs *regs)
> +{
> +	return regs->msr & SRR1_PREFIX;
> +}
> +
> +static inline void regs_advance_insn(struct pt_regs *regs)
> +{
> +	if (regs_is_prefix(regs))
> +		regs->nip += 8;
> +	else
> +		regs->nip += 4;
> +}
> +
>   #define STACK_INT_FRAME_SIZE    (sizeof(struct pt_regs) + \
>   				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
>   
> diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
> index 1e181da69..68165fc25 100644
> --- a/powerpc/Makefile.common
> +++ b/powerpc/Makefile.common
> @@ -12,7 +12,8 @@ tests-common = \
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
> index 000000000..442f8c569
> --- /dev/null
> +++ b/powerpc/interrupts.c
> @@ -0,0 +1,415 @@
> +/*
> + * Test interrupts
> + *
> + * Copyright 2024 Nicholas Piggin, IBM Corp.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.

I know, we're using this line in a lot of source files ... but maybe we 
should do better for new files at least: "LGPL, version 2" is a little bit 
ambiguous: Does it mean the "Library GPL version 2.0" or the "Lesser GPL 
version 2.1"? Maybe you could clarify by additionally providing a SPDX 
identifier here, or by explicitly writing 2.0 or 2.1.

  Thanks,
   Thomas

