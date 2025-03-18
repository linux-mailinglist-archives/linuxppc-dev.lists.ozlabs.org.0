Return-Path: <linuxppc-dev+bounces-7173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF705A6703B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 10:49:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH6W21v2Fz2yfx;
	Tue, 18 Mar 2025 20:49:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260c::626" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742291358;
	cv=pass; b=f6wMyTyv36QGJFYVnKLQy/gXpJSY/yO43eQQbq1knB9Wk4eVUrQJp4FNWbk7Y+RRDYTVl7lNEVX4IOSQsYV1pftomWvrwWG/zP+fpplRU1YK8lNTflIMxxPJZkIWL/Y/f14xmi4uT4ZqkuYpLIh13cIvLuawb2fkAqCw+ad6tpcOXXepoom+eo4y6RR4l7ztQUQI2u9I/cd5GHMi1us24Sa/sz2jlNdhOjus8Gyb2nhnrRKLm98J21RyyfiSChvYptIQl5PZ/emyNLugBLs8Z7JU7I3bZaHC2G475MV5lh5WPXJgiY0U2O4A055kuY+XIhgxaQTX8QrRvpjcvEdlaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742291358; c=relaxed/relaxed;
	bh=OPGatL01ExZ24i45lY0rMlpY7oN3Ks0HXK0aNDMHin4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kWUVKtZPbzpig+sW03lmF5Y0Lh4i3IIwZTghapKCOTV7wc6oIdXPXwJSmAfMyMG0yk67dy4HlGEbPnMMcwrSj35isBnL6j9ypIbNq41J+OwjrL2czIhAaFv5ph2CHcv9dUn3WD3tqq4ShDrrtvYOUpl/rUgGG+pGm2mmUuBnLSzCumOvpiFQmt6xe2qT9sdvjqkGqyLbYPdLq8zI5O3AOfHjT/7ndpj5hZJK0xPtvFrcFOiO50g8D0qXxfI0Cv4/xa57GhxM8Lu4gm7HjtjYWaMg8SaYStij0EybXtjxf6G/ZTvWHXvNrzO12r7EfbKRhPBOzxGCitm4c75poZAnkQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=i8ZMlqPb; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260c::626; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=i8ZMlqPb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260c::626; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH6W04w52z2ybR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 20:49:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9350VS8Dh881rl/SMUp5U0KySVRLMQGlqOgziQpjzew0mUCMPK7h7cKW6ofDtWLj5ca+62JIPTFFJYnGrzmVxN6cbbadvuMiBJchFTamteMaw3T6rH4sfyDKlp+BWVxruFP2J239V1jD5Lanbb3byDACuWawPoBnHdPobGOOis+0XHNGij26f88CWtAxR13/cDdgDoA2263p6uyuNrhSUvDdn35OFAITIXHsBB1H04oeXfrQc31FNFf9/RjxTM4Tx8RiCUseh6voYU5IaFgUYKDsjt4Dt8P+h4WNQW7agPYcvXXe1vvWMVR4wDNacukVpNrG/QcOku0RZBQzmlI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPGatL01ExZ24i45lY0rMlpY7oN3Ks0HXK0aNDMHin4=;
 b=H3elKciyNjeZTR8SFwu8fSHscyMj3eaX7WK2GvSr6RhgsjUy5VX5EUCAmWHFhi4OdUojpERSs/WBvSB07+dMpiRqP9lAXWWHXG5i9GoSrjhNxoFBoFpmtEO0M+eVMpmWExEE8fXucZdG+n1rF1Wzac49bnbfRkPArvVw419jdgU/UNRgGbTpakMWH/czXUgVY9Nku9j1/zYQqdVNVECsrFE6zmj8GGL8wMdIJ+arBHj/vLLkx3nQk0Irtd6ZVaBYV1/t88eramaucAN0ziJFHktRZPdBh6GZzLOAQtUnUNOjhOKgL3/5OOXk2amu2QYILzolnFZV8mer4JoJPKQr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPGatL01ExZ24i45lY0rMlpY7oN3Ks0HXK0aNDMHin4=;
 b=i8ZMlqPbbZeoAcJldsiLYzk1Eb8GTA9p45hLwlM2Q6VPG+CIKtk+8OzU9uaC76Xw0xWILBrzPw0kTQFWhJuQrTBkC7j8HrP7zhMO8AyABlLRaTrJyNUO6B8jW3DMteA1HbwaSHvR9mISoyu/hKWUIN/i34a1CnlPmBp9P0ycUyHuktg3brSvcUYeEWUkELXm5i0sN+8pdCFSoVpTplUAcedjBKuVqjN58oxhELbIIm4Kuv6vW07zDNXiGjmbk/fKuIPzgF0NceX5iH/pid5IfKrolhxPIsgujdiwjZI7ekmn96W+o5bJT8IJ3tmwB67vp7hc/p4OVptV4vwFXXo62w==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:48:57 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 09:48:57 +0000
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
Thread-Index: AQHbkkpRhix/9HtGrU2JdGOiDPyx/7N3ajqAgAC+YcCAAINOAIAAAj2g
Date: Tue, 18 Mar 2025 09:48:57 +0000
Message-ID:
 <PAXPR04MB85109D85826511330E80EC4E88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-5-wei.fang@nxp.com>
 <20250317141807.2zobsefxl5vnqdet@skbuf>
 <PAXPR04MB8510EECE1FDDA893811EC28B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250318092928.6e2tspaf4rfyn32c@skbuf>
