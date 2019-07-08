Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49262A9B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 22:52:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jHhW2l5qzDqNF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 06:52:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jHfn53TfzDqJB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 06:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45jHfm6ktdz8tQK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 06:51:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45jHfm6RC4z9sNk; Tue,  9 Jul 2019 06:51:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=janani@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45jHfm2KFxz9sNH;
 Tue,  9 Jul 2019 06:51:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68Kl7pr087017; Mon, 8 Jul 2019 16:51:09 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tmb48vdn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 16:51:09 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x68KoDgR017664;
 Mon, 8 Jul 2019 20:51:07 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2tjk96gnxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 20:51:07 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68Kp5DA65470742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 20:51:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E1AB7805C;
 Mon,  8 Jul 2019 20:51:05 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B05697805E;
 Mon,  8 Jul 2019 20:51:04 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jul 2019 20:51:04 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 08 Jul 2019 15:53:30 -0500
From: janani <janani@linux.ibm.com>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v4 7/8] KVM: PPC: Ultravisor: Enter a secure guest
Organization: IBM
Mail-Reply-To: janani@linux.ibm.com
In-Reply-To: <20190628200825.31049-8-cclaudio@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-8-cclaudio@linux.ibm.com>
Message-ID: <fa038e6849738d21707bde46616d84ff@linux.vnet.ibm.com>
X-Sender: janani@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080259
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
Reply-To: janani@linux.ibm.com
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-06-28 15:08, Claudio Carvalho wrote:
> From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> 
> To enter a secure guest, we have to go through the ultravisor, 
> therefore
> we do a ucall when we are entering a secure guest.
> 
> This change is needed for any sort of entry to the secure guest from 
> the
> hypervisor, whether it is a return from an hcall, a return from a
> hypervisor interrupt, or the first time that a secure guest vCPU is 
> run.
> 
> If we are returning from an hcall, the results are already in the
> appropriate registers R3:12, except for R3, R6 and R7. R3 has the 
> status
> of the reflected hcall, therefore we move it to R0 for the ultravisor 
> and
> set R3 to the UV_RETURN ucall number. R6,7 were used as temporary
> registers, hence we restore them.
> 
> Have fast_guest_return check the kvm_arch.secure_guest field so that a
> new CPU enters UV when started (in response to a RTAS start-cpu call).
> 
> Thanks to input from Paul Mackerras, Ram Pai and Mike Anderson.
> 
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> [ Pass SRR1 in r11 for UV_RETURN, fix kvmppc_msr_interrupt to preserve
>   the MSR_S bit ]
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> [ Fix UV_RETURN ucall number and arch.secure_guest check ]
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ Save the actual R3 in R0 for the ultravisor and use R3 for the
>   UV_RETURN ucall number. Update commit message and ret_to_ultra 
> comment ]
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
  Reviewed-by: Janani Janakiraman <janani@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h       |  1 +
