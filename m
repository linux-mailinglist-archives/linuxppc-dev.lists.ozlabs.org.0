Return-Path: <linuxppc-dev+bounces-6021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4AA2E539
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 08:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrwsX5kvlz2yvl;
	Mon, 10 Feb 2025 18:18:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739171904;
	cv=none; b=GNXwLzMYfVgljxPy2gsrE32hX8ZXpj8Zi2AdQKxFtOATHhKP8rPPnpK2uU5KNpnUkHhX1K+UOoxdo4xj1oQsMiNl6V7bIFIYClbSas8Dbg/AuKn65YRWRBWvJwB5v95d7tMZsIwFjLL+mPIj4eAAgOB+RhVBE74tNZ05P6gZxiEQf9o4X9VQXJPapE4fBrKUAODpjYwYYEIOjqpLBT1JnFeqCMGpjRZ/UG9RutWAH0huDBZHUyjYbKQ30Mt4gY5m2gJeokCM9oijqK6+TmKD1gZrNIXWS7NEl2TPZgR1u4EwAWvfNi9YRZNrWetPf4zKEMJ6MRHAuczEtITCnouReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739171904; c=relaxed/relaxed;
	bh=iNTyZVwuqUwyR60FmvCiSyR0QRauqsSOa8FkkFOgQHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fz6zcYUdFnyM3Cbs32bMF9KGKtFVFyy/jTVRul7gD2s9h+vYvnlsp9SZdeyGSra7WUqpZ8hN2uLcHSFZOpdeJC1uhCZOgoctuVAGuQjg4lrXUvJx6ygBFQFYtS3ieOzgCx/EhV35ZjCaClfXEFLsakVhavxfWHCxEPZ5ut4dVrbe2NbxTJb9lrooMV1Y341vxOSezM5RkMPExvQbpyzONs6KSgTMs7CeICyhJhocr6Ompr1q77yBZEMFXBFAiM18azG/kEfWm7icWBVIyIvV03XN686ask2wjwxzRJgVVDIE9k633ohqimYyQw2cAmSYk0/XJZBnF0F+yktoF6KC+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M82Y18kx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M82Y18kx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrwsW5jNFz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 18:18:23 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A20n6k014156;
	Mon, 10 Feb 2025 07:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=iNTyZV
	wuqUwyR60FmvCiSyR0QRauqsSOa8FkkFOgQHY=; b=M82Y18kxceVrd98RCkdZ04
	UVcvz8r3WV59ievx18pTK+/M3n5RbB+VYheHND66jcV0/gv868lux1A0a2B5koPI
	DbbKLanIywCUUX/YQSFDTFGCUQGPn4xVf7g3zc6TCZjQQsu67texvDtKxNCMd3Mh
	LY0AM0+mB3KO/FwgUlT48BkEXUeE5VNn4NedupuzrcdMijN/vxVaJjh4t6+6rvxo
	7nPYSMQKS+uBXhxzHcwl6rE8y+BZlDTsuXca1CFyLjP5CaGVKea4boOPF4A1YYnh
	QHAL/F3Z+PgfJRfpwrmo6nSncONw/OpZSbs5NpOVhx/qzw/f+Taaf2KnZX0hrt7Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44q89ys3tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 07:18:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51A40N3t016692;
	Mon, 10 Feb 2025 07:18:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pk3jw1ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 07:18:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51A7IBS629753914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 07:18:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED7E72013D;
	Mon, 10 Feb 2025 07:18:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A78120138;
	Mon, 10 Feb 2025 07:18:09 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 07:18:09 +0000 (GMT)
Message-ID: <2f75f8f7-0dda-4f31-8e4b-bf6d7dec4818@linux.ibm.com>
Date: Mon, 10 Feb 2025 12:48:08 +0530
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
Subject: Re: [PATCH v3 2/4] powerpc/fadump: fix additional param memory
 reservation for HASH MMU
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Avnish Chouhan <avnish@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
 <20250123114254.200527-3-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250123114254.200527-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8KSkfmF30PeFWDmzXHMNgd4m-EIoddWJ
X-Proofpoint-ORIG-GUID: 8KSkfmF30PeFWDmzXHMNgd4m-EIoddWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=842 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100057
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Sourabh,

On 23/01/25 5:12 pm, Sourabh Jain wrote:
> Commit 683eab94da75bc ("powerpc/fadump: setup additional parameters for
> dump capture kernel") introduced the additional parameter feature in
> fadump for HASH MMU with the understanding that GRUB does not use the
> memory area between 640MB and 768MB for its operation.
> 
> However, the third patch in this series ("powerpc: increase MIN RMA
> size for CAS negotiation") changes the MIN RMA size to 768MB, allowing
> GRUB to use memory up to 768MB. This makes the fadump reservation for
> the additional parameter feature for HASH MMU unreliable.
> 
> To address this, adjust the memory range for the additional parameter in
> fadump for HASH MMU. This will ensure that GRUB does not overwrite the
> memory reserved for fadump's additional parameter in HASH MMU.
> 
> The new policy for the memory range for the additional parameter in HASH
> MMU is that the first memory block must be larger than the MIN_RMA size,
> as the bootloader can use memory up to the MIN_RMA size. The range
> should be between MIN_RMA and the RMA size (ppc64_rma_size), and it must
> not overlap with the fadump reserved area.
> 
> Cc: Avnish Chouhan <avnish@linux.ibm.com>
> Cc: Brian King <brking@linux.ibm.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/kernel/fadump.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..26e3d151e048 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -33,6 +33,7 @@
>   #include <asm/fadump-internal.h>
>   #include <asm/setup.h>
>   #include <asm/interrupt.h>
> +#include <asm/prom.h>
>   
>   /*
>    * The CPU who acquired the lock to trigger the fadump crash should
> @@ -1764,19 +1765,19 @@ void __init fadump_setup_param_area(void)
>   		range_end = memblock_end_of_DRAM();
>   	} else {
>   		/*
> -		 * Passing additional parameters is supported for hash MMU only
> -		 * if the first memory block size is 768MB or higher.
> +		 * Memory range for passing additional parameters for HASH MMU
> +		 * must meet the following conditions:
> +		 * 1. The first memory block size must be higher than the
> +		 *    minimum RMA (MIN_RMA) size. Bootloader can use memory

> +		 *    upto RMA size. So it should be avoided.

I believe you mean "upto MIN_RMA size." here?

Rest looks good.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>


> +		 * 2. The range should be between MIN_RMA and RMA size (ppc64_rma_size)
> +		 * 3. It must not overlap with the fadump reserved area.
>   		 */
> -		if (ppc64_rma_size < 0x30000000)
> +		if (ppc64_rma_size < MIN_RMA*1024*1024)
>   			return;
>   
> -		/*
> -		 * 640 MB to 768 MB is not used by PFW/bootloader. So, try reserving
> -		 * memory for passing additional parameters in this range to avoid
> -		 * being stomped on by PFW/bootloader.
> -		 */
> -		range_start = 0x2A000000;
> -		range_end = range_start + 0x4000000;
> +		range_start = MIN_RMA * 1024 * 1024;
> +		range_end = min(ppc64_rma_size, fw_dump.boot_mem_top);
>   	}
>   
>   	fw_dump.param_area = memblock_phys_alloc_range(COMMAND_LINE_SIZE,


