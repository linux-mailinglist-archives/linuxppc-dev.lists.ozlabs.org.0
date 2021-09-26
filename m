Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F41CA4185D9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 05:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HH9nw6qvlz3bjJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 13:13:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=nixiaoming@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1235 seconds by postgrey-1.36 at boromir;
 Sun, 26 Sep 2021 13:13:02 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HH9nV1DMcz2yKF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 13:12:59 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HH9D46bG2zbmkb;
 Sun, 26 Sep 2021 10:47:32 +0800 (CST)
Received: from dggema774-chm.china.huawei.com (10.1.198.216) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 10:51:47 +0800
Received: from use12-sp2.huawei.com (10.67.189.174) by
 dggema774-chm.china.huawei.com (10.1.198.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Sun, 26 Sep 2021 10:51:46 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <linux-kernel@vger.kernel.org>, <oss@buserror.net>, <mpe@ellerman.id.au>, 
 <benh@kernel.crashing.org>, <paulus@samba.org>,
 <paul.gortmaker@windriver.com>, <Yuantian.Tang@feescale.com>,
 <chenhui.zhao@freescale.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc:85xx: fix timebase sync issue when
 CONFIG_HOTPLUG_CPU=n
Date: Sun, 26 Sep 2021 10:51:44 +0800
Message-ID: <20210926025144.55674-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.189.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
Cc: wangle6@huawei.com, nixiaoming@huawei.com, wangxiongfeng2@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_SMP=y, timebase synchronization is required when the second
 kernel is started.
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

Timebase  synchronization does not depend on CONFIG_HOTPLUG_CPU.

Fixes: 56f1ba280719 ("powerpc/mpc85xx: refactor the PM operations")
Cc: stable@vger.kernel.org #v4.6
Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 arch/powerpc/platforms/85xx/Makefile         | 2 +-
 arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c | 4 ++++
 arch/powerpc/platforms/85xx/smp.c            | 9 ++++-----
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index 60e4e97a929d..71ce1f6b6966 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the PowerPC 85xx linux kernel.
 #
 obj-$(CONFIG_SMP) += smp.o
-obj-$(CONFIG_FSL_PMC)		  += mpc85xx_pm_ops.o
+obj-$(CONFIG_SMP) += mpc85xx_pm_ops.o
 
 obj-y += common.o
 
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c b/arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c
index 7c0133f558d0..a5656b3e9701 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c
@@ -17,6 +17,7 @@
 
 static struct ccsr_guts __iomem *guts;
 
+#ifdef CONFIG_FSL_PMC
 static void mpc85xx_irq_mask(int cpu)
 {
 
@@ -49,6 +50,7 @@ static void mpc85xx_cpu_up_prepare(int cpu)
 {
 
 }
+#endif
 
 static void mpc85xx_freeze_time_base(bool freeze)
 {
@@ -76,10 +78,12 @@ static const struct of_device_id mpc85xx_smp_guts_ids[] = {
 
 static const struct fsl_pm_ops mpc85xx_pm_ops = {
 	.freeze_time_base = mpc85xx_freeze_time_base,
+#ifdef CONFIG_FSL_PMC
 	.irq_mask = mpc85xx_irq_mask,
 	.irq_unmask = mpc85xx_irq_unmask,
 	.cpu_die = mpc85xx_cpu_die,
 	.cpu_up_prepare = mpc85xx_cpu_up_prepare,
+#endif
 };
 
 int __init mpc85xx_setup_pmc(void)
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index c6df294054fe..349298cd9671 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -40,7 +40,6 @@ struct epapr_spin_table {
 	u32	pir;
 };
 
-#ifdef CONFIG_HOTPLUG_CPU
 static u64 timebase;
 static int tb_req;
 static int tb_valid;
@@ -112,6 +111,7 @@ static void mpc85xx_take_timebase(void)
 	local_irq_restore(flags);
 }
 
+#ifdef CONFIG_HOTPLUG_CPU
 static void smp_85xx_cpu_offline_self(void)
 {
 	unsigned int cpu = smp_processor_id();
@@ -499,17 +499,16 @@ void __init mpc85xx_smp_init(void)
 #ifdef CONFIG_FSL_CORENET_RCPM
 	fsl_rcpm_init();
 #endif
-
-#ifdef CONFIG_FSL_PMC
-	mpc85xx_setup_pmc();
 #endif
+	mpc85xx_setup_pmc();
 	if (qoriq_pm_ops) {
 		smp_85xx_ops.give_timebase = mpc85xx_give_timebase;
 		smp_85xx_ops.take_timebase = mpc85xx_take_timebase;
+#ifdef CONFIG_HOTPLUG_CPU
 		smp_85xx_ops.cpu_offline_self = smp_85xx_cpu_offline_self;
 		smp_85xx_ops.cpu_die = qoriq_cpu_kill;
-	}
 #endif
+	}
 	smp_ops = &smp_85xx_ops;
 
 #ifdef CONFIG_KEXEC_CORE
-- 
2.27.0

