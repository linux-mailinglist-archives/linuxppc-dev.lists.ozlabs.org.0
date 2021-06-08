Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F5B39FBFB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwCR67BSz3cYK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAN/Fa8W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+20703f0a86d9058a1f86+6498+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=gAN/Fa8W; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzw8s42phz300K
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:06:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XwFsKV0wTnqrjM2zeN8AG8XOGt14/N7ay2THQ9JeNTU=; b=gAN/Fa8WhYn6iNnCWrgN61xP/7
 qpzWIbLp0RYRHKw+NrnaYNk86XGlBkEyNRZLSg+GjvrOS8dmNbfGeS9TaVA0rvGZTGvYqu20webuB
 fT//Gqjhw5BrXJ6eG7EsymCK6M9V8oVkAIum+X29mXJKhsWauuNFnG1S8uKWQPoxx07AsAXKnHiDM
 eezVe5V2bDEhRbNtHqKM1THzpw5ZQMP5ng6DjhKyhuQSgWmrH8JXt8cz85Ba93BG0y+rgch2mzvYp
 uTW6yTIWA84hxpbqarGW1LvLqWd9BltX1o8xjsjJ6gNYQIu6J7HYcOTEWcCAf/Ps19PgmjiQKbx4M
 KvtAPxqw==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeFE-009Rci-3P; Tue, 08 Jun 2021 16:06:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/16] bvec: add memcpy_{from, to}_bvec and memzero_bvec helper
Date: Tue,  8 Jun 2021 18:05:52 +0200
Message-Id: <20210608160603.1535935-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add helpers to perform common memory operation on a bvec.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/bvec.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index d64d6c0ceb77..ac835fa01ee3 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -189,4 +189,19 @@ static inline void *bvec_kmap_local(struct bio_vec *bvec)
 	return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
 }
 
+static inline void memcpy_from_bvec(char *to, struct bio_vec *bvec)
+{
+	memcpy_from_page(to, bvec->bv_page, bvec->bv_offset, bvec->bv_len);
+}
+
+static inline void memcpy_to_bvec(struct bio_vec *bvec, const char *from)
+{
+	memcpy_to_page(bvec->bv_page, bvec->bv_offset, from, bvec->bv_len);
+}
+
+static inline void memzero_bvec(struct bio_vec *bvec)
+{
+	memzero_page(bvec->bv_page, bvec->bv_offset, bvec->bv_len);
+}
+
 #endif /* __LINUX_BVEC_H */
-- 
2.30.2

