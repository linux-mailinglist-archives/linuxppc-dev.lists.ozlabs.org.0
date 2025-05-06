Return-Path: <linuxppc-dev+bounces-8335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AC4AABD21
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBN90Ps2z301G;
	Tue,  6 May 2025 18:27:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520057;
	cv=pass; b=SpjpzTk+RO+jdG91vecqA6fjC7XaT8aOEvuBC+SRnBsJkBUkHMcgwQZmKgdZa7BySK8lxrW249gTXjJCNqDB7GpgWLaTZiXPp/5o0vizuCF7zDtQzVYUxEqUyl3NAomKGH6KY36JBKRuulnxl+N10eWiADsGdbKcbk70l9+EhVVnvAeeqBIm2+hDX/eQMplO8H5oVY6637blLlVdccl8MtOYnjJZF/NnYLvLihcPr8N/Z3ZV2F2Ldhtnia37dEVOgL0yWXmDv0SUMFe+bnmzgRXKHFzTTjMnSKkFZzXhCAjhS1vmMgg8xvCuZhOqNaXoGuw5Tjh5WytBIUVgvO9NLA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520057; c=relaxed/relaxed;
	bh=29GgiHHx6D7M2yS1pDsurAhmYZd+hqNotb5DH3gdJDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kQUvdD2pBJwxH0DwnMYGkFzr2St2uLl0Cdj6wvwQucacrl6AFwRJQcwuWKums84gwUNy86I2aunqkb1rhZSlrb0/OUidsdJMeF7EiALDAW/q0B1Btj8a5hUFPdCWzTrBbIPwTanjhzUE3suQeuqePvRkNmI/ZWFYelb4ASx0kbciBM/ERCkl42SdE2oWrQ2L4Coc6urRJMb3SPP+RmMoA70yUIJK6r03WV2vFb512UveCE1vJXApyNrdtJVMsDZcN/L6FetY48PahB3YEwUbKZuk849xCQFmXQE+zEVALJyQu9B50+LisgiNPO3YnzM5Ik7b5ZFHU3Yy41Ejz23KDw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W02p0zRW; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W02p0zRW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBN82ldmz303d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY5uOSYn52XZg9Ryj2+n+qZeMuWtXyvoZQ0ZsHNOK+6+4g524lMncehlNCZKN5XK4ctJPkbGBlue3nkjB72ajkWJMCV5A9dkiwcccYEwMFE209BQje1ipGbZNzj5b2Ww+/dj32oKDVJfv3hno2mnxPbBZkP3VQVjrT+34nYWadE5enG2IhCNS207jMnRBR78PK4E9asczG1MwpdW7xK2lv7jpc9fvxO9aHsSmfLlOG9feFI13Clyz4R59fQWcOCQ1ChsA1bnYasvfS0ajojP43Cjq8bTzf0DumQNW6RYkQ+McdQUojsjFSWU4nx76Xg8RG2EaWc70pgPiuDmYoJrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29GgiHHx6D7M2yS1pDsurAhmYZd+hqNotb5DH3gdJDQ=;
 b=k0KrS37QeGPXkj+nEOflfJenXuUqgScJCA0rVNgnOG/pHWuHmdFjSrPVUtAm1mMQbL1yPmEqzMrvLEuujbJQOmRGoAkbpPMlK3/mxJ35PFEhVGGWOdZkZZ9BD+G+mxyW+Jnbayyw0c66HhktE0Ky9W0axMQt3TBJcHZCRgQ2VaqcKoWuSKnAmyxzq6Q+IkIR1LOit7lU6OvkZzy0Y/0KqJffn4HqA4zRruGYYwv1+J4+MQ9htZRptphfT7XTG9lLwzY1NklU0y1yfopLzRujl0rNfjzBRTSazp7vM8uXMTOUq3z0LVTbotLodpk6GfOUIa16SglVUiGp0nuwChpKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29GgiHHx6D7M2yS1pDsurAhmYZd+hqNotb5DH3gdJDQ=;
 b=W02p0zRWs39T03R5sX+Gr8UJooIGaVB3zUOZGSo+gXc8cHq1lxHO0J9ILJqQz828SpE7HApnPvHcub3jkwrdMJcIPsyXJq3TcKuPoD7oVBkyvglo6j+fGzbUKkTZ5Gngk+lbs8RxdmT31xHUO27UbfOWqXcr5ztewm4lMh2Epw+VXmSiNN3+bXaYq7rL9fp4rou0WyuxwEsI20p+z9B8tmVx+/97qps7mNGl5nsn+GFhjUmDNY8NZGDtKRaODqVAJ/txMuDLzaqh1orUx8PrQCn2qT7rDQ4w2CgU1HpqXW8TqqUX7rD4wBX0po67uclA2Xt1n235K3wK/7rhPZfqvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 08:27:27 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:26 +0000
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
	linux-arm-kernel@lists.infradead.org,
	timur@kernel.org
