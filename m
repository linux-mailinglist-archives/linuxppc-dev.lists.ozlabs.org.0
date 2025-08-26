Return-Path: <linuxppc-dev+bounces-11278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D060BB352A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 06:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9vTY5HQCz3dBX;
	Tue, 26 Aug 2025 14:15:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2409::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756181729;
	cv=pass; b=o20NOY+rWkPZqo6a/twx6Ez0yIJcLJyq0jGnounnSEDqcMMoJVCWSiuMpS5SYzIHX0DLxISU6Ez83V9ShdAfVm7+scg9w76zNy0Rk4sFHBqtbOlG1jIbnOJufertnvBLYHidAoj0XEAd5ledAwPVIK9mSrLYMFqVsi3ZyaOmJ06rOVfgQeW28w8WRBxHe79fZl1sbrZX/1xHBHte89D30bV71Rvihf7ytOY/Kc1f6nT7q+EM+nMfoIEYYjGJQzQRe+FCk9lc382uDxtqvAhXSy7mtTSkCk70j/oRVAXkC7WolJMJGJgpcOWDSJX+dC8/Idu2hRMR0wxL/W3mduww2A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756181729; c=relaxed/relaxed;
	bh=5IH8oGZxcIwSCBKee6k1Y2kPyqcMYvW/bGsTY8BkelE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0gY5k5bqpe6BgSHCl1foIFZO+J92ANZpXgo0IX31RF0u+eAwMJzBsPtHs9abknrG875B0j5QTlb9/pyfK4ZLrr9lDzvX2o0yhYnDBaYHWC/D/dVad2G8FSP9TXcrgGjpnk3ZfbRc38geSdPHAHI6sQmoNclA9BKZQhvdAOUXi2jz7nQtNvce9QKnUTwi6Sx98ZFdEkRj99ifODFjalah+B/BN4ksIUjdbW9A+LbuPLTY7IWlzjkQJZzUxWrA4iu9SHH4x9eVYdZ+TFaurVFCq91SxgqH8mmzNJR6wA3UmaSpjnuh/TKd8B4AnZ6KLQqiTaKwHlKl9aebZINsUgcIw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FsBrP4Ym; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2409::608; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FsBrP4Ym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2409::608; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2409::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9vTX5lyjz3dBG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 14:15:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeMCsfL1bInl0h17+ylppjRpS8OUodiEQlkijwePRPSMCjilaVWPHxIm16PAulasztX+QoTWgOdnyc6eTMFAsFR3G/anWxhRhMdS8TcxxYIvWybqU6X110ENFFP/J2iMw94PtpSTLTXncYfyfC3REqADt3skhKor81uacBOn0iiHd22i1iUKASwdFVm0hH88IRDa/OKKOmd0QMKryCJoOgNQxJySjFCvU8irf/Q/uI9ew6k+33eePsO9LZGwAdsRMhDGlJbrHw2kJS3ifv/W96crVvXbi+autH+upr7js1B6AaQcmFIR7h8vNN3vh+O7h5FfRmR7glst4l5qI4GgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IH8oGZxcIwSCBKee6k1Y2kPyqcMYvW/bGsTY8BkelE=;
 b=vZGW5JsfV0qebQ7y/6HVXuzVIyEFI7/wYktUWBwBEYEvH14JneIZE1WUfDGCdJfV+FQ9iagbvoWynsu1F0y9OMHIhI3H3BQFcFjq3LSvEfz0gUNSSKZH3cQm8qjzXA8dlg2QLaAEEysbFX42Zmfcl4VvAD8HwP4+y70BG9PA7qeozRnBOB4qXiYPOSSUqO1lz6L66BOlWUTqMoHO7uzpFwm6IFvypzewMxrD4S3h6wsjwQcTsfD4vVOvD1pBC9/9MwBbOz6DXiM9OS5KFKPZxtJF2QuAHfqtS5ztopooVANXUhjOL80ln/GEADjVV1gqyKqCOcS7J3wefobAnoXlRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IH8oGZxcIwSCBKee6k1Y2kPyqcMYvW/bGsTY8BkelE=;
 b=FsBrP4YmMdOesK0EsMIra9EliKwIcXnPl9ncHedIk4Z/mMBQ3Iw+9QTphPaoYVMHAcXm8YvLIkGkiD7lM0yzGKERFsjRWnZB/IfarWU9+4rWKvZR5MUfU56M2WecB1mdePSiioIJ5HtM6orjaoCT4BOh25yfPziIV951Xc3EwGk=
