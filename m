Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A935BADEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:16:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTZMY67tbz3dqp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 23:16:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HLqz1KfN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTZLm1xnGz3cQV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 23:15:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HLqz1KfN;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MTZLm0q3nz4xGH;
	Fri, 16 Sep 2022 23:15:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663334128;
	bh=KsH8P93Uaxu0HWhngIXeB5UGXdiYcc9RFWWmojkz998=;
	h=From:To:Cc:Subject:Date:From;
	b=HLqz1KfNBMqXSngj9KGWHW16iDEpCyYx+brITzGMBEnyaAy5NSKUgVjy5ajOyr+sq
	 xis1WPEKTJppiT6Os8rl79QIUIXOJBRCMmMFF4CEujMmsyrjrGD6EKoVMqPWOmFCnL
	 ha5ybr1FxpQ3BisGWmGNAHdZ2gzfxLYpD6Fk4/ghR3Mm3RGmkCQP7YsIvJi8vXTfCn
	 myy5s30cg9xiPMNKnrgyAFsjUvyHqEiNuLM0hl9w5iT77nTaZsGTu5zo9ownhUGurT
	 7cN8J3kxklAjvaKECAyB4PzPwAkwCXkxyfP/mdZfUlEpdOPfdB+3oQqRylxxZsEzhF
	 qyg68t9DJKdRA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Always select HAVE_EFFICIENT_UNALIGNED_ACCESS
Date: Fri, 16 Sep 2022 23:15:23 +1000
Message-Id: <20220916131523.319123-1-mpe@ellerman.id.au>
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
Cc: lukas.bulwahn@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently powerpc selects HAVE_EFFICIENT_UNALIGNED_ACCESS in all cases
but one. The exception is if the kernel is being built little endian and
explicitly targetted for Power7.

The combination of Power7 and little endian was never commercially
supported, or widely used. It was only ever possible on bare metal
machines, using unofficial firmware, or in qemu guests hosted on those
machines.

The bare metal firmware support for Power7 was removed in 2019, see
skiboot commit 16b7ae64 ("Remove POWER7 and POWER7+ support").

Little endian kernel builds were switched to target Power8 or later in
2018, in commit a73657ea19ae ("powerpc/64: Add GENERIC_CPU support for
little endian"). Since then it's only been possible to boot a Power7/LE
kernel by explicitly building for Power7.

So drop the exception and always select HAVE_EFFICIENT_UNALIGNED_ACCESS.
If anyone does still have a Power7/LE machine it should hopefully
continue to boot, just with some performance penality, and if not they
can report a bug.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..7dc46dc2e387 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -211,7 +211,7 @@ config PPC
 	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if MPROFILE_KERNEL || PPC32
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS	if MPROFILE_KERNEL || PPC32
 	select HAVE_EBPF_JIT
-	select HAVE_EFFICIENT_UNALIGNED_ACCESS	if !(CPU_LITTLE_ENDIAN && POWER7_CPU)
+	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
-- 
2.37.2

