Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D044EAA4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 11:17:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSP8z584Pz2yZB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 20:17:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=RH9kn1OU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:704b::712;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=RH9kn1OU; dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSP7T0hNcz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 20:16:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbVg798QMpPcbFRavjRByMxiYBJuEINRuj5tRWvP2Bt1NDtyI8jNis4lOXDVq9WTRICP/Nv/wfHRSFwLnX1IhSI6hIrLnWdy7oTDoux+VLvlLOYN5zE10bKSoMcV1H0cfntdRAtTNcZzhHKJWggQrtXBMCLhvt6sHWzOdKIfbs1KBuFHXgBgirdPlL43vAfjw+63/ZN6VRcQEuAJo+yVT6SeHTDJ/jsiZTUVMGSRzuTNXAzqp/R6BhPx+DhNaM1QApzUPayymvZSkS80Kb7BjCqqqfaQ7sT4qoRkEN7ufrNrcG86dSp1N1E2BGurX8Bm4L0LbnqEUks3HO26M2LoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJdJRvEwPqo8RlI6DpBDKNBZKqXxtMQySW1s9gdVT8Q=;
 b=jT9zxgZrShSG6RjEurpm5iYnQ+qhsdLni/OV9BU///XjR+9jxkR1hrajp4fqZGXiiKjrqJehJhU6cEdufo7fjWpHgFmY9nVkciPFM+CgufoQl//3RW6LtvNGF4fLLXOTnwQrYHpmyoI1rvX9/mYjltdCwpNWz/TEZtaTXZ4T/KuDsd0WQ4rZb9fzPb6gjTf+CIoY0J9K4hWZEeI/1GziW2a4UvtcewwTmF1WlM4OKJe405aBC9+sad7D2EODdXnECmh/G/Y7xUMxjB3BYv/E7gLHPrD6ABIGGpgNhbwBpUbU8YLNHBt1PZBj82wMbge4psOW6EiNVrCyC4WZSyoTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJdJRvEwPqo8RlI6DpBDKNBZKqXxtMQySW1s9gdVT8Q=;
 b=RH9kn1OUxxp6XDB37LQqNrzPW41AhS9y9DVAWzK9C6N5yilsNcwQ4LyYErKa30/pj49nKA2JbMhkc0PrrCSq8eOaFhPV0imOoeKGopDpTFpoT7y8kjCpQVDjRQv22e4nEGrJvULJ2J1NB+k8etZcWb43Ry+awKgMpcSlF/IC9Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by KL1PR0601MB3875.apcprd06.prod.outlook.com (2603:1096:820:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 09:15:41 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:15:41 +0000
From: Qing Wang <wangqing@vivo.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] sched: topology: add input parameter for
 sched_domain_flags_f()
