Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 768FD642DF8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:54:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqQV2cg1z3fFZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:54:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=goRXTvDY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::814; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=goRXTvDY;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20814.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::814])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQnjj4dqnz3bXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 02:37:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4qbe3q5GUm3+djFxGLY0FHhc1fl94A/l/I18KWxQS6c5a7kO2tpTyGpSuie1zbjsCQNn9dbs9uVCDgPdyDRtrHBT48xOFmFULzB1Qc9MfzUMJkxMp7o+Lqz3/LHrrkp7lymZSVecOjeMEHb98xgQBYeeGsqDpECIFDY92iLZi5ypPKyF7w0DZIOrwWhAest8gN6Xf5p7fK7MSNJVAMT2nXGsBpQricxVYTvq4V7zt3II+puSDAHPigVsDKWQfJlNr3SCWIKUw3QeNVoNC5pJaBhC7Un6kKmWhw1pueqR2djj4K6NNsOud6KyMjwv5Q/ZCpDGqYNZqAqmtYcRY2zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8XYQmGsFxifbE4krxLLsTBSxb5z+JZd35HhshTCv/A=;
 b=PVbUPuKlXpU8REE3ZpCaUjuZ3sBGMksG2vWr0nZGL5vng74+f1al3/NJnthVtJQH4ErDvVCcCFdulvDhhvtIzYqyokZlyOJPJT6C8l4NNiXs+7vhqjLRLAl1HDCzPMS+vlJMs6sU4+2/or7kU48KLVJrEEOxN4LVvE8pJyeWjlIq3boBxodptcvcHM2xw/6/XGVRaNnCilHUUSDhF88k6xR6PdX+CLixqd4syZu47HCz7cAKGexnIUqV+rcHGpvd/XHt4CuLT5xc84+m4NqtbvHacQhb5zXSwKgPSPWChHS//jX5EbTPQEiQXi7cJUjka0CPd5zwH53chDLTeNB0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8XYQmGsFxifbE4krxLLsTBSxb5z+JZd35HhshTCv/A=;
 b=goRXTvDYD25aH8m7HwC2u7COsS9oiRP7W8ZY6/pyNbXG1qxHyqFZQwXHuW9vCqxYezW91VzZ3LjTmPMOxBsD7Ojn18A0wfTrpiETCol9gT+xBDNiC/lWBeklU50P4qKYWXA8wjFpvQ0eCY9agiB/mr6uTf6dJ9h6y8TeEKHwmbe7ZfB3Z9lia5TSzgICj/PX9WXukyPMrabJs+2zVk1uCfav3TIr2k/yuKa7Y6Y+ERPaECEWYU8LIRnXz09J0f0c2JRMKMy6edQv71wUvf2am/5gh+OgUCaqS/ynTQNr2tvWZugwLZLjAbi8oDCkGoy9lXof5+JzIbDEIULQhux2Wg==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1787.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 15:37:22 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:37:22 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 6/6] soundbus: make remove callback of soundbus driver void returned
