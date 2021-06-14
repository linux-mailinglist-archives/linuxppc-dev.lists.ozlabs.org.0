Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7573A7259
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:09:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nFT51ZPz3c36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:09:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=nBO3423Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=nBO3423Y; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9h0SHyz2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9Z4PyRz9sjJ; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9Z3Zpqz9sWF; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711938; bh=PROqUwC19aaKZLIjUUUC14e2Q9Z0xnH3PSQimcabjRk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=nBO3423Ysu41F7/tiRMfLYGT6YbhQ+t9cDcNU6elb9Or1BpQ5h5s4eYIwbMALQ/78
 /Gm10VApvDcPTaSqZjwbzWeUWULz6xGYEqFAg9cebMtyn9XWO7Oct7+zBGA2lnFUBP
 7pJ9TACCdev89q1kTdTEYB0Hnp40iQ6fpAq+fcu633/FNeUubrB3UzzrQ5nNuXTl8Z
 9Q39tteukC7gdpyeWjibZPuuOvSFNm+dFxlRGwU2cbNbd1c1OT4UXO/dVPvCukTZFH
 lTrfzpHTJgIALxXviEt9pDOootblAYWHrLtZxIEncV1pF+Mdg4w6xNJ+bXz6U5OacE
 GU46QcM+/3s5g==
Date: Tue, 15 Jun 2021 09:00:01 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 04/11] powerpc/microwatt: Populate platform bus from
 device-tree
Message-ID: <YMffcRoiDlQiH5jf@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Just like any other embedded platform.

Add an empty soc node.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/powerpc/boot/dts/microwatt.dts      | 7 +++++++
 arch/powerpc/platforms/microwatt/setup.c | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 9b2e64da9432..a72177e5041d 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -102,4 +102,11 @@ chosen {
 		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 40];
 	};
 
+	soc@c0000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges = <0 0 0xc0000000 0x40000000>;
+	};
 };
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index d80d52612672..5af4adf881bc 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -8,6 +8,8 @@
 #include <linux/kernel.h>
 #include <linux/stddef.h>
 #include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <asm/machdep.h>
 #include <asm/time.h>
 
@@ -16,6 +18,12 @@ static int __init microwatt_probe(void)
 	return of_machine_is_compatible("microwatt-soc");
 }
 
+static int __init microwatt_populate(void)
+{
+	return of_platform_default_populate(NULL, NULL, NULL);
+}
+machine_arch_initcall(microwatt, microwatt_populate);
+
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.probe			= microwatt_probe,
-- 
2.31.1

