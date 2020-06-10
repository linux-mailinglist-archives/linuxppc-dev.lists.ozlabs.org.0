Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31B1F50B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 10:59:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hgt22RJ8zDqNg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 18:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+0cefd36029696be727ef+6135+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hgr51GjgzDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 18:58:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RoWl7habK/jUuINMMvGIQ6fXacHcTIf9gpnh29uDOPI=; b=rMaeFtN/3bKy60cRlpBiIltSU4
 6PG1A5wVk7ZfnZmVJ7s27HcLPwiLq9TJAgahNioUx6vXCkvtchMvUIHtrgbPDykjTR/6ZS16LrPsC
 qwBb5PDbgZBuTsUN7IVcdfrfZApEVXfgef23gaya+zklrDnFrd5tz5hW2hqkwF9p9dfAQnjlZvuwA
 jJzKYUH87wq/2k9kILvOA5B4tvWwMWbQwtMOBi8B8c79qT/S4Tqe6lIPOJDIFS/goNLi7JGVnYry4
 uWxfsWiCrgAmdXe7sfLt7JGQq+00NcQu0bffHDOxyXbo5bgt/ke3pFxhWjZCc6DlxoxqM3EhNaLpc
 UChtimGg==;
Received: from 213-225-38-56.nat.highway.a1.net ([213.225.38.56]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiwYh-00036D-3w; Wed, 10 Jun 2020 08:58:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: jk@ozlabs.org,
	arnd@arndb.de,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc/spufs: fix the type of ret in spufs_arch_write_note
Date: Wed, 10 Jun 2020 10:55:54 +0200
Message-Id: <20200610085554.5647-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Both the ->dump method and snprintf return an int.  So switch to an
int and properly handle errors from ->dump.

Fixes: 5456ffdee666 ("powerpc/spufs: simplify spufs core dumping")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/cell/spufs/coredump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spufs/coredump.c b/arch/powerpc/platforms/cell/spufs/coredump.c
index 3b75e8f60609cb..014d1c045bc3cf 100644
--- a/arch/powerpc/platforms/cell/spufs/coredump.c
+++ b/arch/powerpc/platforms/cell/spufs/coredump.c
@@ -105,7 +105,7 @@ static int spufs_arch_write_note(struct spu_context *ctx, int i,
 	size_t sz = spufs_coredump_read[i].size;
 	char fullname[80];
 	struct elf_note en;
-	size_t ret;
+	int ret;
 
 	sprintf(fullname, "SPU/%d/%s", dfd, spufs_coredump_read[i].name);
 	en.n_namesz = strlen(fullname) + 1;
-- 
2.26.2

