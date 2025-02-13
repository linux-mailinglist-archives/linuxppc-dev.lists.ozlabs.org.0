Return-Path: <linuxppc-dev+bounces-6147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88AA33872
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 08:04:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtmQH0lJHz30T3;
	Thu, 13 Feb 2025 18:04:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739430279;
	cv=pass; b=ZJD890PmWGOSSXPGgxYNxaRKJ69OdCcPlglLdGWnrO8JZNz4QKvUX6espZ/n+L4Y8EtRrbsJVonBtwrywmYyzy4Ov4EShPwJgThGRDt24S4qJW1rbsmfnUm8Rqx/nwBddncZNeAlzaiTL4ygRrUbbnbGdeIF34XPRtwIIPMidZvybSDCZptNtCs5TVvTx6yaIEY8XAx7OjK+MlqRoM+Ot6PZd76BURCuSJIyE0CpDrSejJmb4geiuSOieyO+IHzQyc93GSK5tpLBFzrxKD0scrEbjZc5Y9sno0zr5bpptlmBaXFJhlS7cepIkG7CGCKy6m97yMBrqXW2MajU/qONGw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739430279; c=relaxed/relaxed;
	bh=r6y+kXGuLjQ6dRaqKwxAew/44MG70QD7gS8mE5NyLKs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ae9EHbZ4ABLrkMmcY642pEERKP+/oLqhVhrSU3YWm5oGtwNEy00a/MvSrB4U0O3s4clbnCsG5FqlOanGuku8Ybo5gCbirNwd8PHDHNdG9Cuo0bKeEF/v9s1+9aKb94LXXrarGTzUA7oa7es6J1L277WZdRZ/Yjtc1d0md9hUb1VXTTuZw3mQieXtZkWOp2lXuONlXnQD3W8KVUzej89J4OaLmCjsohtoj9mjfo4nzhwgxNpEVmJ6sI34+YoxLx9GNYYxvnp86jwKmoLvtW2fOEk2QmfaQ8ApP8OHyHBYazHV9GJNGqwqoKNzWVLB6BSXfVOoBQ4nj+N58eQzuzOrVQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V5QC1ubp; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V5QC1ubp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtmQF2fmQz2yvq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 18:04:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opZuD1m5O5HzzDMio00aTFeGK31l+h5x8UR/zav+lCkj/UwslqSjLHZ9fC8PyculyGaUHdz4uZUrimBVc9XztueLPcoeex34p4Gi/xVk4MsuTzAaOgS0QqX/sb/uXM6CgT2CQPTneLqnN7APHPG18hzMZF7QdSTxAWlcammH4W6FirF37gnQoFcKY/jazU0cN4QLRSLnXyIMb79nXH5NrCO354DArrKEtJJg5iUPWwmjFaVSjPAIhilZ8bQdctXpEvzXwYp1WTBolGm83TBsPCetT+90FlJAvt9zvYZ87qik7gho2OUArvP5+rMLkijnzOtfFEjLQVe/+atHQ+vlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6y+kXGuLjQ6dRaqKwxAew/44MG70QD7gS8mE5NyLKs=;
 b=b6k51SXwO7I5sxl2IpVejOMtnAXhyGagWJoovZbr6v2mkRSsK2to8NpqZZKoaBFwNLtMNWOURrGEU2JvOHOyFc5DU35RPbZk+3ND2CS/zsTIddS1UogLl6kjaxCZJfW7YggU5KgK2FRH5tK6RD43V+ykigUDkl3o/2ylT5KKAhoNQa54HLfcZs72E36kx39jBmnTUI4RZwuL+vGKOL97eTle0142saL5ev5Zo2r3Bxkzn9Q+mi0rU0cJh+PqRQWfEHhV02J2Z/EEuKQrx+CqT/s5SSfO2ArNMSGiXP2bj1o8UeXqdumMIRA9aWevfHtcuigjwRHwJcfA27euOwwyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6y+kXGuLjQ6dRaqKwxAew/44MG70QD7gS8mE5NyLKs=;
 b=V5QC1ubp+2bSthIop1QIo2J2VvQI/YB6S45FBCFKiAg+15cw9BIuzNfHiLmRl+tB3rcXldJI6CIRvnPdLMYjuQs40Uk//Y43fNdkTBMYAiekG7PWdhEyXmj61Jlcw+QYrhPgsnnkJvqNq5SEp/Priew5P+K3upPbF1NieenwKe6ktiXUMvVBi84/x1DuRNwhsoennJYwvxfTdSARYFyenIkdoSh+knIx8p6vW9BkXesz+Sp7nDbaUbC0O050qcueA7EaKg4ODknCPSd7DxppPtdPUCH4GaHwFwmbfDZsXT99d7zMX1k1RLbqRf8+6QxUMWPqUUMi1tF0xyfSthT0Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10674.eurprd04.prod.outlook.com (2603:10a6:102:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 07:04:15 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8445.011; Thu, 13 Feb 2025
 07:04:15 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device
