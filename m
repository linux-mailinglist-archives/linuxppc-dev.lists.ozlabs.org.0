Return-Path: <linuxppc-dev+bounces-8087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D1A9EEBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:16:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLVk5d6Fz2yrm;
	Mon, 28 Apr 2025 21:16:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745838990;
	cv=pass; b=II7C4fWni+NMmPlAqGh2hAMT1UKyrfOHBGxBe8UIoe4Xl7tFroK2nOK1znJamWbDhlK93Xc4CF9WtmZkylglvaFvga4CyGZ0P6Ck2l8C5lfbkAsed1Wp7iLs+xx43bgDal5cnI1wTacPBozkrvEeexNVflF+bt8ewQgeg1xRfgxJUgeVkwgLx8arCoZ0RYCxAK9eywqXVY1lh5PuCRvPhLbAogjJm+oWxkxlKVXFfywXjUJRDQzGYfqQzQXmYg62V9gNKEsEuSewhZw2fwzfBT8+1+Ii5Qa6VLTyF+35niZ14+dfWvnOJ61DjbUj2cXLh8fyl790HprBQGMGddeB9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745838990; c=relaxed/relaxed;
	bh=g2iJ/e3gj4pfJAzHUtKpYmsuxj9B0xM5P3jZM0DoNzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJnmp/fPsN0w/V6oVY2WODfhRetjHCYXdNlmZMv2lD/pjBYa7UGjPoCwczyMJWowfYw7Ye934E2v7vdcw3ceo4EHNlYt1fz5HS8RU7EqpsWSogwhZ8GKK6oWKPcmvVCfLDLKySSqTqmpG08n7MHT1Nhx06U9qZ/iDuvTtQnRyVid7JHAgxX4PbfvzruKQvSuTM78Iy2wpIVR5K4ygiFYAMcBMlQYhjXXnISyhvnwuNDdeWeyjo1o0Vt449EoEEz/aNP5U2sWHrD9n20acvWkOhbhYu39tJXoN6CwSEFvdDK3E6m1cbd9lNSoTKcVfVwUf5GU6DeVf/OQj2UUVRjY9g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=J69x7oWH; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=J69x7oWH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLVj5vbhz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4YqSUGSZESLeHMlyueR4ngQR7sdBBMVB4bSw9Rk29hpbZkNewe0id0Wt8Rqu2gebVHnhintkMwV8bALT2oM32I/qriCaF+qpyBl655NYa1CZpBuFdv8D36ZxAyGVzG9KRUXK0zsA5p70df7ig2b7ZTmeqljD05r3d2UN890CZU0EKJH+OPDZbNeqcq9mQ1XOo1w6Nz+6dnJm1jJFNJ7X2M6B48BrxPhpE8KILRYWzyDGOlt5XfTXQ9OO3HG4DYvb9ppEcRLMtzowVKNhYAkxLI4eAdlGR7PllwKq5++2h4OTXX82r6qoJD/cdwkQSTFnWrv0VHyWsEw44Rc95DWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2iJ/e3gj4pfJAzHUtKpYmsuxj9B0xM5P3jZM0DoNzg=;
 b=nwn6Ixh9N7oTHzXmqjc5woKJmAIAZ2528hHpAjyRBI/EvCAEP4mT7uVbU8siGVh+sbqy4IH/TUPQRgjJ4DEQfOv6yxe9aYHxBR38uMZVd4SXC6AhXRA823CMYvexNiLbF6AXgd0TooYCGNCvtOhCXmpcAwE92FwYdkqI+ao1GQddBFAsXCnLls566GiFbJR39BBU7cYkrOa632uDP5xZLyagLyxWLXq7ol2pLh6QBcKTHc1q2nqv1sR1qN1eCZJuCkSZAPSXnBgOil+9E+9qP5c/gaJvT4NJrPrIGrcV1V15Uu5ibH38IIYE5LbT14m0ulz/vp4abSyb9eZ6h87Qpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2iJ/e3gj4pfJAzHUtKpYmsuxj9B0xM5P3jZM0DoNzg=;
 b=J69x7oWHwFSu1c7Z3hEpieC8NgNKFbBZx8Uz0vNmj4ezHsLbMO1KossRVCk3LNS0laByubszP9EDAzGfM9QQWxeyKhBD5CeQtWbyNFAvydARqWi5nDKD/MLph+jBtlyURG6RsSdJ+ikRSNSVpg08bz4fyHNpmJpHDfnAeSgooYNDiGesPYuyDpmG8b7raaKZhgaigWMjdK0cK7DBwU5WS8sgJwOK51ph79VB1TIXAsreLeSXgcE7jKkSuq/myihh9VgXA3Cxo7kFPwPU9AISZe+TcPC9RB3bH4MXyDYY9xkTi/Uk0DkOzhz3QKJ0Zt00xytdhMgmcHMEc2HbwCPdbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:15 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:14 +0000
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
Subject: [PATCH v6 net-next 04/14] net: enetc: add MAC filtering for i.MX95 ENETC PF
Date: Mon, 28 Apr 2025 18:56:47 +0800
Message-Id: <20250428105657.3283130-5-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: a5df8550-f00a-411b-5cc3-08dd86461675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fiAFCdS6WZNNrjhvgkWXhzm57ycAdZqmL0gbcsdE0Xp4ZJQ58F+qoA+9lDO7?=
 =?us-ascii?Q?+aQx3UU4WjEWGvPx7uZOFC5uTtZU9QSdM8Psoc9To8FovXROnwxYm/8ZulaR?=
 =?us-ascii?Q?/uu5yWZ1YA88rjlsXqODxfWJVdoW8fSiVigcJeoNWgppf6UJ0gfB+Jqvr0b4?=
 =?us-ascii?Q?aTumpCWdu6DtXjdfxyJ5BfCYmuQG91hlMLsyIzE2IdW29kVwgW91RdWcUTKa?=
 =?us-ascii?Q?2lHK1rHK34cjEfz4/wOeM+Hb9SH1GRStCL+lpvReJn9f/KMIo8eMnWTlZYt6?=
 =?us-ascii?Q?78sisiOrU0uSV2UoFDnPihiJBFLnFpjtI80lTOKBqEbSbiZHjpoISBDO58vc?=
 =?us-ascii?Q?2D2MIkEAbJyJfd+FTsVESNcF2ysvvJgCg6+6WFAaXEDPMYUG6DEqeAdTNu20?=
 =?us-ascii?Q?Um43UOQr0nCFseAdtbcX1dIgU8SS18M3O5mlxIYtm4GA9qX0R9q5fN3GofOW?=
 =?us-ascii?Q?39hemNitDdt6rM6IzvjqaqUEmvpEAw3jfooUw5lBYhAxLhQJryHu+rbv/zy9?=
 =?us-ascii?Q?x52QsJlriii7rO70gCFtNbFutIIFRH4TCanEVyrqz1IQc5mRDv0zd94T+R6v?=
 =?us-ascii?Q?1yxaZaj9LOGqQQeGjnVfaHtVKpMocmelZJtefJW17Rh2yUeMx3vMpcrymrOo?=
 =?us-ascii?Q?30bbC8/TdQ/qeNq9jPwPLHczvF+kPpQGeQ7hPvUVJEwrnnBCwUpEMqQ3e2+5?=
 =?us-ascii?Q?B/F6kNHzzR8TLiol/ylBpk2AYQUbFd8tZm2ZRGhNA7dVaokXHPutgcgrhgRQ?=
 =?us-ascii?Q?F/MqKW+gg0np+aXHbMkcnFenyQ44JZUonADf/M/oz+3xaJXe6AY6U9fLgbdV?=
 =?us-ascii?Q?loNG2QwWSBpiAQcumDDn0VvS13SESqPaI5VWrKjSvtO2Gjk76lCf2vudjUlo?=
 =?us-ascii?Q?+Iu7e4q4/iGxngFPVjPg1vESlH5N5bzgVOFHDROrovp1CPtAAksowrfO0jf5?=
 =?us-ascii?Q?B+ml7uQcQkFVXJNCXmwXw1GokOC5TA2m/J2UeWqEyJtBH7Toq7ySkdWcruOX?=
 =?us-ascii?Q?/OLLxRGOWXLCMxt8SX7BzMSP3l0rjPWLrwX/SMVR+4MTkAOmP8TK7G+Z0Da+?=
 =?us-ascii?Q?PJ/nVvbb4Du9SKnSTwtGV72Tq3GjRVsjQv86maQrAY9Cba+i69UULlp6xm6Y?=
 =?us-ascii?Q?C1VCFnTU5DY3yZezXfe36W+MQtoO4IB36IKXjDnJEY6gliVO4eS7QprtFs0d?=
 =?us-ascii?Q?AelnWwtE9XiOmpP30JJ32w05ftGnuof0fFSvEi9DoxFU1FWDGIVCeGJ2cxa7?=
 =?us-ascii?Q?f10DDe3cqVLpy8WkpBvPOb1HSMOCwjsPXxgJjHsW/8QMGdHX8WIpo8tNOqyd?=
 =?us-ascii?Q?6TNof+8QEt4ODClZqJWU9/7mEDx9qti9fGWY10hf146wNjkF/pAxh0LrvGoH?=
 =?us-ascii?Q?va2V5gO1Ng0VOI5TeHSjPbALIwho24QXV8THpXrt880rVzvlO0E6twnVWCCU?=
 =?us-ascii?Q?yf5Dw/zsGGIhgEk1ATFxlZHXFwWItR15RG0C3zg2QdTaPZBZ5RzDEw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/N+RJbHvte//ITiAdqqMfCdiKbbh7Bie8oAMP5cSEpf3HU25o2HL5RJrYUzo?=
 =?us-ascii?Q?XqzNNLlEWO6aDOe88ekRDcUeJFGwDXju0S7pJJYGgq+GIldAdRWyBf7tcpZt?=
 =?us-ascii?Q?6E70ubc9SHJ78ehls14J7hwKO+tTVBKxVu38Thty5pyxhwdpFY1P4vx6zXmg?=
 =?us-ascii?Q?YiUIdxSisbBaET2H1nEOOQCyIpp1HOi53da/zlJd63pWjJwMtNkPJErYB8Qx?=
 =?us-ascii?Q?2qrB5HVfZMAqfz2Q8UKt5/az202UwOxsVOMjstkfjSM0KIG9F7rpdjjWqIDd?=
 =?us-ascii?Q?cj1Uq/OWriJbcBYaDf4sVJBtMxwXFt50TZHu8TrKTkwtfN9kdwXt53be1qSP?=
 =?us-ascii?Q?EkQA0ExB30EtixgojWKRRdY/KgpL7F4OfMu4FsvUo40NhbyGxDtnX1oguMzL?=
 =?us-ascii?Q?t+jrWdzIbo1OoudZvpDdiNWwlCC5Ac0fiKDWbxOmL5uT1vmDMancL0CqfGxA?=
 =?us-ascii?Q?cF+DunLqJw4P7kdoX18l/GR+owiEVOHE1Bm3ZaXeH3BSLevmgL+JJVXpwanS?=
 =?us-ascii?Q?PbmyIPeqAO0hPfJeJ5irhIYPsao3iqK2vQyJV0XLBmEwqSz081VE+sRVP6ex?=
 =?us-ascii?Q?OkVkiqmMgnCzBy9Ekl7E8I0O1Za2Nq0uhm6Ezn0AmntTL31NW02Y0XV7H9qn?=
 =?us-ascii?Q?ZOam5MOULWPkq8He4oi56DInqCCA+ak3GmHseWfhqY0PDVBgqnLzXCMo4FNy?=
 =?us-ascii?Q?60mHLMni1DFHn8BGVLaPZ0ZHRxQlFMmLFdWiHUjfm//+h4aFp5wBN944Zg8+?=
 =?us-ascii?Q?T+uf6DNHUCY14EGIdbDMdY+EUbOtrfRzAJZtEPDg2lkGAZDNceczZ2IwAUaS?=
 =?us-ascii?Q?D0sf1AOiCdWNMJXo+JHCnukfUb8hZDAAWZdpjj8uBXzggc+xg87s/c1vdiAx?=
 =?us-ascii?Q?iHUVtGvtGTpyX7CiJnZq/CgGk17K7TtSmLAwRoGXTCSYotIOm5XZv2/rw2Va?=
 =?us-ascii?Q?ghTUgTwXkbJRTKvBeIlgfJsr3oAbdzhxwfQw7ijQdvdSJ4LirtfVialb9tHa?=
 =?us-ascii?Q?mt4TQ7667ojoCSCMteC8Vw8BmPLloE67OlfCCKBj7A/70z9qpLjXC4MYNXai?=
 =?us-ascii?Q?DANrCytOGxEmA53GixnEno2XvE+Utq/GeiRT61ydc/b9G66GtP+lIF27z8GF?=
 =?us-ascii?Q?s5HIbILhHOLOUMOPAKUkaFzMLED6gDzlZjBRqYI6Bjjmiej5nSusy/YWxEQS?=
 =?us-ascii?Q?6Ioc0vu/goufIMc1IParVc62By8tpvFK/JQR+SAmR9/iE4pissXij4R7D5dV?=
 =?us-ascii?Q?YzNBj3h4kTecYOU+EakQGmKaoJKkkaGV7gd2D2PUL2BxJYUnUM2py69WJe4T?=
 =?us-ascii?Q?qnHl+WOwGxmb2w/4ZyK5jU8Z8UU+dpPRAsrOLJIIN7kal1dBljVKtYm3X7Ag?=
 =?us-ascii?Q?ShatLAbWWc463Pkz9bFOIzMwKwFEp3oK7izgiJkqk/y/7wgXqZ9A8Atb8yGc?=
 =?us-ascii?Q?H1uxR5B6ACmpb3ayphK8EQZ4rxxJPUMQjZNA9uSt9Ry+i7NpDBzgtD6kAq1Y?=
 =?us-ascii?Q?YanBReqPGAEJwNJKaAHb1UOx9zrBKkuJB9H9ysN6Lsn01O70UV6Innbychl1?=
 =?us-ascii?Q?expKPIcxvEW/y+s0QwFU78VgFcpqYKl9BJMBroTM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5df8550-f00a-411b-5cc3-08dd86461675
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:14.4221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FdQSr4pwvLInBrzaBD6AL2os+44pY/wo7KWZc8p0lLXU8tSXnkeHgoOicUB4NsINxg4rjvHUW6eScxUHL+MBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
hash filter is implenented through a 64-bit hash table to match against
the hashed addresses, PF and VFs each have two MAC hash tables, one is
for unicast and the other one is for multicast. But MAC exact filter is
shared between SIs (PF and VFs), each table entry contains a MAC address
that may be unicast or multicast and the entry also contains an SI bitmap
field that indicates for which SIs the entry is valid.

