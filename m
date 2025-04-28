Return-Path: <linuxppc-dev+bounces-8090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D607A9EEBF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmLVp3ktBz2yyx;
	Mon, 28 Apr 2025 21:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745838994;
	cv=pass; b=YkBthFEiiQpgHG+hCWrqSKCnUZV8jY1XyksZ8u7MW5vG0xksIH5BKdizzET/mIbgfGIcF1bhM64F0AXDNJKNAvZlMW/tdKHwcLPLi9grNjLxmhsPfmUB1Y8jNVudg+/rSBI/a5IPzyHuGeAAy50HlBsxoG3yroR2AYFQeXTDvBODbmbi3XxuYSC/V3QyrpIeRH09Q+rHQcUS/jNU7tRVMc3QzKn9/3Nw4my3eh0Z/1x91Jcl0V6vVQfkMlTHQ6CphcMGZOWiB5iE9c8j4mjV2m+uFgDDp6hjEth12QNJVHDvdlP7cAfhHS8xu512KlDmEw3FuQHFOjECEf3y+3zveQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745838994; c=relaxed/relaxed;
	bh=JEFbyC0lMn6OwLYqycgeqPjm2m+4kKyC5brQPD+r9gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f9dDB17cUXANgj7k34k/BcCSAsJSQVhQgHvtzYg8QcWIbxNo9VfSNQaJHGS5JUJ+HhrPFKZtui3UmC94zxkODprYmR6kRxNE14afq4JON1w8e60FEtm5ql2BO8neHlnxNGyTc/5Fu98KLXloNC5mPfs7bM7myMk6Dcbjc9kFzrdtpDYxesVCW+o6emdMzWJjgBTtZbfGGVKIHpvBs8iUJXq1hQtGtzJ1Bonq4U5IpSOFYigZpD3MA1vU9f30ajGkAGZMUf5f53vfCUWzKhQxF3XbL+dWm3SUThI67SOcbYLwG/3zl1IxtYcFNV0hG2Lv6AJrnGfDiTEhJ8D7kk/gTw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QEOSOBSj; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QEOSOBSj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::608; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLVn3vMJz3069
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVmmxFDmQGlShl+ymQFRT/JPJysR2MslvC6D2mI+I3nA4ioSb0pDtduy1321xxSV5KH0B1TOILiH8lK6OJxQwz2PKyxbXcKzXBCk0KtgnJW8Srp0++521T0KMzYIRZ4S4Oq/SMMJXS8P4NZ9ZaCG3cI28xYBnj4Z6EgQ66aHH2RxAz+jwJH8Q82vTvhaEwLcsN/Wl+jeAcFPUeU1jwsxxbd721nRWzLTP6+y7u5WXsuwcTDKoeb7abi0xfAzy53kWUwLwPZgKA6JgRgJZZ4XtzEqiH1/ElFDImuIILEqsuEOcT2IdF1yr+R2CljjHAk49mAG34tZu90bEAEUj4FWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEFbyC0lMn6OwLYqycgeqPjm2m+4kKyC5brQPD+r9gk=;
 b=vbjJGkD18n1yCgcaOym+1GdoxrqZ0HXDWl3+stVdNu6JJ33HEcwgo8HULQiFmCmB3+r3plrBS1wrBQ6BoqpzeY3MZppXWTBVl6Fer66BNn/DtoxYbCI1XEnr7kWOPBmij40cdTr79aj3fWhNxsXMYukQvLq3wy3on5zLCCgLl9b6Iuc/2q+N/TYUk2BfbHYnfCd9LzytwhnxlpYw8QF2YqkQyQoJc8V31tY7BUw/fUsNoDiDDUwhRAuT3Pb1pF1b1+BoHizmTdDRCCowFir6GDwoxlykcm/mSjTjTTQ+4jjWlS6vLSAjZLqxBPK3oaqQKiP9gral/LLfbCzrhEioiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEFbyC0lMn6OwLYqycgeqPjm2m+4kKyC5brQPD+r9gk=;
 b=QEOSOBSjwnr5Lcz6BzqLlpNFM8nOIWsRwAlgCe/lVYU5JroLHbcdZWFSNUsAbBCycEpqzMu61fGSRX4IEtAC8jzWEX60dJl7OKOd4JWTyKXHgkdvL7hLpGfixbivjwjlNrJxQ75CGXgXbaJZx/A3T/j/AiCuy3uYwuvVN2iTBgO9orWfLdYVB1s5xujH5cUsa3dtzKHnhy3jLTA1mZAFG6IrBCXZmdfBnQN3ORMicnbyYIPQk5rqP2/ymXpjb+oEJ0JYA62rkpwo8cuAvr/8tDqQcna5oDBdWMHx/eWAMzHsEVWK96wLNsa8fArhNdjNYxo0lhJ6BzvCOuePfGVFtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:30 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:30 +0000
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
Subject: [PATCH v6 net-next 07/14] net: enetc: make enetc_set_rss_key() reusable
Date: Mon, 28 Apr 2025 18:56:50 +0800
Message-Id: <20250428105657.3283130-8-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe25c13-4297-40c6-0094-08dd86461ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KQxcEwLabxVne+FRIF9VpoMb8gBAVpDgBppa2oYbE59WmODeCwZDYeZvVVWP?=
 =?us-ascii?Q?OKdTVHWVbtngTErWWCOgjcVpCqKJtEtBzQ84s57VDIsqSoeAuTX26eZKXutB?=
 =?us-ascii?Q?4oXomkIYVWSbg7JoI2A/IuJVhiBcgKf2FFM9XQNLi2QR7ZlEb6Uz0azssaBX?=
 =?us-ascii?Q?J5JHh6eNDLthf3vAtBrtauZJ2rrFu4F71qNcIJzgPqQif/Oi5E/UDo107rej?=
 =?us-ascii?Q?MyiC1euuqqEpx2KRO5pCp9EQc2ihw7vATHkhX3pSh4tiXr7ssalHi+fur69K?=
 =?us-ascii?Q?rE82YECfN2pUFQkjNgnqxnZW1m6wBI2uMfJMHNprkAEtP7HmNsqvMlnOVdtE?=
 =?us-ascii?Q?rnRMFMAf7EUP8IloHdKqyTSk1yRcSnxpoEASqEb53OTk4t5vIwd5QEp5815g?=
 =?us-ascii?Q?TWUo48HUhXsIPmZVXpKo7OfSbyN9mecF2njl8a+gRCoCYh5ZdIMY2IO9dLaK?=
 =?us-ascii?Q?q5/5q1/ZXx26En9SSQXvVvMq/LDzwCu4rXSLT6O4MxHoc9PTqA32+A+mZpKP?=
 =?us-ascii?Q?cM39HTBovjMrYUIBXgX/0KwNlaroNYMr/aDM4iObglLFK73OMfgjtIIyWnw8?=
 =?us-ascii?Q?WGOQUaWh2mueN4N7SYorGG/+Xk+3Zaxc5S501hhX6omzr8/3xCg0jCKF1ct4?=
 =?us-ascii?Q?010qqroMiyG58nzJlwGFfDbPyVH8ZUx/6CTDWxCRcIsXE/zIG0vypsziaiJs?=
 =?us-ascii?Q?B1O24pWFcLmCwf4nv42kQquZVK4j9dlazRIwnRisdCLTwV59JlazAZOx4PoM?=
 =?us-ascii?Q?mp+kC6rJJqAl+y71HoNhiL/SCRDABzyaSApPRk9/qA6JSjx4ZYxBbUJj3Cdj?=
 =?us-ascii?Q?NjoyDbR2hK2uPxA+/AAIQP4hXGywOVB3e+JhgVHaCnMr9BudT/LzQSdQl080?=
 =?us-ascii?Q?8ZqVmisMej90DMdFFFIuk4r8kEb/phaMMAfUXMBcWNGDVolp6nzUzfQfkbk2?=
 =?us-ascii?Q?kVAWHAkXuvjDrk4m3A6fkTtfRN0t4t3ODRs6A94wMv1dff1CGn1ldudHFsZt?=
 =?us-ascii?Q?9nr7rh/fLsLOTWBi4K0RmzEJlwL+kXkdtSra1Opt0ayUtxe6rmLLasToHBWX?=
 =?us-ascii?Q?KIVNyV1e6nvQnmnqMuka+/cuCETRCRUPDmw2Gas6LAKaxyx6YhT2IhZS1Wuf?=
 =?us-ascii?Q?EnwddKkeu7CC5KKEkFEf6x87y9yPgu1SyMFEGAZ1278J3ECDDS3tiW3vTB+7?=
 =?us-ascii?Q?QyczvaRo63X9mM6YnscfS+nESJjJg6vkR11ehjMY4eV5Ug6yLx1wJteDVQ1r?=
 =?us-ascii?Q?w0SxcnqIgLIIW8gOeIiFAEnzw1O3JNLAfTTxxRliJfeR6nXPh0WpMwEA5PpR?=
 =?us-ascii?Q?2UwKsDbeAN6MkUxub+kQZcmcCOCJ9LUryf5QjAlS0xiFB93ricUGMq3gvGEC?=
 =?us-ascii?Q?fGdMWL47mPB2AImikV7qk04Yc8iHtqM2yzSrSnBvpet25Oq+ZWFmfAejpRRm?=
 =?us-ascii?Q?T5KaAFUFTnx3CtzJ423T/TqxmI9o2GEza2WyguTMg/WXKFAsoCVE3A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/k7OwMz1KrtchAeDZvCEYQrm7d7+aaiqWXwB6kCY0wsgGYJ+sAl2/XtG5Szq?=
 =?us-ascii?Q?hQ5gqiPO0mK5+r+86TBN4c/Mj2ojM44XmHe4QT4V4uamo9tYmPelvNWaBlJ4?=
 =?us-ascii?Q?pIflU7FyF7DxTAFFWmrG7DX4U/fIQI6IUy3GOQ5C9XZC5kOd1JOfbXmC9g1y?=
 =?us-ascii?Q?etLsDKVCr3AmL2kn7CA+X7LsmXkNICD58FMuEKQHpcyVjavlikLbvAoYAPIZ?=
 =?us-ascii?Q?WTAV8QEoILJf1ZpXZvvdQ0wUtd83GbxgDTBKOKirDGoq3fFspw3a3y8nGk9g?=
 =?us-ascii?Q?N0OQvQIxMli09nb9SE4kRfO/PAEEaGA7URnoZHqjkuNWuLvjAeCqWr+UkLF6?=
 =?us-ascii?Q?HiVlwZg6YOpLQo4WHphno8+Qv7gdp5zlWQ9k3eLQO60fy0ExtfhKwdhX6EYe?=
 =?us-ascii?Q?PkLbJ9sSv4wKs1rfxAW8p/QaZRZobtoyqChLx8eWjvgGa2fiCg4uMwjfP0PF?=
 =?us-ascii?Q?tP4uLlBNdB5e7iH8/zX5DbsvjfDO+xH08iCeKlNIQCw94Jw8HLFrT5PGymbm?=
 =?us-ascii?Q?AwVszKLemBZE9e4Snaey6I0TY3wWEVD/ZIX5GP6FW+q21cEpG99QjtO8NNQK?=
 =?us-ascii?Q?72qPZjz70PQd4VxlaKTwhefIabxhZgpaRPbOMnFTVqOZ8BXnzxj/86eUlHx9?=
 =?us-ascii?Q?R5iKNSOLc/afK1v2Y0aSqEugy8Ymatk1IF6orGb1VRj/f7S8agbtgIJevxBR?=
 =?us-ascii?Q?ju6U/ytdhOA2HzRxM7uWRjuG2rFSbGgBs8lfK6FvBn44+35Kkm7kYZAsPHIl?=
 =?us-ascii?Q?US10wpZihBskP4nw26I/bndO5d+zB2b1uH3+ey932Wdyc61FQ5rM6mR5bLAt?=
 =?us-ascii?Q?yyAm/FWojMPTsfELInoLda2tsJq+ZGg/p/JydqTgJuMa10rgYnifgrn8PHu8?=
 =?us-ascii?Q?2C+cDtAItLcxBYtT6xIody2ApUgZmar848yhdji7vcqRa2FWiZEeq5WNniQh?=
 =?us-ascii?Q?gzxjpXsZnm/ui/GOUkFw+9r5hMZBooFI1CaC7adLjkMxot8vAi/oSDjxrB1i?=
 =?us-ascii?Q?lfQdRA8mxnOw7HMjywlgvuBwXafNEWMEZ9R1wgeT2N942rb5pQ81Ek8CSdm3?=
 =?us-ascii?Q?x2uxS1B8AZouLPG+1vrPCI9Q3CqCQqpZyagy5T9M2q+F1pDeAKtLYShKg0JX?=
 =?us-ascii?Q?Iqvttc9WAiM9MdvYY5zru9fQ+ZlT9+e+lQFs0effvJT3kpaLMVWEay0C/BDD?=
 =?us-ascii?Q?0ly63DYscalxalN1Z4Iv9sPGPyCpzoUlH3XdBGH2XC614ShUMRP7p1ysRhom?=
 =?us-ascii?Q?jvMSZaoi32JOJ4seVXzJPhf2fuhfWA1pqpBodeXisHyP9wJZVZo2YZ2Jp8f9?=
 =?us-ascii?Q?bfKSUsgWZzR3ZN4WjAAOZQnlJzJIuZ6vNoNOeXveA8ES9+YkiHNKHXGbhPg9?=
 =?us-ascii?Q?9jP9JajFMJhiOZHaz4VZII5sCjwmBa7BFVBsH5YFp8GO834LM4zPP6R5VfYy?=
 =?us-ascii?Q?GRQFUeTXsq5b3/H3TGqa0QiMqvTIdZrIUtkl1RvhE2soYIcjSoeav4SzKLLv?=
 =?us-ascii?Q?avWrGfI4eHSip+GqcPjdSj9FGRy1086QTER3cG+JfDHD6SDeXyYUprvQrDCF?=
 =?us-ascii?Q?Iv5m4iQV+5YymxWD4MoJsjaIi665VwrIzaDTUShm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe25c13-4297-40c6-0094-08dd86461ffa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:30.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qt9ycP8ZbsESBAWzEw1h5b/NkJE488j8QKTHdVCRhU4Ltubjdymeglp9flEl+Z9E1b6zaefeUgas6XgMKAUhTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the offset of the RSS key registers of i.MX95 ENETC is different
