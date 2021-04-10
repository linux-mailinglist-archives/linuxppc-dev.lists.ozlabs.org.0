Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D026035A990
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 02:38:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHGLg40Mnz3c0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 10:38:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lh9M4uhK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lh9M4uhK; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHGLD2nnzz302D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 10:37:40 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id y32so5092401pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Apr 2021 17:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=wMqFNKBWy8bzr9PBxNRn7Lsb7yjMUIunyckxcOanJT8=;
 b=lh9M4uhKiZ1tPvGjO1YBNqJuVOO9tf5ZoIsqQYBr33+G5ieTaivpfgcVk5+a43q8KA
 VpXTw8AO/pN1tPE/E6t5SvAYns+dU/gLV9xI8jkHXJOMxVPy0VJwNEEjSVOA/zgfwunQ
 qn63iPmd7m6DPuB2k8g3nDcOl8qpekaRfARQRuvg5e6tiFF5Hb1w8swoHVgSr/MlJWs9
 JkHFq8j9D6Ybi9EKLP2DrYHUfTUmg0kHFI8UD6gEYUc+/3YRCTYiHKWSy7tsL67Ur5Qs
 M1GTHYno2s8BFrYPiL2p4fAH1NXopA/l9HLiBFBi10R9RCEyFg2Sa8TjI+/ymiiwYCkV
 0ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=wMqFNKBWy8bzr9PBxNRn7Lsb7yjMUIunyckxcOanJT8=;
 b=jVAuiv0VAh+ciiLNQqXk+sfntknrKgckKPH+b0SOahpeNTzaXT7TE/uAwLG4NykGjc
 YbqORKAS8y5CvM+q4iJ8sKZo6zPmMjykZHLjn+pbYV8Ye/5khn4ilN88zVRBMds7CS1T
 fg2xLdWf4cW1EBwZoJff24K8y5+95agAeR8b93hpliASWd9TlX5k5816YMPSPK7egMuT
 rQ8B5MTSZQZyH+KqM2KRqiI8sbAxZdGKogS8bYAr8QpDLKBSo2GuIXU0vu5FlIa0psHV
 JIBWylqa83Y8Rlj9km2JB4VsbkTNoUuhkOoAfPi0VQ4wf1UulsS7AQrhRB5DqGJFgtsq
 SjhQ==
X-Gm-Message-State: AOAM530hkbXCyB+d8Ms9VlHsYwFH1F7q7FV4/Mv7Oh5yR8D+/zAVum4C
 gd3Ss02bLlraAdrLT23SrwA=
X-Google-Smtp-Source: ABdhPJxt42Uk9nuu05qLfVypcyeR1GdhqvLhIuHFYpzdkQWZMGZIBcyEOddo426o7riIdv6xNgl0xA==
X-Received: by 2002:a63:925a:: with SMTP id s26mr15005588pgn.216.1618015055920; 
 Fri, 09 Apr 2021 17:37:35 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id p22sm3198377pjg.39.2021.04.09.17.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 17:37:35 -0700 (PDT)
Date: Sat, 10 Apr 2021 10:37:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 30/48] KVM: PPC: Book3S HV P9: Implement the rest of
 the P9 path in C
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-31-npiggin@gmail.com>
 <e3be3cb3-23a1-2e28-1bda-a7437f2fd2ca@ozlabs.ru>
