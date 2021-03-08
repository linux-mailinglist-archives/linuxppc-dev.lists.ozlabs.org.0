Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8B331231
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 16:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvMkH0TLlz3cQH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 02:31:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VNe1JsKq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VNe1JsKq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvMjr3TPxz3cJs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 02:30:39 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128FUZi4018858; Mon, 8 Mar 2021 10:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=wkRWd3xQgYN9uzjDFWgUDOIYXOYXqZFeufOwI2e7WFg=;
 b=VNe1JsKqjbrH5Q+aHEQayWzNC7jGZDi27xpyeQUZBHm2hSc4cytmi6oKK/5jlEuMXqWu
 GjvFe0Haxsr6CPdB9cGGIJ3HiMxX12i5O4GZMHlrLGSFThjGtBn6kR5XJLxAcehpQZvA
 s1A3y7oxjkr39SAC3OJHqVsuI9CeKXOL0pta2CcDLtpAlok6dTHVXss0c3+gLE2Ukzbu
 ZFKwZSYWNrpPp0cWutwlJ6tD2vRgkb9zv8nOQQUZD5ESVpb1utw4EiC7nwqIYw64q6K1
 6G02sC2ox3n8nSCm/2SLf5BVkXbi60+3blSs0BUu8TVw0U4nJ0fbhv+hCBOY8xhIJDGb 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37577g78d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:30:36 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 128FUNQa018732;
 Mon, 8 Mar 2021 10:30:23 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37577g7803-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:30:22 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128FDHuw006100;
 Mon, 8 Mar 2021 15:26:53 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3741c9begg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 15:26:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128FQq3M23658898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 15:26:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E93307806A;
 Mon,  8 Mar 2021 15:26:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 529FB78060;
 Mon,  8 Mar 2021 15:26:51 +0000 (GMT)
Received: from localhost (unknown [9.163.6.5])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Mar 2021 15:26:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 01/41] KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be
 set to 1 or 2
In-Reply-To: <20210305150638.2675513-2-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-2-npiggin@gmail.com>
Date: Mon, 08 Mar 2021 12:26:49 -0300
Message-ID: <87blbtmzt2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_11:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103080083
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> These are already disallowed by H_SET_MODE from the guest, also disallow
> these by updating LPCR directly.
>
> AIL modes can affect the host interrupt behaviour while the guest LPCR
> value is set, so filter it here too.
>
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c        | 11 +++++++++--
>  arch/powerpc/kvm/book3s_hv_nested.c |  7 +++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 13bad6bf4c95..c40eeb20be39 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -803,7 +803,10 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
>  		vcpu->arch.dawrx1 = value2;
>  		return H_SUCCESS;
>  	case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
> -		/* KVM does not support mflags=2 (AIL=2) */
> +		/*
> +		 * KVM does not support mflags=2 (AIL=2) and AIL=1 is reserved.
> +		 * Keep this in synch with kvmppc_set_lpcr.
> +		 */
>  		if (mflags != 0 && mflags != 3)
>  			return H_UNSUPPORTED_FLAG_START;
>  		return H_TOO_HARD;
> @@ -1667,8 +1670,12 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
>  	 * On POWER8 and POWER9 userspace can also modify AIL (alt. interrupt loc.).
>  	 */
>  	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC;
> -	if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
>  		mask |= LPCR_AIL;
> +		/* LPCR[AIL]=1/2 is disallowed */
> +		if ((new_lpcr & LPCR_AIL) && (new_lpcr & LPCR_AIL) != LPCR_AIL_3)
> +			new_lpcr &= ~LPCR_AIL;
> +	}
>  	/*
>  	 * On POWER9, allow userspace to enable large decrementer for the
>  	 * guest, whether or not the host has it enabled.
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 2fe1fea4c934..b496079e02f7 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -139,9 +139,12 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)

We're missing the patch that moves the lpcr setting into
sanitise_hv_regs.

>  
>  	/*
>  	 * Don't let L1 change LPCR bits for the L2 except these:
> +	 * Keep this in sync with kvmppc_set_lpcr.
>  	 */
> -	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
> -		LPCR_LPES | LPCR_MER;
> +	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_LD | LPCR_LPES | LPCR_MER;

I think this line's change belongs in patch 33 doesn't it? Otherwise you
are clearing a bit below that is not present in the mask so it would
never be used anyway.

> +	/* LPCR[AIL]=1/2 is disallowed */
> +	if ((hr->lpcr & LPCR_AIL) && (hr->lpcr & LPCR_AIL) != LPCR_AIL_3)
> +		hr->lpcr &= ~LPCR_AIL;
>  	hr->lpcr = (vc->lpcr & ~mask) | (hr->lpcr & mask);
>  
>  	/*
