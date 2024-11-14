Return-Path: <linuxppc-dev+bounces-3211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B579C8C96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:12:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2DD7254z3089;
	Fri, 15 Nov 2024 01:12:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731593564;
	cv=none; b=n0HvRPlwPuHqhDp1MgzG3fPvgEL57ilMgXtlrltPHh1ZJGJ7mbXR/MG9YKwvKAgSbkCVqwFMvxBevPQfbFehQsSyPaaiMgN28IGTeFK9jXsirooSINhuQ1zFesfiW8oNxs9qdZe6YOZFTRZIVVJb0Ja3i1wHAhRk5NWeExNSP/OPltcjZqX3Zd8S61twO1Z9FV6ED7NVFhD5XaEfyajh3oF014FcVcvi7yrfVIimXR7PorL7To9hQQNCihUjGPXrZ493yO6Cu8JGnQkSfgRlWa5X7wsOowv9JSjn1KtITXJfZLmLQ0SRZg6TerON8gNlsVdqnHgxcaPPStavtTrSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731593564; c=relaxed/relaxed;
	bh=+kOAwVJwxk8sa0mMFYERZpQ3PjTXPeH0K4Vxesiog5I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jvhGxPfeqoNPHubmd63ZGuGRS4zhu+QMiAsQfs86mlRUOEarAANiirofiYHFLbOcqD846StQkZPdPEEZ1fLXdeMcJNOsdt3jpx/h3VjKj01nlBC51HZ2xbThUs9roQZwr55exYhQIqWjtMnXc1eidcHvUk4tjMajGWdECw7AENOkSCS+YRtnwisMAqvVRa6Me5B1zVgwQXFS1HYP0Zhxpay02vYvHqKxyXbFuAc1lh4pL+1zhlyS0fMrB9fsli/Ov9sJJshubWOhLOSKX5JpYbhngsvg2J3IgwN3ca1m5wFc1lOs6p+KP9lxs4grGUWQYEWXj1Kf8t0Xy92ZmgXPXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2DC2fKNz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:12:43 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xq29H0Jkrz10V9V;
	Thu, 14 Nov 2024 22:10:11 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A3B41800F2;
	Thu, 14 Nov 2024 22:12:06 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 14 Nov 2024 22:12:05 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: [PATCH v9 0/4] Support SMT control on arm64
Date: Thu, 14 Nov 2024 22:11:23 +0800
Message-ID: <20241114141127.23232-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yicong Yang <yangyicong@hisilicon.com>

The core CPU control framework supports runtime SMT control which
is not yet supported on arm64. Besides the general vulnerabilities
concerns we want this runtime control on our arm64 server for:

- better single CPU performance in some cases
- saving overall power consumption

This patchset implements it in the following aspects:

- Provides a default topology_is_primary_thread()
- support retrieve SMT thread number on OF based system
- support retrieve SMT thread number on ACPI based system
- select HOTPLUG_SMT for arm64

Tests has been done on our real ACPI based arm64 server and on
ACPI/OF based QEMU VMs.

Change since v8:
- Fix WARN on ACPI based non-SMT platform noticed in v7, per Pierre.
Link: https://lore.kernel.org/all/20241105093237.63565-1-yangyicong@huawei.com/

Change since v7:
Address the comments from Thomas:
- Add a newline between the glue define and function of topology_is_primary_thread
- Explicitly mention the sibling mask won't be empty in the comment
Link: https://lore.kernel.org/lkml/20241030125415.18994-1-yangyicong@huawei.com/

Change since v6:
- Fix unused variable if !CONFIG_ARM64 || !CONFIG_RISV found by lkp-test
- Fix max_smt_thread_num updating in OF path pointed by Pierre
- Drop unused variable and refine the comments/commit per Pierre
Link: https://lore.kernel.org/linux-arm-kernel/20241015021841.35713-1-yangyicong@huawei.com/

Change since v5:
- Drop the dependency on CONFIG_SMP since it's always on on arm64, per Pierre
- Avoid potential multiple calls of cpu_smt_set_num_threads() on asymmetric system, per Dietmar
- Detect heterogenous SMT topology and issue a warning for partly support, per Pierre
- Thanks Dietmar for testing, didn't pickup the tag due to code changes. Thanks testing by Pierre
Link: https://lore.kernel.org/linux-arm-kernel/20240806085320.63514-1-yangyicong@huawei.com/

Change since v4:
- Provide a default topology_is_primary_thread() in the framework, Per Will
Link: https://lore.kernel.org/linux-arm-kernel/20231121092602.47792-1-yangyicong@huawei.com/

Change since v3:
- Fix some build and kconfig error reported by kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-arm-kernel/20231114040110.54590-1-yangyicong@huawei.com/

Change since v2:
- Detect SMT thread number at topology build from ACPI/DT, avoid looping CPUs
- Split patches into ACPI/OF/arch_topology path and enable the kconfig for arm64
Link: https://lore.kernel.org/linux-arm-kernel/20231010115335.13862-1-yangyicong@huawei.com/

Yicong Yang (4):
  cpu/SMT: Provide a default topology_is_primary_thread()
  arch_topology: Support SMT control for OF based system
  arm64: topology: Support SMT control on ACPI based system
  arm64: Kconfig: Enable HOTPLUG_SMT

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/kernel/topology.c        | 59 +++++++++++++++++++++++++++++
 arch/powerpc/include/asm/topology.h |  1 +
 arch/x86/include/asm/topology.h     |  2 +-
 drivers/base/arch_topology.c        | 24 ++++++++++++
 include/linux/topology.h            | 20 ++++++++++
 6 files changed, 106 insertions(+), 1 deletion(-)

-- 
2.24.0


