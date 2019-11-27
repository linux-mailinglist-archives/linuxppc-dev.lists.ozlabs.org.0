Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48810ABBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 09:30:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NDV84zrgzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 19:30:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+230b1395c146a7dc824f+5939+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NDS16DTpzDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 19:28:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LWu0UYYs7bnK8ElFHR7JEZa6mX6bHvaBoAGnBrEd4eA=; b=BCMs7xCGx4+9EuTlluEyg53DW
 87WGVpXWmjnnpSyNe0UkaDOQe9Hfn5RkYB2pEJeGIbOt1UrrxH+1fAjWE7/eDmq5g68inqY8TDKaD
 z1ozQfL4fDe6K4EtvdNgUEkyORnZkm8199Na5Wse8BJeDS6Flv7DhjAD/tmbe4H2Usi9vydgWHCRr
 vy20cK4RT/4Tqctn9/fj5yt9sgAuSG343k54Cr86MVdv2PprzqtgIYyKlknToJi7U4PJUiBjx4lk5
 +6CusoaTmD7PtIGFdnp5cLoh3o1Y4iNitgUUWaaM2PKaPcev4PEmty7qVFJXnza/KZTM6j3+zVXlC
 YF/L7toGw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iZsgE-0005ru-IC; Wed, 27 Nov 2019 08:28:10 +0000
Date: Wed, 27 Nov 2019 00:28:10 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Haren Myneni <haren@linux.vnet.ibm.com>
Subject: Re: [PATCH 02/14] Revert "powerpc/powernv: remove the unused
 vas_win_paste_addr and vas_win_id functions"
Message-ID: <20191127082810.GA17097@infradead.org>
References: <1574816607.13250.6.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816607.13250.6.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 26, 2019 at 05:03:27PM -0800, Haren Myneni wrote:
> 
> This reverts commit 452d23c0f6bd97f2fd8a9691fee79b76040a0feb.
> 
> User space send windows (NX GZIP compression) need vas_win_paste_addr()
> to mmap window paste address and vas_win_id() to get window ID when
> window address is given.

Even with your full series applied vas_win_paste_addr is entirely
unused, and vas_win_id is only used once in the same file it is defined.

So instead of this patch you should just open code vas_win_id in
init_winctx_for_txwin.

> +static inline u32 encode_pswid(int vasid, int winid)
> +{
> +	u32 pswid = 0;
> +
> +	pswid |= vasid << (31 - 7);
> +	pswid |= winid;
> +
> +	return pswid;

This can be simplified down to:

	return (u32)winid | (vasid << (31 - 7));
