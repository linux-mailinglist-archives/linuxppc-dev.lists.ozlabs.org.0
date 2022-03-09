Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF824D3129
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 15:42:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDFKF4byzz3bd6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 01:42:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pYWM6TK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pYWM6TK/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDFJV3SJQz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 01:41:45 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229CiCmA017171; 
 Wed, 9 Mar 2022 14:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=zK+Z6j4yzcb3jihpJOpxQs5f17JpSKF+G8D1of/GgrI=;
 b=pYWM6TK/vAC3xx9vsEj1pOlj2RVTP6nbXZVws1fUmFylbKhvgbwWjZjLiCzm2/QRmbiU
 5afmb4q8XJ73Ev2QrpFe0Lf0tog9UHliMQOPSLMy+P7ZyclL2h1omaQe/M2cqGhr3Ipt
 aluOq8WSyPW0seKQwl4+dqNmPeau/HcMsv2utE/8VqWuPKxPzh9zVGFddj4TnptNo6Wt
 D4gSw9NdFbIF6uUGOtsCtxWbhKjfh9sw1pE3HibRoeTIieYvE/H65AGGBS72enPmqNVu
 CwBtlzSDfRnm196/75f8xOH0lbSowvYrXrDit2mNrCORI4dmxPYNpcozR1HNvawj87+B jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3enwehysr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 14:41:36 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 229EYB7X012081;
 Wed, 9 Mar 2022 14:41:35 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3enwehysr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 14:41:35 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 229Eb4XO031328;
 Wed, 9 Mar 2022 14:41:35 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3epb9cfr0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 14:41:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 229EfWeZ9700050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Mar 2022 14:41:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FA75C6059;
 Wed,  9 Mar 2022 14:41:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09A75C6057;
 Wed,  9 Mar 2022 14:41:32 +0000 (GMT)
Received: from localhost (unknown [9.211.59.35])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  9 Mar 2022 14:41:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S HV P9: Move cede logic out of XIVE
 escalation rearming
In-Reply-To: <20220303053315.1056880-4-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
 <20220303053315.1056880-4-npiggin@gmail.com>
Date: Wed, 09 Mar 2022 11:41:30 -0300
Message-ID: <878rtjb339.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IaNuoO_m1b8zuaFVUejwDXHp3UbogsjH
X-Proofpoint-ORIG-GUID: irD-rAxIf_6zA_gPG97VDlo8mjwqTkiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_05,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090081
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Move the cede abort logic out of xive escalation rearming and into
> the caller to prepare for handling a similar case with nested guest
> entry.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/kvm_ppc.h |  4 ++--
>  arch/powerpc/kvm/book3s_hv.c       | 10 ++++++++--
>  arch/powerpc/kvm/book3s_xive.c     |  9 ++++++---
>  3 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index a14dbcd1b8ce..94fa5f246657 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -671,7 +671,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
>  			       int level, bool line_status);
>  extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
>  extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
> -extern void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
> +extern bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
>
>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  {
> @@ -709,7 +709,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
>  				      int level, bool line_status) { return -ENODEV; }
>  static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
>  static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
> -static inline void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { }
> +static inline bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { return true; }
>
>  static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
>  	{ return 0; }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 5df359053147..a0b674d3a2da 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4073,10 +4073,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  		    !(vcpu->arch.shregs.msr & MSR_PR)) {
>  			unsigned long req = kvmppc_get_gpr(vcpu, 3);
>
> -			/* H_CEDE has to be handled now, not later */
> +			/* H_CEDE has to be handled now */
>  			if (req == H_CEDE) {
>  				kvmppc_cede(vcpu);
> -				kvmppc_xive_rearm_escalation(vcpu); /* may un-cede */
> +				if (!kvmppc_xive_rearm_escalation(vcpu)) {
> +					/*
> +					 * Pending escalation so abort
> +					 * the cede.
> +					 */
> +					vcpu->arch.ceded = 0;

This was moved after the mb() in kvmppc_xive_rearm_escalation, so I
think a concurrent H_PROD might continue to see tvcpu->arch.ceded = 1
after the escalation has been set. Is this an issue?

> +				}
>  				kvmppc_set_gpr(vcpu, 3, 0);
>  				trap = 0;
>
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index e216c068075d..7b513e14cada 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -179,12 +179,13 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
>
> -void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
> +bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
>  {
>  	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
> +	bool ret = true;
>
>  	if (!esc_vaddr)
> -		return;
> +		return ret;
>
>  	/* we are using XIVE with single escalation */
>
> @@ -197,7 +198,7 @@ void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
>  		 * we also don't want to set xive_esc_on to 1 here in
>  		 * case we race with xive_esc_irq().
>  		 */
> -		vcpu->arch.ceded = 0;
> +		ret = false;
>  		/*
>  		 * The escalation interrupts are special as we don't EOI them.
>  		 * There is no need to use the load-after-store ordering offset
> @@ -210,6 +211,8 @@ void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
>  		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
>  	}
>  	mb();
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_xive_rearm_escalation);
