Return-Path: <linuxppc-dev+bounces-8192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C09AA5018
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 17:22:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zngsx5Cl2z2ytV;
	Thu,  1 May 2025 01:22:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746026565;
	cv=none; b=BO8cZGn6cCstxGqyxo0LanKY0hunCKx+mKyQStbw6YsXu0qJid059pQ1uJC2KeqLMjWwMk9TJUS91zlxkS1GDjsNB0Z9y/AksyBYVQJqUcYCOkU77UnqWNjRpSlWKz1O/h0utsGoM1aNlY+4OztAupmeZMCfZE5XPr3ntUmG23Dz+qE94x4F20TOyqW+8QwR59eZ8UU6R96vtybT9ayhJGWBHkZSe5CL+Y9znB/ig/zt/KC1ijvkAHPANRoRnSKHRkwsGOutAqwuEtb0zY8jt2W10MMewKq7Xh86dNDIFwyu5ww5AQZ2kTh2Fp0cD9F1BveQpLtpyOIPba6gjV3kRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746026565; c=relaxed/relaxed;
	bh=qel6dCz7U0QSLGwxwhtVvAr2kR+Adu0rEYWSsIjsTbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7FBVG+rg8aFM+6hsJ7ynjLwIEUuo+0F/lbCUTmnp94SdKmwnEoFjwPTMAQr2zi9bA3vS3iUDHjFla2JJVrTIx+1kxGszSbMhE7/H6x9rMKiHB5tbhCCa2o8ioM3DtLIn9cd69CFDKCEC8dUb01o7GFw20x+uKz32MJantdyYMIi8+SbrIWPp6Vg/Pxv/dSw6Obgf4kdtCf0eY9Z4ttTGcpmchib88cetBMtuoJauKsMHNUVH7jg7A1EO4QeWgEnjmN1wkwj9rMGAgumiEuCf1H0ocgmKfYPN/HMWIRo8zwQ7N8XqyXpX4bPPhor/oYEyIPbouFc11b/p4j4bIEeFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PIq+/w3v; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PIq+/w3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zngsx0BMmz2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 01:22:44 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UA4D8s006429;
	Wed, 30 Apr 2025 15:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qel6dC
	z7U0QSLGwxwhtVvAr2kR+Adu0rEYWSsIjsTbY=; b=PIq+/w3vZHiC7BGoySnV6C
	DhbHM0/dBCx11uXLIuoiv30NxQSkggFk4G/9mo9Iv3jTVFos6007a8Bik67GuZa6
	pda98LoS+ZRpukf9nR/URjcMZ1ovs2K5tMdjaoYQbl4Bpxur4KU0mnL0HnE//ssI
	eYhKz7fpJqAYWEQ4zcw78jG7vmPaNk84i9PV8FiaVS1mQIsJlhwxxx9Mf5+7bn/E
	X6yspfsCVZnDILFbGULYelC+1dGcLSOXxn/1Qn/MNMq3dQEFy29Ol3ObXBHz1wzi
	wDDUpKSQ8FxBmrP/Cd9Zq7UftO0n5EkYeR61vUqMFqmkvKjwfJJkNEkvlB7m0IOA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjsh9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 15:22:34 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53UFM9gS025898;
	Wed, 30 Apr 2025 15:22:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjsh9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 15:22:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53UE72aJ024679;
	Wed, 30 Apr 2025 15:22:32 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1m86ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 15:22:32 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53UFMVMw19268028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 15:22:31 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1562558061;
	Wed, 30 Apr 2025 15:22:31 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F19EE58054;
	Wed, 30 Apr 2025 15:22:29 +0000 (GMT)
Received: from [9.61.140.105] (unknown [9.61.140.105])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 15:22:29 +0000 (GMT)
Message-ID: <135ceca8-e98a-407f-a301-8b4720c8e8f0@linux.ibm.com>
Date: Wed, 30 Apr 2025 11:22:29 -0400
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] integrity/platform_certs: Allow loading of keys in
 static key management mode
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
 <20250430090350.30023-4-ssrish@linux.ibm.com>
Content-Language: en-US
From: Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <20250430090350.30023-4-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dcuA3WXe c=1 sm=1 tr=0 ts=6812403a cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=KmA9UCYRVGLAr49MUM8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bxiKuflN9motG-j3lwDGZK_NwY8jAYZ0
X-Proofpoint-ORIG-GUID: 1VHetqsTmLpayLE2wP_W6Ed7bBU9fglq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwNyBTYWx0ZWRfX35Mo87z6GspG lfncH6zxnv3JpMWNydyqlW3vKBQ0Vx4cY/mq/qcTajHJyzD4BdFvzdPNBqzK79v23YcpoV2U4Rl mGf7jLUCqEEEeWK9DzgzSpkPNYoXwjOIH8gNzzUJ9WZV4N/8yhH93lbrXVkt6YZsYJz4TRGrQSc
 xjph8xt61b/B8+tDGgQToDw2CWGt5KREpaT1kcA3mLwvREgTjrhEt+O3WXF+GjJwpSnmDw2RHJk MCJaOMN/tIRTG8v+olfCbRkY0L1lCZ7/K8QpZVLwyWcdqvx1IqpOE/gMZvJs1o00G0gtwcK7LGD UBd0DvCcUcZlBOLyKhWgofQg4cPNMNfXtceezskgApRbSsvC+709C7V8OjGi00QJBAYuSnKpjlW
 85hA25azAv+WoYb7o99bvd0Ok91r07otbKmD0pBZll7SXvijrBzW1Tjy/lbOobOXdi7DU/xB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300107
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 4/30/25 5:03 AM, Srish Srinivasan wrote:
> On PLPKS enabled PowerVM LPAR, there is no provision to load signed
> third-party kernel modules when the key management mode is static. This
> is because keys from secure boot secvars are only loaded when the key
> management mode is dynamic.
>
> Allow loading of the trustedcadb and moduledb keys even in the static
> key management mode, where the secvar format string takes the form
> "ibm,plpks-sb-v0".

Reviewed-by: Nayna Jain <nayna@linux.ibm.com>

Thanks & Regards,
    - Nayna

>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   security/integrity/platform_certs/load_powerpc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
> index c85febca3343..714c961a00f5 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -75,12 +75,13 @@ static int __init load_powerpc_certs(void)
>   		return -ENODEV;
>   
>   	// Check for known secure boot implementations from OPAL or PLPKS
> -	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf)) {
> +	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf) &&
> +	    strcmp("ibm,plpks-sb-v0", buf)) {
>   		pr_err("Unsupported secvar implementation \"%s\", not loading certs\n", buf);
>   		return -ENODEV;
>   	}
>   
> -	if (strcmp("ibm,plpks-sb-v1", buf) == 0)
> +	if (strcmp("ibm,plpks-sb-v1", buf) == 0 || strcmp("ibm,plpks-sb-v0", buf) == 0)
>   		/* PLPKS authenticated variables ESL data is prefixed with 8 bytes of timestamp */
>   		offset = 8;
>   

