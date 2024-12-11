Return-Path: <linuxppc-dev+bounces-3980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B730F9ECBA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 13:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7Z3s3kyGz2ykf;
	Wed, 11 Dec 2024 23:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733918569;
	cv=none; b=H1FK67xDnJl+4opWkUm/7rse2g1zvjXpWFyjTy1PICcs62165kFJ608njoc8bCCRZdhUFcsWKRuY7dbk/vXXCPnsYGeBufMo7ALau/0NQyHYwWPPCfvkkLnFocp0+wIhSJ9OSl6aozwcugsd4HBeNHnG+CfWuyOGiqQce6maZeUPIvQxrTcjl3ZIe/0SMWmkgov7PECdBKnM3bCY7V72r8l3i/ohBhvX9sETIEq+NhA/URQWA48XG0gsOup7+41p5odiNsZyzQPEudKSM4wj0+0l0FXbhkvKkQOI8R7IJJEJyOAvU1sIS2wd3wmsZ3KweR/TMqmr8iCvkDxXrnf0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733918569; c=relaxed/relaxed;
	bh=3YcRWKxg1s7nYSdDzKaz4bSI+E2OJ91ZRGVWd8WWROA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWf5MZO2WVOXivLxZMm2zZwzX68Sslk5zFsniK2prM7vnGTnNS/a2ezYv5JpMovkePvZ1xYSQwQsA1y0O49K7Nhxzcp1QaBPiY3p22GmAq/ocSu4a9Z6EoQORNAlSFZ1uQ8SMD4MTXMj2p9nmAv+NNa14ZAC0ZOHM8RD2OjCLQlTQSunDIX5muNSw7nJfp4GZ0W4ZWvdKQz7foV8vT8ErnyobgxFaijIn08Wz/3ZHyVLHs9jOAmZlTg1XKcy4hLuvamhh23FniJrAefvvYZ0Uyet69CMie2VBFe4eQ30MLIdfH7lZwpVxpD3yX76PD7VZk+YVJ3HtxKA/0LTsMGRZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W9tArFSB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W9tArFSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7Z3r22Dqz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 23:02:47 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBC0Ucu005970;
	Wed, 11 Dec 2024 12:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3YcRWK
	xg1s7nYSdDzKaz4bSI+E2OJ91ZRGVWd8WWROA=; b=W9tArFSBILJRm1Gj9MZRJF
	ZjUB407XjUYczM+ravYd1EB9aflntIMoG0ykvWM48irOsHVYORVs8HQjgPULXA5X
	s8IEQ09PeP80N3MyE6pBB5WMH0RdLvPeTJPm2wXcHjR5TsHxL4cRzV0jSejMKieu
	h7rq8JvPl1Gxv34NKgQX27Yh3KWdWL10Pq0I6quRiMn2C/Op9intoWh6t3KlHrWW
	E5hvr634TEgULRBe8IsaOSP0nQe9taCtL49lKFO+JCrO11cAHas1df0c/ASVxBeR
	IhIHK9yEIi7xyt9tA7j+vsIgdLwj9n0KOIR3khC+bOV+BYa9PC3AvK5eZhTSF1WQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce1vw2dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 12:02:36 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BBBeeiK032543;
	Wed, 11 Dec 2024 12:02:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce1vw2df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 12:02:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8tT4n016944;
	Wed, 11 Dec 2024 12:02:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d12y9fas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 12:02:34 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BBC2V8R56754458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Dec 2024 12:02:31 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F330820043;
	Wed, 11 Dec 2024 12:02:30 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72A612004B;
	Wed, 11 Dec 2024 12:02:28 +0000 (GMT)
Received: from [9.43.88.53] (unknown [9.43.88.53])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Dec 2024 12:02:28 +0000 (GMT)
Message-ID: <2907ca2f-b973-42fd-ae03-99732dfda7a1@linux.ibm.com>
Date: Wed, 11 Dec 2024 17:32:27 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/perf/arch/powerpc: Add register mask for power11
 PVR in extended regs
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
References: <20241206135637.36166-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20241206135637.36166-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PWzkMmgLJu_lWuUEdCvWTYlogUkihnG3
X-Proofpoint-ORIG-GUID: O2jEXNPWBRJ0QuaUNiPyGvgMWWIqTpuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/6/24 19:26, Athira Rajeev wrote:
> Perf tools side uses extended mask to display the platform
> supported register names (with -I? option) to the user
> and also send this mask to the kernel to capture the extended registers
> as part of each sample. This mask value is decided based on
> the processor version ( from PVR ).
> 
> Add PVR value for power11 to enable capturing the extended regs
> as part of sample in power11.

Patch looks fine to me.

Reviewed-by: Kajol Jain <kjain@linux.ibm.com>


> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> 
>  tools/perf/arch/powerpc/util/perf_regs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
> index e8e6e6fc6f17..bd36cfd420a2 100644
> --- a/tools/perf/arch/powerpc/util/perf_regs.c
> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
> @@ -16,6 +16,7 @@
>  
>  #define PVR_POWER9		0x004E
>  #define PVR_POWER10		0x0080
> +#define PVR_POWER11		0x0082
>  
>  static const struct sample_reg sample_reg_masks[] = {
>  	SMPL_REG(r0, PERF_REG_POWERPC_R0),
> @@ -207,7 +208,7 @@ uint64_t arch__intr_reg_mask(void)
>  	version = (((mfspr(SPRN_PVR)) >>  16) & 0xFFFF);
>  	if (version == PVR_POWER9)
>  		extended_mask = PERF_REG_PMU_MASK_300;
> -	else if (version == PVR_POWER10)
> +	else if ((version == PVR_POWER10) || (version == PVR_POWER11))
>  		extended_mask = PERF_REG_PMU_MASK_31;
>  	else
>  		return mask;


