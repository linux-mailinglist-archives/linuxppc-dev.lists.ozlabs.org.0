Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAF94361B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 21:14:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=assU+0D1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ1x029ykz3dD2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 05:14:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=assU+0D1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ1wK3GKzz3cY5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 05:13:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FB8662395;
	Wed, 31 Jul 2024 19:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A3BC116B1;
	Wed, 31 Jul 2024 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453214;
	bh=sXfKPdSvD2xim8678B03Zbrmf3C5NmYf7KYIuKYHsoA=;
	h=From:To:Cc:Subject:Date:From;
	b=assU+0D1YghzXsD+joyjA3vi6CzirGdiekQCGVFCwHkLtRIYEffmPn0VE9pkTLcIf
	 nGenEgRMNufXPB3RChqIQ14LmpOjfpNdeqnXPegXMIi+3q5cxTjBcGhxpF1/RMRpBn
	 kWr4HA3112qA6xrchcDYw13HLGcuF5V4f/bpaqatUVN08wHoY0j0LIzoSvXeJG0pOT
	 Te5mUnjsSF8WhBhx5FHwemCb/2Toeh3ciUXfpeMw2DZg4rtjufftUGiBYK05JlOfz8
	 vzVOMURc2wrTJSxxVV8Kmv2wn1cV3cCvb7taxlts4AL9SVew0DGzC1aeHhRGETpDPV
	 QuzoGThOJ9hkw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH] cpufreq: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:40 -0600
Message-ID: <20240731191312.1710417-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use of_property_present() to test for property presence rather than
of_(find|get)_property(). This is part of a larger effort to remove
callers of of_find_property() and similar functions. of_find_property()
leaks the DT struct property and data pointers which is a problem for
dynamically allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/cpufreq/cpufreq-dt.c           | 11 +++--------
 drivers/cpufreq/pmac64-cpufreq.c       |  2 +-
 drivers/cpufreq/sti-cpufreq.c          |  2 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c |  2 +-
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index 6532c4d71338..983443396f8f 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -69,7 +69,6 @@ static int set_target(struct cpufreq_policy *policy, unsigned int index)
 static const char *find_supply_name(struct device *dev)
 {
 	struct device_node *np __free(device_node) = of_node_get(dev->of_node);
-	struct property *pp;
 	int cpu = dev->id;
 
 	/* This must be valid for sure */
@@ -77,14 +76,10 @@ static const char *find_supply_name(struct device *dev)
 		return NULL;
 
 	/* Try "cpu0" for older DTs */
-	if (!cpu) {
-		pp = of_find_property(np, "cpu0-supply", NULL);
-		if (pp)
-			return "cpu0";
-	}
+	if (!cpu && of_property_present(np, "cpu0-supply"))
+		return "cpu0";
 
-	pp = of_find_property(np, "cpu-supply", NULL);
-	if (pp)
+	if (of_property_present(np, "cpu-supply"))
 		return "cpu";
 
 	dev_dbg(dev, "no regulator for cpu%d\n", cpu);
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 2cd2b06849a2..c87cd6e0b638 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -505,7 +505,7 @@ static int __init g5_pm72_cpufreq_init(struct device_node *cpunode)
 			continue;
 		if (strcmp(loc, "CPU CLOCK"))
 			continue;
-		if (!of_get_property(hwclock, "platform-get-frequency", NULL))
+		if (!of_property_present(hwclock, "platform-get-frequency"))
 			continue;
 		break;
 	}
diff --git a/drivers/cpufreq/sti-cpufreq.c b/drivers/cpufreq/sti-cpufreq.c
index 8e2e703c3865..b15b3142b5fe 100644
--- a/drivers/cpufreq/sti-cpufreq.c
+++ b/drivers/cpufreq/sti-cpufreq.c
@@ -267,7 +267,7 @@ static int __init sti_cpufreq_init(void)
 		goto skip_voltage_scaling;
 	}
 
-	if (!of_get_property(ddata.cpu->of_node, "operating-points-v2", NULL)) {
+	if (!of_property_present(ddata.cpu->of_node, "operating-points-v2")) {
 		dev_err(ddata.cpu, "OPP-v2 not supported\n");
 		goto skip_voltage_scaling;
 	}
diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 95ac8d46c156..293921acec93 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -146,7 +146,7 @@ static bool dt_has_supported_hw(void)
 		return false;
 
 	for_each_child_of_node_scoped(np, opp) {
-		if (of_find_property(opp, "opp-supported-hw", NULL)) {
+		if (of_property_present(opp, "opp-supported-hw")) {
 			has_opp_supported_hw = true;
 			break;
 		}
-- 
2.43.0

