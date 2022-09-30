Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6055F0557
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:50:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf17t5lkdz3f1c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:50:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IVnV7G77;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.84; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IVnV7G77;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf13Q5d7Kz3042
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:46:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdcAONRDKDRJxxcg6rYxSihx61mBea7BePjVYU25+mgyAzA5YVeyIjAPwNKH+Q+MeQ3kBb7cBayV8+pKEgEep/rhB3tuYMgbHR8W06By8XecTz8GwWFITd0rbDGaWJ/jwq/XWJl/mkNflIO6nn5eVEvt55VVRkq+hAo8eWvILl19RcxUNF0sillCQqMJ2treHO4ODyV582AjXCBBjKU5fcz4P6k+dr72HTtw7iV8WY8wZw8/GJ9b4smp+aTVfMoAAFhfDBFAGgvNv6QmPPUsJqPSpMCqUBVWd1Umj3HxoyF70N0ulo4g5RLC2LgJPiO5gJplpkutbAgLMLxz2fuQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLcmkkiNlbs0tz1gDm+D2uOeNAsHk5XjyBwV+M9cYLE=;
 b=li1N7j+BhYTvSXHAMYJ2pBbGdDxmbOKgl5IHheW6vgbxknHwyAGuAzL2JOizuQ1euk/nfLMKamNt/tjkyVgyPH7+iuKiNtvbwvJb20ad+Dl2WKSdA92EY9/C8sMXckvjLksddwHq0MV/YKmisYd+t8mYmpQ9cP56t2oMFjEsCfFeTE1FGgoeenZGb14hunyQGSTsd/i951esUAZzrSJVKYlIGIab2TGIimbNFexMJMrHN55o8fce6g07uKHll5/yZoyCx9+Dne3RZwWogG9YyNapE++KeZaZmO+Ll4GXdmwrI9h/3XiV59CK4YfJs7sSqO9/NNfCoghYEpClUQgS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLcmkkiNlbs0tz1gDm+D2uOeNAsHk5XjyBwV+M9cYLE=;
 b=IVnV7G77jLTnJBaqq/6p3InpfOs2PCAF9slk6x0uMjwLkN35d0oqb+ahraHK/9AVx+yEkhyPTnDlngmd4YWXIJL5XzpzDzcfFSMaqcG8ou3nwQLM/zih07S4+SY6BOIq9gB+L7r6I7gAOTiPwEo+bnB+0xWvkfoJvG0OskLMums=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:23 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:23 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/7] ASoC: fsl_rpmsg: Register different ASoC machine devices