Subject: [PATCH v7 net-next 08/14] net: enetc: add RSS support for i.MX95 ENETC PF
Date: Tue,  6 May 2025 16:07:29 +0800
Message-Id: <20250506080735.3444381-9-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506080735.3444381-1-wei.fang@nxp.com>
References: <20250506080735.3444381-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ccf869f-add1-45bf-42c8-08dd8c77d4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SFuO7FI7i0bFziQWG2q6T2sf5zx/gie2r9qcGxDTUw2xqgFgId+kFyiekkR1?=
 =?us-ascii?Q?ZRyFteT6gTEAbrPbgVFe86EDAH+/nxCidvArUqVNLPiY0tmZ0PIZRmyjdteJ?=
 =?us-ascii?Q?dz9RJp7NUK73Td9hhLTBNqUkIuWAxqZS5BfADZq1YMqEjTjg0s7NEyRyPiRy?=
 =?us-ascii?Q?8RJhZMNFGf0H2Spf8V5MaIofXdgkx8ERwbSvOhizDTKPMM2TfRdmiUwQatf8?=
 =?us-ascii?Q?RNFn9FaLwKqiAxbUMGiqrMekXoP+473xXOobf8xsE7oT/WGLOQCUHu0CqBn5?=
 =?us-ascii?Q?ezTcaCxoL2N5S2IlJYA3ZyAShVmAJk5dLmkVX9AhlR60tvwrbFnDn5aqw8wG?=
 =?us-ascii?Q?g4DY2hKxFRS19XBoFfCSldnaZSLLlNVYS5hFNsqEftTw7si6pqA8w9knQlx5?=
 =?us-ascii?Q?29TpRL0nTKcABRp7GwzF/SIToHiGlqrsbOKRHXwI3+elA8cHuvaivIU75BWm?=
 =?us-ascii?Q?GeGAhm1JPCnOccU+BeuS4hXggR9lWf6y+IG9EecnRJe2HM0RzZ8EDgsy/J0b?=
 =?us-ascii?Q?hlryw5QpxI0rTbggY/uvigr8bOhyZ7dbantdFRzNc+ma6IDS7xccn+OHexYT?=
 =?us-ascii?Q?1/4CSHn+HD5FbFmyyKXVf4N3CBGW3j0DuXUxsPtqPRA5wQsk7lxCNvXvxrPI?=
 =?us-ascii?Q?mhOcwXzAHnisInIKbtTmotqdJGhYqEzmS58S2BSHwDQe4QxmBLsC6z/zlqmP?=
 =?us-ascii?Q?eHkIIPg0FIEoiRVVA3HMH8eRIaK0X7PjNyq4ogkwYu3C9LMZLr58W+3nJn4u?=
 =?us-ascii?Q?8f9PyWTsmmrge3+WjQKgr0E2Wxn6hgBT9k95tM1qXoky6eRmRLAuxGJPIVen?=
 =?us-ascii?Q?KEhPL7sC+v1RMcxyKav7pqmCERjtueTf9A3BFiCZYrmx0nM9nHS3429col9G?=
 =?us-ascii?Q?h+vSLSHLx34q9kKhKEOErP7tOIs6JuQcmX8cY/MUYNdF8Mu87YqNl+r+7iUe?=
 =?us-ascii?Q?NOYIY6qf7eF3ZL1AbDNJ1sB5tF4RwQGewyg+vvCDCVzsnHLUqGldumI/qliq?=
 =?us-ascii?Q?F/7gYjyWCeTfebTiXT/4RUajdyzFqco0P3e3BobLjS4Vdf5du10dNGEeq5MW?=
 =?us-ascii?Q?Szo0DjD4j6f3h59AuD8igZGlOa9vQmFB0pPPo0Li+ESKLy7f41GDHWKg3KAx?=
 =?us-ascii?Q?AuYeCWubTjOqsnpMyLn1F1omXgML02jWwMoSgs6BA9F0tOFNlDMiF/pluMFM?=
 =?us-ascii?Q?AKspGeMvJXCL+LeKvveeetZCeJo/vqn4G6HOFJFKbREEg9zFieROYlY6jLsL?=
 =?us-ascii?Q?DkcwMDBgieeh40W25jsuy9D2FoqcI7AZhZ+DmFS4pD0G6GL32pUtL52DbC8W?=
 =?us-ascii?Q?KoC6DPiQbcgfeBoJJJG0j+DHqs4IBdc58loueeVEhLqHESIkqqixXXzmWdxj?=
 =?us-ascii?Q?yLeP04xCybPHJtCS9RekcWjwRoyHzhpo37vR+AfecO7pB9O7fepJXwwa+FlX?=
 =?us-ascii?Q?k7kgPgB0MLvWUuOaWh0JZPO6YaA/LSqH+hr7CA/Rx41HJ/ZgNzHJew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sOpXALriA7HINtkqPXV0/ekoGeVo9pDdSE3qS6Ws1FC9hHYQRlg2W5e2lpzU?=
 =?us-ascii?Q?NMqgVkGOQkKaiNqx0m34EnTQec4+ImdbqyQa8069MzhVPKPDiK1+CxqXQQqT?=
 =?us-ascii?Q?TL8I4ob9rrH+yZApcWbAbfzMYqMBrvK1IL/v0IwNnusvrHPbIerSqQZL/aTq?=
 =?us-ascii?Q?8BZgDdmg301JRUXCbc0jZ+RbqAnu6xlQgpbJECxXpvgT1TwyT7MaZaVVXx1m?=
 =?us-ascii?Q?Z5+LumCOjXnDNOjDbA0t5rR5bDMkdkGI1oPqZwwpk0C8rz3LjOhC1JDU3V6L?=
 =?us-ascii?Q?84U1Z2LqtnuBxXTh7HwNc8dJ6IcqyOVDyItajrkQL4IUsAsnkyFmKeq9Mnwo?=
 =?us-ascii?Q?/mR+pQ44t9yULsf810VXB5H6koxcJbZ4qpSRLUsg+Ce4oqh46ibdKE79/hCJ?=
 =?us-ascii?Q?il8z3Qc10Qk86ZiZsCCeAjs2SJ5pz/TPHXLlnBMRuH7iiuD2hmtGb98rWPbn?=
 =?us-ascii?Q?fXM2vTY5xAK2deuC4LN8IL/hr8YayDaPoXZ13I6h93t62NtaV2kPkuSTY4Ul?=
 =?us-ascii?Q?T/r1KfJROavzGX7R0/2dVq/7cpu913Xkku8l9blWObrF8KtjQxZKmN3PHGwk?=
 =?us-ascii?Q?kNrAGqa6pAuDUnACVPSth6c5R7g14enWGFkO7+w9b4xQdPnoIIRfRRaJ8tMn?=
 =?us-ascii?Q?6vFhXogRdWqBpFFqlgdZJXFAMNDeUgKKvYXWnjFBHl5rZunFtyLNHKCGLf5z?=
 =?us-ascii?Q?XjBJRthvMRCudfjDPFmg83hTeD82351QpMS4NSk0kRvbMmjAQcLyFT1uXvDR?=
 =?us-ascii?Q?SiXA0m2tZYn8k8P4/kdVz/sAlutlNkCTBftB/6qTxj/PJOGKlb2pghl/706/?=
 =?us-ascii?Q?9WARFQvWXlxCR4ZbWPL3MpZQCMOd9mzfIiZobmwK2JiOpaO83XP9GMgqEwQW?=
 =?us-ascii?Q?KwrUV1juP4jouIzYaL5lmuCHpdd2dmk3GzUb/vAWMTonGUg7ZfXNjD4vopEZ?=
 =?us-ascii?Q?n2iyL6RQwoY3hMEy3bf68NvQqb+fnQ/pJRe2Y/jNKugyVrpcOWZLgeRqccyk?=
 =?us-ascii?Q?fX5FK21jfqglsIdHaa8Ry4vJB45wuq8NpsK3ww5/zM/hyv49Wr0ymd02FMOx?=
 =?us-ascii?Q?U6v7bmHS7H7UavHXusT9XBYbNrHc8EGtg7z/DSZ7B0txOJ8e2f7noOraSyoD?=
 =?us-ascii?Q?vFJ1qrntjPeS8QSl3HKnllQ/m/Q7511EirTA+MHmJfzafhfKt8RuyRH7FnEi?=
 =?us-ascii?Q?M/6AO7U3CBGQxtdXFtOfR+z3HwYFXs46GeF7xc5Nb+fJ2HTn/3of3ghqfVHm?=
 =?us-ascii?Q?k7iBQXXaEeRYn9GXNzUSb6ytRQmFo3qSdSIggow3nsuuRWbmtmKjOdbzUO2N?=
 =?us-ascii?Q?6xlnV3PV24IpFHW3Wbj7Vi+AI3abe/Fdnh0hLReMem+WGKxAFri7y48Qil3S?=
 =?us-ascii?Q?i0pP68E6hKRH9TI3Ri5RE2Tju2GFfZSwMWSpPMoxcdBERDSAAshR+Xdylgl0?=
 =?us-ascii?Q?PgkrqHK1Ym8gL8QD+AXg42x6BRCycjam82axrKsqT44DBvct1hbkbj/eikBm?=
 =?us-ascii?Q?yyC94n7zSnC+WD9juz1LwlT/7zbH7DPQpwJbTXilk/79rX/YT5q9Emtl8tNE?=
 =?us-ascii?Q?WW/cVvQh34o8z83R+2DzXdj2tUYax6H6L/yu5qDg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccf869f-add1-45bf-42c8-08dd8c77d4f7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:26.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JeQJAJ5wOVkdzRV2hR7yipYZVgBCPNlPUsaqPlHIYuGvCW7mk7pV1PTjr6Co53q75sO381wPl+T79jZPbQoUzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Compared with LS1028A, there are two main differences: first, i.MX95
