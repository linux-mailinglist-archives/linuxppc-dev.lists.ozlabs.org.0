Return-Path: <linuxppc-dev+bounces-3580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51B9DA102
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 04:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xykjt1XQWz2xsM;
	Wed, 27 Nov 2024 14:01:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732676498;
	cv=pass; b=baA41fikcgFczScr+tZP9n7XuVjTxeAQ69GNTRv+5M2vidX4qyMPFkhM6riaM5iCZA2/uc/gDw26w2e9D/9jGyf6liM1dyYEo0qUzWGcb4A2xxfscJBj9ZaF2y+j0pV+zcDsnJ7ea4yFLm+EZ6GBXOyw/qWxKdqrX43DrgWMLyV2Pew2cAI9jL63mKgiiH0vluCvTJZIg2y5scrx8FJ0BSdTOh4yEvyRPR4b5gfwhRGpOIqG8fSJ4X6+qPElEWwhQgrXb4Nf2zwhgh+emucFGmoJMlun/suEcUT+JoldA5T/kWfM/qL2/y7xvMGrnI9nNofDmRGp4p0S8H/ABaSPkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732676498; c=relaxed/relaxed;
	bh=Yo6C30MaQl6lc/gqC2R2a+wGoeOrCPv/hcLMnvuKoi0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OftccYyZzKyChi5y336MPjaJW9eVIQMAd7zKCt5qZN5OzYTipBP5eAIps1AZUvQBJqvWRXDGMrI/4xb1OPewyFJOqlMvey147uRHItwan7eJNqHD99gNI3Nxl9v1i6nyrGqocZwJrGgFYX1iZ/CGD5hMicTP/YY59+W9A64xR2Wt86gusnNlP6Sei4K6QYaMpolnNVaUdDUQv/YP9yDjOrt6JuCZeiyCKYm1Yh2O4vrxHIiD8/NICdH//9AIH+GVutDpZKPJVoLGEHFFl22RU0BsgPTBsyPBDDe/ztZIwOwR8NqyEEiQlSGzfuIEbvERMPH3vX7aK21gOYID/AvcNA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=g2GUpSCG; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::62b; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=g2GUpSCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::62b; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xykjs1XYfz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 14:01:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtZaMznO3JKrQuEcz54uA5cIV8xo/l4uvPvcI16nsW/vIZ67ZI68OwrloRN35P9tsrCRRfTyqNtr98FVc8WksBUDiV+1YdrHjj7ITfjMTUWtdA+Gi5wDThDcZcYqAc8ZCpaE5X21Z8zCD4WBz6Cmd36JdYh4i7M2NsXwIjBOcPJ9VnfU6Asg/cj+fdE9xMTRLUuYGw1ri4fr+TIUAotfNyH1Ah/GldQpuJlCIMeCtt5x1y1GWcJePGLMPBnH3+K7xp0tKJfh4WjH0yQZqaJm8nKUo7TFGsZ8u//T5pA7xH8VWXuNZZ39ryRbqrGl4ThlzrneL6npb+wa7cM803syHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo6C30MaQl6lc/gqC2R2a+wGoeOrCPv/hcLMnvuKoi0=;
 b=RL39P+6IrD6GIrNvePOP89MXopU4Y3N1vt+0yHLCdXU3CHtCd0D8pHieuZvWudGw0SgAS38kVNTNsnMJeMU78iR5bBqDfsw3/VAlqbPjxqV7bkZFPZmLnVzBVjMX0Q7r2+bNw/E5TjxfRrlyUnxoKbEaiExc4HFDIgZwC5aimJsaUigx2d2Qs+JlJX7fFxEPBMczndokhuF6GQPfcra67rz6GudPa5RfbhIGelEiacjrgAxHEjD73eTTH0qir9+e27DO4QzyUzQ9k6sY5QBBNLApF8qqUQPyrSVvSyPOE6BwIWuU0dblx0Y2Kx8OdKjq4o0/xPxRJoVvVK84elKpCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo6C30MaQl6lc/gqC2R2a+wGoeOrCPv/hcLMnvuKoi0=;
 b=g2GUpSCGWfxF1Ak8iHeZT5VyQhE6qBrGC+3riS5Xdggx0mBCJd5IjbDyz1QI6QYgvolJ4lx/kcXZcREYOEvmuwpim1GgdUCn7fDGKRjmrU8matEHnnKNUa3aB17hB1mCjJnktWOjCO5BZj8oNZjYVui0wHrX60OeBOMxn3tOz17TeeixU6h3V7Sg3Ht3TL0it06r/AvfvBpOnjfNyO8nRiz9/MmHn6oNVUmTYLP0CCgxlV/Mpv+ioNTKPD+r/XLNAjWqcg75eCiZUf215KwwKLg2cjqYbkO5KdbJNE/ow103KaV17Ty88yUdRj4Xuu5/5Zim3NhwxyBc1d4lOXH6nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 03:01:15 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 03:01:15 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_xcvr: Use regmap for PHY and PLL registers
