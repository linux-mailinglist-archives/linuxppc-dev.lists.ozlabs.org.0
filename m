Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF5786C84A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 12:42:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UBz7WR3s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlq8t6S8nz3vZH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 22:42:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UBz7WR3s;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlq8B538Nz3dWv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 22:42:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709206938;
	bh=H5aw9GswOngs3HLWbs483OHm4WgatilJaPXJW9nc20s=;
	h=From:To:Subject:Date:From;
	b=UBz7WR3sWQRQH3yh/gLbRUcEEFmkwONyVnCApJDhDvxL2aIXB2paPREp6updei+V5
	 fWvbuJ7BxyMV8GdnMDFdcfhUqtgIvv50MgVCQK1jYorHsp+7UnpR1/QLkE7/G/q/qc
	 cnlMvtrt4GpXBuw4PwvQQZcbVzaRTJ4A94frwnILaOvc4sQbRzjAuH1ZeiJ4iUx1q3
	 K20UHUKcdnF8F0fX1GNWDHFqkF1vejotiuVXvzs/gFVZ5fQ8RY8C6Uv4hxiCANHPqO
	 LXTKSYb03mQ2UZvmqlKktSW0aSlypeYbNJwBGaNt/ilBfE+Bws2wdRml8/cE/hHeXc
	 B/mEgx5fYa9HA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlq8B3rXDz4wZx;
	Thu, 29 Feb 2024 22:42:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/85xx: Make some pic_init functions static
Date: Thu, 29 Feb 2024 22:42:16 +1100
Message-ID: <20240229114216.744502-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
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

These functions can all be static, make them so, which also fixes no
previous prototype warnings.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/85xx/bsc913x_qds.c | 2 +-
 arch/powerpc/platforms/85xx/bsc913x_rdb.c | 2 +-
 arch/powerpc/platforms/85xx/ge_imp3a.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/bsc913x_qds.c b/arch/powerpc/platforms/85xx/bsc913x_qds.c
index 2eb62bff86d4..3ad8096fcf16 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_qds.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_qds.c
@@ -19,7 +19,7 @@
 #include "mpc85xx.h"
 #include "smp.h"
 
-void __init bsc913x_qds_pic_init(void)
+static void __init bsc913x_qds_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
 	  MPIC_SINGLE_DEST_CPU,
diff --git a/arch/powerpc/platforms/85xx/bsc913x_rdb.c b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
index 161f006cb3bb..dcd358c28201 100644
--- a/arch/powerpc/platforms/85xx/bsc913x_rdb.c
+++ b/arch/powerpc/platforms/85xx/bsc913x_rdb.c
@@ -15,7 +15,7 @@
 
 #include "mpc85xx.h"
 
-void __init bsc913x_rdb_pic_init(void)
+static void __init bsc913x_rdb_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
 	  MPIC_SINGLE_DEST_CPU,
diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 9c3b44a1952e..477852f1a726 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -38,7 +38,7 @@
 
 void __iomem *imp3a_regs;
 
-void __init ge_imp3a_pic_init(void)
+static void __init ge_imp3a_pic_init(void)
 {
 	struct mpic *mpic;
 	struct device_node *np;
-- 
2.43.2

