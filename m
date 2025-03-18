Return-Path: <linuxppc-dev+bounces-7162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E4A6688E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 05:47:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGzps6Rvqz2ygm;
	Tue, 18 Mar 2025 15:47:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742273253;
	cv=pass; b=Pa+eCN8NPvlcMF1iqa738Z2jWQBJ7joMmWPHWAeJJKlkrIdoyxGkaJ0euUdDd+binhcf4rcSuAIUJOzn/i+XFqRESIDyndYWCRcOZblKwrEc1BfpDR0zUhZyRYXNkZIb77duJcPHGwsnpLFCxpgrRbH6S/5jF4L+WsQzb7Ti5alDut3k5ZxUUY0Lv+NXYTcuqRSRZd6gcZ45XjXFl4tTYsin73BGyztx8p1V/h8GBXo4acXGGyG6q63Hs/TPjFmVVxAMeoxb5U6QGE4qpvmdqODhBPvsinxidc5xSnS0ykWIYdo+BwdOfS0JltTc+oq3XyladCUSTCrzT2zif2R3Kg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742273253; c=relaxed/relaxed;
	bh=SjfbbxQYmkDljJscfJTxsg7HU0NdPTRrVoFEzg2mXuw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gd8YsrcIZBT6R2KzbZ2/UqeDzvG9nQnw++Offv+pBL8G2lX/Q2f5xhAEP1k72H8lk7yEqLF2ICveTNmQg4EWG8+uhzgdz82OiktB5A0LtZ6sm1G4JkOgvq5b13IhWvMGAmy9NhQyZ2tObvatmBUl1wspnET8cz0Lgzi2CSdZew8pPDuS05xvvtmiUQOJ+xhNOWXZzu73HeGQMSIL/gdg8250efER/iTw4tQ9Nd/JQaIKSDiMkUAxBw+Z1AfnX7JFhoa2wyygWfHgewwAlG13Aa5wQrIAMb8/P27jrXKlmZNpUMx4tulK5prDpKC2RjSfO5J0x2qhOcTVc044x/NxgQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=X0DAMdZg; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::609; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=X0DAMdZg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::609; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGzpr4VCHz2yfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 15:47:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPGYCIe50NgL/ykpFbLQVh8bWUIFUrG+HIhDerHRDghrsp3KpkrspfJ1Z7gyIhnsep1DBSxvgb2BW3Rc9nidseaYstTycMzGuGuJMAd3RRMypFFapuXBRnRDneedj4VsGzpURH0dRleu6rbVA5rCtGCse/GljCwlyxCMByV4LpJTNsZH7JlUpLKmm2pJld9bilHEuMZZPMnT8gT06NZMGS4tdQpAcyuWGm3pDJSLCTa9vCjVYB4jtMlRSjFLv/HChenPewjGI532iFRC2vNuVNKXBC1PY5xS24MLDEA1KroxpKs+7IylcRnLgeqfzy5tRinc6Teya27vJL9UOKOb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjfbbxQYmkDljJscfJTxsg7HU0NdPTRrVoFEzg2mXuw=;
 b=TLC5HCk61wDhqehoWK5y5r7XqQs2+qT9qmB6IbjbkIjrJiwODwDVfn7MMq7/YHUVaWKZ0SqfJf6iR7Ue0U72BtCvTo2/odf6zMKq0t4BG2JAzFJ+Y6b6s8QKaTH0DHPU701KUafMkcn6cJ0VsrrhfOGMlNKIsRFI0nkgE9L1TbPbYjYDL/6or21xaqMEMPYZjZZ//D2pWBvha+nnsAjBpZIN62I8cbD0gUMRSvaDLILBlcFDu5cdPyRao07HcqXk7EmTE6IDve0JilKD1jKjgz0pmYSHa3XWV8ot8NpIRV7Hxk2u/dW/AzroiOGjD0EsaPVVJrT2l94aB+4mBh4lWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjfbbxQYmkDljJscfJTxsg7HU0NdPTRrVoFEzg2mXuw=;
 b=X0DAMdZgSza52jzOCnqZAP5DGYxrPm6WotmLZAi3jkinDbo8FJ3wNzZLibmE1KXMYEGZdMCrEoLU9hefjsbyB75bBj0ZFVEh51T9//xoOKLYGiL/bwPbU+8Iy8TWsGld2teWw/3ikMRRDZhuA6Fo9GkVTQneU/Ibzzfno84YzMka+GpA5iH4i4YsElfgEQqKx3M21KdLQPNh//6QliAiV0UYUDkfJ8Jrp2UPyK3GTx6tIbtWyv92LQttlQVvDDUSKHg2qH10qyz4G8XFRpcaKLW9RG2eyFS+InTJFea6KRahXWdcMvL+VS1rpm/V9PUNGFaFe05dWYduwfFdv3E+IA==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AM9PR04MB7635.eurprd04.prod.outlook.com (2603:10a6:20b:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 04:47:13 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 04:47:11 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 net-next 08/14] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Topic: [PATCH v4 net-next 08/14] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Index: AQHbkkpbosg+I5pSyEimx2zUNxYPxbN3hVPcgADCsDA=
