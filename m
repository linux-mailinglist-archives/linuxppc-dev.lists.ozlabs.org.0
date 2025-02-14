Return-Path: <linuxppc-dev+bounces-6172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D834CA3579B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNQz6CX9z30Vs;
	Fri, 14 Feb 2025 18:07:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::616" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739516843;
	cv=pass; b=i60Y13v7Exgevx/KBuxzVpn5ZlUBdz0llNejPnnJ+gPwqc9tAhYTp3dqBz1nUvq/PyaxRjeWanwQG0GfIr0Vojoq62TqQdJ2pkO0x3EpGxG3/A5ZUsvSgs2tkxQPeu502IWONQWKafS+/SHfzQMPutsRqmm8s5l3zTwxWUlEzsxEMTtlMb1u36QRIvevFRdav0YFoCXHyXnbQLs6pMCxWSuwdmYXOGsIQoyA+e5L6WvJJPBfnagGlYrhnFMkzwNDmBq6q/9Zj5WgglYEGZ020qm+5daBc4blqnvd0WqMuf20TwzidpcBsloK6XOyAOATGHi9cAgwwqhMDrzl+2czWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739516843; c=relaxed/relaxed;
	bh=51yIc3AN3bAQc0q7fEQ+Ht97MzNaJkYsZmm2qe2d0J4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OkZD6tpuUIdm9eIpE9XLBybTYlGevnnrOmz2ZFlc4xiDwC+VUE0KKY99jOZHaFE/U+DQ+tX91hFRl2tinyPmZc52PyENBwndRIxYOb4g+v/Y6DzcXEzHaBMUONdaPOjUbjSZr/yfwr5xmDWlHmqocfVJH1vFDG9BJQTqMzJPqDSUgt2/eT/1HAcyr5QZ66jlz85CyKmuztzK9Qt0vyruuKtXcV8wbvLZhVC5skjyQe2lN3BRMqN+E2nyoSOBvRMyihwAZaOsbhQEufoU9q28cJoY9+5xQERmuUhwohw8HFoqB2fJJDMJ/BD+Pt4GgSKRfrb3LLN0Czzy4QRbHaoviQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BNijTSA9; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260d::616; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BNijTSA9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::616; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvNQz2V6kz30WL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:07:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVS39P3s6vMcc/iFkstR6I/pXuN8FteSvAWHHJRwVSOjaaBzBpkqNjnx8j8es2YQG1EwHVNhRbGVzjF/hGjlwQO6W6jvGW/R/VpnHWA2Wxzd7YbmFB3TH5bPQaLR0xRU1SpeNVPf79Ku7syUTKQxcM8TuCgXhTYuw52tuHl3O6QhhOldsr0pEIzvdR5Lj+v0APsXsOxRTOM/wPt21Kt+g2+L2c3RFlBy4jkS83xIf5T+tl6aevSZOfFxs9n2tOkdDXWFNkmZRaOvhu6HsRQKvx6KEVzZnA+lQdsB9/t8ZwOHVLSFUDwbs4NOZghDJIwl2oywpdTm+x37NspLLdI2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51yIc3AN3bAQc0q7fEQ+Ht97MzNaJkYsZmm2qe2d0J4=;
 b=VMaDaJ1FceDrPtC7C7NShwBaClpcQVgeDfvGaC4P0KI/6xKtrooWwwW8DtGWZsy4mktN45wwDRf6wvx1xkSbqDQUqNXuL993BXxYvTvFeUpC0BYkYBfZmXu8yqK81L7lGwaXiTppQm/9eQCfAO7kABWD1M17wAItg3vVKUTk6E4ct6RXDdEjOxT32ITbiNdqw8foLGNtG2v3cuTruqQ0zZLXEkpCJ0qDllWylAyXztDct46GRUpYXYeC35rdi675J+jFAknJ7Mp+onFukIE0/8PMXSb02GkwFB0jzJ9gQsPvZ9PrGoBKhLhEIAZy1XZn1zC0ARF1gzFLYUonx4IP7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51yIc3AN3bAQc0q7fEQ+Ht97MzNaJkYsZmm2qe2d0J4=;
 b=BNijTSA9g3TgkDJKpXYjC+E3NdJeirRJ3bvyM2KhgCHuUJ0c8vyudohSvVb+gBR7Z0h6HZV3og0+/v3CyuE0wSJE3veUX/MDvJcTN9Z/60YuUiucYU1d6RbPcF7w40hdV1pxIxwuuAk0lK7iQK6Wa0TEfxWx/Xm+5rUsIgZYRlIzZG65CWwtYvl1lN0t7F47YMo/O5p/HP5HY/DHWmEAw+Amyqtj2fPqhjd5y2kV0EWm3Ddj9mDTnxmz1DIRuhTlOwmd+Z9dfUSzd6DnLNLxvd1fHsOK4z5cblP1AieJKnV+votn0gWkja3sJtyCPWPoBv2tjPoSPEof16q9JR6UBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 07:06:49 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8445.011; Fri, 14 Feb 2025
 07:06:49 +0000
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: imx-card: Add playback-only and capture-only property
Date: Fri, 14 Feb 2025 15:05:32 +0800
Message-Id: <20250214070533.2808496-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250214070533.2808496-1-shengjiu.wang@nxp.com>
References: <20250214070533.2808496-1-shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 73201f2c-a1c1-4042-7f05-08dd4cc62667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b3iGECWn8w+wQ1coxpuPfwIKdMXCnrroIfR8cEKMZJrGWQkvbXYSE0CL2Lzn?=
 =?us-ascii?Q?QYNgSxeWr9cFn/PB6e/BrvfAoZoEh1T6z5eK/frAUY5qghrMSuBwFq3DgJF5?=
 =?us-ascii?Q?BoSOawPmEVHjd4s0iXTzTRUTLqmET+ZnQ97dTlKOWq8jfHJw2cv8WPHTb/nH?=
 =?us-ascii?Q?DF2DYRRcEGXxYXRzRolj/Vh8j2K2ypT9MnfLxoVoTSkOPC6LMI0+gvKR8+T9?=
 =?us-ascii?Q?L4cxgoiLsN0hAqPEMsDOLepptwSSDHwdaupvlDzQTo1AK0LOve9aOpGz7Kbg?=
 =?us-ascii?Q?wczkzcXXeN9bpinld6bm3FNKo+RamEwgFKoS8YnFcYroUNZhlggyBGOw9ymr?=
 =?us-ascii?Q?49Br3h8wkaGoMiGfBam45yaApwxWHAfPRigND1wJzfcgbwfvIz2L6ytwA6wU?=
 =?us-ascii?Q?0kTM4I7bWahHi1Ahwv8+5W4qCgcq1ENf5IzhmxkmHrePyAR85EMNd4bkMA3O?=
 =?us-ascii?Q?Ko0iyxc6R6liM4uA/UeqYdyFV9FVnjOcwQOwCHvyp+d3zEqPK3bbIZf/sBSJ?=
 =?us-ascii?Q?Ci3LKK/ciELLXOvflcbQT/FlF2rvtE0fUhSSJSp6IbKLtDmZdcwUQ04KBuPf?=
 =?us-ascii?Q?phOZekgqi+wCsUvLe9J5AxjUhxaBRpSEApWgm9e2OWCBcp4qbJy248/qHI7K?=
 =?us-ascii?Q?2o57GiqNXQywvHU6aaFEypeV6g2BOlCUvTkExRVuh5ShxVQRLdRYboJ09RJn?=
 =?us-ascii?Q?uWnk/qlNnmPfgc+1kZzeCulssa+YQ2kDJb2KD6bg6P/DBVY4s/s+UHH6Vt03?=
 =?us-ascii?Q?ZYPbXJQJiBfmuA/Lcpe2i5xd17xfDiWqRRg6v/x1XtG5rApVvudVtkYN/GOv?=
 =?us-ascii?Q?kCbj1/+052LFePSTKeR3F/4rleMbELl1KaUd7zxdHOo3FVhmv5py8YsrbQkk?=
 =?us-ascii?Q?F8KHWYTthBt0SAUXybw/egkn9KvD20CJh8S+URxyAsdieV6g/6X4pM2Im+SH?=
 =?us-ascii?Q?aNqhXF1Pdl3NQfFc9/rpI4l9faV+i53YT3zNwUirVnDEr+O71x5oTUmPbrdN?=
 =?us-ascii?Q?gfRvVl1h73AgjHzy6R1kAVM7IdQewO83QVeShctIAKCMrgNIdEbkSy+ZL7Jt?=
 =?us-ascii?Q?CS/Ojaz9ZBNcT7AMU1+iJts8KUznAyGm2BsvsEkGQ8yuGOsGfBb7gs+p6Q8T?=
 =?us-ascii?Q?X5B5RmYkFOMQJ767yaRH0UW0A5oZi0Lp2fiwZY/jvhrJRAYQxraPKROhXTPC?=
 =?us-ascii?Q?4uw39SUZ+ZrzvjZnnOC6PtKD9uEM0FmQDshh9GnnTBQSf7IjVy7jZVoZ0gCM?=
 =?us-ascii?Q?+xuv6NL+bFwx4buXvFaGcOfcgC/CxJafSF9Cvtz7t8GjTAJH0zjAiHYZzjSl?=
 =?us-ascii?Q?+puzvSwMvEfzJ7H6LSnc4H4gmFovANNVZusa3vOdhkdChFR6ffu2vjuLLB+l?=
 =?us-ascii?Q?TB7LrGzL7d9n8ziPWJSWnwerf1OSWHMo/pIOe/EZF+QTjT2WOca2ABqzfONf?=
 =?us-ascii?Q?jHNV8pozGqZtHqCqrZaHYbtRjebcSXZWjpe4HjkhJzYh21UMIrnvRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rPo1NQI9fsnEkDYNG6PXTSxFXlsJjU7q4lywVx2Wvfo5mhU5i3aj21jr/sIj?=
 =?us-ascii?Q?wcia4DzBgplmppl/zIWjai+v3nK7MCAyfDRXipKiLJMTzxhmO0n9LVB9e7z+?=
 =?us-ascii?Q?xm91oaEyeu41Wc1gbCaM19ZcQRW+Ov91fBtX+Tnr18rz8gEfLqJC9oZDqTqJ?=
 =?us-ascii?Q?TKGOTpTt88poLxbydGzUKd+ZvhStUPpmpn87yipFl89/sr7VjN3pOFO25diX?=
 =?us-ascii?Q?57WFlTt4MDVSm1t4AToWQpnLiyD5SGFRwIPJcj/tpSn0GvSAbD6wOgbN6A54?=
 =?us-ascii?Q?yCE5l6y9Q6Cr0U/9crOm2n+dX5XBrG8Msg5o1gR/D562L0sAcFJoeMAmwtNL?=
 =?us-ascii?Q?MqZyS5sb9rTWxDrk2tw8tYEPfKbqLsvRpJkTOCJvQixoJk/3kSuqOp05ju5l?=
 =?us-ascii?Q?Y5/kcNgrt0av2LGm7EPjqLaVMayExSYi39FUz+UA56g3DgyyrmErDbhX+9H5?=
 =?us-ascii?Q?ykRSXJum8E7odtcMh4Xuy05nkMz9bkbrU+m4rnQEZe0/Uv52ZJlpH7aXrwEW?=
 =?us-ascii?Q?fRkwwGbakEYYKsekfFi++MIp/5pniL2mfYbJRjJp6rvGrHbSJ2j96Pc2mz5R?=
 =?us-ascii?Q?hudu+Ysn1hZBdR+Z4cVBCcxkCrKiYzbzBGr6E4QSQO/9pMhaMs2QMLQgvxzc?=
 =?us-ascii?Q?DUfSrlXFlSM0j4azIYtMnO6a+70TGZ7TsKrGxNwyk7MN3e63PO8ZO0PPTYPm?=
 =?us-ascii?Q?D7vaxLuEJuoZqQgkt0aw5ufjoaGEdThi4yvRxPhjG4nMNBJow64WHtLTl6gC?=
 =?us-ascii?Q?EnhLt/b/PqiotGz2aJh9r1Kh82glvFV6lWkVR487HLOvoQP9xdvg1Bs5a2s7?=
 =?us-ascii?Q?iaL9Pcq0YWR3wAhN/boHNsgFZX6eH7U3RmPgSj9s/laVRbxDn4ZhMb7PNgrU?=
 =?us-ascii?Q?YSNBg/uKxrucBkPTajqzY7ZwRj7Yj3+/RfRzq58wg7IcnbZKsvF7uv0vV2eZ?=
 =?us-ascii?Q?9lVVBFURrSQZ94DEjl718xcn/GEP493Xgp7de2JyybKLmhlEZa8PpmwNCV03?=
 =?us-ascii?Q?vRHXDwQ1INr7EF5b53og/CDXk27HXq+f9cN9WpuMA58VPaBe025nRvN+I+Ig?=
 =?us-ascii?Q?g/cbFmUFbbCViCrcXRsamrgxUWEy1Fe0TNnJdX6hcnciP9M6MJ2xwqYp4Om2?=
 =?us-ascii?Q?ZD7T8IvUKXvZbXTHIxpmrLPK42OujFqO5GUOaNdO5J4ni3me4KZD+uFaBctw?=
 =?us-ascii?Q?duV/65ClRfB7x0F0fQ9pURYUJuVCkxE7Ap+oQ58mVQcx5QRxx6cCOCP26wFv?=
 =?us-ascii?Q?VmOhxhTOEIvfc4HM29ynwf3+hI53KRPp/gmGvODP3GxHyuzkQ59F16Pt2md+?=
 =?us-ascii?Q?YtQbgMwLKrvuxtEBkiAaYxccdBTx32umWG38k1sD3xf8BtbYDuKBlMEkVKeN?=
 =?us-ascii?Q?4gej2W+N904zGNqTgZHs4BWCUQ25JgTWbyCDzzY30e979mv1yM/S8UY8dOeE?=
 =?us-ascii?Q?ETMfKhAcF1+m8ivK3Ojx23ifo1QmfTTsBdobKUjDtKo5za84dHidHHnu//Oy?=
 =?us-ascii?Q?lppEh26sbDd7hUFPHdYZ315ClkR2L+jxE/jzIJusHn8IUWuX3qQmmWd0iDTB?=
 =?us-ascii?Q?UkL9iz4vd9YGPR9cecPUOaBuMhvtZfM0o0du+al4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73201f2c-a1c1-4042-7f05-08dd4cc62667
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:06:49.1483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh51nVlkgA/sEY9a2uYh/sHGvXq2Ugg1KyaVlCv93bEHWKdpw/ITnNoPiD+RSt1C3W+Fh8OXUPIzAqWfWZSSOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Refer to audio graph card, add playback-only and capture-only property
for imx-audio-card.yaml for the case that only playback or capture is
supported.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index f7ad5ea2491e..86571fa930f6 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -46,6 +46,14 @@ patternProperties:
         description: see tdm-slot.txt.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      playback-only:
+        description: link is used only for playback
+        $ref: /schemas/types.yaml#/definitions/flag
+
+      capture-only:
+        description: link is used only for capture
+        $ref: /schemas/types.yaml#/definitions/flag
+
       cpu:
         description: Holds subnode which indicates cpu dai.
         type: object
-- 
2.34.1


