Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E74907E8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:05:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sX8+K4ry;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0c166qbCz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:05:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sX8+K4ry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::601; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0Vy95yC9z3cTS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 04:17:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4vnLIHNqf6EMaus+lVKV5QnYMXB1uDfXGYo/TPGsT1sRrc10nj9Ma8Xfowm8Ety9SoGywT7fVWvtQkSbRHvMy6rzb3fs9iwWmmZ/OBEBQPST7BX3+oMHWK4a4R/HE+ohygGxlU13T+GfzdgcJ+YREv8G9qPKF888WS3CSQYdBNT5su2aK1miHvnhpLpfGcwLCLQ+sfCFedaJ8+MgFB8reOGoh31Lj3yQzu8vR+wuh+p+EpBZHQrpWZ6fLRZTCU3E5zT9AYMfBfWbcs8QOV1tJTQpmiWqvnFLFp8XtoCOPjck6/QnP1ZdesMOb6SfjSob7kddqpVV7o3Nv5lFHXocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBDm/3LMK0oErkDvBoPiWdU5abmUSz18MIXn67uiZ4Q=;
 b=ZojCpX3Czq6YaKtbZm7hKkH9y5OG9QBj2MEuUykqB+fTD/mVPoy1pNusEMsSLEa29nkYecPaeS02lBJbz7EXY0gxAh5ewVzgNvTRg4uJfWa/5USSOp6xIVX4iVd7medU7sua2WQopFQeV7LH+CxkbdyCsUJnMLb/jr1XxX972JH/jrGEuyq6W+rFAwFgpgFkA/B51s2y5VOhsmJCApoiC2x738iPdWpwC+I304aYR0dnJQShkxar3Q1nCMzkHUUDdBYotu+Tppsfq0AAfsmcO2TgTCFDMxR7PoK2riWP+PKHeA3kxS6g7fPX72uDePKV+BynfCIUOKumI3wop23V6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBDm/3LMK0oErkDvBoPiWdU5abmUSz18MIXn67uiZ4Q=;
 b=sX8+K4ryqOG1Ochl8dUeXR94hVUTyMv8zjvOLiS2mSka8XpVuOMAxtWaWdpHG9iPsl3YHnfC2QUmBhcQBdNCQOlCGDBDA1zyt6d86myl/RU/iwz4oAPnkz2Dcv5BeCXIZDTm95iqL+SAKblQPQM+db8wdKR8Z9qbTZBu1gY7WO0=
Received: from BN0PR04CA0087.namprd04.prod.outlook.com (2603:10b6:408:ea::32)
 by MW3PR12MB4364.namprd12.prod.outlook.com (2603:10b6:303:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Thu, 13 Jun
 2024 18:17:33 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::59) by BN0PR04CA0087.outlook.office365.com
 (2603:10b6:408:ea::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 18:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 18:17:32 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 13:17:12 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/14] thread_info: Add helpers to test and clear TIF_NOTIFY_IPI