Date: Thu, 13 Feb 2025 15:05:18 +0800
Message-Id: <20250213070518.547375-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB10674:EE_
X-MS-Office365-Filtering-Correlation-Id: 439f8864-86b4-4809-1180-08dd4bfca095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FJkBRXTBycbsPUCwgzwbL+489Q+VXvThl5hPAr+GJpYMfVjAQb1vzTCNnhZA?=
 =?us-ascii?Q?LgPlrTMZ5K1cWPv3nU3X0OkkZt+fZTO+fdawxZPBdQLtSSaJuBMEQLdCrYrs?=
 =?us-ascii?Q?siy95+jRQHghEvFTvzHKcM5WFPdj7W1aPP+bVX0wQjkACdTiODNM74wm5+ZA?=
 =?us-ascii?Q?AJCTukC7P7EYNrq9E3iD+y/QQc66LE4XKgtZ7ClIxsCMA7mTOAek39MoQ4LD?=
 =?us-ascii?Q?4aveQhB8y0HeDoDEDQn2eAldJvMaoP0LG6rRMrB4LjcGhV4xm4OsAhEhcE7L?=
 =?us-ascii?Q?liaR6nxmwFc81Cde9WZEWK7H6hND+wSPV5/9JpkTVyRB4RC0MMOhSBmDdULQ?=
 =?us-ascii?Q?zma33l4adQBJPU5DONJWZzesBP+VinWWoIL27SgSrl/blIjMKwNwzH3bMZiS?=
 =?us-ascii?Q?ondOVxh0bpLup8aU1/7DxS1gx5rYRSswoTzq4LS0i4NOi9s9FsDdFg03CvW1?=
 =?us-ascii?Q?M/TRTcl/GPE83nwdSXnNX6OY6brq0WsBg8N2leo7FOXzSDFyUHxo13HfBxSn?=
 =?us-ascii?Q?97KpmnR4VNUqwHIkZM0TRNIFr9sa/8WIBeMM6eJzKn2o73+5C5stSRnD2Y++?=
 =?us-ascii?Q?w25HmrDDFrrabtgxOXOHA2XHn5JmX9HlKQoZ7j1ek0vOz93Cl/xxCQM8BnUU?=
 =?us-ascii?Q?qmS/rAPKpP6aoX8lFePXos6mp+tAqyvO0qQh7RR3ApztPBvq+V8DHbCS0FkB?=
 =?us-ascii?Q?I7z1Ze67I7ROy8+qXibQ5lPDF0hWHU8thXGvMCIhMqU3fBt9xY4WMbueBR6O?=
 =?us-ascii?Q?ayZPLkKbGrD21LC75BiGhdqKwdLuq2Iro/7sHoqwRoqoed8lvtz/hbpCsmf6?=
 =?us-ascii?Q?4r8sFoepn+V+u5kYCroJiryNLbCdEUaZ2bAD1PGCJARQ+rrY7YvqbTAVJQJQ?=
 =?us-ascii?Q?3bfVtu7fQrdZRWTWs0PeX1iga3q8fe/605tg0EGI5lDtEgLM92GiHhA10Gyj?=
 =?us-ascii?Q?jYIzPkqkHCon5MIKD3It0+eMg9RG5y4jz2F/g53m2sLRrORWaP1GdUXBWZe0?=
 =?us-ascii?Q?aKdJMTCd/Xx+WO8wSZ28J9K6uVn2/GZesFcIzdXSHvOaqr1EpFMcMEYAfQhc?=
 =?us-ascii?Q?JmZXuuhvN8dki+MJLPJ0OAf/CrsfaqI6t+mNMGFiz09M55XDwX8ge42+RYO+?=
 =?us-ascii?Q?Nacj/v68FZ1MOPniOiT1nN0MRgXuLJ5HEiwB/BKLisO6DsHW2/DrHULeypwU?=
 =?us-ascii?Q?N6VY2Ctm/nQNFLY70NuzcOtDWyl6y9vR1MmfjW9OynZ+0hjrFDXvoLUrq5Dy?=
 =?us-ascii?Q?ma3G+GuxSUsITkPFlmDW/zyRWsSm8G21Va91zB3ToyawbJaebsugqLbHieKA?=
 =?us-ascii?Q?anAh4kBJ78AJVqSYEpoI6P0NaZ510sPiFSdA8p7QMhxsKweHAbfnfmWMUcVP?=
 =?us-ascii?Q?edSdDOO414VYoPI1jQP40vD8Irgavj4e0+eYwYim81Q7WMqAX9g520xt3U+8?=
 =?us-ascii?Q?hYaf/82FnS7G8t3LPk/bct1k6r/HmF+RHQFCywfqMK5k1FU6bDoIeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yyfJL+u0tIEDPEtF1/7xJ7L8ji3kMYooOoyuHZ0zwZlW3jVWKhfybXcu9Jvz?=
 =?us-ascii?Q?5oqpmD1jMj3Vf81lC/C+XSKoXzTcAXY/to9SeOO2TQFHXaQ9IKvqvrQ+ttKc?=
 =?us-ascii?Q?1kGdwRMTOBuK4d9GMzDF3HsiZgihHLW+qY3xFFXpZkLvsBc4V7pllg/Mfn1H?=
 =?us-ascii?Q?CjCsMGtPUynZPPgymDx19xTWeKni7ZYe2CWLNUwLWi5rT+3exGQI4FSL6OQg?=
 =?us-ascii?Q?hYajBJepcFZyDdHKmimwtkvlyFQMZSUDBATeyN5zsthU5Gt9l8IIFVPfa3FX?=
 =?us-ascii?Q?PHVoJXfGA/kgUjumHJFNvnn3p2Ym+6u3kKnu9uC1eWnDvlqxRjLK59VOS4mM?=
 =?us-ascii?Q?BC117qpA0ryEitN/P6GB5OhnbiDY7j0MWVF8hbpEURuN06h787J74Df47tKh?=
 =?us-ascii?Q?7gTAhENMihOBwKbcYLoCksx6GvPu7PnXbj+d5TiwYxaltuYZ1NBOVu3eGBiZ?=
 =?us-ascii?Q?AuFhMojVHPqplXcRfNmxiJGnaV9fFNK6ZqnpXBsRpvfDGdFb33kocAOF3YLC?=
 =?us-ascii?Q?g6dkjUA6zLDJ7psTCRSrvLSQw41JJZ3uTmgN1D55O7y655GMQzCKL+KSBJgT?=
 =?us-ascii?Q?au9rcOTbXpko+3izPxmi1jZRAt2A7n56Im7kAmIjArEWPR7Gc7i1LKI/FUMD?=
 =?us-ascii?Q?bF8QIFakjO+H3ywf+w75vT0oo3FZfYHGAWxJmrT6dO44SaOnfZqEVOVkg5nO?=
 =?us-ascii?Q?lIZuhrvsIPNCCd2t0cKadC2gkt/UpaTPOjoMpB+HlJKNBnxcDH/BybDMEVZ/?=
 =?us-ascii?Q?AU3uo3q0mNv4Segi2jCTLBxgVtZBF87JGsRzKgyD56sB67FXA7FKd8zdw/st?=
 =?us-ascii?Q?sQ8PU/411PAUtjpKEKQUJK7B3aJD63MBiqDwyhbFX27vT8DM7nDKhtWyQN1n?=
 =?us-ascii?Q?pEtMAX1/juwZ+ehkJIPlEMh6n1p5/LLm3dCv3BZeTT7ef4vh2LwLpREY4IvI?=
 =?us-ascii?Q?gOI8rnQPIfsquw/Br9tWY7G5uNiaSKS1yNWSWyQnKYyZcTHi0mKRjtlI4zi6?=
 =?us-ascii?Q?SNGyUdUqSsswxopx3mnwxL5ukujZCSRvtz/HCYK7Bj2IgtiQQPmXBzF56d/Q?=
 =?us-ascii?Q?NJeH9ls9Gi/6MMJ5il+bGCVFLSOBBDNObYqXBbuvAkD6i0plscOMIUaxVL7t?=
 =?us-ascii?Q?LG9xGcqFcNBek9fzHILR5F0LLmVI3+iqyceXypUjUjVqePEuKKeUi6QMtDiU?=
 =?us-ascii?Q?EXfgWZ9bBQj0FXAz5LLvGkFqYPG5Y9EkL3zbGUZyHhnU95DJJbuT5UK0Voyk?=
 =?us-ascii?Q?2r3rB1QuVILid0HOUkP3qRAhCnmCbGG1kRv/gR8imtIOgcXOPDMd2ZWy6/Jz?=
 =?us-ascii?Q?u4aqQVJ9x9xzlekE+iNU38ptaCPdRv6CkObuJSLxkkHcm18AqInWEnsZYvum?=
 =?us-ascii?Q?vcAjklKqXHacv0RAgm4sEn/KxGb7lKouRRZn/oZdnJw8zsyvwnbMtw/jPTIs?=
 =?us-ascii?Q?N0zTkznMT5U97hLWhWQnmntolVT8DHfrKXfQXEyP3Cu1VL+HpHDLcbYxvwr6?=
 =?us-ascii?Q?JvVrZx363tj3+8wwYabGI+8Ggsn1x3iH8VxRysO2PgoI4wFAX/tEBu3OyQ77?=
 =?us-ascii?Q?B7DA5zetIxz4gkA+/dGyZSuNdRIeVINK1/eNiMUh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439f8864-86b4-4809-1180-08dd4bfca095
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 07:04:15.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIWTtKyyWb30+yQt8b3NxYzzVyGAyb1jAIJmfIxfGJL9ydoEZSiRHbaOMZksiT9fmT5/e+hRkJ5y5AGEO/YscQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10674
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When defer probe happens, there may be below error:

