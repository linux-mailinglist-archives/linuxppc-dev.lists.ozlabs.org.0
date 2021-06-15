Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E74D33A80CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:40:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48b54cNyz3gYy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=orcVM4ZS;
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
 header.s=casper.20170209 header.b=orcVM4ZS; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48RP4dW8z3c6b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:33:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1vl+lJtrWoiUzzKH0COLUmHTJyPccdOEl/SXPdFbHq8=; b=orcVM4ZS+23ndu19ILV+oG8Kdb
 EYq30bY5COpSe8j73G1ZSpdxCnZvGUug6zi+n3PtNKTIYr2gdrB6nrERB3vHdIIR4hPOT/UpTCyWs
 AYodO6/zr9y0OT7KoRpqlRoey1MBbGiUTgoxOd/kcm4TRjkQ8E3XYxEkGCrC8InktD++/3VespVyQ
 FAP7MeVYaSA+NqHbe0Hkisx+6r4BLNLdkNjC0eQtKEFztNzuWuVCAheweEjtcFUDpKAbuCLRmg4/G
 EVnQKf6DqMMaY9iFPuJi82thdu+6gkEtdThFuqtrkl3pXuuSly/nPtwkQFcg10SnbFD7sIkGMm4qc
 1ysBDTTA==;
Received: from [2001:4bb8:19b:fdce:9045:1e63:20f0:ca9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Ae-006obD-98; Tue, 15 Jun 2021 13:32:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 18/18] block: use bvec_kmap_local in bio_integrity_process
Date: Tue, 15 Jun 2021 15:24:56 +0200
Message-Id: <20210615132456.753241-19-hch@lst.de>
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

Using local kmaps slightly reduces the chances to stray writes, and
the bvec interface cleans up the code a little bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio-integrity.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index 4b4eb8964a6f..8f54d49dc500 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -172,18 +172,16 @@ static blk_status_t bio_integrity_process(struct bio *bio,
 	iter.prot_buf = prot_buf;
 
 	__bio_for_each_segment(bv, bio, bviter, *proc_iter) {
-		void *kaddr = kmap_atomic(bv.bv_page);
+		void *kaddr = bvec_kmap_local(&bv);
 
-		iter.data_buf = kaddr + bv.bv_offset;
+		iter.data_buf = kaddr;
 		iter.data_size = bv.bv_len;
-
 		ret = proc_fn(&iter);
-		if (ret) {
-			kunmap_atomic(kaddr);
-			return ret;
-		}
+		kunmap_local(kaddr);
+
+		if (ret)
+			break;
 
-		kunmap_atomic(kaddr);
 	}
 	return ret;
 }
-- 
2.30.2

