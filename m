Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019A8311F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 04:57:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SN5josso;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFpqF0Ldnz3brV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 14:57:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SN5josso;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::70b; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFnvb4ZBfz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 14:16:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAbjfZeHxX9kjreOHTjFLdKv8Y5CorVzkah2+7bwgE8GfCVoyTJZxJ6w2+0aghXRMfy++p6X6VhVRv3LUUz5o2BS4xRjAj1iF9UW3znghwJh3OeG/z8aqf/BiKjU9wE5nbP4FxQNP8AdcutDu1Npjfi9K5LgEkAaXP/WP6ev8HjoV4PBCXC/FH6snrxFYMCtkVZc3CQ26Kq+BA+uAFaVSccUe3LO0TqQ+RB7NFtHJh90CNCBtKi+818axXPkhcpAyZHBwkTh9OR9uTBDDEU2QrfyUHjNvBDPfWGwryE6Qy4M9B7hvSy+OBuaPaD0qCtRUX1pXqOxjbdnkvm7FzBMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rSlbDTD9GZa0ytWtqo/JoUbXLsumjW+eNlIQoOM3f0=;
 b=N/1bfAtk/bNS+82wBO20faNkEGa2AmpH7c7e/JqNcAPfcJKPM6GZad+ytNo95ch+Z8V7XymEwc0M4DmLdUMSljTsIwaNCTI0MWvnsKit3cSto7+eThHfiYB5uO7yjyC+h2Ver42VKBIiz5oxKDNQaScwn66XtiNohhw3A/K2zOuSOjCNqyTlSNDDvYLIQx6xMUfJZiSJFerSPxnbTwOZsHsXyswuuRZOuIKcwjCgNFOI7iQ9ejZzL+yliDueUoY5TyryK48jg3EC8eG4YFIbQxAkgltSKRVph2n7l9bfyn3OF+ncNV4Pkk63vGzOOcFwhFcutIabUySlmJt0M+ApOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rSlbDTD9GZa0ytWtqo/JoUbXLsumjW+eNlIQoOM3f0=;
 b=SN5jossoaRxbHWXHt1L9IYwS7sHZ/G47hZpC70aFQ6tW6yJqjQamtFe570W5nVlPyUXfHKfOo8pn/aZ7+s7jwNj3jp1ApMVPfDF2WmzBjNEoIrejj3gBx+MOEZVxzoI176ByzJNW2vz5KiWwdm9glM687iToXSi5D0/Sfnpo3u4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 LV3PR01MB8439.prod.exchangelabs.com (2603:10b6:408:1a2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.23; Thu, 18 Jan 2024 03:15:49 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7159.020; Thu, 18 Jan 2024 03:15:48 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] init: refactor the generic cpu_to_node for NUMA
