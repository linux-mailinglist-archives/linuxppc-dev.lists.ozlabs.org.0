Return-Path: <linuxppc-dev+bounces-11793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E12B458D5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 15:26:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJHCz3fwwz3dKH;
	Fri,  5 Sep 2025 23:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757078751;
	cv=none; b=fyOErIFORhol6KocvAGRagpnAszzsAISt5KxiiLZxGZFzlrnk4xELOkgD+Pdo7cnu7133pLFnkj+FmPYb02dT/R0FindQRH74hbweAC5L9XI8nVPtt+mqEEbYZ2yOTzgtMXLRR+QP20irYop+QrkwfZrZwmCr8iML1sUAWcQBwU10LDPoFsrK2Ut3NiLdtrkfzmYDQaZSUtr32nZj0JOde87lVx4j9+4FAoDTkSf+zW2Sbt4eyhrHVMHlkW9x8szy8WOc/ZXaPawOUDftA40uAqE7KD0MEc42LNASJmUoBSwtqYPzUCjKEbVdvKBwWrqY3PFUS3qoxNjie6oeiUJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757078751; c=relaxed/relaxed;
	bh=SOxl/zdlD1oQMHlMMLlIk2Ekl/L4rxG5wV/DxbseP1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KyUJeWRmLT+FlnMq1gYBppfSsqADZNsxiZSmOjw/WySB+Bi11v/ijuCYrrB+j4ct/N3pYs5RKgKROh3UGg2rCQrTz+DVA0SFWZ0FNOXNoC4HF6KbsgqFATU+dFrjqMo08fQ6G2JRXwQo78ifPFLFNsZiaw6NyMAKqSL2ntt37ZfzL6pnRSs6YVVL5xc3d0mIGCcsm7kUlmPmcCD/WpOKC8PxaA8wCmfBQA5C87eQiotve8U7GVAwcaYtEhWbTSYT1POyx/skwJISmqq1NtIYHmKww1iuqB8U9orX5TRtFv00VBVUXs4iXQgWy96b3l3GWaSajFyrEuILleWqd07weQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJHCy1JT5z3dK9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 23:25:49 +1000 (AEST)
X-UUID: ae0311428a5b11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8aa5386c-c9f5-4430-8500-bcee34bb0354,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:b78993f22d836f36a02cb4d46fb2af39,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae0311428a5b11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 604134888; Fri, 05 Sep 2025 21:24:41 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 14B58E008FA3;
	Fri,  5 Sep 2025 21:24:41 +0800 (CST)
X-ns-mid: postfix-68BAE498-6193824
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E5F06E008FA4;
	Fri,  5 Sep 2025 21:24:36 +0800 (CST)
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
Subject: [PATCH v5 3/6] cpufreq: intel_pstate: Use scope-based cleanup helper
Date: Fri,  5 Sep 2025 21:24:10 +0800
Message-Id: <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 drivers/cpufreq/intel_pstate.c | 59 +++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
index f366d35c5840..0b54e08f9447 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struct c=
pufreq_policy *policy,
=20
 static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
 {
-	struct cpufreq_policy *policy __free(put_cpufreq_policy);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpudata->cpu);
=20
-	policy =3D cpufreq_cpu_get(cpudata->cpu);
 	if (!policy)
 		return false;
=20
@@ -1695,41 +1694,49 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
 	return count;
 }
=20
-static void update_qos_request(enum freq_qos_req_type type)
+static bool intel_pstate_cpufreq_update_limits(int cpu, enum freq_qos_re=
q_type type)
 {
 	struct freq_qos_request *req;
-	struct cpufreq_policy *policy;
-	int i;
+	unsigned int freq, perf_pct;
+	struct cpudata *data =3D all_cpu_data[cpu];
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
=20
-	for_each_possible_cpu(i) {
-		struct cpudata *cpu =3D all_cpu_data[i];
-		unsigned int freq, perf_pct;
+	if (!policy)
+		return false;
=20
-		policy =3D cpufreq_cpu_get(i);
-		if (!policy)
-			continue;
+	req =3D policy->driver_data;
=20
-		req =3D policy->driver_data;
-		cpufreq_cpu_put(policy);
+	if (!req)
+		return false;
=20
-		if (!req)
-			continue;
+	if (hwp_active)
+		intel_pstate_get_hwp_cap(data);
=20
-		if (hwp_active)
-			intel_pstate_get_hwp_cap(cpu);
+	if (type =3D=3D FREQ_QOS_MIN) {
+		perf_pct =3D global.min_perf_pct;
+	} else {
+		req++;
+		perf_pct =3D global.max_perf_pct;
+	}
=20
-		if (type =3D=3D FREQ_QOS_MIN) {
-			perf_pct =3D global.min_perf_pct;
-		} else {
-			req++;
-			perf_pct =3D global.max_perf_pct;
-		}
+	freq =3D DIV_ROUND_UP(data->pstate.turbo_freq * perf_pct, 100);
=20
-		freq =3D DIV_ROUND_UP(cpu->pstate.turbo_freq * perf_pct, 100);
+	if (freq_qos_update_request(req, freq) < 0)
+		pr_warn("Failed to update freq constraint: CPU%d\n", cpu);
=20
-		if (freq_qos_update_request(req, freq) < 0)
-			pr_warn("Failed to update freq constraint: CPU%d\n", i);
+	return true;
+}
+
+
+static void update_qos_request(enum freq_qos_req_type type)
+{
+	int i;
+
+	for_each_possible_cpu(i) {
+		if (!intel_pstate_cpufreq_update_limits(i, type))
+			continue;
 	}
+
 }
=20
 static ssize_t store_max_perf_pct(struct kobject *a, struct kobj_attribu=
te *b,
--=20
2.25.1