Date: Fri, 30 Sep 2022 14:44:39 +0800
Message-Id: <20220930064441.2548505-6-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930064441.2548505-1-chancel.liu@nxp.com>
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 4492983c-1049-4fc8-189d-08daa2af7cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DJSOpw46RJunws9D0OOQ+Uyid7ewhyPrfsW7OKQiKkAZ6YhDsidBy+0iuDINi7IgXFYJJJqEpXs2SSHCuQaiVH513XU5GGnHBRmtInxC+HzwJdYOU1MT0+gguqkbBHAL9rf9ISCG4TLNqlx9ixsmK7NgwIMP62L5/7Hp0V9+QoYqLVvpP7UU/zd2yiqPoVfQZYLBIIK021O7zjGk0gd9pKkxMbwgSTbO1LC249apZx/qDZxzhEJIF2U28AbsU6OCriQA4Rv35DSVXESkqPOfoZWwC+HUueqaOwCj+1sHHLOnpqKMQqdNpCOY9Gf6ZwQoIPjqAeCJqyVcjtsNb9ywuB+2NOzkDR19qmKvzyoJnlqzNkkjkFnQFKfPz7C0vIW3gWMzXQbc+IOn59hp0JlR71Ucoq7n+a9RwpgSOD+iTj/TaiWd8k5YHqaMiaI4K0vU7TA7DmDNY7gZSJ7Y3gZC3m2FdWfvdacdGCvn/7wyhb6I5CRShcH9yS7/q4fXN5y5fVQEVoeDWqSIES5XvExlm+l016psDYrJPmCAXY9Bmrm75wMBlokUJY3y00UVuPWMKKb2QfXjwJHTxFTg05m2YaimCqlhTjcR1TatDPop2HyZh8pHWE+uCzs3NI47NNdGfRL8bQ5zrFA2+0rm/NnR/0RQD1eDC/wg5nB9Q+7XkdOXh5kR8IHftJm7EcXYmTKftxiOGaGDnqBAilj6w2fPOmWuqx8TlTsQtqlEqzAHD4k8plXbeqg7DHi0ETuLutzVutqekCNeQyAdfC8ZyhHJBK4xu5m+7yh1zjgt0pB/gNc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(4744005)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Zbp5sjuppiYjfN2XfNJnjTzgk7teocHqtldd7YM3ujxaTMPp6oRmIiCnTASj?=
 =?us-ascii?Q?ZqXkJtXPe40RlyPf29zfmk1OcUVZahr51SkNV64PR38lQfFfKrnEZpXHKZYn?=
 =?us-ascii?Q?ZHaCwYGxErs1Fsg6f5J+lzHcew0AyOKmZmN1mXNWRsTCLYn0yBh3CIO/5GAm?=
 =?us-ascii?Q?ZnVJmQBkE2bWSu7Si2N7tOyD/ZHKJojUMdCJNU6JF2/ejlWYn9/MvRjx24ut?=
 =?us-ascii?Q?lJ8VGoMO/3R+gXSHNOsvD9wRxr1HEQb7XPqddECkQ+2bmjyK2XCKdTTg1tak?=
 =?us-ascii?Q?9tzAj3sRCNakuOZ7NZ3fDcef8PFnmtKFdPCeCg99rD5MR8fo2E6NrUJSM4ux?=
 =?us-ascii?Q?bJrBP9jRr8pr9cHFYL/u9h2AnapbmPmqXGnZk1D4/kjLMEvOhuimAObKipwT?=
 =?us-ascii?Q?5cXbNITC1Cc77xk25RyzIshA7tACXarbFTZXiY0jkXUm1ZrRxypxee4ZgGTE?=
 =?us-ascii?Q?C5XC5+38OtsXfDtn9M3Tn+REjy6H3JhsLJ9Js+iF+KviQUmJKfqX+cvu/lRG?=
 =?us-ascii?Q?KY+J5KghgFqeCDdMrLqSVikZACUHCjr93U4UIstrnDfBskpmffMeNI0yZ5hi?=
 =?us-ascii?Q?fCTZmiuOmJh1pRN1nw3WWu12L50sfFk/ddrI1Atj/wTIK7mft1M+AfyIi263?=
 =?us-ascii?Q?3tHIq8CB1HuAmAzOxWM1zFzM0eLWgzFDygkiBOtKn+6pA74Pru6hBO36TQy/?=
 =?us-ascii?Q?D/YkSANZ4M3JSWIEEj/peLLKhDKxQtUvxCM2SYL+oY6UHTBMo5l3s6IWinMP?=
 =?us-ascii?Q?oKPWFH5LvX7bS9/ioSG7aU4yp5NJRh7tBdJ/mCdpZZXz0CQBLnW+qE3t87cF?=
 =?us-ascii?Q?qQfA8g2MepvRlZPETBT8LBm55xuyytDQbX2TtgCbi7ZFFKmOWWqm0hfXzHd5?=
 =?us-ascii?Q?oW2bMvGHZbNPz2sRxCNs911BNNlBLpVlIICM3J3JtTK2DzlGDb8I8Ek2jOla?=
 =?us-ascii?Q?jr3Lo2zp54cpdv7/PK6EF8/DwIjrr6+GpELgHCkG5ppDl4bSYA/rKfuBwdE7?=
 =?us-ascii?Q?u9VNB0CSbcoAOBWMprVsvIfeYWoiMELyrqlceyKEiqZCkS6osL8fUIrME0Zu?=
 =?us-ascii?Q?uNwHpxrkBhF6BsjUpYeKn9vxxbjmFylNHrwx19sMJIahjwRkSRaSFFZNWmSq?=
 =?us-ascii?Q?pysfukUSY0htO9s4ZTl0nvX5jYe+12Z2OWjQ8OeilDLfK6rOB5P5HfMyVxz1?=
 =?us-ascii?Q?8TM/gcmb6dj1kI3yyI3JGL9NsI2HXihpWS3EIDYBp2w0UoiQRdBfgLGAqj9d?=
 =?us-ascii?Q?qM8f2N0G8xvBxJDYl+NeeBHyqEebfn20M7yIKKaLftp9giuqq4I1J8jiMyHv?=
 =?us-ascii?Q?3ygz9gsc7RVnf9GEHOgYQgOmZ8gQlVT9yhapR41U+RAfeZ1wfFI7w3sRUGiU?=
 =?us-ascii?Q?0CBzro9l3ZYaML152TOVVJnhGfE5EUzW+PvLiXhYpil+wrhDZj3BkYS9sJAv?=
 =?us-ascii?Q?iWeDNTJJ7bzDwRx6ylFIHtjzF35Vf/+CKP4aBmdQL9qhciWCjXMMOVSP91Gj?=
 =?us-ascii?Q?+GM1r/0I1ACqD1SJWsTpuJYzP1xsDUWqvf7kkprDMFil3SKIaP57DMyDrCRU?=
 =?us-ascii?Q?2HESY2MRYQhnlW7vpOcUvEhOKyM0+pMugfPONXt9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4492983c-1049-4fc8-189d-08daa2af7cfe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:22.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+SLTPoQyBniREjbKdci81XM8TGgF9tKGCq81Bh3Pm6011mo/MMI2ftaloi0O85TVpTeaHYzr+05r23D7TrpSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver helps register ASoC machine device thus use of
PLATFORM_DEVID_AUTO macro in API can automatically create device for
each sound card based on rpmsg.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index bf94838bdbef..fde3d5006ce0 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -235,7 +235,7 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 
 	rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
 							 "imx-audio-rpmsg",
-							 PLATFORM_DEVID_NONE,
+							 PLATFORM_DEVID_AUTO,
 							 NULL,
 							 0);
 	if (IS_ERR(rpmsg->card_pdev)) {
-- 
2.25.1

