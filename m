Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B12396A6CCA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 14:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRZDn4dzPz3cdd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRZDD2yYXz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 00:03:23 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4AF6C67373; Wed,  1 Mar 2023 14:03:16 +0100 (CET)
Date: Wed, 1 Mar 2023 14:03:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 2/5] dma-mapping: Provide a fallback
 dma_default_coherent
Message-ID: <20230301130315.GA467@lst.de>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com> <20230223113644.23356-3-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223113644.23356-3-jiaxun.yang@flygoat.com>
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 11:36:41AM +0000, Jiaxun Yang wrote:
> dma_default_coherent was decleared unconditionally at kernel/dma/mapping.c
> but only decleared when any of non-coherent options is enabled in dma-map-ops.h.

Overly lone line here.

>  }
>  #else
> +#define dma_default_coherent true
>  static inline bool dev_is_dma_coherent(struct device *dev)

Please keep an empty line before the function declaration.
