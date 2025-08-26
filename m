Return-Path: <linuxppc-dev+bounces-11284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C1B352BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:18:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vY100pNz3dDp;
	Tue, 26 Aug 2025 14:18:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756181908;
	cv=pass; b=dr7SBlo74IXFtc6qppgurryFEa8PcgmcUpvyLiMakyU8x33wA2JODeLCt/92mqJqTzG7LKb4OmAsp5LhEE0gK3PgkUj9EBjmVt3mZUHYSExBGackvKNXURVSjkb4VK92ShxuDpO2rDji1wPOFc6AM6BqkhvmlN7k6d3qcZ/MCOGgthpNmcbiYWl5PXFRuKEvJTANj8MrbNFN+cQHUpZam03LL28ReoRI8CaemFXyNOpOPW3pyvMztJfchCHVZFM0a2oyZVjI1LJXviphXDossGUONbLk7iKMQgDYhCls1ZtexTkZRSVfcuu0W9nybgCFkYfpksKnb/JWOFsriu/7OA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756181908; c=relaxed/relaxed;
	bh=Trrev8dOAXH9haOFCq1Q86Fg7QNBF/bvlm/NED7IrNQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gSYg2E+r6c5ECb5rCsVni3bB/RPqJvsxmEhM4bczTcfa26WXJMpEcv1tNNQzIonMykz0kGetI87sIO8nJD8tky6/T9KMCu4icqbf+Cpun9EncFISSUqTaPp6jLJr6wN1DKUOyarJR8HALFmZq3+nt2+r6TqXpt/AwvKBoVmbV0qAN9Z0reN0+soVp40BJqMU01iDpH0c0rThAgoCjOu1UUEx0ydLbqd+B+znQVVM7j99hAkQm1FUpVdumTs7IdXnVFrzD+H0dwofgqCLEKGvkp2/HIaJNzxK/3WGF64K1NDnlXlevSjyAR2qfTz56X3aGUkUHLRsQYAikq4LlE2Ngw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hG6tyzxY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hG6tyzxY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vXz4B74z3dCy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:18:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmRhKW7vSQQeMAqU4Su7YQhd+QgaSsWp6/y6+dvkDbmAjXplKQlKNNo9mYrM0Zq2p+OlhAQTwuZLEIou18TEXlgk1jmAjt5u/wQ3sJSjeTj7gnhNLSq0y1X11lsL0TL+RmwB0w4nmTkM9Agx2Vb0IOHbCDwnTIwvok3anD3bX6S8latDgYtyORvkp7mkW1JBi2zin7PDyGgG4QdOBgFl2X3VAlj0LxHuKIM1/6qBQhejzREaxhcyvCJebjAGwIjNB3mRi5p6NoepSoLiNgG1vHc2nspiuIr8GnetAHblN1fxARmZ6IqBKxiL0hqS5NheBuTb+FMtGrdwv1Gc6424UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Trrev8dOAXH9haOFCq1Q86Fg7QNBF/bvlm/NED7IrNQ=;
 b=t4tKyaLAClwJeeHn+o0ii+4+GDJVflq4aXkNid5RtlFiTXRmJL9SIGW3TPCKMP8o9GfLzRGBCqi2lJ7cGvRU06AhazRvUV1IQrgLZTION1LR5qqtpwj63Yr3KcAYI2PCdbCdQ/0GpVllR4Cl61O3lQkUymsOOjUBVYZevc/p4L72VeEOtTwxbq8nyQNcYeBLMLUKF6RL+0LF8m6p9M34x0yPx0lg3GOGmUp3rrhjhFxGNzzOOT5J+hHMwLpQwOrK9HC8hf/tp1VSTfmpm4d80UYKLTwb0kJvelUkWfRr0T7PhMHnZNlkfvgLHjN6u7cQYZEX27/aCMUt+MNhrMNGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Trrev8dOAXH9haOFCq1Q86Fg7QNBF/bvlm/NED7IrNQ=;
 b=hG6tyzxYbNoXRGogDfDkWdXl56PEGMLvkK/NqZ+FG4yWZEoeEb64IBVYzpNJ9I6vLv4eeNB1UIUIGqy65cLwZdiyVtuIAnvMlV6642kSoqA2IuDCuqRJ0WJKmq6Uz7rrBmyb3Jv6U+OHYuNVAJBKVALTjKw/sBn6A16RuW50ZK4=