In-Reply-To: <20250318092928.6e2tspaf4rfyn32c@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|VI1PR04MB9761:EE_
x-ms-office365-filtering-correlation-id: 6e145a37-1f58-4b5a-85cc-08dd66021a2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?p0CxoBOhqY26zwTqQmLWrznWvuFMoVe4qQ231O4122B97mN9dCJAUaAhIJQ5?=
 =?us-ascii?Q?M/1N4fF/R4gcmjKi17Xmo1JQ/m+ZjYOm6gAjFQN1/CNsspGHasp+kL+Lh5Tn?=
 =?us-ascii?Q?TUSHDRbC9I7BclbDI4QcSZdEZPbmL8IRheZmRxWYbES+cy8Q9QbfrGI6AKaU?=
 =?us-ascii?Q?GJ+Cr9jMDETxdkYv8N9y77eWJfDWQiUM6ZL8f6f0VEvw8H32EUfOGOPOC3QY?=
 =?us-ascii?Q?nHkYiJ3k+Ui4iwWplvMpyzMwPVyrvQ3UR98868lGtc6ouStS+qQ0gduF8T5r?=
 =?us-ascii?Q?2svDZu5BAHEk3r2CmtiLyDswDw8QIWUYUgiQfAVHye695YaqKqgPy/sah/wv?=
 =?us-ascii?Q?96lXqiNreEfCZVTyFCcLL+cyqREJ+tGyyA/w3dGvHCCi+TMtt2XTAV9C2t+c?=
 =?us-ascii?Q?vNUK8yEHMUdtdu1iEz2xutLSXufgrNCqai4KjKUJVDPRifqZUrrpZAiZdg/6?=
 =?us-ascii?Q?eZi9pKILVCQeJyvNrqeZ8dRDVT5TYtGLQek25gVkjWVnqErYuLvXdn62+c6a?=
 =?us-ascii?Q?5ofpF65gswsaW7f2qPDP7AYe1QilmXZ/rKMI0xYRvB8TPMYAM1rNVEWHR9Fo?=
 =?us-ascii?Q?bIzhCTjv5QPOFPwNfS9UQEKTlz0smNRnsQuVH39uXxRn1Aw+EELCs33z/iJ7?=
 =?us-ascii?Q?hjU2BVWV0COhR54xhWoPjHgfkaRw2Tof+SE1f+BGHnClsT8H/LbUXjkYt6Ld?=
 =?us-ascii?Q?dADkODa2BILaWh6hTRAa/x0TTmsxaA78wYALbxo6a/Yx/VhtcJKWRAgUZvr5?=
 =?us-ascii?Q?Ikgb5ko2TQM/WxMalDDIZm32fQQZjto8peKWbEn+xVCh5zOv0Gj7wfjmTMf6?=
 =?us-ascii?Q?DjPpk1z+c8gEtd9CHeNLJ+yqnnneF4x7Pbiaajheah5KZljjtX0rvQq87/29?=
 =?us-ascii?Q?RxbG58oRVx9knRtSOTEooTWzajeN8hNeqfdmsH+9lpa8sn+b3FVOP/MqN3f8?=
 =?us-ascii?Q?T+8BtcYYkGZ3V7jABrQcig5h1HW1eXs/lbmlfihlIK46RLH3xB4Ca7h1+96y?=
 =?us-ascii?Q?oFHOwHtoNGjKFL6C2OZc5u1bHcifKBWL7r+QRElHy+ZKdid4dtYnUABnlnvi?=
 =?us-ascii?Q?3riKCPqf56mVIJGzPtNnohNsV7W1rJD7wZc9Q0J4Oee3osbfCV4DCnhmwb2s?=
 =?us-ascii?Q?06cRdHFQrjBQoQC1ej+rkWQQSCZRRHdOtLvHx4CAi+yqHBiSu0XC6jryRQzS?=
 =?us-ascii?Q?tAlyR+vThRHwInN3gYdPi/PKtbGeh4UF19tpapmXNuzzOVo2s8QfvuLhmTr8?=
 =?us-ascii?Q?3/NGaTOGCoGn/2eqsB36uuTiklliIRmYIhM/3seG5d6Re636GbcwOIdzEoMd?=
 =?us-ascii?Q?e/uoDLvviW5qmjn8vHIMZl8FsRNjcKyuMhMwDXGk7Gh18brNl9ZpSx4rHfqL?=
 =?us-ascii?Q?MGelsfmL4N07JfhrZdhGq1+n7OL+hpmoslTNGfZztj/P1+HXx/pQR9ZtqxRv?=
 =?us-ascii?Q?0cGmdg6jJsdMZdyM613IZSK3Q5X/l+so?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TfF17mrpefeRAELv8w0XNHxGp1FyQy6EK/2Rv0N/RHbXnrEiCMb8fGbzIBSW?=
 =?us-ascii?Q?UA3sZG0i5jfgjV6r5JuZBnNtCaBVNV4JifmOUOSScHwrNLA6s/CmlIfb6Czk?=
 =?us-ascii?Q?aVu882jN4SLd8a7uRHQXd6OfFflySeeXbQtYUMcNxIt/mrrv5u6sGRh7z+SS?=
 =?us-ascii?Q?4e9p1C3gLMkq1B2E5NW2DxjhLIDsZk0hvtq97ZW6oomwkum4mBwnJivKXnwW?=
 =?us-ascii?Q?Ey9b1/OJL8GZYNkIMo0NykVUKQjqt5xu4iHEMqQ2Njln7pcyGB34xglHZvVa?=
 =?us-ascii?Q?qIqQihhaTvGUougVJdEzsIJdmz/qSuPEps2NQ1O12lIKM/pvJCe50erWYj7c?=
 =?us-ascii?Q?+ShpDtAZlUwodPy8cTF8g3FHeL5dhynyML0ZVmdI60fwEICQmvf9EHNLZskJ?=
 =?us-ascii?Q?Rh/jCZkbikcpSrTYYEZnHUc925s24hyPxLM+BB3JAgg2LpEUnWRhS7+avKQ0?=
 =?us-ascii?Q?IbbZbNXzWpol3AOZWfUh6I6QufEnB/Q7YV6d38RepzzKqYPB6zw6Lw9VKfME?=
 =?us-ascii?Q?gYXKF4ZkJkHFwpkthkSwXNfGQWFwg1vH6CPiHtQM9fsYltxYfui8Tt/Ry3mo?=
 =?us-ascii?Q?N2T5Bsxb2Yp8FMRBhIpbfSmdajdAJWgSpZ/rbuEaR4dBW8hpU/Sg43hExb8m?=
 =?us-ascii?Q?HjaE4IQOB/noRjpHnRguMs3D1ozUyKJKQiTLAdGUQcM80sbiAIm8oNJ1zPuE?=
 =?us-ascii?Q?XqktkhRAAmu4bfLba8BZjabyn3EB+e4r1RFUV5OFwGfenXEEi2A0TLXDiZdw?=
 =?us-ascii?Q?F3yEnjabkYzIxRBtH9ZbzTrt0cHMjvQfyi5vDrPTnCGCmnnF+oUgRS3k6sle?=
 =?us-ascii?Q?78i5i0PEitv4okgrddnTNnw6l5SDW7me4+ph1erdrDSRCGcFhCGhJ+0/fdHZ?=
 =?us-ascii?Q?rqviWE28sFsAzc6BokkBtPEfGIBo4CKZslAMYTESoqoDfVzGciVSzGE8PGGK?=
 =?us-ascii?Q?2i0Y1yxd/eQC3l7Sil8dbXligoBwhLyb+m+vMDQkXq7dXjfSskINhXqIXavM?=
 =?us-ascii?Q?5rmNXIPRjQTDQQCpbI7R+P4c+HZodZ96mdaJLplEklWcR4Q2mlBSKbuC2dwb?=
 =?us-ascii?Q?ni7U21WSsCplX/aozZG4/jr+Vj/1BCKt0fSWk9ZujYZcy/8EIf9eGNo3BLeg?=
 =?us-ascii?Q?1Bzjp2WWpCveIa0m5v03QcKiAhWRp4ZL6oWS7bWkbj9WCOD/dqpHVJjcEmzb?=
 =?us-ascii?Q?PPdROpTscnqoTZteCsRIMaaiudWJMW6utO3toytjsjl9MJG6oXtwg1wOgEUv?=
 =?us-ascii?Q?cr6Mq4g8tBR0ifYyYHQkoBz23w+AzDN3zpQbDDp7Vg83LlsU7IGtJoEWY3BR?=
 =?us-ascii?Q?tQ0ia21OOZ4ML9GXCXdos3DPG5wUtb8VLzK6kxOzFUjpPX6bNRjamYeSOgMf?=
 =?us-ascii?Q?Pk/4h7sDUtBKL5nLT2ZRUuIJTnZ1DiXoyu24FL237qKyFhoTjdxvRf80uVYT?=
 =?us-ascii?Q?C60tX1B00NTf7/EsA7K9PzGgkcBqiJpO6naojMVtiCzHOVq2gXKha7oNNzHB?=
 =?us-ascii?Q?sRNf77WZbt27zYEHmYmjqoB9GaWwhymD4vd47hXMFzqQqMtUzp4G+pStdpNz?=
 =?us-ascii?Q?Guyf5G4L3qSugLTdADs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e145a37-1f58-4b5a-85cc-08dd66021a2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 09:48:57.1297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TsOFVy6eWwFbrFbcQcTAWEOugnLvVYQIoAIJXLfAcbl8uCp8m5n3lMuUY9UW4wn8PIUcFCtacyVwbJZPUKeA6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Tue, Mar 18, 2025 at 05:19:51AM +0200, Wei Fang wrote:
