Return-Path: <linuxppc-dev+bounces-6170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A3A35796
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:07:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNQb4wL9z30Vw;
	Fri, 14 Feb 2025 18:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739516823;
	cv=pass; b=P17MEh97AAsexMN9reveZaeoC0Z0DkCrzZnSAK9QLIPaGw4t+KfNT3qPz1QWh9ulL4Y4ad8yqd6a0s9ljGU7Q8imFMWVPVtefq2GKyr8167pG3t9Pc7MS+y8Hz5wweWISgxLdzXk9x+42xhUsFKkSPW0YfxiFx5noPqRLSJ+303SoCeQYidd2wKL83pRlKAGbiAqcnmD6aY2Zu/j8n1ZdA8yM1MaZ9H/moI263ZY/oNfqF/gM+k0G6SpfCHKQXc6rxkQGfcb4LZjfZBkSSoNu4liSWzYmVaMShbT11TcPbwo0863vczNnAZpE4J4MbiepyeMRgq65lSufCDb5a9Klg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739516823; c=relaxed/relaxed;
	bh=efAk11HXN22wde0VDOjo5CKkbRMOplEvvLrZjDAgqlE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GdurlH0VhoXUcC6MjZZl9aY4in3W0QeCM6QqhgCAX8dGKp2Pp9fc+awS8dqWTHW11XhEkdcutKfiLOS4/FyLvXDoDF4vtopMS7KHEyA81Mhe8nSKtE+p1t4U+iAGhion1SFajmPNauMRNNorUs23HWB+gAECKSQ141oIltRbrvdzJZ/q9UVsLMwCcBFt7S0QzNIavdVo8skDOscD+662a0S2NY2u/M655gw9FkcKqoVN6XkYl3ivnfGL9hYp8RvpSQbLDJeNSp1ZwO0A9RrlvOAYc+Tc263B2Yja/sl1go9BmaVgFBdfB6jfrTiJeK+cT7hwloPAvMlaLoIVsQwE8A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=IE6ZydhN; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260d::62a; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=IE6ZydhN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::62a; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvNQZ2f2Vz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:07:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmLtVA2RhsrFKf0hQIoiKn07hrgKvdtTc+TntlRIiDVmPasxDlbjxz9Ygy/h7Xaczhq/xUw5K4qMMIJslnRosQAxfoUrigvqJVboNV6qCY9prqAbdHi7euAr1p+zKFyV1kXNXNr6O7kaQ/nGn5zosQZZ623Myyg7oDlCELswSbuXnWVQg4ERhkLAOK980rqrk7bCKLA9L9gnbWSpHA7ZJeaDBj5GBUhq63d7nfIU0NUhDaiBOc8hSdC9Wp+/K4oSNw6+NaIqQECUL8Ctxh/KweCfcWYe8MC87x0bvGKR+LLX93VhYf6XGyEJ6jXMHc3ooE5V81Gv/zdJzzJYLWtfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efAk11HXN22wde0VDOjo5CKkbRMOplEvvLrZjDAgqlE=;
 b=ffyzXVoDdMLPAK2piQPxt9hfmON0bA6nOkso7E0GONH8rCtyntb55JC3KB+QJlKysCDRTz9O4wgo9OuT25HMAT+YW27h+9MRjflsJfI6ru7kmGvba6DvcJ4R5NtSD5fxPVc8Wl8XPk0887zXz80hWXQ64KW0w2fF6HX+wtARFMJRbzZqze8w9YJi6nyGOd0YGsBuetl3Le0XHQKaMKa5z4ecjulyGRKC4cE3VpU035BtxUzTYgrIxjK+yv/64rk5gc+NBrBoXXb7RvFNUJj8EmIvz/cbZ29o1/XjVEyjHLybG8eZ4TNPHXBcYHwlMfN3d1dzQA2fk5IN1BOh+xmy9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efAk11HXN22wde0VDOjo5CKkbRMOplEvvLrZjDAgqlE=;
 b=IE6ZydhNn/KBW1xYSwj/dnpt/5iNwBJCDOFyo02yBIDLpRsJxkigPpATwEAt8anDr9iFpx1zmFK2fhr2kwxCr6e/G0KKjWHnw99YbPS2YE/Y3gk3CByQ0NAueBYsyF6JpAZ3ihU15j8HDgi8qGgMA1gDKzonApSYwgcM6Fws2XtjXlnsAvKIddOq4b4TKh1dIjTZ8mu/b/qa8VLgLM5bEdbyN3tTKR/T7h57LxKKbQT6hwa/Hu0DeriyCyvqBWS2TmB/hlMsF/B/NB0ghrHxdbNB9XRakJnckcyoQd1a/Q22ZlU8XZ6KO6CrUEUSntLjoWyXKuc6tkSkmCIbGzVyZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 07:06:43 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8445.011; Fri, 14 Feb 2025
 07:06:43 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: imx-card: support playback or capture only
