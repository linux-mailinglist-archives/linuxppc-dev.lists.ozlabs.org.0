Return-Path: <linuxppc-dev+bounces-11553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A6B3DD43
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 10:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFjVK4wNdz301B;
	Mon,  1 Sep 2025 18:59:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756717161;
	cv=none; b=Pew1c1nsF9HEOfvrx7jfUO/VuZWohvEIKZO3sJCY3OYaI6Ny2tOYEs99zSoTMjoOl35RzN3xd3d5JIrD66ty1d55uZ37ObN7qvpEaqZh0jcFa83GqvISmySy2x+X0SpU7tbZq3dV6dcJtDlwl6PWQ7VRANptOFoiY5jUqkEHbpQerl9i1tAwhqntXKwrbF/uY3q2oBVPqMLhvLCSea8ZPkaEbqACqxuuTSDkJ3RwAfL1h72vaq4YxnL3D1qebtTTJ9BEZ5IOSJKGK/lCfz4W8uuEHsPzcRR7J1iRWUdalvfgXLYRXGiO/Mzkf9uxntHHe1HSssm+rDe90NOHjPdSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756717161; c=relaxed/relaxed;
	bh=C+CH8r2wXcGDK1vEuDpDtwVoqW0mlfHqypJqjEci2HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Px9MEvL+ko9PBNCffxsLfEsXCzFkUWcpdaPT3Z7n+LQRP+4G9pktcdXLHsn8K2aALOywMK5g8AIGb1kot/kGagWa5rvE3eG8J/XFIT56ALhSbqUvfEKGlj65ya9Qkf5tFKb6MFUYEgPMeo5W4tL9N6VXcpZDHMKGHOpjev5566PsUKyQ/pHw/ShJlu4uUan+apRnjH/qckz2Wk1i0j0dSNcQHpE97Ft5PRA0oaU4owPPgmc47oHTqtfbYLKycTjuODsls1e+Y5ilzfDzbueKKQ3H5Wey9hgrRwUPlqI9nZ+KOcCtI9/2iz0UMEPaxt0cTdTvS7BwaHe+Wb1RPx40Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFjVJ3xJcz2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 18:59:20 +1000 (AEST)
X-UUID: c7ef96b8871111f0b29709d653e92f7d-20250901
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:6d13546f-8429-4618-a1c3-1481c587b2a4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:bdf8f6555902ff4aa82c4fdfd0209733,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7ef96b8871111f0b29709d653e92f7d-20250901
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 95500762; Mon, 01 Sep 2025 16:58:08 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id E1EACE008FA6;
	Mon,  1 Sep 2025 16:58:06 +0800 (CST)
X-ns-mid: postfix-68B5601E-556482735
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id D540EE008FA8;
	Mon,  1 Sep 2025 16:58:02 +0800 (CST)
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
Subject: [PATCH v3 01/12] arm64: topology: Use scope-based cleanup helper
Date: Mon,  1 Sep 2025 16:57:37 +0800
Message-Id: <20250901085748.36795-2-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
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
 arch/arm64/kernel/topology.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae..fa0980968f45 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
 		 */
 		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
 		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_E=
XP_MS))) {
-			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
+			struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+				cpufreq_cpu_get(info->opp_cpu);
 			int ref_cpu;
=20
 			if (!policy)
 				return -EINVAL;
=20
 			if (!cpumask_intersects(policy->related_cpus,
-						housekeeping_cpumask(HK_TYPE_TICK))) {
-				cpufreq_cpu_put(policy);
+						housekeeping_cpumask(HK_TYPE_TICK)))
 				return -EOPNOTSUPP;
-			}
=20
 			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
 				if (ref_cpu =3D=3D start_cpu) {
@@ -329,8 +328,6 @@ int arch_freq_get_on_cpu(int cpu)
 					break;
 			}
=20
-			cpufreq_cpu_put(policy);
-
 			if (ref_cpu >=3D nr_cpu_ids)
 				/* No alternative to pull info from */
 				return -EAGAIN;
--=20
2.25.1


