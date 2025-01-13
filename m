Return-Path: <linuxppc-dev+bounces-5123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB62A0B15A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm0q3rQBz305C;
	Mon, 13 Jan 2025 19:40:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757611;
	cv=pass; b=ZTnMOKfBdk9FeiZEPmo75dptsXZt2a9ozqkbj0FLgeD3aogfvcwVyb2fxA4quGrs5Nc0FJVYlLYp5Srj3YmbstWy/crNeOikVlh7w+BgbDVZvUnpMQnsJibWshr5pB9c+lwFBlGWIhTNR4dRoN/ETbePbqTBHsiDFmMsVcTbBPg9OJVwFL6gkK3oo4faNXm5iM5N6QgeBVK/79dVUFMArrD19NVmJbUVXgy2p77uy39lQbUfMzTYSlP2azxzDjiSrgRMWxgP9q9gxPQJDykeKrx9/fJkmCvizUiPLYME4BXswAov4uoWvO7EEcuX28kAdEAnV1K/AurDQ2+hDiPqCw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757611; c=relaxed/relaxed;
	bh=BaE2Ypc92Ok6czI2zettvmxX+IrZP2lNiBLQFEzkJOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MF4JZOh4dMSusi3ihznGpJ85n+a5VzWZsKhJbpljBGEjcPrHSXuWdbMiGV+HlxG324IQ/SaV3GdwRbv7WqxzEt4f0eBohChpViLxFockYnDtHfTIfd0unO1WLPxThMpsyz9sw3mdxZbkhzWSrKOMVwDE/KXABLU+OAFNguulD0GzOkqMOBl0PrPjXjkH7LSauCHJlhRVjZuizcYbTob4m3lLcE48uWV1effhSbPW7DYanV3BYwNVKHVrtB932Nbhjqdy0jKcjYjQNdcRWONdo8gHG3a+NTUOh+JcZxNUir3y1cZzEf+ZXq+pJchzKVdOU2pIP+3wE7sdxLR5KifBRA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gUcGQvVQ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gUcGQvVQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm0p4xtkz3cD7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpLeF6ZfVlBhbeqIl5xISMQi+uRqGUtzz6VgRGZADyjnfUVhfsjbqV9I8iGHn3uibzDFB0P27tJdNRpuifSelCBekQ60gC4vgPvWZhl+Kb2OZ+XDWWt5SRZo7yhKBP/yZE2QVLFFMhuG8LTvLec2QBryyPibc6rT2Q7kzt0+HYThC7XfuvuEd4qkphkSPD02nzxpDoAkl3PEWzo5YrvL324Rpy5iJBAOB9nI71m1jsCzfVrII0Il+AUBx2Iupoporeha7z8GqA7b7T0eX8IIAqoNjhfSkaZRXQBEjRIIUcwo47jPm44Tj3b3YjtYRHaTKh2WRw2ZrJe6hzLRwgTiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaE2Ypc92Ok6czI2zettvmxX+IrZP2lNiBLQFEzkJOI=;
 b=Rxqwvsb9X1uTfOR1MtYnfpPUq6InMXxjDvV5XZv4/WMuZx9aWFINn4BCtY4zukG3iGigGv1ZlMkoWhoaP2Nwt2ROhwqMixsSsX4YvB/b0bFZdhX2hpX3PHwF1y31CcfUOFJ40BmOQ4gkNu/thmCUnKfHVJSk5ojJhBpKDL+74i3//KpUDT3uSL6skYcJBrGBbPFMAkpclk+Foy57pxn8vBPcKP/kWnfNsaywgnSgWufiHpnALrs2bfb5jDaKn5zMcTsdtXvRajkCstj2Ttdi5xmv+RiolTBGQwcnw4Xfifby+FuV/mnc8iq8GofzfnVevF1IMFy6olDcg6CGrpAdhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaE2Ypc92Ok6czI2zettvmxX+IrZP2lNiBLQFEzkJOI=;
 b=gUcGQvVQPhSwYRP+wHaqqzyUQancmoJNmVb+hgJgDT3P75+KOJcks/jtsROaVF9rHvHi5C1EYPWmoTFlNm57s2HxsEYoNftFsTRJUFQMmmG1EqFv1AgPiAqQKmGpXtsWajVyjqoD6U4yurWuOfkOEritm+nYN3TqBwuY6JsHyp7XGFNR6MLzFPqe2jFaSD+yGS9l+8AhKk+lskGb1IgeNKMV14jZz7YtyXpzzCWTSjLp15FJpZxzHmBe199TU12M+DPapzmEhLIKLB3AlITTbmmVA+eJ/9kNrDYrH/J0OJmvNGCxYOCp3oWiMkpQoehInjBacPcNq4O35PIaqjL2QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:39:59 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:39:59 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v2 net-next 03/13] net: enetc: move generic MAC filterng interfaces to enetc-core
