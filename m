Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 853CE69E689
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 18:57:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLn6k3ZYqz3byj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 04:57:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=<UNKNOWN>)
X-Greylist: delayed 121 seconds by postgrey-1.36 at boromir; Wed, 22 Feb 2023 04:56:34 AEDT
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLn6B2TCJz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 04:56:34 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2263C68B05; Tue, 21 Feb 2023 18:56:29 +0100 (CET)
Date: Tue, 21 Feb 2023 18:56:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/7] MIPS: Remove DMA_PERDEV_COHERENT
Message-ID: <20230221175628.GB15247@lst.de>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com> <20230221124613.2859-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221124613.2859-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 21, 2023 at 12:46:07PM +0000, Jiaxun Yang wrote:
> As now we are always managing DMA coherence on per dev bias,
> there is no need to have such option. And it's not selected
> by any platform.

I think the real point here is that this is dead code, so it can
obviously go away, but:

>  config MIPS_GENERIC_KERNEL
>  	bool "Generic board-agnostic MIPS kernel"
> -	select ARCH_HAS_SETUP_DMA_OPS
>  	select MIPS_GENERIC
>  	select BOOT_RAW
>  	select BUILTIN_DTB
> @@ -1079,11 +1078,6 @@ config FW_CFE
>  config ARCH_SUPPORTS_UPROBES
>  	bool

> @@ -1097,6 +1091,7 @@ config DMA_NONCOHERENT
>  	select ARCH_HAS_DMA_PREP_COHERENT
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select ARCH_HAS_DMA_SET_UNCACHED
> +	select ARCH_HAS_SETUP_DMA_OPS

This is an unrelated und undocument change.  If you want to do it,
please do that as a separate patch with a commit log documenting
the rationale.
