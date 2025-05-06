Return-Path: <linuxppc-dev+bounces-8331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0641AABD19
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 10:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsBMz1RmLz2yZS;
	Tue,  6 May 2025 18:27:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746520047;
	cv=pass; b=BJMsXlVqTnF+K/OmTUDnqdexfQN4ck5fMNf5ay299ti/Qr5e9VhBlgGeb+FC/ONGgnJvBst2HHJWuueGs9KwEta8c3x9BwOKVcd9isaEAFTT2otbwP+jdYNujpaYhLWU3mJj4ZbzXnJn3FGqqbq/p0IJKzB49s/4aqiEX5LV3B2uwA4Oxg7BYZARqt8e6dKJvy83OO2fG/E3wWSr3gE08fI3Mrh3C7eY5ATrT5e5O64GtKt+hNutEs2XOXdEFJyx9QZqzpEBTyd5xqHLAIc9fWoESob05A0LQKtvMLJ6wXs5Hok40Xn8X4/b5XTyo0DBKzWMqqDG088IZBXfRAkoow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746520047; c=relaxed/relaxed;
	bh=sulYQXv73bhdcGAdS/e2xZGukxw6MnZSpt7EEbqlPf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hZ0qGUmREjgbtl61Q8qlEYGZHTRSiAGnrquWu5UkL58lxZDnvP4sOaEqBwVODjEy/w7Ggl4juo0uDPu94gjN68/BvOlTUY/fWgKZmEM1NpKUhKpATb+zP4z369+0Gw4saHq5KX955vz/cfN/VCqw7gvM3dTm91B/0Eu0HmLLZOLDnPeCZtYbRTBNtqiiR9M8oT1tpQvBb13WGVS80NGKCGkwIEINtseOR2ZPxgOeRHNiDTZuNz3rECm+Ng8/g2NjHbIhe9tFkMBX71cspqY5Cb0YK/CHlRu9P3a2kOmuPRwzm0SpnCj2nxiEfHgCSOYV2oOJ8EI6JCCld/9AInhf3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HRHPkbtB; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HRHPkbtB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsBMy35DFz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 18:27:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bClvtdkxNyertPTDMQTJc1xAVl/t277DGsQLX3xEmS5SRKIQ9eYBLok9RVt+usmnHQjlNZ44oi0QeB1JEYEn1feyRIPQVn7MXEnWUv2baBp7i5cD7R3ZDI5Im2OtI/0Gvr7ZdP5gEy9uWxGKtqgeMVg1VWhY1HYkGaBk1/0yx02jNfFmhsiFVAQIMrIJqb5SbD5HGAhmig5QpzpDQXFo7tCu5K/B2+vS0I0Qy4RB917jo/d040FkaU8g0uZxSOCuhEEs6aMANODxNSFs1/YGArQeqKoM41TEVaUdQbqjaBkzO9eNCaPVf1tdavBWlkulpC2fful7zq5VeB1MpwjGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sulYQXv73bhdcGAdS/e2xZGukxw6MnZSpt7EEbqlPf0=;
 b=hp3mNnA5KYdRf9VEfsCwxta8ORc53AkVmMzVkqvLLCzyDEfaN17aGw6036qKZESIA2j4jw+kuzCpwNdBlW2LHZh8FbHxIYDuu4COPSmhkt7UStIXQZJNPcXRjdhhlg76n9EoqiH8JWm1oQnnKJsLv1Wu8JZdATohyR+FVMMlvg21GsaciKjxd/9CbNDxdC3xCMypW+9b7SkjXd2ThpYF/zCHir1BfRq7Loza54B49E3JmqjwWaqs5keicd44GQ71N1KYixxrMicAIjVpQt1TCKXz98O0WTyG4xk5XSxtcunwm1F48nPbq052hMMDXG+M2FaRNyrvzMRtAFVBOT7QvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sulYQXv73bhdcGAdS/e2xZGukxw6MnZSpt7EEbqlPf0=;
 b=HRHPkbtBuak5E2PNIf8hKFUmyJhejVpS6PcSOxrNzJEKa5aUQRcJ2JZS8BadkuMXnVdI4f78ryjTcjkORDpcXpOmcvE1Ptsv1F1738XOAtbYyXGH02B4G9kPns8l9NKPbkqO+F7DJyUbUx40KXtrHOP7yDBVaStulcuYt+WPSOlshncrQwU7hmjqxGF1kuUjq4V3nPruMWGClStLmjEI5JqqX8Ur3eKILetEoZlbMWxD5Ef7nf/7kGzw33LxNlKDLmmSVnPFIv7XtkIp4harKaQA7xGF4hRWO0jwp2nmN1lqmjZ+8rQqGd3SzK3jpHEepXg573ebGaDLvtIpGxVJlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AM8PR04MB7905.eurprd04.prod.outlook.com (2603:10a6:20b:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.31; Tue, 6 May
 2025 08:27:06 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 08:27:05 +0000
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
Subject: [PATCH v7 net-next 04/14] net: enetc: add MAC filtering for i.MX95 ENETC PF
Date: Tue,  6 May 2025 16:07:25 +0800
Message-Id: <20250506080735.3444381-5-wei.fang@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|AM8PR04MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 80284a4c-3310-4838-20d3-08dd8c77c8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v7mKoWCBDs/P/TNgPHkXKLo9wuZzwXo2jRnHEvurl0FUr4CYlOoY0IU0mbrN?=
 =?us-ascii?Q?Z0uXqSYyEW9G//vX/ToQKTvwJXdKgaYXz5QHKDgZGEfwfeRPrrLI1ZZeSzmG?=
 =?us-ascii?Q?2pQhHDVzQWDdiVSfgxV8WSGQZWXSm/ViFbgo5Sp0J77h/JGWmwY7qX+as0bh?=
 =?us-ascii?Q?HOmbSIQZWEPpLbk4SW3W1w0Iuy9l7kqfxI8j9PogJZUYrsjWmZEYTFFcZc+r?=
 =?us-ascii?Q?vNYyflFKmgw+2lWTB73sox9TXqfbwzHS7O4Uo67kZhcHP6BTueqCTwilrLE0?=
 =?us-ascii?Q?+XwdTWQKfnWTNADJXwnrQ3oOsmf8tGAzNryJVhn7sqBZAwNhLmSF1BNORpMu?=
 =?us-ascii?Q?RjnRyEvSlNHSRNQfvD9CaZPeKMK+G7KZrlVO27Oi4o0fQV/OgL4wejtGwIPI?=
 =?us-ascii?Q?ngS+33MWAUVFpKQpYIzRoRWH/tbdhVQCxr0hq+Sle5ZmkwXLenNGfbYztcvG?=
 =?us-ascii?Q?vdBRw5GlyvhLZNCM1RdKUaBmDOXJjcAgiOaf3sYjslsRzsEGv7UHjtMWI1Cy?=
 =?us-ascii?Q?S5XbTkqcu8SoQrZUCPfGmf9UYeRGXjMZNk5nP8P24ZT6OtSnDbGsswAbKdZu?=
 =?us-ascii?Q?/gtlJa+i0a5Qn0kWg+2om0RyLxRMyU6rbE7xxg8xUYUjWQxqHS5ydtnEWD1t?=
 =?us-ascii?Q?qiWbUA8+Za+72E3ifKksnoawmr8qOkJ3+HuF6bXfwJXhBdWIZyXQgkuOvQ1a?=
 =?us-ascii?Q?IV0r5TBYEdYdO5qbFThR/O+cgc8n9H/6hKEEM9l4imSt3Xl9btRqcckfswHc?=
 =?us-ascii?Q?47PH3hW3R/6H45sdgDq6Va3l4kMGYqZgYAPoPPpeyHk7+JyKa14579gAUkU7?=
 =?us-ascii?Q?5j7y4fnj3CZWjr9Wp2yA/1CrmysmINKKCDT/7NRjMNdVQeHsfOh91qYgp60c?=
 =?us-ascii?Q?YK7bhrX5SFUUvHtfc+ZPzgZb4BjSqaajPIYXp/HqZCxSG770yEAV7d2i97eW?=
 =?us-ascii?Q?cSlemtJmrbM40eX0YJbaDx9pZ4nG0Et53QIoo/wUO/VxbfFFANTRib/DPCG2?=
 =?us-ascii?Q?K8DwR4bJWNtclVH1MKNlgIv2Pbc9nJQBEwX1cR0abVSgwvk4lLYWL/L9TGUV?=
 =?us-ascii?Q?2VnO/jsS6dbFZw8PjzScWiNpsetEngC6ve/Nu0gdjr70PlOnjJ98STJzbsNu?=
 =?us-ascii?Q?NS+0aM1lIOJBROrESm0bFFhCdYQtLkEnOuGrHbKJimTIJjnhYae1/inFQzco?=
 =?us-ascii?Q?DqaMG4hMx10D/YVh/UEavaa1ssT1daVu34X9E7CxcNXQDzUX1NSUOaRDvhWR?=
 =?us-ascii?Q?KxfkczrWBrv+8P+bCkEVLSro+9cBU3MyQ1MmIQjyL+5F8Qp6Ll3AbxXd/EpT?=
 =?us-ascii?Q?/HjTwjbVXuSXt4954yXFNoRwQszhiXhgovHmLjYOcs0nFMhUGb/I0BUsvEmK?=
 =?us-ascii?Q?FANzfMJGvRowGI8BeAyKOOmvlWn3/WwVsLUeVnUYyBOL90DpsQHrv+XctgRN?=
 =?us-ascii?Q?vaYnmaRLT86QIhM5Nv6do3kuzq6+s9P58qWFulmxMLDIy+CZhld5ag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PXKDsWZTQWHLTRcWnUZ8y7sG/QvY3IdVrbN22LSV2HNor2Jk0uGELQGqrb97?=
 =?us-ascii?Q?iQmzFjnIwlEJQS7LYh4UHGMrWKc/yT5QLv+0OEHnefJsI/UoyvPFFpD6LRkv?=
 =?us-ascii?Q?unGUMQQuTavUkadXLja19SCcunyt9FSPx6DntvL3Xg8xoED9JjXDBpFq+ZwU?=
 =?us-ascii?Q?hsD43qrZ9KxmUH9CmwHhuLG3ck3aVkBLI0AOEHVYTjEZIxL7CoUhsGGwelbr?=
 =?us-ascii?Q?7lI04U5veCi9Z5tuklT8hyisb96OxeHMpIop8XaK+F/KBEUU80RxFNA3SuNX?=
 =?us-ascii?Q?WkesSNLwAEEnNrlWWBABxvVgoMZ7r8aCl9IfJ9KlqgkNTPZ874dProUyXUMS?=
 =?us-ascii?Q?cjkYBp9x4IetDFORMaNafJm7OUyWxORW6AmyxOXr4bFYNHvbVdAL0PZVVuTw?=
 =?us-ascii?Q?C/C6G8Zh8F2P32DxMHP8vz7Lb7r3yCtGS7jCr+PoRCahlWZv76RIRuChQ/M/?=
 =?us-ascii?Q?EsLcdTzdwrLV+wqdWmFFNDFX5AbwRL3W/qimOCZINTxZlnPVuz8hNLstOiyW?=
 =?us-ascii?Q?g5LPk9KA3cNfpLOH/zs6hcAfpBscQuMIbE9UvWaleNlCWhLJQdGdt6H4SbFJ?=
 =?us-ascii?Q?kG2ZMEkB+UUe7m0KNlUy44ju1FJtmMNBZnxbmoYMky/q+/5fpYcEC6hlaqjV?=
 =?us-ascii?Q?HkOrsXpVvSkSrzKvlAxYu1Wawxjf/vgOiTQFhB4mOybcFu0/RG8d7N4txmAd?=
 =?us-ascii?Q?enUMHU5ZwImOQtyX6gM/kCmQwYECUl6eVl0LiLkI5pqLY7/0ITi/Hz06TWk7?=
 =?us-ascii?Q?JHchJXA1vC536j4PbYl7bdz3hIBe4k8KA2fwQ8hhe7gRWe9aCnJXtp+4ZRgd?=
 =?us-ascii?Q?z3FxHAemhuTJ2EUxphq7l8icvy/TEs15AujlN+/KeCVXq6kPhn094+O6bXTE?=
 =?us-ascii?Q?jRozuKyvG6NXgLyX6s0kgljncwE4z+uDPhM1j0SrKIArzJT0eotKJN0WopfG?=
 =?us-ascii?Q?BQav+X/Sh4kiT88XyFrVgbXHl0VNY3fXlbGayNpvSmyEOBFQRh6BIoMLX4i7?=
 =?us-ascii?Q?VO+n669kt3DwGsBBrJ+Qu7Nd7JAmbkFiofZuxi/J96r5FAPsLJRG9mn03KLT?=
 =?us-ascii?Q?/7h66dyOiWEv4hJNrthB1+ECSsPKk8/3KYCABC7LEBWXSIac+6MIPDj+Oxf3?=
 =?us-ascii?Q?GJyhDkEYWPi0RJ1TTXn7HsihK5T1uLQTKbEWBhbx9d8ESHmY58xTNK41VYg/?=
 =?us-ascii?Q?NZu7BtiXV0Azz7Yss5EqpqnFq7PcySS0lAuJsLbwBvcWotSiHKYdhTxs6egF?=
 =?us-ascii?Q?2X3rOx08t/6A+T2xD3eX6IDzwMit7QMlbkRGSBbf7mFsnzYXjig3b+E0sb1o?=
 =?us-ascii?Q?n25Oc3zlogMjeVlOLRXz/jjpfU/cwls1vbhYuLT49DyP2KJv7ciZ2XTD9N+K?=
 =?us-ascii?Q?ivbvZD6Sw97Pg+zDTsKfFlxJuKUxG2Jn3bQRVfMraIuJSZde0js7aTBzTNhr?=
 =?us-ascii?Q?dYl8q1DVegKDt+48JWCGxvPuvmHNYgG5UXsWiQMa3h3fZAeNsP6md4sf9oxG?=
 =?us-ascii?Q?xrYzHkC1vEaUxO8sS9xrbjnXj+K7UwHbmXWOKxv3BTXMtX2sLgNrqMb0zrYU?=
 =?us-ascii?Q?9PDn0yeVonqGpnqidUQgQzoP2yp0HyBj/HfRe0yK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80284a4c-3310-4838-20d3-08dd8c77c8bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:27:05.7607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Co9SR3mOJdFWRZUUhv5pjCkr/31J0B7YoDCcp/wvfY1R9JjkUqFsCOw8D8edHiw2z/ENUy5ZEW6lory+9wWH9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7905
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
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
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
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


