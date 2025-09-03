Return-Path: <linuxppc-dev+bounces-11663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B1B420E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 15:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH39D555fz2yw7;
	Wed,  3 Sep 2025 23:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756905552;
	cv=none; b=gMfsg0uIY7BiFSg5ut0jE/nT5G6UTqfv2E2bcDcghJeQcw7+Taj6m751qCTcpBfSRo7UbkZtT+ySM32i9A9zp2veWTupv48KlnAz2j1MqrGEA03PYqQGSA9f+YWwcgOU8cIBE3aOXQ50CwXcntQfVH0/YAXn6l5bCUiyTBnMVPkHYnGzdg5uMTdv0//OZup4oN25XE8RvBVVqYd/wbcPis2sadKHl9GAlSqU5UpFoB8OzR6i3m+a+zV1oz8PWKP2uznzkRqX7uKLB8FHDcQa+l4O2ykG20GF9eEowqX1QcPD2+dVX1BL5mBnOEEHS1vFR958OE5h3WnQQvdFDrdjYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756905552; c=relaxed/relaxed;
	bh=TxPNmVy7a9D1x/9mzPwHQ/ox2v5u9+IiO3TQ4kcH9to=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YMXnzvQZlggq72DRsZMMOT3NzhVZ7ot5QBqBiV8MMKRckEWQ6mBgWcTbc1vK5mgd6BtmZ2GNaxtipX+gpqFydyEJerhGP8HyXr3qT9xNZyVUwcQD5vzfi5BSvsnVcS7BmbBzgYqMgVdrEJ/AJ0Oa1jy3Cgt3di1DbOYOUvq7/twZ56+UGOWiXxJEybgWQOowntiL3NBI0JGL5IKc7N0N72H2/dKvgQ11nMbAxI2SH+sniWNDU8rmPeFxFP2fsO0zVcdOCwLaFAojp+6H3Z6u2/tC0hliWrlinlkHWXh/8Gwui5xnC8IAg/st5DITr8hWlzcSOPiSwPdYiID8HGTWvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH39B6qHvz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 23:19:09 +1000 (AEST)
X-UUID: 6680d70888c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d056df0d-9490-46b5-b02b-45f4d6409240,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b3d8cc48d38f17ba8c0258a26b8c30c8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6680d70888c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 431355095; Wed, 03 Sep 2025 21:17:54 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id DD192E008FA4;
	Wed,  3 Sep 2025 21:17:53 +0800 (CST)
X-ns-mid: postfix-68B84000-2111002
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 86984E008FA2;
	Wed,  3 Sep 2025 21:17:43 +0800 (CST)
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
Subject: [PATCH v4 00/10] cpufreq: use __free() for all cpufreq_cpu_get() references
Date: Wed,  3 Sep 2025 21:17:23 +0800
Message-Id: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
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

The changes are split into 12 patches as they touch different subsystems
and are maintained by different people. There is no functional change.

V4:
 - Fix compile error in topology.c
 - drop 2 patches
 - Move code into a function in processor_thermal.c
 - Move code into a function in intel_pstate.c
 - Move policy declare in dtpm_cpu.c
 - Fix compile error in imx_thermal.c
 - Fix compile error in ti-thermal-common.c
 - Fix compile error in energy_model.c

V3:
 - drop patch 'KVM: x86: Use __free(put_cpufreq_policy) for policy refere=
nce'
 - removed 5 patches which has been applied
 - Consolidate CPUFreq policy assignments and allocations into one line,
   suggested by Ben Horgan
 - Change cpu_has_cpufreq() return type to bool, following Rafael's sugge=
stion
 - Change the title to 'Use scope-based cleanup helper'

V2:
 - Fix compile error in powernv-cpufreq.c
 - Split patch to separate logical changes

Zihuan Zhang (10):
  arm64: topology: Use scope-based cleanup helper
  ACPI: processor: thermal: Use scope-based cleanup helper
  cpufreq: intel_pstate: Use scope-based cleanup helper
  cpufreq: powernv: Use scope-based cleanup helper
  PM / devfreq: Use scope-based cleanup helper
  drm/i915: Use scope-based cleanup helper
  powercap: dtpm_cpu: Use scope-based cleanup helper
  thermal: imx: Use scope-based cleanup helper
  thermal/drivers/ti-soc-thermal: Use scope-based cleanup helper
  PM: EM: Use scope-based cleanup helper

 arch/arm64/kernel/topology.c                  |  9 ++---
 drivers/acpi/processor_thermal.c              | 37 +++++++++++--------
 drivers/cpufreq/intel_pstate.c                | 19 ++++++----
 drivers/cpufreq/powernv-cpufreq.c             | 11 +++---
 drivers/devfreq/governor_passive.c            | 25 +++++-------
 drivers/gpu/drm/i915/gt/intel_llc.c           |  4 +-
 drivers/powercap/dtpm_cpu.c                   | 30 ++++++---------
 drivers/thermal/imx_thermal.c                 | 14 +++----
 .../ti-soc-thermal/ti-thermal-common.c        | 13 ++-----
 kernel/power/energy_model.c                   |  7 +---
 10 files changed, 73 insertions(+), 96 deletions(-)

--=20
2.25.1


