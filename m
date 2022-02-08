Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0074ADE03
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 17:12:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtShF0mftz3cBW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 03:12:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XJsN8uqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=2a01:111:f400:7eb2::62a;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=carlos.bilbao@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XJsN8uqG; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtSgS17v2z301M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 03:11:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HK4nSxEJkLVP169cNdouKR3BkV4Tni9B4KIoBIsIlqi60c3HOBxlV7jnk+iuFdbQdPMKTTu2IMgeFAj7ULdFds0G0t8A5zZwU5uRkN7GklRO2/DvSDfCXsa1bEklhyEhGu+NQAy5o7Wf/67rorWQHdxWeeY1x7Ij11t4iRO8Mc0zyqisOWVjaZEHhP4KJZ3XBHhx/74kCHf/EqurhbwFOHznUKMsq1R1gRKD0nsaiLXeIsmnkqxnZ4qw8XfDuFIgrSrblFOgd3S3il+XFSUi0ju0GdGmUIl5NshmoWkeaMfOZlnypRMJgsJllbAj2bctiQKQ74q5bJN9ha7syQ8/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyIHaC0VlchAZVx8bhnJr+DK6UY5KA0PmfE8hZpgVEk=;
 b=cWxw+LuSBk125iEp4Kx4iYYYstnw6gd/Hv7TQP/+mWTBes0AcfonMs3HZSniX6prKFWEOwKDk103r30kteTyQ2XVf9YoucZYmh+e8RhjulJ68p41gtngS/jwbPmEqYSXmPtr2NpFg7g++hZ8btT8T3cylCu2TxArXpbeOMMYa03gVD2J40VMQ/nTzih/uia8t619hUZCCDgTzBR/IA5MF1CmatqVQao/VE10QmO7EKI3tgusgy0TSq+/pqA9iFv90u+WuNVj81O6Ne9v1ZNF/9eIH2Bx1nLdejcC5TY1rYW6ZqVtBWHvdPG9j8XuR+8llb1Td+RqjpwL65aHGWcVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyIHaC0VlchAZVx8bhnJr+DK6UY5KA0PmfE8hZpgVEk=;
 b=XJsN8uqGMORPtlFnsvURs/AjSGmQcTs35k94VcmIshqStwywYaIy1CUZ4HYyFBrW/w4StCTL5FMHGSuDSztgK3MtXKXSD6EhoUdfHaElrghRCgO0f+LNL2ehqUyNF+oegpwus/I7SmG4jd2sElCjp0ukPWwDbLpnpzEYhX87nSY=
