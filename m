Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDAD5992
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 04:32:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s2dV5ShQzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 13:32:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s2bm6gczzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 13:30:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="aQlqvITR"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46s2bm5ll1z9sPd; Mon, 14 Oct 2019 13:30:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46s2bm4s0qz9sPh; Mon, 14 Oct 2019 13:30:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1571020244;
 bh=ciYHuybzkxwIDr/8c0wuOHkok+1FQxie1pOMRcO6BLU=;
 h=From:To:Subject:Date:From;
 b=aQlqvITRWf+9ZjfzVAjLZGUCWRUfo5T/0MlEZDJDINtBK3BlvAEPkxEW2ST9nIobt
 92Cd7aIb8r3IKASiyFo/qyOB3it7o8ogWqJaFn5zF+nwdPi0SqeIF3niGQNBLByTzH
 jv6+Sk1/+7RaRoGho/TQzwkarQbwlFMgTCWQMMrv09e7ToDe9Xk/X8dDdP0m9GNabB
 9rAUSf1KVLdHczun252dSgVyDnl0OIxix4KROop02D5FS/iKoG6SU03LPaksVrjvsQ
 DlzG1HFYM+o/WhMPEP0eIZdMqZoRKLuFXR5mX9CT3g5OrZou5VOkAq8nPW+5gFeBbH
 red/N/qCzAyKA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Don't list r1 in clobbers for TM tests
Date: Mon, 14 Oct 2019 13:30:43 +1100
Message-Id: <20191014023043.2969-1-mpe@ellerman.id.au>
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

Some of our TM (Transactional Memory) tests, list "r1" (the stack
pointer) as a clobbered register.

GCC >= 9 doesn't accept this, and the build breaks:

  ptrace-tm-spd-tar.c: In function 'tm_spd_tar':
  ptrace-tm-spd-tar.c:31:2: error: listing the stack pointer register 'r1' in a clobber list is deprecated [-Werror=deprecated]
     31 |  asm __volatile__(
        |  ^~~
  ptrace-tm-spd-tar.c:31:2: note: the value of the stack pointer after an 'asm' statement must be the same as it was before the statement

We do have some fairly large inline asm blocks in these tests, and
some of them do change the value of r1. However they should all return
to C with the value in r1 restored, so I think it's legitimate to say
r1 is not clobbered. We should probably rewrite some of these in real
assembler one day.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c     | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

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
index f603fe5a445b..f497c2cbbdc3 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
@@ -74,7 +74,7 @@ void tm_spd_vsx(void)
 		"3: ;"
 		: [res] "=r" (result), [texasr] "=r" (texasr)
 		: [sprn_texasr] "i"  (SPRN_TEXASR)
-		: "memory", "r0", "r1", "r3", "r4",
+		: "memory", "r0", "r3", "r4",
 		"r7", "r8", "r9", "r10", "r11"
 		);
 
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
index 8027457b97b7..a72fcea16876 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
@@ -62,7 +62,7 @@ void tm_vsx(void)
 		"3: ;"
 		: [res] "=r" (result), [texasr] "=r" (texasr)
 		: [sprn_texasr] "i"  (SPRN_TEXASR), [cptr1] "b" (&cptr[1])
-		: "memory", "r0", "r1", "r3", "r4",
+		: "memory", "r0", "r3", "r4",
 		"r7", "r8", "r9", "r10", "r11"
 		);
 
-- 
2.21.0