Date: Thu, 18 Jan 2024 11:14:12 +0800
Message-Id: <20240118031412.3300-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:610:e4::14) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|LV3PR01MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 208619bf-361c-4a65-1167-08dc17d3c4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Mr/1TD6778cFBBbyoZwmZ3Dbro4P1rF32pgJMbrvXd7c91uHJs7ylAiWynpwhmwqoJKFG6nO8EonUA1QYXYsRoij9X1b6s8dEQFBsoEgi1160WSdfY46bBIP5HUfBhVjpzC+MQIj5yDPREj+Ut35+osNSej/53NdFCM2YUsfhmwPpUqsconz26uHGdtsPfBEkKoPeAW60MGLbmIbGyCOprnH0Km+99N3YAcdvf+hLMCgoffY3XvNN5DD1MF9l794T4wzJJSvyjVzW3bECcSFudl5dz42feswWIcPyFLubKNfSkNaYLDnz2c7GoAkSCOZk58uItsNMx6y29FAyOMv4KDEnp2jKZ61Xa595fCQXrtFWiSj3CBod64YEJqSviA/mH0IPBhnT+8FDzUk78USP6huEcVGNvr6V/+Daff0TO5+0ILO38LLZKYF3CnOH0jg774vcRZbnKH0owQ7tI3/oKCfd7FgEUmYQT8GCEWIKxwQnp/aSDGuX1cXZNZ1LaK/o5ZQHNDVNjHNc3ICSNDvjLuzfuBxup+JX0Kw/HJL5sJg1Z5VW+9r78zo499YAllgstVLEslHwf7mzq/oBWIRXu7cjMtOLbDsWGemQ35+6ZCDNeaxJYdT7bClnXhdmiWqycXOW/eAqJgI/rSNVE6pZw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39850400004)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(38100700002)(83380400001)(86362001)(66556008)(38350700005)(6486002)(6916009)(316002)(66476007)(2906002)(66946007)(5660300002)(7416002)(8936002)(4326008)(26005)(1076003)(2616005)(107886003)(478600001)(52116002)(6666004)(6506007)(6512007)(8676002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UJEiEPaIt1t8oFSATzhnNIet9OVoj0Rut08gOAu6Aa8kMPHi1DSKtvAYxYl1?=
 =?us-ascii?Q?1XYTHXRv3nK6BYPCC6FWYNCWtvJPa21W9crvptdb8HxigtHrNJm19uQmjyCg?=
 =?us-ascii?Q?Am6u0F32bp7/0FQjCIyYhLI5JeRL1hFfpb+jM5Ms4xUK7wauiU7yC/UnDi6G?=
 =?us-ascii?Q?Sez+Bj/O9i8I2ZpzUqn6ng4blO7gGJtZtZW6qwJa5dVAg/kp1M89oQQ8McRF?=
 =?us-ascii?Q?PusPAawq0/dkNLE4TpNKaUr3frkQAEjRJ+uT4brzzmHAsjJmBC0kXkdvyF/Z?=
 =?us-ascii?Q?JzMQbsoHymkP+rt9IASiDzVYWbOlwCpYyXtRd7UT7ylCB1MV9Olyjr3H9K5U?=
 =?us-ascii?Q?aTozH+brI2E9pc2tM1ZZgRw3lFyNM2WQo/3S086bvBGmOYtkWW9Qa/szG5wH?=
 =?us-ascii?Q?72z7b3URoy2dUIgD7VIqJ3+RckUcrj/u7NFf6Qo5RCs0mYHd9xRUsNkcwq2D?=
 =?us-ascii?Q?OdZ8Dq4hJX6XqMUTc4jmRQbuYTgLaemcldMy3Da859+fbxjQPW8g++0GWrQe?=
 =?us-ascii?Q?mOUPNO8QoNZ43Gb4kwZSVKWrIYQfdKh6GFGwUhwJCMGqtvArW7OTgcTo2eBf?=
 =?us-ascii?Q?PLrOC8v5BT4ZrLHbTbGFKSTBi4okW6yx+xoaSgLydnNhiTQGB0tO194BhIV9?=
 =?us-ascii?Q?aEZ3H+H9k6wE0iPH2jgmpNxX8tkpI6oIEfmXSSwr5677C6ogRYwNqe/FPwjA?=
 =?us-ascii?Q?u6FPnQCUGhe/g7ouJVpcOH7egRGRTPuBrxhSMS3ffQDyzTLAiUDkZA9/o199?=
 =?us-ascii?Q?9lI7e+ARbgpgE3d5jkCUn69I/biA+ABw1FSFI9Q3z7PRFrEvSwASbfMo4Zom?=
 =?us-ascii?Q?lz0r6dsZp4RjjdrC+OSCA/h8l/E0wJ6g6aQhaWyqExupUHCF3jqAz8OoWByX?=
 =?us-ascii?Q?2B+EqGIyyfiT/c1D+LQkCrHoM/XelggCeUJGldq6BLc0YBzsgFVq47mw6cbJ?=
 =?us-ascii?Q?T4ftu3k5nx4REhDMJXcm+o6EQGFkH6bLUX/nRHz7mq672myYxaEyA3zCPMDs?=
 =?us-ascii?Q?gWEPk9z98iFnkEogREqIerzOJT+gPciS8wDDRtynC84mEOOA46bzJDQpB/ua?=
 =?us-ascii?Q?X3oiViqAlqI0xlx9S4NCLJPh1qkwzLlAHOJAvULzZ7OqlZHTBbvFs54OWv28?=
 =?us-ascii?Q?7tJWnZJxLSwTT680qO+ErMe+nqL88k9hHyyvgHbHSlAeqEvxTJbQxdM3E4Pc?=
 =?us-ascii?Q?PWntl5RwJcTPQBHHLq/vqrQ79SUbcmhCzwNggwqiN6h4E7SM6Zo2reosw6XD?=
 =?us-ascii?Q?BA/o1pk+ZkxwfskCn+V25P8nPbRFiUP1bLdYuNAZc0oQyNNInGOHQGeBcSVM?=
 =?us-ascii?Q?kUgF57Qaz7NXbQXrcavuCJINMv9V8ERGo4p+jIzLD7QMTTKC0vAgX9PCEikV?=
 =?us-ascii?Q?6ATF9PZB9deT9P8tPywpHfi7FOahNpbv32xYbTddYwpocDQZQtDt88XVef1o?=
 =?us-ascii?Q?K0Ka9/3bNC0Ia7SInuVhv5cZzhlGGzfhETNPsWonnjaFYcZPWpafGrIYUkrp?=
 =?us-ascii?Q?TAm86B7dOMn0HR5l1AsXMeqByRrt8hTp42nOvTjvfvFh0UCgC1n4VrJDPCUD?=
 =?us-ascii?Q?mN9m0M0pwUV9MEygu+q+q9q70ET7mdo44NvfQydYZAHUS9nLwnQviBZt3uLK?=
 =?us-ascii?Q?tSqoLbQn/5M1lf5FzoPoccc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208619bf-361c-4a65-1167-08dc17d3c4b7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 03:15:48.8422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNkIrnf8wHWP77puODQUm3mJvtTw6xor7pVIPEAzh+ivusw7ZlBMfayxuNMV9JS80Kdm4N2ziVL7OsyRuUB7UuRwbbjBnT9ZqPyKxxZm53yziDj50C5mb6ybcdaZvY2N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR01MB8439
X-Mailman-Approved-At: Thu, 18 Jan 2024 14:56:46 +1100
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, yury.norov@gmail.com, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, Huang Shijie <shijie@os.amperecomputing.com>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(0) We list the ARCHs which support the NUMA:
       arm64, loongarch, powerpc, riscv,
       sparc, mips, s390, x86,

(1) Some ARCHs in (0) override the generic cpu_to_node(), such as:
       sparc, mips, s390, x86.

    Since these ARCHs have their own cpu_to_node(), we do not care
    about them.

(2) The ARCHs enable NUMA and use the generic cpu_to_node.
    From (0) and (1), we can know that four ARCHs support NUMA and
    use the generic cpu_to_node:
        arm64, loongarch, powerpc, riscv,

    The generic cpu_to_node depends on percpu "numa_node".

    (2.1) The loongarch sets "numa_node" in:
          start_kernel --> smp_prepare_boot_cpu()

    (2.2) The arm64, powerpc, riscv set "numa_node" in:
       	  start_kernel --> arch_call_rest_init() --> rest_init()
       	               --> kernel_init() --> kernel_init_freeable()
                       --> smp_prepare_cpus()

    (2.3) The first place calling the cpu_to_node() is early_trace_init():
          start_kernel --> early_trace_init()--> __ring_buffer_alloc()
	               --> rb_allocate_cpu_buffer()

    (2.4) So it safe for loongarch. But for arm64, powerpc and riscv,
          there are at least four places in the common code where
	  the cpu_to_node() is called before it is initialized:
	   a.) early_trace_init()         in kernel/trace/trace.c
	   b.) sched_init()               in kernel/sched/core.c
	   c.) init_sched_fair_class()    in kernel/sched/fair.c
	   d.) workqueue_init_early()     in kernel/workqueue.c

