Return-Path: <linuxppc-dev+bounces-11258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CDFB3463B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 17:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9Zsm5JgJz30Vr;
	Tue, 26 Aug 2025 01:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756136812;
	cv=pass; b=kpO7Dk963wSUAMp8V7JlIipGtQehi4elsNHViY60buaAHhZQsEtoRFph0zoq5bwBHO6mFkizL1OI3oljHBF1dk6u84iWaZRLOonCLYiFlgZxwlCIyTtbSXQ5NgzNERpUzcn87b9Wtd+viULa41w4r6Qa7HmM57qE/OMLy+NY66Lko47yEibDuW3tACqR/6PORdzIZzGgZlEUaK8sEX+U6Xf+f/ciq1+QXtqMW1uq7lyKc+bs5i6WQl+jf+B8spFlfuH9V9YZZYw5QrnN4ARV6+Flp2v9aTTIHUwfC1ie3U7b3nL9JH+V/rj6p/PRVTxEyjdQ/yqWNtmlfR9XPB5CCw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756136812; c=relaxed/relaxed;
	bh=lX+zHQ4c6OEktZD0D2m33R8PS7VlN/N0n/ZRk34tuEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FMv8BlHnBEPM2S6kHLIxUzBygItXUmnn25bOenaZE68vQvK7KNQ1cdZVCljQunUJp2qpAOpweJttwFFhyo9UETfUicCPxocefio3l/1CNtS89aR6Gc0KYKzWiv5mJZQ01iZGpDfKyYLr+mKH4LlMGQJGoWakORiibolkIXZRhN8m0YCquy/pVyBH7AB1CqWlV4gAsKfo17SDi/DQ+CIAYLopKN+xzf8knj8yoEvQQ1ftZLy/79bUl8cxRMXgtWShn+FJXmVy/Nje40P2aYLQXVWHoYndAorlEwaUB1id42KCjqDImmt79s6noRs38XNwNFTrMyAbdPrRN+6EaR0BzQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=I0CWg/Vn; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=I0CWg/Vn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9Zsk47d6z2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 01:46:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0YgeNuDzbOcxL6TABx0FhdWFVthYW3V8xj3XLYoDmZHrY8CskipghtT2f9vZEFWQY8eLxZAMzvw4m+VMDCcYo1zMqrTcuZ4vlyXP03aNXLx6De8U48j9UCQVIMxM3pq0FKgsqiFJ470a045CzE0Ql/iXUwndOy9PVfX3UbBlM8cjSYLZveEbMGBldEI8tpBP2j0/+blljfOUboZlgAXsrHBAYQM4wAr08kpx1a++6dlHATiM2FWZVFVt5sB9ZyKcWhh/RkHoFJgF+wJt3blnDieB6M18UOCokuzCRjDGsrs8vKSo6K/z9uvQBr6yhykx8LX1vCXMh4k+QKtYB9TTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lX+zHQ4c6OEktZD0D2m33R8PS7VlN/N0n/ZRk34tuEs=;
 b=vg7CkbZFNuxUL6ymFPOKF1te45Y+QjU0S1H7KBmimeApeE+khFiRj1ssk1OLfukiRVj+2qJatbmR1BJRmi3VZ4NfoW+th3zpGVa+V5OuqTx4YqJX3k6NznoxJjiKCyvQQiNPzPuuF3WWHYXVKXMfQBT/yPzjkJgLTpRTarAM4fycgRN/IOzbG+/FFnYKkS7Xt9N2DKkkq5ghuTmruWeyAYyQN7GN/xUrOR4c5eSvnfK3uNCOFIOLnm3YxejIPz0YWUWl7KT8MzgIFvMKxC7jbb4057RLUBP8axMQDnLtsKK0nravxDHVbC39WAbpscNEChgxkIpWL4Uo1hB9uBDjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX+zHQ4c6OEktZD0D2m33R8PS7VlN/N0n/ZRk34tuEs=;
 b=I0CWg/VnmmobAGXPktft9kwNuFtrvwjLaGG3DhhVaT+lk9fy9++cUNr6w+uucEEBeTaZa8UcYTtu/E4XB8+VHJYRatokwv9bL0eCRYX9HeP4q8VTz9AjhJUWChHx1CQhrC2ModvnngfqgueLM7uebCdagnpBXDp/r3G7rHlKxxlC1afGdKrUO7MMiW/OiEWPSh2saJuikBWwTNXLd7EHVckcpNMC4qz9p42hGhT7XlGiEz7IoPKmEN5ldAB4Fk+mChBgHLp8qu+oBaIsw//OmMiZktWTwFCU7x6puuS9k7wD4gPmnsTAxscFq9CK0RqxgSCUB2Y5G6udP3EnFZGqNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB8765.eurprd04.prod.outlook.com (2603:10a6:102:20c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.12; Mon, 25 Aug
 2025 15:46:25 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%7]) with mapi id 15.20.9073.010; Mon, 25 Aug 2025
 15:46:25 +0000