Received: from BN0PR03CA0035.namprd03.prod.outlook.com (2603:10b6:408:e7::10)
 by SA0PR12MB4543.namprd12.prod.outlook.com (2603:10b6:806:9d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 16:11:06 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::4) by BN0PR03CA0035.outlook.office365.com
 (2603:10b6:408:e7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 16:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 16:11:06 +0000
Received: from ethanolx1ade-milan-b0-babu.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 10:11:04 -0600
From: Carlos Bilbao <carlos.bilbao@amd.com>
To: <john.stultz@linaro.org>, <tglx@linutronix.de>, <sboyd@kernel.org>,
 <alexandre.belloni@bootlin.com>, <gregkh@linuxfoundation.org>
Subject: [PATCH v2] include: linux: Reorganize timekeeping and ktime headers
Date: Tue, 8 Feb 2022 10:10:50 -0600
Message-ID: <20220208161049.865402-1-carlos.bilbao@amd.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a65d58-5eb1-4462-6911-08d9eb1d9c7b
X-MS-TrafficTypeDiagnostic: SA0PR12MB4543:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4543D444304B72FEA2382FEDF82D9@SA0PR12MB4543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgpunOu3C1hAhN4u1ktL1YL5qvtvsTgMsYD3BPCS7+S/vMPi39EDNmo6KK2KLi/3lmMSoSiEGahnIvolQg1vBYqQSn9YR4Uc2MEJQw/ZLyMMwJUzA23qZSWh2j5nx1228NEvLEyEkjU7Ydo3iWMot3jLMjv/9pn/Zj6TCynve/dcKzNR6sRIVZ421Dx/u4tWNtg4ics6MlRi9a1rlCsfN6F609kSlpibmjE6/IeYKFM3DStzauZ+ybps2ztnkqPOojYrf4QJ+ODzzD5NAKx93n3DECDe3TjCJ5MB3kIvzkTsNyR2RtBg3XlFLEyTTuLCuFrXAV8HxPVeNbsXmyCfOwE71Yk1YVGM9OavGvECgmR5o411UvTfFzksogvxZjmOYqtutqHPoLSpTkVLe31/KER4nvBaGljBFwUDNRY6rWNEklTjD1tYZrN2+Qy8c7RcLbmOHAva5a2eLXqs2pKtmELtQPb0M4gB96WptKOI2W9M3RMSvrzfISCyxzh3pTLGLhz70mQmGs8sorI15duHSRR5ULOhWDbZr00S95TbWkeKk7SOteWYvbJxpM8TFJqteomfZPapzm+q80p6K3hjWKy6TlytTIAAY8E8wPbzdRXxv/JmWylOFlz1fqSWwmR7fS/y74xcbRMAIVk3s4ujZ8MOoAxdIjuCEUky2YdZWDeaazArTXcBUbIQpZeSKanj9LA2Ga4qvYznO1SgyblvQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(81166007)(7696005)(508600001)(356005)(1076003)(2906002)(336012)(186003)(26005)(16526019)(110136005)(82310400004)(426003)(2616005)(316002)(54906003)(36756003)(5660300002)(83380400001)(47076005)(30864003)(6666004)(8676002)(86362001)(40460700003)(70206006)(70586007)(4326008)(44832011)(8936002)(36860700001)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 16:11:06.0766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a65d58-5eb1-4462-6911-08d9eb1d9c7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4543
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
Cc: linux-rtc@vger.kernel.org, jgross@suse.com, linux-ia64@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, Carlos Bilbao <carlos.bilbao@amd.com>,
 linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, bilbao@vt.edu,
 boon.leong.ong@intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mhiramat@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The timekeeping subsystem could use some reorganization. Reorganize and
separate the headers by making ktime.h take care of the ktime_get()
family of functions, and reserve timekeeping.h for the actual timekeeping.

This also helps to avoid implicit function errors and strengthens the
header dependencies, since timekeeping.h was using ktime_to_ns(), a static
function defined in a header it does no include, ktime.h.

Include the header timekeeping.h wherever it is necessary for a successful
compilation after the header code reorganization for all archs.

Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reported-by: kernel test robot <lkp@intel.com>
---
Changelog:
v1: Search for 20220126200749.12090-1-carlos.bilbao@amd.com
v2: Updated commit message. Fix warnings in m68k and UML.
---
 arch/arm64/kvm/hypercalls.c    |   1 +
 arch/ia64/kernel/time.c        |   1 +
 arch/m68k/atari/time.c         |   1 +
 arch/m68k/hp300/time.c         |   2 +
 arch/m68k/kernel/time.c        |   1 +
 arch/m68k/mac/via.c            |   1 +
 arch/m68k/mvme16x/config.c     |   1 +
 arch/m68k/sun3/sun3ints.c      |   1 +
 arch/powerpc/kernel/time.c     |   1 +
 arch/um/kernel/time.c          |   1 +
 arch/x86/kernel/rtc.c          |   1 +
 arch/x86/kernel/tsc.c          |   1 +
 drivers/rtc/class.c            |   1 +
 include/linux/ktime.h          | 196 +++++++++++++++++++++++++++++++-
 include/linux/pps_kernel.h     |   1 +
 include/linux/sched_clock.h    |   2 +
 include/linux/stmmac.h         |   1 +
 include/linux/timekeeping.h    | 197 +--------------------------------
 init/main.c                    |   1 +
 kernel/time/ntp.c              |   1 +
 kernel/time/posix-timers.c     |   1 +
 kernel/time/tick-legacy.c      |   1 +
 kernel/time/time.c             |   1 +
 kernel/time/timekeeping.c      |   1 +
 sound/pci/hda/hda_controller.c |   1 +
 25 files changed, 220 insertions(+), 198 deletions(-)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 30da78f72b3b..41499c1d7379 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -3,6 +3,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/kvm_host.h>
+#include <linux/timekeeping.h>
 
 #include <asm/kvm_emulate.h>
 
diff --git a/arch/ia64/kernel/time.c b/arch/ia64/kernel/time.c
index fa9c0ab8c6fc..85e79ff3c98e 100644
--- a/arch/ia64/kernel/time.c
+++ b/arch/ia64/kernel/time.c
@@ -22,6 +22,7 @@
 #include <linux/efi.h>
 #include <linux/timex.h>
 #include <linux/timekeeper_internal.h>
+#include <linux/timekeeping.h>
 #include <linux/platform_device.h>
 #include <linux/sched/cputime.h>
 
diff --git a/arch/m68k/atari/time.c b/arch/m68k/atari/time.c
index 7e44d0e9d0f8..b09d3ff40b36 100644
--- a/arch/m68k/atari/time.c
+++ b/arch/m68k/atari/time.c
@@ -19,6 +19,7 @@
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <linux/export.h>
+#include <linux/timekeeping.h>
 
 #include <asm/atariints.h>
 #include <asm/machdep.h>
diff --git a/arch/m68k/hp300/time.c b/arch/m68k/hp300/time.c
index 1d1b7b3b5dd4..56c575096bcb 100644
--- a/arch/m68k/hp300/time.c
+++ b/arch/m68k/hp300/time.c
@@ -14,6 +14,8 @@
 #include <linux/sched.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
+#include <linux/timekeeping.h>
+
 #include <asm/machdep.h>
 #include <asm/irq.h>
 #include <asm/io.h>
diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index 340ffeea0a9d..a0cc176de430 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -28,6 +28,7 @@
 #include <asm/irq_regs.h>
 
 #include <linux/time.h>
+#include <linux/timekeeping.h>
 #include <linux/timex.h>
 #include <linux/profile.h>
 
diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 3d11d6219cdd..6dd8f85288e4 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -31,6 +31,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/irq.h>
+#include <linux/timekeeping.h>
 
 #include <asm/macintosh.h>
 #include <asm/macints.h>
diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index b4422c2dfbbf..ebe1dc3ebb4c 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -28,6 +28,7 @@
 #include <linux/rtc.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/timekeeping.h>
 
 #include <asm/bootinfo.h>
 #include <asm/bootinfo-vme.h>
diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
index 36cc280a4505..209dccc2aed6 100644
--- a/arch/m68k/sun3/sun3ints.c
+++ b/arch/m68k/sun3/sun3ints.c
@@ -11,6 +11,7 @@
 #include <linux/sched.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
+#include <linux/timekeeping.h>
 #include <asm/intersil.h>
 #include <asm/oplib.h>
 #include <asm/sun3ints.h>
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index cae8f03a44fe..b577a5a06621 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -54,6 +54,7 @@
 #include <linux/of_clk.h>
 #include <linux/suspend.h>
 #include <linux/processor.h>
+#include <linux/timekeeping.h>
 #include <asm/trace.h>
 
 #include <asm/interrupt.h>
diff --git a/arch/um/kernel/time.c b/arch/um/kernel/time.c
index fddd1dec27e6..aa7a6d4d9659 100644
--- a/arch/um/kernel/time.c
+++ b/arch/um/kernel/time.c
@@ -20,6 +20,7 @@
 #include <kern_util.h>
 #include <os.h>
 #include <linux/time-internal.h>
+#include <linux/timekeeping.h>
 #include <linux/um_timetravel.h>
 #include <shared/init.h>
 
diff --git a/arch/x86/kernel/rtc.c b/arch/x86/kernel/rtc.c
index 586f718b8e95..98ea05cc6aeb 100644
--- a/arch/x86/kernel/rtc.c
+++ b/arch/x86/kernel/rtc.c
@@ -9,6 +9,7 @@
 #include <linux/export.h>
 #include <linux/pnp.h>
 #include <linux/of.h>
+#include <linux/timekeeping.h>
 
 #include <asm/vsyscall.h>
 #include <asm/x86_init.h>
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index a698196377be..add4388283c5 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -15,6 +15,7 @@
 #include <linux/timex.h>
 #include <linux/static_key.h>
 #include <linux/static_call.h>
+#include <linux/timekeeping.h>
 
 #include <asm/hpet.h>
 #include <asm/timer.h>
diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 4b460c61f1d8..7e2bce8cf0b1 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -16,6 +16,7 @@
 #include <linux/kdev_t.h>
 #include <linux/idr.h>
 #include <linux/slab.h>
+#include <linux/timekeeping.h>
 #include <linux/workqueue.h>
 
 #include "rtc-core.h"
diff --git a/include/linux/ktime.h b/include/linux/ktime.h
index 73f20deb497d..07971008b795 100644
--- a/include/linux/ktime.h
+++ b/include/linux/ktime.h
@@ -229,6 +229,198 @@ static inline ktime_t ms_to_ktime(u64 ms)
 	return ms * NSEC_PER_MSEC;
 }
 
