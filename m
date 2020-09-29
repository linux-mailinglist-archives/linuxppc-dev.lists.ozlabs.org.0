Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101027C0F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 11:21:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0v681F0jzDqWn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 19:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.22.79;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=OtnF6HjY;
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0v441QgwzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 19:20:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGHxeUbKdfK5aH5IZQAUWC6w9XQ2HmMRE5XMTl40PGtff8eAdHcRBoiHeiBgPXngPS5/+iAxxcfB6d184Bv7qrYtUUETwe+z3b+mV6qtoOr0rNE7jRP4u9KoOKFoVCzEf6DNovF7/2e/uKKIgCv2Z/rX/tTS+dV3FgE9Ia3CM2xNZdAP4gXBaMFL0IMW3uZsuW+UXkh6N35n3FUY7xigFHQq2xlxrbjPlqs4eEHft5RR4Y0mNdP7aBDqQXKTvZWT3+zkO2vDfdr7y6OU3Il400tly+WoNn6y+MYms/01LyiZLVEzB1GOoCUMyUtOtk88spnBkATK9UpKVY5NfKOgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e6TA/KBCGUY9d1AxH2UpbczpkCHYLx9Ze6RG1rtEVs=;
 b=MdpFZ4N/xPJGTNlSDRNBDN7ryg7BqbYnb4bW/AtQvdIpqTqR7vdiozH1jC0uxUFwhBLwYTe2g4EPo1lv5oIx0ajUm6gZQHsx1lflLbo2msPX3+Fd0sEA3/a40dxdCrqAJ2DbAhbKngMdBQCMCM0EUjdwib+FBYm90TztmhPS3PCnp0mIiYaKElzzTX0Gj5HsjjrTBjC62B2ei7BR7vypnj0v5E6MxEdyNt4n0B+mzPnpdsszvnENS6k8tqOd+TMAt99pL36zLtdjGUELlTI1eNFoczdIU+XsSpAjh7M6bYzfmUBnlOqfdooLGTH9epg7nubF+tiXQ2y/O4xVMz1nAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e6TA/KBCGUY9d1AxH2UpbczpkCHYLx9Ze6RG1rtEVs=;
 b=OtnF6HjY1ayofZYhlP0DGK+c7MlQY93nFqD+oiZuA4VyfUb3epjj9bxlZb012p/9vbIKCr/ibI9qYfa+5oqk4CMcgKp4dp1CyB6UaGi0z5tL0Dzh8vVXB9VmGX9v5FAsVZ8cVj8NszMFUhssh7y63jjR8JkDfDAXEhdSAPNRZzo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB6335.eurprd04.prod.outlook.com
 (2603:10a6:803:f9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 09:19:52 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 09:19:51 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/2] DAI driver for new XCVR IP
Date: Tue, 29 Sep 2020 12:19:25 +0300
Message-Id: <1601371167-32239-1-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42)
 To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3412.22 via Frontend Transport; Tue, 29 Sep 2020 09:19:49 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53f90cd4-bcd9-4cc8-4889-08d86458d1e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB6335:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6335E8AA514C6AE11FA0BFB3D3320@VI1PR04MB6335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWwlIXYDuCiFRBR+OH9Br8tx7l9NWHWrbE/A2ee/sT3S8W7YEEk7SFfdLAp1WOpBQbDSEgkwg2RJrexHwHAFTYhFj1Xw3ITieUr5kve+iJoJURiDnJ+Nf/hRQ1GJxDN2qOP1tBELYGMfcX9VRb2TnJdepBjTxwiV0e0sugHx05qOgAg7w2HEaRrZWD9mv7/XcbQ76z1dOKuwmdxgHBEHjTkL3344Bfol5QpN+ewW/IGLJee/ryQKat6jWClvVkJpPqRZDRlLG45Je5QB2S9Ga8YLQAPsWILOmtyGDoaQCeCrFtvkJQ4sv3uzIuAtm6OQvA6Xu84tm5oRs/F9EdLCnkK5c4ajI90RXtRWn+zwRMziKaAZr/0Nz8VukV239Uim5eZlwPYzcieogU5hEHJdRe+Gd4EgP6EXJbZuIE+a6Wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(5660300002)(66946007)(7416002)(4326008)(8936002)(8676002)(4744005)(83380400001)(66556008)(316002)(478600001)(2906002)(54906003)(110136005)(52116002)(186003)(86362001)(6666004)(6512007)(26005)(6506007)(16526019)(956004)(6486002)(66476007)(2616005)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MfqkXEQh8PoFsdMwBRFAK5TwxwG1DLrj2ya1QHYDefqTdamTQem/dnl0h0hz96gxfAWNDkwC9WMoaVZGdzZUl47jcA2SPkYfYdrEIonajCmFemcmXCPiurcHDbdbDP66k16PH+fj+s/CBicduONtdw+dgInQRokW7s7GVtwjEnUAaXOiM5Wzy2ZZJKvF70HmBrVsLwjR7O1HdzAiOsKgX04NE9WYsMRadRXKDz01haWnnUTy3A0h1Jv14wqXWTdRKDGIm6345i8Dmou2jVlziVZAIvQ2r0PsIhasKOcqWlAKN0EA9AoEZ41KVCqW/idD6Jy41wi0ZzyF1hTb/J86t8HjoKLlEsTOKccr26NQTzAuOb0dhco7Zh/N+puUxa7ZHumaYWiXYX1bsg8M1hA3cn8lDrf/CjL3gFVK4nptCCB/j6Nsst4DpgOGgocjWVqLQCVf2GcxyHeRHcr4mF89XuhZeXEzvuz/P1sqaIGKPscdksl+ODl+wns8U/giuYgjorMdnKzeLIo/Cj8HUF8XbJsdmQ6G2hPgsOERTxTXD/3PocKb71dn2oBf48UfPbrpgulehv0uQN2RlRVTtod84v/25bmTYPszI6bgOXQz7SBM8qgRxujatdSPzsVXWSv97npCtj/uQwrO7O0NR30KhA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f90cd4-bcd9-4cc8-4889-08d86458d1e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 09:19:51.7511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cL4c+CIv1d3sKxdVBrlvwuCrhWr8dq323iqT2xbeJPDOyoIt1SCH/I8PvW+2fDrbP+X3ngHb9sgReiaIPcKTwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6335
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
Cc: Viorel Suman <viorel.suman@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

DAI driver for new XCVR IP found in i.MX8MP.

Viorel Suman (2):
  ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
  ASoC: dt-bindings: fsl_xcvr: Add document for XCVR

Changes since v1:
 - improved 6- and 12-ch layout comment
 - used regmap polling function, improved
   clocks handling in runtime_resume
 - added FW size check in FW load function,
   improved IRQ handler, removed dummy IRQ handlers
 - fixed yaml file

Changes since v2:
 - used devm_reset_control_get_exclusive instead of of_reset_control_get
 - moved reset_control_assert into runtime_suspend

 .../devicetree/bindings/sound/fsl,xcvr.yaml        |  103 ++
 sound/soc/fsl/Kconfig                              |   10 +
 sound/soc/fsl/Makefile                             |    2 +
 sound/soc/fsl/fsl_xcvr.c                           | 1356 ++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h                           |  266 ++++
 5 files changed, 1737 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
 create mode 100644 sound/soc/fsl/fsl_xcvr.c
 create mode 100644 sound/soc/fsl/fsl_xcvr.h

-- 
2.7.4