Date: Mon, 13 Jan 2025 16:22:35 +0800
Message-Id: <20250113082245.2332775-4-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113082245.2332775-1-wei.fang@nxp.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI1PR04MB9882:EE_
X-MS-Office365-Filtering-Correlation-Id: a2de7f88-463a-4ee9-4e58-08dd33addc81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qTUtWVvr9cRJhK3KhyB4Rne+HY6FFfAxuCb5WSAnWGpod2HZGTLFDoQJIiYw?=
 =?us-ascii?Q?yCjSdwoRf5guUwkUNjMr6T0+bK84KXl/Vaw/OFCbIEdY2JpOdqXd4qfKzdax?=
 =?us-ascii?Q?tJeAfiGAl5RRwa+rLDYvDOfEzojOg4ql+sIUbrP5Q1zjP/4R4vOEdx1HIoAB?=
 =?us-ascii?Q?KlOZsZMi0E7RHQY6B27hiz5+Nyx3RsBwzS16/hJWpHT4kVCmQ5IARhlOOsuy?=
 =?us-ascii?Q?n9MwZ9sBzYJni2WngABp0V/MRV8NxMZoG6AKNWbbbxoAp9CIkbuTS28zz6ob?=
 =?us-ascii?Q?xROp08A8EjYWqiVJqWoXymvrZ5uAtE5It5L4D9HLWkaD8wsgx4z70TXbodys?=
 =?us-ascii?Q?N/pQlK6Ei/TRUMiTJB5sJ+p0xXj84urRpt2ekJ8AqeJPdBErVxLD2SldjUi5?=
 =?us-ascii?Q?52/2QLZ2IATIyE31/80HqNy95vZvdGzKdO/heXyVLXlbc0VgK2xd9BT1y6JI?=
 =?us-ascii?Q?3fACdJoeXfkiTwphBzujQ23xsLzxFPF9iQ7wCywOPkPwoOQh9TL52THduTpf?=
 =?us-ascii?Q?PVcb5iIYBGBBJUPNVOwu+kMFYGbd1GgUqb2UF2d8VEk38X0MvrU1YiPlVGWh?=
 =?us-ascii?Q?ESAdhO1npDBkfHmmml9tPDantEjtatakl1c0qwofkMRcKgzvXCnTwaBafW06?=
 =?us-ascii?Q?JYdEJ8CGAyheacMNJ430m8VZU1tPARFuU5/XWstesHG65ThbXJnqsfagqNme?=
 =?us-ascii?Q?T59r8XibyzN43wUibpnonmlG8+G0UgMEgPYYMCStce0EBiGiWzG90VHiTKqV?=
 =?us-ascii?Q?O4ZIozM1G3rj7wpAT8mGBtVwpvTWESsm2xgQHCttm1AABpAzfhTAxGnhxmmq?=
 =?us-ascii?Q?48dapJRg9GfDQCKx5LbUNSjm62+non0SNmgWPZ/py+34fnbuduYnrvZCgDOj?=
 =?us-ascii?Q?6cbMk9yBmWBzGTwBmYcYiRlvafD//1t0AWy+eVSunfYLnVGXaJYvENYOtBoQ?=
 =?us-ascii?Q?TSsv+yA7MIkORx0Iz8NDZoWoRa05C5n7YQ/B2Ccv4UxTAJkHMR37lPXBs+Kj?=
 =?us-ascii?Q?DTzXAqcECHySlIZs3+ctZpexygq8XKnLIIxzm3Dxu75K8edSqhuok3MG72cr?=
 =?us-ascii?Q?aSKpYSfh31jg9Oyz1S9aETLTLMwqibW9deJkWPfq5lIRLRme/X2V9PSKrPna?=
 =?us-ascii?Q?UFG3d42S9a+nTvFDmXJgqZkqTEURCAzEnPxWll5yEdVoRQawmQcakStUG37L?=
 =?us-ascii?Q?nVaRmtOhj1FSajRFC2AdJDf9vOu/n6mSntweQ90WgcopHKiQjFztQNwysJWB?=
 =?us-ascii?Q?/DyfSuvIcnDwZJOWtZR18lCYJ6ZaH4kzhynW2dk/UU8G9UCi9H/WBX5Ps8+Z?=
 =?us-ascii?Q?ZGyYAsdghyD/mQjiC8qqiYkqhRqVh0k4UbjCql+rTCrXyrTE3t9fnu2ZAqJv?=
 =?us-ascii?Q?XyLqkPlZSbNKZPRZYvKm16k2/hHuXOsjlp5IwaP5SPh7KbFuTc/wtk98dwDQ?=
 =?us-ascii?Q?itCJ4KjIoW4N+NXYSrJ5KwRTTZsXnAAU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2sbEl76j3fjRXOaSd4ITQzDS9qZJeMbMl80UiUpzQBV3fZ2N+ZnU3YvCBH4?=
 =?us-ascii?Q?fFHg6CbSqeEY0KNwe7g7/oPwfNXq2210c4lP+XQUYfSJnd80PtoVPsdeXNIE?=
 =?us-ascii?Q?+KAw/Lie62zuobnrCulnpiAbbAdYDaaa3PM+RpEzk3w+QHkcGN7FZ0UNForD?=
 =?us-ascii?Q?zuCajBVRA8DfqGd8Ek7G0Xj+LsDtP09UVjWVumlDafMRpE2tbg8c9JZ/Xqnx?=
 =?us-ascii?Q?T/wbfofDN/ITCpS+ewB+p6FED/+3uf0zsT/EJgw6uLd5DRt8lGu6w2nEHcL0?=
 =?us-ascii?Q?BYK/tVe41xtD7BI0uCC2Wfvm5ykyqom0pVQGpFvJI8ekXQSBcfhtvcbO80zY?=
 =?us-ascii?Q?xcOlhAbRjdjy5bSLE/vqfZjt9scL+6L8rS0OoNnNh24EfoXiOEQvwKyg4Lm8?=
 =?us-ascii?Q?3Ve/wlT3eTSqQjt2aVgrN6CC3rxo5n0NgP8F9WjTXNk59iRObilOTBYQfq2p?=
 =?us-ascii?Q?DhxW7u00m6vfwNgjkBRXuya2TA4hr+3HWqD1/LE0Svj1lwqlnT8tOaHfgt7K?=
 =?us-ascii?Q?RAwy3VVFmp2ERv+vK1eIyEpU0K9VdoTZNjwjC+klotc5T8YLigvO80eERMtI?=
 =?us-ascii?Q?sB/qYAYoBBJOuImUmzZXrJygSLzSp+xz18OxH6dQcoARr+5jwdM23LgbndR6?=
 =?us-ascii?Q?5d1N2Y0Ru8Zl9w6eieUid5SjDGwfpr3Zaz1iozRVpqz6Wk+Sb/5QcK4IYocO?=
 =?us-ascii?Q?fKv1bDjjhUxscYxS5zHsmfi8sq/NcXK1PndIUs40iE2+9F5jAX24K6ZCJgi2?=
 =?us-ascii?Q?gxAptAYW2yzkDFDd5RApLtNsx4cmuUkRq1CFwDW5UOieCXVqfEeh4nEvhjT0?=
 =?us-ascii?Q?PfkannH0BGxSvBNloVs1BJ5/ceg/+413qI9/VIruOnPUp/1vRUNdSHrrVR3P?=
 =?us-ascii?Q?QGB071LNIxQCK751b0bElTrd0kEE8pmMijufRto8ffjzgiH9Qe/eEdlLhU68?=
 =?us-ascii?Q?k9KI4FvNQn75XmtssJgjLFdhxvv/wuFe/ncsKLfkz7imumhtMdJPXJJR0TRV?=
 =?us-ascii?Q?q+GZmcsXomEdX8OAkMm0tGe59w0glw2m7BYz9k6x6E3w9fcqPVl8UFhRIlnc?=
 =?us-ascii?Q?7o7fgJBINMmwWK2ABoXtLX/IsYS+TNR1sndSmWeb2wyWvb1rjHrzq4jOq0u2?=
 =?us-ascii?Q?zemtOTMD32VQ9Q95elFbCnGvmyi8a3t8IKhjZEe1tPmqDGdH0oIpW1sVxduO?=
 =?us-ascii?Q?a+XNJVDcHiLJm33jAr0eH7Cl6NCGanV+O/Brsy4xL31CPF/cs3wa5RXCbOQy?=
 =?us-ascii?Q?d7eWIn8RJzOqeX40Kr21O+Q+8jfJF6vKhGQruaPCflTyl8DIWSDPcX2wQWuo?=
 =?us-ascii?Q?yhof6u8WllyYl7w7n8U3vdr5kL4sFcQPbsFdxVuycNDIVNfwmxnuXozcFWiE?=
 =?us-ascii?Q?NOHLHm81w36vQIFEwnip7GkncvJ28K5B/zFjrXrsFuuWmDYU9DpumQSmn8wS?=
 =?us-ascii?Q?GdYNAGlDd68i9rUY9qWs72GgB5va0PNo/Up/TA1VlbpT1Rhg9LVEKX/YRGR5?=
 =?us-ascii?Q?hjuubz9Qb+RCvAGJSk8c4+iBrWP09GVdPcjNG24P2BjUCL8n8XvfCsZUQOfK?=
 =?us-ascii?Q?ySGVzkXi2fsmqKuZW4BZGIp6QJbYj5HOTZ5cXOzz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2de7f88-463a-4ee9-4e58-08dd33addc81
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:39:58.9755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOWo1O9sG2sIVINUIXHeNVLdIy+g3lgbQYBprRId42Ngyq6f+//SFohGdJNZRFllw5QC0zgL+241bdoWKzObpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although only ENETC PF can access the MAC address filter table, the table
entries can specify MAC address filtering for one or more SIs based on
SI_BITMAP, which means that the table also supports MAC address filtering
for VFs.

