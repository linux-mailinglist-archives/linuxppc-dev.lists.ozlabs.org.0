Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EE2FAF62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 05:19:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKb5Y2813zDqyB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 15:19:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKb451H8BzDqxL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 15:18:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BUFb2W7o; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4DKb443kGxz9sSC; Tue, 19 Jan 2021 15:18:12 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DKb442pGnz9sVv; Tue, 19 Jan 2021 15:18:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1611029892;
 bh=misKX5uL3AbkVLa2M9yaBWDV48HFwCsTxz1mkWD2tvs=;
 h=From:To:Cc:Subject:Date:From;
 b=BUFb2W7oxfIhBavWRcnQlM9jTq47AokC7lDBCN0m1QEN7S+v7fw8ehnpCP7KKl3SJ
 E5dgVFX6gNzop0rauU49NxP/anmkB84JltwEpxZTKDJbSWml24yiDidmD4W/AxUaQD
 YqoIoNJrrkKAcZA4HvF9XBIqdAbeGFLbX6IBt0gbkUMDyunbRjwftSwmI4Te+QuoNF
 nxqWfzYjLQggBdJG9XCyQXl5UaeeNiwHXbgUQt64LvfOWy1gmsLTf4g94gBCvMKONY
 FA2v85ouXSUn2PHrKwsCLcaVPis6kX4yraqTkhnFB8+OOkiaywdLYAJPjelyvxtjHX
 TizbpjWkAf05w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Only test lwm/stmw on big endian
Date: Tue, 19 Jan 2021 15:18:00 +1100
Message-Id: <20210119041800.3093047-1-mpe@ellerman.id.au>
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
Cc: msuchanek@suse.de, lpechacek@suse.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Newer binutils (>= 2.36) refuse to assemble lmw/stmw when building in
little endian mode. That breaks compilation of our alignment handler
test:

  /tmp/cco4l14N.s: Assembler messages:
  /tmp/cco4l14N.s:1440: Error: `lmw' invalid when little-endian
  /tmp/cco4l14N.s:1814: Error: `stmw' invalid when little-endian
  make[2]: *** [../../lib.mk:139: /output/kselftest/powerpc/alignment/alignment_handler] Error 1

These tests do pass on little endian machines, as the kernel will
still emulate those instructions even when running little
endian (which is arguably a kernel bug).

But we don't really need to test that case, so ifdef those
instructions out to get the alignment test building again.

Reported-by: Libor Pechacek <lpechacek@suse.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/alignment/alignment_handler.c  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index cb53a8b777e6..c25cf7cd45e9 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -443,7 +443,6 @@ int test_alignment_handler_integer(void)
 	LOAD_DFORM_TEST(ldu);
 	LOAD_XFORM_TEST(ldx);
 	LOAD_XFORM_TEST(ldux);
-	LOAD_DFORM_TEST(lmw);
 	STORE_DFORM_TEST(stb);
 	STORE_XFORM_TEST(stbx);
 	STORE_DFORM_TEST(stbu);
@@ -462,7 +461,11 @@ int test_alignment_handler_integer(void)
 	STORE_XFORM_TEST(stdx);
 	STORE_DFORM_TEST(stdu);
 	STORE_XFORM_TEST(stdux);
+
+#ifdef __BIG_ENDIAN__
+	LOAD_DFORM_TEST(lmw);
 	STORE_DFORM_TEST(stmw);
+#endif
 
 	return rc;
 }
-- 
2.25.1