Date: Mon,  5 Dec 2022 23:36:44 +0800
Message-ID:  <TYCP286MB2323BBFCE929111043E60D3BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205153644.60909-1-set_pte_at@outlook.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [WWyl4X8Xy2TdiUTL3/a5BJJAkOeQUgge]
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20221205153644.60909-7-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: 54577305-65dd-4f2f-4d1a-08dad6d69a41
X-MS-Exchange-SLBlob-MailProps: 	/OoUGmN/RpVKD6y7RJd2fRTadJ6Pq1ot8vlKKmA/hNHf/9uXSEfxNcy1cE9dsFBTSU4rE2OHL/YSf/94pMqv/IC1U95CqFfOvuXoXCzOFsq1S8gJM/GNIgTLxNY8CXbn/hAfm9S8eI+3vaesaIP+Rv2/iB3t3j786KjU5NDoaNXNpP2SfqwiA0VTUzZS9wqefozxmQa1Qfnx/DdA/NqHMzcmb4WkUbWC9wk5Un/UBg4FPZE0RI1leoxhJbyN7vLubLcR9pyi54bq2f0Qx+1nngufqtBcAQWC/XEFeyFrm9j90ixn9rsoofeIhdDAU3WJ3GQ8aGvm2E2lkO37uImtIraQ+SF9JEr45aybi5nuw6je2FgKr0F1u1G5B66PNid6IknTKzvgmHpynLEfl8JgMwOPFymajtHhhrHaDSkSjZSlmgZaI8i4yWBN+5ZNYSW6jlkD2+LtkfwY729x7PCuEDY2sY+b8E7bF/Pbahq5EQtQua8gutUhKL+8ScpGXqtTUvpC2RIm2SWzS3GwqcoPr16SkxnoxAq4cPCQd2/qToH496Br1VWVRnL2YH954QA8uY/qJED2TaQBDuB2WEzI1Gh4LAGBHuBZep9fMGcSvM/KNwkX68Yu4iW/+3gBQ3ItHzISBHDYno5UN09+MGuiOdDR+YAL2/0nFPqB0faWZ/TMrqM9JyEaPIn/UJvkkTxsMULetGzyGgXtsJieSeUYagPJYKaltdxKEYlUJWzsGBlpZv34x1Z4BVYAMdc+GL2U
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0zQ/1p94AxsYQNCIY71ncaAalqnIBL26GIUPx4Nx1LEit8C69gJyGYYfdv5wtBBt/5LkqF7FJ3/HcWJhztDzZQ2Q35BIYgTpl0iz8UnIgLW7OyfElPTusolx1OFrbX1kZjcd5R72BWVnuUdTQhFdQqx6vMUETus0B4h95CTTD4cH+s0bQ4GXl3RdC31Ak1X79Olq5kaKOoBAyooJVJi6ckZV5OC5YjguKt3qhfkpi7Mj50LgYoZx2gVHsz0kUDjQe6AGDaT+eAKXe2wvwfcmk5Vd9rnLS11EN+nFJ6X6lge+q0J3p5vdwNjAqgXc8Vs85E1oevZgHTyGrRIa7DOezgF8c1DaMxwtU3wBGoN0Sjm0FT3Yplzt1SHXnnT4KivFXSysvP71MkgBlY1AEyRx40lKSzI1A39XoRqRsis68LhqxbjdknJgEhpLnP3cpfaLlHcTlfZOTqI/ipvbjUUF8ZgR7cu7rFoyxkj7kSUgWLD+joX/U8N9xbsCrfwVAyWsDB7xfPHmgFuEqolRlfydckcbPtHbTI3/bl6WUqyNc/g/EFPHPoyoMlzv42bNBH+fFPbqgaz3H6DSj/+ViiUy9VPKRMdOMVybBrSWjYorefODeXQ+AiIUSS9Cln3Mf1CtZiPVSXmn4XQ3ADQz9KLoTw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Y9FBxjtsf/d3x6C+Cbl4Z7xezNuEyGWC64Z3rvpZ6h12emPWw6ZNgonBCu9j?=
 =?us-ascii?Q?e9hbNhkhGUR6M7gMFntho3lmT+tswhmZW7MuK4Y9iHwcrwikVYr3J/2liZcD?=
 =?us-ascii?Q?BdZuksVpnxij4ZAp2Y2O9V/b4/uuXPp1A1+6Pqj95AMqSO6wKqrTJh8uB0Si?=
 =?us-ascii?Q?LjzDvdXIawHHEAJdMXjPpJORT3pGEnI4YxdtkpRwV/1jXzA+W3oVEBD4tO2S?=
 =?us-ascii?Q?3Ov8wMr10c7FeJhB2E9PDqutd0P9OFwL7brgV1/G7aDSw9POMkACI05CRibc?=
 =?us-ascii?Q?s/YRMi0CQoq67VFzZJeJ/edxKBzbPkjP3RZuGopI8XkQZ5o5lYbIMoZG4Ojn?=
 =?us-ascii?Q?5uJFwfthlCJ1Re6aD3MN/l0m6PaAypeHLQKWwiu5onXx09mmIXOvcjKlEsrg?=
 =?us-ascii?Q?wbIAOvCHcuDOs/NT2OvefotDXZ2pibo+4u9p6arI0UB+S08g9nBOW+rV4YVm?=
 =?us-ascii?Q?Ed6gnoNfL6WDfJCHV3/5TsLAx0d1qbPwykL4KFX13KJZvny4jlUFDk2nLktm?=
 =?us-ascii?Q?HJdnoW77QH+PJxtzPHHADiJNgA4Wa2rNXHrXqaWmjwBrnyWp+/gnyXVBVrwW?=
 =?us-ascii?Q?bxtJwgCxoedb2kc+Y60R304N1GrKNXl8L7skGpf8stX4BLBmzJ4KcjPK0HSP?=
 =?us-ascii?Q?DQZ1ym2KWwhhN7rpWAOui849zmhu6q5EYd7IQo2aZl8SJkB24QRa/TAgfioV?=
 =?us-ascii?Q?gzR3imIJ56iuoD8gMP92WQMVDsvjHmuqFW78TfHl538TuajkgS/cHrNG1Exx?=
 =?us-ascii?Q?10YISMUN0pXgpwS+a92G5+J2cKNwixh6Sn8VQRIGU1dvPQuXO6QEDIcU9pnc?=
 =?us-ascii?Q?wiBpOagdQlA5M01X2pFGX8Nj/pgoZMpXCd8suT5+3kC6rBqNwWzdIfuuvbk4?=
 =?us-ascii?Q?VjRktKthPnjRzj64racXptvKaFtwzpj70v00xypt7i5VHTPO6rmI/Yu8L9yc?=
 =?us-ascii?Q?NP50av5UOZUxDNTxSJVD/UBWo6zwxthv9lWhrktxI+QmmeQJ/6Jaj/lT7aeo?=
 =?us-ascii?Q?h88b0EsOwUoppvWv9kr7bBm/Ls3OkePfn9BueMrX9pwi7QYAJUPZw09CGL9O?=
 =?us-ascii?Q?JTnqBz04wFUogMjBcCjHb1rRnQk57SpdeHwY3aX4sP67vDiHoubFPUp7dQ8d?=
 =?us-ascii?Q?2n7Lbod3N6gvzmJ+FF3hoQG+8RQWCJoIMdfTg63LviXSz0gBiEIeDmCYu2ZK?=
 =?us-ascii?Q?dnlA1vFw5Oxn07Xjd7LV+oXw/Knwqsw4uTgzFtUPw1SnAurDXyXOyzs/Irum?=
 =?us-ascii?Q?HIJHI50/Mb+LGZGpcseB9SNY7nW6fPpSlk/WGTKzAg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54577305-65dd-4f2f-4d1a-08dad6d69a41
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:22.8631
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