Currently, only the ENETC v1 PF driver supports MAC address filtering. In
order to add the MAC address filtering support for the ENETC v4 PF driver
and VF driver in the future, the relevant generic interfaces are moved to
the enetc-core driver. At the same time, the struct enetc_mac_filter is
moved from enetc_pf to enetc_si, because enetc_si is a structure shared by
PF and VFs. This lays the basis for i.MX95 ENETC PF and VFs to support
MAC address filtering.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 36 ++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  | 17 +++++++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 49 +++----------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   | 14 ------
 4 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 6a6fc819dfde..6d21c133e418 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -36,6 +36,42 @@ static void enetc_change_preemptible_tcs(struct enetc_ndev_priv *priv,
 	enetc_mm_commit_preemptible_tcs(priv);
 }
 
+static int enetc_mac_addr_hash_idx(const u8 *addr)
+{
+	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
+	u64 mask = 0;
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 8; i++)
+		mask |= BIT_ULL(i * 6);
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
+
+	return res;
+}
+
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr)
+{
+	int idx = enetc_mac_addr_hash_idx(addr);
+
+	/* add hash table entry */
+	__set_bit(idx, filter->mac_hash_table);
+	filter->mac_addr_cnt++;
+}
+EXPORT_SYMBOL_GPL(enetc_add_mac_addr_ht_filter);
+
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
+{
+	filter->mac_addr_cnt = 0;
+
+	bitmap_zero(filter->mac_hash_table,
+		    ENETC_MADDR_HASH_TBL_SZ);
+}
+EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 4ff0957e69be..9380d3e8ca01 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -23,6 +23,18 @@
 
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
+#define ENETC_MADDR_HASH_TBL_SZ	64
+
+enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
+
+struct enetc_mac_filter {
+	union {
+		char mac_addr[ETH_ALEN];
+		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
+	};
+	int mac_addr_cnt;
+};
+
 struct enetc_tx_swbd {
 	union {
 		struct sk_buff *skb;
@@ -302,6 +314,8 @@ struct enetc_si {
 	int hw_features;
 	const struct enetc_drvdata *drvdata;
 	const struct enetc_si_ops *ops;
+
+	struct enetc_mac_filter mac_filter[MADDR_TYPE];
 };
 
 #define ENETC_SI_ALIGN	32
@@ -484,6 +498,9 @@ int enetc_alloc_si_resources(struct enetc_ndev_priv *priv);
 void enetc_free_si_resources(struct enetc_ndev_priv *priv);
 int enetc_configure_si(struct enetc_ndev_priv *priv);
 int enetc_get_driver_data(struct enetc_si *si);
+void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
+				  const unsigned char *addr);
+void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index a214749a4af6..cc3e52bd3096 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -72,30 +72,6 @@ static void enetc_set_isol_vlan(struct enetc_hw *hw, int si, u16 vlan, u8 qos)
 	enetc_port_wr(hw, ENETC_PSIVLANR(si), val);
 }
 
