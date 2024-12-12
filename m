Return-Path: <linuxppc-dev+bounces-4028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3409EE076
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 08:46:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y84KN39ZZz2yFQ;
	Thu, 12 Dec 2024 18:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733989576;
	cv=pass; b=JvvLjuVbvfkM23RMNYpEzl/jC3fVfB5u0gj/45YuDYG2k/whNa3LB+9NYyah/8c9EmSPazNhLSp/1DYpzl2hDX+ItKcVdi6VzLL0FRBsd8JmPpxQ0vajS21EWdhUKErGycjKJFQYxnII1dd4VWRpAmRAf08VFbl2hiBcbvBy/nql5tQghTLzFUrixbst3Wod5n/ENFwgFSclp4TGaECZro+lEC6JsEHL1P3k83jrU3i5g/ckqoWjve/xXYa1jYEhbhV2of3yaAU8p3+z84xn8lFfwNgJDeGkt4ngZg8DiRYq56AED2CZ3kg5P2rJZUqAXjxJeZlFbaG6xyMug3RCpw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733989576; c=relaxed/relaxed;
	bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=br1DSGFj/TlBfuKLlB5d4Gr8FXJ5G+2A5wGB2nlAE/Z2MrDWgFdl5NQZ1r10jY+RfAvayhanYpTdqDQSEw8UnjrS8rZ0aN7hKHamjmJIzmazKfZ7/DVG1ti5KPfxEQ3zV73uIdTWkhAvOrAqes8tjv+CTyp0mj70LKd+DcnztPtH7ueW1Zw+oamYem2Zz0x9hNwuGgCgQyzRRrIgf6HYaF8zkHoFEpqk3AHHw10qrqottgRHkBv20uo/7/s4mZeuZl4fu+TIvmVtDEORwoXWFfG1Ynpojt/AvS0GJ8E38gb5sC5PkD+uRWp7oubVM/6JSo2Q3F5RxZzLfe6JjXcZFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=h8W35r6z; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=h8W35r6z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::603; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y84KM3z6Kz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 18:46:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOe6EeuY/R+P0m+iyJcWBQ5gA4wbI+P0VUzT6MfewWzfzIv7r8wxAkI6FXWxLTICyVA737LNQkXRUSFGttm6qk+peU4r4XJJaqXfWIZgKAcvJfFoKjbPEKsPMumkMtLLDpFp5xkH7rS83ojckIyRrLgX3XUYfPMpMZpRz3SUcyg4tzeoRTLG2zHxgjJM5zhiay8PtQ2rltFJxiZPu2CuTaF5mAsawHoUSfLNanMbmCNNL0VKTR/QPwexTfgdDG2VI7lV3XqXnsgWVwgTVIXETfRsyJdoeKLl0DJ0wJk/0jsEJ482J8yFfote2I49UiWT17T67YKxcnwm5PetB5gVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=Y6v0kBk+39vI7Q/S1f9ZUwvZt+qQsSYoraYhvZD9Y3We/U3uiCCoHwJEfTJgFPdplxjlWKUf4+UGTcGFb2Pu+Emb0YJxbs/itCgXg+X5pbSxkh0O7dPojWYW+k0z/mFodl5fXfhU0C0oNH9/WMXdq4Rf6axjgnhwwFpMevxBOX4vCQ7Vl6rX0b47Pd92uwWnwQ+ajhLhEl5C1uQx15s5Gxv3XWsyWJTsUTnnJuQt1JlBzbDdecw04jplZuVJBHPeR03+IgkAPTZrIujLPxGR0mBlxq2ukn6+HgKvgFbHWsLnf9Z+8sbTwwo7aIpvhx9TxTtNhiZCp2WFm+B+UvAR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=h8W35r6zIV49KcFJo//offxUtrtWPJDCRAZz7UgmZgiT6e7osiFg64Ldr16GyGnihwid+JjxLMzTgwjMLt8sFcXEbZZb8Tjf2x9qwfcN9UFeg1ukCy7ibFjFkBNfOmOFoUYG99mHETzL0Hosfqzh2qQUgoNDjVIJ2j653V+1SML3qixq7Srbz5IGgJEVIXm60Fk+adCnj+16e1AVIJI4nyfOYUkb/SA0SQf7+OAm/7WsjiVxOvMGA9yioshGZr49IMTWeKdHW6wscGr2gC/oqvoFZR9snezV/htfTYiHkQjzU8xI4GPq7LIXjaYrxcNhFz2FF8w7V32B5vPldtFMIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 07:45:54 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 07:45:54 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 2/6] ASoC: fsl_asrc: define functions for memory to memory usage
