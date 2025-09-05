Return-Path: <linuxppc-dev+bounces-11794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B168B458D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 15:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJHDB4Ysgz3dK9;
	Fri,  5 Sep 2025 23:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757078762;
	cv=none; b=Wem9LqDzG13REI2qeL9E+Ud3N+4oIJ4Z2zPfY3FlbQZPllf4qcIwKIrpxXTJr6nunOnyk5bXSVzt/BegC4AE2zpnaEMQV4C4Fgu1XnOlVMfPZkJV8zQ3TFVBgk/lH9gSJQtkdgTYZCsEzB+pl8KxlAfgApXJQmC+wEdqsKlqh0HIHfQM8Uc+cdcRBTwcN/rTvIJ7DzUtt3jaoZRXY7N+SZJzZSFrzndQOF13+/I6mHL/AsAi8fX9qZuryyI0p9VMP5Qw6gHtHX0gA88ZC9FXk5ZF78GV4sHSl6fMNbU4w0xoKa75HF+DZSd5NtmNyUG3aAgSC80vF01TCPbquBHKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757078762; c=relaxed/relaxed;
	bh=giJSzi7Jl5hMLTK9I9T/cQCET3zTy9DQ1hSR+W/M3TI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jc2WWNy545FYyy6EXY6UMPIX4jndDCPWqrh4N6YBLx2TqEmRLEhxvGjWJdStS/z0SIn2pLDzLv22wFYTK7sq62QxxAw94cnhomD5S67DHxeyvNGEk1KbElUvJkRbof5t/z1MTnDS42nVkLBa3osf8F1Fu2zFo2RyV3gtgUTd7VQDfI+EU/q/mtsxzVyGYXF3+JXtICImuz7wfM2EEYgJ+MMtJ7rWrz7zhLh46ccrrU0Irb7qnaJx540E82QG8uMUV6BdwZrhepwAG6i1B2Xp3WXIPneppiMIVX+VuaSXGAsnJsqNDzHmeuMdG6ncSpgcrCfbc61yDRJOEJuP/9dJOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJHD91p8tz3ccX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 23:26:00 +1000 (AEST)
X-UUID: b44a3dfa8a5b11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:b8a8a8e9-2660-4e89-a43a-f9d5a297e17a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:d547413c6b29f7a2761f5c65158ef560,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b44a3dfa8a5b11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 342664798; Fri, 05 Sep 2025 21:24:51 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 716AAE008FA3;
	Fri,  5 Sep 2025 21:24:51 +0800 (CST)
X-ns-mid: postfix-68BAE4A1-8445755
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 1F509E008FA4;
	Fri,  5 Sep 2025 21:24:41 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
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
Subject: [PATCH v5 4/6] PM / devfreq: Use scope-based cleanup helper
Date: Fri,  5 Sep 2025 21:24:11 +0800
Message-Id: <20250905132413.1376220-5-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
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
 drivers/devfreq/governor_passive.c | 60 +++++++++++-------------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governo=
r_passive.c
index 953cf9a1e9f7..5afaea39377e 100644
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
@@ -255,8 +252,6 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
 			=3D (struct devfreq_passive_data *)devfreq->data;
 	struct device *dev =3D devfreq->dev.parent;
 	struct opp_table *opp_table =3D NULL;
-	struct devfreq_cpu_data *parent_cpu_data;
-	struct cpufreq_policy *policy;
 	struct device *cpu_dev;
 	unsigned int cpu;
 	int ret;
@@ -273,37 +268,34 @@ static int cpufreq_passive_register_notifier(struct=
 devfreq *devfreq)
 	}
=20
 	for_each_possible_cpu(cpu) {
-		policy =3D cpufreq_cpu_get(cpu);
-		if (!policy) {
-			ret =3D -EPROBE_DEFER;
-			goto err;
-		}
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+			cpufreq_cpu_get(cpu);
=20
-		parent_cpu_data =3D get_parent_cpu_data(p_data, policy);
-		if (parent_cpu_data) {
-			cpufreq_cpu_put(policy);
+		if (!policy)
+			return -EPROBE_DEFER;
+
+		struct devfreq_cpu_data *initial_parent_cpu_data =3D
+			get_parent_cpu_data(p_data, policy);
+
+		if (initial_parent_cpu_data)
 			continue;
-		}
=20
-		parent_cpu_data =3D kzalloc(sizeof(*parent_cpu_data),
-						GFP_KERNEL);
-		if (!parent_cpu_data) {
-			ret =3D -ENOMEM;
-			goto err_put_policy;
-		}
+		struct devfreq_cpu_data *parent_cpu_data __free(kfree) =3D
+			kzalloc(sizeof(*parent_cpu_data), GFP_KERNEL);
+
+		if (!parent_cpu_data)
+			return -ENOMEM;
=20
 		cpu_dev =3D get_cpu_device(cpu);
 		if (!cpu_dev) {
 			dev_err(dev, "failed to get cpu device\n");
-			ret =3D -ENODEV;
-			goto err_free_cpu_data;
+			return -ENODEV;
 		}
=20
 		opp_table =3D dev_pm_opp_get_opp_table(cpu_dev);
 		if (IS_ERR(opp_table)) {
 			dev_err(dev, "failed to get opp_table of cpu%d\n", cpu);
-			ret =3D PTR_ERR(opp_table);
-			goto err_free_cpu_data;
+			return PTR_ERR(opp_table);
 		}
=20
 		parent_cpu_data->dev =3D cpu_dev;
@@ -313,8 +305,8 @@ static int cpufreq_passive_register_notifier(struct d=
evfreq *devfreq)
 		parent_cpu_data->min_freq =3D policy->cpuinfo.min_freq;
 		parent_cpu_data->max_freq =3D policy->cpuinfo.max_freq;
=20
-		list_add_tail(&parent_cpu_data->node, &p_data->cpu_data_list);
-		cpufreq_cpu_put(policy);
+		list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
+			&p_data->cpu_data_list);
 	}
=20
 	mutex_lock(&devfreq->lock);
@@ -324,14 +316,6 @@ static int cpufreq_passive_register_notifier(struct =
devfreq *devfreq)
 		dev_err(dev, "failed to update the frequency\n");
=20
 	return ret;
-
-err_free_cpu_data:
-	kfree(parent_cpu_data);
-err_put_policy:
-	cpufreq_cpu_put(policy);
-err:
-
-	return ret;
 }
=20
 static int devfreq_passive_notifier_call(struct notifier_block *nb,
--=20
2.25.1


