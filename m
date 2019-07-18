Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F746C509
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 04:49:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pz9c53zSzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 12:49:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pz7p5sntzDqDW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 12:47:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45pz7p3RB8z8swM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 12:47:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45pz7p2zF2z9sNH; Thu, 18 Jul 2019 12:47:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sukadev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45pz7n6Jxlz9sNC
 for <linuxppc-dev@ozlabs.org>; Thu, 18 Jul 2019 12:47:33 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6I2l4TH031039
 for <linuxppc-dev@ozlabs.org>; Wed, 17 Jul 2019 22:47:31 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttg4g09xk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 17 Jul 2019 22:47:31 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sukadev@linux.vnet.ibm.com>;
 Thu, 18 Jul 2019 03:47:29 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 18 Jul 2019 03:47:27 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6I2lR3A53936570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jul 2019 02:47:27 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3C5B2064;
 Thu, 18 Jul 2019 02:47:26 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD063B2066;
 Thu, 18 Jul 2019 02:47:26 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jul 2019 02:47:26 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 3A6602E1120; Wed, 17 Jul 2019 19:47:25 -0700 (PDT)
Date: Wed, 17 Jul 2019 19:47:25 -0700
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 7/8] KVM: PPC: Ultravisor: Enter a secure guest
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-8-cclaudio@linux.ibm.com>
 <87ftncg24e.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftncg24e.fsf@concordia.ellerman.id.au>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19071802-0052-0000-0000-000003E295C5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011449; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01233725; UDB=6.00650097; IPR=6.01015052; 
 MB=3.00027770; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-18 02:47:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071802-0053-0000-0000-000061BDF5A4
Message-Id: <20190718024724.GB13492@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180030
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

Michael Ellerman [mpe@ellerman.id.au] wrote:
> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> > From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> >
> > To enter a secure guest, we have to go through the ultravisor, therefore
> > we do a ucall when we are entering a secure guest.
> >
> > This change is needed for any sort of entry to the secure guest from the
> > hypervisor, whether it is a return from an hcall, a return from a
> > hypervisor interrupt, or the first time that a secure guest vCPU is run.
> >
> > If we are returning from an hcall, the results are already in the
> > appropriate registers R3:12, except for R3, R6 and R7. R3 has the status
> > of the reflected hcall, therefore we move it to R0 for the ultravisor and
> > set R3 to the UV_RETURN ucall number. R6,7 were used as temporary
> > registers, hence we restore them.
> 
> This is another case where some documentation would help people to
> review the code.
> 
> > Have fast_guest_return check the kvm_arch.secure_guest field so that a
> > new CPU enters UV when started (in response to a RTAS start-cpu call).
> >
> > Thanks to input from Paul Mackerras, Ram Pai and Mike Anderson.
> >
> > Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> > [ Pass SRR1 in r11 for UV_RETURN, fix kvmppc_msr_interrupt to preserve
> >   the MSR_S bit ]
> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> > [ Fix UV_RETURN ucall number and arch.secure_guest check ]
> > Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> > [ Save the actual R3 in R0 for the ultravisor and use R3 for the
> >   UV_RETURN ucall number. Update commit message and ret_to_ultra comment ]
> > Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/kvm_host.h       |  1 +
> >  arch/powerpc/include/asm/ultravisor-api.h |  1 +
> >  arch/powerpc/kernel/asm-offsets.c         |  1 +
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 40 +++++++++++++++++++----
> >  4 files changed, 37 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index cffb365d9d02..89813ca987c2 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -36,6 +36,7 @@
> >  #include <asm/asm-compat.h>
> >  #include <asm/feature-fixups.h>
> >  #include <asm/cpuidle.h>
> > +#include <asm/ultravisor-api.h>
> >  
> >  /* Sign-extend HDEC if not on POWER9 */
> >  #define EXTEND_HDEC(reg)			\
> > @@ -1092,16 +1093,12 @@ BEGIN_FTR_SECTION
> >  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> >  
> >  	ld	r5, VCPU_LR(r4)
> > -	ld	r6, VCPU_CR(r4)
> >  	mtlr	r5
> > -	mtcr	r6
> >  
> >  	ld	r1, VCPU_GPR(R1)(r4)
> >  	ld	r2, VCPU_GPR(R2)(r4)
> >  	ld	r3, VCPU_GPR(R3)(r4)
> >  	ld	r5, VCPU_GPR(R5)(r4)
> > -	ld	r6, VCPU_GPR(R6)(r4)
> > -	ld	r7, VCPU_GPR(R7)(r4)
> >  	ld	r8, VCPU_GPR(R8)(r4)
> >  	ld	r9, VCPU_GPR(R9)(r4)
> >  	ld	r10, VCPU_GPR(R10)(r4)
> > @@ -1119,10 +1116,38 @@ BEGIN_FTR_SECTION
> >  	mtspr	SPRN_HDSISR, r0
> >  END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
> >  
> > +	ld	r6, VCPU_KVM(r4)
> > +	lbz	r7, KVM_SECURE_GUEST(r6)
> > +	cmpdi	r7, 0
> 
> You could hoist the load of r6 and r7 to here?

