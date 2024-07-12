Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29592F847
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 11:48:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0y8Ceypp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL6Gb0Kl0z3fQs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 19:48:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0y8Ceypp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL6Ft09GDz30Wm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 19:47:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTwphXtAK95fzBgcBN9JgePqEN8PPAIqL8VrKa+77lTV0FhcsUGECzjPoONB+CA4kpS2OOqNHc93ihd280IlG2vW/zU5llPOKNP+Vyc8ZXeicwd8AOWy1GyqUVXQT95y+V/q8szk4GsrPSR7H1aGxLC6PmNTOU/E6EiwKA85BIQ+8T6FoEgw4Z4nVodp1N9D4d6R54CUYB0F7qV2J6gEijuOl0vXadpMYPgstgWBvxfZVtb9xwBWIPSJ1qaw/B4muleFTgybiZ85oQPLtcrjLNdV8RiVdmviB9UhBnkIKhcakXmt5c7zwAJETu7BWqaQL0KGAdUfIuiK4yuOQpfjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJZXjBLWcbrbgMRMZuKwQfHl/VO81dqdzQAScG0vTlc=;
 b=YCloNrybAZQNTHZQejjO6kJXc4InhhXg8T5UVJqZzVhJ2U42QIo2Z4sP+AsKR2T0TIKkb2I+/BXMig7U/ASKNDd1kGRY6CqpEylS+ALVHw2IpiH0WW1wefavLDze9AMkrfVnEuAFdnDAY+xulbgGcqJd0q3Wn3k/BnLzpqJKJd7c/YQb9xUl/ZF8HyFNmG/dbQes7aFkstfo10YtYyaLGYa1cX84vSacPfl9S96Dzg8m9TpcGPlnEb/Gk1Uwqnlc//Jt55m7EX5AInPpV4RYTZVrEJ7vJlL8ZQF9ElVZ8rzd5tsDA+VEgCgQk9mwyg+yN1MB1J7n1WcL8bjg5Y9GuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJZXjBLWcbrbgMRMZuKwQfHl/VO81dqdzQAScG0vTlc=;
 b=0y8Ceypplw68n4rPjPSXAcv/E6y7+tQaLXk8pRTZtPsc49JxekwaAC9jtUvylcagOVIkx8ylXXVZVPGLnW6YSQ4vgbXZz8s4TA02/srvvWOqCz++lHjy63t3n4N5uN7FLKIbJPx+G7+a+4lZQ6ctV2PIk5ua8syXGejiu+dLmTs=
