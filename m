Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7A54EAA59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 11:18:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSPBZ6ScFz3bZc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 20:18:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=nTKLFYP+;
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
 header.b=nTKLFYP+; dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSP7V0Gpkz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 20:16:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mresjIIuVNtApdY2hr8695raQbxAIRAv+VQNXm7r0gGEOr3Nqp+obeobD376PHumlJ+djwneAs05txWS4rh5PHoIvMTGLdyBM4bV5cXMLdcVkcV8SdTQD2dBH45CmgInWTQrH9UB5ZIQlX4TiLhodGiecTSXsKTuwhshZAiWFZHpueZlWdwLFzJJJiB0b04nPKk7KvrsbYpvqq4fNA6ObxLhUNLfLdd4sw4pzWSbzBKs1M/mLkiTAk0zMUKG0tFoVauq3P/kELCV0uQDslw+zbEp9DBImTKBUbid0owjSm441jfqwOxoR4xw2JcPUPzsLaiXGWgB1o99WwtCAWZ/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfxfMiE8KIP0uQqbk8jDdt0PDGO8YvrOLwwBhOLEFcE=;
 b=ZAheoA7n1U2Cd0y3Ire5K1jlEtmtGVUJx3IOlciWhDU/QZI9PF8YFi3Q6oNLd8uIuDFpzymB/msNBGHi5ZNotqOVQcBc7oC01Cm+V/ivC1/dYzH6gUrYU1GgUa7xtgghhuzHgr1JVSnUXKC44nhGp22IBnve3kpgf/NKITWy96g0GN2h9jjnx91EZHuUE4BpGciFq9bseeJxG6Q1kREJT3jvkjZ3dRRbHX5/Cm/X/twTcO+/lh8WNu+ZVFCLM7Z/sMlhyXP84Slqtfh0lcPf8HUccRHBO775ybGdPScN7/iaYTyy6LM67jz6p3EzM5XIoIdAKQseLuVGWm8KFptuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfxfMiE8KIP0uQqbk8jDdt0PDGO8YvrOLwwBhOLEFcE=;
 b=nTKLFYP+FhN299dkAmTkmQvJhWbJ/eXLlAihEXY9P5uyQIh7sbX6RXoc84di49wMWhIxuk5FbiPRg9Y+S3esO+07ykySRbZCpLYJyL1INZUu98rS5hXarTPq4xTqInovpj+/pV/DLkOqioDC86WWk0Dh0ohf75bPCxfF2uC55Yw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by KL1PR0601MB3875.apcprd06.prod.outlook.com (2603:1096:820:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 09:15:53 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:15:53 +0000
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
Subject: [PATCH 3/3] arm64: add arm64 default topology
Date: Tue, 29 Mar 2022 02:15:21 -0700
Message-Id: <1648545322-14531-4-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
References: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f5c8c76-e270-4f3c-4abe-08da1164b93a
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3875:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB387566B4E1AEC00CE36922FEBD1E9@KL1PR0601MB3875.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCMQ99KH1g+1HfV5LzBTOIMOsY/Bpbhjm2jhHQ51zsGPHIpVDrfBz7YQUDRcqnqYJpEIVLhNeZEyDaSNFTLFlglmZYHWtdrbgqs8xI/c4EtcSS6Qmqx1uDzJxE0FvR4p7qcacDpdXyq/8y2cNkFG0ApsdgdvGiZS51oyRmLdP6Y+HRwm779W1Dpv1+SbLIeQO6cVNgpvsu6u2eFHQrh4OnijkxJMMGnb4aoSHuzgdNnpywfttNDEnniDD/SQ+zDuxvJdDF5WTvdO+q2t5cPsokLhMTOoZqDQDzD4az4FUe5QwDCY/eudCGSHVn43OwdB/foV56fXzLjlFEmoWOBBIG5GtcZnhBjCkC5Vn+9rszgPJ0D7xyxiMfFrr17uYGpTVrjGp1pNaQe1IqtSUDZNCfSRE7kPq0JYAVvd6Y6itNizriHGY7hQWvESvqnWPy6R6Psuk7kfr6YsMng/518Q4QA96XpFYh07clLswO75Snhd7lBMYe8/rEo2Lg/MsY1zEjsXotrQqpwHVW5RWyN3EsJu1wICVVIlR9a3ze2a5Q9aYSPqbNU+bopp8LJl8Vj0p1nCrjOhZS8qF/FtlXavEbHufTE6QgaiZU0VtTdx6R/rbJ4RZvPSobT8ogd5Fa3eyx+mrKALIa3G6RF3wU2JC1PUi02sFDuEwEIqhLCSFjJXF1O+XhnMgX7YaEfZUzlnsrl2RDfOCp9fUYQRFrAkw0d2hn7Iul8vx0RlrUm1YMcunfYQKU15p0X9WohE8bwM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(66946007)(110136005)(6666004)(6486002)(508600001)(38350700002)(38100700002)(8676002)(66556008)(66476007)(4326008)(7416002)(86362001)(6512007)(921005)(36756003)(2616005)(52116002)(107886003)(2906002)(6506007)(316002)(186003)(26005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N3HXbwc7rbDQOe2RnCG+MjqJO0jb+0ZPJh8Ev8pL2ESWw7xqxmXt14bo4u2f?=
 =?us-ascii?Q?2Q4sWrEpddzjmmuOxWaukRVo7DMMik4dKLlqm03HlUL+vuB82qbJy5Gov8Pc?=
 =?us-ascii?Q?kJW9VR0PtkzoxmGrXnU4hlRhQz/4L9XJh+YFfvNp6KMe9GX9Uns0J9CH1UWv?=
 =?us-ascii?Q?y7Yqv+zQ11LSwaRMRE9WEHoQSULcgxP2HNIXdyLY/mAKA/jjbZOj/TWQAWnN?=
 =?us-ascii?Q?QRp5k0jQB47SmhI9dDM809aINy/akzdK2LyKCUaNw1oMt6krmLmQZX1MXjW6?=
 =?us-ascii?Q?qgBjEr2kBkp5k2kZmgZ72INtC774L/ldg+QWoqVH/iD0LaDwMLiMTtrNRF3Q?=
 =?us-ascii?Q?fVj6A8/Qnn2q7/R8Xk29URaJWYg3RRhSK5onBm6VKnbjuYkeUcEg2k2N562b?=
 =?us-ascii?Q?0msSIZMmlxEpIXOBh5KJ4TZ+KeuvIXOFvqK8bn8HBTOGvZtXBWGo1Sq0QVIf?=
 =?us-ascii?Q?HU7a8FpNfjIl/PwyJvl80/jG2MVm0JF9Cthm7nl0dfz0uKZ3N1hfWrXKm5Hc?=
 =?us-ascii?Q?mQ7mGlxdafPFhr9g/DGv8CUepq3hp9TfiTTOS9jfkmmaBDqRoskY4WvFFsxm?=
 =?us-ascii?Q?ylV6j59GeBFh+yryDjhr5tKiAX75/+h2PFeo4hynfbG0oQTnuJAIZc4sYrqR?=
 =?us-ascii?Q?w2V4g4wauEvSTD2xTCgYRo3uzWNpIgwLxw/aBqp2X2CqokkVPkruCNGfI4Mw?=
 =?us-ascii?Q?Pk9AK32jeLBNZkJZw0oZnlkqZM3xuhpN2cDdx/g662bDZyRBuCT1Msjl6kE5?=
 =?us-ascii?Q?kI9kwRfizrLhzM1UWUK0YRT2z67J6Fev479YuHH+OLFEKDW8l8Hn5ax3SSRM?=
 =?us-ascii?Q?z2vAGErgrO1UQ1nOdr6PgtsHDuM3jxqICx4MdOpWxzeJKqEA0tb1540GMmFk?=
 =?us-ascii?Q?qC9+ej2QtdRoeh5c75OokUJdFtwi5b3uSl6LCIYr1eAtGBUKBQc92fhqgfrj?=
 =?us-ascii?Q?MT/jNAZeiSjXBrzc7AiB9Vt5d0FYMx6XlkX0lMsFuveD4BAEKfUuGp+o3ILj?=
 =?us-ascii?Q?6Py2RGdE+qT+GDC6+djj/93NJmRK/g2c5uu0szAZOOAChoR+PlUG6gVapeqg?=
 =?us-ascii?Q?w2m1MbBqOfUI3F7opUalteC9io+IS3PxhBpsSlrETF+Mn/HwqSY/o281vcT8?=
 =?us-ascii?Q?Lg4mIFyDOQLR45G74r7jeqPKi2eQlnty6DdAXdH84D+1dJjRKM+BllSuW4px?=
 =?us-ascii?Q?YFNgRavT+Flk9GaZ42WJ0AgreP3Ch8ULjNcP65f6iUmpWJDn4DFfjFnwCsMT?=
 =?us-ascii?Q?sKMR22XSG28sn6w3lTLzUMFN2wk6oMFW/ppxXQsM35VYMTFh3K77fwakMW9/?=
 =?us-ascii?Q?5gYFkJPjstZ1TlqdkouMPcEnonzkxpnHXXU6p1B8Z0IWEwqWxbXNai2o0UHy?=
 =?us-ascii?Q?/lo3WKjqpy/BeELRsKHbzWTyd4iRS4q/cVtqdGbbWjYD6J4dslyIYxVLVgNG?=
 =?us-ascii?Q?z/gMBNDG3cfm93R+6OyP3FJRlaYO+Q8Qk0H0h9Pk5r0vNaTrbFkNr8Lm0/JD?=
 =?us-ascii?Q?MxLuazHkytmP/KPvJ3PsvkPb1TU5GzgQR4iChnCcfFQ8W1Su5NNxYkWvMdA9?=
 =?us-ascii?Q?63TRLWt8Hg6fUSRG5gS5OQM8l6PL/2HoYCsG86b36yJIFsVuUF/HTdRwFU2y?=
 =?us-ascii?Q?RqY9ERmKmjqOuIp1RsoiVGhSTjRUb4Wagj3FKRuM+nOjgdraI/1KFNyLW/Dt?=
 =?us-ascii?Q?T/zqNuTwFUnhmJ4cESuBxAFG1hmPGpNm1Vkia1blkkrJDg49RvQj0w3EYeAQ?=
 =?us-ascii?Q?MQ1f/FB9FA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5c8c76-e270-4f3c-4abe-08da1164b93a
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:15:52.9915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wl8/v+SKoEjnS3xvcBHnI2e23yk5dojU37v0Dbm+h9ZKXaTM1hB+gPI+Turjlph1ez9lA5KaAwJHJKZY61Lyrw==
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

default_topology does not fit arm64, especially CPU and cache topology.
Add arm64_topology, so we can do more based on CONFIG_GENERIC_ARCH_TOPOLOGY.

arm64_xxx_flags() prefer to get the cache attribute from DT.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/arm64/kernel/smp.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 27df5c1..d245012
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -715,6 +715,60 @@ void __init smp_init_cpus(void)
 	}
 }
 
