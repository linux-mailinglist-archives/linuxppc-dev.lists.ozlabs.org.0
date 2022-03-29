Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E44EAA53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 11:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSP9n63J4z2yg3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 20:18:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=mhynPiXC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:704b::712;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=mhynPiXC; dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSP7T3lF1z2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 20:16:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIKVdUZnzI4nM1VjmEJaoO/sYa87t30wEOHUfI6UpVANtAPGJMRniFf1FjZfaduzOG3ipqB/VgdzZSCZadsFXSnQIMYqzj/IVb4nE/e6d5uA0SukI8/+VnxPKAZE2CMij2jVqzrRaT9CJx1NiEHKSxK2AwpkZxMa/VKU2SZu6ZqDHNdduRgYnPOcyfNVECxP2aC5GG0tzbd5nHCmA2/K6z2zeX/tdMDMgBARW1tw75/jryXadZyO0ewyrvHWAquUhoCKprO3FKxc2Lyzgo/WdEBpJWRQ2/MKHKneU7Sb7HoVah7yNxLQso7+OnuK95siGyky5v7e93bryIee09g7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bacD8EkrrD3OdwjpWfHOF5YHsF/oPpRQEdyJIXbuY7E=;
 b=Np80S/rsXbLye2zuPAoFhV6FnV9ZR/9NAVVWUYDe+262I3FyzB8OH2KW/7QBHSA0Y5mOp6FXCYb16n1tr53vLeAEgpN1zOx6Y/XsFuEI8fuSA9hRqj/A/DxGC02b+9tpA7Q1p6bB4qmz7NrErgnv2zJzr2M67d1JvkdGyUV1VFcCGKx194evkE5XRcss46UfO/nqFOjhpDZh24yPB/ZW0f7swTJvE9tTigvQccpMCbh4/vZWY1cti+cUg2d0qyqWUUZbBftEQgBIwggCMivxym70EDLCHCptKcSQzE7vgmUuI1G++bOruAaBdyCPysQ8nmuBaDTcmMSoOXQfEp+sug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bacD8EkrrD3OdwjpWfHOF5YHsF/oPpRQEdyJIXbuY7E=;
 b=mhynPiXCC5Yz4ITYrTYT45Inm7kO/kXZwptRLsHbhm5WyIJ17Me4B7lLZ9CSIoEpP/8m+Y2YReV7ljOJW/YH83gyjVFHNymG0Jfs2tmnjg0qSZvlqwXOzI780uSSFI6DIBGsZbi9Gq26ildr/lT/zze4q+/o9A4poxdwvRF1LhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by KL1PR0601MB3875.apcprd06.prod.outlook.com (2603:1096:820:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 09:15:48 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:15:48 +0000
From: Qing Wang <wangqing@vivo.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] arch_topology: support for describing cache topology from
 DT