Date: Wed, 27 Nov 2024 11:00:34 +0800
Message-Id: <20241127030035.649219-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241127030035.649219-1-shengjiu.wang@nxp.com>
References: <20241127030035.649219-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DBBPR04MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d1a806-aba7-4a57-c217-08dd0e8fc1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mwzfqbUCyh2DbnhsRWvePwwq35JbzjGGJuC/11tyf9SmETOEUZTPiThf8VhG?=
 =?us-ascii?Q?FfVmEorv591JqfcuIHYoei9nyWfo82rMai08i1FI10vPLU+HsAZf+6PXNMSW?=
 =?us-ascii?Q?52gxnWZDpW57rj3J1VcY1/O33OsYwNg5MoqO7DeOjtQigxycS9sgfGqkG1Lj?=
 =?us-ascii?Q?YKlDSjtVzuG+e93JivD2nUmPKa7CY4ycptn8cHSiBbw8KwiU8tQEdV01hiyK?=
 =?us-ascii?Q?qhfyLYQnkYRTXS6rNkjRSST4ct8Prf7YcRY1tzRdG1kE8J2lGB4aCzipyRLz?=
 =?us-ascii?Q?K6PgNxRicfgTncKdyJA52RM0+XhbAp39lU1jBaafupuHs8DXQ3fLkbWdT1Zp?=
 =?us-ascii?Q?DnO08WLgSPn9rjm4vH4MIwfmyHu+4cYz9fmqFgHim1deLSnHuKxkX2GHsDPm?=
 =?us-ascii?Q?OaFwALVf6/QnhzLlsAIBaAacrKvdAJR0h3AtU3JS5U5BcGusXqtAmgthZCai?=
 =?us-ascii?Q?FogckuymD+FU2zcNdMYbtNKtKnCcOowcgQ/wU2gnmbi++cveZI6z+tXSp9yk?=
 =?us-ascii?Q?9+6K7iKkv1H/QT5GO0lO5VF3b4o3GCFUUPpohZ8yN9bj1D0j2U8vQLhjzUSN?=
 =?us-ascii?Q?AZn+cWA5ANEwGYaVXlE3S+sEwjFx0Hs6/2MtjoO2+Q98KUh3jjI8e2G5M8vq?=
 =?us-ascii?Q?diqET/04vZFZ4VPvTuP5UsGJJ7F+wd0r9niJj569qGKGGdGyHnz3qk8XuM7f?=
 =?us-ascii?Q?OmDOHgz6Zfp05jV7LThzB3TtKR/ucEuoe6dIYWz4Y9DzwQppmhXXJXBm4OL/?=
 =?us-ascii?Q?3RuKBB4gLgpmBTIuFQlXW1tgqDmRUwr0WEmZTEgsc9AoTW7nnw2hX2uinEjm?=
 =?us-ascii?Q?JKhEZRPGKOm00sEihZbTUHVCdnT8B4Yhc/06kzUf/O7cq/jqS7qcRMbdsnU/?=
 =?us-ascii?Q?9LWaW+Q3eCTki5AtVldklp+r+ubweRlPrkUSK/dmgBJuXyOviU/P8luIrBn9?=
 =?us-ascii?Q?BBLBhb3WJX7v8iasZ3KV8v0WgQWtqvOw8+NHw7EN9shgeKlY4liKGr/Id0aG?=
 =?us-ascii?Q?4kykT02OVqzPygb8ozkoP8Mw2P8MdH5tBeOQ0PpcsHu5k5w8+VvxabIU9TT7?=
 =?us-ascii?Q?p0tQXXnnwxTqFqQCewAW3l/j+TQ+UupM1YA5AqCjIEn18oiDS9Q9jWUq+AWT?=
 =?us-ascii?Q?h4MlkWhK1O9+c9qPkMzZtK612QbiAejQxjn4fbtGKZ4Ofd5QVaTe6JgZ9b0A?=
 =?us-ascii?Q?GHC/8XAsTI4r00za9g8aZYtG87Dmf0k4sqg9sIHG1QtVkKlYw4fr0by5BAfH?=
 =?us-ascii?Q?Z16Uk9wQPf4Dr1WdRu9LoOmaDDjTtzXo+E6EILXSn77e8AwXiQhFmV2l0wjv?=
 =?us-ascii?Q?bY9FN8I6isTZW9TgHDhHR6eT0vWW7HRdnPb6j6hevDLFJMsyGvX71QLyiqU1?=
 =?us-ascii?Q?nmCJgnR3IyEFBCuKogrTaxqGo80amnlwXnxnVZ9PBnRKw1A7fguTOs6iXkEg?=
 =?us-ascii?Q?ixydVeVc2R4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gdKDAm4N4pTsBm22TWsjuPqRsnBtBpu/VqU6O/+P4vwEgzMfooPDurNHooaL?=
 =?us-ascii?Q?EVlqmY/SeLiUQZoNErmlI+WdZI41ij1omOLEpFkj5ChlSYFL8/NdFRf6LQOg?=
 =?us-ascii?Q?3edfQiTJy79435dV1hFgsA821BpIgeLLX9Yu3pKNK1yS2WkuHAXY5GUnwg3y?=
 =?us-ascii?Q?CVXWyOfs8RyxrjErfnkeBikMySq+Ct0oG0rSvkq9+QPz9ZWAiqDTr/sLqJDl?=
 =?us-ascii?Q?gTnOr7XeFOzSPfp5iDvYN9mGFAgMGFl7f6TaZNIjloE6FUU5Xoj2maBhZDts?=
 =?us-ascii?Q?eNIUzwHPVZKlPIhc1oNr3PgfRvzyceKaCzoAl60uXQiSuc0OpkOI81J5VoBB?=
 =?us-ascii?Q?210/GR3grvLePlNfpKEyluCqGS/YfVWHe/KPOg6Azl6uGsC51gCN94i6dJrF?=
 =?us-ascii?Q?JG5EVw+ZquX8ymk9am2ASl9dJ/lkop1jLh7ziT2VlJSWXwUoe7qflh5+xGDL?=
 =?us-ascii?Q?iRmJTbOYqK4RIxuSnsBTiSYEsgZ4VvUbXyXVpm+5cvHZAKTFt2UqHh6HhsXF?=
 =?us-ascii?Q?QihBum/rgCyVxDE3uRJR7aazRetIW3idK/EoPsAgW01R1sNxeUUFSv8MTG2+?=
 =?us-ascii?Q?BOZt/BDev2MXc83VmBztNJvDskgvew3XJfduHQQCVYDMaBa2/+LGh4X7v4Ip?=
 =?us-ascii?Q?ZsZCh7yEyvqjGC7r8mOpOidQfLiByk4wTRQdx4SbGuNb+IOCpytiRxMIfkmU?=
 =?us-ascii?Q?cHQoBv8paorWwo602WSBT6VusHsZVMlZDGyYOKawDIUlExnbctXn+ocELUUm?=
 =?us-ascii?Q?p5WTeUb/151ujLrshhRQs58UQwbSezN2a0XJFIGRcZHMa/G6Wu5C1HhaF0Gr?=
 =?us-ascii?Q?o9FYKhYkjhLTf/Au0rJHImnSQX63noMuIrvM9upH+RO+VaglZ40khxRuCKad?=
 =?us-ascii?Q?/w/BcgP0fUA/PhP0yq0XpjeyXejAxAOkv2gLDxSS1VxsNT2tuUtExLewV2Y+?=
 =?us-ascii?Q?bI3mBSKtAQMavKaCNEELqGdRu31QI3Cf8c1zz84P59PEmuyBmX/TAsic/5SY?=
 =?us-ascii?Q?ZO5UUfsBt81HLKn5aHldwtaFMCbv7v7dA4xVg5CObdEnJSQjqom6KQknDNgM?=
 =?us-ascii?Q?Zs8aSatnpWLJPVjQ2dYdyjvQdPGpNegoS33iU9qNY2maDSUW21t4upPbUp1p?=
 =?us-ascii?Q?vZLk0+65yF1D6+uZTZZ+gwsTUoIm2WZb3vX88D3EX1rtX//jvbPLsK9KJ3OA?=
 =?us-ascii?Q?87GxCnlHpjTFi/h9RLKXa3umNdpOo1yxY1C7yTgbzEUUrIuIvkgMO4VI4H9/?=
 =?us-ascii?Q?H2dpRkOiWEzQ1J2JxMIefSQRy0t+PSJZE0RoNISA8FwnuXMCivZEBkwWlIME?=
 =?us-ascii?Q?fd3l6QDvoN04i3RuvVaKp7GoOaRdKKWgofEQ4+JUI8GBILc+pRkiNIRkXLBl?=
 =?us-ascii?Q?8jDwGH6OxYcLgSHMCM7zXAzphiMgf+OBfW4VuL9Hr8CJFvZTpd+WB1DtrKL0?=
 =?us-ascii?Q?lfeqtVAWiHQBv2CIQr6W7+7dwyHp9jQIdifZTq3hxWGxrdINkQExkKn8WC7y?=
 =?us-ascii?Q?FNzMx1Gbd+byBQKvuPBkTxmYmFTzEA1Ir757Rh1GCUrYaUL00SDxtjGRCsin?=
 =?us-ascii?Q?diCtZiAE5Y41YSTsPNJpRHp3LKNpr+bW0BzQDTIA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d1a806-aba7-4a57-c217-08dd0e8fc1e2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 03:01:15.5237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTa+79IIAvBybzHjtCveCkasEqL0TAB6pcFAEqUJuvi47S63Dr9da0SGxnV71eyLz8J167ay9J6Vt16Bn86X3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Define regmap for PHY and PLL registers, the PHY and PLL
