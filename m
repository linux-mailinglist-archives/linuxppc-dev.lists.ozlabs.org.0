Return-Path: <linuxppc-dev+bounces-7608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB4A85957
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:18:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt0Z1Pxgz3c8x;
	Fri, 11 Apr 2025 20:17:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366654;
	cv=pass; b=L95GsnzkzI5exM15XlKgEoZvzBbbvGnXFQlQgHnJpBDTX2GWUGzAPboa5hcovIhXnFjq0Mja0lzz8UJQCvdcK71befzVHF9vNvWBJVRZEnH5CeP2VDow8h7DKwXh3eTDTRz+kl4uYkx4YZl4PUcHrcMxRaJUdfJWegrZPsctRBKZHCKlQUnc0kI+cMqyPAtwJOJZ1UXAzA7At570zVLfcd3SqwT7g+r0wgSkkiMmrhqfstYgn8gHQBoOyVJwj1zD+8yaYesBnngekOW/YuzQh2avmjEdfwZxst7n3dUzThRUgcu+kFA0QUUnm0ortTysJjEKsQyBqirwnoioBVfzyg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366654; c=relaxed/relaxed;
	bh=KXE6mMkbt6EIDL5T75YbEsWR/LDSOOWXmbxGTZ1Wjys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNGJHt99lvWhJAfyRnA37QA8X0l0kA+eBIsaU6z5sdzGT0zES+MuurVuWqDipZxr1jZkasLjcjrCaAsPi7KsPdLFT3NCjmn4hSRL+WUuu/vQKaF7Q1GQByT2n871axbeV2eAGTRWfXRF7o3JAZSIITwtYXnfH/Lp18cKPGpUbmKIInAONPCJwVK8QO+CWzn/shOOIGgvOxRS4UJioSFGsBIgpbaoZFG9ToXqkU1so5/vlEX5uDoNcE+tUuNAZHsY4wOAEokQXzJUcBC/iAHW2Kg8aOgKN2aDOpl4ckHGdoOdrMKDOX8xfJT5scjw61iGqHyT2CrMBc+0jww39aywFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Z4JtJUVA; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Z4JtJUVA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt0Y3psRz3c9D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:17:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7NqVmPkWxieedXA9viTrGVjO9R6acYIQSrXcjpmEsxFr2+QlvLJpO8pLgwKC7+QJVrvANhPWR5HNHz12fDuI5EOXhYhR1NzRuUvQAGfOn+3P8Vcu/bS0Gw/nrqwO6g/jABt1nfsocywszeQyOy5cvSOmTOW0hb/WZyVSGYZHKRB8ZFIoKUwDhLphY9qTgt/ps86u21CUKIc1GA0HRcg/w3qtt+8Fryu8prBgYGqT4xgMqy4eb7gNS3tGnCKEN1HEMDX1BRdunHu1PQ2v8xQRzg0161Z/sB5UsUjtuVxwsdKywkiq+MxTDYWHmfT65Jq4KXWEBLK4w8beaBPrkyDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXE6mMkbt6EIDL5T75YbEsWR/LDSOOWXmbxGTZ1Wjys=;
 b=Gtbb9ugYiTJLrGD7rEaDMp6eFrHsR47inX1+jZ3tWGvMyMvH2mvovl1UL9fqYpWjG1zOGsmDfejKE+jb+X1WDrqRP6EXIr88OvWa3nA/MIwWgrVXNulA71/kIkDzm9cVrZgDa17jf8A1Imzv6Ik5g2HovJTf5mirHaUkjjii8TZgGJ8QhygqLLoL+JFjKcv9MljwJUWKWY6VMS6zDQdgRbCyRykwfdu54IATAoLC/feUfoD7+7Q7C6ttg/+Cc2OLe097r20V36BPp1s7/hK/KoAK106xifeKrRJ5UzPkqjwimxLdHKc+raWtzyzlLeXD5bMaTrc20FIYSxoVSsJXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXE6mMkbt6EIDL5T75YbEsWR/LDSOOWXmbxGTZ1Wjys=;
 b=Z4JtJUVAUn8EV/215lb3dwZVPGw7ykkw0qYC9AqOQbM/xKUVfyAQuiSuf/Gsg77bY1loBvHc52rDDxEz4BU8DlaMxzDSMGZy3+7vFg5I+m9uYITkAjcmCt10Sd5SuWkR8vVIu3OEeEJCxF6jlL7m4nKYVxsOnCtq6jVOVK7NY0DyAWNr+NyZ9VePxfeQWcauVMG5hpMjYSXLoHtjHkzxYJ0MI3wT+HMckjcgtwQZX/H0klv2EeKiGPN39LTmXYDbG2Dejz5P8pFKGAezUdDyipak+W0s9aIB0r/SjZf+qPHLD4LHwkAKefCGw4gKUravcjFMDvPGTcnYeDHzujTivg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:17:22 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:17:22 +0000
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
Subject: [PATCH v5 net-next 05/14] net: enetc: add debugfs interface to dump MAC filter
Date: Fri, 11 Apr 2025 17:57:43 +0800
Message-Id: <20250411095752.3072696-6-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095752.3072696-1-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a12d4d-4cc1-4be6-fcb7-08dd78e20c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xOGqvCplIxIWBX6Bq4N5WaG2C+gD2MDA3TxZfkGqNKGT6KflR7ThzS22Cf0e?=
 =?us-ascii?Q?N8YftJ+y0W0sT7+OSJUg5YG2dc1yXtzDI6T2IV4PmypaEArbrMdXqG30QNQX?=
 =?us-ascii?Q?giOHTq7FfuQE4Ihn65s8K2NOjcDHmJR5U8pbyHwmcQVQ9HsYqTi28WdMptAU?=
 =?us-ascii?Q?DB2f/GOcUccP1f6jprDdHsw68c/vBz+mPkHss1TxXB02oZ7i1DCKG7C9Py66?=
 =?us-ascii?Q?+5FENdSVMpF9IEetACUNobNGJRLh4zj9jHs8QGp0R4Um6JJ4rvFoxIAzqMYW?=
 =?us-ascii?Q?e9OyQHI76XF/hBg3Bx79ZXbVTRz0weQShEmJEdfZPaPebcd1KVn3DDvfPmFs?=
 =?us-ascii?Q?qNnxYhXQvajYcyT0viM0TsmpOhr0GtiB6XZCBDt+skSUxkreQtztWz/OJb6Q?=
 =?us-ascii?Q?+t2p9dt+kQpjaMgNgGxAIpHDzwyT0MoVWy0BQ3r9z3v3YXtCJjE0zTk5NX3Y?=
 =?us-ascii?Q?WCuV5cPV7y3I0SJfASKNuehzLRN+zSaIzZ1dRK/+Zw4DmGEo4Y6hc8qNFOvp?=
 =?us-ascii?Q?T1Lrnv7ZJoxz10QJnJqSXVlAVA1TBh7GNQvVKCx/FlX6p+om8eGaGg9kddeL?=
 =?us-ascii?Q?3u3+nZsJJb7AQNfe5iPafxUyLkznI8FOAQBQOLOHX/KAnrevC7CRcsgE2DH6?=
 =?us-ascii?Q?zdD+X2Z9Jjo/WVqst0i9OgwlSnK4lHusCxYqnoE+J3vVOZCv9MvUFHyQbjRr?=
 =?us-ascii?Q?lgcyjT76IuD7wO6I51LGh8mUgZSOwNGgd03hTn3bUvGxK6gVMDnFvNm0CMr3?=
 =?us-ascii?Q?5Sdxnn2ngQ8xWJa+VgtQ1sUshVdzSsntSZd5boiauI6uxFI7JPqTwE3Mtqwj?=
 =?us-ascii?Q?3BMOyqtg7eYUd2nAclUpfln/xXHQE15qdoxWMhUXI5QnYpyVCQZ8hFJQIApV?=
 =?us-ascii?Q?DchyplwK6PPPZOfRk2umJwrzSifz5MC79s4hdgvb9/FBNYNJWN0KJUKpo2x3?=
 =?us-ascii?Q?Rs9RJ5/vE+IqXQXjXvVhVKMXiL9jPRLI3oCi0LWvFI1sgk24uW/F892s+XDA?=
 =?us-ascii?Q?aYuj9DYhSD46nFYnCK/WdpQJYvQj2PovGLPDqPWFGeTFo2XAEYug60kJWlLw?=
 =?us-ascii?Q?PRa2Y3yXdg1FAw2NAkxeuVBus70D1WwDPyJQ8EJzrf/hoRqQsYllJVK3u+R+?=
 =?us-ascii?Q?UAQA3fFQfTFdbZ3+8q6tGhTZmu3c+yXikjOzWRrhmpGdlZqGHMmhNYEa4b90?=
 =?us-ascii?Q?y9wrJepOUMd7wNGJrOiXrg9sbu/Kg/ZN2fKcuogoKhjCbP3KKqh03irUp08X?=
 =?us-ascii?Q?mvAd4iWXXteVRdSGVoxD/cWczVwEIig4tBd6QwEYuoZa74a1o876QccdMvqV?=
 =?us-ascii?Q?2+MSFlrNohelAN1ADwqy6k8jcufMpQ2QviUEUezcQ0rUn9GdSmnx0MQ0QXKu?=
 =?us-ascii?Q?2W1TbHaO9jEQLKjf8wRP/EhpPX0r1Jn7OWf6/iRSTnDxKR3zBbu8Hw1lXfJO?=
 =?us-ascii?Q?WfvM41KQ8droahfFYGU9trxNJlE12/4wsUSB7tFRxE4YeUkbtQMi1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lU0/YiSO+5DTOmWuaHWiY7sjebAZlWU+64RONbRusBX6N22N4lvAnmMRVgus?=
 =?us-ascii?Q?SUbmMn/F6wuSo1VPomiFQDUy0Eljtg09ekLn4sPLZrOcbkRI574XBJs8MJXr?=
 =?us-ascii?Q?hVWjrP0gdxj+pZrQp3VoImGXsZdNM2nQSB+4wCbRAAXKPo3+fVlJkFCS3c2A?=
 =?us-ascii?Q?HN/it+bfAbzbBmwW5EWJk/HBRFsITttXLQYvSbg8fZjiAvHlrrMFyGB7geuQ?=
 =?us-ascii?Q?QArphAbmR42fwVdJw7scwgVOtkyZyfAW8ofZMqS1Ha9sLxr/I/legbP6icGA?=
 =?us-ascii?Q?WaQRHvvuulgQ+Hs+5BNO5l2cyvJBG9Bvc60oabb3jjaKEjKR45Kpil+1iTPU?=
 =?us-ascii?Q?DTljX4kN0iZ0DnA17VsVzNGJrwjqjFTbX/xwwgCYEgrv8E4SSk+oomSTrmNK?=
 =?us-ascii?Q?y8kg1SxFY8Rl6q1+VbEGI8WbMqSV5Xo+gKCAR1jtv9rKS3T3WPyi+msmZGZD?=
 =?us-ascii?Q?A3Qho9RTDKGVPEL8HDl+P+l3JhmldUn6BipSI32xOC68zv8WkJvB/6JT0dsk?=
 =?us-ascii?Q?UDqmxNNy7DzUS70Gv5ExeQ6nYERtm56rKpe1rbErKAntXEPvxr6UTYu0fPw/?=
 =?us-ascii?Q?F+nn50HNnypohf9hHW1zLe6VzmysofpaAh/7GjMBttvDMs0MCV618823Moe3?=
 =?us-ascii?Q?uOuhMoRCyQPGhpEv/nQfW+vbvhVm0AZ8ZmNj/Hk3wK3SkzjMfWBT3PrJdCdb?=
 =?us-ascii?Q?RvCNvJ+cM66dN2mJzO7sshq6inr7AKakhzBCWAiaI08uh6lelgn0ApiEhO/R?=
 =?us-ascii?Q?VfDQczz6/zR5aE61VEzXKpYNFbK501zyLSl/mndwA+zHkYwHWMr8niuNsWX9?=
 =?us-ascii?Q?dwRLT400N8D04y6JjrOcZGrujcr8lR8drplyNhshBUYBzgcKZSgpRbU/ajLy?=
 =?us-ascii?Q?nge3y66TyoWgv4/XjkbY6IEf0A8iPkNOrCIUssldHiG+BK756zJzX3N1FNDc?=
 =?us-ascii?Q?eAZeZg2bSZvIfLbUQ37J+VN9opw9SYIZ48oNlS34x/UeU62QqIimEG5tB+Mv?=
 =?us-ascii?Q?8ntMHirncpEbbO17pQp3vbddtJeB2OjMV+nr6RbCQdCz8Y9C6AhP5h+JUlv/?=
 =?us-ascii?Q?h8AKSngeet0xPSp7wU9YJgDc+JfFFHCsKQ19j2dr3Q36aaFXLTyFycl6J6sA?=
 =?us-ascii?Q?nOb14pLAvb5R9rX5z/5KHd8J27SLEWj6VlSAmjLuczLLm5TwFYEfaVct1B6o?=
 =?us-ascii?Q?6tV6FMPBu1Fru7nIrg4ASnIP6i3lI8cLlI81Nc8yUL6oCENhO/CBJZElgBvb?=
 =?us-ascii?Q?WsZ5FFomFdxu/vucxQDdkHMMeBpgBsgqDKEFF5/6KKoMgBRckcZI5uTUMjf8?=
 =?us-ascii?Q?7Wuu/S7dXaNS04CuYZDfttQBaANquALDD0NGAtRZ5CDUcPS/x/p1RxQ2176n?=
 =?us-ascii?Q?Kg8cR4M8rSePBJmHh0lP3vqPXINPUd0d1cdYevzsR5mCHdvvQidWSEfJfOVH?=
 =?us-ascii?Q?Qm2HQJctPMgl/zaQQ9OA0pqKe6Qts8/d19cbl47XyXY8pgSXwSixITWjzpVn?=
 =?us-ascii?Q?yOzbRocZi+aU/TR/w8FDs+Lovx9oYt/pZPyqtNrxzMY2D3HlcAxGzVygGdp/?=
 =?us-ascii?Q?6oLUV14UV7c1DP88EYvaqXvjxt4Fm+adOv+VhZVF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a12d4d-4cc1-4be6-fcb7-08dd78e20c52
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:17:22.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZ7pzdvn+GpqgZe9ggv9GGibbqtEOPtVHAuTr2aBwkfIts9VxQfqFNbZOtRXoXMkaqwzfebe+433fBjj+ckY4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ENETC's MAC filter consists of hash MAC filter and exact MAC filter.
Hash MAC filter is a 64-bit entry hash table consisting of two 32-bit
registers. Exact MAC filter is implemented by configuring MAC address
filter table through command BD ring. The table is stored in ENETC's
internal memory and needs to be read through command BD ring. In order
to facilitate debugging, added a debugfs interface to get the relevant
information about MAC filter.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
1. Replace is_en() with str_enabled_disabled()
2. Remove superfluous "Show" in the debug log
3. Remove keye variable from enetc_mac_filter_show()
---
 drivers/net/ethernet/freescale/enetc/Makefile |  1 +
 drivers/net/ethernet/freescale/enetc/enetc.h  |  1 +
 .../ethernet/freescale/enetc/enetc4_debugfs.c | 90 +++++++++++++++++++
 .../ethernet/freescale/enetc/enetc4_debugfs.h | 20 +++++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  |  4 +
 5 files changed, 116 insertions(+)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h