Date: Tue, 18 Mar 2025 04:47:11 +0000
Message-ID:
 <PAXPR04MB8510DE829523749E9FB5E20B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250311053830.1516523-9-wei.fang@nxp.com>
 <20250317155501.4haweyhlrfozg7zr@skbuf>
In-Reply-To: <20250317155501.4haweyhlrfozg7zr@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|AM9PR04MB7635:EE_
x-ms-office365-filtering-correlation-id: 886ff731-8bd6-4866-0cd7-08dd65d7f226
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Dh+xjG0mAf+BnAr6k5ypxR9yxWNFADbbr0QBaEA4MZmQWtWOO2PTo6JpBT7h?=
 =?us-ascii?Q?khn0nfvgyMSDFE5X86Y/GrkT8NH32t1bqgBjy0ohFq5dgn+NN3cjiDxFMNzE?=
 =?us-ascii?Q?3UaVbwc4yQQXqGOJ4WFZBj2SZx6PuOeW87RBQNU7vApDZ9IdGWqtLAoKEL+2?=
 =?us-ascii?Q?05udpXCqOG/vMoxAOlHYkGFiObK1sGobf8NNNfxPZHu9TBa8WuDJGyJQL+CT?=
 =?us-ascii?Q?F2B/xREa6CccQ7fSDNka73MdnMQUAaL4MB6K8nPUZCnX7EsKCkvv16iaV7RP?=
 =?us-ascii?Q?0wgNfUiZK0xGedlYebTJugQQC+D0dG4AiyYGsx3iGzpMkveZcNQ0eA1klaz+?=
 =?us-ascii?Q?zRrO35ookg1HTDQFcRDAWO5qvFtMl/bf+VRuOkqy3mfAfChA/80EaORtORjA?=
 =?us-ascii?Q?XWiSuXr2jxQh7m5/rk9sThA3vMBBHe+miwGJbGBAt/P4QGwavi/adnwR/mMY?=
 =?us-ascii?Q?Zuk7FRV3jZN5eoZnA9RMmH9L/TVzNMk9I6KMERWU94QlsxlUv84TbpHwXjL0?=
 =?us-ascii?Q?QhxkpqJgh1rRTBehvnGpPonOchIO1yMkRmfFBNjl2jpitw2KkPwhAh1LBNjQ?=
 =?us-ascii?Q?VVM9REenQbfEoHhtKIRERmSg2Vwc0N4OwoVwSU+W7g4F0KCYamR4TQu4fGde?=
 =?us-ascii?Q?Uc3sf5C9oE1er9ufGS2z0MPekg0KC5ZYULkMmbI3anraWQY+6R3wKn2LYtVx?=
 =?us-ascii?Q?2+5SPOKbEO1Aie8oPNgYnJSP8TtT41ed/OxRQywRWgr4s+XXQoGo8xWdgVkz?=
 =?us-ascii?Q?y03pfyGqEIkn/WQa0qygF4990kKh5PgsTToOn/WVCUveSFAXlVMhFoxVL5DV?=
 =?us-ascii?Q?z3cNvE0RQmjRw0THhnGWFIkRbtB60OXj0s51KWBGJ9RDrwkBLvkNPuNzbEKx?=
 =?us-ascii?Q?lyCaFzQmZoXwOc82yXBW1XZqDLlwN87jyqYcagqWhrJrg0zSM0dnqDRflQ1M?=
 =?us-ascii?Q?6ujUSZzEqrJ+uUsnw474429tZl0DLyB3PnvAGTcB/J3oyq3cAQOD+gEmXV2v?=
 =?us-ascii?Q?OaIwfzJpMnwCfG9908b5q8TCsWWzVqFoZB4U5Rnkxn9xRGYjbLOA9Tby/qF5?=
 =?us-ascii?Q?EZ2KQEM9j/UOKX6h+CxtcQbXFKmHxa97SumIv0X65jOKxXsT5kCiadIKUw5M?=
 =?us-ascii?Q?kg48zOhNyLuR0zhWXOkXeRYsk5qiG1h8Pxbrx64oKSvPWUV5tm8NLRyHYrTV?=
 =?us-ascii?Q?A9pnDuQQAnzm2oWbNEZS9OSZag8ZjJ71pJ/4/xVrsJ/5CICA4uROeBu3hb1j?=
 =?us-ascii?Q?AMZhRzMWH+CnsVB2lSXx92ALSPD/Nrbfm3IBOt2y5pmztwctzAbFTv4hgH14?=
 =?us-ascii?Q?8RWCjOUBdcugPzyudt2VZ/mS/RrE5SzwbOXHkSPYjULpcJIZ28wk5zIokZir?=
 =?us-ascii?Q?iJZBP8uI3vsVM3UkS2q/PapAvXU1d+0xTdfJD9gsjjfK7DwY+bwDdYX87WrD?=
 =?us-ascii?Q?WZb0d2fbw7v2xvwst29eKKKoPIuP0Xhj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0WN+iYU603J3KRZ5viWNFR2Ym8DI+XSxruapTGzg0lma8hAt3ayHUpQeg11C?=
 =?us-ascii?Q?hgvUDrJFM2k41mgpZkc0uTJ7fZAzpcfsLCFCIf3R1IIoVS0oQ+PpTTzi+jqb?=
 =?us-ascii?Q?8teYCTTlqUQVnfuIoKjpGeBvd/AWvLcXMdiiS8LlZvzEnmgSlLQQeWOvGTI6?=
 =?us-ascii?Q?GtY05/MTgUa6mtdOnvtv/oFY/LMSE1WIbnCMZ8pr8wXAM6vCFlO3/D2qjS1U?=
 =?us-ascii?Q?VqtwPaeURYXt1TE/dNsaMqExdRGydQIRTXg9RiicI9IIwhe8S5vhpLellvBq?=
 =?us-ascii?Q?lLznE6jr94p0FMNMfn6F+v9/d/r8kncmh712XsKWcEaSh03CeDAqjbWuuUJ/?=
 =?us-ascii?Q?6YiAU8MupUkeELUHdq8ff+GJFBeipT0/54kj67pfbe3oH4AIqtRDzbFaj2ZI?=
 =?us-ascii?Q?pqE3YDsFFBye2DDosK5IHWKk4Tv00pETNGehAWNGh0jbxsKZWbXB45wd2h6z?=
 =?us-ascii?Q?BgHTCPgk298A29yNgbvQgP8FZJz0eJb2yqNnKSxQNxo2WrxyuIdivV/EpIK9?=
 =?us-ascii?Q?oxfC35Ug21CKKUR3djEI8HOBr/kaeab2S5aTIzOn+k7vb7NSN5ZHeX2niNCp?=
 =?us-ascii?Q?iwTn9IttRfSU4+CQbb73DgNdyctEn6X+96ERGbMu/RwEVciWHvzWR2uPmEtI?=
 =?us-ascii?Q?FSj/XAAH6FF7XUAV4dfgXrnMDznWGNBazAluK2VWctdFl8CIZCLVhohheIJG?=
 =?us-ascii?Q?0/y6WhlavzW0q0JN4CRgYABl7SDJRiSRdpmuSdJcttPlAZAnYdi53gDXm0nP?=
 =?us-ascii?Q?i7JBUDFkc9QPMde3Xxcrmu3t/5rwyyxDjfezvYsDfv/vM9NaHblrB0gbmnhn?=
 =?us-ascii?Q?1ucfxTm0l/4uOHvUsou2LeSXnPTkxdxl63NASJ2qd/VK3sNBi6lNp0oNtrjD?=
 =?us-ascii?Q?6bTYLcPIJLmmGCLyxSlnj/t04GsIhW1eAhlqf33CDWrNpHqxrEqD4LhuBH5x?=
 =?us-ascii?Q?W2/jbAnTLfurdFIIP5LeuwRIGdIdS7HO0GZVOOdSEg8Jjz/Viu96tqaYVRmS?=
 =?us-ascii?Q?Y8Iggslouq+s0zp76SdU09chm2hA2YOkwmqs5hWsdj7RTn2xutmKNJIXaeT4?=
 =?us-ascii?Q?vesPmgobQqdrZUpGTHxmNcA44lbWWr2OeqsmYhBj8J/r1cAtl4iPthgVy/5e?=
 =?us-ascii?Q?8qLdKM/udWSEW45qJmAOWwLiVbGq1yP/zK+l39RMiDoyzGlpOuwlTnM31g9d?=
 =?us-ascii?Q?sDg6WrjyVVTGmcL+oVU69SvMtXJbhzOZso35JpzB/0OdKJ2yTQYPhH+C5qE8?=
 =?us-ascii?Q?jJJQSG3ktlymariC02TQVFgYGjsMO1NRXAQIokcOgB9gjKSvM+HkR0YD3sEH?=
 =?us-ascii?Q?jXOzDd/0grYIGXGxMA1sBKEGdsC85zyxPfCj7dXoKYVVlAb0s2nXXSBXpkHN?=
 =?us-ascii?Q?vdiHD0VbVIwiVyk7y4oVTXnsTdJKkMYQD117wMVWZUkJ+1w6We+pVTToR5NJ?=
 =?us-ascii?Q?uuX+NrgY+2oLE9K9vO86T3Md80IlsQ8U4NuuPshurz3sL/UwgEuEP8LOiFXL?=
 =?us-ascii?Q?QsdzxwHSEDfHCVlPMC54shfZQcczavIegY+yjIozDBtTmb0CrXHy9xwBXeHm?=
 =?us-ascii?Q?SFyODA33WE1vnCXaFUw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886ff731-8bd6-4866-0cd7-08dd65d7f226
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 04:47:11.1079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QFzKl7E+QfpH3e2G3zdULyTvtqgWRudad9BfFr6ekwM2/y9DAoR3VhjW5lHxFcmTWvBun6qoxMKVHuNWHI7qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7635
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Tue, Mar 11, 2025 at 01:38:24PM +0800, Wei Fang wrote:
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h
> b/drivers/net/ethernet/freescale/enetc/enetc.h
> > index a3ce324c716c..ecf79338cd79 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc.h
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc.h
> > @@ -543,6 +543,8 @@ void enetc_set_rss_key(struct enetc_si *si, const u=
8
> *bytes);
> >  int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
> >  int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int cou=
nt);
> >  int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
> > +int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
> > +int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int co=
unt);
> >
> >  static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
> >  					     struct enetc_cbd *cbd,
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> > index f991e1aae85c..53dbd5d71859 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> > @@ -693,6 +693,14 @@ static void enetc4_pf_set_rx_mode(struct
> net_device *ndev)
> >  	queue_work(si->workqueue, &si->rx_mode_task);
> >  }
> >
> > +static int enetc4_pf_set_features(struct net_device *ndev,
> > +				  netdev_features_t features)
> > +{
> > +	enetc_set_features(ndev, features);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct net_device_ops enetc4_ndev_ops =3D {
> >  	.ndo_open		=3D enetc_open,
> >  	.ndo_stop		=3D enetc_close,
> > @@ -700,6 +708,7 @@ static const struct net_device_ops enetc4_ndev_ops
> =3D {
> >  	.ndo_get_stats		=3D enetc_get_stats,
> >  	.ndo_set_mac_address	=3D enetc_pf_set_mac_addr,
> >  	.ndo_set_rx_mode	=3D enetc4_pf_set_rx_mode,
> > +	.ndo_set_features	=3D enetc4_pf_set_features,
> >  };
> >
> >  static struct phylink_pcs *
> > @@ -1108,6 +1117,8 @@ static void enetc4_pf_netdev_destroy(struct
> enetc_si *si)
> >  static const struct enetc_si_ops enetc4_psi_ops =3D {
> >  	.setup_cbdr =3D enetc4_setup_cbdr,
> >  	.teardown_cbdr =3D enetc4_teardown_cbdr,
> > +	.get_rss_table =3D enetc4_get_rss_table,
> > +	.set_rss_table =3D enetc4_set_rss_table,
> >  };
> >
> >  static int enetc4_pf_wq_task_init(struct enetc_si *si)
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> > index 4e5125331d7b..1a74b93f1fd3 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> > @@ -299,3 +299,17 @@ int enetc_set_rss_table(struct enetc_si *si, const
> u32 *table, int count)
> >  	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
> >  }
> >  EXPORT_SYMBOL_GPL(enetc_set_rss_table);
> > +
> > +int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
> > +{
> > +	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
> > +					       table, count, true);
> > +}
> > +EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
> > +
> > +int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int co=
unt)
> > +{
> > +	return ntmp_rsst_query_or_update_entry(&si->ntmp.cbdrs,
> > +					       (u32 *)table, count, false);
> > +}
> > +EXPORT_SYMBOL_GPL(enetc4_set_rss_table);
>=20
> I don't understand the logic for placing enetc4_get_rss_table() and
> enetc4_set_rss_table() in enetc_cbdr.c (built as part of fsl-enetc-core-y=
)?
> It's not core code, it's used only by NETC v4.

