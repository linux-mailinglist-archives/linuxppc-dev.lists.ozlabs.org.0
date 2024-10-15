Return-Path: <linuxppc-dev+bounces-2280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B999E5C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 13:34:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSX7h43Fcz3bmq;
	Tue, 15 Oct 2024 22:34:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728992080;
	cv=none; b=Kei0rbV1UdiCzfuZxebjj/WqoIxP8BvRm1HMZj02AGZ8b546chYoPWcQBLX00U6j6TK4WL52vmrxKzImXITjj+wzBQ1HDGLvqOhuZJu/prfcWxvn1nrhhw8w3/rtrjVlJqo73IKlXxHJpD5YSfAINeNjz7FQH86ovZurFhG8OqMElaH2K+JWlSnYYL2nPyR1GL87lR5yFL4j1Bkfa04NkHBYrXbd+dIUn+5cQIMWEhpQkao0aYUdboSuzddZU8ARAMTP6UtT5RIjpPYzj4RZqVhUWoRqcJun0nKlUGbC4K6shcrINCb2TIk/Le4SIfo0rr4VPjFVglh9E7nvODbF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728992080; c=relaxed/relaxed;
	bh=c69cTslBIDcPA3cDCJjH6VoeJG0oJsXagvXewdckmtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHjAym0g/y9UBxb0NiSux4lyBsXTE2GSLXO01WwkPkJ13QKc28rMZFPFpAao8bRPBDZNvfV4BmeoP4po7hgEYbUjJNPlzqPeiv2HMZHH8B0hJdWeRM8GCJXeSK6OfzdsvknncoKZDfxo1wSZNfADwA5emOl+SJt9f3t97bwuheqV8+LSbznpt6mgFqnkdTAL5mUbWHo+xLIJsdKLZSDp7P502DhyV7W7KW3UiDEFlH5BlTp2+VnG854Jtbo0v1FK9bVFxGDl94cZ/DONqu6Zf/xrT0VyY4lR5BYnXApTWGZx0Cgz+VUU7bRQACf9W0ziiYRT/XZyj4iXUy7SmIlKBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G4UrvigG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G4UrvigG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSX7f4qT7z3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 22:34:36 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FAtf86013475;
	Tue, 15 Oct 2024 11:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=c69cTs
	lBIDcPA3cDCJjH6VoeJG0oJsXagvXewdckmtc=; b=G4UrvigGVysgYqKyXGpbIl
	4oqWnPInuHUpNReoBb9tJ2k3JG6oW9X0rl6wKVRec6RJY7T+kPADWfsMlT1olu6s
	a8WLeP47EpJdTJ+SI6Wx7FEqFivxaMRytzqOX32DAVmEP3xeRmy+pdUocRojmBep
	/IQU2FfUG7t9gEAh5+rFWTB+NgBQZVB8emWFis9PPgnjiyX/D6ICpE1FcRHQTf4p
	IskOSf8QdEsAh/xNBS7pJ3ejYK6NMib3qRcgrrH55xKF0XUe2Jr9t3KmuXnHmv2F
	Y0Bty/zZnP8yJcH6jkVz+mZPRm3AZbZqiOSYHlF1yaESvsOd/tOJWvhi4VdV7Zzg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429q2fg5sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 11:34:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49FBV2Q7005449;
	Tue, 15 Oct 2024 11:34:23 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429q2fg5sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 11:34:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49FB7sAT027464;
	Tue, 15 Oct 2024 11:34:22 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4283txkkrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 11:34:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49FBYLbw24183534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 11:34:21 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DB4858064;
	Tue, 15 Oct 2024 11:34:21 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F5415803F;
	Tue, 15 Oct 2024 11:34:13 +0000 (GMT)
Received: from [9.43.1.152] (unknown [9.43.1.152])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Oct 2024 11:34:12 +0000 (GMT)
Message-ID: <96241074-7b78-4b7a-a539-ef8a1055c198@linux.ibm.com>
Date: Tue, 15 Oct 2024 17:04:10 +0530
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
Subject: Re: [RFC v3 2/3] fadump: Reserve page-aligned boot_memory_size during
 fadump_reserve_mem
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
        David Hildenbrand <david@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.vnet.ibm.com>,
        LKML
 <linux-kernel@vger.kernel.org>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com>
 <32496f6daeb4ed04c772ae484895241ab2ae1da1.1728658614.git.ritesh.list@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <32496f6daeb4ed04c772ae484895241ab2ae1da1.1728658614.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SLW9cavwMcq6r2LFyWJAefiDDSWm_ram