Date: Fri, 14 Feb 2025 15:05:31 +0800
Message-Id: <20250214070533.2808496-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 664082ea-ad2d-4b23-f5c9-08dd4cc622e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hbU9EDP6aCujpz1EsFmFOp6Ygv7HQfd0TPCykEOYstzpg1d9QYqKxlrFPncd?=
 =?us-ascii?Q?ymNq8cV0VnSCXTkg6yddHcnkp+03GC4rbHmR6U6Og2Lz3akynfXeVYXQCM3t?=
 =?us-ascii?Q?R1eCQ5ACDEF83VkXF33lte3UO9PZRIP/dPXekC6/XTDzke7P3Ba2qRsdjuos?=
 =?us-ascii?Q?LPuVsYxijz6qJd7Kaa1fgB985VGW5ryI4qulRUWWU8jYjcemwoSj061PZhRg?=
 =?us-ascii?Q?yWvSIOUM9qLEn46Vd6guSe/wJhfCdKI6jLMdPz/Zf3QUd9UCHSbClgik1LL3?=
 =?us-ascii?Q?9TXmoVhXoZEXfBaIoxTKUKeOdU+/Qx8Jnw7sFreNm2Ub/AtP7OpbhQmRcq9A?=
 =?us-ascii?Q?i5Lox9w2jW0hoeCyneA7NREzaHt6lE4oGjtdlyidYhFpewraRGI610ID2wbn?=
 =?us-ascii?Q?1gwfjQwQB+ieGZOfDhNLSiF9ZBGqSESgxo2B6HD1IOG13i7OZ6TFIOrMqC56?=
 =?us-ascii?Q?KCAhPtb+xqE6qOSGZ6ofUYEMkNm4+UTnzzstHHPRFmLYZO0UOKwQvLMAGEP8?=
 =?us-ascii?Q?OBU3oPGSyzWs0vv7xw7A4ZI9aQenn5xwa/ncaYkTxaRmK7yN2PSu7ruZOmws?=
 =?us-ascii?Q?dRdoagGmEuywxLZ+9Kr3YoWYko2g5Xud/jo2ySmQ49NbGeFbC2QDsKWSs+h6?=
 =?us-ascii?Q?V7vynWdQnijXRFxzYirtzVz8CrUVMOqZ8kRVHdbqCI1jbEqY+l30DSpovcyG?=
 =?us-ascii?Q?IFbl3kd/J+H1bdb61R27ae05mosTNb+T0MGtlOTRBWoPvGvevrjYmyPqDHbK?=
 =?us-ascii?Q?aVAtEOuzODQmGg9ul/Gim+8aTOM4wUPC7O6bbBUmm2XwUx2fPBpXiZedHFbE?=
 =?us-ascii?Q?Fx08zhaxF6Vp2uXz8dZqREOvjrK6lEoQ+EW553n3Dedghnkw7p/LALqMmcyR?=
 =?us-ascii?Q?lZ7ZCNX+2HGOZ0roODF8cl/IjjmWnaiEbdOiocx80yT3W1Ts0TwQxdSiTpFQ?=
 =?us-ascii?Q?RkCMepvVox1EVnXaTmrFje3cy6mneqWUbeCAq7TJSIvDblxYQG/xnOxU1lXp?=
 =?us-ascii?Q?CEEiHy6fMgcXpHyyDki7AxzrGl3mq2YIymIgCSxA85A0RZh8CXJIotzgbvxd?=
 =?us-ascii?Q?DO6JT1oO8d+nPWSIbpDOpVXv3UBdXjAePYXaAmBoeeKgTGORvMwOt9vELmMV?=
 =?us-ascii?Q?8oasst0sYTuSAXPo3yy5mcXUjhJivObVNglEQ2RWPrq4VKIDJ+7MY12pOLdo?=
 =?us-ascii?Q?KPIBCiQt64ID2pADGZuCMPjArq/xG9UnHhdgVZ2OGvfBru7k+teYrQo/89bq?=
 =?us-ascii?Q?moNth8/VD1mFvISoA8874FttcLzksNNRPmACVc+MYdS4yja40t8VrdREbtTS?=
 =?us-ascii?Q?edIxQE1WDqXDKAs+fM18hWMUoOTC9s7jwbkUpaeV6/CtQFuY9Z6yepNvH/C5?=
 =?us-ascii?Q?Zy1zPdJELeJSXQKceZTQphDZbjTuv311xlO33NjCZ2ZF3jo/rR48h3dwbOQv?=
 =?us-ascii?Q?T6z7y/nQu/y7BtZpcQ1YfJ/xs3agxVERU35YxxLRo8PH0ckPIsFr0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a+9rP66tSgbP7yViHJwuj4l0DhleD2BEp51ZVVmae8NUzQEwXc5TNaNlKgQM?=
 =?us-ascii?Q?0sWezDZblwxI/EJmQH+j5u5GB5do/JKEh0e+ieV16glSH18Ajtsc4mLWkVQW?=
 =?us-ascii?Q?MKjKvV+++iz9G0A9HDbBeKJd6x4GuF4y7MfZZXs881dTbgTk3Krhyvc9/+LM?=
 =?us-ascii?Q?L3dJxKpsGBwgCEs1h/m49pIeqWWlDPULu6Gpmy631mWheG9hL+p2/Pi1cyBf?=
 =?us-ascii?Q?VFRj8viP+bOnsyAjWmXdIn6VJHmBm4WC0AApDt6AWkez6OBsbpqLMXTHjRLZ?=
 =?us-ascii?Q?t8jioFVXIV9oO/fAYnfDDyDEWHynmHJ5QbVJNK5a6ON59R8GwWziHyjzH3Im?=
 =?us-ascii?Q?7ckC1QWHp0jhKakpN2TQw4eO1nsI1YYlUU8BxDz4WFj4Xd2avAmhmczEIPlE?=
 =?us-ascii?Q?/e8PS5W0G0e2xF9ezp88ns8bR2TdcmOGlVeXwKMIYfGgACHUJs7zL6A1y5H7?=
 =?us-ascii?Q?0TqtObaY/+0dS4FFpZp6JfMRx2Bmb1SLD28wKZob2vHLqBzDefJsIRiuDQxN?=
 =?us-ascii?Q?5wsVfrjxKwl/HwjbihYdDeUTnWx4tEzJ4yu1NWJjykof12UppOp7jOn9XBNX?=
 =?us-ascii?Q?kpBjebAZzV5OpBIfivCqpodBuUyMKmxF732IKryOgLk0F++fLH4rL4L2j43B?=
 =?us-ascii?Q?XW5fbLW+s3rAG+A2ck72elvE5t2Rl0sC7JiZaNElF2LKk1CimJy/xw9QTSpC?=
 =?us-ascii?Q?f9hhaAM9NphC1N4/8T4GPP6Wn5O19yHIJaOz6o0VtFbQslMFoij/Wo1+LNiI?=
 =?us-ascii?Q?1KvZkIL6eROIbpYG5HKajGco/jglMpLLh0PmEleeuBfyzfoCfkGB0v73x4+R?=
 =?us-ascii?Q?1hGcfQ/nnx2ZT9DwXvDazf/rOFggm8R01SphsuMSxC91TmuIzbXe5/R/X+XT?=
 =?us-ascii?Q?51Ypi4aqdiUMgq3xzL7Apjh3LDyWZM1J6v+mgHSIg8Sq9m89Cv0E5yAdBZHc?=
 =?us-ascii?Q?sbmS78eL4lo193mXXhdZeShx1V98QdrYRcM4FW27wdxnYVXSX9Zsz8YSGj5F?=
 =?us-ascii?Q?37e2+Lp1o3HxDkeKxE3fbFWeFMwpWgJgSSLxDW1jqYXkjXGZkmUkwYjsLrn7?=
 =?us-ascii?Q?YlfvogJ2wYybTGU9aSGCAlv5i0Cxdxf6kLDjnGHqAp5FG+Xw9qUt+LOCvC82?=
 =?us-ascii?Q?XwdKL/hhD2wFxzYu9xioFlQ+Wym9bAqNlkQqs4omc8XPy6aVrDeuq5qgpZkD?=
 =?us-ascii?Q?B2TlgDLGvGiyJuE3gzncMJpELJv/qiHwS5OUXVD9ZBH1scST427hVaZulbmu?=
 =?us-ascii?Q?CW939LzD+UDk8uA4y0sLVzKEdNOTx0mJEMB8PvEh9fDQrvKOnbboIoW0qm4M?=
 =?us-ascii?Q?WduO51fXN4XTxZBopU8wKajkYM3EA5fFIyl8oIZj2lOaKdiWQhrID7ffagXl?=
 =?us-ascii?Q?//v36BVYvpxwQVKkCMU3QibNfr1i5r8vJH7VMjl4AccmMlfKmjb2+bDjcu4e?=
 =?us-ascii?Q?jvwpoZjDraPuaRo2KPGhf9vdkfz7YkIo4VqjKEtTuTCXExS8j/r0jje0qLL/?=
 =?us-ascii?Q?pDtKLEspq12wppR+8L4RC7HfY10A+jTwmzCdKgfLC5o2pbs5y9bgUIWsI1wr?=
 =?us-ascii?Q?h9aAw5/ALhaJGHODdKbHjFLClNeVv0dKGbU7POHv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664082ea-ad2d-4b23-f5c9-08dd4cc622e3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:06:43.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCwqSguCvItiCj/wwbG2kF9ucdrlFDCDlcDWyzbAbV+MozVtv4Wcn/45ZXrRkUcJhSZZJqFxzTnBj+BQKVaiWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Be similar to audio graph card, support playback or capture only for
imx-audio-card.

imx-card can't directly refer to audio-graph-port.yaml, because it is
not based on 'ports'. Add playback-only and capture-only property
directly

changes in v2:
- wrap at 75 chars for commit messages

Shengjiu Wang (2):
  ASoC: dt-bindings: imx-card: Add playback-only and capture-only
    property
  ASoC: imx-card: Add playback_only or capture_only support

 .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
 sound/soc/fsl/imx-card.c                                  | 5 +++++
 2 files changed, 13 insertions(+)

-- 
2.34.1


