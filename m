Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F954B3C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 16:50:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMrvJ3y3Jz3cgF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:50:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f9NsQX1z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+0328d076c2e0ee158334+6869+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f9NsQX1z;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMrtd5VPxz3bkW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 00:49:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+6etGlUiNvgn9hstecvBA3b8FX4JZnQNviSpWGSLA8U=; b=f9NsQX1z7j7m14FV2KxH9c0FDr
	qDMbpC879o4gHZs8o85N03DpHO7o39bGi+KBIoYXQue5h063UNfsHRqFo/gywomm/whKKLxyNWQ/6
	iuPkGmlz+bq/faRanpP/dxLDe8Op/CkOeWZsyBj1gl9oifNuaGU/kKVz0EqsGQ0UOki9vzoGYV7BD
	+dw7gTLjvV3qKROgz75qixYHs5Epd/YwOXan9PGnFC9rsl/6Mp1vJb2cW9qGM+x2wEjp9mUtZsNjt
	hMBCzCwVW2yP4XrUZJpTjmZn3vbuMFxR3Dr/OS2buw3KUAv+c8L1IauSvAC/81gPbaOQsS1Cw0alQ
	GbxQ7AXg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o17r1-00A1me-IG; Tue, 14 Jun 2022 14:49:15 +0000
Date: Tue, 14 Jun 2022 07:49:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc:mm: export symbol ioremap_coherent
Message-ID: <Yqif65sCt9hUEjUf@infradead.org>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB2951EBFD4C4EB2A2519FF4199FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <8735g7cym2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735g7cym2.fsf@mpe.ellerman.id.au>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, Wang Wenhu <wenhu.wang@hotmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 08:45:25PM +1000, Michael Ellerman wrote:
> Wang Wenhu <wenhu.wang@hotmail.com> writes:
> > The function ioremap_coherent may be called by modules such as
> > fsl_85xx_cache_sram. So export it for access in other modules.
> 
> ioremap_coherent() is powerpc specific, and only has one other caller,
> I'd like to remove it.
> 
> Does ioremap_cache() work for you?

Chances are that both are the wrong thing and this really wants
memremap, as SRAM tends to have memory and not MMIO semantics.
