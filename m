Return-Path: <linuxppc-dev+bounces-14730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4183CB861C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Dec 2025 10:09:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSNvK261Vz2y8c;
	Fri, 12 Dec 2025 20:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765530589;
	cv=none; b=eVWXf/TBdQrzvuT0tcHm58GlkC7RWzk/KESg/sYUtAogieadS4lbdSbQf3FKCCjL1v1miU2qidMiqC6qEU3ACEm56f/90YgpoPSj7Dn60wT4K+z10WvOeee9jrjq1qhDx0r0gxX1ORTrUq4yC8zutSmLS1zDoEVxX3yI+5bOy/wFZ3AnpMNdukY8iAI9bb/syed18IcT1K/9nvwoHxNY4/J5mOFzK9m3bYtpXsbY0XbBNs3yKsHoa02mD2IEC6fGwc+KVKqKdQiY/Am6oGpTYe6f1fabJTrqWwCGtyxJD4DuUs806bBefaRaP4l9u2qO4kZue9Q9oS7lhM2IbHF9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765530589; c=relaxed/relaxed;
	bh=t1QiSp7njpa9LIS0kfygvZ9xPaW/lZ3xAfCyBKJyuP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOd5T5G7cuJnElp0xluk1eI4e2Yk1Xoc2hLQL5osE/GV4iZ48UUvbf1OdnJAtBg5Q4ORvhbC8Ig/OLQxuoMZwfn0ANt19qiOvehQ74jh5pkFpaWKGOfapjnNWB7v9yt8iTuDeG0hvv7b0RwZ6aYw3AWEPwJu8fajAFj2kZZpxYbVX26PCQAEdsB4sPxIcPyI/X+nx0IqIfnFGbpYioMEojEHcJ7CvVbiH6zpEJAvajjFqO2/DgqTuqWNCYqMYcgg6kwjfBhkKLG4jOstYW3daV5ZEhyDrvjNWTX0aDTXYIw7RJ11fiVT/oSvTX4liDPOI1UUKOWVm1ajybCTBGvUNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Co7Jz1Fi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Co7Jz1Fi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSNvH3yhBz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 20:09:47 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBNmgLv023046;
	Fri, 12 Dec 2025 09:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=t1QiSp
	7njpa9LIS0kfygvZ9xPaW/lZ3xAfCyBKJyuP8=; b=Co7Jz1FiSbXnGKsIqcgJbp
	1iU6AHLBCUG3e/MAdj/p30R0NVBv/wv+2X/ouRTAofZGV86eX4+8KjM3bEADCsP6
	+KvyIznYkONtwg0dkzKrh37R6inO08X3dH0O+PXQ9VBlgXmao1RTHef/W/szP6/B
	YKN4Y/FHbCKIF3zcQMq2ScGwxLLFGVeO9Uoe4PaS/sgOvNsjaV3EshFhCIaMbAM9
	+8FHxTnr7ac0LMUR7Crhm+VFVkei7ItG4pEUDQo9bzKjzR6CLDkBb9apeDqGFpS1
	DDregj3cTyomi8VmUccg6PYoTvXIVXBS64WEPlknTp3u/Xtar/HqwdVSDYrIBBxw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc53umfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 09:09:34 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BC99YRu022774;
	Fri, 12 Dec 2025 09:09:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc53umfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 09:09:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC5wlfc028123;
	Fri, 12 Dec 2025 09:09:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6yb6hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 09:09:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BC99T9l12517740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Dec 2025 09:09:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F52F2004D;
	Fri, 12 Dec 2025 09:09:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CA4E20040;
	Fri, 12 Dec 2025 09:09:25 +0000 (GMT)
Received: from [9.124.208.61] (unknown [9.124.208.61])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Dec 2025 09:09:25 +0000 (GMT)
Message-ID: <b071cc87-18de-41ad-a142-63a8e852cc25@linux.ibm.com>
Date: Fri, 12 Dec 2025 14:39:22 +0530
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
Subject: Re: [PATCH 1/4] powerpc/rtas: Handle special return format for
 RTAS_FN_IBM_OPEN_ERRINJCT
To: Narayana Murty N <nnmlinux@linux.ibm.com>, mahesh@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
        gregkh@linuxfoundation.org, oohall@gmail.com, npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, vaibhav@linux.ibm.com, sbhat@linux.ibm.com,
        ganeshgr@linux.ibm.com
