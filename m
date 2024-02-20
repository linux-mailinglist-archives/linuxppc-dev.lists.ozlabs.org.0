Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC31F85CA98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:22:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xJyV9Ek9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfYmr680Rz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 09:22:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xJyV9Ek9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::600; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfQzV4Q7zz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 04:16:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnW7P3tEvkDe9SC40TjO7XmiQ0hmhvXSo3WV3spHhUbzSed0r9GHickJVStbzhuJcgIta58BMW4urryz95IUk/syOQ5ZSpCO+WGQ1hvFF5l4lk15fjXqxGq//G4rLYsZ4hBwGfLSynmrxB4TyLHSDg5WisYNmOCYWo668GXbNK1DkbuPIPkvTAOHlg3WF5KSp3YJjKz/m3Vk4PBx4zeDPzxj0upILw4ilYa7If9aTirFy34GUbTdj5A9BJ6X86oODaqi3LnZHOsC7vV9uBndBAYFA19z23NQfgUYZourykQufOAHswu/P6h3gLSI17sg2N3SavlfWyPq58n5oENB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rErl6Jmu5BIFGn8Hi3bu7+XDakfM4Z4iit7x6OM3jZE=;
 b=NeiuuPp4VVw7qqjI86xo5GkD9nBPB6Jz8w5px1Fnlw1sBuMCmlq4iCW/l//b8H6J3e7v6kuEWw4TzApp0A7/IJ1DRgyptSuVxqiXt42UI5E0QpktlqTMd9bsqM5TPUcwqGDr/pmokAOW3Ybzn5r7HN9OkMbpdf9994dJh3f43zoFNtXanV1iJTrdul+886sWEeyfd+PzYkRSlrw0oCH8WVcwQKSq0Y9Z8OX4rxJ59G/wtw228gdxUAM8AQrm4D/GZlR3XF+XzV+8troG+jS0CRJM43ChTDRHqhUGLIsbtq0S2t4GqcdtaXnLnfOpPKmP+0M4hzpjRcSUM/I7zKvTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rErl6Jmu5BIFGn8Hi3bu7+XDakfM4Z4iit7x6OM3jZE=;
 b=xJyV9Ek9kgBBklSBU3bU/2mG6NnTr2Gsk/3V+FerobRthxaKfF3xayiys/LSZGfT+Mlg/28ttcILeMz1iv/SONbgXJ7Ny+auK8VX6gtNeyz11yeqaDDs8VRAej2btYpv26PuSr/08DJlGRoWLY+v8Ldnmt9dkRyh9cimygrkxDI=
Received: from BN0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:408:e6::28)
 by PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 17:15:39 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::4b) by BN0PR03CA0023.outlook.office365.com
 (2603:10b6:408:e6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 17:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 17:15:38 +0000
Received: from BLR5CG134614W.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 11:15:21 -0600
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 00/14] Introducing TIF_NOTIFY_IPI flag
Date: Tue, 20 Feb 2024 22:44:43 +0530
Message-ID: <20240220171457.703-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|PH0PR12MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: ae640750-660a-4f87-dd67-08dc32378f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	k4pnYz5Jqm0hkNOYWIH290dX+dYbIoLMgMluJk/FBc4jM/dbEvRKvfe6W3qk+cGIrMPI5xUlDkdsEcR7OzzHXaXDUaZ5lB/ipe+ZZFtDPfUCki+9WDSdZ44wrlAvA1KgEKtpMbj3yN/NXXznTs8Qd7Iik9r29I9qL4l5dRmHhtjbSYFJmXqyGK0LgLWGqhte7l9oDtGaqPaLOgFNozdzoFFVgQ8rXWsX5PHEcZId2jUBuj/nmoVgIM5bIWIwS7J4sllrnVTgqKj2poQpQXbG0vWYTHMMWXS7zB+aJV08+eD74ZyG/Yj0omKLbFqdHt6u4/mV9/ZFUSbrM2Pje6aYWo2INWQLbIcM6mFmiuOcJbGe0PDDX3ofNd4qNcMX8PZLbIAMD7sgKOhOsDPEFSwsyiQX3ZM5kyofIE0RjZ7/zyTghMTCNl5SZnM8wsCXJr7iT90UO8hxHNmo4aL1i5EuVhTevAgS0tpNa0RK8R2muCGF+AsYT+Evwq5zEXLhusyGFnqMbfXLjVRlw6cnYYYjoUuXFcHvIEQR8ZOMSf458b/EnRDX5WBx75SGif4enA49Hg7jvJOqqYeAzYnxNkU3k5kj9811KtxDxZdarmrfYx7vf18nSidEbqdKVDkI2dLaO3skLfosxuOhzCZVu7WE9w==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 17:15:38.8320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae640750-660a-4f87-dd67-08dc32378f57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799
X-Mailman-Approved-At: Wed, 21 Feb 2024 09:21:41 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>, David
 Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Tony Battersby <tonyb@cybernetics.com>, Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, sparclinux@vger.kernel.org, Mel
 Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Brian
 Gerst <brgerst@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-csky@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal
 Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, K Prateek Nayak <kprateek.nayak@amd.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello everyone,