For i.MX95 ENETC, MAC exact filter only has 4 entries. According to the
observation of the system default network configuration, the MAC filter
will be configured with multiple multicast addresses, so MAC exact filter
does not have enough entries to implement multicast filtering. Therefore,
the current MAC exact filter is only used for unicast filtering. If the
number of unicast addresses exceeds 4, then MAC hash filter is used.

Note that both MAC hash filter and MAC exact filter can only be accessed
by PF, VFs can notify PF to set its corresponding MAC filter through the
mailbox mechanism of ENETC. But currently MAC filter is only added for
i.MX95 ENETC PF. The MAC filter support of ENETC VFs will be supported in
subsequent patches.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Refactor enetc4_pf_set_si_mac_promisc()
2. Split enetc4_pf_set_si_mac_hash_filter() into
enetc4_pf_set_si_uc_hash_filter() and enetc4_pf_set_si_mc_hash_filter()
3. Rename enetc4_pf_wq_task_init() to enetc4_psi_wq_task_init()
4. Rename enetc4_pf_do_set_rx_mode() to enetc4_psi_do_set_rx_mode()
5. Remove mac_list_lock and mac_list related functions
6. Add enetc4_pf_clear_maft_entries() and enetc4_pf_add_maft_entries()
7. Refactor enetc4_pf_set_mac_exact_filter() and rename it to
enetc4_pf_set_uc_exact_filter()
v6 changes:
1. Add rtnl_lock() to enetc4_psi_do_set_rx_mode()
2. Move enetc4_psi_wq_task_init() to enetc4_pf_netdev_create(), and add
   cancel_work() and destroy_workqueue() to enetc4_pf_netdev_destroy()
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |   3 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |   8 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 260 ++++++++++++++++++
 .../net/ethernet/freescale/enetc/enetc_pf.h   |   3 +
 4 files changed, 274 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index c3ebb32ce50c..1573ff06fcf4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -301,6 +301,9 @@ struct enetc_si {
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
 	const struct enetc_si_ops *ops;
+
+	struct workqueue_struct *workqueue;
+	struct work_struct rx_mode_task;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 695cb07c74bc..826359004850 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -99,6 +99,14 @@
 #define ENETC4_PSICFGR2(a)		((a) * 0x80 + 0x2018)
 #define  PSICFGR2_NUM_MSIX		GENMASK(5, 0)
 
+/* Port station interface a unicast MAC hash filter register 0/1 */
+#define ENETC4_PSIUMHFR0(a)		((a) * 0x80 + 0x2050)
+#define ENETC4_PSIUMHFR1(a)		((a) * 0x80 + 0x2054)
+
+/* Port station interface a multicast MAC hash filter register 0/1 */
+#define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
+#define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 175eebadde76..7b801f6e9a31 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -11,6 +11,15 @@
 
 #define ENETC_SI_MAX_RING_NUM	8
 
+#define ENETC_MAC_FILTER_TYPE_UC	BIT(0)
+#define ENETC_MAC_FILTER_TYPE_MC	BIT(1)
+#define ENETC_MAC_FILTER_TYPE_ALL	(ENETC_MAC_FILTER_TYPE_UC | \
+					 ENETC_MAC_FILTER_TYPE_MC)
+
+struct enetc_mac_addr {
+	u8 addr[ETH_ALEN];
+};
+
 static void enetc4_get_port_caps(struct enetc_pf *pf)
 {
 	struct enetc_hw *hw = &pf->si->hw;
@@ -26,6 +35,9 @@ static void enetc4_get_port_caps(struct enetc_pf *pf)
 
 	val = enetc_port_rd(hw, ENETC4_PMCAPR);
 	pf->caps.half_duplex = (val & PMCAPR_HD) ? 1 : 0;
+
+	val = enetc_port_rd(hw, ENETC4_PSIMAFCAPR);
+	pf->caps.mac_filter_num = val & PSIMAFCAPR_NUM_MAC_AFTE;
 }
 
 static void enetc4_pf_set_si_primary_mac(struct enetc_hw *hw, int si,
@@ -56,6 +68,185 @@ static void enetc4_pf_get_si_primary_mac(struct enetc_hw *hw, int si,
 	put_unaligned_le16(lower, addr + 4);
 }
 
+static void enetc4_pf_set_si_mac_promisc(struct enetc_hw *hw, int si,
+					 bool uc_promisc, bool mc_promisc)
+{
+	u32 val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+
+	if (uc_promisc)
+		val |= PSIPMMR_SI_MAC_UP(si);
+	else
+		val &= ~PSIPMMR_SI_MAC_UP(si);
+
+	if (mc_promisc)
+		val |= PSIPMMR_SI_MAC_MP(si);
+	else
+		val &= ~PSIPMMR_SI_MAC_MP(si);
+
+	enetc_port_wr(hw, ENETC4_PSIPMMR, val);
+}
+
+static void enetc4_pf_set_si_uc_hash_filter(struct enetc_hw *hw, int si,
+					    u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIUMHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIUMHFR1(si), upper_32_bits(hash));
+}
+
+static void enetc4_pf_set_si_mc_hash_filter(struct enetc_hw *hw, int si,
+					    u64 hash)
+{
+	enetc_port_wr(hw, ENETC4_PSIMMHFR0(si), lower_32_bits(hash));
+	enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
+}
+
+static void enetc4_pf_clear_maft_entries(struct enetc_pf *pf)
+{
+	int i;
+
+	for (i = 0; i < pf->num_mfe; i++)
+		ntmp_maft_delete_entry(&pf->si->ntmp_user, i);
+
+	pf->num_mfe = 0;
+}
+
+static int enetc4_pf_add_maft_entries(struct enetc_pf *pf,
+				      struct enetc_mac_addr *mac,
+				      int mac_cnt)
+{
+	struct maft_entry_data maft = {};
+	u16 si_bit = BIT(0);
+	int i, err;
+
+	maft.cfge.si_bitmap = cpu_to_le16(si_bit);
+	for (i = 0; i < mac_cnt; i++) {
+		ether_addr_copy(maft.keye.mac_addr, mac[i].addr);
+		err = ntmp_maft_add_entry(&pf->si->ntmp_user, i, &maft);
+		if (unlikely(err)) {
+			pf->num_mfe = i;
+			goto clear_maft_entries;
+		}
+	}
+
+	pf->num_mfe = mac_cnt;
+
+	return 0;
+
+clear_maft_entries:
+	enetc4_pf_clear_maft_entries(pf);
+
+	return  err;
+}
+
+static int enetc4_pf_set_uc_exact_filter(struct enetc_pf *pf)
+{
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct enetc_mac_filter mac_filter = {};
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_hw *hw = &pf->si->hw;
+	struct enetc_mac_addr *mac_tbl;
+	struct netdev_hw_addr *ha;
+	int i = 0, err;
+	int mac_cnt;
+
+	netif_addr_lock_bh(ndev);
+
+	mac_cnt = netdev_uc_count(ndev);
+	if (!mac_cnt) {
+		netif_addr_unlock_bh(ndev);
+		/* clear both MAC hash and exact filters */
+		enetc4_pf_set_si_uc_hash_filter(hw, 0, 0);
+		enetc4_pf_clear_maft_entries(pf);
+
+		return 0;
+	}
+
+	if (mac_cnt > max_num_mfe) {
+		err = -ENOSPC;
+		goto unlock_netif_addr;
+	}
+
+	mac_tbl = kcalloc(mac_cnt, sizeof(*mac_tbl), GFP_ATOMIC);
+	if (!mac_tbl) {
+		err = -ENOMEM;
+		goto unlock_netif_addr;
+	}
+
+	netdev_for_each_uc_addr(ha, ndev) {
+		enetc_add_mac_addr_ht_filter(&mac_filter, ha->addr);
+		ether_addr_copy(mac_tbl[i++].addr, ha->addr);
+	}
+
+	netif_addr_unlock_bh(ndev);
+
+	/* Set temporary unicast hash filters in case of Rx loss when
+	 * updating MAC address filter table
+	 */
+	enetc4_pf_set_si_uc_hash_filter(hw, 0, *mac_filter.mac_hash_table);
+	enetc4_pf_clear_maft_entries(pf);
+
+	if (!enetc4_pf_add_maft_entries(pf, mac_tbl, i))
+		enetc4_pf_set_si_uc_hash_filter(hw, 0, 0);
+
+	kfree(mac_tbl);
+
+	return 0;
+
+unlock_netif_addr:
+	netif_addr_unlock_bh(ndev);
+
+	return err;
+}
+
+static void enetc4_pf_set_mac_hash_filter(struct enetc_pf *pf, int type)
+{
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_mac_filter *mac_filter;
+	struct enetc_hw *hw = &pf->si->hw;
+	struct netdev_hw_addr *ha;
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		mac_filter = &pf->mac_filter[UC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_uc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_uc_hash_filter(hw, 0,
+						*mac_filter->mac_hash_table);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		mac_filter = &pf->mac_filter[MC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_mc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mc_hash_filter(hw, 0,
+						*mac_filter->mac_hash_table);
+	}
+	netif_addr_unlock_bh(ndev);
+}
+
+static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
+{
+	/* Currently, the MAC address filter table (MAFT) only has 4 entries,
+	 * and multiple multicast addresses for filtering will be configured
+	 * in the default network configuration, so MAFT is only suitable for
+	 * unicast filtering. If the number of unicast addresses exceeds the
+	 * table capacity, the MAC hash filter will be used.
+	 */
+	if (type & ENETC_MAC_FILTER_TYPE_UC && enetc4_pf_set_uc_exact_filter(pf)) {
+		/* Fall back to the MAC hash filter */
+		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_UC);
+		/* Clear the old MAC exact filter */
+		enetc4_pf_clear_maft_entries(pf);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC)
+		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_MC);
+}
+
 static const struct enetc_pf_ops enetc4_pf_ops = {
 	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
 	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
@@ -303,12 +494,59 @@ static void enetc4_pf_free(struct enetc_pf *pf)
 	enetc4_free_ntmp_user(pf->si);
 }
 
