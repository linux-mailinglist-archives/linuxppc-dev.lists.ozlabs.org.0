Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1550A1FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 16:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkfnF1rqtz3bbb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 00:19:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=bvx+1xwz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feae::70d;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=hanyihao@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=bvx+1xwz; dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkfmV6VQ9z2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 00:19:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z492i5x7FKTDF8PWMS3wJtb7uQ6uw/PYLdHJKOPGfRd6p74bBymJ0aKqr8WdgEG8gX1ZppEt3ekX1s1RF629gwT9sSiQLS4dkzgWPUx0QOs1Q+k9sLrraXQm2g0blc8ScGCa/ZH+obNbtRIQofPgM5+vI9adR22tSld+peApm6QxZAN/96FiRDoCq90WVqvS6Iel5BdGIw4vDQQ163MQXr6xWte3y4fhiv7crRvaI6TaJl14I0/EnY2j9+AlNNY2gBofxuk7mMbFq5xOGb4YSkwifpqh4SecGVrgt+fiKwtQbaz67lysssqVZ9Y1VryOg6IlSfZfaETdwMS5v114Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN1e+JFFAguVQm2RiofE4OKFYt0KJE+BgY7S3WPhtCo=;
 b=KsD9mzmvyBI7rrO2JL89x0ZhN6M2NGthg6tvZq5QrPv9ndw+2+OXpPfUjFsVU3kkv9Cu1itVtyEkMgbsWgLvXhshxqGPH8NPtV0jwItt9BJljCC/6KuMMxlM8atqjiLXh9HYITnlOlvZG6Nf7ZBReNDsjL9IooEqV1WfNj2sUzbXuwP7/4Fsesrx98n4kod3/BROKMDLOWvlSQGEAN3EdEMPHvDGUHmKk+H9CpMlLYfkF84BZeHiAzjnzqoxe57rM//DYgQAKra3Lkf6ZTyieD7TB/BnLzYgLBlLfm8IkI2AYvy7CfR1tGwEo8f8u0qLATZfzzy8Ve+oKcOaGhloXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN1e+JFFAguVQm2RiofE4OKFYt0KJE+BgY7S3WPhtCo=;
 b=bvx+1xwzGcbUYXodWa4xGauygojG+/kPheWr0ZZt4SY9XWYdhIOkkVCAZJwmxdYgtIsZJXm71KI049qNZnoQoauCuaTYVbHW8YaK2BWfRRd5xWODiXdARzdoCSDQQ3smuES/puO//B5PzrDDUeispOe4lpZEPI0y/A4BSWNPM5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by HK0PR06MB2163.apcprd06.prod.outlook.com (2603:1096:203:49::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 14:18:42 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::d4bd:64f4:e1c0:25cb%4]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 14:18:41 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Corentin Labbe <clabbe@baylibre.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] macintosh: macio_asic: fix resource_size.cocci warnings
Date: Thu, 21 Apr 2022 07:18:07 -0700
Message-Id: <20220421141821.11519-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0154.apcprd02.prod.outlook.com
 (2603:1096:201:1f::14) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 890f61ec-dc2a-4d55-2600-08da23a1d639
