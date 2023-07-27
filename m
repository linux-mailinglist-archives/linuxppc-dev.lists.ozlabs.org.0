Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33E76443C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 05:18:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FLJ1rYMc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBGDr4Gw5z3cJR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:18:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FLJ1rYMc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::61c; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBGB34Mmhz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 13:15:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPh/UvLHvfZ/4m2dZKUsPWykvY/mPV/tfV/mz0YvWGWhdduMiB6yhGXwVUp/ViTZ0QcYIDVQRowPBJ2WSON9IkjHs1KoFDS69Sp0JP5TsBmTITxzvAQkNwPa5pDwkWz9KrwwM2e73/7on/ksUPbQDowqr2OpKkyQa0rD3ZTzJ5+MDIqQNXBnJ7lVtJ2M6AbeIpJ8VhU/FYTV9Pd/jAz2r38pRuVK6ha4jo8setlqwGsS0c1YVZZJKmNOQhotpIduwr4KeI3p8I6yZ5vc2ClNNYpMjpr+PTOzEjpD/QvpoFoPNP57kzMDrDom6Q1Ph6D6lIuiXxhFZlfflAD/Aa5+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8W2fRhJKUeHxwsuTEJ7fKxOuuZm3h+8SgzxirAYYaeE=;
 b=IjY/HODy8DSypzTbYGjCnFA9vr1ZNrIGs60C9/F4ru82CPhQmb5wozEqLyzprTqeEYlAL5G2u4s45dSe0q8jbsSAH+yed75AofOkrui9ALT6MwEEC0fNIyEBdkTeQq9WgpWyI8238arNM4TPvACyW5GmgkGBgHa7lN4Fagl/2mpn+qkEEr2wF507TbHlG1QYoCi09OfrX1Ov8h+k6Q4I5prllKhUDtUUNjyoL0VPyrb2A+J7V3pxB29axE3VNy/ok43zlNGM5Y9NUrj7PGCJCk25UC0g6fLMYEhvk7Xvki5zsbVLAC/mY77kYswVOCXqIbO2PVPDV9IQH2iA5Oie0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W2fRhJKUeHxwsuTEJ7fKxOuuZm3h+8SgzxirAYYaeE=;
 b=FLJ1rYMcWo7JFx4G1oLC4VGPa/2EJ74eODdEUk2s/vDwtJ971515QcrINN7toxoakqB583rBLwa6YW1T3TmsosIt52pGto+HFnZUvvfB80Rg0ILEUh/kpZfJFcltOSsPsy2SPYYMYS8gcmMo2oo0kMWJMTWN6lw/cC8/1sinCS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS4PR04MB9411.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 03:15:38 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:15:38 +0000
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
Subject: [PATCH 2/3] ASoC: fsl_micfil: Add fsl_micfil_check_version function
Date: Thu, 27 Jul 2023 11:14:58 +0800
Message-Id: <20230727031459.571559-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727031459.571559-1-chancel.liu@nxp.com>
References: <20230727031459.571559-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS4PR04MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d590b6c-de7f-4742-1abe-08db8e4fc06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	P6tUzRktDYl2YX2j35czfnEWCAP0P/y4byhdwKOqgu0LGVnKXLWMzvad2xE62jQpMqtd5shdLmjq7bt2o9RKhlJSTabTV5Gl2Ld+3d68wQopFsh/6O26rWX9Yz631XN+5IYITFnth3nvIyyrZGRl+HSaYlfa6zlsuOnoZu4AYzR32WIU4NdcANZOClM6wgZRTSM+ulktSir8z2f/kKVpZsTnnIO3Xm1jiM4AO5Dn7gQAihwQ44DK5gPgFDMxNnnKNz8pIOsyHE49ygHg02hb7BuXjDB33X4xTDiGY7fZDw6GUcwOlbQJNH4mxV9I64py7oasL3hK05YuTgbqE9s2OjLj7F5sILr/L6bcjutF/s3H+WFvTb5UjKdp14R+5kOj8nGcwvyCt6/1flkev2d3k7LWa6O0LEBZ6TO2S/+BVUlHA3+dbczr2pYjYWxwwXbnXclDJW/tOzThEnR0E2/jYUO7V3U2Ei+YLgICswRvCzs0zaokTrPAkJMATStBAVTXQoKPjpCZjcC0PlkG3RG9Pu5M1bkJSQaDSClB0G/GEgyFMt4hlcwZIjtxI9sHFU8BFKVwtRwBUSq5eb4WAAn11T2o3ildONrSoGSQwxybvGdmvEJ575So4wnEDOnCZgA7uiGwztR0ZIIHDc6qACuDJQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(36756003)(86362001)(921005)(52116002)(2906002)(478600001)(38100700002)(38350700002)(186003)(26005)(1076003)(2616005)(6506007)(41300700001)(7416002)(44832011)(8676002)(6666004)(6512007)(5660300002)(6486002)(66556008)(66946007)(83380400001)(66476007)(4326008)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tGA0IZHwuS7L2TxZqggeMqJOPtb8OsuWW8BUJe1lkHxqghjMBSsS9+Y2vDnA?=
 =?us-ascii?Q?vOR2hqNPwZUczKnOEaWa1BxbU6aA9G4uGgj0lWPUWdMgOGsR7Niihk3OrkOU?=
 =?us-ascii?Q?/nH4WYy0SqB/D2tzyCToTFR3nOVsOBY/9q4aEnT1SvE69yhM1QDdobwP+WWs?=
 =?us-ascii?Q?GwpA+QHdYikNvsV533szhcpDSni9wP5BOhz8Pt6xDqFjusEdK4oCgU/lAmIf?=
 =?us-ascii?Q?n6fe5JTzCR4L8NPwcFeN52AaSyCVC3HQ0oTnfw7BnPAzEM+Z/fzv/0SDsJjj?=
 =?us-ascii?Q?ofCSZvGIMbaqDmNc6y9TDj0/4fhyouEykDDWV5l689HEIZIeTY5+cRS/9rbp?=
 =?us-ascii?Q?C4hed/cFvs/WypuHEB78uMPhiXAFkk31t6Pt19zp/gdh5CjXB6z1kO46XeQA?=
 =?us-ascii?Q?wkSHKwpnQpZ+deLz0GwTA9ZnDhglZsdtlnxl6PLUI5tY6+W+212piuaCTr/s?=
 =?us-ascii?Q?eBuVmQM2uBBm0Ayi5xku8/T5We+84H67B9sBjZX+GtxgZcoz4w0jBozjGB83?=
 =?us-ascii?Q?8FSjNbwTBic+EnpabPOQtsG3+LOP1qrwlOQuyqtL5XUrYRiNGoNOcFiW9Lfp?=
 =?us-ascii?Q?KkM1ASKLI5KPBGQBtrLhdlAZ7/7gXrVuVoz70wOWh3B4mOv2mTYmqEm/JFkV?=
 =?us-ascii?Q?uAzhCBJkd2OsHJz0jdmrfLWyuZpAb4cGCiF9RpjRwYq/V5/7aZGLHTvHm6gF?=
 =?us-ascii?Q?+78WTIx4yinJM0OVqbNTvyZawRAH3l87e8KewxIKd5Ys9qE+cWp5UL1AFk7y?=
 =?us-ascii?Q?+GEhilhaFaLfhTqsJvhFwP7mOfiU9kAaBrNbNUSHW4I21FIGKrycrH2vxRgO?=
 =?us-ascii?Q?yMVsIZA1MHoWneP2Ljh79NrjBD2n6tFMQWX/MpvK+0Nj098WNtqKMNwXxPR+?=
 =?us-ascii?Q?FIfVfZGNkd36m9zVSGVKNEj6MuNYYGblRCcxItvlQapxtZfqXPtwFVXC5LvF?=
 =?us-ascii?Q?KDiqF0zQTB/0IRMw+sWSi7EUxEv9+CA4orHjv0yFww2Pc/TQf8od7NYQurvh?=
 =?us-ascii?Q?omhGWWKBEc6ZeUx/2q63SJSd3mkhd8O7ZHWUff+YdI6hXVL8+32jw+BkIOcf?=
 =?us-ascii?Q?UBIIzevt3j2VGquaFEHkEfK7VYbr3Q6g0IsPEYooS+fRrIlIWJtZ4T8uYGa7?=
 =?us-ascii?Q?gtbL+ialSrIYhtlDr2m8oyf0oPhx8pt8ujsgTjeeGUHD6ISuAtptCm3iJ0Wk?=
 =?us-ascii?Q?BVwrdbINgJNyoRvPXjeTdG5zn2FgbwH8Avjkk80c/ru4Wj8jGuv2EA2e8igK?=
 =?us-ascii?Q?KVUHB2IqyBCUBMMdz1HOKoTgBYjP/Z7aGTsEZBH3QozfXBMi8D0pmxtPnHaQ?=
 =?us-ascii?Q?a3/2zHABOeibxg8Smyo3VZDH2Ckyzkxz5HIYC6lHUCJDFNdSV+/WooylG1XE?=
 =?us-ascii?Q?lPuOCsKY1nqiQIR+5Y/cO1OiXLXsVm6iDeDT6FRh5P8jDFHwQwYhWP5NlF0a?=
 =?us-ascii?Q?hpYJ0mIVm1ZD4j+TVwZmtATK+5z0A7X76cI/LFNFDPaPFMfeE/XWoezZj6UY?=
 =?us-ascii?Q?9WrwFmbizWztHEr2FGgzqfaFSfWjMAPt7frRFT7toafa5N+in19EoBDej6Yb?=
 =?us-ascii?Q?ZOfKDcNZ/tje0BGSMN6Nuck3dQInrMtJdXw+20lg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d590b6c-de7f-4742-1abe-08db8e4fc06f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 03:15:38.6723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESkXOgNgv1l1Hxoa5ZX/pKLgjoVi/v9Ap6Lwq6aqPBqzaakE4VOqwzFwk6UDTUrNhSEBAL4O57Ab+pb6ReeHKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9411
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

