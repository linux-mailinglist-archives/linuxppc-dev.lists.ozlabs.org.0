Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E211CC94B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 10:12:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KcHy29y7zDqw1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 18:12:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+effa4c2fe12dfa74dce9+6104+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=mPKJUt58; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KbwZ2r31zDqZW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 17:55:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TnbCkkwCrUJoVyKDF526uiErLGT3jwDipU5D/anO8xc=; b=mPKJUt58n7+nMzhhc54oH63pQM
 mqLu44nHNaFJZeW4BtfL3Nszeye3rc8YHdjDEjGf8xg3xzYYrSfHCY5nbabMfTBfeDSOkMMmS35ou
 LOq0Cm3ec2qhR34x6S9wtNGNeuufVaiFVNGQ6EA78N1lJbfLJVQOxwHBoVtXOUJ7LEM4LvpF30O3k
 m13ERlEUD8DKFhmebKzsLwdEd7rRAmNgmGpKczfhpk/gcktxKPPvNDkPqc0zvVEDL2Y0pohvODiyy
 vtpxm6SQgeQ2Ni9spFq2UDWdSqY4HMo95ucFjFiZLFQWqx3op44MZmPTFzx+L8rvvn5EzP4yrE2vp
 kheYPImQ==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgoA-00085z-3P; Sun, 10 May 2020 07:55:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 07/31] asm-generic: fix the inclusion guards for cacheflush.h
Date: Sun, 10 May 2020 09:54:46 +0200
Message-Id: <20200510075510.987823-8-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cacheflush.h uses a somewhat to generic include guard name that clashes
with various arch files.  Use a more specific one.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/cacheflush.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/cacheflush.h b/include/asm-generic/cacheflush.h
index cac7404b2bdd2..906277492ec59 100644
--- a/include/asm-generic/cacheflush.h
+++ b/include/asm-generic/cacheflush.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_CACHEFLUSH_H
-#define __ASM_CACHEFLUSH_H
+#ifndef _ASM_GENERIC_CACHEFLUSH_H
+#define _ASM_GENERIC_CACHEFLUSH_H
 
 /* Keep includes the same across arches.  */
 #include <linux/mm.h>
@@ -109,4 +109,4 @@ static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
 	memcpy(dst, src, len)
 #endif
 
-#endif /* __ASM_CACHEFLUSH_H */
+#endif /* _ASM_GENERIC_CACHEFLUSH_H */
-- 
2.26.2

