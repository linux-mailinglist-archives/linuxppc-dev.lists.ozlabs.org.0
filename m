Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A7E5EC72F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McNG03hbdz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KT9hk83k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNFN4nHJz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:04:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KT9hk83k;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McNFN37KNz4xGh;
	Wed, 28 Sep 2022 01:04:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664291064;
	bh=6wdPCnugp9GsNbulhsmdssIorYQF3yvwh/O0iAThdk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KT9hk83kDgvd01DwtKOUNC9WWM2GyE8VCong1b+tAqKkkrR2EcTLGk5cJkhH7wjX/
	 y1cMQ0Gg2AvkRE1Nh5+cebUVdj3kxpBqOPZ3A+OpLF+0y3UMSJljZl10JnnnEMQ6S8
	 TWH8uepDOuEKuRVgL7BH4mA3xc50qyXB4timxo8yjEOmkjS+00rxQfoD+8KLtuKMm9
	 ZButgQCmCULp1vsTK9luLj4lxLJR2gzdtiFyxnacS2Ky3TzJbM1z7LoW21F3Jj3UgI
	 6REdlRo3d1JC9VP3lurrJ7mXksOi+NzBKMDjrPpRyDTQ/2J3Q/nylC/g76wAbKy+TH
	 zIU6Mw4TdJVwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] powerpc: Reverse stack frame marker on little endian
Date: Wed, 28 Sep 2022 01:04:19 +1000
Message-Id: <20220927150419.1503001-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927150419.1503001-1-mpe@ellerman.id.au>
References: <20220927150419.1503001-1-mpe@ellerman.id.au>
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

On little endian the stack frame marker appears reserved when dumping
memory sequentially, as is typical in xmon or gdb, eg:

  c000000004733e40 0000000000000000 0000000000000000  |................|
  c000000004733e50 0000000000000000 0000000000000000  |................|
  c000000004733e60 0000000000000000 0000000000000000  |................|
  c000000004733e70 5347455200000000 0000000000000000  |SGER............|
  c000000004733e80 a700000000000000 708897f7ff7f0000  |........p.......|
  c000000004733e90 0073428fff7f0000 208997f7ff7f0000  |.sB..... .......|
  c000000004733ea0 0100000000000000 ffffffffffffffff  |................|
  c000000004733eb0 0000000000000000 0000000000000000  |................|

To make it easier to recognise, reverse the value on little endian, so
it always appears as "REGS", eg:

  c000000004733e70 5245475300000000 0000000000000000  |REGS............|

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ptrace.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 6c23d1d25dc7..2efec6d87049 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -99,7 +99,12 @@ struct pt_regs
 
 #define STACK_FRAME_WITH_PT_REGS (STACK_FRAME_OVERHEAD + sizeof(struct pt_regs))
 
+// Always displays as "REGS" in memory dumps
+#ifdef CONFIG_CPU_BIG_ENDIAN
 #define STACK_FRAME_REGS_MARKER	ASM_CONST(0x52454753)
+#else
+#define STACK_FRAME_REGS_MARKER	ASM_CONST(0x53474552)
+#endif
 
 #ifdef __powerpc64__
 
-- 
2.37.3

