Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD3269873
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 23:58:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br0bt3jfJzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 07:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.5.44;
 helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=mW+e8jvd;
 dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50044.outbound.protection.outlook.com [40.107.5.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqtXN1DtHzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 03:24:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEQSf3sNVh5A2pPUhx9ZxpM6o1JNZV1mbJ2rUi6yL6IyaqRDBn2kWClApQpBfcnkaO8my6EIZEVpYQPyCXLn82Y3JXx0ejla6X/AVBj8oB2mHKTGxsf9uBjKetT+Ko3O9HWQ8cy3daSykrojuQZOaS8xszRrPand7ErumxavczFD6dLEO4ISMcb5A39uciiWWOu4WB6IQEP7CZnK9rfhJll03neT9W1hrYJMHvueTmDOEpD0luJ74K3eqfD8Xu1Wk2lCQj5v9cbln72gl4VAy9enJpSimI6OWB6Y2JQLSBwUh6f8HBbmKh8beFPiwMxhUuG1F5OFhbbrFcH/fJFDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sjimxta+ky+5X6bGQ4v6pfTjXQHA5ZQ/D9uhRa9bo9w=;
 b=nP8HKi6v3TFUNBhcqS4AOlRwIbG9lvjr5404EezZNd8lrHM/aD+G8dZDLtaIGiWM8En4SPx9mUetF+nD0D/WTjsPukSyl7edtwoPpnvX/tvfzyYOCKjVt/ieDkFFkKLS0WpblzSnlMWjsL0p7oT8uOdMgktonK0YHZg+AHjs7ngHtVok987TGGTAJSlKa2TLWL1FFfTM1n2V5x2Z3jBO1QQMXT7nQJC/ySha8RXpL/GwC479gx+cKhAKlJNDtav8uV7fA+wUXN4ZKn2eX/gqeZB+aiWp7jYCNSltSGAq/e4vK0NsCNSTQCublg9pwFHPAVUUEOrCX46fIyD4c+/ivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sjimxta+ky+5X6bGQ4v6pfTjXQHA5ZQ/D9uhRa9bo9w=;
 b=mW+e8jvdN3QrVpQFVIQCiWWe+ZmOWKDokSL59vfoKBtR0B5OnJlS+RvSdaA5ohgf/TE9OKQ6oZogjsxKu4wXT7Mb39IrS+GaMez8XvX9GtFKaWhaFaHoci/sooFxTiZyT51tiw8jGVFq+fzzDQB8laMLRaoaOPQZLy8N//j6Ffw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB6047.eurprd04.prod.outlook.com
 (2603:10a6:803:fb::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 17:24:41 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 17:24:41 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_audmix: make clock and output src write only
Date: Mon, 14 Sep 2020 20:24:34 +0300
Message-Id: <1600104274-13110-1-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::24) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3370.19 via Frontend
 Transport; Mon, 14 Sep 2020 17:24:40 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea276ba8-48ee-4204-de84-08d858d31084
X-MS-TrafficTypeDiagnostic: VI1PR04MB6047:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6047F723D7F357C946BB7EF9D3230@VI1PR04MB6047.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nD/3hDgAqby1z4DChfzfbLMIlmziMhJv6L7NXPmZunXuu9ns2QNqcRApdY8mnpi3Vi159hseZ2t1fk8wzHCzGOQ5UcJei9nfQnZGV67JNsW67sslur0UL2A29bqxMW0rjl7ZVKVCjdLklYrjk4wNVZijZ37YAYoOGsSnU1vkMxBhTbWGad2oFlyCtC+pQI/9LnW8ZYC6ert1R/lvcM38HrLbpgtzQfloSuCXPs8hfrlOcb05A4fTr453BZD5b7YEU2upWO2jGIgrIBUY88esSelG0FbVLCBkCK/9VdEl/PRxtRFXa6jsfd4H/2BXH4+nXIFQZw0lx/X00zA412ZMsBQlRSqHKnN24XDDLlSvhHF9I/J3AeXppWYbyyatqRWq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(4326008)(5660300002)(83380400001)(7416002)(16526019)(8676002)(8936002)(6486002)(2906002)(86362001)(2616005)(956004)(6506007)(6666004)(6512007)(316002)(66946007)(110136005)(186003)(26005)(66556008)(52116002)(54906003)(478600001)(66476007)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Wt9nM+NNaxgeNhlrn4lqd4pDni5UgvOBogBGUyolXnyFYRFW6cdvrO9IkTddavKBWTW2tBtr+Zon9V0XIUZ2uWbbdbamDhC4+x1/eMbs7PacONCrWrD1uW2GcfJHAr0kxWCqtfx8Xs1ZMv+bOBmd6510Q7C14qj0SYOYEU0AsfXRoughCVbGlrz5PkLR6sPFBPdevNaUnQdo77a5aXlU5wNt09H4hlALSKbkqtbIXi+dzyE7DedlyZyLIgPuKKxwALoOTJ+W9ZYWIqBPzUpHkApRVJ2XhlvxzK7+iMTgQvC9agyO613h5t05FYcBa28Bnyuo8H7ewiSdyOl4BD+kIKMN+lS1o7RnixYnGAS4poqqYQXp2/6TJVCCpXWHU/jMpXxi5M9pKaIuDWIgW9CpW+r7tUEv65VTj2aGocu2wzBJTxrKJ5zdQJ/s51PnDIfy0qA+OMBYS0sAyy9klgvuXm43ox8DybqBZI+WtLpjEokBQTmc4c1M9EE+TQLZAuzZin+8kQz/QSJJufQlizQk3zguh9nvJj4KLoYC3ekGvoYlGH9CorSvSahhlPSIzwowuIMODTKtieYPC+Q+SqR/rA80KpCG4CpkQJOQxzxwqu+l+QEIEIYMkE3hTieWktOVK0Me9b+RGUt/MKisda8gWA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea276ba8-48ee-4204-de84-08d858d31084
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 17:24:41.4665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: napGHQGam2D8PTh0PEzafiI1NGZo0hcauqp7+usF1CenJ3sTJn/4SaCjNpVNLGD4x55Yk7slby08SVYPFsyMJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6047
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:56:52 +1000
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
Cc: Viorel Suman <viorel.suman@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

"alsactl -f state.conf store/restore" sequence fails because setting
"mixing clock source" and "output source" requires active TDM clock
being started for configuration propagation. Make these two controls
write only so that their values are not stored at "alsactl store".

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index a447baf..7ad5925 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -199,10 +199,18 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol *kcontrol,
 
 static const struct snd_kcontrol_new fsl_audmix_snd_controls[] = {
 	/* FSL_AUDMIX_CTR controls */
-	SOC_ENUM_EXT("Mixing Clock Source", fsl_audmix_enum[0],
-		     snd_soc_get_enum_double, fsl_audmix_put_mix_clk_src),
-	SOC_ENUM_EXT("Output Source", fsl_audmix_enum[1],
-		     snd_soc_get_enum_double, fsl_audmix_put_out_src),
+	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Mixing Clock Source",
+		.info = snd_soc_info_enum_double,
+		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
+		.put = fsl_audmix_put_mix_clk_src,
+		.private_value = (unsigned long)&fsl_audmix_enum[0] },
+	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Output Source",
+		.info = snd_soc_info_enum_double,
+		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
+		.put = fsl_audmix_put_out_src,
+		.private_value = (unsigned long)&fsl_audmix_enum[1] },
 	SOC_ENUM("Output Width", fsl_audmix_enum[2]),
 	SOC_ENUM("Frame Rate Diff Error", fsl_audmix_enum[3]),
 	SOC_ENUM("Clock Freq Diff Error", fsl_audmix_enum[4]),
-- 
2.7.4

