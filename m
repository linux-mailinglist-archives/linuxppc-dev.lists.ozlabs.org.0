Return-Path: <linuxppc-dev+bounces-5017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F200DA09D66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 22:50:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVFhW2NS2z3cW7;
	Sat, 11 Jan 2025 08:50:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736545851;
	cv=none; b=H2qpp6/hL2A/LHgqn0qskOAdM1bSDM6eAPD/UMarrkOnO5byIVLNXly92XxeOyWCJxQvj4Xr2nY0lPhTYQ8IRNfm8jMX03cLXpgTxDypKCj/btoWM8SMV4VUCA5QQSg7TSHq2wtnNLokykILmrCe3D8EqQuPtVY0wlyD6LG6rneWZ68KFqMON5YTodGPRbIpgrTiPcd6HLWRJBb0vo5vct775wUe96lUErzpUtFHvJB8vVrRkeVkwLoKxH96uG0z5R6BZMarDzGSg9tqdqeTAjp/YvyotWAYPxMOmpuDesiHHaomJt0BQHOXzR+kyxN6RqgptQMPP7un72WQjdmQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736545851; c=relaxed/relaxed;
	bh=M4ZRkl55MJ+1j47FLuluCpfXybU4kyYABX+ae0icOzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0momz2/9vjPFcLImogHkyYcXx07ypLu3Kab8TsIjBM/HaMRshXEMQuZpDTIiUZ/lbHM10yAX/VsxtWDMFaQGmNaK8cVd9O1dZhpirUu9CkVuVZ9VRVk/UfiqZ6QDDaQKBW/flEKqS25oPJd+4jv1U9C9ktHxpeHIDhDjmFoj+mUFGqrbs9/wxBL7liSsMHGy2i5OKZYJ9pT8O97aURhCNtQGjaCyG87NFDxR70QjAzJPoO6dm9oDp4LlDWdC9l5hRdtnUeImCH+ceZ/yLwqhP1P7dHl27sfie9IUmcIjS1C5udYnzFUcaZmtC79/y7V3DP8CtmfqM3GoB2smfO6sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MKPMpSK2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MKPMpSK2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVFhV2Kwnz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 08:50:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CAE0A4296E;
	Fri, 10 Jan 2025 21:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278D7C4CED6;
	Fri, 10 Jan 2025 21:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736545842;
	bh=nF9tyrRFwuKiGYC39fPM/9Oxc52IGKv4m7s/YvKeu+E=;
	h=From:To:Cc:Subject:Date:From;
	b=MKPMpSK2ev82viPQmRmSq1VjRI4UxlFVNqnLgJXvB9fQUkjSJ+yCoDpzl+LiR/B79
	 bpkIfQDSgQsppcOem98Md3iDaG9ZvFBj3stuINPneYa+HNSeT391Nu3uwZX0r8PubW
	 KqITaiWNlpIhTZI5yEEttV6JIZ35DEH0OFhKvp4rmIOg5TrP3hfR86cNkUH2yHsdyq
	 tk8pIGsfKevCBPgQTWvHks43eqxiALaL6RK3HKJBbAcVBP1VPYSitf4TixifPs8KKx
	 5SyemmlWeAI8R57zwQMw68QjuZNnqElWHLCpWrZbycB3zlVr7aIGkGGoHx0iTk3wC/
	 X7fqJ51aPkxuQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Saravana Kannan <saravanak@google.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] of/unittest: Add test that of_address_to_resource() fails on non-translatable address
Date: Fri, 10 Jan 2025 15:50:28 -0600
Message-ID: <20250110215030.3637845-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

of_address_to_resource() on a non-translatable address should return an
error. Additionally, this case also triggers a spurious WARN for
missing #address-cells/#size-cells.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/unittest-data/tests-platform.dtsi | 13 +++++++++++++
 drivers/of/unittest.c                        | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
index fa39611071b3..cd310b26b50c 100644
--- a/drivers/of/unittest-data/tests-platform.dtsi
+++ b/drivers/of/unittest-data/tests-platform.dtsi
@@ -34,5 +34,18 @@ dev@100 {
 				};
 			};
 		};
+
+		platform-tests-2 {
+			// No #address-cells or #size-cells
+			node {
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				test-device@100 {
+					compatible = "test-sub-device";
+					reg = <0x100 1>;
+				};
+			};
+		};
 	};
 };
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 80483e38d7b4..34c957add8b9 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1380,6 +1380,7 @@ static void __init of_unittest_bus_3cell_ranges(void)
 static void __init of_unittest_reg(void)
 {
 	struct device_node *np;
+	struct resource res;
 	int ret;
 	u64 addr, size;
 
@@ -1396,6 +1397,19 @@ static void __init of_unittest_reg(void)
 		np, addr);
 
 	of_node_put(np);
+
+	np = of_find_node_by_path("/testcase-data/platform-tests-2/node/test-device@100");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	ret = of_address_to_resource(np, 0, &res);
+	unittest(ret == -EINVAL, "of_address_to_resource(%pOF) expected error on untranslatable address\n",
+		 np);
+
+	of_node_put(np);
+
 }
 
 struct of_unittest_expected_res {
-- 
2.45.2


