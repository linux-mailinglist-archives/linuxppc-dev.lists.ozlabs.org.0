Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCA907B21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 20:21:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mkgk9vG5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0W2j3XcCz3cYQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 04:21:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mkgk9vG5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:240a::622; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20622.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0W2028RJz3cTf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 04:21:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRXm/bjXqtT0foH0NjdLr/fqwagcIwE6WH5yeUXUXsyoMwEdRfYBvpEuPK0WDZl+FKwQdY/oSczSXh3EQ0DxTSXSJV1jKmATDH9ncxZpDcB0Uh8sVjc66qqmfDef9NDQcd0VbD2Gbbs8PjnxRDIeMnIPUM9Ksp9RQR9yD+r6xeYYema6gWohlGmxDHU/jAgR1rM8zThcuA0qxNRG1vEGzBye+OHJXI1vCT4p+rMjz3RPnJgOQMrUc5HkFx8R3NOLbPQIep/NysSYOAtWOOvHOFiu13/yMXqdibULhkB5RnL5ih0NxP8h588Sfs7UnBK9Ouk8IW2FnPOgYT0baIuFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hs7C6zIKGEaHPiVxfq0Cw2LOk7ro6TzKuQqWBKK9DA=;
 b=Gmzwkktn7wGL63ofnyog4U38MgaLJKuFNe+73MRm2CNf7PExdJhTNs6RQVRbKRmxEgRHMgOzlck9RGliGmuvn+aDC+r0yWRjyPbqY4abbodBhfMZIQJN08hXctz8bJE2opytcYOCf6h+OpSB3dSBoh3NlsemVVCu77/pTlVsRsV1EkPjJrDPUjSa/Jr3/X3/yT53yw1XbDlKW2SjHkTbiGCqT4NUMhS9DNP/zL4LQcV4MJEsY13TN/QYx1ryK7fQO0k4RPj4imG7+wWK4uWqDYatvwXcK8EOSZkzfTds2cl6gZcgw2e6N5WKY0hh+4FOQl0LEdbumtQHZu/MZ8jVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hs7C6zIKGEaHPiVxfq0Cw2LOk7ro6TzKuQqWBKK9DA=;
 b=mkgk9vG5AUFrfzSUPBKrYX8ckVOMvRxYdHNZMYfcn4OVDQGybfOiQywUhM4qj3AjexYNsWCbi1tldh8eqoNNpTYiCFP6mWUQntCt0nOo0CHiIeTAU5Vo7OQ2wCwOWsn+Ta4EpygD22TOsUj/b0Ex/Vp74f1HXkBe61Fwz2luaY8=
Received: from BL0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:2d::23)
 by CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 18:20:50 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:2d:cafe::35) by BL0PR03CA0010.outlook.office365.com
 (2603:10b6:208:2d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 18:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 18:20:49 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 13:20:30 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 08/14] powerpc/thread_info: Introduce TIF_NOTIFY_IPI flag
