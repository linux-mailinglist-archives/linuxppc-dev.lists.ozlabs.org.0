Return-Path: <linuxppc-dev+bounces-11973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37EDB5067C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 21:38:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLvHW48cDz305n;
	Wed, 10 Sep 2025 05:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757446679;
	cv=none; b=mpvw4sy2kXfmR/vWo58Tpea4W5DgKkJgfuWv3g5BSDu3+XYcKR+S418lm5rWX5UYNPQJVuGr2Sr2jpwtFaSrLyRoWP/HzNmMM2st1GpV9/7kvrl1MXeqCcfndPEbtrlJNWCjLMDZk2/UEj3Y1f2FUNPVcRr7zW9myZLTb9PIJ0vF+qV5ytr/Eekftk9d6jVvaOkbHVl3UzdFbZ4Dx6d3pNF1FOt6u069BQ/uPFowr46WWHGkbKwDBRoqw27v6vTeI4a3DxHZPgeIcY9kgY7kKCnTlpsKxdKOFeV3hPxjxyWlf7BADuIVFtw8Am+NMDtNkhf+ROfZ04ovN5cu75I3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757446679; c=relaxed/relaxed;
	bh=zMm2NBLKPbhkgjTIqBzOjplNw/nP7kHLNg99irSoOEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLbGsN/5QUOrqG9LSnwoueYW7U9VroQSE5e5BRD8YlRBFdnhzQHjj3oJD8u/K4azvGwEir43qnTjiK7qiZ42wwYmmri0hTdrA4RQfoZphhcsEwOG9hY2JNYY0ZiBC7+5GTVcEoI30WjqRrL1wt6o9d1LxIPZ0P5/pPzXBbpPAzzQLpx1VPAevQXoT/hiuOeZL1PN5q9Z2cA7Qv36moSW+h2/V13CZi9o47ttQ+B+7qNM1qkHY5UOnlESDIU3WNeso4CrD4W10CQ0bdcPg3yinEuyX3K50SdLvebj+xsIy/B5nQ1k+yGGmJz6e1jmVPH1k2Vvg/U3zfwFZqRDx1wJMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BK33sGpV; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BK33sGpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLvHV3wcKz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 05:37:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F194442F8;
	Tue,  9 Sep 2025 19:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BB1C4CEF4;
	Tue,  9 Sep 2025 19:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757446672;
	bh=Vkfs1C2Q/m2ciXngYEnMywKI/5g7jYuOYmYnMi4Z+6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BK33sGpV6gJZdNQka35B5igzFncF6O4QoVJduYx5uymEwm19+Pae/Y8Ji2ztm6vFh
	 Of79hrgQzN752E6kK9Pd6CitdpQ05JM71b0yY2nJK5WUadz3JmWI4AqHd+rhRkpPML
	 jPSesTwS7Zw48bKNgh3AxJtfj3r28MMf09jWFv3Lide1Ok8C5lkasp0zoJfr6zuOnF
	 N5cxlSvTSt07fnYvpbKZtFqt6TP2eL80kCSBPIQL9mOveIT/STSyNFrSlP91N6uUF+
	 FdL0uwcDH/ATxbhiykxuiJP1XMjnnp4vhtxpR+0sRrU4PCEIaA22KI5S4HXWZpjWlB
	 smMV1bUYsFvcA==
Date: Tue, 9 Sep 2025 22:37:48 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 03/16] dma-debug: refactor to use physical addresses
 for page mapping
Message-ID: <20250909193748.GG341237@unreal>
References: <cover.1757423202.git.leonro@nvidia.com>
 <56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
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
In-Reply-To: <56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 09, 2025 at 04:27:31PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>

<...>

>  include/linux/page-flags.h         |  1 +

<...>

> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -614,6 +614,7 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
>   * available at this point.
>   */
>  #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
> +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))

This was a not so great idea to add PhysHighMem() because of "else"
below which unfolds to maze of macros and automatically generated
functions with "static inline int Page##uname ..." signature.

>  #define folio_test_highmem(__f)	is_highmem_idx(folio_zonenum(__f))
>  #else
>  PAGEFLAG_FALSE(HighMem, highmem)

Thanks