> > You are right, but I'm afraid of the Coverity will report an issue, bec=
ause the
> > pf->mac_list and pf->num_mfe are protected by the mac_list_lock in othe=
r
> > functions. And enetc4_pf_destroy_mac_list() will be called in other fun=
ction
> > in the subsequent patches. I don't think it is unnecessary.
>=20
> Sorry, but I can only take the presented code at face value. If the
> Coverity tool signals an issue, you can still triage it and explain why
> it is a false positive. Or, if it is a real issue, you can add locking
> and provide a good justification for it. But the justification is
> missing now.
>=20
> > So for your question about Rx packet loss, although it is a very corner
> > case, the solution I can think of is that we can use temporary MAC hash
> > filters before deleting MAFT entries and delete them after adding the
> > MAFT entries. Can you accept this proposal?
>=20
> That sounds good. I'm thinking, for each MAC address filter, maybe you
> need an information whether it is programmed to hardware as an exact
> match filter or a hash filter, and make use of that functionality here:
> temporarily make all filters be hash-based ones, and then see how many
> you can convert to exact matches. With something like this, it should
> also be easier to maximize the use of the exact match table. Currently,
> AFAIU, if you have 5 MAC address filters, they will all be stored as hash
> filters, even if 4 of them could have been exact matches. Maybe that can
> also be improved with such extra information.
>=20