(3) In order to fix the issue, the patch refactors the generic cpu_to_node:
    (3.1) change cpu_to_node to function pointer,
          and export it for kernel modules.

    (3.2) introduce _cpu_to_node() which is the original cpu_to_node().

    (3.3) introduce smp_prepare_boot_cpu_start() to wrap the original
          smp_prepare_boot_cpu(), and set cpu_to_node with
	  early_cpu_to_node which works fine for arm64, powerpc,
	  riscv and loongarch.

    (3.4) introduce smp_prepare_cpus_done() to wrap the original
          smp_prepare_cpus().
	  The "numa_node" is ready after smp_prepare_cpus(),
	  then set cpu_to_node with _cpu_to_node().

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 drivers/base/arch_numa.c | 11 +++++++++++
 include/linux/topology.h |  6 ++----
 init/main.c              | 29 +++++++++++++++++++++++++++--
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 5b59d133b6af..867a477fa975 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -61,6 +61,17 @@ EXPORT_SYMBOL(cpumask_of_node);
 
 #endif
 
+#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
+#ifndef cpu_to_node
+int _cpu_to_node(int cpu)
+{
+	return per_cpu(numa_node, cpu);
+}
+int (*cpu_to_node)(int cpu);
+EXPORT_SYMBOL(cpu_to_node);
+#endif
+#endif
+
 static void numa_update_cpu(unsigned int cpu, bool remove)
 {
 	int nid = cpu_to_node(cpu);
diff --git a/include/linux/topology.h b/include/linux/topology.h
index 52f5850730b3..e7ce2bae11dd 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -91,10 +91,8 @@ static inline int numa_node_id(void)
 #endif
 
 #ifndef cpu_to_node
-static inline int cpu_to_node(int cpu)
-{
-	return per_cpu(numa_node, cpu);
-}
+extern int (*cpu_to_node)(int cpu);
+extern int _cpu_to_node(int cpu);
 #endif
 
 #ifndef set_numa_node
diff --git a/init/main.c b/init/main.c
index e24b0780fdff..b142e9c51161 100644
--- a/init/main.c
+++ b/init/main.c
@@ -870,6 +870,18 @@ static void __init print_unknown_bootoptions(void)
 	memblock_free(unknown_options, len);
 }
 
