Return-Path: <linuxppc-dev+bounces-11356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C924B378C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 05:46:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBVnF6MVjz3cZ2;
	Wed, 27 Aug 2025 13:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756262123;
	cv=none; b=W2ril4bkmLJBOZtIDjjeyyrJv2c1C6GlENqLjM6bUUlPUdmCDhRRpReLtm77rQ+SHnTfSwBOPxrMoUhDPEILeX8UECzSQK02uDf2snOPFSri21yPDg04beZCbshsZ4LucFu69oOnBt6Y9+DATm28NteBmxPvn/S1vN3HFJfMGgENWpQu2R2tEC6xfuXL+BHGJnIzxEANcbCOntyfiQbMY82EewH1C7AyMhXuMlX/G6vsM1io1UsZW6T7zhNa+eWhFdsbThg8kHS7+sUQy886C06Vj8p5e6IWuETJH+i7TJK+vhyHrD3MowJ/RV9baFH/syTA/xHhzjghgRdhHmXG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756262123; c=relaxed/relaxed;
	bh=vHB+Y+aMEE7YUbkLZ9/oIqPdUaBA3kNe68mhS6hnRfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T5SHrO8oGfQR+yEBlYrueJVk2Df/WtRnihE+Os+TQdaZIUtA1yAls8vzcfzJJuHaebcMjFbSBY/jaEklkUwXQOh4wt+QNAjwwvnCWH/IrbWI0n0HBSLE3ryQGeEXrAKb6iFp2T1AoJ3Buw66ylAS5Kh54jlat2tYgSKM2+oanvB9Ju4/3IDZ6QU/hFlcwoI0Ya43DkONgpcAG2Q1K/D8Z5sTDa3GGhP1q92MDdxItjsa5YMqr1kpTWBA1OBcJgt0/3tFrKkoi8GOdoYmMiQiWmOFSfSzUkt0PYuSjavzO1Yl9MgXJ+6M6/Fjrulb+r4LSHdJXd+wHjTG/jtXsm1QRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBTCZ4prsz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 12:35:22 +1000 (AEST)
X-UUID: 509d738682ee11f0b29709d653e92f7d-20250827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:21bc73ac-f260-4ff7-a401-49b0431cf2a2,IP:0,U
	RL:0,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:38
X-CID-META: VersionHash:6493067,CLOUDID:c286950a378f6aef19c736e56726756b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 509d738682ee11f0b29709d653e92f7d-20250827
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1975567847; Wed, 27 Aug 2025 10:34:11 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 16486E008FAB;
	Wed, 27 Aug 2025 10:34:11 +0800 (CST)
X-ns-mid: postfix-68AE6EA1-678600215
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 7BE61E008FAC;
	Wed, 27 Aug 2025 10:34:04 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v2 09/18] cpufreq: powernv: Use __free(put_cpufreq_policy) for policy reference
Date: Wed, 27 Aug 2025 10:31:53 +0800
Message-Id: <20250827023202.10310-10-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
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
 drivers/cpufreq/powernv-cpufreq.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-=
cpufreq.c
index 7d9a5f656de8..782cf5a482c0 100644
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
+		struct cpufreq_policy *cpu_policy __free(put_cpufreq_policy);
+
 		cpu_policy =3D cpufreq_cpu_get(cpu);
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
@@ -928,6 +927,7 @@ static void powernv_cpufreq_work_fn(struct work_struc=
t *work)
 	chip->restore =3D false;
 	for_each_cpu(cpu, &mask) {
 		int index;
+		struct cpufreq_policy *policy __free(put_cpufreq_policy);
=20
 		policy =3D cpufreq_cpu_get(cpu);
 		if (!policy)
@@ -935,7 +935,6 @@ static void powernv_cpufreq_work_fn(struct work_struc=
t *work)
 		index =3D cpufreq_table_find_index_c(policy, policy->cur, false);
 		powernv_cpufreq_target_index(policy, index);
 		cpumask_andnot(&mask, &mask, policy->cpus);
-		cpufreq_cpu_put(policy);
 	}
 out:
 	cpus_read_unlock();
--=20
2.25.1


