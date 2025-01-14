Return-Path: <linuxppc-dev+bounces-5218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 851DDA1040B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 11:28:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXQMN1Ndmz2yys;
	Tue, 14 Jan 2025 21:28:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::61b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736850512;
	cv=pass; b=TbTFI1E43rtLflKO36KE+pTDHREL/nvxlNAkakJ4VzuV8fc1ZuCX2PfCRZ0ZRCgCKLddOaVg9mJYdUuoqQYyGCYcEqvNDjXI5SsGkiWFMONrOJYcvKDTHgJMm2C5hseAkS+Vq381R5+NEUI0iFt1Ez83gfWP3xrNQHIAv2GLyWAgA2MImlJO+e4e3eLi8/L4lHOzZb8RHnxNPmypQJpqaLghtiCAzmMq80BFVXqQW+PaX3BrBIZuHrfcNrzhca0obP1J/JlWR6/JjWl9/L+z/fHsaZqIa08ipbx3mUGyOZ478Ln6uPJoNAoCumXptZs6v+ORMGWxrbOO7T61LA+Mtw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736850512; c=relaxed/relaxed;
	bh=3EnQFAmGejzaT4WiXeists04vr+HuTT/+IVQW86dumw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRtwgx485kr4ZZ9iYZ3DwNDBzlshHZCth/X3dmCE24ySN562PTbtk/lhv2lBwus3gF9pYtpNovjuP21W5YG60og7qaf4/Jnxva/HVY4Ej8UfWKQdpeZII2kJFAEBYr3HVeOT+itKlFf5yQB2Bl1VSwc8PyoyhgMp1Hl7MFCZa6SRPXc/MGxSprH5LAuGXZYByM6F5TlVwqi2cEGEPBykc5scSg5ChtI015gt5xDtiX2t0CxITZ17bC2i6/gOnzWrTNnaFEfwUwkasu7LQslPvx+fgsuEiMb5zxVnMMhrZQ6EOEFKYNjCcNuTH318wwq/gXqLluMjF2SQvKHX0rf1wA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QND1HXk4; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::61b; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QND1HXk4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::61b; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXQMM2cs6z301v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:28:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AluFMFhYL19dGVy2JvDoBrmEmc1GfAru7R1xnXvujphFTKCrJPRqwLGOgMa7gvO0iiN6me3M+tcQiVj8/WAvCBPxJvzB77KOeyl4GGSDiR4sJKjGwrE9BdymDhYH5mLVppLDxXqu9X2taEF5YDmVLbJ4i9DdP9jviR4OgP/hvvOmYt4EIrJyXNY4ABIa+4TO7OzeDd09xLgNFon/6pY6Nhcv4cXjXPn1HC2yyiv9aI++vf6ecWgGMHazkGWNpTgtXJVetmDNOk86N5HhtNrQLBG78ABe13rVQl1PiOTc/WpVSa3w+6EtRJVaPzGAWChK4qPhU1dTsPrvztJyWAlKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EnQFAmGejzaT4WiXeists04vr+HuTT/+IVQW86dumw=;
 b=GEb2xUi9TAun8rIVgsCgNYZPL0lURA5E4gE+rVKS+N0spllwlxckLflZoJlviy7/nc3B5oyZjLd9qYED+BJQlPA0hOzt8sRo5Ack4IYM5Ni0xHAUkKus2id6coWHbbRE4wPR31F9GeZ4O0AZU+6m+d+qjiJiYrwokNHVc5TSYD4w6tjy4GNarFHNRd8nMpEqTSSVHWhr9pDq6feDcpiYlJuwyivaCR3jO9orSZjg9CbWiFaHEkoJAPhVWaVxcXl32aIta0SE4bz5SikRkir6H6ZebxrqM2TqM+z2/+JOdEg5fy5Bpb47lw42JNX1wS/0STZGUtphySNFSuLSn9cKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EnQFAmGejzaT4WiXeists04vr+HuTT/+IVQW86dumw=;
 b=QND1HXk4A+eOJnFL1tP/vZBILJi5r/tbw88wkfmEwbRXjVGJJcdWCI4BnZ33k/J0u5rxsqp/HR/9wvqQQvn0nG3wC6tdvm5/S9zYtmADOe2jlXt7aQMGrmhCJXcMsC8f2+8bgReB1XUDAc+6YBJSYfjNX8wlACERZQpfW7mqyhKm+0isv+BovD9c457wGo2lzbUthFoBbgqgWR+i5PBgeV7rcIa63shGcVepR5zTdM8f8tArkIHahhnaeIJHSqfTvX9R69rtLy9HWUMAFXy/bfrZYnqqBhXup0AMNpGxhSSwRMGbeTEWiIVd8+b/6GS00HOUL8cFex8srs0PDvkKOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB8082.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:28:12 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 10:28:12 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_micfil: Add i.MX943 platform support
