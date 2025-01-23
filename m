Return-Path: <linuxppc-dev+bounces-5494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CFA1A168
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 11:04:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdxPW65jcz302D;
	Thu, 23 Jan 2025 21:04:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737626671;
	cv=none; b=JBa3asxaQODQEtDr52QRWnRT4wb5u7f+4IbwSrnjtgPWGOkI1fnRQRbpOcsENS7HjLXN24wOB8X6FD71nGvzRWbthdAjXPfPdJIwm1QZ5FerI7k1B1Wqn+Wm0iTSsAHJGKwy7CEEejNIXPnTEaJyHKfxDsQ0EpVFTosfPXP1y/wrYQzkEmEub9ObhLKBDcC3Pm/vMXocqWPm+eA2Zyy4v7jc1k5kTE32l/NcAhhRTVwtE+OdCyQAkCZ6Xud3B3uB6wwYQiBt5eaxinYC9z72tMSI3XSX3J9JbaILeqrSo5yFXXhJoaSKrxSEOuxUXfpqv2Eq/4a9wrUmtNoSJbwmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737626671; c=relaxed/relaxed;
	bh=/axuqOfplzRqeu8Ps/HCNnf4ssDFrofS4hczNmz3VQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEs3lxrURluzUWV8pXhop5DGwTszP4V9CBsRvzARMfXL0zFhP6iKAV9Cc9i25IxbLGBd6+SW/BqhnUnvUDWCQu85vixEqv7nJR+xxR3Edk38GZUms98wDQ5jCA+r+Vfz4X9no7zVpKcST3LK25wsM1j6HE3QJV5MIFTs5Ov46nPMGNbdy+cfN8Ufo6DB/YTUkj4kEF+oOMATrMAxjHbk9wmeoS8ErXxX+H1H1dWZXnhV4A64/y2uDQC1kLq4TTPEOB3FRQ7I/nwfkk8lEnTssCUw5Kn2barSFWBBOkHUwwdXo1s3AlMbMUjnpSOIQaq9Fch14TB3BCrNAvA3tLHQzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T/79fFUx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T/79fFUx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdxPW01sSz3029
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 21:04:30 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N20kZa014157;
	Thu, 23 Jan 2025 10:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/axuqO
	fplzRqeu8Ps/HCNnf4ssDFrofS4hczNmz3VQ8=; b=T/79fFUxJBcqN9K7dOj/K+
	PkJ6M0sSZgxPx/SJx5Ug6T7ksZfrRafcLhL/mgZTI0Sof2R7R/ZgxgPwrwzSnRuI
	RnQVE9ywzjnzv4ANsjlLI3uRuzRq/Fx5Fm32f4bgvdNrcaz7H0GTLsP9mPju+vxK
	S5ugUQt+7WMQR3LSPdqQZNFZCCKpbuYLjPq+yfBGIhjRS/7aIvs20JkoYso07WSP
	IRlbRSfJzofFKpKN1TORQ1NxwOxlx4wbGe5lB/kyzcWGXoWkScxQ+bHev8215RxP
	9wDBqRAJUvR5dNaEuHNvbikzCq8zQIlLottSb4vfR+vVKqwj1HWKhaAASOQttpSQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bckysv9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:04:18 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N7mxVI032266;
	Thu, 23 Jan 2025 10:04:17 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448rujvmdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:04:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NA4DVm40698334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 10:04:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7299F200CE;
	Thu, 23 Jan 2025 10:04:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB906200C2;
	Thu, 23 Jan 2025 10:04:11 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 10:04:11 +0000 (GMT)
Message-ID: <7cfe94c9-4ca5-48b1-ab53-bc08fcf8fbc0@linux.ibm.com>
Date: Thu, 23 Jan 2025 15:34:11 +0530
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
Subject: Re: [PATCH v2 1/6] kexec: Initialize ELF lowest address to ULONG_MAX
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
 <20250121115442.1278458-2-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250121115442.1278458-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iVIl_PKY5o8bpvR2QGLyZcy1lwgBkRvv
X-Proofpoint-ORIG-GUID: iVIl_PKY5o8bpvR2QGLyZcy1lwgBkRvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230076
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 21/01/25 5:24 pm, Sourabh Jain wrote:
> kexec_elf_load() loads an ELF executable and sets the address of the
> lowest PT_LOAD section to the address held by the lowest_load_addr
> function argument.
> 
> To determine the lowest PT_LOAD address, a local variable lowest_addr
> (type unsigned long) is initialized to UINT_MAX. After loading each
> PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
> address is lower, lowest_addr is updated. However, setting lowest_addr
> to UINT_MAX won't work when the kernel image is loaded above 4G, as the
> returned lowest PT_LOAD address would be invalid. This is resolved by
> initializing lowest_addr to ULONG_MAX instead.
> 
> This issue was discovered while implementing crashkernel high/low
> reservation on the PowerPC architecture.
> 

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   kernel/kexec_elf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
> index d3689632e8b9..3a5c25b2adc9 100644
> --- a/kernel/kexec_elf.c
> +++ b/kernel/kexec_elf.c
> @@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>   			 struct kexec_buf *kbuf,
>   			 unsigned long *lowest_load_addr)
>   {
> -	unsigned long lowest_addr = UINT_MAX;
> +	unsigned long lowest_addr = ULONG_MAX;
>   	int ret;
>   	size_t i;
>   


