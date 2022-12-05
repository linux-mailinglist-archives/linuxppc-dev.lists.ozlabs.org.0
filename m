Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D0642DD9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqML4PwLz3f9y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ZFVihfly;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::814; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ZFVihfly;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20814.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::814])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQnjh3W2tz3bXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 02:37:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfU52xENsK/eGoxr26Dl7mVnudaTTOEbzczINgjQSLby8bJrEamE12FZRQXoWN4wmujJ9CUdorHT4/IMc3A2XgtgRWaYEZ4ftq6wz7aaibdvXGUuM9qd61eF/YIeM+3UWzoVu+OoLQSeJtmtROMG4v2rN8l8pUds0wET3rjBgkgI0tOK8IQylOpGGc4zeILtlF4nDLl6wWw0EsMMthhkIOor/auJHgNUpvmfAcbJuk7furgTGnn+rBUTr0EqWvqVuPkF6uXqdAg8owqMeAVfhImkM9BqLaoVJQn/de6yIvDPOBanJMiTw6RoFedT1SKrtpScuzEObz3P/HRmy0ds/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iPM31kHRQF4aOShKwTu6rsQv7lE4UX1YT/WZYMS6xw=;
 b=WptfS67OFK97N/z+zyMVWsq0Co8va/7GFod+fn2Aemw2hBOzjVpbGH/LpJg8v8bFsgJN6hO6IhOiNwrr8Fiz+89PEL6yMRNqEZDYHgtUbbwF/w+esDOgfXb1BrmCv6IXjrz2sZhpFVUeJuLzVILxYB1fyMaWeFHT4mt3p6bVhJ7ADvjV0Wl+tPBRNJKGSR0Neoj4lxAZFvLyMdrJHP3NJjNhhKdUqm32GLxMD+elrTkBmph1I4Eq0a/wxUGczNx8zVZzuzyJqf+r324ukPzL5HNhhxf/EJ3qRxfg3bswxsFKSJ+NmUskpR7TMeXrNO06QN5nxoTr4pDFdkr7Kdij6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iPM31kHRQF4aOShKwTu6rsQv7lE4UX1YT/WZYMS6xw=;
 b=ZFVihflyqyex2iZV58qrHhHts7l/bPLYgMSYjNy2RX6GDC12YZCkNA1nPXREKaKmMk3T+pZC74k4aR8vd+sKU32afXtAiAippD/6ikvqAKnHBHsPt25AqPa00VLj5EjEomJUqFnYGEtQ+YC2DKFmZ9/SFqdutL1QXGKdZ997o3hII6Snp2+UWd2rl3spFtib58lPM2J9GOfvuUMb5zhVxCeSweVaymIQVzMbS2hcTLw2AlFQsV4h8VSAbqu6ESjBUKtW9ya/NJcwVBZ9hFmO0dkENO9FIA/MDHbiVAC5gOdIlQnQAspDEASfTQvqDFsgTN3wK5qhO11gxPfz2gaHBQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1787.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 15:37:11 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:37:11 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 3/6] apr: make remove callback of apr driver void returned
