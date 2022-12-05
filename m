Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F7642DF7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:53:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqPQ6S85z3bWl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:53:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=XIb65QYp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::814; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=XIb65QYp;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20814.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::814])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQnjj1x94z3bXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 02:37:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVFuG8KEV06Q9/bUKNS94klVApzADe8K2amMONTpCNpCEKlpHBoHWO8ufYHoiiUw4iugyXFYztUUApnnkqJkfdx9o02X4enaaGGg4ebmM5kZ7rSz8lB0vqv5o9/HcBv/ku3JmplzlSpSr9t1DVesPdIkwOnMsPfeMH4fKBzivJEkbX6Bc88Ip8920xCd9NwrstUCl7zp7z67l1k+3gec8FdnSl3dckU5xGrdk4YGvcN0s1zBVb8VU0rbMPzTrk4cBIeS/7ajwkvRJ0bKvY88wPITxQJiAm1Bf40jhhjW9yXbp2fzJZ1J69WKTsZyN3GsbUF9Vh3B1wYil4MQUvWK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef9m7v0KqeWEipkEBUhacHcNHd3dIeyAM4W2j/cgC88=;
 b=BO+VBkEHU4K/JhS1QBgqQ+vKgeINVwd//PlsVt2pSd0rMNxDeH44NbuMmHD3dA6ql5feyDNeDTxks9fq6eSu6qPgWymUoYKS9GHaPm9T6/1x9qYXkrSBesUvg4yCXPr/Hb6VTIg1RhhVnhBnFR6A9w5umzM972s1Z0mutQaoXL5OYPAoWwz12WOGmyhaCMuPGxYEDcjIkFhgTDMh8R7VnTu4ho58WVPafeWuWTFdpTVX1GH3g47UcAUoGvjwy+Mu61wowC6c5365GLxvmfifLKPFpJpss7jVzf1NEL2sSUc5wy0Iz92Edbe9vnrAFmhjgO7ZUWnlFCyXBCmquIddEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef9m7v0KqeWEipkEBUhacHcNHd3dIeyAM4W2j/cgC88=;
 b=XIb65QYpPUxtuHrWdAaTVsmisxE7ZK66EtaL7DFQu7WQYYx12FCL8PlustnwXQXvJDC8oAl/vhcHRnBxbX+luFKcUTh6SwokpWwttmfCMHL7XFmX93ck/u3BFf7OL26gPp2qoijVPmVUczzUEzGojxH00DAv1p2KpXAjTEt0PDHhYZm6JAjmaRJH1IwA71owid2EHu+P+cAs8FgdQsxxzbag/l41abXPke8dhEwjEeTMGxDI4ypM2BfUUhbyBX65/nBvPm0y1B3hy4E6sLUosuLr4JSuNLBeWR2jaoeXh3trnLs0QI0fckXLBhYMBI32wFwAsuDIXzv/ePfIyWMSvw==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1787.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 15:37:19 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:37:19 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 5/6] ac97: make remove callback of ac97 driver void returned