registers are accessed by AI interface in controller.

So that driver can use regcache to recover registers
after suspend and resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 224 +++++++++++++++++++++++++++++++--------
 sound/soc/fsl/fsl_xcvr.h |  13 +++
 2 files changed, 191 insertions(+), 46 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 9c184ab73468..b77953cfaa31 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -37,6 +37,8 @@ struct fsl_xcvr {
 	const struct fsl_xcvr_soc_data *soc_data;
 	struct platform_device *pdev;
 	struct regmap *regmap;
+	struct regmap *regmap_phy;
+	struct regmap *regmap_pll;
 	struct clk *ipg_clk;
 	struct clk *pll_ipg_clk;
 	struct clk *phy_clk;
@@ -257,7 +259,7 @@ static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
 	idx  = BIT(phy ? 26 : 24);
 	tidx = BIT(phy ? 27 : 25);
 
-	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF | FSL_XCVR_PHY_AI_CTRL_AI_RWB);
 	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET, reg);
 	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_WDATA, data);
 	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
@@ -271,6 +273,59 @@ static int fsl_xcvr_ai_write(struct fsl_xcvr *xcvr, u8 reg, u32 data, bool phy)
 	return ret;
 }
 
+static int fsl_xcvr_ai_read(struct fsl_xcvr *xcvr, u8 reg, u32 *data, bool phy)
+{
+	struct device *dev = &xcvr->pdev->dev;
+	u32 val, idx, tidx;
+	int ret;
+
+	idx  = BIT(phy ? 26 : 24);
+	tidx = BIT(phy ? 27 : 25);
+
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_CLR, 0xFF | FSL_XCVR_PHY_AI_CTRL_AI_RWB);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET, reg | FSL_XCVR_PHY_AI_CTRL_AI_RWB);
+	regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_TOG, idx);
+
+	ret = regmap_read_poll_timeout(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL, val,
+				       (val & idx) == ((val & tidx) >> 1),
+				       10, 10000);
+	if (ret)
+		dev_err(dev, "AI timeout: failed to read %s reg 0x%02x\n",
+			phy ? "PHY" : "PLL", reg);
+
+	regmap_read(xcvr->regmap, FSL_XCVR_PHY_AI_RDATA, data);
+
+	return ret;
+}
+
+static int fsl_xcvr_phy_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct fsl_xcvr *xcvr = context;
+
+	return fsl_xcvr_ai_read(xcvr, reg, val, 1);
+}
+
+static int fsl_xcvr_phy_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct fsl_xcvr *xcvr = context;
+
+	return fsl_xcvr_ai_write(xcvr, reg, val, 1);
+}
+
+static int fsl_xcvr_pll_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct fsl_xcvr *xcvr = context;
+
+	return fsl_xcvr_ai_read(xcvr, reg, val, 0);
+}
+
+static int fsl_xcvr_pll_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct fsl_xcvr *xcvr = context;
+
+	return fsl_xcvr_ai_write(xcvr, reg, val, 0);
+}
+
 static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr, u32 freq, bool tx)
 {
 	struct device *dev = &xcvr->pdev->dev;
@@ -303,55 +358,55 @@ static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr, u32 freq, bool tx)
 	switch (xcvr->soc_data->pll_ver) {
 	case PLL_MX8MP:
 		/* PLL: BANDGAP_SET: EN_VBG (enable bandgap) */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_BANDGAP_SET,
-				  FSL_XCVR_PLL_BANDGAP_EN_VBG, 0);
+		regmap_set_bits(xcvr->regmap_pll, FSL_XCVR_PLL_BANDGAP,
+				FSL_XCVR_PLL_BANDGAP_EN_VBG);
 
 		/* PLL: CTRL0: DIV_INTEGER */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0, fsl_xcvr_pll_cfg[i].mfi, 0);