ENETC uses NTMP 2.0 to manage the RSS table, and second, the offset
of the RSS Key registers is different. Some modifications have been
made in the previous patches based on these differences to ensure that
the relevant interfaces are compatible with i.MX95. So it's time to
add RSS support to i.MX95 ENETC PF.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  |  5 +-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 15 ++++++
 .../net/ethernet/freescale/enetc/enetc_cbdr.c | 12 +++++
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 47 ++++++++++++++++---
 .../freescale/enetc/enetc_pf_common.c         |  6 +--
 6 files changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 494f8f77bf4c..08762772c045 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2446,10 +2446,7 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 	if (si->hw_features & ENETC_SI_F_LSO)
 		enetc_set_lso_flags_mask(hw);
 
-	/* TODO: RSS support for i.MX95 will be supported later, and the
-	 * is_enetc_rev1() condition will be removed
-	 */
-	if (si->num_rss && is_enetc_rev1(si)) {
+	if (si->num_rss) {
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index e49c1626e7e5..7b24f1a5969a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -541,6 +541,8 @@ void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count);
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 
 static inline void *enetc_cbd_alloc_data_mem(struct enetc_si *si,
 					     struct enetc_cbd *cbd,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index d2a414c28c21..2d890f7bcc95 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -523,6 +523,14 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 	queue_work(si->workqueue, &si->rx_mode_task);
 }
 
+static int enetc4_pf_set_features(struct net_device *ndev,
+				  netdev_features_t features)
+{
+	enetc_set_features(ndev, features);
+
+	return 0;
+}
+
 static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_open		= enetc_open,
 	.ndo_stop		= enetc_close,
@@ -530,6 +538,7 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_get_stats		= enetc_get_stats,
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
+	.ndo_set_features	= enetc4_pf_set_features,
 };
 
 static struct phylink_pcs *
