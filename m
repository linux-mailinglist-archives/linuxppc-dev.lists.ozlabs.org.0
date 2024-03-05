Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC0871FB1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:57:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eSqoXwoB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpwZh22G1z3vZb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 23:57:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eSqoXwoB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpwYy4fw2z3d4F
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 23:56:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709643414;
	bh=2/2JX2Jns0twYaY6s3tCsU/wK2ACRYJCFPt+zkVZEMk=;
	h=From:To:Cc:Subject:Date:From;
	b=eSqoXwoBg4DOdTWltnUiNqnevdhtGOv88rmPPiEunUoT1ickKIEsU4jpqP40+Ym6g
	 RZKbrBRnfgLsHCVkCC/al+K9NrKg+GrCcRTwRMZtDmAnHUkBmCPJEjIfW1nZgXyTPS
	 W1ecB2wrSbV+22ukEqFvixnWp5GwCZ8M8UUif/2XaPaqYMd+hGAeMew5Hrd1LSVBjQ
	 s08y1GKr4Ic3jlz2uoJyuXnPni2hh8BoGzDPYWcU/1KJULnOWPKCEVM2X2GZccgDFt
	 h6kk5ncwSocXI3hlzKXSvqxq+JMTOBnkep0zCNDHgbR1IcZN5j18BLvF2wO/0aWsMO
	 4XZHcb9p4A0Yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TpwYy0mldz4wnp;
	Tue,  5 Mar 2024 23:56:53 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: keescook@chromium.org
Subject: [PATCH] selftests/powerpc: Fix load_unaligned_zeropad build failure
Date: Tue,  5 Mar 2024 23:56:44 +1100
Message-ID: <20240305125644.3315910-1-mpe@ellerman.id.au>
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
Cc: andy.shevchenko@gmail.com, linuxppc-dev@lists.ozlabs.org, sachinp@linux.ibm.com, tanzirh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This test is userspace code, but uses some kernel headers via symlinks,
and mocks other headers, in order to test load_unaligned_zeropad().

Currently the test fails to build with:

  In file included from load_unaligned_zeropad.c:26:
  word-at-a-time.h:7:10: fatal error: linux/bitops.h: No such file or directory
      7 | #include <linux/bitops.h>

This is due to the recent changes to the kernel headers.

Fix it by symlinking the new wordpart.h, and creating an empty stub for
bitops.h which is all that's needed.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Fixes: 66a5c40f60f5 ("kernel.h: removed REPEAT_BYTE from kernel.h")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/primitives/linux/bitops.h   | 0
 tools/testing/selftests/powerpc/primitives/linux/wordpart.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/powerpc/primitives/linux/bitops.h
 create mode 120000 tools/testing/selftests/powerpc/primitives/linux/wordpart.h

Kees, do you mind taking this one via your tree because that's where the commit
that changes the headers is?

diff --git a/tools/testing/selftests/powerpc/primitives/linux/bitops.h b/tools/testing/selftests/powerpc/primitives/linux/bitops.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tools/testing/selftests/powerpc/primitives/linux/wordpart.h b/tools/testing/selftests/powerpc/primitives/linux/wordpart.h
new file mode 120000
index 000000000000..4a74d2cbbc9b
--- /dev/null
+++ b/tools/testing/selftests/powerpc/primitives/linux/wordpart.h
@@ -0,0 +1 @@
+../../../../../../include/linux/wordpart.h
\ No newline at end of file
-- 
2.43.2

