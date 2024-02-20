Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8F85CAA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:24:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UgYZZLGp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfYqN4sVDz3vct
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 09:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UgYZZLGp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::600; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfR1K4WPMz3cQm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 04:17:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4M+sz5envWScVYjmU7ne/7hYsu99wMXjycwJlJBSYkggP2SZdRpHHaOg+cpAeycAu4b40wlBd1Zwgii7Il+XW1aAFh3oHR+TVfMfgqkSsy1tB8Uhez3zi5Qv3eAo+g8z/1YACsSiltEaTOmdi5flKfyH/eHEC+WjQXS5VMAQ8mPcy7LL49y39Z/DV2xAVNesK/El7tqOJemQGng6V3t3Q7AddupHS5BCrBCucVdwtltNzkD77CG22vYSgmbxQPzoUbdhMpsqSSsb7Vy5kTbx0xEt2z3i5fHHb0ZASNcws+aMe473yTySGhWNIF+uy3rl+BJkeCmTG1n8BpGBKIqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zn7Cdv/hE7tDImP8Q7FT7F4wn3Jxa6COi5JJIJEBPQ=;
 b=QYKUsHjPapafVmoq4lbhS2FZbNHC7SgpTgS21Zn36cGF4XWZwn0pgeaTWwuZK4nLoJSqcetDwbv1TKRb3o6F+foGOsc8J+O9sx4XstkuIKTHW2RYayKmzaqQ5RQL801RLykbWZZYdAU2LBopqX1Wd8fFE9WX+KKZqm+M7K7432AT9mUP0c1nanhwIaqT8kUSkZLT+LCxIU0kmsZdqML8OhiX98RFLbFThMrpS7YOAFWRDDOIxu/SbSA/vlMiBudtfciXz35Gv5hyEdVooN5T/N0xEScLJYm9wcKKzMXxnTeSGc4Bta2dbiDyY98IXzi3U3sQW1SAc9qaRUT92+e1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zn7Cdv/hE7tDImP8Q7FT7F4wn3Jxa6COi5JJIJEBPQ=;
 b=UgYZZLGpvKCll6WzVEGghqVfehpGDE3Dln3V4qRPkS+tvMXIEDqCI1BWxy+QlEInStqCw+tunb+ZTzzwHtZXfDDxEjXIwqb1SMky1rSOoDIXvoZ21UdvDtjVdxW5ZNqX0yjwA3hC9Sro5SWyaxIPVfKBKsFtW1cmKp+Yw58XNJk=
Received: from BN8PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:d4::16)
 by CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 17:17:22 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::30) by BN8PR04CA0042.outlook.office365.com
 (2603:10b6:408:d4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 17:17:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 17:17:21 +0000
Received: from BLR5CG134614W.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 11:17:04 -0600
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 03/14] sched/core: Use TIF_NOTIFY_IPI to notify an idle CPU in TIF_POLLING mode of pending IPI
Date: Tue, 20 Feb 2024 22:44:46 +0530
Message-ID: <20240220171457.703-4-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220171457.703-1-kprateek.nayak@amd.com>
References: <20240220171457.703-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 0186f5ac-8e33-4c3d-0671-08dc3237ccae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ncHCayupuzmtB3AtAKoRY3cty31XhyLDo/3xPrfDWidenBe585b245/PFNNNuV3DkaV5Pe/xQ93dwP8naAMX5O9pBHeSR6bRKqU75A/alAYiSNaPdotwr9+USt6ppg7m0irux8100pf9HnhN0b6BsC49Dly8LMjfx5IT2Y/oay6j/6ZT0lClXjl5tzFl35naHty/EyLoXCAqQ2L2Oaqu8GBa7agAvtv7hDjpKUBYjjZvjJ4IcDbdnzRexC82F1hVgpQJnpWB4NepV9Ne12FbeibY0IlPu+OgxnDUd1lGVlANks28buXQCS7F3nM9RxVD15MAQPfery8l2Bl0jH8kkHISMcby6wUCmlyGgdn2d3aUkqk5Qmy4nPEtTYGKSxXLGjmJR9A0P29C82TDMZz4JtkHQUtLK9G1k9V4FjwPhFkigABnKpedMvd7/lqLeL5UnIfdV2Qd3Ptar35AH/V1AXjr2Dl+L4+CgfbkKZRI741Q8RL4e533Z8L9ApJVHnM6C0KDwJoX8eYLW1eGDdDQo2LuDs4/CqO3ky2nuiVRzvutOXEoZ9MJ+oCNHy/PBurZOf2UzvdJxQRwm+kS+NT56k/qQcRqh93Ir10tanXU4B4fy3a2exN4TKYI/JJs789B192StSWndQ9FtLsnGvA2Gw==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 17:17:21.7377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0186f5ac-8e33-4c3d-0671-08dc3237ccae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-openrisc@vger.kernel.org, Guo
 Ren <guoren@kernel.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>, David
 Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Tony Battersby <tonyb@cybernetics.com>, Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Mel
 Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Brian
 Gerst <brgerst@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-csky@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, K Prateek Nayak <kprateek.nayak@amd.com>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <gautham.shenoy@amd.com>