Date: Thu, 13 Jun 2024 18:16:07 +0000
Message-ID: <20240613181613.4329-9-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|CH0PR12MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff126d4-e81c-4574-f65c-08dc8bd58d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230035|376009|7416009|1800799019|36860700008|82310400021;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?sPbGW6F6ZoKIgzR2KqWIPjeRkSjKDDXRUL0DObH8QPYw5L2JcDPcK4Fju5qN?=
 =?us-ascii?Q?TtuxY4gPP/bXLv63ycKdCoqehGe2K5mMROEyYJ9GpU8do+9Sjs1n0f726H3R?=
 =?us-ascii?Q?zW/yjT5cbLTuOkkZnkNVLgu2zAeoldwrwzc13QmpTgdqAiQc2Tb/3HmmoZB5?=
 =?us-ascii?Q?GbBqhzR7To6TWF11TLik8uDsrf+adO+UfBYZnAjGdDStpv+Jk5yuZsqfeZBr?=
 =?us-ascii?Q?wygOF68oVPPZhCa0Uq28tllIvIXaqdfO8TbtdqeiQvlKvbaQJStlMESRxdJf?=
 =?us-ascii?Q?i1t+x+sOJyJsgPz+zDeYdaJAxfjEnK8IqsWW8ZoWlmA8k9AX6rrDON7QGRyk?=
 =?us-ascii?Q?qFWN/OvFMXDVstdD4VnPOMppS55C45vSu3xeuo1cDEy4LJm5KgML2WifOs5Z?=
 =?us-ascii?Q?8CE5VBcn57A4DyJMI6wMhFVg/5OAgJf/eJoSvNcRjVDIX+34RTwsgQEinwnA?=
 =?us-ascii?Q?UftyAo1Oa4RZXaN+Jo2l949+tytykrnJv8ABLEdTS8Gui8t5/WdPlCVjNMPW?=
 =?us-ascii?Q?k57JWkANp7+k1v0VSz2wuhKlCVmPrfKXih1HumacujgX5KSkD21e2mhIWMaY?=
 =?us-ascii?Q?C6rriNv/vpTSQcaabPNaA2YaKWdM88utKhZN4kvl+MFDqLhZqvwuvAnmDOcD?=
 =?us-ascii?Q?b3QUPgHzc9MI7ktWGWwWn2aL3unTqMEbmsucl6MtTaRoTzU3ILMi4qYhYkGT?=
 =?us-ascii?Q?/5nUu4QEq6lw1mrtTqoKMqt+Wo4UaZcfsh2rnGs/wxN0P4tFXj0kqq0dAE4X?=
 =?us-ascii?Q?jFDrTwy9u3x4JH5CCo35t+MSukUB9PGn0lTlWW17DCpNFCW9XHdBEEQ+bzVe?=
 =?us-ascii?Q?Cwpw+e8GPUWHxHb2LhVxdZrKkPh0Z2/a375adtEwtn+YMjvKRBr53RY8+R34?=
 =?us-ascii?Q?UnCUcjVo34C+rGyxDwSCGli87dNaVweX9H2NEcGi6sqMOac182DC1Lo3onUW?=
 =?us-ascii?Q?OOKVXCZ+cYrH5DYvD4jsuF3OYmR+W9fUF7zmS9PoMrTnpOPPoNaOjXsmf/SZ?=
 =?us-ascii?Q?tEHEqR4VvZYlfWnuMDcojnJWilXtiCAb91SA65clWvo0JLQaNQnG+dv/NJ2q?=
 =?us-ascii?Q?9SkbIvsPuCzL1nIsIiTKAeK8hxnQnvOJAPTuC/mc+kut5sCwpTjZ/fKrwnZA?=
 =?us-ascii?Q?Q6/E52JcYSmVP7PeX24xCS3wiaxpKvfcfbLidekSAWSHVY9uMUggzXu49bEd?=
 =?us-ascii?Q?al+C+8Ypa7pe0jihcEPUFJfSl/34oClnoYo9DWocs21Ig5BaA/kwiCnrAgEc?=
 =?us-ascii?Q?X/MlOiCJZlTtlP8XorriNz28Q3Kf4eVQYnmQgVx1oy0BuyYbx4vbTdS7Vr7h?=
 =?us-ascii?Q?4X8txYM0ufL77NNVVGnIBlH7LQnFT86eq2LRFjTr+JI06kEvoRDfz+JSk3Xn?=
 =?us-ascii?Q?0PUIvhvIBeF+qLEEWc94jhGA2qsdP1g7h+7R9xe+N0IXuW7v5A=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230035)(376009)(7416009)(1800799019)(36860700008)(82310400021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 18:20:49.7527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff126d4-e81c-4574-f65c-08dc8bd58d9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8486
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
 Lelli <juri.lelli@redhat.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ben Segall <bsegall@google.com>, Benjamin Gray <bgray@linux.ibm.com>, Valentin
 Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, linux-pm@vger.kernel.org, Nicholas
 Piggin <npiggin@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Steven Rostedt <rostedt@goodmis.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for TIF_NOTIFY_IPI on PowerPC. With TIF_NOTIFY_IPI, a sender
sending an IPI to an idle CPU in TIF_POLLING mode will set the
TIF_NOTIFY_IPI flag in the target's idle tasks's thread_info to pull the
CPU out of idle, as opposed to setting TIF_NEED_RESCHED previously. This
avoids spurious calls to schedule_idle() in cases where an IPI does not
necessarily wake up a task on the idle CPU.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Benjamin Gray <bgray@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
v1..v2:
o No changes.
---
 arch/powerpc/include/asm/thread_info.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 15c5691dd218..9545e164463b 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -103,6 +103,7 @@ void arch_setup_new_exec(void);
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
 #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
 #define TIF_SINGLESTEP		8	/* singlestepping active */
+#define TIF_NOTIFY_IPI		9	/* Pending IPI on TIF_POLLLING idle CPU */
 #define TIF_SECCOMP		10	/* secure computing */
 #define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
 #define TIF_NOERROR		12	/* Force successful syscall return */
@@ -129,6 +130,7 @@ void arch_setup_new_exec(void);
 #define _TIF_PATCH_PENDING	(1<<TIF_PATCH_PENDING)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
 #define _TIF_SINGLESTEP		(1<<TIF_SINGLESTEP)
+#define _TIF_NOTIFY_IPI		(1<<TIF_NOTIFY_IPI)
 #define _TIF_SECCOMP		(1<<TIF_SECCOMP)
 #define _TIF_RESTOREALL		(1<<TIF_RESTOREALL)
 #define _TIF_NOERROR		(1<<TIF_NOERROR)
-- 
2.34.1