X-Proofpoint-GUID: 4sJHYHgueqtmFBC4Se70VM021ToNv91C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150078
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/11/24 8:30 PM, Ritesh Harjani (IBM) wrote:
> This patch refactors all CMA related initialization and alignment code
> to within fadump_cma_init() which gets called in the end. This also means
> that we keep [reserve_dump_area_start, boot_memory_size] page aligned
> during fadump_reserve_mem(). Then later in fadump_cma_init() we extract the
> aligned chunk and provide it to CMA. This inherently also fixes an issue in
> the current code where the reserve_dump_area_start is not aligned
> when the physical memory can have holes and the suitable chunk starts at
> an unaligned boundary.
> 
> After this we should be able to call fadump_cma_init() independently
> later in setup_arch() where pageblock_order is non-zero.
> 
> Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>  arch/powerpc/kernel/fadump.c | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 162327d66982..ffaec625b7a8 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -80,7 +80,7 @@ static struct cma *fadump_cma;
>   */
>  static void __init fadump_cma_init(void)
>  {
> -	unsigned long long base, size;
> +	unsigned long long base, size, end;
>  	int rc;
>  
>  	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
> @@ -92,8 +92,24 @@ static void __init fadump_cma_init(void)
>  	if (fw_dump.nocma || !fw_dump.boot_memory_size)
>  		return;
>  
> +	/*
> +	 * [base, end) should be reserved during early init in
> +	 * fadump_reserve_mem(). No need to check this here as
> +	 * cma_init_reserved_mem() already checks for overlap.
> +	 * Here we give the aligned chunk of this reserved memory to CMA.
> +	 */
>  	base = fw_dump.reserve_dump_area_start;
>  	size = fw_dump.boot_memory_size;
> +	end = base + size;
> +
> +	base = ALIGN(base, CMA_MIN_ALIGNMENT_BYTES);
> +	end = ALIGN_DOWN(end, CMA_MIN_ALIGNMENT_BYTES);
> +	size = end - base;
> +
> +	if (end <= base) {
> +		pr_warn("%s: Too less memory to give to CMA\n", __func__);
> +		return;
> +	}
>  

just minor, other prints are all "cma", any reason for "CMA" here?


>  	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
>  	if (rc) {
> @@ -116,11 +132,12 @@ static void __init fadump_cma_init(void)
>  	/*
>  	 * So we now have successfully initialized cma area for fadump.
>  	 */
> -	pr_info("Initialized 0x%lx bytes cma area at %ldMB from 0x%lx "
> +	pr_info("Initialized [0x%llx, %luMB] cma area from [0x%lx, %luMB] "
>  		"bytes of memory reserved for firmware-assisted dump\n",
> -		cma_get_size(fadump_cma),
> -		(unsigned long)cma_get_base(fadump_cma) >> 20,
> -		fw_dump.reserve_dump_area_size);
> +		cma_get_base(fadump_cma), cma_get_size(fadump_cma) >> 20,
> +		fw_dump.reserve_dump_area_start,
> +		fw_dump.boot_memory_size >> 20);
> +	return;
>  }
>  #else
>  static void __init fadump_cma_init(void) { }
> @@ -553,13 +570,6 @@ int __init fadump_reserve_mem(void)
>  	if (!fw_dump.dump_active) {
>  		fw_dump.boot_memory_size =
>  			PAGE_ALIGN(fadump_calculate_reserve_size());
> -#ifdef CONFIG_CMA
> -		if (!fw_dump.nocma) {
> -			fw_dump.boot_memory_size =
> -				ALIGN(fw_dump.boot_memory_size,
> -				      CMA_MIN_ALIGNMENT_BYTES);
> -		}
> -#endif
>  
>  		bootmem_min = fw_dump.ops->fadump_get_bootmem_min();
>  		if (fw_dump.boot_memory_size < bootmem_min) {


