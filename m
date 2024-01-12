Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 714DE82BB04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 06:46:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=US/rl4ql;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB9X06jqpz3vcp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 16:46:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=US/rl4ql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::62b; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB9TL1ZG3z3cTb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 16:44:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg8l5nZUZRdRq4rg/sMrcSjTXryS/Uc1zGLEUcXn8BLu0TtXAaRyhIUocM1A35qhqDEMEBBDtN+ZhvfaA1uw+VmyOqhOrFVU6oTVL2XEsJrwI7TOhtWD2+vUX0R1R5VeYjSXOVyxnbZhJoH8TFL5AQvAIKtrhMAF+94JbV0bE3lRJR9Egcni06ymmCbTeAFruHU9UVWylWGVe/pCwWFPk2Ypde1IxqwNpfxWfSHk0Si+vr5SAK3B4iNoHdmmd9KlO2Q/liTsAWO0anaFzUI1OO3U3SWuUcupR362gxvPPH34woFhmvMAjK1yxEccA4kbyw/VIPo9/YPwEah4OJeO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mBacVnmmEo6nSbLcbfW5aP18Z4DRu9hu0bQFtRtQN8=;
 b=JjcsSFHCYNCj+ie/cqaYJFG2sisPAcdbzQyA3QzB1a4kbDWOMATsQqOvI9TiVsQbuGHavQZ5MUW8zlK66Ytc6TVkM9eWp7AUbn8Ih0n0B4XSbIVGMZ9C17FwSHiwmQz2CG+Re8V5i7tihF0U8knpgwzb/3jc5A3wxt6yM/zICueGTyT8SzW/ct0Zh/+0EO/AYUaRFS2+nmHb7o27sSITk02ovifWEeoGM9QYQIz0rbEyOtnXo0nEi5dxzvC/lXPpZzVHvnnRG5s7Gj3JhFpEQE7cdJei8t5Q4pBfMP4O6XKges7MfUIbPHxBwtHSxLmrH6h0JVsPsDft8hv+GFZHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mBacVnmmEo6nSbLcbfW5aP18Z4DRu9hu0bQFtRtQN8=;
 b=US/rl4ql4hqloyzKGOB3VLLbKsNtMeykyMpjbFEBYxS9TgNDeEQTl1RCnTEtXZKJ4XC6YiMh5GM5pl9g+bT08ReazAFhi9o4qUy7jSzIRS3HAyIhureRDrm1MKB7ge84YTHyoM34y2B8QHTqoePL/EYvuZvkm8DV7VHvNKF0HnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 05:44:04 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 05:44:04 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] ASoC: fsl_sai: Add support for i.MX95 platform
