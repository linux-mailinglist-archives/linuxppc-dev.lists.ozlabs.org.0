Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262C5EF76A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:24:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdbGT0xWGz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:24:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EB4Bxtl8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdbFJ0dPzz3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 00:23:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EB4Bxtl8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdbFH6grZz4xGZ;
	Fri, 30 Sep 2022 00:23:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664461412;
	bh=Wnbk66ivAKryyRRSf+MuMSh0U1FLFIq+sOvgdZFxJro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EB4Bxtl8YwZSOud1rNDRfAJHi/nCnVy2iidgW8+THLjYE9bRWpY1OJ3z3fsirqDEx
	 eOFLGnI9q/Eg/CNUNrqCsW7MkJMRlI3EZIL0wv/eG65DK0IuLN4jkI2OBgEvo8TOpb
	 YvaqPIkmGwZ39LWWchWPjnxAOy62X5J+Ok1202SFUyM6i/wXJ0y9BrPsQ1ODW7OCkD
	 KLGMhdlr3p0Z1aUa/dy3oM5sdqKiFFgDqQEAfHpVqBp1Miyk26V9XPMWupuSQHEEC2
	 XIcX18kdgh4yRIr41D12clDq6xLIOUPXuzZGyOGfXFfLFvWTPM8aPaawc/JTw0XN4S
	 1G7WyT7nW9bpw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/6] powerpc: Add PVR & CPU name to hardware description
Date: Fri, 30 Sep 2022 00:22:47 +1000
Message-Id: <20220929142251.1987025-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929142251.1987025-1-mpe@ellerman.id.au>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the PVR and CPU name to the hardware description, which is printed
at boot and in case of an oops.

eg: Hardware name: ... cpu:'POWER8E (raw)' pvr:0x4b0201

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 2e7a04dab2f7..b42e2dbeb021 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -30,6 +30,7 @@
 #include <linux/libfdt.h>
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
+#include <linux/seq_buf.h>
 
 #include <asm/rtas.h>
 #include <asm/page.h>
@@ -819,6 +820,10 @@ void __init early_init_devtree(void *params)
 
 	dt_cpu_ftrs_scan();
 
+	// We can now add the CPU name & PVR to the hardware description
+	seq_buf_printf(&ppc_hw_desc, "cpu:'%s' pvr:0x%04lx ", cur_cpu_spec->cpu_name,
+		       mfspr(SPRN_PVR));
+
 	/* Retrieve CPU related informations from the flat tree
 	 * (altivec support, boot CPU ID, ...)
 	 */
-- 
2.37.3