+static void enetc4_psi_do_set_rx_mode(struct work_struct *work)
+{
+	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
+	struct enetc_pf *pf = enetc_si_priv(si);
+	struct net_device *ndev = si->ndev;
+	struct enetc_hw *hw = &si->hw;
+	bool uc_promisc = false;
+	bool mc_promisc = false;
+	int type = 0;
+
+	rtnl_lock();
+
+	if (ndev->flags & IFF_PROMISC) {
+		uc_promisc = true;
+		mc_promisc = true;
+	} else if (ndev->flags & IFF_ALLMULTI) {
+		mc_promisc = true;
+		type = ENETC_MAC_FILTER_TYPE_UC;
+	} else {
+		type = ENETC_MAC_FILTER_TYPE_ALL;
+	}
+
+	enetc4_pf_set_si_mac_promisc(hw, 0, uc_promisc, mc_promisc);
+
+	if (uc_promisc) {
+		enetc4_pf_set_si_uc_hash_filter(hw, 0, 0);
+		enetc4_pf_clear_maft_entries(pf);
+	}
+
+	if (mc_promisc)
+		enetc4_pf_set_si_mc_hash_filter(hw, 0, 0);
+
+	/* Set new MAC filter */
+	enetc4_pf_set_mac_filter(pf, type);
+
+	rtnl_unlock();
+}
+
+static void enetc4_pf_set_rx_mode(struct net_device *ndev)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+
+	queue_work(si->workqueue, &si->rx_mode_task);
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
 	.ndo_start_xmit		= enetc_xmit,
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
+	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 };
 
 static struct phylink_pcs *
