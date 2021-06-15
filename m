Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CE3A7F49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48Hz6Mhdz3cCV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:27:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wANQzPa4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+01b1093948f83d17b939+6505+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=wANQzPa4; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48Gx1JF0z3byD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:26:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tk1mvrcMufCVrgPg3C2xpZf19iy4PPS7BLzt3IIAZvo=; b=wANQzPa41ytnopaUFssGsxbY/M
 0hq96FVjjN51t4RFAdxzVXUFPl0WUQLIbryYoFCPF/RjQES70xir5/HgL6PJk1gNMd37GODvP/1Dm
 Uzt6nVMXjvWx9mYamO6qDeBp7iZ/XNXIGVbmPHNVofwUiqxf9BcX7viQOfbejADb2yzdjwQuWw1ez
 Qh42dGYWXVx7ED1ej5SSPI51boZURyYoc8+CShjqpV6o+VAVTSqlIA3wU+IjHhKuwUW7e4eZzbhFS
 uVX7vILZQklZV3RqCK7W6WJdHFzvyE3HhNauq8NtfVgWYDXTgLnBzDfEQrl8sh75f66KWeuxyh2XB
 dTCoPkmw==;
Received: from [2001:4bb8:19b:fdce:9045:1e63:20f0:ca9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt94D-006nuj-Vv; Tue, 15 Jun 2021 13:25:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 02/18] mm: use kunmap_local_dirty in memcpy_to_page
Date: Tue, 15 Jun 2021 15:24:40 +0200
Message-Id: <20210615132456.753241-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615132456.753241-1-hch@lst.de>
References: <20210615132456.753241-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

memcpy_to_page can write to potentially mapped page cache pages, so
use kunmap_local_dirty to make sure flush_kernel_dcache_pages is
called.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/highmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 65f548db4f2d..d0497c0daf80 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -333,7 +333,7 @@ static inline void memcpy_to_page(struct page *page, size_t offset,
 
 	VM_BUG_ON(offset + len > PAGE_SIZE);
 	memcpy(to + offset, from, len);
-	kunmap_local(to);
+	kunmap_local_dirty(page, to);
 }
 
 static inline void memzero_page(struct page *page, size_t offset, size_t len)
-- 
2.30.2