we could move 'ld r7' here. r6 is used to restore CR below so
it (r6) has to stay there?

> 
> > +	bne	ret_to_ultra
> > +
> > +	lwz	r6, VCPU_CR(r4)
> > +	mtcr	r6
> > +
> > +	ld	r7, VCPU_GPR(R7)(r4)
> > +	ld	r6, VCPU_GPR(R6)(r4)
> >  	ld	r0, VCPU_GPR(R0)(r4)
> >  	ld	r4, VCPU_GPR(R4)(r4)
> >  	HRFI_TO_GUEST
> >  	b	.
> > +/*
> > + * We are entering a secure guest, so we have to invoke the ultravisor to do
> > + * that. If we are returning from a hcall, the results are already in the
> > + * appropriate registers R3:12, except for R3, R6 and R7. R3 has the status of
> > + * the reflected hcall, therefore we move it to R0 for the ultravisor and set
> > + * R3 to the UV_RETURN ucall number. R6,7 were used as temporary registers
> > + * above, hence we restore them.
> > + */
> > +ret_to_ultra:
> > +	lwz	r6, VCPU_CR(r4)
> > +	mtcr	r6
> > +	mfspr	r11, SPRN_SRR1
> > +	mr	r0, r3
> > +	LOAD_REG_IMMEDIATE(r3, UV_RETURN)
> 
> Worth open coding to save three instructions?

Yes, good point:

-       LOAD_REG_IMMEDIATE(r3, UV_RETURN)
+
+       li      r3, 0
+       oris    r3, r3, (UV_RETURN)@__AS_ATHIGH
+       ori     r3, r3, (UV_RETURN)@l
+

> 
> > +	ld	r7, VCPU_GPR(R7)(r4)
> > +	ld	r6, VCPU_GPR(R6)(r4)
> > +	ld	r4, VCPU_GPR(R4)(r4)
> > +	sc	2
> >  
> >  /*
> >   * Enter the guest on a P9 or later system where we have exactly
> > @@ -3318,13 +3343,16 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
> >   *   r0 is used as a scratch register
> >   */
> >  kvmppc_msr_interrupt:
> > +	andis.	r0, r11, MSR_S@h
> >  	rldicl	r0, r11, 64 - MSR_TS_S_LG, 62
> > -	cmpwi	r0, 2 /* Check if we are in transactional state..  */
> > +	cmpwi	cr1, r0, 2 /* Check if we are in transactional state..  */
> >  	ld	r11, VCPU_INTR_MSR(r9)
> > -	bne	1f
> > +	bne	cr1, 1f
> >  	/* ... if transactional, change to suspended */
> >  	li	r0, 1
> >  1:	rldimi	r11, r0, MSR_TS_S_LG, 63 - MSR_TS_T_LG
> > +	beqlr
> > +	oris	r11, r11, MSR_S@h		/* preserve MSR_S bit setting */
> >  	blr
> 
> I don't see this part mentioned in the change log?
> 
> It's also pretty subtle, a comment might be helpful.
> 
> cheers

