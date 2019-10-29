Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D721BE855B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:18:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472SGH2FNdzF2WR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 21:18:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Rjl0rZ4zF1pW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 20:53:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="kRkoHRku"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 472Rjg3hQ3z9sPh; Tue, 29 Oct 2019 20:53:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 472Rjf6fryz9sRN; Tue, 29 Oct 2019 20:53:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572342806;
 bh=YjeXyLgXDmBDNwj1SVhw4DCcFbYwBPyJvq94xI4KnSU=;
 h=From:To:Subject:Date:From;
 b=kRkoHRkunH1NQ7yzolmkvPazauOBW2+dPuL+YcB+q4a47lsXaPp7Q1kkKujLu4SUf
 velvAVaVunLfPWWuALuwfexQhb5KeWGhjIQT0Q0OUr8n2S/hoDs4953mLqw4G1eT3F
 B8p5q/LYSclsiZSxZbQh2XvwBOqMV0G2ipySvStZ2g3fHpgKNJam1Fe86ARBAvCx8b
 x0+7C2icY62v+/gjySxxp97vzU/J22Uy98NtFSh8nEojONFVPOtMo/NxZpauRyBnVs
 YWEnP23h26qY3CuqtCvwldJArQzjr7KyTv+d/tyMRjRckOn5SGn8EIdhJZ27K7xdUQ
 Zttyd6dKWRGqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3] selftests/powerpc: Fixup clobbers for TM tests
Date: Tue, 29 Oct 2019 20:53:24 +1100
Message-Id: <20191029095324.14669-1-mpe@ellerman.id.au>
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
r1 is not clobbered.

As Segher points out, the r1 clobbers may have been added because of
the use of `or 1,1,1`, however that doesn't actually clobber r1.

Segher also points out that some of these tests do clobber LR, because
they call functions, and that is not listed in the clobbers, so add
that where appropriate.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191014023043.2969-1-mpe@ellerman.id.au
---
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c     | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

v3: Realise I'd already sent this patch twice.
    Add LR clobber as noticed by Segher:
    https://patchwork.ozlabs.org/patch/1140456/

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
index 25e23e73c72e..2ecfa1158e2b 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
@@ -73,7 +73,7 @@ void tm_spd_tar(void)
 		[sprn_texasr]"i"(SPRN_TEXASR), [tar_1]"i"(TAR_1),
 		[dscr_1]"i"(DSCR_1), [tar_2]"i"(TAR_2), [dscr_2]"i"(DSCR_2),
 		[tar_3]"i"(TAR_3), [dscr_3]"i"(DSCR_3)
-		: "memory", "r0", "r1", "r3", "r4", "r5", "r6"
+		: "memory", "r0", "r3", "r4", "r5", "r6", "lr"
 		);
 
 	/* TM failed, analyse */
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
index f603fe5a445b..6f7fb51f0809 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
@@ -74,8 +74,8 @@ void tm_spd_vsx(void)
 		"3: ;"
 		: [res] "=r" (result), [texasr] "=r" (texasr)
 		: [sprn_texasr] "i"  (SPRN_TEXASR)
-		: "memory", "r0", "r1", "r3", "r4",
-		"r7", "r8", "r9", "r10", "r11"
+		: "memory", "r0", "r3", "r4",
+		  "r7", "r8", "r9", "r10", "r11", "lr"
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
index 8027457b97b7..70ca01234f79 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
@@ -62,8 +62,8 @@ void tm_vsx(void)
 		"3: ;"
 		: [res] "=r" (result), [texasr] "=r" (texasr)
 		: [sprn_texasr] "i"  (SPRN_TEXASR), [cptr1] "b" (&cptr[1])
-		: "memory", "r0", "r1", "r3", "r4",
-		"r7", "r8", "r9", "r10", "r11"
+		: "memory", "r0", "r3", "r4",
+		  "r7", "r8", "r9", "r10", "r11", "lr"
 		);
 
 	if (result) {
-- 
2.21.0

