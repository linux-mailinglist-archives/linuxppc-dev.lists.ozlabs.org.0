Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B735525E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 16:45:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y88s4GGzzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 00:45:33 +1000 (AEST)
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
 header.b="J5if1v3z"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y7zw01ZYzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 00:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+0/viyEOzdJ4g+CLfsqZmoPceslPqx1tCvvAPI4dyzQ=; b=J5if1v3zcVM4I6x+2c5HtP4Bna
 8Tefof1zgp+1eNhi7Lj/fWmEE2wW3rI8O4UbbH9ZXb6HT9QkCIwWaDfQ8VIjokPGOMCr4mTU7VKC3
 BDJ9kTuu2kMvLojAus5QH/0IZbOaX5UCvmyn6bQTIZDkRfCnABq3kui54EXCrUdecIPX1UjtuoJvk
 Jb00yuChRKvnfiSIvznda80OjYZGtraH1c+tG4xnPe3aJsyDJn7b+bxmvddcgwCNaZFotzFXb39bC
 IB9Dsngi53dguMdFaTUTcWZoQBNLbeV9ShycGEu2VkmE3PeGt9vtNUcVnJ2h/JtVajilfZH+flpW0
 eKQT/WWg==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfmZU-0007xc-Qw; Tue, 25 Jun 2019 14:37:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
Date: Tue, 25 Jun 2019 16:37:00 +0200
Message-Id: <20190625143715.1689-2-hch@lst.de>
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
 Jason Gunthorpe <jgg@mellanox.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This will allow sparc64, or any future architecture with memory tagging
to override its tags for get_user_pages and get_user_pages_fast.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/gup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index ddde097cf9e4..6bb521db67ec 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2146,7 +2146,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	unsigned long flags;
 	int nr = 0;
 
-	start &= PAGE_MASK;
+	start = untagged_addr(start) & PAGE_MASK;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
 
@@ -2219,7 +2219,7 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
 	unsigned long addr, len, end;
 	int nr = 0, ret = 0;
 
-	start &= PAGE_MASK;
+	start = untagged_addr(start) & PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
-- 
2.20.1

