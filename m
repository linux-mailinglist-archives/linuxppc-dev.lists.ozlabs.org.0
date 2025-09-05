Return-Path: <linuxppc-dev+bounces-11790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A949DB458CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 15:25:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJHCp1stwz3cYm;
	Fri,  5 Sep 2025 23:25:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757078742;
	cv=none; b=YFN8m3J3aiyTwdBkGW/qXhIuugDDxbdl0wWZjooZCQ0ZMgetN/fFPpS/7No9lizdmxKfRAZPdroiv47IQOX4wkbpxD7Lp86E7nXwNsk4hLfpJlzRyKPe9HddIz2OwntATchJOx2DrRgG4MSrikGJXRxvbecm/FhXQ3iQ6qKoeWsY8oR7Ks09C2Q+8jzAuY4nCu2yP1EhirCVPb2VZySbshk36+oSkZ6c+wyFUY6GQtmt4LLvwGoTeeb/H5WR2NbK8DqiN+Ao3HhZsZEsvliJvS9kSBBWKdwOKY8YUURJw7654F0vBuHRobKd0seM5Oss8Iuqww7vzjpvAOTqiRSrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757078742; c=relaxed/relaxed;
	bh=sOOBOLABiVeetHg1IaXy93onibwf4Ik+/G+mNfqHVJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bd/FmKMvMVWW2CYgn6plxLXJfy0v6vFkzGHUHJPlj0kx4AQ7veNDFzO10CIkUFV9jkY1HF9Zpl+bnJH/fu6lsUtV5+40237z+B+es6sFXHEjm5OaqCiS/MYW0vtqbDTznG2mHeNACsGv/E2H33+kRL/CGUQATFGOgYEy83qC33XRCl9LM9xkCPSkkWpLKUk9Gmx+yAgdok3sB8t5kfK8J3xz6I8JkcOjN27mjog2hl5Q8J2O4XbnoyIJcoI0w/tvbYM/j54z4tGx0D4LOYo6nwpM6JocB7jbFY/E5E3sbPzd59IqMmpyI7Dj18BOfsENcJPs6+zjScCBIIo83Dqbog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=zhangzihuan@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJHCm4B0pz3bn1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 23:25:39 +1000 (AEST)
X-UUID: a6e6a2d48a5b11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8422d8b4-b443-4d71-a0b2-cf6de6c4675e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:eb53ebb2a39f7b4fc4886caf3fac51b3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a6e6a2d48a5b11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 560139086; Fri, 05 Sep 2025 21:24:29 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 20FEEE008FA7;
	Fri,  5 Sep 2025 21:24:29 +0800 (CST)
X-ns-mid: postfix-68BAE48C-8949761
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 3F132E008FA3;
	Fri,  5 Sep 2025 21:24:17 +0800 (CST)
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
Subject: [PATCH v5 0/6] cpufreq: use __free() for all cpufreq_cpu_get() references
Date: Fri,  5 Sep 2025 21:24:07 +0800
Message-Id: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
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

The changes are split into 6 patches as they touch different subsystems
and are maintained by different people. There is no functional change.

V5:
 - drop 4 patches
 - change return value int topology.c suggested by Jonathan Cameron
 - fix code in processor_thermal.c suggested by Rafael and Jonathan Camer=
on
 - fix code in intel_pstate.c suggested by Rafael
 - fix code in governor_passive.c suggested Jonathan Cameron
 - fix code in energy_model.c suggested by Rafael and Krzysztof Kozlowski

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

Zihuan Zhang (6):
  arm64: topology: Use scope-based cleanup helper
  ACPI: processor: thermal: Use scope-based cleanup helper
  cpufreq: intel_pstate: Use scope-based cleanup helper
  PM / devfreq: Use scope-based cleanup helper
  drm/i915: Use scope-based cleanup helper
  PM: EM: Use scope-based cleanup helper

 arch/arm64/kernel/topology.c        | 11 ++----
 drivers/acpi/processor_thermal.c    | 52 +++++++++++++------------
 drivers/cpufreq/intel_pstate.c      | 59 +++++++++++++++-------------
 drivers/devfreq/governor_passive.c  | 60 +++++++++++------------------
 drivers/gpu/drm/i915/gt/intel_llc.c |  4 +-
 kernel/power/energy_model.c         |  9 +----
 6 files changed, 89 insertions(+), 106 deletions(-)

--=20
2.25.1


