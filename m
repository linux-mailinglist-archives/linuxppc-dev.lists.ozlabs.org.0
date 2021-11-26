Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C43F45E6C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 05:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0hCy6RcGz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 15:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=nixiaoming@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0hCV4kH3z2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 15:12:02 +1100 (AEDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J0h9725V5z8vbq;
 Fri, 26 Nov 2021 12:10:03 +0800 (CST)
Received: from dggema774-chm.china.huawei.com (10.1.198.216) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Fri, 26 Nov 2021 12:11:56 +0800
Received: from use12-sp2.huawei.com (10.67.189.174) by
 dggema774-chm.china.huawei.com (10.1.198.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Fri, 26 Nov 2021 12:11:55 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <hurricos@gmail.com>, <Yuantian.Tang@feescale.com>,
 <benh@kernel.crashing.org>, <chenhui.zhao@freescale.com>,
 <chenjianguo3@huawei.com>, <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <liuwenliang@huawei.com>, <mpe@ellerman.id.au>, <oss@buserror.net>,
 <paul.gortmaker@windriver.com>, <paulus@samba.org>, <stable@vger.kernel.org>, 
 <wangle6@huawei.com>, <chunkeey@gmail.com>
Subject: [PATCH] powerpc/85xx: fix oops when CONFIG_FSL_PMC=n
Date: Fri, 26 Nov 2021 12:11:53 +0800
Message-ID: <20211126041153.16926-1-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <5f56f1af-9404-21fa-eda0-05a75d769427@huawei.com>
References: <5f56f1af-9404-21fa-eda0-05a75d769427@huawei.com>
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
Cc: nixiaoming@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_FSL_PMC is set to n, no value is assigned to cpu_up_prepare
 in the mpc85xx_pm_ops structure. As a result, oops is triggered in
 smp_85xx_start_cpu().

	[    0.627233] smp: Bringing up secondary CPUs ...
	[    0.681659] kernel tried to execute user page (0) - exploit attempt? (uid: 0)
	[    0.766618] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
	[    0.848899] Faulting instruction address: 0x00000000
	[    0.908273] Oops: Kernel access of bad area, sig: 11 [#1]
	...
	[    1.758220] NIP [00000000] 0x0
	[    1.794688] LR [c0021d2c] smp_85xx_kick_cpu+0xe8/0x568
	[    1.856126] Call Trace:
	[    1.885295] [c1051da8] [c0021cb8] smp_85xx_kick_cpu+0x74/0x568 (unreliable)
	[    1.968633] [c1051de8] [c0011460] __cpu_up+0xc0/0x228
	[    2.029038] [c1051e18] [c0031bbc] bringup_cpu+0x30/0x224
	[    2.092572] [c1051e48] [c0031f3c] cpu_up.constprop.0+0x180/0x33c
	[    2.164443] [c1051e88] [c00322e8] bringup_nonboot_cpus+0x88/0xc8
	[    2.236326] [c1051eb8] [c07e67bc] smp_init+0x30/0x78
	[    2.295698] [c1051ed8] [c07d9e28] kernel_init_freeable+0x118/0x2a8
	[    2.369641] [c1051f18] [c00032d8] kernel_init+0x14/0x124
	[    2.433176] [c1051f38] [c0010278] ret_from_kernel_thread+0x14/0x1c

Fixes: c45361abb9185b ("powerpc/85xx: fix timebase sync issue when
 CONFIG_HOTPLUG_CPU=n")
Link: https://lore.kernel.org/lkml/CANA18Uyba4kMJQrbCSZVTFep2Exe5izE45whNJgwwUvNSEcNLg@mail.gmail.com/
Reported-by: Martin Kennedy <hurricos@gmail.com>
Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Tested-by: Martin Kennedy <hurricos@gmail.com>
Cc: stable@vger.kernel.org
---
 arch/powerpc/platforms/85xx/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 83f4a6389a28..d7081e9af65c 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -220,7 +220,7 @@ static int smp_85xx_start_cpu(int cpu)
 	local_irq_save(flags);
 	hard_irq_disable();
 
-	if (qoriq_pm_ops)
+	if (qoriq_pm_ops && qoriq_pm_ops->cpu_up_prepare)
 		qoriq_pm_ops->cpu_up_prepare(cpu);
 
 	/* if cpu is not spinning, reset it */
@@ -292,7 +292,7 @@ static int smp_85xx_kick_cpu(int nr)
 		booting_thread_hwid = cpu_thread_in_core(nr);
 		primary = cpu_first_thread_sibling(nr);
 
-		if (qoriq_pm_ops)
+		if (qoriq_pm_ops && qoriq_pm_ops->cpu_up_prepare)
 			qoriq_pm_ops->cpu_up_prepare(nr);
 
 		/*
-- 
2.27.0

