Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213731A80
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 10:14:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45GDcH4HgdzDq8W
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 18:14:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+47bfdebe920718d2a071+5760+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="REuEawrB"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45GD5x2yqGzDqc3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 17:51:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d1mKwnxq0/21AleEJW7W0Ivu2dwVglOxlHTSE/EgRxs=; b=REuEawrBG9hy1w/8tCiSMSGDQr
 QmlJAVeLmCzHaQeCZ6QVeotjDLj2GXg0W/wnB9YZ+BE6+11w0s6WZNPG/ikohc3P+qPllwiZPMOZK
 Uf04Dcy7w+CE2UCj6lraV7/IJ6LgNaen6eTng5WzyUKlNntVp+5qt3qWaxSE8Xj9X9jm3fnM5ql4O
 0nTV/cHhydhIgwqLfn+yXdOjke+6B6TCGd8c4gIT1VmjmBwuNJIQ8+VkzzOaaEcb2BsUXCDy+tudh
 rVmzdbazRoVoLH18OBy5SxhO/nmLtVZkuB2qMC7Nswrxp+XFEatPa01wyJPnEAwRdzn16fDGmzYOW
 wWqwVD1Q==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWyn8-0007rr-9v; Sat, 01 Jun 2019 07:51:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 15/16] mm: switch gup_hugepte to use try_get_compound_head
Date: Sat,  1 Jun 2019 09:49:58 +0200
Message-Id: <20190601074959.14036-16-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601074959.14036-1-hch@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
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

This applies the overflow fixes from 8fde12ca79aff
("mm: prevent get_user_pages() from overflowing page refcount")
to the powerpc hugepd code and brings it back in sync with the
other GUP cases.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index e03c7e6b1422..6090044227f1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2006,7 +2006,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		refs++;
 	} while (addr += PAGE_SIZE, addr != end);
 
-	if (!page_cache_add_speculative(head, refs)) {
+	head = try_get_compound_head(head, refs);
+	if (!head) {
 		*nr -= refs;
 		return 0;
 	}
-- 
2.20.1