Date: Tue, 14 Jan 2025 18:27:19 +0800
Message-Id: <20250114102720.3664667-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
References: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f16f68-ff23-43ee-7e02-08dd3486260b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U5z1o7nnEdB3xVGzVz60zNmeEZgq49gO+u86v0duU8NwKK1cdbbLiq/MLnWP?=
 =?us-ascii?Q?+qlMTfx0VxCk5KEu3bfD/PdH6MLe2cWt5/f5EVENmQhXit4YX93TrBZeb1SM?=
 =?us-ascii?Q?UVRBC4n8yrhGblPDbJwSDTcDrJ4AwKJMCorj73jiWd1UGMFS6yAJ4RGPMJlL?=
 =?us-ascii?Q?CdtzTqI8xSEqDOWlddl9V9Ph9RAJ7kwfS2LtIJoO2UibRlSrpRjsI4Kn7ef6?=
 =?us-ascii?Q?acz/gVNhe8FmpNdjnABFp/I1r7z0+vNOi8B79G7iz0INdXVk/CoFBdnnnLJN?=
 =?us-ascii?Q?YPk25akbg0g3RY3nED/O7i9ppWwmxSD4ETh1Ju71fG+MUapE/L31hftoX0+b?=
 =?us-ascii?Q?jhzfMEUVfsYwUeYvwZ40XAHg+c49Xqoy1yhw/BGg3IZBhZVXPmK/PcP6hFEP?=
 =?us-ascii?Q?JchLx7J1aZ1vwGdwei8JMq9wK04FF/slBIwqU7n/D2qcol2THukYC4H/awAL?=
 =?us-ascii?Q?aBlA7jAMYb5eKAlGGfSW2U13N8OCUmQ8RaK+LdPMsB3p0PlJ8kegrJVQWPOR?=
 =?us-ascii?Q?HYrpkbf94ndHCz6fmsuQsFUC+t7jkR7ZNEzAXr6M2reaYa2n2WOrJMQSc/Ws?=
 =?us-ascii?Q?Pac+qK86qGvr4wiMbqDNdT9UOhQcuAWGaoisza3dIWAe8mtN2RGIKE5J5Ari?=
 =?us-ascii?Q?cIhr828QWQWShZcsdkRatlYjDSEfRfFMrMks4OEm7ReqBbGV3nADL1qCf0J0?=
 =?us-ascii?Q?LKuBo+G7eWCTpzaAk+iNU34kizt0GgXOnpBlTOSWC2kC833c9Q9jcGyCJO7z?=
 =?us-ascii?Q?6ng4OE4Oz2GwZGp+tvVJIY94KBdI2lKKV6V0TLzvCukjPW6x59Q3LJHXPFTd?=
 =?us-ascii?Q?pGwBqz5OsvYI4SwnK06yLvGpWXPmRSvVeYLQgcrQqmLm/aIyKQt26f51ZlFj?=
 =?us-ascii?Q?FyHjkqOGhlEDF/vN+0eqJKlmjC/Ro/89Yw66OxIS/Lr99/uMSgHlK3xAh2yJ?=
 =?us-ascii?Q?20M4axxwbmZjh7emclLS5iADyTXJ0RwZfRbx2wEwtomXiJH0ZP/ToDdNKGaV?=
 =?us-ascii?Q?m8gKLgVpiIS3YSvrXtBSQwfbMlZawKh8llWonbmoB2btv3D5gpotxZnxkzs4?=
 =?us-ascii?Q?lbB9hsTUiJ1lLGrqxowRzrev6Wt4osWVJ+yrejjNIu2MWPXc1MKg9lo3NFp2?=
 =?us-ascii?Q?UEdpifb7PpSmFv5nicFcbDCHzs4xEyL/J25d9Gwkath1Ah06pJJcoidLBT/L?=
 =?us-ascii?Q?WpRpsygAl9vFur3tTHyQb5RpYGA9/gcbKvQjE/bvExITmi1D9AIKUP/FxbKi?=
 =?us-ascii?Q?jDchTcVZ35cQM6rK3DUnJamQ078QWb/XnGUO2jrWlvUFWl2jntmUYoXVPsoW?=
 =?us-ascii?Q?78VtbbCx26w+BzwrybYJ8xDzgxjKSfdgyYTQF+5kt3zRHqYuZux9ljpHG18I?=
 =?us-ascii?Q?wRxp4Wp/4hdRBv2wUPaTV3M+KqhTosuKF0v83bDqgEUtzDPtvBtT1oKeVxp6?=
 =?us-ascii?Q?JzXS+O0KBzo26SyHO3eMJhM/IGDQP9npFFn7LbFEkoDT0XZ09YnwoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ocLG1PCCr1zOuSR27KL3Lp8V7jIHXUXkfyQgv5zYs7J3+G2zci1pbKpXmHH?=
 =?us-ascii?Q?RCTt4ieWjmvza25OK8tm24botWHM9rIOTHWEYjJHVWtNnEFpYfU5p5rU3+9A?=
 =?us-ascii?Q?SgPPgVBA3B9zFL7BgBN2ZIbyvdFmFmMJz3pVSNFcW/bNnIkvAxqV7zvW3Psi?=
 =?us-ascii?Q?Y/jXOPLld0oC9N95+xQ3QiZiRp+1CBeQ7fMifDIcseRfnPnk43W9MXy6kLpF?=
 =?us-ascii?Q?CWN839mZSBZpm2+c9lf1un0robRr2mojtbZmbCx1Fn5kaul+ACeRKOI1jeYL?=
 =?us-ascii?Q?Wr96oHDFmTFtUHFf0Y64VK4VCV91dJQsHLBo2XAqEsxELaGcyr02xKkf9lvK?=
 =?us-ascii?Q?RsrHemDwQolPCh8omM/zas+ca5w5ii9rSuFO7V+jpGnqm9ZL3L1z10joYfTJ?=
 =?us-ascii?Q?BFtCvltHEJHqQcf9NzZUX1JROTPbaGjG04VnQgMro9B9MsMyEweYhB9E73vK?=
 =?us-ascii?Q?KykuW/I1KS+FfDwKATYNaipxrYS0BIqBdbG3FNxhgx4eGgSq+P+b4oqAtmGc?=
 =?us-ascii?Q?BJyaqLopau6R3g2FrpA0TilqeavIIkrAXCSvPLcaOuHADCjNQMJjqdB3Ryi5?=
 =?us-ascii?Q?e16LeaFMgkY8ALcpgGxi+XvGTH0IXFldZ3JPleAY141Vm6+5uHfX2lsNY4pE?=
 =?us-ascii?Q?Raqo/Vpb5v0jqG+LcD0kRwxiwK4Px5NNQcnGGIPe1f+IS1ajsVi1E3FFYGV0?=
 =?us-ascii?Q?ngKCnN/cmSPw2n5s0DF2tAhd3aPEFgBPeoxrt+mZ5ZoV9T/GkIQHDrea9LI/?=
 =?us-ascii?Q?8fu4esJ69MJwjbpouyCtYO7ycovf03gocCziJOhfOeVKBa2JjVMcZjGVJuEb?=
 =?us-ascii?Q?Z88Ak0a8Ih+YNYns1z6Vb+ST9i5vDW8Iclk1xaZPjw/XTcwdGJagCNpkgrwK?=
 =?us-ascii?Q?X+PImcJSXYegbdtJ/eiUIHfkWpOkc188T1/WNsb0mZxEGQ4FChr85QwfiaUW?=
 =?us-ascii?Q?ww92w2Vmmq2i+CNF3BSvXMj5Ir+A46TWZZGqvqSiJmpEjCcRQLriT81HRaLm?=
 =?us-ascii?Q?8dOgQCZnmUoVLUivaNbTInaNquXinBYA5HpuuM8P4cFobUhAE3u2gF6wgagX?=
 =?us-ascii?Q?4LJ+KBRGtmI8FyTAtXi0IcU2/wpAXaCMxIgx06vkr71Baeh3Tel5+TQNORrE?=
 =?us-ascii?Q?h99uevyDvGtYzB2huNxMIHozsfcwuz+gwqiH6mTbBSfv7dtYg+Ea8kLgV3hh?=
 =?us-ascii?Q?jJ1de8L9/P6MUMjQkNYBTMbrPC3WYwCV5tLDztOtCcDm+Z9+gwEcoZ5zqOEa?=
 =?us-ascii?Q?o9c10bnJj4/lxLOQ6DTSvKzYVYZRF4lCxwuKQns7fKeH5NwniB1n5kiLqXM5?=
 =?us-ascii?Q?s5TENc7L0REUsxNIHucwGk3VVswxkS8X7zXssk7Zh0ZHN+cNolJP1tXrhUgo?=
 =?us-ascii?Q?myCtud0JkOgeLgkvCVTCY6b1K1CmLZDqpWNv7hx86hQpU3hmCtqkHBi0H3KM?=
 =?us-ascii?Q?VJP34Qsf3HeBkiyFK+6nE0r9k8f8NcDhRU0YlE2s9QDYFe4/2f4BXTKbNqP4?=
 =?us-ascii?Q?kkhgwVzjeVjjZBftcpl0jCyquk50qnBiwDlxTac+oKqgVrKMGl7yxPeEsYEd?=
 =?us-ascii?Q?PQcNLYjer78Fr/KbAAsMOoM0saHh+7NTOxpOV88e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f16f68-ff23-43ee-7e02-08dd3486260b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:28:12.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/0CqiY13XHUXRZq8JFhvlNtClIbaz4h65pXs4UrcpKPoWWLwqWOiS2s3n2uGc0gu1a66CanENdfZBzGKWQXDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8082
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On i.MX943, the FIFO data address is changed to 0x20~0x3c,
compared to previous version, there is a minus 4 offset,
so add a new regmap configuration for it.
And the bit width of CICOSR is changed to 5 bits, from bit
16th to 20th in REG_MICFIL_CTRL2 register, so update its
definition header file.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 98 ++++++++++++++++++++++++++++++--------
 sound/soc/fsl/fsl_micfil.h |  2 +-
 2 files changed, 78 insertions(+), 22 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index e908cfb594ab..1075598a6647 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -89,6 +89,7 @@ struct fsl_micfil_soc_data {
 	bool use_verid;
 	bool volume_sx;
 	u64  formats;
+	int  fifo_offset;
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
@@ -98,6 +99,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
 	.dataline =  0xf,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	.volume_sx = true,
+	.fifo_offset = 0,
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
@@ -107,6 +109,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
 	.dataline =  0xf,
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 	.volume_sx = false,
+	.fifo_offset = 0,
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
@@ -118,12 +121,26 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.use_edma = true,
 	.use_verid = true,
 	.volume_sx = false,
+	.fifo_offset = 0,
+};
+
+static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
+	.imx = true,
+	.fifos = 8,
+	.fifo_depth = 32,
+	.dataline =  0xf,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.use_edma = true,
+	.use_verid = true,
+	.volume_sx = false,
+	.fifo_offset = -4,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
 	{ .compatible = "fsl,imx8mm-micfil", .data = &fsl_micfil_imx8mm },
 	{ .compatible = "fsl,imx8mp-micfil", .data = &fsl_micfil_imx8mp },
 	{ .compatible = "fsl,imx93-micfil", .data = &fsl_micfil_imx93 },
