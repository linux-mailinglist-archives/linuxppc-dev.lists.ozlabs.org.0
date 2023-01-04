Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B565CC08
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 03:59:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmvTY1G1bz3c83
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 13:59:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VtlGilN3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.22.47; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VtlGilN3;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmvSW6pySz2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 13:58:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUOuoXyUSdsevssDmHvsepMD0iDXvo9shQ+Yrm7jAAPU0JtSl9JDPPcyy1neUuTCLrnsZ5OcRxfi8VR7sQ/jfRQoOWCW6TTjSAAf86XWpmAi5VGghbzm5mkAZ8oLfeHw3eN6EpmA3Cq5i6TBwattsKkiFLQBXQXH/2kqKIaRfipyyvruFvRD8MkoqERp7p7P3aZl8Qm0Eh1uuGyZ1xbcjqo1cD6gq7IfAWCsZ5v4Kz2p8hJbjCQUKGrsBGOBgy8sBf686CtdX8s6mUtcxiGBUzFXKVCkeJkDAMBM2t6VvOQ+yv9XsCT8+p/9VAVDYBH5YMMkTcAVJxvqP0yQRQkY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnLGiYFi4LereKa+NPSlcj9TnzVQ3MMfEnS7AizFYnk=;
 b=MLNjl9/0HZ3nO4+z2NmQuC+Q80KzGodC1FX87umDFFmkkJ6jlvVYXIM++NAZQqpKYtCRGXvfBMkeI8D9g8eCHHva+GRwNIpLNnKt9gtzTu2VYMABK1MuS614VA+/ap6pjxfZLrcCkhGdAIf+FF+c0d/rpums2Q8OBmP4Yk2T/svrwzGYF+TgYwM/JY9xdVE29FB1qbsYcce1lMmJ+dwNPasn917wCiaDAjkeDOx3SGSoqaY1b4F4d7DGduRLrvqPXOS/Jaq6l8ypifMAkJRu9+mjLJN8opQTMWIHM1rH2gy9RY/GohMHMTTlE5k5jdo5skYbGC21SPjR23QVA0L57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnLGiYFi4LereKa+NPSlcj9TnzVQ3MMfEnS7AizFYnk=;
 b=VtlGilN3vQl75jb1m2W/TU0ajfI3dBfpqQFMajokL9PGDojdrVnwGJ6QvQ3vH6L1/+Ga2kKztXrRrhDhxLyYf/1WhwkYOevkecNDWeaFzYjySmJnJc3YaFQiDB4zFYKZsjHUOguEjRL+la5Q4NSWWdLMzD8J0hziAuSQomy9gys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:5b::30)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 02:58:30 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c1e7:eafb:408c:6ae5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c1e7:eafb:408c:6ae5%4]) with mapi id 15.20.5944.018; Wed, 4 Jan 2023
 02:58:30 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_micfil: Correct the number of steps on SX controls