+		regmap_write(xcvr->regmap_pll, FSL_XCVR_PLL_CTRL0, fsl_xcvr_pll_cfg[i].mfi);
 		/* PLL: NUMERATOR: MFN */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_NUM, fsl_xcvr_pll_cfg[i].mfn, 0);
+		regmap_write(xcvr->regmap_pll, FSL_XCVR_PLL_NUM, fsl_xcvr_pll_cfg[i].mfn);
 		/* PLL: DENOMINATOR: MFD */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_DEN, fsl_xcvr_pll_cfg[i].mfd, 0);
+		regmap_write(xcvr->regmap_pll, FSL_XCVR_PLL_DEN, fsl_xcvr_pll_cfg[i].mfd);
 		/* PLL: CTRL0_SET: HOLD_RING_OFF, POWER_UP */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-				  FSL_XCVR_PLL_CTRL0_HROFF | FSL_XCVR_PLL_CTRL0_PWP, 0);
+		regmap_set_bits(xcvr->regmap_pll, FSL_XCVR_PLL_CTRL0,
+				FSL_XCVR_PLL_CTRL0_HROFF | FSL_XCVR_PLL_CTRL0_PWP);
 		udelay(25);
 		/* PLL: CTRL0: Clear Hold Ring Off */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_CLR,
