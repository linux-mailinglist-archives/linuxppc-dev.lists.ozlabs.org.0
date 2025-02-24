Return-Path: <linuxppc-dev+bounces-6398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10DA4145E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 05:04:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1RvC6JyJz2yDD;
	Mon, 24 Feb 2025 15:04:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740369863;
	cv=none; b=Xk8gpn2CLO+wTKJghONkBRFXVWTQpuIGcqA+7/v/VbV6MU+6YlP8GQaS+yl6FhzB4GBaaCs+l5U1R2f6j+sbyIG/wG/2N1ebSSWVbqbo6UkC/KQHjTu0avV3WikbaoQlvjMI5l99ypqJong7XxgCgd4pc/Yp+y9lvEWztrd0Z98JvjdoCEnjg4ECemAbHbOvhsY646comsm3BSajPv5spHMRcriB2zh/dFxA1A0RUikStlhrKjX5Sb5+NAeGg2fTs2jkLTL8LlS+PJj2W3Oo8StrjT/9w9z5r8KOPyqV0bgS1VGtYkBBtR9XGCJngfkNrkVv4+Gsc/tz+daCQ05zrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740369863; c=relaxed/relaxed;
	bh=QA+G5Y0Ly6q5ukERsuKlOuO69CiJToynV4zbvufSnbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhuhdcDa+NtUw1cJVgt4oS8T/7scVgVU/20icHB6L5KMVZL0+lwdxnqmtBsrnt4QWhBTDsec/LfK417Pf6Dd95y290rPkbuBap1qb+rtHTsrHIzH9aL9jpdCWosJmlVK5Yo+LHqoa7EH8jqwt4OYrwhnJZa51BSxz78r26UUBKYmHnXMpIzjSzqs1HdcjpXXFEYBQs+LykvE1iAvDpJjbe5jvTszUSq+lD6rGzeNDHyB0Gp6gqp4Sjnmz40+/1pnULRV2+qsSmdCREBzPVCA7f0MJ72jv+k7eTiRmkC+eqMljCE6A/hWaacPrAYHHTUynow/OFngSBhn513u4pq70Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flaMjfNV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flaMjfNV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1Rv94sCtz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 15:04:20 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O2EoXs023371;
	Mon, 24 Feb 2025 04:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QA+G5Y
	0Ly6q5ukERsuKlOuO69CiJToynV4zbvufSnbw=; b=flaMjfNVfNbmbXxnQkRqlH
	tBzqy8TXPZiO3LV0xL9PYaRkYIHM/bQ/pjv989oM5HCJh/3MToSOgt/Htwsf9zuw
	jrjxAiHswHXq1Jec8R701/ntSXgY8hfDi4Iv2wtGIHFDc9kMURHZSu2IyoCzqe/+
	MkaZBl0keyOVT/BEhsh96dXBA8duE7wSroufVISb+M27/3mmE5aO7yAGU6DAn6FH
	m4QI2bsXfiEAN/XEg240nvXkPHtWhhAnVsv8tXmQYcgvBdAYSPKbn4VdaOlrxjwe
	LptYRS3+LfzJ3UbSfgWY5JuJ2LuDEVeh+rHzEr2xVQ6DRJQTSeyXxzOwjTAV0A9g
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450cta0vh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 04:04:07 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51O1rab9027376;
	Mon, 24 Feb 2025 04:04:06 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yum1mu4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 04:04:06 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51O442Eg35717736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 04:04:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D33202004E;
	Mon, 24 Feb 2025 04:04:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 716D020040;
	Mon, 24 Feb 2025 04:04:01 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Feb 2025 04:04:01 +0000 (GMT)
Message-ID: <d392bf6d-da3b-429a-8686-b602601573c0@linux.ibm.com>
Date: Mon, 24 Feb 2025 09:34:00 +0530
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
Subject: Re: [PATCH v4] powerpc/hugetlb: Disable gigantic hugepages if fadump
 is active
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
References: <20250128043358.163372-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20250128043358.163372-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oYtH7ekzXUigsczXl9QUH6HeZT7dpv4p
X-Proofpoint-ORIG-GUID: oYtH7ekzXUigsczXl9QUH6HeZT7dpv4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240027
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Maddy,

Any feedback on this patch?

Thanks,
Sourabh Jain


On 28/01/25 10:03, Sourabh Jain wrote:
> The fadump kernel boots with limited memory solely to collect the kernel
> core dump. Having gigantic hugepages in the fadump kernel is of no use.
> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
> gigantic hugepages are allocated.
>
> To address this, disable gigantic hugepages if fadump is active by
> returning early from arch_hugetlb_valid_size() using
> hugepages_supported(). When fadump is active, the global variable
> hugetlb_disabled is set to true, which is later used by the
> PowerPC-specific hugepages_supported() function to determine hugepage
> support.
>
> Returning early from arch_hugetlb_vali_size() not only disables
> gigantic hugepages but also avoids unnecessary hstate initialization for
> every hugepage size supported by the platform.
>
> kernel logs related to hugepages with this patch included:
> kernel argument passed: hugepagesz=1G hugepages=1
>
> First kernel: gigantic hugepage got allocated
> ==============================================
>
> dmesg | grep -i "hugetlb"
> -------------------------
> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>
> $ cat /proc/meminfo | grep -i "hugetlb"
> -------------------------------------
> Hugetlb:         1048576 kB
>
> Fadump kernel: gigantic hugepage not allocated
> ===============================================
>
> dmesg | grep -i "hugetlb"
> -------------------------
> [    0.000000] HugeTLB: unsupported hugepagesz=1G
> [    0.000000] HugeTLB: hugepages=1 does not follow a valid hugepagesz, ignoring
> [    0.706375] HugeTLB support is disabled!
> [    0.773530] hugetlbfs: disabling because there are no supported hugepage sizes
>
> $ cat /proc/meminfo | grep -i "hugetlb"
> ----------------------------------
> <Nothing>
>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changelog:
>
> v1:
> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/
>
> v2:
> https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
>   - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>
> v3:
> https://lore.kernel.org/all/20250125104928.88881-1-sourabhjain@linux.ibm.com/
>   - Do not modify the initialization of the shift variable
>
> v4:
> - Update commit message to include how hugepages_supported() detects
>    hugepages support when fadump is active
> - Add Reviewed-by tag
> - NO functional change
>
> ---
>   arch/powerpc/mm/hugetlbpage.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 6b043180220a..88cfd182db4e 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>   	int shift = __ffs(size);
>   	int mmu_psize;
>   
> +	if (!hugepages_supported())
> +		return false;
> +
>   	/* Check that it is a page size supported by the hardware and
>   	 * that it fits within pagetable and slice limits. */
>   	if (size <= PAGE_SIZE || !is_power_of_2(size))


