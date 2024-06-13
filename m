Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E321C907E95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:07:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AwLJe6nu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0c2n5SB4z3dTn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:07:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AwLJe6nu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::600; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0Vzq6pTgz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 04:19:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agjnf37f6yLy6ixU0EshA0EWtK6ui+Ft/4b7dpmENErM9MZr87otaAnPIauFVZIWa9cxPYWJZWhtqTgfE2+HAxJ5s72aCAR5fDROcvyyEz1tYZn959zB78APzqpt3/n7pI0Qw/eu9RQ1U/tib0QB5kiGL0vs6pnSryeaDyNlBCDTAnhr2j1BYj4AprFvHYSi7T6rVf4ZkmEbRUJjWjHYEX8Dg2K5kpGOB/r3eNR9kjQbFmrI+8b/Cu2In2LopQjJT+xKOaWTCJhtRjyRFDzRfrFcI9Le7wURl1sp9z9fD6xNWRK8tievTRzcIvRtz7HHk/ThF5F6gbNKSkbIuMkToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZlXvAdiHIqvQBEOLBXVueVNOHTmqlWFZbJ4L3Si/eo=;
 b=EmhM3ZVZCKL72zudHblM++NBvyLeaDD6b2hadxt9GzABuvY7/qtsPC63uwtoCEaf+8mc0gbYCAD9mi19NEGJtoAD1yBSdLl9VjvV4SoDSR+PfzRZ1xUM/ZrGqP5evGtBXNjd2tlCayPXsw7NvJ4m0GcDkOuRwvAqkF0Ofli7m5Ow4rOZC5O3XkeTyqUSESMHilY9Yt2ixE44Be00DzILkFF9vluG/l0TnXdCVSOF+XyGt2kIYoPTh0FTXz6Qd99Q6LQG7tfmoBoEUfvN9099L8r/NXE7IVv8/iPXn2VQAcaTN4WPvYsrTF2ZcemoZHcjbmtrOSMSUNTJJsrYEJ7SaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZlXvAdiHIqvQBEOLBXVueVNOHTmqlWFZbJ4L3Si/eo=;
 b=AwLJe6nuYVSLuYOXZQNdX2jdu4PY7Du7Cw8sDf0y3ELc/4yRPMwSpRKymPIHHVsIhOKsDqOcgs/Ttx6s15P7RMz+r+3xvaHalJ+QpW/2Bu2nMBT9O59Vj/cKVwfbAz7NZ3jUbkVR9RJjH333Zi7pVcJAXSwpzOKK47dAz5XYWQ0=
Received: from MN2PR02CA0034.namprd02.prod.outlook.com (2603:10b6:208:fc::47)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Thu, 13 Jun
 2024 18:18:43 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::43) by MN2PR02CA0034.outlook.office365.com
 (2603:10b6:208:fc::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Thu, 13 Jun 2024 18:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 18:18:43 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 13:18:22 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 03/14] sched/core: Use TIF_NOTIFY_IPI to notify an idle CPU in TIF_POLLING mode of pending IPI
