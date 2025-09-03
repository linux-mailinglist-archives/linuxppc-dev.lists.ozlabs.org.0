Return-Path: <linuxppc-dev+bounces-11667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B568B420F4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:19:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH39R0YR4z30WT;
	Wed,  3 Sep 2025 23:19:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905562;
	cv=none; b=ZmtRezniYCy/3WiaYKrb39g6u5q2KZoSGTCW/3STg3DsHioqvClr7uxUy/rHSYRLl5/uBuCwDym2sJdNNcRPTOUFNFuxQzo3hOpIrth/SSs+/3fioyZTRIe6JAze8kDApgUofBFUx8ozgzVuUOEEUUX+foMf/2PQXQOz0fc49njrOgW4RiYlL46ZkgczTNgIceblsfSlC2mSuaR+zVuNRWT+tXznnlkoNjpNtGWvINTpodG9zGwZCA0eJrRLOuWEM+9P/NS8fTYi7NfD1LX2+s1LWauuV9x5z2QqFjojytezyaxhAYRo5hc3lPnV/j71C2EcE2WdRtb7p8tKCrAfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905562; c=relaxed/relaxed;
	bh=hDpnGt0f6FuF11OLl5yhNzKPiEUlBZBsDH3iT8IR2iQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HbVpwpF0CpvB9ab1P/8dv4W/kcxVTGF/PXp+1rm2+DXnQdVv15W9hJG3T6azTqGAa33S3rfitAnPM48NtPqa0desri75hOdYVGfp0DqDs2uht81hb9/vPGPpMtWUhQ+1PB59UuLFHkPPXo2t/mDlcrQ1MkS+0UwYHJAWJlXLU6vTyJ65XJumaxUisTPf1KWS5FZghbrI06SyBvHeTcdfbOQBIgZ17WVcv2wUtHeZNouMqhGHDvvaLaAT59h9UhuND0YaHkhT3tjGlHM4Tk2DmYjWaOjIcjQJvi8ETfxJxm1XV2+xO3huf6/MSi/xApuwXxFW/bCFz26dYmEtA8xY/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH39P5BjRz30WD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:19:21 +1000 (AEST)
X-UUID: 6fdb27e088c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:12ed8bd1-e772-4e2f-b7a0-b366cc106c8e,IP:0,U
	RL:0,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:38
X-CID-META: VersionHash:6493067,CLOUDID:c7bcb509d5c742570f4125e3bd0d306b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6fdb27e088c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1513682554; Wed, 03 Sep 2025 21:18:09 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id A2980E008FA2;
	Wed,  3 Sep 2025 21:18:09 +0800 (CST)
X-ns-mid: postfix-68B84011-4806846
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E3EF1E008FA4;
	Wed,  3 Sep 2025 21:18:05 +0800 (CST)
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
Subject: [PATCH v4 04/10] cpufreq: powernv: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:27 +0800
Message-Id: <20250903131733.57637-5-zhangzihuan@kylinos.cn>
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
 drivers/cpufreq/powernv-cpufreq.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-=
cpufreq.c
index 7d9a5f656de8..811fdbf398fa 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -892,15 +892,15 @@ static int powernv_cpufreq_reboot_notifier(struct n=
otifier_block *nb,
 				unsigned long action, void *unused)
 {
 	int cpu;
-	struct cpufreq_policy *cpu_policy;
=20
 	rebooting =3D true;
 	for_each_online_cpu(cpu) {
-		cpu_policy =3D cpufreq_cpu_get(cpu);
+		struct cpufreq_policy *cpu_policy __free(put_cpufreq_policy) =3D
+			cpufreq_cpu_get(cpu);
+
 		if (!cpu_policy)
 			continue;
 		powernv_cpufreq_target_index(cpu_policy, get_nominal_index());
-		cpufreq_cpu_put(cpu_policy);
 	}
=20
 	return NOTIFY_DONE;
@@ -913,7 +913,6 @@ static struct notifier_block powernv_cpufreq_reboot_n=
b =3D {
 static void powernv_cpufreq_work_fn(struct work_struct *work)
 {
 	struct chip *chip =3D container_of(work, struct chip, throttle);
-	struct cpufreq_policy *policy;
 	unsigned int cpu;
 	cpumask_t mask;
=20
@@ -928,14 +927,14 @@ static void powernv_cpufreq_work_fn(struct work_str=
uct *work)
 	chip->restore =3D false;
 	for_each_cpu(cpu, &mask) {
 		int index;
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+			cpufreq_cpu_get(cpu);
=20
-		policy =3D cpufreq_cpu_get(cpu);
 		if (!policy)
 			continue;
 		index =3D cpufreq_table_find_index_c(policy, policy->cur, false);
 		powernv_cpufreq_target_index(policy, index);
 		cpumask_andnot(&mask, &mask, policy->cpus);
-		cpufreq_cpu_put(policy);
 	}
 out:
 	cpus_read_unlock();
--=20
2.25.1


