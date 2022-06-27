Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461355BA3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqH907Wcz3f23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:04:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kA9rVluo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDx6S0Mz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kA9rVluo;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDx0BMrz4xXF;
	Tue, 28 Jun 2022 00:02:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338577;
	bh=zaUbu1aiCdwqKEIfcp6pk83OR9ldpaQds3tCBfTYaK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kA9rVluoEOkOyGrit2CE9qiZGsdZACQCzEvWtGs1+qP1HFIL6mpbJFU0lfyf2IDHS
	 U39UNJYAPtq6yJecatn0lu1LqezU9fJN8WVjQLh0gzM54evr5hNOmg87yKXmxibQ9U
	 9+OdfD+4dvsWglpYRe+I4eVGOIlUwMZ3M29T1mz1jbmZMfVXftI9ovNOBI7KsiH0B3
	 iFnrWA26eR/galWlGeJedsWKdkvmzZ8uLTq2eVYuatYBpfwUpIdvqzSKbXDqPtKO57
	 6xZE0ZmufW5MxgrUCqZy3zyweG4tSLoLFHe1qSVax5J9XxT+PA2KTYYSnU5DVwrCQH
	 nu8nDDZX6Excw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 04/13] selftests/powerpc: Don't save CR by default in asm helpers
Date: Tue, 28 Jun 2022 00:02:30 +1000
Message-Id: <20220627140239.2464900-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thare are some asm helpers for creating/popping stack frames in
basic_asm.h. They always save/restore CR, but none of the selftests
tests touch non-volatile CR fields, so it's unnecessary to save them by
default.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/include/basic_asm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/basic_asm.h b/tools/testing/selftests/powerpc/include/basic_asm.h
index 807e83e821ec..faec7b11c041 100644
--- a/tools/testing/selftests/powerpc/include/basic_asm.h
+++ b/tools/testing/selftests/powerpc/include/basic_asm.h
@@ -59,14 +59,10 @@
 	mflr	r0; \
 	std	r0, STACK_FRAME_LR_POS(%r1); \
 	stdu	%r1, -(((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE)(%r1); \
-	mfcr	r0; \
-	stw	r0, STACK_FRAME_CR_POS(%r1); \
 	std	%r2, STACK_FRAME_TOC_POS(%r1);
 
 #define POP_BASIC_STACK(_extra) \
 	ld	%r2, STACK_FRAME_TOC_POS(%r1); \
-	lwz	r0, STACK_FRAME_CR_POS(%r1); \
-	mtcr	r0; \
 	addi	%r1, %r1, (((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE); \
 	ld	r0, STACK_FRAME_LR_POS(%r1); \
 	mtlr	r0;
-- 
2.35.3