Date: Mon,  5 Dec 2022 23:36:41 +0800
Message-ID:  <TYCP286MB2323DBD1F01BF918ADD0ABCECA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205153644.60909-1-set_pte_at@outlook.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [KQ6Iu1DlV9BM4en0T0h6pGIzaDkslhnW]
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20221205153644.60909-4-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: a13fb080-54be-4566-c675-08dad6d69389
X-MS-Exchange-SLBlob-MailProps: 	i0w2f8qhTbr6OkeYxPWJvHH8J+DLRu5yohmcQaqGGfrlnPL7m1GYjqVxL/OSoNG54e076UYL2JyWZ2Vpknv4nFCLMqkYeCQTNbN3S+hlFgJXUSF9yLcaSmFOUA1lRwrbTJzQz6CEIotKtgEqK58h9JVdbYO5v4+JKS/PkI/Bs17Uxw6pNfe8DC8xu0iZT7mssf0DyzIgIue/e4S10Il7X3vhphF7VtOztTk+avMRv38LKuDRDj5/iIcqUspAb9BUcpRWImWYeAFsuYdJ5EalX73HrQioL7F/KkNlQjM4UVr1MOHjqgJhefFCKa6iwptu1eZClaCgAwkQ3m6bYDE4jIxfb3wEUaGIE6tmroepaCC9DeyuWmv3ILXPg+1dC6mHm+sxTO7eAkH28hbfHa13/bIy8+u9WjJL1aVNOvEJL+6m+FrQavQwAnSqPPLq6t/YrgEAqgwyafL7BuZybUfTMRUCvp+MSEulKJOuX67kx7VGMaL2rWcrgRMN3TcFnSGl7avmAV2hiJBu0IyqoDfp6BO9ZG/xu2+0QdUo4M4Y0nn1d9muamGnxwhM4Pony0rit9/DEhFQQMAXSPs3UN79d5sKkWCrsw3V2NMQTgqY18gVOw41buDAhRquTE1saYy+Hkip5XO+EvpxCynAPeUtZtguAgyNdGdTOVxMyh6//LfFv0xDKRZwuJXKwGNXPQ4L/bOSe9QK21ZfJS4ZROykObndS5JNuZR4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UNIHCTi5RWgBmG1UV4+mnMKCqTf51IU2TVW/+uu0Ma9yTQfsclgqnV+C2IFoJcDpfhRTWexoftXw1O4Rvsagc0qjYix2kFU37Fr2Jtgjy7bLc8fMD3EE4UJ0KLuNCKw1ituoOpKYUJR4X5/UEyjtgR/Ieaoss9vjpr5EjBpeKzAk9rgqy41vhsUIwXEGsROsc/RSWbvUjJltm+1176mjEDMJoibixKYxSaPxIPFu4OJKWHFCNoQzibUpM8BkF4Vsxin+2Ex8o0ubdGDTk6JCRm6bahUejb3qjyMqCkl7qK3Gw5nXbZdCbClb+Jr+5+6Gt5EZedvlDN1ER9V5ePWMV0rmXIscH+nyHViW2OeFOAUo23z09uNAj6SyFmMuKXyTvYelR3wl2l5ctmngemG+z+D3yVylGyYLI7UJJS7iV7Pmi4CFEGKfLuZXhorngRkOwkORCrA4AvExXKyYlsIo2nzzwvDy6twBLITWGsdwlCTgSHg7QeOJv+UJb+ye3A3XTU//L1yT1ZXfbIzZJQ2d7LmANp0q7RCUDMKAbl6uuRl+m1hKgiSJ5ZLFkFArmPMWj4YCUVYOxmlKYMJGDr0ZnQVFsKkFA0tTn0QNSPWbsf8tBdOQQXbf7un+qatdukYr/SbJGSR2xZ4URFhdXyf+Dw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VsDQdBNLVK4HqSt7FcmTP3iCA2bNSYg3VVF9MmJupP1n7AS+ZJVGtHXOgJFg?=
 =?us-ascii?Q?8jmm0NzZEPrN1IxHB62fW1mUabz3A2paF/vGIEZSpznVwwQYgtArOmtjGTU0?=
 =?us-ascii?Q?ewL80f3710YPIbfKgEwTsXPx8wyKkJHnHk5a2mJOocmkjntZwKfW1BAM09Yb?=
 =?us-ascii?Q?JzlgqzYwmsP2jIqrTS+hoTJIYq9KbSaSV/6/ujkMVN4h7O16ltTxdtHc0Drj?=
 =?us-ascii?Q?mykLw5818nZok4PvJMmo3WO6Mq6YqAGThD+qd7jppFiltsYWsNXCshGifzWz?=
 =?us-ascii?Q?0w945JkyZ0CMMn1NKftr0eSO82ZXaezW+dN7YIE2kQgpMEY3W4cSZhReBsJs?=
 =?us-ascii?Q?SrMMQEJDxEXFHz5k0n+23cYXU2XZpozOyMEbdYhAXocrZv6GLgwd/v/bCGE7?=
 =?us-ascii?Q?N5NeltvTCegkZlpFqR8IFLQLtVKkRw9P0gqkRIGAV0DBHjO4ilpO49gH/0na?=
 =?us-ascii?Q?VWnO3tUuCQl4Ih5lA/to5RPXop+ScDpcdrBdjzyRIRd6jZn8T2x6GBvwNUAU?=
 =?us-ascii?Q?U+IhCmobNLQP+bjPu5mC0Mza0lqjhzmk+Z2Q4ufndkjRqTPNqsiAGnOsqw38?=
 =?us-ascii?Q?x08OSwVx/UG3Ty25XeapBLU4p4G7czx8hlnGU+tknUCKxzAU+RrpjCaNMhaZ?=
 =?us-ascii?Q?Qd0HvXFqgPUDJBnYi2i+BzaaZiAdDt+yBsydwXi0aE88S01xnR7BCvGLs5s2?=
 =?us-ascii?Q?pJKKdpTzTLuz8/nOYWjbKBnY8i9i1JKo+m4RcwUSxfI9iOEePYz9KaFT3Bnq?=
 =?us-ascii?Q?d7lzoKmIqHLgbKdy5c9q8QxLXtvtDicnEQKgJjjIdRFZKQUYE511nvHz3wls?=
 =?us-ascii?Q?AVpLDzXBV3ZG4qj0Xwg5GBJy4J6qoSxFW9a/wMROOSPv+KUM0GmeVpV1MfHl?=
 =?us-ascii?Q?VGv0bsIn2TbB4171iFaTVcx+OW9Ji07rhg+fRxSFnL3/F4nSo+xKUgM3ZuDi?=
 =?us-ascii?Q?C8+AjcqLT5hfi/t9/eS6Ge6tGMygqfMfPXn3NnUkt8qc0be2Mfb8x99powNj?=
 =?us-ascii?Q?UwYvZUAQA/UlzWl2in36lObaesXu1KiszvE3caMC56idC5fOHXcs0gP1/tri?=
 =?us-ascii?Q?SNaxffKtlSfit/PfKxvcVK7YFh4LlLEPs3xyo3xrOrbzoAuKAWSOnsqeAtwE?=
 =?us-ascii?Q?Av6nBVKE974LnWX98B1U1BCXImx2nyGJkQOoxnvgdmQKI0o3Sw7METDfvPYo?=
 =?us-ascii?Q?3WurRpsV70GYVN6fflOZuKOJewHBL4aSj0FkJhR3rHuTweXvGs6L7s2OC21O?=
 =?us-ascii?Q?FpeZhiZdFma5/Bx2HidWX9AA/86WohISOiqfYRA58g=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13fb080-54be-4566-c675-08dad6d69389
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:11.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1787
X-Mailman-Approved-At: Tue, 06 Dec 2022 03:48:37 +1100
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, Dawei Li <set_pte_at@outlook.com>, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit fc7a6209d571 ("bus: Make remove callback return
void") forces bus_type::remove be void-returned, it doesn't
make much sense for any bus based driver implementing remove
callbalk to return non-void to its caller.

This change is for apr bus based drivers.

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 include/linux/soc/qcom/apr.h  | 2 +-
 sound/soc/qcom/qdsp6/q6core.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 23c5b30f3511..be98aebcb3e1 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -153,7 +153,7 @@ typedef struct apr_device gpr_device_t;
 
 struct apr_driver {
 	int	(*probe)(struct apr_device *sl);
-	int	(*remove)(struct apr_device *sl);
+	void	(*remove)(struct apr_device *sl);
 	int	(*callback)(struct apr_device *a,
 			    struct apr_resp_pkt *d);
 	int	(*gpr_callback)(struct gpr_resp_pkt *d, void *data, int op);
diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index 5358fefd4210..49cfb32cd209 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -339,7 +339,7 @@ static int q6core_probe(struct apr_device *adev)
 	return 0;
 }
 
-static int q6core_exit(struct apr_device *adev)
+static void q6core_exit(struct apr_device *adev)
 {
 	struct q6core *core = dev_get_drvdata(&adev->dev);
 
@@ -350,8 +350,6 @@ static int q6core_exit(struct apr_device *adev)
 
 	g_core = NULL;
 	kfree(core);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
-- 
2.25.1

