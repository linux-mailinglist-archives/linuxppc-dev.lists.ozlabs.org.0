Return-Path: <linuxppc-dev+bounces-2663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F191B9B402F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 03:11:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctzH4J8vz2yRC;
	Tue, 29 Oct 2024 13:11:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167883;
	cv=pass; b=YGPuWWaVERMtK+qLXAEUmVgTE7JSHuf7rYV7fzVe7CsZcujgZYhOcIul9r6w+O9+Wk2hanBpwBlY6r7CJkgwAWuc/ayjFHeAZ/KBs+5M980rd0otJOz6Lbhj9ePwdcbtvBT+mUlOsJxPSdaYE8u8XNX/g7HSPnf59HbsZRxiPjv0nx1vfXFCi2mp4ke7qUaOpaEoWZ/fbMPWpuXDKV/rSS/179AbLIfWI4xfaXVD0Eo9ypRC9vojEtBMtorpyYLBVrQMcgtL7uBCkT6E3xpXw7+b+II0LZQrSTQxft6lKnmprTd3IqiSSJ4JozI5zoBMAdj0F/gJPCsF9MNvR7V2hw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167883; c=relaxed/relaxed;
	bh=8YyfDaq0FJyGSNVYxtX8WQCfTWhOPFrKKDVZIE93Ruw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dsid8G/KTat9sgvTlrRrUQeSsiCKCddAyWVxfo1Sb/VVxW1aFZof+KmZN08Ewo/m8lDrFabg3WBfTVQaBbptJ2g8IAGTFfNc7bRl0cOmBCRMoTeNM4To0tzSPwugShCCLoIlAHDCvnIOz/h73MlRV93Tqi5kMJjbsN6iPNsa6k/dElIMGfj7bYKXdxoUtDRqrGivGqmpUCGX0ggvfCSmpguKZ52YLprk/f0Nh5V7xgJc3xrGrwbhfplLoVCHNAPupJwnDD8vg2CR+mTx4AKAWO6e2iBWxKGRUU03YLSLI/TVBKI/ks+3AyYsdIJR0DewtxoszlQ2ynGnaYT372L2Yg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LLtst7H3; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::62e; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LLtst7H3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::62e; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctzC5xmYz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 13:11:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaLI09I2TdNIGcAkhooILC4BS0m1ndK5sH68zWGp9sm1R+vaB8l3L2WBRmHElL9R7nSoziJwJjku6t1OumhO2P/89q+GyjeuWYAJARKGH6vCVCf20luaMOh3FOAnVf6Fa/IXWVOfUG4p5rkHns2PgQZ8/wSxDmiLP8mt2a48ItQSyOMTEN1JwLU7iMkYN1NTZx5aNhLobffvMOvtxTkgsyATJ83dvp+m8elAD6rngkZ82OrQ8MGX9qUKDsyh9+gc8AqKR0DuN6aMS6TdpYsotWVgE7bE/8fxvO1WzZ9Bm7cJK1rZ8I00ydsO7mXogau/KcfDtAzDVxyQ5qu6KNoKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YyfDaq0FJyGSNVYxtX8WQCfTWhOPFrKKDVZIE93Ruw=;
 b=xM3at9dpds2M7OcWIkeJYhHFubY37inODLc5/4G/1XvhjmR0XUT1I9gW6jO593NYYnB96BI49a7MPdNExVfPYVVHqQpsVDuwacqxE8P+h5bDr4/EGRJN/gXtkottOjv+K0z4l1TvQaMsWNS8F2F7dtHo9+DEoGChZsEIecvzRKS+sJrZ6nSLdvO56dKx7X5Ua8cqcf8LAUyQdCu8HEVZ4InABBlDeipccBGHEzScD12t1Ll6Qc/HP6bv8+QMh4GTl4Ia8DqRZDuU8aAgT9M8BZFVBBAM6J3W5Wsqt5ZqRfA+Q1L2adeAmsU3xGS8FDIEZkosZ67fKXL3NewJhSLhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YyfDaq0FJyGSNVYxtX8WQCfTWhOPFrKKDVZIE93Ruw=;
 b=LLtst7H3FR8JwFb3QjclCJQVZJ4kI0ODmaPIGmfpV7Dd+mQz/3jVdD2rZo28rn+fi8zr8VrOammQBphf1vAAEZ3XAjDOKxPL6mEt2nRhH+vq/IQJ4EBw2kKXCu/uRv9bRFSZoPlVTKAifWC/yI6fKsuo5JjlPgenaF6MXfnQy6h+ZauX0m0xYuhr0nCFZXgjQevvaCqsFLTU0ZDx+ojTJOzlN7TI/6cJo92hwtqMyt0eYDRpnkessju5x0AlaP0mBCliMQzN5kTWuN/p3bXqDshWwtFKcaS6fne3XESXX1e7JceQNqpMP7WHH8KwjKAYSlScfBHrP4miY+358WQoBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:10:56 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 02:10:56 +0000
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
Subject: [PATCH v5 0/6] ASoC: fsl: add memory to memory function for ASRC
Date: Tue, 29 Oct 2024 10:20:51 +0800
Message-Id: <20241029022057.816402-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 1303dab9-dc18-4d12-b9af-08dcf7beec28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wOQz+pU0k6D7ePZ8Hp60MW8kn1oIZZmbftatWB9CW+5NzmcqICEdcjPegTyQ?=
 =?us-ascii?Q?hasMr7ldi8MhTkp/IBJO2TweLbbGY8ydGfqnGnF6yEuAiYikIzfrJc9MJsm4?=
 =?us-ascii?Q?IYe4tx/m4QqawXX6zuGCD4BejLIMnPmlbKrEG46BeUguxWywZ3mDkfYi8CVs?=
 =?us-ascii?Q?znLYHMyYJniCl0pCRB5eYz7ZrUC4qqR3bg+eGCpK8fAsnDufqN4JaD2dR5zy?=
 =?us-ascii?Q?HE3AB3v8B3yMCl72oz7AmDAKRD4h/50hK/g951iMM7dxSmviJxjN3QSfmYD4?=
 =?us-ascii?Q?XQrgCzV5rxJU4AY4tfz9ypg0+7rUTeY/Y8K/TwsOaGuZtk7tnQbmUR8VmRX0?=
 =?us-ascii?Q?R37ily1NJ5YQjdS1jpoNq3dA0E73B+wRKR5SQIVFU5T8o6kXQbgo9/xYzWGS?=
 =?us-ascii?Q?mBxN59BEMuxuqrzTE9pmiB3D9h+VU25KO25c+tICitlEUZAaFaAUtosAvj7n?=
 =?us-ascii?Q?oRPCLESGkoy4nYHinh1NEOUHcKRcHALfUYrtTNauQJ8NL9EPyszc/nxMqPY8?=
 =?us-ascii?Q?8iHLuCN5waDldySm11vZ1fv9uWGjtdCZSUYXmsZlNPEwC8iVjefK7phFwH78?=
 =?us-ascii?Q?w/ugA4y+pEQlYFqIfoErYGseIBaBLNJQZYlPTfOGaKje9YzmVISfWR9QgXNU?=
 =?us-ascii?Q?Uuwk5q8HrFdvBT6TvAkHNavQDMz1P2sOuTKbPWIjqKPWUh+bcwOjGiAhIvuM?=
 =?us-ascii?Q?X1BWA6SkqGlcqWID3vk/IhESsNPPNpO+X2NzLI/x17DIKnUHbERUOGr4VRpN?=
 =?us-ascii?Q?DwXnkH82kUnvoaCoZuDmcHfVRO0l1jGMnsTtx6JNi5WG0LhdRZr/Mnr7qwMS?=
 =?us-ascii?Q?sNVCjLQBKdIk7KDE1flFyNTF9v1gRZn7KzC3WyA7X/hZQrXM04Y3ozab+HHJ?=
 =?us-ascii?Q?BlVOp4cERWoTUBWuQ6UYDdm3NqwXpec/ZnvZhDy3/m3rQTGISb/zSBmNT7sx?=
 =?us-ascii?Q?BstYxXEclgw47Vpar7MLnIaQz2A+8ffDuunGdEJl4uddHTyEm6bprtgq6/Ze?=
 =?us-ascii?Q?Hqmwp1ovLlNQhoL5TBioXZr524quSfdQY5+CuMAgjOkPKEFjLZe1OQy9OQoI?=
 =?us-ascii?Q?lDLTVV0WQpFt9tXHcXLVJn6goU8wLbrBJClOreigmOAuJTNnWrybFQ0Te8Nw?=
 =?us-ascii?Q?YDw+tDe1A1aQ168v6I+RN5QqwUgkFDPwpwbNvmK8H5szL9X0WDO1xl380D41?=
 =?us-ascii?Q?QDggoEhbL293Gsf1/WS4eD+UnL3eUgN4RvMVkuOhPzY3YbLKIdVSok8KK3Qz?=
 =?us-ascii?Q?IqGD+p4uesjVfsMrfwOVO7SNrRoV0ffC/CWN92ZMD9/egd7E+UmeVIYHAJLk?=
 =?us-ascii?Q?XbRfyERRbGiLBjUUpkskAr3nU6FWbJo5ZsZqPdoYuQUGxwUiH42XQvE1X2ft?=
 =?us-ascii?Q?Rk2vaDrC0multFMbhJ8RijRU4nERR8e2NeScgNVq4hAEN5WLig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgi6DhMV78YqxJgs2bJx510OYLfiq5DV5QoJaLb/Tz5uw+GT6MY3aV7oDKZ+?=
 =?us-ascii?Q?SPPBHUSBk2QBy3pbUXyuIQ0pJqkvniUtUdNbZQcIXhvItdIgBQ52xU/6sBGJ?=
 =?us-ascii?Q?UYqvnowKZj7ZTTZGaeDN3lnXebuBSWZK58FnVu7pyMJAjCZMxJVR1u4pzUKh?=
 =?us-ascii?Q?ri1emKD08J//V9e7dNWMxRjmz5CeUGH/27oSuBrMEnl6828AhkZmkcvrUe1A?=
 =?us-ascii?Q?3yrrCmKPo404tQK7yyjjfvqOkyBFZGiMgRQYWawhetf09F+IkSZd+Gx1R2Pe?=
 =?us-ascii?Q?ds9PGRyxNUV/x6pckQoHt+ZN8LoddToB1OYcoeXwVb5dqXLaqBzhOvcwdMLT?=
 =?us-ascii?Q?RkPUqy2xK/k/NjVFLBhfSDEP+WpGachtIS9IklWkJDhv/onGFchiDnXyemZS?=
 =?us-ascii?Q?6oGnkfI+L9M/uZyEL31WYtmXCA5XAE7/csPypV8DU9KONs35sM5QaifLUXxl?=
 =?us-ascii?Q?s2Mz71r5sxb8tpJ98TTZKqfuWKVqx155rcpe9ApkMHtoHqP1u3gUTr8X/PZl?=
 =?us-ascii?Q?UPVymglSMUebYak+HocUS7msFSCAhTSG38bgdS3QkUL4Y4bwEju1yJLvoYEh?=
 =?us-ascii?Q?+tCyp5tRtiyitCNmX3q5vLY0LGWmt61Z4Lw+fKHi2FzRi/AaDxxcLrmIrl3O?=
 =?us-ascii?Q?/lVonXI0wlGeQetxsn5Ru5asHhqi4sVpe8XUlsVM4lBdD1rzmqIlmbFvvN3I?=
 =?us-ascii?Q?4aFrjQ9xfH1srn1oN2ZCJeRRt8uwOOAUpFXA+d1aMStqL3Z5zgp1lQcELkAF?=
 =?us-ascii?Q?EwgHZ3eJLuRyLBon/Tcp6EDklM55At9KA4eWiOqmV8v6oJHu7zwi86fr9pDD?=
 =?us-ascii?Q?hCX/2f1akAaspZp8W7CDhxIq/1YuWJ49mVBiu+lvIyBM+bUjCUGjiN9Tr1De?=
 =?us-ascii?Q?Q0j2GreBVKfv1Su5PobVT8o6AZv870TdlcMam5zZMOY/iXqZH6w1if2xUgyV?=
 =?us-ascii?Q?Zbzk9O6rMy6B3ebXNPAXNwEMlL9OyCCkUESEKsfPsbeT4O9ZK2HpI8Pa1gKs?=
 =?us-ascii?Q?1WjLMjf6CyVj8QY9GypN37iyarcDhAHKMk/ZTRLw+Vo+fnCiYzNHu5MCCkxY?=
 =?us-ascii?Q?UiQc5UtnqxtViig70BxoR7oZxNSx+WQFAqov6aciRzohXc8ee0c7c6xjLJR2?=
 =?us-ascii?Q?rENaguVkSgNnc9z5j6lbFyyv+5Xhf1FUqDVupOK+ku86jQzUWpjhdcTPJkC+?=
 =?us-ascii?Q?RvhpprtGjLlWgOt3FUn+WpJhxRxkKu+DT/3nw/cXmitjbx21lSCz3ewxJqIZ?=
 =?us-ascii?Q?scQx6jW100RIGGIVvhaLkPJS4HzC6O41K2OQHNCpI+FCMqrlX3Jcqfi/WyA3?=
 =?us-ascii?Q?JuQSDROrZDqGeZ7A1Ftj+acBbgqant5WLB5K6dIXMeRKn4wq78Mu5hxCX3xc?=
 =?us-ascii?Q?KvxqO8zYrn5l9zF8oTZko1TfaGaq4M++hqW2+OQ5z63QXP7cURo7nLvLvd/K?=
 =?us-ascii?Q?Dc16edB5936lU9t04fHvRAeP4Y+vZx2fHSB5w4c9iDlByvqIbXC0HyQKLyKl?=
 =?us-ascii?Q?SIn4mbRgAzxS4vBjNRL/DRTtc691WO85Hm357jT4/Mx65iJvTamNrO+L5fjc?=
 =?us-ascii?Q?SVJjcWUshoftAFVC9iZH5BkNTQZupB5PgUAhjs1g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1303dab9-dc18-4d12-b9af-08dcf7beec28
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:10:56.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5T4RLTcQxSxyeoQyxSkUyOXe2TAugUAXxmnwlTQ8sheuQRdBVfXMsxsnGJc8kcYoD3zcHltoAAIpnHP02wP3qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This function is base on the accelerator implementation
for compress API:
https://patchwork.kernel.org/project/alsa-devel/patch/20241002093904.1809799-1-perex@perex.cz/

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