diff --git a/drivers/net/ethernet/freescale/enetc/Makefile b/drivers/net/ethernet/freescale/enetc/Makefile
index 707a68e26971..f1c5ad45fd76 100644
--- a/drivers/net/ethernet/freescale/enetc/Makefile
+++ b/drivers/net/ethernet/freescale/enetc/Makefile
@@ -16,6 +16,7 @@ fsl-enetc-$(CONFIG_FSL_ENETC_QOS) += enetc_qos.o
 
 obj-$(CONFIG_NXP_ENETC4) += nxp-enetc4.o
 nxp-enetc4-y := enetc4_pf.o
+nxp-enetc4-$(CONFIG_DEBUG_FS) += enetc4_debugfs.o
 
 obj-$(CONFIG_FSL_ENETC_VF) += fsl-enetc-vf.o
 fsl-enetc-vf-y := enetc_vf.o
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 1573ff06fcf4..b53ecc882a90 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -304,6 +304,7 @@ struct enetc_si {
 
 	struct workqueue_struct *workqueue;
 	struct work_struct rx_mode_task;
+	struct dentry *debugfs_root;
 };
 
 #define ENETC_SI_ALIGN	32
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
new file mode 100644
index 000000000000..3479c0abe9e6
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright 2025 NXP */
+
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/string_choices.h>
+
+#include "enetc_pf.h"
+#include "enetc4_debugfs.h"
+
+static void enetc_show_si_mac_hash_filter(struct seq_file *s, int i)
+{
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	u32 hash_h, hash_l;
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIUMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIUMHFR1(i));
+	seq_printf(s, "SI %d unicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+
+	hash_l = enetc_port_rd(hw, ENETC4_PSIMMHFR0(i));
+	hash_h = enetc_port_rd(hw, ENETC4_PSIMMHFR1(i));
+	seq_printf(s, "SI %d multicast MAC hash filter: 0x%08x%08x\n",
+		   i, hash_h, hash_l);
+}
+
+static int enetc_mac_filter_show(struct seq_file *s, void *data)
+{
+	struct enetc_si *si = s->private;
+	struct enetc_hw *hw = &si->hw;
+	struct maft_entry_data maft;
+	struct enetc_pf *pf;
+	int i, err, num_si;
+	u32 val;
+
+	pf = enetc_si_priv(si);
+	num_si = pf->caps.num_vsi + 1;
+
+	val = enetc_port_rd(hw, ENETC4_PSIPMMR);
+	for (i = 0; i < num_si; i++) {
+		seq_printf(s, "SI %d Unicast Promiscuous mode: %s\n", i,
+			   str_enabled_disabled(PSIPMMR_SI_MAC_UP(i) & val));
+		seq_printf(s, "SI %d Multicast Promiscuous mode: %s\n", i,
+			   str_enabled_disabled(PSIPMMR_SI_MAC_MP(i) & val));
+	}
+
+	/* MAC hash filter table */
+	for (i = 0; i < num_si; i++)
+		enetc_show_si_mac_hash_filter(s, i);
+
+	if (!pf->num_mfe)
+		return 0;
+
+	/* MAC address filter table */
+	seq_puts(s, "MAC address filter table\n");
+	for (i = 0; i < pf->num_mfe; i++) {
+		memset(&maft, 0, sizeof(maft));
+		err = ntmp_maft_query_entry(&si->ntmp_user, i, &maft);
+		if (err)
+			return err;
+
+		seq_printf(s, "Entry %d, MAC: %pM, SI bitmap: 0x%04x\n", i,
+			   maft.keye.mac_addr, le16_to_cpu(maft.cfge.si_bitmap));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
+
+void enetc_create_debugfs(struct enetc_si *si)
+{
+	struct net_device *ndev = si->ndev;
+	struct dentry *root;
+
+	root = debugfs_create_dir(netdev_name(ndev), NULL);
+	if (IS_ERR(root))
+		return;
+
+	si->debugfs_root = root;
+
+	debugfs_create_file("mac_filter", 0444, root, si, &enetc_mac_filter_fops);
+}
+
+void enetc_remove_debugfs(struct enetc_si *si)
+{
+	debugfs_remove_recursive(si->debugfs_root);
+	si->debugfs_root = NULL;
+}
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
new file mode 100644
index 000000000000..96caca35f79d
--- /dev/null
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/* Copyright 2025 NXP */
+
+#ifndef __ENETC4_DEBUGFS_H
+#define __ENETC4_DEBUGFS_H
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void enetc_create_debugfs(struct enetc_si *si);
+void enetc_remove_debugfs(struct enetc_si *si);
+#else
+static inline void enetc_create_debugfs(struct enetc_si *si)
+{
+}
+
+static inline void enetc_remove_debugfs(struct enetc_si *si)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 4c2d944d6b05..bbe16c140875 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -8,6 +8,7 @@
 #include <linux/unaligned.h>
 
 #include "enetc_pf_common.h"
+#include "enetc4_debugfs.h"
 
 #define ENETC_SI_MAX_RING_NUM	8
 
@@ -1004,6 +1005,8 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 	if (err)
 		goto err_netdev_create;
 
+	enetc_create_debugfs(si);
+
 	return 0;
 
 err_netdev_create:
@@ -1019,6 +1022,7 @@ static void enetc4_pf_remove(struct pci_dev *pdev)
 	struct enetc_si *si = pci_get_drvdata(pdev);
 	struct enetc_pf *pf = enetc_si_priv(si);
 
+	enetc_remove_debugfs(si);
 	enetc4_pf_netdev_destroy(si);
 	enetc4_pf_free(pf);
 	destroy_workqueue(si->workqueue);
-- 
2.34.1


