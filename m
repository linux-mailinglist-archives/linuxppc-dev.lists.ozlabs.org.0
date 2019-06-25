Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE915552E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 17:07:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y8dg0VpGzDqLy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 01:07:03 +1000 (AEST)
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
 header.b="E9+L7K4k"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y8081h1VzDqKR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 00:38:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uev9P+r50vVpCL7nS/dekiTRo7rXCigRkpG+pJrAUCA=; b=E9+L7K4kE6JTbh7vmfjLu++Bdq
 JFW5Va2G2EXQmw9Ke1E0G6TXfr3GramuNSqnofY+5ruiQC7YMVyKckCqdLDCAejhVvPjjrzmC3s0K
 5jHAOt+PTN56hNY/emDzcT8mibDyCDoxaAOkaMPNE1QZ+kHmuyCglsjWWDNoZG889qMzTCVo7xhQC
 zZPu+39bRGe7M4f49CxIPbGV6KNIgucjuElJ9zwUyvgo2x9WKT9ZGfcD3RhFXEL9DhOFYfLgYbf3h
 mDT0YYG8DgGySjHXpThwmT0xYCmOYqlSMO4BtE80cVWg8pT6o1QKaSG6Q9B6vUTdYj3GyxqYcvc6i
 IGm4eLNQ==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfmZr-00080F-Ip; Tue, 25 Jun 2019 14:37:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 08/16] sparc64: define untagged_addr()
Date: Tue, 25 Jun 2019 16:37:07 +0200
Message-Id: <20190625143715.1689-9-hch@lst.de>
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

Add a helper to untag a user pointer.  This is needed for ADI support
in get_user_pages_fast.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
---
 arch/sparc/include/asm/pgtable_64.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index f0dcf991d27f..1904782dcd39 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1076,6 +1076,28 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 }
 #define io_remap_pfn_range io_remap_pfn_range 
 
+static inline unsigned long untagged_addr(unsigned long start)
+{
+	if (adi_capable()) {
+		long addr = start;
+
+		/* If userspace has passed a versioned address, kernel
+		 * will not find it in the VMAs since it does not store
+		 * the version tags in the list of VMAs. Storing version
+		 * tags in list of VMAs is impractical since they can be
+		 * changed any time from userspace without dropping into
+		 * kernel. Any address search in VMAs will be done with
+		 * non-versioned addresses. Ensure the ADI version bits
+		 * are dropped here by sign extending the last bit before
+		 * ADI bits. IOMMU does not implement version tags.
+		 */
+		return (addr << (long)adi_nbits()) >> (long)adi_nbits();
+	}
+
+	return start;
+}
+#define untagged_addr untagged_addr
+
 #include <asm/tlbflush.h>
 #include <asm-generic/pgtable.h>
 
-- 
2.20.1