platform 59820000.sai: Resources present before probing

The cpu_mclk clock is from the cpu dai device, if it is not released,
then the cpu dai device probe will fail for the second time.

The cpu_mclk is used to get rate for rate constraint, rate constraint
may be specific for each platform, which is not necessary for machine
driver, so remove it.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- remove cpu_mclk and related constraint setting

 sound/soc/fsl/imx-audmix.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 231400661c90..50ecc5f51100 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -23,7 +23,6 @@ struct imx_audmix {
 	struct snd_soc_card card;
 	struct platform_device *audmix_pdev;
 	struct platform_device *out_pdev;
-	struct clk *cpu_mclk;
 	int num_dai;
 	struct snd_soc_dai_link *dai;
 	int num_dai_conf;
@@ -32,34 +31,11 @@ struct imx_audmix {
 	struct snd_soc_dapm_route *dapm_routes;
 };
 
-static const u32 imx_audmix_rates[] = {
-	8000, 12000, 16000, 24000, 32000, 48000, 64000, 96000,
-};
-
-static const struct snd_pcm_hw_constraint_list imx_audmix_rate_constraints = {
-	.count = ARRAY_SIZE(imx_audmix_rates),
-	.list = imx_audmix_rates,
-};
-
 static int imx_audmix_fe_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct imx_audmix *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct device *dev = rtd->card->dev;
-	unsigned long clk_rate = clk_get_rate(priv->cpu_mclk);
 	int ret;
 
-	if (clk_rate % 24576000 == 0) {
-		ret = snd_pcm_hw_constraint_list(runtime, 0,
-						 SNDRV_PCM_HW_PARAM_RATE,
-						 &imx_audmix_rate_constraints);
-		if (ret < 0)
-			return ret;
-	} else {
-		dev_warn(dev, "mclk may be not supported %lu\n", clk_rate);
-	}
-
 	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS,
 					   1, 8);
 	if (ret < 0)
@@ -323,13 +299,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	}
 	put_device(&cpu_pdev->dev);
 
-	priv->cpu_mclk = devm_clk_get(&cpu_pdev->dev, "mclk1");
-	if (IS_ERR(priv->cpu_mclk)) {
-		ret = PTR_ERR(priv->cpu_mclk);
-		dev_err(&cpu_pdev->dev, "failed to get DAI mclk1: %d\n", ret);
-		return ret;
-	}
-
 	priv->audmix_pdev = audmix_pdev;
 	priv->out_pdev  = cpu_pdev;
 
-- 
2.34.1


