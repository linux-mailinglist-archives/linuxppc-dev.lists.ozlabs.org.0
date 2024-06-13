Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4EA907E89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:05:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y0K2zHMI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0c0F5r77z3fpw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:05:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=y0K2zHMI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0Vxd27m9z3cTD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 04:17:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+GudIAsJ1+8xaHpRPj0pHbosXTpZjIGo8kHM+hIvSyQFMqVfdYMXdfC2Nhz07U2+weQb2AcSlRYJllVukbqayWRkQH5grKfS7xkKoj60v1rnj+2yQlSxikTnC1fW+PNd4A44efHU/kq5M1XI+6UyTh2axUDgOSLb85u1NKvF/gxO7YtWABAJ/Yx7trTwXxm+zfYijMTPiq5VG9wwiUTXca/2qNcgH/sJNVgOR96o43CcmfYgDvZYuZicuvmG6o8GlTmMTsO4D8rTBPNfGWjC6mDYVcOJr0dfnZANOrK5e9QDqr0A9wUET1kCXRFdr68SSXwv8NEwBjC8/+Ce0+hng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfIsVeiKvKscULBMTqZnvC96rGKpFn0xMgkcpFsrURE=;
 b=D02FAthgXCMBlS+hhVUc46nQb5XgL232TIWwCSkWQmU3ftD0ZM8Zw2m/hRytXdB2Tsmn5vZVSx8JW4FR9zu7BknrcvrGLRCN9qPHANw7a06WD7V7JMld3FB3ORj/ZKNpCAI3MGaNpjJ2WSCfCac/tQ9v9XeShvgVv4/b89xumgyWEoJ7cEZsPIwoRxmxzqjbCcV9lmHvYlcuxmSo/s2TsCedFAf54eXqtJx5oH2mR3czOnWPO5OPKia245DSn5bIOTydrao475J2P84oz89whI+3zkmjhT1GBGIMcy2gBGLK2lWdzvaniVGn277HbHks9XoadEV0vNAKf/ndED0MFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfIsVeiKvKscULBMTqZnvC96rGKpFn0xMgkcpFsrURE=;
 b=y0K2zHMIO/I7SxN47r1ehHDQ+AHVHM5z+M8vuiWNmIwL+xc3Ywl6GseRlANhVLjRygu2XGN52RWL2/mUIm96oTiYiGFqiHk9Gwc7VE1THVfvd7iMLEs7SwN6mF6FXPdIhCfFw0G7dZAy7Xik2g/QffVXTD3GPGKLeBrDhK6OvwM=
