Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8C55360
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 17:29:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y97767mkzDqJk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 01:29:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c5155a46dc30cc8634d8+5784+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="k2Z56jK2"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y80h6nMhzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 00:38:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xf8xwUJqGTGhdY5pjBOHQgYHNWWmClOkIpScch6iAnk=; b=k2Z56jK2d5xI+yMTjSN6h/vuiP
 u0SXzPC5Gaaj+zKYS9DBaui94DW5JdYiyeLGMMheoNYb7P1thRVfck4ZdTInGgIhRsvlkKuVafPuT
 qoEpZkZKHIQ/5Yo/qDaES8pLnbs8H4v49XR4BJswGTUAtFhXZ6YE/EB8y06wbIQVXnxShdZGCT/mg
 oO6SyoF/565YBqQO+A8hQbcrcVfzoWPdpW0JqHQjy9NjYjmi6vmVYpj0yblBNGtKd6ZM5x0og1UTB
 RPTRcqRD3JNKL9CoM58cLDWs9bCXv7Bra0aDAA5QpvIx11coqbSOkucnqEEJaTJsAzvMcQnEY09x9
 vYVBnHwg==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfmaI-0008BD-Qf; Tue, 25 Jun 2019 14:38:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 16/16] mm: mark the page referenced in gup_hugepte
Date: Tue, 25 Jun 2019 16:37:15 +0200
Message-Id: <20190625143715.1689-17-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625143715.1689-1-hch@lst.de>
References: <20190625143715.1689-1-hch@lst.de>
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
Cc: linux-sh@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 x86@kernel.org, linux-mips@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All other get_user_page_fast cases mark the page referenced, so do
this here as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/gup.c b/mm/gup.c
index e06447cff635..d9d022d835ca 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2020,6 +2020,7 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
+	SetPageReferenced(head);
 	return 1;
 }
 
-- 
2.20.1

