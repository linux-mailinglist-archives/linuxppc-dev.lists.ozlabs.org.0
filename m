Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F73945B7A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:43:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzbgF2KBwz3c75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:43:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jeWvWSse;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzbdH4bfkz2yNq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:42:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jeWvWSse; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzbdH3XNqz4xbw;
 Wed, 24 Nov 2021 20:42:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637746931;
 bh=0Wjj6/q9B5fQNFUVhPJ+sW9oSyThdS5ISfpMVc1zD0U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jeWvWSseKqvi7p3QVTriNve9A1l6dPx1IyWNKvXjrRw38K4/WKIP/uMI7VRODRGL9
 R/57dx+B8swWV9yGZE/9kvNumyWtESIHAANQ28KqR7qTDdUMw0uGSlQBMz8aFKLGqx
 I1/6EG3SdfKPubCEPrkz04ibrf+UqKgOPqPiw4uhfo4xUkzaBjQqrTyrK8thuP7GQd
 f2IhnL2rP2PYlO8+U2oywT3PQgP4XPpBi39uDAAbj6oJP7+nQptmBTLOwcT00f3+tP
 Uuuq6q1CWPgM386BnWgBnYvmeRJX9zij4/VVW4DePm3NN8+RI6098n6Pb8N1csS+jF
 vQm5KVAWhYbxA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/6] powerpc/85xx: Make c293_pcie_pic_init() static
Date: Wed, 24 Nov 2021 20:32:51 +1100
Message-Id: <20211124093254.1054750-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124093254.1054750-1-mpe@ellerman.id.au>
References: <20211124093254.1054750-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To fix the W=1 warning:
  linux/arch/powerpc/platforms/85xx/c293pcie.c:22:13: error: no previous prototype for ‘c293_pcie_pic_init’

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/85xx/c293pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/c293pcie.c b/arch/powerpc/platforms/85xx/c293pcie.c
index 8d9a2503dd0f..58a398c89e97 100644
--- a/arch/powerpc/platforms/85xx/c293pcie.c
+++ b/arch/powerpc/platforms/85xx/c293pcie.c
@@ -19,7 +19,7 @@
 
 #include "mpc85xx.h"
 
-void __init c293_pcie_pic_init(void)
+static void __init c293_pcie_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
 	  MPIC_SINGLE_DEST_CPU, 0, 256, " OpenPIC  ");
-- 
2.31.1