X-MS-TrafficTypeDiagnostic: HK0PR06MB2163:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB2163C0A52D5241002ACE3D44A2F49@HK0PR06MB2163.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRb2xvaECjdOh3ZaiLZ6Aq19lWA03k/PS1TisE9Irm25tbsDPHz6RQ0+Jv/VGFRYaQP/VwJNxiOWaTF8y45vuYxqxxH5XIDubyOutw26R5Ehu7SUbpq9O/xlnsfFCQa/0QdKj5bURHRyYIpJEU+u1DZ1YxHp74D5s/JsMdGqwWmnWFccZIpmUeAEqYRY8jSkFgqfHx3kha4jYz2EhOMwwr4gU7miaVwhbPYqdZyeFtCQRv4miuO93DSFe0rD+4wH0iuYQKKSqAfnWHmT0Ko5eubSnbKAqJaKkOsFAR/AilMDIiSDqYoOWWqPDmtk3MNYMAksWbheOCGRWJX3nh8vScmbQqC22PctTETjc3rlJIqNGUAZvwxJwE4oxZlU2iw3+yYwKO5yG6KO4YIX8hkevCjovpprnXywAvysIuJb2sTgM0HAI3twyd8GjSEcIbrVDBviledrEGZ+c6CQAa4Cw8h0c/o3XYD0KsDi5pxFrzJJK5lPBSlBs2Jwv3KO9h4YCv9zkskyu5+z7kyUQ0ilzvRVh701CTp1/KVstaLYWb75dAyeJMJBdxDEDNqhHZt6BqAOrLMBHAkxVUWx8ZfquLJ1cZh/GREx/Ge04Vk8BnurXGLle5mqWYBjsdKzm4XP/7DRTwSdw/wP5g7WEkeEn4iu1GyCg0roiXqHvGiZnw9eQ57kHpkckiWdJr4Rqdm/1JHQnZ6ZM2f7GNk+unVkdApXarlYoYim97rSvLmhPvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(2906002)(316002)(186003)(1076003)(38100700002)(38350700002)(7416002)(921005)(83380400001)(86362001)(8936002)(107886003)(5660300002)(6506007)(36756003)(8676002)(52116002)(6512007)(6666004)(26005)(66946007)(4326008)(66476007)(66556008)(110136005)(6486002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UFZ6vpgCKJ7vU0WS09OMMXYSK9YgWRdx+29ypMZS5aG8Ul6t4mnmtJFRTNWZ?=
 =?us-ascii?Q?s4Lw7pLEIgY3W8ADhZJvIejPDOx2wLSjqwVmcyA8ec0AMz3uSApeAk6SJ6t1?=
 =?us-ascii?Q?z1sXyZOuW4+ywbEfsIb8SYlWIAFAz/ElHUYWMfVoToWF6R67ERly0Mw0b7SC?=
 =?us-ascii?Q?SU6PUYDPjeQ+eN2be9JnN4cOrX6jNoDoJkNIoZWTuLUynLB/GOEGplGVdL5Q?=
 =?us-ascii?Q?mcfWqzav2CZy/YaGAFeL9mtlUXfNM2irvaO+6xo+KgxbTduuRiRT8tNNAhGr?=
 =?us-ascii?Q?Bry0yr1gFJ6L9ATS3QgogCtyUvJBh5YCTCejiuD4shZdCx/f6k+lysIW9aPz?=
 =?us-ascii?Q?kUUCrcMIOYxO+jeyK6woJlygqdYv0Kt2Jl9iwA3pNxeQcWmOCgkmXbQIAdln?=
 =?us-ascii?Q?knXUklx2yFsOwrnil9G/STN2acJY1aZbSkdktRnUFeGb95PSJ2V2W7ypR6Wb?=
 =?us-ascii?Q?H7j7WrWR9Ij/npIO55MtFFWhF/VD3QS1a5uUJvwKeKJLIe/Ih0Hox3j/fDZr?=
 =?us-ascii?Q?1O5G+KziqmEtzajw1SkerLdLvP348/gogJi28Qnmm9Eqtxy1L8Y7lCccQfmB?=
 =?us-ascii?Q?FLYJkqC3tI4Kaam+BZSOb8YaHpNedUte0WrxAOND9rWRc2rcbkE2E5ZBgx2H?=
 =?us-ascii?Q?CDUztdr1CLK0C0htIlET6/pBaBxpyTfjfSqnPrNS9yZ/cNgnLYDDjNvssitU?=
 =?us-ascii?Q?aYtVNAA2q9hi3qLtL26r8tkv3NY64K7EfBHAKiCy1UM4hoNjTCqUx5JIp0SR?=
 =?us-ascii?Q?X4ULwy0rxfxzQTiDrAXdhl59q/85APFT0m2CQq/tI9AxwaJhCXD1A2ZdTxam?=
 =?us-ascii?Q?GwpLuHVYlwfaD8dwWv9ToAbJrCsm+liLVLPaTMQKg88pA8ArOHaYcZuXkang?=
 =?us-ascii?Q?IIEnzyH9R7XmX58EXD8gWtt42Kvmudes7VqqeUVed7PBVlwnDTxqaRioVuiW?=
 =?us-ascii?Q?4ocxHZt0v9KuxEV0Jn0cXHeXWRkF8NWq2FpjdZUy4Hfg3ByjY41XSaxYYU1K?=
 =?us-ascii?Q?nHaFPQvB/tcsxxD49axLlYoqVSD4qxlcKweptGnSPpSgbTJFsQZ3Zh6q6bAu?=
 =?us-ascii?Q?014JklFknm7Ela2wphtRYM4gUrDsZGYiIqCwXrPLOM+nWyGcaFB3sccnwF+d?=
 =?us-ascii?Q?gfW8onPnV8i2GAKfXZWcslsUsCCd692DiKe0wZHhReb4pq+qgaEiCYAy1I3F?=
 =?us-ascii?Q?Bu5oC1YBhF3bbkBvXjKtKFK6heRJGzWaE4BDUmFV2b3Yq/dAJm9jhZ126M73?=
 =?us-ascii?Q?q06e3ZViq3Ex6QlInCxdVEHUg3LsDI7M+X/vGBZbR1dN4Ry5OOKwIW8BtMEI?=
 =?us-ascii?Q?wuTxI6VpRyNVgU3OkzkFmt2qiWfLF3pZ+lXFagLtwhWvmrEY8Ao4rikx/hHM?=
 =?us-ascii?Q?DlGrrojyk7DgVZ4FDomS1kBYZcr86wQwtryCUcUJi40m+UYuK4oup/w6pMEg?=
 =?us-ascii?Q?nI8S2m3nPdooEMnTti05Mp309znaO3O+mLMOzzT4iojFQ3wpje81nJeICWM9?=
 =?us-ascii?Q?258yZiLKj493MbdGa0FCPGv2QVjsrWdKvyqf+1WjSqOzHQEi9QVeyv0akLBW?=
 =?us-ascii?Q?p38X6vAueh3Fa1+lrS01WdRDCuCLyPRSOzcXd0xUbudS4AfbzGAIA4PJffmO?=
 =?us-ascii?Q?jWj54iSLbc1H/5kt4ELjNMdTKKWr0b5PQfH64+befw/Ut1yTCjSkm1N1/whY?=
 =?us-ascii?Q?fSQt1HwemT6FAwV3dhb2FSdGNgxbU1Dng9fq4oPP0LaGwuhlEMVcATwy2Ck9?=
 =?us-ascii?Q?9H2hmQ72ZA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890f61ec-dc2a-4d55-2600-08da23a1d639
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:18:41.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CaJySsynSHw0ZdEVxijAgNiXMgA9gChu7C0t3M7FhrUtI1xecz9aGIEmw7b0XTQRz/unq3yTPgarP0jeHhqIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2163
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
Cc: kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/macintosh/macio_asic.c:219:26-29: WARNING:Suspicious code. resource_size is maybe missing with res
drivers/macintosh/macio_asic.c:221:26-29: WARNING:Suspicious code. resource_size is maybe missing with res

Use resource_size function on resource object instead of
explicit computation.

Generated by: scripts/coccinelle/api/resource_size.cocci

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
v2: drop parenthesis around resource_size(res) and edit commit message
---
 drivers/macintosh/macio_asic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 1943a007e2d5..260fccb3863e 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -216,9 +216,9 @@ static int macio_resource_quirks(struct device_node *np, struct resource *res,
 	/* Some older IDE resources have bogus sizes */
 	if (of_node_name_eq(np, "IDE") || of_node_name_eq(np, "ATA") ||
 	    of_node_is_type(np, "ide") || of_node_is_type(np, "ata")) {
-		if (index == 0 && (res->end - res->start) > 0xfff)
+		if (index == 0 && resource_size(res) > 0xfff)
 			res->end = res->start + 0xfff;
-		if (index == 1 && (res->end - res->start) > 0xff)
+		if (index == 1 && resource_size(res) > 0xff)
 			res->end = res->start + 0xff;
 	}
 	return 0;
-- 
2.17.1

