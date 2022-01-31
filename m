Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37204A3DFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 07:51:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJcM5CFmz3cVL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 17:50:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jv/vd++u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c8a487c16eeb054acd37+6735+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJb16qj2z2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:49:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+0c6MseXPX7zRtfUKiUXoXASKsSqROUYFWkyRGrgS/E=; b=Jv/vd++uBZChNfqPCVfg8xLcXx
 ilLxoHcqoh+UEMk5nTsj7jkROaP7qoB7t3eWk5M1gnSi0iGEjEBv6fAtkMlFWWfI5EcGOW2JBynN5
 sB2x0m538o9zqZNL/1JeoPD/7GWB+9PtKbh9A5GtJ8JgRwMzDcmBrPbmVQYIpbO3Od0Yho7r4aeim
 a2E6nX1NbmJ6lokqxwpnZdeiNAwxSP0xnb8l5W/HPrAvcu+ctzf7A+4u+qDMDy1Gi4dEv8j6PhrM8
 1Fn1hNtAk3BOs1wfpn/Fiotcw5TCsqkcyHn78CRUCXr8vG8sriKztZ3TXAcr0Y8qK7eu5x28WUS2/
 Coaon7uQ==;
Received: from [2001:4bb8:191:327d:13f5:1d0a:e266:6974] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEQVP-008AUe-Oz; Mon, 31 Jan 2022 06:49:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/5] uapi: remove the unused HAVE_ARCH_STRUCT_FLOCK64 define
Date: Mon, 31 Jan 2022 07:49:29 +0100
Message-Id: <20220131064933.3780271-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220131064933.3780271-1-hch@lst.de>
References: <20220131064933.3780271-1-hch@lst.de>
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
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/uapi/asm-generic/fcntl.h       | 2 --
 tools/include/uapi/asm-generic/fcntl.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index ecd0f5bdfc1d6..caa482e3b01af 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -207,7 +207,6 @@ struct flock {
 };
 #endif
 
-#ifndef HAVE_ARCH_STRUCT_FLOCK64
 #ifndef __ARCH_FLOCK64_PAD
 #define __ARCH_FLOCK64_PAD
 #endif
@@ -220,6 +219,5 @@ struct flock64 {
 	__kernel_pid_t  l_pid;
 	__ARCH_FLOCK64_PAD
 };
-#endif
 
 #endif /* _ASM_GENERIC_FCNTL_H */
diff --git a/tools/include/uapi/asm-generic/fcntl.h b/tools/include/uapi/asm-generic/fcntl.h
index ac190958c9814..4a49d33ca4d55 100644
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
2.30.2

