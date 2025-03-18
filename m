Return-Path: <linuxppc-dev+bounces-7172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9DA66FCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 10:30:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH64j2cbzz2ySj;
	Tue, 18 Mar 2025 20:29:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::615" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742290197;
	cv=pass; b=DyOMmBtiy0H7x2R+2DIA8DP2oR/oF+f8rtGSObriOie4mm8XNCRHehaPAgeo07y2ROyuPGjnB8HNdAndpdiiw1+w6rZWQVU1QKNdZt80VJg0NhKwqq8qB5TDhTE2/zubodg1FXRuWa/+42+YmwJZmBOKQ/H+F35BsI45BGH76F4Jf9dAKWiv8DONeTedD/gihFfuTHHSkEETxIHzLXPPrfwaf65eAv+RCme7BGBKRTD45HG7zMOW5byfJD76BO3AGxwyf28+0+uJN7OYqyfQ6dI6PtDhfAHeiSlLF+1WyRGCuJ9wzwFQgax4B1aC8ofor5PLokNJw6ugTyyKhP7GBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742290197; c=relaxed/relaxed;
	bh=rnKfrUp/4v2VYGjNoJRL1C2pd+ArAnXbJ1YJTL04cuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BnXK+5B6X3vIdEkIBvktHZ8izDZZNwz/knChyxo+6OnUZolhrPEJrxVd7C1bLAXWF0r9FPVwFEk1w6jFc+X1QRKY0NBIF5U1iAQG41Bv3jX1Fximl8WKEv4T01q5WESNVEd/yeZOOoRGwwSJapb8trRk102ySqNIZt3GpPuH/vYcSUbKSzGVrTv3R6N8hRjjGdvBNf68GgUeoo7HyCCDxZRAME8hJ5Ws0lay5D4VovlMq6JOu5DxmqvvpKBLt4wN/rY9zcaZg7pdAGloBjfSzv3n4kH+1JNsbtu5KBz0iJdLy2/kNKaLxLuVnD2y536fVpXuzLuFLS69xijjV5xuTg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HnK0ApCj; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::615; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HnK0ApCj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::615; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20615.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::615])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH64g2T0Pz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 20:29:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBDFZnDcvEdBlwKlkLKzZkA13V6hETYtVrZsj7T7qjZs7YFWg/Ibxl0e2SAhtuW4qECXWTsq5rlysgafkMQLT5guZALQVZ/RIB2MGsEGc6WeRNtwSR0acj7nVB8p6S96lu2A9/48E+Sngqdzy/tb9xPwkcDSeYF9k0KD2roTptiz4un6PIXEHwR7jqR4NtcQ/qIhodhjbOlRmjVLFbhZWGofx5ThT4wsRGWCvIT6c/FVJiqB8iY+k+QtkPNLvsU1Gn5Uhf1Q9HgQfx2FFZLc9HGZESDQmVqPhbeE+KfFy+6DQLCU2hjJGDqDh9Fk1Dz4Pc1b8RNAp+ZLccOGQXYy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnKfrUp/4v2VYGjNoJRL1C2pd+ArAnXbJ1YJTL04cuA=;
 b=D/06QKScN+JImKse9JJrjDQpAiTV/MoIhPLfDwh9orLBXEjgr7HapgoI9sJ0NReQSTMaEspyO+XfcXI5/bybqiml8z92Nghj2k/Hk6vPY6bOtaV3OKuGUYO2ZXZL3LJduvVb512nTyns+DaJbkBQ9lt7v9ZXuvE2jMfqOq+/uYsRpZfj8m+LLTPGkQhgrZV45ukFiQuW/z133VVt2ojTdTDo4G0luC617ewygaxKyLSrwtWLuMi8LWOSx+eyehA/AozKrFjX5qepH1apGdbVGVgMNy/uwEKB3AWxpyEyYOaBUXOc9xgDmdvMoInI4MIXPHsErp9JgfnRp8MSsSPOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnKfrUp/4v2VYGjNoJRL1C2pd+ArAnXbJ1YJTL04cuA=;
 b=HnK0ApCjWBL7mBCWLqhP84tdgbUEe3uWiK/Gox5q9iwQsEU8zBx1M/bRROtf+JliugyvJhxXwstahmkiBCFCJaxaMAMMsPnCh/5vZy9anyYq8dbIp1RmmHplseBvZba15uaNTRkW+Mn8I9MLsdy/ns+HLLp3lV0dit0MsYA0KSvgwbzypYCypHGDhUsq22BtbKYLRUwDoTpUQid+/koMF24Hni6kLNuZHnN3X6cmLl0EVw2KFQwHf7AZp5VBkFwYv1UY8sWOBgFd4iE5YBAkMp/lLgxzCZOu2N8718VAf48/GugwUSu1og27Vk3QyTLokE90p8ofli9S78ggeuYknA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI2PR04MB10932.eurprd04.prod.outlook.com (2603:10a6:800:279::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:29:31 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 09:29:31 +0000
Date: Tue, 18 Mar 2025 11:29:28 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
 ENETC PF
Message-ID: <20250318092928.6e2tspaf4rfyn32c@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-5-wei.fang@nxp.com>
 <20250317141807.2zobsefxl5vnqdet@skbuf>
 <PAXPR04MB8510EECE1FDDA893811EC28B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510EECE1FDDA893811EC28B88DE2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VI1PR0102CA0101.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::42) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI2PR04MB10932:EE_
