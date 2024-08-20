Return-Path: <linuxppc-dev+bounces-209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A1957EE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 09:00:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0jg1mWnz2y8Z;
	Tue, 20 Aug 2024 17:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=elEq6FIx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0jf6Cw2z2xfP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 17:00:54 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K5g057004943;
	Tue, 20 Aug 2024 07:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=n
	C5OpKtfsNBqR9mFIASP99oLnxV15mkbMVoTQ7jRjTc=; b=elEq6FIx4FbR1+tLG
	aNWCCSv9Z+XKhqXvFr7srDq2tVjiAvIF3R18eHsm/2Jgpu0573b31dVzmStzHwWY
	ssYfWPJxUd2w4QQGn+lw/GlyE80KyBwaYvJDS3JQn90yNUmzo0iroFYk0IlXde+m
	m5xNf7P/HdbVqsxPEBC78NIyWWZWKIHwBP4+7g0zLf8Yxf90vKe7EKb8Mp9/08KA
	TVooG+72hrA/yoOVd2pEQSicCUXIMqMBy8IcCPjCOwJppqbd6fWdob18j310rljZ
	dNnNUfXcfhECSokwOU6QKCMcEYmwPSdXcWRKbktmLGF40cu1G6BRrm6NBtfiVsQx
	cQiig==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412ma04eka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:00:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47K606V6013097;
	Tue, 20 Aug 2024 07:00:49 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41366u1x4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 07:00:49 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47K70i0x54198596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 07:00:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 693212004B;
	Tue, 20 Aug 2024 07:00:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F41D20040;
	Tue, 20 Aug 2024 07:00:43 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Aug 2024 07:00:43 +0000 (GMT)
Message-ID: <23d62b29-a23a-4b71-b91c-250365c3636f@linux.ibm.com>
Date: Tue, 20 Aug 2024 12:30:42 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] powerpc/code-patching: Add boot selftest for data
 patching
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Naveen N Rao <naveen@kernel.org>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
 <20240515024445.236364-6-bgray@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240515024445.236364-6-bgray@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SLfuyOatRUxClEpAw8w_a0OhfLL75wP4
X-Proofpoint-ORIG-GUID: SLfuyOatRUxClEpAw8w_a0OhfLL75wP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200048



On 15/05/24 8:14 am, Benjamin Gray wrote:
> Extend the code patching selftests with some basic coverage of the new
> data patching variants too.
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> 
> ---
> 
> v4: * Change store to a check
>      * Account for doubleword alignment
> v3: * New in v3
> ---
>   arch/powerpc/lib/test-code-patching.c | 41 +++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/arch/powerpc/lib/test-code-patching.c b/arch/powerpc/lib/test-code-patching.c
> index f76030087f98..8cd3b32f805b 100644
> --- a/arch/powerpc/lib/test-code-patching.c
> +++ b/arch/powerpc/lib/test-code-patching.c
> @@ -438,6 +438,46 @@ static void __init test_multi_instruction_patching(void)
>   	vfree(buf);
>   }
>   
> +static void __init test_data_patching(void)
> +{
> +	void *buf;
> +	u32 *addr32;
> +
> +	buf = vzalloc(PAGE_SIZE);
> +	check(buf);
> +	if (!buf)
> +		return;
> +
> +	addr32 = buf + 128;
> +
> +	addr32[1] = 0xA0A1A2A3;
> +	addr32[2] = 0xB0B1B2B3;
> +
> +	check(!patch_uint(&addr32[1], 0xC0C1C2C3));
> +
> +	check(addr32[0] == 0);
> +	check(addr32[1] == 0xC0C1C2C3);
> +	check(addr32[2] == 0xB0B1B2B3);
> +	check(addr32[3] == 0);
> +
> +	/* Unaligned patch_ulong() should fail */
> +	if (IS_ENABLED(CONFIG_PPC64))
> +		check(patch_ulong(&addr32[1], 0xD0D1D2D3) == -EINVAL);
> +
> +	check(!patch_ulong(&addr32[2], 0xD0D1D2D3));
> +
> +	check(addr32[0] == 0);
> +	check(addr32[1] == 0xC0C1C2C3);
> +	check(*(unsigned long *)(&addr32[2]) == 0xD0D1D2D3);
> +
> +	if (!IS_ENABLED(CONFIG_PPC64))
> +		check(addr32[3] == 0);
> +
> +	check(addr32[4] == 0);
> +
> +	vfree(buf);
> +}
> +
>   static int __init test_code_patching(void)
>   {
>   	pr_info("Running code patching self-tests ...\n");
> @@ -448,6 +488,7 @@ static int __init test_code_patching(void)
>   	test_translate_branch();
>   	test_prefixed_patching();
>   	test_multi_instruction_patching();
> +	test_data_patching();
>   
>   	return 0;
>   }