-# include <linux/timekeeping.h>
+/*
+ * ktime_get() family: read the current time in a multitude of ways,
+ *
+ * The default time reference is CLOCK_MONOTONIC, starting at
+ * boot time but not counting the time spent in suspend.
+ * For other references, use the functions with "real", "clocktai",
+ * "boottime" and "raw" suffixes.
+ *
+ * To get the time in a different format, use the ones wit
+ * "ns", "ts64" and "seconds" suffix.
+ *
+ * See Documentation/core-api/timekeeping.rst for more details.
+ */
 
-#endif
+
+/*
+ * timespec64 based interfaces
+ */
+extern void ktime_get_raw_ts64(struct timespec64 *ts);
+extern void ktime_get_ts64(struct timespec64 *ts);
+extern void ktime_get_real_ts64(struct timespec64 *tv);
+extern void ktime_get_coarse_ts64(struct timespec64 *ts);
+extern void ktime_get_coarse_real_ts64(struct timespec64 *ts);
+
+void getboottime64(struct timespec64 *ts);
+
+/*
+ * time64_t base interfaces
+ */
+extern time64_t ktime_get_seconds(void);
+extern time64_t __ktime_get_real_seconds(void);
+extern time64_t ktime_get_real_seconds(void);
+
+/*
+ * ktime_t based interfaces
+ */
+
+enum tk_offsets {
+	TK_OFFS_REAL,
+	TK_OFFS_BOOT,
+	TK_OFFS_TAI,
+	TK_OFFS_MAX,
+};
+
+extern ktime_t ktime_get(void);
+extern ktime_t ktime_get_with_offset(enum tk_offsets offs);
+extern ktime_t ktime_get_coarse_with_offset(enum tk_offsets offs);
+extern ktime_t ktime_mono_to_any(ktime_t tmono, enum tk_offsets offs);
+extern ktime_t ktime_get_raw(void);
+extern u32 ktime_get_resolution_ns(void);
+
+/**
+ * ktime_get_real - get the real (wall-) time in ktime_t format
+ */
+static inline ktime_t ktime_get_real(void)
+{
+	return ktime_get_with_offset(TK_OFFS_REAL);
+}
+
+static inline ktime_t ktime_get_coarse_real(void)
+{
+	return ktime_get_coarse_with_offset(TK_OFFS_REAL);
+}
+
+/**
+ * ktime_get_boottime - Returns monotonic time since boot in ktime_t format
+ *
+ * This is similar to CLOCK_MONTONIC/ktime_get, but also includes the
+ * time spent in suspend.
+ */
+static inline ktime_t ktime_get_boottime(void)
+{
+	return ktime_get_with_offset(TK_OFFS_BOOT);
+}
+
+static inline ktime_t ktime_get_coarse_boottime(void)
+{
+	return ktime_get_coarse_with_offset(TK_OFFS_BOOT);
+}
+
+/**
+ * ktime_get_clocktai - Returns the TAI time of day in ktime_t format
+ */
+static inline ktime_t ktime_get_clocktai(void)
+{
+	return ktime_get_with_offset(TK_OFFS_TAI);
+}
+
+static inline ktime_t ktime_get_coarse_clocktai(void)
+{
+	return ktime_get_coarse_with_offset(TK_OFFS_TAI);
+}
+
+static inline ktime_t ktime_get_coarse(void)
+{
+	struct timespec64 ts;
+
+	ktime_get_coarse_ts64(&ts);
+	return timespec64_to_ktime(ts);
+}
+
+static inline u64 ktime_get_coarse_ns(void)
+{
+	return ktime_to_ns(ktime_get_coarse());
+}
+
+static inline u64 ktime_get_coarse_real_ns(void)
+{
+	return ktime_to_ns(ktime_get_coarse_real());
+}
+
+static inline u64 ktime_get_coarse_boottime_ns(void)
+{
+	return ktime_to_ns(ktime_get_coarse_boottime());
+}
+
+static inline u64 ktime_get_coarse_clocktai_ns(void)
+{
+	return ktime_to_ns(ktime_get_coarse_clocktai());
+}
+
+/**
+ * ktime_mono_to_real - Convert monotonic time to clock realtime
+ */
+static inline ktime_t ktime_mono_to_real(ktime_t mono)
+{
+	return ktime_mono_to_any(mono, TK_OFFS_REAL);
+}
+
+static inline u64 ktime_get_ns(void)
+{
+	return ktime_to_ns(ktime_get());
+}
+
+static inline u64 ktime_get_real_ns(void)
+{
+	return ktime_to_ns(ktime_get_real());
+}
+
+static inline u64 ktime_get_boottime_ns(void)
+{
+	return ktime_to_ns(ktime_get_boottime());
+}
+
+static inline u64 ktime_get_clocktai_ns(void)
+{
+	return ktime_to_ns(ktime_get_clocktai());
+}
+
+static inline u64 ktime_get_raw_ns(void)
+{
+	return ktime_to_ns(ktime_get_raw());
+}
+
+extern u64 ktime_get_mono_fast_ns(void);
+extern u64 ktime_get_raw_fast_ns(void);
+extern u64 ktime_get_boot_fast_ns(void);
+extern u64 ktime_get_real_fast_ns(void);
+
+/*
+ * timespec64/time64_t interfaces utilizing the ktime based ones
+ * for API completeness, these could be implemented more efficiently
+ * if needed.
+ */
+static inline void ktime_get_boottime_ts64(struct timespec64 *ts)
+{
+	*ts = ktime_to_timespec64(ktime_get_boottime());
+}
+
+static inline void ktime_get_coarse_boottime_ts64(struct timespec64 *ts)
+{
+	*ts = ktime_to_timespec64(ktime_get_coarse_boottime());
+}
+
+static inline time64_t ktime_get_boottime_seconds(void)
+{
+	return ktime_divns(ktime_get_coarse_boottime(), NSEC_PER_SEC);
+}
+
+static inline void ktime_get_clocktai_ts64(struct timespec64 *ts)
+{
+	*ts = ktime_to_timespec64(ktime_get_clocktai());
+}
+
+static inline void ktime_get_coarse_clocktai_ts64(struct timespec64 *ts)
+{
+	*ts = ktime_to_timespec64(ktime_get_coarse_clocktai());
+}
+
+static inline time64_t ktime_get_clocktai_seconds(void)
+{
+	return ktime_divns(ktime_get_coarse_clocktai(), NSEC_PER_SEC);
+}
+
+#endif /* _LINUX_KTIME_H */
diff --git a/include/linux/pps_kernel.h b/include/linux/pps_kernel.h
index 78c8ac4951b5..24970c202ac6 100644
--- a/include/linux/pps_kernel.h
+++ b/include/linux/pps_kernel.h
@@ -12,6 +12,7 @@
 #include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/time.h>