Date: Tue, 29 Mar 2022 02:15:20 -0700
Message-Id: <1648545322-14531-3-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
References: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c38c5332-e7bb-4d1a-3abb-08da1164b676
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3875:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3875EAAAFBBDD2DDF946BAACBD1E9@KL1PR0601MB3875.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUF/s+FGS30k1Dp3QG6kZCwfWgkYK0rwkdVHCVi1Gh24vBUeH30uDAD6DLwi7rOzfgJ/1VnfQm7i2i3ozQdh1MKB2C+JvmdjuOMfmB2NsG1fzKWXuv35dGIMlbnHDV43pj9p9MdS2LxXCJOU/r9ZPRFHXRSFHpWIxPgkQnPBMqufwBSnQRAc56PZkZwqkuI2BFWRhrabrkICt88bVdvrNHRbjeI/LKUTHnsiMzQN84MWaWm8c1fandnPm0NsXYlCsS2UdladfP++2cxI8euysVZgpBPtuw1pwi8E3cCj4F9NZ15FQw4rJoCaC6kpKxGQke9GLAgbgxZRF3uUoAp2nLsy4s0LkBvcOrkCFxDW4Ktk5EXVe4O8GfYIwoFjSkUSl6Vxuv0ZHH8o5y9IhJ5foVNVeZdgKNHDffbYKA2o3N6dqDdZNNxbrIGel0+lQKfEZhw3mcuzHGER+QRDUzrTyFAKHI2nOJtqXjb5cfxlehugTU8kM6t9tcsAczzOkEC4xu8zkbQvFA2UieItw1ZuBuxMrmk9ciJ6JPYu89bitpb3H9iXhgdEbyvc2fIjDcxztXUTDyjU+E4XFgQlxQge9u8adLXOTxYrhEcfYUntOy5dymtk9Y54zH6AFqOHjOq0VjHK4DWAzS2oAUpXSbEvplHoHm3fZMxuIGOsSnGXkgme5Qnom4Re3gXCjVMAgZGjSshXSWJ4pVMrF5+W+r/Q/FOG+EUgcvJMRAwll54TnFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(66946007)(110136005)(6666004)(6486002)(83380400001)(508600001)(38350700002)(38100700002)(8676002)(66556008)(66476007)(4326008)(7416002)(86362001)(6512007)(921005)(36756003)(2616005)(52116002)(107886003)(2906002)(6506007)(316002)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vl7/hUNaQyS2do9pDKXqGI/qAEohsCeTnMP/fLL9wBTZts/BHAVSgEeFW6Vg?=
 =?us-ascii?Q?4vAoPNdInEz4Kfayzi+BFSHMx52EIJlGqxPuzPtUjRVoG1Ozpp7RcEDlj/sA?=
 =?us-ascii?Q?1+hsNyR3xmMppVX7Tz/Y/eA857Y+GYF0bIjP2ec5ljO4TAO3NhFTHiO7LUS3?=
 =?us-ascii?Q?lXHgkqUQAZtVD/xzmnn3n3uQwZrelNmsoj21sg2szd6Jh6oARgfZwKaqVE3p?=
 =?us-ascii?Q?/IioWxeBD75wLG4Dbb7ILVtNZ5k50nAexDazhAa+HTZSQPNd9vEQH4Yb/Hjh?=
 =?us-ascii?Q?kpJuIO4PEzYs0Cj40me32gmuh9PP5iGmB4hKakAsczYIT0CHxkOqJAjwUzYX?=
 =?us-ascii?Q?skM571pZTlDPscZDDoXco2Frr60+S5RH/iZyccyrhN+fVFN87vC/lDJIBv4P?=
 =?us-ascii?Q?134TS2/HLFTkQQS5mGSclBm6lsyQ7mTZbmPOmj5TgVyun1MsZ5sDOkAr/uKZ?=
 =?us-ascii?Q?fOotTUbGV8nRM1Y7n9dDmA3jxraZEB4V+ydmVu7Xe3CTaFgie6CvDoB0I6MD?=
 =?us-ascii?Q?lrsS/cpFU0tfm81qiI2jsPN62MyDDs2fj0jBJ5Flq4zgcLeukZYTy7fwAg/C?=
 =?us-ascii?Q?Jr3kFxiJx4aAgFh2lHeTHNNa6wcBQR/Ob8fdZeGQwdH4AdNfAbE2wGO4znNz?=
 =?us-ascii?Q?mz1LBnwrzDq9CYy9GUPyD2/usGoH3fCoytiWWYLt/8G6xF7KOkcMRDs3nBn4?=
 =?us-ascii?Q?iYUzzOo+y8Fr76MAplggnkzaNiDHj786g9ZYo94/vB5fiTiTLKFWgQUGg63f?=
 =?us-ascii?Q?cjeCFj7bofhRv+3eecKbOUJa2lGbeG5aoJDU3ax8vMcxBHRU9/IIz1LWp/Op?=
 =?us-ascii?Q?oFmqEp0nsIYb74WFpM0phn991GmZPksp+8XU9Idj9DlA5vZbhs9F+DX0KM+V?=
 =?us-ascii?Q?msQ23LnF4PuakyozMA9ZmtZ+TAb/cbn/q7moR6Ifby/ZcnbdeCLCyXziEB0I?=
 =?us-ascii?Q?BaQH9v6bKsSNNnfdDvwDYU3ckCiovPFjXGQH9KTvusSbW2lQ8VkLi7fGwgtI?=
 =?us-ascii?Q?RgwNIoC/v1zdNZ0hLCN9el84kMaVKpzpvsNI+ek+CQBoHsd8nDsMQEvFO4Dm?=
 =?us-ascii?Q?LJDZ3/Bi+5/PVEZIahYp9JDSlwVUc7zTexsyIUKxo43v4qCjNxIDgzX4rwFn?=
 =?us-ascii?Q?zFVKoREhZzZqNm+x5C9If5Du8kTTzKFS02UuJLuT3lO9uw3MdMom/dRNXE/g?=
 =?us-ascii?Q?7enlHXLXUGtE6twJC2PYHV/FaxuFV+xRAFdYLlzqy/zbqMEwRse15sMN0Sny?=
 =?us-ascii?Q?zShE4Oz6myLhLAqaaVb0pr+a2nldlX+0x6rv2BN1j8k5bVD42QvvxgEzq2R3?=
 =?us-ascii?Q?ez9aQTYEcoKOpct+/LzhXtSooMvrOF0Xx2zcKjO7FUAjsrM8khnRscJDmiSC?=
 =?us-ascii?Q?M5qWQdqxiL3KXp/3zb6sTswkjyVa16fON49/AicDjmQx6/+CsYRpndfarYJi?=
 =?us-ascii?Q?tzBBe+ve2TN99stYEjFIa6g1ji0kvoM7EO3LucVVbWVaVF66mW+7zxBJBc84?=
 =?us-ascii?Q?bkYPhcPA8GVcghI52UKCZiWu1jqhxkCYjCiSj7jswihbFe4ppu5xvzvZXsBd?=
 =?us-ascii?Q?A3M04YBXLZho6JmoOCC0B5/XGGcGdppEwj61ZLvC8BZGyxcOAKpHAZxdPNPO?=
 =?us-ascii?Q?ihbg5YlBObYdt4JZWSnGLDZjX6lmgRC1AbuPdmPzsZwifOJX2F6N0ChoshYQ?=
 =?us-ascii?Q?VBFUOyxkQwjUtA8fBD0fTNdgGsptWMb831zoLs3cBNTO/EmJGpbTHy8T8rWA?=
 =?us-ascii?Q?7Y34eam6cw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38c5332-e7bb-4d1a-3abb-08da1164b676
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:15:48.3199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zgKXmdEdrZl0h0nN15JFsGEBRKl+uJ3bS1X7afqVPK70r6/zNWTXtL6EGrjqrV+wbTb2CZF7Sznuj+sFHVWOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3875
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

