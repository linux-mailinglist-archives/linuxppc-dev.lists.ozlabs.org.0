Return-Path: <linuxppc-dev+bounces-11283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D79B352B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:18:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vXR5Zc1z3dDg;
	Tue, 26 Aug 2025 14:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756181879;
	cv=pass; b=ACU9GW03e1HJHoqNt31Cf1b6EIuni0lqtkG2YOXLCxqvhoH77SSDdv91G3w0GWqbAmsbsve0+g38TE2RLH2PK2cGlyhoS9W/HPlS+j5Fu8XjFv5Fb6iAMCxYP7Dc+hbOnzRfDVDj8VEIndwwp3equ0b/XxpwgwPQTPLqvmxlBZC/EfHAOcUWh8EzqsWOsH7fqmXPOtHdPDkMrAr3PLYjV2+BjRYAApSGUORGC0R1nSsVhB28cMNTVSJNPumcSlNrzJ857LVXbQly/2TmkEhnsSrCxi+0DKhcT0J9TitOL9b5UiVkrQMWUMKUUga3CLkuEGuo8GlsPCdjnJ5RHBkqKA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756181879; c=relaxed/relaxed;
	bh=sYnaRDBzFZBmxyPL0JhaaiyuGWZefXq0zWh5H05PFt4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPnsjc+R3L6ZnoGXYD8O+MyujC3Zzq/++S1HGKtEWNc6Tu0TZEkLoyyihOApcyfC7NCqAqOKniMo6XCICLjDaWWx9tLt+Hzq2OAJSA/ba6sjxO4RgV4AsEUkVcXqgiKFNYiqWYY+JkUY46jqWQYGrSwT0qs5DaXJ6iaqjH0o+aLMCRkBsAOLv8y48ZutVvGtUt2GnImKA3HxPzfMSVE6rp+Odtp4TjENcPaNy5EKtnqKIiJIh4cjLPooqmZ+oEewzbqiWV5oopVBKqt3hP1IDuct71Bs1XRZjJXC23Pn1nrtct7iw9JCZ+bEvUMEtPVdfoEarA1HD8eEYeeH2yRENA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O/lY8hRP; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::608; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O/lY8hRP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2414::608; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vXQ6Hxwz3dCy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:17:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVWDGwuQdRvQkpnvfWPzvVEhOtUd6atVi4+F9CVRiyA9GgxAmx+RejbMBHDAPjk/l7nLigTrYCDcKOcuuhml6yl/5Gu64HK+GhWKTB/Ded20MzR6GiJyhgejeVIVXk7eTF40JTUk9+qxREApLAOB7ZTKmGj9T6gHV3mYQ1rQ/TZEvlyMI5skodwfUDhULCgd58EnH/8nZ7RRzYf/Y3gR4T7e+AA6ofd1c7wEo0y5O8WJ8M6YLq039toeHMkRZ9ooQRFSpBjCM7qCZCaz20I/p+diJx4TT26+ndnOB3bukom5IX2MNwCFEbeDI4UVxAE2bs/QGZZVd9y6os02j/+u5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYnaRDBzFZBmxyPL0JhaaiyuGWZefXq0zWh5H05PFt4=;
 b=Sw52nqxorEcW7gA3Ondid2u37MMjnirIJotfalLPxW4n6ufdX0yWi5JHCxLLM6II1TBKJCTNZy7TkwkjkhyXo9WQ86tuXP6fXve9ycjN9pc16I8u4dtS1DqjRY2ln054OfguoZi1zjJ9gwwOSSsNNOaryUK8gPFa2AfWCLLFx+iqUDupSS9CH5aR3e/JRtTrpf5jT9Y/rxlrEHi+uyefj/LqEPRUsqHsbFtLUwQhTJ+wapQyB2HEU4vKPCUZlkLmuRocItoFR1q4yjpUoDKJbMilwx+F19w+zIRZbMF2vFYwYePMKi2+4/VOoFiYX8up+HxErfhbR3umD0WCQLL7gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYnaRDBzFZBmxyPL0JhaaiyuGWZefXq0zWh5H05PFt4=;
 b=O/lY8hRPUwDGentY7UwBXz2O4+GmLix+LpIzmGN4hMV63TwQ4ya9jrAyVY5eHvtf9LlSJgkRUH6oSZeIpoAagOFUp+06bK6SkwfnsoiU5ksMgGGWCPUUWyTTliANbXsVPHSAuVpJUWZtStiUCHLdvASQTDFGDlYTbeGmgJNZFAs=
