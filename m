Return-Path: <linuxppc-dev+bounces-11664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04186B420E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH39D5JpQz2ywh;
	Wed,  3 Sep 2025 23:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905552;
	cv=none; b=YDEB4zl1YbVpz+ziL9epudtBxW3WXHSALj6KiOCapQtFb+PxNKUUSBFv4Ri3uGv6KdCpgJ7garA5WX6iDojaZZ4Dw1byGs2+P7dSIq2z6B+r51UoLce2DPVS815YO8bcrDrkYh3AqVWrv6AZC8kAmzaR0gfo2MkYWQV+5F5iHi5xWsSHkqZ+tN+koC2E4b44XkfHD53nIqYskE/aL+IXswKH39Tw/M4XpwXLspH1OCUe2h+ugFDPuJUpgcW0Lb8xFS2SBq8REm7OF393VWzfwF7EQkN7sBBXWjXmAvsidrxSGYsY3C5e9tjYvU2sp6+/PSPaJefXGUTxvDTxH+1xVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905552; c=relaxed/relaxed;
	bh=oQRasQAuOexR5yXx/NmyXeeM5QYG65I5wWIOsBmRJA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dPyZuYhdkFC0eqgg5O4KY+EMH3aKneCpJxB6+iVz15t7XF8tQmb8kpfmO4ZQTVeiHXfXnFgxjl61vg46csUw+GLijxYNUorT+IGmuVheryqWvXmNlbIvKlsPgzLWSUYO8r2ujtmL1bgt+vNW1+GpQ6GYCJgfGoNVz0Eehp4jfG3YESZXcQr3rRrzlGngUhIhTn7B1d9V5LTJ/+UvnhVOW11fpWYcU0vjm96aHbZEmzeAcv4NbSMy1jHiuXtyk5n5svWHBCkRroZUHAdBgqwkKI4w3FbSKSJqOu6ET0gG2LwXCCa6im/kmML+5S9njlTjF2mUmvlWaxFm7AmOkJN9qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH39C19mTz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:19:10 +1000 (AEST)
X-UUID: 692a80c688c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:3ddeb900-f5f4-400e-a2b5-2d2a7352155c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d13f05546fa3a3e5009a7a2fda0e8af8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 692a80c688c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 755720587; Wed, 03 Sep 2025 21:17:58 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 4A097E008FA2;
	Wed,  3 Sep 2025 21:17:58 +0800 (CST)
X-ns-mid: postfix-68B84005-4750173
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id DBC83E008FA3;
	Wed,  3 Sep 2025 21:17:53 +0800 (CST)
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
Subject: [PATCH v4 01/10] arm64: topology: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:24 +0800
Message-Id: <20250903131733.57637-2-zhangzihuan@kylinos.cn>
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
 arch/arm64/kernel/topology.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 5d07ee85bdae..0eebd3492669 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -307,17 +307,16 @@ int arch_freq_get_on_cpu(int cpu)
 		 */
 		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
 		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_E=
XP_MS))) {
-			struct cpufreq_policy *policy =3D cpufreq_cpu_get(cpu);
+			struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+				cpufreq_cpu_get(cpu);
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