Date: Thu, 12 Dec 2024 15:45:05 +0800
Message-Id: <20241212074509.3445859-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: d34a5090-631e-40f5-2d1d-08dd1a8101d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uGfGP5zVn8vXa5ZhN92JJKZFEo6T3iH73oYt2D2yiVWTywDdA7c1hXp0uPwr?=
 =?us-ascii?Q?CnM9eM0klY1OgACeJFNgV5gmO9pH/mO7HUzgUto2bcB+Wt7U8LlWhl2saqyG?=
 =?us-ascii?Q?xleFjC26FXNBjSmyvYCt/6ZhVzbAr9PSp9IyoRF8yHPWO7eEy+rVCd7EKAIN?=
 =?us-ascii?Q?lHuOoZtm4YC+juhChdHOd83Ai6i2eZmwLkL0Wy6H5VBYoVVu3JOBtqyWfEJw?=
 =?us-ascii?Q?j7tgS1wFoVKhJtCiSS74ehq+I6k7pyB5HYB6G3jANgOKM/Q9ulQdjEJzfQ/0?=
 =?us-ascii?Q?zzfPIcn+QsC1TgKiWBzWTcnBZiXhuHFrgs1iv0ZDfybMl3ImnqPNLtSCqXsg?=
 =?us-ascii?Q?Zo6ATFD+Y2usF1oeC1BSa4xCLUcPDT0927yf2yYYcfMrkBPd5Vhc03fW0tTE?=
 =?us-ascii?Q?eqNaehXk8iV++ikFAo2oN0vzGPJ8toHx390cO3AqREBXqRXlDTgJhAONO9p9?=
 =?us-ascii?Q?2S1Od5izAxRO/8/RAc1BTZRIRF7QWcBYt4Vc+hzMtAWfCo+/Tbsr1xF7BbT2?=
 =?us-ascii?Q?2/xQF+SWM+bVFlbjRvYLoC+6oxI/qxAQvx6VyJrP/lVyWFAtg8vCH8Ku/L3M?=
 =?us-ascii?Q?TVBou5rJtqfHXgHJ0DrXEcIKKVfT2mknxDAdSQi3cFVPosgWDVR0e9r6nM72?=
 =?us-ascii?Q?T54wXAyodOiuHa99p6WlOcWYDZmGyx4VHKs8dnkaSAjgFseSY1CbQqlxQInY?=
 =?us-ascii?Q?B4UyHDj0I2TFvdyDHf89dP2UPz7m9RYA08fN+pdBFeOyMU041nOuAbj3Fvid?=
 =?us-ascii?Q?ljiSGfdSLvgiLQU9cXxgbvG3/KHd5UHtW5OUnt1ud5hv+C0GzDLUGV52VQkI?=
 =?us-ascii?Q?Re7Kdr0njbktbnZejc8mVQbbd3G56JfsggbRQI+8vJPOEmtrNrbww8cNFYYU?=
 =?us-ascii?Q?rJiyqLzMaBnge599PfjeBdsKxWltKeZ5ir5sF+ciCKZ/ngi+D5+l6GCXrXDm?=
 =?us-ascii?Q?Yt+gbSavBZKddKEaQJvyW+4fFBelXNmdCrNAJi7xiXMfZdIZgbLvsV5HWlfi?=
 =?us-ascii?Q?K4tB2FY/a0rFsrYv45JsyyZLOrc/bpC7gxlDhsXIQOyj8vM+YJWJXU8T52gH?=
 =?us-ascii?Q?1HMmID6sLJIW8BNFpsg0FY+fSQAesHRrsG7pldWDyi8sO1i0MQvb+FXJlnmJ?=
 =?us-ascii?Q?KY7s0bVXEyd7YHFXC30BLBMEmp9N97pu6PVZ3OYJA/BhrQrSXwI/D8iCvAGZ?=
 =?us-ascii?Q?RwYUieBgDF1e9HTXZ3V1CxcZenDengG5fvsfCMHNuJ2emwUJej42HIDv4fKs?=
 =?us-ascii?Q?IhdteGn3CnSKUQjE5GV2U5T31Cp0UbmuK3Smy5uXdzrnXE846bfN6er83/l8?=
 =?us-ascii?Q?bx8sH30x8QW6KR6XBaTLilP99hypBHpNhdxjCmUNKtMB7JJWyEoYMqe98N+0?=
 =?us-ascii?Q?0Iy3n0hMAGWPDrTjPU6kjyimH9+zFtdH3sA2Pq//CtXza/ZlPQYh48fB9z3y?=
 =?us-ascii?Q?nF7VBKDsm7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6qGodaWUjsusl7CEQIoxZ3p2lsvuj0wMEwM1BdpcIEuKcFFZrbD+mxEgjQ4j?=
 =?us-ascii?Q?8Itv6RWw//4PRN8Xwiea0Qp+8afBTYk1/NM7oNeR/kT7B+/JcWdGmclWDiti?=
 =?us-ascii?Q?71aiJtkBw77jviCc8ogEulq5YFZAdbnzkLrA5FnID2UmMi55jazdr5TY3JKD?=
 =?us-ascii?Q?OOE6vR+/a4uffBXnT7rMRNeDB71T173hygmg1S6bGVEAC118LnOGXXjx0ARv?=
 =?us-ascii?Q?r1Ewa7khGvYT7L4dC8rBv7+tqUVyUw2SE+mWJrgMi9KTDkPMfYolsoL1XSYu?=
 =?us-ascii?Q?dy3eEccK7Z5C9yAnHujbDDrxAfMvLm/ovxjC+Jdw21a/Zo711UNrZtm01nKZ?=
 =?us-ascii?Q?432I39adZL3mLeFfTac3aBf9CLLJLrl2KIj0Cej7UiCI/TOSsy/gCkBhUS/D?=
 =?us-ascii?Q?27LNhWHIHKWUFFtWLxMh+rFYw97fjPY+DN40yhzceIYWIS/lr626BnJRTeHQ?=
 =?us-ascii?Q?24TflO0zM34KDNLZBDk4f3B+xVIM/abIU1JnikJDi9zz4Aue2ii2zVdY0vRb?=
 =?us-ascii?Q?JBos8B8pXbB3C8q/6NBLOOpKdUPSdVVCs7LHL2466BwIlx5oVws3uqexu8s5?=
 =?us-ascii?Q?r5WduSaanFn1GpzCJe4E4fl1Adb/W+1F4AJ+bazDWGIN7PYxJqxA/TEgS430?=
 =?us-ascii?Q?bTQMB3KecYf8oIFSjpDSuahpacpVMk9ds8lJiA2BL9qPhRq6oYWJ0u6xUxe6?=
 =?us-ascii?Q?Q2aVU7Xjk2lp9GEru0g5NbQtZU5i3QEWhNUSOTkEG+M9dUq90ieEPFYSqKla?=
 =?us-ascii?Q?kA0dUjgH9E2Q+u0S5O9p1VaTltVbKxSusNsCjNV9R+lvwxhmzeGrZFt1l/hi?=
 =?us-ascii?Q?yMCAqKYmMWSifmWrobS+MV1ry63BUXuiiTghM9oadvq02+FoRgmP71n5Mm7T?=
 =?us-ascii?Q?n/XJM8j3NwAkZ1DoyObrxKWXo/VFUoYT9yBdxpskddhoW3uaFrKuJOeFqKNS?=
 =?us-ascii?Q?I4r9XS2I/V5jUW830UoM5KmGtspK6semrwwydHrXN70pbE8HKChQIfxumQRD?=
 =?us-ascii?Q?BgwFRyk5wL9krmJ9mL9K07Se/SXlzZcOXCW/XG3CuQY3SbzCWVXv29nOTCrj?=
 =?us-ascii?Q?nuQ8che42DvYLL7dSy1na6dJr3+kohYWSG5OUX4bEL7taJ539hoZO738kAx/?=
 =?us-ascii?Q?LgzQppLmlBkSs/PNyp2VOpePt6MRE1+qmS5EdY//X1hVY+OGVW30VOS+u4sm?=
 =?us-ascii?Q?ieLeNny9+THVjJvW3y7ay2la87pX4ysDdXywVjQLGi26EL6yfST66cXoe0Y3?=
 =?us-ascii?Q?wdNWqJP9ARPjXh2nRrOFiHetAqmVhJNtbPdatb+tLVoPxu/WWncKt4TolKT8?=
 =?us-ascii?Q?5UZt8kxIluvk16m+Mx7rxvqZmEykvBm9o5BgY+4drF48neOP45C+NR+zjd49?=
 =?us-ascii?Q?ysfX0fZZyziAsE01clNGQnelZ8DaaS9j0XDA16rJAU2ae3dBpU4R18dHxyfQ?=
 =?us-ascii?Q?eyUwAkV82ydSwwcYBYIB5qIx2x3sasIVwOjsQAXKv6XlZrw0rqYu5jXObFHZ?=
 =?us-ascii?Q?jvDyer4YNdHcGaCIrkVsq3Yulbpcbz+mWKmmGld7b7pK6hWx+CgDCIgAM3WT?=
 =?us-ascii?Q?un6nF7MZ/Wte8RDkyy3nC925NDePj/a6dVGuu8oE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34a5090-631e-40f5-2d1d-08dd1a8101d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 07:45:54.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViiCvpiKjcwLblSwMauSi/fbYWMLwRhu9uaU7k6AUBVNjWkv9EftZ+Uf/ElUmxY6dC0a4PDhuWlFWUmkmFRlqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ASRC can be used on memory to memory case, define several