+#include <linux/timekeeping.h>
 
 /*
  * Global defines
diff --git a/include/linux/sched_clock.h b/include/linux/sched_clock.h
index 835ee87ed792..f0fa287710da 100644
--- a/include/linux/sched_clock.h
+++ b/include/linux/sched_clock.h
@@ -5,6 +5,8 @@
 #ifndef LINUX_SCHED_CLOCK
 #define LINUX_SCHED_CLOCK
 
+#include <linux/timekeeping.h>
+
 #ifdef CONFIG_GENERIC_SCHED_CLOCK
 /**
  * struct clock_read_data - data required to read from sched_clock()
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a6f03b36fc4f..bf235ff101d5 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -14,6 +14,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/phy.h>
+#include <linux/timekeeping.h>
 
 #define MTL_MAX_RX_QUEUES	8
 #define MTL_MAX_TX_QUEUES	8
diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index 78a98bdff76d..b1c54f5ff91e 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -19,201 +19,6 @@ extern void legacy_timer_tick(unsigned long ticks);
 extern int do_settimeofday64(const struct timespec64 *ts);
 extern int do_sys_settimeofday64(const struct timespec64 *tv,
 				 const struct timezone *tz);
-
-/*
- * ktime_get() family: read the current time in a multitude of ways,
- *
- * The default time reference is CLOCK_MONOTONIC, starting at
- * boot time but not counting the time spent in suspend.
- * For other references, use the functions with "real", "clocktai",
- * "boottime" and "raw" suffixes.
- *
- * To get the time in a different format, use the ones wit
- * "ns", "ts64" and "seconds" suffix.
- *
- * See Documentation/core-api/timekeeping.rst for more details.
- */
-
-
-/*
- * timespec64 based interfaces
- */
-extern void ktime_get_raw_ts64(struct timespec64 *ts);
-extern void ktime_get_ts64(struct timespec64 *ts);
-extern void ktime_get_real_ts64(struct timespec64 *tv);
-extern void ktime_get_coarse_ts64(struct timespec64 *ts);
-extern void ktime_get_coarse_real_ts64(struct timespec64 *ts);
-
-void getboottime64(struct timespec64 *ts);
-
-/*
- * time64_t base interfaces
- */
-extern time64_t ktime_get_seconds(void);
-extern time64_t __ktime_get_real_seconds(void);
-extern time64_t ktime_get_real_seconds(void);
-
-/*
- * ktime_t based interfaces
- */
-
-enum tk_offsets {
-	TK_OFFS_REAL,
-	TK_OFFS_BOOT,
-	TK_OFFS_TAI,
-	TK_OFFS_MAX,
-};
-
-extern ktime_t ktime_get(void);
-extern ktime_t ktime_get_with_offset(enum tk_offsets offs);
-extern ktime_t ktime_get_coarse_with_offset(enum tk_offsets offs);
-extern ktime_t ktime_mono_to_any(ktime_t tmono, enum tk_offsets offs);
-extern ktime_t ktime_get_raw(void);
-extern u32 ktime_get_resolution_ns(void);
-
-/**
- * ktime_get_real - get the real (wall-) time in ktime_t format
- */
-static inline ktime_t ktime_get_real(void)
-{
-	return ktime_get_with_offset(TK_OFFS_REAL);
-}
-
-static inline ktime_t ktime_get_coarse_real(void)
-{
-	return ktime_get_coarse_with_offset(TK_OFFS_REAL);
-}
-
-/**
- * ktime_get_boottime - Returns monotonic time since boot in ktime_t format
- *
- * This is similar to CLOCK_MONTONIC/ktime_get, but also includes the
- * time spent in suspend.
- */
-static inline ktime_t ktime_get_boottime(void)
-{
-	return ktime_get_with_offset(TK_OFFS_BOOT);
-}
-
-static inline ktime_t ktime_get_coarse_boottime(void)
-{
-	return ktime_get_coarse_with_offset(TK_OFFS_BOOT);
-}
-
-/**
- * ktime_get_clocktai - Returns the TAI time of day in ktime_t format
- */
-static inline ktime_t ktime_get_clocktai(void)
-{
-	return ktime_get_with_offset(TK_OFFS_TAI);
-}
-
-static inline ktime_t ktime_get_coarse_clocktai(void)
-{
-	return ktime_get_coarse_with_offset(TK_OFFS_TAI);
-}
-
-static inline ktime_t ktime_get_coarse(void)
-{
-	struct timespec64 ts;
-
-	ktime_get_coarse_ts64(&ts);
-	return timespec64_to_ktime(ts);
-}
-
-static inline u64 ktime_get_coarse_ns(void)
-{
-	return ktime_to_ns(ktime_get_coarse());
-}
-
-static inline u64 ktime_get_coarse_real_ns(void)
-{
-	return ktime_to_ns(ktime_get_coarse_real());
-}
-
-static inline u64 ktime_get_coarse_boottime_ns(void)
-{
-	return ktime_to_ns(ktime_get_coarse_boottime());
-}
-
-static inline u64 ktime_get_coarse_clocktai_ns(void)
-{
-	return ktime_to_ns(ktime_get_coarse_clocktai());
-}
-
-/**
- * ktime_mono_to_real - Convert monotonic time to clock realtime
- */
-static inline ktime_t ktime_mono_to_real(ktime_t mono)
-{
-	return ktime_mono_to_any(mono, TK_OFFS_REAL);
-}
-
-static inline u64 ktime_get_ns(void)
-{
-	return ktime_to_ns(ktime_get());
-}
-
-static inline u64 ktime_get_real_ns(void)
-{
-	return ktime_to_ns(ktime_get_real());
-}
-
-static inline u64 ktime_get_boottime_ns(void)
-{
-	return ktime_to_ns(ktime_get_boottime());
-}
-
-static inline u64 ktime_get_clocktai_ns(void)
-{
-	return ktime_to_ns(ktime_get_clocktai());
-}
-
-static inline u64 ktime_get_raw_ns(void)
-{
-	return ktime_to_ns(ktime_get_raw());
-}
-
-extern u64 ktime_get_mono_fast_ns(void);
-extern u64 ktime_get_raw_fast_ns(void);
-extern u64 ktime_get_boot_fast_ns(void);
-extern u64 ktime_get_real_fast_ns(void);
-
-/*
- * timespec64/time64_t interfaces utilizing the ktime based ones
- * for API completeness, these could be implemented more efficiently
- * if needed.
- */
-static inline void ktime_get_boottime_ts64(struct timespec64 *ts)
-{
-	*ts = ktime_to_timespec64(ktime_get_boottime());
-}
-
-static inline void ktime_get_coarse_boottime_ts64(struct timespec64 *ts)
-{
-	*ts = ktime_to_timespec64(ktime_get_coarse_boottime());
-}
-
-static inline time64_t ktime_get_boottime_seconds(void)
-{
-	return ktime_divns(ktime_get_coarse_boottime(), NSEC_PER_SEC);
-}
-
-static inline void ktime_get_clocktai_ts64(struct timespec64 *ts)
-{
-	*ts = ktime_to_timespec64(ktime_get_clocktai());
-}
-
-static inline void ktime_get_coarse_clocktai_ts64(struct timespec64 *ts)
-{
-	*ts = ktime_to_timespec64(ktime_get_coarse_clocktai());
-}
-
-static inline time64_t ktime_get_clocktai_seconds(void)
-{
-	return ktime_divns(ktime_get_coarse_clocktai(), NSEC_PER_SEC);
-}
-
 /*
  * RTC specific
  */
