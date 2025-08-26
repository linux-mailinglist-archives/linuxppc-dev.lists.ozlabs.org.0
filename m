Return-Path: <linuxppc-dev+bounces-11276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AEB3529F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vSJ3SxZz3d9q;
	Tue, 26 Aug 2025 14:14:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756181664;
	cv=pass; b=AIz3hN35GAvOi7cL1FX1VjSSF6WN4MSLypoy38xpEZM1Ly0W6oMbuKFmzpgPEsd5WA3xeKfhq7/FCsp3iRmCmT2soOwlcLOXIkCfiSbJsFHwm9r6boXL/M+2VtNwMVMuuGwvWnaWBVMudvjNXPbvVBs24bqBzc3y7Tn28NyCXl6EUnyAkivikqhCTLC5ZMa3rLOfKbGcC/6dNYUSO6Q1xry1rQi/1Ob5WAk0a+zzuTf1gOpEt7pBYM5Q2ey60CnEA9hUz/mnOZknYi9fP3btMLxEeuR0RkFUxwVvddW2RVEdC462bZZEaMzFGahOsXzt3DFDG4cQsGlspcOhSauCug==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756181664; c=relaxed/relaxed;
	bh=6In/ptpnmVY9UHYqfR1hlW7VPd2tv7EoHAfpADJM/UU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=idIEAi4IJmMRI/n+uLWsIIujCrMGTQHJLg+FpCIMQbmtJUay5HjlPhE/NafK35mu/O93FErJB9ueZZmFMpVQTwl4oRfGXP6HZZfunOLBugDAuRCG+/5zuTejXpsk9Z8mqoUt2q91MXvXcNYQ3OWwzQWQvURDsTFJoL8yc5lsX7+Sun1YXShEd6mkBTrtKkBjGFh6APi/T9rm1L26MzKXKMThiAO+O/jkwB4cUbRn2RYYCOLmc6WAmjovtRwrmcr3STwtx/MpI97CctEbyNr5WNCsyMUgpi0OB4/aVF63fi4LTeZCMeWpX4eDZ89MZKhXrL9R97Ytcb5JeNR8Nyrzgg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=w8MGzNlM; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::610; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=w8MGzNlM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2412::610; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vSG2L75z3cxn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:14:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM4OooI5NKvTGbzBPnysrIbf5LpDFZYiY330p0PKbsqJoc3wv/pUs0ijxLUJDN0yJmgWrxrUL3PC+0fgHtZifKLW3R88okFo3mSAVZr0XmxEleNA39AXLCOEdz/6sWXza5ZpAEEkrjoEXHoHJHoKtU5p1SIxGaNYs7HPdENMHd/xgcPx7SaihcBpDlCkYbVk3qYYeds5Ywk4R/0Jl1WWXtDuW++V+4LgNvxet1jzFy2ZehbJJoQ8+Njm9VB84PU2FtALrGciJDlqAmkZr9BnAezesAoFDa9Nbd0cNQsEhoLazmv9mdjiOfK13r+HvNAjqEGkAOXP72L9m033WHhaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6In/ptpnmVY9UHYqfR1hlW7VPd2tv7EoHAfpADJM/UU=;
 b=Stmh2m7sI3Ae0lbQOJoblIg758I5QYGrtDbjU5IxWrp06ENOmuRBNBrh1NxY0zQsat3/LQvwT3I+8KYmoTYPo4R4pkv/CHdzStwFerq8VsA+SItbZnBWCfnzwqT19NW2BYHMoQp/qCkgzVQX32Nv5vP+1ufXXwLvuuoC5L57qZDlNnfNyBCoeO15KUGKlRaG7vaMC2lW/DVBp8exwuDELSpYfyYuOt5BazHEb99ILecK3FxfQWwKx7Yy29mv6GcV8TKmAphSFLZo+N4ZuJUXQcAy3e7s8GO3I3Bgy2gJa3scmQOTa0dk75UAhZ7lFTIxJjV9pNaxv04SILa+8G1K/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6In/ptpnmVY9UHYqfR1hlW7VPd2tv7EoHAfpADJM/UU=;
 b=w8MGzNlM7VSiSgZPhvHX4GXoI0tDT3+FhDjuOxzS3itdH7im8uCbN089o90gDnXkJ88sC1WMr07UP4BXnZZas8Dzy939fErM8MzkgxseF2NvbyrzQGrCOApMUvvKzrAcBHbYgmUX6nnrK0kUzTP4IciX812bnoEpyR5o6i6+ORY=
