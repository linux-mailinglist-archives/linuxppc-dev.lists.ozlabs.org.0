Return-Path: <linuxppc-dev+bounces-6873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B08A5B8D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:58:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjhL3YJdz3btR;
	Tue, 11 Mar 2025 16:57:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672626;
	cv=pass; b=MWqAkP7wLLVbY74ceSxbvyr4i+mDHCbsEKN/CxGOXmS0rc+jwPzqcDRxf3otbtz4ihdDLQt+WGQvw2uR0ZH9l7RC7Aws7tgd0NwIvrCRQjk8YBPYSVuQ7qOYzEePuHSubgAu3DwEzx63DAYSHYfGu3ba54vH/3wvhP5l4LckAWU3wBun9kJU9Tovv2zxo3kdNf3FIhZbSN7cvByNPaoj2oM8aON6JDPd8j8ATZWDurZcZtKvjMyUtonwJXFrzIY9rGjMkT02G50iBtobMmOMGjNh4tG/MwTkuCu1U6FMqwXpKoLXig2jgWrrdpZc+iP6THGpUY/Vte0eB2Ee+7ORDw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672626; c=relaxed/relaxed;
	bh=eEsVbufs98qUs9KjW62gIIdn4YkSbcu1vV1lgjh+tRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S/cHvsCdzem0dU4FNWBUMQT6ue0qBsQ4+Nr4107cWBq195OC+S3EwceDeLvhci5Asz7HE8ykuOs0yFQtVgaAgfScZ02efPHw3SDEm84vdVvrfn3iDHQjIMQ0kRMfB8noicbttniO/TEcVhoICGu+l+WNNQxg0cqzTTO+2W8MoTc+SdOZJ4p/ay8zaV1NFoonYfqXlsuBLEem3L9jIeZTS+hg2PQz5rHZfhUALfRuJba6majrJqvu1xxRYhPq+qUmo0gfGbtDa124zmIPzQVFILsxv9T0YDHMT3T2+NeFAk8ifXI+bgFFqvJiV0FfPyiStT5waZP/UzFXLXUFGa2hng==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mGM8gP/k; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mGM8gP/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjhK6thmz3bsZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:57:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z70PIjVO3y0KLg6SAISjd83SCZcf6KyJuAVQ5gCDjqCZox4KnksPD2sePgGNx2XnoSrJP3ShjlGKaYfo2kQejwALxEHpK6j8XUCoi1PFHh6J0L52jVzF2sq8T7iJSV3X9O1BMrwhv6dpEIEWm5vvWCabGakmFcXp8ouYCxp6mT73cm284kwmGQlEI18Jztit4H2XkzviMiN5OOJfbRlM7D5uGUtHW6A6KMvlsHs+lXfXXcEzixIFyWb2IoElDU+UUc/QhIp9pKbvovX0Oo1jNHLiMMerfgXmOl2cq/601u24AtAXJSLxJwTRX3ROnBA8uHRtBMcQwHwv1ZepEYSXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEsVbufs98qUs9KjW62gIIdn4YkSbcu1vV1lgjh+tRY=;
 b=iQbnrWnW1BCcmBiHDcvpuKoJW4GRlhsTUKSd9as+ChprVVpTGgKxa4FvhdULb5DyShunFQpdLzwRs5zGxrvf1kn94zIVO55G2TLeVQM0z5T/wWsLT4cn4o+S1EOPdwSURQg4dnsHQeUMYMO9JbJVpdVKCWCcKMh/BrICGYFiMJtWTm6r1WIq1MCZIsIXqMKzhxfPOxGJBBCn39Ix+K7H2qFYqGtf0y+DM0wD5YueVHGWXqC55crodY7gFpDDAxeILgbJcplg6eIaU55OGhbVmIQtYG+hOZLHQY3eeyWOGpXvzFOJS5o7u209XY7yfSAoEk6k4ISNX6OAJ+uP1tchcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEsVbufs98qUs9KjW62gIIdn4YkSbcu1vV1lgjh+tRY=;
 b=mGM8gP/k3KlXWYxLpfo7iA9C/YuSKjSGMCOYn5M0V9+U2d8Hi3PLJ+nH3gCMsZOIs7uAwuTUzswOkb+5AoVpHca62ccOBItZ7N+2AH2BfQf8unA16/l5cdp9omtrfkSVpsx9TmoC8AHZYxy1ieOST47yEIOQqHUOghaMDozhfy/ZIq25BhiusXHfDOU6ZIMM58CDZyIO7G5P4jWQoBbvBYjWVdgUSf2kVEdjw+RC2MObliPkjWK/AX9T4SVbHJAGOk0/DaobBybXr9mqNS39BTXFHdoZonkg/eW/qSTFdlGHSw+iB2FOfFGZ8WhhffMh4a5E33SL/ehDnL88uhqSEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:57:02 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:57:02 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 net-next 13/14] net: enetc: add loopback support for i.MX95 ENETC PF
