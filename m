Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B062492D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:21:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWjx60wFzDqvD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWWBW3PcQzDqsq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:57:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fek/vBSO; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWWBW2B2tz9sPf; Wed, 19 Aug 2020 11:57:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWWBV6VtGz9sTY; Wed, 19 Aug 2020 11:57:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802258;
 bh=DzimpmvIWbkMt7SlkRYmlppKhDY2/OTbYdRonD9LQY0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fek/vBSOBWNViVDZbTsQpVjoRW83tRpjB/to90kH+XYmb6JodtBxB+CgAjzKmEp9k
 cndLIq8VQ73zM1zNzJa86+f1FF+dMOR1eaGAM8VdP0sxmC8gGei3LHvvR+eqbISy0c
 O6hy9wG+11B0svU5vNA2I+cfVfSQ4sGxq4+yQF4cvYaQ8YKfm0Ojv0Jppbsdtf5NPn
 azGZIRPQF8S8XCwcqDs7cFlH9ufrdGnvf8QxIztv12cHH/1zn77mvysWC30dyMna3g
 5qWutJLA1Bu8y+wKZOOxKx4E9R8JvVS9tDg1e6HLknKhSkqf8O/oCAAvwxUIdmYc0S
 rBozBGoNblE5Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 9/9] selftests/powerpc: Properly handle failure in
 switch_endian_test
Date: Wed, 19 Aug 2020 11:57:27 +1000
Message-Id: <20200819015727.1977134-9-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819015727.1977134-1-mpe@ellerman.id.au>
References: <20200819015727.1977134-1-mpe@ellerman.id.au>
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

On older CPUs the switch_endian() syscall doesn't work. Currently that
causes the switch_endian_test to just crash. Instead detect the
failure and properly exit with a failure message.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../switch_endian/switch_endian_test.S        | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/switch_endian/switch_endian_test.S b/tools/testing/selftests/powerpc/switch_endian/switch_endian_test.S
index cc4930467235..7887f78cf072 100644
--- a/tools/testing/selftests/powerpc/switch_endian/switch_endian_test.S
+++ b/tools/testing/selftests/powerpc/switch_endian/switch_endian_test.S
@@ -3,9 +3,13 @@
 
 	.data
 	.balign 8
-message:
+success_message:
 	.ascii "success: switch_endian_test\n\0"
 
+	.balign 8
+failure_message:
+	.ascii "failure: switch_endian_test\n\0"
+
 	.section ".toc"
 	.balign 8
 pattern:
@@ -64,6 +68,9 @@ FUNC_START(_start)
 	li r0, __NR_switch_endian
 	sc
 
+	tdi   0, 0, 0x48	// b +8 if the endian was switched
+	b     .Lfail	  	// exit if endian didn't switch
+
 #include "check-reversed.S"
 
 	/* Flip back, r0 already has the switch syscall number */
@@ -71,12 +78,20 @@ FUNC_START(_start)
 
 #include "check.S"
 
+	ld	r4, success_message@got(%r2)
+	li	r5, 28	// strlen(success_message)
+	li	r14, 0	// exit status
+.Lout:
 	li	r0, __NR_write
 	li	r3, 1	/* stdout */
-	ld	r4, message@got(%r2)
-	li	r5, 28	/* strlen(message3) */
 	sc
 	li      r0, __NR_exit
-	li	r3, 0
+	mr	r3, r14
 	sc
 	b       .
+
+.Lfail:
+	ld	r4, failure_message@got(%r2)
+	li	r5, 28	// strlen(failure_message)
+	li	r14, 1
+	b	.Lout
-- 
2.25.1