-				  FSL_XCVR_PLL_CTRL0_HROFF, 0);
+		regmap_clear_bits(xcvr->regmap_pll, FSL_XCVR_PLL_CTRL0,
+				  FSL_XCVR_PLL_CTRL0_HROFF);
 		udelay(100);
 		if (tx) { /* TX is enabled for SPDIF only */
 			/* PLL: POSTDIV: PDIV0 */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
-					  FSL_XCVR_PLL_PDIVx(log2, 0), 0);
+			regmap_write(xcvr->regmap_pll, FSL_XCVR_PLL_PDIV,
+				     FSL_XCVR_PLL_PDIVx(log2, 0));
 			/* PLL: CTRL_SET: CLKMUX0_EN */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-					  FSL_XCVR_PLL_CTRL0_CM0_EN, 0);
+			regmap_set_bits(xcvr->regmap_pll, FSL_XCVR_PLL_CTRL0,
+					FSL_XCVR_PLL_CTRL0_CM0_EN);
 		} else if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC RX */
 			/* PLL: POSTDIV: PDIV1 */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
-					  FSL_XCVR_PLL_PDIVx(log2, 1), 0);
+			regmap_write(xcvr->regmap_pll, FSL_XCVR_PLL_PDIV,
+				     FSL_XCVR_PLL_PDIVx(log2, 1));
 			/* PLL: CTRL_SET: CLKMUX1_EN */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-					  FSL_XCVR_PLL_CTRL0_CM1_EN, 0);
