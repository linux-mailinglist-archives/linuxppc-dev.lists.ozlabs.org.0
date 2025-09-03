Return-Path: <linuxppc-dev+bounces-11665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDECB420E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH39F18gRz30Jc;
	Wed,  3 Sep 2025 23:19:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905552;
	cv=none; b=FOBehVn3Ci5Yg/0wkARkm1qUpcJz9JgGnzHx75N1C2pOuktUeHiFbn7SfIMIokL+IexeDSww1pDazc7PXc6m8kTCpaGRQJlCgfh7Sohi9PZpbDjQpp732oh2IGkTrqbCQUUmRTKLdnbis9KOnCJ/lfkIpXrQg+Fe+V8RBpmRC46qHzg41uA2ntF6g8Ey6JVnyrfkYcn585aKdDBi5426AWjZAhZ6v/cm37/ax0iE12zfaZ1j3EJNoedbgBuAzIqPk+zHd6mOmAoHjOXo5cbJmc7mcgp0SFfK2JaaUuOtT3hMqPCEQ5ohButxFuNGrvoPyJICPi7z2w2pzkKWcTuszA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905552; c=relaxed/relaxed;
	bh=uN+WRBXKmvY7R1TJS+ghI4PKdQv6uwuCETWbuYCxeGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIxGbf+P4FWb0DVj5ab/Y2Az0i1y1lvoQ0IwtfX0eaXD+iUyCxKdV2jPbq9CZ8mq3LwATp+BNIQ+BgaUxsPuH1Xcm+riHJKvs+Rdcc1lsym1ujdeyVbfGdi4q18QxITTJOrfQ6rx119rAvOtyylDtNygUOQVGr/pvsVSg7u9yOkdNieT/vA9VhAaz3wZ0KWqrej7EMH7+83VaCcSMNgpHE7S63qPjV0I0ipuAaGSwh5Q70pVEhLltc88lgEMB/Au001DEyuJlxLpQ0J3GOlZ9FRM73hLD1OSNeDoi3rARbTdiz67TJNNtaaH+3HmgbkCbvYVvJNCJx8K8IIaGKW0/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH39C185Rz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:19:10 +1000 (AEST)
X-UUID: 6b6c578888c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:cc21363a-8291-4a3e-bd39-a186506d2f70,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:63c205d422a11131bd200bea55a50c60,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6b6c578888c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 487574624; Wed, 03 Sep 2025 21:18:02 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 1A8C2E008FA2;
	Wed,  3 Sep 2025 21:18:02 +0800 (CST)
X-ns-mid: postfix-68B84009-9033994
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 57859E008FA4;
	Wed,  3 Sep 2025 21:17:58 +0800 (CST)
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
Subject: [PATCH v4 02/10] ACPI: processor: thermal: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:25 +0800
Message-Id: <20250903131733.57637-3-zhangzihuan@kylinos.cn>
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
 drivers/acpi/processor_thermal.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
index 1219adb11ab9..5043f17d27b7 100644
--- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
 	return 0;
 }
=20
-static int cpu_has_cpufreq(unsigned int cpu)
+static bool cpu_has_cpufreq(unsigned int cpu)
 {
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
=20
 	if (!acpi_processor_cpufreq_init)
 		return 0;
=20
-	policy =3D cpufreq_cpu_get(cpu);
-	if (policy) {
-		cpufreq_cpu_put(policy);
-		return 1;
-	}
-	return 0;
+	return !!policy;
 }
=20
 static int cpufreq_get_max_state(unsigned int cpu)
@@ -93,9 +88,23 @@ static int cpufreq_get_cur_state(unsigned int cpu)
 	return reduction_step(cpu);
 }
=20
+static long long cpufreq_get_max_freq(unsigned int cpu)
+{
+	long long max_freq;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+		cpufreq_cpu_get(cpu);
+
+	if (!policy)
+		return -EINVAL;
+
+	max_freq =3D (policy->cpuinfo.max_freq *
+		(100 - reduction_step(cpu) * cpufreq_thermal_reduction_pctg)) / 100;
+
+	return max_freq;
+}
+
 static int cpufreq_set_cur_state(unsigned int cpu, int state)
 {
-	struct cpufreq_policy *policy;
 	struct acpi_processor *pr;
 	unsigned long max_freq;
 	int i, ret;
@@ -120,14 +129,10 @@ static int cpufreq_set_cur_state(unsigned int cpu, =
int state)
 		if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
 			continue;
=20
-		policy =3D cpufreq_cpu_get(i);
-		if (!policy)
-			return -EINVAL;
-
-		max_freq =3D (policy->cpuinfo.max_freq *
-			    (100 - reduction_step(i) * cpufreq_thermal_reduction_pctg)) / 100=
;
+		max_freq =3D cpufreq_get_max_freq(cpu);
=20
-		cpufreq_cpu_put(policy);
+		if (max_freq =3D=3D -EINVAL)
+			return -EINVAL;
=20
 		ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
 		if (ret < 0) {
--=20
2.25.1


