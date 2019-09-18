Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A354B64FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 15:49:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YLtS5JkqzDrPP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 23:49:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+f1854d73aee8f6fdf736+5869+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="t0sHHbkP"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YLhm3SsgzF47D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 23:40:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1vgoCsT0xO+Rn0pklazhNMvrKBUV1W3s56aPAfmOcsg=; b=t0sHHbkPpIo/HUcrOE6fruK/7
 4FJLr13BgWmHp/DVqbXnyy1jTgfoGRtLlhx85IH69rVWow/hNGOgPhAsgys/vfYYlZN+P7d7dpIqQ
 c8HyieCSr2f/y6XLy/ZPU74g8IgR0vI5WeqmHrRItXMqhCm1i74hG3TZ5UMjupSPg/PNWtBSbKOVc
 waYDmgdd8unQsSezDki4aUVdRJtuYnTPmnG41y0PgQ33IiHPua8AhJZFQdziQRy3DDvwHYebFHg3V
 dXABWys0mZMPAofRKgUXPGLK5rMJsIqSiR5SA1sU2JsLUSjhVu28FcbwSIKcIw6qsxxI0hV63g82j
 8AipFOU/Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iAaBt-0006wS-Re; Wed, 18 Sep 2019 13:40:17 +0000
Date: Wed, 18 Sep 2019 06:40:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 0/4] powerpc: Add support for GENERIC_EARLY_IOREMAP
Message-ID: <20190918134017.GA22027@infradead.org>
References: <cover.1568295907.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1568295907.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, hch@infradead.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 12, 2019 at 01:49:40PM +0000, Christophe Leroy wrote:
> This series adds support for GENERIC_EARLY_IOREMAP on powerpc.
> 
> It also adds a warning in the standard ioremap() when it's called
> before vmalloc is available in order to help locate those users.
> 
> Next step will be to incrementaly migrate all early users of
> ioremap() to using early_ioremap() or other method.
> 
> Once they are all converted we can drop all the logic
> behind ioremap_bot.

Thanks, this looks pretty nice!
