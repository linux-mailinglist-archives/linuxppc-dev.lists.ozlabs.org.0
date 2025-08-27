Return-Path: <linuxppc-dev+bounces-11347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CAB378A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 05:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBVlw37Qhz2xcC;
	Wed, 27 Aug 2025 13:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756262032;
	cv=none; b=mIiIhKO3p+Oi5hBFBNmIsOpvsrR4QNLYSCMs6HhixPi9EAngD84xgCuqxWHjlPsku0uarOLZ2qJzErUZoZFsPEmM4WS6t3yYjtCl2LhYe1ozyRuJfG+p81Ig9WKe65Pkabuotdj1oxA0LywhjnDU3aTBbaLWd52KvhrHOWRpEkYGCd8J9lws53u84KZ80q10WVAodpk3+ig15QUHBgmvJIXymqtlzYMdKyL889g6nq2ZYQbR2xdwJ9GCtkjeilbPZpW32n76eFs9N3xxb4VXU/iaqBuEB3r40PtY1284kOMvjSJVb7jct9rI6tTkQCntJ3HgZJgjhbGi8SR2e8EDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756262032; c=relaxed/relaxed;
	bh=PpgQ5XhljIfFIHu+yBPXlXKeCfLTb/QJAew60j+OiZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oki8YUpO04cYiBlKb6Do/cKbJW3yEG0gqANOdfTuRfGFYQPrGklgRw8i3uBqNJZniN0ddCxkJasUlkSyJXbogUcYxCswq6Ifte/k+O/PwI1W5q5LmTj+p0z9fge/3RhXuzkM5Rf3k2gmHHerdAz5oCCJP43n/VP6ADujnBprVLTbccQRhIUwXyZGW+jm6yYAM2Tn+CC59agWbtoLswbTHmKEpXz0GvjR7HQZAV4mmmU2R0fwEs0h9fvZJGi00PdL4zXlUgBM4DvHNZCgrnCzqABq/vMh2Jr4iQn7lkgK6rS7sW6lVTIBK5EWCSUuC4HVFM0FGZCIoquFiiJ7vrYLdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBT9n70q2z2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 12:33:46 +1000 (AEST)
X-UUID: 1608347c82ee11f0b29709d653e92f7d-20250827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:9ef84008-8d93-4efc-b22c-c01a63cd65b6,IP:0,U
	RL:0,TC:0,Content:30,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-META: VersionHash:6493067,CLOUDID:9b84e483923621b91582f098a4e5a9f9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:4|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1608347c82ee11f0b29709d653e92f7d-20250827
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1094580345; Wed, 27 Aug 2025 10:32:33 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 85EFFE008FAC;
	Wed, 27 Aug 2025 10:32:32 +0800 (CST)
X-ns-mid: postfix-68AE6E40-207889202
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id C0D71E008FAA;
	Wed, 27 Aug 2025 10:32:14 +0800 (CST)
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
Subject: [PATCH v2 00/18] cpufreq: use __free() for all cpufreq_cpu_get() references
Date: Wed, 27 Aug 2025 10:31:44 +0800
Message-Id: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

This patchset converts all remaining cpufreq users to rely on the
__free(put_cpufreq_policy) annotation for policy references, instead of
calling cpufreq_cpu_put() manually.

Motivation:
- Reduce the chance of reference counting mistakes
- Make the code more consistent with the latest kernel style
- behavior remains the same, but reference counting is now safer=20
  and easier to maintain.

The changes are split into 18 patches as they touch different subsystems
and are maintained by different people. There is no functional change.

V2:
 - Fix compile error in powernv-cpufreq.c
 - Split patch to separate logical changes

Zihuan Zhang (18):
  arm64: topology: Use __free(put_cpufreq_policy) for policy reference
  KVM: x86: Use __free(put_cpufreq_policy) for policy reference
  ACPI: processor: thermal: Use __free(put_cpufreq_policy) for policy
    reference
  cpufreq: brcmstb-avs-cpufreq: Use __free(put_cpufreq_policy) for
    policy reference
  cpufreq: CPPC: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: intel_pstate: Use __free(put_cpufreq_policy) for policy
    reference
  cpufreq: longhaul: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: mediatek: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: powernv: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: s5pv210: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: tegra186: Use __free(put_cpufreq_policy) for policy reference
  PM / devfreq: Use __free(put_cpufreq_policy) for policy reference
  drm/i915: Use __free(put_cpufreq_policy) for policy reference
  cpufreq: powerpc: macintosh: Use __free(put_cpufreq_policy) for policy
    reference
  powercap: dtpm_cpu: Use __free(put_cpufreq_policy) for policy
    reference
  thermal: imx: Use __free(put_cpufreq_policy) for policy reference
  thermal/drivers/ti-soc-thermal:  Use __free(put_cpufreq_policy) for
    policy reference
  PM: EM: Use __free(put_cpufreq_policy) for policy reference

 arch/arm64/kernel/topology.c                  |  9 +++----
 arch/x86/kvm/x86.c                            | 10 ++++----
 drivers/acpi/processor_thermal.c              | 12 +++-------
 drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
 drivers/cpufreq/cppc_cpufreq.c                |  4 +---
 drivers/cpufreq/intel_pstate.c                |  3 +--
 drivers/cpufreq/longhaul.c                    |  3 +--
 drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
 drivers/cpufreq/powernv-cpufreq.c             |  7 +++---
 drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
 drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
 drivers/devfreq/governor_passive.c            | 19 ++++-----------
 drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
 drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
 drivers/powercap/dtpm_cpu.c                   | 24 ++++++-------------
 drivers/thermal/imx_thermal.c                 | 13 ++++------
 .../ti-soc-thermal/ti-thermal-common.c        | 12 ++++------
 kernel/power/energy_model.c                   |  7 ++----
 18 files changed, 46 insertions(+), 100 deletions(-)

--=20
2.25.1


