Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B855BA39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:03:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqFL0PXnz3dY6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:03:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q/Y0jKFW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDx6GBWz3bc9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q/Y0jKFW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDx3Zvrz4xXg;
	Tue, 28 Jun 2022 00:02:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338577;
	bh=N1fXz7rEc49qkNImQCezrnviRtvtwN5YsTHTY/Iowbc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q/Y0jKFW/oGkp7i8eHtZWb65+l8UXqbuzTpFNEH7tqsreBoalxG2iPsa+MBhbFjER
	 nTLeJawE516gsmXtQdjmkeoj8rPSDYltTBnW4bMP/G1ghFRPr6ZfBQn5dEeI6BcNbI
	 y5tZI1kk1Sp+prZBwWomMY0UzgUjj/tDbew1b9j1volX+xZioUIhSBWqCeHbLXrN1b
	 nIFiQVqrknfkj1IbhrWNElOv5Id9JfWVpje14JRdhG1XxoJWt2TrCxXxWM2gIy8L7x
	 lqmeBLPcpckCE9Bnpsna6rsgJ82inn7h9fjmGjw++CDB3SyLMZ3anrA20kpo0qRIN7
	 ESKRQa58BRc+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 05/13] selftests/powerpc: Don't save TOC by default in asm helpers
Date: Tue, 28 Jun 2022 00:02:31 +1000
Message-Id: <20220627140239.2464900-5-mpe@ellerman.id.au>
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
basic_asm.h. They always save/restore r2 (TOC pointer), but none of the
selftests change r2, so it's unnecessary to save it by default.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/include/basic_asm.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/basic_asm.h b/tools/testing/selftests/powerpc/include/basic_asm.h
index faec7b11c041..be380aa779f8 100644
--- a/tools/testing/selftests/powerpc/include/basic_asm.h
+++ b/tools/testing/selftests/powerpc/include/basic_asm.h
@@ -58,11 +58,9 @@
 #define PUSH_BASIC_STACK(_extra) \
 	mflr	r0; \
 	std	r0, STACK_FRAME_LR_POS(%r1); \
-	stdu	%r1, -(((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE)(%r1); \
-	std	%r2, STACK_FRAME_TOC_POS(%r1);
+	stdu	%r1, -(((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE)(%r1);
 
 #define POP_BASIC_STACK(_extra) \
-	ld	%r2, STACK_FRAME_TOC_POS(%r1); \
 	addi	%r1, %r1, (((_extra + 15) & ~15) + STACK_FRAME_MIN_SIZE); \
 	ld	r0, STACK_FRAME_LR_POS(%r1); \
 	mtlr	r0;
-- 
2.35.3

