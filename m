Return-Path: <linuxppc-dev+bounces-7159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A66C7A6672B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 04:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGxtB0Wbtz2yPG;
	Tue, 18 Mar 2025 14:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742268017;
	cv=pass; b=k7j7q2qTZ3HuXrt9412jsKpC8fsBbdLodRSJCZ9iSg+yIw1ek7YXR2Bh+iyUOxtJ0XfKblTNaaawSvcf9WoDWYN8MjdhGclZoxkDgFEloosuNo6D4r1prBM7HjjYqJxDUMAs6+0tpQxkPszHrjvHsNT3vuUC9jhRW6SeIpDftocUDJcD4imS50/3IX0qnGJyS3IPSLhrBJRzw2LjLy4pjj16ZY4buXbG0Ub+hCbna6VCBIYq766LgRkh4eEFgrLB5tqL3MyXo+K9H5meOxJwev2qak0f9oqDyH256LQdRse8ssOiihrzPqu1p81HKCRG5XZglGzUXK+Gi1lfon6vxg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742268017; c=relaxed/relaxed;
	bh=8S66rsJ28f8XbIIpphYGQAHJK0SQPISv7jKu6M1GhL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CzFF+/Z/tcj1uB2wwCkA/SaJpa66SN3iDwpabvzo3dGcaNeVKNqPW5dTR0kGaRLA3UzTf08KYjDo4Gxy4usGA7yX1VWTwRT2Is3pbVsb4ydKcz3+RAXUtlDxmJ2wlw1fzRgOPE8UQ0Wm3OPvynabzMsGlI4LMiPAp4zxVAczjUcTEFM52pTXAl454rG0ll+4vyuYen0j8dqbzjvolxSa4xs375yxKqQAwu0n0Aj405Pxg8J60V5V+sXaZvRjC57HyZWons5v1ppZe9wTOD0pdaDYW68M7Jl1u13r4wK7TrgZoR5aUmWBP2AsTDbbyM7FcGDeL+VC5XaddbQgYE838A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fdshN/VP; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fdshN/VP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGxt823dmz2yGy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 14:20:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPw3uQeqcykV9O9FTnoXlSpCpgS3gRWYUXDf+58Ww2s/SlqdxVG05bCWUjx1zjPAWmf7rHd7IgtbFgrwVCmWrJj+p0hoGZg3VVyy2lPH5f/3tbDhY1C/8jsQ9sX7xkVphp1tTJS054ZbNG8xD5h97JrmlC6f52Dhun5O6pIvNCoS3nP6INTHAFxgTINkBc2l0RDJnZVG8eDWkrCJFqaI79F52jWa8coEiD9AuVIPu9SOJRp2yKGU/fY7tAqpU8EY4vqsFaXuUKKw9lRH2XRpFr4L8HIFATpe2CKz26zPD/w0BinVNQ0x+DsSfmFSYkAM+xAGHUl1pOGzh31Fe4V6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S66rsJ28f8XbIIpphYGQAHJK0SQPISv7jKu6M1GhL4=;
 b=TygWrEEApSMjiBNfUlWOl48u8TPemmJQn3Lq+PVqD9/lXBpsbXiuu5RCSSUL2KX8XsAU7w8rqh8a5ZYdh9BAXEyoLk750MiZo2LFRxVyOWIP0TEBNDtTSU08nXf78FVVHjEZ3bzUP0/A0qUPxwY2MIh94m1LLCDbvlwwA1gGaSfBQAjfdElos/mhJvtXezoBc23id4jznGUhndvaAITZw40HTaKI+VbNoW9U2gT/OPjgQMx9MuR4xImlhT1Ha+o3feUM4sOp4qmLXVRPpD1xASUtmEvxl1Z2RlJ1WnsVDScP8Qdahb08iEOzbUYTNmkQvR5t2OZsHV7wj+9ynEWMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S66rsJ28f8XbIIpphYGQAHJK0SQPISv7jKu6M1GhL4=;
 b=fdshN/VPgoUgMiOVPF6JKpcBC9MLwnX9u1fujqzrPJo7wiViaG1rQgEDnGeAxzQmTYUzBtjRiGu5JG4eZi5go4Jtqz/+1+mQdBRuxb6Bx2ABn31K8KSnr1qcyfchqERqSTyD0MCb7rcWSucN8rIei1HpvvmboCRQQTmK0NugE5zrtcDf0gDlpby3rOrRWmi9xgt70jIv4QwR9PJu14bifYMdvrpkcKTTNyHClenilmZm/SzthDvFMNQxUVU6zhFkxXyz6cMtNRkRPOQJ1pM17GW3JylNyh0Iip1E8PA/ARU/x6032J7K+ue00D2yGPAQFVP6W46rrFDiw1O84I+rTQ==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11196.eurprd04.prod.outlook.com (2603:10a6:800:291::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 03:19:51 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 03:19:51 +0000
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
Subject: RE: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
 ENETC PF
Thread-Topic: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
 ENETC PF
Thread-Index: AQHbkkpRhix/9HtGrU2JdGOiDPyx/7N3ajqAgAC+YcA=
Date: Tue, 18 Mar 2025 03:19:51 +0000
Message-ID:
 <PAXPR04MB8510EECE1FDDA893811EC28B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-5-wei.fang@nxp.com>
 <20250317141807.2zobsefxl5vnqdet@skbuf>
In-Reply-To: <20250317141807.2zobsefxl5vnqdet@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|VI2PR04MB11196:EE_
x-ms-office365-filtering-correlation-id: 367d7040-64d6-4ca7-6836-08dd65cbbf1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?M4CbEFnIDEZNhNiiSScw6WqrupQgc45jAWLLu/MeM8w2NR8VboWm0V+vamdI?=
 =?us-ascii?Q?EA7jFi6+7hz3Aycb9ydbCMjMlWIsz4j5Ms5KG00jnKYuKi7C6LOmFNvIvAo5?=
 =?us-ascii?Q?XAfgWy9m9/QQNNxy3Z1uwwbsJBd/fZDx6YdkNbEd61EP56nK174piIzHUSlq?=
 =?us-ascii?Q?rIPT8ezLXSUhIKYziTt9Gt79ycB41M4vYUt0Uv6dUqQlDshETkdKnpeMWF6O?=
 =?us-ascii?Q?Q7M9BFooYpDNv37G8isNfxboZ6wcqp2LETgugHSalmgriobA3QslPpHMr3XC?=
 =?us-ascii?Q?PFEtUrjrdf77138p8SQwd6A6sL4TaQtEltNxOTXmvK48oGUlM8NWZCbkdbV8?=
 =?us-ascii?Q?nvqGcY9d74Mu+voN056NkS3jd7hZHEdoBpFvIFBNAuik/JbN9lqnWkOzn4wA?=
 =?us-ascii?Q?4vzStbtIaPYKibsQ8WzZWXC0+A6RlXDHW76SxNe2UijRHYrEMhxmkB2c41TN?=
 =?us-ascii?Q?rwbJHhUqMsupGRMleB4/STwdmOYKSBZHq8ED3uKO38pn6iSVhgTXU/ne5hjm?=
 =?us-ascii?Q?pl/omDxM4z8l7OIq43xuHxC2ddeoA6+dM8DyTgdvm/EG6TELe0R/J4PH+Q/P?=
 =?us-ascii?Q?Smq9MPD6FrB3juMWSqC06tqvAzoVR4u0KPgzrxaIh765kicoiWR8HqfCqM6P?=
 =?us-ascii?Q?ljGvZIVpWV/yxFlZTxlFY1AehrcurSe1TUfacsmowU2q9dYRBIRd4AtDnjim?=
 =?us-ascii?Q?0hNRsiWdo+CFm8QOZEnewFh0Nq6On6PmB6OZufedKjotb0BtNxS23pcTci4k?=
 =?us-ascii?Q?tkhR8h16CNFJn+fwqkx0VMFLY8ej+nCaHOmyZDiK7n7tpdTRQCB4+q+HksHm?=
 =?us-ascii?Q?ZQsp8tEaPwkVX+vav3oPS+8NlOj7EiAgDmNuFdHVxCR2hYj14yYpMTQyqDws?=
 =?us-ascii?Q?KPqS+l/UdAZwkQa3j2v9VXnDcvZizkRmsHoxQxriqBRvCOxMbjKo4O0fABRm?=
 =?us-ascii?Q?V7ehVayOSQ5kTe5r0aTngvowzqI5mmvzcJoctNUyfx9hzkaILXYpkM7liMT1?=
 =?us-ascii?Q?IWR8a8rCqeh4B5tY8vl4LU33gg00Uvadpi4y/nMdnFGmiS2bDrY3C8pVvHah?=
 =?us-ascii?Q?Cu0tMACbvOMxOISXVfl5sfFlzgYHqhT8JygBGY/sK+wC0OsNW8Gvi1XQ5lwY?=
 =?us-ascii?Q?OoVGkRt/u6Nq2WRm1iby3JjFg5TkJ+VTPskJXBAkBn4S9wNsqKXg8WblvH0B?=
 =?us-ascii?Q?7ST4/1pn4avmFYf8yFIf6vShcvz5nNhdZ4/vWn9OkZYSh1uxZiZ6YpWoZb09?=
 =?us-ascii?Q?N7Xy1vPcl7S36/Wo830WXlcPdv1TBOpxv/8a9IFOe87FOmZ150MaMJzYy3YL?=
 =?us-ascii?Q?ZQSxBwe8V2JL1TFIP35Uclsjh3WuCRXFYZ+oje+2Xp5VYOVM2ZEfOMdkJQox?=
 =?us-ascii?Q?ShEE73BRYWE567Uzw1ZZMczSDJOhw54yDtVFqsKQGP0aj26q3H+TpkwWgqP8?=
 =?us-ascii?Q?ra3Ww3E1YKeDd9jl5C9OLQIltL66a4S9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4M1TRa8jwWyj1UoeG6SwR+y8S/dls7ja0fEEMi0lOgJNZkJVv2t5RXe7kNVr?=
 =?us-ascii?Q?lPDMFSa/pLkFEz7Sj4wkQIe37N0lmDKMDv+XJKT9AMU9vuc/bhNfAoWXoR0l?=
 =?us-ascii?Q?Bptk8slkKveVVawVotbgtdufiMfPJ62ZyhX7TbNXhh4f0hv2nKXEzo+kMkuo?=
 =?us-ascii?Q?+9dZUiCBEp2bjWKVLbuvp77Ygc6Qco0elRfBGUQj/usQDxVoTnHwbXQxAVke?=
 =?us-ascii?Q?o0UYPxkCDpYA3agsIbyR1NkVDLhCjDPcnp0xfM/nvQz1aB54aqYJ5uKuEH5p?=
 =?us-ascii?Q?6111VOBPhmZ0UbS1/KbLPw6IngzHvkOfsCMaNcl73LkfSCdettvQum5vo89D?=
 =?us-ascii?Q?hHCzSLKvtYlfUfNJ48xXvz2Ymm9rV7zpzgoOlE6RPvQIVTtDOHMUwT4w7gId?=
 =?us-ascii?Q?86gZh9KABkhhIyr/kswCuI1InHmr/ugYx/7R4w3JKZgm9COQgBG02NGzg1oy?=
 =?us-ascii?Q?5b15OiuDNePvVDpopnZ3u8SOBo88N8aInZxfVu4ROF7dnDuxGmOwQ4xRRdFb?=
 =?us-ascii?Q?rDuC71xgC6M3r+69s8QcTGWmwyAXD/GloKDjTPMcQeV9QTpnugI8oeLwqlfR?=
 =?us-ascii?Q?E6jT7ElIgue5EySExzjgO1ATtcoaenPoBsP7QecKhvHN7YpT1GyHABm4aJe0?=
 =?us-ascii?Q?RbZ5/uDXEfdHCWwjDT2Z5bNd4CsmGBC6NxpNeoN+L8iUStE4wseXE9fVnGP1?=
 =?us-ascii?Q?1O8gQ8zgGlg8tygXWbJLQKi143fr27jUq0t5xsLd8pBtjQi/Qr0rCdwWlVkU?=
 =?us-ascii?Q?88htLnUvM6q0xpANXIIPMXwOXtyC1+caw3oMiQQ98nT7q+jtxyNKC/zXKnLI?=
 =?us-ascii?Q?CzNcYdZPLIr201IFP0EjDy8mf63KRJ0JmzjX2nfSxddnQ47yeyZAfNph+zB5?=
 =?us-ascii?Q?46VF0GRbIxEQAEhH9FH9HhBLanMhBMJjpKH6oJ+19kQNJj2cDtx+YQf1YpbD?=
 =?us-ascii?Q?Ql4VZUUi82+JewrFOAQZNj4yJDYGkmxxGoxZt99dI+H0FV8mZNE14Ay9Cszd?=
 =?us-ascii?Q?hxN10A39mHFP3YbpOfPB0bjXRah8qcSV1Ptcmctm8bvU1iocOx6dNTXRJuKV?=
 =?us-ascii?Q?WBRtS7ejQfR2ctIrE7pTpLQpkzS4bs4CHo10N8UzO/EZDVr1BQHjDXFgIyBR?=
 =?us-ascii?Q?/OXM2vgE35ow+l9H17/OhIdAJiGa99ATPf1wR+vlJCH4Pc0WFSAeaIbhWcaf?=
 =?us-ascii?Q?vLgQVWIVVENjZI6ZNlXfL1hKONw9r/2jfG5tUs/GBxMikup+MaFvywaD586O?=
 =?us-ascii?Q?zFv0oaDasAfX1lNDy74R6SLmeYllKmgk6KaRqbVty7JtBCC5hpSOUwmgBidV?=
 =?us-ascii?Q?okdjLA23OvlxQP7Kh3i0n13Q+54+dcH6dlWYqDbbyYuwoptjgwMwAluQMl4f?=
 =?us-ascii?Q?ZrFcZqZ3/2OtxEyq9h8j5S/ds0IY4EAdQZJEXBOLGZQoYZnxPr0hu5722M2t?=
 =?us-ascii?Q?6I4MAfDHtftStM19cLYSnPb7xT0v2FORdXbz+bvJxK9nUhoD6ueAOHbvY0fW?=
 =?us-ascii?Q?SoSYd8TMN6dThZkjUiOIfdwXdczXd69amJgimDirQF+Og/vodu2bUYCTvva0?=
 =?us-ascii?Q?HIDHFkCNUGljj5llmK4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 367d7040-64d6-4ca7-6836-08dd65cbbf1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 03:19:51.5234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBpqiYv3JUHScWRJZ/Bv7Ew1xnX7wwy0ZbYwTF5I0v+slKxH8EbUWTKMunWadIMmkiEaQ1CyDzUqqpBiv+7ckw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11196
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > +
> > +static void enetc4_pf_set_si_mac_hash_filter(struct enetc_hw *hw, int =
si,
> > +					     int type, u64 hash)
> > +{
> > +	if (type =3D=3D UC) {
> > +		enetc_port_wr(hw, ENETC4_PSIUMHFR0(si), lower_32_bits(hash));
> > +		enetc_port_wr(hw, ENETC4_PSIUMHFR1(si), upper_32_bits(hash));
> > +	} else { /* MC */
> > +		enetc_port_wr(hw, ENETC4_PSIMMHFR0(si), lower_32_bits(hash));
> > +		enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
> > +	}
> > +}
>=20
> Please split into separate functions for unicast and for multicast.
> The implementations don't share any code, and the callers are not in
> common code either.
>=20

Just copied from enetc_set_mac_ht_flt (), I can split into two separate
functions.

> > +
> > +static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
> > +{
> > +	struct enetc_mac_list_entry *entry;
> > +	struct hlist_node *tmp;
> > +
> > +	mutex_lock(&pf->mac_list_lock);
>=20
> The mutex_lock() usage here should raise serious questions. This is
> running right before mutex_destroy(). So if there were any concurrent
> attempt to acquire this lock, that concurrent code would have been broken
> any time it would have lost arbitration, by the fact that it would
> attempt to acquire a destroyed mutex.
>=20
> But there's no such concurrent thread, because we run after
> destroy_workqueue()
> which flushes those concurrent calls and prevents new ones. So the mutex
> usage here is not necessary.
>=20

You are right, but I'm afraid of the Coverity will report an issue, because=
 the
pf->mac_list and pf->num_mfe are protected by the mac_list_lock in other
functions. And enetc4_pf_destroy_mac_list() will be called in other functio=
n
in the subsequent patches. I don't think it is unnecessary.

> [ same thing with mutex_init() immediately followed by mutex_lock().
>   It is an incorrect pattern most of the time. ]
>=20
> > +
> > +	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
> > +		hlist_del(&entry->node);
> > +		kfree(entry);
> > +	}
> > +
> > +	pf->num_mfe =3D 0;
> > +
> > +	mutex_unlock(&pf->mac_list_lock);
> > +}
> > +
> > +static bool enetc_mac_filter_type_check(int type, const u8 *addr)
> > +{
> > +	if (type =3D=3D ENETC_MAC_FILTER_TYPE_UC)
> > +		return !is_multicast_ether_addr(addr);
> > +	else if (type =3D=3D ENETC_MAC_FILTER_TYPE_MC)
> > +		return is_multicast_ether_addr(addr);
> > +	else
> > +		return true;
> > +}
> > +
> > +static struct enetc_mac_list_entry *
> > +enetc_mac_list_lookup_entry(struct enetc_pf *pf, const unsigned char
> *addr)
> > +{
> > +	struct enetc_mac_list_entry *entry;
> > +
> > +	hlist_for_each_entry(entry, &pf->mac_list, node)
> > +		if (ether_addr_equal(entry->mac, addr))
> > +			return entry;
> > +
> > +	return NULL;
> > +}
> > +
> > +static void enetc_mac_list_add_entry(struct enetc_pf *pf,
> > +				     struct enetc_mac_list_entry *entry)
> > +{
> > +	hlist_add_head(&entry->node, &pf->mac_list);
> > +}
> > +
> > +static void enetc_mac_list_del_entry(struct enetc_mac_list_entry *entr=
y)
> > +{
> > +	hlist_del(&entry->node);
> > +	kfree(entry);
> > +}
> > +
> > +static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u1=
6
> si_bit,
> > +					       struct enetc_mac_addr *mac,
> > +					       int mac_cnt)
> > +{
> > +	struct enetc_mac_list_entry *entry;
> > +	int i;
> > +
> > +	for (i =3D 0; i < mac_cnt; i++) {
> > +		entry =3D enetc_mac_list_lookup_entry(pf, mac[i].addr);
> > +		if (!entry)
> > +			continue;
> > +
> > +		entry->si_bitmap &=3D ~si_bit;
> > +		if (entry->si_bitmap)
> > +			continue;
> > +
> > +		enetc_mac_list_del_entry(entry);
> > +		pf->num_mfe--;
> > +	}
> > +}
> > +
> > +static bool enetc_mac_list_is_available(struct enetc_pf *pf,
> > +					struct enetc_mac_addr *mac,
> > +					int mac_cnt)
> > +{
> > +	int max_num_mfe =3D pf->caps.mac_filter_num;
> > +	struct enetc_mac_list_entry *entry;
> > +	int cur_num_mfe =3D pf->num_mfe;
> > +	int i, new_mac_cnt =3D 0;
> > +
> > +	if (mac_cnt > max_num_mfe)
> > +		return false;
> > +
> > +	/* Check MAC filter table whether has enough available entries */
> > +	hlist_for_each_entry(entry, &pf->mac_list, node) {
> > +		for (i =3D 0; i < mac_cnt; i++) {
> > +			if (ether_addr_equal(entry->mac, mac[i].addr))
> > +				break;
> > +		}
> > +
> > +		if (i =3D=3D mac_cnt)
> > +			new_mac_cnt++;
> > +
> > +		if ((cur_num_mfe + new_mac_cnt) > max_num_mfe)
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static int enetc4_pf_add_si_mac_exact_filter(struct enetc_pf *pf, int =
si_id,
> > +					     struct enetc_mac_addr *mac,
> > +					     int mac_cnt)
> > +{
> > +	struct enetc_mac_list_entry *entry;
> > +	struct maft_entry_data data =3D {0};
>=20
> As I've also learned, what you actually want is an empty struct initializ=
er "=3D {}"
> here:
> https://lore.kernel.org/netdev/20210810091238.GB1343@shell.armlinux.org.u
> k/
>=20

Thanks for the info, I will improve all of this in the patch set.

> > +	struct enetc_si *si =3D pf->si;
> > +	u16 si_bit =3D BIT(si_id);
> > +	int i, num_mfe, err =3D 0;
> > +
> > +	mutex_lock(&pf->mac_list_lock);
> > +
> > +	if (!enetc_mac_list_is_available(pf, mac, mac_cnt)) {
> > +		err =3D -ENOSPC;
> > +		goto mac_list_unlock;
> > +	}
> > +
> > +	num_mfe =3D pf->num_mfe;
> > +	/* Update mac_list */
> > +	for (i =3D 0; i < mac_cnt; i++) {
> > +		entry =3D enetc_mac_list_lookup_entry(pf, mac[i].addr);
> > +		if (entry) {
> > +			entry->si_bitmap |=3D si_bit;
> > +			continue;
> > +		}
> > +
> > +		entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
> > +		if (unlikely(!entry)) {
> > +			/* Restore MAC list to the state before the update
> > +			 * if an error occurs.
> > +			 */
> > +			enetc_mac_list_del_matched_entries(pf, si_bit,
> > +							   mac, i + 1);
> > +			err =3D -ENOMEM;
> > +			goto mac_list_unlock;
> > +		}
> > +
> > +		ether_addr_copy(entry->mac, mac[i].addr);
> > +		entry->si_bitmap =3D si_bit;
> > +		enetc_mac_list_add_entry(pf, entry);
> > +		pf->num_mfe++;
> > +	}
> > +
> > +	/* Clear MAC filter table */
> > +	for (i =3D 0; i < num_mfe; i++)
> > +		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
> > +
> > +	i =3D 0;
> > +	hlist_for_each_entry(entry, &pf->mac_list, node) {
> > +		data.cfge.si_bitmap =3D cpu_to_le16(entry->si_bitmap);
> > +		ether_addr_copy(data.keye.mac_addr, entry->mac);
> > +		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
>=20
> Don't discard error code.

Okay, I will add error check.
>=20
> > +	}
> > +
> > +mac_list_unlock:
> > +	mutex_unlock(&pf->mac_list_lock);
> > +
> > +	return err;
> > +}
> > +
> > +static void enetc4_pf_flush_si_mac_exact_filter(struct enetc_pf *pf, i=
nt si_id,
> > +						int mac_type)
> > +{
> > +	struct enetc_mac_list_entry *entry;
> > +	struct maft_entry_data data =3D {0};
>=20
> s/{0}/{}/
>=20
> > +	struct enetc_si *si =3D pf->si;
> > +	u16 si_bit =3D BIT(si_id);
> > +	struct hlist_node *tmp;
> > +	int i, num_mfe;
> > +
> > +	mutex_lock(&pf->mac_list_lock);
> > +
> > +	num_mfe =3D pf->num_mfe;
> > +	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
> > +		if (enetc_mac_filter_type_check(mac_type, entry->mac) &&
> > +		    entry->si_bitmap & si_bit) {
> > +			entry->si_bitmap ^=3D si_bit;
> > +			if (entry->si_bitmap)
> > +				continue;
> > +
> > +			enetc_mac_list_del_entry(entry);
> > +			pf->num_mfe--;
> > +		}
> > +	}
> > +
> > +	for (i =3D 0; i < num_mfe; i++)
> > +		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
> > +
> > +	i =3D 0;
> > +	hlist_for_each_entry(entry, &pf->mac_list, node) {
> > +		data.cfge.si_bitmap =3D cpu_to_le16(entry->si_bitmap);
> > +		ether_addr_copy(data.keye.mac_addr, entry->mac);
> > +		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
>=20
> Don't discard error code.
>=20
> Also, can't you edit MAFT entries in-place over NTMP? Deleting and
> re-adding filters creates small time windows where you might have
> RX packet loss, which is not ideal.

Actually MAFT does not support update action, if a MAC address has
been used by a SI, then another SI also wants to filter the same MAC
address, we only can delete the old entry and then add a new entry.
So there will be Rx packet loss as you said.

Second, the MAFT does not support key match, so we only access the
table through entry id. If we don't want to delete and re-add these
existing entries, then the driver needs to record the entry id of each
entry, this will make adding and removing entries more complicated.

So for your question about Rx packet loss, although it is a very corner
case, the solution I can think of is that we can use temporary MAC hash
filters before deleting MAFT entries and delete them after adding the
MAFT entries. Can you accept this proposal?

>=20
> > +	}
> > +
> > +	mutex_unlock(&pf->mac_list_lock);
> > +}
> > +
> > +static int enetc4_pf_set_mac_exact_filter(struct enetc_pf *pf, int typ=
e)
> > +{
> > +	int max_num_mfe =3D pf->caps.mac_filter_num;
> > +	struct net_device *ndev =3D pf->si->ndev;
> > +	struct enetc_mac_addr *mac_tbl;
> > +	struct netdev_hw_addr *ha;
> > +	u8 si_mac[ETH_ALEN];
> > +	int mac_cnt =3D 0;
> > +	int err;
> > +
> > +	mac_tbl =3D kcalloc(max_num_mfe, sizeof(*mac_tbl), GFP_KERNEL);
>=20
> Can't you know ahead of time, based on netdev_uc_count(), whether you
> will have space for exact match filters, and avoid unnecessary
> allocations if not? enetc_mac_list_is_available() seems way too late.
>=20

I can add a check before alloc mac_tbl, but enetc_mac_list_is_available()
is still needed, because enetc4_pf_add_si_mac_exact_filter() is a common
function for all Sis, not only for PSI.

> > +	if (!mac_tbl)
> > +		return -ENOMEM;
> > +
> > +	enetc_get_primary_mac_addr(&pf->si->hw, si_mac);
> > +
> > +	netif_addr_lock_bh(ndev);
> > +	if (type & ENETC_MAC_FILTER_TYPE_UC) {
> > +		netdev_for_each_uc_addr(ha, ndev) {
> > +			if (!is_valid_ether_addr(ha->addr) ||
> > +			    ether_addr_equal(ha->addr, si_mac))
> > +				continue;
> > +
> > +			if (mac_cnt >=3D max_num_mfe)
> > +				goto err_nospace_out;
> > +
> > +			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
> > +		}
> > +	}
> > +
> > +	if (type & ENETC_MAC_FILTER_TYPE_MC) {
>=20
> Dead code, you never add multicast addresses as exact match filters.
> Please remove.

Okay, I thought that we could support multicast exact filter for later
SoCs in the future with slight modification.

>=20
> > +static void enetc4_pf_do_set_rx_mode(struct work_struct *work)
> > +{
> > +	struct enetc_si *si =3D container_of(work, struct enetc_si, rx_mode_t=
ask);
> > +	struct enetc_pf *pf =3D enetc_si_priv(si);
> > +	struct net_device *ndev =3D si->ndev;
> > +	struct enetc_hw *hw =3D &si->hw;
> > +	bool uc_promisc =3D false;
> > +	bool mc_promisc =3D false;
> > +	int type =3D 0;
> > +
> > +	if (ndev->flags & IFF_PROMISC) {
> > +		uc_promisc =3D true;
> > +		mc_promisc =3D true;
> > +	} else if (ndev->flags & IFF_ALLMULTI) {
> > +		mc_promisc =3D true;
> > +		type =3D ENETC_MAC_FILTER_TYPE_UC;
> > +	} else {
> > +		type =3D ENETC_MAC_FILTER_TYPE_ALL;
> > +	}
> > +
> > +	enetc4_pf_set_si_mac_promisc(hw, 0, UC, uc_promisc);
> > +	enetc4_pf_set_si_mac_promisc(hw, 0, MC, mc_promisc);
>=20
> Why don't you call the function just once and provide both uc_promisc
> and mc_promisc arguments? You would avoid a useless read of the
> ENETC4_PSIPMMR register.
>=20
Okay, I will refine the enetc4_pf_set_si_mac_promisc().

> > +static int enetc4_pf_wq_task_init(struct enetc_si *si)
> > +{
> > +	char wq_name[24];
> > +
> > +	INIT_WORK(&si->rx_mode_task, enetc4_pf_do_set_rx_mode);
> > +	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
> > +	si->workqueue =3D create_singlethread_workqueue(wq_name);
> > +	if (!si->workqueue)
> > +		return -ENOMEM;
> > +
> > +	return 0;
> > +}
>=20
> Naming scheme is inconsistent here: the function is called "pf" but
> takes "si" as argument. Same for enetc4_pf_do_set_rx_mode() where the
> rx_mode_task is part of the station interface structure.
>=20

So change 'pf' to 'psi'?

> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> > index 2b9d0f625f01..3b0cb0d8bf48 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> > @@ -22,6 +22,13 @@ struct enetc_port_caps {
> >  	int num_msix;
> >  	int num_rx_bdr;
> >  	int num_tx_bdr;
> > +	int mac_filter_num;
> > +};
> > +
> > +struct enetc_mac_list_entry {
> > +	u8 mac[ETH_ALEN];
> > +	u16 si_bitmap;
> > +	struct hlist_node node;
> >  };
> >
> >  struct enetc_pf;
> > @@ -57,6 +64,10 @@ struct enetc_pf {
> >
> >  	struct enetc_port_caps caps;
> >  	const struct enetc_pf_ops *ops;
> > +
> > +	struct hlist_head mac_list; /* MAC address filter table */
>=20
> One thing I don't understand is why, given this implementation and
> final effect, you even bother to keep the mac_list persistently in
> struct enetc_pf. You have:
>=20
> enetc4_pf_do_set_rx_mode()
> -> enetc4_pf_flush_si_mac_exact_filter(ENETC_MAC_FILTER_TYPE_ALL)
>    -> hlist_for_each_entry_safe(&pf->mac_list)
>       -> enetc_mac_list_del_entry()
>=20
> which practically deletes all &pf->mac_list elements every time.
> So why even store them persistently in the first place? Why not just
> create an on-stack INIT_HLIST_HEAD() list?

The enetc4_pf_add_si_mac_exact_filter() and
enetc4_pf_add_si_mac_exact_filter() are used for all Sis, but only
PF can access MAFT, and PSI and VSIs may share the same MAFT
entry, so we need to store them in struct enetc_pf. Although we
have not added VFs support yet, for such shared functions, we
should design its implementation from the beginning, rather than
modifying them when we add the VFs support.

>=20
> > +	struct mutex mac_list_lock; /* mac_list lock */
>=20
> Unsatisfactory explanation. If you try to explain why it is needed, you
> will find it's not needed. That's the intention behind checkpatch
> emitting warnings when locks don't have comments. Not to force you to
> write blabla, but to force you to verbalize, and thus to think whether
> the proposed locking scheme makes sense.
>=20
> The si->rx_mode_task is an ordered workqueue, which, as per
> include/linux/workqueue.h, "executes at most one work item at any given
> time in the queued order". In other words, enetc4_pf_do_set_rx_mode()
> doesn't race with itself.
>=20
> Combined with the previous comment on enetc4_pf_destroy_mac_list(), I
> suggest that there is no need for this lock.
>=20

I thought we could lay some foundation for VF's MAC filter support, so that
it would be easier to support VF later. However, judging from the current p=
atch,
what you said is not unreasonable, we should pay more attention to whether
the current implementation is consistent with the current functions to be
supported. I will remove some parts related to VF, thank you.

> > +	int num_mfe;	/* number of mac address filter table entries */
> >  };
> >
> >  #define phylink_to_enetc_pf(config) \
> > --
> > 2.34.1
> >

