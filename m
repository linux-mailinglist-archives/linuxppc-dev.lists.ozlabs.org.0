Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614AF782B32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 16:10:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FnNcbcrk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTvXG1c3Cz3byH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 00:10:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FnNcbcrk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTvWL4gGjz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 00:10:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692627004;
	bh=atArDXB4Tm/i9elbPfYyrYL5vLGB7jTPhEekIutdxHk=;
	h=From:To:Cc:Subject:Date:From;
	b=FnNcbcrk/0Px5LUK7h2SrJVN1cfM6FD5h1nV91biCnoIUUHt0PsPY+31g4KOPbfc/
	 n6YrKvbDaBHI+7/sp/zXVQVZv946wZ1ymhD9TByJSp2ibnwyhGyWky+VCMA1tQADmw
	 h2ZqS2ZhsICzguSPH22I40leE2FY35qNoPfSBfG16HRH87NtoLPwYxvLSjoaQs/uxo
	 wuX6ZHgp0ductpf0UPqDpYT15e2OzWtDDvlIwlV/7jmhMBmgX40FvLcd8lG0T+9mIt
	 ZpDQbnsq8+l9H66SFhDSICvsYRNz0ssfwhNcuJtS7OMie31sY4BYmWzkHyCm6saVr5
	 p+/DG4Q1yZiYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RTvWH4rBDz4wxW;
	Tue, 22 Aug 2023 00:10:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/powermac: Fix unused function warning
Date: Tue, 22 Aug 2023 00:09:49 +1000
Message-ID: <20230821140949.491881-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang reports:
  arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function 'simple_feature_tweak'

It's only used inside the #ifndef CONFIG_PPC64 block, so move it in
there to fix the warning. While at it drop the inline, the compiler will
decide whether it should be inlined or not.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308181501.AR5HMDWC-lkp@intel.com/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powermac/feature.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index ed472b797e28..ae62d432db8b 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -134,8 +134,10 @@ static struct pmac_mb_def pmac_mb;
  * Here are the chip specific feature functions
  */
 
-static inline int simple_feature_tweak(struct device_node *node, int type,
-				       int reg, u32 mask, int value)
+#ifndef CONFIG_PPC64
+
+static int simple_feature_tweak(struct device_node *node, int type, int reg,
+				u32 mask, int value)
 {
 	struct macio_chip*	macio;
 	unsigned long		flags;
@@ -154,8 +156,6 @@ static inline int simple_feature_tweak(struct device_node *node, int type,
 	return 0;
 }
 
-#ifndef CONFIG_PPC64
-
 static long ohare_htw_scc_enable(struct device_node *node, long param,
 				 long value)
 {
-- 
2.41.0

