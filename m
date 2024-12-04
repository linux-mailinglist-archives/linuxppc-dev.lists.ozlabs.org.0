Return-Path: <linuxppc-dev+bounces-3772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 092799E3327
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 06:35:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y35nQ0wH5z30Vf;
	Wed,  4 Dec 2024 16:34:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733290490;
	cv=pass; b=kMZyljg/IqQuKufKoEi/MQkDbwHcj4cl4gD7XByLu7qUND3zKr5zpRebTLTseEW7i78isbTLCwwsQi2p6blcwwUGJx2dkzh4ZF5jKBI0mdDkB+1ThwLGcZjnnawXo9/6IgsZqDvPXp205Ympj2hWiuYrXxSWi7jYP7UIaZDa2GRYTAK5KZ0MfdkGNBsD6RWCNLl06HFAD72nu+X/a4dKLqwngCSqzBl6z2vxtASpt9K8bS0Z7QmM/8njV/VTk3JOiqIXDsVfNRV55Fmc32Hhw/TxFYle/7PMy3HA04NrEs68uV3m1CVtkuTC+Mp9TheXMwZan6EdHhecS2viBP4Q5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733290490; c=relaxed/relaxed;
	bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YNQ9ptWmUQOAECKYbaD+kkrnR1ydYmDJk4r2gdbOdHJR+cbR80VP7CXeMp2eGl5oXhwBz80jzaHnWAHirnhAflezAWEt/YUqLV1hb1fVF7sLlvJQahM/tLGvXm0pBDRWs6F1Mou/HmWPkDhEcxPz7zpmc+6pDxYBOf3VPZM/Zdk4Mnj0swhxYJw6gOx8/XLz/CWzwgQrnMtbRYE0BFmpTFsAQt8lo1Qp2g356uii+T2C3fyLdn6RmYDRkpRO/8/y/tCzvUNORuXFYyTXe81z8hVDVx6vchVRhxMldv3tNO4aWF9xqRovxiPuN3Ej2oh9LSAzdBxVzMB4yzUhRvKzRg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VBePAkvy; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=VBePAkvy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y35nP3Y84z30W4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 16:34:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCA4GLv6Rk09JsEWGvECnAHqqzjL9/cxRx6ZsMEjBGOVCMQpdHYUKz3I2YUCq9u4UZm9iPRIICMJvTybComMvs+iNzSgSuMPhIKkXFJIJaEj+JFTMTSTGXYgQykVjhN6xpL7u9TEFQwSf8sP3GbXSEDyy36wWVAg/zA9PPStL3A131x3rNZpps9DsgH5D3hJSEdz9RMRWQO59XzTXXHh2NHErj/KcMtMqUT5aqoFZH8Rove5c9NHaQaj9iVrSAB/Yqg8xVCrVPm8BL7d33pWk1ZNeUiE1wDwqXOpO1CmY7PG/Hw7RjW1+6uKhFf2z1vkdIOf9Rj8Oq4v0swgo0T4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=jjZMtKxdGv0lSMbndjwfd6MORnq9+nJeXyJarIV7PPPr99OLbkHL8sQfMi64+Y3vEgZ+ifZMRxAyrAmHqS+8kQuxOXYP0/cSiA98lipT52dho/RE//b6adADM97d5FOCrGRIC/58hpTuufz6LgLnqpYIiQRNZZFIraUZxEUL3HciqtppHWe+a454MB0mmcVcZbJcrKvPrI5FepGxhlTmITYJb87aRmlTe6Bikyl2KNKL6UXz76lqOljhQa81yimaGQ2VN5lW4rrJLufWVKQgJl60UksDbawNO0+zinLuPBXQf9XUg+jyRuEWSYsyUzWRGeUCDLRXXoJSQ9H8HrLIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJK8WWOvDdKnJn03HGc+yupP/YXIOxc9ngBNgUkeoqw=;
 b=VBePAkvyj57D/WluMrgguQ/DkYVh1wEof88wFmZF/jJuhT5xAdfDG1T7iJ7oKeeCN7wrQUx6vOKDSRaP2ExM1vzZ73UGUrZWrdvr19r+BCyTddAHZ+UWH5m8AfOdjtjcUR/O4b4dsVMXxKFAcSGuVvTXW73Q3zHRFhCb+2p5JsxUJozEGmuQPVZxZxjIk3ZibUbN/WB2Sa0hX7H3KQ4t/lcIM7zpKHO9i6nKt3elcFYZbSPtzQsep/LVt2xEpLsN5w5VVwZ/wG+M8mhQYwQmZeDB9ohJY1jyzjc1HTJNYhvKKKSNMapEGAnbJhR1fCBJ0Jwj8XlG9wlz/eG6UpgC+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 05:34:44 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.008; Wed, 4 Dec 2024
 05:34:44 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 RESEND 6/6] ASoC: fsl_easrc: register m2m platform device