Received: from MN2PR14CA0015.namprd14.prod.outlook.com (2603:10b6:208:23e::20)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 18:16:59 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::b3) by MN2PR14CA0015.outlook.office365.com
 (2603:10b6:208:23e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Thu, 13 Jun 2024 18:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 18:16:58 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 13:16:35 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Date: Thu, 13 Jun 2024 18:15:59 +0000
Message-ID: <20240613181613.4329-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c4f355-62b7-49c3-7413-08dc8bd503e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230035|376009|7416009|1800799019|36860700008|82310400021;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?IhmNf8DbcmHaACJns0jtJIgk4HrFTbnmO37dKWdMtKb2fctpNcr0S81NHwM/?=
 =?us-ascii?Q?O8mMjPmKoN4yO58z3iSTXUqihyezECPoowDcK0aMiaeikhr1u/vvXTSXVEFW?=
 =?us-ascii?Q?Hk7ONMQBQauyIESr+lPTThTqeofykvlsLccTihqDlTlt5JwA9xrgFU+p/BBz?=
 =?us-ascii?Q?iV2Xs7SgDf57aVGQM9yO9gmSJaJo+WKuUxLOnylnyWSz968msZPu7xyL7vkr?=
 =?us-ascii?Q?XKY92fI8caKJh+YDdGr0zZ6xmNzn7r4t0k+4Zb2kOAUGkRq46S5YyYvzQ4Cj?=
 =?us-ascii?Q?cdADGr8GjtsdqP4l9rwqi5dXgsen8uGT2RAFm0tB1rKthNlbOEM/ai5+M1OD?=
 =?us-ascii?Q?rTDbGhacGAATlb886m8OCD1xYAsZ9RYjZgyWVDfO8EsjUh7HRDuwd249bo4f?=
 =?us-ascii?Q?D7vb988G1P9WxpeaeL664v/6pH8BDT4wdlknNV/BG1Fb2IQ0tfI5G96XD9wX?=
 =?us-ascii?Q?ya4rtn4lJ9USYoO+BXwJEcpqNup0IkpaMaAOIkhIVHph4JrXUW+Pcf939iEv?=
 =?us-ascii?Q?YrM9nkzGfSPnUmalgw2dGMai/3GQpseVwaQXdexi1/TF2jQSo22b1V7GsycG?=
 =?us-ascii?Q?QDQeJlwu4VqCkmroaSQCe0dpgLbEbXIKISWmaM/l0SM9K2kNqFb73QUqHOjv?=
 =?us-ascii?Q?0rGMA0iYZYWUnO/ogrtfV+7yg+a+42wTFBZKkwISlVR06CL5+JQYZnork8pp?=
 =?us-ascii?Q?E2f+z7cCGeD8TIKOdFDWhQ48WjOKKelaB8+bXf71l/1nROzGFKhmUKjBHHBS?=
 =?us-ascii?Q?T6PggsCic/ADXrJRZ3+4GjgIKXaEmJsCHEZ5GyayPRpAeZNzvw41E1PBCzWg?=
 =?us-ascii?Q?DXANRktl7x51TKNy/v7UoUtKqG/HN/+tYMMFeYgInOqVz1X7izwzlBYYwCYJ?=
 =?us-ascii?Q?ggh8pPIekcrWTVTslXW0QnvP5AKuhYTk9QobxW7Gdxuk/Bs0sah7Jgoz5hIC?=
 =?us-ascii?Q?+xCxYMHb5JCcZddmo0ZhmeU/LMT16D8NzNyxkwwboKlB98f+fhHK+bzJHDOr?=
 =?us-ascii?Q?VTcM7rKV6d+gOu3UHiWrT6UttH7obkbBs98zEl4Kaj8Pu5dVMf5agL62S9j+?=
 =?us-ascii?Q?hG7RjC0iPS9nv5+3JH+plXmvqfZHHjh/etrFWwiwiHJ+l67dwE+sGnvYP4dq?=
 =?us-ascii?Q?N9wybpu4q3EJvtA98ELprdksKAV53b720IWEgdKvIT/KOs4C4OQRKiEVnS0K?=
 =?us-ascii?Q?iyWLvUKXu/UO+OMn7VEF+jGN8Q+r2RCWA6cKTQo96xZwD6fokiPsE/aTN4qC?=
 =?us-ascii?Q?VJBTIDAD1MSAsGDMumhTwfU2WngLGR7jr1HJRxjG5kyj3BJQxAnJiG6Vjtzh?=
 =?us-ascii?Q?ZjlXkEbjwZWy796aUszZxcQg9aBDl1yJEGc7Z/rpnTjEvDTqV4a0GtwVWy2x?=
 =?us-ascii?Q?KTEFaq6/Tg+ABwPiIhwlUADcMpbWCLZpfwriXH3wwSiXxKqXSiclqJLJmHaS?=
 =?us-ascii?Q?tqs7U4cUdr8=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230035)(376009)(7416009)(1800799019)(36860700008)(82310400021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 18:16:58.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c4f355-62b7-49c3-7413-08dc8bd503e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722
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

Hello everyone,

Before jumping into the issue, let me clarify the Cc list. Everyone have
been cc'ed on Patch 0 through Patch 3. Respective arch maintainers,
reviewers, and committers returned by scripts/get_maintainer.pl have
been cc'ed on the respective arch side changes. Scheduler and CPU Idle
maintainers and reviewers have been included for the entire series. If I
have missed anyone, please do add them. If you would like to be dropped
from the cc list, wholly or partially, for the future iterations, please
do let me know.

As long as the first three patches are applied in-order, the arch
specific enablement can be applied independently and out-of-order since
the TIF_NOTIFY_IPI flag is not used until Patch 3 and Patch 2 preps the
complete tree to handle a break out of TIF_POLLING_NRFLAG state with the
setting of either TIF_NOTIFY_IPI or TIF_NEED_RESCHED.

Quick changelog and addressing concerns from v1
===============================================

v1: https://lore.kernel.org/lkml/20240220171457.703-1-kprateek.nayak@amd.com/

v1..v2:

o Rebased the series on latest tip:sched/core at commit c793a62823d1
  ("sched/core: Drop spinlocks on contention iff kernel is preemptible")
  Fixed a conflict with commit edc8fc01f608 ("x86: Fix
  CPUIDLE_FLAG_IRQ_ENABLE leaking timer reprogram") that touched
  mwait_idle_with_hints() in arch/x86/include/asm/mwait.h

o Dropping the ARM results since I never got my hands on the ARM64
  system I used in my last testing. If I do manage to get my hands on it
  again, I'll rerun the experiments and share the results on the thread.
  To test the case where TIF_NOTIFY_IPI is not enabled for a particular
  architecture, I applied the series only until Patch 3 and tested the
  same on my x86 machine with a WARN_ON_ONCE() in do_idle() to check if
  tif_notify_ipi() ever return true and then repeated the same with
  Patch 4 applied.

o Updated benchmark results based on the latest base.

o Collected the Ack from Guo Ren for CSKY enablement.

o Dropped the RFC tag.

o Unfortunately, the series does not solve the issue highlighted by
  Julia Lawall w.r.t. NUMA Balancing in [0] based on her testing of v1.
  However, she did highlight a possible regression last time around
  where compiling a single file took much longer with the series but I
  could not reproduce it on my end. For sanity, I did rerun the same
  experiment this time around and I could not see any difference.
  Following are the numbers for

  $ make clean
  $ time make kernel/sched/core.o

  ---> tip:sched/core
  
    -j1
    
    real    0m32.734s
    user    0m25.158s
    sys     0m6.750s
    
    -j256
    
    real    0m7.181s
    user    0m27.509s
    sys     0m7.876s
    
  --> tip:sched/core + TIF_NOTIFY_IPI
  
    -j1
    
    real    0m32.408s
    user    0m24.826s
    sys     0m6.767s
    
    -j256
    
    real    0m7.187s
    user    0m27.556s
    sys     0m7.602s

  [0] https://lore.kernel.org/lkml/alpine.DEB.2.22.394.2310032059060.3220@hadrien/

Individual patches have their own changelog to help with review.

With those details out of the way ...

Problem statement
=================

When measuring IPI throughput using a modified version of Anton
Blanchard's ipistorm benchmark [1], configured to measure time taken to
perform a fixed number of smp_call_function_single() (with wait set to
1), an increase in benchmark time was observed between v5.7 and the
upstream release v6.7-rc6 (this was the latest upstream kernel at the
time of encountering the issue). The issue persists on v6.10-rc1 as
well.

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

(tip:sched/core was at commit c793a62823d1 ("sched/core: Drop spinlocks
 on contention iff kernel is preemptible") for all the test data
 presented below)

  ==================================================================
  Test          : ipistorm (modified)
  Units         : Normalized runtime
  Interpretation: Lower is better
  Statistic     : AMean
  ==================================================================
  kernel:			time [pct imp]
  tip:sched/core		1.00 [00.00]
  tip:sched/core + revert	0.41 [60.00]

Although the revert improves ipistorm performance, it also regresses
tbench and netperf, supporting the validity of the optimization.
Following are the tbench numbers from the same machine comparing vanilla
tip:sched/core and the revert applied on top:

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
using ipistorm improves drastically and is closer the numbers same with
the revert. Following are the numbers from the same dual socket 3rd
Generation EPYC system (2 x 64C/128T) (boost on, C2 disabled) running
ipistorm between CPU8 and CPU16:

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

Links
=====

[1] https://github.com/antonblanchard/ipistorm
[2] https://lore.kernel.org/lkml/20240119084548.2788-1-kprateek.nayak@amd.com/
[3] https://lore.kernel.org/lkml/b4f5ac150685456cf45a342e3bb1f28cdd557a53.camel@linux.intel.com/
[4] https://lore.kernel.org/lkml/20240123211756.GA221793@maniforge/
[5] https://lore.kernel.org/lkml/CAKfTPtC446Lo9CATPp7PExdkLhHQFoBuY-JMGC7agOHY4hs-Pw@mail.gmail.com/

This series is based on tip:sched/core at commit c793a62823d1
("sched/core: Drop spinlocks on contention iff kernel is preemptible")
--
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
--
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
--
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

