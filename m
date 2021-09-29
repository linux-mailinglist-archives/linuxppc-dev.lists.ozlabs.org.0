Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30C41BD8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 05:37:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK2B75Yhfz303x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 13:37:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=nixiaoming@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK29h52pkz2xY5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 13:36:56 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HK2825ppyz1DHQ6;
 Wed, 29 Sep 2021 11:35:30 +0800 (CST)
Received: from dggema774-chm.china.huawei.com (10.1.198.216) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 11:36:49 +0800
Received: from use12-sp2.huawei.com (10.67.189.174) by
 dggema774-chm.china.huawei.com (10.1.198.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 29 Sep 2021 11:36:48 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <oss@buserror.net>, <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <paul.gortmaker@windriver.com>,
 <chenhui.zhao@freescale.com>, <Yuantian.Tang@feescale.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH v2 0/2] powerpc:85xx: fix timebase sync issue when
 CONFIG_HOTPLUG_CPU=n
Date: Wed, 29 Sep 2021 11:36:44 +0800
Message-ID: <20210929033646.39630-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <021a5ee3-25ef-1de4-0111-d4c3281e0f45@huawei.com>
References: <021a5ee3-25ef-1de4-0111-d4c3281e0f45@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.189.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema774-chm.china.huawei.com (10.1.198.216)
X-CFilter-Loop: Reflected
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: liuwenliang@huawei.com, wangle6@huawei.com, nixiaoming@huawei.com,
 chenjianguo3@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_SMP=y, timebase synchronization is required for mpc8572 when
 the second kernel is started
	arch/powerpc/kernel/smp.c:
	int __cpu_up(unsigned int cpu, struct task_struct *tidle)
	{
		...
		if (smp_ops->give_timebase)
			smp_ops->give_timebase();
		...
	}

	void start_secondary(void *unused)
	{
		...
		if (smp_ops->take_timebase)
			smp_ops->take_timebase();
		...
	}

When CONFIG_HOTPLUG_CPU=n and CONFIG_KEXEC_CORE=n,
 smp_85xx_ops.give_timebase is NULL,
 smp_85xx_ops.take_timebase is NULL,
As a result, the timebase is not synchronized.

test code:
	for i in $(seq 1 3); do taskset 1 date; taskset 2 date; sleep 1; echo;done
log:
	Sat Sep 25 18:50:00 CST 2021
	Sat Sep 25 19:07:47 CST 2021

	Sat Sep 25 18:50:01 CST 2021
	Sat Sep 25 19:07:48 CST 2021

	Sat Sep 25 18:50:02 CST 2021
	Sat Sep 25 19:07:49 CST 2021

Code snippet about give_timebase and take_timebase assignments:
	arch/powerpc/platforms/85xx/smp.c:
	#ifdef CONFIG_HOTPLUG_CPU
	#ifdef CONFIG_FSL_CORENET_RCPM
		fsl_rcpm_init();
	#endif
	#ifdef CONFIG_FSL_PMC
		mpc85xx_setup_pmc();
	#endif
		if (qoriq_pm_ops) {
			smp_85xx_ops.give_timebase = mpc85xx_give_timebase;
			smp_85xx_ops.take_timebase = mpc85xx_take_timebase;

config dependency:
	FSL_CORENET_RCPM depends on the PPC_E500MC.
	FSL_PMC depends on SUSPEND.
	SUSPEND depends on ARCH_SUSPEND_POSSIBLE.
	ARCH_SUSPEND_POSSIBLE depends on !PPC_E500MC.

CONFIG_HOTPLUG_CPU and CONFIG_FSL_PMC require the timebase function, but
the timebase should not depend on CONFIG_HOTPLUG_CPU and CONFIG_FSL_PMC.
Therefore, adjust the macro control range. Ensure that the corresponding
 timebase hook function is not empty when the dtsi node is configured.

-----
changes in v2:
 1. add new patch: "powerpc:85xx:Fix oops when mpc85xx_smp_guts_ids node
  cannot be found"
 2. Using !CONFIG_FSL_CORENET_RCPM to manage the timebase code of !PPC_E500MC

v1:
 https://lore.kernel.org/lkml/20210926025144.55674-1-nixiaoming@huawei.com
------

Xiaoming Ni (2):
  powerpc:85xx:Fix oops when mpc85xx_smp_guts_ids node cannot be found
  powerpc:85xx: fix timebase sync issue when CONFIG_HOTPLUG_CPU=n

 arch/powerpc/platforms/85xx/Makefile         |  4 +++-
 arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c |  7 +++++--
 arch/powerpc/platforms/85xx/smp.c            | 12 ++++++------
 3 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.27.0

