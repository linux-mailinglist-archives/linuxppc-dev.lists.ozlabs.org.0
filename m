Return-Path: <linuxppc-dev+bounces-11668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90ACB420F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:19:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH39T4ZgJz3bW7;
	Wed,  3 Sep 2025 23:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905565;
	cv=none; b=VJmasmre8mdyZTXsXPlo1w80gPWAxWh3LiWg2zRZUr0l1+ozB6mrCIRF2mpTvm4lVMX+uMCFBrtHJdQLFtvCCkAPTLO7QqspcTsPQ3rjOaOPIAL/J+tA/FVvNX9ADHQ5f5YSOKrvyMra3cWMdOYGuXulbgibShKNFMaBO21rhQAaedH3NaXmLEFLjWNnZveAVZAmfVWczh5dmBv3mDz690YB3CCFfhv9JOoSVcugsrieGonmWqM2LXNjVVCVT7Ge5eiYrv5/FmMX6pOqklWUwp+q2FIYSBAIA+ePxw5ty6t22Og4xmlzAsPVng42FVeTODZ9HKY1Ir9VqFWTFquZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905565; c=relaxed/relaxed;
	bh=EVWHWC5VoJCBYh2RGJ/tMMg0p6BAfHdpK43jFQIlMOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E2fVxQ5pVOgs3pFlLg/HPvltzQIGQv545k3/rwJXkb91+knceSEM4FMYUN1xtSmDyirc8/aEoFyy+daoRd5ID7FCPbf6RcxmrvidrFTgASpk4GGcgCPFUrrMJUpu2FJwkgTmL+5SwfEjsOIDziQIB+A2OpHwpZnarxY98juZSvQldGyDC9SvTDThVsCsvE6M9ob82LNwlMB253DtMZkbUyYHe7fYZrb5S48qVng9aAqJtt6H3Mc8I8EtpQcB61Xhp/nAj51vz5961FGkXlmPvijLeC+A0I2Dk+uHZsRqvca6HlyREv7VIWmA8iB9Fc8U4khaW3zo9qm3Jok9lDmUgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH39S35Snz3bVW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:19:24 +1000 (AEST)
X-UUID: 7225f52a88c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:03d6cce6-2064-47c3-bebb-0dae30991a82,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ff7be0c6729f0e3faf64acb4b4023c94,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7225f52a88c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1862006784; Wed, 03 Sep 2025 21:18:13 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 791F1E008FA2;
	Wed,  3 Sep 2025 21:18:13 +0800 (CST)
X-ns-mid: postfix-68B84015-3074077
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id AF321E008FA3;
	Wed,  3 Sep 2025 21:18:09 +0800 (CST)
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
Subject: [PATCH v4 05/10] PM / devfreq: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:28 +0800
Message-Id: <20250903131733.57637-6-zhangzihuan@kylinos.cn>
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
 drivers/devfreq/governor_passive.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governo=
r_passive.c
index 953cf9a1e9f7..a035cf44bdb8 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -80,24 +80,23 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
 	struct devfreq_passive_data *p_data =3D
 				(struct devfreq_passive_data *)devfreq->data;
 	struct devfreq_cpu_data *parent_cpu_data;
-	struct cpufreq_policy *policy;
 	unsigned long cpu, cpu_cur, cpu_min, cpu_max, cpu_percent;
 	unsigned long dev_min, dev_max;
 	unsigned long freq =3D 0;
 	int ret =3D 0;
=20
 	for_each_online_cpu(cpu) {
-		policy =3D cpufreq_cpu_get(cpu);
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+			cpufreq_cpu_get(cpu);
+
 		if (!policy) {
 			ret =3D -EINVAL;
 			continue;
 		}
=20
 		parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
-		if (!parent_cpu_data) {
-			cpufreq_cpu_put(policy);
+		if (!parent_cpu_data)
 			continue;
-		}
=20
 		/* Get target freq via required opps */
 		cpu_cur =3D parent_cpu_data->cur_freq * HZ_PER_KHZ;
@@ -106,7 +105,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
 					devfreq->opp_table, &cpu_cur);
 		if (freq) {
 			*target_freq =3D max(freq, *target_freq);
-			cpufreq_cpu_put(policy);
 			continue;
 		}
=20
@@ -121,7 +119,6 @@ static int get_target_freq_with_cpufreq(struct devfre=
q *devfreq,
 		freq =3D dev_min + mult_frac(dev_max - dev_min, cpu_percent, 100);
=20
 		*target_freq =3D max(freq, *target_freq);
-		cpufreq_cpu_put(policy);
 	}
=20
 	return ret;
@@ -256,7 +253,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
 	struct device *dev =3D devfreq->dev.parent;
 	struct opp_table *opp_table =3D NULL;
 	struct devfreq_cpu_data *parent_cpu_data;
-	struct cpufreq_policy *policy;
 	struct device *cpu_dev;
 	unsigned int cpu;
 	int ret;
@@ -273,23 +269,23 @@ static int cpufreq_passive_register_notifier(struct=
 devfreq *devfreq)
 	}
=20
 	for_each_possible_cpu(cpu) {
-		policy =3D cpufreq_cpu_get(cpu);
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+			cpufreq_cpu_get(cpu);
+
 		if (!policy) {
 			ret =3D -EPROBE_DEFER;
 			goto err;
 		}
=20
 		parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
-		if (parent_cpu_data) {
-			cpufreq_cpu_put(policy);
+		if (parent_cpu_data)
 			continue;
-		}
=20
 		parent_cpu_data =3D kzalloc(sizeof(*parent_cpu_data),
 						GFP_KERNEL);
 		if (!parent_cpu_data) {
 			ret =3D -ENOMEM;
-			goto err_put_policy;
+			goto err;
 		}
=20
 		cpu_dev =3D get_cpu_device(cpu);
@@ -314,7 +310,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
 		parent_cpu_data->max_freq =3D policy->cpuinfo.max_freq;
=20
 		list_add_tail(&parent_cpu_data->node, &p_data->cpu_data_list);
-		cpufreq_cpu_put(policy);
 	}
=20
 	mutex_lock(&devfreq->lock);
@@ -327,8 +322,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
=20
 err_free_cpu_data:
 	kfree(parent_cpu_data);
-err_put_policy:
-	cpufreq_cpu_put(policy);
 err:
=20
 	return ret;
--=20
2.25.1


