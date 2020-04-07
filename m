Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081B1A0DDC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 14:39:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xRnP5DN6zDqCY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 22:39:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xRff4kXfzDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 22:34:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48xRff3Wttz8t60
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 22:34:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 48xRff2zpmz9sSr; Tue,  7 Apr 2020 22:34:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48xRfd2G8mz9sSG;
 Tue,  7 Apr 2020 22:34:01 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037CW8Ze100298; Tue, 7 Apr 2020 08:33:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082ped3es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 08:33:52 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 037CXSvW107181;
 Tue, 7 Apr 2020 08:33:52 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082ped3e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 08:33:52 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 037CWWAV027363;
 Tue, 7 Apr 2020 12:33:51 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 306hv65yw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 12:33:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 037CXnuE61473112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 12:33:49 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D415EBE04F;
 Tue,  7 Apr 2020 12:33:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CB54BE053;
 Tue,  7 Apr 2020 12:33:49 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.0.81])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 12:33:49 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E71D62E3231; Tue,  7 Apr 2020 18:03:44 +0530 (IST)
Date: Tue, 7 Apr 2020 18:03:44 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [RFC/PATCH  2/3] pseries/kvm: Clear PSSCR[ESL|EC] bits before
 guest entry
Message-ID: <20200407123344.GA950@in.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585656658-1838-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585880159.w3mc2nk6h3.astroid@bobo.none>
 <20200403093103.GA20293@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403093103.GA20293@in.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_03:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070105
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
Cc: Michael Neuling <mikey@neuling.org>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nicholas,

On Fri, Apr 03, 2020 at 03:01:03PM +0530, Gautham R Shenoy wrote:
> On Fri, Apr 03, 2020 at 12:20:26PM +1000, Nicholas Piggin wrote:


[..snip..]
> > > 
> > > Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_hv.c            |  2 +-
> > >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 25 +++++++++++++------------
> > >  2 files changed, 14 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > > index cdb7224..36d059a 100644
> > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > @@ -3424,7 +3424,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
> > >  	mtspr(SPRN_IC, vcpu->arch.ic);
> > >  	mtspr(SPRN_PID, vcpu->arch.pid);
> > >  
> > > -	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
> > > +	mtspr(SPRN_PSSCR, (vcpu->arch.psscr  & ~(PSSCR_EC | PSSCR_ESL)) |
> > >  	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
> > >  
> > >  	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
> > > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > index dbc2fec..c2daec3 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > @@ -823,6 +823,18 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
> > >  	mtspr	SPRN_PID, r7
> > >  	mtspr	SPRN_WORT, r8
> > >  BEGIN_FTR_SECTION
> > > +	/* POWER9-only registers */
> > > +	ld	r5, VCPU_TID(r4)
> > > +	ld	r6, VCPU_PSSCR(r4)
> > > +	lbz	r8, HSTATE_FAKE_SUSPEND(r13)
> > > +	lis 	r7, (PSSCR_EC | PSSCR_ESL)@h /* Allow guest to call stop */
> > > +	andc	r6, r6, r7
> > > +	rldimi	r6, r8, PSSCR_FAKE_SUSPEND_LG, 63 - PSSCR_FAKE_SUSPEND_LG
> > > +	ld	r7, VCPU_HFSCR(r4)
> > > +	mtspr	SPRN_TIDR, r5
> > > +	mtspr	SPRN_PSSCR, r6
> > > +	mtspr	SPRN_HFSCR, r7
> > > +FTR_SECTION_ELSE
> > 
> > Why did you move these around? Just because the POWER9 section became
> > larger than the other?
> 
> Yes.
> 
> > 
> > That's a real wart in the instruction patching implementation, I think
> > we can fix it by padding with nops in the macros.
> > 
> > Can you just add the additional required nops to the top branch without
> > changing them around for this patch, so it's easier to see what's going
> > on? The end result will be the same after patching. Actually changing
> > these around can have a slight unintended consequence in that code that
> > runs before features were patched will execute the IF code. Not a
> > problem here, but another reason why the instruction patching 
> > restriction is annoying.
> 
> Sure, I will repost this patch with additional nops instead of
> moving them around.
> 

Below is the same patch without rearranging the FTR_SECTION blocks,
but with an extra nop. 

---
 arch/powerpc/kvm/book3s_hv.c            | 2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c52871c..efa7d3e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3433,7 +3433,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_IC, vcpu->arch.ic);
 	mtspr(SPRN_PID, vcpu->arch.pid);
 
-	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
+	mtspr(SPRN_PSSCR, (vcpu->arch.psscr  & ~(PSSCR_EC | PSSCR_ESL)) |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
 
 	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 780a499..83a69dc 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -833,12 +833,14 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_CSIGR, r7
 	mtspr	SPRN_TACR, r8
 	nop
+	nop
 FTR_SECTION_ELSE
 	/* POWER9-only registers */
 	ld	r5, VCPU_TID(r4)
 	ld	r6, VCPU_PSSCR(r4)
 	lbz	r8, HSTATE_FAKE_SUSPEND(r13)
-	oris	r6, r6, PSSCR_EC@h	/* This makes stop trap to HV */
+	lis 	r7, (PSSCR_EC | PSSCR_ESL)@h /* Allow guest to call stop */
+	andc	r6, r6, r7
 	rldimi	r6, r8, PSSCR_FAKE_SUSPEND_LG, 63 - PSSCR_FAKE_SUSPEND_LG
 	ld	r7, VCPU_HFSCR(r4)
 	mtspr	SPRN_TIDR, r5
-- 
Thanks and Regards
gautham.