Date: Tue, 11 Mar 2025 13:38:29 +0800
Message-Id: <20250311053830.1516523-14-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eba2a1c-ed12-4d6a-a3bb-08dd60618b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?es4UQh6+onT1WvFMrf8fK7uxVh6hmVH0TCQ1i0zp+5FAAhHVwynHac/5ODVO?=
 =?us-ascii?Q?LLHmAo8oaNoj81BbLjlxARZOO48HN/pMkVzV0YZZyKbfEuhUwsh/TB9mJjRD?=
 =?us-ascii?Q?5td2lfRtjSit1Qua9UeywqbynlXwgCdKhYSrgLN+yfFDqPefMo6IrnIX6/Rf?=
 =?us-ascii?Q?ynDSZyiLRYEGh28EB35C+vepGc+R52Pm889/I0O1RBIbGtjtBYD7/pmXreiJ?=
 =?us-ascii?Q?6fFENFOi7tte6n2a0xeFvD/PoejRiq8Oe/D1YpmI06Xsnd6bGNMO+KOf8ojR?=
 =?us-ascii?Q?Nxz77d1Me/prQWB8i34sg1jVbvgkwhEdm5Tbc+pdJn5UmevWKhgzX8K8bOna?=
 =?us-ascii?Q?o6QAiOfbesa+Zf6bcwcmZeCyVVu/TCDgQnGjeJvAePAy4yeYzeJh4SgY0ZjI?=
 =?us-ascii?Q?Mx1m5ifxxhH/PgazFZS08l3U+Mi2jk3xIQRikpSkQpjnRegmqKnGKa5dF4s2?=
 =?us-ascii?Q?381w2IV7/B5yQNheEwcgeWkhxmKJmDwBv53NAjeH4KSea1MK0M7Kja533PRn?=
 =?us-ascii?Q?hv7EiG5Vm4B6YIhcnDItVqbxWF1+gzeEOKlKBJQQkJ2UDHCFIiXNJgDQ1FGX?=
 =?us-ascii?Q?Lgd8HPndxr7CpBevKpSqX1BNKHsc5x2zJ3WhJgtk7tzA3yHCkT4WgBhoqXRt?=
 =?us-ascii?Q?O049xP1kw754VkX5qlecEEmNySmZE/l2vU4tf6HBxSgncuTRTEehEshnv2MC?=
 =?us-ascii?Q?9BUIkVPKMdV4fIGntUDeg9LICLSWvEFKBZVSDQZsGKwYZGQhrsScoMegQ5eQ?=
 =?us-ascii?Q?ACyHPnqrF3w5ae8InMQ7zGD/u2nxul5v2lOqTOqCO6kSBO9kPpBNG/GEoBKh?=
 =?us-ascii?Q?NI14Fq9ltai4IhSN/qhwklwfznOZeRTrwvkgEz8BOTHQJtRFZLZrzkf1wl7X?=
 =?us-ascii?Q?hJ34H0Zikj9jThc85ErcMxBS7q+5MeUrpTLh7tSrymqqmGMy+7ofp4TFWnwH?=
 =?us-ascii?Q?nTTs58AFQn3UR9UIwJ8KhbZp4VDgTf+SWrlc9hBGJQ5NZfITi4Eem7XBl775?=
 =?us-ascii?Q?JVNvohi1hXs7XqWsjuYDM8871aVVU/7sGN5kx5vbKuMqWfSvdSKmltMHgfUF?=
 =?us-ascii?Q?WMUKuFdKoN2JYESaU3NeneQE05YY3Q5UlXQnaqhuAow5q4UXQI/kHNfgDga8?=
 =?us-ascii?Q?vi8c7pch2HXcLFV0FyHMcJGK6xlZ9CrvlGylHRPHfvgSBvxg3+zBQ46xPJpZ?=
 =?us-ascii?Q?9FWI7Ofpc6c+G9xzyxxN4YfoYWX+VXuPvzBIBqgH902Rj5I7kvu4EMqA2jFy?=
 =?us-ascii?Q?PAEfSqJU8reQ6AgW7kkxq4KQ8i1XVH0gnXjlYy8k5Cwg2tKlIqEuzDoMkjzY?=
 =?us-ascii?Q?ndxwqdi2GFZqOG2iYSaEKrPYYCNpJDWQ56K4skjZWBCwAx4mXazZBtUCU6Cv?=
 =?us-ascii?Q?wc66sjQGfP3n1EA053eO8fnDJfaej6FqMvxbN7Od0JrAX6jmo+LgjEMqAnGK?=
 =?us-ascii?Q?Nz+esoDYZUH+os5FVkWjSUwP0gUhwm9Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZhkxAS0GXCIEJACVDFhbyYuSibDuBHpgQMp5pCpqkHujC29GkLRyNfMJn271?=
 =?us-ascii?Q?iP1/QcdvtIO7Qk0/zAM4CinuExjziXCpr9x6FmVp2d8XnKsZWYcnrjbLsY0a?=
 =?us-ascii?Q?mZerkbEbGKk74z5HIW7OlsfsyktqfQh7vf3Pu9w+IJGSdPJP2q/HKTDTdldw?=
 =?us-ascii?Q?MWwZOBjmnIbPqJzhef4JXl7OUiKB7cr9u0yxkH5hsBpCJvTBiPbBBepQr98H?=
 =?us-ascii?Q?KxJCLpcXp4p0iqolwnsZOJiKqRDCalmNNRAVLhLa5Io4SGuAXwCt9WAXFny9?=
 =?us-ascii?Q?DxDf9rdKEwsmhBHAcYc3OwSdz37L4uzMeIrv7g3Cs2FAzTD7a66DSCE6HMMq?=
 =?us-ascii?Q?Ug3aIlaBzJZa+Bmh9SttG/e2JwrrN8RIGoEwRTiDYljMdoaTiXG/HJTNHimC?=
 =?us-ascii?Q?td8u2MTi+pF3kSfESGcElScOax6dLHurnG2cYrLpvgUF+PcgtVBRLiLKnN09?=
 =?us-ascii?Q?9W1vvPQAUkCdrFmx+2DWJ9cGLOSO8Z4n6kllQ84uT7wxHyADrLTu1eP/L1Lu?=
 =?us-ascii?Q?FJ/7Oz+iZdk2HLLygB0z7GjhBRtv/3eKy6G2ItZ3b2bHVxlC11QfCbp4sdIB?=
 =?us-ascii?Q?qo7UsRrpaGTnWhpjDTuo8/hYSzpSYnnbP5O8B6/VED62NVfwYI50/TCqvOyq?=
 =?us-ascii?Q?MYUtwsgnUrT1svxiwgDdrn8lFKO4QxH/93c7RWhNNJ5TfTyQ1w0YFOxKICbg?=
 =?us-ascii?Q?0toFoW19Oh75Gj/5bYABN1OXnvBrZTo/aYLBV+ZmI2GvhUbq/XtX58dZX1PV?=
 =?us-ascii?Q?vUSbJYVWf20P4wI1ck+MAtpHIyjq7O3fGdN5NfwLXW/bmG4ixnh76LJ+XsLX?=
 =?us-ascii?Q?DicICVHDEhbsx/DGdJT8ODzIlwwgOtij4yQ0MUQUdl9KgydSFrQ0DsBi+mRc?=
 =?us-ascii?Q?+J8ng4XQJv8a5MEnx7g73YrS4NpVsv2VtYOSNYzMrZPkcN+bK4vQjDx+bUB1?=
 =?us-ascii?Q?BnY8vmIb2wXVHHdkRQK0ys3LT5/hLcDTE/WLYvSWM3J0zlv5d7ZbB8kP5LmC?=
 =?us-ascii?Q?09r1coK4VlrAIDKcjYmYBd6FhdrVzdw4Ye8oTS20aBAuzgC2ZJqzz+j5UroB?=
 =?us-ascii?Q?sTAz37wbjbIqzog0XfshbM/0R85dIbaL7YQamY0TSP1k3Mk6bGZBJlOntD1D?=
 =?us-ascii?Q?pbUwV7Y9NckuijUTLPiBoZu4EeXGvrE4X79bGtBtiCjP9uapgicJ8tO70WmK?=
 =?us-ascii?Q?f+mOhrqfTqJoKWpH0LH2ySKnFLyzjRNiGJRan1oe2qrG5LNAxovgBk4veWCF?=
 =?us-ascii?Q?RMlJiVs9yKz38UFhJKj1xuYNRRMIl9E1xJUQLyal3DUkeIXpuUqrYuqDV4Fm?=
 =?us-ascii?Q?+JFWzemIVbq4JMJLBKfdABHivkEuL2TDTXQX6/WiWzzZ8cdJQ2WlBy0S+lwB?=
 =?us-ascii?Q?bqiFtkuSNwaQXXXCa2HNalafslV1dllQygy4FOMy5J4OMMZVj6FHch54JPN8?=
 =?us-ascii?Q?WF0yM9/69+KJZxx8lqA1EZJW65cMutWgxKMeNyG5C4joUMKFxsZvte4zzx1/?=
 =?us-ascii?Q?g/dWKcoUzse1eBQDtkm5y3sgripPvgL4vmUJNpjYt9CTHWGrMundcK1TbKrB?=
 =?us-ascii?Q?2pIJPC3SLXvx5LC/LcIFltkSrkgzBt3NIa5U+Rs7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eba2a1c-ed12-4d6a-a3bb-08dd60618b27
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:57:02.1232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sF5XHUxuUZh239Law+CStzO5Qg9y3XwDFTZew0xs1hkZ0a89wQe3LqoKoue+9J/4sdqGOGTLcJh4XMi//KRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add internal loopback support for i.MX95 ENETC PF, the default loopback
mode is MAC level loopback, the MAC Tx data is looped back onto the Rx.
The MAC interface runs at a fixed 1:8 ratio of NETC clock in MAC-level
loopback mode, with no dependency on Tx clock.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc4_pf.c   | 18 ++++++++++++++++++
 .../ethernet/freescale/enetc/enetc_pf_common.c |  4 +---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 4abbbbef00ff..c169900ccb4a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -108,6 +108,21 @@ static void enetc4_pf_set_si_vlan_hash_filter(struct enetc_hw *hw,
 	enetc_port_wr(hw, ENETC4_PSIVHFR1(si), upper_32_bits(hash));
 }
 
