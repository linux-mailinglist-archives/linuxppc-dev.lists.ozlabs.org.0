Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F18323D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 04:34:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=n+SEI3oJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGQFz6df5z3c1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 14:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=n+SEI3oJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2407::701; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGQF80wP2z3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 14:33:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZk4ZiKySSxgNLV9jPGgbj8S/UTceuNbiW0wVnHg5qWGa9+9UnK03e72iHsbfqQ4Y8psJpgCKECELAT7kJeG3G/2NaobVDGNaeneYZ4UvGxjnr3gWnfJlIRM5MuUEx8ErvSFqg+2iM26QmTSukxQD4KG3a6Mn8Dg8G8GIW4UC899DoqprIV2Tn6hBjf6viepYSJwPg7+x0EIAdgFhr3NjTeUTvarUhL6ipdyO5J+zIsyxF2WBiIbJlTXeFM5CYwvOnO4l5Pp4vDGOzNRzhkudXrYVH3aveS10lxdCqeufZSNrvL8ufiKogKQe7qZPFqEx36Z4n3r+ARdCNkyrxoGkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXViFCOSBlV6CJHB34DLjuBT9gBqiN3hcdm4c5Uj1RM=;
 b=bphSh93NTptMvaOqul2J/I9tKRUYChQ9zhIazM6mOd8KAciVMBJYtqRyDX97PUk4lFircnrQM+sp6HcsjEm3p75KAbXs1ao1aorBaUPNNomzRt0fAJ1g19MOAx2u91JJ4TgT0QHLXrLuKzM5gTeNQz+Nt+KR9jbDZG0TpvP3tDB4dP2Ok5vccb1NxYIzfW0Aayzfh3lShi9pmGrsSDXy5KyWctC/z87vijQNn4OdKffovtuXENXJXWvvaZ9utgpFYPFvnwWD2SjjfJPYD6mQhPOodojiuP56Q7Drh+TYIh99VqbcYvKgsNo4uJAqq1lnFAbZaqAAYopZX7/WG6XvKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXViFCOSBlV6CJHB34DLjuBT9gBqiN3hcdm4c5Uj1RM=;
 b=n+SEI3oJ7iVMcfzSjU3c4IL9j0Fj8dUiMr5K+rjGwbGub4iGYUgjhfRcSsVbemsH7Y5FobYwsOQuxyiAYGkvJuDL8WXT5MOPPkw9ShFEh6lJPitmNsmJdOGN5fg54GYl+gmnO9lovFMUWqff5Lxg85f/KV0vRs2LD71JpTfNjGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DM8PR01MB7144.prod.exchangelabs.com (2603:10b6:8:6::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.23; Fri, 19 Jan 2024 03:33:06 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7159.020; Fri, 19 Jan 2024 03:33:06 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
Date: Fri, 19 Jan 2024 11:32:27 +0800
Message-Id: <20240119033227.14113-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:610:58::28) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DM8PR01MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 7173bb2c-947c-4966-58a0-08dc189f5997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3Vfq+nZiRt9MJ/NpjOYkGfTaiZYeNuiny9LvW+krtNULHWdBlLlF71g9XdCKQaTsmUzK2DXUhM60GYLqT9HCT5cos3YtvX6zl7wtepv5nZ4W4w53lEV81FCzAel/R6UkGtgixN8BV2sh7EQFx5u+r6nB8NAmAP2nPbrtDLii1/mU4Iwyo7aJHWBkZ96f+1zdtg5tGT3qepen2wmJtC4o0eMI+bzUcofk+r3GAYtUNG2+/Ba3e1cXZ7dHl17KdSVrNOXWahIMvxPe1EuseBuh6qYl2+fp+BbpDycJgJjIRhLXd+H87TLyNiMvaCX5DRFWlptLrCX/WGniMCEOYgqIFxFxuJbuFnv6a6STBnOLdkOB00UXLbh2E/nvZSS0qsACy8AMYK+hCNXqGfOxz6A2DU92mr3xzeqi2KU4t45Ii24+oCHQDcXCi+uD3hbRkmccFv9hq3SrLbrUl26L5BTJkkIz+ULHzf8ACjB4PO/oLVxjW0NB2bhy8pGZSUIzJeqWBDbQSEz7o6/Uieo8zBeIBmJFIRsF25sKjZ/5YR08xhDK1v8iyFZXrE+yd+uG8FqxPpSuD+ZbQQX1QJ9BCexiCjarU0jjVeO+T6FdOvFpi7ncDsbCdw3Jv80XnTTDSVLN
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39850400004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6512007)(38100700002)(6506007)(6666004)(478600001)(41300700001)(6486002)(52116002)(38350700005)(316002)(66476007)(2616005)(107886003)(83380400001)(26005)(66556008)(86362001)(1076003)(66946007)(6916009)(5660300002)(4326008)(8936002)(8676002)(7416002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?af8Q+WQwi3uK7cpNq0kHacZPa1xnibsp/Chy/WSQx5XWEk9BtTaGQeSVh0s3?=
 =?us-ascii?Q?FFsiwqi4ubHaxnTAKn+VXe3dnbWC/sFZEE/mWEp0KAWTNRbtwUdJroMvgdYP?=
 =?us-ascii?Q?nYChSKzURwli1SqtAPxiQGKDFY82k0fyrLwEX/em2M7MVrikOmcnrfFxiHGB?=
 =?us-ascii?Q?yAKWJCTClkor6RrKIykv/xX7uH6U2T1I7oesGg8VjFFqanR8rebd6E074cCI?=
 =?us-ascii?Q?9SrJQJprW7bzCa1RGz62dFkZ5e9WmP0SrJL3yxu1vxLSzZC5AcA1q9EXanYx?=
 =?us-ascii?Q?VJNV+NlohBzcWUTxf3vNZiLwRA4TFKW4nE3slbEYLv3wZiSQ3MKKoviLB7kl?=
 =?us-ascii?Q?zFIjjXk6VpdNx3daAuV7yKs/xQBdt58FHVmFTYvKPtu5ZhQdgwhuB6Zi2Kiv?=
 =?us-ascii?Q?DsnIKzcfgghFB9k2kBbqBwrvezwNFUE3Cxzr1ARknsGLYFbANslR1P9+WcOT?=
 =?us-ascii?Q?86KZxDlIV3G2HLLUipIlqSLpNQuhALccoC7HN7pA8iiURWc8md0m8nho/aoP?=
 =?us-ascii?Q?d6wcOQYpqc6OsW1imVQ3YDa3xlZoQSu+cklN+kTjGoFuhbi3vIuSZnp1wJJI?=
 =?us-ascii?Q?XBcrYzNXx66DJDXUDKVZIyrmAM3QJUyciCow+24//KDAXiARCvxH5WANPBzc?=
 =?us-ascii?Q?PTkJvEObZ+isceAgzqF1S+M+8WY69741kIA7tyX+YdpJ1glBipuG5PQHYl03?=
 =?us-ascii?Q?2dONFGRwr1QfXYEWtsDSz3IuLMdWvQExhHLWEXqxCiO49kqz0PJkVrFq8hxM?=
 =?us-ascii?Q?heNQ18dYJSftB16GgsvMBrcDpjCYUJoJ4BWdBST95T+28J41PsNIkokUWAZf?=
 =?us-ascii?Q?FnFiQNGf3sE1jTFDY6c2tRgqUIrh4qKg3AKPjzBjTlU5uXXSPuDVBt6MzUGv?=
 =?us-ascii?Q?Oaory/EyzDxjPB3PCY1Cs2RCrBtPZ5cWjmEqiMYD1xAupjlqmQ6853vAIIkX?=
 =?us-ascii?Q?EHRa7XExnAV+P00HcYv0mhS6Y9ZVQJS8W+kvdX8t4V/DXHIsmufvZXAw/KHL?=
 =?us-ascii?Q?6Zm0+DFnaQKT1ZeSPsKlFezn1aLwqgH8taWbeMBpst98Itud7w/devZ0Q4v5?=
 =?us-ascii?Q?sq18ZfT61xPFWhdKtZMkTorU9psipjxLRBSQAPyxb9yw98EHK/nCCgo6avcK?=
 =?us-ascii?Q?Oe3ifrruc3kh4wH6O3Cs3ArDnAGVbT63KO8sQCJHGx+y2jIVdeWNxELkAfqw?=
 =?us-ascii?Q?El7xkqyZJqVepN9cTT4kUylioVHm36fyiLNKncPfETTEoBIvDD1ITh//AYRM?=
 =?us-ascii?Q?aAPK/tLWSJAelovZOQB2i+JBcfhbUHzw1aDMSI9at3p+fvq3cuVH653Gk2op?=
 =?us-ascii?Q?bPOSHnR7sGr07O5N4Cej6C5KlPIIlmCnQl8XY5S+MpkIOO8mrGwWnxTkFztj?=
 =?us-ascii?Q?TAmCVz70tHCuJ0y5Qr2IHkm3FFwlAfp7mfCfTEvGrxH6aX6IuSzzIQmSrChl?=
 =?us-ascii?Q?UsrDpKBp6/H9w2Vyg/YmkN8DOAJEjGYarxAsl9QYsgb45DYEUuLAslOWZ0t9?=
 =?us-ascii?Q?mquG8Qrxh2s876u1qirCwzqrgQEsfwlDOAlBqvdMMuL9mjtAL5vHrWI/FiwG?=
 =?us-ascii?Q?EIIez2WcpkaeJfHPxzzTyabmUsATAtNMdgplWSyGYGThcUxIlUJBpvOUdUe5?=
 =?us-ascii?Q?DL2m7a9ck0QCzj7pUNCMf/I=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7173bb2c-947c-4966-58a0-08dc189f5997
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 03:33:06.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aakv5cxf2piirah6hPpVtdKCF3b3gxrbVnv6icYLbFAuRAdJX03JDjNmwXb8AC6f0V9pQRG84jFIDmfpKaAPpY2wHhP5wSYY2rjVw4W+hZ7bkEvc+Z19RHkS/HVG3KMg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7144
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

During the kernel booting, the generic cpu_to_node() is called too early in
arm64, powerpc and riscv when CONFIG_NUMA is enabled.

There are at least four places in the common code where
the generic cpu_to_node() is called before it is initialized:
	   1.) early_trace_init()         in kernel/trace/trace.c
	   2.) sched_init()               in kernel/sched/core.c
	   3.) init_sched_fair_class()    in kernel/sched/fair.c
	   4.) workqueue_init_early()     in kernel/workqueue.c

In order to fix the bug, the patch changes generic cpu_to_node to
function pointer, and export it for kernel modules.
Introduce smp_prepare_boot_cpu_start() to wrap the original
smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
and set the cpu_to_node to formal _cpu_to_node().

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

