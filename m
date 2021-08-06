Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D13E308D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 22:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhHbK2WKzz3dHJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 06:47:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OEo8Uci+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OEo8Uci+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhHZr4QHpz3cRf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 06:46:44 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176KYGeN042375; Fri, 6 Aug 2021 16:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=cga8LmOmFeglADAeAirR9nwa7i1NsUF5cGjbIQOsBi8=;
 b=OEo8Uci+b9wkIZFHcatWeyVdyo0xKaWixMOkJMB6Iaadc3giKxlwmkPG+LAbap5H8X7C
 mBYlOP9TPAqjrWo6IdLbnXSucNk/1ALVZuykJuARKoCrH3GetDn/M4L2vt/6q5tmDbkc
 jmr32Qn942r6a08xt7L6Mq17UB2VkuCLzU8ajWnmMkhXs2GhtDi1Gm+x/tTtK4voto5M
 2fEL4edsoVUk+bqI05rHCh1koqzEQHM+KG0x/kPM0WRq+qqkHcmRGsiSHwwtajhlkOXO
 OXaajwAKBrsLMWJxjbYepY3JGwXmgPRBBhjNoHkSYvmK3OtQL9Q3igXEfOoNX/A1PSuG rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a885am77b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 16:46:41 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 176KYaPK043053;
 Fri, 6 Aug 2021 16:46:41 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a885am771-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 16:46:41 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 176KcP9w022743;
 Fri, 6 Aug 2021 20:46:40 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3a7anme71j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 20:46:40 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 176KkdOa25624996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 20:46:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 696B47805E;
 Fri,  6 Aug 2021 20:46:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76BF17805C;
 Fri,  6 Aug 2021 20:46:38 +0000 (GMT)
Received: from localhost (unknown [9.211.46.8])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Aug 2021 20:46:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v1 31/55] KVM: PPC: Book3S HV P9: Juggle SPR switching
 around
In-Reply-To: <20210726035036.739609-32-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-32-npiggin@gmail.com>
Date: Fri, 06 Aug 2021 17:46:36 -0300
Message-ID: <8735rmti6r.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9g2YPrbKNVUNbv9tGJB5FWas6NBZJ71d
X-Proofpoint-ORIG-GUID: 2Uxp9KTABrHSX7bvShepqVP2hBlkShBc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_06:2021-08-06,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108060136
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

> This juggles SPR switching on the entry and exit sides to be more
> symmetric, which makes the next refactoring patch possible with no
> functional change.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 56429b53f4dc..c2c72875fca9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4175,7 +4175,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  		msr = mfmsr(); /* TM restore can update msr */
>  	}
>
> -	switch_pmu_to_guest(vcpu, &host_os_sprs);
> +	load_spr_state(vcpu, &host_os_sprs);
>
>  	load_fp_state(&vcpu->arch.fp);
>  #ifdef CONFIG_ALTIVEC
> @@ -4183,7 +4183,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  #endif
>  	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
>
> -	load_spr_state(vcpu, &host_os_sprs);
> +	switch_pmu_to_guest(vcpu, &host_os_sprs);
>
>  	if (kvmhv_on_pseries()) {
>  		/*
> @@ -4283,6 +4283,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  			vcpu->arch.slb_max = 0;
>  	}
>
> +	switch_pmu_to_host(vcpu, &host_os_sprs);
> +
>  	store_spr_state(vcpu);
>
>  	store_fp_state(&vcpu->arch.fp);
> @@ -4297,8 +4299,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>
>  	vcpu_vpa_increment_dispatch(vcpu);
>
> -	switch_pmu_to_host(vcpu, &host_os_sprs);
> -
>  	timer_rearm_host_dec(*tb);
>
>  	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