@@ -308,4 +113,4 @@ void read_persistent_wall_and_boot_offset(struct timespec64 *wall_clock,
 extern int update_persistent_clock64(struct timespec64 now);
 #endif
 
-#endif
+#endif /* _LINUX_TIMEKEEPING_H */
diff --git a/init/main.c b/init/main.c
index bb984ed79de0..6a6f85e9404f 100644
--- a/init/main.c
+++ b/init/main.c
@@ -99,6 +99,7 @@
 #include <linux/kcsan.h>
 #include <linux/init_syscalls.h>
 #include <linux/stackdepot.h>
+#include <linux/timekeeping.h>
 
 #include <asm/io.h>
 #include <asm/bugs.h>
diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
index 406dccb79c2b..804f06801737 100644
--- a/kernel/time/ntp.c
+++ b/kernel/time/ntp.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/rtc.h>
 #include <linux/audit.h>
+#include <linux/timekeeping.h>
 
 #include "ntp_internal.h"
 #include "timekeeping_internal.h"
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 1cd10b102c51..410a9336748e 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/slab.h>
 #include <linux/time.h>
+#include <linux/timekeeping.h>
 #include <linux/mutex.h>
 #include <linux/sched/task.h>
 
diff --git a/kernel/time/tick-legacy.c b/kernel/time/tick-legacy.c
index af225b32f5b3..9a534f716462 100644
--- a/kernel/time/tick-legacy.c
+++ b/kernel/time/tick-legacy.c
@@ -7,6 +7,7 @@
 #include <linux/irq.h>
 #include <linux/profile.h>
 #include <linux/timekeeper_internal.h>
+#include <linux/timekeeping.h>
 
 #include "tick-internal.h"
 
diff --git a/kernel/time/time.c b/kernel/time/time.c
index 29923b20e0e4..7292ed074742 100644
--- a/kernel/time/time.c
+++ b/kernel/time/time.c
@@ -29,6 +29,7 @@
 #include <linux/timex.h>
 #include <linux/capability.h>
 #include <linux/timekeeper_internal.h>
+#include <linux/timekeeping.h>
 #include <linux/errno.h>
 #include <linux/syscalls.h>
 #include <linux/security.h>
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index b348749a9fc6..d234cb8a97fe 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -22,6 +22,7 @@
 #include <linux/pvclock_gtod.h>
 #include <linux/compiler.h>
 #include <linux/audit.h>
+#include <linux/timekeeping.h>
 
 #include "tick-internal.h"
 #include "ntp_internal.h"
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 930ae4002a81..8014f02e4443 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/timekeeping.h>
 
 #ifdef CONFIG_X86
 /* for art-tsc conversion */
-- 
2.27.0