-static int enetc_mac_addr_hash_idx(const u8 *addr)
-{
-	u64 fold = __swab64(ether_addr_to_u64(addr)) >> 16;
-	u64 mask = 0;
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 8; i++)
-		mask |= BIT_ULL(i * 6);
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight64(fold & (mask << i)) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
-{
-	filter->mac_addr_cnt = 0;
-
-	bitmap_zero(filter->mac_hash_table,
-		    ENETC_MADDR_HASH_TBL_SZ);
-}
-
 static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 					 const unsigned char *addr)
 {
@@ -104,16 +80,6 @@ static void enetc_add_mac_addr_em_filter(struct enetc_mac_filter *filter,
 	filter->mac_addr_cnt++;
 }
 
-static void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
-					 const unsigned char *addr)
-{
-	int idx = enetc_mac_addr_hash_idx(addr);
-
-	/* add hash table entry */
-	__set_bit(idx, filter->mac_hash_table);
-	filter->mac_addr_cnt++;
-}
-
 static void enetc_clear_mac_ht_flt(struct enetc_si *si, int si_idx, int type)
 {
 	bool err = si->errata & ENETC_ERR_UCMCSWP;
@@ -145,10 +111,9 @@ static void enetc_set_mac_ht_flt(struct enetc_si *si, int si_idx, int type,
 	}
 }
 