The ENETC v4 VF will reuse the driver of ENETC v1, and it also supports
RSS, so I think these functions are fine to be placed in enetc-core.

>=20
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> > index 1a8fae3c406b..bc65135925b8 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> > @@ -625,6 +625,24 @@ static int enetc_get_rxnfc(struct net_device *ndev=
,
> struct ethtool_rxnfc *rxnfc,
> >  	return 0;
> >  }
> >
> > +static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rx=
nfc
> *rxnfc,
> > +			    u32 *rule_locs)
> > +{
> > +	struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
> > +
> > +	switch (rxnfc->cmd) {
> > +	case ETHTOOL_GRXRINGS:
> > +		rxnfc->data =3D priv->num_rx_rings;
> > +		break;
> > +	case ETHTOOL_GRXFH:
> > +		return enetc_get_rsshash(rxnfc);
>=20
> These rxnfc commands seem implemented identically to the corresponding
> subset from enetc_get_rxnfc(). Rather than duplicating those, could you
> rather return -EOPNOTSUPP for the unsupported ones on NETC v4, and reuse
> enetc_get_rxnfc()?
>=20

I have explained it to Jakub in v2:
https://lore.kernel.org/imx/PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04M=
B8510.eurprd04.prod.outlook.com/

So I don't want to reuse it for ENETC v4 PF.

> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxn=
fc
> *rxnfc)
> >  {
> >  	struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
> > @@ -685,22 +703,29 @@ static int enetc_get_rss_key_base(struct enetc_si
> *si)
> >  	return ENETC4_PRSSKR(0);
> >  }
> >
> > +static void enetc_get_rss_key(struct enetc_si *si, const u8 *key)
> > +{
> > +	int base =3D enetc_get_rss_key_base(si);
> > +	struct enetc_hw *hw =3D &si->hw;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
> > +		((u32 *)key)[i] =3D enetc_port_rd(hw, base + i * 4);
> > +}
>=20
> I would have expected that this refactoring of code into
> enetc_get_rss_key() would be done as part of the previous change:
> "net: enetc: make enetc_set_rss_key() reusable".
>=20

I think this goes against the theme.


