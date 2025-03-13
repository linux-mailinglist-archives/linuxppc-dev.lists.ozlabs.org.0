Return-Path: <linuxppc-dev+bounces-6962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B746A5F66C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:51:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD86P3bC1z30Tp;
	Fri, 14 Mar 2025 00:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873869;
	cv=pass; b=FYGYR4zXlLnjrtZWfX1z45VYlT8lJBKj7mO0lY53+42Qu62DZ7KeqSh2J48cTpS64eEJNClag73yR4O84VoWAxXCaPAVyHzay5vXWkKUefBWpLCjBN7mX5PxxWzs1YlDXTRb/mUpEK+y3SYxF+hLYBFodntKymPSG+Ra5QpzU/dKdlONoZ7h7hw+TQLemOIOQRJ4XMPVTUZldYxRU0l+JPpi9Uq8vUnhtfEeWs4bjxcWpV6Fy3+vridYkIWs/BkZYZoAERL2tZCjNEeHS9BiOIa+BidffMmfWlCO44Ztm4mVR1mydsMK7pwYVaZWw94/pQ1E04aaJ4OYa6rHbkZ/pw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873869; c=relaxed/relaxed;
	bh=23t+I/bzARZLIviDYzQ6V/+fl+F8XkQv7IGr0rx6INg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mWSsrqqLPXBfyf0/YjM8njqumSx59gssX5lu5zlX6EaxU0KtX/CtHTwjvCjKAIFJQSdi3C24HX/nNC20d1gGKsnNL6KZVJotv/z5kV7TSf+8MUouiaQlRqx3eAa9yHpN9nTIC7ej+kyEh9ybLMwI/i/zhsmOoqRFObIGZ1MHHX0T3xP1wSjRd3g3whsIC2brAw9LFwBA9s4IZPEwKPGkFMJnrkB8loi8voBktqfyGLK46vl5+YybWZq4IDHqcCLSs48UAwBsU2yaCfaIUuYFjlq+fhxhYz8QyjIo/AkH+QwgD9K7NH/xgiUPSbBardi8bEf6OdtGtaA0HVtjesyn3w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BNm1lL4W; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::605; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BNm1lL4W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::605; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD86J3yLJz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:51:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Knkj0MdcAVBPtMcjRwkhE+AbeY6R+GmW5ixH33ukK4FV2mkouZqNluaDAI83wqN1DuxuDhJa1NlPsMrw8iKFwzJ7RwxlGcaYpat4CMMPmr8Kh9CZKuKRGKMlgTV4lGN4sYDe7qdZID1C979obWMjC0DUF/lIEpa7nJVCg3y6DPzeSk6+iWJQ/EfsmvZoqEgK0cs+Kh+37uartXQByD+ddRqULIj8pbD3O0mF3vbpLnLQbqXP5VnLhBjWmde77kmAuGIkfLRwfw2z1aEvZpb27RzKMJGH3vF7m60nH42U5pzZ6AZq+PCSCDLXBgtuoSpnM+pZjUXks8bDL+DxfsAvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23t+I/bzARZLIviDYzQ6V/+fl+F8XkQv7IGr0rx6INg=;
 b=YWu73rVXk/D9x6nNOIQBVx0WxyohU4idUhbTBrQWUOrVFLl1tiLU4y/4ZRzRDp1FNMs7N4WDf/trpGP2BA2eGtzkiKxXciG1ep2uQQkTnIawsOGDFBL90rF5cQpbwnea+WDqd3iOrMjCblhjm102b9R3hVsZ107XVH2MeC40ZzCoycuwieb4c5AoUHnH5wJG8M0wC+8uah+YZ8T8bhcoMQxIDSjGMcaWHKpuSnSx5rnahaklOocM272ttG1+8t0Qp1u0ky9am0VN07lasPTNYXT9wXDRv856qqbvVN/HsLsFvenjXZ/3gvBSuiLcCZD/AZLD76UzdqatCgvF+rQ2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23t+I/bzARZLIviDYzQ6V/+fl+F8XkQv7IGr0rx6INg=;
 b=BNm1lL4WC+Nur5SGS8ZvB0LbUwIxluRsVV7JDb2iwOXNWBQgVCgSFBcj2+9gI/wDDnfddBeCtU8q6ZfbKm/YJvBazbF2ebwGkzuzmkrX529CHu9fA4fnEjX2embLTqa/edOC24Ouxk6sXZFpgfwF6yNTyf32qR+A+MfYSxilFviVObNgl0P2qTwjELZ5wVl5o3OpKp27KIMH1jZBx5ZaKNdSfUbHnOpeL3MQanDvjXml4Fb1/uX/CwxkL8LhWx2fn/X7lUyl8mair/KHgE4aAy6/1n/nDFbPHrXh7IUAaHQGnmo+02Rwih64vd5Hz+4z3FR9GEDdOTuvj5u9OhRZSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8410.eurprd04.prod.outlook.com (2603:10a6:10:24b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 13:50:44 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 13:50:44 +0000
Date: Thu, 13 Mar 2025 15:50:41 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 00/14] Add more feautues for ENETC v4 - round
 2