+			regmap_set_bits(xcvr->regmap_pll, FSL_XCVR_PLL_CTRL0,
+					FSL_XCVR_PLL_CTRL0_CM1_EN);
 		} else { /* SPDIF / ARC RX */
 			/* PLL: POSTDIV: PDIV2 */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_PDIV,
-					  FSL_XCVR_PLL_PDIVx(log2, 2), 0);
+			regmap_write(xcvr->regmap_pll, FSL_XCVR_PLL_PDIV,
+				     FSL_XCVR_PLL_PDIVx(log2, 2));
 			/* PLL: CTRL_SET: CLKMUX2_EN */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PLL_CTRL0_SET,
-					  FSL_XCVR_PLL_CTRL0_CM2_EN, 0);
+			regmap_set_bits(xcvr->regmap_pll, FSL_XCVR_PLL_CTRL0,
+					FSL_XCVR_PLL_CTRL0_CM2_EN);
 		}
 		break;
 	case PLL_MX95:
 		val = fsl_xcvr_pll_cfg[i].mfi << FSL_XCVR_GP_PLL_DIV_MFI_SHIFT | div;
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_DIV, val, 0);
+		regmap_write(xcvr->regmap_pll, FSL_XCVR_GP_PLL_DIV, val);
 		val = fsl_xcvr_pll_cfg[i].mfn << FSL_XCVR_GP_PLL_NUMERATOR_MFN_SHIFT;
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_NUMERATOR, val, 0);
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_DENOMINATOR,
-				  fsl_xcvr_pll_cfg[i].mfd, 0);
+		regmap_write(xcvr->regmap_pll, FSL_XCVR_GP_PLL_NUMERATOR, val);
+		regmap_write(xcvr->regmap_pll, FSL_XCVR_GP_PLL_DENOMINATOR,
+			     fsl_xcvr_pll_cfg[i].mfd);
 		val = FSL_XCVR_GP_PLL_CTRL_POWERUP | FSL_XCVR_GP_PLL_CTRL_CLKMUX_EN;
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_GP_PLL_CTRL, val, 0);
+		regmap_write(xcvr->regmap_pll, FSL_XCVR_GP_PLL_CTRL, val);
 		break;
 	default:
 		dev_err(dev, "Error for PLL version %d\n", xcvr->soc_data->pll_ver);
@@ -360,22 +415,22 @@ static int fsl_xcvr_en_phy_pll(struct fsl_xcvr *xcvr, u32 freq, bool tx)
 
 	if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
 		/* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
-				  FSL_XCVR_PHY_CTRL_TSDIFF_OE |
-				  FSL_XCVR_PHY_CTRL_PHY_EN, 1);
+		regmap_set_bits(xcvr->regmap_phy, FSL_XCVR_PHY_CTRL,
+				FSL_XCVR_PHY_CTRL_TSDIFF_OE |
+				FSL_XCVR_PHY_CTRL_PHY_EN);
 		/* PHY: CTRL2_SET: EARC_TX_MODE */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