Problem statement
=================

When measuring IPI throughput using a modified version of Anton
Blanchard's ipistorm benchmark [1], configured to measure time taken to
perform a fixed number of smp_call_function_single() (with wait set to
1), an increase in benchmark time was observed between v5.7 and the
upstream kernel (v6.7-rc6).

Bisection pointed to commit b2a02fc43a1f ("smp: Optimize
send_call_function_single_ipi()") as the reason behind this increase in
runtime. Reverting the optimization introduced by the above commit fixed
the regression in ipistorm, however benchmarks like tbench and netperf
regressed with the revert, supporting the validity of the optimization.

Following are the benchmark results on top of tip:sched/core with the
optimization reverted on a dual socket 3rd Generation aMD EPYC system
(2 x 64C/128T) running with boost enabled and C2 disabled:

(tip:sched/core at tag "sched-core-2024-01-08" for all the testing done
below)

  ==================================================================
  Test          : ipistorm (modified)
  Units         : Normalized runtime
  Interpretation: Lower is better
  Statistic     : AMean
  cmdline	: insmod ipistorm.ko numipi=100000 single=1 offset=8 cpulist=8 wait=1
  ==================================================================
  kernel:			time [pct imp]
  tip:sched/core		1.00 [0.00]
  tip:sched/core + revert	0.81 [19.36]

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

Since a simple revert is not a viable solution, the changes in the code
path of call_function_single_prep_ipi(), with and without the
optimization were audited to better understand the effect of the commit.

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
								if (!need_resched()) {
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

On architectures that do not support the TIF_NOTIFY_IPI flag,
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
								if (!need_resched_or_ipi()) {
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
	csd_lock_wait() {					}
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

[ prateek: Split the changes into a separate patch, added the
  TIF_NEED_RESCHED optimization in notify_ipi_if_polling().
  TIF_WAKE_FLAG macro, commit log ]

Link: https://github.com/antonblanchard/ipistorm [1]
Link: https://lore.kernel.org/lkml/20240119084548.2788-1-kprateek.nayak@amd.com/ [2]
Link: https://lore.kernel.org/lkml/b4f5ac150685456cf45a342e3bb1f28cdd557a53.camel@linux.intel.com/ [3]
Link: https://lore.kernel.org/lkml/20240123211756.GA221793@maniforge/ [4]
Link: https://lore.kernel.org/lkml/CAKfTPtC446Lo9CATPp7PExdkLhHQFoBuY-JMGC7agOHY4hs-Pw@mail.gmail.com/ [5]
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
Signed-off-by: Gautham R. Shenoy <gautham.shenoy@amd.com>
Co-developed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 include/linux/sched/idle.h |  8 ++++----
 kernel/sched/core.c        | 41 ++++++++++++++++++++++++++++++--------
 kernel/sched/idle.c        | 16 +++++++++++----
 3 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/include/linux/sched/idle.h b/include/linux/sched/idle.h
index d739ab810e00..c22312087c30 100644
--- a/include/linux/sched/idle.h
+++ b/include/linux/sched/idle.h
@@ -58,8 +58,8 @@ static __always_inline bool __must_check current_set_polling_and_test(void)
 	__current_set_polling();
 
 	/*
-	 * Polling state must be visible before we test NEED_RESCHED,
-	 * paired by resched_curr()
+	 * Polling state must be visible before we test NEED_RESCHED or
+	 * NOTIFY_IPI paired by resched_curr() or notify_ipi_if_polling()
 	 */
 	smp_mb__after_atomic();
 
@@ -71,8 +71,8 @@ static __always_inline bool __must_check current_clr_polling_and_test(void)
 	__current_clr_polling();
 
 	/*
-	 * Polling state must be visible before we test NEED_RESCHED,
-	 * paired by resched_curr()
+	 * Polling state must be visible before we test NEED_RESCHED or
+	 * NOTIFY_IPI paired by resched_curr() or notify_ipi_if_polling()
 	 */
 	smp_mb__after_atomic();
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index db4be4921e7f..6fb6e5b75724 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -909,12 +909,30 @@ static inline bool set_nr_and_not_polling(struct task_struct *p)
 }
 
 /*
- * Atomically set TIF_NEED_RESCHED if TIF_POLLING_NRFLAG is set.
+ * Certain architectures that support TIF_POLLING_NRFLAG may not support
+ * TIF_NOTIFY_IPI to notify an idle CPU in TIF_POLLING mode of a pending
+ * IPI. On such architectures, set TIF_NEED_RESCHED instead to wake the
+ * idle CPU and process the pending IPI.
+ */
+#ifdef _TIF_NOTIFY_IPI
+#define _TIF_WAKE_FLAG _TIF_NOTIFY_IPI
+#else
+#define _TIF_WAKE_FLAG _TIF_NEED_RESCHED
+#endif
+
+/*
+ * Atomically set TIF_WAKE_FLAG when TIF_POLLING_NRFLAG is set.
+ *
+ * On architectures that define TIF_NOTIFY_IPI, the same is set in the
+ * idle task's thread_info to pull the CPU out of idle and process
+ * the pending interrupt. On architectures that don't support
+ * TIF_NOTIFY_IPI, TIF_NEED_RESCHED is set instead to notify the
+ * pending IPI.
  *
- * If this returns true, then the idle task promises to call
- * sched_ttwu_pending() and reschedule soon.
+ * If this returns true, then the idle task promises to process the
+ * call function soon.
  */
-static bool set_nr_if_polling(struct task_struct *p)
+static bool notify_ipi_if_polling(struct task_struct *p)
 {
 	struct thread_info *ti = task_thread_info(p);
 	typeof(ti->flags) val = READ_ONCE(ti->flags);
@@ -922,9 +940,16 @@ static bool set_nr_if_polling(struct task_struct *p)
 	do {
 		if (!(val & _TIF_POLLING_NRFLAG))
 			return false;
-		if (val & _TIF_NEED_RESCHED)
+		/*
+		 * If TIF_NEED_RESCHED flag is set in addition to
+		 * TIF_POLLING_NRFLAG, the CPU will soon fall out of
+		 * idle. Since flush_smp_call_function_queue() is called
+		 * soon after the idle exit, setting TIF_WAKE_FLAG is
+		 * not necessary.
+		 */
+		if (val & (_TIF_NEED_RESCHED | _TIF_WAKE_FLAG))
 			return true;
-	} while (!try_cmpxchg(&ti->flags, &val, val | _TIF_NEED_RESCHED));
+	} while (!try_cmpxchg(&ti->flags, &val, val | _TIF_WAKE_FLAG));
 
 	return true;
 }
@@ -937,7 +962,7 @@ static inline bool set_nr_and_not_polling(struct task_struct *p)
 }
 
 #ifdef CONFIG_SMP