Date: Tue, 29 Mar 2022 02:15:19 -0700
Message-Id: <1648545322-14531-2-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
References: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7777b578-e8a6-49d4-b80c-08da1164b234
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3875:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB38756A4F2DD90A06FECD0D2FBD1E9@KL1PR0601MB3875.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /441SjkoX+Ny9slPCFJNrDU+XgmipscTvQbzgshuldXjW53uHqjKx0vYySgWVm0IKnnkfZm7pIU9flNNzlK7PlvZ4a+sLe5JObQ5SJf9uhfHawjYbY8zOe2f2d3G9l7lIc4poCVwPOsBQem87JZWuC5R/C4ufAYUU0BAeTXhJ8D3WzJNjd/XtV5HfJSdBSRfSQnsR+sXwRuRXC4m3Tm3CFk68OJy/sUt/KKTp1/dyGhbIe3tOKFqPjwm3nQemS9s6s/ER/rgcuo2uKvL2SvUvghvqu22G3DgVQ2a8r/A2MvYiYmmWPaZ/kBHxWoQiisrpXE71axLmvBmFcqCMslmAim67G59Um1fYpv2LV94qMJ8zGEC5CrX5GDmvpC8/OikRDyg0Aics2KpbcuBXG7eHA3Ft3iyAFbOuSHo4Hd7CtIldkMUhEfShowNleVd1EIQVUXlFlOtbyZ6+bL7koBfwgu1jsVacC37r6vov5mHWRAWdiHYAdY8fuOQEfB5rvt7aa4eDNcL0OqCsUDmowP6m43J//h+o3eEYUn+I12EqV7GtPW/tsFIx95UID9WnRCmnruUG6ugdXFuG10vYUzhwjacgUHKbQ51OEedx2flKDDzOStBkCkFswvCVtcotbnre3LNEq9UOS+JKBDvTr7NqL8PpdS7QRS4+lDLzsQVYoF1k/SBQsIfFYf6calMLLh0sVDAHErEN12CluLV3jf6OqaxOdzDcluxkQcVg5klV/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(66946007)(110136005)(6666004)(6486002)(83380400001)(508600001)(38350700002)(38100700002)(8676002)(66556008)(66476007)(4326008)(7416002)(86362001)(6512007)(921005)(36756003)(2616005)(52116002)(107886003)(2906002)(6506007)(316002)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PhBJKgt5FL2Y8Ibc46Cq1XMrtS3R7Qmoy98zYQkdcoJycBuZOEhtEQK7Ggv2?=
 =?us-ascii?Q?wBKJ+d6a+Ndf7CQwGFir8xHYywEa61FzVHO0AEMjEDA2qChNnHC/yMZXdX0c?=
 =?us-ascii?Q?sN619elmKuil7XqzwhtJq1LXYahhdNutfANMU5/E0GW27k7XolTCfDbuxIUU?=
 =?us-ascii?Q?WflQfgJXHuZrTAmvHvGR0shYZjXVVvyOM/reePCu2J/lTSYPAolrvdlNx5bd?=
 =?us-ascii?Q?9g+vu53Z+HiuB0mQ4bKz5rgtT6SCeGVX8DtABb9fgbSlkYxpTZiQUXk5SYZv?=
 =?us-ascii?Q?sqm4bhyMFIxB2ajy4l4UT1bhq+w+jKvfHRs9XQC1zeIBDb1DAh7+jZSD95/z?=
 =?us-ascii?Q?IKDTk7M0dx1kLGJJ3LedH7Qi1UK1n1vm5wAbWNhsfMUc06U7hEeP81fqAt4Q?=
 =?us-ascii?Q?L1Y6yhvqB6nQP3o4Eus6SBLJUp/lAe1oPZ/VUKhJdqYWs04r1C4UaUkHfJjl?=
 =?us-ascii?Q?Nrcy4ihOR2Xux5HQRvk5ka3stbEYQR9QOTJOHmWDdEII4Ek7fQx3/FUJbzc1?=
 =?us-ascii?Q?0MLxJFwnyscBOiIT2mE62sw+jpuD9JsUikVretLlJRXODY7vAURrnVx/YG7c?=
 =?us-ascii?Q?NobW32JRRFjeN/pR5hXZgWn0MII/oj0sGlPq5GhZRG8RZpKzZ/b2S6lbS6Es?=
 =?us-ascii?Q?W6c2VYJECWZ+BPkbSCOyrda73epxvFsgcRwGdwb0sf1xVQM2wXvoW2rTr+2a?=
 =?us-ascii?Q?ngIgoeDS4VkawYgupI/B6qIeEPHl/bAkGzXLjUisq3WWvlCxlReKickVnmLA?=
 =?us-ascii?Q?CJQQ4co2JttKFLaEPRV+bzhSc518SVPLThlVqPLZcFFhpffLAuNRK28WVDVb?=
 =?us-ascii?Q?VZuM1mHQqK/EmpnCBQiQequhXgDGJmL/Z1oM+qnKeLsDu86Q4/aqfovT6hGZ?=
 =?us-ascii?Q?44qFCsPqVqduZlEi0NLLkp9ICRKdayILVGe5Cjaj+xfxsAo1UP6SUlEGLrXp?=
 =?us-ascii?Q?CYLAHuJX+/EUDc7TL9RK6NTq3FZSlK8CQc85j4VTCKGBrhrkBtfoDODCywPi?=
 =?us-ascii?Q?OJF+ygNG7y2g9oF0YjEgm4Y51Xpvl5zbNkC4niUwYBTFhgfvhMcLvoHDbQz+?=
 =?us-ascii?Q?L7AW6YxG4qVQ9xy/l2q0oFRv9lzHxCshXG3+6Ck9WbPd5bhfymawtVDgXCja?=
 =?us-ascii?Q?9+O6/QuErHqfnsTL4DzQlKtF4bov4nKGIFf2EzLQ/m4m7FC/QYKR8tcYQU6e?=
 =?us-ascii?Q?/RzMAP9fmCSWjcsqTkMBGK0K4LmCKXnNzZyAUyLIm7rHnmSnQye90OkQJdmr?=
 =?us-ascii?Q?zQEwsB1MkpTXWiaBdFhCfzIILIoby7i95ow/XXSL+Lwpbws9lcNcXBDB82kD?=
 =?us-ascii?Q?2cgabTuSJAATH8Hc/cEHPDAcPHYhSP9eU06dEHJdBJTQCiDrqSuHv6vyfo5K?=
 =?us-ascii?Q?0IV1cE0FNkf5qi3KbYERfXLBBKUHIo5VUAKoYHJtlebK3f/Df5iAf+vEwWqJ?=
 =?us-ascii?Q?zyEi726R5R/qy8jT9K61raEBxXp/k862BC2DP+4uv1qTCo6f2nRKNUG61/Te?=
 =?us-ascii?Q?c1jlSk44DH/stgOXcc6/CbSkv+SCrVP5xBCCoVn+h8paELHsOeqEvgedbYmf?=
 =?us-ascii?Q?Wi+ON62CL2EEJ09blYwf4MBesqgBj9uzUFtM+D0Bu2+qdDIpJ33OKt2HXw5L?=
 =?us-ascii?Q?VHXdS9icnqowt0BP0Nw/4/Fw8npvPbKMeYekFqUsclqWfpv89vKkUkPLVa8S?=
 =?us-ascii?Q?j3PMFFoAqtAHfMjok4JOeGIvCZvDzMRmO/aynJ1s7mRtnlUPLseIt6wVU72f?=
 =?us-ascii?Q?09w33ILV6w=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7777b578-e8a6-49d4-b80c-08da1164b234
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:15:41.1797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkB7NIzlDSPNeOxa80qBw5x236F2y420RKK+VPv/+1yIwCm8HbzuN1oVnVJFlF+QyHqB1fAG0ZK3znmIctmdhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3875
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wang Qing <wangqing@vivo.com>

