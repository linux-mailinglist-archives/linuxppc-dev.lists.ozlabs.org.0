Return-Path: <linuxppc-dev+bounces-6880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E501A5BA34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 08:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBmDs27KLz3bmc;
	Tue, 11 Mar 2025 18:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741679517;
	cv=none; b=lDx9+5ndQGW7c3h8lE0ZJp6y13WRUf2m7jn/oJ8yU88ZRf+mQgj9ss1Ytx9I/HkQfnD9gVRrx8SeNfrUYetHwyhbVB+d5nWnjUi9a2m72owGKijZSRvPFiRIcH+g/QiFmjdLtQegVtxi0VkOyDBDBnDnjMusf/5hCXIfz3x7Vc9xcTqFFJOBrG4SScbLRpBBXLt/DCrV23phr1BHlPneeLpeOowfPATGibcvEYhaafig16gKEd4XGcb7bRxdTe8A7sCslRTOnpGyLJyC5m28waGbMtUBZjB0MMwrXqf43cc8nagPq4HB+/SzpTPaRZHNU6K2OKuGgZLU0M1P7Wnosg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741679517; c=relaxed/relaxed;
	bh=CizGOx+KeIkQbQ+xODzrMwfptRNdjTVshSRgHNm94vg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P9DvsR+1zPXRwyPm+Kld6p35t3RKVq6dxL0MnEt7L9WExmPrNFso1BtYqrYuLUuYnsVHLIazaNNy21bEgF9vBZdzF9j8dnn4KJxtUzgCreDvHT1oceu/5kcKx742IysiAD4o0dIxMZj9BWt57GUnFErkb5+g9i239FGbqG+e6vXqaBHzU5rzkCFNt5DGJIb6u1RXc6wxdxqtJeuZ3t2fk2LFZXcI1xSudm6TMBwznQ9mo7hZGlcA59pF143XF8BUbsEvEuxSuDp3jHkb4bmxOrJ+n3wwR+9hBdhlBJFKafgrXStulxOEw9dDlWfkKpNq8tE5c3R9anNEIZctcvUFBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBmDp2tV3z3bmf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 18:51:52 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZBm9002pTz2CcGk;
	Tue, 11 Mar 2025 15:48:36 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CE511402CD;
	Tue, 11 Mar 2025 15:51:46 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 11 Mar 2025 15:51:45 +0800
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
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: [PATCH v12 0/4] Support SMT control on arm64
Date: Tue, 11 Mar 2025 15:51:39 +0800
Message-ID: <20250311075143.61078-1-yangyicong@huawei.com>
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

Tests has been done on our ACPI based arm64 server and on ACPI/OF
based QEMU VMs.

Change since v11:
- Remove the check and warning for heterogeneous platform as suggested and discussed
- refine comments/commit according to Dietmar
Link: https://lore.kernel.org/linux-arm-kernel/20250218141018.18082-1-yangyicong@huawei.com/

Change since v10:
- handle topology parsing failure case on DT based system
- address some style comments per Jonathan and add tags, Thanks
Link: https://lore.kernel.org/linux-arm-kernel/20241220075313.51502-1-yangyicong@huawei.com/

Change since v9:
- Refine the comment of topology_is_primary_thread(). Tested with LoongArch
  to prove it also works on architecture's not using CONFIG_GENERIC_ARCH_TOPOLOGY
- always call cpu_smt_set_num_threads() to make the smt/control shows correct
  status on non-SMT system
Link: https://lore.kernel.org/linux-arm-kernel/20241114141127.23232-1-yangyicong@huawei.com/

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
- Drop the dependency on CONFIG_SMP since it's always on arm64, per Pierre
- Avoid potential multiple calls of cpu_smt_set_num_threads() on asymmetric system, per Dietmar
- Detect heterogeneous SMT topology and issue a warning for partly support, per Pierre
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
 arch/arm64/kernel/topology.c        | 54 +++++++++++++++++++++++++++++
 arch/powerpc/include/asm/topology.h |  1 +
 arch/x86/include/asm/topology.h     |  2 +-
 drivers/base/arch_topology.c        | 18 ++++++++++
 include/linux/topology.h            | 24 +++++++++++++
 6 files changed, 99 insertions(+), 1 deletion(-)

-- 
2.24.0


