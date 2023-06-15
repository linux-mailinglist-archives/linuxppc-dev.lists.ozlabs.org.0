Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742D73190D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 14:38:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ibxt6HU3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhhfJ6zC7z3c1H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 22:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ibxt6HU3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhhdQ5Lk8z300n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 22:37:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhhdN4XXfz4wjC;
	Thu, 15 Jun 2023 22:37:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686832650;
	bh=DLcf+5K7V3E4z4AVT96NbZayRebxq4PS4eXJ8mvvsq0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ibxt6HU3Ozs2KNsN/fyE4RqL/akFc3n6BY/SCqOex2hfflFE/hkGqjj8IG38r4GmB
	 WbJlhl+4skBEXg5OfF6CVEI50B5JcjOleo7/1iXuWYr+R6bdAm1khKMBZGcA5yDFLB
	 mqsfYsG9vAFtdasO0ZStrDXddt2finCYpw95XzhjV3NPh6GTak+7d/mR3qd8rh+ZrC
	 cRzX19yxhzyPv2EVSnNQj4oyTdH6iPzwoJ008KAaWX/qQeND0wftiYNZSsnawZGE13
	 zqEvPbyQZtqZwBFjTUONgR1ZJQL9myAemOjTdlKtFWGvlYNeSma9gua63PK0M1AKyh
	 X/DmCyCF++m4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 1/2] powerpc/tpm: Create linux,sml-base/size as big endian
Date: Thu, 15 Jun 2023 22:37:02 +1000
Message-Id: <20230615123703.4028156-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
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
Cc: eajames@linux.ibm.com, jgg@ziepe.ca, jarkko@kernel.org, yangyingliang@huawei.com, linux-integrity@vger.kernel.org, peterhuewe@gmx.de, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's code in prom_instantiate_sml() to do a "SML handover" (Stored
Measurement Log) from OF to Linux, before Linux shuts down Open
Firmware.

This involves creating a buffer to hold the SML, and creating two device
tree properties to record its base address and size. The kernel then
later reads those properties from the device tree to find the SML.

When the code was initially added in commit 4a727429abec ("PPC64: Add
support for instantiating SML from Open Firmware") the powerpc kernel
was always built big endian, so the properties were created big endian
by default.

However since then little endian support was added to powerpc, and now
the code lacks conversions to big endian when creating the properties.

This means on little endian kernels the device tree properties are
little endian, which is contrary to the device tree spec, and in
contrast to all other device tree properties.

To cope with that a workaround was added in tpm_read_log_of() to skip
the endian conversion if the properties were created via the SML
handover.

A better solution is to encode the properties as big endian as they
should be, and remove the workaround.

Typically changing the encoding of a property like this would present
problems for kexec. However the SML is not propagated across kexec, so
changing the encoding of the properties is a non-issue.

Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM event log")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 arch/powerpc/kernel/prom_init.c |  8 ++++++--
 drivers/char/tpm/eventlog/of.c  | 23 ++++-------------------
 2 files changed, 10 insertions(+), 21 deletions(-)

v2: Add Stefan's reviewed-by.

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index d464ba412084..72fe306b6820 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1900,6 +1900,7 @@ static void __init prom_instantiate_sml(void)
 	u32 entry = 0, size = 0, succ = 0;
 	u64 base;
 	__be32 val;
+	__be64 val64;
 
 	prom_debug("prom_instantiate_sml: start...\n");
 
@@ -1956,10 +1957,13 @@ static void __init prom_instantiate_sml(void)
 
 	reserve_mem(base, size);
 
+	val64 = cpu_to_be64(base);
 	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-base",
-		     &base, sizeof(base));
+		     &val64, sizeof(val64));
+
+	val = cpu_to_be32(size);
 	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-size",
-		     &size, sizeof(size));
+		     &val, sizeof(val));
 
 	prom_debug("sml base     = 0x%llx\n", base);
 	prom_debug("sml size     = 0x%x\n", size);
diff --git a/drivers/char/tpm/eventlog/of.c b/drivers/char/tpm/eventlog/of.c
index 930fe43d5daf..0bc0cb6333c6 100644
--- a/drivers/char/tpm/eventlog/of.c
+++ b/drivers/char/tpm/eventlog/of.c
@@ -51,8 +51,8 @@ static int tpm_read_log_memory_region(struct tpm_chip *chip)
 int tpm_read_log_of(struct tpm_chip *chip)
 {
 	struct device_node *np;
-	const u32 *sizep;
-	const u64 *basep;
+	const __be32 *sizep;
+	const __be64 *basep;
 	struct tpm_bios_log *log;
 	u32 size;
 	u64 base;
@@ -73,23 +73,8 @@ int tpm_read_log_of(struct tpm_chip *chip)
 	if (sizep == NULL || basep == NULL)
 		return -EIO;
 
-	/*
-	 * For both vtpm/tpm, firmware has log addr and log size in big
-	 * endian format. But in case of vtpm, there is a method called
-	 * sml-handover which is run during kernel init even before
-	 * device tree is setup. This sml-handover function takes care
-	 * of endianness and writes to sml-base and sml-size in little
-	 * endian format. For this reason, vtpm doesn't need conversion
-	 * but physical tpm needs the conversion.
-	 */
-	if (of_property_match_string(np, "compatible", "IBM,vtpm") < 0 &&
-	    of_property_match_string(np, "compatible", "IBM,vtpm20") < 0) {
-		size = be32_to_cpup((__force __be32 *)sizep);
-		base = be64_to_cpup((__force __be64 *)basep);
-	} else {
-		size = *sizep;
-		base = *basep;
-	}
+	size = be32_to_cpup(sizep);
+	base = be64_to_cpup(basep);
 
 	if (size == 0) {
 		dev_warn(&chip->dev, "%s: Event log area empty\n", __func__);
-- 
2.40.1