Date: Mon,  5 Dec 2022 23:36:43 +0800
Message-ID:  <TYCP286MB2323207367F2D39D0D725828CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205153644.60909-1-set_pte_at@outlook.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [eT6UZtVbikemNKsMQYsxpGdTloi1/Wuv]
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20221205153644.60909-6-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: f06a4cf5-cbb3-4a5a-a430-08dad6d69804
X-MS-Exchange-SLBlob-MailProps: 	/OoUGmN/RpVKD6y7RJd2fRTadJ6Pq1ot2iys40AI0qYlu8Rnx0ofoD/I1pH32T+1L2pz3NVWO8fqqVhxKi6WLWu7Gs1R5ep4Fa4CkDLgQtUQyojJERaA+Z7VKh0ucvIaG2AjU2H+tSfil3cpIYJbFulYrzkUNmBaq8jaE0fgqPPgL9YwRyoP3T59IQ3p78fVfgbOVturEdduTvl5Ri4a7ZmQ7DQnt41p5cjJwyx1/sgrEYTFG+gIdXr39UXlv7+oe4NSDeC9inv5fWM+8mCvUHAvJ+Y4Pg83Q9q0KGDdI93n3JP7KSVBcGKipBzvotUCFMHX9NVrjzZMBAsN2VtqxqbF3zJ4akpts+Se6kob278WfeogJYpVsVllGF12eGQj2nzF5ejV+Xc6rmuedy5zgPsbLBzhRP/gsVEaNVpoch9Xjyw2bmTHDrQx+D9JXbHwRROpUjI56/IUlg63HXguM8c+/gWONMvV4Gi9tzEXdVAA9/s8aAVXvQYEYDp0RV8SK1FzdLiNdVSL0A6fairCJ+LhWJ2uID5sKrmtho9EjTLgeWZ10lGfHpAzGaOpyXiuLQPOv+9OQ9bYXoyHmbcYLT0SCRAR7r1qkhi13sWtrdizljs5bL6ZFWIzKFnZ7vN1st2AEGW6++H0iSdQ4IdcsMgDlRzj2wWeyV5Qsz1os92D/FpXhYBPtiq5o6xLsP1KeOQtAquZK0jRzMfvUaAjEvboyc82I3OccWaoW7HslQcNPnZGZQtZThTkmw9mjfEX
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LLM0c2GdH9795iyGzY8p4Y7Z1S89NsFMRFuBznQNFarpu8WG34BF/uAFjXow4c0NluqYVo1AyVT/2gdDnzKKNtDYMGKl031XHR0CpetAONYmC/TJ8qhGamE5OZ7fyFJuXXBmA7UFVwQyPa3u8wBAVFR6w4dFqsHLcbgPkjD23Ejo99ZfB8/MdaZ9zKjZdUWAYVd5O0rmuV5xEuDGqFvkHk65EBd3+wgI2mgB9hf5sV550ofIGsw3KTgd6ZVJhkblZ8QZG4o/eOXoD6PM3O5wSsfV3bLpCk47a2GxtbxuUWUaiKrFw65P/8OH+f2uEZhi5UDiTaCrskFAUQ5p5eSjiOZFuWuKP6Y5z9aXB7L4IN1vT1rev0QRcIOHWJMdMzI/yAXTUrSpNxZY5iXkMDLmbvn4Yl2ejdkaSRgBIkjSB4Co8Kssn4P1WOCnCeSmiW9nrpeWZZ+mJWtUGyEwnK3ZmZLtzDjJ5BvOn6vf8fC4ZdLd+C+mQxhXRicatj7697tlRwtLa/OfN01dS+xewf719YqZxSboJj8LJmI9mPgak067AdfHPKWR9BUOhTv61i84L/68i6US9Bibb1TCjdexP8wGoJ6S22MPP+bOKgx169di72AdjcUUBTCIm9WM4+i+pnk7KSn77P22Xs0ffhKeJA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?lGl4IuJDRspmKFHRAn8iLOG31lJGKLL4YbiN7fKudj2wU6GXpZnw9jttp1jM?=
 =?us-ascii?Q?P/tpWgYq7EGMmyIhgfGEMzs1D4tHkzFt6dOF+pvZ0saQJLJFBV0e5zTOxtRR?=
 =?us-ascii?Q?fj51okDUX1Z8wbYZSM0Za0GQu2qa6Yl3oNGHUwdgZxw/MaFpPpA6b2OiKc8H?=
 =?us-ascii?Q?sqddYY6aEFDuKHk/0sN9w3cMUWUyXk+rSCos/W4eXdCKSytjmEMHpmyXnYL5?=
 =?us-ascii?Q?ejDsvhvd5p6XnRgi9LtVRMx1UdwqDE1g6PUhJi6E2vossfVgTEh/5VpTzb0s?=
 =?us-ascii?Q?MYF2PHhJWl906/umGfPBdMIegsdoG8mnkNhJW9h9cfUpYOa9kUDHYujLqS6g?=
 =?us-ascii?Q?dyRJK7sN7KISqCdkjiISjt70xPLEIASW24VAmsv1aIXfo5P20R/04co7MM7G?=
 =?us-ascii?Q?QzrjcNl1I7PxNvsT0iYSf9eKv4rozBQP+3RoMvKnwbalZFDcBqsOdMiCodBe?=
 =?us-ascii?Q?ADNjnQxq/m6ducojQiqLRERQFf7EY2qQUFh+XMg5Fwy2l7N8SmFVV0PztKXK?=
 =?us-ascii?Q?BhzW5iP3SfYudi+mY8hSz1W2hGbPvmyw8ntAXXaZo42A2tuRf1FET0OvCFnn?=
 =?us-ascii?Q?CJ6C2O+SchlgadyGtgxiEqdf4pMcMaTIIUOn6NF70/prylaJ2CHUYaTVFMp9?=
 =?us-ascii?Q?xVeP/ouWdE+nw33ZH9580na3GbAtw2x/HfxJLVBqggOYnNqHGPG5CSFh9G4o?=
 =?us-ascii?Q?QCAwl0K/GrMKvyp/nr3owjybNAwVMhMFnUb5z64UIXikXROd6WB8Ggz1TABs?=
 =?us-ascii?Q?gynPhRFgDX+zWmwFc5giR1wCXFOz4cXwuxJcuo9090aljaYunIocLplvjIBW?=
 =?us-ascii?Q?JVzLNxlVODP+QHTa6Oo6GjBp3DYccsIR7LV1M/btNpln2q9W1Ih9w+f3osyA?=
 =?us-ascii?Q?0nVSDpZVatbXHxxO1aYSj936yX0Hp6esKHGlYIXvQInHFI91yKYGwZdD+vTt?=
 =?us-ascii?Q?bdMp9z8xJnOgeKr/YGHGio7MFABNwQjIx/iNg5Wpzkxh9OsGh0TpJsyGwlLK?=
 =?us-ascii?Q?Q7HQbwuq60i8D7E9BcgwPkvUnvAAF9z7EfoA4jgpiJzN7gAXRTnXe2DtwJPC?=
 =?us-ascii?Q?pWTyu+0REV2b6YQnvuQSb8Lebgcz8YYGJVDe8GmRglN62qZJL5ufXuS423k4?=
 =?us-ascii?Q?kOdmd0uAL1zlY8CXOgNeMCYALRL4HQYprhSHr/J5ikG/PF5JpJm6aceuAu40?=
 =?us-ascii?Q?NbKuzzVNAcz23wRQioK+Lc/Xf16hyUFZyHs8QZCrJvahN6dsilHOCyaP4YBh?=
 =?us-ascii?Q?KLZ6665BFkc/Sn7pbPZ+GyjRnVRlckDiZ9p1hvh06g=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06a4cf5-cbb3-4a5a-a430-08dad6d69804
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:19.0632
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

