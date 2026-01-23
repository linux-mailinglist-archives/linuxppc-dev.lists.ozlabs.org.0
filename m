Return-Path: <linuxppc-dev+bounces-16218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMDuAZ4wc2mTswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC572714
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy9xL0cq6z3bkq;
	Fri, 23 Jan 2026 19:25:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769156757;
	cv=pass; b=mCN9c06fJObAy23NNJFCEjjrdA3yUiiiM2AWjK+RKC1DiYmfag0aKYDg+w03J+4pLM9CaoLdpIvOHCtFsfDz+6hxccQU8G9dD7ueqqKhpUoq5APLwvdWQVCBvUdYUKTB5Z2htXxS88Dakeqe1d1Qu4at5YKHOPyegEbHNCiA2U0x9/wG/ycpK8wQ5gjoGFcK6EqI3R14ZZUxiwc9lqvep+xZKx5z0KsoDNW9kg3ggyI+YN2IxLVzKJhYMouvGFuwTDmUia2eYreE7udU7vytzl/mMeZXFO0nMUuecVgG8DEiy2URay7dPgc5qLcmZZv0jDVZ7491PeoLGzxXKpNIeg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769156757; c=relaxed/relaxed;
	bh=JivFpeov6xhozfRxNGMCB8XTQaY5nUziAzTZXBTWLps=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LfggrPx1cAL0TvsAPL/mouhhl331PVyr9eIKT7j9lJhVwjj26mNnuHs5vfd5GXl7t8k0I6ItZdlyYoKbxqO6gk0CLp39OxHcpjicDaAjm+AF9xpW4OWPbOibtECnqSQcD8y21PN4YHn3xJVUbLII4wAVAGFtp5OJ3yOC//tQbAtF4RC2v85GqX0g6h6zzxcr//sdN2F8Jrtq6UeyPueKHwNGAYkkj2uwZiUYQz4pVaLx+sGT/D01TRfP5LCLIdrpk6E/0iOgqxEkq62YCj1wt9KsG4tJ7ovOTBjJNuU2ZH1R0VXvnjofhSp2O+1e27ffArMJRhctkIyVE5sWJCb6xQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=drZNesCQ; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=drZNesCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy9xK2Vzhz3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 19:25:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOPxT5uLjAnQKYet3IhtuluKyHjRjuo6g6AgpSQ/5CKRcj/T66h2o8l+GyM02Y5VqdTz0be6D+MqDKQYcG/qOxbFV69n0tvGgi3wRqwnib5CiMvH9HlBNmRSNiGR2D6oEW5ZSB4k0eiYTZuPQ3ICGO/Hw6e2LwBEAas+zkIWkng6z1s5WjrQvtJQB2Q2vnZwESz03D0mRvw11XzcdolwTh5/B4DnR106NaoNa8Ov4Bawn6Dxt00MR/0KWAWi6fqc3M0NBrhOwb6a6o4tWNfuf46twK8F/eABRkwDrMocfYZcXy4uKiwFvdv3HOYY2osdOm3/OC12bTLStzs9cNWe6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JivFpeov6xhozfRxNGMCB8XTQaY5nUziAzTZXBTWLps=;
 b=GAMDHZnSDUA6aeCxRXfe6XUuGKGbIcYdNsQlhtlX0HIrJGNJehU+vh1pHBCwi4vaznj6xVwqrJqutZ0sFlX/IJ684TkQ2bFJU/M2dSgv4RnuWc+MyL1wkHf6q6Jpsnp6mbFalgM7Vi0SU3mhM4lL0riPbv0ggThNiXrOD/XkgkdM+dXtjDR727LCYeElv6Ku92d4OpBmX48MvszRMO/vf/57OSICwhKKg3jjP3wHiI2aQXR6pn96ADnmirQNS8K42uUMHIzaorNhtW1ab3ZMYaY3nH67aJsDwrfqAXDon/1VrmScMD0UOqldYKxm2kPrOE3hDBBnw/HUre+7NFmbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JivFpeov6xhozfRxNGMCB8XTQaY5nUziAzTZXBTWLps=;
 b=drZNesCQuHn0hV9Jh1sBl1v4dHm0scoHEFjXIouaWCP/0QWTfMaigQlYAdIPgOWt1PWannLKLwy0Wv1QQI6sepOfmmx1FxDruQU9FKDmpvr3/vi3OdAR21gDJ7rwz8KS/n5lQIp6s4CTjINMhT7QPpLv89QzMP1HVGQgtU38QbvOIuPbK7pQ/fNgROUrkf8U+yGYO7vSuOmy4aBYsNUbjMFP0dTLnleGyYNfTC/ivsEOWhsNkAWtfvVh1nVlKSpklKRO/HZBOP1MDI+wH/p8ZpUY1sw1JTxZGfdnKmAvyIU1K4OVmf3eQhRh6/eU7OYP4g2JBLSfPb1NV21pz3RVww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 08:25:33 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:25:33 +0000
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
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/4] ASoC: dt-bindings: fsl,audmix: Add support for i.MX952 platform
Date: Fri, 23 Jan 2026 16:24:58 +0800
Message-Id: <20260123082501.4050296-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
References: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7f61a5-3641-419c-ae00-08de5a58f9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VWUk8ErTyq9PEDx3lhjSIzIw8Ao1KQfMonCcsl4XtVbOq1ocm08PyjsxVWk5?=
 =?us-ascii?Q?9hQ+NJZmNyg0xya6vo9FZTZdVpvwwZOiJJ/HvjB1jn5oWtAGJ1p8rbU93BxC?=
 =?us-ascii?Q?nL16IJbeHSncu0s+vQBPgZIdwy+YuWF3XaryDaiKAn0E6jc+etAI7ZwJgbz2?=
 =?us-ascii?Q?Cw88AaK+v9Om37CUCi3M4NmXlxXuJgoU3MVj+SNJvw9FlijOcLuI0x5JRhU/?=
 =?us-ascii?Q?/NbxMuM0UoWNR47TVgXlVrSdK5gIIBp12pqCoUorCsU9DMQ08pvK4yXaApti?=
 =?us-ascii?Q?c55vrla4fPQw16quZzW39BAtgN76DNj8ZdpMmIPTiW0SCCCYEMSaORdt9tlc?=
 =?us-ascii?Q?FaqCbw3nrRrpa/tfHCVaFLDMIwZmPwoN9fB1gtvUaZvT96avTKhQgH1ymiCU?=
 =?us-ascii?Q?h73jiwBr5LMyw0SUhssVhgKCMIeR2Nzy3KkHIUNBEf7WBzjXnMMPHKATI4hH?=
 =?us-ascii?Q?5MEBvdmzAWzyJGR2bV7Ii7LZuBSBj+HaEZfeG4Y4lZ3b6yryk3i0QoqMQ7um?=
 =?us-ascii?Q?PI3XpyzvphBGCnHq4bQnSkM+dMHG8GjNeECZv4jLSqTvhnS7CCYMlgyB5/F+?=
 =?us-ascii?Q?/7cMklB239sUwgcz9OVDVwqCHRQtmMd1Cxn4fofKL05tlhuRt11kgIgh2nHt?=
 =?us-ascii?Q?JW6IGUffUw4PJwvnwdrsp5isZtXfZhKS0yHvC4OC/wpKmRDUWXuQNfeHSQON?=
 =?us-ascii?Q?WF0mhYKJ/5bkAiaotr/GK1LyEqmwCc6Oa5zhVG18uoffpgiIJUYoMmt36Icj?=
 =?us-ascii?Q?2/aurARMbHr8GsGbI2EfenAeZpedS7VK6p7Z3ueJjYMbIV4OOjU0q627dLP1?=
 =?us-ascii?Q?Ej4DaQqPIoPYDHcJOL1RkGqkqJXii7kj8rfixgIQIZaRMpqV90WOOuwaPCFK?=
 =?us-ascii?Q?s67hkzMyCkgaQEoUXh0ZmwnIrpcLIGey2PdNs+23O+z78EwLlVXEmNmfxf86?=
 =?us-ascii?Q?eYkuTpSh2k1YCjTsSIDB+1Zl83AOEDpeiV+kUvsYZ+UaVwt/J4nwq+EDznMz?=
 =?us-ascii?Q?FAVNfaPwK3oczDdcAAFOaNiQDkWhLYhOiauy5K/49s9/5h28/RLxZVB1rxDW?=
 =?us-ascii?Q?O/y3Ne8Yx42/f6JTTsj+bSZCyYR01kJIQ7a2C7h5DhgYH3DsfAGtGu/s7FZx?=
 =?us-ascii?Q?WnI1xj6DCvRdI6uztUDPygjx77z3mOCqiTf57fM4GKMLbAj8huIByGk68xmt?=
 =?us-ascii?Q?7q+gF3dDsdAMUO+1/DcVjsob1e1tO1P+AV1MgTQZ2WzSp4ySvlRknE1z6ZBu?=
 =?us-ascii?Q?9mLVI7xtSF8Mdn5ZfP4D6GroA/JlgWtXgMjGQwjXJFb75NyrCehcwhx7mXuz?=
 =?us-ascii?Q?hXH1zcf/eDcrlyST/botqFaZ2FLtOED4uvK+0jtyvaw1J7vdKiXFKyWC5FpG?=
 =?us-ascii?Q?gel2V5p42NeRTbJsjEHw8ibz878eX66+8vUel6+a9nCjvjEkCpnqMb8nmPQB?=
 =?us-ascii?Q?uczsTvOrvoAD04n0gKyf7sxSIYJnIAQ5eyY/U8dHxjMkcFxsUMTpn5FdsoNC?=
 =?us-ascii?Q?FmrvGbcf0OUFue82WK+I3Sy0Pt5I3iUwC8fuVmdEgIiZXqMeOBHWLAl51MTI?=
 =?us-ascii?Q?lmy+73M+DtNsB1QM/eN8NYmo/DS7EfYPwzgF3JHOxatg3gKMekXaM6SymLbJ?=
 =?us-ascii?Q?eQ3mWvBpbxwFhzzH6ex4DqsIQJWECH6/Pj6pZ5swDBkT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jd26w/He2oMKNwgvAMh5f8bGuhiP8vDS6/As1AmBUzfTa0tMWc2opDkL1XqD?=
 =?us-ascii?Q?bqwJyF/IOcq+B65cHXv5x4+mZNEk3MmXtXGToUvPtFX+MQAc4MRm/SZcpAMm?=
 =?us-ascii?Q?25OQ9EYw01isjMtyrE2dCjhsAzROYEpD1sLSBBGOVj9PICL/mX7grcRNdYWO?=
 =?us-ascii?Q?2aAvdY/6KlnU9nOI7LM89JMfEgvTWq6M85O88Tfkjm9DGuoWVdjdddCMvVkk?=
 =?us-ascii?Q?8sdi3HZo9O20Zu1SCK9Pm63lTmCYr+ftBfHBLbv/vORJk2FReyERuIOQMLg9?=
 =?us-ascii?Q?b68deY5X9vc4k+3c5erFjsSX4sFrbNY9fgzPeWArNE4TL0eye2bNZ4paorFB?=
 =?us-ascii?Q?eI69A88NWQjcVu5aANlrP0p/O+Ge3L4iKtlwQsYsShvCeslfTO/s77fI7gcV?=
 =?us-ascii?Q?0K1T643QD94axW26iNPsZ/H+A02cy4T3t+RT8Ss1dpuO9AiISy1mL2E86/81?=
 =?us-ascii?Q?5cbBlCeTJ0Ug+nH5aWEBEg2+2BV1InaQlfLrc+CbzDQDGY6Jg/m8txInP8ch?=
 =?us-ascii?Q?0Z5CFNYrnNhgPtIbV9ieB7RqwXXh+RLDeIHhwT7Mtkg1uWJ1FRvhBdrK2hpe?=
 =?us-ascii?Q?wPGk080SqAMZBN/tMI3HCMFOQEl3J58/ehFyqELVn3VChS+sBiC9U+hogHCn?=
 =?us-ascii?Q?yxM9njFYeMlUFkIrYmlOnA1GQhy2t62AZDC2Ji7f7fjkhefribLrcExvKCqN?=
 =?us-ascii?Q?5gcZDWksoOx9/PNlMVsZROpW0rnG5gnma0bqhP5HbAjY/VwmnJj7YSAfZN85?=
 =?us-ascii?Q?7/dqYCYqoq64KE4VakLgezm+y/ciZo7AcSnZr5d38jOhf/6SCd3TuLTPX0rb?=
 =?us-ascii?Q?u8D/UaRo2oTe87/M1touBLJuuwas2p5mGPj4ozi7nFYxuZ5xI3FO4gOE0OXm?=
 =?us-ascii?Q?KuRhX2x1TrQfNQyjxPsLqvIC1Faetjwz8U34A0HCd+zSw5W7wnts/Yiw4Vdv?=
 =?us-ascii?Q?71knorxUyM97MjiVBpdHRIIUL3nx9A9ez8of2CY6XFKkxTUDcHYjm+xZK5Zu?=
 =?us-ascii?Q?3y9gQm5Kg5AsHNIme+TL3QMd+Zws2QmYuPWWhuTqOCjWZRm8Q0XdRaKDCDd7?=
 =?us-ascii?Q?fqZQ09wxGfgMgNyUruSZAFgBURcLd4u+Jp4D5UKHyr96JfZt/D5mizQ7Eoe7?=
 =?us-ascii?Q?qQczpPkWwAqyb6rLfAou2rEJBIBZULL2HDx0O2p4qLF5eqfsOpAQaQ5kjxnd?=
 =?us-ascii?Q?ezKfkIoO8w3//A/sS9cuxApASZ932Iw3VR0czAOoe7I3lnwMLNSyxAdR/m2b?=
 =?us-ascii?Q?9FQA8fw2E1P+7ah0uZocGBjiT5/rhRfPjxrZ6tNzdQar97/BPym8mwPzmCWQ?=
 =?us-ascii?Q?C64R7qLk9khqwEfgtj1/aJitU2qbmkQw03dJhKeferZEIl+r/MCQBlayRD9P?=
 =?us-ascii?Q?YwprxGJ4rF0IpH50AEiE641jMAdsnUeld1jJImzHPPo1aIWbg/EHhqwQi7Uj?=
 =?us-ascii?Q?mRRpZoGRgdTXzSpAKViZut6zNNsMuNUTvBBW6/GFD56ktswise7UxpXCTW71?=
 =?us-ascii?Q?7GKSsZffeyIhqXdY42bZYpf/jDXsB9q2I+S/lqnoTU+/p9vhnZ9QQ1W7LR1p?=
 =?us-ascii?Q?9OPCx0ruDeVtJyiKjBq+u3QAsMdZZVXxO4jBYwVjcrJaP4sE2H2ktCi7R61+?=
 =?us-ascii?Q?ejhQMW2Wa9XbZR4YAMoCddzjrF6Puwe3Zri8RMYQIMS5x0VlS2sbBn17sP0o?=
 =?us-ascii?Q?O8s9r+r7Ds7zOD4q84nNbWo7Ee8orRAxKnSuOoEIX1v5v2+iAfaPAUYj3X0P?=
 =?us-ascii?Q?iPPy9OfA/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7f61a5-3641-419c-ae00-08de5a58f9f3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:25:33.1501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPLti7hwnqIcMMszY3dpHjD+e3SYvpKwN8aC+1QizxqS/QDhgo6nuSWGciCYFFXvrf45TAL8O8hpVupb9QoAZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16218-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.847];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nxp.com:email,nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 08BC572714
X-Rspamd-Action: no action

Add a compatible string for i.MX952 platform.

There is a power domain on i.MX952 for the mix system of AUDMIX.
But it is enabled by default, AUDMIX device don't need to enable it,
so make the power-domains to be optional on i.MX952, and be required on
i.MX8QM.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/fsl,audmix.yaml    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
index 3ad197b3c82c..07b9a38761f2 100644
--- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
@@ -34,7 +34,9 @@ description: |
 
 properties:
   compatible:
-    const: fsl,imx8qm-audmix
+    enum:
+      - fsl,imx8qm-audmix
+      - fsl,imx952-audmix
 
   reg:
     maxItems: 1
@@ -80,7 +82,17 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qm-audmix
+    then:
+      required:
+        - power-domains
 
 unevaluatedProperties: false
 
-- 
2.34.1


