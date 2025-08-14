Return-Path: <linuxppc-dev+bounces-11014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C839B26DD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 19:37:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2srw18dmz2yhD;
	Fri, 15 Aug 2025 03:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755193072;
	cv=none; b=aWGMlOZm86+tJeyH5LVeQ4NrvQUvNXAbkrKiCBxoem+RpU6nmzuOdj6LGh8S/o3db9tXpD2ryX+fqymQtotVdtnq6EaSOW0p0KyWnAWA7mvnYhsovM9eMvJt2IizCnLzvkoG6HpmS5LgUnczXvEIn6BW9sTl0yLfHaUuTi1qBaB5JDxzz5xENE2dvQZvG9XW9/C6sj6y3npshve5KmRUA09r7YUOTPbRWCRqoU8olUd5ZZ1Wn44fYDAKER6DaOrWJP8w8CSDc0Xswq0A9pQNDTN8r+6oHXXmYHN1zM04JmBLtwm8JLTErPbGpdHrWh2/b0WrBrfBxvhKuS1iJdoU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755193072; c=relaxed/relaxed;
	bh=OE4LAchkYGbRbWIAPtKdq4yp8AV8hBrJ1qdnR14GXT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMVWa4oXW58pw1ygrizL4QkNYCbf6LWFXnr3dBSkddXLIJBsMG06325d1XdowkwJ6HbaHwgyP+ICbkGS+wPMe5s1Y/HGIFWE+fMmFo2zDpTDRpiUPgiqs6SRCIzPCW6/Smkc+zZNBWjVTz7rERITPnl/MKMGMW95N9gk77Yu0Cs/jnM2tUDRnCjABIkK9aDbfsqsoEjtnzqfzmUDu63H2TXX30uGlWc06NHSGFBx+lsJMt0KYt/WIjn4fmoXY1TA3DZMBktVLjzm3fLvO/eAwAh/o4IYKmGHPZSw7c+JS0ul9AHmRA0s/jSNYgHpBuNXufJAi61E5VbQLfcijk/4Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4KLyFDU/; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4KLyFDU/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2srq2KRZz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 03:37:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OE4LAchkYGbRbWIAPtKdq4yp8AV8hBrJ1qdnR14GXT4=; b=4KLyFDU/Vumsz96izTNEFh1dPT
	gcELlCyTppY1dhYETNtbcxbOIeh1/sthMu9DbTeiVaAcP7tcEuyIkykR+tjpcFgzaiM4l5e7zW/99
	WT21f95NU5V6ne9427BqfukuNCmE4P8LKLVbcXGI3NVbyx+CI0xucaJY3VBJ0r3B7kFJXEhhBYBCH
	rRABtXI9ZkOcgZvf82D6jL0f5HF0S2ekt30gXEkdZuKsfcL0Px0gARfb1GdZ7N6PG/l3W5OuzmpWz
	GxsIWFejW3a3LSYz1Mfw2PcJDMlTUQWwRae7vRCeE50nJNZOOiGyqf3SNV1eNn7Mpy146jdENj5EG
	0OjLyf7Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbtD-00000000E9n-3MTt;
	Thu, 14 Aug 2025 17:37:23 +0000
Message-ID: <c855a4f9-4a50-4e02-9ac6-372abe7da730@infradead.org>
Date: Thu, 14 Aug 2025 10:37:22 -0700
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dma-mapping: introduce new DMA attribute to
 indicate MMIO memory
To: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Alexander Potapenko <glider@google.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
 iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
 kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
 Sagi Grimberg <sagi@grimberg.me>, Stefano Stabellini
 <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1755153054.git.leon@kernel.org>
 <f832644c76e13de504ecf03450fd5d125f72f4c6.1755153054.git.leon@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f832644c76e13de504ecf03450fd5d125f72f4c6.1755153054.git.leon@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Leon,

On 8/14/25 3:13 AM, Leon Romanovsky wrote:
> diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
> index 1887d92e8e92..58a1528a9bb9 100644
> --- a/Documentation/core-api/dma-attributes.rst
> +++ b/Documentation/core-api/dma-attributes.rst
> @@ -130,3 +130,21 @@ accesses to DMA buffers in both privileged "supervisor" and unprivileged
>  subsystem that the buffer is fully accessible at the elevated privilege
>  level (and ideally inaccessible or at least read-only at the
>  lesser-privileged levels).
> +
> +DMA_ATTR_MMIO
> +-------------
> +
> +This attribute indicates the physical address is not normal system
> +memory. It may not be used with kmap*()/phys_to_virt()/phys_to_page()
> +functions, it may not be cachable, and access using CPU load/store

Usually "cacheable" (git grep -w cacheable counts 1042 hits vs.
55 hits for "cachable"). And the $internet agrees.

> +instructions may not be allowed.
> +
> +Usually this will be used to describe MMIO addresses, or other non

non-cacheable

> +cachable register addresses. When DMA mapping this sort of address we

> +call the operation Peer to Peer as a one device is DMA'ing to another
> +device. For PCI devices the p2pdma APIs must be used to determine if
> +DMA_ATTR_MMIO is appropriate.
> +
> +For architectures that require cache flushing for DMA coherence
> +DMA_ATTR_MMIO will not perform any cache flushing. The address
> +provided must never be mapped cachable into the CPU.
again.

thanks.
-- 
~Randy


