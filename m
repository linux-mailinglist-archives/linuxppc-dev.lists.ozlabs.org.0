Return-Path: <linuxppc-dev+bounces-2825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 595759BB0DF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 11:20:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhnXk6kC1z2xlF;
	Mon,  4 Nov 2024 21:20:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730715622;
	cv=none; b=EKWHcfFUn2131Jor7oBeBG52GzLdf51Y1ooV30QVn2Xa1Jf8K1/rdyZjkMMM+pYpaRFuSgCsQJPQNkoEEqaoURwEOtpBKZJ9Ouq4A5XmrRoVtGvnSrGekWWTOFP63as4xKTnWpyvYS8gnAt/xrhQLBpU3t929E1PgJkKNIDcnpekiajH0aQpMWpyc3lvot30LwLoFXAgihOYmaONYW+gOIDHgOfWMv+aByQ13KDfU4RvU4lDbVg1RsyCe5EpB99ViXdMLd+7AR2jB38apR2tqvFGx0DaQ+gDBa1/Xbuc67g3X2g5mDShMVUHeFm26jmlEynXXQujNkPC5WjXpU8f0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730715622; c=relaxed/relaxed;
	bh=4yJQOlituGl0KZ8FIC015MzBLIO26sftgwYss+ZSyWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+GL3uMeftG9YtoUDwPSHkJYsWtzdY5PrDorDFD09AYrnX+aTe3exk/6I/urBKQEvbP58rNIUO0Uz0JP6WfG9+gU7gQZ8C9WhdYgXaQfgusL9XOehs+L/q4sJuZ9gLBtL7qve8V3R4dcc6DQtgYBXPEjhUFI4xolYRrsshz1hpWXNoOtC2wqg98kD7LyfpTMiOv3u1IQl8tIVajrlvBxvvhEbZR4Q+ELDf72+0pwbdvqR4EUZhHU0RLVb026l/Qk83ZTK//+unQQusQ04Pl2SQk2Cg0PgGjFE08GRYhV6q6Xw1INdAwh+T8+fAk14PuLu+c0WxKYw3x3TXOc0tn7jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJMf/D/G; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJMf/D/G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhnXj0ZCZz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 21:20:20 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A48fC8U004961;
	Mon, 4 Nov 2024 10:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4yJQOl
	ituGl0KZ8FIC015MzBLIO26sftgwYss+ZSyWE=; b=TJMf/D/GOBt6NyX3Q9nc8r
	o9L6hh+Jio/ZX2vk/gVBHKGtCWPPfglxKlP7SVBOoMbOu305mVLBWPWx7GsYcvy1
	kxMht6XOZLG38dkqJkwn3nOWpj0vtKV85trYV/5VcCgHZoJsRxH09sWhGqb0MMOK
	h1IUNF+LqtDD+XvHnLFLSABapHW5KtLj5CSRZPvqZEidwyngzpm2bi2Qwr2OQjH5
	lQmiwoXGTpQlp9FJXR7WFykBpfurs71jcWZohchCOquZmXDMAd1bI7PsiBjXrNzb
	BGsW2oZethFjU1unj4QGPBuKH1xnSV8ilwpPd7nWUF/8OeE1q2JHHtyzfWraqeaA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ptyare7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 10:20:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Je1QU012237;
	Mon, 4 Nov 2024 10:20:12 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p140stwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 10:20:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A4AK8Ig22872426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 10:20:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E7DD2006A;
	Mon,  4 Nov 2024 10:20:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A196D20065;
	Mon,  4 Nov 2024 10:20:07 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 10:20:07 +0000 (GMT)
Message-ID: <b7350dd0-b835-42fe-8970-da5b0ce16ba6@linux.ibm.com>
Date: Mon, 4 Nov 2024 15:50:06 +0530
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
Subject: Re: [PATCH 2/2] fadump: reserve param area if below boot_mem_top
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
 <20241104083528.99520-2-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20241104083528.99520-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: laTJ3OyKxCNxQmlPA8ovs3q8uNEVW-V7
X-Proofpoint-ORIG-GUID: laTJ3OyKxCNxQmlPA8ovs3q8uNEVW-V7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040089
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 04/11/24 2:05 pm, Sourabh Jain wrote:
> The param area is a memory region where the kernel places additional
> command-line arguments for fadump kernel. Currently, the param memory
> area is reserved in fadump kernel if it is above boot_mem_top. However,
> it should be reserved if it is below boot_mem_top because the fadump
> kernel already reserves memory from boot_mem_top to the end of DRAM.
> 
> Currently, there is no impact from not reserving param memory if it is
> below boot_mem_top, as it is not used after the early boot phase of the
> fadump kernel. However, if this changes in the future, it could lead t
> issues in the fadump kernel.
> 

Looks good to me.

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kernel/fadump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4a3f80f42118..35a8a107e16b 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
>   	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
>   		return;
>   
> -	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
> +	if (fw_dump.param_area < fw_dump.boot_mem_top) {
>   		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
>   			pr_warn("WARNING: Can't use additional parameters area!\n");
>   			fw_dump.param_area = 0;


