Return-Path: <linuxppc-dev+bounces-3823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22D9E54EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 13:05:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3tPt0wjvz2yXs;
	Thu,  5 Dec 2024 23:05:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733400338;
	cv=none; b=T0AMk7jeTMuMQ1NaHh/NohYb3wJhM+1jsvrwPKLS4+HTJHVAulnDLGVN1NH25s6s/s0xcn6+lB2DqLLEF/F1+wXnEbjROZ7zW55JTyDRU169eq5CIznQ4hrWRCoSLH+yJG889il4JjUNaLIExGnK2uC/17gxJGV/2BgRIKNjsmJ8Rk58dW9V1rY5sfbuAFHOfLYl0jWSXXLVJ1JwIQLyM4nsJM9EVnYsb99zIX9GYQ5kcOrx8sUEfE0OUfr6KHVZvd/UgTivcX2Ugl4B7MDN32TESI2MgeCkULb0yA+pMW1rGk5xk158m9jVKXrPRjvAR5QCvn/gDJStb+ypK/xNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733400338; c=relaxed/relaxed;
	bh=fF4Em2qqTQhrSh0+Uaync3DssxHt2zxBa0nKSi4/6Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9uMyNsNO8jxi8Thi3850b+UrKGUBJAFyDQ/BGU5+NThdtsU+D6G6u0tGO0h/+MpYicR/FQaWtZlAyb45EDczV4qy/+N1nYUB1nX4hp3fWUJNPSpOxG/hKdt81DNBVaUzU9pzHmPyXjbTORWLMlDRxX6+8ChBWztmoA+jrcOZiPhEqxTxe0fSsksn9SoMgRbq0jtzaAFTJZt3wF2Gvk7NmoHT+sKnJDdVDQsYxGkIpZR3HLQNMVBok8gd+agvghIwwZRPgnF2PjO2SrLKS+UsgI6s1e/pmtWupPKd4w09vbCV1gZn9UL+lYMUB66AgzQbdQo2w+g4a1ylJTSjgw1PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fkvsOYXG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fkvsOYXG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3tPr69YRz2yNJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 23:05:35 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5A0Qse028468;
	Thu, 5 Dec 2024 12:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fF4Em2
	qqTQhrSh0+Uaync3DssxHt2zxBa0nKSi4/6Sg=; b=fkvsOYXGgDOdkXFXHAgGxk
	I27oYzUfE/01npey8AMlR9YmQiy8kKZuD9bPjiJ0Kot3uHcBrLIp/RbsplMBP30A
	Bsj4rqQezznWVLVxG4d0CqecWwocSEgFSLPcEJr0h56bjn24odq75j6tziLBdOTv
	eaCcFWOLJqvWfnyG/Ypud2/W9kikuL5DvvDctoKTwAbGqGeECk5lUgRUQPeHbf+/
	65VJAenQDoYcQTbgzKXDbC00FQGb1k3dkrcBj7GMpHruFqPDwVzdj9Bte4rulTTs
	s09DdFDJZYg8cWOKiEjjOjNdDXeE7W4rCsmxvks5r1QbBFgUS/je5K08MFjE1SUw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ax65up2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 12:05:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B596QYe031728;
	Thu, 5 Dec 2024 12:05:25 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438ehm5qvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 12:05:25 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B5C5MHX22741590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 12:05:22 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CFB35805D;
	Thu,  5 Dec 2024 12:05:22 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C6375805C;
	Thu,  5 Dec 2024 12:05:18 +0000 (GMT)
Received: from [9.43.89.208] (unknown [9.43.89.208])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Dec 2024 12:05:17 +0000 (GMT)
Message-ID: <91887947-de4a-40d7-a02d-85e04c5da549@linux.ibm.com>
Date: Thu, 5 Dec 2024 17:35:15 +0530
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
Subject: Re: [PATCH] powerpc: increase MIN RMA size for CAS negotiation
To: Avnish Chouhan <avnish@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, brking@linux.ibm.com, meghanaprakash@in.ibm.com,
        sourabhjain@linux.ibm.com
References: <20241205101045.27069-1-avnish@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20241205101045.27069-1-avnish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vsssPiLTrVC6tfIucKfvynzijoiQXkCD
X-Proofpoint-GUID: vsssPiLTrVC6tfIucKfvynzijoiQXkCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412050087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/5/24 3:40 PM, Avnish Chouhan wrote:
> Change RMA size from 512 MB to 768 MB which will result 
> in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
> Secure Boot or FADump, the 512 MB RMA memory is not sufficient for 
> booting. With this 512 MB RMA, GRUB2 run out of memory and unable to 
> load the necessary. Sometimes even usage of CDROM which requires more
> memory for installation along with the options mentioned above troubles
> the boot memory and result in boot failures. Increasing the RMA size 
> will resolves multiple out of memory issues observed in PowerPC. 

Can you add more on the failure details here list a stack trace or dump,
also is there a selftest to verify the fix in qemu or lpar?

> 
> 
> Signed-off-by: Avnish Chouhan <avnish@linux.ibm.com>
> ---
>  arch/powerpc/kernel/prom_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index fbb68fc28ed3..c42fd5a826c0 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1061,7 +1061,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
>  		.virt_base = cpu_to_be32(0xffffffff),
>  		.virt_size = cpu_to_be32(0xffffffff),
>  		.load_base = cpu_to_be32(0xffffffff),
> -		.min_rma = cpu_to_be32(512),		/* 512MB min RMA */
> +		.min_rma = cpu_to_be32(768),		/* 768MB min RMA */
>  		.min_load = cpu_to_be32(0xffffffff),	/* full client load */
>  		.min_rma_percent = 0,	/* min RMA percentage of total RAM */
>  		.max_pft_size = 48,	/* max log_2(hash table size) */


