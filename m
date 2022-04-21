Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB4850981F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 09:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkT8C0rZFz3bbL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 17:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QR0Xe8VE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+75405b57bc5fe52e01f0+6815+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=QR0Xe8VE; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkT7X2LyTz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 17:04:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zBXWLNnXpk4rildATDLl07tkcfHH7qx/rs6eJc2jVvY=; b=QR0Xe8VEKwSitBZoLjmLhc8fq8
 Lr97HHHJhJPho3My5cPAj3WFl0XUehAS9E+qEfCT/Lq6WDrFnYeWYcShZdet8No9amJuD3NdnhpXg
 A2WH2R3rSaIEsCxFrj4AW4IgVwsRmuLSHamhv5gA1JmwuKLVy4Zwc1fRRbXymaAOFUWY/Fo25jO/Y
 Rv07h3ZFVNmYVZsAr2+KfR9itkDS/IPJLGd4Zit2F7zasrKi43a339FOQVRyOyxnkylnHwxU0xPsw
 c+T5CEboHhoU2XsgyUtATcYfhWl+O7Eg4aZlYpZqDsNyqmG71+b+KUGXTz4CsIQO92nqN/AR8/lSc
 vuSIbYrQ==;
Received: from [2001:4bb8:191:364b:7b50:153f:5622:82f7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQrr-00BwId-CM; Thu, 21 Apr 2022 07:04:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: akpm@linux-foundation.org
Subject: [PATCH] net: unexport csum_and_copy_{from,to}_user
Date: Thu, 21 Apr 2022 09:04:40 +0200
Message-Id: <20220421070440.1282704-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
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
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

csum_and_copy_from_user and csum_and_copy_to_user are exported by
a few architectures, but not actually used in modular code.  Drop
the exports.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/lib/csum_partial_copy.c   | 1 -
 arch/m68k/lib/checksum.c             | 2 --
 arch/powerpc/lib/checksum_wrappers.c | 2 --
 arch/x86/lib/csum-wrappers_64.c      | 2 --
 4 files changed, 7 deletions(-)

diff --git a/arch/alpha/lib/csum_partial_copy.c b/arch/alpha/lib/csum_partial_copy.c
index 1931a04af85a2..4d180d96f09e4 100644
--- a/arch/alpha/lib/csum_partial_copy.c
+++ b/arch/alpha/lib/csum_partial_copy.c
@@ -353,7 +353,6 @@ csum_and_copy_from_user(const void __user *src, void *dst, int len)
 		return 0;
 	return __csum_and_copy(src, dst, len);
 }
-EXPORT_SYMBOL(csum_and_copy_from_user);
 
 __wsum
 csum_partial_copy_nocheck(const void *src, void *dst, int len)
diff --git a/arch/m68k/lib/checksum.c b/arch/m68k/lib/checksum.c
index 7e6afeae62177..5acb821849d30 100644
--- a/arch/m68k/lib/checksum.c
+++ b/arch/m68k/lib/checksum.c
@@ -265,8 +265,6 @@ csum_and_copy_from_user(const void __user *src, void *dst, int len)
 	return sum;
 }
 
-EXPORT_SYMBOL(csum_and_copy_from_user);
-
 
 /*
  * copy from kernel space while checksumming, otherwise like csum_partial
diff --git a/arch/powerpc/lib/checksum_wrappers.c b/arch/powerpc/lib/checksum_wrappers.c
index f3999cbb2fcc4..1a14c8780278c 100644
--- a/arch/powerpc/lib/checksum_wrappers.c
+++ b/arch/powerpc/lib/checksum_wrappers.c
@@ -24,7 +24,6 @@ __wsum csum_and_copy_from_user(const void __user *src, void *dst,
 	user_read_access_end();
 	return csum;
 }
-EXPORT_SYMBOL(csum_and_copy_from_user);
 
 __wsum csum_and_copy_to_user(const void *src, void __user *dst, int len)
 {
@@ -38,4 +37,3 @@ __wsum csum_and_copy_to_user(const void *src, void __user *dst, int len)
 	user_write_access_end();
 	return csum;
 }
-EXPORT_SYMBOL(csum_and_copy_to_user);
diff --git a/arch/x86/lib/csum-wrappers_64.c b/arch/x86/lib/csum-wrappers_64.c
index 189344924a2be..145f9a0bde29a 100644
--- a/arch/x86/lib/csum-wrappers_64.c
+++ b/arch/x86/lib/csum-wrappers_64.c
@@ -32,7 +32,6 @@ csum_and_copy_from_user(const void __user *src, void *dst, int len)
 	user_access_end();
 	return sum;
 }
-EXPORT_SYMBOL(csum_and_copy_from_user);
 
 /**
  * csum_and_copy_to_user - Copy and checksum to user space.
@@ -57,7 +56,6 @@ csum_and_copy_to_user(const void *src, void __user *dst, int len)
 	user_access_end();
 	return sum;
 }
-EXPORT_SYMBOL(csum_and_copy_to_user);
 
 /**
  * csum_partial_copy_nocheck - Copy and checksum.
-- 
2.30.2

