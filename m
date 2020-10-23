Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D82968AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 05:14:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHTq90yN2zDr2k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 14:14:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHTnb5StJzDq7h
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 14:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oAtYLZxN; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CHTnb3vvZz9sSW; Fri, 23 Oct 2020 14:13:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CHTnb3FYjz9sSs; Fri, 23 Oct 2020 14:13:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603422787;
 bh=8PW9lPGSO52SDim0e8XLAi1br9yNUTulB3fzW95nlEs=;
 h=From:To:Subject:Date:From;
 b=oAtYLZxNgk77FLBwhuG2gvpZuRke6pr81+ayhP1MO5daEgpI9wWITEodJOaqwjTHI
 1Hi8AYQVUufve/TMIbYLal2yUgno244pMCbEriUwTRHElv/DjZm8Qr4qeM0Qbdyp4x
 4y71EkeslUOj16ZFJ3Ecjbd9JdkUlwZpAZ+IJzj6vMr+WjfHdEpMtCpBpr+OsLuZCC
 KBTvJ9Ok2OGskzg3PR20Qq9RSuXAfJlkB9tqX/VQoTn1l+9FBP0cABoqQnIIemTI1/
 HTiJbFNeJew0/nqS69Hm8riYWp/Rfzv/8fPcU9r53rtdgdtI7JEKkZDySM5+QMygYG
 QL5Wj9lEfFe7Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/ps3: Drop unused DBG macro
Date: Fri, 23 Oct 2020 14:13:05 +1100
Message-Id: <20201023031305.3284819-1-mpe@ellerman.id.au>
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

This DBG macro is unused, and has been unused since the file was
originally merged into mainline. Just drop it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/ps3.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/powerpc/boot/ps3.c b/arch/powerpc/boot/ps3.c
index 6e4efbdb6b7c..f157717ae814 100644
--- a/arch/powerpc/boot/ps3.c
+++ b/arch/powerpc/boot/ps3.c
@@ -21,13 +21,6 @@ extern int lv1_get_logical_ppe_id(u64 *out_1);
 extern int lv1_get_repository_node_value(u64 in_1, u64 in_2, u64 in_3,
 	u64 in_4, u64 in_5, u64 *out_1, u64 *out_2);
 
-#ifdef DEBUG
-#define DBG(fmt...) printf(fmt)
-#else
-static inline int __attribute__ ((format (printf, 1, 2))) DBG(
-	const char *fmt, ...) {return 0;}
-#endif
-
 BSS_STACK(4096);
 
 /* A buffer that may be edited by tools operating on a zImage binary so as to
-- 
2.25.1

