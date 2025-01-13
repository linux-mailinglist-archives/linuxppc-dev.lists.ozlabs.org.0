Return-Path: <linuxppc-dev+bounces-5124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A5A0B15B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm0r55xFz3cD7;
	Mon, 13 Jan 2025 19:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757612;
	cv=pass; b=OOTVo/DHrbNzblgx0gt41aRsmJCuC/T9GbtjyM1SdHUAIMOtTX6Q3Vj6H0rF8wEsWkJYNtrYuamlgbBSNdreiEP91Pp6htby0+JIg0GxEo5nTqgCwVjuaceDI4NF4TKVtAx52NEzzAuQT8wbsW4MWjeIriK4aNt4jd97d9oCl/j5e/a3xAiCKlI3kzxiId/aczCg96Lh7bhkOI43On0YRKCxFQVJOipAzw8R9Fk6H8m+hugFpemmCBmhGKfw45qZNq7DTwdU6oUU43Ghc70VdRjhnwcb8simVY5TZaFMv4tyrNVqvyrzvdthsvRNFFdx82XcmHfObUStZvMOrNv2Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757612; c=relaxed/relaxed;
	bh=Qxs8en8hre+eEQcIFg9PQ8s1E91LDDI6DZOheVr/1F0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=McYDlk228r0CmwgAgtxcO+4hQelL1oZwJ7QMvk8Lo5wSTYrOJpL0ytQpeQs95rq1vdnS1EF7RYDcvAFFABiZpwhcalQk4Ya9q/lIe1RHCwpxxcrCQTV/9cvdpxZuB51LeYfv/hw7FTf/obdmGeKL9rXfvZlOIYG5ujGeQ4VveKRCGqf781fSOVDoUzo+8UOFTXwK7GCrtKbyKygL9ZkCYyA8a+ofvqy2yadCYOHAxr3A9Fl9nPSlHrUx9bVnOSuWoDZz+G1Z+u8P5vEsRqDu50TG5yOH+BvzmlBgqbt23EI2vztqOMQtnrpvniQN3BGFUc3JnV4sop0jbxDs3vKYOA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gRMEyf/z; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gRMEyf/z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm0q5pHcz3cTf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRS0cD8m53IIMBAmfN44a0i4enJDZ1r/J/IsON008ZrOedqsOeeggqj7/awquS5OPpkUa0tU7JkG9O1CuC4QZzGAT26zEU017ulpMJgGB6YA+a9355n/IyZktPs7ozkNrWxhyd1tv+7KC02jF0/jxUbB4Tq8qg6cgSD9NwW6RKSdaqu4YFPtr6DMuDL6+wtO6EkhsSh5op/dGT67obv4gLqLwARzxpglld0EfCPwfsbOz0fexq8LZPr+252CJvinKcJA0iClpv+92AT9WULT9Bsyfo70j0+oFTjw0UJOGfd8CMY0Q2uDNL9AKrWX72Pvk3xwpXbdJJFN6Uuru46KRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxs8en8hre+eEQcIFg9PQ8s1E91LDDI6DZOheVr/1F0=;
 b=lgCIMVTRH2phQ2bjhZW98bTIRDTupGkv4O0n3dPeCqsbCWwON1qVVR/Gd5PQ723vZYWCDP12kLkBZcDHyN7v8DKg/jeOsleLd3Cz+uqRuXQWgHBIhatQcDGDsTf9BTJ5xrxoddi29xaBESJCaDqi3glpc1mBquBl7F+BvnhqRivWi7sEgv7KEfnFRw7DFq+XRygkenA4jV+FM1JF0P/UuaIjeVy9ivmbnpIuYQK5jsOgfVXOQz5JSrCgf7A43zyWm/7TvCQFcrVKpUnkrqaS4Q1536S923Lb2brCo4Zki4LfNkgYl+ODAvzZwhpjkNKbzkLbn/kqpiIpIh41zWWfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qxs8en8hre+eEQcIFg9PQ8s1E91LDDI6DZOheVr/1F0=;
 b=gRMEyf/zpgXSMsGpwdTfiAiU1a32CvNmy4qmsTfyR5CYMYaDEeiF4GrcPvPoDXGItjFm3Z0r63K1UowwLzTwNg7/OLAVINq1jC1HDMfOwtL5XSiSc2+BwH8afdwNKtgqOLCqLuWDeHoSACpe8QzpMAloenlaoLGgyfqiExHIdXvXZ/atMVQgamn+/rHta8K7fBMhpxeitG7tYLbTuXlh5lQGqxzpU95uzYzUDDUhoSbklmQtFB7GDr3MZsF3Dkyq7s7LlpdceqxSRDgL3eLwxct4t6X8zGvZp4+4SW/lCmentpMd2ztV0exiY08Tv43825amRYVIjdtpbQ82xAsKDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:04 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:04 +0000
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
Subject: [PATCH v2 net-next 04/13] net: enetc: add MAC filter for i.MX95 ENETC PF
Date: Mon, 13 Jan 2025 16:22:36 +0800
Message-Id: <20250113082245.2332775-5-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 408b4228-2620-495e-0654-08dd33addff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nYCFUblkAckgwmHZj20RVOEihy2Xoe7uCYZ4JqKOmita969A4FV/aNmzm/JM?=
 =?us-ascii?Q?9nvvsfeFalkW5j06xVpfk4L1tLMBqLruntAkoiyRrgt1lpud8MuW68ywzH/P?=
 =?us-ascii?Q?IEZaADLJtWmMOITtdSb2Bu/JH+cvsgqgbs7zLK04ECZ9WnSzpqNEFLBcP892?=
 =?us-ascii?Q?ipLSsQD9uialv7AXPuuqyQ3wR5/+hnE7qVCaFv25e6UCxfwYqhRZjfadOVJ2?=
 =?us-ascii?Q?IqphjuV2qKjKDKV8pW2yAWVKrjl7bpd3mIkJw42t6tvxunig0NRZgiofTclp?=
 =?us-ascii?Q?3QVZSJI74m52sb58KiKBJKdxMA0dtST2hvAyFSzab9edRgTSTAFEv0i6e/8y?=
 =?us-ascii?Q?8VoBpjz9Qi1wc4cPXSBMnq5rs7fvxa2i5PRTHz2DBJcMErLyiNOMH9BqU073?=
 =?us-ascii?Q?DMOY9vcBqvICIc1gHmxkQpyxZG6ObAQ9eweAHzSUkgkdh/ASqr8O8pHMMyOo?=
 =?us-ascii?Q?QpO2RZr9kGFXmdj4oUA7W4sn5f7AQ1y5lnae/NAoMxzeDyzcCb0RuYY6i9Et?=
 =?us-ascii?Q?jXmaswnAn9lmtLfjePJIyqHXDM6mDQFJKcJ4ZoaC+LRjBkNg5Y4T09ImiabT?=
 =?us-ascii?Q?vFRkD9AdugpQWoE/X+5T8Vgpj3AE+/uZUobhhSfS59Sf/MVm8zHp+PO/jS92?=
 =?us-ascii?Q?yviX18htv0ZDZptbzM4ybAoVbOSI7fyfksC+zSimOn30tMz+Yl/owFrtqZWA?=
 =?us-ascii?Q?yYkIiH/ive/p/qAdsnGgK4kULYOuq5fNud3ls1gS8OYZyRMrFU7crNcHyB9v?=
 =?us-ascii?Q?5imBzetw8IVAAGyWLP5WQ2sgt3lAw63CnNhC81DB/d2eyz4QdoU/jX1wvIEW?=
 =?us-ascii?Q?pPaT/Y6we8RZj7EnC9/49AT0vhzzilbJeoU/pudiDpD2jep8PmCYIhAXc5dF?=
 =?us-ascii?Q?XJem3Js04gG1vsYioCF2w9wHCtC3PTaV3Q2HyW+P5TlVo7zc25xt6PY36K2F?=
 =?us-ascii?Q?qBMCJM+MfgKNqDwkPO6gceuEEq+hWefbNFLQeqQkI/Xz4FA7/ZxpBz2Z25B2?=
 =?us-ascii?Q?CMt5Nmix0bJf+yXYF+z/4HJVDz920HQh5i451CQkwqghojEtwDmP+xr0472K?=
 =?us-ascii?Q?u2gjopX43j+2/Dort1MLsfq8+Ehh+R+zo7qB5rMlDucKd0oO8cEFMKXtfPgG?=
 =?us-ascii?Q?d94QL50VZqpjcp6+q3jxMxa01fcwiYj4dJA3UoB1+wRHKY7lydO+WHmgBROD?=
 =?us-ascii?Q?L5ox3zCCQXlaxyrpYvfhTGNMPxRDdqdbMwz+ZYqWzPMllBiqdjQcCsOGUFh8?=
 =?us-ascii?Q?VXIlIsDOV8Qd1NISVxPVs7lPlTisfy43S7cXv2dUEtXvL8NewHmSatbYRkGR?=
 =?us-ascii?Q?EQbjRT8SKqMez/373x+PAxpliAaisHfL/jpW+HnOa9IxFS0l4uzv/0cxSsIm?=
 =?us-ascii?Q?xt98Rq4OaOCEyxGNovKy3Nug2RR0TOJz0yAseNMM+K7mdJPzbUEOX+DFG23q?=
 =?us-ascii?Q?2e0uFtGjxNBy4mQ10YLHBFI0JNAptNHs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/35HEME5+mXttYuRjuAMULxqen/8KqAoy1PLjsYO8v/vuYX7AwP3xvP+AOeC?=
 =?us-ascii?Q?BlbircdofnsCVEZCVFYYX0Jn3+KQZIjADOEit++iMDWBuMrwXTEVui1LlPCM?=
 =?us-ascii?Q?trFTtjkZEYOOSQflxIvdAPjghVgjzM5WjxoKM0suomWTTY7LuLc9Ggi4GkMb?=
 =?us-ascii?Q?OyEGln/eTY3Da7jZCsNlkRIYvTrV2dlz82IG95uGZ2j+OP+sN5YoI2YlIPHu?=
 =?us-ascii?Q?oxr7fkXh1IdpheB9T7XvVegbsuJAPzyb9phjWvNFB1d5uQg8sCQWzVmsPyog?=
 =?us-ascii?Q?nGuPLp/TOq+qxW5OTWAqXDutmMC0G3Lr+LeICv3ngK+cG4ko1IS4fHGoY5fX?=
 =?us-ascii?Q?Pbkgv4Qc9rpBoJPLASTbUpOPr46i3Vy0mvTDjOPWHAv4oERGcaIdI3KCIcXP?=
 =?us-ascii?Q?0aGQluopWngyOl+nigTNHSNkZRUYhf9lCqzfGZ2pXj4LKFG7oR40y4j0864H?=
 =?us-ascii?Q?qzUdcz9j2qSWTUUh7GPUjB7O9p6ggPhWp3WX+l1MZfkao8BaFbv99WD/WyUm?=
 =?us-ascii?Q?y4T//N+7Tg4pv7wLPSDLnnftf267HI2PGWaFvtqAEzIvU8z5hncMTPVuLpMf?=
 =?us-ascii?Q?TaNb0veIjo2/2bGTB1fCz14UTLg8CQnZhJeYG5U6QnXfBDgSOGu9o2c/vX8I?=
 =?us-ascii?Q?jHisTiZwqyrHXR3gmeVCJvJYXr5okeu12JUjSAIZIfmRgQXktbtaXJ8MGHCH?=
 =?us-ascii?Q?+bkHSY4HvwZPhcIy/RqeI3cMDk38SkSYHfiN4AGC9Muz4QQ2mUF/u3Is8d6n?=
 =?us-ascii?Q?Wsq6E5FEpiBmob5791fBGlY6QAS4IT59A0F4aAuBvpytyqxPDl3xQCRhnZm6?=
 =?us-ascii?Q?yHp6JGJDlGTNSVOmxTpBDEvXKk16PtDwmOhBi8NPY//Z3toiJoNAXZPi2soS?=
 =?us-ascii?Q?i2K1fXybjyI6i53yUepDtGKI05o4u2WXNIUW/N/1xNYQgTMyBR5jgc5wIAZJ?=
 =?us-ascii?Q?1hnyjhuQAgDbJVX68m6XNkQ30ywkmNxAC6UDb7dojy7EeWelmeEhkEoG0W6I?=
 =?us-ascii?Q?2nVe1V6Sjs9AduU6I2TPNBVIbdfZ1/FXf6FiUzAAMNHOk4uH9DC51LHFWl7p?=
 =?us-ascii?Q?H6AugouKy/3q3BiMD+rg2C8yVw9rY8F6eGiHQlzLJK2xBIRbe69GKSfY6Vrh?=
 =?us-ascii?Q?ECXDsfJ55cYpUNKzrlokZdao/kxhRhc2BQfohH0eKqhCUu+Gyu3XGcdvscII?=
 =?us-ascii?Q?CRp46eAiIXX0VjCO6DfMJ0rJRdMZrc3TN6421Kk+d4If1Bo5ZciTsLmOy7UU?=
 =?us-ascii?Q?EgdN4oyUQWjWgifp1/gmIxwG1ODRusGs/fTIgeqf1pzh57wmcPGmyu4Ib8SQ?=
 =?us-ascii?Q?bmyx968sWPyHIEBLjPmbWePdF5nW3IByFquSjRTsUBW8m1DoB591UAZkg79L?=
 =?us-ascii?Q?fcpCVc7k129/CzoT85y1R55CzF5fYu83DCiQoJL4tnh9SIxsZfQrY07PtraU?=
 =?us-ascii?Q?0/09iPRKyJst3EGkqOg2uN/U/pSKy0kWlL7J71gU0Qo7ZPnswEXP3kX+nTQ9?=
 =?us-ascii?Q?0SeIZLEnJtkbAH/Mdy7n0ZuvCliuP0zGWXLxmJcot6dJrfAd0ZHyWVBRy1Rj?=
 =?us-ascii?Q?pXHGfxm89T1JGHlfZwRhLZAhmfpsCDFzlUbas1Qc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 408b4228-2620-495e-0654-08dd33addff1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:03.9541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwEvv3JCBEjgJCp/H/Px1eYA99qEkOag6xFLzJ9gtYUaaNdzSNG7CDOAiNLh0QpkbZkb7TOCrTX5BwxoqXtMUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The i.MX95 ENETC supports both MAC hash filter and MAC exact filter. MAC
