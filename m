Return-Path: <linuxppc-dev+bounces-11670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5EDB420FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:20:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH39j1h0Fz3bkb;
	Wed,  3 Sep 2025 23:19:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905577;
	cv=none; b=Ngn3EocVRtOwhO4t4stCnf/xZUclTNPdc5hdRb3MumKo2oREBs41npPZUPtEJq6qG1GSXr9dfp2L9jw+mx6IrXWSGHrLSxT6xV07R5LZRuHG5ASnyW2xueGk/hNDPKmbnh+ux5UknDmf2RvLthKdyucr0oa7tW6bobRoRQREmDtCIqOPPQ7Inu2FBFYCtfoKwbirWyOWIvRIOYrqyGaOKBvj9j1sU1sbB9mQFQoU/QXDJSbvyMSi1LXQ/T9Y7+YxTeTZT6eO3qF9YgbdesYyhTHSN3ckcdjQ4wUR7sPpkdBh1shyO8JTD5T0Bd5BkNhtT9vpwnkNzHy83RNhhXG9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905577; c=relaxed/relaxed;
	bh=ihCGfdjHUjlIqg1SlTX2LYwl5dKE7BVhCdQeezL/Gmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VQgHdrlFlMSoAcOU2TNffJ+w8ubjeBED3BwvE5JstmsTaBQ6q1BT4w48c43DK418mAJB8XefyCSGrn42WeNaWtV2BU4UCQElwAUZfLce/l6Yvb6VQQQjR45sTC9LA/ALaGhH0/uadIpUoayBl1Mwh7dKJXiNbVVaE5EmzY0UdSGLg8aeCNkjknHJiHjMNPTPqNvK5v+Vwebcvvsb+2wEEk0wifAlZfsLaDEfX0DPGZYe5Zyoic0A4SrbRvlQup7wB6pRHyIi7O2n+HzxTLaXXeOtQPlFAjDiABZgvjG4pmWlHLL3r8Z0YWSe5sE2tKWLM76legAdpn1y9cvS1uSFmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH39g6KHZz3bVW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:19:35 +1000 (AEST)
X-UUID: 7923175488c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:404860c2-a1e1-4a57-af4d-479ddd31998b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:8ae0b0763886d87a9cf94141ec49b745,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7923175488c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1572167497; Wed, 03 Sep 2025 21:18:25 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 328D9E008FA2;
	Wed,  3 Sep 2025 21:18:25 +0800 (CST)
X-ns-mid: postfix-68B84021-1150110
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 717CBE008FA3;
	Wed,  3 Sep 2025 21:18:21 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>
Cc: Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v4 08/10] thermal: imx: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:31 +0800
Message-Id: <20250903131733.57637-9-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
annotation for policy references. This reduces the risk of reference
counting mistakes and aligns the code with the latest kernel style.

No functional change intended.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 drivers/thermal/imx_thermal.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.=
c
index 38c993d1bcb3..cd1d9d419275 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -201,7 +201,6 @@ static struct thermal_soc_data thermal_imx7d_data =3D=
 {
=20
 struct imx_thermal_data {
 	struct device *dev;
-	struct cpufreq_policy *policy;
 	struct thermal_zone_device *tz;
 	struct thermal_cooling_device *cdev;
 	struct regmap *tempmon;
@@ -541,22 +540,20 @@ MODULE_DEVICE_TABLE(of, of_imx_thermal_match);
 static int imx_thermal_register_legacy_cooling(struct imx_thermal_data *=
data)
 {
 	struct device_node *np;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(0);
 	int ret =3D 0;
=20
-	data->policy =3D cpufreq_cpu_get(0);
-	if (!data->policy) {
+	if (!policy) {
 		pr_debug("%s: CPUFreq policy not found\n", __func__);
 		return -EPROBE_DEFER;
 	}
=20
-	np =3D of_get_cpu_node(data->policy->cpu, NULL);
+	np =3D of_get_cpu_node(policy->cpu, NULL);
=20
 	if (!np || !of_property_present(np, "#cooling-cells")) {
-		data->cdev =3D cpufreq_cooling_register(data->policy);
-		if (IS_ERR(data->cdev)) {
+		data->cdev =3D cpufreq_cooling_register(policy);
+		if (IS_ERR(data->cdev))
 			ret =3D PTR_ERR(data->cdev);
-			cpufreq_cpu_put(data->policy);
-		}
 	}
=20
 	of_node_put(np);
@@ -567,7 +564,6 @@ static int imx_thermal_register_legacy_cooling(struct=
 imx_thermal_data *data)
 static void imx_thermal_unregister_legacy_cooling(struct imx_thermal_dat=
a *data)
 {
 	cpufreq_cooling_unregister(data->cdev);
-	cpufreq_cpu_put(data->policy);
 }
=20
 #else
--=20
2.25.1