Received: from BN6PR17CA0060.namprd17.prod.outlook.com (2603:10b6:405:75::49)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 09:47:03 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:405:75:cafe::44) by BN6PR17CA0060.outlook.office365.com
 (2603:10b6:405:75::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Fri, 12 Jul 2024 09:47:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Fri, 12 Jul 2024 09:47:02 +0000
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 04:46:57 -0500
From: Vignesh Balasubramanian <vigbalas@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-toolchains@vger.kernel.org>
Subject: [PATCH v3 0/1] Add XSAVE layout description to Core files for debuggers to support varying XSAVE layouts
Date: Fri, 12 Jul 2024 15:16:29 +0530
Message-ID: <20240712094630.29757-1-vigbalas@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5306eb-1365-4a0e-0cde-08dca2579521
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?evFm+d/sCaW6gE+1njAKlg93o7P1Irlko+0dmUYsz/1pbvmiN5iLIhpnnQuU?=
 =?us-ascii?Q?FMSVFltit2Ds/1IvdfJR8I12zCuomIR5D/ulVGQmcugARupdWmQJMvcROdXJ?=
 =?us-ascii?Q?8NQisAkB31Gfy7HhoI3PJ16LBIploDbz5Nse1Ju/GerbWDXGHYgKPyvOThTo?=
 =?us-ascii?Q?jr8/Jh4sUSxyLYzn6x30PnVrDC/3R5OCemUDk/eYZ7baRpzAdqt2RFRd1IB7?=
 =?us-ascii?Q?+wxs63bP4Xv39mvIQ3RzcdL19OoR+tt+q43oBkFPyos5up2/nTRcfaoK7Ise?=
 =?us-ascii?Q?hX60ss6SJtoQqEwMKG2rO+0zapGPig5+FQ2YHf5UZfUofvEOoCwTZt5t33M+?=
 =?us-ascii?Q?JdU+3tA5cYQA0CZh7Dh38NRkiVai1nG6Y4n8iVCK2ZcbDEC2W1GFb/lFoFrS?=
 =?us-ascii?Q?SkOjLvMlyyKC4aMqrtRitjPW03b4tVoEByLxJ42UaYoCI1t1S5TYN9jW7+cd?=
 =?us-ascii?Q?hOsFhKia0mBy5zMIXDH1g37nmjzTWfH6ecIHjBgBKgiIQWfpoTGSzthcmx8I?=
 =?us-ascii?Q?J1XLfvwfwlVwUulAUZBNrJ/fABSA4/EmycFkCG+NJ0Laigs6vbSip5zgDTUa?=
 =?us-ascii?Q?dHfHOrGKZLKccxxh7bDBC9gcxI+B/7LwdDVNBOMt23EjUA1XaAYzatMoUCAH?=
 =?us-ascii?Q?3NOBonE0zTKkTJGS7DjaJQQ/As4Z82qi0Q3TIj1Sa+qsJvVk6l4EFMgcfHCM?=
 =?us-ascii?Q?Fqlw7dNQPGaOGe1lfKMZMYNGPH/PEBChUoi66I0fIY91XuOgWDV53LKlG/5C?=
 =?us-ascii?Q?gLGx8h8tLrmMb8+LBFzAVn8Dq9w1rzwAO5wdCcK2yRDfEFBJ3SmSYsxcVv6/?=
 =?us-ascii?Q?D8gZTW69X8p0EBw8BsGY4wIP3dOt5TfRxiqrQDOaUJo3E21diZqptu3LkfwU?=
 =?us-ascii?Q?/je7DLGtxTl9++S4hZrey6rfGQmg86amJIpui7I6l6T4QvVOwnKc/cq5Z6R/?=
 =?us-ascii?Q?L31FngMpAkMJaF8aFeVRe7R57ZI0FprEtGApRBanbxTSt7qDkIoDGlwv1RfS?=
 =?us-ascii?Q?/FtQAVD7KWyKle6BYUsPQ47b4g+AjPeQlDugA+cM8bMql4ALb6F6bRyVp33g?=
 =?us-ascii?Q?aJ+6rPXi9KbvyfVE+ErAveaI0roxabqhKW+yUZQRntzq42+FtjIqbxlfRFQe?=
 =?us-ascii?Q?LroQetPBPHiFJL8x+CDtY5Knu0pwTRCZQTDqvamI4bcW78jCijgG1vdgU+fD?=
 =?us-ascii?Q?DJekOM/XOGBCC14SjHMaP/utyxorOio9dbXdYeQliTaR2pL5qq6oj//wk1S1?=
 =?us-ascii?Q?YaJIFxq5rpzcZKiA0I8H9shlbp2FjzHXocOxtfwWShOqOd9FMUBaUuxvBn00?=
 =?us-ascii?Q?YC0DR7a/zbgugjTUhNOO6Eq3BeVPFdx3jHDjeJtIzb/klHag38Ojfzl3ebxj?=
 =?us-ascii?Q?dbZEbHFCnjGHr85/a/BylLPCfPrxvXan9kYtGf5PrBrPZe9qsga1KxD1NZsj?=
 =?us-ascii?Q?aTfTWEOr8iPGN/D84vy5YSGW7nqMJFdZ?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:47:02.6812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5306eb-1365-4a0e-0cde-08dca2579521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch proposes to add an extra .note section in the corefile to dump the CPUID information of a machine. This is being done to solve the issue of tools like the debuggers having to deal with coredumps from machines with varying XSAVE layouts in spite of having the same XCR0 bits. The new proposed .note section, at this point, consists of an array of records containing the information of each extended feature that is present. This provides details about the offsets and the sizes of the various extended save state components of the machine where the application crash occurred. Requesting a review for this patch.

Vignesh Balasubramanian (1):
  x86/elf: Add a new .note section containing xfeatures buffer layout
    info to x86 core files

 arch/x86/Kconfig             |  1 +
 arch/x86/include/asm/elf.h   |  9 ++++
 arch/x86/kernel/fpu/xstate.c | 87 ++++++++++++++++++++++++++++++++++++
 fs/binfmt_elf.c              |  4 +-
 include/uapi/linux/elf.h     |  1 +
 5 files changed, 100 insertions(+), 2 deletions(-)

-- 
2.34.1