hash filter is implenented through a 64-bits hash table to match against
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
v2 changes:
Fix the compile warning.
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |   2 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |   8 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 411 +++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_hw.h   |   6 +
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  11 +
 5 files changed, 437 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 9380d3e8ca01..4dba91408e3d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -316,6 +316,8 @@ struct enetc_si {
 	const struct enetc_si_ops *ops;
 
 	struct enetc_mac_filter mac_filter[MADDR_TYPE];
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
index b957e92e3a00..7e69c9be36a8 100644
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
@@ -71,9 +83,33 @@ static int enetc4_pf_struct_init(struct enetc_si *si)
 
 	enetc4_get_port_caps(pf);
 
+	INIT_HLIST_HEAD(&pf->mac_list);
+	mutex_init(&pf->mac_list_lock);
+
 	return 0;
 }
 
+static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
+{
+	struct enetc_mac_list_entry *entry;
+	struct hlist_node *tmp;
+
+	scoped_guard(mutex, &pf->mac_list_lock) {
+		hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
+			hlist_del(&entry->node);
+			kfree(entry);
+		}
+
+		pf->num_mfe = 0;
+	}
+}
+
+static void enetc4_pf_struct_free(struct enetc_pf *pf)
+{
+	enetc4_pf_destroy_mac_list(pf);
+	mutex_destroy(&pf->mac_list_lock);
+}
+
 static u32 enetc4_psicfgr0_val_construct(bool is_vf, u32 num_tx_bdr, u32 num_rx_bdr)
 {
 	u32 val;
@@ -305,12 +341,362 @@ static void enetc4_pf_free(struct enetc_pf *pf)
 	enetc4_free_ntmp_priv(pf->si);
 }
 
