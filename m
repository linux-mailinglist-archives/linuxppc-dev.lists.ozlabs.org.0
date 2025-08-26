Return-Path: <linuxppc-dev+bounces-11282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A3B352B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vWr3jprz3dDk;
	Tue, 26 Aug 2025 14:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2406::62f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756181848;
	cv=pass; b=ZprcQo1LVsCT4Xvm9lEI/vFPK/2FjZ9VZgUraHRhs6MRvy0PGT6w3lJfY691J/fgBK7VDiBQYtFPsNjTP0R53irIJWmvMPZ7C1NVEqAE3bj8kUBjWWQuSPa0WQPtdydvAuBCRE+lssLDnx7e5iynsCnvANTUM5dvSYtWhyjtkrQwVGVFNwmGFJ5J3tejOQE9boaaOd9CtyMdgal9w1Y5smrzuSvo6sW5P4/GrrYA/3eylwPq2Wad9H8opmVzc7aQFo74lW/LgVrVEEsXcPfoFiDB/DF+QxrIeGfenX+AfVLmnAkGLfBmfv49gc+9s853+ZVqU4B3lpDBKYxzvfGQzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756181848; c=relaxed/relaxed;
	bh=zSMMkTOzEEAm1ybtgfakw/rdRjNHGUznEG2VGtjGKYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/rt3ESAw1Kh+MG27SPm2BVGyu9Ij0SmPB8JLifmddMJtNG0VqOCr/fXdN2Vqd9xjJHgPAvbUbmSXy12aySRTRYSJxT8iC0YjttT+oDOsbrP3jbDhVCKCkVl3UAtmiBmA+R/62EWuaDMEOWc5GtwfzHQcPNVBACpjUCOl8kG8fzVqlJK7hYcAS2nyBsSGlQ6Xs6PBtXrFP3CZIzbxgKPuoBhXBbz1DQ/cI5kmABE31U7yewclj+GETeY/RE5IUd+0BjcqknLg9o4DHVVqQBM6dyNh7oqAyloYHiCyXuEpvpj61POFzgGd7HkCx2eef/CNq9pjne3CWg6jHK6JyCQQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FO5+Y3z8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2406::62f; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FO5+Y3z8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2406::62f; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2406::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vWq6x5sz3dCy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:17:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3NExZ7RwJYrazZQAaDjcDW7vKL73h4hZjCFueDa+J932oVnYLZvpQqKshdDJ2X14XINOMtgKIBcIF4BBlnyYFqpamICid50rJI9SN20Ue3MD5V8clSimX3WAKzeXwBVjVaaQSKyxAZnV5RPqTnHHatw3iSlLDUOnIYyZ6vNJY2VRK/dhMy4GGIw++u+nLvuMV7lPkwdHHUF6vL7OHePEkY/lNvt/E//KroIXh4EdkFPeou+HxCsEGTqR5Ja27kzD8DkcOnUMgztiLtH58OcdjEXpURpFJJkk9RG+V7tAAjXGOCS096QIEhcZGdKvQ9rBfe8U2GOb16wvXZvtL354w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSMMkTOzEEAm1ybtgfakw/rdRjNHGUznEG2VGtjGKYI=;
 b=pz0hT30fMyJWlL7yHkBIodweKQwx0ez5KHHPuRTvZIU5ZfYpXR6XX8ldt4Dbu1sfLZpz/CQ5MMXIvuSHWqk4ChZ28wExRyWCfVgIaZlZvRCR5P4qiFgXCH7fxcT8jCIUhryjQGMLeZbx2jk2s5pRBNaJtI0QZQ68E4zEeIKGdvZhRL+dfzWgaP4Cr8PZr2DplLEx+NwocWH2mLmdsyD6py/uOTF7PVog+qkrNm7juTTg3wGFGFoB6vcdOV1xFlPixLMl7GwB373/gdP7ELrdYkvXfcfLfqTaSpYNLW7k1o2qq3bJmu/8uHvWoAS2oQrs3h8sG818/leNVWQe8Ev/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSMMkTOzEEAm1ybtgfakw/rdRjNHGUznEG2VGtjGKYI=;
 b=FO5+Y3z8ReXM/b0BRf/2pfoaVPoGv6aEa4TD8Sa0Q70/8gUfBzHab1laWWM1c7eZEhrLyly9AXsgBLzwAzezHkwO0GIng/axhdZU+cvG/jxRzeXhUgYwPWNQA0zmYZubqMo6cZkb9p7Wv/KwkGgfYrQG1b3icj3Lmf7zYRmZrTo=
