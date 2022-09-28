Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5BA5EDDFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McyP95nfsz3f6N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IVixxF0b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McyL936Wdz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IVixxF0b;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McyL72pzHz4xGh;
	Wed, 28 Sep 2022 23:40:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664372431;
	bh=pi+mUOLsnhmd6VVvCm4bw8pEUUFjwaM50i6henrEXqE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IVixxF0b2KwMHLOsnvERQ5NNeaJ6m3SUBNElNvB4OdimyvE+HGWKslUoI35zTg1ys
	 onJ2Op8Dv+BbC5Mt/FD4RY7Zjroj+xzxf8k7VdQG70ADKQ9E4DSZqLbvoIJ1ka/KIP
	 K4P6pKJiH6hqW9mtqvkwxPMGTBgRzLjwdPKzHMWVbyDhCNzC7ZrcnIvxI7bnKbQrbU
	 1NsQDeiybSsQucx7odkIUWE7oo55Ae2mKFKnyPzcYdV1kPhoddfZ4Gu3luBIOucn5p
	 19izVWTALp9X+pf6Np/ZPkpf2ozoaoHC2fwFHUSAn6heE6eWURWusryCA4NNVfK2ob
	 YiS0e/abCCo3g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/6] powerpc: Add PVR & CPU name to dump stack arch description
Date: Wed, 28 Sep 2022 23:40:21 +1000
Message-Id: <20220928134025.1739909-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928134025.1739909-1-mpe@ellerman.id.au>
References: <20220928134025.1739909-1-mpe@ellerman.id.au>
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

Add the PVR and CPU name to the dump stack arch description, which is
printed in case of an oops.

eg: Hardware name: ... POWER8E (raw) pvr:0x4b0201

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 2e7a04dab2f7..7987d69f1785 100644
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
 
+	/* We can now set the CPU name & PVR for the oops output */
+	seq_buf_printf(&ppc_hw_desc, "%s pvr:0x%04lx ", cur_cpu_spec->cpu_name,
+		       mfspr(SPRN_PVR));
+
 	/* Retrieve CPU related informations from the flat tree
 	 * (altivec support, boot CPU ID, ...)
 	 */
-- 
2.37.3

