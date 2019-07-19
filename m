Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD566E239
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 10:07:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qkB44Dp3zDqkp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 18:07:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+0127b854950d050a2cef+5808+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="hY4ZF+xW"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qk8J6S89zDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 18:05:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j6m3dpxjPQBgsve5FxBN1VXYoBHhVQWi8vavLjXXQ1g=; b=hY4ZF+xWw7VgyJbXMBef6njm4
 uieIvbJvrktQEv3bl335vW3eC33Mp3HvXaEixDrB8YKz1VLETL3Fz5ezK0rpvE35hc9dmj1s1wiNK
 hPSxJOFvMxo9iBVrCG/BrnHGodwucUu1gsXYK4fiddTDt1ffgNC52gSbwEJAKwOPyDzOPrEq1A+zK
 Gt+ziY1HSZr+TJqi32nmWpYtD2LaMcDJx+JCvRU2JEAa7D6NcRChpkOdVSU9g1IYnugS/xunuxgtB
 rxdiGrMjwhurVGEsSMqxeSiMWkZA46dwuJNsF5T985DlL3Kwjy4X4cJW+FT4J0ccTV+nHgJGL2zAb
 uaWNiZj2g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hoNtU-0002VN-QO; Fri, 19 Jul 2019 08:05:32 +0000
Date: Fri, 19 Jul 2019 01:05:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: question on "powerpc/pseries/dma: Allow SWIOTLB"
Message-ID: <20190719080532.GA3861@infradead.org>
References: <20190719071014.GA1922@infradead.org>
 <0f969485-a3fe-4436-a448-5f4c4f875cb2@ozlabs.ru>
 <20190719075348.GA2892@infradead.org>
 <33ba562c-1a87-58e2-4105-520834d5b969@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33ba562c-1a87-58e2-4105-520834d5b969@ozlabs.ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Christoph Hellwig <hch@infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2019 at 06:00:25PM +1000, Alexey Kardashevskiy wrote:
> > But shouldn't we force usage of the direct ops in that case as the
> > IOMMU is not neededed at all?
> 
> We do, for mappings, but not unmappings and syncing.

Well, I mean as in literally not setting a dma_ops so that the
dma_direct code is used without the indirection through the iommu ops.
This is not only more obvious, but also faster as you avoid the
indirect call (although that probably doesn't matter much if you
are bounce buffering anyway).

> > Also isn't that support non-upstream so far?
> 
> How is this relevant? I expect the existing "swiotlb=force" just work.

I though the whole secure VM support was still not upstream.
