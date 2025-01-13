Return-Path: <linuxppc-dev+bounces-5152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A0A0B79B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 14:01:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWspP3q3jz308V;
	Tue, 14 Jan 2025 00:01:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736773293;
	cv=none; b=CpiCaRA9jBbp9x8o58BJhBZekb9dco8RIxAflyyO8nBV8BPXvXaSI7GIE0vJtTdPqqj1dBZacoN1tTECkOdpumxwA0s05C1UGXx7WSxnzvi32EnX9RFD5Pm9TsEetcssRtKVw6n4MoEk5pNJi82ak/1BAruE9bcfvhxyX0aol8nS5HeDzBxreTMMq+sgiqnwPymYI5EUuXYQ6mxrp1rQPEbrOIDVawfpV5T/wzT8Q+fZbVv8pl+jsS+obPH9aDRIvgX3+MfDQjK5jCkAdiWKyRvFyEjgM8E+rPnZ25hwbhkq4GLT75hp6UIE9Q/2u/lx68yO2UDi0cjSTKfYdYfAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736773293; c=relaxed/relaxed;
	bh=OdBOo0sVTlugXUHBN4ZAo1wbIC47mnWk4UiI5g0/XBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNpE4B858IzFcMFOq1sTfGVhTotzPvtiGUGhLpD3PnkD0i2H4DlxOULVo9kAyXWefr36OvBm5uJGL5beu6EcDk67cLviAYLzMSS7SnsDA2JXevuImXczXiYBHw2xkx+7C+vNJt/O20ovnP2XSVlUBfrIf28ZECh4v1ojanaM0Bj6nGFXxdl8yPrT7VSO3oeQL0+AwCQvRtYWcVL4Q62eP13aSKFrKmjMWKfxFIgqDJPaGn4ugRqo3/pDkaehJy6eWYe1imvl+0ipA+wFYrRMY7CFevLNJBdSvyY6V2hp4iCRK30pNBWYrpKTp9z/3OCdW2V8leCpZYHVQ3Q5JUxbZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=He36DaFS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=He36DaFS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWspN2tFNz305n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 00:01:31 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3qqsB002387;
	Mon, 13 Jan 2025 13:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=OdBOo0
	sVTlugXUHBN4ZAo1wbIC47mnWk4UiI5g0/XBQ=; b=He36DaFSL9yh9K9uNnlwZx
	yrf02crvIrGqFj7zDnxnia2V5PR2+YJ8oCxknei8ibBTGXHTagmr7TSUYH2QX1Ki
	VBv2kPdXnWtm6dEDDJeVlyfTH0S4NlFCdz6cAlScNNwxeXQzyk5fno+Avt9p4qqO
	gNssKD/wJCvGapUIlmW99aXkbtN9AYcOezLNL6v6u/xLFxCWO+NRK0Eylpt5wt7a
	SK0xrb0xJF88dcT+pRCaD44LfNtOtujQylLwBgipfwKMT5792YmUE7XWu3/qHTHy
	a+qIJkCES5gJE8df+zlcFYNCAffc2+VQp9PUbGclG7Fn2uJmQOWQzrELoCjVM25Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uagt0tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 13:01:04 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50DCkbdp028905;
	Mon, 13 Jan 2025 13:01:03 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444uagt0tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 13:01:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DC1TNI002734;
	Mon, 13 Jan 2025 13:01:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443bxxb0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 13:01:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DD0wxI65012118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 13:00:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1E5420043;
	Mon, 13 Jan 2025 13:00:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB95020040;
	Mon, 13 Jan 2025 13:00:54 +0000 (GMT)
Received: from [9.43.28.240] (unknown [9.43.28.240])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 13:00:54 +0000 (GMT)
Message-ID: <47c96e26-4b2f-444d-98c8-9855013870c7@linux.ibm.com>
Date: Mon, 13 Jan 2025 18:30:53 +0530
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
Subject: Re: [PATCH] fadump: Use str_yes_no() helper in fadump_show_config()
To: Thorsten Blum <thorsten.blum@linux.dev>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20241230214142.952706-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20241230214142.952706-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uJIANtv1dLC1yjA6ujw7a57JQUfl7zdo
X-Proofpoint-GUID: q6QovXDeaaUyqiDXMoJeEWmRvmrXZHP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130109
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org




On 31/12/24 03:11, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   arch/powerpc/kernel/fadump.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..8c531533dd3e 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -289,10 +289,8 @@ static void __init fadump_show_config(void)
>   	if (!fw_dump.fadump_supported)
>   		return;
>   
> -	pr_debug("Fadump enabled    : %s\n",
> -				(fw_dump.fadump_enabled ? "yes" : "no"));
> -	pr_debug("Dump Active       : %s\n",
> -				(fw_dump.dump_active ? "yes" : "no"));
> +	pr_debug("Fadump enabled    : %s\n", str_yes_no(fw_dump.fadump_enabled));
> +	pr_debug("Dump Active       : %s\n", str_yes_no(fw_dump.dump_active));
>   	pr_debug("Dump section sizes:\n");
>   	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
>   	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);

Yes, it is better to use `str_yes_no()` instead of hard-coded strings.

I have also tested your patch, and everything is working fine.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Thanks,
Sourabh Jain