from that of LS1028A, so add enetc_get_rss_key_base() to get the base
offset for the different chips, so that enetc_set_rss_key() can be
reused for this trivial thing.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
Add enetc_set_default_rss_key() to enetc_pf_common.c and use it in both
enetc v1 and v4 drivers
v6: no changes
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +-
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 20 +------------------
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 19 +++++++++++++-----
 .../net/ethernet/freescale/enetc/enetc_pf.c   |  4 +---
 .../freescale/enetc/enetc_pf_common.c         | 10 ++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  1 +
 6 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 786042029b1e..e49c1626e7e5 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -537,7 +537,7 @@ int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
 int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 		       int index);
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes);
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index db60354ea8d1..d2a414c28c21 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -418,24 +418,6 @@ static void enetc4_set_trx_frame_size(struct enetc_pf *pf)
 	enetc4_pf_reset_tc_msdu(&si->hw);
 }
 
-static void enetc4_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
-{
-	int i;
-
-	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC4_PRSSKR(i), ((u32 *)bytes)[i]);
-}
-
-static void enetc4_set_default_rss_key(struct enetc_pf *pf)
-{
-	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
-	struct enetc_hw *hw = &pf->si->hw;
-
-	/* set up hash key */
-	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc4_set_rss_key(hw, hash_key);
-}
-
 static void enetc4_enable_trx(struct enetc_pf *pf)
 {
 	struct enetc_hw *hw = &pf->si->hw;
@@ -448,7 +430,7 @@ static void enetc4_configure_port(struct enetc_pf *pf)
 {
 	enetc4_configure_port_si(pf);
 	enetc4_set_trx_frame_size(pf);
-	enetc4_set_default_rss_key(pf);
+	enetc_set_default_rss_key(pf);
 	enetc4_enable_trx(pf);
 }
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 5c51cf7ea439..33a91babb0b2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -677,6 +677,14 @@ static u32 enetc_get_rxfh_indir_size(struct net_device *ndev)
 	return priv->si->num_rss;
 }
 
