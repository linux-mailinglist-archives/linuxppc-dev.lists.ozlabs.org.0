Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E741142A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 14:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCk9F3kNBz2ybD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 22:18:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S0yyYRkm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S0yyYRkm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCk8b6wYkz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 22:17:35 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D66860EB2;
 Mon, 20 Sep 2021 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632140252;
 bh=KgTqk1gSTq17sQT/2tIQgwIKULSbIMoi53KBq2fW1bw=;
 h=From:To:Cc:Subject:Date:From;
 b=S0yyYRkmJHq1+qDL8ZMbCZT0fIEQ/79B++xY98bOEQ05Ux3e22PN4f1rO2iIwFMzG
 Y/cLzh4fqW/UcPRWCQTFIvrCuunbeBdGRzy6ZDkUm6LP7wChwjTVNIJ3lMMwYEmUnt
 pLIyxSqmbr77LMoBcYD0cIhqvAs6CY/1DD7B6c/aSIsrxqzeNtiWXEakMpAVtRVgPB
 tQlKRY945gh/WYlSO0voQFNWapSWM6cPRskOVU4nyXhqK4OA/fWUCYfA/lbcyaaXeO
 G9HVPDd+5xbB59TOUdI0nUAnt5RZrVuFyv672T3dIybnrXF8N0cix53CRyqAjyY8Tc
 E9iyAT2kq5grg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH] agp: define proper stubs for empty helpers
Date: Mon, 20 Sep 2021 14:17:19 +0200
Message-Id: <20210920121728.94045-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

The empty unmap_page_from_agp() macro causes a warning when
building with 'make W=1' on a couple of architectures:

drivers/char/agp/generic.c: In function 'agp_generic_destroy_page':
drivers/char/agp/generic.c:1265:28: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
 1265 |   unmap_page_from_agp(page);

Change the definitions to a 'do { } while (0)' construct to
make these more reliable.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/parisc/include/asm/agp.h  | 4 ++--
 arch/powerpc/include/asm/agp.h | 4 ++--
 arch/sparc/include/asm/agp.h   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/include/asm/agp.h b/arch/parisc/include/asm/agp.h
index cb04470e63d0..14ae54cfd368 100644
--- a/arch/parisc/include/asm/agp.h
+++ b/arch/parisc/include/asm/agp.h
@@ -8,8 +8,8 @@
  *
  */
 
-#define map_page_into_agp(page)		/* nothing */
-#define unmap_page_from_agp(page)	/* nothing */
+#define map_page_into_agp(page)		do { } while (0)
+#define unmap_page_from_agp(page)	do { } while (0)
 #define flush_agp_cache()		mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */
diff --git a/arch/powerpc/include/asm/agp.h b/arch/powerpc/include/asm/agp.h
index b29b1186f819..6b6485c988dd 100644
--- a/arch/powerpc/include/asm/agp.h
+++ b/arch/powerpc/include/asm/agp.h
@@ -5,8 +5,8 @@
 
 #include <asm/io.h>
 
-#define map_page_into_agp(page)
-#define unmap_page_from_agp(page)
+#define map_page_into_agp(page) do {} while (0)
+#define unmap_page_from_agp(page) do {} while (0)
 #define flush_agp_cache() mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */
diff --git a/arch/sparc/include/asm/agp.h b/arch/sparc/include/asm/agp.h
index efe0d6a12e5a..2d0ff84cee3f 100644
--- a/arch/sparc/include/asm/agp.h
+++ b/arch/sparc/include/asm/agp.h
@@ -4,9 +4,9 @@
 
 /* dummy for now */
 
-#define map_page_into_agp(page)
-#define unmap_page_from_agp(page)
-#define flush_agp_cache() mb()
+#define map_page_into_agp(page)		do { } while (0)
+#define unmap_page_from_agp(page)	do { } while (0)
+#define flush_agp_cache()		mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */
 #define alloc_gatt_pages(order)		\
-- 
2.29.2