-static inline bool set_nr_if_polling(struct task_struct *p)
+static inline bool notify_ipi_if_polling(struct task_struct *p)
 {
 	return false;
 }
@@ -3918,7 +3943,7 @@ void sched_ttwu_pending(void *arg)
  */
 bool call_function_single_prep_ipi(int cpu)
 {
-	if (set_nr_if_polling(cpu_rq(cpu)->idle)) {
+	if (notify_ipi_if_polling(cpu_rq(cpu)->idle)) {
 		trace_sched_wake_idle_without_ipi(cpu);
 		return false;
 	}
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index fcc734f45a2a..b91dc1f62a56 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -315,13 +315,13 @@ static void do_idle(void)
 	}
 
 	/*
-	 * Since we fell out of the loop above, we know TIF_NEED_RESCHED must
-	 * be set, propagate it into PREEMPT_NEED_RESCHED.
+	 * Since we fell out of the loop above, TIF_NEED_RESCHED may be set.
+	 * Propagate it into PREEMPT_NEED_RESCHED.
 	 *
 	 * This is required because for polling idle loops we will not have had
 	 * an IPI to fold the state for us.
 	 */
-	preempt_set_need_resched();
+	preempt_fold_need_resched();
 	tick_nohz_idle_exit();
 	__current_clr_polling();
 
@@ -338,7 +338,15 @@ static void do_idle(void)
 	 */
 	current_clr_notify_ipi();
 	flush_smp_call_function_queue();
-	schedule_idle();
+
+	/*
+	 * When NEED_RESCHED is set, the idle thread promises to call
+	 * schedule_idle(). schedule_idle() can be skipped when an idle CPU
+	 * was woken up to process an IPI that does not queue a task on the
+	 * idle CPU, facilitating faster idle re-entry.
+	 */
+	if (need_resched())
+		schedule_idle();
 
 	if (unlikely(klp_patch_pending(current)))
 		klp_update_patch_state(current);
-- 
2.34.1