Received: from DM6PR13CA0001.namprd13.prod.outlook.com (2603:10b6:5:bc::14) by
 LV9PR12MB9784.namprd12.prod.outlook.com (2603:10b6:408:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:15:08 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::5f) by DM6PR13CA0001.outlook.office365.com
 (2603:10b6:5:bc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11 via Frontend Transport; Tue,
 26 Aug 2025 04:15:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 04:15:08 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 23:14:48 -0500
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
Subject: [PATCH v7 2/8] powerpc/smp: Rename cpu_corgroup_* to cpu_corgrp_*
Date: Tue, 26 Aug 2025 04:13:13 +0000
Message-ID: <20250826041319.1284-3-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|LV9PR12MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d68b88a-b09d-40f6-259a-08dde45724af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AklONSsRI+h4av95ZYJokvgt7L7NYpmEcgZNKzIzhVZT+7A2fFonLJdpop2Z?=
 =?us-ascii?Q?DWSQlVPEdBYVaNU8mCjxQ8fkz1DXtSTAKHQB74+0+OpzmSsQ2YhCK5LD7fcV?=
 =?us-ascii?Q?nAueuzjeatgJXe9ze4yT7YWJjKinAjxQ62alTFBWCOZtnveWZaub/x+KZzuZ?=
 =?us-ascii?Q?hgxm2k13n9VlTNa00CUA9G8yKQo/QF10+iYSWT5ifgk0L3ZSIR+lb+SG9NT9?=
 =?us-ascii?Q?wVukEW6TkSZK9rlbvfSZjB7pUX7Q6chZ0iUeDG9djx6WzG2evHjv/e5LD8SU?=
 =?us-ascii?Q?Pw9I9DddUPb3bI6Y731JkvLwoConcbvFA4MRPwqwdU3IQaHHKu84ls8g2+A9?=
 =?us-ascii?Q?0slbTqEABXVzyRb8HeHSnAFl5GVUA/J18KWXb2Rh3bQ9tllqIHX9JuIPZDI+?=
 =?us-ascii?Q?zi8uJbNSiBNj3qIdwLF+bfOzRc8Q1ypgp4v674nw8uXTUhpXPguSTYasfItq?=
 =?us-ascii?Q?YvyXOgRcl7QleEnl2n0IpBurq7ZCsop6DSW7ftUmmFr8OHY7ZSCvOe10GRNf?=
 =?us-ascii?Q?DJPUGHpEe95L9TQevjN1iUJphlylOPULYzBGM0fnJcGhcU0OB6GOOCgrvpeN?=
 =?us-ascii?Q?WlazMkSY2IN/UMSmXGsrm8guzW6hLLoCtzcWoskfwfD5jJqHXzfW+AnGyZTa?=
 =?us-ascii?Q?QDpXFkqekApM/7skcoQdTy253PhGGT0AMrMUQoqYyFUDBXXSTnWrjNFNll54?=
 =?us-ascii?Q?3BfDWaR4IvM482QYwqvddCyRdXJ/eU3KMRuObBBnEXGNUUAqxHvb03gEXlYr?=
 =?us-ascii?Q?Mp1shq8TMLCzUaPL30+ivxToACS2/TG4f9jYDCNwhl1Hw5J1rGdlxS9b6EbY?=
 =?us-ascii?Q?9ibkciAIVSmgfN2S7G6E2c5fQmLbgaoAeGxrf+eleGObvwd01/Ud3PJkBgHl?=
 =?us-ascii?Q?MBQsM4DAoQXFNDx1s2hVSTNt5+/Wo/Wf+ZRta+NULTVO6RSdHLFpObWnR9qt?=
 =?us-ascii?Q?0BoAYaTzAMNxtqEccvqsVRmEwjFuiPIES2HwY4mQ4gGLaQSyLFtta6ul7A7R?=
 =?us-ascii?Q?kfY4MkQ1C2x6Xo3AzvQUbo743Ud6Ej3FcM22zRJmWK5fDLDW3WY6FJc4hNQM?=
 =?us-ascii?Q?zoBLbnpjQu7VyLXrae5bYUIQc0VxmeNItWqgp1G56Gp5iOxGYsQN0pkctDxA?=
 =?us-ascii?Q?fPQS1C9vjGPW6TrJPS3t1Csnc81XxoroSyOkHBgb1rUkjnvbkceuM5gvXLMs?=
 =?us-ascii?Q?P56zDXOWs+jLFgciS6S4HmiovcL+ZNxlcH5yUcOVjJP4HwowAmC7GUv2UCn3?=
 =?us-ascii?Q?7vNBeWFM7uyyb3oH1fwGwv4iNuaUAGYdIAFg6i27qMTREU3Ieyzz3ZT1mg3q?=
 =?us-ascii?Q?xZGaVKTNB6s2p74zP+81di0JMiSS4KvgJ4ZsBqmvWKizSB+BrTZdpqHxarwt?=
 =?us-ascii?Q?N2TZvT7JsADQg9XWxD/8XNolM51HFj6CKAXQadvfJk5HDIeoSvPDM8/Ovgh5?=
 =?us-ascii?Q?dtp/kTulDJqp8CcEzLHtevSuTRc/s1YcNIdslJRAb9xEOiLTRLKa/kxipm0R?=
 =?us-ascii?Q?sqKlUpYTIb7SKWrJdES+bCFxGm4he86gVCxKj4JeCOAl/iBnHpTak1i25Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:15:08.4416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d68b88a-b09d-40f6-259a-08dde45724af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9784
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Rename cpu_corgroup_{map,mask} to cpu_corgrp_{map,mask} to free up the
cpu_corgroup_* namespace. cpu_corgroup_mask() will be added back in the
subsequent commit for CONFIG_SCHED_MC enablement.

No functional changes intended.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/powerpc/kernel/smp.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 862f50c09539..4f48262658cc 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -87,7 +87,7 @@ DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_l2_cache_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_core_map);
-static DEFINE_PER_CPU(cpumask_var_t, cpu_coregroup_map);
+static DEFINE_PER_CPU(cpumask_var_t, cpu_corgrp_map);
 
 EXPORT_PER_CPU_SYMBOL(cpu_sibling_map);
 EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
