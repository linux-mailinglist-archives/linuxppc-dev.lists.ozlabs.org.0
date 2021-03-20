Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B580C342B45
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 08:20:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2XGf5Bdwz3c56
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 18:20:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=n8aPfjJM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=n8aPfjJM; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2XG873NTz2yhv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 18:19:57 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id h25so5201583pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 00:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aQcBhaxfHv2JgMDaAiTKv3Y2HxdD6nLFozSR9JR4wbY=;
 b=n8aPfjJMlJ6A99PJrP+Ukpy6xT8r7hNlwTtMZV98IKFGCosQiaf1ljPjoqKS50pO0K
 XCsJJwKn2iRPYhKt1A6oczvkok2AHU+z5yFGRDHyZaF08m4C0Vb4mW00aKFhMCWct2bT
 w4Vq1HSAzuYjyXd02uWiRextDVV/p0MQJg9WNY/haFTnJSyS0Hii5gzjahwzu4kCuPwA
 2sz8QBIDXoHRMvVx4h3cqyFwR/uT/850/dj2DPsS1iTKVQCN2u9gX/xL+zXCjRNuKU9B
 CEdeGb88sQ4iVojns0hy0Vl0kwqD5h0i+y3Pw3PAhKzgqgR/orbvJqldZaI5NoC9d82I
 IWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aQcBhaxfHv2JgMDaAiTKv3Y2HxdD6nLFozSR9JR4wbY=;
 b=ekXFrhJxHcB7TotDpO4dNoZntjzpPUfp9xk63x1ga3+scvndVAPuMMCDAqTZ2XIFY0
 8MuYzzCET+4sanZbqKkOV+y/BTcw8Bg/1XNSZyJOiMYNdXRxZRgyotDVx8Kqfnh2SZzv
 u4YJVFMQuZtzbeGGjKnP9fj6sTCccv9SqctaGusjYWx0MEpxuBW30KAk6uIESY8na9fg
 fVUsh+nxPVUWWpwOVzayBogOg2Xob6TJkAPdbc02KLI6+1kz0tXtx+nvcDjLjPwfejDC
 vmrGHRP2z7zjTVkTfNFkvGZeiIbmmRoKdoolmhrpOsTAeijy1IzfJw2NRbjYJIh1LxWB
 w0kw==
X-Gm-Message-State: AOAM530Ljtg11WPRz/WX2+dajLVxNvcATZ92ZO5a7XeygMwgljXKmHhQ
 YbHf37bHJaUzJjVFCsjOB6wNtxGDWX9Jt+Hf
X-Google-Smtp-Source: ABdhPJyPwvP+qrwVvmxqhSKo/1tXE+MZVjXbxclj0p8JD85ksjD75ize4QZhN0QM9nhH89/OgHZcCw==
X-Received: by 2002:aa7:82cc:0:b029:213:db69:18d9 with SMTP id
 f12-20020aa782cc0000b0290213db6918d9mr4542293pfn.36.1616224793283; 
 Sat, 20 Mar 2021 00:19:53 -0700 (PDT)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id gw20sm6912595pjb.3.2021.03.20.00.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 00:19:52 -0700 (PDT)
