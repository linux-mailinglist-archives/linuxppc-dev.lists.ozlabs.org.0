Return-Path: <linuxppc-dev+bounces-11796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CAB458DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 15:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJHDM2mqtz3dRB;
	Fri,  5 Sep 2025 23:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757078771;
	cv=none; b=W/Shez+pDdF7frXKh6N4QLct2g6KFrJA3EK91lOZJjNor7xbxuDBdaXPLPHBhpQvz3vkUgA2/myctsCkU9UuRfUAKCjTDfI9nAM3edDQJeYY8fHlY9W+NClisXautDW0dM5QuPMur2YHM13VR8CoyW1rf2pDYlHupxU2XPa3yvt164onJ0o8dK26Na4EQadn/o4QQ5MDHQprAHSlyLfXbopcHWGqkDfT97HTKOTkEzGfoFrf+2Go45FJ/CiPjsb8L70TF+mHA0esQFjZU/qfWHsFtUJcYbDn9xjEnhGu79zc9OJXUt9K9+gtwZVxi/Tg5pOVvJztrxxW0UXYMJ8hTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757078771; c=relaxed/relaxed;
	bh=AQ/hGYfiv7kd9VOw7q4LVFYHiVXh15fd+Z6Ilpmqcgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j7DaK+k4SrvguZHf8hQ5fMOlekoEVWnwswHUnhfhCQBXUDHu+mfcEpvGV1j/Ppd8VvYyFG49P3vBmn3x9sSk9XMhSx0LFmPuKbAeQca/5rbcKBo7IFQic5mgZS29ahzGiZCSY7fzg+da0YkmyasxMGcPZPGZ1HlXFERJ/yJT1/HlxvduRuajlpdgKA9dcJyVFzZVWY2w45EF4nZj+oAa5xY0ln1M44UtYSYyHEN8tqpfChWHlyvVxDdAnDVoaDXQReCCmsI11pCPr82MeBuB1kUguOjPw47Ku5yYAFMKpdZeJqO5G/fAQWhDXexfm9tTVicOHXSf+cVHuHQ1IN19yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJHDL1Jxgz3dLT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 23:26:09 +1000 (AEST)
X-UUID: b8db92f68a5b11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:646670e5-e5c7-40b1-b28a-3ee5e8c5af3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:f6a8c23197cabdb3bff5558c69d77a16,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b8db92f68a5b11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 530252194; Fri, 05 Sep 2025 21:24:59 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 4D67FE008FA3;
	Fri,  5 Sep 2025 21:24:59 +0800 (CST)
X-ns-mid: postfix-68BAE4AB-1181537
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 70239E008FA7;
	Fri,  5 Sep 2025 21:24:55 +0800 (CST)
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
Subject: [PATCH v5 6/6] PM: EM: Use scope-based cleanup helper
Date: Fri,  5 Sep 2025 21:24:13 +0800
Message-Id: <20250905132413.1376220-7-zhangzihuan@kylinos.cn>
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
 kernel/power/energy_model.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index ea7995a25780..5ec63b3e7d85 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -451,7 +451,6 @@ static void
 em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_state =
*table)
 {
 	struct em_perf_domain *pd =3D dev->em_pd;
-	struct cpufreq_policy *policy;
 	int found =3D 0;
 	int i, cpu;
=20
@@ -465,7 +464,7 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
 		return;
 	}
=20
-	policy =3D cpufreq_cpu_get(cpu);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
 	if (!policy) {
 		dev_warn(dev, "EM: Access to CPUFreq policy failed\n");
 		return;
@@ -479,8 +478,6 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
 			found++;
 	}
=20
-	cpufreq_cpu_put(policy);
-
 	if (!found)
 		return;
=20
@@ -787,21 +784,19 @@ static void em_check_capacity_update(void)
=20
 	/* Check if CPUs capacity has changed than update EM */
 	for_each_possible_cpu(cpu) {
-		struct cpufreq_policy *policy;
 		struct em_perf_domain *pd;
 		struct device *dev;
=20
 		if (cpumask_test_cpu(cpu, cpu_done_mask))
 			continue;
=20
-		policy =3D cpufreq_cpu_get(cpu);
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_c=
pu_get(cpu);
 		if (!policy) {
 			pr_debug("Accessing cpu%d policy failed\n", cpu);
 			schedule_delayed_work(&em_update_work,
 					      msecs_to_jiffies(1000));
 			break;
 		}
-		cpufreq_cpu_put(policy);
=20
 		dev =3D get_cpu_device(cpu);
 		pd =3D em_pd_get(dev);
--=20
2.25.1