When ACPI is not enabled, we can get cache topolopy from DT like:
*		cpu0: cpu@000 {
*			next-level-cache = <&L2_1>;
*			L2_1: l2-cache {
* 				compatible = "cache";
*				next-level-cache = <&L3_1>;
* 			};
*			L3_1: l3-cache {
* 				compatible = "cache";
* 			};
*		};
*
*		cpu1: cpu@001 {
*			next-level-cache = <&L2_1>;
*			cpu-idle-states = <&clusteroff_l &mcusysoff
*						&system_mem &system_pll &system_bus
*						&s2idle>;
*		};
*		cpu2: cpu@002 {
*			L2_2: l2-cache {
* 				compatible = "cache";
*				next-level-cache = <&L3_1>;
*			};
*		};
*
*		cpu3: cpu@003 {
*			next-level-cache = <&L2_2>;
*		};
cache_topology hold the pointer describing "next-level-cache", 
it can describe the cache topology of every level.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/base/arch_topology.c  | 89 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/arch_topology.h |  4 ++
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 1d6636e..41e0301
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -647,6 +647,92 @@ static int __init parse_dt_topology(void)
 }
 #endif
 
+
+/*
+ * cpu cache topology table
+ */
+#define MAX_CACHE_LEVEL 7
+struct device_node *cache_topology[NR_CPUS][MAX_CACHE_LEVEL];
+
+void init_cpu_cache_topology(void)
+{
+	struct device_node *node_cpu, *node_cache;
+	int cpu;
+	int level = 0;
+
+	for_each_possible_cpu(cpu) {
+		node_cpu = of_get_cpu_node(cpu, NULL);
+		if (!node_cpu)
+			continue;
+
+		level = 0;
+		node_cache = node_cpu;
+		while (level < MAX_CACHE_LEVEL) {
+			node_cache = of_parse_phandle(node_cache, "next-level-cache", 0);
+			if (!node_cache)
+				break;
+
+			cache_topology[cpu][level++] = node_cache;
+		}
+		of_node_put(node_cpu);
+	}
+}
+
+/*
+ * private means only shared within cpu_mask
+ * Returns -1 if not described int DT.
+ */
+int cpu_share_private_cache(const struct cpumask *cpu_mask)
+{
+	int cache_level, cpu_id;
+	struct cpumask cache_mask;
+	int cpu = cpumask_first(cpu_mask);
+
+	for (cache_level = 0; cache_level < MAX_CACHE_LEVEL; cache_level++) {
+		if (!cache_topology[cpu][cache_level])
+			return -1;
+
+		cpumask_clear(&cache_mask);
+		for (cpu_id = 0; cpu_id < NR_CPUS; cpu_id++) {
+			if (cache_topology[cpu][cache_level] == cache_topology[cpu_id][cache_level])
+				cpumask_set_cpu(cpu_id, &cache_mask);
+		}
+
+		if (cpumask_equal(cpu_mask, &cache_mask))
+			return 1;
+	}
+
+	return 0;
+}
+
+bool cpu_share_llc(int cpu1, int cpu2)
+{
+	int cache_level;
+
+	for (cache_level = MAX_CACHE_LEVEL - 1; cache_level > 0; cache_level--) {
+		if (!cache_topology[cpu1][cache_level])
+			continue;
+
+		if (cache_topology[cpu1][cache_level] == cache_topology[cpu2][cache_level])
+			return true;
+
+		return false;
+	}
+
+	return false;
+}
+
+bool cpu_share_l2c(int cpu1, int cpu2)
+{
+	if (!cache_topology[cpu1][0])
+		return false;
+
+	if (cache_topology[cpu1][0] == cache_topology[cpu2][0])
+		return true;
+
+	return false;
+}
+
 /*
  * cpu topology table
  */
