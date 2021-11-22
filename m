Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F84594C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 19:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HybYw5mtPz3c56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 05:35:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xglrpv6c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xglrpv6c; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HybY664SKz2xLL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 05:35:05 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMHp3nF008822
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 18:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=347/xe1wCvRpOzDI4DQpY7kOC0jEvs+AERCYO56bBx8=;
 b=Xglrpv6ceRAQDNpADzPLgz9/B7wI/WFsoOLl+9EUrBhpyn0Rwxzw70cDoyB/WfBkFoGr
 qPvXximxik7lF35lkiD5nbqER8z4hX/l1bs5tzLVQfQdo5jzu7zskHVxXjUI3Kn4G212
 1kpSD8e6sBUCqd74rlJTdAUhXicfoMWlCo4gsyMyVdjdHF6uYrtaGCMsvwjJd3FNGt5k
 B8LqI9f+EF9SdGYktUq5N062Xib0mLf9dV6W9iQudcllqsLyiggoCZTcMtIdO24qnDPD
 mhNH8Xvmt0QgedrjdZmqnlY8bZxgx8/lPDxuG3CxftjOQXbKIy4ZvKXORb2u+iRgV9sa ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgfyh8sp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 18:35:02 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AMIJ7ul040421
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 18:35:01 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cgfyh8sp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 18:35:01 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AMISujG009719;
 Mon, 22 Nov 2021 18:35:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3cernanj2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 18:35:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AMIYxp655968140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 18:34:59 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C03BEAE066;
 Mon, 22 Nov 2021 18:34:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2B22AE068;
 Mon, 22 Nov 2021 18:34:58 +0000 (GMT)
Received: from localhost (unknown [9.211.110.220])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 22 Nov 2021 18:34:58 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1] KVM: PPC: Book3S HV: Prevent POWER7/8 TLB flush
 flushing SLB
In-Reply-To: <20211119031627.577853-1-npiggin@gmail.com>
References: <20211119031627.577853-1-npiggin@gmail.com>
Date: Mon, 22 Nov 2021 15:34:56 -0300
Message-ID: <87sfvoqbsf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1Op9Dl0c0W1UQvg5q0fTgR3RWRIu8OKH
X-Proofpoint-GUID: v5DM3-Aj2cH5uebnfwkj4lz-59aPMVGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_08,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220095
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The POWER9 ERAT flush instruction is a SLBIA with IH=7, which is a
> reserved value on POWER7/8. On POWER8 this invalidates the SLB entries
> above index 0, similarly to SLBIA IH=0.
>
> If the SLB entries are invalidated, and then the guest is bypassed, the
> host SLB does not get re-loaded, so the bolted entries above 0 will be
> lost. This can result in kernel stack access causing a SLB fault.
>
> Kernel stack access causing a SLB fault was responsible for the infamous
> mega bug (search "Fix SLB reload bug"). Although since commit
> 48e7b7695745 ("powerpc/64s/hash: Convert SLB miss handlers to C") that
> starts using the kernel stack in the SLB miss handler, it might only
> result in an infinite loop of SLB faults. In any case it's a bug.
>
> Fix this by only executing the instruction on >= POWER9 where IH=7 is
> defined not to invalidate the SLB. POWER7/8 don't require this ERAT
> flush.
>
> Fixes: 5008711259201 ("KVM: PPC: Book3S HV: Invalidate ERAT when flushing guest TLB entries")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv_builtin.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index fcf4760a3a0e..70b7a8f97153 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -695,6 +695,7 @@ static void flush_guest_tlb(struct kvm *kvm)
>  				       "r" (0) : "memory");
>  		}
>  		asm volatile("ptesync": : :"memory");
> +		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
>  		asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST : : :"memory");
>  	} else {
>  		for (set = 0; set < kvm->arch.tlb_sets; ++set) {
> @@ -705,7 +706,9 @@ static void flush_guest_tlb(struct kvm *kvm)
>  			rb += PPC_BIT(51);	/* increment set number */
>  		}
>  		asm volatile("ptesync": : :"memory");
> -		asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT : : :"memory");
> +		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
> +		if (cpu_has_feature(CPU_FTR_ARCH_300))
> +			asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT : : :"memory");
>  	}
>  }