-				  FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1);
+		regmap_set_bits(xcvr->regmap_phy, FSL_XCVR_PHY_CTRL2,
+				FSL_XCVR_PHY_CTRL2_EARC_TXMS);
 	} else if (!tx) { /* SPDIF / ARC RX mode */
 		if (xcvr->mode == FSL_XCVR_MODE_SPDIF)
 			/* PHY: CTRL_SET: SPDIF_EN */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
-					  FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
+			regmap_set_bits(xcvr->regmap_phy, FSL_XCVR_PHY_CTRL,
+					FSL_XCVR_PHY_CTRL_SPDIF_EN);
 		else	/* PHY: CTRL_SET: ARC RX setup */
-			fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
-					  FSL_XCVR_PHY_CTRL_PHY_EN |
-					  FSL_XCVR_PHY_CTRL_RX_CM_EN |
-					  fsl_xcvr_phy_arc_cfg[xcvr->arc_mode], 1);
+			regmap_set_bits(xcvr->regmap_phy, FSL_XCVR_PHY_CTRL,
+					FSL_XCVR_PHY_CTRL_PHY_EN |
+					FSL_XCVR_PHY_CTRL_RX_CM_EN |
+					fsl_xcvr_phy_arc_cfg[xcvr->arc_mode]);
 	}
 
 	dev_dbg(dev, "PLL Fexp: %u, Fout: %u, mfi: %u, mfn: %u, mfd: %d, div: %u, pdiv0: %u\n",
@@ -416,17 +471,17 @@ static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
 
 	if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
 		/* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
-				  FSL_XCVR_PHY_CTRL_TSDIFF_OE |
-				  FSL_XCVR_PHY_CTRL_PHY_EN, 1);
+		regmap_set_bits(xcvr->regmap_phy, FSL_XCVR_PHY_CTRL,
+				FSL_XCVR_PHY_CTRL_TSDIFF_OE |
+				FSL_XCVR_PHY_CTRL_PHY_EN);
 		/* PHY: CTRL2_SET: EARC_TX_MODE */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
-				  FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1);
+		regmap_set_bits(xcvr->regmap_phy, FSL_XCVR_PHY_CTRL2,
+				FSL_XCVR_PHY_CTRL2_EARC_TXMS);
 	} else { /* SPDIF mode */
 		/* PHY: CTRL_SET: TX_CLK_AUD_SS | SPDIF_EN */
-		fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
-				  FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS |
-				  FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
+		regmap_set_bits(xcvr->regmap_phy, FSL_XCVR_PHY_CTRL,
+				FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS |
+				FSL_XCVR_PHY_CTRL_SPDIF_EN);
 	}
 
 	dev_dbg(dev, "PLL Fexp: %u\n", freq);
@@ -1206,6 +1261,49 @@ static const struct regmap_config fsl_xcvr_regmap_cfg = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct reg_default fsl_xcvr_phy_reg_defaults[] = {
+	{ FSL_XCVR_PHY_CTRL,		0x58200804 },
+	{ FSL_XCVR_PHY_STATUS,		0x00000000 },
+	{ FSL_XCVR_PHY_ANALOG_TRIM,	0x00260F13 },
+	{ FSL_XCVR_PHY_SLEW_RATE_TRIM,	0x00000411 },
+	{ FSL_XCVR_PHY_DATA_TEST_DELAY,	0x00990000 },
+	{ FSL_XCVR_PHY_TEST_CTRL,	0x00000000 },
+	{ FSL_XCVR_PHY_DIFF_CDR_CTRL,	0x016D0009 },
+	{ FSL_XCVR_PHY_CTRL2,		0x80000000 },
+};
+
+static const struct regmap_config fsl_xcvr_regmap_phy_cfg = {
+	.reg_bits = 8,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = FSL_XCVR_PHY_CTRL2_TOG,
+	.reg_defaults = fsl_xcvr_phy_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(fsl_xcvr_phy_reg_defaults),
+	.cache_type = REGCACHE_FLAT,
+	.reg_read = fsl_xcvr_phy_reg_read,
+	.reg_write = fsl_xcvr_phy_reg_write,
+};
+
+static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg = {
+	.reg_bits = 8,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = FSL_XCVR_PLL_STAT0_TOG,
+	.cache_type = REGCACHE_FLAT,
+	.reg_read = fsl_xcvr_pll_reg_read,
+	.reg_write = fsl_xcvr_pll_reg_write,
+};
+
+static const struct regmap_config fsl_xcvr_regmap_pllv1_cfg = {
+	.reg_bits = 8,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = FSL_XCVR_GP_PLL_STATUS_TOG,
+	.cache_type = REGCACHE_FLAT,
+	.reg_read = fsl_xcvr_pll_reg_read,
+	.reg_write = fsl_xcvr_pll_reg_write,
+};
+
 static void reset_rx_work(struct work_struct *work)
 {
 	struct fsl_xcvr *xcvr = container_of(work, struct fsl_xcvr, work_rst);
@@ -1421,6 +1519,40 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 		return PTR_ERR(xcvr->regmap);
 	}
 