References: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
 <20251205094510.4671-2-nnmlinux@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251205094510.4671-2-nnmlinux@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX8lEFbAi2wU+F
 eryK2WYEdRWtjU/S+f26YVFcmfj7ZhlnZrQpJJ03LiurYzLJA8WsdB4Sdr2NU/SoBSw6UqMfvAk
 KQY3UyzXIB51+AvU02jQsF1k1wGnkHIYjnbCnsHYjY/+qPlrE5nTUYL68LvxvQjN33gO7/5pt7k
 GjM/1p2TjWkvocnKOcxWkOLTwNz/A/+NXusPfruU7b20STWujMCYpOZlUlhTiFwYeWkTivfxa6M
 jng0F7hyoeNlCITdtBW83j8tRtsVGZrmH/DSJ9HGYHyCEoilbZQE7bxORCE73t5MvvA7f1XJWYZ
 sqQmHrqisyNBNegvWnrQZPWtyWhnNGCAV6hAtmOlDvI1O3vHLOyCaqvyXvKleQYeo3ChS1PA4wN
 UQWup3694iPSTlCWyHEmtNjp0t5JWg==
X-Authority-Analysis: v=2.4 cv=S/DUAYsP c=1 sm=1 tr=0 ts=693bdbce cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1mVJ_uiqAAAA:8 a=VnNF1IyMAAAA:8 a=wuzzdS_Pp81vOozeCfcA:9 a=QEXdDO2ut3YA:10
 a=h67g7WpEjx8dfGT80pje:22
X-Proofpoint-ORIG-GUID: uNwl2orSMHX32CqJd60F3qms68BuM2yR
X-Proofpoint-GUID: mBIcHnJxZiC0ysyunJILagbug3kBFLB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_02,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 05/12/25 15:15, Narayana Murty N wrote:
> RTAS_FN_IBM_OPEN_ERRINJCT returns results in special format:
>    rets[0] = session token (output)
>    rets[1] = status code
>    rets[2..] = additional outputs (if any)
>
> Unlike standard RTAS calls where:
>    rets[0] = status code
>    rets[1..] = outputs
>
> This patch adds special handling for OPEN_ERRINJCT to:
> 1. Check correct status position (rets[1]) for __fetch_rtas_last_error()
> 2. Copy all rets[0..nret-1] to outputs[] (including token at rets[0])
> 3. Return status from rets[1] instead of rets[0]
>
> Reference: OpenPOWER PAPR documentation
> 	   https://files.openpower.foundation/s/XFgfMaqLMD5Bcm8
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>   arch/powerpc/kernel/rtas.c | 30 ++++++++++++++++++++++++------
>   1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 8d81c1e7a8db..04c8438aadda 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1183,7 +1183,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>   	unsigned long flags;
>   	struct rtas_args *args;
>   	char *buff_copy = NULL;
> -	int ret;
> +	int ret = 0;
>   
>   	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
>   		return -1;
> @@ -1213,15 +1213,33 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>   	va_rtas_call_unlocked(args, token, nargs, nret, list);
>   	va_end(list);
>   
> +	/* Special handling for RTAS_FN_IBM_OPEN_ERRINJCT for error fetching */

It would be more helpful if we explain why special handling is needed.


>   	/* A -1 return code indicates that the last command couldn't
>   	   be completed due to a hardware error. */
> -	if (be32_to_cpu(args->rets[0]) == -1)
> +

The above empty line can be avoided.

> +	if (token == rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT) && nret > 1)
> +		ret = be32_to_cpu(args->rets[1]);
> +	else if (nret > 0)
> +		ret = be32_to_cpu(args->rets[0]);
> +
> +	if (ret == -1)It would be more helpful if we explain why special handling is needed.
>
>   		buff_copy = __fetch_rtas_last_error(NULL);
>   
> -	if (nret > 1 && outputs != NULL)
> -		for (i = 0; i < nret-1; ++i)
> -			outputs[i] = be32_to_cpu(args->rets[i + 1]);
> -	ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
> +	/* Handle outputs and return status */

Return status is already handled above, isn't it?

> +	if (nret > 1 && outputs != NULL) {
> +		if (token == rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT)) {
> +			/* Special case: rets[0]=token, rets[1]=status, rets[2..]=outputs */
> +			for (i = 0; i < nret; ++i)
> +				outputs[i] = be32_to_cpu(args->rets[i]);
> +		} else {
> +			/* Normal case: rets[0]=status, rets[1..]=outputs */
> +			for (i = 0; i < nret - 1; ++i)
> +				outputs[i] = be32_to_cpu(args->rets[i + 1]);
> +		}
> +	} else {
> +		/* No outputs: just ret is status */
> +		ret = (nret > 0) ? be32_to_cpu(args->rets[0]) : 0;
> +	}

Do we really need to calculated the ret again here?

>   
>   	lockdep_unpin_lock(&rtas_lock, cookie);
>   	raw_spin_unlock_irqrestore(&rtas_lock, flags);

- Sourabh Jain