Received: from SN7PR04CA0090.namprd04.prod.outlook.com (2603:10b6:806:121::35)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:18:07 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::b5) by SN7PR04CA0090.outlook.office365.com
 (2603:10b6:806:121::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 04:18:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 04:18:07 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:17:49 -0500
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
Subject: [PATCH v7 8/8] sched/topology: Unify tl_pkg_mask() across core and all arch
Date: Tue, 26 Aug 2025 04:13:19 +0000
Message-ID: <20250826041319.1284-9-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826041319.1284-1-kprateek.nayak@amd.com>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf9574b-495b-4c2d-1197-08dde4578f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3gNa4l8fQ8A2pHWg75ACnMIeYE0RJ8cveFPqmSRT2HozhpCh2hQCecqYNQ+?=
 =?us-ascii?Q?d47IR8e8GYgPhS33ZqGDswuM7VLxLQOFVBfHYMbgRwDGPmJKGuxra12yFbXm?=
 =?us-ascii?Q?dgbdepYWl2Cny+fM2JpZjhixkvhf0ImRH3F2tlm9iZtIG1IlZE37IIB8kNK2?=
 =?us-ascii?Q?ajgXpikrzJOlfZqfiFndIf7PA1fUosVy0pqPRsj0OHzuNVQtMi35ewNmv+q1?=
 =?us-ascii?Q?X95fcp7ul0qQSSoY4IZugpyH5Xvhm0Er1tI2sr69simBHHLcNWPPWdFTMv8g?=
 =?us-ascii?Q?ZGkbZsjoXHF6cRnhDhyRVSBHa8T3vaxn5yicUbP8Z6qCEZjjrJ1EA+cOOyYw?=
 =?us-ascii?Q?5GhLGacwqMHuLUuipTpAU0W1fWOJHtaxNq2zs+FDtwMjVKTGYxbxeIj9ZiX1?=
 =?us-ascii?Q?jpfJlD4gxwVQp2II3+9i6yDQgOd14fc+Vo8NJmtmaYQ5WToURoOIAf+2Jdtl?=
 =?us-ascii?Q?80eG6HMUivE0RIYCwotYPvl8Jh6mbNuL+wGdZDXhFCLVIW1thUkWwTo7TtJH?=
 =?us-ascii?Q?OUitqG2fnIkW6UXHpHQnE8pQhx93ITjdvFqL8fZ8y8dJJNqVyUjHEmTIBOKZ?=
 =?us-ascii?Q?GsEcbPxDGeoDY4UoaYb3ZnfZk0UwY3ew0xtgTCUvdEFSjCeQBzqzt/dUFKXM?=
 =?us-ascii?Q?jokkiHl4oPVqTOqGeccgcfkZOkxzE+HImDN86a2PjeE69e8Nfciq76EgTDkj?=
 =?us-ascii?Q?Jz0D9A5TqzmqWoFY6YdWzFfi/WLJMgTny0GjLCeAEbIoXpKkQPP9h65QN8NY?=
 =?us-ascii?Q?vKkJPCQPuM0GNpaa8etmcdAl9nqNIz2302jZtbJ8TE5Ye7Ar5XsCXNRYHxhM?=
 =?us-ascii?Q?3y3Mfq+SsuWeocFJJ6QlzQ5pPDKG1j2paeNfglz+MaGlyfE4y8+lM82pdj5F?=
 =?us-ascii?Q?VGrSjaq5BpmyXxSSiQNtEo2FNLlPqBH001Fq8foHuHcvmSPzC0kJWaupqtzE?=
 =?us-ascii?Q?UsBHTTcEPVJPhlOV5dpdBCZhvx/TNWFz+DB35UcXmvUsOcYOanGLpQGls7HE?=
 =?us-ascii?Q?Z/eiWzCdEjJa5n+XMd5sJtZ2Lz/hu7zY0P6iXGP3ZZIRyXYmvwDcn07nkJ/c?=
 =?us-ascii?Q?U+Lgh1OWmNXSLrjpCjraYWnMFFg6S+Nl1bLtqcRqJkPHq7mOBCCZwwGUPd/e?=
 =?us-ascii?Q?nn4LvGM1aErPwoL5askZQbgszfub0MOd8i99cGqnB+jto74OzzjuRqpTq5FG?=
 =?us-ascii?Q?gbsGlYUAvU6qE58Xm3aZQGcxoi06xL4C5bKLj5sSc4vux/YY++9tixuR+bjm?=
 =?us-ascii?Q?XNE4ZjpoUPdFv76bxCIutaaocYDEx+yf/CcEu4PaDXdhKJp2h6EzJnES7Fl/?=
 =?us-ascii?Q?VX5WRM3tYTodB6eWkhdZNYd43ilT57rp3cGH7LysZTO+aXbisOGNdx2Ugrwo?=
 =?us-ascii?Q?6LC3lDCcuGSbhUl+tst8BB5W6O3jRIGBT1USlLiYGHAE5/m+2mu7cN0plpon?=
 =?us-ascii?Q?OfmJ4BLuUlMoqX1U+Iz/fFLwu+ptCF5V7RbYgQQWgOpZAj3U7WVgG3AL7T49?=
 =?us-ascii?Q?mc6YcJC2X5mokL6E8Wrv9gR+7ruyTDfOCCnjBrCDw0bBkftgn4E/NFl8ig?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:18:07.7834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf9574b-495b-4c2d-1197-08dde4578f92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Unify the tl_pkg_mask() wrapper around cpu_nod_mask() across core, x86,
powerpc, and s390.

No functional changes intended.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/powerpc/kernel/smp.c      | 7 +------
 arch/s390/kernel/topology.c    | 7 +------
 arch/x86/kernel/smpboot.c      | 5 -----
 include/linux/sched/topology.h | 6 ++++++
 kernel/sched/topology.c        | 5 -----
 5 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 40719679385b..8e869c13f7ed 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1064,11 +1064,6 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 }
 #endif
 