Other change is to add memory to memory support for two kinds of i.MX ASRC
modules.

changes in v5:
- Drop Jaroslav Kysela's patch as it has been merged.
- Add Jaroslav Kysela's Acked-by tag, received in v3.

changes in v4:
- remove the RFC tag, no comments receive in v3
- Add Jaroslav Kysela's patch in this patch set. because it may be
  better for reviewing in a full patch set.
- Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
- Fix some coding style issues in Jaroslav Kysela's patch

changes in v3:
- use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
- remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
- remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
  Will wait Jaroslav's update or other better method in the future.
- Address some comments from Pierre.

changes in v2:
- Remove the changes in compress API
- drop the SNDRV_COMPRESS_SRC_RATIO_MOD
- drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
- define private metadata key value
  ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD

Shengjiu Wang (6):
  ALSA: compress: Add output rate and output format support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc_m2m: Add memory to memory function
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device

 include/uapi/sound/compress_params.h |  23 +-
 sound/soc/fsl/Kconfig                |   1 +
 sound/soc/fsl/Makefile               |   2 +-
 sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
 sound/soc/fsl/fsl_asrc.h             |   2 +
 sound/soc/fsl/fsl_asrc_common.h      |  70 +++
 sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
 sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
 sound/soc/fsl/fsl_easrc.h            |   4 +
 9 files changed, 1260 insertions(+), 9 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

-- 
2.34.1


