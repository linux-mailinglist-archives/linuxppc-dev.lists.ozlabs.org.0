Return-Path: <linuxppc-dev+bounces-6671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8FA4D502
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 08:40:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SJZ1nlNz3blK;
	Tue,  4 Mar 2025 18:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::60f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741074014;
	cv=pass; b=grP7FXxNtFbgpqifi+8thHBKgR2UQeRYpmMH5aIsuuk4mN6roEU4dJRP4H9oo02CixU2sO+CyOT3sZ2VastfW4KSWmTMzIajxutw9COJnxJ+zBD6nF65ni4H2JBnHXf9+5zz/qvxK2gjSCwc4xBL2FNd84HkKJYzil4+Jdv6GDCHCQUiynRTYsKc/di1Csi8jkEFSfW9wonWMq9wAqImGU6I1uzfWxYhlplBQWZbMsdd+yJUvDcI+6xqzfidX0q++fmYUAdzb4AmYO9PddbRAGWJ5BrPX7zJqirjTqBfobYHPtmdfnbdPDk2KLZ5zH90XcJtNgaV6vvBtCKm4zdMlw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741074014; c=relaxed/relaxed;
	bh=IoAEFaGOVtPg+42dHNtf6ExOXNXqF28UcBGave95y3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CtrfjnEVs6usfE0lfd6Pmomzyow1aul1d8wu331eRvowO2CktzO0tzGL2hgpK/aofK2WXgp4JYlI+a2MgsGM7+emp0z/Rzmh72b/batoQ9TdJDZ+La95gdzPc7QhfZoJo7a7guAvzNDID+bv3bj7A+RAHJN98olVyryEs2myOObAEd1Bfml2diav2zlImrVphfnzik/bHO0uxgcmAVz0v5QH3xpoLMnPpozDcrXwNV0Nvm9D4rNEPFCOtj1ozDaEpc4IhS405nJlIl6lmLK/wjEqVXGa0smK1s1bKEhEjNsJSQZKlPPLPD7MV4gpJqj8YDhQJm6+RpFmakGXsO5t0w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fUigqO22; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::60f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fUigqO22;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::60f; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SJY429qz3bpG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:40:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tvde4BYl/9rWb4tzxPmVRgd9VPDNPn9HKTuThKy+C1+CzlLCXwyfhCPd49JUV/zPH9CUk6YOK+8DDmjgcUPr31sLFWn6xNzfR1XespEmpAFSN4yvWCLTtX8ErCx1GibfFKdRffbmD7MrcXh7K4JnlqdJPuGLBg2++P2xvOjb8H8v31aBlZE0F0tpKg6ESHwPOhLKdlaGZQ1ZFAcgMtILwir7YOFt0CLvSzhM7Qo2DAYYPx19t30u/44SS6KxnSH7llw+gwpk7Ocf87I/DTSdvt3SiTYcyNuyqQzXYpJGchIeXNMAsX4ynxjPptnedIUsNdJDSXE0p2sTQenzUAfiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoAEFaGOVtPg+42dHNtf6ExOXNXqF28UcBGave95y3I=;
 b=jgnnFnkf7Pvbkmy7Q9z1DnhB1UylZRhKVSw02exEI4cLsvTJNFScoJLys92DuE2udM+XUBvTmOBR+Ew+t6Uc0KBUkBXfh7a9zx1esMkILAOOkOOc8N1QZ+jP7GXBJN7wIRh+xde3p31ex6yGG7F896Io8bt7LZWUMZiQowgRq9DqKNZLMMy5N2rz2+ykRzy4sVGuePxi8zHWH6/6ohFH9UPCZPtjMv/+IxyZp6NDQ0LIRRQzD4cgIozwaDOPOJBjX/88JpPpNKkHR/+RhSM+VjopeiSzT9zTNs8SAhRAmVsZhQMSySPbkTcNbnBXE5UCmwZmkMrSzJWA5CsfEAOubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoAEFaGOVtPg+42dHNtf6ExOXNXqF28UcBGave95y3I=;
 b=fUigqO22of6qApTbYrN0Fe9wcVh8/te6Ctgd3oVdwPAdmlJ7zYyLfpR+CkmdvRJ++nRZN9tt2uPu5V/z74CeMLfmLdrAdvZxXgAlDA1RgnOgqBACFeOspWhojSuOe+pofiqXGqGrAzh7N9JccjGzQqmoNAtOEHzLVCNaKocz6Ak+QSJ/QAX+A07KWnYlxyCyz9mER9XFMLHdlUGVgH1vd9e9kTbrbUWHnfYJJZpAyJKf8Z0+qcAHi9BuMrqO3Rz1NSGSL89yF9HEcDmSEHfoIIRtprToBK3zOvyme7PwQn6mt1YVdAu1Cd1MLYqxUs5sgMsVSQya1jCadtLux5PrjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Mar
 2025 07:39:58 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8466.020; Tue, 4 Mar 2025
 07:39:58 +0000
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
Subject: [PATCH v3 net-next 09/13] net: enetc: move generic VLAN filter interfaces to enetc-core
Date: Tue,  4 Mar 2025 15:21:57 +0800
Message-Id: <20250304072201.1332603-10-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304072201.1332603-1-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: fb643ce9-2989-477e-6b64-08dd5aefc3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MzhBpe2QCVcc9ER91i8s2mo7a3IEgRYfCvBDrU/xUnq668+HIz3+B4iS0JsE?=
 =?us-ascii?Q?AEj2iNbSlLl+t5QIWS8orkNZK6G328eB/s9+qnegl/BA+kfUNhSKjUwxJcdQ?=
 =?us-ascii?Q?sFFtgBNUdvZYNwGl52+5b+d6ou5oOOehTwANvKHgAD87kbEreJZozYq1JFIp?=
 =?us-ascii?Q?5DyIpJvG8e9lIxiV51g8SVa2EVYdLWtOPJqLACrYGcceBBEJRtovMc4ihXxM?=
 =?us-ascii?Q?5ouflHeVZiTIDUnd1y7pM6FG+c/aKv1MPpQk8b5Npd25EwWGXsXQOPBvGN4R?=
 =?us-ascii?Q?A82abgFnuLdwFWZG2JmayLRJ617T0ZYdYco1p75pdDarC1XSU4cHjsC4OgnI?=
 =?us-ascii?Q?EFR/kX4jkgREGSx7F5zZdOQKY7oytyYHyZfoeMdY9W6Nr0ejExpehGcRuoKJ?=
 =?us-ascii?Q?RN1YME6xYZtErjOb+hR2fxzyEo32s4OxOf0kEBL72LEb0a0uSxxurj/21WIM?=
 =?us-ascii?Q?FAiKvEUsEqHJoiXPfkTyv0epvrY7K41BB1J6aPyPGPxTEzI/xAxpvRlx+0jd?=
 =?us-ascii?Q?jERQQeRYWhQn0fInJhqjooS7Zx10+nMMQAx0QZZvGFQ8PS6hg0K+ID6oUZRj?=
 =?us-ascii?Q?oeRkdF6ndoaQLc6oFNp6ZtlyAA3dLzPUdPfuIyX6aH3pSt+NimcBAlsgukhY?=
 =?us-ascii?Q?j5DHzy+NmBX5tlZZc777Pg1GHkEk19rEAC9qYieZMwOpRv1FCoYrlCbTgvLW?=
 =?us-ascii?Q?HE2o/+FzBMrKF6YO4Q/WznMDemElihMxuQ4+q1gWAJqJpZvvdR3xbZfPvlBB?=
 =?us-ascii?Q?muGSBLxTcUltPrnXdggNe3gRsB3BgR92fJBkbM6HNtgXC+ab0MasIezh23lp?=
 =?us-ascii?Q?YUwwKUeVmNhP/IQq8MmGrni6XHxlRXii4oPk8hmdI3HfXH32+6/hd/8tr3Rl?=
 =?us-ascii?Q?g8A5i08bVTPv6f5Gwf4guG592EtxjuFKNFcu7BYiIUu4A7Jd/xwIl/oaeVVC?=
 =?us-ascii?Q?OO0PJn/P2gxq9hTKU25OG4Px0HdiZpf37F26eVVmkwilpHlhxXKt58Sspplz?=
 =?us-ascii?Q?A1MOipbKJTpGxAiCc8lMSbt0eWrB+vl9zLwo/Dzq91IBvpW/PwH69VwUq1hv?=
 =?us-ascii?Q?VIuFFJnKzPY/Rm/Jk1CDJ+obX7GzdRmLgWqQxhGVzaJMntVjLQG+15KJ0HIk?=
 =?us-ascii?Q?4HzkgmPPyfBqpwUtMed0VBj689jNG3Apdt0z1u/JncZ1Ti7+4szRixZx9EeV?=
 =?us-ascii?Q?U4ra+TNArEm/dObgcpF7VUfy0883LxnD9lz7Nc59WquQmXf0WRFp5WG3gszO?=
 =?us-ascii?Q?T/GXEOpX/hZbSHw5Z5dh+iS7qwcq8HW1jw9+ob2DNnEc5FjWvAw2AvAKeb4r?=
 =?us-ascii?Q?hhk5HMFxaVJHcbAUmVp1w3SBOa4oLrppIXK9IDLK9VfSWWK/bkAP6ZH7zcSI?=
 =?us-ascii?Q?f0oMjNLAzc2adkK0MQ+BizBh6HytSv8gNZb+4q+5pKwEybeueLLOol2fKoPw?=
 =?us-ascii?Q?CrHDxfOWfL8W0asLe9dB7IPHcc2reRRl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ax4SEMbvMN3NkOMYYJvlpWb6RSYQ5J+Vt7xpCd5H8UsqOuopjevlhqUlDYE?=
 =?us-ascii?Q?OVtCVyczH+dhnOcvac5nz6DNt4bD7PG/OCo4+wVkATvkLfP9Z09t351usA3z?=
 =?us-ascii?Q?0Be1YEhWjQmBK+3hiUVtuwIxiNmaapylxU/Lb4ERnvJ8RKCrG4YbGokDVp/a?=
 =?us-ascii?Q?mgYGbAtY0vJ5o7EmHr0M8ZQzhedub5XZxqGY5azLDQjSj+/xYn0LuOWh6X9j?=
 =?us-ascii?Q?xAFgaoqVO/1UdMpzPBM7xsH8QspCFvdzOKIJq+EGbO1b2NpT3Qfnqty6uzQE?=
 =?us-ascii?Q?200oMOBM+LIuCYZ5ldK5YhkUu1lGL1yaUBnhFfq8bkKBSwPj3CsW88IddbW+?=
 =?us-ascii?Q?wPQJjmyUSBdkQ2w2FJNNSMQKoS8wZPhjL/VIt3mLSvaMkI/AlefAMF1NZE5e?=
 =?us-ascii?Q?DOYxM+MovWiPJsYMubzTL3uiozyBAudzf76NCGOuSvISTyOBV7a4yG+/WGqu?=
 =?us-ascii?Q?MKfT5qo27z8iSY9SEVboz0Geij0kg67hU1CsyR/Tt7V8r+OCojVzQwIMXwjF?=
 =?us-ascii?Q?5mLGmqwL+lRg1B4Ds3JtwoLuqxPcTmNvPS3oe1m6rbf4VLujOZp0oH38H2qn?=
 =?us-ascii?Q?3N725j+mylSS+15EOBJMFRZBG5sJuZO5bi5VfFuAI/jc6LdFTnsVmdpxLPLD?=
 =?us-ascii?Q?ki7k3HbI6xMxXM64j43Blzc3b95tpZVpBjnFAEpa8IkCLQA19I8+HxpFRYhl?=
 =?us-ascii?Q?Qe7CG8zTcCVlr3LBJKQtljzVqP/MXs82A8c0MzlWcSX1XoIayNqvq13j1jOm?=
 =?us-ascii?Q?vnnw9x5A7F0G7qgASdqgKgFUY8RNt5lsntzItT41SKLaQc1TEk4RGPVeQmNF?=
 =?us-ascii?Q?Z970BtEyHh0axSD8CZT7ePcCbOcX/fV3kP/lKCne89BHeEYW9tggjBnZY93O?=
 =?us-ascii?Q?Z0fUBHuu/ylOyRN0UwuIqLK3mJzARaMvz25acupHb6sFaTUdvbB1Rixj2zZT?=
 =?us-ascii?Q?oxkTVcMLkACKbDSaK0rhkobiqJHYyD8Gc5QUBClQL67HHCVUXzoZ87r/meeW?=
 =?us-ascii?Q?EK0n7/eob013MEhbDsVtwwFYNx/zxB5nmtCZpGfu08iBYAc6X7dlD4MiSYYX?=
 =?us-ascii?Q?jLjF0oHMmLyNibxWI1VZVd5WSI1UNM5pgJ3GRc/yTJnIzXBCRg2SLMW8PVX3?=
 =?us-ascii?Q?jJ7yJ/Z0MNE2G7nmhbb6V8tI6VsUH5lg7ArUwOayfoehHU7vwul6uklsA6tJ?=
 =?us-ascii?Q?I3LS3K7Wz7zSou6Nq5VzuWPgtS0NR7zboXyHdZq+ViSbVY9PvV1UcFOSb93Z?=
 =?us-ascii?Q?LSZWF03olMQMxNy6sYe8nrpij6hANV3lAhBGmRnGpS9fOj4pZPnnoKEEpUNd?=
 =?us-ascii?Q?6gcBa+tlzArOeYPCiJTMugahe5tBa74eR8sQm5+Z0EyDrInu/Hlmsq+hZeUp?=
 =?us-ascii?Q?87KR6YsUafH1Sz/qJhnpujMCsNCExQ3J2wY5rB/GTreXl/s3RPsPMFH6pZfS?=
 =?us-ascii?Q?cPZZn+5weDt7fyY5JAag39dp5pD7TIsCayCz9TTObR1RYdQhca9ArVosf6Kx?=
 =?us-ascii?Q?bGVYJP/dZC6kaAuuzMgs6QS0RkHU2Xx0xAZXp6MZZcMjboXakrHPr3Khm+TK?=
 =?us-ascii?Q?+bjtb/XaS8gGo4wPfjdiT29NNZ0OBPjI0Fpv2XL8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb643ce9-2989-477e-6b64-08dd5aefc3e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:39:58.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m8xX/jmmZ5OrdVl0Bc2V2amCvx/mwsbEHZ9E/wxJSWN5vkcZ8q4ypHLEUGGwmY3zIrqeVy4f0QGo7m4c9jrpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

