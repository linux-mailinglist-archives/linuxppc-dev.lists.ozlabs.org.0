Return-Path: <linuxppc-dev+bounces-2728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE8F9B6455
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 14:39:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdpBx4GWZz2yst;
	Thu, 31 Oct 2024 00:39:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730295577;
	cv=pass; b=XsjWG6cx3WuGXNL4h6tdKJTOlvVRi6BCz1CHygcTUqb4Df/NQr3UAI32yEW4c8onyQrbzXRBdZBKuHPGSdNYXjDE7fc9BGpXTYYH08tBL+vOMz3cMqmDrZZBIc1lcSxECu8vvQG+N0jal4HIKLsHAVc92OsfeCwhn22+F6p2ODFxugOlj++wKd8GucFKqtBofFfbyre4ADUlU+XqeWxVrslh6+cUEidIu76lSXyEvP6unY0KvCxuzHo8SccQPt6PoteoTerUMvgHSv66uBOfkYiQnUwDCKwE1HXHxXLN4xFV4h5Wy8mOFxV6bsdEJ+NZb6bAP9bBmk6qebpXhErxuw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730295577; c=relaxed/relaxed;
	bh=ijV8DnZsbLiswXi2k64e8o2vf8/PwUekYC+MBN6sHQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qw5/3Pa2CWpgusQkIVXhksAmWWVmwgPNM0JoMQGNE0r/lBgv+tfDLxc/QZgXQfbrvQJx03zKTlULMzNrVcWPbjYxy4OZy9na3zm1UcF5sMt1NQhYmY2ii8inRSy7HZYimmFqmavX99LE0vOnX7cMLpNQxeT2/dLpbHWPTHh3ncnRSNLAMekJssYtb2vH6Xrs8ArtXyDODAAx1icCHG12cG1SxMYaPIggDuoz+j6jRlhaxO8Tabyjap3RXCF8y+LZW53HUhOaumrCBUvtxMbp4m+jzaBy8QY8SIOT6myUHs2VmOpVCI13LfSGyJrVPz4KUBsSQLtY1D8UMJK1iIXPXA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com; dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=e83VUUIL; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::611; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=madalin.bucur@oss.nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=e83VUUIL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=oss.nxp.com (client-ip=2a01:111:f403:2614::611; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=madalin.bucur@oss.nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdpBw49ZRz2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 00:39:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuHbZ6zPq1ZOBE9Sm6sMSVj5MsTsbwVeCszuT+Qygsj3Sg5wz+BYsFlhrnudMPEhQAy0cLY85gVZ9OK9747SgP2sBfdTwt5ziayid2hrW16jCMDCYFcnIE4kqXDij0BxL4tLdV7UdX3dwyDFrmQYqY9yBXUSsPHMwNS+uaiPxonyoo4T63H0SGy2Gyojy/qctnqOaoAbSg0ztBZKXtNrAVKqtk6kvBDVcfGUx7tnHF0WMaBpzKiCfrWRgybbhAv12OeMAiEHe2v8gQkAkc8x+Zxpss4x2gxJvCA7t6H3FrmKBgmsrJ3V2pPeuqMcneiRd/c3iFVOtfg20YORgd9LMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijV8DnZsbLiswXi2k64e8o2vf8/PwUekYC+MBN6sHQA=;
 b=GljuuLZi0KAetNm3ij2kdrs/QULdXYyag9RHUJq1ClzBHsZjoHemxhnj8g2kvMw2zX2eTAykTO8U1BQKU3H54gMzLkzyAPR+rdp06dm80Bw0mo/ohiJymUE8jkXX429nCD8Y77JIfTtMNkX8axOYPyCgJGaVs3AMb48YKBs5T/BoT1mYSDU3Vn2cytDwsn4j1SmNHDkNZ5XnoHMerGe0T7LIn5kRmgFj8yKb01LKrc9PYuexRafkfOVB9Sxmpp4LtNl6KYeuUD2ID6Ndz1057I+SQS2tIim2Uz+JiVYNTM0Hbmg3Z3X1PbK8KUDcr/UDOvRk075IesYg5rXU/PDTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijV8DnZsbLiswXi2k64e8o2vf8/PwUekYC+MBN6sHQA=;
 b=e83VUUILE5/ADpFrnNjaph+ZqtfThiZmLwQ6EFbbELveCps9oH5XcSTgNhpNmaYoTnAcF0JSHFWTuAebropzbwTuX0hKgt11ojbjHLTjz0Txeritqf9sYgQClx/RwAsY9nS9ESomFNsCR+a52GGWpKgtEv3EDqkF/Ng35kMjAv6rN63+8Lt+zg7k6N23PVusG2pfytXKH8dgIe9sV/rRZzmGPTZi6RPYkuInJ/7c24a3X/5COInrb3bZR/VW1ibfniEn2Rmke6eNxSiPhjBvP3lhugbpih0IpwB39/ibbJYfJg8QWTM4lqrKSuk8M9QfWSulqGMIC6BZLDm+10O/OA==
Received: from DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22)
 by DB9PR04MB8156.eurprd04.prod.outlook.com (2603:10a6:10:246::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 13:39:16 +0000
Received: from DB9PR04MB8185.eurprd04.prod.outlook.com
 ([fe80::7cbd:347b:1bfd:fb35]) by DB9PR04MB8185.eurprd04.prod.outlook.com
 ([fe80::7cbd:347b:1bfd:fb35%5]) with mapi id 15.20.8093.025; Wed, 30 Oct 2024
 13:39:16 +0000
From: "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Breno Leitao <leitao@debian.org>, Ioana Ciornei
	<ioana.ciornei@nxp.com>, Radu-Andrei Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Sean Anderson
	<sean.anderson@linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH net-next 0/3] Fix sparse warnings in dpaa_eth driver
