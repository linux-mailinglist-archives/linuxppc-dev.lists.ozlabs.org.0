Return-Path: <linuxppc-dev+bounces-7414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5673A77BE7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 15:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRpWF4Bxfz2yr7;
	Wed,  2 Apr 2025 00:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743513577;
	cv=none; b=epDJ1t4Qk9cF5tKpL97cQKhJprPTjrMtDfSihFVNHESrVwAG/XaG90/tLeHhbATFkpxh+UqBK7DVIcLQigWWYOTjhG5sH5S0ktg0Dgn3emlncrjkWOYsH11Xo3kqALxDl8M0HHQGX8B5tH1yyuQUBZr5T3z6qynPiSs5eXCV+fs6z6AC3PevgiKFhgGVd0L3EZAQFjITKV/65Bn4z5NIUD/Mh524z2vuxvbS6Cq14WEYWtST0BwnOKoZh1EqtpWMdhBj+Ex3f7o1n03rlLntM8iqQOwRjkp6We7BFTGHBvm6z+KsXVL5y6ZDLEYH6NY5lpj5cD2ZtGcykqKeU5fvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743513577; c=relaxed/relaxed;
	bh=AUrIFmboo8GMbc+w+McLMUqkIVthsIfz92lLp898PqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcBldNuJY0QTuJKwpgy1GGAXHmLfju6GtxQjs6iLd69cWxjiPm0u68hIUMNtxZBRocXPTS+fzoMBizrj1NGEhZhBvIpgVvNc7TNFn75RCWWnU76IlomDGux7/1UY4wf8DpJ+uK4wS5v7zwWRO52RWOUMe+Yg4+1eVled0ooL0nTfIxPLRc7dx6COftYF7TROs6j+a7OH2PBiSPPrwtG38vdUbD9fJJX0wcsc3zX6uvgxtNq+UrNcTNCW7Nk4TlDMEpve3eyGiuPewza+bGDgNZ2ssaBPh4YZZ0DS2op9peeeFJ4du+AhebQpLXia0QXHP8JBxeGlSI4RnC+5VuR//Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CKfVFPKr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CKfVFPKr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRpWD3f4gz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 00:19:36 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5316pSs1028354;
	Tue, 1 Apr 2025 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AUrIFm
	boo8GMbc+w+McLMUqkIVthsIfz92lLp898PqM=; b=CKfVFPKrZ2PN8q2qoMit4Y
	ZdtP8kR8eI0B/HBwB/cTZvom1K0CnpR1SSHbLhqIbVUE7VSAhMLTCWckymGDuMXu
	W7bp5m0CuzUv5huBk+PuQOtNxG/fKDtJ+Yp0/5Pzmg2Ls9e32VtrOX794vDBN0rM
	fEkRwN0GZUB2YMJL/v53XGuOVJtTNz1FQKyRe3CkLOY06yyDqXvsG+MBZJbL7Yjj
	Lhr6mS6t7MQxtcxr09hjGFWw9wnqewJg3z/DcQ1DFB9d5+/UFEKEuxsRtYECc2br
	U/46KP8gK7YzqaS6IhbL4FOtjbmsq1JN8vS/loGJnVFRStEPmDZ4MZ2J7KsByXMw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qy7xcq5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 13:19:23 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 531DCjW8007224;
	Tue, 1 Apr 2025 13:19:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qy7xcq5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 13:19:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5319CV0V014555;
	Tue, 1 Apr 2025 13:19:22 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pvpm2jjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 13:19:22 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 531DJM3L31982182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 13:19:22 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73EC55805D;
	Tue,  1 Apr 2025 13:19:22 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A29E558043;
	Tue,  1 Apr 2025 13:19:20 +0000 (GMT)
