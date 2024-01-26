Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8E83D453
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 07:47:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bVzA8cbt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLpCD5hLvz3dRf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 17:47:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bVzA8cbt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2408::701; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2408::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLpBP70Rkz3d8G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 17:46:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6OPoHuWyzuRxGWEdZxTleqlDCBSUHoDxbhkr68WrFk60jMxfiRXdmnHK/3jHdmXbMsCj+GxIzNRtRe6GtNMKeW9QKpTYTJhkN4lk3UTPGcHUlEgflBnGZ6UbJcOqr1RaDt7p/qzXWWN79wE0B6Y4kUCZjtstLZlZzrsfyZ/cSmEsDYs9O1myPuoAnCCUNAKU3nE+dIgQAOyy3Gr43+9bxrRov2V0gKX9D1h9/V+P6M/1OALTqEYS1mzgj9d7I0aNfKBCUIxecz1/iRBcDNtwWAfR8kIyFmCoZGS91q+/eMiu/rzP7OyGfEUwGFq/O+/Cc52fHPFpxEK1nkxS3x1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOAf3CnbVK29Cn6jWD0XH4kFBsuVGGUcGaztFlNqUhw=;
 b=nzXR21AGdsKNPMO5XBGpIlkoaeD1gxV7VjXBbQP+hzVxvlUhBuRa91BNdnQkEL+O5EIP2X+ZoeJCmgGkrWd021SieoiiynzD0d4eS2Lj60q4vZoGzU0/2eWZ1Xp1NrD3hJ2XJ2j5Po76ATD418g1qSaShWezjqQZ2V4GdJrOM35Tkq8mEhep7EmPw8DYRCMg+7QlDQIJ6hGHgJxcqFeB2ATlNUuVCoqCxjjJQZ7ktECutmS+3ArBEhSLl6zfbHK5HUN+sorixljJ9wiZsjdDtansTcssVmJ4mCwZOg7QZEjChYpoaVfzTzESHVFcP9xBjT78zfK2UQ/caBGnOEsoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOAf3CnbVK29Cn6jWD0XH4kFBsuVGGUcGaztFlNqUhw=;
 b=bVzA8cbtA8yXHvzuAZuMMzn+uPPI6oLR9kFbgU50hp/TlCheJv/XBpWkch6rdVbYEPGSPfCBZF4ohxULjf1+BeOTktl7KO+uwIaON5MyTLXRdo6aIuNXci4fei6qGWkhtsGAVZ2zDZRrQLTQlSLNJtFGB5UVpcwz3gDCkOjiB0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SJ2PR01MB8633.prod.exchangelabs.com (2603:10b6:a03:578::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Fri, 26 Jan 2024 06:45:52 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7228.026; Fri, 26 Jan 2024 06:45:52 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v3] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
