Return-Path: <linuxppc-dev+bounces-9850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70ECAEBC86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 17:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTKqb2P0Hz2yNG;
	Sat, 28 Jun 2025 01:54:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::60a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751038407;
	cv=pass; b=an2jJzIeiyA5/hb+vLoT6A72iBYScrQMYTo1OhYCoj9uYCBI11u0qHYNmlg9hjaVOec4LHmgR1iDs7XOSmEoOVum6919kNz3Npe9c9OeFgrmyiEnWqe2QZ7h3TZKooBpM5kZdad7ilsbGm+woAZxNgTHUerQReHwxDDSQBk3bI9E81TksmUupQTVVPpmvilyfhSGMAhhfaQQctuwYdrAZ35j/+Hz+pkqkc7Pq8Hr4/1oEnj8985e7sZqIp6vfdLE89WSYzfJ6ki4tYNjN1/2WrD3YC/rBDVGop1Si4LwHEJ8TVtJoGEm1lS0RXnlg3UPQoTocV7/5GKRaZDwT+ztPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751038407; c=relaxed/relaxed;
	bh=5fQboSs/5/bXDh8HLuZLTAl16XdVgH1rML49GhypkCY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cqnURBUCFbH1SUpBQ3uljdNeOM2xai/lDG0YvSbG2SLz7z+QEs8FMkvc7rRPsavDeU2egCpOC9bBrqMBYlIXSQQUAYbNfF6lAdrO8YWhLLVQfZUzbX44SLQhDmS+ULAkKyTFZi930tRgqwpUcTXk23Ux0MiccPl8hywcmRzSEEFPrSAgIrnofItgnDhtSA8LvGQwVi8yOwuNJEOx9mdJTeImqfvDRslFMlPX82aXucFJGNKOHUo5zzk6+FFA0ljiVzeUcgTzRgjBOUT77DM/dDbtDgD0og2BiomicwsrBuiQvQE2Xflo00fRbnM+hfXd7cwAq3zszBk22OklDr3low==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ssZv8Jdo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::60a; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=aurabindo.pillai@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ssZv8Jdo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2009::60a; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=aurabindo.pillai@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTKMT3sHcz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 01:33:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuUpdt352Hx3IcuZ0v+qSL00hlhe8UI2UCpHt9gBOdtaDGMYyfOexubDhocG0WSBwm48h3WyR4kBEGQ1Wc53I1gvWnjIGt3hmvDMh2dqpWgtbb0+B5Q/c+O0fluCYvvKYuzM5ghYgFJiXyGD2YL+4DsBV+X3GUAgpuPyXuyxcjqVnWwYXlY4pWV43ZNYx7ivdPEDoZvxAV26IK3itznjnZWCr4fM6kEBnSdvEH2/bPO501FPF6lfohudRT5vb7gQppjst1fpRWhyEvcGzrjAvRxO5X8fBOgFyxiStpgwsFBhnsrZ9Q8ZFFH1gZsYr/gHCevB5FZApHX9hufgYj0moA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fQboSs/5/bXDh8HLuZLTAl16XdVgH1rML49GhypkCY=;
 b=BjSxsuiA58g03dp9AVYNnguzlmvYIomXuFYk0FJ9484mlmhys9k0dBEWw+APaAnNu+FhwS7RlGlnsK/rv33j6QKuvpLSvcjlcRK2WOMy3KsVyVy8jgBM9Q/wNBUe2v7pj5JwjRblLxxNaBb3xlblz8FuQaaeewUU8SMR5jxqyUHCMI+GMR2qekwv8fGkskpnCtMrFCmFabjISOFhJqhyzXw6pU97datTaojIb8wsklGvaX0Zl58KLXeY4tpWSjSeTxjgtUktiDH4V/OB3JBqck8t93N28chEjjUX+DrpRLovg5yXrUikofmXBXJfDXi3OP2W4a/7779zWIehkAb/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fQboSs/5/bXDh8HLuZLTAl16XdVgH1rML49GhypkCY=;
 b=ssZv8JdoAhqL6o59pxGEKslz0rTpErVGu63rEMIyDB9Q7wDSCE48U3tQ2OKI33AH4NqrwJbs3ERaeDKRAwPOO9YzuNkSWFtVl9XZ/cSL9X9T1hABMI1AEQPPYhjhVfHJg90xI/gRLHI1NMHOW+2fJOSwLBwEkbnYqTZp7LJETE8=
