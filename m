Return-Path: <linuxppc-dev+bounces-16902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ15FvlplGmNDgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 14:15:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499C14C778
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 14:15:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFg9w5Kpkz3bf2;
	Wed, 18 Feb 2026 00:15:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771334132;
	cv=none; b=VblTNc//VujkrxkqjywU6aSa/WAU3+ag2jCCo3NritBKxmiEtBA2lvThhHd7Yz19GWiAIan58gs3M+C4Zc5P7RAtthwz52Wv9TbZAWwP6C+2eDCmwiUgV2Q5dVYr/wa4+14jVOZsW/ghMq+jOZ+qsVdpNd6Sn8Fk5pQ5WHhJLkQdwSoctWxEnLCpz6rz+kq/BL+hNQAlAH7TyFPoWYjqTByftiZVWPwJ82s0m9Zto7XIY3xIOpMQHuWUGoMI+C3lP6P5aYCs0rQepRg1llZ65U8FWSHH5mhunr/nxhuwVIJ7H3yPtP8FbBpKmUuEXlrrVmpXC7qNno2YZ06JKWJSig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771334132; c=relaxed/relaxed;
	bh=2hzhBGgDkYDfFunUaGLunBT1xzGB/bv/VhpSq++X7ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbBep0dAgsS20zSnwznbzD43pqANRlau7NYKGdypiCyCG9HXtK24NeUWhnJsO/V3A2zin0XuWBPEvduwqnIGRR3NNQoRXG7q594FcMNVqVUhrUcBI+IG/n6MF1jN9m9n9lyo9XyhV2RjP4nE1ajqPZeVy2WvMyclY8yryflpzuHj671UBXswyQUQqpc9x8jShWpyeqAhWQDpeVMBOzP0Zd1AdjlU3Nutm7QGBlv6xZZm89i5vZSuTMWHYMpTs5bnYWqxIp8j/bvPXtauxdrHHYESqX7wj2sgv5NlLE2AHzeZRwrdQH6nuo2ynM5zovgLzTBG0VhGgCS99HyYqAIwTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F44Ix8zf; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F44Ix8zf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFg9v50szz30hp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 00:15:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43946406EF;
	Tue, 17 Feb 2026 13:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD7C4CEF7;
	Tue, 17 Feb 2026 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771334129;
	bh=IFqWRnMOe90PHPZ6ogIhD60Li5AyK3EFhOC6WZ8V4S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F44Ix8zfCzwWI4AQs9GQP2t1ynVHWLNSCY3twBxZFDsxlSu/RfSxZcW9hg0L7WEMK
	 DVLz5necSLs8Vd9sUbcqNxHiXhSe1wgYUNVz9W3t3HjIlpnMvOSIidbsZRLiskWn68
	 xItdSgwjZ64haQEHc9AA+Car4oFuKE6jJy6K1oZ9qp0NfO17s8m5QhB5G3se54yqng
	 +Woyi/px6vIOOUpaq+Jzvi7e5oKdunoebhikfsFPd3HTxF9VWSvih4dM6ug2R8hcj/
	 MvelNqZrwI6p0ECzsvxqAg+vPD6IuKSVLKEs3YzKCjc2YZAO5l2Mn9P1+IofP43CvT
	 66YAmYLUGAOHw==
Date: Tue, 17 Feb 2026 15:15:25 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
Message-ID: <20260217131525.GK12989@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
 <CGME20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364@eucas1p2.samsung.com>
 <e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
 <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[leon@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:glaubitz@physik.fu-berlin.de,m:robin.murphy@arm.com,m:linux@armlinux.org.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:geoff@infradead.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-alpha@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16902-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,arm.com,armlinux.org.uk,suse.com,kernel.org,epam.com,linaro.org,gmail.com,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,csgroup.eu,infradead.org,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.xenproject.org,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: 7499C14C778
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 01:55:56PM +0100, Marek Szyprowski wrote:
> On 17.02.2026 13:27, John Paul Adrian Glaubitz wrote:
> > On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
> >> From: Leon Romanovsky <leonro@nvidia.com>
> >>
> >> Convert sparc architecture DMA code to use .map_phys callback.
> >>
> >> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> >> ---
> >>   arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
> >>   arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
> >>   arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
> >>   arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------------
> >>   4 files changed, 82 insertions(+), 63 deletions(-)

<...>

> >> @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> >>   	bus_addr = (iommu->tbl.table_map_base +
> >>   		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
> >>   	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
> >> -	base_paddr = __pa(oaddr & IO_PAGE_MASK);
> >>   	if (strbuf->strbuf_enabled)
> >>   		iopte_protection = IOPTE_STREAMING(ctx);
> >>   	else
> >> @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> >>   	if (direction != DMA_TO_DEVICE)
> >>   		iopte_protection |= IOPTE_WRITE;
> >>   
> >> -	for (i = 0; i < npages; i++, base++, base_paddr += IO_PAGE_SIZE)
> >> -		iopte_val(*base) = iopte_protection | base_paddr;
> >> +	for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
> >> +		iopte_val(*base) = iopte_protection | phys;
> 
> 'base_paddr' was aligned to start of a page before this patch, while 
> 'phys' includes the offset within a page.

Thanks for the fix. I had assumed we needed to revert all changes in
iounit_get_area().

Thanks

> 
> 
> Could You check if the following change fixes the issue?
> 
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index 46ef88bc9c26..edb0ffb21e2f 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -312,6 +312,7 @@ static dma_addr_t dma_4u_map_phys(struct device 
> *dev, phys_addr_t phys,
>          if (direction != DMA_TO_DEVICE)
>                  iopte_protection |= IOPTE_WRITE;
> 
> +       phys -= offset_in_page(phys);
>          for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
>                  iopte_val(*base) = iopte_protection | phys;
> 
>  >> ...
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

