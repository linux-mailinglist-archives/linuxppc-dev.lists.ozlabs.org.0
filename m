Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399898D7499
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 11:31:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=UqsZZenz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsWp22nTyz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 19:31:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=UqsZZenz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2e11::80c; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=erick.archer@outlook.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2080c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2e11::80c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsVT40BV9z30W0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2024 18:31:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH4GXzEcHVqSzmHBgYcfVIXAInhqngIGQ7JKNEJSdp+oAQ0ROBZQnyGZ2MCLl8L93zVgE5UlLlkvC0AeM2yugnuEy45POU3tciPW2jF2C2Tulv/Y+vymwD15AyWKhijN4dDh3VqRyAsl/5FhFv6jwtT+rNmItYxkvMtANKkkdZXe80V9LLZqUHCBNCicVgIDZytXUlBTOEISrp76sTil/NNxOXjaV8fyzDft190ayaB6mWcqP0Zb1z+gPT33BdMKu1OE4WZ5kDwy87VLCvfIaz6pjCTFo7lUTVrgyDeaeJktDeVpSLkM0h5rbJpdmKQiIGgh5003snXMvVsvfTVMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAH0ZhaVBe8orsAysdrPF3xauRSFQ7T6Gxvu4eyc15M=;
 b=DgrzeFviSRcvE2jgn8r4kf4N3fvJD87PtCBHkxnYUrdq/7M5jmtBbpgC5kylLaDMmu2q91at0rSJD8lr8FmIkG6qxEcUodByI6NUK/iFFEd1goXsbr7bpW4O0otN+gdUL9ZYu0xAUsV8Xqg+IxieRYQBavg1Qwu758TpDNRyQm0nOND9JggJ0Qw3wtOiaiJPGETosAh2A3BO4SQOXrBE4i6uEwo2nEqR2ksRlDhd37k9s4bBiUNAIoXtx+1Bwjn3fblMaXXOQA65BHz+NN37EhD+F0VBlF1cm2TbSUI3P8DxjNA9ZhhGG22m8sUGsjY3yGasvJfIH4f01ejlBCciig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAH0ZhaVBe8orsAysdrPF3xauRSFQ7T6Gxvu4eyc15M=;
 b=UqsZZenz7bdXn1AQ3siFfaYOIx1gwGP9oEfvL9pXKWcae//Ph/NwRXnGuE4yUnIMdoINlx84lgRHbWu9T1F7vsmuv62MN7fhDBB+frnnqMVAFFbbotKInFsuvfv+qiedyUdp5gJ0dbqlFoQimeXYxeI72flVRpkvBHtSej0NeB3BwCzBWgaIozDmwSYNl3VU4aEVAtIUiiu5iuPVfcEZ8oDcI6m8RSUgn2irekzJZvhwH7pv8dP76l0tAwrS8/FK8/Xxb1pX1jCtKCopXNJ4rdMy6VsplT59a9edJA8YquGCn2/A/ojyWO10MEsBTOO9j3K6nuDAP0enwhsh6bTM6g==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by PAVPR02MB9500.eurprd02.prod.outlook.com (2603:10a6:102:303::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Sun, 2 Jun
 2024 08:31:26 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7633.021; Sun, 2 Jun 2024
 08:31:26 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH] soc: fsl: qe: use sizeof(*pointer) instead of sizeof(type)
