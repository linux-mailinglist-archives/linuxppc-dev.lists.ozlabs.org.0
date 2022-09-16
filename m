Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97515BADEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:15:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTZLy51w5z3cf5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 23:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PNLaZuVb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTZKq5MJgz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 23:14:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PNLaZuVb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MTZKm0nLLz4x1L;
	Fri, 16 Sep 2022 23:14:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663334076;
	bh=R0FlRubTe9IScUuWasHLLjTE+l/gonZyr1u/t6qzuEk=;
	h=From:To:Cc:Subject:Date:From;
	b=PNLaZuVbcehIA4ik0DkzMapNq7cR6eJX346vg1Nt8SlXn4lv7pgu2U9sJqSGXAbEd
	 xc5hVQcVcnOr+CeypefKj/LCa92kQVXlJjX4XeLGyBiZ2RS5sc51S1eNSphvR+HWaP
	 +kLd9gDLqSokoWjz+ZZV1/nsYAEHUNnLFPLcSz1CAW1M+6zQ7cu2b8GI+FS2rNSvov
	 49MKuQsojIAqC61HLNPxvNLbDhmW6IXDLYGy3pG9Wy+KqleurAWYq4sv2lk5zph0et
	 /PerG1v/guJZwo6+D4zUdQhky26TXAqdTdmo0rcOaz2d4kD8tdHjSuZvdiXNSvVasa
	 QS1wFamoh+Xtw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/vmlinux.lds: Ensure STRICT_ALIGN_SIZE is at least page aligned
Date: Fri, 16 Sep 2022 23:14:21 +1000
Message-Id: <20220916131422.318752-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a check that STRICT_ALIGN_SIZE is aligned to at least PAGE_SIZE.

That then makes the alignment to PAGE_SIZE immediately after the
alignment to STRICT_ALIGN_SIZE redundant, so remove it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index fe22d940412f..4e56fc0ee42a 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -32,6 +32,10 @@
 
 #define STRICT_ALIGN_SIZE	(1 << CONFIG_DATA_SHIFT)
 
+#if STRICT_ALIGN_SIZE < PAGE_SIZE
+#error "CONFIG_DATA_SHIFT must be >= PAGE_SIZE"
+#endif
+
 ENTRY(_stext)
 
 PHDRS {
@@ -215,7 +219,6 @@ SECTIONS
  */
 	. = ALIGN(STRICT_ALIGN_SIZE);
 	__init_begin = .;
-	. = ALIGN(PAGE_SIZE);
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
 		_sinittext = .;
 		INIT_TEXT
-- 
2.37.2