@@ -684,7 +770,8 @@ void update_siblings_masks(unsigned int cpuid)
 	for_each_online_cpu(cpu) {
 		cpu_topo = &cpu_topology[cpu];
 
-		if (cpuid_topo->llc_id == cpu_topo->llc_id) {
+		if ((cpuid_topo->llc_id != -1 && cpuid_topo->llc_id == cpu_topo->llc_id)
+			|| (cpuid_topo->llc_id == -1 && cpu_share_llc(cpu, cpuid))) {
 			cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
 			cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
 		}
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index 58cbe18..a402ff6
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -86,6 +86,10 @@ extern struct cpu_topology cpu_topology[NR_CPUS];
 #define topology_cluster_cpumask(cpu)	(&cpu_topology[cpu].cluster_sibling)
 #define topology_llc_cpumask(cpu)	(&cpu_topology[cpu].llc_sibling)
 void init_cpu_topology(void);
+void init_cpu_cache_topology(void);
+int cpu_share_private_cache(const struct cpumask *cpu_mask);
+bool cpu_share_llc(int cpu1, int cpu2);
+bool cpu_share_l2c(int cpu1, int cpu2);
 void store_cpu_topology(unsigned int cpuid);
 const struct cpumask *cpu_coregroup_mask(int cpu);
 const struct cpumask *cpu_clustergroup_mask(int cpu);
-- 
2.7.4