+static void enetc4_pf_set_loopback(struct net_device *ndev, bool en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+	u32 val;
+
+	val = enetc_port_mac_rd(si, ENETC4_PM_CMD_CFG(0));
+	val = u32_replace_bits(val, en ? 1 : 0, PM_CMD_CFG_LOOP_EN);
+	/* Default to select MAC level loopback mode if loopback is enabled. */
+	val = u32_replace_bits(val, en ? LPBCK_MODE_MAC_LEVEL : 0,
+			       PM_CMD_CFG_LPBK_MODE);
+
+	enetc_port_mac_wr(si, ENETC4_PM_CMD_CFG(0), val);
+}
+
 static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
 {
 	struct enetc_mac_list_entry *entry;
@@ -714,6 +729,9 @@ static int enetc4_pf_set_features(struct net_device *ndev,
 		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
 	}
 
+	if (changed & NETIF_F_LOOPBACK)
+		enetc4_pf_set_loopback(ndev, !!(features & NETIF_F_LOOPBACK));
+
 	enetc_set_features(ndev, features);
 
 	return 0;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3f7ccc482301..0a2b8769a175 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -134,10 +134,8 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
-	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~NETIF_F_LOOPBACK;
+	if (!is_enetc_rev1(si))
 		goto end;
-	}
 
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
-- 
2.34.1


