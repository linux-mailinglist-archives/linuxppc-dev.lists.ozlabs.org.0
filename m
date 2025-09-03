Return-Path: <linuxppc-dev+bounces-11671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC59B420FE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH39k2CBRz3bmL;
	Wed,  3 Sep 2025 23:19:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905578;
	cv=none; b=RfBclLAvVz7SOvgdeaNJYWL4uRMCJgz81P9qXHPZ7YH3VvP+hG1ZWL/Eh76iPq7QeDtpdMg21n5uGuMdd55MlvXrMUeQQ0D7U2ccege7TCFYNRfhx51QvHL5HGJjI3ptWGokUG9Dfed+2RNSCwR8pPyH4bZZGKkpZlHISlB5TSZgn/sPxx6sHHdl8XtH2pXsMcDp3GMpWYEjLZ1baPUeH8CdBdLruxpUCxz1JwJwt1XMhGGExyOOrVMnB/CcuqOI7tLmIS+NqevaYV7EX6BmscMJFJzmtsJq5++X++5/GBBDPJ77I+G3+ZD4viFciHFHbJtiIiyPYGYfxvpu5rHHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905578; c=relaxed/relaxed;
	bh=3MvsGH8QX5LLonBYdvEBwUryvZzqtafTW9SaKiYRc2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WePfZHlEaO3rNnCNh/x6YKEISLHGa+tI9bexlkKhHFhi8ccJbpI6tCqYl2aIcv+/ZhlF1ZCUvqfHUR5y27E3erXyIsdhwtmfn/XQBgg1fNbvUCn4lEbL6P/0WRoj0QAi8I/uMMrCBAHvWYZ0ccZszwx1Qjj6qYJz/fC4yImyjvOQxfeRHptzC60swedTM8zXnuEtgF65gYpyBwqp9P+eYqJLtqWPGeNWxzkZ8pO9UmriZ9RYNmL1nXiiiVHlyjIoKPMBV1QPZoMNd8cYzfCxFG4EzK/cTFOd1MMOjFGPq5anXkrosqbrVso9KEtpO/S1lwqfWoCI5nEgE43k0NcBzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH39j0B6Wz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:19:36 +1000 (AEST)
X-UUID: 770bae1888c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0168c3e0-98fe-406d-85b1-48da848a7ccc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:2c9e1e9e5c5ada8eb7e570a730afb71d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 770bae1888c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1452110782; Wed, 03 Sep 2025 21:18:22 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 65C56E008FA2;
	Wed,  3 Sep 2025 21:18:21 +0800 (CST)
X-ns-mid: postfix-68B8401D-2351769
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id A519FE008FA4;
	Wed,  3 Sep 2025 21:18:17 +0800 (CST)
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
Subject: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:30 +0800
Message-Id: <20250903131733.57637-8-zhangzihuan@kylinos.cn>
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
 drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
index 99390ec1481f..f76594185fa2 100644
--- a/drivers/powercap/dtpm_cpu.c
+++ b/drivers/powercap/dtpm_cpu.c
@@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtpm)
 static void pd_release(struct dtpm *dtpm)
 {
 	struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
-	struct cpufreq_policy *policy;
=20
 	if (freq_qos_request_active(&dtpm_cpu->qos_req))
 		freq_qos_remove_request(&dtpm_cpu->qos_req);
=20
-	policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
-	if (policy) {
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+		cpufreq_cpu_get(dtpm_cpu->cpu);
+
+	if (policy)
 		for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
 			per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
=20
-		cpufreq_cpu_put(policy);
-	}
-
 	kfree(dtpm_cpu);
 }
=20
@@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
 static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
 {
 	struct dtpm_cpu *dtpm_cpu;
-	struct cpufreq_policy *policy;
 	struct em_perf_state *table;
 	struct em_perf_domain *pd;
 	char name[CPUFREQ_NAME_LEN];
@@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
 	if (dtpm_cpu)
 		return 0;
=20
-	policy =3D cpufreq_cpu_get(cpu);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+		cpufreq_cpu_get(cpu);
+
 	if (!policy)
 		return 0;
=20
 	pd =3D em_cpu_get(cpu);
-	if (!pd || em_is_artificial(pd)) {
-		ret =3D -EINVAL;
-		goto release_policy;
-	}
+	if (!pd || em_is_artificial(pd))
+		return -EINVAL;
=20
 	dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
-	if (!dtpm_cpu) {
-		ret =3D -ENOMEM;
-		goto release_policy;
-	}
+	if (!dtpm_cpu)
+		return -ENOMEM;
=20
 	dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
 	dtpm_cpu->cpu =3D cpu;
@@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
 	if (ret < 0)
 		goto out_dtpm_unregister;
=20
-	cpufreq_cpu_put(policy);
 	return 0;
=20
 out_dtpm_unregister:
@@ -251,8 +245,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
 		per_cpu(dtpm_per_cpu, cpu) =3D NULL;
 	kfree(dtpm_cpu);
=20
-release_policy:
-	cpufreq_cpu_put(policy);
 	return ret;
 }
=20
--=20
2.25.1


