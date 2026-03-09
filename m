Return-Path: <linuxppc-dev+bounces-17881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG6UOSmGrmnKFgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 09:34:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E919C235861
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 09:34:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTr0f5xCGz3bnm;
	Mon, 09 Mar 2026 19:34:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773045282;
	cv=pass; b=RlfTNkA0ZRay7qg/xKI9tudhcGlj1YDiiJD1y+5cdEcCUonOGRKWOahwTxIzxkQTrU/PZEb14wYCjp7d145VbZ43yXegMFtOblQPKkSIJuk+tU8QHd2NYbzJZ5x8foOOzYtpXKr7XPwCiC13tGn8ltFeuhyVE6T3d30imHlIRSbivB86UQ8TDAul6CAyNfpw2pPmfSRlFHPmVlgzgFMHHerr3WmuuFaXFy9Gh6ltctOf0prw6+5OvyNs4drY9HN53UuuWsRQLSJmBPi4pxK1v7e9xCpdSqdR3q8GP6hyzQudBreSmZL5CoPsB/1vvP7fo/10yfC/g8a/fZeTCmlrUA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773045282; c=relaxed/relaxed;
	bh=+DEhmt0pUqbwM2m5PrWq09yIAZplI7+G0syQ8ZH6Lqo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S51ibyIcJ9wMRv5vIxMcbXjdatZJF01EUVj7mcseGNvV6DHL4vYi8JHknh+XAGNDuYjcJcOw5IqInhyLMsZSQBfBxcvJFaCwuUUafyS0a+bXetI573uYiKHcQlCLqccC9MlKIoDtyoqqmh7P8fTMtpT3sN3zwPn4wrf6hlco3ACKSFqAOLyo2CenWkbj14ni+GusLATX+qDlhKWu8uaW+cU+wDUgjsn21lmrrkqjH/gh38skRaULwURXjFcFmNJ3ngHzqPwZBPQOcrW3urdbCc5kMyegx12FlGMimeyneHNUZa5Ll7XClOCJqsnflCp84BoQLFGi0xT+/5jmevYMiQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QhAvu/eJ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QhAvu/eJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTr0d2lBHz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 19:34:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbWXo3q2Crk+VNbbX6O3yNu5WXi7mTqm4ln9lHSVOX+G8dJqEUbQitxfMIXbFbH9k5EJYHXtx80gXc+h240L51OXqmcmaHc1FXzVJoxERBXz0cqnRx3VUvLfwf+LfKHfhDxoIn5OtyoeRRRkt+fijJ0lvJ4jt/4GGNIYlJeYbYFYIT6AvzI5GItloCo+PFPXD++0CFBmCTjABZfj6rSqYgwRC4/Ym/Hh2Lco3XDXNkbxwPjg64rbnTerH59pVCfUaLDqy7DgPWNN3vifhLwMD8gtLrhXexPU6zcXktV2MywpTdBgMGo/2w7t7F0gGca6vp8J419GT1xygpTLQLkXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DEhmt0pUqbwM2m5PrWq09yIAZplI7+G0syQ8ZH6Lqo=;
 b=UvuA+w2FxXuDJbd74pmiHvt7bMgxP16uJOc3JKDjLahLw27msyVidI7eV0ycCxXDdPnvufTRT7p2zDK1KdQjYY3o3HskyBMUlj65XHWUzTz2E5HLXDnYzP3/FK9Y2eLrcioxqf4adakOn+Ksd2Oucqv2y6zrDPB02MNGdXt42kvNdlbhuJwii3VXuc6wtmey/W7vg4IpKVOIZvY2zLnXaQGdz5h3PxknHiR+THyIj2I6rjf6k/AIX5PLRVrQaZ1pcmHivj28wwZCAbYCCqbg6zfCNtRVZ3sVr7CUo+3AaWZylXQJVAqQyKU5/Qu54eMiS1VYcQaQvwf1EpdIVFtbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DEhmt0pUqbwM2m5PrWq09yIAZplI7+G0syQ8ZH6Lqo=;
 b=QhAvu/eJKryFG+3n7epbfDJDMqUrfGnYvVGqZCdAGI3j8blwl0FausorNJANmRPBP6YKzF4EPCIPrgd3+kJPLiLLqEGUyRmf5eNPm+UWkFQgkWgI4iXnH37Hvvbw/E/JPgwUte1L5azuzhFzWSD8uB+JlEdSsw+uqQPrITVjGiobys7m9trNSPg+Bahv2O4s7y5tTVpciubzPpbM4TGpNiK6gfOlNw8gyWEpQSlcFhYwhE8A64Asq4Q+AE37jkW+Yfw7ISVx83Mi1cgLwNff1ohWJXSdSMSNM0IR8n8NMDZV+Swra55TI8O1dNriJ+YkrlMWnDPZs7nsGeVoFvEl2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB12235.eurprd04.prod.outlook.com (2603:10a6:800:333::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 08:34:15 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 08:34:14 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] ASoC: fsl: add bitcount and timestamp controls
