Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ACD4EAA48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 11:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSP8B4LGhz30H0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 20:16:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=bvTS0py0;
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
 header.b=bvTS0py0; dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSP7S1LrHz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 20:16:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/xrl/pnwYKoHs4D0C7EyeDNhzSS9yeUvT7G4Z457quLQf18u/zmeJiF83sWojXwYF/ULBDyoMY4c7Dji2tUrIvuRwQCMFcahlKtpJwYI/6sD0FWA08U/+eu1Ob2jpCAtAIVOxzWPe7L3n00Sr0ui9cqJFFlxSvn2XV0HWI30jaAhpZ+dg89w84ThY1A2lhAlOvaOGnVLW7xGo4BBAC9zv+tfw9HkO3Ola8dsAlYb2hNH5rzDr/ej74Ae0laj1pQtZNryTOloYHEQOOsaRtdccDJIMqOBQ+bbjLlq38lh4WjuyzXXsJD0txYeJ36gRx8n0CLReWU4pAagk1fG0cc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsLpBcWHTZ5dQx/ugdKF9vcYxVEToO5vBWIJLVikUng=;
 b=oBTKtevLmsFmkR3eKQQ7YYcQKGH7waYgH61jh3QoL3730nv61b71Wg3IVSkqBPrZtpZrjirJpB9jisD+64bQchPYM/73MrWqFeq21++zo2buFqQ9BYwPYSr19WqXxAjlxd6EjzwTv/TX1B5DkiQCpMio65Q6gB6ft6it4S8rIG/P08AgugZTkS2kfE6rX5n2Ueld6TFLL/Yc8IlPc/Cpzvky6cnOpEYnOlbTPUQ6/Q9rLJgcJZt1XI4gysAxQDv1SZoWaxaaEoBXy+cfZyEIbgvoKnDt3ORYQZ6YQGehKrvisCABGSURKFm5f6fy3A6fPSKiIhBkAcq+vmFFFSh2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsLpBcWHTZ5dQx/ugdKF9vcYxVEToO5vBWIJLVikUng=;
 b=bvTS0py0yYm/u4hU//lhaOrQY7cAgWICFE7hgt/RhGZwadUo7HYlmCvWvM8TkWLL2tIvcF+Dsd2uOFS+21lCgz9IAtbGHYuJDbsQ1lbOsA/5v9mUwMx9dtfRNwBIlfS6M0+xtzlWGTutpCXHQq5u8YXyqoZX/5byLsd7AWpODPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by KL1PR0601MB3875.apcprd06.prod.outlook.com (2603:1096:820:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 09:15:36 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:15:36 +0000
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
Subject: [PATCH 0/3] support for describing cache topology from DT
Date: Tue, 29 Mar 2022 02:15:18 -0700
Message-Id: <1648545322-14531-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c904f93d-aad8-4ea9-e53c-08da1164af4c
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3875:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB38755DD4F6DD8251F9903AB8BD1E9@KL1PR0601MB3875.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6z5Kf354rsO/9z/3dBwWL+VpN6Yyt0tUy3HOSAFTJIrsdlRrlGHiypZAwlL47iTNMUEG6kxWoL1PwiIEMQbW/DHsNYTTN8Dmg6Bpiyyr3Dbbw8Ry6SMSP+JPrHDPnAAQJFDRTplycQe+CHGVgYSsbGqMfZ8Xg12xYcDqKKE1B/V1bvugphIvjo84G4SREmJkkRupzMfhNAUAh4C7ys8LUw/s0kd5P6BAFYh+9RRsJ6WmnbLUiB7wrHbBnx4NFym9IBWdrNfqvz19MgfRaFwt99gVg3ddF91IsQTgt49Zjwp2G+E/scavT689/Fhi2ujo3upMcIEj5BUygWVI9NkxmX2e99yhnUbTxABV4j3dC5ef/4HGibwM0AyNZgiS/J6R4+Dh0S7kKC3M2gTCH/o89KuU0ND9mhQI8y743oSyMoZCp8MvlMq94acNPam4apH8LvcgeSJdJDBnBYrBlqq1yD+3nrrtuKTX0TqPP72ZZ4h6KXQbIt5nkvFo6nBdPKJCqdWocyvRQed77koxTMMV5x+8yKyFRfDut08uxhZSIoAEieQx8NCb2h2Qb+5E984siCJaeRePRhZujQeO3lT9qR/41e464Xql1+x6u0UqTGooKpgR+Abh9aGs3uAQggu/oe20EQrzHsj6W62nHUY4pHS3ZF+W5nY+h/GIm+R6J8149dXLGWfs9nsUtBVHOAXbyGjB8fQlMNVvPYwNdgwdbNCJfeg3nhdWlGCbOSpBJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(66946007)(110136005)(6666004)(6486002)(83380400001)(508600001)(38350700002)(38100700002)(8676002)(66556008)(66476007)(4326008)(7416002)(86362001)(6512007)(921005)(36756003)(2616005)(52116002)(107886003)(2906002)(6506007)(316002)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4tKdhTDlT0gumG1XIeYrFi1/z5uND8/M+0ym7v0lvTn1mJNlRuoJaFjqe7en?=
 =?us-ascii?Q?HYgrwNUkOKe7cr3ACFyXD9qnz+756qm75h/ufOvlNdbAvp5N2wEPtLy27MPv?=
 =?us-ascii?Q?hn02FwpcIhB9h+GCUEajQDnp0lTVDMjPdURZLZu4/sjONk/T8aXpI0Sknv88?=
 =?us-ascii?Q?WREKF/PNdTDOgevNBHEILIeW4XnYClXEntXOEpXEtvHk9FSwMhb2+Yfh6i0a?=
 =?us-ascii?Q?k/9bQdZq8oiyfyhvlkqas7EnZe9AhGfbemTY7Yk3AgCT40IsP664JotWva11?=
 =?us-ascii?Q?F4PtFeHBvHNos+9PLAT+n08nKTfBqrC0xWvNHwA4tzAg0sgde3T1Sq2wqq1k?=
 =?us-ascii?Q?fKg+zt8qFdmcQITpuB5/USy8zp+u/mTx1DAw8EohSB753UR9/ap/V7oEwGSn?=
 =?us-ascii?Q?OiCHnATGqB6KzA+mMzmCongBjPZcEJPPwZ7wgmtIZAvAvosRzIE3Xg9qQEOQ?=
 =?us-ascii?Q?iekaLcq0HSDfO+n6jltcAgMfcT9Q+KPD2SPUNSvxwcXYrLLeME+eGdiFSX96?=
 =?us-ascii?Q?5Zz8ouL0ytA3mTqwpQLnDdlta+CBQAiDJm1/m8C7a/AXd7yJyrUadW1MVFK2?=
 =?us-ascii?Q?z3V+g9MSdw1NfdVIlHhzolMHB8bz6Xoit3wxqDx3xgPYU7GsHIctZg/EqZOW?=
 =?us-ascii?Q?9qPbSIA7t46qzWKTOCOfTGVytGmyseKpP7SCldw6lcp8isKNBv1625P7ogRX?=
 =?us-ascii?Q?6pQivdK3qK9WkThkcUVMqYbYdYGuh/Jdo8JWx0zrPQY+roBH/pTJVq+L88ks?=
 =?us-ascii?Q?ikqrSx6GT2yIhjT0rgBsW+I2CXqstivq4+uWhIsr/yWE25juOsJED48tEILT?=
 =?us-ascii?Q?orLLjMzWelVlCGubYbvcCbT+NC71xrrDBnuWI+e+ck+5lCv5CoKNGvGCKu3Q?=
 =?us-ascii?Q?IvwBaKkhDp7t8euwT5tonUcfK4hIkucbZdAFkUdSuJ4ato70SrwTmvJs0/1z?=
 =?us-ascii?Q?TkEqUc5iZ+ajozYE3drB2g4urKSLxI1eeNhKYKNG8yKbJ/6P5HDg5ykh7jn4?=
 =?us-ascii?Q?AEgz3V+bpLxfQbdFz4OP+5KoeJWesQVHqMynxyPjwpsKfv/rRqfzRGZgdmJz?=
 =?us-ascii?Q?V5n7yhk8tjfxMjH4OQj6JFbxbFXnyB50/PmcHnBv11/POzjUV63TfjIEuob1?=
 =?us-ascii?Q?iwFR+5OZ+P3QRe9bxEOc2jDClGot0CYI1yy3+LT5lamCgPAkV3XOiY1RASQa?=
 =?us-ascii?Q?0MSWsV23t22qTRMpCVjPZx9jF90QxxTZafu+y4/QEtfz13wTWf6tQ1r5d69R?=
 =?us-ascii?Q?DrXc6xgGLpwt9iGeqrr+6zdO0BPlMRgmKTjWDHNNS4nJyO+rY2WXT/oT6/fy?=
 =?us-ascii?Q?LHA5hJHDd+IKgVyn6zVbs6dQTiNB90WhRUBxlDYx3IdU6uHdBJmphYAZ3SNE?=
 =?us-ascii?Q?VonOy7JVBdGYht12iV8Yt8JVAQHnG1rU6m13WLEbABcSfdudLMw3ZHqjgyVe?=
 =?us-ascii?Q?c1P3f0MmFJHQOlsGYBIATVJF9ni/HRKCKwgzhtKYo423zaIhZ3v1Z/iXIir9?=
 =?us-ascii?Q?KtmrkM5pUDUtQyrGg+LOESQqgMpx6kJ3QETl3aJmyxThyoBFvT7I/8RLRpGf?=
 =?us-ascii?Q?x6TRmpEBYKLC/K+YnrvmBxCsk5MR16Oj5nEZium2CjdrZHbydqsZ4cJsrlao?=
 =?us-ascii?Q?0b/5kjzOppSqGAXfHlM6iUlCYIoJBmXzsE60y8Sqt5ZcdalgGliFeghfD2iG?=
 =?us-ascii?Q?b/O8/BNfPzLRJmVg8h1Ol/QYs59ufDSzHXf7yxDJ5KaglqDdDFTUKjDvIL7W?=
 =?us-ascii?Q?JzUGXsXPIQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c904f93d-aad8-4ea9-e53c-08da1164af4c
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:15:36.3206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y57fKUYZz+bFvW5Sn0GH1YE84mpQWqQwAbDujwJXqkwK1HGgwiG2rOb6kFsa6z1DLNYNiRrcGEe7yPW6si+JYw==
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

We don't know anything about the cache topology info without ACPI,
but in fact we can get it from DT like:
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
Building the cache topology has many benefits, here is a part of useage.

Wang Qing (3):
  sched: topology: add input parameter for sched_domain_flags_f()
  arch_topology: support for describing cache topology from DT
  arm64: add arm64 default topology

 arch/arm64/kernel/smp.c        | 56 ++++++++++++++++++++++++++
 arch/powerpc/kernel/smp.c      |  4 +-
 arch/x86/kernel/smpboot.c      |  8 ++--
 drivers/base/arch_topology.c   | 89 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/arch_topology.h  |  4 ++
 include/linux/sched/topology.h | 10 ++---
 kernel/sched/topology.c        |  2 +-
 7 files changed, 160 insertions(+), 13 deletions(-)

-- 
2.7.4

