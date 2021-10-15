Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783F442E956
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 08:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVxjX0Gsrz3bc4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=Ve7zsmEU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=40.107.130.94;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=Ve7zsmEU; dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300094.outbound.protection.outlook.com [40.107.130.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVxhl449Vz2ynq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 17:49:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wzp/TX64bYyicVlbUNsKziY0E6XLez6t0E78wd1d8+vIJG1AnzZB9FBCPpz6bcmjrktld0P5KoF9hFQUpKuOTMxifpiuB18UsZfuFM3I+9CfNzyATTK6rlIXD4wZSJ4w/231J+92sw158xPysmzm/L9wLspuhMWz7qqK+ASrDfUP/K2bfNlwJKnBiQNOeDyR8Vn6sdWi4HGpDiS9a7SIaOuRJi4Dy8LLuZzjixZP4STaUc3gadka0iLJWzZnG5AiEuYtRMPddM1yY44nz48UjdTourotviQwZQ/rkc1RyzrPJJnzXyQAj1Keqahc9KwrfWcQu8ru6Oghwe/5xhzKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpufUf0evB3JxpsUtT2dljLyjv9vu5c6hSrE0xI6fe0=;
 b=RP02BlzGZxpOBgbtM5B6FDDN11Z1jc+tOdkL2gjoH+3y3oi/rDBFInKoq//kltGrf8NgwV47/dDhyNL1lzPGfBp6879GNxo2Xcrr1B8L0MR21rjmtXk2qn0sfFeSfnJVNEqyxEHR0gu5QLM/Gw2g0DRTv2Zh9bHgTZjna0/5KN6QXXjXdSXmxGdQBgskBhcCdpBVdBpZVqYCdjstTrhex/W7Vu3EK2K1MzD/dKgVPyhMq4bKkQluYBnNRqgAINEsf6ElM8cFglXYr7fT9bQ8eEwG7nsUwtxUbzisW4Kk/GzBqxEL++dkMak/ENjavbL8+EARHlHf7Y37mCfmIEmwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpufUf0evB3JxpsUtT2dljLyjv9vu5c6hSrE0xI6fe0=;
 b=Ve7zsmEUxq9tylGhIpD6iuSMg/9njdmJevdhi/ZzLO2vvmu3b23dzakggJHMjq0fu2KOJWbjxnFgleekO2uI5Qr3+eEyxB40j55QdtkYgTsNWwxS9LqRMAeiqQiIMA/0LJUPXE9uEtVUpO9it1JnpiBfa1QoBUmC9+vgBwFn+tI=
Authentication-Results: kernel.crashing.org; dkim=none (message not signed)
 header.d=none;kernel.crashing.org; dmarc=none action=none
 header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3388.apcprd06.prod.outlook.com (2603:1096:100:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 06:49:15 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:49:15 +0000
From: Qing Wang <wangqing@vivo.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh: ams: replace snprintf in show functions with
 sysfs_emit
Date: Thu, 14 Oct 2021 23:49:04 -0700
Message-Id: <1634280544-4581-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:203:c8::13) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 HKAPR03CA0008.apcprd03.prod.outlook.com (2603:1096:203:c8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4628.10 via Frontend Transport; Fri, 15 Oct 2021 06:49:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aa972af-0d90-4cea-a704-08d98fa7e73c
X-MS-TrafficTypeDiagnostic: SL2PR06MB3388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3388F4BF02795B1F09F6D07DBDB99@SL2PR06MB3388.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaX42V9Q18BSB18eYWKAcnF8iUzQS1WUZB3KcLfOQ5NJDgMK1IohiL+wBDar9EQ9Xa9gp2mC+L6IH0OMA375b0BAEf8PKm2jebXMglWSDm3/D2tDT45q6ZfxpQzmDpkTv6QMvlheVwYAic8sDNuyGF1pKdSVr2OmH2m5M2U+NJHvyF5JpuPk1G+ih9F+yKT3O7sC3HU5JxZqONa2iUm7eLlkQOUk2j0TBeubPy8j8Fpam+n1BLMOFd+LfvrVxXWZhwmeyQCLutSe9XvbvU6DEU8dG7hgzH4VOlDDIuPl4If/0PRyNaf7rCEDHjdSr0Je1EwbeJ8v8Bn92T9iYeKa/k1jxJuobRLejTxAdX/tnUdloapFfQH+Tdu7kePwxtTJxMsZmH16MIlq+vZsYDxa26iBo73oQuLe8Wlyhhtz3ibFCCYT2mb/ChtUOler3gnD02+3t8bKnSilEwgh+dYGBjLzxetzbnJSlH2HZ5eO/Ih4c00dxaloz7eJeWZ7r2zIbTZm2XseB1n3guadKTzBsupY7o19uAY3f+7v7yo13KjtSnYDVaLPvj0Ky97VoFOYfqOmlk5/KG9lm0oqG54CuAJUDHr3yX1b95P6nf7rV7vq7eH0zD/RQ1piQOy7/riD0piYgwv1sqzUHjjOmlVZu4GbtFV1al1Cu+QtTaBzVsvogh/fSt0xxuzfIIF6qojhVACZPrKO888/vTcSAZ33mQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(2616005)(316002)(4744005)(2906002)(26005)(107886003)(8676002)(66556008)(83380400001)(186003)(66946007)(6486002)(956004)(508600001)(36756003)(4326008)(66476007)(6666004)(6506007)(8936002)(5660300002)(86362001)(6512007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2FKaKPN2tHuLLJ2H+MUteFhhNJtA+U0sb+TaCkIHQwxyc0KLJKgeg9WdvRVd?=
 =?us-ascii?Q?M/+plawd0lgehzk+LuFwxm/eZRQnklX8mcOZKoQaQnLvn6xYioEr5rDgEBv3?=
 =?us-ascii?Q?L+BG+5C75CyIcU5S1ZE3STN1X7lHtd9mNrffVFRzzdu8y/4JWEpkXYSGl/J9?=
 =?us-ascii?Q?RE66EKhfTrXNl/72iaMlHjvwVizqKlYd16RoqEoE2Vw2dgV/158oj70RXP3I?=
 =?us-ascii?Q?pI/Hcu+o2D0mF6N44bx4P8RLlxEaPo+puKl+Ch6+Li45HIHlFQzFHMFRFzAu?=
 =?us-ascii?Q?TUkRH86BmNDXj5BxNzsJ8FvnnPfxp1z0dqyq/NJDUOia/IwGvNKQk57RL64D?=
 =?us-ascii?Q?9QHH8cRABz4WD7C+Pjfn4e60vFC28wQlDsfrhmYKsQdZqVbb+Wd7/Fhol9Al?=
 =?us-ascii?Q?+uACqZHMV6C7aivcujE1qpBNYjW1/SnBqQJG8Jpmx9DJPxetiRp6wkBYRR6f?=
 =?us-ascii?Q?7B7ZdhN3xR6VwHvf9oqNr9wiJGBjKk3izJEDdLf6bSJ/1Ul9YN68W9rL38l5?=
 =?us-ascii?Q?Tndy0u0Nxqgt+O7/ZqsJx/zM/h33gj7Gfm0qen036ThY2tXaAbE5NJ2bmhr0?=
 =?us-ascii?Q?UeRJ9Z9Ehdxn2YGBUVuQKMnsyn/kOYwWEh2spyTPcJVxiz/FnYV3azwKw3bu?=
 =?us-ascii?Q?etpPLxMRnpGygfjtNgJ3gE+ovtoTNj0Qn9RYzSk4q+ZLzA5J/bo1fj9SDVcZ?=
 =?us-ascii?Q?qmLpydoP25rXrxUaC9xjmeeQTmBb4JOiFj6TuC7xGnDiL0JhsVVSsdilG4K6?=
 =?us-ascii?Q?P2Suj/SW/xvyJLwDLvO3ukCDPLH7H9Ow/xIdxWvdzXdmNi3SzTuWAiIHKVA2?=
 =?us-ascii?Q?oLNStrnLM9FxdFm5uaGaLHHELLJe82QiZgUVUI6Gg06xKzVSLKKXnTi8RuIg?=
 =?us-ascii?Q?t3AzVVI3VTrTDqgIBE3jI59NuqfTZ+sxZEmNYUyNo3VhLj1gUjZZTiikRYE8?=
 =?us-ascii?Q?BlAByylublT5HRdIX/IBH8p6cw1ARVh03hXsxhWyL9KkrrZRFpo6xeI4jFzn?=
 =?us-ascii?Q?Lq/+JpEZS5xBGBjEWoCnZ37oqVEFcxBf2em8ZrTWopoViXg2KZUNWkjKE7iq?=
 =?us-ascii?Q?YV8EfKbk/kpbhSEj7KTvldX7YvsG9m1ez09IWIlX/7Pkg7mV2Cv99TuRBsvC?=
 =?us-ascii?Q?Sd3iUW5VWrtVU+4cLpg5DMyAhWQTEjNIm03rQbKG/IjVNV5ks0gzGWzzycXU?=
 =?us-ascii?Q?IGXuhO/1vpeCAIqpuOaMwOE7IOcSrGv0SehbjKDrSD9ZynPHnhr09scpfX1H?=
 =?us-ascii?Q?+P7Maat6yRYxwnw5mdf6RENcVgtO1tv/pNsythT/rG0EWj9rfTIZmMPpC40c?=
 =?us-ascii?Q?4HVrAp1vPNIEcr1dhA4hGhC6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa972af-0d90-4cea-a704-08d98fa7e73c
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:49:15.3077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QQs5E/qjgo7vbo6Hzd4Ku4JB8zmd39nSihZr3WcEYVpKdOeNK/qjNIGTQenzXzmp+CzkjWqZFLhniU0vq9pqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3388
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
Cc: Qing Wang <wangqing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

show() must not use snprintf() when formatting the value to be
returned to user space.

Fix the following coccicheck warning:
drivers/macintosh/ams/ams-core.c:53: WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/macintosh/ams/ams-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/ams/ams-core.c b/drivers/macintosh/ams/ams-core.c
index 01eeb23..877e8cb 100644
--- a/drivers/macintosh/ams/ams-core.c
+++ b/drivers/macintosh/ams/ams-core.c
@@ -50,7 +50,7 @@ static ssize_t ams_show_current(struct device *dev,
 	ams_sensors(&x, &y, &z);
 	mutex_unlock(&ams_info.lock);
 
-	return snprintf(buf, PAGE_SIZE, "%d %d %d\n", x, y, z);
+	return sysfs_emit(buf, "%d %d %d\n", x, y, z);
 }
 
 static DEVICE_ATTR(current, S_IRUGO, ams_show_current, NULL);
-- 
2.7.4

