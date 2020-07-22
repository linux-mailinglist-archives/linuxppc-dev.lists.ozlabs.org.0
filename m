Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC44228E30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 04:27:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBK9g69pkzDqmq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 12:27:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBK6L3dxNzDqgL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 12:24:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ExBlac24; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BBK6K6M8Jz9sSn; Wed, 22 Jul 2020 12:24:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BBK6K3yPgz9sQt; Wed, 22 Jul 2020 12:24:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595384665;
 bh=tc6VBfRXE2dHQ5KHzbE4O46Pohc3DnMzUUSiEW1yezE=;
 h=From:To:Subject:Date:From;
 b=ExBlac2479OOZomaLSKsjELAzyDXFIXlWHVkYC89VyGUN8fiW/hfCBm1rvAWAxU9I
 /1W7OvnXJlGHOzHbYpQnGXvG+MieJW6APS4iwx/0fA/MrRK5flvx6XUlzUpY12Pqbp
 l2rgyS7vXp6aKo2i/WkPLYvZti3Yp5VyNrmgP8YqX9KRkpWPsZx0TKsdcXN5XV936O
 rxWiM3IIBeFLk3ucSa2PSlNd9FDv+dvyqx1zBR9mfwfRuRBpGD83RdqQEdcjhv+Rwq
 IdPAmv3KksGyZr3GuKs0dVNo83jz6SHz/M86uQqexzsOOXp5+NL4DQbc9l0buXD6ud
 FeOY6hz09XgvQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/40x: Fix assembler warning about r0
Date: Wed, 22 Jul 2020 12:24:22 +1000
Message-Id: <20200722022422.825197-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The assembler says:
  arch/powerpc/kernel/head_40x.S:623: Warning: invalid register expression

It's objecting to the use of r0 as the RA argument. That's because
when RA = 0 the literal value 0 is used, rather than the content of
r0, making the use of r0 in the source potentially confusing.

Fix it to use a literal 0, the generated code is identical.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/head_40x.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 926bfa73586a..5b282d9965a5 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -620,7 +620,7 @@ _ENTRY(saved_ksp_limit)
 	ori	r6, r6, swapper_pg_dir@l
 	lis	r5, abatron_pteptrs@h
 	ori	r5, r5, abatron_pteptrs@l
-	stw	r5, 0xf0(r0)	/* Must match your Abatron config file */
+	stw	r5, 0xf0(0)	/* Must match your Abatron config file */
 	tophys(r5,r5)
 	stw	r6, 0(r5)
 
-- 
2.25.1