@@ -957,6 +966,11 @@ static void enetc4_pf_netdev_destroy(struct enetc_si *si)
 	free_netdev(ndev);
 }
 
+static const struct enetc_si_ops enetc4_psi_ops = {
+	.get_rss_table = enetc4_get_rss_table,
+	.set_rss_table = enetc4_set_rss_table,
+};
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -981,6 +995,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 				     "Couldn't map PF only space\n");
 
 	si->revision = enetc_get_ip_revision(&si->hw);
+	si->ops = &enetc4_psi_ops;
 	err = enetc_get_driver_data(si);
 	if (err)
 		return dev_err_probe(dev, err,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
index 71e4da530028..3d5f31879d5c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
@@ -294,3 +294,15 @@ int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count)
 	return enetc_cmd_rss_table(si, (u32 *)table, count, false);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_table);
+
+int enetc4_get_rss_table(struct enetc_si *si, u32 *table, int count)
+{
+	return ntmp_rsst_query_entry(&si->ntmp_user, table, count);
+}
+EXPORT_SYMBOL_GPL(enetc4_get_rss_table);
+
+int enetc4_set_rss_table(struct enetc_si *si, const u32 *table, int count)
+{
+	return ntmp_rsst_update_entry(&si->ntmp_user, table, count);
+}
+EXPORT_SYMBOL_GPL(enetc4_set_rss_table);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 33a91babb0b2..d38cd36be4a6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -625,6 +625,29 @@ static int enetc_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
 	return 0;
 }
 