+static int enetc_get_rss_key_base(struct enetc_si *si)
+{
+	if (is_enetc_rev1(si))
+		return ENETC_PRSSK(0);
+
+	return ENETC4_PRSSKR(0);
+}
+
 static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
@@ -701,12 +709,14 @@ static int enetc_get_rxfh(struct net_device *ndev,
 	return err;
 }
 
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
+void enetc_set_rss_key(struct enetc_si *si, const u8 *bytes)
 {
+	int base = enetc_get_rss_key_base(si);
+	struct enetc_hw *hw = &si->hw;
 	int i;
 
 	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC_PRSSK(i), ((u32 *)bytes)[i]);
+		enetc_port_wr(hw, base + i * 4, ((u32 *)bytes)[i]);
 }
 EXPORT_SYMBOL_GPL(enetc_set_rss_key);
 
@@ -716,12 +726,11 @@ static int enetc_set_rxfh(struct net_device *ndev,
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
 	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
 	/* set hash key, if PF */
-	if (rxfh->key && hw->port)
-		enetc_set_rss_key(hw, rxfh->key);
+	if (rxfh->key && enetc_si_is_pf(si))
+		enetc_set_rss_key(si, rxfh->key);
 
 	/* set RSS table */
 	if (rxfh->indir)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 8dabb80ec04c..8f2616fd83d2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -515,7 +515,6 @@ static void enetc_mac_enable(struct enetc_si *si, bool en)
 
 static void enetc_configure_port(struct enetc_pf *pf)
 {
-	u8 hash_key[ENETC_RSSHASH_KEY_SIZE];
 	struct enetc_hw *hw = &pf->si->hw;
 
 	enetc_configure_port_mac(pf->si);
@@ -523,8 +522,7 @@ static void enetc_configure_port(struct enetc_pf *pf)
 	enetc_port_si_configure(pf->si);
 
 	/* set up hash key */
-	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
-	enetc_set_rss_key(hw, hash_key);
+	enetc_set_default_rss_key(pf);
 
 	/* split up RFS entries */
 	enetc_port_assign_rfs_entries(pf->si);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3fd9b0727875..0a95f2ac781a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -341,5 +341,15 @@ void enetc_phylink_destroy(struct enetc_ndev_priv *priv)
 }
 EXPORT_SYMBOL_GPL(enetc_phylink_destroy);
 
+void enetc_set_default_rss_key(struct enetc_pf *pf)
+{
+	u8 hash_key[ENETC_RSSHASH_KEY_SIZE] = {0};
+
+	/* set up hash key */
+	get_random_bytes(hash_key, ENETC_RSSHASH_KEY_SIZE);
+	enetc_set_rss_key(pf->si, hash_key);
+}
+EXPORT_SYMBOL_GPL(enetc_set_default_rss_key);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index 48f55ee743ad..e07cf3c35001 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -12,6 +12,7 @@ void enetc_mdiobus_destroy(struct enetc_pf *pf);
 int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
+void enetc_set_default_rss_key(struct enetc_pf *pf);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


