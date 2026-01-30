Return-Path: <linuxppc-dev+bounces-16414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IlkBUBFfGnfLgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:44:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3455FB7646
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:44:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Q1k3zSpz2xjP;
	Fri, 30 Jan 2026 16:44:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769751866;
	cv=pass; b=PLU3R9pfuGD5qUDjFXoT3gFPksIzbDPLnumrwJlW36AjIGvFJHzBni8+/CCgSv00RwmTQXldMqJeQrBbBNMSfXk+hHqo3zGGHWmhOVp4JFJhSfFM6RTr5iwyajltwI2cHcWLB3keXC3H1WnYfckF+Njqku04NTy3pW1Ve5R2fo5YcmlXbBX1mTtVecaMLAaP76bpSRF7mzYLxn4OvEQe7jBqkwwhtSSkuog+X5Y+BGxODbz9dq4gPCZyAdc+DFtjZJUT10ZHJ7/aTChYBTHv1+s36AU3GsIsNIfs2uvJkdp8vxCl8XxAM6MADCT8q4nUjFxmdpX8DumxOVPdiHXetA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769751866; c=relaxed/relaxed;
	bh=ooagwC2WOmSKBDp+ojileLXUAhCwPsXJr08tZgBfh3w=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hK6nNc7kPgkanLWj8iO1Ah6uHGcG5625wdR8As8aGfql23rHDLocBhwKGzRfKHNwbEhbCoupbxSIlBP+BjjjlZ3S8TrsLYcvmVX8APaJAK582kO6q/f2tx8w1PnDcKUF7HFoVrHUHrjzodNWAONQZRCddrnDXDXNAVbYnMBmsrXqWBz09b+PLesakeeRoj6XbO7alVu6921T3S1FILT8RXOJJuUqvG+3O6gAMg9YOY3Y4TAY2BLF1oihgz7eW9+TDOO+1AYGEa3EGcJZmUA53yRc88Xns7C+3dXJEXHaUalDgU4nfLM9mHgJm8qSkEgsdgPq9rqMoTaoR8UfpHx99Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ud6xcpSi; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ud6xcpSi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Q1j0XQPz2xS6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 16:44:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGsMdif8X/HseJnnlo8fAjcoBy1DV0mmuwFINUl1RIpTctHi3WSrHf9LSDjEkAJEWinxWRJNp2ta+QnUCEqzu5/iiArBGCMgi1vNCiRQOMivz4iZnXmEtAg0TTs+MXquKPLC8OzTQ80R4TLtoqvtXsqSxpHS1FAlOJKYhY/dT2y8Rt/taQ1i6HazjmRPi+uKxtBX3UrEhttutm+Z03YQ91MoUuQd9hC5M22zG/Eup7lsnFICIc4FoZH7Mu0tfAacgOHoGZoNw+RGe20qSlLG4l+jVQslRz8/nN5ZPp7RsykkIWTnnvhpqrQ/2uGOyVqUsxB4UtRGnMl2BQWkri2QlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooagwC2WOmSKBDp+ojileLXUAhCwPsXJr08tZgBfh3w=;
 b=FuhZlLOVpfM470Pk9T00L26eeaLc5Lm16ktf9Vrt3+F6gPYj8qiIvl3W7lGcS+WCyWMXNMT/bFmFgUwk4vShr3vuf/LLlkUQNTKpN0bv7CD7zgPHenxIPbrRLZtqzXK+yjjwril4Run3OOkulpNXCO7h1x3T/EXKcXKB4dFxaojMrmeMcMo/YPQKE1Bn7Tk8rZs5rUq7g1MhmVIx2wj4X99BUaTotyjooG4DbBK8ez3CZRviq3OHTmPmoVE9bXpOL4djOEzyum6eswAd3Ot+vALqf28XfA3yfTFtdqmiqcRhytUQAdi0boeQJOqSBfwKsneIS3Lsips8G3z6N3E6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooagwC2WOmSKBDp+ojileLXUAhCwPsXJr08tZgBfh3w=;
 b=Ud6xcpSiBz+qSsJBRP+FuwGmA+KVeSSSnjni5ZbxgHmdiLSetoNNkjFHTtRC4gQ62LpbdmlS6jlUg0tupzyFptz6Dw28QD9LRVPawIv0O3N/FwTUY4wyWpmkZM1ju27AeCjD1m3tCCs5E9V5jlYwhEn3dNOlFUGDrqJIxjLxP4nnYRkhr4ASZo3knrcBPue4/reEhPE/ZY7DSRsK3vCDpZ9KM7x+URAmKtJXhsYQoj57Y4gThXQM2xJ6Q1wl1GFHwQ2yixCJPaV9bmiCq7wc8CWkQD5WSNh4eDKP+DjLXAyvJkdYNNFCOwvDEVxjdu6aIBZJnYEvL2yK4/b2Skl2Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7277.eurprd04.prod.outlook.com (2603:10a6:800:1b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Fri, 30 Jan
 2026 05:44:00 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 05:44:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] ASoC: fsl_asrc: support the i.MX952 platform