-static void enetc_sync_mac_filters(struct enetc_pf *pf)
+static void enetc_sync_mac_filters(struct enetc_si *si)
 {
-	struct enetc_mac_filter *f = pf->mac_filter;
-	struct enetc_si *si = pf->si;
+	struct enetc_mac_filter *f = si->mac_filter;
 	int i, pos;
 
 	pos = EMETC_MAC_ADDR_FILT_RES;
@@ -192,10 +157,10 @@ static void enetc_sync_mac_filters(struct enetc_pf *pf)
 static void enetc_pf_set_rx_mode(struct net_device *ndev)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
-	struct enetc_hw *hw = &priv->si->hw;
 	bool uprom = false, mprom = false;
 	struct enetc_mac_filter *filter;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	struct netdev_hw_addr *ha;
 	u32 psipmr = 0;
 	bool em;
@@ -214,7 +179,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	/* first 2 filter entries belong to PF */
 	if (!uprom) {
 		/* Update unicast filters */
-		filter = &pf->mac_filter[UC];
+		filter = &si->mac_filter[UC];
 		enetc_reset_mac_addr_filter(filter);
 
 		em = (netdev_uc_count(ndev) == 1);
@@ -230,7 +195,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!mprom) {
 		/* Update multicast filters */
-		filter = &pf->mac_filter[MC];
+		filter = &si->mac_filter[MC];
 		enetc_reset_mac_addr_filter(filter);
 
 		netdev_for_each_mc_addr(ha, ndev) {
@@ -243,7 +208,7 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 
 	if (!uprom || !mprom)
 		/* update PF entries */
-		enetc_sync_mac_filters(pf);
+		enetc_sync_mac_filters(si);
 
 	psipmr |= enetc_port_rd(hw, ENETC_PSIPMR) &
 		  ~(ENETC_PSIPMR_SET_UP(0) | ENETC_PSIPMR_SET_MP(0));
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index a26a12863855..2b9d0f625f01 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -6,18 +6,6 @@
 
 #define ENETC_PF_NUM_RINGS	8
 
-enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
-#define ENETC_MAX_NUM_MAC_FLT	((ENETC_MAX_NUM_VFS + 1) * MADDR_TYPE)
-
-#define ENETC_MADDR_HASH_TBL_SZ	64
-struct enetc_mac_filter {
-	union {
-		char mac_addr[ETH_ALEN];
-		DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
-	};
-	int mac_addr_cnt;
-};
-
 #define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_vf_flags {
@@ -52,8 +40,6 @@ struct enetc_pf {
 	int total_vfs; /* max number of VFs, set for PF at probe */
 	struct enetc_vf_state *vf_state;
 
-	struct enetc_mac_filter mac_filter[ENETC_MAX_NUM_MAC_FLT];
-
 	struct enetc_msg_swbd rxmsg[ENETC_MAX_NUM_VFS];
 	struct work_struct msg_task;
 	char msg_int_name[ENETC_INT_NAME_MAX];
-- 
2.34.1