This change is for ac97 bus based drivers.

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/mfd/wm97xx-core.c  | 4 +---
 include/sound/ac97/codec.h | 6 +++---
 sound/ac97/bus.c           | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
index 9a2331eb1bfa..663acbb1854c 100644
--- a/drivers/mfd/wm97xx-core.c
+++ b/drivers/mfd/wm97xx-core.c
@@ -319,13 +319,11 @@ static int wm97xx_ac97_probe(struct ac97_codec_device *adev)
 	return ret;
 }
 
-static int wm97xx_ac97_remove(struct ac97_codec_device *adev)
+static void wm97xx_ac97_remove(struct ac97_codec_device *adev)
 {
 	struct wm97xx_priv *wm97xx = ac97_get_drvdata(adev);
 
 	snd_ac97_compat_release(wm97xx->ac97);
-
-	return 0;
 }
 
 static const struct ac97_id wm97xx_ac97_ids[] = {
diff --git a/include/sound/ac97/codec.h b/include/sound/ac97/codec.h
index 9792d25fa369..a26e9e0082f6 100644
--- a/include/sound/ac97/codec.h
+++ b/include/sound/ac97/codec.h
@@ -62,9 +62,9 @@ struct ac97_codec_device {
  */
 struct ac97_codec_driver {
 	struct device_driver	driver;
-	int			(*probe)(struct ac97_codec_device *);
-	int			(*remove)(struct ac97_codec_device *);
-	void			(*shutdown)(struct ac97_codec_device *);
+	int			(*probe)(struct ac97_codec_device *dev);
+	void			(*remove)(struct ac97_codec_device *dev);
+	void			(*shutdown)(struct ac97_codec_device *dev);
 	const struct ac97_id	*id_table;
 };
 
diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 045330883a96..6067c04ce4c0 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -524,10 +524,9 @@ static void ac97_bus_remove(struct device *dev)
 	if (ret < 0)
 		return;
 
-	ret = adrv->remove(adev);
+	adrv->remove(adev);
 	pm_runtime_put_noidle(dev);
-	if (ret == 0)
-		ac97_put_disable_clk(adev);
+	ac97_put_disable_clk(adev);
 
 	pm_runtime_disable(dev);
 }
-- 
2.25.1