X-MS-Office365-Filtering-Correlation-Id: e252e901-e4da-45fd-ca18-08dd65ff6375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8+hjhmUt1Gc9Me2ThV4hhzLjkzbhr/GcJikAWiJitNI5qMtyDd/3JLvK9Exh?=
 =?us-ascii?Q?352OnwOz/OhELCPocbtuNVW1bpU9z61yC9z09UyED38x/35dmaTdTfvHsbSP?=
 =?us-ascii?Q?8sRrRgjpjGukFzckJsjiWj8Dgv9QYKJnsWkpR7dEzWa6FCk8qqLMypdjmYQ1?=
 =?us-ascii?Q?Nzo0z39mS/waQRnu0oSDWPSDCJIz2X3ZOm5LPOP4jssh/SblVzIJ/nYRF13c?=
 =?us-ascii?Q?Yce/pM6K5COLVuHzhHP2VGSYfYTa44Z7j21j+Hdd1jdad6oQlBjAkL+fcdQ4?=
 =?us-ascii?Q?DGTuTk5wVqLQZaGNCS6eYLCTSlGyV+WQKGWi02cekwkxmdzvEEFlAFVjaJ/f?=
 =?us-ascii?Q?bHPseQWUQfEvQHani6YspIZ7pZW9fIxzGdfTLsWWubcnbxwXkqxFq3HkDWQb?=
 =?us-ascii?Q?e4ljbmPpL5mxp+Wtbma8cXhIoOneSg5fUl/yZyKo4OqnRBQy5svMJa90JxKQ?=
 =?us-ascii?Q?7OBm1hZh3jaxyMVyzoNX7VqGwlugKLvQyI+Dc+PCTD/UB7131k7aqCMs6Hsr?=
 =?us-ascii?Q?cFzwkT+Hsz+KqtyxQVL2vgV9gZ0spVIeJCInztpQaYukqHEDppZXOcnfxadl?=
 =?us-ascii?Q?tQQwtC+Eo9WWPO1BvUDH+GKVn5TEU/iaJafexU9J1Jy840nzDS2K30WXcrSx?=
 =?us-ascii?Q?IH/1mCvMbHz9+OSyTTyvNOOSj58Pppn4S7JnsdOtffWzCZlfe2HCUCGmjJdE?=
 =?us-ascii?Q?kZmW+4ot9eDMGrJGKTAWyN2x/HPww1V9NJZ6VpiBdlGrXMC2KWL4HrlNDXNw?=
 =?us-ascii?Q?HPodumeUXSdU+j1l0p3Q9DAwCuJce3rmnCI7HIiVdg8AEl/DqSYGGn5IOVuT?=
 =?us-ascii?Q?KZbSTl/gjy8SkPfTef4Gc0QTxbeIpSnpzvpdu+LyTZx2t9EVNLXnqDYIwDJS?=
 =?us-ascii?Q?OUc6AWGxohAPZWMrV0uvI7wTuNRe+0zhjpJQfDsubh+O6vdzi17Va7/h5bs+?=
 =?us-ascii?Q?k8jQkuHMVuTUX6gSIGlDPHGkANOOCuPwPTQArHc+b9gWt5ntMyQ8VpqR+Nww?=
 =?us-ascii?Q?6XTcMxZ/xAuLyGOHlz9B9DN2Xd5OO40V/hj7SuWrbQDFwDf/pqH1so1Uv8ny?=
 =?us-ascii?Q?65tHMJGE02g3SdsCL33n3Yw8k0MDi9TZJUbH5r+9BvAPQC0LJeNSAEYIrh2l?=
 =?us-ascii?Q?PXnxv4dVlNnvg1uR5DAqDgdmUfuDQ5386c0oaSmgKGWiE+0uFm+MPksp+4N/?=
 =?us-ascii?Q?hLiGDTnvmXmN92cddArNbOadvVZw4qWTf5HJygGNnV1p0f4vu2JYfM2Y2Iev?=
 =?us-ascii?Q?wewYRilOmejw0hAnjTJZizMJ4upi+OMWCMV8pWdHuIN6pmZCeL6uB8l64t0V?=
 =?us-ascii?Q?HuHxi5G/65C5eqzEdFypn2nex0mc5+N+M31872FaNgYsFDcjVAYwHTKlGNVQ?=
 =?us-ascii?Q?5ARUvQghvsOHpFdUxm8u1bhObETT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4lsq2bR51fhYf7kFLhCYJqzxU8brw5/6thdSfaPsSJbsm8G7h38+WyfcZ9QR?=
 =?us-ascii?Q?Y4n8Brt649Zqw83eGX8YbZlb5Noe7mJ0fyFG24ytdH1AWD4AbwQLqEbmUBzB?=
 =?us-ascii?Q?qkhW4jNyQ40qQK5jO/17KxdFmTkpsiV6mJCfNkxSgFPA8pt+7QVJaHoGdwdw?=
 =?us-ascii?Q?7uwSqdhPOkU1fAiayiqYF+aUJOb/YMnrJ+sfLlXE2pSVLgmm6zCeyuYqKgrX?=
 =?us-ascii?Q?v8jbXFp0VABreYJM1tAiShphlwe6+9fzG5YLsDYGypP8gUK8zq4uxcCKmwkE?=
 =?us-ascii?Q?glbxVvzzFCKawMT4f1NmUZuTLwqS0UTkZBYanI0TC0QMQ4/4mXSyPEd9tw7W?=
 =?us-ascii?Q?9Jp1QrwvzMRvXcA3n/Puge48xeF2bVNmAHh3VF+FMDZhlN0DvkkVhWMRlPlg?=
 =?us-ascii?Q?0minWHxpVrL+qUXXOyOgNNT30CqqLbYtOPuV5TJ8DZ7rhJ2yugE6/Qj2wEic?=
 =?us-ascii?Q?B2I+QLs3TkA/Y5vUV+xFG0i19/kQJhLXzrQ+Um0n6DV1VAHejWMYqDWNp2Wv?=
 =?us-ascii?Q?+bhh4IvH6t9bQ2Ikag9zM0Xx8yl86XFjG1nYtVLqkqjIlFTKsxGA06FOOGeI?=
 =?us-ascii?Q?OSBF1366vKZ4r9MtHN0L1XTppnSCHzhRRnrQxIbcX1Ho0CiqwD8K3+4MI7/F?=
 =?us-ascii?Q?irpmCF0xZKPIp+n41e4IalKtVnxgzwcSbrxL3JfSWce7g+ZufenU7Ugeab2U?=
 =?us-ascii?Q?d5AOd+B9ACauwaB0SNTPGR7yWnj+OoHbhK1JqGYPkQujzRuOxEirAsW4nlb+?=
 =?us-ascii?Q?a9bwq+eL4nTMbdpAxtlf7ea2xIdruWu/okmpyFcryI8cVTydFkudrEw3EKRO?=
 =?us-ascii?Q?/L+F6a6/81alr+Yzn1IFcAlOQ2PJdOE6tlBp8Tk6Bir4Ri6Ztmo6gZuQ374G?=
 =?us-ascii?Q?IuQIdM/6QsJFna1Zq+IeaDkzzf8KW4e49uZDK6QXjeanV0q4LWJ52sK4Kb/6?=
 =?us-ascii?Q?D1r+TYe4BQc9fXqhakxhNzX285QPmGN+xDIKWx/VEpiy7e5yayZQLDm+D4rm?=
 =?us-ascii?Q?crW6n+bHh7266Cq81qwkc32zrsDtp60fG3AuPM56rLY4xBqpjc2Ug6l7hPiC?=
 =?us-ascii?Q?NJMpkhW8QMnlxNv4VqJpuTwOpYivbo356h+uZTfHUBdLBkFo0Ed4Whz63uzw?=
 =?us-ascii?Q?PSHucIeIWtEgJOVdmlVsMgqCFHWk46HQa+cQFdSx6KBSfoc3k8sSI0gOPHPs?=
 =?us-ascii?Q?ztjodWMTnuvX4xHFxOwW+h4wLXKYtqqbi8AI4mFzEnqfQmTD0DxkV829eHkR?=
 =?us-ascii?Q?BeYA6eZSC/YKayn6N1jexegPkMhGyhpnDeL3MH6H80vL86irWsS3zCR2h54q?=
 =?us-ascii?Q?1pg0jcNGytXv0OX6uVZCO9W/60QmEr1QAPtLXtOxkJ6emsut6uQFu9zWK9B8?=
 =?us-ascii?Q?ATlUxsyC730SCyZc5hbZck4S2Rd4oBHxNrRiuzfJ5JZY+ocdBUGx58q0R6PR?=
 =?us-ascii?Q?qHcA5O+RR20bhyxPnr979GtwnZUhn9Xbpi36vixyMimvXqnQP2qqEPSSNHtF?=
 =?us-ascii?Q?D73grxgWy1//v1sUOjaH8g3LaSbNc/VYdWtMHVS7eiYy/0KLse4ajh3loMmJ?=
 =?us-ascii?Q?L1SwLaUjPcR1zPslOaWBRgWdfoRpvxpksI/Accxrw4/hZ0tAStkmCV7s7Uh7?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e252e901-e4da-45fd-ca18-08dd65ff6375
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 09:29:31.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdRop64vXEn6QFiO9HPcgvWPIyUuCh4Tb9VVh/b4st8qsK9TztcQzjPfqLBS2OPo6ZqEyAqM8hqbCey2WvsjOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10932
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 18, 2025 at 05:19:51AM +0200, Wei Fang wrote:
> You are right, but I'm afraid of the Coverity will report an issue, because the
> pf->mac_list and pf->num_mfe are protected by the mac_list_lock in other
> functions. And enetc4_pf_destroy_mac_list() will be called in other function
> in the subsequent patches. I don't think it is unnecessary.

