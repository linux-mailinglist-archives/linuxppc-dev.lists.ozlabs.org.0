Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8015F63C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 19:58:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K2jD0wJPzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 05:58:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=FwSi0fBP; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jz6q4vftzDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:17:23 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F3CD246A7;
 Fri, 14 Feb 2020 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697041;
 bh=uCw4b9kqzYE6LWAY5bUvM5sqyYD1BlxbEqaUQv+llWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FwSi0fBPmTYvnAKarrK8QyCao1unhu5nh5TxCFQeRz5XlSRZGPLSvbRXPsQDQqIrf
 CA/Rk9DxSp4/K4aKUscTySerotuDSP9FKh2vrfiMoh6V4hq4JQ5kuoOHCgaQDe+1YH
 39rukDV/pJ690TFm89PLp9uQsl+0aKIuXB6rHXa4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 004/186] soc: fsl: qe: change return type of
 cpm_muram_alloc() to s32
Date: Fri, 14 Feb 2020 11:14:13 -0500
Message-Id: <20200214161715.18113-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161715.18113-1-sashal@kernel.org>
References: <20200214161715.18113-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Timur Tabi <timur@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Li Yang <leoyang.li@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rasmus Villemoes <linux@rasmusvillemoes.dk>

[ Upstream commit 800cd6fb76f0ec7711deb72a86c924db1ae42648 ]

There are a number of problems with cpm_muram_alloc() and its
callers. Most callers assign the return value to some variable and
then use IS_ERR_VALUE to check for allocation failure. However, when
that variable is not sizeof(long), this leads to warnings - and it is
indeed broken to do e.g.

  u32 foo = cpm_muram_alloc();
  if (IS_ERR_VALUE(foo))

on a 64-bit platform, since the condition

  foo >= (unsigned long)-ENOMEM

is tautologically false. There are also callers that ignore the
possibility of error, and then there are those that check for error by
comparing the return value to 0...

One could fix that by changing all callers to store the return value
temporarily in an "unsigned long" and test that. However, use of
IS_ERR_VALUE() is error-prone and should be restricted to things which
are inherently long-sized (stuff in pt_regs etc.). Instead, let's aim
for changing to the standard kernel style

  int foo = cpm_muram_alloc();
  if (foo < 0)
    deal_with_it()
  some->where = foo;

Changing the return type from unsigned long to s32 (aka signed int)
doesn't change the value that gets stored into any of the callers'
variables except if the caller was storing the result in a u64 _and_
the allocation failed, so in itself this patch should be a no-op.

Another problem with cpm_muram_alloc() is that it can certainly
validly return 0 - and except if some cpm_muram_alloc_fixed() call
interferes, the very first cpm_muram_alloc() call will return just
that. But that shows that both ucc_slow_free() and ucc_fast_free() are
buggy, since they assume that a value of 0 means "that field was never
allocated". We'll later change cpm_muram_free() to accept (and ignore)
a negative offset, so callers can use a sentinel of -1 instead of 0
and just unconditionally call cpm_muram_free().

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/fsl/qe/qe_common.c | 29 ++++++++++++++++-------------
 include/soc/fsl/qe/qe.h        | 16 ++++++++--------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 104e68d9b84f2..4f60724b06b7c 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -35,7 +35,7 @@ static phys_addr_t muram_pbase;
 
 struct muram_block {
 	struct list_head head;
-	unsigned long start;
+	s32 start;
 	int size;
 };
 
@@ -113,13 +113,14 @@ int cpm_muram_init(void)
  * @algo: algorithm for alloc.
  * @data: data for genalloc's algorithm.
  *
- * This function returns an offset into the muram area.
+ * This function returns a non-negative offset into the muram area, or
+ * a negative errno on failure.
  */
