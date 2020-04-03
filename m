Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF719F03B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 08:04:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wg3y0Rv0zDqRq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 16:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wg276sQszDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 16:03:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03663493033299; Mon, 6 Apr 2020 02:03:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306nhsgfd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 02:03:03 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 036633Sm033205;
 Mon, 6 Apr 2020 02:03:03 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306nhsgf75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 02:03:03 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03662Gu4004748;
 Mon, 6 Apr 2020 06:02:47 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 306hv65v9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 06:02:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03662jX654985194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 06:02:45 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C027BBE059;
 Mon,  6 Apr 2020 06:02:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A00FDBE051;
 Mon,  6 Apr 2020 06:02:44 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.47.48])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 06:02:44 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 0E29C2E3225; Fri,  3 Apr 2020 15:01:04 +0530 (IST)
Date: Fri, 3 Apr 2020 15:01:03 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC/PATCH  2/3] pseries/kvm: Clear PSSCR[ESL|EC] bits before
 guest entry
Message-ID: <20200403093103.GA20293@in.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585656658-1838-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585880159.w3mc2nk6h3.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585880159.w3mc2nk6h3.astroid@bobo.none>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_01:2020-04-03,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060051
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
Reply-To: ego@linux.vnet.ibm.com
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 03, 2020 at 12:20:26PM +1000, Nicholas Piggin wrote:
> Gautham R. Shenoy's on March 31, 2020 10:10 pm:
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > 
> > ISA v3.0 allows the guest to execute a stop instruction. For this, the
> > PSSCR[ESL|EC] bits need to be cleared by the hypervisor before
> > scheduling in the guest vCPU.
> > 
> > Currently we always schedule in a vCPU with PSSCR[ESL|EC] bits
> > set. This patch changes the behaviour to enter the guest with
> > PSSCR[ESL|EC] bits cleared. This is a RFC patch where we
> > unconditionally clear these bits. Ideally this should be done
> > conditionally on platforms where the guest stop instruction has no
> > Bugs (starting POWER9 DD2.3).
> 
> How will guests know that they can use this facility safely after your
> series? You need both DD2.3 and a patched KVM.


Yes, this is something that isn't addressed in this series (mentioned
in the cover letter), which is a POC demonstrating that the stop0lite
state in guest works.

However, to answer your question, this is the scheme that I had in
mind :

OPAL:
   On Procs >= DD2.3 : we publish a dt-cpu-feature "idle-stop-guest"

Hypervisor Kernel:
    1. If "idle-stop-guest" dt-cpu-feature is discovered, then
       we set bool enable_guest_stop = true;

    2. During KVM guest entry, clear PSSCR[ESL|EC] iff
       enable_guest_stop == true.

    3. In kvm_vm_ioctl_check_extension(), for a new capability
       KVM_CAP_STOP, return true iff enable_guest_top == true.

QEMU:
   Check with the hypervisor if KVM_CAP_STOP is present. If so,
   indicate the presence to the guest via device tree.

Guest Kernel:
   Check for the presence of guest stop state support in
   device-tree. If available, enable the stop0lite in the cpuidle
   driver. 
   

We still have a challenge of migrating a guest which started on a
hypervisor supporting guest stop state to a hypervisor without it.
The target hypervisor should atleast have Patch 1 of this series, so
that we don't crash the guest.

> 
> > 
> > Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv.c            |  2 +-
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 25 +++++++++++++------------
> >  2 files changed, 14 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index cdb7224..36d059a 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -3424,7 +3424,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
> >  	mtspr(SPRN_IC, vcpu->arch.ic);
> >  	mtspr(SPRN_PID, vcpu->arch.pid);
> >  
> > -	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
> > +	mtspr(SPRN_PSSCR, (vcpu->arch.psscr  & ~(PSSCR_EC | PSSCR_ESL)) |
> >  	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> >  
> >  	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index dbc2fec..c2daec3 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -823,6 +823,18 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
> >  	mtspr	SPRN_PID, r7
> >  	mtspr	SPRN_WORT, r8
> >  BEGIN_FTR_SECTION
> > +	/* POWER9-only registers */
> > +	ld	r5, VCPU_TID(r4)
> > +	ld	r6, VCPU_PSSCR(r4)
> > +	lbz	r8, HSTATE_FAKE_SUSPEND(r13)
> > +	lis 	r7, (PSSCR_EC | PSSCR_ESL)@h /* Allow guest to call stop */
> > +	andc	r6, r6, r7
> > +	rldimi	r6, r8, PSSCR_FAKE_SUSPEND_LG, 63 - PSSCR_FAKE_SUSPEND_LG
> > +	ld	r7, VCPU_HFSCR(r4)
> > +	mtspr	SPRN_TIDR, r5
> > +	mtspr	SPRN_PSSCR, r6
> > +	mtspr	SPRN_HFSCR, r7
> > +FTR_SECTION_ELSE
> 
> Why did you move these around? Just because the POWER9 section became
> larger than the other?

Yes.

> 
> That's a real wart in the instruction patching implementation, I think
> we can fix it by padding with nops in the macros.
> 
> Can you just add the additional required nops to the top branch without
> changing them around for this patch, so it's easier to see what's going
> on? The end result will be the same after patching. Actually changing
> these around can have a slight unintended consequence in that code that
> runs before features were patched will execute the IF code. Not a
> problem here, but another reason why the instruction patching 
> restriction is annoying.

Sure, I will repost this patch with additional nops instead of
moving them around.

> 
> Thanks,
> Nick
> 
> >  	/* POWER8-only registers */
> >  	ld	r5, VCPU_TCSCR(r4)
> >  	ld	r6, VCPU_ACOP(r4)
> > @@ -833,18 +845,7 @@ BEGIN_FTR_SECTION
> >  	mtspr	SPRN_CSIGR, r7
> >  	mtspr	SPRN_TACR, r8
> >  	nop
> > -FTR_SECTION_ELSE
> > -	/* POWER9-only registers */
> > -	ld	r5, VCPU_TID(r4)
> > -	ld	r6, VCPU_PSSCR(r4)
> > -	lbz	r8, HSTATE_FAKE_SUSPEND(r13)
> > -	oris	r6, r6, PSSCR_EC@h	/* This makes stop trap to HV */
> > -	rldimi	r6, r8, PSSCR_FAKE_SUSPEND_LG, 63 - PSSCR_FAKE_SUSPEND_LG
> > -	ld	r7, VCPU_HFSCR(r4)
> > -	mtspr	SPRN_TIDR, r5
> > -	mtspr	SPRN_PSSCR, r6
> > -	mtspr	SPRN_HFSCR, r7
> > -ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
> > +ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
> >  8:
> >  
> >  	ld	r5, VCPU_SPRG0(r4)
> > -- 
> > 1.9.4
> > 
> > 

--
Thanks and Regards
gautham.