+#ifdef CONFIG_SCHED_CLUSTER
+static int arm64_cluster_flags(const struct cpumask *cpu_map)
+{
+	int flag = cpu_cluster_flags();
+	int ret = cpu_share_private_cache(cpu_map);
+	if (ret == 1)
+		flag |= SD_SHARE_PKG_RESOURCES;
+	else if (ret == 0)
+		flag &= ~SD_SHARE_PKG_RESOURCES;
+
+	return flag;
+}
+#endif
+
+#ifdef CONFIG_SCHED_MC
+static int arm64_core_flags(const struct cpumask *cpu_map)
+{
+	int flag = cpu_core_flags();
+	int ret = cpu_share_private_cache(cpu_map);
+	if (ret == 1)
+		flag |= SD_SHARE_PKG_RESOURCES;
+	else if (ret == 0)
+		flag &= ~SD_SHARE_PKG_RESOURCES;
+
+	return flag;
+}
+#endif
+
+static int arm64_die_flags(const struct cpumask *cpu_map)
+{
+	int flag = 0;
+	int ret = cpu_share_private_cache(cpu_map);
+	if (ret == 1)
+		flag |= SD_SHARE_PKG_RESOURCES;
+	else if (ret == 0)
+		flag &= ~SD_SHARE_PKG_RESOURCES;
+
+	return flag;
+}
+
+static struct sched_domain_topology_level arm64_topology[] = {
+#ifdef CONFIG_SCHED_SMT
+	{ cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT) },
+#endif
+#ifdef CONFIG_SCHED_CLUSTER
+	{ cpu_clustergroup_mask, arm64_cluster_flags, SD_INIT_NAME(CLS) },
+#endif
+#ifdef CONFIG_SCHED_MC
+	{ cpu_coregroup_mask, arm64_core_flags, SD_INIT_NAME(MC) },
+#endif
+	{ cpu_cpu_mask, arm64_die_flags, SD_INIT_NAME(DIE) },
+	{ NULL, },
+};
+
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
@@ -723,6 +777,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	unsigned int this_cpu;
 
 	init_cpu_topology();
+	init_cpu_cache_topology();
+	set_sched_topology(arm64_topology);
 
 	this_cpu = smp_processor_id();
 	store_cpu_topology(this_cpu);
-- 
2.7.4

