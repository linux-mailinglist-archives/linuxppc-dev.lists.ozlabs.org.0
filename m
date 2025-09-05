Return-Path: <linuxppc-dev+bounces-11792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 681CFB458D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 15:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJHCs42l4z3dJV;
	Fri,  5 Sep 2025 23:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757078745;
	cv=none; b=CYBCIWBsGBpBQxbukUGmKbl5O/xk/OqZnu97TGsJopRn4TCcOmO2JpNBVAU37wqrueenssSDI3AdmamFT9EnlKp5CpxBGOX/Be98QY0sbgJ5vQCZRJGgS6g5O1oENp3WcFID8sOChuJ8Kv39R1404AC0IithQArBBMnLByLhacfjy+wzEN2qanNpaMfRtjmW2eCd4D9ZULJChdmEMk9Z8koxzsRq5khNlXrEhtIfuVBAG9YXTfdHtNy5WeOri06SviDUucli/4f4lExJBXyovb7FmAqpR0GN7c0QcvumZy49plQG6dTVBAu6DsxAs9k7ijJNMzvPXmmB+WvAH+Sivg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757078745; c=relaxed/relaxed;
	bh=yV76owGAi5F4q81khZCRuC80WdKXT15Ol7OKmOM+gMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oOg/9SfLEgqWngkEEhpeywfRaXO7oyGx6HvLQ8LgeJoEyqPqKo21i0rPNCSJZY6uIZWPoxnDYmS6Oza+nkNPk/PkzC6BJ4Z403+x5vbMc86CG41do6h5Rg/APhIW/HcaUqVF7rsv5UhLQ/5jRQBMqopj4lG0sR6SMTbY4ALRgBVk0XNs4tnEPlHDOvxm28eBK2WcArMzXDQXIeOuZHW1aKh5xB7ezmuX+PCUYAlkBw+YMnV244g9V1zi5KkkA4WuLgLD4GAooii3BTGd6Wqx2+OxDRwldXSOy/STOuWveioFYhxp8000aFNMiQ5w419QH/PTEY0DrqP6x29erJT6IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJHCr2L5yz3bqs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 23:25:43 +1000 (AEST)
X-UUID: ab7f0e948a5b11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:4b2060ab-e5d6-4d05-9c5f-b1ce0c1d23cf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:1052e2a43a89a6a3ff62207c016cfdeb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ab7f0e948a5b11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 659114040; Fri, 05 Sep 2025 21:24:37 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id D9FE4E008FA3;
	Fri,  5 Sep 2025 21:24:36 +0800 (CST)
X-ns-mid: postfix-68BAE494-7144943
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 0A8E7E008FA7;
	Fri,  5 Sep 2025 21:24:32 +0800 (CST)
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
Subject: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup helper
Date: Fri,  5 Sep 2025 21:24:09 +0800
Message-Id: <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
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
 drivers/acpi/processor_thermal.c | 52 +++++++++++++++++---------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
index 1219adb11ab9..460713d1414a 100644
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
-
 	if (!acpi_processor_cpufreq_init)
 		return 0;
=20
-	policy =3D cpufreq_cpu_get(cpu);
-	if (policy) {
-		cpufreq_cpu_put(policy);
-		return 1;
-	}
-	return 0;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
+
+	return policy !=3D NULL;
 }
=20
 static int cpufreq_get_max_state(unsigned int cpu)
@@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
 	return reduction_step(cpu);
 }
=20
+static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acpi_p=
rocessor *pr)
+{
+	unsigned long max_freq;
+	int ret;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
+
+	if (!policy)
+		return false;
+
+	max_freq =3D (policy->cpuinfo.max_freq *
+		(100 - reduction_step(cpu) * cpufreq_thermal_reduction_pctg)) / 100;
+
+	ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
+	if (ret < 0) {
+		pr_warn("Failed to update thermal freq constraint: CPU%d (%d)\n",
+	  pr->id, ret);
+	}
+
+	return true;
+}
+
 static int cpufreq_set_cur_state(unsigned int cpu, int state)
 {
-	struct cpufreq_policy *policy;
 	struct acpi_processor *pr;
-	unsigned long max_freq;
-	int i, ret;
+	int i;
=20
 	if (!cpu_has_cpufreq(cpu))
 		return 0;
@@ -120,20 +134,8 @@ static int cpufreq_set_cur_state(unsigned int cpu, i=
nt state)
 		if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
 			continue;
=20
-		policy =3D cpufreq_cpu_get(i);
-		if (!policy)
+		if (!cpufreq_update_thermal_limit(i, pr))
 			return -EINVAL;
-
-		max_freq =3D (policy->cpuinfo.max_freq *
-			    (100 - reduction_step(i) * cpufreq_thermal_reduction_pctg)) / 100=
;
-
-		cpufreq_cpu_put(policy);
-
-		ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
-		if (ret < 0) {
-			pr_warn("Failed to update thermal freq constraint: CPU%d (%d)\n",
-				pr->id, ret);
-		}
 	}
 	return 0;
 }
--=20
2.25.1