+	{ .compatible = "fsl,imx943-micfil", .data = &fsl_micfil_imx943 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);
@@ -793,7 +810,7 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
 				 MICFIL_CTRL2_CLKDIV | MICFIL_CTRL2_CICOSR,
 				 FIELD_PREP(MICFIL_CTRL2_CLKDIV, clk_div) |
-				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 - osr));
+				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 32 - osr));
 
 	/* Configure CIC OSR in VADCICOSR */
 	regmap_update_bits(micfil->regmap, REG_MICFIL_VAD0_CTRL1,
@@ -932,9 +949,39 @@ static const struct reg_default fsl_micfil_reg_defaults[] = {
 	{REG_MICFIL_VAD0_ZCD,		0x00000004},
 };
 
+static const struct reg_default fsl_micfil_reg_defaults_v2[] = {
+	{REG_MICFIL_CTRL1,		0x00000000},
+	{REG_MICFIL_CTRL2,		0x00000000},
+	{REG_MICFIL_STAT,		0x00000000},
+	{REG_MICFIL_FIFO_CTRL,		0x0000001F},
+	{REG_MICFIL_FIFO_STAT,		0x00000000},
+	{REG_MICFIL_DATACH0 - 0x4,	0x00000000},
+	{REG_MICFIL_DATACH1 - 0x4,	0x00000000},
+	{REG_MICFIL_DATACH2 - 0x4,	0x00000000},
+	{REG_MICFIL_DATACH3 - 0x4,	0x00000000},
+	{REG_MICFIL_DATACH4 - 0x4,	0x00000000},
+	{REG_MICFIL_DATACH5 - 0x4,	0x00000000},
+	{REG_MICFIL_DATACH6 - 0x4,	0x00000000},
+	{REG_MICFIL_DATACH7 - 0x4,	0x00000000},
+	{REG_MICFIL_DC_CTRL,		0x00000000},
+	{REG_MICFIL_OUT_CTRL,		0x00000000},
+	{REG_MICFIL_OUT_STAT,		0x00000000},
+	{REG_MICFIL_VAD0_CTRL1,		0x00000000},
+	{REG_MICFIL_VAD0_CTRL2,		0x000A0000},
+	{REG_MICFIL_VAD0_STAT,		0x00000000},
+	{REG_MICFIL_VAD0_SCONFIG,	0x00000000},
+	{REG_MICFIL_VAD0_NCONFIG,	0x80000000},
+	{REG_MICFIL_VAD0_NDATA,		0x00000000},
+	{REG_MICFIL_VAD0_ZCD,		0x00000004},
+};
+
 static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+	int ofs = micfil->soc->fifo_offset;
+
+	if (reg >= (REG_MICFIL_DATACH0 + ofs) && reg <= (REG_MICFIL_DATACH7 + ofs))
+		return true;
 
 	switch (reg) {
 	case REG_MICFIL_CTRL1:
@@ -942,14 +989,6 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_STAT:
 	case REG_MICFIL_FIFO_CTRL:
 	case REG_MICFIL_FIFO_STAT:
-	case REG_MICFIL_DATACH0:
-	case REG_MICFIL_DATACH1:
-	case REG_MICFIL_DATACH2:
-	case REG_MICFIL_DATACH3:
-	case REG_MICFIL_DATACH4:
-	case REG_MICFIL_DATACH5:
-	case REG_MICFIL_DATACH6:
-	case REG_MICFIL_DATACH7:
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:
@@ -1003,17 +1042,15 @@ static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 
 static bool fsl_micfil_volatile_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+	int ofs = micfil->soc->fifo_offset;
+
+	if (reg >= (REG_MICFIL_DATACH0 + ofs) && reg <= (REG_MICFIL_DATACH7 + ofs))
+		return true;
+
 	switch (reg) {
 	case REG_MICFIL_STAT:
 	case REG_MICFIL_FIFO_STAT:
-	case REG_MICFIL_DATACH0:
-	case REG_MICFIL_DATACH1:
-	case REG_MICFIL_DATACH2:
-	case REG_MICFIL_DATACH3:
-	case REG_MICFIL_DATACH4:
-	case REG_MICFIL_DATACH5:
-	case REG_MICFIL_DATACH6:
-	case REG_MICFIL_DATACH7:
 	case REG_MICFIL_OUT_STAT:
 	case REG_MICFIL_VERID:
 	case REG_MICFIL_PARAM:
@@ -1039,6 +1076,20 @@ static const struct regmap_config fsl_micfil_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct regmap_config fsl_micfil_regmap_config_v2 = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+
+	.max_register = REG_MICFIL_VAD0_ZCD,
+	.reg_defaults = fsl_micfil_reg_defaults_v2,
+	.num_reg_defaults = ARRAY_SIZE(fsl_micfil_reg_defaults_v2),
+	.readable_reg = fsl_micfil_readable_reg,
+	.volatile_reg = fsl_micfil_volatile_reg,
+	.writeable_reg = fsl_micfil_writeable_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 /* END OF REGMAP */
 
 static irqreturn_t micfil_isr(int irq, void *devid)
@@ -1243,9 +1294,14 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	micfil->regmap = devm_regmap_init_mmio(&pdev->dev,
-					       regs,
-					       &fsl_micfil_regmap_config);
+	if (of_device_is_compatible(np, "fsl,imx943-micfil"))
+		micfil->regmap = devm_regmap_init_mmio(&pdev->dev,
+						       regs,
+						       &fsl_micfil_regmap_config_v2);
+	else
+		micfil->regmap = devm_regmap_init_mmio(&pdev->dev,
+						       regs,
+						       &fsl_micfil_regmap_config);
 	if (IS_ERR(micfil->regmap)) {
 		dev_err(&pdev->dev, "failed to init MICFIL regmap: %ld\n",
 			PTR_ERR(micfil->regmap));
@@ -1314,7 +1370,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	}
 
 	micfil->dma_params_rx.chan_name = "rx";
-	micfil->dma_params_rx.addr = res->start + REG_MICFIL_DATACH0;
+	micfil->dma_params_rx.addr = res->start + REG_MICFIL_DATACH0 + micfil->soc->fifo_offset;
 	micfil->dma_params_rx.maxburst = MICFIL_DMA_MAXBURST_RX;
 
 	platform_set_drvdata(pdev, micfil);
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index b7798a7cbf2a..aa3661ea4ffc 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -62,7 +62,7 @@
 #define MICFIL_QSEL_VLOW1_QUALITY	5
 #define MICFIL_QSEL_VLOW2_QUALITY	4
 
-#define MICFIL_CTRL2_CICOSR		GENMASK(19, 16)
+#define MICFIL_CTRL2_CICOSR		GENMASK(20, 16)
 #define MICFIL_CTRL2_CLKDIV		GENMASK(7, 0)
 
 /* MICFIL Status Register -- REG_MICFIL_STAT 0x08 */
-- 
2.34.1


