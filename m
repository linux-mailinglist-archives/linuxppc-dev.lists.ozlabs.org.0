Return-Path: <linuxppc-dev+bounces-9164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0AFACEB16
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 09:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCc3D56kxz2yLB;
	Thu,  5 Jun 2025 17:46:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749109608;
	cv=none; b=Le7tdkVU+XffB3PhWxCrRJY34V9HeqbWRZJyQHIRluc/H3xUxAp0238nKThp7h7dAsEpGvRQ7ZdlT3u7vvPR56Mfyt38H3nNEy0alRnG6UpqSK6MKDZ0P7C4sdUv8OeeKJS2EExA/8R5QBccqmWf3QdFzjHwWDS1+co7UJJFmiLxXOZ9bz63XdMoYzrmS3yMWq6bHjcaqAe8fnr7Brw5r4WbNfrxpxXcSbwvaidJ1L5E8orpc3s9Dm+OzaOZsw+uP5H1EFgxmRc3bTsfWbtqor9mff9gYIpo8K7WIsGa2Y55F+uAM+poZJX+wUCQFpy5SzOxA7NzOuOoeVCcsTR56w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749109608; c=relaxed/relaxed;
	bh=cKee/qIwlygXPG54z9FwQFwIvcRLKFKQeaibnDMRW2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGRXyZStCi94bCgxJqDwFe1FY20hfRcSUgW/kCjKna/O5NwPp+zTpQ9zudPymEm9mAEy4m3aNYzzNeG9B27zbwb6fhCgrGbeq49F+Vg8x+x+3aHQ+cF9Mvl75El/uKoBvzjuemTTCH6rM8Da2n9Im/Bak49S/89KcB2yWmyyGeowNrsjTxA/uiFGsHzi/Ao61AzfS48eclJ/cLsRdkMXdZpjGaEZrhYztg1XG//7JfywUCev4sY0u6wM4tA+Qo+FRM6f7/tlKNd9HtLRuGEnZ/u1wV3+4+YILCMHHYBanf97VQGf534KpoaLFZ4EeRnKSgYezM4hreWF9J25zsCgGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCc3B6NnFz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 17:46:45 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7FA0568AA6; Thu,  5 Jun 2025 09:46:37 +0200 (CEST)
Date: Thu, 5 Jun 2025 09:46:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
	gerald.schaefer@linux.ibm.com, jgg@ziepe.ca, willy@infradead.org,
	david@redhat.com, linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com,
	debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250605074637.GA7727@lst.de>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com> <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com> <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 04, 2025 at 06:59:09PM -0700, Dan Williams wrote:
> +/* return normal pages backed by the page allocator */
> +static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
> +					     unsigned long addr, pmd_t pmd)
> +{
> +	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
> +
> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
> +		return page;
> +	return NULL;

If you go for this make it more straight forward by having the
normal path in the main flow:

	if (is_devdax_page(page) || is_fsdax_page(page))
		return NULL;
	return page;

> +static inline struct page *vm_normal_gfp_pte(struct vm_area_struct *vma,
> +					     unsigned long addr, pte_t pte)
> +{
> +	struct page *page = vm_normal_page(vma, addr, pte);
> +
> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
> +		return page;
> +	return NULL;

Same here.


