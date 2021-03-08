Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D295C331280
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 16:47:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvN5V6Qq2z3cm2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 02:47:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PpEOb8/+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PpEOb8/+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvN5430sLz30Qk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 02:47:19 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128FYPMs164143; Mon, 8 Mar 2021 10:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=sFYOOgz2eiIo5rkl9yTy+11GWb8oOHff4iJ43V6pSwU=;
 b=PpEOb8/+GJpuA6XfHBFSSuPuM0KqPQLei2GhabfNC2XKvzcwulWVvwgs4TYLOXRBW1s0
 N0dDcvV56xQVQAmYcWokl3j2nChIUgrf8MyGpseRkq4U0rT1WT0LXryCANyYgL6sCcXV
 D42HXhWq+536+m4mZJAaKJn5zGVYmA7qKwhfNDnA3v++2ZI9OqziBWRFJAIV+TQHhp7h
 QFDnjs5ZQg7BKx9MMRfiuukMBqSEGT2JaUiqfR4MGfB2WyjnUbd5WCGoiiyrqenhPcCc
 LbORqrpFxMwqn7HYEhPCXN0uo9Nqu8W3edRkzWjW7wFLadV0JEG8L2MVd1vofM6ZJS1X 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 375p3s1uvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:47:16 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 128FYqkL166937;
 Mon, 8 Mar 2021 10:47:16 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 375p3s1uv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:47:16 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128FRVHd026471;
 Mon, 8 Mar 2021 15:47:15 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3741c9kkqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 15:47:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128FlES350201022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 15:47:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E8D7805C;
 Mon,  8 Mar 2021 15:47:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B9B17806B;
 Mon,  8 Mar 2021 15:47:13 +0000 (GMT)
Received: from localhost (unknown [9.163.6.5])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Mar 2021 15:47:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3 02/41] KVM: PPC: Book3S HV: Prevent radix guests from
 setting LPCR[TC]
In-Reply-To: <20210305150638.2675513-3-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
 <20210305150638.2675513-3-npiggin@gmail.com>
Date: Mon, 08 Mar 2021 12:47:11 -0300
Message-ID: <878s6xmyv4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_11:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 mlxscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080085
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

> This bit only applies to hash partitions.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c        | 6 ++++--
>  arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index c40eeb20be39..2e29b96ef775 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1666,10 +1666,12 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
>
>  	/*
>  	 * Userspace can only modify DPFD (default prefetch depth),
> -	 * ILE (interrupt little-endian) and TC (translation control).
> +	 * ILE (interrupt little-endian) and TC (translation control) if HPT.
>  	 * On POWER8 and POWER9 userspace can also modify AIL (alt. interrupt loc.).
>  	 */
> -	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC;
> +	mask = LPCR_DPFD | LPCR_ILE;
> +	if (!kvm_is_radix(kvm))
> +		mask |= LPCR_TC;

I think in theory there is a possibility that userspace sets the LPCR
while we running Radix and then calls the KVM_PPC_CONFIGURE_V3_MMU ioctl
right after to switch to HPT. I'm not sure if that would make sense but
maybe it's something to consider...

>  	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
>  		mask |= LPCR_AIL;
>  		/* LPCR[AIL]=1/2 is disallowed */
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index b496079e02f7..0e6cf650cbfe 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -141,7 +141,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>  	 * Don't let L1 change LPCR bits for the L2 except these:
>  	 * Keep this in sync with kvmppc_set_lpcr.
>  	 */
> -	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_LD | LPCR_LPES | LPCR_MER;
> +	mask = LPCR_DPFD | LPCR_ILE | LPCR_LD | LPCR_LPES | LPCR_MER;
>  	/* LPCR[AIL]=1/2 is disallowed */
>  	if ((hr->lpcr & LPCR_AIL) && (hr->lpcr & LPCR_AIL) != LPCR_AIL_3)
>  		hr->lpcr &= ~LPCR_AIL;