-static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_node_mask(cpu);
-}
-
 static int __init init_big_cores(void)
 {
 	int cpu;
@@ -1728,7 +1723,7 @@ static void __init build_sched_topology(void)
 	}
 #endif
 
-	powerpc_topology[i++] = SDTL_INIT(cpu_pkg_mask, powerpc_shared_proc_flags, PKG);
+	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_shared_proc_flags, PKG);
 
 	/* There must be one trailing NULL entry left.  */
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 8dbf32f362e1..8f5b6ecc055f 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -524,17 +524,12 @@ static const struct cpumask *cpu_drawer_mask(struct sched_domain_topology_level
 	return &cpu_topology[cpu].drawer_mask;
 }
 
-static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_node_mask(cpu);
-}
-
 static struct sched_domain_topology_level s390_topology[] = {
 	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
 	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
 	SDTL_INIT(cpu_book_mask, NULL, BOOK),
 	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
-	SDTL_INIT(cpu_pkg_mask, NULL, PKG),
+	SDTL_INIT(tl_pkg_mask, NULL, PKG),
 	{ NULL, },
 };
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index bfbcac9a73d1..6c0ab30a80e2 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -472,11 +472,6 @@ static int x86_cluster_flags(void)
 }
 #endif
 
-static const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_node_mask(cpu);
-}
-
 /*
  * Set if a package/die has multiple NUMA nodes inside.
  * AMD Magny-Cours, Intel Cluster-on-Die, and Intel
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 075d1f063668..807603bfe8ff 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -71,6 +71,12 @@ struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
 }
 #endif /* CONFIG_SCHED_MC */
 
+static const __maybe_unused
+struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_node_mask(cpu);
+}
+
 #ifdef CONFIG_NUMA
 static inline int cpu_numa_flags(void)
 {
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 77d14430c5e1..18889bd97e22 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1724,11 +1724,6 @@ sd_init(struct sched_domain_topology_level *tl,
 	return sd;
 }
 
-static const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_node_mask(cpu);
-}
-
 /*
  * Topology list, bottom-up.
  */
-- 
2.34.1