Received: from DS7PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:2a::7) by
 MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:17:37 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::4b) by DS7PR06CA0006.outlook.office365.com
 (2603:10b6:8:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 04:17:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:17:37 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:17:21 -0500
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
Subject: [PATCH v7 7/8] sched/topology: Unify tl_mc_mask() across core and all arch
Date: Tue, 26 Aug 2025 04:13:18 +0000
Message-ID: <20250826041319.1284-8-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 026de211-a919-4121-3960-08dde4577d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ut72yEIRbDREY6MMQzRO1i9j+neW0C40FhfgRKY7ATeWElVFyVoG70pgcfKs?=
 =?us-ascii?Q?QOBbOEzw0yLSHI5BVMQZk0+omMUNxtWmkMDB6omT4PQf8WkIRQ/M0DLejCZX?=
 =?us-ascii?Q?WTQoAKtxKhoV0EgqkvQtBIGJLBREmnxe2sqEPTQgcYGKPffWtgUf53cMEMXo?=
 =?us-ascii?Q?3PzobrwDIAnskFUODuGX0u7UgZT20OgYxkeMgZQ74I/UVL0eu0JqXZTJVX0k?=
 =?us-ascii?Q?x33aHSFLIxJwo802khWGKPz9GcC554a3IMj011fvKcH4XKTi7QHdIOz7UWTP?=
 =?us-ascii?Q?Vp0B3z1zcMEDvm9LM1/zFQNbr3fx0+7yLn6E6/+bGE7v9yRQdxDGpbVmlGQd?=
 =?us-ascii?Q?Eh2oyJea6Lsxm9PLC/byDW+oXELPsQ29+zvwyHLK/HwBKMoytpOFewXtCQwn?=
 =?us-ascii?Q?yWB7Yt/g22nZ6eNNtZUPJUPO1kG7IuhNjE2dDZT3lqDPkj1aynitJJ9D5WWj?=
 =?us-ascii?Q?BnbQ8dVuw4SekVxfXkMRgSKenuV+AqahyqMoml28xuoqilrZZRNOXQsyZ15h?=
 =?us-ascii?Q?glEsMs2M24P2OGg6wYDJF20NhxWpgH07si2WLyAVlPET+4tJe1PiQYZIVIV2?=
 =?us-ascii?Q?R6Xn7EeFPHD/MY4yxzbYTFMTFA/Hpz9882b1doyx4/DKVVftxvvNO0dNMfCN?=
 =?us-ascii?Q?bf7/LHp3pneyOqmPyh+jIDwpBqxgVoVCfUthj2BtaqorDexf/sCyYzFAeUxJ?=
 =?us-ascii?Q?luSM7xaMsPqdX7LOx+RTFKoL0U174NDaAuqaZPEZJNZwCwZ13MoU9fecOZaX?=
 =?us-ascii?Q?dEF7jajbDIdvmvN+4p477qVHcbvr/I5Cg0gZUflT6DmJYvttbNDMPb/nwm8B?=
 =?us-ascii?Q?QTDav1crzEgbaqPSnmZ3he/Za3Do1SlWcsKW0sEPsTw7CNYJkwXs35HwhnT9?=
 =?us-ascii?Q?kANmqBaKut7Go/qTm158mvsJ783+cIzUWOONfP3xqR53n0gOuu82WfvvVl44?=
 =?us-ascii?Q?rfpO84yAORDbqa1CwiK05LEODcaxqHVJybbvc/bnF7MJbCE9yMYHe4/4+T+v?=
 =?us-ascii?Q?GugsYJsY40NdS4vQgMVl4Wml8H7xzX6OvZX1WM91hgRNiZgqNr8w1MSsb3Wv?=
 =?us-ascii?Q?eDrrA1Z2j2jyeEKmNMssV9urJ1v5L3D43888VKE8kKosmCW7xy3w6MTiDh51?=
 =?us-ascii?Q?cIi0TpA+3qyO1QETSumz9a+p5JfUhwdI7m493zJmJ6Dhnjmcnz6zH6UP7zS/?=
 =?us-ascii?Q?tUBwsIr38b8Np5mWjzPBe3fb07j4uk4sFOcI672JtVVD8XTCCSLPCizfc65o?=
 =?us-ascii?Q?JwJ4SAN89JfgaQBq09FYkVPecEm9dkqSmbkbzb7z5NVUQ/fUIgLdDuvE7ztc?=
 =?us-ascii?Q?fRXy6mm1aKYq8rZEmKrZKpfS3Xg0ilo+wEq6d8g3lRUxVGwvBHRd4zi9EDW6?=
 =?us-ascii?Q?SiPoB6IIJWa4NntGBYl3nHQXFtTyquCrj8OxR5FFWIz6gkuQ+n7oJNrQ8I2I?=
 =?us-ascii?Q?MNSwEBbPD0ZmLDaYMRlhgooUFZkmfCPSXPYHk+51IVv9Mg91z7WM2exj9Ohw?=
 =?us-ascii?Q?Kexs9EN1Rb9bwgLkNq5XZMHdX7lO2K7Q8C/0R/eeOGo5uwS19doPYdm89w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:17:37.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 026de211-a919-4121-3960-08dde4577d52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Unify the tl_mc_mask() wrapper around cpu_coregroup_mask() used by core,
x86, powerpc, and s390.

No functional changes intended.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/powerpc/kernel/smp.c      | 7 +------
 arch/s390/kernel/topology.c    | 7 +------
 arch/x86/kernel/smpboot.c      | 7 -------
 include/linux/sched/topology.h | 8 +++++++-
 kernel/sched/topology.c        | 7 -------
 5 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c58ddf84fe63..40719679385b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1062,11 +1062,6 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 
 	return cpu_node_mask(cpu);
 }