Date: Wed,  4 Dec 2024 13:33:46 +0800
Message-Id: <20241204053346.1865723-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
References: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: f2521656-d872-413d-1495-08dd14255ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2mkYLbvHJORaoc3wI8RYBabzuO3ma1yjAwaNkVodbrJaTUhkAOog8D/QYWLd?=
 =?us-ascii?Q?UyHw6o2Oi6jBRVE1hZ91Pnnahj4cM0lCcJDvqr46mRwuGHbFFPP7XkJmSD5X?=
 =?us-ascii?Q?daFAEJJlz5gaviqCnEU4tYPDvRWJdBHikh/f/7sX0SdnyunioJ0StrEk3DLz?=
 =?us-ascii?Q?/+E2D+6hhhweYh7GB9XR4BbXwNgu32FWcUE4R57vikuah7l5+s+38gtJofUn?=
 =?us-ascii?Q?/BrkdrRff5RFm/73MWuDcbItcvcjxs5TH8wVUUO6OeOLtpNbMLivFXgyDT2t?=
 =?us-ascii?Q?FCN2ZkYtFefmMip7+wIdzox7v0/qwDVrBCL4/X4B2wwD6ATNe2W9MCRgzcsx?=
 =?us-ascii?Q?z69jxJS+LmgIenLp5MhcZLq2Q+GuunTItUEuU3QG43KRDx3vBTggJnRvGvcX?=
 =?us-ascii?Q?4OsS9/haTcC1SXnDrdSi/i3X/qUzot3JCBa1iFlPpP9c2GztGP3INCvTfwwA?=
 =?us-ascii?Q?1x2UD+E7JRbzrx53/wJ/O0w3w9pwIr66yOo1Hdjr0E2o9CtB+pu2njaQu9g+?=
 =?us-ascii?Q?zGdnCgeBFsRQPUFcNI7ZfhKWWXK/gjWb7lxt7rnTSucL1C10qjASUpspD3nG?=
 =?us-ascii?Q?BIG+pyPa5DN/frOFXE4YL5LTfCTX2+8PyRLdLhqP7Mpj+v3tBqw7ShqPga1P?=
 =?us-ascii?Q?FMqGk+vZoTxUJFpEwp10W9BZhmw0oyYeEKMhjOW/dH+kCVFtqtGX2U/dXk0A?=
 =?us-ascii?Q?ClTibfOTwyCKicTrPk29Pimtqle/NeGBaHzk1ais8UoZ5QCxlFB6mNJyEI5D?=
 =?us-ascii?Q?GsncnBjgGkI1SqZ723JhZOo//bxwkur/4pxcxWlWt7JXsUDU88DkDeRmuLZI?=
 =?us-ascii?Q?tChXAlJbHG+26tf2EnEiTFpzxECUxqbBHcn/Ed937go18cpGwo9HL/fOpm/d?=
 =?us-ascii?Q?Mc1To7huHotV98lYITDPmeLK7mRlzl1gC6JgyGktxtDr0DaraO+ClgLwiDGP?=
 =?us-ascii?Q?D5b5d2EHTC1gPv0/jkLyBnCeeuG1gPHw4nI3TungyCR2xT7N94VNGXwftR8G?=
 =?us-ascii?Q?BWtK1wsUznZJ2Qb8PSm6ckhONGuTqiFNx/6Q2L23OOPqdMZUiSdXJMKj5i3P?=
 =?us-ascii?Q?N7sihnUGrl0ABFFepLkQ8b9g+eFh3PrlNSYxDAn05j7Fm9iaB9Q5IUOoGZ0m?=
 =?us-ascii?Q?xVdBKxEAJRkjEmRhnUt2vbUZClAu37ZZ50/ugbhfRn0873pdf+fMZOeEyQJs?=
 =?us-ascii?Q?ZtLOuiSK8OfAaWZmW1cTYqVMVmBoaNRv3LsCp+oWomA3J5LPL0zRwAEDif3w?=
 =?us-ascii?Q?2V8II6K7jtdsSd52gD1woZd/CFV847K4e3h7uMnILcgOSD/E8Ioa9v+bPOuB?=
 =?us-ascii?Q?DuuPf4fXWxqmffbrEsXInp+DA26kAMlPMP/6Xdg11C0FrgcqSCO9UMQGEEn3?=
 =?us-ascii?Q?UoqtRoMtoLbMN5LlYof2riM8OcyaBmuWfIx3LAoAMzOlZ7BrtBbyepF7gbYu?=
 =?us-ascii?Q?e5gmVH11/T8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5RM51+D8Gf5NvP/ijv2PYoEdyInBR1M0srhHI19Wi9nGwR5C7EW4EGbEJ1fv?=
 =?us-ascii?Q?dPy5uZGmHkfFQ7toPahD/dqIsbRYGwRj/Ba0cF2bB7cukgjlvUs2LVK8o8gp?=
 =?us-ascii?Q?yfFwPkuGsgRvBCmGQ2kodyBSJxavCdsvnnrnM4kL7pfQZKQpGlfQKRkp4dOr?=
 =?us-ascii?Q?OUif0MkQfsJ12xlLRY6h4zF3qD9KzsRDb60kfD4bFn83k12JqrAcb0MnAD+B?=
 =?us-ascii?Q?JDdpnIy45dV+IgeJWkpFI4sOqc0AFzMW6znNZO0YFxtusTvcQ00H0+Eqgrsf?=
 =?us-ascii?Q?GFB2VDKB1OGi1sbddyAHFpUDD6uorBfPfbgA1GvcV4cwzyf0Qr0A1A4lO3J+?=
 =?us-ascii?Q?euCO/F+Z05rMN7PAHApsEe0SBCfxr9tv9fQgnGCUD+n/+6S06KL1lS+RgHNv?=
 =?us-ascii?Q?PsWT+EafOaDITN7w9vU7FVxTZael30b20Zhl6d1ZOzMIad/n8Kc8N4sunUWi?=
 =?us-ascii?Q?84AMpsnPzx5EAKHGC3dBqOdolXh63ISO3ECpalWt/JSjyBLXOdbVFXhQb40Z?=
 =?us-ascii?Q?EtBh7Zcdf810ZF5eK+r9DNo3y0sfHbHzSnrS4DCbn0IgsjBcQsVB1iF1rCQ6?=
 =?us-ascii?Q?XuIKaLQULvNu3W+7HClSx3aPq7aNOnn9UwfFyDxJyr75jegjd40cG/dBWzjl?=
 =?us-ascii?Q?bQLVb0lJ3y0r1QAKMt/tPyEZJTn6xODN1Z2jQKb+7jP66SfJi8bzvShgLA/o?=
 =?us-ascii?Q?odERBVkmDORoffsBIt5mVi1HeU9LIukIZW5TCNYjPvpfSfbnKP7eWHelKYzy?=
 =?us-ascii?Q?4GGjA1r15aYU98aPUsSbGbI0bD14u6oR3i1brr/5/LQDK1N+evq3fscL7esn?=
 =?us-ascii?Q?9/cIdVVz+uvv5FkrolgOEs0bg9XfeBQWHo21b1a5Df9RfwucXXvJoroUzYhR?=
 =?us-ascii?Q?ZuQBcgn0/CHJ6G32TlFuRAHE6mTuJjXa0KRdkrIAhu16nSuyuSLyKHJE/kpN?=
 =?us-ascii?Q?BuCC/YPcjcR+cRUNg8yXfkddxQEq/9+ZLR9Pp3pwwBR6nins/UlXuQnMmYmD?=
 =?us-ascii?Q?e82t3Ji0ioiOBKxhDbCzbBSELAoyT2uTFaQHop34x2ZlxuGWn0GmcmItez2K?=
 =?us-ascii?Q?rtCb7Tr/zakK43Yqu9nTVVqU6qwpOVCFGroyh1zW5nthpmkwKP+HFBpD/Mvq?=
 =?us-ascii?Q?dnR+FyTXQmZJ8x7f04osCdtlOkRcdk0v6yPd+gh5zL5IJ5thPqv4qXGq8qWN?=
 =?us-ascii?Q?9aeoSsxvOaL+FJ0K91odayWOdbnfChm3AsVSKjaMHys92UasyKq4ZCfhE3jA?=
 =?us-ascii?Q?WxGsk0AqpENSqjlLK+O2aAtkWJe5nGvTnGfnT6Uz2pCd/cqowhqpfgtZW6ak?=
 =?us-ascii?Q?81SH3mbfS1JA1AsvUhYDhJ8c9LUU/F09CFuaFrCESLmRXPC/zRU5GA6p2iYI?=
 =?us-ascii?Q?uLxytr43OXWtct/3+yZzfd7dx47szmG8DBx5SH3aGjoG/0w9lXaYkLpF65z3?=
 =?us-ascii?Q?Ov91vH36Vv8oMu2NFaOHIgMwaZK9I+ULVjsTJiyDaBBKqgQvJi6Jf2Qzo1Tc?=
 =?us-ascii?Q?RRQKt9mo8ziVmGFapOmrXrUs+bmf994IYxmy2fvxIf1waRT9dZAbHbywQqZB?=
 =?us-ascii?Q?S0oWxspshxbOAGxOHBeds/eK/vkpvLG/FIrjdzv1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2521656-d872-413d-1495-08dd14255ba2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:34:44.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxpHrJxr8MiF0lB1rwGmeIms/4WAIBzFSUCY1VAiDSS17+ZK6zu66pF93kmPpfcWSaqtmHXWC1BUWlIMTl7uJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Register m2m platform device,that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_easrc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f17a185a1910..f404a39009e1 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2204,6 +2204,12 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	ret = fsl_asrc_m2m_init(easrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_disable:
@@ -2213,6 +2219,10 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 static void fsl_easrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *easrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(easrc);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
@@ -2313,10 +2323,29 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int fsl_easrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(easrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_easrc_resume(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(easrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
 	RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(fsl_easrc_suspend, fsl_easrc_resume)
 };
 
 static struct platform_driver fsl_easrc_driver = {
-- 
2.34.1