Received: from DM6PR02CA0098.namprd02.prod.outlook.com (2603:10b6:5:1f4::39)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 15:33:01 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:1f4:cafe::2b) by DM6PR02CA0098.outlook.office365.com
 (2603:10b6:5:1f4::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Fri,
 27 Jun 2025 15:33:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 15:33:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 10:33:00 -0500
Received: from aaurabin-z5-cachy.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 27 Jun 2025 10:32:59 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N
 Rao <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andreas
 Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov
	<jcmvbkbc@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
CC: <linux-snps-arc@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-csky@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<sparclinux@vger.kernel.org>
Subject: [PATCH] kmap: fix header include to reflect actual path
Date: Fri, 27 Jun 2025 11:32:57 -0400
Message-ID: <20250627153259.301946-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.50.0
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
Received-SPF: None (SATLEXMB04.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3d1a8a-36d3-4a3c-f4d1-08ddb58fe6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dlTK7w1IbyyQXFUIhEzViuseygrINLnH56IMgdxHEBSJMaXKIuk/JIEza7n9?=
 =?us-ascii?Q?QjEmYTKodgqcsNCfznBYoRAoNHJgtm+MPDDUleoQHefXnfQQgEropvvmmqpo?=
 =?us-ascii?Q?+2AjICmWOhthgL9HGNp6B2N3i5gerr6VBMMdmVV8jN29lvutAJLQDhLPcEdG?=
 =?us-ascii?Q?7yCeuLAzCmOy+EOc5OKa4n6ML8ml1mFeSyzl4BnSMmzANKFBfksIAEaydM9v?=
 =?us-ascii?Q?yv3o1EJA5fU3YahtkksxfvzKg66Uk780ZgkSZejkBDdC9hrRS11k/5fsuC9Z?=
 =?us-ascii?Q?mdM3g2Fk8zRJIpkgGOK3PL5fs+f4lwQ6tR4MG8OvgkTltZ3+6+V5piCRtO9B?=
 =?us-ascii?Q?Nu3fhK/vbd93GDeBTDv4w+sghLyKvnl5pxREdrnlm+k88MndZRn7z19JjGEv?=
 =?us-ascii?Q?als1fLyQ9qm3wKGgNCX0gEwvopi1arG8jXEFSzKxAfolV6YlZCltOZS4H5Hq?=
 =?us-ascii?Q?5QQIDDneEipGJjGsbWmq22cJm/h2Bd7olOb7Po86IMNKKjKFPDvBkcNVAVsh?=
 =?us-ascii?Q?OMO4QG37OapwUIgPNktQHi92vO+QAhT4mIdgv0yzDuVJi7SMoNDJ6pBgNu/r?=
 =?us-ascii?Q?nTAbER+CaC2nl/twc9ESVsZKvNwMJu0lg12QZLZ8mQMBfRrCJLXvyAORhpH7?=
 =?us-ascii?Q?DD0JscF7L2aCLfE7PQ1ttLQxX49NT75LQ28OVSaO/HfrDT0Crd3yb+bziGMr?=
 =?us-ascii?Q?5J78/YjQVq9xV4VlDAYdyhsTpNVMnlH9kJeCNl69Omo+Adh0TDDbRljIyFSW?=
 =?us-ascii?Q?RXSJdHd1LDrjVs/ts8fKpGc5DVlPZouSg7jDqn9K6fy5RxgQ2x2lg6J1Xv1Z?=
 =?us-ascii?Q?CmOdO08eXGlp361wJSVErrAPR9cKnV21JTYkgJxJKm/m9dB3dcQ7pLRnWpFi?=
 =?us-ascii?Q?bOBx4C+9GcPTDx+sigV/P2XzPpNKi8ldcqS/Ao/WXFEF4hAJsruQfFlw3oYZ?=
 =?us-ascii?Q?7pegGpOAUyuLhzxJORnGUn1gckySXStq/dvelp2619H21G6FRsWPsmMwDts4?=
 =?us-ascii?Q?MPyeXIN6seAzy7PQBoDe8yhbMtDjiHsq1H7rNDTOw+4fiH5i6v4ue7/9Z8KV?=
 =?us-ascii?Q?nK9QO4jVSA1tFVO8LyAWzWuugnX/O7I7bR8aJXASXCfLmrnIMe46QIbvyY2t?=
 =?us-ascii?Q?5tjhXAQB9JUO/AbMrwmE7NWHDN6X/a6frg122XscTawW6A/RFa/NyBsiPvsC?=
 =?us-ascii?Q?waSkRJauUU1JsAZutUNIluTGcE8gnW61CvJa/0H47cuxSCzAd8+MTpZOasfc?=
 =?us-ascii?Q?v62FvM7DjLur1ANbuhXCNTpTyHvvFiB0nxt2npVixlkf69oNuI5zY3JTqT/W?=
 =?us-ascii?Q?kpnoIWh+6Vj9ezi+ofPGLdZwSliAovQNlCKS1dTfKtCN1f++VyRlhdhjW3kh?=
 =?us-ascii?Q?oU9K+9QC9NuvZZizvANExSDU1WKa92PLlUTPeXyuOqUhRMBRA0JDzCmI9LcI?=
 =?us-ascii?Q?UzE4d9O9ENre6q6sDEpczxaAhtmGzSNvgosiZHHclWzPptGHk837vfufmL58?=
 =?us-ascii?Q?2dV5hlCy5lQsu6kBSPzPhJCPcg6jdhdnoJJ+dh4nI3PU67A4+0hyF3+cDg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 15:33:01.2146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3d1a8a-36d3-4a3c-f4d1-08ddb58fe6c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There are plenty of header includes like:

	#include <asm/kmap_size.h>

However, the file kmap_size.h is actually inside the folder asm-generic.
Fix the includes in various header files so that the correct path is
referenced in the source, so rename them to:

	#include <asm-generic/kmap_size.h>

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 arch/arc/include/asm/highmem.h       | 2 +-
 arch/arm/include/asm/fixmap.h        | 2 +-
 arch/csky/include/asm/fixmap.h       | 2 +-
 arch/csky/include/asm/highmem.h      | 2 +-
 arch/microblaze/include/asm/fixmap.h | 2 +-
 arch/mips/include/asm/fixmap.h       | 2 +-
 arch/mips/include/asm/highmem.h      | 2 +-
 arch/powerpc/include/asm/fixmap.h    | 2 +-
 arch/sparc/include/asm/vaddrs.h      | 2 +-
 arch/x86/include/asm/fixmap.h        | 2 +-
 arch/xtensa/include/asm/fixmap.h     | 2 +-
 include/linux/sched.h                | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arc/include/asm/highmem.h b/arch/arc/include/asm/highmem.h
index a6b8e2c352c44..3be6754ab304d 100644
--- a/arch/arc/include/asm/highmem.h
+++ b/arch/arc/include/asm/highmem.h
@@ -9,7 +9,7 @@
 #ifdef CONFIG_HIGHMEM
 
 #include <uapi/asm/page.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 
 #define FIXMAP_SIZE		PGDIR_SIZE
 #define PKMAP_SIZE		PGDIR_SIZE
diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
index 707068f852c27..149669def2e92 100644
--- a/arch/arm/include/asm/fixmap.h
+++ b/arch/arm/include/asm/fixmap.h
@@ -7,7 +7,7 @@
 #define FIXADDR_TOP		(FIXADDR_END - PAGE_SIZE)
 
 #include <linux/pgtable.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 
 enum fixed_addresses {
 	FIX_EARLYCON_MEM_BASE,
diff --git a/arch/csky/include/asm/fixmap.h b/arch/csky/include/asm/fixmap.h
index 49a77cbbe2a9c..c68aabec22429 100644
--- a/arch/csky/include/asm/fixmap.h
+++ b/arch/csky/include/asm/fixmap.h
@@ -7,7 +7,7 @@
 #include <asm/memory.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 #endif
 
 enum fixed_addresses {
diff --git a/arch/csky/include/asm/highmem.h b/arch/csky/include/asm/highmem.h
index 1ed810effb3d1..c3c4d51a93d0d 100644
--- a/arch/csky/include/asm/highmem.h
+++ b/arch/csky/include/asm/highmem.h
@@ -8,7 +8,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/uaccess.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 #include <asm/cache.h>
 
 /* undef for production */
diff --git a/arch/microblaze/include/asm/fixmap.h b/arch/microblaze/include/asm/fixmap.h
index e6e9288bff761..77996f6605949 100644
--- a/arch/microblaze/include/asm/fixmap.h
+++ b/arch/microblaze/include/asm/fixmap.h
@@ -20,7 +20,7 @@
 #include <asm/page.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 #endif
 
 #define FIXADDR_TOP	((unsigned long)(-PAGE_SIZE))
diff --git a/arch/mips/include/asm/fixmap.h b/arch/mips/include/asm/fixmap.h
index b037718d7e8b4..85e2854a2fc50 100644
--- a/arch/mips/include/asm/fixmap.h
+++ b/arch/mips/include/asm/fixmap.h
@@ -17,7 +17,7 @@
 #include <spaces.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 #endif
 
 /*
diff --git a/arch/mips/include/asm/highmem.h b/arch/mips/include/asm/highmem.h
index 92a3802100178..80a6409d4a137 100644
--- a/arch/mips/include/asm/highmem.h
+++ b/arch/mips/include/asm/highmem.h
@@ -24,7 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/uaccess.h>
 #include <asm/cpu-features.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 
 /* declarations for highmem.c */
 extern unsigned long highstart_pfn, highend_pfn;
diff --git a/arch/powerpc/include/asm/fixmap.h b/arch/powerpc/include/asm/fixmap.h
index f9068dd8dfce7..b0622370fbab1 100644
--- a/arch/powerpc/include/asm/fixmap.h
+++ b/arch/powerpc/include/asm/fixmap.h
@@ -20,7 +20,7 @@
 #include <asm/page.h>
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 #endif
 
 /*
diff --git a/arch/sparc/include/asm/vaddrs.h b/arch/sparc/include/asm/vaddrs.h
index 4fec0341e2a81..f21d51153d6ef 100644
--- a/arch/sparc/include/asm/vaddrs.h
+++ b/arch/sparc/include/asm/vaddrs.h
@@ -32,7 +32,7 @@
 #define SRMMU_NOCACHE_ALCRATIO	64	/* 256 pages per 64MB of system RAM */
 
 #ifndef __ASSEMBLY__
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 
 enum fixed_addresses {
 	FIX_HOLE,
diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
index d0dcefb5cc59d..ed2dc040747e4 100644
--- a/arch/x86/include/asm/fixmap.h
+++ b/arch/x86/include/asm/fixmap.h
@@ -14,7 +14,7 @@
 #ifndef _ASM_X86_FIXMAP_H
 #define _ASM_X86_FIXMAP_H
 
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 
 /*
  * Exposed to assembly code for setting up initial page tables. Cannot be
diff --git a/arch/xtensa/include/asm/fixmap.h b/arch/xtensa/include/asm/fixmap.h
index 1c65dc1d33971..af09aafb66687 100644
--- a/arch/xtensa/include/asm/fixmap.h
+++ b/arch/xtensa/include/asm/fixmap.h
@@ -16,7 +16,7 @@
 #ifdef CONFIG_HIGHMEM
 #include <linux/threads.h>
 #include <linux/pgtable.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 
 /* The map slots for temporary mappings via kmap_atomic/local(). */
 enum fixed_addresses {
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 9c15365a30c08..28507df174ee7 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -46,7 +46,7 @@
 #include <linux/rv.h>
 #include <linux/livepatch_sched.h>
 #include <linux/uidgid_types.h>
-#include <asm/kmap_size.h>
+#include <asm-generic/kmap_size.h>
 
 /* task_struct member predeclarations (sorted alphabetically): */
 struct audit_context;
-- 
2.50.0


