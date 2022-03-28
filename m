Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 070F64E9209
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 11:55:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRp2v6qGjz3c3L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 20:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=BWAqPEyE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feab::701;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=BWAqPEyE; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRp284Kkvz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 20:54:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GO1okmpPlxWrtLaLWGa5f6A2SXPHmkgnUJOTLljkeIx0dW6md0O+pzcCFfQfVxFF28CrN2MU0hLMbSM7TdLgMqFlL6nZm/ldzVAlDaKzXgs95NEn75LEYCWxeZQ4SZ7/F9Dmm5478W4bYtHKZ90Z7IyxIhdea6GeiHqGXveDGUzKUIuqJyCzOJzUJeXPo/bM/+dzq6hd4bkRsvklDp/zNupUljnmiiqIMdU2Eps01L96Jev1rQWeDpZk9hC+BRfHpWDFLBzQF8UGxvP0ZBJiJcgEaN5LCoElYL9t6fnHuQRmuRSA9Vy1kid5ytKJMgFBXpWgVy2NohbEM/oMbGaQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5L/PhTCV5AlqOJZUqTvaUu4KafswmX1JJEwcwsrwXw=;
 b=Aq1sEpbFUYpO+1J/rPMf/vA+PVV8P6I0h7A98mvfg3RzYKMQ2eIIFeJHyPWqd8x48ap8NZVUyOkcPPYrmaMQAJ7geDnPNX9noSlgxjSxaCP5gYGZFJXFUQroAXo0kQjpMkyQx3gqz4gt7LRpv1vfjCVTijLZ4UcbQVhZ5wA++PZpVCrZQdMeK82faRJwyLqmarxJvWK2r8sN08Z25Nf93b54TOF9UNOTKP+81SOipu2p+RBovM5Egsyhf7hZBFK1SKGHb0fFvYorTb8jT7ynk6bBzcUBqYfOUhqrN7n6n/pbzG5OYmp5z6oJhtv7425UA+X0fZafAvJ3BpvRnkjZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5L/PhTCV5AlqOJZUqTvaUu4KafswmX1JJEwcwsrwXw=;
 b=BWAqPEyEkRmVaDAUNkxgWLbHW2Wxm0xQ2KqbIZlyloDya++xkvwfjmySDKXcIkXEcQqP+37kL6ZfpUF8C1J+/GdTnJjvWrxdXE4hyTKxEmNwrC8VxQqRUriyXDscjYE4WUdIEh/MntO0kFEY2ol5fcgDGyhgoxz9vNmRYiXf/ZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3080.apcprd06.prod.outlook.com (2603:1096:4:6d::16) by
 SG2PR06MB5216.apcprd06.prod.outlook.com (2603:1096:4:1d6::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.19; Mon, 28 Mar 2022 09:53:58 +0000
Received: from SG2PR06MB3080.apcprd06.prod.outlook.com
 ([fe80::34de:38d6:2701:5f94]) by SG2PR06MB3080.apcprd06.prod.outlook.com
 ([fe80::34de:38d6:2701:5f94%3]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 09:53:58 +0000
From: Qing Wang <wangqing@vivo.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] sched: topology: add input parameter for
 sched_domain_flags_f()
Date: Mon, 28 Mar 2022 02:53:37 -0700
Message-Id: <1648461219-4333-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To SG2PR06MB3080.apcprd06.prod.outlook.com
 (2603:1096:4:6d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d227cddb-b9e6-4665-1504-08da10a0e108
X-MS-TrafficTypeDiagnostic: SG2PR06MB5216:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB5216179D33C82E4242510DADBD1D9@SG2PR06MB5216.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBQoxJy7JpUMg3KNN7FLHDjwjYBcqbzKRYmg1+ssg4h1xgGFvP421ViYfIPC5MUOzDMKW6bP736BoK8VdZE7DJv06in9PHazrHsy3DHhEaOFJew8/MfNspNOPmwcDRAHx3nY9rQBLaMvWslrRJO0GCVHD23ZlpgQ9NNnkWdOhoUIkmB5qgMdAaJInlZ/FXuJLnQRoajdi6pHc+UIGqozxLy6KM4DCgrcxDLT0AJX84FokuT5MOmxCMVkuIRQ+DqTNeu5q+s73CPxS4YXDs4C0L17k1GKUxUXK440jo2H8xJrUlJylCZBay9zmHLieEtCnEuxRTb9dbZWvFIfdwgj2w2sOgZKaCczhhlyqq0kQgZYEi66Pw7BrSVei+6Ws0kqsenUbuxsjXWgX3HRb16DumKzCAD5GgnpVcdGFxp5lmYwKZ2fWgfoT9NdlQ2BNvIfgEmOg8Yhlvkp4AR3vOEA6aGDjc06S5y85Bp2hjMgISLxd5LU+nrDrpZC/vUCxdj0keZyl2aOlqbLrlkIflNuy5Z8hzira+K30XSU8hwijsmdHtJZc7kC9g9N8O0LqGru/MO3cDhQkmfpVTwkkOVDd8CnCUEdL7/awJBRllKxc6TVJu3GGvbDIT5FhJl3Acm6WJyELyKJCygw6r/GgTlWxWNYZ2qJSI+lzFIZhQf6Mc0kCt6dRD0nZ2i3TtJzFm2GELs6437/yh7PwhkMs8gXrQ6+Ogc2ec7mMXbkj36SmQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3080.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(36756003)(26005)(86362001)(6506007)(66946007)(107886003)(186003)(2616005)(6666004)(7416002)(8936002)(6512007)(5660300002)(83380400001)(2906002)(508600001)(66556008)(921005)(66476007)(38100700002)(110136005)(316002)(38350700002)(4326008)(6486002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GQtyp6rCzufG0vHFA4O/aqByqqOBLl5Cho7tZasYqVE1QULpWQgQMsnMYw3u?=
 =?us-ascii?Q?t7Es+lUlBYlcNJ4ZFUcBl3daROI4hTpGTwHIlLsw5XD+ikCtX3DNUEsy++vE?=
 =?us-ascii?Q?v5GzqhcU8LXssNpwgCoJ2WeLWy4EQiPk2Y15KqilGRuptHoTFVQpXp6pEqMA?=
 =?us-ascii?Q?9/U03DOECsYyR0Q7mGRtqTKLH7Ib4XJwUCbA61LyZjTrayFfHdzGASJxdx6R?=
 =?us-ascii?Q?RKcXHSFN3I/JJIfxAc2sCg8NuF522Q84LcKycgVSeKfgonxVdadRaLqivz2h?=
 =?us-ascii?Q?E/XQfvxfyimdFrgl45gpRO7pxiRscu7xys2iLKqIbrp3Vs35fRz37evXIo4f?=
 =?us-ascii?Q?KGJpqBMaOQLWas0NZVzjev45yzWdAWZfBZkhj2JqGgPRde5aDhAG+gSnxfMj?=
 =?us-ascii?Q?HFcp8PseCI7OzF+oFFpAAdyOXN4HT3JJKKmiqwLCLzVBuO3DBJtG3fmnmOdi?=
 =?us-ascii?Q?6IZ5vkjnuClPf4nzZxCrnPZFTCYAOIZrt7cjz/oLGLDtnZPj46AsnkS0mFT9?=
 =?us-ascii?Q?06v5fVu4mcI8l2H8vEjS4k6x1yK29lFo+Bw77g6ueDdTtD9JmRzgqZR9H0LF?=
 =?us-ascii?Q?5bMAY5FD1NRxIibmVl4nZfkbEMZPASQtRZyjG5PJ/MSoZTcySOKLgE6op8Ej?=
 =?us-ascii?Q?6HODmv725LM4eVfWtO+6Etiw22QMkk0D45uAkTldd9vUlfoM0N29pxLNbBrC?=
 =?us-ascii?Q?6psn4F5l9MwqIl+lskFTAp+K/bp7o+uubmmopwK7i0aoOkfEnn6xYtoX5q7V?=
 =?us-ascii?Q?u6CMPb2EVm43VPPzkKtiGaOcGkbws07Gq2FYM+4ANn9P0+Cw6mBT2xxOUGx6?=
 =?us-ascii?Q?+/jU5353jbqmTOL6LaKguFE45VMZJQcSmw6epV4FZzkX9qoKIpRhIf7Qs0/g?=
 =?us-ascii?Q?Ge0/PdQdpU7NlWA+zPN3KRFKyrWd57DJ682sbifZRIaDMwys7sq55v1GtnKJ?=
 =?us-ascii?Q?1pgrk/16xUTxw2nF+FrsD7H5YhwaR7Ar7WG/puLN3ugZiWo8zpKx7UvU3fof?=
 =?us-ascii?Q?EQSae4Vc8/XRSXVWsUL6p8AzFmC0WyJfse5mMxRykyxdUmeOz9vhBDPjkm70?=
 =?us-ascii?Q?+9qSelSqHPLSi8Je1ZvttUNW9RgpROJKLHCpUsXLtGjoiKY+I9lb8uGSHEDZ?=
 =?us-ascii?Q?a7LkCr4FJaRwOMeKcvVeTZxBsg8UbKUKsuc5gA3RaNP8VbBYbkL766AMd3/D?=
 =?us-ascii?Q?z3g+WXGcuVsUAwBDrYpI/qGoGV22y5JMHfx4gWaSCZMeClbjKYprlYPEBm8L?=
 =?us-ascii?Q?ex+ipxA3EhLK5Or3m2ouJPDwc624OtVFBWh/7Tm69VX+rIYXdPaIX5aBEa6P?=
 =?us-ascii?Q?LXZQl+1GA0MYt/WCQUeCEVFN/3uEvq1CmTSTJ4sayNjEHyJJAO4khNhgxJ0a?=
 =?us-ascii?Q?NfGJTZTWqL7gdzMXJAuRrp3oWiR1SZumEc/5hTvarwE7NOHt8sQGr/cqwmHe?=
 =?us-ascii?Q?sNirgG+BEi1hNR0eO60m3Pm1+j3HZ8JWv3+Nnsh/YID6dzXX4wFEViAHtwfM?=
 =?us-ascii?Q?YTtB7Zd/jIHPUOW0gC3czbqUrZAG7LTriQEKMbwBQ56KKp54Sff4c3Dyz073?=
 =?us-ascii?Q?WgccOwLWWigkXmaSbcnMk/TT4jHpLt5S6dpXE0qKktA4FilKUAbby21SmlfZ?=
 =?us-ascii?Q?9mD3XucEccvYN7cW/Y9Jjol/fAjau1mo2GczVPfxvvDssxWPsm38159HnH8r?=
 =?us-ascii?Q?gd9taYR7G0xeA8V56WnafYtbUH6a4lOFAlmtduMgcrBDZuVcy34AMYjmfvnZ?=
 =?us-ascii?Q?sG1veyToxA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d227cddb-b9e6-4665-1504-08da10a0e108
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3080.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 09:53:58.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG1sucXhFrkZOTiNz6BaCWt2Bq72+N42+MdhLEKrJ1nGW0E5LySTrR5G0lzajPrnTyyWaPtWQcfGULo+9dKY4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5216
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wang Qing <wangqing@vivo.com>

sched_domain_flags_f() are statically set now, but actually, we can get a
lot of necessary information based on the cpu_map. e.g. we can know whether
its cache is shared.

Allows custom extension without affecting current.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/powerpc/kernel/smp.c      |  4 ++--
 arch/x86/kernel/smpboot.c      |  8 ++++----
 include/linux/sched/topology.h | 10 +++++-----
 kernel/sched/topology.c        |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index de0f6f0..e503d23
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1000,7 +1000,7 @@ static bool shared_caches;
 
 #ifdef CONFIG_SCHED_SMT
 /* cpumask of CPUs with asymmetric SMT dependency */
-static int powerpc_smt_flags(void)
+static int powerpc_smt_flags(const struct cpumask *cpu_map)
 {
 	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
 
@@ -1018,7 +1018,7 @@ static int powerpc_smt_flags(void)
  * since the migrated task remains cache hot. We want to take advantage of this
  * at the scheduler level so an extra topology level is required.
  */
-static int powerpc_shared_cache_flags(void)
+static int powerpc_shared_cache_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_PKG_RESOURCES;
 }
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 2ef1477..c005a8e
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -535,25 +535,25 @@ static bool match_llc(struct cpuinfo_x86 *c, struct cpuinfo_x86 *o)
 
 
 #if defined(CONFIG_SCHED_SMT) || defined(CONFIG_SCHED_CLUSTER) || defined(CONFIG_SCHED_MC)
-static inline int x86_sched_itmt_flags(void)
+static inline int x86_sched_itmt_flags(const struct cpumask *cpu_map)
 {
 	return sysctl_sched_itmt_enabled ? SD_ASYM_PACKING : 0;
 }
 
 #ifdef CONFIG_SCHED_MC
-static int x86_core_flags(void)
+static int x86_core_flags(const struct cpumask *cpu_map)
 {
 	return cpu_core_flags() | x86_sched_itmt_flags();
 }
 #endif
 #ifdef CONFIG_SCHED_SMT
-static int x86_smt_flags(void)
+static int x86_smt_flags(const struct cpumask *cpu_map)
 {
 	return cpu_smt_flags() | x86_sched_itmt_flags();
 }
 #endif
 #ifdef CONFIG_SCHED_CLUSTER
-static int x86_cluster_flags(void)
+static int x86_cluster_flags(const struct cpumask *cpu_map)
 {
 	return cpu_cluster_flags() | x86_sched_itmt_flags();
 }
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 56cffe4..6aa985a
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -36,28 +36,28 @@ extern const struct sd_flag_debug sd_flag_debug[];
 #endif
 
 #ifdef CONFIG_SCHED_SMT
-static inline int cpu_smt_flags(void)
+static inline int cpu_smt_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_CPUCAPACITY | SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
 #ifdef CONFIG_SCHED_CLUSTER
-static inline int cpu_cluster_flags(void)
+static inline int cpu_cluster_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
 #ifdef CONFIG_SCHED_MC
-static inline int cpu_core_flags(void)
+static inline int cpu_core_flags(const struct cpumask *cpu_map)
 {
 	return SD_SHARE_PKG_RESOURCES;
 }
 #endif
 
 #ifdef CONFIG_NUMA
-static inline int cpu_numa_flags(void)
+static inline int cpu_numa_flags(const struct cpumask *cpu_map)
 {
 	return SD_NUMA;
 }
@@ -180,7 +180,7 @@ void free_sched_domains(cpumask_var_t doms[], unsigned int ndoms);
 bool cpus_share_cache(int this_cpu, int that_cpu);
 
 typedef const struct cpumask *(*sched_domain_mask_f)(int cpu);
-typedef int (*sched_domain_flags_f)(void);
+typedef int (*sched_domain_flags_f)(const struct cpumask *cpu_map);
 
 #define SDTL_OVERLAP	0x01
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 05b6c2a..34dfec4
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1556,7 +1556,7 @@ sd_init(struct sched_domain_topology_level *tl,
 	sd_weight = cpumask_weight(tl->mask(cpu));
 
 	if (tl->sd_flags)
-		sd_flags = (*tl->sd_flags)();
+		sd_flags = (*tl->sd_flags)(tl->mask(cpu));
 	if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
 			"wrong sd_flags in topology description\n"))
 		sd_flags &= TOPOLOGY_SD_FLAGS;
-- 
2.7.4