Currently, I don't want to make the driver too complicated, I think if the =
number
of MACs exceeds the MAFT's capability, we just use hash filter. Otherwise, =
we
use MAFT.

> > > > +static int enetc4_pf_set_mac_exact_filter(struct enetc_pf *pf, int=
 type)
> > > > +{
> > > > +	int max_num_mfe =3D pf->caps.mac_filter_num;
> > > > +	struct net_device *ndev =3D pf->si->ndev;
> > > > +	struct enetc_mac_addr *mac_tbl;
> > > > +	struct netdev_hw_addr *ha;
> > > > +	u8 si_mac[ETH_ALEN];
> > > > +	int mac_cnt =3D 0;
> > > > +	int err;
> > > > +
> > > > +	mac_tbl =3D kcalloc(max_num_mfe, sizeof(*mac_tbl), GFP_KERNEL);
> > >
> > > Can't you know ahead of time, based on netdev_uc_count(), whether you
> > > will have space for exact match filters, and avoid unnecessary
> > > allocations if not? enetc_mac_list_is_available() seems way too late.
> >
> > I can add a check before alloc mac_tbl, but enetc_mac_list_is_available=
()
> > is still needed, because enetc4_pf_add_si_mac_exact_filter() is a commo=
n
> > function for all Sis, not only for PSI.
>=20
> From the way in which the discussion is progressing in the replies
> above, it sounds to me like maybe this logic will change a bit more.
>=20
> > > > +static int enetc4_pf_wq_task_init(struct enetc_si *si)
> > > > +{
> > > > +	char wq_name[24];
> > > > +
> > > > +	INIT_WORK(&si->rx_mode_task, enetc4_pf_do_set_rx_mode);
> > > > +	snprintf(wq_name, sizeof(wq_name), "enetc-%s",
> pci_name(si->pdev));
> > > > +	si->workqueue =3D create_singlethread_workqueue(wq_name);
> > > > +	if (!si->workqueue)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	return 0;
> > > > +}
> > >
> > > Naming scheme is inconsistent here: the function is called "pf" but
> > > takes "si" as argument. Same for enetc4_pf_do_set_rx_mode() where the
> > > rx_mode_task is part of the station interface structure.
> >
> > So change 'pf' to 'psi'?
>=20
> Sounds better.
>=20
> > > > +	struct hlist_head mac_list; /* MAC address filter table */
> > >
> > > One thing I don't understand is why, given this implementation and
> > > final effect, you even bother to keep the mac_list persistently in
> > > struct enetc_pf. You have:
> > >
> > > enetc4_pf_do_set_rx_mode()
> > > -> enetc4_pf_flush_si_mac_exact_filter(ENETC_MAC_FILTER_TYPE_ALL)
> > >    -> hlist_for_each_entry_safe(&pf->mac_list)
> > >       -> enetc_mac_list_del_entry()
> > >
> > > which practically deletes all &pf->mac_list elements every time.
> > > So why even store them persistently in the first place? Why not just
> > > create an on-stack INIT_HLIST_HEAD() list?
> >
> > The enetc4_pf_add_si_mac_exact_filter() and
> > enetc4_pf_add_si_mac_exact_filter() are used for all Sis, but only
> > PF can access MAFT, and PSI and VSIs may share the same MAFT
> > entry, so we need to store them in struct enetc_pf. Although we
> > have not added VFs support yet, for such shared functions, we
> > should design its implementation from the beginning, rather than
> > modifying them when we add the VFs support.
>=20
> Ok. We need to find a way in which the code also makes sense today
> (who knows how much time will pass until VSIs are also supported in the
> mainline kernel - we all hope "as soon as possible" but have to plan for
> the worst). I don't disagree with the existence of &pf->mac_list,
> but it seems slightly inconsistent with the fact that you rebuild it
> (for now, completely, but I understand that it the future it will be
> just partially) each time ndo_set_rx_mode() is called.
>=20
> Are you aware of __dev_uc_sync() / __dev_mc_sync()? They are helpers

All I can say that I have been saw them in kernel, but I did not spend time
to study them.

> with explicit sync/unsync callbacks per address, so you don't have to
> manually walk using netdev_for_each_uc_addr() / netdev_for_each_mc_addr()
> each time, and instead act only on the delta. I haven't thought this
> suggestion through, but with you mentioning future VSI mailbox support
> for MAC filtering, maybe it is helpful if the PSI's MAC filters are also
> structured in this way.