Date: Thu, 13 Jun 2024 18:16:02 +0000
Message-ID: <20240613181613.4329-4-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613181613.4329-1-kprateek.nayak@amd.com>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|IA1PR12MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 026c0d2c-c4b2-409f-3970-08dc8bd54216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230035|7416009|1800799019|36860700008|82310400021;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?wpAcRtoaRu0FHZJuI5thsVcnXSdxajGxAyilAKnR2Qmjg815kf/WDm2lZLzs?=
 =?us-ascii?Q?98GXq5SU4AtXyp0lsTORmNBZ4djbAazEL+5FTBXctcIWKOMqX+ldoYx7jRLK?=
 =?us-ascii?Q?tJ/MmxXS//ztMIdhMCYvdrsVHkHjQXrOZ7GC1L4LB3chiLAlkp3ZWKuA7XIw?=
 =?us-ascii?Q?FKvd45cEokn7LGbl4enmsUPER3WDCeVSiTSc2R9n6IlvUu07KR3ndWdWht/W?=
 =?us-ascii?Q?RfJLH0FQl5aJK/+cKo3vPwsQZUbuQNIoWWtGQJyknbc1HZPiF3MKSFS4OjxC?=
 =?us-ascii?Q?jiqAEWBR/wrEzUvt8BkjabF0bg1sDxbRjTKpjDQ3EyPNpHKTLRZrgnAyW3To?=
 =?us-ascii?Q?hlqo9UJug/d8+173xQTq9FEJ506qar8TuX8oNtudSTc1XPWYjhKObVBTCIOx?=
 =?us-ascii?Q?HMbfcjHkldtvazrV3O/RievKgERqJD2ODDkwLftkgAidNqEIFQ89U8dd2WfH?=
 =?us-ascii?Q?27aIzZJBsEi4Y54eJFRpoV0Sgr7dT4Qy65+R9eJKYcNMh9ut9qTR+YtLIn4r?=
 =?us-ascii?Q?zx0S3jLZqW8YFsUaQtXWQQ+LHUQP5ee5jy9tu85ORNoaga1PrV5mVSCRoFW1?=
 =?us-ascii?Q?8DOShfRYM+GGq6fmob0Jv4HutTexEPFOfWS2MTWD68hYOT2HlSlQzDUyYy3G?=
 =?us-ascii?Q?2rG29Ij7xJM8Hoki0ec2wr7D8Aon+10PLrHuOJpQzZfzi+f4B6ML2ByVVbl3?=
 =?us-ascii?Q?E42DTqmmC9F044M+jmciBn59VolIOv1TwARUi5iN8UImT2q8Zk1qw1mn1MZX?=
 =?us-ascii?Q?fRz+c6ULmOFjaVGAiatVezVFMyO8ynNJ1lh42LH7IBV3jfWuJzYqOt65bCjr?=
 =?us-ascii?Q?Am83IcYVWXU7m+KTPoz70ZaVwBUwd/l+4wabt6wgnjyk94HLXsubh2OZZNZI?=
 =?us-ascii?Q?3o4sxjpQEbJWG4mzb6YkqJ2oZgmtDEA8gftV9u526wrxQj0WfNgIC2yoWLBz?=
 =?us-ascii?Q?hB0PCn5P+0GwzF8S49EUZCgtB766VvKaFeV156GTf/GCwTAMQXpXScJRPs4X?=
 =?us-ascii?Q?OWiseDgJCNDqZzYxbr9UF839Aqa7LEs++2Zf7T70/rDcrcykqSwjhlpelEPp?=
 =?us-ascii?Q?Yep2XbgViJ6WdAblbqQH6p1Zi57SfSDAAITj6MIKYw3/sdEHP785vOz+6p73?=
 =?us-ascii?Q?lQD19qyjACXxglZDgjKb+ngoNLo8iDajFFI1Hh7Qaf58orwWX/DISBU/aSfn?=
 =?us-ascii?Q?ny+eLkv1XIIKWuTA5Y0IfhwGS5uPRBrBdox9W9hXsFcDiIp1oTw2CO10kKa0?=
 =?us-ascii?Q?/zUJkJYbMLyouzguyK+6VmQ5rX/UM5f+d2gON9lUp+RXg5bcU/0u3AMkqVu+?=
 =?us-ascii?Q?WeEt9FdP7urAeCVK5XnNVxr/NrDPgXm5R18iqlik3x/wSBxarrNPaftu2feJ?=
 =?us-ascii?Q?EkkGkydv6igRfAcZndRpxaZIO8EHuq/X0Oy9Z0lY6L8M518eNe3jjb07dKjE?=
 =?us-ascii?Q?Ht8EQiOhN3Q=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230035)(7416009)(1800799019)(36860700008)(82310400021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 18:18:43.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026c0d2c-c4b2-409f-3970-08dc8bd54216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553
X-Mailman-Approved-At: Fri, 14 Jun 2024 08:01:41 +1000
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
Cc: Juri
 Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin
 Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony
 Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, sparclinux@vger.kernel.org, Mel Gorman <mgorman@suse.de>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Rik
 van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal
 Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

tip:sched/core was at commit c793a62823d1 ("sched/core: Drop spinlocks
on contention iff kernel is preemptible") at the time of testing.

  ==================================================================
  Test          : ipistorm (modified)
  Units         : Normalized runtime
  Interpretation: Lower is better
  Statistic     : AMean
  ==================================================================
  kernel:			time [pct imp]
  tip:sched/core		1.00 [baseline]
  tip:sched/core + revert	0.41 [60.00]

  ==================================================================
  Test          : tbench
  Units         : Normalized throughput
  Interpretation: Higher is better
  Statistic     : AMean
  ==================================================================
  Clients:     tip (CV)          revert (CV) [pct imp]
     1        1.00 (0.60)         0.90 (0.08) [-10%]
     2        1.00 (0.27)         0.90 (0.76) [-10%]
     4        1.00 (0.42)         0.90 (0.52) [-10%]
     8        1.00 (0.78)         0.91 (0.54) [ -9%]
    16        1.00 (1.70)         0.92 (0.39) [ -8%]
    32        1.00 (1.73)         0.91 (1.39) [ -9%]
    64        1.00 (1.09)         0.92 (1.60) [ -8%]
   128        1.00 (1.45)         0.95 (0.52) [ -5%]
   256        1.00 (0.96)         1.01 (0.28) [  1%]
   512        1.00 (0.32)         1.01 (0.20) [  1%]
  1024        1.00 (0.06)         1.01 (0.03) [  1%]

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
  tip:sched/core			1.00 [baseline]
  tip:sched/core + revert		0.40 [60.26]
  tip:sched/core + TIF_NOTIFY_IPI	0.46 [54.88]

netperf and tbench results with the patch match the results on tip on
the dual socket 3rd Generation AMD system (2 x 64C/128T). Additionally,
hackbench, stream, and schbench too were tested, with results from the
patched kernel matching that of the tip.

Additional benefits
===================

In nohz_csd_func(), the need_resched() check returns true when an idle
CPU in TIF_POLLING mode is woken up to do an idle load balance which
leads to the idle load balance bailing out early today since
send_call_function_single_ipi() ends up setting the TIF_NEED_RESCHED
flag to put the CPU out of idle and the flag is not cleared until
__schedule() is called much later in the call path.

With TIF_NOTIFY_IPI, this is no longer the case since TIF_NEED_RESCHED
is only set if there is a genuine need to call schedule() and not used
in an overloaded manner to notify a pending IPI.

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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Benjamin Gray <bgray@linux.ibm.com>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Xin Li <xin3.li@intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Tony Battersby <tonyb@cybernetics.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Leonardo Bras <leobras@redhat.com>
Cc: Imran Khan <imran.f.khan@oracle.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: David Vernet <void@manifault.com>
Cc: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: x86@kernel.org
Signed-off-by: Gautham R. Shenoy <gautham.shenoy@amd.com>
Co-developed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
v1..v2:
o Updated benchmark numbers.
---
 include/linux/sched/idle.h |  8 ++++----
 kernel/sched/core.c        | 41 ++++++++++++++++++++++++++++++--------
 kernel/sched/idle.c        | 16 +++++++++++----
 3 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/include/linux/sched/idle.h b/include/linux/sched/idle.h
index 497518b84e8d..4757a6ab5c2c 100644
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
index 0935f9d4bb7b..bb01b063320b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -911,12 +911,30 @@ static inline bool set_nr_and_not_polling(struct task_struct *p)
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
@@ -924,9 +942,16 @@ static bool set_nr_if_polling(struct task_struct *p)
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
@@ -939,7 +964,7 @@ static inline bool set_nr_and_not_polling(struct task_struct *p)
 }
 
 #ifdef CONFIG_SMP
-static inline bool set_nr_if_polling(struct task_struct *p)
+static inline bool notify_ipi_if_polling(struct task_struct *p)
 {
 	return false;
 }
@@ -3710,7 +3735,7 @@ void sched_ttwu_pending(void *arg)
  */
 bool call_function_single_prep_ipi(int cpu)
 {
-	if (set_nr_if_polling(cpu_rq(cpu)->idle)) {
+	if (notify_ipi_if_polling(cpu_rq(cpu)->idle)) {
 		trace_sched_wake_idle_without_ipi(cpu);
 		return false;
 	}
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 7de94df5d477..6748735156a7 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -329,13 +329,13 @@ static void do_idle(void)
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
 
@@ -352,7 +352,15 @@ static void do_idle(void)
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