Date: Wed,  4 Jan 2023 10:57:54 +0800
Message-Id: <20230104025754.3019235-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0061.ausprd01.prod.outlook.com
 (2603:10c6:10:2::25) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:5b::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dffc2ee-378e-4cfd-b6b6-08daedff8e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	M500dH7W0DTSwtskjXztaC4hOUvORg+q/ng9OE/7EZTvpu5bhI1Ei/pbUkna6/zV3NtqcgzSpfpFgkxf5W5lIRLh/beIFxlpeZtywfTAf2N9YxYFpZPi7ulqL6nuoe/fjgzFZNsFtQNmvb/ZEzm+QWIDbXBaxRCUnfijpWrcAdO1hAmnZlK70QO+w+TuOpkJuCw3TStY9Iua1tK84vBjDSRLxDVoQF2rES9VE/QUoKc1WfAU5B0vko0TNyj23klmWWdkDuHGv+gvcyEgiXxvILwknn5QuuTN2ZHRhYmmMFZQVDVnhqzo/zd0gMYF7YgnNqsBa2sRDAJsHR4eAKgcNP2tPfu8I+eX5UMUOpsjju8wsWdTl7J3hjcCWZOd9x08i2V+MEf2TLduQqK7n27inot/Tf0rEXi/tAUdq/uU0ScAv95pe89ZZR9WNrJANup3lYVpahrESW/UbZo7Pif1F1rhU/1B94PS62SRAmrN9R0rFiNe6Ot3W0b+6GA253gFl04j6mjKBGXhT7cJJPOqEMU/6fRcaTwuhKVNxFRyp2lVfApj4BJrwqpL4aSSxN0Z9PXvKm7drHqDSf5k7K8j2z94LIPuJAwIvuwVXQ6u9Fw3y3ggYSXcNx2PY2ETuyh9PImlc/usK4tzFbEI81GN6xbqiWBu37DWkWFSYBNZK+rw54HhVaqOr3Js8IizdA356RIqwn2HAe6sCClUYSN2yw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4211.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(36756003)(2906002)(8936002)(921005)(38100700002)(38350700002)(5660300002)(44832011)(41300700001)(7416002)(83380400001)(86362001)(6486002)(52116002)(66946007)(6506007)(6666004)(66476007)(8676002)(316002)(66556008)(4326008)(186003)(1076003)(478600001)(2616005)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mi64PLMtPlNjyvRFjkQ5JUdKc8Q3CCfX80s2KhTcqf1HqQhspHTCAnyAd8L2?=
 =?us-ascii?Q?VDjvZQcz6FanlUy6VjsOfrArwckgyd43/8gsAGZmg83o5fCKLD6ZfqTrtZZd?=
 =?us-ascii?Q?JQs6wZX/87y1lO7A7vuki0QevGrg/GND2Rzs/KHvjPuRngR/nQehmprnyMPx?=
 =?us-ascii?Q?uYMy8FRZr564UAf/eY0ER6AiFHcQB8raRI1dMB0ChHz41u0mdXeZfdTxvqmI?=
 =?us-ascii?Q?IUjJp05i6ZIh2MJD+6GkZDGesAUrH1xtsCLsmFO4/LunCTrC0IurfRcW2RSY?=
 =?us-ascii?Q?Kr1VAGsJIm/rI8nFcC/9ndUxbLVhbqSKe+hn+mneX+V/BhIN+jEjKjo11CYz?=
 =?us-ascii?Q?9tzAXc0qy4XgG0Asv430flKU5InVeOfF6eicKVBaC7m4YDssFGIEupQE4pup?=
 =?us-ascii?Q?xu8RrVg81Ej7NCUyZh6u6e5PnIifyC3dwHMYbyFOU6rjvift573vQItgFh1o?=
 =?us-ascii?Q?EyY0h0MhOdOLygmrCCqsIhe7USd/IpoFINTsJy2H5P/hMllfVgK1FVj/Swuf?=
 =?us-ascii?Q?yGBykCAmgmnje3rcIqAVPSwYghzyfbcnLduhCKiAU9Z0kkRKeO5Vkc+dpMWI?=
 =?us-ascii?Q?58HOZJarzz5t2KPacNXo4bgbb6egf2p9yY48LMNSgXZ70b9E5CWkoxEz0PF7?=
 =?us-ascii?Q?pg58ocPkkZvCVTw5F4BHy0h77qowzu5P9M4JVleEYsKplOodgBEcXcjjxU0b?=
 =?us-ascii?Q?E94eZBUhpxsJsXN8WWfUgU5MdWv2EOe/daQqFD5uorxUuWH8l4MRHJFhEBGV?=
 =?us-ascii?Q?HRw4RDirXSKMGCwVuJHrALu4boATRt3sRayWDj9RF4da13DGqgaTjDwGHWjZ?=
 =?us-ascii?Q?2qteFdEnXJ6kKI3bri1D/wAVC/JxnuW0dRh6eA6looYfTfmqCgtDf7ooquOr?=
 =?us-ascii?Q?38MfudjUlThKQwdogtSHkjoIMEZgau7T5tnNEqRKs9/Nq0mN2GtNZu6cRKKF?=
 =?us-ascii?Q?GTv4OKCkrz60XHx51PIaDkLttwaqEd4vS2rcg5SZXjXy1QQX+b8lwYm5rdRy?=
 =?us-ascii?Q?ffKwrsDVs5OUnMp9AbW5FA6/AA/DnmHo0qIsWhaUyBGxB9xbZH6pfSPIL3ZJ?=
 =?us-ascii?Q?muyVt8rQORRiNhtPLOaT6/u5fOlYSMHLn20VWuG+Bb8oPIbj4jcogEHnb/18?=
 =?us-ascii?Q?lEzvdmFfwEduuNrgduLx2Tr0872b2DBUooyHovK2OeVoK6pEc1II71XZfVDX?=
 =?us-ascii?Q?N4xCNTd5YZHyBu3+JKGUPpKb6eVNjfxdnbCIgyu/VBpbWaZ/zAM+XFXcOR+I?=
 =?us-ascii?Q?i1a6oakt1f3pZMLdAzm76dG6MCq855YnioV2m22PlaXYC1/oWwVKaPTmMOAo?=
 =?us-ascii?Q?JZHQHYyn9pgxmaUwfO7f1jASxIda+L046YiQiLaTzV14DrH5eDWAoujvC+h8?=
 =?us-ascii?Q?mVCPo90uwWK289/0RrFPo9IhPgqex6T171UdbGfO9dMQvDB1eVCQ6ZGOn64W?=
 =?us-ascii?Q?XJ9bfhz07DYT8K+0KwxrEg6natbduWvJ3c4Vl7JwoMl+0pvLAlIOR4MC9YId?=
 =?us-ascii?Q?rYdATv7qDSlvF5kh4dXfBk0fc85CW+z8Q3YNeimghwI84D5UmhIpjJ/z0JK4?=
 =?us-ascii?Q?cpio7KGmsETXrJwHXdQPKWBANkxrPlmn4v68/bt0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dffc2ee-378e-4cfd-b6b6-08daedff8e2a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4211.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 02:58:30.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dfj8v4TNCTy2iU+8YdpdfGMCCgUU3REiw79yH+yvXYlwsWI2KIOqZXw8+ud2Ez787mq/k43ridwI887Jrx0cZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387
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

The parameter "max" of SOC_SINGLE_SX_TLV() means the number of steps
rather than maximum value. This patch corrects the minimum value to -8
and the number of steps to 15.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index d7e6fc996166..d4d3bc7ca87c 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -325,21 +325,21 @@ static int hwvad_detected(struct snd_kcontrol *kcontrol,
 
 static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(0), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(1), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(2), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(3), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(4), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(5), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(6), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(7), 0x8, 0xF, gain_tlv),
 	SOC_ENUM_EXT("MICFIL Quality Select",
 		     fsl_micfil_quality_enum,
 		     micfil_quality_get, micfil_quality_set),
-- 
2.25.1