Date: Mon, 25 Aug 2025 18:46:22 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: fsl-mc: Check return value of
 platform_get_resource()
Message-ID: <6o6t4cnfr2untfmm2yykhnh3h24vpk42hfzsejyf4krkcpbzow@ohrp56cwvvzv>
References: <aKwuK6TRr5XNYQ8u@pc>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKwuK6TRr5XNYQ8u@pc>
X-ClientProxiedBy: AS4P191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::11) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 58050df9-322d-4e03-8f9b-08dde3ee8c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J4UjAeUs0IY8ZTuhog/7He2qYlDwiAYXPPffDorqvGg9xUyq7oR7WW+5ypg2?=
 =?us-ascii?Q?u238/K1IbDGdo52TCp5aby9vqIPXV/jPyaZ+3zUSVGuoaerNXXf2vk5dYPQS?=
 =?us-ascii?Q?u3AxTmsLMRlu4wG4lJa8GudQRTBraTcn6mgLpBE8HRWBzSe+F+7jFsN5aRZr?=
 =?us-ascii?Q?mUxDTZ+DHTeYpBHGUvSZDlInA0pvnN2ozB16L7pI0NtFofiTsnipYlhLVnoI?=
 =?us-ascii?Q?h/aCUJruYCi0lowQHc6OtZjc/TGjBdCZCUrtk9rk4sxyfx02QriGrDRSAbMy?=
 =?us-ascii?Q?+ArPX2/t0ItjlTXr+BUxg8Sa8vSnAWHdieR/W6dQx2jt0ZvdKIe4Juifx/PZ?=
 =?us-ascii?Q?YlwxNU9YE5+xXpF3IZMbRGOXB1kmIpV78YfReJillGUaSQr5oLFb/NUe76MB?=
 =?us-ascii?Q?9a4pY6rpgZgQM1u87A+VRHsdb5p9sVcJdDepisonFMfaFb570O8Vxg0R42HQ?=
 =?us-ascii?Q?Tajohe1SZXVCvqOkyAAlKNc82tnRXM7uFnxQ/T3uUpcZtKtL+CkJPcEK/pfW?=
 =?us-ascii?Q?Hbi+dhsfySWEtXYZJNwvhVRlI0EyPRR+6caeU2qf1nhyLNkxEhuMhza8+Zo4?=
 =?us-ascii?Q?sIB8NQyIQOcqchFmNtukaTrT8v6ChVz6luxU/lCySALKKfaM2SL6lIw2HNU5?=
 =?us-ascii?Q?RoV6Urf095cmr595uNQGUiL3pB9QaDUXoSHm0T8YdR75NbFm8PQHR3Y+ZtS1?=
 =?us-ascii?Q?XiY3gTRJtcllZKVyzc50j50OsO/8th00dsCTKhtpXV9eUV0Nker4cdUod190?=
 =?us-ascii?Q?ZzuzPlucDTlUcGO7zHCqdx2fbR2vVHT11naSdqjvRvC8LD9RlW61yP1+kSHm?=
 =?us-ascii?Q?h1DfUIFUuwd7oJ1S5kI8NSyWlBXYNH4LANochhh7tqDuJ2SmzwzioGl+mhOQ?=
 =?us-ascii?Q?hSlYO6fg8RNFMZWaMp8w6HImTaaObvTCGaIrV3LJIYVAzDaqGE4+/hdPnxx9?=
 =?us-ascii?Q?UknjhAPHuKlO0eH2dCCpr8AHHPKRzyX/lbeOx3QnjbZV0TZXiS+HkLoSoW3E?=
 =?us-ascii?Q?S9Ssd94vkhPunskDxPGd8os++4POul99qjKFwTN85qqbR+T/K8S2qhJw67gY?=
 =?us-ascii?Q?2jVKbHv4aKz3Btl0MFdSYtb0NaJKksXIj+XAuanE6J09LvYZ/nxc4wN78tX+?=
 =?us-ascii?Q?RJ+gwEQ80x+3K1k28BcMJrPT+0uIUxG30kGi/IlMdstyHQKvMcxL81sisM9V?=
 =?us-ascii?Q?DcXQOhcKMK8Y+yQ/3X+IT+ZjYIYylzn8mcu+mzG9SHCr5OgVr69W1YQbworL?=
 =?us-ascii?Q?xx21VqniUGXBgPnlhHtuGJ7NY33HCMt+/i5yucztLHxvFP1YFLKwgz3Wom1W?=
 =?us-ascii?Q?WlT9E4irqq5mIJltQ4wDgr4GQ8vfiaMjXdbyVLkdIXQZirfOP/WdkLOQzLM4?=
 =?us-ascii?Q?tYUCMFzhGIidbb8VeseUc2pbqlhWhS7jq4hRJPJaMTdpWh7f3+NiMusyNxhi?=
 =?us-ascii?Q?fEM7712P9V4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o5DP2XXMHz8Gbgad2ofMGZYDCB02USL27cyAosARsjKyAzjmYvTrZ6mXxVkR?=
 =?us-ascii?Q?wQnQkEdWflbzec9o2f66EEvolk2uazfpxFvMmK0UAW6RebNfrWcf1FtsBOqi?=
 =?us-ascii?Q?l98WJrad3jkfRpP/0S4RqdVTh2TdHTmBcj27m4TbftWQxmiLyC3Ho3Z5S4L/?=
 =?us-ascii?Q?FqEqXDeleDJinSo3s7YrWw7m/P9IsVf10zRxGZJru6kzjG1fB7XXb6n5X//f?=
 =?us-ascii?Q?1bfW3A8RorsAmituJS9FG9kDMat80IFaC9zXn7oiz8sA4aClVnCLy5HmHxaH?=
 =?us-ascii?Q?BIrxDAbbnfI2UIYifRokQxRPgNsXK8YStVmWDeZUgfUmJB8lVApkn2GzHk/N?=
 =?us-ascii?Q?lYFEn17XOvbEU/G3CgRG9I+1XNKKHNYyaO6FMdva1ZO0idqppJnlpt5wNYFe?=
 =?us-ascii?Q?Og1jzC6dSTHzH187cgyZG7c7aqg/JA6233kEQgg4x31Tsfw3Id8mMpGfXWw/?=
 =?us-ascii?Q?nQOhWU48Z+Z73inUT1hd5v0yffg48SrWOvBGSd9K5WWc80dfeKawBu+JZILi?=
 =?us-ascii?Q?K8UVXDdniWeNVzPuRkOVwGpk8YmPifouyxV3wgO4tQMV80vXE3iiyVWcuAdT?=
 =?us-ascii?Q?iWuXpbYwRwF5DqHojTeBv7gLkNSsHAiG1KUmw3y5NH0m71wZ3pLFFhRKP7Xd?=
 =?us-ascii?Q?fv1vRcylBWjdt+RM9YKsxdRdMguu+CmUvb7tzupg9dWMe8Dohkwb1P8hSKDb?=
 =?us-ascii?Q?G6kefzmtGauTzLuY3Ta1FkEAxtMKBwkL+U2pVQj93hPPecpAdun50X0KCkIr?=
 =?us-ascii?Q?PJqbgtsGJtpWJp1iZOUFtS7DV3DvOG7S2o6CdTgqydQM4+mCegiWjVXtw1JX?=
 =?us-ascii?Q?EBkc5X3kIwzS2T06gNg6F6O+zxWkS1eLuqzcRDbup03Sv0gDE3BVKzXaPkz4?=
 =?us-ascii?Q?CkS8h2h7u1mNu7LxXrlEm3Iw+um6biP9jtxS+/5XISo+3qzau0sWWahRj6YC?=
 =?us-ascii?Q?4Sd62xONX0bhJaHm8jpGgKJsyDC6oTofJlyWG9LZ0+zUP1Z+ESuNPMLWzRF+?=
 =?us-ascii?Q?HLaFZtEsvjxeKjLupMuoWt7w9nph9/zLhpDxpk5mFK4/iHgpaRZDh15zrfSr?=
 =?us-ascii?Q?EwR+XSyF9wty3PMuPAYjc+lDUNMQ8bfqOjtZDsYHRwucKSYvmvTjYseRZtS+?=
 =?us-ascii?Q?JMqnzu26o+b1yfgxUQ78b45X3dF1BbyO0Bf+sXc2ELpq+RlVno9MIO5l+DTn?=
 =?us-ascii?Q?sa11E98zDNUtJxiMSF5nhvbvDGuOxhr0vQQRuIZPBgLsphMMF04yotRSesp/?=
 =?us-ascii?Q?sT+2KbuSCHofUNk3GCvLDstAOn4di1dMj2bfJx9CFLWu7d9s25qx1r997A0s?=
 =?us-ascii?Q?9VSttUxS5KbQJ3E1rH9nVFVQtd51J7HyObcNL44E6SRKtFqiNA4eVqQSsU68?=
 =?us-ascii?Q?pZSoEWtFZCLsuWtbi39A4CBhC9gG5qxkh4v12IaKeIx+yjVkZO53VevNUKfa?=
 =?us-ascii?Q?FMvbCfjmYkhnnOVXrp3eNLzxIt8gj7p7GXA0oqDv2bMgJ0qqmNI7qqiXZTdD?=
 =?us-ascii?Q?Vgp1h15UWZrzSAOSytsnO1rv9VQ7/I8TgrHe950EQzilPKZIEJd7trjI2Bid?=
 =?us-ascii?Q?HGVuXRNHwTYE0Igc4u+/S29t4TsCF6M7zjCkvhiB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58050df9-322d-4e03-8f9b-08dde3ee8c51
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 15:46:25.3973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQtDwtVLBeqsMh7O6fUquqFgiOmkrPFeE0VnFiGxGhtI/UW/U+JUammsB/CKJnkjNvRmpdaQgM7q56gxtMnM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8765
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 10:34:35AM +0100, Salah Triki wrote:
> platform_get_resource() returns NULL in case of failure, so check its
> return value and propagate the error in order to prevent NULL pointer
> dereference.
> 
> Fixes: 6305166c8771 ("bus: fsl-mc: Add ACPI support for fsl-mc")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Salah Triki <salah.triki@gmail.com>

Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>

> ---
> Changes in v2:
>    - Add Fixes and Cc tags, as suggested by Markus Elfring and Christophe
>      Leroy.
>    - Remove blank line before the if statement, as suggested by Markus
>      Elfring.
>    - Replace ENODEV with EINVAL, as suggestd by Christophe Leroy.
> 
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 7671bd158545..cd83cd564736 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -1105,6 +1105,9 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
>  	 * Get physical address of MC portal for the root DPRC:
>  	 */
>  	plat_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!plat_res)
> +		return -EINVAL;
> +
>  	mc_portal_phys_addr = plat_res->start;
>  	mc_portal_size = resource_size(plat_res);
>  	mc_portal_base_phys_addr = mc_portal_phys_addr & ~0x3ffffff;
> -- 
> 2.43.0
>

