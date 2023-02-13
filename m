Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4307694456
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 12:24:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFhn84lkmz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 22:24:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RAMX8bWP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFhmH0jxtz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 22:23:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RAMX8bWP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PFhmG6MZsz4x7j;
	Mon, 13 Feb 2023 22:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676287407;
	bh=HAk78M35HhLLPEo/xy13K3oCKLYNPSlE4XsF/Q1KieU=;
	h=From:To:Subject:Date:From;
	b=RAMX8bWPnXj9zhlyJ2xQbwnK2KQfyrTvc0Wxb0GtJK7T7hECoggg/tIJA2iZx2snu
	 mROirchRhaVIbPjtTJPCf89dJliBrCcpTPU9nBT3aG5VC73JNQVeKOWXuq11H1/adr
	 p/AsLutojlvPwaxbTZu+KgEXxsjz50L5QDzQzHZv0zgmUwNimD+0nu/qkk4+e96IGz
	 aLQwIPey2KFuNMkGkDzlukOFnaULhQbsqX2ii013njm2JTQL1beQ/9Jq9wg2a8X86O
	 Ng5FdrDgEqgGKZeWDH5YmvvHApU7ksJhMQIZhwVxRd0qPB/Der0QTuC1FQVX5UWzCN
	 HAD/9E+O2Qcqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/nohash: Fix build error with binutils >= 2.38
Date: Mon, 13 Feb 2023 22:23:22 +1100
Message-Id: <20230213112322.998003-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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

With bintils >= 2.38 the ppc64_book3e_allmodconfig build fails:

  {standard input}: Assembler messages:
  {standard input}:196: Error: unrecognized opcode: `lbarx'
  {standard input}:196: Error: unrecognized opcode: `stbcx.'
  make[5]: *** [scripts/Makefile.build:252: arch/powerpc/mm/nohash/e500_hugetlbpage.o] Error 1

That happens because the default CPU for that config is e5500, set via
CONFIG_TARGET_CPU, and so the assembler is building for e5500, which
doesn't support those instructions.

Fix it by using machine directives to tell the assembler to assemble the
relevant code for e6500, which does support lbarx/stbcx.

That is safe because the code already has the CPU_FTR_SMT check, which
ensures the lbarx sequence doesn't run on e5500, which doesn't support
SMT.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/nohash/e500_hugetlbpage.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/e500_hugetlbpage.c b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
index c7d4b317a823..58c8d9849cb1 100644
--- a/arch/powerpc/mm/nohash/e500_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
@@ -45,7 +45,9 @@ static inline void book3e_tlb_lock(void)
 	if (!cpu_has_feature(CPU_FTR_SMT))
 		return;
 
-	asm volatile("1: lbarx %0, 0, %1;"
+	asm volatile(".machine push;"
+		     ".machine e6500;"
+		     "1: lbarx %0, 0, %1;"
 		     "cmpwi %0, 0;"
 		     "bne 2f;"
 		     "stbcx. %2, 0, %1;"
@@ -56,6 +58,7 @@ static inline void book3e_tlb_lock(void)
 		     "bne 2b;"
 		     "b 1b;"
 		     "3:"
+		     ".machine pop;"
 		     : "=&r" (tmp)
 		     : "r" (&paca->tcd_ptr->lock), "r" (token)
 		     : "memory");
-- 
2.39.1