Thread-Topic: [PATCH net-next 0/3] Fix sparse warnings in dpaa_eth driver
Thread-Index: AQHbKiGvv4Z11nS3CUGFPjeFsCIm27KfTQMg
Date: Wed, 30 Oct 2024 13:39:16 +0000
Message-ID:
 <DB9PR04MB818574D238545E7D64B92C06EC542@DB9PR04MB8185.eurprd04.prod.outlook.com>
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
In-Reply-To: <20241029164317.50182-1-vladimir.oltean@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8185:EE_|DB9PR04MB8156:EE_
x-ms-office365-filtering-correlation-id: cb8fe4f0-604c-4873-ca7c-08dcf8e83f7e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GiNLRagk2H0OEj6JGv3oU6VwhmiITEphovrJ+Y97X8jsvEQ0+L1I0q46L8kH?=
 =?us-ascii?Q?/sIyo6gwRrE/WPDxgSnngnSM4Z+Ez2SRV6qGtxzODa6T//wSMdUQObUXlnaO?=
 =?us-ascii?Q?r2k2kanqzr3QtEC8+xOKlcoNskoeM16hTBU8/IBXpwpEN+bAj4oxVQgeATao?=
 =?us-ascii?Q?24YJAz04Ru60gDD8LcfnLL+VDcH0n6mMeqHUbWyUx10EZh6wXtNfAIvkumjC?=
 =?us-ascii?Q?mjd+IriZ1y5Ve+o3rmor9aqYi0+/f3jyVxCbzTGxjAlCPxD3XUAjk03afsDk?=
 =?us-ascii?Q?5X266532As2SC0AQFWGcGGEplMWld0fmIyRTQRkKfynEZtyMxSxTz4Ix+XhB?=
 =?us-ascii?Q?tMP3nfOuarwzan87Nvt5wHcOZqk1Axz6zNvI2AMdKZ6phhx7ord+46i4zlVe?=
 =?us-ascii?Q?fJzbCH/cbvzh/e7GANB8Kfox2lzbmupizHDke34cq5cPD0i9fZEIYwz/fJwJ?=
 =?us-ascii?Q?+J780BEGLODuMUpv/HXarWF+aHc+DH3usjNlqOUSWSVpxRUJB9P8TlXfmgv6?=
 =?us-ascii?Q?xWyUl5S1n3RRI4web0XoDwo0Kpjeqt7jzHVGZcQyH0PCW7dtHl7iVq5YUHEI?=
 =?us-ascii?Q?9RkOKPCC65g23fYQnZA/F3LJHQ2mDUuWwJxxCBlggWSsq05DD7e3/PuqTcDZ?=
 =?us-ascii?Q?gunEhgIoWAatZf88ZMNi1XkRIEeHrv+TTivdRStqosSbTE213OpEbPTXivjf?=
 =?us-ascii?Q?eyOjhbjKVevj02+YhA76cEePvFhG3aHKvoYBnTWZkyJzq8mw/CQnVi0pKZ26?=
 =?us-ascii?Q?wQDycvF5cmJjRHPoT3mARw1moMZSijlnL8vQqN1SHfjf6HwZQXJOSEDRlOrR?=
 =?us-ascii?Q?dIbF67AOPfdIn535MBiAQGKap3dVq36EKd33BLqpvwA6Og/Oe9mNDVa8jktl?=
 =?us-ascii?Q?064q7ZRKRKv5WqQW3B704PbIy5NiO0GEc5fijTudpxChMHUlFq4kdrcJS2Sf?=
 =?us-ascii?Q?Ge3JSxUoKxHdb4ZWeePfKc0TLXBPnaAh+H3wC5F3nb/O0B6pDb96kCt5eajb?=
 =?us-ascii?Q?YVNF+lnCKsx0OLBlmbGkxZErI1WTMKMMn3Dazv+kTmWGeWbyXpps4MGNZm4v?=
 =?us-ascii?Q?zRgi29FAXkE0of9p4zE3qctwjEBLH4OIRB6auyL0eAsPt0sbpeSHoc/p1gUq?=
 =?us-ascii?Q?UvAii9iIwU7SB01oQiGy3VmSLCAMO9QhbAdx97LsQAxzeZXsEcBGMS7TF62d?=
 =?us-ascii?Q?+4F6pM/QRFB1kJ9/+FCx0R9P/sYnkRvhntYUAuRm7jOpumrO8wk6HaOOEMXr?=
 =?us-ascii?Q?ECLGc5oqqUO5YQvlvLOg08D/XqOdFNYUikeI/tYC2SjKKHMvMGkBJH6goeRG?=
 =?us-ascii?Q?hNJ9c6GOxuQwcalBcQ2cufLtUpG+6XIlilTy0D1hnC1tCnUsBu8pJTEpwZLW?=
 =?us-ascii?Q?XPxsRM0pxn05kW3siPCS3SneiR2n?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VqrcuDsNerAyUH0yS1AFccYXTu/dKHHNXsPKeA+a3CqvajMqHl1vJWIkCNJV?=
 =?us-ascii?Q?bIRWavJ5jmBT8wQqbvsnsZh42oZzP3la649ezKbnLIkgTb43sY43gV938DA7?=
 =?us-ascii?Q?PjZeG+IGGJvijGcEtGzUv2jAVGTXvucgsjEnEMko70cCcNJmaVSS4xHjRcv+?=
 =?us-ascii?Q?ic+rYBjWW9MccUDk9lYFPJLqw1hzlybohkHht1EHkCSZPRl/mXUSbAwwvarv?=
 =?us-ascii?Q?4lsUFa+rbOQuCD25t8miztN/qfVq0T5i0wgQeXEqFXIT/pPRTHDvByTOylhz?=
 =?us-ascii?Q?yC4XT00oXcjd92EVgPgF6gx08M/IktZ/PYS1xJ767m50/G8SmOnXSsd2VlsE?=
 =?us-ascii?Q?WS5J3psv9VbP5zUc4DqV8TB1rxirdn6LeTFLkgg17xa9TKuhk+ISgVZ8coKX?=
 =?us-ascii?Q?90YD4y41tiXaCRN+ThHaiftctw9nfdFTUTYtt0pUei5R09eMbfocRh1QsMpc?=
 =?us-ascii?Q?jOV35TOOMXWBBydDfPiGfmQowjNcBgWrDuT5AiLVZ1uDqaZovM7a50hsLLDk?=
 =?us-ascii?Q?UE20Jj7QGlJfKuVyD8A2bBZkN1xpuvmSMKLkTRlXrPbYERRg1bPRRb025Thx?=
 =?us-ascii?Q?Ze0esVe+EC88lhaJ2jJivSOnrg0E+EhwU81hTh228n/5knBFA8D34wpzRcUK?=
 =?us-ascii?Q?SlhcJqvKE9ifBKxBEREhsnv0keACleL4KqcJPYnRoFvOEmSm74AQHTIBmzXS?=
 =?us-ascii?Q?h50ysap6agad9z9GE4hUKaoV4USlR25YHoHhoGqTdD2MZRH6YTZTHu0qOt+W?=
 =?us-ascii?Q?hsdurSNUwbQo5GYtPi/HB2smvD5i5totz08b/dPILVDrLQc0gq1sj08DEQ9m?=
 =?us-ascii?Q?ZXeyTLrxfeyvlot6oKq39R7D1YtTCj3DS7ms0c5kGr0eQ7R4wW9LkP4bNsk2?=
 =?us-ascii?Q?SjjOU5HrsPn4mzI1hK7Fe0zi/j54KXgn9Q5lt65ZHpeEWQf8/mDo4XRI9F4M?=
 =?us-ascii?Q?lmLsBKkzGleEsD2V2usxepBt5Rqn17Ke6i1pHSDpkW8hQSd7EO6VrTcljiQO?=
 =?us-ascii?Q?JBoDkwEkfFsNHYttPiDfruYd8rDv61WjOKjfOHdgApegBn4pPI7UjZFZ24Xd?=
 =?us-ascii?Q?Whbeji/fbf74Nb4wf+bhlF2+u4XvWGPQdT2rlMhTjasGCNpoLRIZUg1UYwQu?=
 =?us-ascii?Q?hlbqjAeNHWlUSwo+jrUF/wY8euks3OB5xNj+IT1ay6mYrOEdQLe+FDV7RWRI?=
 =?us-ascii?Q?ilztAEhsf2aZfX643ADxKGbtFA5EWGprK/G2dM27wXedB9ZzcuUbOtlYD1Xv?=
 =?us-ascii?Q?0M6rozKNDRpso367x4WU8fcQfh+wyV6GSKHtMuEFiJ+dVMTXJ5ZtNukeoulD?=
 =?us-ascii?Q?5rdA+ANMD5aZ8lyZPb3CHGUEKCdUhdODB80cCIEjVoDmgXEPnR9zOuXZvP+a?=
 =?us-ascii?Q?E9UdzvZng07Lwn2osRpMqt1pcXk4Fv5LIljkfNP8LNOiORqYKaWAcX/cErxq?=
 =?us-ascii?Q?z1FFLlq/lsPH0l9JVHaDnRqPflQVrJazNT+mRuYUyKmeZupiRYfgRIAn36FW?=
 =?us-ascii?Q?Ma5L+UDOkuQMkUrtUV1An0bp+wLb3v4cGElMiT7AhJrIz4WTSuNLzOwsYpvv?=
 =?us-ascii?Q?Kjdd6+Bc4yTGJbtu1x3ZZ7krycDo3b8GMPO/vLfV?=
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
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8fe4f0-604c-4873-ca7c-08dcf8e83f7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 13:39:16.0717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dkcqN9bj4+d2JR1A1dwcjV/M1UbusD/prQenUClfe1pME+aYGhq2hG/xP/QMH8Pp268/isViHsyVdbSLdSVExw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8156
X-Spam-Status: No, score=1.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> -----Original Message-----
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Sent: Tuesday, October 29, 2024 6:43 PM
> To: netdev@vger.kernel.org
> Cc: David S. Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Breno Leitao <leitao@debian.org>; Madalin Bucur
> <madalin.bucur@nxp.com>; Ioana Ciornei <ioana.ciornei@nxp.com>; Radu-
> Andrei Bulie <radu-andrei.bulie@nxp.com>; Christophe Leroy
> <christophe.leroy@csgroup.eu>; Sean Anderson <sean.anderson@linux.dev>;
> linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-arm-
> kernel@lists.infradead.org
> Subject: [PATCH net-next 0/3] Fix sparse warnings in dpaa_eth driver
>=20
> This is a follow-up of the discussion at:
> https://lore.kernel.org/oe-kbuild-all/20241028-sticky-refined-lionfish-
> b06c0c@leitao/
> where I said I would take care of the sparse warnings uncovered by
> Breno's COMPILE_TEST change for the dpaa_eth driver.
>=20
> There was one warning that I decided to treat as an actual bug:
> https://lore.kernel.org/netdev/20241029163105.44135-1-
> vladimir.oltean@nxp.com/
> and what remains here are those warnings which I consider harmless.
>=20
> I would like Christophe to ack the entire series to be taken through
> netdev. I find it weird that the qbman driver, whose major API consumer
> is netdev, is maintained by a different group. In this case, the buggy
> qm_sg_entry_get_off() function is defined in qbman but exclusively
> called in netdev.
>=20
> Vladimir Oltean (3):
>   soc: fsl_qbman: use be16_to_cpu() in qm_sg_entry_get_off()
>   net: dpaa_eth: add assertions about SGT entry offsets in
>     sg_fd_to_skb()
>   net: dpaa_eth: extract hash using __be32 pointer in rx_default_dqrr()
>=20
>  .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 26 ++++++++++++-------
>  include/soc/fsl/qman.h                        |  2 +-
>  2 files changed, 17 insertions(+), 11 deletions(-)
>=20
> --
> 2.34.1

For the series,

Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>

Thank you!

