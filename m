Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C034D0BEE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 00:20:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCDw527xsz3bb9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 10:20:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oWK9hz5u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oWK9hz5u; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCDvQ3fCdz2xD7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 10:20:01 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227MgIox023721; 
 Mon, 7 Mar 2022 23:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=uyMa4CiCt+ObHkCMY6c4uDISjeGsNxGj/3lxnzGxXqU=;
 b=oWK9hz5uOVkyrfdQY6zPjZlyMM0/wLklPA8UOwRjRSm8bPC51txgHxG+K1RrAhisK8z0
 QtbcYjGKJ+0H/w7P1+9KnYE0l/IRmkIUhFd5v2imabAS+1gBpOeUCP/xOHB4+2HvE9s4
 xVKpqkjIDUzcC563iTNk91kG9dv/zP8bailwGaqNJKs6wafbuXnlZ7ND/nrmz02KOOxG
 +SyeOcSDk939L934RS6+sVL2PutXQnQBSGSVDAsW0zEQAFsFk2MpT7aMHXw8PqRxD2zz
 xB+XWdeNqotEPbWRva6KkCwyas87MixdFc4JQz4jSPtwQoxHv9nEqk+8bQnmSqVSpiqD Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enu2rrhs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 23:19:58 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 227NHq7o033173;
 Mon, 7 Mar 2022 23:19:57 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enu2rrhrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 23:19:57 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 227MwJ15023775;
 Mon, 7 Mar 2022 23:19:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3emgakg01d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 23:19:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 227NJtsS15925898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 23:19:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F69AC6061;
 Mon,  7 Mar 2022 23:19:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7724C6057;
 Mon,  7 Mar 2022 23:19:54 +0000 (GMT)
Received: from localhost (unknown [9.211.158.32])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  7 Mar 2022 23:19:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/6] KVM: PPC: Book3S HV P9: Inject pending xive
 interrupts at guest entry
In-Reply-To: <20220303053315.1056880-3-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
 <20220303053315.1056880-3-npiggin@gmail.com>
Date: Mon, 07 Mar 2022 20:19:52 -0300
Message-ID: <87pmmx9wpz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y4TfQ3b3H_-ZI3kC_GK0TNqUGMSSKcjV
X-Proofpoint-GUID: c_WZQ9T3Us9N4ywe7ZcHLJWouKk9OOW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_12,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070118
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

> If there is a pending xive interrupt, inject it at guest entry (if
> MSR[EE] is enabled) rather than take another interrupt when the guest
> is entered. If xive is enabled then LPCR[LPES] is set so this behaviour
> should be expected.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index f8c0f1f52a1e..5df359053147 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4524,9 +4524,14 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>
>  	if (!nested) {
>  		kvmppc_core_prepare_to_enter(vcpu);
> -		if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
> -			     &vcpu->arch.pending_exceptions))
> +		if (vcpu->arch.shregs.msr & MSR_EE) {
> +			if (xive_interrupt_pending(vcpu))
> +				kvmppc_inject_interrupt_hv(vcpu,
> +						BOOK3S_INTERRUPT_EXTERNAL, 0);
> +		} else if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
> +			     &vcpu->arch.pending_exceptions)) {
>  			lpcr |= LPCR_MER;
> +		}
>  	} else if (vcpu->arch.pending_exceptions ||
>  		   vcpu->arch.doorbell_request ||
>  		   xive_interrupt_pending(vcpu)) {

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