In-Reply-To: <e3be3cb3-23a1-2e28-1bda-a7437f2fd2ca@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1618014964.q93ndgt087.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Alexey Kardashevskiy's message of April 9, 2021 1:57 pm:
>=20
>=20
> On 05/04/2021 11:19, Nicholas Piggin wrote:
>> Almost all logic is moved to C, by introducing a new in_guest mode for
>> the P9 path that branches very early in the KVM interrupt handler to
>> P9 exit code.
>>=20
>> The main P9 entry and exit assembly is now only about 160 lines of low
>> level stack setup and register save/restore, plus a bad-interrupt
>> handler.
>>=20
>> There are two motivations for this, the first is just make the code more
>> maintainable being in C. The second is to reduce the amount of code
>> running in a special KVM mode, "realmode". In quotes because with radix
>> it is no longer necessarily real-mode in the MMU, but it still has to be
>> treated specially because it may be in real-mode, and has various
>> important registers like PID, DEC, TB, etc set to guest. This is hostile
>> to the rest of Linux and can't use arbitrary kernel functionality or be
>> instrumented well.
>>=20
>> This initial patch is a reasonably faithful conversion of the asm code,
>> but it does lack any loop to return quickly back into the guest without
>> switching out of realmode in the case of unimportant or easily handled
>> interrupts. As explained in previous changes, handling HV interrupts
>> in real mode is not so important for P9.
>>=20
>> Use of Linux 64s interrupt entry code register conventions including
>> paca EX_ save areas are brought into the KVM code. There is no point
>> shuffling things into different paca save areas and making up a
>> different calling convention for KVM.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h |   3 +-
>>   arch/powerpc/include/asm/kvm_asm.h        |   3 +-
>>   arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
>>   arch/powerpc/include/asm/kvm_host.h       |   7 +-
>>   arch/powerpc/kernel/security.c            |   5 +-
>>   arch/powerpc/kvm/Makefile                 |   1 +
>>   arch/powerpc/kvm/book3s_64_entry.S        | 247 ++++++++++++++++++++++
>>   arch/powerpc/kvm/book3s_hv.c              |   9 +-
>>   arch/powerpc/kvm/book3s_hv_interrupt.c    | 218 +++++++++++++++++++
>>   arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 125 +----------
>>   10 files changed, 501 insertions(+), 125 deletions(-)
>>   create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c
>>=20
>> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/in=
clude/asm/asm-prototypes.h
>> index 939f3c94c8f3..7c74c80ed994 100644
>> --- a/arch/powerpc/include/asm/asm-prototypes.h
>> +++ b/arch/powerpc/include/asm/asm-prototypes.h
>> @@ -122,6 +122,7 @@ extern s32 patch__call_flush_branch_caches3;
>>   extern s32 patch__flush_count_cache_return;
>>   extern s32 patch__flush_link_stack_return;
>>   extern s32 patch__call_kvm_flush_link_stack;
>> +extern s32 patch__call_kvm_flush_link_stack_p9;
>>   extern s32 patch__memset_nocache, patch__memcpy_nocache;
>>  =20
>>   extern long flush_branch_caches;
>> @@ -142,7 +143,7 @@ void kvmhv_load_host_pmu(void);
>>   void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use);
>>   void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu);
>>  =20
>> -int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
>> +void kvmppc_p9_enter_guest(struct kvm_vcpu *vcpu);
>>  =20
>>   long kvmppc_h_set_dabr(struct kvm_vcpu *vcpu, unsigned long dabr);
>>   long kvmppc_h_set_xdabr(struct kvm_vcpu *vcpu, unsigned long dabr,
>> diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/a=
sm/kvm_asm.h
>> index a3633560493b..b4f9996bd331 100644
>> --- a/arch/powerpc/include/asm/kvm_asm.h
>> +++ b/arch/powerpc/include/asm/kvm_asm.h
>> @@ -146,7 +146,8 @@
>>   #define KVM_GUEST_MODE_GUEST	1
>>   #define KVM_GUEST_MODE_SKIP	2
>>   #define KVM_GUEST_MODE_GUEST_HV	3
>> -#define KVM_GUEST_MODE_HOST_HV	4
>> +#define KVM_GUEST_MODE_GUEST_HV_FAST	4 /* ISA v3.0 with host radix mode=
 */
>> +#define KVM_GUEST_MODE_HOST_HV	5
>>  =20
>>   #define KVM_INST_FETCH_FAILED	-1
>>  =20
>> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/inc=
lude/asm/kvm_book3s_64.h
>> index 9bb9bb370b53..c214bcffb441 100644
>> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
>> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
>> @@ -153,9 +153,17 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_v=
cpu *vcpu)
>>   	return radix;
>>   }
>>  =20
>> +int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
>> +
>>   #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
>>   #endif
>>  =20
>> +/*
>> + * Invalid HDSISR value which is used to indicate when HW has not set t=
he reg.
>> + * Used to work around an errata.
>> + */
>> +#define HDSISR_CANARY	0x7fff
>> +
>>   /*
>>    * We use a lock bit in HPTE dword 0 to synchronize updates and
>>    * accesses to each HPTE, and another bit to indicate non-present
>> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/=
asm/kvm_host.h
>> index 05fb00d37609..fa0083345b11 100644
>> --- a/arch/powerpc/include/asm/kvm_host.h
>> +++ b/arch/powerpc/include/asm/kvm_host.h
>> @@ -690,7 +690,12 @@ struct kvm_vcpu_arch {
>>   	ulong fault_dar;
>>   	u32 fault_dsisr;
>>   	unsigned long intr_msr;
>> -	ulong fault_gpa;	/* guest real address of page fault (POWER9) */
>> +	/*
>> +	 * POWER9 and later, fault_gpa contains the guest real address of page
>> +	 * fault for a radix guest, or segment descriptor (equivalent to resul=
t
>> +	 * from slbmfev of SLB entry that translated the EA) for hash guests.
>> +	 */
>> +	ulong fault_gpa;
>>   #endif
>>  =20
>>   #ifdef CONFIG_BOOKE
>> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/securi=
ty.c
>> index e4e1a94ccf6a..3a607c11f20f 100644
>> --- a/arch/powerpc/kernel/security.c
>> +++ b/arch/powerpc/kernel/security.c
>> @@ -430,16 +430,19 @@ device_initcall(stf_barrier_debugfs_init);
>>  =20
>>   static void update_branch_cache_flush(void)
>>   {
>> -	u32 *site;
>> +	u32 *site, __maybe_unused *site2;
>>  =20
>>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>>   	site =3D &patch__call_kvm_flush_link_stack;
>> +	site2 =3D &patch__call_kvm_flush_link_stack_p9;
>>   	// This controls the branch from guest_exit_cont to kvm_flush_link_st=
ack
>>   	if (link_stack_flush_type =3D=3D BRANCH_CACHE_FLUSH_NONE) {
>>   		patch_instruction_site(site, ppc_inst(PPC_INST_NOP));
>> +		patch_instruction_site(site2, ppc_inst(PPC_INST_NOP));
>>   	} else {
>>   		// Could use HW flush, but that could also flush count cache
>>   		patch_branch_site(site, (u64)&kvm_flush_link_stack, BRANCH_SET_LINK)=
;
>> +		patch_branch_site(site2, (u64)&kvm_flush_link_stack, BRANCH_SET_LINK)=
;
>>   	}
>>   #endif
>>  =20
>> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
>> index cdd119028f64..ca7c86aa9360 100644
>> --- a/arch/powerpc/kvm/Makefile
>> +++ b/arch/powerpc/kvm/Makefile
>> @@ -88,6 +88,7 @@ kvm-book3s_64-builtin-tm-objs-$(CONFIG_PPC_TRANSACTION=
AL_MEM) +=3D \
>>  =20
>>   ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>>   kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) +=3D \
>> +	book3s_hv_interrupt.o \
>>   	book3s_hv_hmi.o \
>>   	book3s_hv_rmhandlers.o \
>>   	book3s_hv_rm_mmu.o \
>> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3=
s_64_entry.S
>> index 0c79c89c6a4b..d98ad580fd98 100644
>> --- a/arch/powerpc/kvm/book3s_64_entry.S
>> +++ b/arch/powerpc/kvm/book3s_64_entry.S
>> @@ -1,11 +1,16 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   #include <asm/asm-offsets.h>
>>   #include <asm/cache.h>
>> +#include <asm/code-patching-asm.h>
>>   #include <asm/exception-64s.h>
>> +#include <asm/export.h>
>>   #include <asm/kvm_asm.h>
>>   #include <asm/kvm_book3s_asm.h>
>> +#include <asm/mmu.h>
>>   #include <asm/ppc_asm.h>
>> +#include <asm/ptrace.h>
>>   #include <asm/reg.h>
>> +#include <asm/ultravisor-api.h>
>>  =20
>>   /*
>>    * These are branched to from interrupt handlers in exception-64s.S wh=
ich set
>> @@ -29,10 +34,15 @@
>>   .global	kvmppc_hcall
>>   .balign IFETCH_ALIGN_BYTES
>>   kvmppc_hcall:
>> +	lbz	r10,HSTATE_IN_GUEST(r13)
>> +	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
>> +	beq	kvmppc_p9_exit_hcall
>>   	ld	r10,PACA_EXGEN+EX_R13(r13)
>>   	SET_SCRATCH0(r10)
>>   	li	r10,0xc00
>>   	/* Now we look like kvmppc_interrupt */
>> +	li	r11,PACA_EXGEN
>> +	b	1f
>>  =20
>>   /*
>>    * KVM interrupt entry occurs after GEN_INT_ENTRY runs, and follows th=
at
>> @@ -53,6 +63,12 @@ kvmppc_hcall:
>>   .global	kvmppc_interrupt
>>   .balign IFETCH_ALIGN_BYTES
>>   kvmppc_interrupt:
>> +	std	r10,HSTATE_SCRATCH0(r13)
>> +	lbz	r10,HSTATE_IN_GUEST(r13)
>> +	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
>> +	beq	kvmppc_p9_exit_interrupt
>> +	ld	r10,HSTATE_SCRATCH0(r13)
>> +	lbz	r11,HSTATE_IN_GUEST(r13)
>>   	li	r11,PACA_EXGEN
>>   	cmpdi	r10,0x200
>>   	bgt+	1f
>> @@ -154,3 +170,234 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>   	GET_SCRATCH0(r13)
>>   	HRFI_TO_KERNEL
>>   #endif
>> +
>> +/* Stack frame offsets for kvmppc_hv_entry */
>> +#define SFS			(144 + STACK_FRAME_MIN_SIZE)
>> +#define STACK_SLOT_NVGPRS	(SFS - 144)	/* 18 gprs */
>> +
>> +/*
>> + * void kvmppc_p9_enter_guest(struct vcpu *vcpu);
>> + *
>> + * Enter the guest on a ISAv3.0 or later system where we have exactly
>> + * one vcpu per vcore, and both the host and guest are radix, and threa=
ds
>> + * are set to "indepdent mode".
>> + */
>> +.balign	IFETCH_ALIGN_BYTES
>> +_GLOBAL(kvmppc_p9_enter_guest)
>> +EXPORT_SYMBOL_GPL(kvmppc_p9_enter_guest)
>> +	mflr	r0
>> +	std	r0,PPC_LR_STKOFF(r1)
>> +	stdu	r1,-SFS(r1)
>> +
>> +	std	r1,HSTATE_HOST_R1(r13)
>> +
>> +	mfcr	r4
>> +	stw	r4,SFS+8(r1)
>> +
>> +	reg =3D 14
>> +	.rept	18
>> +	std	reg,STACK_SLOT_NVGPRS + ((reg - 14) * 8)(r1)
>> +	reg =3D reg + 1
>> +	.endr
>> +
>> +	ld	r4,VCPU_LR(r3)
>> +	mtlr	r4
>> +	ld	r4,VCPU_CTR(r3)
>> +	mtctr	r4
>> +	ld	r4,VCPU_XER(r3)
>> +	mtspr	SPRN_XER,r4
>> +
>> +	ld	r1,VCPU_CR(r3)
>> +
>> +BEGIN_FTR_SECTION
>> +	ld	r4,VCPU_CFAR(r3)
>> +	mtspr	SPRN_CFAR,r4
>> +END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>> +BEGIN_FTR_SECTION
>> +	ld	r4,VCPU_PPR(r3)
>> +	mtspr	SPRN_PPR,r4
>> +END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> +
>> +	reg =3D 4
>> +	.rept	28
>> +	ld	reg,__VCPU_GPR(reg)(r3)
>> +	reg =3D reg + 1
>> +	.endr
>> +
>> +	ld	r4,VCPU_KVM(r3)
>> +	lbz	r4,KVM_SECURE_GUEST(r4)
>=20
>=20
> This does not compile when CONFIG_KVM_BOOK3S_HV_POSSIBLE is not defined.

Thanks, I fixed that. I admittedly haven't tested all such combinations=20
well, I'll have to script some more comprehensive compile jobs.

Thanks,
Nick