Before jumping into the issue, let me clarify the Cc list. Everyone have
been cc'ed on Patch 0 through Patch 3. Respective arch maintainers,
reviewers, and committers returned by scripts/get_maintainer.pl have
been cc'ed on the respective arch side changes. Scheduler and CPU Idle
maintainers and reviewers have been included for the entire series. If I
have missed anyone, please do add them. If you would like to be dropped
from the cc list, wholly or partially, for the future iterations, please
do let me know.

With that out of the way ...

Problem statement
=================

When measuring IPI throughput using a modified version of Anton
Blanchard's ipistorm benchmark [1], configured to measure time taken to
perform a fixed number of smp_call_function_single() (with wait set to
1), an increase in benchmark time was observed between v5.7 and the
current upstream release (v6.7-rc6 at the time of encounter).

Bisection pointed to commit b2a02fc43a1f ("smp: Optimize
send_call_function_single_ipi()") as the reason behind this increase in
runtime.


Experiments
===========

Since the commit cannot be cleanly reverted on top of the current
tip:sched/core, the effects of the optimizations were reverted by:

1. Removing the check for call_function_single_prep_ipi() in
   send_call_function_single_ipi(). With this change
   send_call_function_single_ipi() always calls
   arch_send_call_function_single_ipi()

2. Removing the call to flush_smp_call_function_queue() in do_idle()
   since every smp_call_function, with (1.), would unconditionally send
   an IPI to an idle CPU in TIF_POLLING mode.

Following is the diff of the above described changes which will be
henceforth referred to as the "revert":

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 31231925f1ec..735184d98c0f 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -332,11 +332,6 @@ static void do_idle(void)
	 */
	smp_mb__after_atomic();
 
-	/*
-	 * RCU relies on this call to be done outside of an RCU read-side
-	 * critical section.
-	 */
-	flush_smp_call_function_queue();
	schedule_idle();
 
	if (unlikely(klp_patch_pending(current)))
diff --git a/kernel/smp.c b/kernel/smp.c
index f085ebcdf9e7..2ff100c41885 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -111,11 +111,9 @@ void __init call_function_init(void)
 static __always_inline void
 send_call_function_single_ipi(int cpu)
 {
-	if (call_function_single_prep_ipi(cpu)) {
-		trace_ipi_send_cpu(cpu, _RET_IP_,
-				   generic_smp_call_function_single_interrupt);
-		arch_send_call_function_single_ipi(cpu);
-	}
+	trace_ipi_send_cpu(cpu, _RET_IP_,
+			   generic_smp_call_function_single_interrupt);
+	arch_send_call_function_single_ipi(cpu);
 }
 
 static __always_inline void
--

With the revert, the time taken to complete a fixed set of IPIs using
ipistorm improves significantly. Following are the numbers from a dual
socket 3rd Generation EPYC system (2 x 64C/128T) (boost on, C2 disabled)
running ipistorm between CPU8 and CPU16:

cmdline: insmod ipistorm.ko numipi=100000 single=1 offset=8 cpulist=8 wait=1

(tip:sched/core at tag "sched-core-2024-01-08" for all the testing done
below)

  ==================================================================
  Test          : ipistorm (modified)
  Units         : Normalized runtime
  Interpretation: Lower is better
  Statistic     : AMean
  ==================================================================
  kernel:			time [pct imp]
  tip:sched/core		1.00 [0.00]
  tip:sched/core + revert	0.81 [19.36]

Although the revert improves ipistorm performance, it also regresses
tbench and netperf, supporting the validity of the optimization.
Following are netperf and tbench numbers from the same machine comparing
vanilla tip:sched/core and the revert applied on top:

  ==================================================================
  Test          : tbench
  Units         : Normalized throughput
  Interpretation: Higher is better
  Statistic     : AMean
  ==================================================================
  Clients:    tip[pct imp](CV)       revert[pct imp](CV)
      1     1.00 [  0.00]( 0.24)     0.91 [ -8.96]( 0.30)
      2     1.00 [  0.00]( 0.25)     0.92 [ -8.20]( 0.97)
      4     1.00 [  0.00]( 0.23)     0.91 [ -9.20]( 1.75)
      8     1.00 [  0.00]( 0.69)     0.91 [ -9.48]( 1.56)
     16     1.00 [  0.00]( 0.66)     0.92 [ -8.49]( 2.43)
     32     1.00 [  0.00]( 0.96)     0.89 [-11.13]( 0.96)
     64     1.00 [  0.00]( 1.06)     0.90 [ -9.72]( 2.49)
    128     1.00 [  0.00]( 0.70)     0.92 [ -8.36]( 1.26)
    256     1.00 [  0.00]( 0.72)     0.97 [ -3.30]( 1.10)
    512     1.00 [  0.00]( 0.42)     0.98 [ -1.73]( 0.37)
   1024     1.00 [  0.00]( 0.28)     0.99 [ -1.39]( 0.43)

  ==================================================================
  Test          : netperf
  Units         : Normalized Througput
  Interpretation: Higher is better
  Statistic     : AMean
  ==================================================================
  Clients:         tip[pct imp](CV)       revert[pct imp](CV)
   1-clients     1.00 [  0.00]( 0.50)     0.89 [-10.51]( 0.20)
   2-clients     1.00 [  0.00]( 1.16)     0.89 [-11.10]( 0.59)
   4-clients     1.00 [  0.00]( 1.03)     0.89 [-10.68]( 0.38)
   8-clients     1.00 [  0.00]( 0.99)     0.89 [-10.54]( 0.50)
  16-clients     1.00 [  0.00]( 0.87)     0.89 [-10.92]( 0.95)
  32-clients     1.00 [  0.00]( 1.24)     0.89 [-10.85]( 0.63)
  64-clients     1.00 [  0.00]( 1.58)     0.90 [-10.11]( 1.18)
  128-clients    1.00 [  0.00]( 0.87)     0.89 [-10.94]( 1.11)
  256-clients    1.00 [  0.00]( 4.77)     1.00 [ -0.16]( 3.45)
  512-clients    1.00 [  0.00](56.16)     1.02 [  2.10](56.05)

Since a simple revert is not a viable solution, we delved deeper into
the changes in the execution path with call_function_single_prep_ipi()
check.


Effects of call_function_single_prep_ipi()
==========================================

To pull a TIF_POLLING thread out of idle to process an IPI, the sender
sets the TIF_NEED_RESCHED bit in the idle task's thread info in
call_function_single_prep_ipi() and avoids sending an actual IPI to the
target. As a result, the scheduler expects a task to be enqueued when
exiting the idle path. This is not the case with non-polling idle states
where the idle CPU exits the non-polling idle state to process the
interrupt, and since need_resched() returns false, soon goes back to
idle again.

When TIF_NEED_RESCHED flag is set, do_idle() will call schedule_idle(),
a large part of which runs with local IRQ disabled. In case of ipistorm,
when measuring IPI throughput, this large IRQ disabled section delays
processing of IPIs. Further auditing revealed that in absence of any
runnable tasks, pick_next_task_fair(), which is called from the
pick_next_task() fast path, will always call newidle_balance() in this
scenario, further increasing the time spent in the IRQ disabled section.

Following is the crude visualization of the problem with relevant
functions expanded:
--
CPU0							CPU1
====							====
							do_idle() {
								__current_set_polling();
								...
								monitor(addr);
								if (!need_resched())
									mwait() {
									/* Waiting */
smp_call_function_single(CPU1, func, wait = 1) {				...
	...									...
	set_nr_if_polling(CPU1) {						...
		/* Realizes CPU1 is polling */					...
		try_cmpxchg(addr,						...
			    &val,						...
			    val | _TIF_NEED_RESCHED);				...
	} /* Does not send an IPI */						...
	...								} /* mwait exit due to write at addr */
	csd_lock_wait() {					} 
	/* Waiting */						preempt_set_need_resched();
		...						__current_clr_polling();
		...						flush_smp_call_function_queue() {
		...							func();
	} /* End of wait */					}
}								schedule_idle() {
									...
									local_irq_disable();
smp_call_function_single(CPU1, func, wait = 1) {			...
	...								...
	arch_send_call_function_single_ipi(CPU1);			...
						\			...
						 \			newidle_balance() {
						  \				...
					      /* Delay */			...
						    \			}
					     	     \			...
						      \-------------->	local_irq_enable();
									/* Processes the IPI */
--


Skipping newidle_balance()
==========================

In an earlier attempt to solve the challenge of the long IRQ disabled
section, newidle_balance() was skipped when a CPU waking up from idle
was found to have no runnable tasks, and was transitioning back to
idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
may be viable for CPUs that are idling with tick enabled, where the
newidle_balance() has the opportunity to pull tasks onto the idle CPU.

Vincent [5] pointed out a case where the idle load kick will fail to
run on an idle CPU since the IPI handler launching the ILB will check
for need_resched(). In such cases, the idle CPU relies on
newidle_balance() to pull tasks towards itself.

Using an alternate flag instead of NEED_RESCHED to indicate a pending
IPI was suggested as the correct approach to solve this problem on the
same thread.


Proposed solution: TIF_NOTIFY_IPI
=================================

Instead of reusing TIF_NEED_RESCHED bit to pull an TIF_POLLING CPU out
of idle, TIF_NOTIFY_IPI is a newly introduced flag that
call_function_single_prep_ipi() sets on a target TIF_POLLING CPU to
indicate a pending IPI, which the idle CPU promises to process soon.

On architectures that do not support the TIF_NOTIFY_IPI flag (this
series only adds support for x86 and ARM processors for now),
call_function_single_prep_ipi() will fallback to setting
TIF_NEED_RESCHED bit to pull the TIF_POLLING CPU out of idle.

Since the pending IPI handlers are processed before the call to
schedule_idle() in do_idle(), schedule_idle() will only be called if the
IPI handler have woken / migrated a new task on the idle CPU and has set
TIF_NEED_RESCHED bit to indicate the same. This avoids running into the
long IRQ disabled section in schedule_idle() unnecessarily, and any
need_resched() check within a call function will accurately notify if a
task is waiting for CPU time on the CPU handling the IPI.

Following is the crude visualization of how the situation changes with
the newly introduced TIF_NOTIFY_IPI flag:
--
CPU0							CPU1
====							====
							do_idle() {
								__current_set_polling();
								...
								monitor(addr);
								if (!need_resched_or_ipi())
									mwait() {
									/* Waiting */
smp_call_function_single(CPU1, func, wait = 1) {				...
	...									...
	set_nr_if_polling(CPU1) {						...
		/* Realizes CPU1 is polling */					...
		try_cmpxchg(addr,						...
			    &val,						...
			    val | _TIF_NOTIFY_IPI);				...
	} /* Does not send an IPI */						...
	...								} /* mwait exit due to write at addr */
	csd_lock_wait() {					... 
	/* Waiting */						preempt_fold_need_resched(); /* fold if NEED_RESCHED */
		...						__current_clr_polling();
		...						flush_smp_call_function_queue() {
		...							func(); /* Will set NEED_RESCHED if sched_ttwu_pending() */
	} /* End of wait */					}
}								if (need_resched()) {
									schedule_idle();
smp_call_function_single(CPU1, func, wait = 1) {		}
	...							... /* IRQs remain enabled */
	arch_send_call_function_single_ipi(CPU1); ----------->  /* Processes the IPI */
--

Results
=======

With the TIF_NOTIFY_IPI, the time taken to complete a fixed set of IPIs
using ipistorm improves drastically. Following are the numbers from the
same dual socket 3rd Generation EPYC system (2 x 64C/128T) (boost on,
C2 disabled) running ipistorm between CPU8 and CPU16:

cmdline: insmod ipistorm.ko numipi=100000 single=1 offset=8 cpulist=8 wait=1

  ==================================================================
  Test          : ipistorm (modified)
  Units         : Normalized runtime
  Interpretation: Lower is better
  Statistic     : AMean
  ==================================================================
  kernel:				time [pct imp]
  tip:sched/core			1.00 [0.00]
  tip:sched/core + revert		0.81 [19.36]
  tip:sched/core + TIF_NOTIFY_IPI	0.20 [80.99]

Same experiment was repeated on an dual socket ARM server (2 x 64C)
which too saw a significant improvement in the ipistorm performance:

  ==================================================================
  Test          : ipistorm (modified)
  Units         : Normalized runtime
  Interpretation: Lower is better
  Statistic     : AMean
  ==================================================================
  kernel:				time [pct imp]
  tip:sched/core			1.00 [0.00]
  tip:sched/core + TIF_NOTIFY_IPI	0.41 [59.29]

netperf and tbench results with the patch match the results on tip on
the dual socket 3rd Generation AMD system (2 x 64C/128T). Additionally,
hackbench, stream, and schbench too were tested, with results from the
patched kernel matching that of the tip.


Future Work
===========

Evaluate impact of newidle_balance() when scheduler tick hits an idle
CPU. The call to newidle_balance() will be skipped with the
TIF_NOTIFY_IPI solution similar to [2]. Counter argument for the case is
that if the idle state did not set the TIF_POLLING bit, the idle CPU
would not have called schedule_idle() unless the IPI handler set the
NEED_RESCHED bit.


Links
=====

[1] https://github.com/antonblanchard/ipistorm
[2] https://lore.kernel.org/lkml/20240119084548.2788-1-kprateek.nayak@amd.com/
[3] https://lore.kernel.org/lkml/b4f5ac150685456cf45a342e3bb1f28cdd557a53.camel@linux.intel.com/
[4] https://lore.kernel.org/lkml/20240123211756.GA221793@maniforge/
[5] https://lore.kernel.org/lkml/CAKfTPtC446Lo9CATPp7PExdkLhHQFoBuY-JMGC7agOHY4hs-Pw@mail.gmail.com/

This series is based on tip:sched/core at tag "sched-core-2024-01-08".
---
Gautham R. Shenoy (4):
  thread_info: Add helpers to test and clear TIF_NOTIFY_IPI
  sched: Define a need_resched_or_ipi() helper and use it treewide
  sched/core: Use TIF_NOTIFY_IPI to notify an idle CPU in TIF_POLLING
    mode of pending IPI
  x86/thread_info: Introduce TIF_NOTIFY_IPI flag

K Prateek Nayak (10):
  arm/thread_info: Introduce TIF_NOTIFY_IPI flag
  alpha/thread_info: Introduce TIF_NOTIFY_IPI flag
  openrisc/thread_info: Introduce TIF_NOTIFY_IPI flag
  powerpc/thread_info: Introduce TIF_NOTIFY_IPI flag
  sh/thread_info: Introduce TIF_NOTIFY_IPI flag
  sparc/thread_info: Introduce TIF_NOTIFY_IPI flag
  csky/thread_info: Introduce TIF_NOTIFY_IPI flag
  parisc/thread_info: Introduce TIF_NOTIFY_IPI flag
  nios2/thread_info: Introduce TIF_NOTIFY_IPI flag
  microblaze/thread_info: Introduce TIF_NOTIFY_IPI flag
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Guo Ren <guoren@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Tony Battersby <tonyb@cybernetics.com>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: David Vernet <void@manifault.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-pm@vger.kernel.org
---
 arch/alpha/include/asm/thread_info.h      |  2 ++
 arch/arm/include/asm/thread_info.h        |  3 ++
 arch/csky/include/asm/thread_info.h       |  2 ++
 arch/microblaze/include/asm/thread_info.h |  2 ++
 arch/nios2/include/asm/thread_info.h      |  2 ++
 arch/openrisc/include/asm/thread_info.h   |  2 ++
 arch/parisc/include/asm/thread_info.h     |  2 ++
 arch/powerpc/include/asm/thread_info.h    |  2 ++
 arch/sh/include/asm/thread_info.h         |  2 ++
 arch/sparc/include/asm/thread_info_32.h   |  2 ++
 arch/sparc/include/asm/thread_info_64.h   |  2 ++
 arch/x86/include/asm/mwait.h              |  2 +-
 arch/x86/include/asm/thread_info.h        |  2 ++
 arch/x86/kernel/process.c                 |  2 +-
 drivers/cpuidle/cpuidle-powernv.c         |  2 +-
 drivers/cpuidle/cpuidle-pseries.c         |  2 +-
 drivers/cpuidle/poll_state.c              |  2 +-
 include/linux/sched.h                     |  5 +++
 include/linux/sched/idle.h                | 12 +++----
 include/linux/thread_info.h               | 43 +++++++++++++++++++++++
 kernel/sched/core.c                       | 41 ++++++++++++++++-----
 kernel/sched/idle.c                       | 23 ++++++++----
 22 files changed, 133 insertions(+), 26 deletions(-)

-- 
2.34.1