Date: Thu, 13 Jun 2024 18:16:00 +0000
Message-ID: <20240613181613.4329-2-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|MW3PR12MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fff5df-6d2e-479b-b436-08dc8bd5180e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230035|376009|7416009|1800799019|36860700008|82310400021;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?eKPfG6UdmTVhoqRYP2D7Uk4xzVOFM6kU7mCeOZqhjLz14QCOFiwSRifwdQpd?=
 =?us-ascii?Q?vPTnOmqeiWxhdYTj5ec4SB6LJssA2Ms2GSmRXUA88G8QjAgN6BR14fsOub/D?=
 =?us-ascii?Q?HpwvdRz+8VSNLVfWD2YgvX/WUWNRbn8+p2VtKwTAGcI/VZgP0h0KW5qHGvdd?=
 =?us-ascii?Q?Mdc1KedchdnzbjUFc3WVYOpP90+11yDQ9vIJv/wN6h2CJ/Gs+4Wb5C/YyS7W?=
 =?us-ascii?Q?u9cshuYyNN6jQFoEcrfGyWqhj6GOlAUhQZOWsX5NWGmeK/9iYgo036g0tOX2?=
 =?us-ascii?Q?lSACDtTrTz+iSO6cmIcIkg+Ep6WLUMfUxrlFCN1M805eMVmNy9mm1g56RS+0?=
 =?us-ascii?Q?YVjUKshyMqE/mPsQVkpH8GlTfcaCGtLz0XXtDmqH6hXzAJAziwwkHD0rftPn?=
 =?us-ascii?Q?BYgI3UeY/qHIo4dnHu0r6qwW5XW2eKjLE3cH3pO1uDoNXycdqGSTntnuDhUy?=
 =?us-ascii?Q?IcBWHTvV9ETrYIivowe5B4ntiYzphmr01UHfuUXLzKWMsAsJuGE5EVIAC4Xi?=
 =?us-ascii?Q?LaOUuuj7l17Ry0bjYvN5D+UGLoXMjmK7s6uhYMeJlmcVxo+eepxfpko7q4Do?=
 =?us-ascii?Q?p1z33lEdOHT6uBDobzHxrTDOgTzqDAYy5fovvd/Xro3opHeb3ne1vUxmLaws?=
 =?us-ascii?Q?/3bMmPULfbwxCLdzLJqwYmOf5hJ/EXcEy9+3zfTgLcgGFVTRkrWIlH7ZKrok?=
 =?us-ascii?Q?2Mzix4J7A/SF37luja2PsM6VQyQS5fPGE5lq6PKA8lfBRDVjgAI+FM0h7/Z8?=
 =?us-ascii?Q?1dgQYX9vf+1LMKk51ZdSsoL/eGfED8iBdO1yRkPnhYNR0ahiiHqgbTNDwRp1?=
 =?us-ascii?Q?33OpCr1epjhMrIiYgUr/2RTLxDk2NrBAkH/GhKAiEYD/kV4nOjjpPQZ0EyJX?=
 =?us-ascii?Q?cghE/FoGiLoVY2ATb41/1/ZodOXzUde3Tmuolh8Hxe9yEc7XtgaO4vDZ2w4x?=
 =?us-ascii?Q?AJy+XI5BnMkCPje8ohHDpIyahVx4Ptm8LzlIyp+2saAfVBHi/JidmHQOs0Yt?=
 =?us-ascii?Q?Y3GgfszFmW0WfJpGwM38wNyMgsrbtkCHBuOiSc3amf/7aBsZSS8GuJtFhByC?=
 =?us-ascii?Q?Fx2aBhTSy0eIzD8yXQrCy3enj3vSK1lZlruFOrBtPZkVEQlVn4cOkQX0bIN5?=
 =?us-ascii?Q?Wx8vf+oxV+AqX3ZYtqrAPhiKhs0fzXygITlzQw14XPjT3gsPFMPIaBQs5dCD?=
 =?us-ascii?Q?X2kCM9yVQfyWIFulSf6DuCrDDRk76cP3LuvuRvbpz1c7/OMhR/qsnqVkcbVc?=
 =?us-ascii?Q?nCFaybzzLkt7ZZunQiYID2c2brqL1mVpK4aqxRzsburSK9LPl/CaGJ9Uexft?=
 =?us-ascii?Q?XCVJCRAsJpzN0zg7/jxLPUJbK/ssAXN69xdsDwHQRbrkZh7yJxmUEBvZNpS1?=
 =?us-ascii?Q?xEj9+w7vqJetJyU+cR5jpu+g19C3e8L9pkfMSSUX1hbaP3E3jQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230035)(376009)(7416009)(1800799019)(36860700008)(82310400021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 18:17:32.5335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fff5df-6d2e-479b-b436-08dc8bd5180e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4364
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

Introduce the notion of TIF_NOTIFY_IPI flag. When a processor in
TIF_POLLING mode needs to process an IPI, the sender sets NEED_RESCHED
bit in idle task's thread_info to pull the target out of idle and avoids
sending an interrupt to the idle CPU. When NEED_RESCHED is set, the
scheduler assumes that a new task has been queued on the idle CPU and
calls schedule_idle(), however, it is not necessary that an IPI on an
idle CPU will necessarily end up waking a task on the said CPU. To avoid
spurious calls to schedule_idle() assuming an IPI on an idle CPU will
always wake a task on the said CPU, TIF_NOTIFY_IPI will be used to pull
a TIF_POLLING CPU out of idle.

Since the IPI handlers are processed before the call to schedule_idle(),
schedule_idle() will be called only if one of the handlers have woken up
a new task on the CPU and has set NEED_RESCHED.

Add tif_notify_ipi() and current_clr_notify_ipi() helpers to test if
TIF_NOTIFY_IPI is set in the current task's thread_info, and to clear it
respectively. These interfaces will be used in subsequent patches as
TIF_NOTIFY_IPI notion is integrated in the scheduler and in the idle
path.

[ prateek: Split the changes into a separate patch, add commit log ]

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
o No changes.
---
 include/linux/thread_info.h | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index 9ea0b28068f4..1e10dd8c0227 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -195,6 +195,49 @@ static __always_inline bool tif_need_resched(void)
 
 #endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
 
+#ifdef TIF_NOTIFY_IPI
+
+#ifdef _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H
+
+static __always_inline bool tif_notify_ipi(void)
+{
+	return arch_test_bit(TIF_NOTIFY_IPI,
+			     (unsigned long *)(&current_thread_info()->flags));
+}
+
+static __always_inline void current_clr_notify_ipi(void)
+{
+	arch_clear_bit(TIF_NOTIFY_IPI,
+		       (unsigned long *)(&current_thread_info()->flags));
+}
+
+#else
+
+static __always_inline bool tif_notify_ipi(void)
+{
+	return test_bit(TIF_NOTIFY_IPI,
+			(unsigned long *)(&current_thread_info()->flags));
+}
+
+static __always_inline void current_clr_notify_ipi(void)
+{
+	clear_bit(TIF_NOTIFY_IPI,
+		  (unsigned long *)(&current_thread_info()->flags));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
+
+#else /* !TIF_NOTIFY_IPI */
+
+static __always_inline bool tif_notify_ipi(void)
+{
+	return false;
+}
+
+static __always_inline void current_clr_notify_ipi(void) { }
+
+#endif /* TIF_NOTIFY_IPI */
+
 #ifndef CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES
 static inline int arch_within_stack_frames(const void * const stack,
 					   const void * const stackend,
-- 
2.34.1