Received: from [9.39.16.179] (unknown [9.39.16.179])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Apr 2025 13:19:20 +0000 (GMT)
Message-ID: <0582446c-7d4e-4032-bea8-3845a10f17f0@linux.ibm.com>
Date: Tue, 1 Apr 2025 18:49:18 +0530
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
Subject: Re: [PATCH v3 2/2] book3s64/radix : Align section vmemmap start
 address to PAGE_SIZE
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
 <8f98ec2b442977c618f7256cec88eb17dde3f2b9.1741609795.git.donettom@linux.ibm.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <8f98ec2b442977c618f7256cec88eb17dde3f2b9.1741609795.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cd656mJ-I5zCKTlZNrKw9Wf0aXkO_dck
X-Proofpoint-GUID: hNc5W-YO2T69TBb5RkGugaX1Qu6CUXsz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010080
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 3/10/25 6:14 PM, Donet Tom wrote:
> A vmemmap altmap is a device-provided region used to provide
> backing storage for struct pages. For each namespace, the altmap
> should belong to that same namespace. If the namespaces are
> created unaligned, there is a chance that the section vmemmap
> start address could also be unaligned. If the section vmemmap
> start address is unaligned, the altmap page allocated from the
> current namespace might be used by the previous namespace also.
> During the free operation, since the altmap is shared between two
> namespaces, the previous namespace may detect that the page does
> not belong to its altmap and incorrectly assume that the page is a
> normal page. It then attempts to free the normal page, which leads
> to a kernel crash.
>
> Kernel attempted to read user page (18) - exploit attempt? (uid: 0)
> BUG: Kernel NULL pointer dereference on read at 0x00000018
> Faulting instruction address: 0xc000000000530c7c
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> CPU: 32 PID: 2104 Comm: ndctl Kdump: loaded Tainted: G        W
> NIP:  c000000000530c7c LR: c000000000530e00 CTR: 0000000000007ffe
> REGS: c000000015e57040 TRAP: 0300   Tainted: G        W
> MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 84482404
> CFAR: c000000000530dfc DAR: 0000000000000018 DSISR: 40000000 IRQMASK: 0
> GPR00: c000000000530e00 c000000015e572e0 c000000002c5cb00 c00c000101008040
> GPR04: 0000000000000000 0000000000000007 0000000000000001 000000000000001f
> GPR08: 0000000000000005 0000000000000000 0000000000000018 0000000000002000
> GPR12: c0000000001d2fb0 c0000060de6b0080 0000000000000000 c0000060dbf90020
> GPR16: c00c000101008000 0000000000000001 0000000000000000 c000000125b20f00
> GPR20: 0000000000000001 0000000000000000 ffffffffffffffff c00c000101007fff
> GPR24: 0000000000000001 0000000000000000 0000000000000000 0000000000000000
> GPR28: 0000000004040201 0000000000000001 0000000000000000 c00c000101008040
> NIP [c000000000530c7c] get_pfnblock_flags_mask+0x7c/0xd0
> LR [c000000000530e00] free_unref_page_prepare+0x130/0x4f0
> Call Trace:
> free_unref_page+0x50/0x1e0
> free_reserved_page+0x40/0x68
> free_vmemmap_pages+0x98/0xe0
> remove_pte_table+0x164/0x1e8
> remove_pmd_table+0x204/0x2c8
> remove_pud_table+0x1c4/0x288
> remove_pagetable+0x1c8/0x310
> vmemmap_free+0x24/0x50
> section_deactivate+0x28c/0x2a0
> __remove_pages+0x84/0x110
> arch_remove_memory+0x38/0x60
> memunmap_pages+0x18c/0x3d0
> devm_action_release+0x30/0x50
> release_nodes+0x68/0x140
> devres_release_group+0x100/0x190
> dax_pmem_compat_release+0x44/0x80 [dax_pmem_compat]
> device_for_each_child+0x8c/0x100
> [dax_pmem_compat_remove+0x2c/0x50 [dax_pmem_compat]
> nvdimm_bus_remove+0x78/0x140 [libnvdimm]
> device_remove+0x70/0xd0
>
> Another issue is that if there is no altmap, a PMD-sized vmemmap
> page will be allocated from RAM, regardless of the alignment of
> the section start address. If the section start address is not
> aligned to the PMD size, a VM_BUG_ON will be triggered when
> setting the PMD-sized page to page table.
>
> In this patch, we are aligning the section vmemmap start address
> to PAGE_SIZE. After alignment, the start address will not be
> part of the current namespace, and a normal page will be allocated
> for the vmemmap mapping of the current section. For the remaining
> sections, altmaps will be allocated. During the free operation,
> the normal page will be correctly freed.
>
> In the same way, a PMD_SIZE vmemmap page will be allocated only if
> the section start address is PMD_SIZE-aligned; otherwise, it will
> fall back to a PAGE-sized vmemmap allocation.
>
> Without this patch
> ==================
> NS1 start               NS2 start
>   _________________________________________________________
> |         NS1               |            NS2              |
>   ---------------------------------------------------------
> | Altmap| Altmap | .....|Altmap| Altmap | ...........
> |  NS1  |  NS1   |      | NS2  |  NS2   |
>
> In the above scenario, NS1 and NS2 are two namespaces. The vmemmap
> for NS1 comes from Altmap NS1, which belongs to NS1, and the
> vmemmap for NS2 comes from Altmap NS2, which belongs to NS2.
>
> The vmemmap start for NS2 is not aligned, so Altmap NS2 is shared
> by both NS1 and NS2. During the free operation in NS1, Altmap NS2
> is not part of NS1's altmap, causing it to attempt to free an
> invalid page.
>
> With this patch
> ===============
> NS1 start               NS2 start
>   _________________________________________________________
> |         NS1               |            NS2              |
>   ---------------------------------------------------------
> | Altmap| Altmap | .....| Normal | Altmap | Altmap |.......
> |  NS1  |  NS1   |      |  Page  |  NS2   |  NS2   |
>
> If the vmemmap start for NS2 is not aligned then we are allocating
> a normal page. NS1 and NS2 vmemmap will be freed correctly.
>
> Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
> Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>
> Optimizations suggested by Aneesh and Ritesh regarding aligning
> the start to PMD size will be done as part of the next patch
> series.
>
> v2 -> v3 : Added a comment in the code as Aneesh suggested.
> v2:https://lore.kernel.org/all/8231763344223c193e3452eab0ae8ea966aff466.1741363120.git.donettom@linux.ibm.com/
> v1: https://lore.kernel.org/all/20250226043426.224494-1-donettom@linux.ibm.com/
> ---
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index bd6916419472..9f764bc42b8c 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1121,6 +1121,19 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>   	pmd_t *pmd;
>   	pte_t *pte;
>   
> +	/*
> +	 * Make sure we align the start vmemmap addr so that we calculate
> +	 * the correct start_pfn in altmap boundary check to decided whether
> +	 * we should use altmap or RAM based backing memory allocation. Also
> +	 * the address need to be aligned for set_pte operation.
> +
> +	 * If the start addr is already PMD_SIZE aligned we will try to use
> +	 * a pmd mapping. We don't want to be too aggressive here beacause
> +	 * that will cause more allocations in RAM. So only if the namespace
> +	 * vmemmap start addr is PMD_SIZE aligned we will use PMD mapping.
> +	 */
> +
> +	start = ALIGN_DOWN(start, PAGE_SIZE);
>   	for (addr = start; addr < end; addr = next) {
>   		next = pmd_addr_end(addr, end);
>   
> @@ -1146,8 +1159,8 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>   			 * in altmap block allocation failures, in which case
>   			 * we fallback to RAM for vmemmap allocation.
>   			 */
> -			if (altmap && (!IS_ALIGNED(addr, PMD_SIZE) ||
> -				       altmap_cross_boundary(altmap, addr, PMD_SIZE))) {
> +			if (!IS_ALIGNED(addr, PMD_SIZE) || (altmap &&
> +			    altmap_cross_boundary(altmap, addr, PMD_SIZE))) {
>   				/*
>   				 * make sure we don't create altmap mappings
>   				 * covering things outside the device.

Hi Maddy

If everything is fine, is it possible to pull this patch to the next?

Thanks
Donet


