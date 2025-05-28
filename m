Return-Path: <linuxppc-dev+bounces-8965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EBAC6490
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 10:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6jTg4xdjz2yMw;
	Wed, 28 May 2025 18:34:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748421255;
	cv=none; b=DtrBl4IBfg7KjtwptIiftYxHmenlrnRtd5LR/sICgnHuXJ7zeYDOkum7eNi2LwjlBID00udsXw6ymwvvSUJcR1REDuE2qt1/I5Y0xH+0uqriX7Y9FWHkH2inReKHi8MmKX8T6J6/ZNXh3cyDRr11EkKRG5NUaVeo+xda5+uNkvrtT9jzgkOiA3Uc5ocktHYoBPlFS3Owk5QOThywGG3rsGSRTxR26QQ8HlveSd4UEEj7v8lpgfGPXZKRDQRd97m5QgYvjvAQmGlcudrfPjK8iOYTqpLKq2EzKSXvNExAAABCoKj8FyyoZ8Wc25dcnbdDPYV9JwZIN/xzS6xnr3R9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748421255; c=relaxed/relaxed;
	bh=UTM5u1l2n0kAspKjldvPCAwdiqwUnti0AqdYXhv4OyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVAVM5GB5PkOz+ZRN8T6GmpTE2FhcmLifDtmPeddYspxm2uM2T4bZbw2mdlmMljfBRzb3AizUPgJcPwjOx3C2s74+6HmPWCHCTaYxJVmxWiZ4j8LFpoLtQwEU+eh3OTEwksAmofwVkO/XGcyQJewlhajzUA3VfeHaPW1eu54IzR4WQhOWd/5JJ/P9BWbyvXR21Aygdnhz1Eu9kniEDvB8gAuveBeW2abjgUOxib6c3j43BYBZIa99Uxe+1OS5KIFKkbElSHxJHWxK/k5YxE2Yu4vv42IiBzC9TQ/RbrnVnRisoPzXGyJWpSv5GbRleenFUBOdcxtgxtzRgZmNxV1TQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nXn8IeKw; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nXn8IeKw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6jTf689Kz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 18:34:14 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S3ugMK004944;
	Wed, 28 May 2025 08:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=UTM5u1l2n0kAspKjldvPCAwdiqwUnt
	i0AqdYXhv4OyY=; b=nXn8IeKwSsnbto93bOvck9BDUzGNMoVQKLpmhRvOMs70e7
	gn5qZOr65atsT5YDaENZTgKkIsDMSPykZ16QvPD4bT7OQSfSwvl0ayplxBcZuwqH
	VErm3I+28PdEgqXHcvoyhBNsQ0yajpKcWsQpXm8YaJ9VbrJnWZikfIjXqxL7PfHL
	MZzwmCB9puEwE1MWUWSQ1TUcik1SNgjRDLZ3H9x2LNyleM2eQSvck3rwO0lEG0ZL
	th9q8SJtNy2/NBGwJ0FhKb/tHmGko37E5jNVxJthKIgFuQeY/GojvnXdMrcsktaS
	mQuGqw1P03Wo9D4F48dmnm/kePgF8RohzPbPJ9yA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3q8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:34:02 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54S8UfvY017974;
	Wed, 28 May 2025 08:34:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3q8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:34:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6Y0Vk028983;
	Wed, 28 May 2025 08:34:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usepxp48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:34:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54S8XwbA50528604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 08:33:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E09220043;
	Wed, 28 May 2025 08:33:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3682B20040;
	Wed, 28 May 2025 08:33:56 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.39.16.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 28 May 2025 08:33:56 +0000 (GMT)
Date: Wed, 28 May 2025 14:03:53 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, arnd@arndb.de, jk@ozlabs.org,
        segher@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Fixing typo in comment
Message-ID: <e564iytmzbbchj7cxbh6nxysnjh3akd4tixjdg46uvkryl6bnx@njjpjxeppct7>
References: <20250528080051.1351779-2-mchauras@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528080051.1351779-2-mchauras@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=IcmHWXqa c=1 sm=1 tr=0 ts=6836ca7a cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=iZhVWIIbJi_2OSwl4MUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3MyBTYWx0ZWRfXxXUU8eVrSeot B8+g6YU/mgrpkz3setWL/beWZy2ojs1Gy1YiPmoPy6KM/kBNQPcGg0NYm87HC6SQwhLrx9idpil WuBJaPIiemy4UoLlavqtqMhIgaFIo5BqiGsBxi5OGbBYZje2fo+v4I6eA0iw9S6s2DyVBVPjw/j
 a52lc7ED0+tiGBdgPprknHowD6a20lJhYOoJCCl5jVr9pmszkCXzk7f68pcvalrWhXRARaCuHBt z5T7jrnMKEZd0zFYigzJ4rXX1DqUMi5JLpamMT5NlKkQ/5O5Zuib+HmbeQrP6dnKv0qk3sKTX3M WWnesbL1icoPH0A3vDMyY09uchaHVfkcc9WjCVfzTrNal/kBgchfKkCup+AbkBvs84vIXPZqVCE
 WxJkpVYxkeLVgVwtfdhCugh0gDLdK1r8s8s8kLWfvkVMEY6Dv/khx64z1LyyXDa3Zqkp5r9o
X-Proofpoint-ORIG-GUID: VuMODfVn3SUMOJ3XoRcus3ysqe-89dE9
X-Proofpoint-GUID: lP-Zoj1lNRC1qbOl--l2mxzoRreFgaK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=577 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280073
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 28, 2025 at 01:30:52PM +0530, Mukesh Kumar Chaurasiya wrote:
> fixing a typo where iff is supposed to be if.
>
I just realized its if and only if. Please ignore.
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b7229430ca94..53667dc7fe1a 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -393,7 +393,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>  	.endif
>  
>  	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
> -	/* MSR[RI] is clear iff using SRR regs */
> +	/* MSR[RI] is clear if using SRR regs */
>  	.if IHSRR_IF_HVMODE
>  	BEGIN_FTR_SECTION
>  	xori	r10,r10,MSR_RI
> -- 
> 2.49.0
> 

