Return-Path: <linuxppc-dev+bounces-2111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EC199A1FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ3Ml3Bcfz3bxH;
	Fri, 11 Oct 2024 21:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728643891;
	cv=none; b=OaTUxbEADcvZ2u+ryMBKw2kA8TzFo9pnlHKbP8OHPJbr0gVMyomAbsP91cyvO6s3sCAUmCkZgAYNEJ0NKuly9IABh84/Ufo/wu7zUmC6tsO9aZunB31mBVVFQTB2Ymn67j1Db5+ABA9SX0aLAa0S66Q1v4az8yF77HNh77tHJxfWD6F27O6a5oeTE/6dW/wc+r5YDz29OT+4i4CDZo8uM72nAwuPx6rln9NbtqgK5eZwZD21jjHVtR9d+2d10i2MNmkbn0Woo4kycIWNceM8hD+qxDJCXNTrKpR7ilMm1Nsq5ENLpZpgtsFJM284Lah0ApbOFxhqRXOQD5+eET2eIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728643891; c=relaxed/relaxed;
	bh=8eHmySt2v8x+g0bchETYaHvtXRQ86U1s8qdg2O3ls68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4haMkhDVxVkLrrL7Zr3gea+ioBoYxtWvXgzVxXc3/oPBbkM/imuWSP37sAqygaOaRNwD04r2mbJuNosRdZPU84ndYP8Sxl7lFCT5ALduGReKjgvj3GbA22oSeWB4u/6sZgZVQQHCEeQuJtUMfKs+jT8ZylGBnqpFqAelReHHJrpRmC9Km8vRs/gpsvl33nZ07HAc6A3aBzo7xpoManvx0dTVcXx9cAfiRNNlRVJCHqV8h7OUu1lazuP/dmOg8k1wf3MCdanDiIF/igpeImMaJl3YWjCcToo2Ij7puXrNrP6CTql6b4B945zJ4swNlUE3YBbTovJWvIk01NPY936IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DMRcghGn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DMRcghGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ3Mk13jyz3bwp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:51:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAfdpF024450;
	Fri, 11 Oct 2024 10:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=8
	eHmySt2v8x+g0bchETYaHvtXRQ86U1s8qdg2O3ls68=; b=DMRcghGnWEAHJc2sI
	aw9j7SdWtf5M0leg2AKI3hT2vVml/82nUHhOFT0LQDzQwlNFdY3FMg7jGtc4riTA
	eefBFYJYfxENjWrH9H/rRlncZA9aZBOcIjt6uT71gIx1sXflCTGnLTgZgX21TKdR
	IzbRlD3gY8J+HTTKLKJer5DY+txleze023JeCaOBr+rx0zi4FnF7f55i5ApxCHli
	qE+iGKKtiI7B3dTCQldSVfv2NGZJdexSipfsh4i4PDV05Ym0x/AAfmRBXLDM01BD
	7tajdCj9VxHiaaK1qB1fZ12ECMCY6iXiOuCtXbjFZa9zi9Vi+uNMM/8nVAJPrjoq
	tYlEg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4272g201kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 10:51:18 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49BApH2Y018293;
	Fri, 11 Oct 2024 10:51:17 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4272g201kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 10:51:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49B8sCRO022671;
	Fri, 11 Oct 2024 10:51:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423h9kcub4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 10:51:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49BApCiL20578890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Oct 2024 10:51:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A8222004B;
	Fri, 11 Oct 2024 10:51:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 579EA20043;
	Fri, 11 Oct 2024 10:51:09 +0000 (GMT)
Received: from [9.43.15.249] (unknown [9.43.15.249])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Oct 2024 10:51:09 +0000 (GMT)
Message-ID: <5438c185-37ef-467c-8e92-528cf57d30e0@linux.ibm.com>
Date: Fri, 11 Oct 2024 16:21:08 +0530
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
Subject: Re: [RFC v2 3/4] fadump: Reserve page-aligned boot_memory_size during
 fadump_reserve_mem
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
        Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.vnet.ibm.com>,
        LKML
 <linux-kernel@vger.kernel.org>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <cover.1728585512.git.ritesh.list@gmail.com>
 <4cea3a03fb0a9f52dbd6b62ec21209abf14fb7bf.1728585512.git.ritesh.list@gmail.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <4cea3a03fb0a9f52dbd6b62ec21209abf14fb7bf.1728585512.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nqiSRij2h5kps6ABDn2ZFzJEFI8kx6-j
X-Proofpoint-GUID: 4N4onGlyq2D23RRKyjAMKVtP74AVfPyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_08,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110074
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/10/24 12:53 pm, Ritesh Harjani (IBM) wrote:
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
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/kernel/fadump.c | 34 ++++++++++++++++++++++------------
>   1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 162327d66982..ffaec625b7a8 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -80,7 +80,7 @@ static struct cma *fadump_cma;
>    */
>   static void __init fadump_cma_init(void)
>   {
> -	unsigned long long base, size;
> +	unsigned long long base, size, end;
>   	int rc;
>   
>   	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
> @@ -92,8 +92,24 @@ static void __init fadump_cma_init(void)
>   	if (fw_dump.nocma || !fw_dump.boot_memory_size)
>   		return;
>   
> +	/*
> +	 * [base, end) should be reserved during early init in
> +	 * fadump_reserve_mem(). No need to check this here as
> +	 * cma_init_reserved_mem() already checks for overlap.
> +	 * Here we give the aligned chunk of this reserved memory to CMA.
> +	 */
>   	base = fw_dump.reserve_dump_area_start;
>   	size = fw_dump.boot_memory_size;
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
>   	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
>   	if (rc) {
> @@ -116,11 +132,12 @@ static void __init fadump_cma_init(void)
>   	/*
>   	 * So we now have successfully initialized cma area for fadump.
>   	 */

> -	pr_info("Initialized 0x%lx bytes cma area at %ldMB from 0x%lx "
> +	pr_info("Initialized [0x%llx, %luMB] cma area from [0x%lx, %luMB] "
>   		"bytes of memory reserved for firmware-assisted dump\n",
> -		cma_get_size(fadump_cma),
> -		(unsigned long)cma_get_base(fadump_cma) >> 20,
> -		fw_dump.reserve_dump_area_size);
> +		cma_get_base(fadump_cma), cma_get_size(fadump_cma) >> 20,
> +		fw_dump.reserve_dump_area_start,
> +		fw_dump.boot_memory_size >> 20);

The changes look good. Thanks for looking into it.

For patches 2, 3 & 4

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> +	return;
>   }
>   #else
>   static void __init fadump_cma_init(void) { }
> @@ -553,13 +570,6 @@ int __init fadump_reserve_mem(void)
>   	if (!fw_dump.dump_active) {
>   		fw_dump.boot_memory_size =
>   			PAGE_ALIGN(fadump_calculate_reserve_size());
> -#ifdef CONFIG_CMA
> -		if (!fw_dump.nocma) {
> -			fw_dump.boot_memory_size =
> -				ALIGN(fw_dump.boot_memory_size,
> -				      CMA_MIN_ALIGNMENT_BYTES);
> -		}
> -#endif
>   
>   		bootmem_min = fw_dump.ops->fadump_get_bootmem_min();
>   		if (fw_dump.boot_memory_size < bootmem_min) {