-static unsigned long cpm_muram_alloc_common(unsigned long size,
-		genpool_algo_t algo, void *data)
+static s32 cpm_muram_alloc_common(unsigned long size,
+				  genpool_algo_t algo, void *data)
 {
 	struct muram_block *entry;
-	unsigned long start;
+	s32 start;
 
 	if (!muram_pool && cpm_muram_init())
 		goto out2;
@@ -140,7 +141,7 @@ static unsigned long cpm_muram_alloc_common(unsigned long size,
 out1:
 	gen_pool_free(muram_pool, start, size);
 out2:
-	return (unsigned long)-ENOMEM;
+	return -ENOMEM;
 }
 
 /*
@@ -148,13 +149,14 @@ static unsigned long cpm_muram_alloc_common(unsigned long size,
  * @size: number of bytes to allocate
  * @align: requested alignment, in bytes
  *
- * This function returns an offset into the muram area.
+ * This function returns a non-negative offset into the muram area, or
+ * a negative errno on failure.
  * Use cpm_dpram_addr() to get the virtual address of the area.
  * Use cpm_muram_free() to free the allocation.
  */
-unsigned long cpm_muram_alloc(unsigned long size, unsigned long align)
+s32 cpm_muram_alloc(unsigned long size, unsigned long align)
 {
-	unsigned long start;
+	s32 start;
 	unsigned long flags;
 	struct genpool_data_align muram_pool_data;
 
@@ -171,7 +173,7 @@ EXPORT_SYMBOL(cpm_muram_alloc);
  * cpm_muram_free - free a chunk of multi-user ram
  * @offset: The beginning of the chunk as returned by cpm_muram_alloc().
  */
-int cpm_muram_free(unsigned long offset)
+int cpm_muram_free(s32 offset)
 {
 	unsigned long flags;
 	int size;
@@ -197,13 +199,14 @@ EXPORT_SYMBOL(cpm_muram_free);
  * cpm_muram_alloc_fixed - reserve a specific region of multi-user ram
  * @offset: offset of allocation start address
  * @size: number of bytes to allocate
- * This function returns an offset into the muram area
+ * This function returns @offset if the area was available, a negative
+ * errno otherwise.
  * Use cpm_dpram_addr() to get the virtual address of the area.
  * Use cpm_muram_free() to free the allocation.
  */
-unsigned long cpm_muram_alloc_fixed(unsigned long offset, unsigned long size)
+s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size)
 {
-	unsigned long start;
+	s32 start;
 	unsigned long flags;
 	struct genpool_data_fixed muram_pool_data_fixed;
 
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index b3d1aff5e8ad5..deb6238416947 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -102,26 +102,26 @@ static inline void qe_reset(void) {}
 int cpm_muram_init(void);
 
 #if defined(CONFIG_CPM) || defined(CONFIG_QUICC_ENGINE)
-unsigned long cpm_muram_alloc(unsigned long size, unsigned long align);
-int cpm_muram_free(unsigned long offset);
-unsigned long cpm_muram_alloc_fixed(unsigned long offset, unsigned long size);
+s32 cpm_muram_alloc(unsigned long size, unsigned long align);
+int cpm_muram_free(s32 offset);
+s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size);
 void __iomem *cpm_muram_addr(unsigned long offset);
 unsigned long cpm_muram_offset(void __iomem *addr);
 dma_addr_t cpm_muram_dma(void __iomem *addr);
 #else
-static inline unsigned long cpm_muram_alloc(unsigned long size,
-					    unsigned long align)
+static inline s32 cpm_muram_alloc(unsigned long size,
+				  unsigned long align)
 {
 	return -ENOSYS;
 }
 
-static inline int cpm_muram_free(unsigned long offset)
+static inline int cpm_muram_free(s32 offset)
 {
 	return -ENOSYS;
 }
 
-static inline unsigned long cpm_muram_alloc_fixed(unsigned long offset,
-						  unsigned long size)
+static inline s32 cpm_muram_alloc_fixed(unsigned long offset,
+					unsigned long size)
 {
 	return -ENOSYS;
 }
-- 
2.20.1