functions for m2m usage.

m2m_prepare: prepare for the start step
m2m_start: the start step
m2m_unprepare: unprepare for stop step, optional
m2m_stop: stop step
m2m_check_format: check format is supported or not
m2m_calc_out_len: calculate output length according to input length
m2m_get_maxburst: burst size for dma
m2m_pair_suspend: suspend function of pair, optional.
m2m_pair_resume: resume function of pair
get_output_fifo_size: get remaining data size in FIFO

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c        | 142 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |   2 +
 sound/soc/fsl/fsl_asrc_common.h |  61 ++++++++++++++
 3 files changed, 205 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index bd5c46d763c0..471753276209 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1063,6 +1063,139 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_ASRDx(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+
+	val &= ASRFSTi_OUTPUT_FIFO_MASK;
+
+	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+}
+
+static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct asrc_config config;
+	int ret;
+
+	/* fill config */
+	config.pair = pair->index;
+	config.channel_num = pair->channels;
+	config.input_sample_rate = pair->rate[IN];
+	config.output_sample_rate = pair->rate[OUT];
+	config.input_format = pair->sample_format[IN];
+	config.output_format = pair->sample_format[OUT];
+	config.inclk = INCLK_NONE;
+	config.outclk = OUTCLK_ASRCK1_CLK;
+
+	pair_priv->config = &config;
+	ret = fsl_asrc_config_pair(pair, true);
+	if (ret) {
+		dev_err(dev, "failed to config pair: %d\n", ret);
+		return ret;
+	}
+
+	pair->first_convert = 1;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	if (pair->first_convert) {
+		fsl_asrc_start_pair(pair);
+		pair->first_convert = 0;
+	}
+	/*
+	 * Clear DMA request during the stall state of ASRC:
+	 * During STALL state, the remaining in input fifo would never be
+	 * smaller than the input threshold while the output fifo would not
+	 * be bigger than output one. Thus the DMA request would be cleared.
+	 */
+	fsl_asrc_set_watermarks(pair, ASRC_FIFO_THRESHOLD_MIN,
+				ASRC_FIFO_THRESHOLD_MAX);
+
+	/* Update the real input threshold to raise DMA request */
+	fsl_asrc_set_watermarks(pair, ASRC_M2M_INPUTFIFO_WML,
+				ASRC_M2M_OUTPUTFIFO_WML);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	if (!pair->first_convert) {
+		fsl_asrc_stop_pair(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	unsigned int in_width, out_width;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int out_length;
+
+	in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
+	out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
+
+	in_samples = input_buffer_length / in_width / channels;
+	out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
+	out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
+
+	return out_length;
+}
+
+static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
+
+	if (!asrc_priv->soc->use_edma)
+		return wml * pair->channels;
+	else
+		return 1;
+}
+
+static int fsl_asrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_ASRC_FORMATS;
+	cap->fmt_out = FSL_ASRC_FORMATS | SNDRV_PCM_FMTBIT_S8;
+
+	cap->rate_in = supported_asrc_rate;
+	cap->rate_in_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->rate_out = supported_asrc_rate;
+	cap->rate_out_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->chan_min = 1;
+	cap->chan_max = 10;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	int i;
+
+	for (i = 0; i < pair->channels * 4; i++)
+		regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
+
+	pair->first_convert = 1;
+	return 0;
+}
+
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
@@ -1147,6 +1280,15 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
 	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
 