Date: Sun,  2 Jun 2024 10:31:07 +0200
Message-ID:  <AS8PR02MB723701656CEF3C559E7D22128BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [hglAzd7TuJxYxYUjkxZWcfWHtKz2/nKi]
X-ClientProxiedBy: MA4P292CA0008.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::14) To AS8PR02MB7237.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:  <20240602083107.8671-1-erick.archer@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|PAVPR02MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: f372f4a9-8785-4ff3-6dcb-08dc82de649b
X-Microsoft-Antispam: 	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info: 	owBvnIk9Q18Xoq0+YXvtsxKps32waA2RM6EcZQKcKGaLJSjHNE3f0AflVnl78q48YBFqwrHz4NFV9G5O/NzoqyCu7oymV5TwXOjLdgdR60CTMUgtLZyKyFOG+kK+s8TCxGfXG2r0hHAWJv+ZIHga9Q6jmoh9jv+WVyNPb2ClQP4nqO7ftb7b2SSNrQQfWOFMbFkpaLkeLXkMtF1txOqeREFkddcZXWE4CT7Cj2jhgw3t45pru9g47SUZsAQ4LSsEgCf6Ngpngdwzy2EUy/3EWYhjHtGboMWJgvf598XrnntX6czgjqGkRLEl0cqVeQxKduwushU520bwzci5lTjRCBjfV5v72AGIeJB1a3B9VTuIYdoMTdI+KMqOzrhGQhhVqgnB2F5OY7RkX9za9uS1PL6Qm7zEVtLohr71mW292PegXwNwNCtBnV0i7Xvv2O1+5neazrj/UdRH+TugI2NBBl+NyEA2Ku+DFLpKmUc8HAW2tGL8Vu6I/WSUSNK/0+jpWoYwwETqXWC6oaVmmKEB24qOtj8PLgc26JMBES2QMqx5mL/riMVEBaTQ9+5CmQKrvKco0pP6wD5Q/3OKD5xCdPREagK9OVHyKLSB5vGqpCXF4I3LGUtKBmzDTVQlMlYv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LVoUjP9CAS/SaURk2YY6PBS67oOr5oygUE4OFgIsvztCP7hzM+fF7rILnh58?=
 =?us-ascii?Q?lEbEp+ZFRFAAHhIQh2t36IYVwaKpbPQ5UGTSnBIxUV8+9dAhPL9JCok9AplP?=
 =?us-ascii?Q?E4CcmcOjj+s5L+cZXUE7faKt2kBe4jc/6hPJDXWuf3os1+PWY6JD28eOOvMU?=
 =?us-ascii?Q?VJERm8Ku415+FQl166qMO0UKfXkmR0GR9/v1eHkCz41vZhEAx81smpL3WZvh?=
 =?us-ascii?Q?eFJ7LmQgWaM7+z93MxVUmpIQLPM2xmoE+ozeAvEE9MTkfXw4nguD3sZtNQ7+?=
 =?us-ascii?Q?u2hManOH1tHurlYHRKIb7hX+G5P58+V63u8MxtdjlJmUW7DlWZXCt90bVgNH?=
 =?us-ascii?Q?nKePanlj6ihCaF6hMke37FQT2h619HK+MAxo0ZrqA9zMbY+UYPTK5ZT3dhpP?=
 =?us-ascii?Q?GkyrhaGYt8fIfp/PqHznNZx26PTAhn8/zTvGsyAKJnvZO5VFtBHBGGdKNmS0?=
 =?us-ascii?Q?/LeBZqxgSjg/+gQSp78076L6J6C7jtlV8oPiDMmMYyhbC3T02ILR1Aztcfq1?=
 =?us-ascii?Q?GoFDGuQbPCoFtlKbF2NqZysAaTMllvBvf2G/wI1eYtHvzvSsSKbMVG54WWLM?=
 =?us-ascii?Q?ZJjFmHHRCCLo3wjEhN06inHjzNa7Qv53WlPyxwTQrX/Ze8SqJk+kh/WZbDLC?=
 =?us-ascii?Q?+1kU/hpAGpqOWpVcTtccvwbsHl7D4nMZTFUvGNBP0U8lQ04C5Z71mWiatZwy?=
 =?us-ascii?Q?MXbIJEV35v4eCejq6SpTrmVxTf1q3aAfb/nmI3tkqPG19t8akISLHLj8/kiv?=
 =?us-ascii?Q?BT2K9kV4argec3UNcbWdP6Z03ZvSsXGY1Qr3w5X7JWsL+htKWXjHJRvwA+3t?=
 =?us-ascii?Q?Nlf5AfyEa21nE5PXEBZaMwPL2GCpvEv1UXnHwMTcpGN0vYFPInPFB5coUo/V?=
 =?us-ascii?Q?yw441tCIi92u5mVY3itY8RsjVbHM4STPFXAk9AYt+krX5Mgy76QDqSoCQcZf?=
 =?us-ascii?Q?dm7uuJuLZNofhbftQOqY8VCGs+IcH+MeH9xZtGEKj4em51/kwFi7HIkys93X?=
 =?us-ascii?Q?h1USD7Iyaw+AuvFjQH+yHFMyyvalz4ZcyYteZhSTWRDJnbwjZjDtRVjY5/S0?=
 =?us-ascii?Q?iLu5PdXKQ/qZICQwiDQmy9YRaipLrHLfkQWGunaEfS0gtlqr4saeOCqz3cSF?=
 =?us-ascii?Q?s45nO1NykPiyp/99BekyefpXZKEnWAN6GO/nDv61ChUQ+CxUmDKxreXkymhc?=
 =?us-ascii?Q?MzzfmJjWyi+9xw6QjrvmWizoI/EbicYxbu3HbBpN8b0wql55AqYW9J9R2x2O?=
 =?us-ascii?Q?td2vdLKExBEVUzRwTo3c?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f372f4a9-8785-4ff3-6dcb-08dc82de649b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2024 08:31:26.3350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9500
X-Mailman-Approved-At: Sun, 02 Jun 2024 19:31:02 +1000
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
Cc: Erick Archer <erick.archer@outlook.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter). This patch has no effect
on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/soc/fsl/qe/ucc_fast.c | 2 +-
 drivers/soc/fsl/qe/ucc_slow.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/ucc_fast.c b/drivers/soc/fsl/qe/ucc_fast.c
index 53d8aafc9317..32044a40c278 100644
--- a/drivers/soc/fsl/qe/ucc_fast.c
+++ b/drivers/soc/fsl/qe/ucc_fast.c
@@ -191,7 +191,7 @@ int ucc_fast_init(struct ucc_fast_info * uf_info, struct ucc_fast_private ** ucc
 		return -EINVAL;
 	}
 
-	uccf = kzalloc(sizeof(struct ucc_fast_private), GFP_KERNEL);
+	uccf = kzalloc(sizeof(*uccf), GFP_KERNEL);
 	if (!uccf) {
 		printk(KERN_ERR "%s: Cannot allocate private data\n",
 			__func__);
diff --git a/drivers/soc/fsl/qe/ucc_slow.c b/drivers/soc/fsl/qe/ucc_slow.c
index d5ac1ac0ed3c..c80bb5014725 100644
--- a/drivers/soc/fsl/qe/ucc_slow.c
+++ b/drivers/soc/fsl/qe/ucc_slow.c
@@ -148,7 +148,7 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
 		return -EINVAL;
 	}
 
-	uccs = kzalloc(sizeof(struct ucc_slow_private), GFP_KERNEL);
+	uccs = kzalloc(sizeof(*uccs), GFP_KERNEL);
 	if (!uccs) {
 		printk(KERN_ERR "%s: Cannot allocate private data\n",
 			__func__);
-- 
2.25.1