Date: Mon,  9 Mar 2026 16:35:27 +0800
Message-Id: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB12235:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa08c3c-f9bc-4ecc-5b5c-08de7db6a573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	raCNFu67CVXkJ7CTf1jQqT9Hjhv+ZfDbBUtHGFEUxfVPkMTly5TAYvFduMIIFt2sj+vb5QOX8HAfWvDtO7zjeZT2UgOTsHd6FNx3kHVEu5P/KNcrt/mZ/utkm6eGbop6i0ZZ5bBe3ezez9APu0Ft0usTK5iT217Hid78JLPi/ynaWiZvl+OPvutntDX0fkEagu5hULgqsxksbJkILoBfbeZ+BhPbWM8siDAsUYUEhyZcFHA7AkiRggaEy4ONcPNvUb7ORkdwFfIGkUyO16RjsIDgsCQ3Uqkx6WWLuRPPiwzwR+gEes3jzwLuWzpIUzmk5b0FxU5+rDsebp8b3sO+WwEk0hIP5MpJIs+o+ICMGOzd4lxGKqh7wIcsvoJt1klmdMte8+MLcBt42GOymj3+CisYzetLDVxImpBisSEcLfEgkn84y5RBYP7/JKczQ6m5Lx5SoXp9xg3r6EDTUyB12jynbm83higCGvCMHH/847vCw35WGTqTiTQnaawYn0Xd415eFjx57urSF9VXtOvKI+4eySo7dVc1vlHS2VhzIrN4SM2ayHwEoCuh4ob5/cgp9CMlN3cEhiSztMZUPmh76rExiubtI7IntxhIeNHcsCEleUJmZy8wjyMmCwlGfQtDioGIHeVuoSQW8fR/ot9CJ99k5LyyhlNednRJ7aOXBr0EkAbHMis+sH18um3QreHe0ndOPT2258dWwc92hhctpxHDh32Tbj4/17AhlsGC9/3iOpl8TLbgKnvsiSXJf4yHZauMnXNGi3STQzxBA/tziRe6epbxZAfww0S4MpwEwZxLvcOiqgjVzrD6Dqz6f/05
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4jP9mGZfEZ/FM2YChDcyJq46mHZrh7xLOEEE/yo5bR4+31mIq1OiR+yBSPv1?=
 =?us-ascii?Q?9tpGyg1Th+bidoJF/PV4ZxbOzOibJpKsgg4uOPfRdzMgBp6GPs5TjwJ1it8q?=
 =?us-ascii?Q?rGF0g+Ml0KTwMl327Orz0ZrRpPjSPqtWJYk6DA/230yTkkmcUy63U3KWBSaq?=
 =?us-ascii?Q?bmrMqz29j8XbkidJEqb8ESDh4bo6rmgft6lSIxRl4BNmxsfiOyzgiZU1U9h0?=
 =?us-ascii?Q?UHdzgtoUu5r5IHwdJne7fM1yTgBem1QHKJujlBNHKiJ+4ZroKvp4Lcw1Ez8L?=
 =?us-ascii?Q?vx5nHpOSNXuXrMkCl34AxemOm30mV7lJSxIaJ2OPeUP+5OPoqjlfSXVRnaSt?=
 =?us-ascii?Q?jEWPFMcWSwdbSTknVqHsUtFUmavyD826l4d8aXWdbt852mBRT2qLORanbgJ2?=
 =?us-ascii?Q?81/vTLntOriY/0ZzKEg3FqQyStD6EsNoPsd3B3UWAsm5YC3MoZnnUOkjAtEU?=
 =?us-ascii?Q?zOURcEywEdUWsBMhcvUii2VkcYZlszj+5lI50TdDPCgyeB/C6hKbKDG10qrh?=
 =?us-ascii?Q?knEXevNgZf/4jhU7ZpX0XC6Qmi24bubxJuLDWFvgqZR1KWMr9GmzmU+v6YCD?=
 =?us-ascii?Q?ODn5acUyh6G7XoI0Mr/TAuxrh2oe37HwZvKIMObEZKtlffYGA33QqU2S7cZk?=
 =?us-ascii?Q?oQR5RH9BeVBEw/xJpyNvRRCo7JdkiVm+JKCENJPOKlxySqJ72c57iNrBru0X?=
 =?us-ascii?Q?+5YbJ88N+z/zVgWrA8ZSqSpBaeNpJPHUiHqJA3OOJMEM/dCuuNn+uTWowtFP?=
 =?us-ascii?Q?uAGxYbaPcrns2uunvF3bKRSNI7zsqML/A/KM3qvRZaR66H+Gs3o3uOMBsRKu?=
 =?us-ascii?Q?HQ9z4k+pigBthD2v87ImnN+irAqXvLPV3vr3D796uxiCpXBpnJ2tDp+QhZ6n?=
 =?us-ascii?Q?6ywlFQDetyFQchotoLDFQHMUTrcrdER7ZFd7XtNkJ3/934bNzCKHNUspNIRu?=
 =?us-ascii?Q?W0fpkE36wt9A/iwKjmvpRcwDkpxz8BidoeSguAmiEt53JxpvCdpTowozfe2u?=
 =?us-ascii?Q?gQgIxzukPqpKQKqfDR3jEg/7UWri2NEzc2xmETCcO+xaW2Hz04DHq3iAJjfr?=
 =?us-ascii?Q?WtJtmtj3JUMT8X8SboeBwyWgzoow93w1fHW+q3IPuweuxVZmN2z01oIIBE4t?=
 =?us-ascii?Q?gYobfbdDc6oo+YxVHdSO+Gl1IIIOXZp5y7cwS/um9SLs2jfh/dyqY6TsCQ8+?=
 =?us-ascii?Q?cEV26lDRoznL8y497Qzh3d/MGdS8eHo0F/0gb2HZMBu56HluNPuFoFj5W3Sq?=
 =?us-ascii?Q?KGgMXGMgRBu4CHECIR8cLHb+77MlQZWxsKHlmPpiEiwb13VgP31S4rOoTQiq?=
 =?us-ascii?Q?pXLz1kZpIlapufD+k00s6JN4onOn9Qd5OnoYShsLbD5vGs5vhX0VT2/8fP4r?=
 =?us-ascii?Q?9AD8xuAjWeHORsZqSi6rwnPiuih33D9m1OKsKiKEhaN5S2DurRBv8pSM3WQr?=
 =?us-ascii?Q?jypIinr3OLgjqsbjT5CRn112we+eQ4D8uTDJzS56IPb6AIarYbtIaqAeKVVB?=
 =?us-ascii?Q?ATMSDLOAPhR+H/RsKIrNtxyD6FDVdcT92l+Cxsb5o1ZrO/YB7IoElO4jCWgX?=
 =?us-ascii?Q?7vIwKXfYVqe/BNfaqM80pkP0YB6u4RaGMT/05M0iMBvz+7CDQp88I65ciy7D?=
 =?us-ascii?Q?7Ti+Zc+o6et7tv5/pIqSb7ohzXwUkrftBLMn96wB8tWJmkCn0O/2zBCpU2Og?=
 =?us-ascii?Q?C9Mkgom5A+VdyIOo2lA1jUFHGpqsG3FgnY/S/K8Faaamrnl5AhVxdctnIkJ9?=
 =?us-ascii?Q?3JH9gPM1EA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa08c3c-f9bc-4ecc-5b5c-08de7db6a573
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 08:34:14.8529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBKTeF8RK5ujnNB4nIxM9C3s2rsKK54jSHxVOrEXLblmm+F2bBMFfycq0eehtthAOlQO/06yH6X1PJ5CqXbAwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12235
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E919C235861
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17881-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The SAI and XCVR have the timestamp counters and bit counters, which can
be used by software to track the progress of the transmitter and receiver.
They can also be used to calculate the relative frequency of the bit clock
against the bus interface clock.

changes in v5:
- use EXPORT_SYMBOL_GPL to replace EXPORT_SYMBOL in patch 1/3

changes in v4:
- use the pm_runtime_resume_and_get to get pm reference before calling
  fuctions and use pm_runtime_put_autosuspend to release the reference
  in patch 1/3

changes in v3:
- define own functions which check the pm status before accessing the
  registers to avoid -EBUSY error reported by mixer-test.

Changes in v2:
- remove arrays of enums, define transmit_tstmp_enum and receive_tstmp_enum
  separately.
- remove __bf_shf(), define the XXX_SHIFT macros.

Shengjiu Wang (3):
  ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
  ASoC: fsl_sai: add bitcount and timestamp controls
  ASoC: fsl_xcvr: add bitcount and timestamp controls

 sound/soc/fsl/fsl_sai.c   |  62 +++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h   |   4 ++
 sound/soc/fsl/fsl_utils.c | 113 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h |  30 ++++++++++
 sound/soc/fsl/fsl_xcvr.c  |  64 +++++++++++++++++++++
 sound/soc/fsl/fsl_xcvr.h  |  18 ++++++
 6 files changed, 291 insertions(+)

-- 
2.34.1


