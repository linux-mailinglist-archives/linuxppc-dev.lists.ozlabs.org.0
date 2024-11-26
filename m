Return-Path: <linuxppc-dev+bounces-3563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 885D79D9164
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 06:34:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyB893RYBz2yjJ;
	Tue, 26 Nov 2024 16:34:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732599241;
	cv=pass; b=NHPJOWr0sOr4DKzpA51Et0Un7Of6Eh9q/EH/4D1lcMTsuCp+9X5tsGS1AKjkIVaWj7knoZv4ZZ7JMqUXj1mOJFF5sc8OexEfJHnPWMVlh97/hEBFMWZCT0GhbaO25ZWeLyt7aHsI2kne+rO4oGkXXxzgHk6GaT19qPDe0wmbPURdBMbQ4ZJ5BJxDxOP0A3TSpqT1auEYS4kURpwbNn/9dEJ/0VkvjS8GwmMVoNKkepJfX7TIbVq4bftLvbzuYZDKe/0g6H2DbjDcwGjPpMXY3aw2+ndhKfuD6I0KiPz1fT1mIudMIIEB/REEB3mpbLRnsAhdcDDoP+V2cpC28OHIPg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732599241; c=relaxed/relaxed;
	bh=fKlp7jfKZr0CIv++v35q0PqUfQNFbhf0EeU8Viv7P1Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dQwzEgGSMCQa9nzw/5V5p5/oga3mDx7HPX2w28D3t5PSkIJlSaeC5F27QmCzsGGb9Xgx3D9b05tOxKbmaezCB8n+Hdb4uYyQSr/KI2D5nUVLdHkHPGX+WYlPVltO5sLmW4Q2J4w6tAY5Xnmx0NIFknVkC8kWPuTFgpQZ16mcaSrP/mMFBg7FhX4kSHNvGrthCCdG5CMCLvfut+h6VnmMHCP/TpqkxpcIeqeaJ8skdN3inRW8nD8FKaGBHmmGGzsz98h+Pnu6vzRpKsSt1bHgagHOJpxsmrVeu+412CjfbDkFDAloPI2aDoiFSGmd0NAwaI98AjBdI3y9nczUCmM8bQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=muW2Waco; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::615; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=muW2Waco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::615; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::615])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyB885QM4z2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 16:34:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mf28WQY351+jziJ+U8X/f8xRbgOTAR2bRyibyNKaIT0V5zBMVL3fAapsx9kFc7VEB/0iBskqDPu/IpnI1t5TwQVuRcNwBIyn2RXpSbsRv1ui13iU39+5pTTx8RMha/qe2fZXNEY6Vm8H7C9AALEYPzSSz/QeNjqDYyZIpfi+SZsuUpwkN9CzIOEc28lS48Z7SzHsoHXkgpXQ0Hy3hcGn6oPe0bY3E/h94kZ99luJnebjOowXmEwK60cOunonAkr5LbHm6MMCkZLm/BQh+AVV+nGITGx7hhckH8CLzoEO0keeCF0HV8zIrcFEjHOhbogNDyk/hbCEgzNCWKi+4UBl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKlp7jfKZr0CIv++v35q0PqUfQNFbhf0EeU8Viv7P1Y=;
 b=zHoiOIdDtvjssEv8d6hAWlEXYJkWcrBBFNEBWKynuufdDn9MtatL7LdGjzXfecliW/1dA4kGoGujrgXFwzb978HLFauEIHptUNWKP7BboxkEz0nnppSlJ4VVhoApBkQbpI2mk02I91jb1Y3Qk7zSCNsxorKm+1Ae9hxn+9CBH7LI5f5EjjWOC+hTbuCVVhZbZtCq0ujyO4oYDiUixRnXn0YUnA5zB4dNPZtkRd5eSZKwDVZpbDE20gHzMa/ezsk5EwEV24AcpyDN6MqVl6e7u2boAo9oXZIex09WIrODrFPr7O06VlBp++9ZGrVKJYMERMrKnMYQ3ETIid0x6VPFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKlp7jfKZr0CIv++v35q0PqUfQNFbhf0EeU8Viv7P1Y=;
 b=muW2WacoQ8dn27T5+gTK6Pbk1enEx/+/ug8Y5krHgKzBjaeDSMxVSQ718QiIHkJL4/T2gLmmk3rparZMXUGd2c36HWo1a0pO8rConzeUrBD91UbhsLpf99NK5qQyaWGHtv5PpTuxsyYajLFLi/0YYL3bPHIL3HXVjPZeKQbR3TscFjHHbyp9Q17TsBOQ1olU9/4XOxDUHm3mmB7ayChMKKxE0h4WKoca/U5lWQD27W5XLH8tOztbHKGlJqthE904YcNBR9C0SrPRNHTxjWEWOcEn0nloIrgMqeKW/xWr9fw8UAM9is5RCO7P1+l/mETERhXJnS0v7+eJbwOaKMgpeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11071.eurprd04.prod.outlook.com (2603:10a6:800:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 05:33:40 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 05:33:40 +0000
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
Subject: [PATCH v2 2/2] ASoC: fsl_spdif: change IFACE_PCM to IFACE_MIXER
Date: Tue, 26 Nov 2024 13:32:54 +0800
Message-Id: <20241126053254.3657344-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241126053254.3657344-1-shengjiu.wang@nxp.com>
References: <20241126053254.3657344-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11071:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5e77a8-3052-4f60-29e1-08dd0ddbe26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tbgONFerfsLKsf5O91xyvVg1Q1Dryld5s6bPjRAEXnz1jcsFrH6NpqLo0SJV?=
 =?us-ascii?Q?NLWnWZOuuaXh9AswrBBZPCDWllMlfOLCCLramjSvGdtPW0NxwZhoiYNp+NjG?=
 =?us-ascii?Q?eb4ye2v5Cn7Xit3kWLDK0yEpbgmy31LmWHkVQ9kBm7uUvGZZXQTwCTbl4Vh8?=
 =?us-ascii?Q?VoNGPa+UNPEOOF/kX3rMCHy2FI1EWZvpQzJ7jYx77OvsR/ipeeyglkakihiB?=
 =?us-ascii?Q?ywj+Gzk9uzSqmhDz0miB+qUheSeR55MlInAmqkEtKSNG3FAZNGrAbPsFdSv4?=
 =?us-ascii?Q?5TeBvw4MfEisCgypcwqdV/oduikzgFF3Ev0uQMreJtY2LbaZYcl4r9RDeYsX?=
 =?us-ascii?Q?plAKhRwHgeYMN8b52kxsPPSHlzKF/fxPagqrguY+fHrfERRDrYs+u2C8BbtV?=
 =?us-ascii?Q?nxQWNE5A3SlP2Dk1pEoaToUHmcz+1FxoYMw9RLSoYi0uE2wgcjE7ZpQbpyvi?=
 =?us-ascii?Q?/3KX7FqM78dS3G/tuUKwockTKZQ59JulqbHqT429V2irqj0MiXRSz5yJ/b30?=
 =?us-ascii?Q?M8y6QfSnDtEcQoTwR/EfY0zWk+/XrmlnYu4DiaNfgXxDFfmKZA9qYU8WIKev?=
 =?us-ascii?Q?EA9oWc+ASmtxV+gwFBJUFz0xfnHl9jCGZGMgek3X9CgTQuhpDtxkhiofsy+S?=
 =?us-ascii?Q?QJOkUhH5KNy+mF79caiYVeOk9cVVB0tcAUG6iiywQdE2320FM/MI43p6zP+c?=
 =?us-ascii?Q?OnLztMZThU+LIqxNczEDMM6bQSghymjJ8vUi2druTyZnEmBaEkERGQVajtd5?=
 =?us-ascii?Q?XJHyJjqVUDuxEFQGXyw44h6PNogOTBtExf6i+7S0fntpJ6H9vcPIfhSfwgsS?=
 =?us-ascii?Q?0aRvEr5IIcITFm38Yzmqeeb4hMnrHPp2rReDhOVTewj1QDw1gTqJSugLF0ma?=
 =?us-ascii?Q?Yc3NaCMv1pBoKDj++9JCQvH9s47vpJB79X/cHG2SdWnhMDY+3wSsKPNdUFvG?=
 =?us-ascii?Q?a1XD5I2d/9kX+SoVe6dm+35jMIDU2jcgA8G2eHfTMTJeXhhSJfmTW2Ur/OO3?=
 =?us-ascii?Q?MhXfKsyT7yac4+r+jfQ90ICk34JhBbp0XQT/S4yZLUd39aq8ft9SH1N/frA/?=
 =?us-ascii?Q?MVpv/4IQNnjZ4+i9eJcoqLo/ZW8wVC+xRu6UZBaljjXc4TMn1np28lfnyXUo?=
 =?us-ascii?Q?RW+wBWpqjeSDgnQuUc1Z/pfc4SMXyYeXLz2UTwy433+3OW7vgErANiquwJMh?=
 =?us-ascii?Q?IqNinS1DI94Foh+l3BSxHz1ht10vHj454wezqZ71JjQp6YIGpIgqKqPmBvSd?=
 =?us-ascii?Q?H6yNaZFJZ/9TmXm83WIturDm7U6R7ee3+L5eoGHbW2tj3pgFf+6auPgtQcLX?=
 =?us-ascii?Q?82ngq22IFhATFr23McmI+MZM+8u3OaXOVP6rDgUkqZnu+DVz5VMlms/7tsg3?=
 =?us-ascii?Q?hMXaoKxOxdFOXNAV7mXKJp69GyLfjrHZ7pyvq2NcVWfxUi06DBa+BnotDP/p?=
 =?us-ascii?Q?Ia+zf0P6FcA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vuO24OLpRnar9+fy7ALX8Z1if0hOI+QQdI+pwEUQaptecuHmEEmrBmBgycVJ?=
 =?us-ascii?Q?kovrucSd3dlyy8RRi4AAhhZTj9a6gLA9TqmQ7PZXHbt+aaGYC8Yp7IKEbyIq?=
 =?us-ascii?Q?djLMJ1m3UwLc0wJJhVMbovphCiUmjtcTBcVovqthQK5uOiRkxzcxDI9eJfpL?=
 =?us-ascii?Q?vhWsoegIXzovGZP1ZWS939RrTtTT0s5b+R0aMQHcEYnkldrZjrGf552i0gg8?=
 =?us-ascii?Q?PhRFTCPGmp2ebP1nX14zEiFzEOWUHJ9FsByJjiYN7TkCDsjUnlIMAOv3ILea?=
 =?us-ascii?Q?cSl40RoqCwwAQHDaBfM0MZZ4q1k20XQUpAruIR3wefHbDxo6nqrIbEsMVc/5?=
 =?us-ascii?Q?3QV+kwNv374kf7j1r7YlKzN9WuYD/gs3WMuy39XVeyHDYlNHhTYaIcqzziR/?=
 =?us-ascii?Q?ZPcCWHnziHR7aIJV0/5DnGuF0HPnYZStYXiWkiOS29eJ85VmUkZICLhs1zPb?=
 =?us-ascii?Q?1FLnNfWxM4qh7IilMY+fbC4/KzRaZYOeOGPtXxq68MRbU3DdH1ZO2s/pTbds?=
 =?us-ascii?Q?6i17fMlM2+yep+MRrerJwDNzX6Q2vC45XIDjmk0UeqLlAsRNz89udgv0KDkH?=
 =?us-ascii?Q?F890mkGqcxM/OSlxpTf8Ogg3nwdoc4zM1d7ZSa7Su/CGYoHs17KaqvKgJAD9?=
 =?us-ascii?Q?Tut0Tu2nmvFpvNpUoOa4lXq2gcwWpZWso5zVejN2qHIC9AbVWPS2uajQvWGK?=
 =?us-ascii?Q?OeGNkS9PMkcsjITxYgoCRMNxjDKoJbc+cRgBXgSVdlMCoHilBdCdAi4DRBi6?=
 =?us-ascii?Q?r60SmoAyOQZnNTWrqSH52305g1LIjnKj9Jts65qcHSdV1TmqNRuSMqove0yw?=
 =?us-ascii?Q?DX9sXnz3tYBg+f67vn+DgA754GSJVGzpXcsephj3xxjTkr9f167D0BHCoHru?=
 =?us-ascii?Q?zPwAJvSWjXYw0MWkpJ03rVOPQXsFgNd9zWM1EuoVfwGYQkExfjiq+5d520h2?=
 =?us-ascii?Q?uPX+Z2Pi1ecNhqu6yAm+QKUczuHmF4RAo459fwUa0CIdBgXUBipa1w24jSEo?=
 =?us-ascii?Q?+oXetlnvNUSXkTUFx1f2S8F85810FLP2yJRnqN1z9sQ7fMfiWlOmbQVqXdbl?=
 =?us-ascii?Q?MEzAnSR7vyge9NmFCIdomq3tlb7pQ9ouA/tyD0KRsf8du6W/9HvbIG+0R0St?=
 =?us-ascii?Q?UWTbx4c0nmHGMoWlMq3KsMr3FIykjcDygKBjuayd0x8INRK8RAnTnzRQh0+d?=
 =?us-ascii?Q?MFspfsHCQdFkA2nffUrn+z9tSJ/9P/fNAdws6P+JJJBxs9RYh+HZVrNerWVS?=
 =?us-ascii?Q?Olgf6rhzM9Z38IdhdSQJ6k9pYzGl4vWW+xxlMm/FlN/Eq1V4dWgkxfvWw5su?=
 =?us-ascii?Q?50QxiZWkBD4xTybQGUbBOL1IEjLBSUPAQZa9kHzPD7TwTtsaO/N1noEgBHC1?=
 =?us-ascii?Q?ISiEi2759FVF9uLJ7CrCbL56LN6oYSUiF3vZ3clBIzeKrATECGQiqGeCVAvT?=
 =?us-ascii?Q?ae1w0E3RDdBjRklp6qZnpAFZrwdSIJ+jdwnm1aJximlC/2xvSx9rtDAhiV4m?=
 =?us-ascii?Q?K5PR8xBKjvucdBOMIGQAuUbMEsg8L829Fwi4C9WK1O0iF1fvKpOWiarbTdcL?=
 =?us-ascii?Q?sOXGJT9H3iU2qBJFsMDYDOxSZ6lqQtFG8J1HivbF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5e77a8-3052-4f60-29e1-08dd0ddbe26c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 05:33:40.5439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOTx0e/4IE6faME1ig5ziBROVQx+4C8/CVlaggmEu8e/KWob+FzQEMRh5iUAsGrNFz6kAkA6D3URFeCmQenj/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As the snd_soc_card_get_kcontrol() is updated to use
snd_ctl_find_id_mixer() in
commit 897cc72b0837 ("ASoC: soc-card: Use
snd_ctl_find_id_mixer() instead of open-coding")
which make the iface fix to be IFACE_MIXER.

Fixes: 897cc72b0837 ("ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of open-coding")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index b6ff04f7138a..ee946e0d3f49 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1204,7 +1204,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 	},
 	/* DPLL lock info get controller */
 	{
-		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = RX_SAMPLE_RATE_KCONTROL,
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-- 
2.34.1