Sorry, but I can only take the presented code at face value. If the
Coverity tool signals an issue, you can still triage it and explain why
it is a false positive. Or, if it is a real issue, you can add locking
and provide a good justification for it. But the justification is
missing now.

> So for your question about Rx packet loss, although it is a very corner
> case, the solution I can think of is that we can use temporary MAC hash
> filters before deleting MAFT entries and delete them after adding the
> MAFT entries. Can you accept this proposal?

That sounds good. I'm thinking, for each MAC address filter, maybe you
need an information whether it is programmed to hardware as an exact
match filter or a hash filter, and make use of that functionality here:
temporarily make all filters be hash-based ones, and then see how many
you can convert to exact matches. With something like this, it should
also be easier to maximize the use of the exact match table. Currently,
AFAIU, if you have 5 MAC address filters, they will all be stored as hash
filters, even if 4 of them could have been exact matches. Maybe that can
also be improved with such extra information.

> > > +static int enetc4_pf_set_mac_exact_filter(struct enetc_pf *pf, int type)
> > > +{
> > > +	int max_num_mfe = pf->caps.mac_filter_num;
> > > +	struct net_device *ndev = pf->si->ndev;
> > > +	struct enetc_mac_addr *mac_tbl;
> > > +	struct netdev_hw_addr *ha;
> > > +	u8 si_mac[ETH_ALEN];
> > > +	int mac_cnt = 0;
> > > +	int err;
> > > +
> > > +	mac_tbl = kcalloc(max_num_mfe, sizeof(*mac_tbl), GFP_KERNEL);
> > 
> > Can't you know ahead of time, based on netdev_uc_count(), whether you
> > will have space for exact match filters, and avoid unnecessary
> > allocations if not? enetc_mac_list_is_available() seems way too late.
> 
> I can add a check before alloc mac_tbl, but enetc_mac_list_is_available()
> is still needed, because enetc4_pf_add_si_mac_exact_filter() is a common
> function for all Sis, not only for PSI.

From the way in which the discussion is progressing in the replies
above, it sounds to me like maybe this logic will change a bit more.

> > > +static int enetc4_pf_wq_task_init(struct enetc_si *si)
> > > +{
> > > +	char wq_name[24];
> > > +
> > > +	INIT_WORK(&si->rx_mode_task, enetc4_pf_do_set_rx_mode);
> > > +	snprintf(wq_name, sizeof(wq_name), "enetc-%s", pci_name(si->pdev));
> > > +	si->workqueue = create_singlethread_workqueue(wq_name);
> > > +	if (!si->workqueue)
> > > +		return -ENOMEM;
> > > +
> > > +	return 0;
> > > +}
> > 
> > Naming scheme is inconsistent here: the function is called "pf" but
> > takes "si" as argument. Same for enetc4_pf_do_set_rx_mode() where the
> > rx_mode_task is part of the station interface structure.
> 
> So change 'pf' to 'psi'?

Sounds better.

> > > +	struct hlist_head mac_list; /* MAC address filter table */
> > 
> > One thing I don't understand is why, given this implementation and
> > final effect, you even bother to keep the mac_list persistently in
> > struct enetc_pf. You have:
> > 
> > enetc4_pf_do_set_rx_mode()
> > -> enetc4_pf_flush_si_mac_exact_filter(ENETC_MAC_FILTER_TYPE_ALL)
> >    -> hlist_for_each_entry_safe(&pf->mac_list)
> >       -> enetc_mac_list_del_entry()
> > 
> > which practically deletes all &pf->mac_list elements every time.
> > So why even store them persistently in the first place? Why not just
> > create an on-stack INIT_HLIST_HEAD() list?
> 
> The enetc4_pf_add_si_mac_exact_filter() and
> enetc4_pf_add_si_mac_exact_filter() are used for all Sis, but only
> PF can access MAFT, and PSI and VSIs may share the same MAFT
> entry, so we need to store them in struct enetc_pf. Although we
> have not added VFs support yet, for such shared functions, we
> should design its implementation from the beginning, rather than
> modifying them when we add the VFs support.

Ok. We need to find a way in which the code also makes sense today
(who knows how much time will pass until VSIs are also supported in the
mainline kernel - we all hope "as soon as possible" but have to plan for
the worst). I don't disagree with the existence of &pf->mac_list,
but it seems slightly inconsistent with the fact that you rebuild it
(for now, completely, but I understand that it the future it will be
just partially) each time ndo_set_rx_mode() is called.

Are you aware of __dev_uc_sync() / __dev_mc_sync()? They are helpers
with explicit sync/unsync callbacks per address, so you don't have to
manually walk using netdev_for_each_uc_addr() / netdev_for_each_mc_addr()
each time, and instead act only on the delta. I haven't thought this
suggestion through, but with you mentioning future VSI mailbox support
for MAC filtering, maybe it is helpful if the PSI's MAC filters are also
structured in this way.