>  arch/powerpc/include/asm/ultravisor-api.h |  1 +
>  arch/powerpc/kernel/asm-offsets.c         |  1 +
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 40 +++++++++++++++++++----
>  4 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_host.h
> b/arch/powerpc/include/asm/kvm_host.h
> index 013c76a0a03e..184becb62ea4 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -294,6 +294,7 @@ struct kvm_arch {
>  	cpumask_t cpu_in_guest;
>  	u8 radix;
>  	u8 fwnmi_enabled;
> +	u8 secure_guest;
>  	bool threads_indep;
>  	bool nested_enable;
>  	pgd_t *pgtable;
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h
> b/arch/powerpc/include/asm/ultravisor-api.h
> index 141940771add..7c4d0b4ced12 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -19,5 +19,6 @@
> 
>  /* opcodes */
>  #define UV_WRITE_PATE			0xF104
> +#define UV_RETURN			0xF11C
> 
>  #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> diff --git a/arch/powerpc/kernel/asm-offsets.c
> b/arch/powerpc/kernel/asm-offsets.c
> index 8e02444e9d3d..44742724513e 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -508,6 +508,7 @@ int main(void)
>  	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
>  	OFFSET(KVM_RADIX, kvm, arch.radix);
>  	OFFSET(KVM_FWNMI, kvm, arch.fwnmi_enabled);
> +	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
>  	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
>  	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
>  	OFFSET(VCPU_VPA, kvm_vcpu, arch.vpa.pinned_addr);
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index cffb365d9d02..89813ca987c2 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -36,6 +36,7 @@
>  #include <asm/asm-compat.h>
>  #include <asm/feature-fixups.h>
>  #include <asm/cpuidle.h>
> +#include <asm/ultravisor-api.h>
> 
>  /* Sign-extend HDEC if not on POWER9 */
>  #define EXTEND_HDEC(reg)			\
> @@ -1092,16 +1093,12 @@ BEGIN_FTR_SECTION
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> 
>  	ld	r5, VCPU_LR(r4)
> -	ld	r6, VCPU_CR(r4)
>  	mtlr	r5
> -	mtcr	r6
> 
>  	ld	r1, VCPU_GPR(R1)(r4)
>  	ld	r2, VCPU_GPR(R2)(r4)
>  	ld	r3, VCPU_GPR(R3)(r4)
>  	ld	r5, VCPU_GPR(R5)(r4)
> -	ld	r6, VCPU_GPR(R6)(r4)
> -	ld	r7, VCPU_GPR(R7)(r4)
>  	ld	r8, VCPU_GPR(R8)(r4)
>  	ld	r9, VCPU_GPR(R9)(r4)
>  	ld	r10, VCPU_GPR(R10)(r4)
> @@ -1119,10 +1116,38 @@ BEGIN_FTR_SECTION
>  	mtspr	SPRN_HDSISR, r0
>  END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
> 
> +	ld	r6, VCPU_KVM(r4)
> +	lbz	r7, KVM_SECURE_GUEST(r6)
> +	cmpdi	r7, 0
> +	bne	ret_to_ultra
> +
> +	lwz	r6, VCPU_CR(r4)
> +	mtcr	r6
> +
> +	ld	r7, VCPU_GPR(R7)(r4)
> +	ld	r6, VCPU_GPR(R6)(r4)
>  	ld	r0, VCPU_GPR(R0)(r4)
>  	ld	r4, VCPU_GPR(R4)(r4)
>  	HRFI_TO_GUEST
>  	b	.
> +/*
> + * We are entering a secure guest, so we have to invoke the ultravisor 
> to do
> + * that. If we are returning from a hcall, the results are already in 
> the
> + * appropriate registers R3:12, except for R3, R6 and R7. R3 has the 
> status of
> + * the reflected hcall, therefore we move it to R0 for the ultravisor 
> and set
> + * R3 to the UV_RETURN ucall number. R6,7 were used as temporary 
> registers
> + * above, hence we restore them.
> + */
> +ret_to_ultra:
> +	lwz	r6, VCPU_CR(r4)
> +	mtcr	r6
> +	mfspr	r11, SPRN_SRR1
> +	mr	r0, r3
> +	LOAD_REG_IMMEDIATE(r3, UV_RETURN)
> +	ld	r7, VCPU_GPR(R7)(r4)
> +	ld	r6, VCPU_GPR(R6)(r4)
> +	ld	r4, VCPU_GPR(R4)(r4)
> +	sc	2
> 
>  /*
>   * Enter the guest on a P9 or later system where we have exactly
> @@ -3318,13 +3343,16 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
>   *   r0 is used as a scratch register
>   */
>  kvmppc_msr_interrupt:
> +	andis.	r0, r11, MSR_S@h
>  	rldicl	r0, r11, 64 - MSR_TS_S_LG, 62
> -	cmpwi	r0, 2 /* Check if we are in transactional state..  */
> +	cmpwi	cr1, r0, 2 /* Check if we are in transactional state..  */
>  	ld	r11, VCPU_INTR_MSR(r9)
> -	bne	1f
> +	bne	cr1, 1f
>  	/* ... if transactional, change to suspended */
>  	li	r0, 1
>  1:	rldimi	r11, r0, MSR_TS_S_LG, 63 - MSR_TS_T_LG
> +	beqlr
> +	oris	r11, r11, MSR_S@h		/* preserve MSR_S bit setting */
>  	blr
> 
>  /*