+static void __init smp_prepare_boot_cpu_start(void)
+{
+	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
+
+#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
+#ifndef cpu_to_node
+	/* The early_cpu_to_node should be ready now. */
+	cpu_to_node = early_cpu_to_node;
+#endif
+#endif
+}
+
 asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
 void start_kernel(void)
 {
@@ -899,7 +911,7 @@ void start_kernel(void)
 	setup_command_line(command_line);
 	setup_nr_cpu_ids();
 	setup_per_cpu_areas();
-	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
+	smp_prepare_boot_cpu_start();
 	boot_cpu_hotplug_init();
 
 	pr_notice("Kernel command line: %s\n", saved_command_line);
@@ -1519,6 +1531,19 @@ void __init console_on_rootfs(void)
 	fput(file);
 }
 
+static void __init smp_prepare_cpus_done(unsigned int setup_max_cpus)
+{
+	/* Different ARCHs may override smp_prepare_cpus() */
+	smp_prepare_cpus(setup_max_cpus);
+
+#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
+#ifndef cpu_to_node
+	/* Change to the formal function. */
+	cpu_to_node = _cpu_to_node;
+#endif
+#endif
+}
+
 static noinline void __init kernel_init_freeable(void)
 {
 	/* Now the scheduler is fully set up and can do blocking allocations */
@@ -1531,7 +1556,7 @@ static noinline void __init kernel_init_freeable(void)
 
 	cad_pid = get_pid(task_pid(current));
 
-	smp_prepare_cpus(setup_max_cpus);
+	smp_prepare_cpus_done(setup_max_cpus);
 
 	workqueue_init();
 
-- 
2.40.1

