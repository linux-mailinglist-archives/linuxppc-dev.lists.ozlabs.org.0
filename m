Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634496FE47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 13:07:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sf2Q70NRzDqQ1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 21:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sf0L3KDfzDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 21:05:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45sf0K5lJ7z9sBF; Mon, 22 Jul 2019 21:05:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45sf0K2TtCz9s8m;
 Mon, 22 Jul 2019 21:05:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 7/8] KVM: PPC: Ultravisor: Enter a secure guest
In-Reply-To: <20190718024724.GB13492@us.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-8-cclaudio@linux.ibm.com>
 <87ftncg24e.fsf@concordia.ellerman.id.au> <20190718024724.GB13492@us.ibm.com>
Date: Mon, 22 Jul 2019 21:05:17 +1000
Message-ID: <87h87e72j6.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Ryan Grimm <grimm@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com> writes:
> Michael Ellerman [mpe@ellerman.id.au] wrote:
>> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
>> > From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>> >
>> > To enter a secure guest, we have to go through the ultravisor, therefore
>> > we do a ucall when we are entering a secure guest.
>> >
>> > This change is needed for any sort of entry to the secure guest from the
>> > hypervisor, whether it is a return from an hcall, a return from a
>> > hypervisor interrupt, or the first time that a secure guest vCPU is run.
>> >
>> > If we are returning from an hcall, the results are already in the
>> > appropriate registers R3:12, except for R3, R6 and R7. R3 has the status
>> > of the reflected hcall, therefore we move it to R0 for the ultravisor and
>> > set R3 to the UV_RETURN ucall number. R6,7 were used as temporary
>> > registers, hence we restore them.
>> 
>> This is another case where some documentation would help people to
>> review the code.
>> 
>> > Have fast_guest_return check the kvm_arch.secure_guest field so that a
>> > new CPU enters UV when started (in response to a RTAS start-cpu call).
>> >
>> > Thanks to input from Paul Mackerras, Ram Pai and Mike Anderson.
>> >
>> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>> > [ Pass SRR1 in r11 for UV_RETURN, fix kvmppc_msr_interrupt to preserve
>> >   the MSR_S bit ]
>> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
>> > [ Fix UV_RETURN ucall number and arch.secure_guest check ]
>> > Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> > [ Save the actual R3 in R0 for the ultravisor and use R3 for the
>> >   UV_RETURN ucall number. Update commit message and ret_to_ultra comment ]
>> > Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> > ---
>> >  arch/powerpc/include/asm/kvm_host.h       |  1 +
>> >  arch/powerpc/include/asm/ultravisor-api.h |  1 +
>> >  arch/powerpc/kernel/asm-offsets.c         |  1 +
>> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 40 +++++++++++++++++++----
>> >  4 files changed, 37 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> > index cffb365d9d02..89813ca987c2 100644
>> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> > @@ -36,6 +36,7 @@
>> >  #include <asm/asm-compat.h>
>> >  #include <asm/feature-fixups.h>
>> >  #include <asm/cpuidle.h>
>> > +#include <asm/ultravisor-api.h>
>> >  
>> >  /* Sign-extend HDEC if not on POWER9 */
>> >  #define EXTEND_HDEC(reg)			\
>> > @@ -1092,16 +1093,12 @@ BEGIN_FTR_SECTION
>> >  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>> >  
>> >  	ld	r5, VCPU_LR(r4)
>> > -	ld	r6, VCPU_CR(r4)
>> >  	mtlr	r5
>> > -	mtcr	r6
>> >  
>> >  	ld	r1, VCPU_GPR(R1)(r4)
>> >  	ld	r2, VCPU_GPR(R2)(r4)
>> >  	ld	r3, VCPU_GPR(R3)(r4)
>> >  	ld	r5, VCPU_GPR(R5)(r4)
>> > -	ld	r6, VCPU_GPR(R6)(r4)
>> > -	ld	r7, VCPU_GPR(R7)(r4)
>> >  	ld	r8, VCPU_GPR(R8)(r4)
>> >  	ld	r9, VCPU_GPR(R9)(r4)
>> >  	ld	r10, VCPU_GPR(R10)(r4)
>> > @@ -1119,10 +1116,38 @@ BEGIN_FTR_SECTION
>> >  	mtspr	SPRN_HDSISR, r0
>> >  END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
>> >  
>> > +	ld	r6, VCPU_KVM(r4)
>> > +	lbz	r7, KVM_SECURE_GUEST(r6)
>> > +	cmpdi	r7, 0
>> 
>> You could hoist the load of r6 and r7 to here?
>
> we could move 'ld r7' here. r6 is used to restore CR below so
> it (r6) has to stay there?

It's used to restore CR in both paths, so both paths load VCPU_CR(r4)
into r6. So we could instead do that load once, before the branch?

>> > +	bne	ret_to_ultra
>> > +
>> > +	lwz	r6, VCPU_CR(r4)
>> > +	mtcr	r6
>> > +
>> > +	ld	r7, VCPU_GPR(R7)(r4)
>> > +	ld	r6, VCPU_GPR(R6)(r4)
>> >  	ld	r0, VCPU_GPR(R0)(r4)
>> >  	ld	r4, VCPU_GPR(R4)(r4)
>> >  	HRFI_TO_GUEST
>> >  	b	.
>> > +/*
>> > + * We are entering a secure guest, so we have to invoke the ultravisor to do
>> > + * that. If we are returning from a hcall, the results are already in the
>> > + * appropriate registers R3:12, except for R3, R6 and R7. R3 has the status of
>> > + * the reflected hcall, therefore we move it to R0 for the ultravisor and set
>> > + * R3 to the UV_RETURN ucall number. R6,7 were used as temporary registers
>> > + * above, hence we restore them.
>> > + */
>> > +ret_to_ultra:
>> > +	lwz	r6, VCPU_CR(r4)
>> > +	mtcr	r6
>> > +	mfspr	r11, SPRN_SRR1
>> > +	mr	r0, r3
>> > +	LOAD_REG_IMMEDIATE(r3, UV_RETURN)
>> 
>> Worth open coding to save three instructions?
>
> Yes, good point:
>
> -       LOAD_REG_IMMEDIATE(r3, UV_RETURN)
> +
> +       li      r3, 0
> +       oris    r3, r3, (UV_RETURN)@__AS_ATHIGH
> +       ori     r3, r3, (UV_RETURN)@l

This should do it no?

       li      r3, 0
       oris    r3, r3, UV_RETURN


cheers
