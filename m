Return-Path: <linuxppc-dev+bounces-14719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8C8CB4D31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Dec 2025 06:55:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRhd45s27z2xqk;
	Thu, 11 Dec 2025 16:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765432504;
	cv=none; b=W4XKwlbdSwJJaJDCA2MGKvJwEtq54FNtXegpgLcq9w+DByFQNYgOUUTz+ljFbZA7mrboGSi3O20gTMxRd5qr2dNiOD4N2U7SPIlDKZTuxqOeZu1IhZ1K5k1UX1Cdj8969L9CTX7ox5vTLa5B2wpeuLu4xytUe0+WTxFNWBJfnSkYjk2ZpSNDXUmcu6jxhCUioQrTdGdHXY4kUdlN4QbWLJ2fvXEenh8gogJoEjM7q7OGzOKIYyiytPU4mMDfh/Iy/WgYYh0dxEE2pJFl/fZaO1NeLmRalY7zIlf7YeD5E+N0gbdgw+Pt8l0yFDE13g5HwHvoSij1HcIVB+wGvh1KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765432504; c=relaxed/relaxed;
	bh=LMbELXuBftN1quTm1rgpe0bYPKlNbJi6LCcRZurbO5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOGtzqynxhzuUfmFddxS2nUk15ea3dHIFeGpRRMFH+VoBzzzeNX7QBXicH8GZicH8JqCHeN8K2GLT88IvA/yWKHrsw4z2pVczoO5xO0a+9YpSr0XaWjAArEGF8enFVbpKZDYmSt4qI9HO+ljyaxsO1YQtyaXpW7pBLXXB39eQseJjvcFYU9nzyBCTze7DGM6jBbeI1sOh8/kbrj9D1Bd8WXJxWIbISBNrpKvdqIEYPswmcmVF32rUpMGqF9yvQ+uNQmC268RWOdi6AXBBhK6jeJR3bNzOpLAolf6/i+ICRu3SqH7Q3XGKCA0YZLo5zYAvSA825S8qnVVbfiIz27azA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qkm//Yco; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vineethr@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qkm//Yco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vineethr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRhd31wSkz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 16:55:02 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BANG5He017598;
	Thu, 11 Dec 2025 05:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LMbELX
	uBftN1quTm1rgpe0bYPKlNbJi6LCcRZurbO5A=; b=Qkm//Yco5z1KB/c6aWe+Em
	1tcm1sAdvdIBbLh5xZLDAxBusv0JsgJJQdFY9wstGqojIYMbWN8RHMrlWjGluylR
	RjK7TdPsWu3tpxwOxuNZlS2OfG1bZ8Ye5Odbr8HCFxUDJlLjmQRav+/3Fn+OhBuF
	YvQqa3uwjFXcQWyrTbDbADwPtr0Cql5U7P/CVUMJFHMKPGvGznUcqOFahV5geRBQ
	31xICEIoW127dViDYNosG9hewsdRT76ty0oPETQPs7XWwQfp0Ew1arnTEza6/zRi
	TiPn0bLsClAsCzzFlkMnWBo0UPnLjUCL/ijEpCif739LqSpX5bFMJ2i0WNWWDaSQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc7c63d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 05:54:49 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BB5lJER018820;
	Thu, 11 Dec 2025 05:54:48 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc7c63d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 05:54:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BB3T4O0028126;
	Thu, 11 Dec 2025 05:54:47 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6y4snr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 05:54:47 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BB5skqW25297536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Dec 2025 05:54:46 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1283858058;
	Thu, 11 Dec 2025 05:54:46 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F28558057;
	Thu, 11 Dec 2025 05:54:42 +0000 (GMT)
