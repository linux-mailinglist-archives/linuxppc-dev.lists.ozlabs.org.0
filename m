Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233A3B87B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 19:30:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFSzc3Z70z3bWY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 03:30:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GxSI988i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GxSI988i; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFSz37212z2yNP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 03:30:07 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UH7GKW106220; Wed, 30 Jun 2021 13:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=WZ3w+RODafL5y18kvDvJn/UdBKwDfIPBsMZAkgtJJJQ=;
 b=GxSI988iES4C3792unFdf8RItHZ9sPWvjwrkJOvkDdiBH242Wr0PD5hhYYOtboT/wH8K
 Yt405V3SRcRIZ76Tbwqq02s8fG9U7g8kXHX2DnVqIAsnraor83hltCoZlLLd1Vfir6fV
 +yTCs4xkdBce3x2u9sOQgcuHABfsDvapTXdv8QEN6T/G/AWUg/rhOCCqCHL5RwOEi2Ac
 7jBqv9tZYcm9V+Js98l3rli4SwDxyBb4TWW8uUw/XLd3tEXq3uXUGTaATMOSA6rPHvex
 Bd2OSHfFyP3fX6M+LXpnKXe6jNo49dkM/xtqU3UEAcPaGPBIkvyGus9DD2moAdmoBDxR ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr8220cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 13:30:04 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UH7YIP108047;
 Wed, 30 Jun 2021 13:30:04 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr8220c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 13:30:04 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UHQlgR014172;
 Wed, 30 Jun 2021 17:30:03 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 39duvdw510-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 17:30:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UHU2cR29098440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 17:30:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44A2BAC078;
 Wed, 30 Jun 2021 17:30:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F160AC06E;
 Wed, 30 Jun 2021 17:30:01 +0000 (GMT)
Received: from localhost (unknown [9.211.127.242])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 30 Jun 2021 17:30:00 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 01/43] powerpc/64s: Remove WORT SPR from POWER9/10
In-Reply-To: <20210622105736.633352-2-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-2-npiggin@gmail.com>
Date: Wed, 30 Jun 2021 14:29:58 -0300
Message-ID: <87h7hf2rc9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bjeRlbqWXmRVp7VIhx4GuPf3Hvz1DybD
X-Proofpoint-GUID: EZ706S26gw8VJfrhbVCt5PJf6P1H2UiG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_08:2021-06-30,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300096
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

> This register is not architected and not implemented in POWER9 or 10,
> it just reads back zeroes for compatibility.
>
> -78 cycles (9255) cycles POWER9 virt-mode NULL hcall
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c          | 3 ---
>  arch/powerpc/platforms/powernv/idle.c | 2 --
>  2 files changed, 5 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 9228042bd54f..97f3d6d54b61 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3640,7 +3640,6 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
>  	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
>  	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
>  	mtspr(SPRN_BESCR, vcpu->arch.bescr);
> -	mtspr(SPRN_WORT, vcpu->arch.wort);
>  	mtspr(SPRN_TIDR, vcpu->arch.tid);
>  	mtspr(SPRN_AMR, vcpu->arch.amr);
>  	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
> @@ -3667,7 +3666,6 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
>  	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
>  	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
>  	vcpu->arch.bescr = mfspr(SPRN_BESCR);
> -	vcpu->arch.wort = mfspr(SPRN_WORT);
>  	vcpu->arch.tid = mfspr(SPRN_TIDR);
>  	vcpu->arch.amr = mfspr(SPRN_AMR);
>  	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
> @@ -3699,7 +3697,6 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
>  				    struct p9_host_os_sprs *host_os_sprs)
>  {
>  	mtspr(SPRN_PSPB, 0);
> -	mtspr(SPRN_WORT, 0);
>  	mtspr(SPRN_UAMOR, 0);
>
>  	mtspr(SPRN_DSCR, host_os_sprs->dscr);
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 528a7e0cf83a..180baecad914 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -667,7 +667,6 @@ static unsigned long power9_idle_stop(unsigned long psscr)
>  		sprs.purr	= mfspr(SPRN_PURR);
>  		sprs.spurr	= mfspr(SPRN_SPURR);
>  		sprs.dscr	= mfspr(SPRN_DSCR);
> -		sprs.wort	= mfspr(SPRN_WORT);
>  		sprs.ciabr	= mfspr(SPRN_CIABR);
>
>  		sprs.mmcra	= mfspr(SPRN_MMCRA);
> @@ -785,7 +784,6 @@ static unsigned long power9_idle_stop(unsigned long psscr)
>  	mtspr(SPRN_PURR,	sprs.purr);
>  	mtspr(SPRN_SPURR,	sprs.spurr);
>  	mtspr(SPRN_DSCR,	sprs.dscr);
> -	mtspr(SPRN_WORT,	sprs.wort);
>  	mtspr(SPRN_CIABR,	sprs.ciabr);
>
>  	mtspr(SPRN_MMCRA,	sprs.mmcra);
