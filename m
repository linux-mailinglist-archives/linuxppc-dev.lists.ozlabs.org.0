Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5392435BE73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJjM31ThDz3cSt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:58:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=saK0qma4;
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
 header.s=bombadil.20210309 header.b=saK0qma4; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJjJg2Yp8z302W
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:56:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6Y4VhM6xHYg2vg7wXzTQ4ZPFN68qKXNHBM+X0eTBVUk=; b=saK0qma469voeC3jirfWwV/g0Y
 hX1Uy78w/Nmb1zYgtEZR4pqclVzThV9O1uS7uGb4WWhRd7Kdw04Qu8d5IlB9nVPtfi7fPQcGVhgfj
 JEN7P+hgPuRVbFmF74puK3nK8q6jOelXYjWMbcVdpxBRl53dTkcluulOAYJB2jXRVw28qWU1bc0fn
 oExwwTbJTLExTcWKVVrQxgnt6buQ0O+6zQ62vE7BTs4ByA2ZFLVn4WmZrmGn0uhZaEMcIOuG+6t1K
 txCkxJRjoHFBBdQ/dilbs4y3b28bqKNiaEJB8HM/uHuKtY1E0dUhMUkDb9QSko8kVUtr/yK8PVSdZ
 xoWxKzmw==;
Received: from [2001:4bb8:199:e2bd:3218:1918:85d1:2852] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVsMI-0060DZ-64; Mon, 12 Apr 2021 08:55:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/5] uapi: remove the unused HAVE_ARCH_STRUCT_FLOCK64 define
Date: Mon, 12 Apr 2021 10:55:41 +0200
Message-Id: <20210412085545.2595431-2-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/uapi/asm-generic/fcntl.h       | 2 --
 tools/include/uapi/asm-generic/fcntl.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index 9dc0bf0c5a6ee8..fb454bb629d114 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -203,7 +203,6 @@ struct flock {
 };
 #endif
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
 #ifndef __ARCH_FLOCK64_PAD
 #define __ARCH_FLOCK64_PAD
 #endif
@@ -216,6 +215,5 @@ struct flock64 {
 	__kernel_pid_t  l_pid;
 	__ARCH_FLOCK64_PAD
 };
-#endif
 
 #endif /* _ASM_GENERIC_FCNTL_H */
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index ac190958c98144..4a49d33ca4d55d 100644
--- a/tools/include/uapi/asm-generic/fcntl.h
+++ b/tools/include/uapi/asm-generic/fcntl.h
@@ -202,7 +202,6 @@ struct flock {
 };
 #endif
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
 #ifndef __ARCH_FLOCK64_PAD
 #define __ARCH_FLOCK64_PAD
 #endif
@@ -215,6 +214,5 @@ struct flock64 {
 	__kernel_pid_t  l_pid;
 	__ARCH_FLOCK64_PAD
 };
-#endif
 
 #endif /* _ASM_GENERIC_FCNTL_H */
-- 
2.30.1