+	if (xcvr->soc_data->use_phy) {
+		xcvr->regmap_phy = devm_regmap_init(dev, NULL, xcvr,
+						    &fsl_xcvr_regmap_phy_cfg);
+		if (IS_ERR(xcvr->regmap_phy)) {
+			dev_err(dev, "failed to init XCVR PHY regmap: %ld\n",
+				PTR_ERR(xcvr->regmap_phy));
+			return PTR_ERR(xcvr->regmap_phy);
+		}
+
+		switch (xcvr->soc_data->pll_ver) {
+		case PLL_MX8MP:
+			xcvr->regmap_pll = devm_regmap_init(dev, NULL, xcvr,
+							    &fsl_xcvr_regmap_pllv0_cfg);
+			if (IS_ERR(xcvr->regmap_pll)) {
+				dev_err(dev, "failed to init XCVR PLL regmap: %ld\n",
+					PTR_ERR(xcvr->regmap_pll));
+				return PTR_ERR(xcvr->regmap_pll);
+			}
+			break;
+		case PLL_MX95:
+			xcvr->regmap_pll = devm_regmap_init(dev, NULL, xcvr,
+							    &fsl_xcvr_regmap_pllv1_cfg);
+			if (IS_ERR(xcvr->regmap_pll)) {
+				dev_err(dev, "failed to init XCVR PLL regmap: %ld\n",
+					PTR_ERR(xcvr->regmap_pll));
+				return PTR_ERR(xcvr->regmap_pll);
+			}
+			break;
+		default:
+			dev_err(dev, "Error for PLL version %d\n", xcvr->soc_data->pll_ver);
+			return -EINVAL;
+		}
+	}
+
 	xcvr->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(xcvr->reset)) {
 		dev_err(dev, "failed to get XCVR reset control\n");
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index c72cb05184df..dade3945cc0c 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -234,6 +234,7 @@
 #define FSL_XCVR_TX_DPTH_CTRL_TM_NO_PRE_BME	GENMASK(31, 30)
 
 #define FSL_XCVR_PHY_AI_CTRL_AI_RESETN		BIT(15)
+#define FSL_XCVR_PHY_AI_CTRL_AI_RWB		BIT(31)
 
 #define FSL_XCVR_PLL_CTRL0			0x00
 #define FSL_XCVR_PLL_CTRL0_SET			0x04
@@ -241,13 +242,25 @@
 #define FSL_XCVR_PLL_NUM			0x20
 #define FSL_XCVR_PLL_DEN			0x30
 #define FSL_XCVR_PLL_PDIV			0x40
+#define FSL_XCVR_PLL_BANDGAP			0x50
 #define FSL_XCVR_PLL_BANDGAP_SET		0x54
+#define FSL_XCVR_PLL_STAT0			0x60
+#define FSL_XCVR_PLL_STAT0_TOG			0x6c
+
 #define FSL_XCVR_PHY_CTRL			0x00
 #define FSL_XCVR_PHY_CTRL_SET			0x04
 #define FSL_XCVR_PHY_CTRL_CLR			0x08
+#define FSL_XCVR_PHY_CTRL_TOG			0x0c
+#define FSL_XCVR_PHY_STATUS			0x10
+#define FSL_XCVR_PHY_ANALOG_TRIM		0x20
+#define FSL_XCVR_PHY_SLEW_RATE_TRIM		0x30
+#define FSL_XCVR_PHY_DATA_TEST_DELAY		0x40
+#define FSL_XCVR_PHY_TEST_CTRL			0x50
+#define FSL_XCVR_PHY_DIFF_CDR_CTRL		0x60
 #define FSL_XCVR_PHY_CTRL2			0x70
 #define FSL_XCVR_PHY_CTRL2_SET			0x74
 #define FSL_XCVR_PHY_CTRL2_CLR			0x78
+#define FSL_XCVR_PHY_CTRL2_TOG			0x7c
 
 #define FSL_XCVR_PLL_BANDGAP_EN_VBG		BIT(0)
 #define FSL_XCVR_PLL_CTRL0_HROFF		BIT(13)
-- 
2.34.1