@@ -1045,9 +1045,9 @@ static const struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl,
 }
 #endif
 
-static struct cpumask *cpu_coregroup_mask(int cpu)
+static struct cpumask *cpu_corgrp_mask(int cpu)
 {
-	return per_cpu(cpu_coregroup_map, cpu);
+	return per_cpu(cpu_corgrp_map, cpu);
 }
 
 static bool has_coregroup_support(void)
@@ -1061,7 +1061,7 @@ static bool has_coregroup_support(void)
 
 static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl, int cpu)
 {
-	return cpu_coregroup_mask(cpu);
+	return cpu_corgrp_mask(cpu);
 }
 
 static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
@@ -1124,7 +1124,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		zalloc_cpumask_var_node(&per_cpu(cpu_core_map, cpu),
 					GFP_KERNEL, cpu_to_node(cpu));
 		if (has_coregroup_support())
-			zalloc_cpumask_var_node(&per_cpu(cpu_coregroup_map, cpu),
+			zalloc_cpumask_var_node(&per_cpu(cpu_corgrp_map, cpu),
 						GFP_KERNEL, cpu_to_node(cpu));
 
 #ifdef CONFIG_NUMA
@@ -1145,7 +1145,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
 
 	if (has_coregroup_support())
-		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
+		cpumask_set_cpu(boot_cpuid, cpu_corgrp_mask(boot_cpuid));
 
 	init_big_cores();
 	if (has_big_cores) {
@@ -1510,8 +1510,8 @@ static void remove_cpu_from_masks(int cpu)
 		set_cpus_unrelated(cpu, i, cpu_core_mask);
 
 	if (has_coregroup_support()) {
-		for_each_cpu(i, cpu_coregroup_mask(cpu))
-			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
+		for_each_cpu(i, cpu_corgrp_mask(cpu))
+			set_cpus_unrelated(cpu, i, cpu_corgrp_mask);
 	}
 }
 #endif
@@ -1543,7 +1543,7 @@ static void update_coregroup_mask(int cpu, cpumask_var_t *mask)
 	if (!*mask) {
 		/* Assume only siblings are part of this CPU's coregroup */
 		for_each_cpu(i, submask_fn(cpu))
-			set_cpus_related(cpu, i, cpu_coregroup_mask);
+			set_cpus_related(cpu, i, cpu_corgrp_mask);
 
 		return;
 	}
@@ -1551,18 +1551,18 @@ static void update_coregroup_mask(int cpu, cpumask_var_t *mask)
 	cpumask_and(*mask, cpu_online_mask, cpu_node_mask(cpu));
 
 	/* Update coregroup mask with all the CPUs that are part of submask */
-	or_cpumasks_related(cpu, cpu, submask_fn, cpu_coregroup_mask);
+	or_cpumasks_related(cpu, cpu, submask_fn, cpu_corgrp_mask);
 
 	/* Skip all CPUs already part of coregroup mask */
-	cpumask_andnot(*mask, *mask, cpu_coregroup_mask(cpu));
+	cpumask_andnot(*mask, *mask, cpu_corgrp_mask(cpu));
 
 	for_each_cpu(i, *mask) {
 		/* Skip all CPUs not part of this coregroup */
 		if (coregroup_id == cpu_to_coregroup_id(i)) {
-			or_cpumasks_related(cpu, i, submask_fn, cpu_coregroup_mask);
+			or_cpumasks_related(cpu, i, submask_fn, cpu_corgrp_mask);
 			cpumask_andnot(*mask, *mask, submask_fn(i));
 		} else {
-			cpumask_andnot(*mask, *mask, cpu_coregroup_mask(i));
+			cpumask_andnot(*mask, *mask, cpu_corgrp_mask(i));
 		}
 	}
 }
-- 
2.34.1


