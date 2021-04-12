Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D687035BE38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJjKb5sl1z3c2P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:57:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RS/E5cUe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+68317ec28ad53de92ceb+6441+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=RS/E5cUe; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJjJd70LWz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2i9k3XnPRqvmbHX7dvelQqL0adEzvQYNCM38u+lMXro=; b=RS/E5cUeXPW58MpDtNE/QxGjun
 IlLHXJ5FINhY8bwvOHzpCY/lZPTxBNnPotxjtFD5UtSX5qtfJ2IkT5EN4cWxNKNS80SuvLGHS8Wrt
 XUEatITql0aChxpiGvL4a39jU9XOPZJEL687v5P6Xzxtb47r46fd8xqcOy23mlcmAOK0GIQUjDPXL
 Suy9otxF9ewgxNYkzyyrHYpXdtgc4lu95Yi9zyOGnSEhLCa2LV51x4ycZ+WixvreJwaa12LgPKocp
 0W/6FKcEqL4idUEu89STvrmRIbtMe2l3MKRKHyBaptpL2EoINsT3RbOqPkiCbvi3s2W6tmHHQvfXN
 G/uqREwQ==;
Received: from [2001:4bb8:199:e2bd:3218:1918:85d1:2852] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsMK-0060Dt-T7; Mon, 12 Apr 2021 08:55:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/5] uapi: simplify __ARCH_FLOCK{,64}_PAD a little
Date: Mon, 12 Apr 2021 10:55:42 +0200
Message-Id: <20210412085545.2595431-3-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210412085545.2595431-1-hch@lst.de>
References: <20210412085545.2595431-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't bother to define emtpty versions of the macros if the architecture
doesn't define them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/uapi/asm-generic/fcntl.h       | 12 ++++--------
 tools/include/uapi/asm-generic/fcntl.h | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index fb454bb629d114..df7ad6962dff71 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -189,22 +189,16 @@ struct f_owner_ex {
 #define F_LINUX_SPECIFIC_BASE	1024
 
 #ifndef HAVE_ARCH_STRUCT_FLOCK
-#ifndef __ARCH_FLOCK_PAD
-#define __ARCH_FLOCK_PAD
-#endif
-
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
 	__kernel_pid_t	l_pid;
+#ifdef __ARCH_FLOCK_PAD
 	__ARCH_FLOCK_PAD
-};
 #endif
-
-#ifndef __ARCH_FLOCK64_PAD
-#define __ARCH_FLOCK64_PAD
+};
 #endif
 
 struct flock64 {
@@ -213,7 +207,9 @@ struct flock64 {
 	__kernel_loff_t l_start;
 	__kernel_loff_t l_len;
 	__kernel_pid_t  l_pid;
+#ifdef __ARCH_FLOCK64_PAD
 	__ARCH_FLOCK64_PAD
+#endif
 };
 
 #endif /* _ASM_GENERIC_FCNTL_H */
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index 4a49d33ca4d55d..82054502b9748d 100644
--- a/tools/include/uapi/asm-generic/fcntl.h
+++ b/tools/include/uapi/asm-generic/fcntl.h
@@ -188,22 +188,16 @@ struct f_owner_ex {
 #define F_LINUX_SPECIFIC_BASE	1024
 
 #ifndef HAVE_ARCH_STRUCT_FLOCK
-#ifndef __ARCH_FLOCK_PAD
-#define __ARCH_FLOCK_PAD
-#endif
-
 struct flock {
 	short	l_type;
 	short	l_whence;
 	__kernel_off_t	l_start;
 	__kernel_off_t	l_len;
 	__kernel_pid_t	l_pid;
+#ifdef __ARCH_FLOCK_PAD
 	__ARCH_FLOCK_PAD
-};
 #endif
-
-#ifndef __ARCH_FLOCK64_PAD
-#define __ARCH_FLOCK64_PAD
+};
 #endif
 
 struct flock64 {
@@ -212,7 +206,9 @@ struct flock64 {
 	__kernel_loff_t l_start;
 	__kernel_loff_t l_len;
 	__kernel_pid_t  l_pid;
+#ifdef __ARCH_FLOCK64_PAD
 	__ARCH_FLOCK64_PAD
+#endif
 };
 
 #endif /* _ASM_GENERIC_FCNTL_H */
-- 
2.30.1

