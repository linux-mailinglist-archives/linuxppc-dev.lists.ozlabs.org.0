Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6A65EF70F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdZm93KX1z3f5j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:01:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oVmForOv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdZjj6wvnz307C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 23:59:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oVmForOv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdZjf1Wl4z4xGT;
	Thu, 29 Sep 2022 23:59:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664459974;
	bh=Wnbk66ivAKryyRRSf+MuMSh0U1FLFIq+sOvgdZFxJro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVmForOvQWAeBQrKY4EW1OVwPWnpA9sP+yVLo7y38avELS5HYrtLK0ql5tjiw0mp2
	 SQqKtmIWTVxyYsszIF4s/CqJ5c+T3GDm/enLKIBa8xONlPM8YuSjDdXyPv/O3WOHs8
	 O746pyEY1vEOLvgRjKFbexgWCpcV2l3eGhfDKiok8rKux+0DXltf2L2RUEvFa+Jljp
	 5gw0/0LwFh6cHMkCah0nM3QjSwtilzWkXZ0Uk1UZdbI3YW3jisBA9XI8W6lPglX5Cz
	 kbp16V43kFsYCgUtYZ6T/HA7+Rebw2ijtGOgbHT6gWOD2+xUJjA0JwrtqvsPUg//mn
	 mACvXWIfOeekg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/6] powerpc: Add PVR & CPU name to hardware description
Date: Thu, 29 Sep 2022 23:59:15 +1000
Message-Id: <20220929135919.1983269-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929135919.1983269-1-mpe@ellerman.id.au>
References: <20220929135919.1983269-1-mpe@ellerman.id.au>
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

