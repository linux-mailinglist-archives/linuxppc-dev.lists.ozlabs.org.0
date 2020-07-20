Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B92255BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 04:04:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B94m83T5yzDqlY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 12:04:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=lizefan@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B94jq6HhmzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 12:02:23 +1000 (AEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 543F63716F98CB272491;
 Mon, 20 Jul 2020 10:02:16 +0800 (CST)
Received: from [10.174.178.86] (10.174.178.86) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 20 Jul
 2020 10:02:13 +0800
Subject: Re: [PATCH v2 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Nicholas Piggin <npiggin@gmail.com>, <linux-mm@kvack.org>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <20200413125303.423864-5-npiggin@gmail.com>
From: Zefan Li <lizefan@huawei.com>
Message-ID: <0e43e743-7c78-fb86-6c36-f42e6184d32c@huawei.com>
Date: Mon, 20 Jul 2020 10:02:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200413125303.423864-5-npiggin@gmail.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.86]
X-CFilter-Loop: Reflected
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +static int vmap_pages_range_noflush(unsigned long start, unsigned long end,
> +				    pgprot_t prot, struct page **pages,
> +				    unsigned int page_shift)
> +{
> +	if (page_shift == PAGE_SIZE) {

Is this a typo of PAGE_SHIFT?

> +		return vmap_small_pages_range_noflush(start, end, prot, pages);
> +	} else {
> +		unsigned long addr = start;
> +		unsigned int i, nr = (end - start) >> page_shift;
> +
> +		for (i = 0; i < nr; i++) {
> +			int err;
> +
> +			err = vmap_range_noflush(addr,
> +					addr + (1UL << page_shift),
> +					__pa(page_address(pages[i])), prot,
> +					page_shift);
> +			if (err)
> +				return err;
> +
> +			addr += 1UL << page_shift;
> +		}
> +
> +		return 0;
> +	}
> +}
> +