sched_domain_flags_f() are statically set now, but actually, we can get a lot
of necessary information based on the cpu_map. e.g. we can know whether its
cache is shared.

Allows custom extension without affecting current.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/powerpc/kernel/smp.c      |  4 ++--
 arch/x86/kernel/smpboot.c      |  8 ++++----
 include/linux/sched/topology.h | 10 +++++-----
 kernel/sched/topology.c        |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index de0f6f0..e503d23
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1000,7 +1000,7 @@ static bool shared_caches;
 
 #ifdef CONFIG_SCHED_SMT
 /* cpumask of CPUs with asymmetric SMT dependency */
-static int powerpc_smt_flags(void)
+static int powerpc_smt_flags(const struct cpumask *cpu_map)
 {
 	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
 
@@ -1018,7 +1018,7 @@ static int powerpc_smt_flags(void)
  * since the migrated task remains cache hot. We want to take advantage of this
  * at the scheduler level so an extra topology level is required.
  */
-static int powerpc_shared_cache_flags(void)
+static int powerpc_shared_cache_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_PKG_RESOURCES;
 }
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 2ef1477..c005a8e
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -535,25 +535,25 @@ static bool match_llc(struct cpuinfo_x86 *c, struct cpuinfo_x86 *o)
 
 
 #if defined(CONFIG_SCHED_SMT) || defined(CONFIG_SCHED_CLUSTER) || defined(CONFIG_SCHED_MC)
-static inline int x86_sched_itmt_flags(void)
+static inline int x86_sched_itmt_flags(const struct cpumask *cpu_map)
 {
 	return sysctl_sched_itmt_enabled ? SD_ASYM_PACKING : 0;
 }
 
 #ifdef CONFIG_SCHED_MC
-static int x86_core_flags(void)
+static int x86_core_flags(const struct cpumask *cpu_map)
 {
 	return cpu_core_flags() | x86_sched_itmt_flags();
 }
 #endif
 #ifdef CONFIG_SCHED_SMT
-static int x86_smt_flags(void)
+static int x86_smt_flags(const struct cpumask *cpu_map)
 {
 	return cpu_smt_flags() | x86_sched_itmt_flags();
 }
 #endif
 #ifdef CONFIG_SCHED_CLUSTER
-static int x86_cluster_flags(void)
+static int x86_cluster_flags(const struct cpumask *cpu_map)
 {
 	return cpu_cluster_flags() | x86_sched_itmt_flags();
 }
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 56cffe4..6aa985a
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -36,28 +36,28 @@ extern const struct sd_flag_debug sd_flag_debug[];
 #endif
 
 #ifdef CONFIG_SCHED_SMT
-static inline int cpu_smt_flags(void)
+static inline int cpu_smt_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
-static inline int cpu_cluster_flags(void)
+static inline int cpu_cluster_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
 #ifdef CONFIG_SCHED_MC
-static inline int cpu_core_flags(void)
+static inline int cpu_core_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
 #ifdef CONFIG_NUMA
-static inline int cpu_numa_flags(void)
+static inline int cpu_numa_flags(const struct cpumask *cpu_map)
 {
 	return SD_NUMA;
 }
@@ -180,7 +180,7 @@ void free_sched_domains(cpumask_var_t doms[], unsigned int ndoms);
 bool cpus_share_cache(int this_cpu, int that_cpu);
 
 typedef const struct cpumask *(*sched_domain_mask_f)(int cpu);
-typedef int (*sched_domain_flags_f)(void);
+typedef int (*sched_domain_flags_f)(const struct cpumask *cpu_map);
 
 #define SDTL_OVERLAP	0x01
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 05b6c2a..34dfec4
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1556,7 +1556,7 @@ sd_init(struct sched_domain_topology_level *tl,
 	sd_weight = cpumask_weight(tl->mask(cpu));
 
 	if (tl->sd_flags)
-		sd_flags = (*tl->sd_flags)();
+		sd_flags = (*tl->sd_flags)(tl->mask(cpu));
 	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
 			"wrong sd_flags in topology description\n"))
 		sd_flags &= TOPOLOGY_SD_FLAGS;
-- 
2.7.4