+	asrc->m2m_prepare = fsl_asrc_m2m_prepare;
+	asrc->m2m_start = fsl_asrc_m2m_start;
+	asrc->m2m_stop = fsl_asrc_m2m_stop;
+	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
+	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
+	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
+	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
+	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
 		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 86d2422ad606..1c492eb237f5 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -12,6 +12,8 @@
 
 #include  "fsl_asrc_common.h"
 
+#define ASRC_M2M_INPUTFIFO_WML		0x4
+#define ASRC_M2M_OUTPUTFIFO_WML		0x2
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
 #define ASRC_OUTPUTFIFO_THRESHOLD	32
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..3bdd6ea07c09 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -21,6 +21,26 @@ enum asrc_pair_index {
 
 #define PAIR_CTX_NUM  0x4
 
+/**
+ * struct fsl_asrc_m2m_cap - capability data
+ * @fmt_in: input sample format
+ * @fmt_out: output sample format
+ * @chan_min: minimum channel number
+ * @chan_max: maximum channel number
+ * @rate_in: minimum rate
+ * @rate_out: maximum rete
+ */
+struct fsl_asrc_m2m_cap {
+	u64 fmt_in;
+	u64 fmt_out;
+	int chan_min;
+	int chan_max;
+	const unsigned int *rate_in;
+	int rate_in_count;
+	const unsigned int *rate_out;
+	int rate_out_count;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair common data
  *
@@ -34,6 +54,13 @@ enum asrc_pair_index {
  * @pos: hardware pointer position
  * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
+ * @complete: dma task complete
+ * @sample_format: format of m2m
+ * @rate: rate of m2m
+ * @buf_len: buffer length of m2m
+ * @dma_buffer: buffer pointers
+ * @first_convert: start of conversion
+ * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
 	struct fsl_asrc *asrc;
@@ -49,6 +76,15 @@ struct fsl_asrc_pair {
 	bool req_dma_chan;
 
 	void *private;
+
+	/* used for m2m */
+	struct completion complete[2];
+	snd_pcm_format_t sample_format[2];
+	unsigned int rate[2];
+	unsigned int buf_len[2];
+	struct snd_dma_buffer dma_buffer[2];
+	unsigned int first_convert;
+	unsigned int ratio_mod;
 };
 
 /**
@@ -72,6 +108,17 @@ struct fsl_asrc_pair {
  * @request_pair: function pointer
  * @release_pair: function pointer
  * @get_fifo_addr: function pointer
+ * @m2m_get_cap: function pointer
+ * @m2m_prepare: function pointer
+ * @m2m_start: function pointer
+ * @m2m_unprepare: function pointer
+ * @m2m_stop: function pointer
+ * @m2m_calc_out_len: function pointer
+ * @m2m_get_maxburst: function pointer
+ * @m2m_pair_suspend: function pointer
+ * @m2m_pair_resume: function pointer
+ * @m2m_set_ratio_mod: function pointer
+ * @get_output_fifo_size: function pointer
  * @pair_priv_size: size of pair private struct.
  * @private: private data structure
  */
@@ -97,6 +144,20 @@ struct fsl_asrc {
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
 	void (*release_pair)(struct fsl_asrc_pair *pair);
 	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+	int (*m2m_get_cap)(struct fsl_asrc_m2m_cap *cap);
+
+	int (*m2m_prepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_start)(struct fsl_asrc_pair *pair);
+	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+
+	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
+	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
+	int (*m2m_pair_suspend)(struct fsl_asrc_pair *pair);
+	int (*m2m_pair_resume)(struct fsl_asrc_pair *pair);
+	int (*m2m_set_ratio_mod)(struct fsl_asrc_pair *pair, int val);
+
+	unsigned int (*get_output_fifo_size)(struct fsl_asrc_pair *pair);
 	size_t pair_priv_size;
 
 	void *private;
-- 
2.34.1