+/* i.MX95 ENETC does not support RFS table, but we can use ingress port
+ * filter table to implement Wake-on-LAN filter or drop the matched flow,
+ * so the implementation will be different from enetc_get_rxnfc() and
+ * enetc_set_rxnfc(). Therefore, add enetc4_get_rxnfc() for ENETC v4 PF.
+ */
+static int enetc4_get_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc,
+			    u32 *rule_locs)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+
+	switch (rxnfc->cmd) {
+	case ETHTOOL_GRXRINGS:
+		rxnfc->data = priv->num_rx_rings;
+		break;
+	case ETHTOOL_GRXFH:
+		return enetc_get_rsshash(rxnfc);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static int enetc_set_rxnfc(struct net_device *ndev, struct ethtool_rxnfc *rxnfc)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -685,22 +708,29 @@ static int enetc_get_rss_key_base(struct enetc_si *si)
 	return ENETC4_PRSSKR(0);
 }
 
+static void enetc_get_rss_key(struct enetc_si *si, const u8 *key)
+{
+	int base = enetc_get_rss_key_base(si);
+	struct enetc_hw *hw = &si->hw;
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		((u32 *)key)[i] = enetc_port_rd(hw, base + i * 4);
+}
+
 static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-	int err = 0, i;
+	int err = 0;
 
 	/* return hash function */
 	rxfh->hfunc = ETH_RSS_HASH_TOP;
 
 	/* return hash key */
-	if (rxfh->key && hw->port)
-		for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-			((u32 *)rxfh->key)[i] = enetc_port_rd(hw,
-							      ENETC_PRSSK(i));
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_get_rss_key(si, rxfh->key);
 
 	/* return RSS table */
 	if (rxfh->indir)
@@ -1249,6 +1279,11 @@ const struct ethtool_ops enetc4_pf_ethtool_ops = {
 	.set_wol = enetc_set_wol,
 	.get_pauseparam = enetc_get_pauseparam,
 	.set_pauseparam = enetc_set_pauseparam,
+	.get_rxnfc = enetc4_get_rxnfc,
+	.get_rxfh_key_size = enetc_get_rxfh_key_size,
+	.get_rxfh_indir_size = enetc_get_rxfh_indir_size,
+	.get_rxfh = enetc_get_rxfh,
+	.set_rxfh = enetc_set_rxfh,
 };
 
 void enetc_set_ethtool_ops(struct net_device *ndev)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 0a95f2ac781a..a302477c4de4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,15 +128,15 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
+	if (si->num_rss)
+		ndev->hw_features |= NETIF_F_RXHASH;
+
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
 		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
 		goto end;
 	}
 
-	if (si->num_rss)
-		ndev->hw_features |= NETIF_F_RXHASH;
-
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
 			     NETDEV_XDP_ACT_NDO_XMIT_SG;
-- 
2.34.1