@@ -643,6 +881,19 @@ static void enetc4_link_deinit(struct enetc_ndev_priv *priv)
 	enetc_mdiobus_destroy(pf);
 }
 
+static int enetc4_psi_wq_task_init(struct enetc_si *si)
+{
+	char wq_name[24];
+
+	INIT_WORK(&si->rx_mode_task, enetc4_psi_do_set_rx_mode);
+	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
+	si->workqueue = create_singlethread_workqueue(wq_name);
+	if (!si->workqueue)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int enetc4_pf_netdev_create(struct enetc_si *si)
 {
 	struct device *dev = &si->pdev->dev;
@@ -683,6 +934,12 @@ static int enetc4_pf_netdev_create(struct enetc_si *si)
 	if (err)
 		goto err_link_init;
 
+	err = enetc4_psi_wq_task_init(si);
+	if (err) {
+		dev_err(dev, "Failed to init workqueue\n");
+		goto err_wq_init;
+	}
+
 	err = register_netdev(ndev);
 	if (err) {
 		dev_err(dev, "Failed to register netdev\n");
@@ -693,6 +950,7 @@ static int enetc4_pf_netdev_create(struct enetc_si *si)
 
 err_reg_netdev:
 	enetc4_link_deinit(priv);
+err_wq_init:
 err_link_init:
 	enetc_free_msix(priv);
 err_alloc_msix:
@@ -709,6 +967,8 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	struct net_device *ndev = si->ndev;
 
 	unregister_netdev(ndev);
+	cancel_work(&si->rx_mode_task);
+	destroy_workqueue(si->workqueue);
 	enetc4_link_deinit(priv);
 	enetc_free_msix(priv);
 	free_netdev(ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a8b3c8d14254..ae407e9e9ee7 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -23,6 +23,7 @@ struct enetc_port_caps {
 	int num_msix;
 	int num_rx_bdr;
 	int num_tx_bdr;
+	int mac_filter_num;
 };
 
 struct enetc_pf;
@@ -60,6 +61,8 @@ struct enetc_pf {
 
 	struct enetc_port_caps caps;
 	const struct enetc_pf_ops *ops;
+
+	int num_mfe;	/* number of mac address filter table entries */
 };
 
 #define phylink_to_enetc_pf(config) \
-- 
2.34.1