Received: from DS7PR05CA0010.namprd05.prod.outlook.com (2603:10b6:5:3b9::15)
 by PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 26 Aug
 2025 04:17:08 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::21) by DS7PR05CA0010.outlook.office365.com
 (2603:10b6:5:3b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 04:17:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:17:08 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:16:52 -0500
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
Subject: [PATCH v7 6/8] sched/topology: Unify tl_cls_mask() across core and x86
Date: Tue, 26 Aug 2025 04:13:17 +0000
Message-ID: <20250826041319.1284-7-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|PH8PR12MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 90bdcd1a-5f0a-4fcd-2780-08dde4576c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zYbVvOvQeiVDW+lCZKOBgUNk2sVt7sekS2OH567Y0EQiicqIDn+BukR+oc06?=
 =?us-ascii?Q?szM3yzLXHbyMHD0BCqqW6NwIpS+jaNV4+sWHJ3WEvVv7xe5M+Y8Yk6uEVnee?=
 =?us-ascii?Q?X1NHQoOQL1l6av3fdoO1rWvgxd5JYRLbRiyEUAmJC9iM/RtKTbFLqCMXr9gR?=
 =?us-ascii?Q?HUtEwkEMazn4AnR2/hiZHB/Vq8dAwKFXgQ+wOb+uDmSP5Wt2ETu7pm4UsQOS?=
 =?us-ascii?Q?LEX8epDfVqGR/6FTDGxxBnQNhiBrWdWEQgai/NNv7CPgCvkNPJd+I8ZhVmNJ?=
 =?us-ascii?Q?/+5OmEa63M6Mz2+kVEN10pSQ4DoqLP4EIkutDUgkfZV6tD3AH2B3kuHipN+g?=
 =?us-ascii?Q?u4sC1DErJ4QGJCKT/IkJeNMfYYp6SPcNHXVf2myJiDYxVCTQrkpau8r5TsMI?=
 =?us-ascii?Q?uZLZO/1S+4j4/vsPF5H1kSNYRvXBHWL9MyZNXtP2t0cCELmuvTQ2mFKoVhrR?=
 =?us-ascii?Q?Hi2BQ2XIIQKfJQGWV2cMAfvL1uRdjjYzkMAHq179tD0GrHKSL5Yh2hM9PR8r?=
 =?us-ascii?Q?c2212H6IA5cAqbo2mC96QxWLh+4N8kaIGvceWTSFpfAQjqmVCEQOyt13Assr?=
 =?us-ascii?Q?xISYzQLBS545yHyOeiN4ccB1TeOLrkJJ+o3CHKSm1qwt7kGduzzQ3g6zINNm?=
 =?us-ascii?Q?xjQDDBJfT7LP9rFykiQUQZfz++u6YauNDOYSE2CehrYgUCph57zZlSfvXaG9?=
 =?us-ascii?Q?YcnNJFuGx9HRDuAu6iPvgK/A3Yvq/pJx94R6Jvj+1DnFaH7KgUuXpD6YF0Hb?=
 =?us-ascii?Q?OFX9r8HLPowUValxy2Sr+FvqMeXtpAzfqjuaJUife7AuGmmytMVagfJsXw61?=
 =?us-ascii?Q?9iqWQIVkKounLHzdBwypfT+aIji8TK/UEUj3bUfEZrg3et/TV4FuEQ1Ar5aL?=
 =?us-ascii?Q?oQUswg+fTvDEEA0k6Ly9NXdn6MuYHuDPivpvgkxXMc2u9SEZtfTt1qvbE+VS?=
 =?us-ascii?Q?OvJW8l/GjgOuyrXu96BSWOhoGaIPYz6MZokIe9ZracQyUjbbI+Y5yh5zPxcU?=
 =?us-ascii?Q?g1okez7TX6ZcE05YzSaxaMt3TxfW2FwMEFFQ49+Znf9ctf/xmoUkcAUf9ezM?=
 =?us-ascii?Q?PQRVwvFNoMwNjB7OGlZDAuD8wp0n79OQ4/E5nMnJLQbdnGRSNLK9qVjYKhx2?=
 =?us-ascii?Q?1p0e9lC/ebjuUoJ3Xqll9D0+sw0zo2rkkfY4IWE8/vavHxPqWhdha+1i4+S3?=
 =?us-ascii?Q?KiKmcn22RbBsAcLG+s7rsSZ1fV3jCCVS0J2I9cpYL0SOt0gI6v5Vje7I4Yfv?=
 =?us-ascii?Q?ckw/Nj32mDjiX+/w6gEXJIt7VvuSd+YQaldG0+i+BQd0u22pmbYLkIYGQHy3?=
 =?us-ascii?Q?nDEif5ric2VhI2ZInmTxz1p7HoDUFQ3h5/qJxiVGBojbxZdkH2GlMhGjRaxz?=
 =?us-ascii?Q?/AHHxHB/ShbNXOxDdInZkSY89DTwOkAlmRmDHCJSAKJyupykx1iQUtkj7GVC?=
 =?us-ascii?Q?t0s3Y4UWZT8mPhEBpfSxJcwhS+5gNtR5Bx+so04IJdVxsvi45cQ28aGT1jbt?=
 =?us-ascii?Q?rHIXc8jit6C04OPC3shTmJWqFw6fV64erIOBsVOUBtjxE8YhN3E1RCKavA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:17:08.2468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90bdcd1a-5f0a-4fcd-2780-08dde4576c18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Unify the tl_cls_mask() used by both the scheduler core and x86.
No functional changes intended.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/x86/kernel/smpboot.c      | 4 ----
 include/linux/sched/topology.h | 8 +++++++-
 kernel/sched/topology.c        | 7 -------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 03ff6270966a..81a40d777d65 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -470,10 +470,6 @@ static int x86_cluster_flags(void)
 {
 	return cpu_cluster_flags() | x86_sched_itmt_flags();
 }
-static const struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_clustergroup_mask(cpu);
-}
 #endif
 
 #ifdef CONFIG_SCHED_MC
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index d75fbb7d9667..e54501cc8e47 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -50,7 +50,13 @@ static inline int cpu_cluster_flags(void)
 {
 	return SD_CLUSTER | SD_SHARE_LLC;
 }
-#endif
+
+static const __maybe_unused
+struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
+{
+	return cpu_clustergroup_mask(cpu);
+}
+#endif /* CONFIG_SCHED_CLUSTER */
 
 #ifdef CONFIG_SCHED_MC
 static inline int cpu_core_flags(void)
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 92165fe56a2d..4530cbad41e1 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1724,13 +1724,6 @@ sd_init(struct sched_domain_topology_level *tl,
 	return sd;
 }
 
-#ifdef CONFIG_SCHED_CLUSTER
-static const struct cpumask *tl_cls_mask(struct sched_domain_topology_level *tl, int cpu)
-{
-	return cpu_clustergroup_mask(cpu);
-}
-#endif
-
 #ifdef CONFIG_SCHED_MC
 static const struct cpumask *tl_mc_mask(struct sched_domain_topology_level *tl, int cpu)
 {
-- 
2.34.1


