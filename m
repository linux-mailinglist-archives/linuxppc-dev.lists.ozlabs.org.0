Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B296483867F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 06:01:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=m+AjAekQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJw0T2mZsz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 16:01:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=m+AjAekQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:240a::700; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJvzc6kg1z30fD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 16:00:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwIZwVw05GXifOwX+7u4/hT4BktsxgdX9gUq7jsv3dadOZCmikbqWZYDnV6pVuaQAQ1mQajsbieS+K3AvtTtioHNGihvJoPJWoLsnu1R3GOAa0oQwYMfVtnU9+tw0AimlsO4P4aIAgzzu1mDBpYUrI/mJNoMfvq7jPPEzSFfAFFxjKw27nwDpaue7Vjj+i+puOuP8WsVsVGIl5YHcXI1kF07E1DBqIVb7kaLVR13FSi0CaGbbABv55zyFJlzLexYw0wLqjbS+VrVuMWoLAeaXeqPigvBlcM97P/gePb2i+AwSlUKzTlrxEA/YCeZN/xCuN7JcPyRI8VQ7jvUSoe2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8VMOla1IfoGtWF3wkPssQAMpxGPlgWmvfrDwBZXah8=;
 b=jbm04+Y9wNsQITlTP7oaVLwR2sdTuUxZTR6Oek8/WM7Wg9eNivbdsNncs1t3qBbCTTwftp6JFq7AuW2nQdcU0gXJWRYTzXEhs8vX08mFkurac4Xyk2iPj8GvULzcUdHf4ybn/GKFcmjSVxZqPY7+PK6X8ofbRchMmIq5+NPNiz/Zq6zwaiNd0tQphaaFubf+ePSIL9wZsHhSx8PI+s4+RDwN39cy1nob22YtsS/CD5iTzI/ROK8lRYnmiq1f8aM9jYlCIDNeVvbEbeBLJqxZei7T+91vr48UfM4+vPbnOKN/JthVCsmxMNlvBHHi6lcvSLb3wBH7gEKnr/l1NzJm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8VMOla1IfoGtWF3wkPssQAMpxGPlgWmvfrDwBZXah8=;
 b=m+AjAekQwvzmwcaQLWU2c4FXfV4iIOXemadq1ERnmUxlVOiulnPl65nYBaXcVkdcjCkzehI/NLrnBHM1DMBPxB7HIhgts4fOJHVzmH3ZbkmLt90vhKM+4V+bpUeqnoKytZuWtZg2G2Wo9n/m166KukD7ZAIC8GC896Or24g3nlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BL1PR01MB7865.prod.exchangelabs.com (2603:10b6:208:39c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.37; Tue, 23 Jan 2024 05:00:06 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Tue, 23 Jan 2024 05:00:05 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
Date: Tue, 23 Jan 2024 12:58:43 +0800
Message-Id: <20240123045843.75969-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:610:119::26) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BL1PR01MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: e587ba2d-86b5-4ad6-ea82-08dc1bd02a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+dPw5AkUKDAFa6fB1cwtJupmWRsmlVWFpO/rFtQ6UaY0Hcb4jQxQ0voerUo4skt68kMU2LFdmg8u/GQvuiB+n44nhuuS8B9mnjwFn4MMjHs5iuiGO1wBvDWBxgVWP6CWVqSo1gACs7TuQecKIi8EnueOTvbiM/1TNxgm35qqHDojoEAnn+HG42M2lGzEHv54MEDpQA3EUnOh5HVmujk2A4KkC5v3VB5aOcr/nS27n1BkpeJdGdmnse+JxGXNVO9mKaqizwTaTPpVL+g6SD4kmpYRSW1/lkxIZmbNfIS55V47nQsi6bn5oT6nzE4nd+CzjoW2BiCkRUxsuxZBmsFgW1falAFAkXfBQV0kr0FAgmlM0cb7HHm+ORtxl7gtI6mnaeTu/TsXtm4vMAV8Tmj1SfPdnifMU9rX7mpq3motbCYKa9DioieZpT2Mb0f/wW07UQMxyqGlfztbxpkWrxvbrJZ6Zy5KrRUsSnyZYmwYMNdCewawXETbsFWLktsRpYCiXJ3rCN6KApJ+KEVjsYYv85JYpUVZKvSA8qKJwLvEaQ6j+l9s6+O/J85gvIUIcBnihjY/LFMDKrcQv4uoHi4RnVbDAiTxoCU68ZrZ2wLtRVo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(39850400004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6666004)(86362001)(66476007)(66556008)(66946007)(107886003)(316002)(6916009)(2616005)(38350700005)(6512007)(41300700001)(52116002)(6506007)(5660300002)(8936002)(8676002)(4326008)(83380400001)(38100700002)(1076003)(26005)(7416002)(2906002)(478600001)(6486002)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fqghm1328fx4Erk9LUmtZxirlH34qnrW7vkFv1ctbjWLlHKxU20vcrZRVRfu?=
 =?us-ascii?Q?ljM5Mb38oKRJ9HUQgDAEGvsOmGn7T86xTPDSlhDSidLyHFrghqHi+2cBzh9f?=
 =?us-ascii?Q?qe4MxQHH6JPkcwTxG1nvsoWgfdYv3vqhIG37FQzLsHVjBXgkFTg0Mtw5tneQ?=
 =?us-ascii?Q?kKd6XKcevkSbm9keBudBeCc0rByr4PtcsbECgWvCt1HGyppD9/06BctP/oeM?=
 =?us-ascii?Q?alUQkDPTczuWSeuaotN9CAZMTyS0gFhioFt3M1JWV3KglYZ/jbjKmFh0EElO?=
 =?us-ascii?Q?6mutVFYNkm8yKg35pYi+YKK7lLDPkfiGpmDD2PObSUdS8bbdMJmxqibdHBpA?=
 =?us-ascii?Q?BWy0f64bxL6uj3p7KnzQzxc4rNp+1bmeekPorGK81sojUwgFyyG5EJ/wDJpC?=
 =?us-ascii?Q?9gx5+qB+vvQpCLQGPLAxb7/5h+weNb7/qx5rKL4XSgZFXDr2jRLvarLRO/NO?=
 =?us-ascii?Q?tVczoMRY0SGHRNcaJ6LwITUFNMbZ9VdZLg5X0vowFNwvm0lbjhqz4su48kvB?=
 =?us-ascii?Q?ZaTkk7AMUR2CAvfdFT6n35nOfh30mZFOje4SutEQxHOLzPy/yr6mWnHUYgWl?=
 =?us-ascii?Q?jAapEqkHFl+1mm5Exwt4/Bue6W64pUk8WZh9d+aYsIu06Ow7/pp23407i2LJ?=
 =?us-ascii?Q?2ICVD6HBnqFj3z0Rf/HUtHAdYSR03IR1zj3Ee7dqA4x9AQRDIQNBp0V7kky8?=
 =?us-ascii?Q?cZPu/GwCYrJA9htFddx+bNKAzwqiY8Dd9UGqSSmWWqQlbWkpj1xGtHdmPv2p?=
 =?us-ascii?Q?hYiPEJyitBjPQM/GqroFccQhMsrdJ/OdlmgSzsaFuaypxF+U0NkpFCs7qNRs?=
 =?us-ascii?Q?gw+KH2HxnfQNOgNYalg7DxKNY+eWS721J4xBp+s68hCQiTq9B4mDLPeW9Owq?=
 =?us-ascii?Q?JMHz3sfxnbH+TerTFJUAPSth2NRp34t1wuUxIyNhUqzgeZII65AUCSQcV5eK?=
 =?us-ascii?Q?zC6nNgouJffoITKEdxQ+6A6QFQYwlUD394Ek6eF/M8DSrUG5cc3g8MY1xg+J?=
 =?us-ascii?Q?Yqx29mtnk91DNEbl3NOPAZgufElxMpUHNzpvjMbHktJby7vhlpHYn1V2g6P3?=
 =?us-ascii?Q?/W1WxSQW4+rq/qYzFu92EjqZ9G+jSpIuqGT1YfwEiC14gIdRcWoEAHEsX1rk?=
 =?us-ascii?Q?hinJKMZNFHKD4YcSs7Nu3b4r2vS1gm1uf+lIwnyucyUJDD0VGhW3QITL9fW2?=
 =?us-ascii?Q?hCFlQf3K5mBfFUAPZx4szOqEpYaY2+Q2uuWqArJ8ou5KI5QP9G6XCb/5W+qb?=
 =?us-ascii?Q?2ZxfuCcZqDAqYuenche9AmiXNKikcibRDRCBQHVUAuwFphLGW7365hO3HScd?=
 =?us-ascii?Q?KWeJmX9f7fYTEf2104qTKRf4Hd1AlAeJYKW9WSrxcLTHleNt31zXrmHhox7a?=
 =?us-ascii?Q?lRkcrnVxoioE87Ki+nVDoFspbX6WUnGJ0vhKwMcviLYwtmTrqQVY+kfI7ztV?=
 =?us-ascii?Q?eAQrHzFJyBmE7+S0Aqs6W6rRolrWojN/uL7CaG5MQSk6riLMsVp/k8RydfA/?=
 =?us-ascii?Q?i0NbscMe/3B2JBE/e/1sEgOkPRURzhAEIIwf1Wn9X/j08nqD24Vv+Y2bN1pg?=
 =?us-ascii?Q?J2NIqsB7xwHjf9EO9ry2BLMY4L4Qj0wNg8Fn1fGWUaT0wSrNd7q4ekpjxbae?=
 =?us-ascii?Q?jtCzs6nRN4KKy2PGAeMvO8Q=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e587ba2d-86b5-4ad6-ea82-08dc1bd02a01
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 05:00:05.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0En8K7/fzhbbvkh2ervdoWUhcfdH/JRiWXlMNnHUiV+XvFu/WY4HNWZU5BqloIkoh/Rj+OW9K5QXJytl4QBJKC9aLaFi0NasK44tSqUdj6+PbvAYH5RE0lgbRH9TZz0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7865
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

For arm64/powerpc/riscv, there are at least four places in the common code
where the generic cpu_to_node() is called before it is initialized:
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
v1 --> v2:
	In order to fix the x86 compiling error, move the cpu_to_node()
       	from driver/base/arch_numa.c to driver/base/node.c.

	v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/896160.html

	An old different title patch:
	http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/895963.html

---
 drivers/base/node.c      | 11 +++++++++++
 include/linux/topology.h |  6 ++----
 init/main.c              | 29 +++++++++++++++++++++++++++--
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 1c05640461dd..477d58c12886 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -976,3 +976,14 @@ void __init node_dev_init(void)
 			panic("%s() failed to add node: %d\n", __func__, ret);
 	}
 }
+
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

