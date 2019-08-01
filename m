Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 045057DB76
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 14:29:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zqNL5mkwzDqtW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 22:29:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zqKR6wtxzDqWb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 22:26:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45zqKR3LMhz9sDQ; Thu,  1 Aug 2019 22:26:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45zqKR26Cyz9sMr; Thu,  1 Aug 2019 22:26:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix build failures with GCC 9
Date: Thu,  1 Aug 2019 22:26:28 +1000
Message-Id: <20190801122628.25084-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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

GCC 9 fails to build some of the ptrace TM tests, with errors such as:

  ptrace-tm-spd-vsx.c: In function 'tm_spd_vsx':
  ptrace-tm-spd-vsx.c:51:2: error: listing the stack pointer register 'r1' in a clobber list is deprecated [-Werror=deprecated]
     51 |  asm __volatile__(
        |  ^~~
  ptrace-tm-spd-vsx.c:51:2: note: the value of the stack pointer after an 'asm' statement must be the same as it was before the statement

Which is probably fair enough.

Some of these inline asm blocks are doing quite a lot and are probably
pushing the boundaries of what's sane to do with inline asm, but they
shouldn't actually be returning with r1 modified.

So drop r1 from the clobbers for now, we should probably rewrite them
to be real asm functions at some point.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c | 3 +--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c     | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c     | 3 +--
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
index 25e23e73c72e..7b835ef4f8a6 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
@@ -73,7 +73,7 @@ void tm_spd_tar(void)
 		[sprn_texasr]"i"(SPRN_TEXASR), [tar_1]"i"(TAR_1),
 		[dscr_1]"i"(DSCR_1), [tar_2]"i"(TAR_2), [dscr_2]"i"(DSCR_2),
 		[tar_3]"i"(TAR_3), [dscr_3]"i"(DSCR_3)
-		: "memory", "r0", "r1", "r3", "r4", "r5", "r6"
+		: "memory", "r0", "r3", "r4", "r5", "r6"
 		);
 
 	/* TM failed, analyse */
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
index f603fe5a445b..724e5aa499cd 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
@@ -74,8 +74,7 @@ void tm_spd_vsx(void)
 		"3: ;"
 		: [res] "=r" (result), [texasr] "=r" (texasr)
 		: [sprn_texasr] "i"  (SPRN_TEXASR)
-		: "memory", "r0", "r1", "r3", "r4",
-		"r7", "r8", "r9", "r10", "r11"
+		: "memory", "r0", "r3", "r4", "r7", "r8", "r9", "r10", "r11"
 		);
 
 	if (result) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
index e0d37f07bdeb..46ef378a15ec 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
@@ -62,7 +62,7 @@ void tm_tar(void)
 		[sprn_ppr]"i"(SPRN_PPR), [sprn_texasr]"i"(SPRN_TEXASR),
 		[tar_1]"i"(TAR_1), [dscr_1]"i"(DSCR_1), [tar_2]"i"(TAR_2),
 		[dscr_2]"i"(DSCR_2), [cptr1] "b" (&cptr[1])
-		: "memory", "r0", "r1", "r3", "r4", "r5", "r6"
+		: "memory", "r0", "r3", "r4", "r5", "r6"
 		);
 
 	/* TM failed, analyse */
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
index 8027457b97b7..9f16f3a74e28 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
@@ -62,8 +62,7 @@ void tm_vsx(void)
 		"3: ;"
 		: [res] "=r" (result), [texasr] "=r" (texasr)
 		: [sprn_texasr] "i"  (SPRN_TEXASR), [cptr1] "b" (&cptr[1])
-		: "memory", "r0", "r1", "r3", "r4",
-		"r7", "r8", "r9", "r10", "r11"
+		: "memory", "r0", "r3", "r4", "r7", "r8", "r9", "r10", "r11"
 		);
 
 	if (result) {
-- 
2.21.0