Received: from [9.43.18.7] (unknown [9.43.18.7])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Dec 2025 05:54:42 +0000 (GMT)
Message-ID: <669f74ac-1d98-4d41-9237-a6385747743f@linux.ibm.com>
Date: Thu, 11 Dec 2025 11:24:40 +0530
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
Subject: Re: [PATCH v2] powerpc/powernv: Enable cpuidle state detection for
 POWER11
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, linux-kernel@vger.kernel.org,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250908085123.216780-1-aboorvad@linux.ibm.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <20250908085123.216780-1-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jnC_VKT1a9macy0uIwB7NQCi-p6rRZM_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfXwTtm/W5pBTkr
 CqcMu3aZEG6xyDbovHzxsxYybCuGOGyEi+NG44p6NXTHOsqAv1liDWhu6oIWnGvsKNaZx2ycaWY
 +nIUDbBccZhR1ZiHcU/R6gEWbw8tdT6uFMDvNOezH2UbAzoCOuqD1KlcrRS1QLsR7Z0+/S+3Tjk
 wbB0zPYfRuT9xPoW2KOTKtPZocsCtbE9e7nIHkYWntjmoGFyDo6t6hzc5P/pFr99rHLPYNhXPG4
 Gi5+CycfzNVMU7EJ5xW+3mo/R7rXQAQuwV2fob9cOAISqDBK+YtMyMrne/7JMgZW3/ueWkT3YdQ
 XY2rVEPeLLq6unhq7zcDFUdhDUyVazPxLJLw1USEBRFAZRBSAezxWlokDvZ8NnqUYAKQj9L5ejr
 8Z5WduANTox1rrH2fMgXUp7aHPxlBQ==
X-Proofpoint-GUID: 90v__e-qCX7pkOQU0D8CJhrSvn10EN9t
X-Authority-Analysis: v=2.4 cv=FpwIPmrq c=1 sm=1 tr=0 ts=693a5ca9 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=jqgT-wbk1SVYo_tk4aEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 phishscore=0 clxscore=1011 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Aboorva,

On 08/09/25 14:21, Aboorva Devarajan wrote:
> Extend cpuidle state detection to POWER11 by updating the PVR check.
> This ensures POWER11 correctly recognizes supported stop states,
> similar to POWER9 and POWER10.
> 
> Without Patch: (Power11 - PowerNV systems)
> 
> CPUidle driver: powernv_idle
> CPUidle governor: menu
> analyzing CPU 927:
> 
> Number of idle states: 1
> Available idle states: snooze
> snooze:
> Flags/Description: snooze
> Latency: 0
> Usage: 251631
> Duration: 207497715900
> 
> --
> With Patch: (Power11 - PowerNV systems)
> 
> CPUidle driver: powernv_idle
> CPUidle governor: menu
> analyzing CPU 959:
> 
> Number of idle states: 4
> Available idle states: snooze stop0_lite stop0 stop3
> snooze:
> Flags/Description: snooze
> Latency: 0
> Usage: 2
> Duration: 33
> stop0_lite:
> Flags/Description: stop0_lite
> Latency: 1
> Usage: 1
> Duration: 52
> stop0:
> Flags/Description: stop0
> Latency: 10
> Usage: 13
> Duration: 1920
> stop3:
> Flags/Description: stop3
> Latency: 45
> Usage: 381
> Duration: 21638478

This patch enables correct recognition of P11 supported stop states.

Reviewed-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Tested-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>

Thanks,
Vineeth

> 
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> 
> ---
> 
> v1: https://lore.kernel.org/all/20250421070718.162783-1-aboorvad@linux.ibm.com/
> 
> v1 -> v2: Fixed overly permissive PVR version check as pointed out by
> Christophe.
> 
> ---
>  arch/powerpc/platforms/powernv/idle.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index d98b933e4984..e4f4e907f6e3 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1171,8 +1171,9 @@ static void __init pnv_arch300_idle_init(void)
>  	u64 max_residency_ns = 0;
>  	int i;
>  
> -	/* stop is not really architected, we only have p9,p10 drivers */
> -	if (!pvr_version_is(PVR_POWER10) && !pvr_version_is(PVR_POWER9))
> +	/* stop is not really architected, we only have p9,p10 and p11 drivers */
> +	if (!pvr_version_is(PVR_POWER9) && !pvr_version_is(PVR_POWER10) &&
> +		!pvr_version_is(PVR_POWER11))
>  		return;
>  
>  	/*
> @@ -1189,8 +1190,8 @@ static void __init pnv_arch300_idle_init(void)
>  		struct pnv_idle_states_t *state = &pnv_idle_states[i];
>  		u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
>  
> -		/* No deep loss driver implemented for POWER10 yet */
> -		if (pvr_version_is(PVR_POWER10) &&
> +		/* No deep loss driver implemented for POWER10 and POWER11 yet */
> +		if ((pvr_version_is(PVR_POWER10) || pvr_version_is(PVR_POWER11)) &&
>  				state->flags & (OPAL_PM_TIMEBASE_STOP|OPAL_PM_LOSE_FULL_CONTEXT))
>  			continue;
>  