Date: Fri, 26 Jan 2024 14:44:51 +0800
Message-Id: <20240126064451.5465-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:610:38::34) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SJ2PR01MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f5a416-8f9e-4894-032d-08dc1e3a6ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+aaikH4PzmSumTK2/7YnsI4jah+SnYHE8ceXxr/ajUzhUDPcNhvRh+1w9DdtJ2lXiCQ7wCekoJvcsp5exA3NzNimLicZNdAn0/OU0jiZxqBR6N/y9/nrLghF/1r4YNa7AIUOxsixslb3fX41+jALdXSshcnTYcJ7HAD/4tQjvLxp1kQBDDxsMsiIGnfHU7uwEWzON6chC8h8gCjEV9zyVyg0Cu+2qzARXpPE8UceyVcnYdP+w1dYLAz9qi47OAKWp3gjHiHYpbKONso/6BeZOV6ivlreohB+nKaL5YXIozaDoX3iqpJN1YUG0uuOOul6TRL2+Z1Ddg3iHwTGXW87qt+a8HTvd60zPsy7uOs02L+W9xpi1aaRgdIFVtOqcdQ3+KKYhQM3tJn/LJjugAGe8t2OUK3Qn7uMVqGCnkttcx7GuO8Vpy7Gx4zvs11eIf0dJtnAPclIBx5onQQv2Tv87h4dSrKAtxSkikl0bX5WU9Oc38ZWoTNbUUKm52vphRWWRhS1K/3JEVkey8iiAqdYfbsqxBPrSmSDIcT6ykwsoF5HnGqW2Q+a7L0sNAmjw7Rgcklo53ifQMtjPQe3TCmu3u3ey8hpr8a62B1Dua/n8tQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6512007)(38100700002)(52116002)(6506007)(6486002)(1076003)(2616005)(107886003)(966005)(83380400001)(478600001)(26005)(316002)(6916009)(66556008)(4326008)(66946007)(8936002)(8676002)(66476007)(41300700001)(5660300002)(7416002)(86362001)(2906002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?W5B0HQkAVvvQcmwg05vkmY/8KGIhfDvAFmzTFQuz9Iu903EEv1ZSV1N6oQdv?=
 =?us-ascii?Q?ZLHxZOd0sdWcvumhiWoBykRyFMFDUfOeP0l5HYQdC7m8PFZTihaZJRgGNR33?=
 =?us-ascii?Q?DTPtPcFmaPJSidubCNx0GkSG/LqyiOKt0pnghEBw/D3nZaaJZ770McrWRi2f?=
 =?us-ascii?Q?XA5AccPC+2HvQkDg7MlbCW6bNgL5WYdxvbJi8jMD4pHmLKJOIRwUhet7al7b?=
 =?us-ascii?Q?8bXR+SjtmiNu7ngrymy7NcbbY1FZ++3DXi5TtrKDrgA8ARAqTQYbxtVOEecl?=
 =?us-ascii?Q?iLceAxZk10Xm5ETN+CuRfS//Z5xvU+hwsQ2YsudFkrcCw+5B0gZKuQexUZAh?=
 =?us-ascii?Q?LoMfJ2sB7z/H2ZLqvbQD6VR/7wfQQT/FM0Ug5OjVrNFxezFiNHeLiTAe5076?=
 =?us-ascii?Q?I/FXtD+mI2z38zAPLUZMXRN3iNfwbLBFoy5FCsoR6Qw5bopAhlXuMLq3V1Zx?=
 =?us-ascii?Q?wUAtxI5Jj3nFA2p+adHPBMijoSZNOeLCnnJNX0EOq9wiRoYZ1xP5l6RIai1K?=
 =?us-ascii?Q?u3p2e0BZlF1jlrFWX86lDtA8tKC106zsQ4wJyZn+MfDjxXP2NFueyEI3SYPK?=
 =?us-ascii?Q?iCCxrpK9aqzasuADwGCS6ebA3QJnEJqFSVNONLuUJZVopUz+HCXpYXfTNBEU?=
 =?us-ascii?Q?26uvUadXrJjosnk6nsKuThW0x75zXCztoCPPqIPk+3Q0cr9oXWqVRIhf7/Md?=
 =?us-ascii?Q?oDzXEjXR8rpSC4vwhN9NcYxSkAeu95MSUvhNCCn3YhyQ0TzgEX13vp6/EdX0?=
 =?us-ascii?Q?25wD+iRs8dLa3+03HAHjd57T+5Ov7FpCjKl5/neU8hdsNQnnlUU5ospVvP0G?=
 =?us-ascii?Q?q2rD+sUQU0UQYyg5HgBCV7lJQPfiAd1cwzav+uYanF9Kwa4l0xgIIqbJGHwz?=
 =?us-ascii?Q?B3ZLgPcExm5hmfps0yPygdiHdx7Dc8OSpo71VTQ8ALZ+fGqicIo2Tn2lO8VX?=
 =?us-ascii?Q?1TQB2jnkEBYuCBg7C02pPzpt7oz3Un55Eojt7YY7qJxAHCZxPAuKOFUDpAwa?=
 =?us-ascii?Q?KNuNPa3nUjV2NRXB/UxmAa5dPfQ1C6W3IuyW7sq8Kmc5Zym2IKfrfsvLGEhY?=
 =?us-ascii?Q?W3t9SIZvJwxF7r8Nl3nxMOhhPmOpdNz0/44B8mv/VE7f0J9j1ZVlKcH6tx/X?=
 =?us-ascii?Q?Un8bh8PzN4KS6QmW03BIPd0hOjeyAW408x1qfo6heKA5liIdfFGxP0+U+I+2?=
 =?us-ascii?Q?J/5MN520R7U72j+YspIFGj9PpwEEzxKCaUiCyNVY2Kcqr9Qjk1kHALjem1/Z?=
 =?us-ascii?Q?G0ui246t7djseSpRBSaj45AG2qYuNgrOSmRvL0z6EukdChsb9BSzpmIu/fpw?=
 =?us-ascii?Q?LozvieAu57co4+qvR+y6ppM/KYBn6PbGrBt+fjp8ZhRDwQIqCXAAd3KpWEeR?=
 =?us-ascii?Q?r8+nuFh72Y4AaAkP7TZy4O44yROLi2Zsv7D9nfsAF6kip5gWbLW67BePP/R+?=
 =?us-ascii?Q?ktWLVGVmJvWQ3FVJQS43sXq2BBBnYW8XY9qYXQ0giazNI4CIXaEJ+Rl7Qt9G?=
 =?us-ascii?Q?QdNCxa/jDfM6gCDmUaE6DwoYpHfEEgFW5k4j7Op+/UbgLmBvYyn8QMPKyYFD?=
 =?us-ascii?Q?eCP0tzwxaT7XrtViz99pClPRTffQPa3pw2CRXtXrnMwE0PFoBnbVOZSyhHwg?=
 =?us-ascii?Q?mGs2nh9wBInXt7/L9rqcQRo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f5a416-8f9e-4894-032d-08dc1e3a6ffa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 06:45:52.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaAw/CdxWD7i5gJM+U4JFysCfjvnLB/rnwjpzIbKXqZyVKiXphnEkwD5XT5RjjLUMPxPrR6bwn4JPJlG84eCUGQrYT6fEjhKDumkEdQTu4a+Aag82/Vojn5phkpp/qdM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8633
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

In order to fix the bug, the patch introduces early_numa_node_init()
which is called after smp_prepare_boot_cpu() in start_kernel.
early_numa_node_init will initialize the "numa_node" as soon as
the early_cpu_to_node() is ready, before the cpu_to_node() is called
at the first time.

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
v2 --> v3:
	Do not change the cpu_to_node to function pointer.
	Introduce early_numa_node_init() which initialize
	the numa_node at an early stage.

	v2: https://lore.kernel.org/all/20240123045843.75969-1-shijie@os.amperecomputing.com/
	
v1 --> v2:
	In order to fix the x86 compiling error, move the cpu_to_node()
       	from driver/base/arch_numa.c to driver/base/node.c.

	v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/896160.html

	An old different title patch:
	http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/895963.html

---
 init/main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/init/main.c b/init/main.c
index e24b0780fdff..39efe5ed58a0 100644
--- a/init/main.c
+++ b/init/main.c
@@ -870,6 +870,19 @@ static void __init print_unknown_bootoptions(void)
 	memblock_free(unknown_options, len);
 }
 
+static void __init early_numa_node_init(void)
+{
+#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
+#ifndef cpu_to_node
+	int cpu;
+
+	/* The early_cpu_to_node() should be ready here. */
+	for_each_possible_cpu(cpu)
+		set_cpu_numa_node(cpu, early_cpu_to_node(cpu));
+#endif
+#endif
+}
+
 asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
 void start_kernel(void)
 {
@@ -900,6 +913,7 @@ void start_kernel(void)
 	setup_nr_cpu_ids();
 	setup_per_cpu_areas();
 	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
+	early_numa_node_init();
 	boot_cpu_hotplug_init();
 
 	pr_notice("Kernel command line: %s\n", saved_command_line);
-- 
2.40.1