Date: Fri, 30 Jan 2026 13:43:26 +0800
Message-Id: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: d821e073-8f23-4233-efef-08de5fc29142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mnJD/MBxLSojd5fzyj0aju8qUug7b/GV72f8p0Cm2paxNu/6qv24GbQJBTb1?=
 =?us-ascii?Q?vbY/dtprpmVS3x30ENEiZ/Ey961y2SfAWmtNKnBzVwjATyA9/fcfmMF8RAhv?=
 =?us-ascii?Q?8zKN83LgroNhMPHlQJjP2fvc0qYU83RxAIfQE1t/nCW8dV2WbqF9SN1jWYCU?=
 =?us-ascii?Q?YF6KThbhAMTK8qTD/b2U/huyQs/6W1lcsL2h0SEQCPE/3vu7icOfKcFjNhNc?=
 =?us-ascii?Q?icWYnCpwdeQx2OWit85D6d4hpYUFu3+8LGFu04hU10cg8fFeuq+w4bM9qnm5?=
 =?us-ascii?Q?BjiiJ+7WphAYUpVo7okpnuHoQJXETKyKGOtmsY3eLvj/v5K1cA7de+66Ywjs?=
 =?us-ascii?Q?kkv775WMta+gNtgd7dUwtbphrAUJSC7Hlr/QB4xA0WfDDzdVyhnhA+jcUd4z?=
 =?us-ascii?Q?lqJJW9RjiIHMz8E+ckqweGsWWF5foEe0d4mPtKmHrGMM1Ub1WToeyJtgqhaj?=
 =?us-ascii?Q?65/SfQ8/rYrNFVkpLx6asDd01KuRsqm2lrg45fXSDf1NEk7yUisHPZiEj9ak?=
 =?us-ascii?Q?MLq+K4wOuJdb90BaSQRh4fVu7eN4lJWGt6iD1qwoewdDniupSY/HMQLiDyjc?=
 =?us-ascii?Q?MuC2Zugl6iA1Fc1Y9b6s1mp/HU3TRpM7paw4fM+I1T8GFuAeCvQUrB0o4b9P?=
 =?us-ascii?Q?RQRQ/H1KKB2TvMhLEVzK//yGcQql8Psqi1aPtF/Uw/3JK0Rv/QSWT/Wdt29X?=
 =?us-ascii?Q?WbD0b4RCHhEE9Xs4pbuUGB8RLgWZhvMx35dxXL9KYTF3D+mQSfNnyRJ2ZAZ7?=
 =?us-ascii?Q?5xavhw/wh9qSBe6mSKdymyxAWMPwSLEJKNx38HfcNXe4Nij3zpwEQGcMzYx4?=
 =?us-ascii?Q?/MH7jputlVqfpzg30XBI3cq+3ErLPChSLIWBUZ7q02asJgOuis7NwsFDm18c?=
 =?us-ascii?Q?p/46emAM4oLeetK9UEbTHbig/yIV4Bm7UIbWEgGf5zPmXoL5rxowQd68F8Tl?=
 =?us-ascii?Q?GIED0Ap3gtoDC6gzqhGP6pagvugH0okjenOHmxEJ9N1rR9J8Oe6LlZVHXCaR?=
 =?us-ascii?Q?+MSzLyjOqdyB1geesCvHGuUPItefP6zj9/tVjdryVXj9dPb6w7hqL90meKfk?=
 =?us-ascii?Q?nOqb3TYf83xSKHOa5foaF9VhQp0VE3dxat6cMzXvcKA66NV18AtT5FECuhm0?=
 =?us-ascii?Q?tkvonRZ0ilPpgsOslyUEZj62pMzVxqHzVX9ZPElay2AhdTEIqENlCgGU22n0?=
 =?us-ascii?Q?Qfm/Yh4b+T83I2/XTKiVQ+0HmGyKjG8aB5Rcs3Gz1HQ3zhL22nBNpT8HRXXP?=
 =?us-ascii?Q?LH5xTJPVHjxd2t5GqEe4U3SFXm9NgSX1Cl1TqAAw9JcNMYtKJjHMh7H5wXCe?=
 =?us-ascii?Q?mf34hIqmCvqyospMk4c53jcS7ti4b0ywCw86wCu79ThIyFKET2ql7OgYW9re?=
 =?us-ascii?Q?RirVcnFkMGclg9tlrEMqyzZ7wWFU6h78/nEniqy+m9Fm6pBoFoqGoViQdpgp?=
 =?us-ascii?Q?YJtGWXFVsniI0FW7hNt5YYp88PaoPG8cq3BhGKiymblVqlLOTnnJUkxaVV/M?=
 =?us-ascii?Q?+1EZ5TXKz7Y18gLAU9+XVqwa120y0FMTrT8RcujmEDhFvWQro0hs+sPW4tSd?=
 =?us-ascii?Q?2DnOAZMY1Nr74PW0yNDmykQTXUIBvQ+9cl6Gk0SJhAsFXgyqhHh0i2UxpqLx?=
 =?us-ascii?Q?5wYSr3XhVQ/7eyXVVgUEVIvcclTomvNObMhDfVIBgIfp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HC2IQmf4FxRD3uHdKlR2JU1x0QvK1SbIzrOD+nKEUU4MxCcwJGYPcAx/9KCN?=
 =?us-ascii?Q?EnKrUU9kTQY10WE4pIkmnu3cdupbjjxgMZIadk9k2nXnwDDj1aTLWEyD6qsL?=
 =?us-ascii?Q?wcw5NyGeUK5abxCh4aGSzoFOOSh2qL6TWbarpUoBHXBRFPFejV4O+iqQE0Ha?=
 =?us-ascii?Q?i26VrOIb0qpcmmnU4MpgG3KX7b0UGM+xWdqdygp0yDTNSviPxpSDYB9nEtRr?=
 =?us-ascii?Q?ulDHxwX4UXB0Cru7b9o3RmETpvXKFP5WkOHAHWIsQTkZoaYvPeHEBWx4p3PH?=
 =?us-ascii?Q?DsVc9qkrDYEIVwjJRAMGN+/EM14x+sWhtYzCuKE2XHTp7jFvJ+jqmy0YHGsv?=
 =?us-ascii?Q?1S2SCjZp5X8VMVoMuK5OFrcXD8uroDIsV0UZ0eA37z0mZpfFMYHHQa8AmcLI?=
 =?us-ascii?Q?YK3nJhwVDwxKu/dF/LWTxRxCqrkwLGPKwKmbjobcMryqO9130JYILf6mi89O?=
 =?us-ascii?Q?CfcDlP+zLIWFhRvWc9+xKKPxMjYsIK7wJq69O64AwthYVODWuG6trtee6Xvo?=
 =?us-ascii?Q?HARxDR52ANN0k7fF9NNbJQow/wfeZdkK/fTeqLte74nkUR9+DNXURvvE5bNR?=
 =?us-ascii?Q?wDsrOEQfML8dG5WzH8ZgSCkqg3caeLI4YcsVGocDhB9S48ALNK4BmLhMoTfE?=
 =?us-ascii?Q?8y5xL+Z91XWiB3u1xLWi7glxWr4zZZGP/ue9oqfxb8TsmnMiCbUoH+dvVpLF?=
 =?us-ascii?Q?ybpUnEXj7nuUGv13L3A2cXJ/5jT/AMVQY9a/Mga8byTZ5B7oi9L9cWFvGygq?=
 =?us-ascii?Q?sSBNAmkussSSGY8tZtqxOxu1pmfeS4YCePz1SA9eHN9f+iLwCK9R0DKiNIM4?=
 =?us-ascii?Q?AmiD0lRsF5NE6VjvtjcF2X4+2wPZmsqSiMl5Pcw2NreEcahhnLTpHW0A/Zlz?=
 =?us-ascii?Q?UDPPKAeSHkuKSd0bp+yytvY+AuPw3i3nq37jkT+PBSYm/JABS3FXSytaFNTj?=
 =?us-ascii?Q?PzMDtaHmrCOslT2pSF+z0MnRdA40zPMhV5OgsQXj2LfeWYdVt7GCZhNa29lJ?=
 =?us-ascii?Q?J0mCbMIAI/qCvxsS3bm5CCCiN+x/iuNOpQmFVluNJR2ZYIt9VlLH4grXN2FL?=
 =?us-ascii?Q?pmHZRpwU+Mpj0+9gdDgIkVmAe3tMELntpqij3oFwAu+/2rmugnpD2YegDqeF?=
 =?us-ascii?Q?d3A6gH4jgOzuXWAPR2Ns1Ofway61MYZN637vXyBgRVNvi40V/Ddq+bPs1Rge?=
 =?us-ascii?Q?aqLU3FLWWVRPEkFUdavzS7jo3UAfOBFlrQiD/bX6trMP+3KrHP0SzO+NAilR?=
 =?us-ascii?Q?xQ62k4BUe/1E3O7N4t3ns73LeHWdiOtxf0iF61k3hgkMk3ib3l1t5uT78Edp?=
 =?us-ascii?Q?freCCrYbSfDmOjDxIDHFHiWmXM785ICvUxnoUZD0Cq86Hxh4Ne18Sky+EkNl?=
 =?us-ascii?Q?vgXS4jYyOnVDxbkBZLsyWqh+KzTkTAYm9FN5XyR95hQyNvbBYT/OEODpXr+y?=
 =?us-ascii?Q?95HJZvD+BoyUV3BFc278Jjv/rEo2NOAfGrL+IxzM8mq5krFmVcnX4qOuvyYK?=
 =?us-ascii?Q?8itOq6DMEoPdAc1BxDfKBY7aMcq+MDHP3D0Xm5ksXfIe8PxMeHXyzfBaTd/F?=
 =?us-ascii?Q?kEuI8vqa5zAoJMKJjTId0GcU9c+KwG7t6xyl3dRVubl9PDJ1Z54gDvRpJQ3l?=
 =?us-ascii?Q?dLwFNAB/rc1P6GqSQfOLkde+LZ/UKyd9AwzQhEtnVVR/wsjxrTwt/pajD/hP?=
 =?us-ascii?Q?5fQmOP0pUwEsWNRLbbAD1URbq6LvaMS20dzpQJKNjiE00Bzs2jbYXlDshmnL?=
 =?us-ascii?Q?R5+XrICuIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d821e073-8f23-4233-efef-08de5fc29142
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:44:00.4098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zsptn9D0RNZ9cw1FRL2MBIWtLQFcHBJ80dwjrHMouEh1owK/fRHlP1IT3sRaio4GA7JnPHGpC7Bjmr3yyMn6ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7277
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16414-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 3455FB7646
X-Rspamd-Action: no action

Update dt binding document and update driver to suppot ASRC on i.MX952.

Changes in v2:
- update commit message for add more infos
- split original patch 2/3 to two patches: patch 2/4 3/4
- use size_add() in patch 4/4

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_m2m: Start ASRC before DMA device for M2M
  ASoC: fsl_asrc_dma: allocate memory from dma device

 .../bindings/sound/fsl,imx-asrc.yaml          |  1 +
 sound/soc/fsl/fsl_asrc.c                      | 40 ++++++++++++++++
 sound/soc/fsl/fsl_asrc.h                      | 16 +++++++
 sound/soc/fsl/fsl_asrc_common.h               |  4 ++
 sound/soc/fsl/fsl_asrc_dma.c                  | 48 ++++++++++++++++---
 sound/soc/fsl/fsl_asrc_m2m.c                  | 29 +++++++----
 6 files changed, 123 insertions(+), 15 deletions(-)

-- 
2.34.1