For ENETC, each SI has a corresponding VLAN hash table. That is to say,
both PF and VFs can support VLAN filter. However, currently only ENETC v1
PF driver supports VLAN filter. In order to make i.MX95 ENETC (v4) PF and
VF drivers also support VLAN filter, some related macros are moved from
enetc_pf.h to enetc.h, and the related structure variables are moved from
enetc_pf to enetc_si.

Besides, enetc_vid_hash_idx() as a generic function is moved to enetc.c.
Extract enetc_refresh_vlan_ht_filter() from enetc_sync_vlan_ht_filter()
so that it can be shared by PF and VF drivers. This will make it easier
to add VLAN filter support for i.MX95 ENETC later.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 25 ++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h  |  6 +++
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 46 +++++--------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  4 --
 4 files changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 8583ac9f7b9e..248dbc874eec 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -72,6 +72,31 @@ void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter)
 }
 EXPORT_SYMBOL_GPL(enetc_reset_mac_addr_filter);
 
+int enetc_vid_hash_idx(unsigned int vid)
+{
+	int res = 0;
+	int i;
+
+	for (i = 0; i < 6; i++)
+		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(enetc_vid_hash_idx);
+
+void enetc_refresh_vlan_ht_filter(struct enetc_si *si)
+{
+	int i;
+
+	bitmap_zero(si->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	for_each_set_bit(i, si->active_vlans, VLAN_N_VID) {
+		int hidx = enetc_vid_hash_idx(i);
+
+		__set_bit(hidx, si->vlan_ht_filter);
+	}
+}
+EXPORT_SYMBOL_GPL(enetc_refresh_vlan_ht_filter);
+
 static int enetc_num_stack_tx_queues(struct enetc_ndev_priv *priv)
 {
 	int num_tx_rings = priv->num_tx_rings;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index ecf79338cd79..c60741dfe358 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -24,6 +24,7 @@
 #define ENETC_CBD_DATA_MEM_ALIGN 64
 
 #define ENETC_MADDR_HASH_TBL_SZ	64
+#define ENETC_VLAN_HT_SIZE	64
 
 enum enetc_mac_addr_type {UC, MC, MADDR_TYPE};
 
@@ -321,6 +322,9 @@ struct enetc_si {
 	struct workqueue_struct *workqueue;
 	struct work_struct rx_mode_task;
 	struct dentry *debugfs_root;
+
+	DECLARE_BITMAP(vlan_ht_filter, ENETC_VLAN_HT_SIZE);
+	DECLARE_BITMAP(active_vlans, VLAN_N_VID);
 };
 
 #define ENETC_SI_ALIGN	32
@@ -506,6 +510,8 @@ int enetc_get_driver_data(struct enetc_si *si);
 void enetc_add_mac_addr_ht_filter(struct enetc_mac_filter *filter,
 				  const unsigned char *addr);
 void enetc_reset_mac_addr_filter(struct enetc_mac_filter *filter);
+int enetc_vid_hash_idx(unsigned int vid);
+void enetc_refresh_vlan_ht_filter(struct enetc_si *si);
 
 int enetc_open(struct net_device *ndev);
 int enetc_close(struct net_device *ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 38ec7657b9aa..f9b179ed6d8b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -222,45 +222,18 @@ static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
 	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
 }
 
-static int enetc_vid_hash_idx(unsigned int vid)
-{
-	int res = 0;
-	int i;
-
-	for (i = 0; i < 6; i++)
-		res |= (hweight8(vid & (BIT(i) | BIT(i + 6))) & 0x1) << i;
-
-	return res;
-}
-
-static void enetc_sync_vlan_ht_filter(struct enetc_pf *pf, bool rehash)
-{
-	int i;
-
-	if (rehash) {
-		bitmap_zero(pf->vlan_ht_filter, ENETC_VLAN_HT_SIZE);
-
-		for_each_set_bit(i, pf->active_vlans, VLAN_N_VID) {
-			int hidx = enetc_vid_hash_idx(i);
-
-			__set_bit(hidx, pf->vlan_ht_filter);
-		}
-	}
-
-	enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
-}
-
 static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int idx;
 
-	__set_bit(vid, pf->active_vlans);
+	__set_bit(vid, si->active_vlans);
 
 	idx = enetc_vid_hash_idx(vid);
-	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_sync_vlan_ht_filter(pf, false);
+	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
+		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
 
 	return 0;
 }
@@ -268,10 +241,13 @@ static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 
-	__clear_bit(vid, pf->active_vlans);
-	enetc_sync_vlan_ht_filter(pf, true);
+	if (__test_and_clear_bit(vid, si->active_vlans)) {
+		enetc_refresh_vlan_ht_filter(si);
+		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
+	}
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 3b0cb0d8bf48..90137fbb8f48 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -6,8 +6,6 @@
 
 #define ENETC_PF_NUM_RINGS	8
 
-#define ENETC_VLAN_HT_SIZE	64
-
 enum enetc_vf_flags {
 	ENETC_VF_FLAG_PF_SET_MAC	= BIT(0),
 };
@@ -52,8 +50,6 @@ struct enetc_pf {
 	char msg_int_name[ENETC_INT_NAME_MAX];
 
 	char vlan_promisc_simap; /* bitmap of SIs in VLAN promisc mode */
-	DECLARE_BITMAP(vlan_ht_filter, ENETC_VLAN_HT_SIZE);
-	DECLARE_BITMAP(active_vlans, VLAN_N_VID);
 
 	struct mii_bus *mdio; /* saved for cleanup */
 	struct mii_bus *imdio;
-- 
2.34.1