+static void enetc4_pf_set_si_mac_promisc(struct enetc_hw *hw, int si,
+					 int type, bool en)
+{
+	u32 val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+
+	if (type == UC) {
+		if (en)
+			val |= PSIPMMR_SI_MAC_UP(si);
+		else
+			val &= ~PSIPMMR_SI_MAC_UP(si);
+	} else { /* Multicast promiscuous mode. */
+		if (en)
+			val |= PSIPMMR_SI_MAC_MP(si);
+		else
+			val &= ~PSIPMMR_SI_MAC_MP(si);
+	}
+
+	enetc_port_wr(hw, ENETC4_PSIPMMR, val);
+}
+
+static void enetc4_pf_set_si_mac_hash_filter(struct enetc_hw *hw, int si,
+					     int type, u64 hash)
+{
+	if (type == UC) {
+		enetc_port_wr(hw, ENETC4_PSIUMHFR0(si), lower_32_bits(hash));
+		enetc_port_wr(hw, ENETC4_PSIUMHFR1(si), upper_32_bits(hash));
+	} else { /* MC */
+		enetc_port_wr(hw, ENETC4_PSIMMHFR0(si), lower_32_bits(hash));
+		enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
+	}
+}
+
+static bool enetc_mac_filter_type_check(int type, const u8 *addr)
+{
+	if (type == ENETC_MAC_FILTER_TYPE_UC)
+		return !is_multicast_ether_addr(addr);
+	else if (type == ENETC_MAC_FILTER_TYPE_MC)
+		return is_multicast_ether_addr(addr);
+	else
+		return true;
+}
+
+static struct enetc_mac_list_entry *
+enetc_mac_list_lookup_entry(struct enetc_pf *pf, const unsigned char *addr)
+{
+	struct enetc_mac_list_entry *entry;
+
+	hlist_for_each_entry(entry, &pf->mac_list, node)
+		if (ether_addr_equal(entry->mac, addr))
+			return entry;
+
+	return NULL;
+}
+
+static void enetc_mac_list_add_entry(struct enetc_pf *pf,
+				     struct enetc_mac_list_entry *entry)
+{
+	hlist_add_head(&entry->node, &pf->mac_list);
+}
+
+static void enetc_mac_list_del_entry(struct enetc_mac_list_entry *entry)
+{
+	hlist_del(&entry->node);
+	kfree(entry);
+}
+
+static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u16 si_bit,
+					       struct enetc_mac_addr *mac,
+					       int mac_cnt)
+{
+	struct enetc_mac_list_entry *entry;
+	int i;
+
+	for (i = 0; i < mac_cnt; i++) {
+		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
+		if (entry) {
+			entry->si_bitmap &= ~si_bit;
+			if (!entry->si_bitmap) {
+				enetc_mac_list_del_entry(entry);
+				pf->num_mfe--;
+			}
+		}
+	}
+}
+
+static bool enetc_mac_list_is_available(struct enetc_pf *pf,
+					struct enetc_mac_addr *mac,
+					int mac_cnt)
+{
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct enetc_mac_list_entry *entry;
+	int cur_num_mfe = pf->num_mfe;
+	int i, new_mac_cnt = 0;
+
+	if (mac_cnt > max_num_mfe)
+		return false;
+
+	/* Check MAC filter table whether has enough available entries */
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		for (i = 0; i < mac_cnt; i++) {
+			if (ether_addr_equal(entry->mac, mac[i].addr))
+				break;
+		}
+
+		if (i == mac_cnt)
+			new_mac_cnt++;
+
+		if ((cur_num_mfe + new_mac_cnt) > max_num_mfe)
+			return false;
+	}
+
+	return true;
+}
+
+static int enetc4_pf_set_mac_address_filter(struct enetc_pf *pf, int si_id,
+					    struct enetc_mac_addr *mac,
+					    int mac_cnt)
+{
+	struct enetc_mac_list_entry *entry;
+	struct maft_entry_data data = {0};
+	struct enetc_si *si = pf->si;
+	u16 si_bit = BIT(si_id);
+	int i, num_mfe, err = 0;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	if (!enetc_mac_list_is_available(pf, mac, mac_cnt)) {
+		err = -ENOSPC;
+		goto mac_list_unlock;
+	}
+
+	num_mfe = pf->num_mfe;
+	/* Update mac_list */
+	for (i = 0; i < mac_cnt; i++) {
+		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
+		if (!entry) {
+			entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+			if (unlikely(!entry)) {
+				/* Restore MAC list to the state before the update
+				 * if an error occurs.
+				 */
+				enetc_mac_list_del_matched_entries(pf, si_bit,
+								   mac, i + 1);
+				err = -ENOMEM;
+				goto mac_list_unlock;
+			}
+
+			ether_addr_copy(entry->mac, mac[i].addr);
+			entry->si_bitmap = si_bit;
+			enetc_mac_list_add_entry(pf, entry);
+			pf->num_mfe++;
+		} else {
+			entry->si_bitmap |= si_bit;
+		}
+	}
+
+	/* Clear MAC filter table */
+	for (i = 0; i < num_mfe; i++)
+		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
+
+	i = 0;
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
+		ether_addr_copy(data.keye.mac_addr, entry->mac);
+		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
+	}
+
+mac_list_unlock:
+	mutex_unlock(&pf->mac_list_lock);
+
+	return err;
+}
+
+static void enetc4_pf_flush_mac_exact_filter(struct enetc_pf *pf, int si_id,
+					     int mac_type)
+{
+	struct enetc_mac_list_entry *entry;
+	struct maft_entry_data data = {0};
+	struct enetc_si *si = pf->si;
+	u16 si_bit = BIT(si_id);
+	struct hlist_node *tmp;
+	int i, num_mfe;
+
+	mutex_lock(&pf->mac_list_lock);
+
+	num_mfe = pf->num_mfe;
+	hlist_for_each_entry_safe(entry, tmp, &pf->mac_list, node) {
+		if (enetc_mac_filter_type_check(mac_type, entry->mac) &&
+		    entry->si_bitmap & si_bit) {
+			entry->si_bitmap ^= si_bit;
+			if (!entry->si_bitmap) {
+				enetc_mac_list_del_entry(entry);
+				pf->num_mfe--;
+			}
+		}
+	}
+
+	for (i = 0; i < num_mfe; i++)
+		ntmp_maft_delete_entry(&si->ntmp.cbdrs, i);
+
+	i = 0;
+	hlist_for_each_entry(entry, &pf->mac_list, node) {
+		data.cfge.si_bitmap = cpu_to_le16(entry->si_bitmap);
+		ether_addr_copy(data.keye.mac_addr, entry->mac);
+		ntmp_maft_add_entry(&si->ntmp.cbdrs, i++, &data);
+	}
+
+	mutex_unlock(&pf->mac_list_lock);
+}
+
+static int enetc4_pf_set_mac_exact_filter(struct enetc_pf *pf, int type)
+{
+	struct enetc_mac_addr *mac_tbl __free(kfree);
+	int max_num_mfe = pf->caps.mac_filter_num;
+	struct net_device *ndev = pf->si->ndev;
+	struct netdev_hw_addr *ha;
+	u8 si_mac[ETH_ALEN];
+	int mac_cnt = 0;
+
+	mac_tbl = kcalloc(max_num_mfe, sizeof(*mac_tbl), GFP_KERNEL);
+	if (!mac_tbl)
+		return -ENOMEM;
+
+	enetc_get_primary_mac_addr(&pf->si->hw, si_mac);
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		netdev_for_each_uc_addr(ha, ndev) {
+			if (!is_valid_ether_addr(ha->addr) ||
+			    ether_addr_equal(ha->addr, si_mac))
+				continue;
+
+			if (mac_cnt >= max_num_mfe)
+				goto err_nospace_out;
+
+			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
+		}
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		netdev_for_each_mc_addr(ha, ndev) {
+			if (!is_multicast_ether_addr(ha->addr))
+				continue;
+
+			if (mac_cnt >= max_num_mfe)
+				goto err_nospace_out;
+
+			ether_addr_copy(mac_tbl[mac_cnt++].addr, ha->addr);
+		}
+	}
+	netif_addr_unlock_bh(ndev);
+
+	return enetc4_pf_set_mac_address_filter(pf, 0, mac_tbl, mac_cnt);
+
+err_nospace_out:
+	netif_addr_unlock_bh(ndev);
+
+	return -ENOSPC;
+}
+
+static void enetc4_pf_set_mac_hash_filter(struct enetc_pf *pf, int type)
+{
+	struct net_device *ndev = pf->si->ndev;
+	struct enetc_mac_filter *mac_filter;
+	struct enetc_hw *hw = &pf->si->hw;
+	struct enetc_si *si = pf->si;
+	struct netdev_hw_addr *ha;
+
+	netif_addr_lock_bh(ndev);
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		mac_filter = &si->mac_filter[UC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_uc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mac_hash_filter(hw, 0, UC,
+						 *mac_filter->mac_hash_table);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC) {
+		mac_filter = &si->mac_filter[MC];
+		enetc_reset_mac_addr_filter(mac_filter);
+		netdev_for_each_mc_addr(ha, ndev)
+			enetc_add_mac_addr_ht_filter(mac_filter, ha->addr);
+
+		enetc4_pf_set_si_mac_hash_filter(hw, 0, MC,
+						 *mac_filter->mac_hash_table);
+	}
+	netif_addr_unlock_bh(ndev);
+}
+
+static void enetc4_pf_set_mac_filter(struct enetc_pf *pf, int type)
+{
+	/* Currently, the MAC address filter table only has 4 entries, and the
+	 * table is shared by PF and VFs. In the default network configuration,
+	 * the MAC filter will be configured with multiple multicast addresses,
+	 * so it is only suitable for unicast filtering. If the number of unicast
+	 * addresses exceeds the table capacity, the MAC hash filter will be used.
+	 */
+	if (type & ENETC_MAC_FILTER_TYPE_UC) {
+		if (enetc4_pf_set_mac_exact_filter(pf, ENETC_MAC_FILTER_TYPE_UC))
+			/* Fall back to the MAC hash filter */
+			enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_UC);
+	}
+
+	if (type & ENETC_MAC_FILTER_TYPE_MC)
+		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_MC);
+}
+
+static void enetc4_pf_do_set_rx_mode(struct work_struct *work)
+{
+	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
+	struct enetc_pf *pf = enetc_si_priv(si);
+	struct net_device *ndev = si->ndev;
+	struct enetc_hw *hw = &si->hw;
+	bool uc_promisc = false;
+	bool mc_promisc = false;
+	int type = 0;
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
+	enetc4_pf_set_si_mac_promisc(hw, 0, UC, uc_promisc);
+	enetc4_pf_set_si_mac_promisc(hw, 0, MC, mc_promisc);
+
+	/* Clear Old MAC filter */
+	enetc4_pf_flush_mac_exact_filter(pf, 0, ENETC_MAC_FILTER_TYPE_ALL);
+	enetc4_pf_set_si_mac_hash_filter(hw, 0, UC, 0);
+	enetc4_pf_set_si_mac_hash_filter(hw, 0, MC, 0);
+
+	/* Set new MAC filter */
+	enetc4_pf_set_mac_filter(pf, type);
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
@@ -721,6 +1107,19 @@ static const struct enetc_si_ops enetc4_psi_ops = {
 	.teardown_cbdr = enetc4_teardown_cbdr,
 };
 
+static int enetc4_pf_wq_task_init(struct enetc_si *si)
+{
+	char wq_name[24];
+
+	INIT_WORK(&si->rx_mode_task, enetc4_pf_do_set_rx_mode);
+	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
+	si->workqueue = create_singlethread_workqueue(wq_name);
+	if (!si->workqueue)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int enetc4_pf_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *ent)
 {
@@ -756,9 +1155,13 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 		return err;
 
 	pf = enetc_si_priv(si);
+	err = enetc4_pf_wq_task_init(si);
+	if (err)
+		goto err_wq_task_init;
+
 	err = enetc4_pf_init(pf);
 	if (err)
-		return err;
+		goto err_pf_init;
 
 	enetc_get_si_caps(si);
 
@@ -770,6 +1173,10 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 
 err_netdev_create:
 	enetc4_pf_free(pf);
+err_pf_init:
+	destroy_workqueue(si->workqueue);
+err_wq_task_init:
+	enetc4_pf_struct_free(pf);
 
 	return err;
 }
@@ -781,6 +1188,8 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
+	destroy_workqueue(si->workqueue);
+	enetc4_pf_struct_free(pf);
 }
 
 static const struct pci_device_id enetc4_pf_id_table[] = {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
index 4098f01479bc..2e676212d230 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
@@ -712,6 +712,12 @@ static inline void enetc_load_primary_mac_addr(struct enetc_hw *hw,
 	eth_hw_addr_set(ndev, addr);
 }
 
+static inline void enetc_get_primary_mac_addr(struct enetc_hw *hw, u8 *addr)
+{
+	*(u32 *)addr = __raw_readl(hw->reg + ENETC_SIPMAR0);
+	*(u16 *)(addr + 4) = __raw_readw(hw->reg + ENETC_SIPMAR1);
+}
+
 #define ENETC_SI_INT_IDX	0
 /* base index for Rx/Tx interrupts */
 #define ENETC_BDR_INT_BASE_IDX	1
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 2b9d0f625f01..3b0cb0d8bf48 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -22,6 +22,13 @@ struct enetc_port_caps {
 	int num_msix;
 	int num_rx_bdr;
 	int num_tx_bdr;
+	int mac_filter_num;
+};
+
+struct enetc_mac_list_entry {
+	u8 mac[ETH_ALEN];
+	u16 si_bitmap;
+	struct hlist_node node;
 };
 
 struct enetc_pf;
@@ -57,6 +64,10 @@ struct enetc_pf {
 
 	struct enetc_port_caps caps;
 	const struct enetc_pf_ops *ops;
+
+	struct hlist_head mac_list; /* MAC address filter table */
+	struct mutex mac_list_lock; /* mac_list lock */
+	int num_mfe;	/* number of mac address filter table entries */
 };
 
 #define phylink_to_enetc_pf(config) \
-- 
2.34.1


