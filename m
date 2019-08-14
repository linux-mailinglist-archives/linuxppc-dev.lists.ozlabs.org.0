Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EAE8D4A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 15:26:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467r2t2wKpzDqnc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 23:26:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+147547a3be601d556dd4+5834+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="K1C/bVC0"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467qyD3mFfzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 23:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6DipVnf/iFLR86E9PK/JkLlJ30aOoxuUFZkmN2ZR1VU=; b=K1C/bVC0YtBKBHBcSCCkF8NWj
 mk/TaQ5AvnDUGjvesdXXjOSlnnkitLTjj2Y0sD0VPLYFC50BPF2Tx7qRcqeg3UWPWYk5b9yQVZHQg
 IKJKJgfnm6Yk47lJgm4Y6PBFax2gl7KDZmyj+KTqvKLEDUilKHuozFOsWBcIxwuEH99YM5deSrnlQ
 v0DnT0VBx/icjvXThyzdR3XTCPNJfY+eT90FW15uB4Z6sYGzBq2VgKjz8W6Cw2P4VGZ4WZyZ3iVyE
 VjV3A02MkUY4jg0jo+H6qACSQuS0i5z6pFGeR6ccQy1Pce8/b2p9jRPwL+fUCngMZ9T1DkMtFrkCP
 RFf7tlLAQ==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hxtEX-0002YB-6L; Wed, 14 Aug 2019 13:22:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: use the generic DMA direct remap code on powerpc
Date: Wed, 14 Aug 2019 15:22:29 +0200
Message-Id: <20190814132230.31874-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi powerpc maintainers,

this patch convers powerpc to use the generic dma remapping code
for the uncached coherent allocation on non-coherent CPUs.

Christophe Leroy tested a slightly earlier version on ppc8xx.

Note that I plan to move the need for the arch to call
dma_atomic_pool_init in this cycle, so either this needs to go in
through the dma-mapping tree (or a shared stable branch with it), or
we will need a small manual fixup in linux-next and when Linus merged
the later of the two pull requests.
