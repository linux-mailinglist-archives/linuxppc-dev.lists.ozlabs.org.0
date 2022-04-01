Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376334EF208
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:46:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVNKc0Vq2z3c6R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 01:46:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JrPBmmJE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JrPBmmJE; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVNHz4WG1z3dsW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 01:45:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 472FACE2589;
 Fri,  1 Apr 2022 14:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB17C2BBE4;
 Fri,  1 Apr 2022 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824316;
 bh=T2ypYNvpx3B7ILDqdpWxXox+SipGNY5Cj0gALaqc91c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JrPBmmJEnmHM/1iIn+yIYp4W2k6pwV5SqnP23A0obxZFEKH2ryXth+ZVftDBSMeAp
 2z+SvsJJroSmzZrifGA8vQi4x5DaXNtuQVqp76qV4E3CRhQ6smFZAXj/qCKsM3/sX1
 MhzhX/Fxp24MmUYpk9rzV3eIDdOSAkctiCxJusDJWLOa/Kw0R9W/ku6cXD4VrnFA69
 THWFjf/QeGkZLxt7BOIFn6Dlwwb2ZRY2PGDjEiYg0cEbpEezMrcQucP5LLD2d3t04u
 9AYHVLDx9WLYa5DsmQpVAvMVqnD6/9k6RMaFSRlhqDVThF7KExQeTmLw/qZOMQ7/u+
 YFgPLV7G1LYyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/37] powerpc: Set crashkernel offset to mid of
 RMA region
Date: Fri,  1 Apr 2022 10:44:20 -0400
Message-Id: <20220401144446.1954694-11-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401144446.1954694-1-sashal@kernel.org>
References: <20220401144446.1954694-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nathanl@linux.ibm.com, ajd@linux.ibm.com,
 aik@ozlabs.ru, Sourabh Jain <sourabhjain@linux.ibm.com>, adobriyan@gmail.com,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sourabh Jain <sourabhjain@linux.ibm.com>

[ Upstream commit 7c5ed82b800d8615cdda00729e7b62e5899f0b13 ]

On large config LPARs (having 192 and more cores), Linux fails to boot
due to insufficient memory in the first memblock. It is due to the
memory reservation for the crash kernel which starts at 128MB offset of
the first memblock. This memory reservation for the crash kernel doesn't
leave enough space in the first memblock to accommodate other essential
system resources.

The crash kernel start address was set to 128MB offset by default to
ensure that the crash kernel get some memory below the RMA region which
is used to be of size 256MB. But given that the RMA region size can be
512MB or more, setting the crash kernel offset to mid of RMA size will
leave enough space for the kernel to allocate memory for other system
resources.

Since the above crash kernel offset change is only applicable to the LPAR
platform, the LPAR feature detection is pushed before the crash kernel
reservation. The rest of LPAR specific initialization will still
be done during pseries_probe_fw_features as usual.

This patch is dependent on changes to paca allocation for boot CPU. It
expect boot CPU to discover 1T segment support which is introduced by
the patch posted here:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239175.html

Reported-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220204085601.107257-1-sourabhjain@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/machine_kexec.c | 15 +++++++++++----
 arch/powerpc/kernel/rtas.c          |  6 ++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
index 7a1c11a7cba5..716f8bb17461 100644
--- a/arch/powerpc/kernel/machine_kexec.c
+++ b/arch/powerpc/kernel/machine_kexec.c
@@ -146,11 +146,18 @@ void __init reserve_crashkernel(void)
 	if (!crashk_res.start) {
 #ifdef CONFIG_PPC64
 		/*
-		 * On 64bit we split the RMO in half but cap it at half of
-		 * a small SLB (128MB) since the crash kernel needs to place
-		 * itself and some stacks to be in the first segment.
+		 * On the LPAR platform place the crash kernel to mid of
+		 * RMA size (512MB or more) to ensure the crash kernel
+		 * gets enough space to place itself and some stack to be
+		 * in the first segment. At the same time normal kernel
+		 * also get enough space to allocate memory for essential
+		 * system resource in the first segment. Keep the crash
+		 * kernel starts at 128MB offset on other platforms.
 		 */
-		crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
+		if (firmware_has_feature(FW_FEATURE_LPAR))
+			crashk_res.start = ppc64_rma_size / 2;
+		else
+			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
 #else
 		crashk_res.start = KDUMP_KERNELBASE;
 #endif
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c1e2e351ebff..9392661ac8a8 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1244,6 +1244,12 @@ int __init early_init_dt_scan_rtas(unsigned long node,
 	entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
 	sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
 
+#ifdef CONFIG_PPC64
+	/* need this feature to decide the crashkernel offset */
+	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
+		powerpc_firmware_features |= FW_FEATURE_LPAR;
+#endif
+
 	if (basep && entryp && sizep) {
 		rtas.base = *basep;
 		rtas.entry = *entryp;
-- 
2.34.1