-
-static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_corgrp_mask(cpu);
-}
 #endif
 
 static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
@@ -1729,7 +1724,7 @@ static void __init build_sched_topology(void)
 #ifdef CONFIG_SCHED_MC
 	if (has_coregroup_support()) {
 		powerpc_topology[i++] =
-			SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
+			SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
 	}
 #endif
 
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index c88eda847309..8dbf32f362e1 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -514,11 +514,6 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 	return &cpu_topology[cpu].core_mask;
 }
 
-static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return &cpu_topology[cpu].core_mask;
-}
-
 static const struct cpumask *cpu_book_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return &cpu_topology[cpu].book_mask;
@@ -536,7 +531,7 @@ static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl
 
 static struct sched_domain_topology_level s390_topology[] = {
 	SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
-	SDTL_INIT(cpu_mc_mask, cpu_core_flags, MC),
+	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
 	SDTL_INIT(cpu_book_mask, NULL, BOOK),
 	SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
 	SDTL_INIT(cpu_pkg_mask, NULL, PKG),
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 81a40d777d65..bfbcac9a73d1 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -472,13 +472,6 @@ static int x86_cluster_flags(void)
 }
 #endif
 
-#ifdef CONFIG_SCHED_MC
-static const struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_coregroup_mask(cpu);
-}
-#endif
-
 static const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return cpu_node_mask(cpu);
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index e54501cc8e47..075d1f063668 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -63,7 +63,13 @@ static inline int cpu_core_flags(void)
 {
 	return SD_SHARE_LLC;
 }
-#endif
+
+static const __maybe_unused
+struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_coregroup_mask(cpu);
+}
+#endif /* CONFIG_SCHED_MC */
 
 #ifdef CONFIG_NUMA
 static inline int cpu_numa_flags(void)
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 4530cbad41e1..77d14430c5e1 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1724,13 +1724,6 @@ sd_init(struct sched_domain_topology_level *tl,
 	return sd;
 }
 
-#ifdef CONFIG_SCHED_MC
-static const struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_coregroup_mask(cpu);
-}
-#endif
-
 static const struct cpumask *tl_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
 {
 	return cpu_node_mask(cpu);
-- 
2.34.1


