Return-Path: <linuxppc-dev+bounces-2187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8557E99C083
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 08:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRp442G5Nz2x9M;
	Mon, 14 Oct 2024 17:59:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728888327;
	cv=none; b=aZf0rwGSYzL1g61A54VJZyeVAUoanoA+C1JW4esQpWIkrFZ4tuCuOS9RTjm2EVb8I858X4kHF/xBP27w30Vhq9qD1CwlF11kwTNTj5k9uMVbOTlfE5CgcO/PxAC07BozumrEe0D9VJXV2Y5ezzAeeUhQ23qc1gK2p42lK39SZ9HgkRh511In9HjIwTA2JT8JLk4h0A6WSX1hqtt1PjPULS7LAKXaLjhjHZq28onlJIYlBaPouqr7tDqS9oylOD2OtKxz28BTdsxVpj51hZvmHPp0n0pB22+TWZy5Sz2WjBEFUS3VjwHYN4n8R7Vwj+gOQAYxeX1hswyDF8+qPshz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728888327; c=relaxed/relaxed;
	bh=3IwQLVDj18Ylh/UeRIi9/FEdv2OxopHjtN4TyRqvpHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ruefmvg6GkoQo3pKibjtsDF6N0+GC5clOl9fFubiCKPjCb74s10XyHrJ1+Lv2TXwu7RZkbMKPGinZuK0nAYNl4DHVPS8CR0B++hWL3Tyze0lCk9GfOhx8yPISN0MBQ7/aUPTQ9moMQXNbZ+wOyyygHPZcrOg7BKlHI2ALT/qzTsxYf3YSE5AklB+HdJgcFpWt1ayH9Vs5ymlShYxZC4VmzxAmOx+DW/rP6Y/wtUyGjYC+JpksgFWmb4qcH/qx0mBp/e9LNAqQSH2P7yt6EZwFkgoR1ei6OqhUAkbRPUOpIY/sk2D2aPY6NG6QHbYtrUEOTg8kTcV1yetXG+Bx8c8rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRnmQ0WSHz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 17:45:24 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B76C71007;
	Sun, 13 Oct 2024 23:45:20 -0700 (PDT)
Received: from [10.163.38.184] (unknown [10.163.38.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E6053F51B;
	Sun, 13 Oct 2024 23:44:46 -0700 (PDT)
Message-ID: <62410f7d-2642-4218-8e8e-a384dbe86954@arm.com>
Date: Mon, 14 Oct 2024 12:14:48 +0530
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
Subject: Re: [RFC v3 -next] cma: Enforce non-zero pageblock_order during
 cma_init_reserved_mem()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
Cc: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/11/24 20:26, Ritesh Harjani (IBM) wrote:
> cma_init_reserved_mem() checks base and size alignment with
> CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
> early boot when pageblock_order is 0. That means if base and size does
> not have pageblock_order alignment, it can cause functional failures
> during cma activate area.
> 
> So let's enforce pageblock_order to be non-zero during
> cma_init_reserved_mem().
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
> v2 -> v3: Separated the series into 2 as discussed in v2.
> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/
> 
>  mm/cma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 3e9724716bad..36d753e7a0bf 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -182,6 +182,15 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  	if (!size || !memblock_is_region_reserved(base, size))
>  		return -EINVAL;
> 
> +	/*
> +	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
> +	 * needs pageblock_order to be initialized. Let's enforce it.
> +	 */
> +	if (!pageblock_order) {
> +		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
> +		return -EINVAL;
> +	}
> +
>  	/* ensure minimal alignment required by mm core */
>  	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
>  		return -EINVAL;
> --
> 2.46.0
> 
> 

LGTM, hopefully this comment regarding CMA_MIN_ALIGNMENT_BYTES alignment
requirement will also probably remind us, to drop this new check in case
CMA_MIN_ALIGNMENT_BYTES no longer depends on pageblock_order later.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