fsl_micfil_check_version can help to parse the version info in VERID
and PARAM registers. Since the two registers are added only on i.MX93
platform, a member flag called check_version is introduced to soc data
structure which indicates need to check version.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 76 +++++++++++++++++++++++++++++++++++++-
 sound/soc/fsl/fsl_micfil.h | 36 ++++++++++++++++++
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index b15febf19c02..46eda6e8c4b6 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -56,6 +56,8 @@ struct fsl_micfil {
 	int vad_init_mode;
 	int vad_enabled;
 	int vad_detected;
+	struct fsl_micfil_verid verid;
+	struct fsl_micfil_param param;
 };
 
 struct fsl_micfil_soc_data {
@@ -64,6 +66,7 @@ struct fsl_micfil_soc_data {
 	unsigned int dataline;
 	bool imx;
 	bool use_edma;
+	bool check_version;
 	u64  formats;
 };
 
@@ -90,6 +93,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.dataline =  0xf,
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 	.use_edma = true,
+	.check_version = true,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
@@ -356,6 +360,49 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_SINGLE_BOOL_EXT("VAD Detected", 0, hwvad_detected, NULL),
 };
 
+static int fsl_micfil_check_version(struct device *dev)
+{
+	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	if (!micfil->soc->check_version)
+		return 0;
+
+	ret = regmap_read(micfil->regmap, REG_MICFIL_VERID, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "VERID: 0x%016X\n", val);
+
+	micfil->verid.version = val &
+		(MICFIL_VERID_MAJOR_MASK | MICFIL_VERID_MINOR_MASK);
+	micfil->verid.version >>= MICFIL_VERID_MINOR_SHIFT;
+	micfil->verid.feature = val & MICFIL_VERID_FEATURE_MASK;
+
+	ret = regmap_read(micfil->regmap, REG_MICFIL_PARAM, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "PARAM: 0x%016X\n", val);
+
+	micfil->param.hwvad_num = (val & MICFIL_PARAM_NUM_HWVAD_MASK) >>
+		MICFIL_PARAM_NUM_HWVAD_SHIFT;
+	micfil->param.hwvad_zcd = val & MICFIL_PARAM_HWVAD_ZCD;
+	micfil->param.hwvad_energy_mode = val & MICFIL_PARAM_HWVAD_ENERGY_MODE;
+	micfil->param.hwvad = val & MICFIL_PARAM_HWVAD;
+	micfil->param.dc_out_bypass = val & MICFIL_PARAM_DC_OUT_BYPASS;
+	micfil->param.dc_in_bypass = val & MICFIL_PARAM_DC_IN_BYPASS;
+	micfil->param.low_power = val & MICFIL_PARAM_LOW_POWER;
+	micfil->param.fil_out_width = val & MICFIL_PARAM_FIL_OUT_WIDTH;
+	micfil->param.fifo_ptrwid = (val & MICFIL_PARAM_FIFO_PTRWID_MASK) >>
+		MICFIL_PARAM_FIFO_PTRWID_SHIFT;
+	micfil->param.npair = (val & MICFIL_PARAM_NPAIR_MASK) >>
+		MICFIL_PARAM_NPAIR_SHIFT;
+
+	return 0;
+}
+
 /* The SRES is a self-negated bit which provides the CPU with the
  * capability to initialize the PDM Interface module through the
  * slave-bus interface. This bit always reads as zero, and this
@@ -1037,6 +1084,9 @@ static irqreturn_t hwvad_err_isr(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
+static int fsl_micfil_runtime_suspend(struct device *dev);
+static int fsl_micfil_runtime_resume(struct device *dev);
+
 static int fsl_micfil_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1156,6 +1206,25 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, micfil);
 
 	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = fsl_micfil_runtime_resume(&pdev->dev);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		goto err_pm_get_sync;
+
+	/* Get micfil version */
+	ret = fsl_micfil_check_version(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "Error reading MICFIL version: %d\n", ret);
+
+	ret = pm_runtime_put_sync(&pdev->dev);
+	if (ret < 0 && ret != -ENOSYS)
+		goto err_pm_get_sync;
+
 	regcache_cache_only(micfil->regmap, true);
 
 	/*
@@ -1180,6 +1249,9 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 
 	return ret;
 
+err_pm_get_sync:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_micfil_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
@@ -1191,7 +1263,7 @@ static void fsl_micfil_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)
+static int fsl_micfil_runtime_suspend(struct device *dev)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 
@@ -1203,7 +1275,7 @@ static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fsl_micfil_runtime_resume(struct device *dev)
+static int fsl_micfil_runtime_resume(struct device *dev)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 	int ret;
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index b3c392ef5daf..231a52aff024 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -174,4 +174,40 @@
 #define MICFIL_HWVAD_ENVELOPE_MODE	0
 #define MICFIL_HWVAD_ENERGY_MODE	1
 
+/**
+ * struct fsl_micfil_verid - version id data
+ * @version: version number
+ * @feature: feature specification number
+ */
+struct fsl_micfil_verid {
+	u32 version;
+	u32 feature;
+};
+
+/**
+ * struct fsl_micfil_param - parameter data
+ * @hwvad_num: the number of HWVADs
+ * @hwvad_zcd: HWVAD zero-cross detector is active
+ * @hwvad_energy_mode: HWVAD energy mode is active
+ * @hwvad: HWVAD is active
+ * @dc_out_bypass: points out if the output DC remover is disabled
+ * @dc_in_bypass: points out if the input DC remover is disabled
+ * @low_power: low power decimation filter
+ * @fil_out_width: filter output width
+ * @fifo_ptrwid: FIFO pointer width
+ * @npair: number of microphone pairs
+ */
+struct fsl_micfil_param {
+	u32 hwvad_num;
+	bool hwvad_zcd;
+	bool hwvad_energy_mode;
+	bool hwvad;
+	bool dc_out_bypass;
+	bool dc_in_bypass;
+	bool low_power;
+	bool fil_out_width;
+	u32 fifo_ptrwid;
+	u32 npair;
+};
+
 #endif /* _FSL_MICFIL_H */
-- 
2.25.1