Message-ID: <0c4f8620-ffce-4c1d-c982-6d85d88a59df@ozlabs.ru>
Date: Sat, 20 Mar 2021 18:19:47 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v3 13/41] KVM: PPC: Book3S 64: Move interrupt early
 register setup to KVM
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-14-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210305150638.2675513-14-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/03/2021 02:06, Nicholas Piggin wrote:
> Like the earlier patch for hcalls, KVM interrupt entry requires a
> different calling convention than the Linux interrupt handlers
> set up. Move the code that converts from one to the other into KVM.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/exceptions-64s.S | 131 +++++----------------------
>   arch/powerpc/kvm/book3s_64_entry.S   |  34 ++++++-
>   2 files changed, 55 insertions(+), 110 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b7092ba87da8..b4eab5084964 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -187,7 +187,6 @@ do_define_int n
>   	.endif
>   .endm
>   
> -#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
>   /*
>    * All interrupts which set HSRR registers, as well as SRESET and MCE and
>    * syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be taken,
> @@ -220,54 +219,25 @@ do_define_int n
>    * to KVM to handle.
>    */
>   
> -.macro KVMTEST name
> +.macro KVMTEST name handler
> +#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
>   	lbz	r10,HSTATE_IN_GUEST(r13)
>   	cmpwi	r10,0
> -	bne	\name\()_kvm
> -.endm
> -
> -.macro GEN_KVM name
> -	.balign IFETCH_ALIGN_BYTES
> -\name\()_kvm:
> -
> -BEGIN_FTR_SECTION
> -	ld	r10,IAREA+EX_CFAR(r13)
> -	std	r10,HSTATE_CFAR(r13)
> -END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
> -
> -	ld	r10,IAREA+EX_CTR(r13)
> -	mtctr	r10
> -BEGIN_FTR_SECTION
> -	ld	r10,IAREA+EX_PPR(r13)
> -	std	r10,HSTATE_PPR(r13)
> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -	ld	r11,IAREA+EX_R11(r13)
> -	ld	r12,IAREA+EX_R12(r13)
> -	std	r12,HSTATE_SCRATCH0(r13)
> -	sldi	r12,r9,32
> -	ld	r9,IAREA+EX_R9(r13)
> -	ld	r10,IAREA+EX_R10(r13)
>   	/* HSRR variants have the 0x2 bit added to their trap number */
>   	.if IHSRR_IF_HVMODE
>   	BEGIN_FTR_SECTION
> -	ori	r12,r12,(IVEC + 0x2)
> +	li	r10,(IVEC + 0x2)
>   	FTR_SECTION_ELSE
> -	ori	r12,r12,(IVEC)
> +	li	r10,(IVEC)
>   	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
>   	.elseif IHSRR
> -	ori	r12,r12,(IVEC+ 0x2)
> +	li	r10,(IVEC + 0x2)
>   	.else
> -	ori	r12,r12,(IVEC)
> +	li	r10,(IVEC)
>   	.endif
> -	b	kvmppc_interrupt
> -.endm
> -
> -#else
> -.macro KVMTEST name
> -.endm
> -.macro GEN_KVM name
> -.endm
> +	bne	\handler
>   #endif
> +.endm
>   
>   /*
>    * This is the BOOK3S interrupt entry code macro.
> @@ -409,7 +379,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>   DEFINE_FIXED_SYMBOL(\name\()_common_real)
>   \name\()_common_real:
>   	.if IKVM_REAL
> -		KVMTEST \name
> +		KVMTEST \name kvm_interrupt
>   	.endif
>   
>   	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
> @@ -432,7 +402,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
>   DEFINE_FIXED_SYMBOL(\name\()_common_virt)
>   \name\()_common_virt:
>   	.if IKVM_VIRT
> -		KVMTEST \name
> +		KVMTEST \name kvm_interrupt
>   1:
>   	.endif
>   	.endif /* IVIRT */
> @@ -446,7 +416,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
>   DEFINE_FIXED_SYMBOL(\name\()_common_real)
>   \name\()_common_real:
>   	.if IKVM_REAL
> -		KVMTEST \name
> +		KVMTEST \name kvm_interrupt
>   	.endif
>   .endm
>   
> @@ -967,8 +937,6 @@ EXC_COMMON_BEGIN(system_reset_common)
>   	EXCEPTION_RESTORE_REGS
>   	RFI_TO_USER_OR_KERNEL
>   
> -	GEN_KVM system_reset
> -
>   
>   /**
>    * Interrupt 0x200 - Machine Check Interrupt (MCE).
> @@ -1132,7 +1100,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
>   	/*
>   	 * Check if we are coming from guest. If yes, then run the normal
>   	 * exception handler which will take the
> -	 * machine_check_kvm->kvmppc_interrupt branch to deliver the MC event
> +	 * machine_check_kvm->kvm_interrupt branch to deliver the MC event
>   	 * to guest.
>   	 */
>   	lbz	r11,HSTATE_IN_GUEST(r13)
> @@ -1203,8 +1171,6 @@ EXC_COMMON_BEGIN(machine_check_common)
>   	bl	machine_check_exception
>   	b	interrupt_return
>   
> -	GEN_KVM machine_check
> -
>   
>   #ifdef CONFIG_PPC_P7_NAP
>   /*
> @@ -1339,8 +1305,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	REST_NVGPRS(r1)
>   	b	interrupt_return
>   
> -	GEN_KVM data_access
> -
>   
>   /**
>    * Interrupt 0x380 - Data Segment Interrupt (DSLB).
> @@ -1390,8 +1354,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	bl	do_bad_slb_fault
>   	b	interrupt_return
>   
> -	GEN_KVM data_access_slb
> -
>   
>   /**
>    * Interrupt 0x400 - Instruction Storage Interrupt (ISI).
> @@ -1428,8 +1390,6 @@ MMU_FTR_SECTION_ELSE
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	b	interrupt_return
>   
> -	GEN_KVM instruction_access
> -
>   
>   /**
>    * Interrupt 0x480 - Instruction Segment Interrupt (ISLB).
> @@ -1474,8 +1434,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	bl	do_bad_slb_fault
>   	b	interrupt_return
>   
> -	GEN_KVM instruction_access_slb
> -
>   
>   /**
>    * Interrupt 0x500 - External Interrupt.
> @@ -1521,8 +1479,6 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
>   	bl	do_IRQ
>   	b	interrupt_return
>   
> -	GEN_KVM hardware_interrupt
> -
>   
>   /**
>    * Interrupt 0x600 - Alignment Interrupt
> @@ -1550,8 +1506,6 @@ EXC_COMMON_BEGIN(alignment_common)
>   	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>   	b	interrupt_return
>   
> -	GEN_KVM alignment
> -
>   
>   /**
>    * Interrupt 0x700 - Program Interrupt (program check).
> @@ -1659,8 +1613,6 @@ EXC_COMMON_BEGIN(program_check_common)
>   	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>   	b	interrupt_return
>   
> -	GEN_KVM program_check
> -
>   
>   /*
>    * Interrupt 0x800 - Floating-Point Unavailable Interrupt.
> @@ -1710,8 +1662,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
>   	b	interrupt_return
>   #endif
>   
> -	GEN_KVM fp_unavailable
> -
>   
>   /**
>    * Interrupt 0x900 - Decrementer Interrupt.
> @@ -1751,8 +1701,6 @@ EXC_COMMON_BEGIN(decrementer_common)
>   	bl	timer_interrupt
>   	b	interrupt_return
>   
> -	GEN_KVM decrementer
> -
>   
>   /**
>    * Interrupt 0x980 - Hypervisor Decrementer Interrupt.
> @@ -1798,8 +1746,6 @@ EXC_COMMON_BEGIN(hdecrementer_common)
>   	ld	r13,PACA_EXGEN+EX_R13(r13)
>   	HRFI_TO_KERNEL
>   
> -	GEN_KVM hdecrementer
> -
>   
>   /**
>    * Interrupt 0xa00 - Directed Privileged Doorbell Interrupt.
> @@ -1840,8 +1786,6 @@ EXC_COMMON_BEGIN(doorbell_super_common)
>   #endif
>   	b	interrupt_return
>   
> -	GEN_KVM doorbell_super
> -
>   
>   EXC_REAL_NONE(0xb00, 0x100)
>   EXC_VIRT_NONE(0x4b00, 0x100)
> @@ -1891,7 +1835,7 @@ INT_DEFINE_END(system_call)
>   	GET_PACA(r13)
>   	std	r10,PACA_EXGEN+EX_R10(r13)
>   	INTERRUPT_TO_KERNEL
> -	KVMTEST system_call /* uses r10, branch to system_call_kvm */
> +	KVMTEST system_call kvm_hcall /* uses r10, branch to kvm_hcall */
>   	mfctr	r9
>   #else
>   	mr	r9,r13
> @@ -1947,7 +1891,7 @@ EXC_VIRT_BEGIN(system_call, 0x4c00, 0x100)
>   EXC_VIRT_END(system_call, 0x4c00, 0x100)
>   
>   #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
> -TRAMP_REAL_BEGIN(system_call_kvm)
> +TRAMP_REAL_BEGIN(kvm_hcall)
>   	mfctr	r10
>   	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
>   #ifdef CONFIG_RELOCATABLE
> @@ -1987,8 +1931,6 @@ EXC_COMMON_BEGIN(single_step_common)
>   	bl	single_step_exception
>   	b	interrupt_return
>   
> -	GEN_KVM single_step
> -
>   
>   /**
>    * Interrupt 0xe00 - Hypervisor Data Storage Interrupt (HDSI).
> @@ -2027,8 +1969,6 @@ MMU_FTR_SECTION_ELSE
>   ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
>   	b       interrupt_return
>   
> -	GEN_KVM h_data_storage
> -
>   
>   /**
>    * Interrupt 0xe20 - Hypervisor Instruction Storage Interrupt (HISI).
> @@ -2054,8 +1994,6 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
>   	bl	unknown_exception
>   	b	interrupt_return
>   
> -	GEN_KVM h_instr_storage
> -
>   
>   /**
>    * Interrupt 0xe40 - Hypervisor Emulation Assistance Interrupt.
> @@ -2080,8 +2018,6 @@ EXC_COMMON_BEGIN(emulation_assist_common)
>   	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>   	b	interrupt_return
>   
> -	GEN_KVM emulation_assist
> -
>   
>   /**
>    * Interrupt 0xe60 - Hypervisor Maintenance Interrupt (HMI).
> @@ -2153,8 +2089,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
>   	EXCEPTION_RESTORE_REGS hsrr=1
>   	GEN_INT_ENTRY hmi_exception, virt=0
>   
> -	GEN_KVM hmi_exception_early
> -
>   EXC_COMMON_BEGIN(hmi_exception_common)
>   	GEN_COMMON hmi_exception
>   	FINISH_NAP
> @@ -2162,8 +2096,6 @@ EXC_COMMON_BEGIN(hmi_exception_common)
>   	bl	handle_hmi_exception
>   	b	interrupt_return
>   
> -	GEN_KVM hmi_exception
> -
>   
>   /**
>    * Interrupt 0xe80 - Directed Hypervisor Doorbell Interrupt.
> @@ -2195,8 +2127,6 @@ EXC_COMMON_BEGIN(h_doorbell_common)
>   #endif
>   	b	interrupt_return
>   
> -	GEN_KVM h_doorbell
> -
>   
>   /**
>    * Interrupt 0xea0 - Hypervisor Virtualization Interrupt.
> @@ -2224,8 +2154,6 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
>   	bl	do_IRQ
>   	b	interrupt_return
>   
> -	GEN_KVM h_virt_irq
> -
>   
>   EXC_REAL_NONE(0xec0, 0x20)
>   EXC_VIRT_NONE(0x4ec0, 0x20)
> @@ -2270,8 +2198,6 @@ EXC_COMMON_BEGIN(performance_monitor_common)
>   	bl	performance_monitor_exception
>   	b	interrupt_return
>   
> -	GEN_KVM performance_monitor
> -
>   
>   /**
>    * Interrupt 0xf20 - Vector Unavailable Interrupt.
> @@ -2321,8 +2247,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   	bl	altivec_unavailable_exception
>   	b	interrupt_return
>   
> -	GEN_KVM altivec_unavailable
> -
>   
>   /**
>    * Interrupt 0xf40 - VSX Unavailable Interrupt.
> @@ -2371,8 +2295,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
>   	bl	vsx_unavailable_exception
>   	b	interrupt_return
>   
> -	GEN_KVM vsx_unavailable
> -
>   
>   /**
>    * Interrupt 0xf60 - Facility Unavailable Interrupt.
> @@ -2401,8 +2323,6 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
>   	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
>   	b	interrupt_return
>   
> -	GEN_KVM facility_unavailable
> -
>   
>   /**
>    * Interrupt 0xf60 - Hypervisor Facility Unavailable Interrupt.
> @@ -2431,8 +2351,6 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
>   	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
>   	b	interrupt_return
>   
> -	GEN_KVM h_facility_unavailable
> -
>   
>   EXC_REAL_NONE(0xfa0, 0x20)
>   EXC_VIRT_NONE(0x4fa0, 0x20)
> @@ -2462,8 +2380,6 @@ EXC_COMMON_BEGIN(cbe_system_error_common)
>   	bl	cbe_system_error_exception
>   	b	interrupt_return
>   
> -	GEN_KVM cbe_system_error
> -
>   #else /* CONFIG_CBE_RAS */
>   EXC_REAL_NONE(0x1200, 0x100)
>   EXC_VIRT_NONE(0x5200, 0x100)
> @@ -2489,8 +2405,6 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
>   	bl	instruction_breakpoint_exception
>   	b	interrupt_return
>   
> -	GEN_KVM instruction_breakpoint
> -
>   
>   EXC_REAL_NONE(0x1400, 0x100)
>   EXC_VIRT_NONE(0x5400, 0x100)
> @@ -2611,8 +2525,6 @@ EXC_COMMON_BEGIN(denorm_exception_common)
>   	bl	unknown_exception
>   	b	interrupt_return
>   
> -	GEN_KVM denorm_exception
> -
>   
>   #ifdef CONFIG_CBE_RAS
>   INT_DEFINE_BEGIN(cbe_maintenance)
> @@ -2630,8 +2542,6 @@ EXC_COMMON_BEGIN(cbe_maintenance_common)
>   	bl	cbe_maintenance_exception
>   	b	interrupt_return
>   
> -	GEN_KVM cbe_maintenance
> -
>   #else /* CONFIG_CBE_RAS */
>   EXC_REAL_NONE(0x1600, 0x100)
>   EXC_VIRT_NONE(0x5600, 0x100)
> @@ -2662,8 +2572,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
>   #endif
>   	b	interrupt_return
>   
> -	GEN_KVM altivec_assist
> -
>   
>   #ifdef CONFIG_CBE_RAS
>   INT_DEFINE_BEGIN(cbe_thermal)
> @@ -2681,8 +2589,6 @@ EXC_COMMON_BEGIN(cbe_thermal_common)
>   	bl	cbe_thermal_exception
>   	b	interrupt_return
>   
> -	GEN_KVM cbe_thermal
> -
>   #else /* CONFIG_CBE_RAS */
>   EXC_REAL_NONE(0x1800, 0x100)
>   EXC_VIRT_NONE(0x5800, 0x100)
> @@ -2935,6 +2841,15 @@ TRAMP_REAL_BEGIN(rfscv_flush_fallback)
>   
>   USE_TEXT_SECTION()
>   
> +#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
> +kvm_interrupt:
> +	/*
> +	 * The conditional branch in KVMTEST can't reach all the way,
> +	 * make a stub.
> +	 */
> +	b	kvmppc_interrupt
> +#endif
> +
>   _GLOBAL(do_uaccess_flush)
>   	UACCESS_FLUSH_FIXUP_SECTION
>   	nop
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> index a7b6edd18bc8..d06e81842368 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -31,15 +31,45 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   	sldi	r12,r10,32
>   	ori	r12,r12,0xc00
>   	ld	r10,PACA_EXGEN+EX_R10(r13)
> +	b	do_kvm_interrupt
>   
>   .global	kvmppc_interrupt
>   .balign IFETCH_ALIGN_BYTES
>   kvmppc_interrupt:
> +	li	r11,PACA_EXGEN
> +	cmpdi	r10,0x200
> +	bgt+	1f
> +	li	r11,PACA_EXMC
> +	beq	1f
> +	li	r11,PACA_EXNMI
> +1:	add	r11,r11,r13
> +
> +BEGIN_FTR_SECTION
> +	ld	r12,EX_CFAR(r11)