Date: Fri, 12 Jan 2024 14:43:30 +0900
Message-ID: <20240112054331.3244104-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240112054331.3244104-1-chancel.liu@nxp.com>
References: <20240112054331.3244104-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 154581b8-cbf4-4f0e-ad3f-08dc13317c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Zl1VAyaRfxXDjIus8r2jnnEu6/GcWU3ZFN7FdReYYvSBU4gzLifE2toa4DrFiWdFkzooeivoVZIgSK9LWfXsz2FH++5P/25YNaCGKgWdfkdIrW1WQ2YzqZxz5G+sFzFIO0NziDiHx6YrzY88jLEiImFF/HcZ1Md+NlDaxVOctjWv7EiPz8R7js81IsfmCZQmIP6X1PW7wGhQ/aGizRu2P/yZAmY3nhKScUQ1yR1hHeV0ryf1BPwbErqzeONdSJflfJct02x8lywG5JZGAENS7rR2xjRWD/M3f7StfpcwxmaQIR88eUJ+xl5QCPLySKBG5Zy/A52hJ7HZQrfKGuXA4fbkYoE3zhnBU6j6Mb+DWIEa2o2848WHrUBKnrvURDraBswlWl7ZKPEJmltAJfYGDGjrwnIqvavr0PdXzG/2KBZXHQw7xIVsQShp49hTnG3av/Ifv5Ut64yh9kEeFxHX3JjcUWvkMKn+XmrW8uzWhppmaXuJov55emDVA+IIYAkoA4AoA97WG6+Gsl1vtzX+P1EHipZYStTm7aVpJz2nzk4kJMAiXpSP7UWA8FzGtBsobSATEZAN4//Snb+qh3Gr1NR117SqW39vabPPvwmX863DS1bZ4bJLE8LVES3bdiMe2xARPjRc+OvZlJKdqbKVYQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(38100700002)(41300700001)(36756003)(2906002)(86362001)(6486002)(6506007)(66476007)(66946007)(52116002)(66556008)(6666004)(478600001)(7416002)(6512007)(5660300002)(4326008)(2616005)(26005)(8936002)(44832011)(1076003)(8676002)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Bfk3ja/7kYHcqLUUmTeevX2sHE8tLtoavY2X6caFE77saHp4oH0Wacbfbv90?=
 =?us-ascii?Q?QK44/j4wa7Y1E39YbEf+E0W2ZD8i7vQ6batXxQ9UkDZNRBDDb0+BJv+HEBzI?=
 =?us-ascii?Q?u21tTMArwIPFa9lAVKSjnUmHA+XNQB3FX9gg8hgajCemeap5571xywaWcx9Z?=
 =?us-ascii?Q?ZxCMjUplOcnKDgS10bHkg23Q4kbnm3T1Brb2X02p+2OE/5mOsAgd0WhMElJa?=
 =?us-ascii?Q?Y+9384cEkiqyOLqFaZUpNJYSNKlG0v+cFAa6c3kvgUpXJrXH/zXkScIHU0EU?=
 =?us-ascii?Q?tNp2EIHu8Bi+uZlhKKmDYd8umti0CaH4+H1LbYhmsZUFJEv1F5xX9xFFFdwo?=
 =?us-ascii?Q?YLhxINjs55NsRpgVdpftGva81nO31vrj3S/1BDkBvw7oRHZ1vwxR7GM3RrAl?=
 =?us-ascii?Q?7Gv0qfKpwYhX0HrBR9t8iRLn6WxIOL4QtMJqQ9O5Ft1vivz92ZxumMo16gTc?=
 =?us-ascii?Q?ahaLqrXT1cAaCNT5gGdFGRU7spd89vLnhWectnbJGCOOpcoGkxTIIsBIwTnN?=
 =?us-ascii?Q?0D48mAxLfg0v2hmZvVfrBPAz4hQ496s/jZMdBa1gZQqbmBydjMeg+mKNXb79?=
 =?us-ascii?Q?wmi5S1Bsp5rf/c60c/MjCDvZ+VO5BlH7Bi8P5hxdg6nNPH5r3C9iO1qGlCy7?=
 =?us-ascii?Q?+cUXu3lciBi0z5YFc1Lsf67wxtw2VAnj45x1tso0S4JxCH+a5c07ZtemQ3AT?=
 =?us-ascii?Q?Gm2X4a1iUaDpFgpoQIl9ea88CzSw8rCv+o8KVXJxxBxkuhjXcrl0gwJAgTUg?=
 =?us-ascii?Q?R9pNO+huFhR/Vm0QaSOuBpHCgOD5brcyh9lToavYM9Q43vigsv5xMnyj4H5S?=
 =?us-ascii?Q?+RPn14h/JFbBLT4DhImi6tROh1jpxwTr8mOgXIf8JLUdeP9+gOKc6zZb6nv4?=
 =?us-ascii?Q?TVTQViNabS4C5hUxU6MSlxWR8rWhwXf0GLe4pbDveB9bV52V6bZdW/KtMwN9?=
 =?us-ascii?Q?gwQRuYTPMlc++CHfqK3e06bqJzexZabh+JAQ1wXRqv7TAnc6Ma6vBVtMfvQp?=
 =?us-ascii?Q?L/m5DuiJTlHlhxmkiy4OFyrlhvGVCZuX5PhrzpnjK4q8eV2/abimGuEDzzJ2?=
 =?us-ascii?Q?Hj+WhqKa7hIsouam5EVryrOzeFlXDQ+tIcAWYDO8RPXP4PtdOtwtnaFU+Vbl?=
 =?us-ascii?Q?AdlfY3Z9RdPHSSJ84QthwoULwR3aJClo6/LRsYVBytde2Vs2uktC+M/mhWsJ?=
 =?us-ascii?Q?HtDzLNyPcKbm4EMG0Rwx392KPbFMIRdrnkrXVhfHleRDjQFESDipvdIliRBc?=
 =?us-ascii?Q?cvBtmFy6suJGLc9IJ8+sIv1mJPgpfeKkpLUV5ePgN59r5DDYl3rw9ea9jJWF?=
 =?us-ascii?Q?7Cz+eo+2zlnlIMWBT7LmIchs8DqS7NoKLl0iMRF8Ft2BCyP41mmIcDSwbTKQ?=
 =?us-ascii?Q?hwrmV43fBXX5Z4IGHsUbRx34CF8Gm2GiQJZeknQOjuHa+MgCBwq38D1sZfcy?=
 =?us-ascii?Q?y8qhzXHcavYinzDwNDIDwWf1FZq5++kN11RLf/ICFeqaW7fEiYHeHeuThB+b?=
 =?us-ascii?Q?laKeLtg4MvXdzVO0Z0II/dMjh9KkYwXanEa1cLbTOSrVfxGmyYpDJ/ox1Ox8?=
 =?us-ascii?Q?fqXZ4D3FIP+EUiwOuqo/4KYjexLcsj6weXK4W1Hq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154581b8-cbf4-4f0e-ad3f-08dc13317c32
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 05:44:03.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL0aur3LmECzTSOena2WH5lChh+v+2JbM008LC0X4KBiBN8NU1W4cx2OffnwNgp/jMTwrq7EY9xOzHpUNpN1bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
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

Add compatible string and specific soc data to support SAI on i.MX95
platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 546bd4e333b5..0e2c31439670 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1639,6 +1639,18 @@ static const struct fsl_sai_soc_data fsl_sai_imx93_data = {
 	.max_burst = {8, 8},
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx95_data = {
+	.use_imx_pcm = true,
+	.use_edma = true,
+	.fifo_depth = 128,
+	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
+	.pins = 8,
+	.flags = 0,
+	.max_register = FSL_SAI_MCTL,
+	.max_burst = {8, 8},
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
@@ -1651,6 +1663,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx8ulp-sai", .data = &fsl_sai_imx8ulp_data },
 	{ .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mn_data },
 	{ .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
+	{ .compatible = "fsl,imx95-sai", .data = &fsl_sai_imx95_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
-- 
2.42.0