Received: from DS7PR03CA0089.namprd03.prod.outlook.com (2603:10b6:5:3bb::34)
 by DM4PR12MB7647.namprd12.prod.outlook.com (2603:10b6:8:105::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 04:14:00 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::29) by DS7PR03CA0089.outlook.office365.com
 (2603:10b6:5:3bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 04:14:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:14:00 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:13:44 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, <thomas.weissschuh@linutronix.de>, Li Chen
	<chenl311@chinatelecom.cn>, Bibo Mao <maobibo@loongson.cn>, Mete Durlu
	<meted@linux.ibm.com>, Tobias Huschle <huschle@linux.ibm.com>, "Easwar
 Hariharan" <easwar.hariharan@linux.microsoft.com>, Guo Weikang
	<guoweikang.kernel@gmail.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk Wlazlyn
	<patryk.wlazlyn@linux.intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>, Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: [PATCH v7 0/8] sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
Date: Tue, 26 Aug 2025 04:13:11 +0000
Message-ID: <20250826041319.1284-1-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DM4PR12MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 60348fba-fe13-4fad-2230-08dde456fc08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?44t7sBNej+4mZTtOPFKUy/V16v/xuda/XOiSuY9GXMCG4mozDN23rp/BhAP4?=
 =?us-ascii?Q?oaBIlDtjnh0OqYgVfhUAWssKgSFd6SrfiIIT0qJq6TBblCcJIQe4K63RK+Dk?=
 =?us-ascii?Q?JvRYyoff69vr2XCAZmpGJ7bDme3dXvEUgDd4zwGFmRNMHPyCi8M1IqYy/ban?=
 =?us-ascii?Q?Bb3TOVSZ/XIa6ISJjpjEyhiSuLrbRi14S12mEh5kPB386n86io5qP8OikW9W?=
 =?us-ascii?Q?wvEJJ43mEanBSTX4eyKE+BFo5pLTU332skLuuUkpUR4BRdsR+lyv9VE5BziX?=
 =?us-ascii?Q?Goy1HLTkGQQXBXTdxqNY+aDCeoMkE6T/rgHUWdoJH6z3ofRBFYCInX7oHDww?=
 =?us-ascii?Q?jIyv6LLGhAi7C2eb1xct3CM6i0iHM2NsGR18undni0N8Gr8Lo7P4yXQpE9mW?=
 =?us-ascii?Q?SExMNlmEM3c7WUIGWkQPrgk4ge1m8+PYz839H5dplG1jwuV4nRRNHJ7Dm/Eq?=
 =?us-ascii?Q?dT4Mrr7taOxvprqNbrlFycV3ZgQHuUkVepqdgW7ecLJBDz//oYKI6ORSYabF?=
 =?us-ascii?Q?CiHedl0q7wU4i7UJ6WIeOYzc8laXw24RiIQrlL7/2YGKVuuVasIQ/9XodKaZ?=
 =?us-ascii?Q?70yotxKF9tIS8TC2D45XkJ0Nj5pH2S/Aaca0Sel9G4KcZoQbdC4W4LXRKxu0?=
 =?us-ascii?Q?/pXePe33MJYNEa4e0ZUj1549kpkJD3I4dOsX62oFOKQ3cyM0JKxGKacGWai9?=
 =?us-ascii?Q?UkI8Kr6ZSSP4qNleWY71EI6dVTe5ZVIaqHAGCw3lJfDO6a1BogxQaGJlEeff?=
 =?us-ascii?Q?f2LwpEPIWzpp4cycPjQPXdAK4rTNatgQ7zygMk/BdNNKT117wRRtzIpWqhM2?=
 =?us-ascii?Q?WlNN3tBp3rA54bF3snmVJtMAwvzYGZFkj5d6juIVyLphmdGm/yyVyFtlHJF4?=
 =?us-ascii?Q?efls+usRvuvkNSSFASuvt+g2oKI9rspkcm8MiAypbfwILv6ILZB+TgCjdela?=
 =?us-ascii?Q?8eNEAT2IGlGCIuGdMi7cSJiWP3vtYE3YBNFby2cWjyMIZtKS+zSZBM8Uiu4H?=
 =?us-ascii?Q?ZAAJorUvwsOcOfdlg4bikV8/C/WQh5UL0HnOx3v+3RQKz+P4Pr5ETx8gQMj9?=
 =?us-ascii?Q?Zi5RHB6uC18DTAw1Nh2NqSXDiyfuAF4H+6z0Yxad8rIJ5nE2qkfjZVaX1D6f?=
 =?us-ascii?Q?JNWEqIugMwGiNVVJ62DUiOCKu2/GEIRMMP6v9ck3gixX3nyu/qQgdp3I9ruM?=
 =?us-ascii?Q?uMqPk7ZcwG9ZlXD8twlmUxZX5DWSw9siPByHdDMQDfFcB42BRnRJ/cU0pc+g?=
 =?us-ascii?Q?wB3Rx9we4TdPLr7GpfGXd9y3z3raywcoahPySxwF9JJWmYxwbC5mlE07Lr9U?=
 =?us-ascii?Q?gchiifqNQy2L8zJGZeZ5WkmUcBPBIL7MWZmiQDSW9f0E8zUyqf49HQ2yUEi3?=
 =?us-ascii?Q?ToFbKZtW0HMq+M8ZKaRBT0znNCumPD5ZSJvZ/VT+u5SC8KHrkb5xImsQwG6B?=
 =?us-ascii?Q?kc7WKYV3P6fc3CDGJ7DlhSBdtOPvTCy6VakEarm7Ghn4oHI0jYCJl2nQYVDw?=
 =?us-ascii?Q?zDqdu7svfjF/7E9SncBWftWYn0G4e3lTcXek4XJ7B9hO/7HmLKUeXf/CLtXC?=
 =?us-ascii?Q?Y7KSKgPEXwvLHz33LN0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:14:00.2370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60348fba-fe13-4fad-2230-08dde456fc08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7647
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This version uses Peter's suggestion from [1] as if and incrementally
adds cleanup on top to the arch/ bits. I've tested the x86 side but the
PowerPC and the s390 bits are only build tested. Review and feedback is
greatly appreciated.

[1] https://lore.kernel.org/lkml/20250825091910.GT3245006@noisy.programming.kicks-ass.net/

Patches are prepared on top of tip:master at commit 4628e5bbca91 ("Merge
branch into tip/master: 'x86/tdx'")
---
changelog v6..v7:

o Fix the s390 and ppc build errors (Intel test robot)

o Use Peter's diff as is and incrementally do the cleanup on top. The
  PowerPC part was slightly more extensive due to the lack of
  CONFIG_SCHED_MC in arch/powerpc/Kconfig.

v6: https://lore.kernel.org/lkml/20250825120244.11093-1-kprateek.nayak@amd.com/
---
K Prateek Nayak (7):
  powerpc/smp: Rename cpu_corgroup_* to cpu_corgrp_*
  powerpc/smp: Export cpu_coregroup_mask()
  powerpc/smp: Introduce CONFIG_SCHED_MC to guard MC scheduling bits
  sched/topology: Unify tl_smt_mask() across core and all arch
  sched/topology: Unify tl_cls_mask() across core and x86
  sched/topology: Unify tl_mc_mask() across core and all arch
  sched/topology: Unify tl_pkg_mask() across core and all arch

Peter Zijlstra (1):
  sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()

 arch/powerpc/Kconfig           |  9 ++++++
 arch/powerpc/include/asm/smp.h |  4 +++
 arch/powerpc/kernel/smp.c      | 51 +++++++++++++++++++---------------
 arch/s390/kernel/topology.c    | 16 ++++-------
 arch/x86/kernel/smpboot.c      |  9 +++---
 include/linux/sched/topology.h | 34 ++++++++++++++++++++---
 include/linux/topology.h       |  2 +-
 kernel/sched/topology.c        | 28 +++++++------------
 8 files changed, 93 insertions(+), 60 deletions(-)


base-commit: 4628e5bbca916edaf4ed55915ab399f9ba25519f
-- 
2.34.1