r11 and r12 are not saved in EX_R11/12 as mentioned on slack unless I am 
missing something.


> +	std	r12,HSTATE_CFAR(r13)
> +END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
> +	ld	r12,EX_CTR(r11)
> +	mtctr	r12
> +BEGIN_FTR_SECTION
> +	ld	r12,EX_PPR(r11)
> +	std	r12,HSTATE_PPR(r13)
> +END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> +	ld	r12,EX_R12(r11)
> +	std	r12,HSTATE_SCRATCH0(r13)
> +	sldi	r12,r9,32
> +	or	r12,r12,r10
> +	ld	r9,EX_R9(r11)
> +	ld	r10,EX_R10(r11)
> +	ld	r11,EX_R11(r11)
> +
> +do_kvm_interrupt:
>   	/*
> -	 * Register contents:
> +	 * Hcalls and other interrupts come here after normalising register
> +	 * contents and save locations:
> +	 *
>   	 * R12		= (guest CR << 32) | interrupt vector
>   	 * R13		= PACA
> -	 * guest R12 saved in shadow VCPU SCRATCH0
> +	 * guest R12 saved in shadow HSTATE_SCRATCH0
>   	 * guest R13 saved in SPRN_SCRATCH0
>   	 */
>   	std	r9,HSTATE_SCRATCH2(r13)
> 

-- 
Alexey
