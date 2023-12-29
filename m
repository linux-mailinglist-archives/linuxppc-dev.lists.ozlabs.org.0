Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905AF81FF4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 13:04:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R834tpqO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1kZQ2HKWz3dRt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Dec 2023 23:04:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R834tpqO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1kVv62fJz3byT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Dec 2023 23:01:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703851287;
	bh=VBP8pGJTkyLVpg2aerijLY0eZdkYiejhxD2xPbSWKaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R834tpqOew00qzu9dKZeHwwakZRxQg29vUlUzCO7fbQwVtpFDshXxtK/uWIax179t
	 dW94azno3w03Sb0Dr85lfcc8z0WPBJtSYqBNz3v7EhuPf9uSbptWf8GeekdjD1SIx9
	 W63efzeWNRmS6L9knV8K7RH+Iu+kyNWIXVMqFtNCPOEgALKChmKmr/xTbYQYBOJ7my
	 XMdxDpn3alHCrxU7FGAQcp7KyDVWmYv6nBJ3QT1oriXndlYavao6cdGrSE5ggqjE0W
	 ZxzJTy3oyY75r9sF+DftYJlAWq9LhRGDev2Ak3YSu/JuoyDx+NxvHG7FZG1XDwjakq
	 y3EdmVkv5tuEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T1kVv5wDqz4xV1;
	Fri, 29 Dec 2023 23:01:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 4/5] powerpc/smp: Factor out assign_threads()
Date: Fri, 29 Dec 2023 23:01:06 +1100
Message-ID: <20231229120107.2281153-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229120107.2281153-1-mpe@ellerman.id.au>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <piliu@redhat.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Factor out the for loop that assigns CPU numbers to threads of a core.
The function takes the next CPU number to use as input, and returns the
next available CPU number after the threads has been assigned.

This will allow a subsequent change to assign threads out of order.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/setup-common.c | 32 ++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index ff7616023ade..d9f8ed9bd2fc 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -411,6 +411,25 @@ static void __init cpu_init_thread_core_maps(int tpc)
 
 u32 *cpu_to_phys_id = NULL;
 
+static int assign_threads(unsigned cpu, unsigned int nthreads, bool avail,
+                          const __be32 *hw_ids)
+{
+	for (int i = 0; i < nthreads && cpu < nr_cpu_ids; i++) {
+		__be32 hwid;
+
+		hwid = be32_to_cpu(hw_ids[i]);
+
+		DBG("    thread %d -> cpu %d (hard id %d)\n", i, cpu, hwid);
+
+		set_cpu_present(cpu, avail);
+		set_cpu_possible(cpu, true);
+		cpu_to_phys_id[cpu] = hwid;
+		cpu++;
+	}
+
+	return cpu;
+}
+
 /**
  * setup_cpu_maps - initialize the following cpu maps:
  *                  cpu_possible_mask
@@ -446,7 +465,7 @@ void __init smp_setup_cpu_maps(void)
 	for_each_node_by_type(dn, "cpu") {
 		const __be32 *intserv;
 		__be32 cpu_be;
-		int j, len;
+		int len;
 
 		DBG("  * %pOF...\n", dn);
 
@@ -473,16 +492,7 @@ void __init smp_setup_cpu_maps(void)
 			avail = !of_property_match_string(dn,
 					"enable-method", "spin-table");
 
-		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
-
-			DBG("    thread %d -> cpu %d (hard id %d)\n",
-			    j, cpu, be32_to_cpu(intserv[j]));
-
-			set_cpu_present(cpu, avail);
-			set_cpu_possible(cpu, true);
-			cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
-			cpu++;
-		}
+		cpu = assign_threads(cpu, nthreads, avail, intserv);
 
 		if (cpu >= nr_cpu_ids) {
 			of_node_put(dn);
-- 
2.43.0

