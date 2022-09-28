Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FC5EDD83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcxh01n2wz3dtY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:10:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g8Lwr91+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mcxfp11V9z3c16
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:09:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g8Lwr91+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mcxfp000Mz4xGH;
	Wed, 28 Sep 2022 23:09:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664370594;
	bh=qtPZ7w4dOJFU8KZt4eGh/bA3PrSlc7ovfdt/LAFxRG0=;
	h=From:To:Subject:Date:From;
	b=g8Lwr91+7/suCFjQ6/ubCVLLv/OdvfRSVHnGmV1+GtKPXt6TL5z7cxPHU24+bL3V7
	 oWTVPic5sJ6YF93BVdN1eNl7uvYnER/aw6vLHr62IK+NqH5EHRAg1e+fGYzhWPFn2k
	 4ZPNAx4KXLgAV3jOxu6DC4damwIMGv2e09GLpiJ3QcPtugdpJaxuQ3rBhI20RCARAg
	 /8PkULGLdOQB3iQf8eooSzlKBeYgFn+6GtAfLWAfKGQkIMld2xNyOS+e2ae7ivpDXP
	 dE2LLkHQcO8vYLM7B9KFjNorCdkOYh7ETNDlf2duaMaD3zWg6Ys2OXG8xlTBXPs1Ty
	 6ec/OYkqQkM6w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Drops STABS_DEBUG from linker scripts
Date: Wed, 28 Sep 2022 23:09:51 +1000
Message-Id: <20220928130951.1732983-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No toolchain we support should be generating stabs debug information
anymore. Drop the sections entirely from our linker scripts.

We removed all the manual stabs annotations in commit
12318163737c ("powerpc/32: Remove remaining .stabs annotations").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso/vdso32.lds.S | 1 -
 arch/powerpc/kernel/vdso/vdso64.lds.S | 1 -
 arch/powerpc/kernel/vmlinux.lds.S     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index e0d19d74455f..bc0be274a9ac 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -78,7 +78,6 @@ SECTIONS
 	__end = .;
 	PROVIDE(end = .);
 
-	STABS_DEBUG
 	DWARF_DEBUG
 	ELF_DETAILS
 
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index 1a4a7bc4c815..744ae5363e6c 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -76,7 +76,6 @@ SECTIONS
 	_end = .;
 	PROVIDE(end = .);
 
-	STABS_DEBUG
 	DWARF_DEBUG
 	ELF_DETAILS
 
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index fe22d940412f..8a1c47b59b5a 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -382,7 +382,6 @@ SECTIONS
 	_end = . ;
 	PROVIDE32 (end = .);
 
-	STABS_DEBUG
 	DWARF_DEBUG
 	ELF_DETAILS
 
-- 
2.37.3