This change is for soundbus based drivers.

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 sound/aoa/fabrics/layout.c    | 3 +--
 sound/aoa/soundbus/soundbus.h | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index ec4ef18555bc..850dc8c53e9b 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -1094,7 +1094,7 @@ static int aoa_fabric_layout_probe(struct soundbus_dev *sdev)
 	return -ENODEV;
 }
 
-static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
+static void aoa_fabric_layout_remove(struct soundbus_dev *sdev)
 {
 	struct layout_dev *ldev = dev_get_drvdata(&sdev->ofdev.dev);
 	int i;
@@ -1123,7 +1123,6 @@ static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
 	kfree(ldev);
 	sdev->pcmid = -1;
 	sdev->pcmname = NULL;
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/sound/aoa/soundbus/soundbus.h b/sound/aoa/soundbus/soundbus.h
index 3a99c1f1a3ca..230dfa1ba270 100644
--- a/sound/aoa/soundbus/soundbus.h
+++ b/sound/aoa/soundbus/soundbus.h
@@ -184,10 +184,10 @@ struct soundbus_driver {
 
 	/* we don't implement any matching at all */
 
-	int	(*probe)(struct soundbus_dev* dev);
-	int	(*remove)(struct soundbus_dev* dev);
+	int	(*probe)(struct soundbus_dev *dev);
+	void	(*remove)(struct soundbus_dev *dev);
 
-	int	(*shutdown)(struct soundbus_dev* dev);
+	int	(*shutdown)(struct soundbus_dev *dev);
 
 	struct device_driver driver;
 };
-- 
2.25.1

