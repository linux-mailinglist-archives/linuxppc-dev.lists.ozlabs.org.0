Return-Path: <linuxppc-dev+bounces-207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10694957EDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 08:59:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0hJ6rJVz2y65;
	Tue, 20 Aug 2024 16:59:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JMSYU355;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0hJ3l4Mz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 16:59:44 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K5CZAn005691;
	Tue, 20 Aug 2024 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	WmlonqLv35QFxoAoTCyfWWZsPXxTWOZRBIQWAVtB2eM=; b=JMSYU355BB61dWVa
	jrhqSjan58zMNJ+rEXDi/PdUtT/01ShVUm8PkTV1rVATTnLoEAgtQ80Zq+4hAUG+
	Sux26IQjN0AL+Fd0Mq4f3qdLqm45kMnoBP13onJUnLRJQcdTxhZpMa6cQhtVaqmg
	8SOFV30YjvD8IJth9ugseVC/CLhRt+cKeyhyITDXYURVjKPLDaMjTnG8EiHNFfP8
	BGLi2B+1xGfuc/+g/FVV7N/pqlQv60EdrZknfs4NPCkDwVoS7N+YQPix4J//8b0N
	2QHFI5WMmjBcT+5buiVoFREG4hJwWFkcVvGUDu4K3i5XWDsvCKxljNsoX5IAeH38
	qm3X6A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mc4kx8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 06:59:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47K3S6Xf029225;
	Tue, 20 Aug 2024 06:59:39 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4138dm9fgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 06:59:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47K6xXuO54002016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 06:59:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FCC92004B;
	Tue, 20 Aug 2024 06:59:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A787420040;
	Tue, 20 Aug 2024 06:59:32 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Aug 2024 06:59:32 +0000 (GMT)
Message-ID: <7298fbe0-5f1d-4933-b766-a4bd0fc05735@linux.ibm.com>
Date: Tue, 20 Aug 2024 12:29:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] powerpc/64: Convert patch_instruction() to
 patch_u32()
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Naveen N Rao <naveen@kernel.org>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
 <20240515024445.236364-4-bgray@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20240515024445.236364-4-bgray@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -6ZmMqwQVbUgQ2yvgx_c1xwbH-taoEp8
X-Proofpoint-GUID: -6ZmMqwQVbUgQ2yvgx_c1xwbH-taoEp8
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200048



On 15/05/24 8:14 am, Benjamin Gray wrote:
> This use of patch_instruction() is working on 32 bit data, and can fail
> if the data looks like a prefixed instruction and the extra write
> crosses a page boundary. Use patch_u32() to fix the write size.
> 
> Fixes: 8734b41b3efe ("powerpc/module_64: Fix livepatching for RO modules")
> Link: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Tested-by: Hari Bathini <hbathini@linux.ibm.com>

> 
> ---
> 
> v2: * Added the fixes tag, it seems appropriate even if the subject does
>        mention a more robust solution being required.
> 
> patch_u64() should be more efficient, but judging from the bug report
> it doesn't seem like the data is doubleword aligned.
> ---
>   arch/powerpc/kernel/module_64.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 7112adc597a8..e9bab599d0c2 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -651,12 +651,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
>   	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
>   	desc = func_desc(addr);
>   	for (i = 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
> -		if (patch_instruction(((u32 *)&entry->funcdata) + i,
> -				      ppc_inst(((u32 *)(&desc))[i])))
> +		if (patch_u32(((u32 *)&entry->funcdata) + i, ((u32 *)&desc)[i]))
>   			return 0;
>   	}
>   
> -	if (patch_instruction(&entry->magic, ppc_inst(STUB_MAGIC)))
> +	if (patch_u32(&entry->magic, STUB_MAGIC))
>   		return 0;
>   
>   	return 1;