Message-ID: <20250313135041.uex3gvhpbmnh4hmp@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
X-ClientProxiedBy: VI1PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:803:64::42) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DB9PR04MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: d654df22-843f-47ec-57ee-08dd62360cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ceIzM99DPrTOqxwhpwW6f3cKWgejdAkWkV9nw/beBhGW1K5zATHt+GumYzu6?=
 =?us-ascii?Q?4eD+LakjHTq2zpweJYwSCYrZgfnTW0rj+7bTzsIOei3DeS88rFGW3oZLpsvn?=
 =?us-ascii?Q?ciK1gf8Kt7z4edoPy1PdlR9EHw3Hh4OiurrMQ9mrrmEUxP1ewBUHES6Xg2b0?=
 =?us-ascii?Q?mS1g9doIsMhSqaCoNEjbLV/VY87GxvW0WX7H1uOmWJGTkd+FoLFNKqISJY3j?=
 =?us-ascii?Q?VBHHj8RDTNJl3+0XQORa1RwRtBdNoW8sbjK8IUhIIxrevSbTsellD1fXpw/q?=
 =?us-ascii?Q?8yqcb3CvP2svGQKvaaxdW2cZATy7PZw+VkNUNeFUdW9Un6hNy6p97BKHmO+R?=
 =?us-ascii?Q?JOb7dJ7HuYBPxP53It4Hy7xtOIqyv0WbqaZAO/28drRq7gn+1TvK3xfWxWKq?=
 =?us-ascii?Q?kkVZD3JqE34jttnwFF91zte2b2X5uiP5ehwiZtF27yNNgWdIm8ML9TCEulsa?=
 =?us-ascii?Q?3MhWGE3pgdajphxKpRyc0O390d5Uu4dbaM7cWCvx48+hrGJFrfgRRHzYcLSI?=
 =?us-ascii?Q?yrxdysYHTiELWOWOGqnOF9HwUH+GMYo85WBJ+oV9zLYnreXUbaPd3xfxvJqk?=
 =?us-ascii?Q?Czfjt70xNjfzyyDIxnzkapNxqww2ErJRa2OOA7C4J4e8y8rL6yH98O9XGMPx?=
 =?us-ascii?Q?LOAe4imW11dK/Y/LCzkCINp/uDmNZ62FVfXMhw0PU0b72jsspLGc8r6Otx6f?=
 =?us-ascii?Q?2fpZeVxO/3+5NvT/D/7wpQMZKYAhmws/zuPfVq2Nlx4LZlWWEzK0PFJSITSY?=
 =?us-ascii?Q?l9YeB6j6qtYNJmQ1pQmKoIAndoewwo0e/A1+17WepY4mGgW0SgdvUk8zpNew?=
 =?us-ascii?Q?Dq8ns9sDX6vbmfJVH947vtiT4F6oXLwRmCUxvPGIhuIhGtrd2lWySXi2tNsi?=
 =?us-ascii?Q?6o11OgFw8Q4MAc6TsQkuoIISCMRv2tm0s732pIeE0vyWYBdlxS4xciQdCdS+?=
 =?us-ascii?Q?V1k0dzSgNFklaIApOkipRGK0eC7TOsUWQNLAFHaHgKZHfupAO5gyl6iJtfUg?=
 =?us-ascii?Q?yxXj/GW2oXPLa7X/SZgexWlvAHXbPMHwA8EbarhZ0ETPCys9oXWXHl0dvYtS?=
 =?us-ascii?Q?qDErtlINNYpnzv9KuaSzDeth5FDCPiaCGIv+tANckQf5mfyq1W08TLOlJqYW?=
 =?us-ascii?Q?sZ0tC64txLceP1hIxwwtgt+yDv1Q/tMp/fDcFBEMgRkjDEDZ+rw0iUAqxj0q?=
 =?us-ascii?Q?cC8Y5Z/T7l4Y/CkgkGuEjieX2q5sfrUKKvPWUpisF1Cr0ijsJvRAohrv1Jgv?=
 =?us-ascii?Q?uL+KSWluKHzz8ohe7pQiNOjLLYXm84+lYDnPMMS9nT9R72tQP3uHNYbX0y0z?=
 =?us-ascii?Q?/CI/Rz0QTSH95fjzeI89v9WkVqByOlg4y5r+74YQDs+BPrEdW9ml8nLcX6Xb?=
 =?us-ascii?Q?swSM3uI7LHoSR/0dLzstr0X6RHIr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gi9A2m8AkDzQru1jLa395VlWE5aib62quaY1qsK2WiEbHXF2KiJ654gd/QbO?=
 =?us-ascii?Q?fPyFShR0S7qQJhEmXTJwCzWBVIK4eqlV93L0iBvPtzAxN5v3Xd8RiQzXbZ3A?=
 =?us-ascii?Q?4o3urAXSuhPJe7gJADk+xI0pbXB8nyE9GPW93QJpmz1kl3f2f2Zfuigg0Aec?=
 =?us-ascii?Q?heHKFdrEe0tymAfgGUdJTCy1Y9wNqACZp61jlbLez0fgvrvzuIfyrOZNhV7a?=
 =?us-ascii?Q?wNHumudUFrV1Hyydmp+8jR/2YxJ05DLX5x363Gc7kmQpsUfk0i9c2DckbtN1?=
 =?us-ascii?Q?zBY3SYpwhSnP2Kr/Etsa9B/Q+bx/PwUMY5umgv7sjTYth6cbmIJSXW6RIghY?=
 =?us-ascii?Q?H6v7e/usmJzxxvUN6GtZRlpL9jBO08/vq+6wruuJJxGaPZxJTPQne2GXxMFa?=
 =?us-ascii?Q?OOJa/s5vhtE+3+isRxAwoQ/5mmVoPvC13yr7D3sQvDYzgjCuBtZ5og6fWnSk?=
 =?us-ascii?Q?cp7/b8KYtZVAmJ69fpzMdkndhBrc/QLk2p3FNZsbBpXbImQ99P4X1SPm54Hr?=
 =?us-ascii?Q?Tb8R91tXM9p7JAunth5WxOkJKDjPhJMPoG1GbEfue3JGo/FZZM3KYIXJIpPU?=
 =?us-ascii?Q?zQowEjzC7kdKGwvim2R1YYPA4unJm+fCEiZ6bQYT+lcX4pXKovbOjyxhagy5?=
 =?us-ascii?Q?Hz/gJZx2oZKh/KFmWzWXltN+5/ag+ftdyCWrRdE5UmNJJ3bDOCeNwC04C6qn?=
 =?us-ascii?Q?lCnPhWfihLffEwmIau+fjL0YoBYolC5Hgmf7fE7F2pg77dXFKqsJtl+v+amc?=
 =?us-ascii?Q?/VE814iZYze1kxD4pPgOKayHysnbSxp3P75c+/MRTxxbVO+osFF0PL2vnoau?=
 =?us-ascii?Q?Vq8yjLJZ+66RDMYzyWEOC5zbNVJl/g5B9R4LyH14PcKiVc1xHX+n13vQZWj8?=
 =?us-ascii?Q?DawPg6qCw1h1l214xjUsCRcTyk9diouY2zR/BRAFqMnSUhGIXy7TmCm6aUO/?=
 =?us-ascii?Q?Z5+4EAkW6PwFld82XtIGAs71vCxTnj9Tum3FZnsusy8hPwji36uOsJRdM9fH?=
 =?us-ascii?Q?HKH6g28hCgFJFt+Tpzr+qfYE1UHlOL7FYsjnXRAXkJzc2c+5t5/AxJK+KNQj?=
 =?us-ascii?Q?xqBMstrUZPy2YnycHaWFcbN+c+JSZaQbNRYIFAVkkhUv4OhiivjJUmbQIvEj?=
 =?us-ascii?Q?JKDxvB8Isnysot/AGtMrzX08Oscx7bTDfWlVcfa5ZWJlbkiBnYI9ou5o0jo7?=
 =?us-ascii?Q?CuPBsO9Z5/k58im6EVhI3A6oqYOBgEOekC+ltuZNYtLuDHZkTEKDPKncrEUR?=
 =?us-ascii?Q?WhLak4x3lqKJw4k6uEs7T/XM4tZk12/IV3tt8SnzV/78vZaVUxCy571hYopr?=
 =?us-ascii?Q?Nlm3Qvltk9IgnBGZ1hOLE8eW2cpLkKxv4tF4dpe7mnLZno1U3k5K5YlfWZeW?=
 =?us-ascii?Q?1g83bYKKSweccolFENC7XGKuzeBK83de5C7OiVDe0+6v9lZeS21LSUkEC732?=
 =?us-ascii?Q?kssIBOxF5+H3SgmHpU/IbKPGIc/cwDfsA6o+cihftEwUKp021DE1JzTzrOfv?=
 =?us-ascii?Q?7D3P8Qd5XB9hP3paCZRxOmcg+U8eOaw1lisU1AmokXCqjPdNaIMDT/ToRqhm?=
 =?us-ascii?Q?hBh9Ij8mL7onZWopYYpHRgzp5caE8POZ/Q4UgAtdehClDc1cp9Y9ggX6X//a?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d654df22-843f-47ec-57ee-08dd62360cea
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 13:50:44.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muijKUDpSFKizFId8QX8xcvs8JXQVsF3euOek2w66CrX9ckthbnfff6cql0Jw0wmNTb+WnD/Edzqu0AEuJ3UvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8410
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 01:38:16PM +0800, Wei Fang wrote:
> This patch set adds the following features.
> 1. Compared with ENETC v1, the formats of tables and command BD of ENETC
> v4 have changed significantly, and the two are not compatible. Therefore,
> in order to support the NETC Table Management Protocol (NTMP) v2.0, we
> introduced the netc-lib driver and added support for MAC address filter
> table and RSS table.
> 2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
> 3. Add RSS support for i.MX95 ENETC PF.
> 4. Add loopback support for i.MX95 ENETC PF.

Can you please fix the "feautues" typo in the cover letter title? It
will get used for the merge commit.

