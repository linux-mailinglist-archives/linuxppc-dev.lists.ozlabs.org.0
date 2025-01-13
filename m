Return-Path: <linuxppc-dev+bounces-5130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE5A0B166
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:41:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm1R32QZz3cXf;
	Mon, 13 Jan 2025 19:40:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757643;
	cv=pass; b=jF4jxQ4xf1dIa7SQaU8S3eGU5QStU5WehdTvrmF91TtGZ3126IyC3exp1FUeZ1dFHulo8GXG2D9688Z9N0qJscT4dZ+OSH+lEbkrXvy/GzLWe5/sFn572/Ez6/OkQ29S1FWm7qBCJ+P+zlnQKiK2/zk5x6mRzFmrojOssa9678JJ7EvIBxJL/rpaJHrlNeiNEBaX91k0nmunDhwbqNzkBTTrOM3WggyXOnbQ60feNOO6pJUraG0C9K+SjHo/+nWRewkbMOa8lKe1hxvRKT5wOpeJtyVY8yqGL9dD8PtV/KWMIbMoijkhD2fFOi01PyOlL6Q0/UBrZgavuD0c6RTb5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757643; c=relaxed/relaxed;
	bh=IvI+Qtevc4/gpebHs+HCKRERnuaKPkBcj1HPAJ3Rn4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f5XSLjyUGatijVyBDixwF5IHVlzx8NRRiZ/XE6Kr4NSx+UUh5LSDCfsBPayIKMLgktpT3f/tdtUD2wnh5l+GhrG15JUJw5lnQhrOrjrbh053BqU56uKCe1/rXAlb6aQiMB+dI0HCnsjT/dH9ojnntY03+FsKf2CF1ivZJQV0GH1iBlDuBQ909o8yD8lS3SxSi/aJBhC9RhK78kZ+iJw61j61PT+ZWle+Bs3UfRBplN41TjDebfA6m9GNLQpdzj2R9IMT09tpp3nWK5I8tlGSl9KTyd5h7h+kCAgNlVe3bAo0MfB/gPnBUJdMy9/Rw55qYl5QcS+jgJedS2y55rffnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KKfWa/OT; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::605; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KKfWa/OT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::605; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm1Q5PgKz3cXn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKqPprbcedSh3F5tJgG5KbcXcnfkUIlnH/DbhvqEet9N5ttLpD21iNeLVq5TQiPK8t4aFeXf8X1Z3Yk8mwVS3s/hJgdkMnQSHahUDJebriDhXMZypkFU+N1t+ZLdbZ/HW3UVCmrwzANReikygCBb0rL0vrGjLuly1nEreW64v/9ozu2VASfsiCTkDRU4UmKBX7HWHarq86rK4mM9rUgtaMZm0y/iL/sVZ8m8dEz1dU7QeoR59Xt2acWHZ5yaNYMNQ4cZ/JknpEGtHhafZblaSoBLIv5JBzw25iVXktSLxKV63fw83Z9HxWwsAtKpxyN+zKnCz54AoMptzCHF3aP2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvI+Qtevc4/gpebHs+HCKRERnuaKPkBcj1HPAJ3Rn4A=;
 b=T58mI5fGuJ71egY7DadebAYb3py3jobqUCUSiPyfFabAS+0NsPLEADbN5/WUDDW7Pa4Fm8TifznS/THzWncsnVaNXUS6c/v4ngiHfOqFgj6LZBwD9Hva5COFgeub37f0uVSoH00JNTlWuL0W9xYBFqxCLcbC4dUYJ05OPpRXyeoa7KyGTz+Z90d6qU313PxAobULMylleRX17dZXvqdbox7Zp07voD44qfdZxOk7Z40TDETTQIr9MWZIPvVcOfLrmifKglHHnyNvZzyWnrM0uqYJMRo0ki3rRmfk3wVcQtNnWBowAp+nLWOOWht/cKjFNbycPniaYRE0+/4sRYbqiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvI+Qtevc4/gpebHs+HCKRERnuaKPkBcj1HPAJ3Rn4A=;
 b=KKfWa/OT7PdRlBnMDRawqa6pNgZDrzvyJGAfM/aDXurvWPab5/ecAFcLi9ZKsfjqC63kYqvbqJ5v/jv9konOd9Y5fVRIHM826+CTGQ1lRNl0bXLulKbjU2R9g/fycnf4ikojdrWb/hCqkb+D5hrD4i0Ulfnv1ZSXrG1wX9jYKwiwxfdCOoA5YnMQiPaEaS/mYt9g2jee9Rt7kAfdobejuRwMrIy2hVOOPKLHGQHSHZbwXVcyHNI6rMNqac+p/tQUMn60n7ZPoBe1TIsXsOE4wZqKnWIzaSrc87J0UPMfL/bSux0FmuQFZZykFyz47xAW3Gtb2d7GJnoZPLaRAhBCrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:30 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:30 +0000
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
Subject: [PATCH v2 net-next 10/13] net: enetc: move generic VLAN hash filter functions to enetc_pf_common.c
Date: Mon, 13 Jan 2025 16:22:42 +0800
Message-Id: <20250113082245.2332775-11-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fd2b7ecb-8c06-4215-e7e4-08dd33adefb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PcoAgewiCkF5V2gmC1hrtPpxPyZkqmFqaP3/MrpU7GPIIrSxdo55BuUse0c/?=
 =?us-ascii?Q?33DsnjrMuwyT7WyvYnXMgCcrdpzM3AFM9lRex1chnoqtQDFU4uDiP07+LaKX?=
 =?us-ascii?Q?Xh1SvC95LE2MbQQuovHaBq588KDGehJgXan2vJWXu2LgAY15KHuJA+HhuAfr?=
 =?us-ascii?Q?mgGAm5gfnUvuMhixGdRKBtagFkzwNa82xn3FIx9BClDWS0Zi4VO12xIaqEzs?=
 =?us-ascii?Q?MeaoWcD4OHaSSy/xV6AxdGF8WNBx1ZqvJAsbVxuBqcGyW86wc0nzZ3lhFhSS?=
 =?us-ascii?Q?Cxk+On7irsgbDV/tnIjrbdb6yQnViupG9PPx7wugb77dF1icXvv6xjhSaw15?=
 =?us-ascii?Q?/J4leU0wk/mCcU+5R9Vj8tTQ0A5BYZrKJNEgftjHCBbXsVXnAlwqZrNtXNpI?=
 =?us-ascii?Q?mZLZHNRcFU+gXbrn2lT6ckoqigpJLp2DTVF3vCZaDKmuhE2T3TTx2PCiTojR?=
 =?us-ascii?Q?Xq66RKxkvvJImrE081mSniJSTds5Ne8nwRF/xi4KKMJKOvBrTjySxGQnbzP3?=
 =?us-ascii?Q?QG+s23hOEqlDMbaudQZFxZufD5wDuJ9pIRGds5ux2TtV5Tvob+YDQ/wLATc4?=
 =?us-ascii?Q?eS4fiIXj2/VVrDF9BIE/KgURgk2QBgdZc8SZsfIKPzXd7PJmQmK4X7BpRPOE?=
 =?us-ascii?Q?03EjM8JGM3dOrxCufXdeHd04jI0FAoex7rETzj9bZDlNSjQAkfWnD1JCtT2A?=
 =?us-ascii?Q?eGbddIYlblhftyAV+u1bdNT0cLurUf1cPk7GYo3JaMdGEWo1Ss0wJbGP7dKS?=
 =?us-ascii?Q?x8jeMzGH7NYRt2WKDxC7mpD09EMlDXOBCIIdbuHX8rsxrsGhZ1zoBFzmIcIe?=
 =?us-ascii?Q?E22Z+d/JYLttU/5H/Sr8QCMYU62mMMJKvlfG6DWKdX35WC+ZfaR3BD4QE3Iu?=
 =?us-ascii?Q?zPqEri1S4I2E0m4Lp3s91ydqj/h8l2UAcQdDWynVV7NkpgdK4hRytJsuAHUP?=
 =?us-ascii?Q?9Y/gvNHfPINRtvFamq1XPO9D/rvUt4bYHUrOpBYfYccE8uF/JcsaNqWD0OwY?=
 =?us-ascii?Q?Lp2BKs+cjKPTfq39UVyxnXK6qlw5FbnxgX6hDCK0IFQDhGt/IT70fzDHlsWc?=
 =?us-ascii?Q?hPijrrqGaTwE4PG0RQah5AjXApTKnFGGoEtqdgCv6kv1Ze7OJM3E3eGd/C+7?=
 =?us-ascii?Q?SN61fXolbxuaBpBcoXgysYdzDf0PpdT9niIedr+cQMS/f9wwvcEY71lvJri+?=
 =?us-ascii?Q?KA4dPqmuD1P7P+LzV20AfApdUARMwHP2DAyvzAvGHoMlcMoOYwXN9VL/Rw00?=
 =?us-ascii?Q?5PD87UJJ4R2W7kREY5Yw8p8P3458y2r41LkXBh+psIoOzpeUs3g5J+b/4hZr?=
 =?us-ascii?Q?2V1WzS0ohehCxLeao/3oOjSuaV/8XwX6xnj5yos3CAmvzfswj4Uxc1t0MP0k?=
 =?us-ascii?Q?UCXAjNN4tniyYdEMt2+IRAW+DIaWvTr8fQvpDPMnD17z+Og71H0+2GY+V9px?=
 =?us-ascii?Q?zJsJlRzJEzAp0O+TUGmg3Se8QosRrKGx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A0yp+A0yHeSyeX3gq98zy8Ol03o44xPNUV4K57frIheO4mmaL2NjUrEkt5t4?=
 =?us-ascii?Q?leSlfiI4K43npPzwLjCDfWWj/aMxaGS9DDivL4SkGLY64xxuXTrx6Ly+icTg?=
 =?us-ascii?Q?HLxnh5PokPU97ll15NWFNQq7qYfmzHy+BUjlW9emDAU2/aaSZ7/++CNe7u5r?=
 =?us-ascii?Q?wtWSb3Bo1R9B/c/iHJHdSxe8bHrghl1EnzG3HIDyLxZJAbNQCP73F9shyOor?=
 =?us-ascii?Q?vns/d4lmN3/AgVkzhKQHcaJ7E0vBhDKquEqSfiBqeKJQzCkrh38DSbO6za3M?=
 =?us-ascii?Q?mxkDqzOI7w0k92edqHv6XxnPicSO5cTPsvVjKBZUhKfdK/D5FKEcTzFnEZMD?=
 =?us-ascii?Q?t841qCnyJI3pzLm/XHvY1y7Iq+I62JnQ7VmquQTWj02TyIoXP+rwYoDAAsd5?=
 =?us-ascii?Q?9NMRU95BEgnuWkfsdOyHVVNGhZYpn1s0wXAdF3aXRlwKtKfYtlan6hfAXX9F?=
 =?us-ascii?Q?8Gg4bK0EQDSS1J13otrXL/cJRT0Npi7+DY+o4fY5sD0Up0R7kqAXh69T4a25?=
 =?us-ascii?Q?Hv+/P2JblLzUaFu8d9lFX1o7KOzyjmKBMHG9pvFNSfk/ooq8n6yhO/rwKXKR?=
 =?us-ascii?Q?/OnQZEKc9jbKAqcq2xnvvwcSCuxut9TBi4Ca4ag+d1GQ/+46wf0k5CRg4YyO?=
 =?us-ascii?Q?ShxenxIsk7yWgttl29dac8rxDtve/lLIZQNdATnjOckTsS15N8LHlLp+E9Id?=
 =?us-ascii?Q?H97oeYFHoYl6OVJLg94yeOOPwKYYLjwGlXNifizL6yPdi7J+tFpQpvImhvrB?=
 =?us-ascii?Q?/q7tk49XHDLERlgqyECW/QnCnPnhNWR+1f9hVntdRrhqt3nNO1+HSQ0BpjrY?=
 =?us-ascii?Q?hv2kPuS+/5WXzKHxvd2wHAP9R2oo7f/UDEfdf5LHYNNXgPzXuKjvcvhEDCu0?=
 =?us-ascii?Q?x0FOQTVQL0s5f8q59HuHCQCOIQtqXKqBEvCk34nj/UoNdjh6WJ3/y2GrRgwc?=
 =?us-ascii?Q?X0mjyFSKGFmhGKO7960Nq02D8pm0d/dLUYnIrJYBnLDWRkq8uWgNby2f64VH?=
 =?us-ascii?Q?kc4hZtiqTY+UgKvH+E5x6mPlzYaj5Gvhcuz89+NLRwfZZ3q/z1j2g9DAQfuf?=
 =?us-ascii?Q?1Hn5Zu7l+FEIU9tO9xvcmJH64QHt7lEQxySU5A7wRE6hFaGFxvt/euLD58Ty?=
 =?us-ascii?Q?2YJW5RdJ11nFfieTo20iemmrGzfzrlaCZ6MNSAJuDxPPF8SgTd8YdWy1aIf8?=
 =?us-ascii?Q?epPeooXGFX5jXsfjC9TWMpdAqUMhF2vJBo2qX5RTMElOEjDNVKgupu5HeOgY?=
 =?us-ascii?Q?KYX3McURlKnf1Ht6gNc1ACmanZ1CiwervZ6ylId0AL3vnMLd4Sc76dMFS7oa?=
 =?us-ascii?Q?lch5ggzRdVU9AgeTC2xF+Dj8jliYwY9s1w5vGwKsg9X9MV/JgPaEL1++MQcx?=
 =?us-ascii?Q?BRuCzTtVd9+hiJqnaa5b/Vpg6kNF0gWupnCpzUTbvoFOO4Sdb+nbHosd3Xt0?=
 =?us-ascii?Q?Dy0VA7ispJtP0zoONRFIhTSefeVKCEQ+1BjQps6raw4UVlMFUZS6A9Zn0vKm?=
 =?us-ascii?Q?MKdjHMtwN2+hPbc1fkLDJuYxxw2yInfKlxolT+TBCpOrvpWbyYmstIASea/B?=
 =?us-ascii?Q?mz5H66ODk82/G/Ye6B4UhIP2lnPcMJJSIwD+o7Jq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2b7ecb-8c06-4215-e7e4-08dd33adefb8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:30.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbPwafuhMWoLf7pI3wf3ucrKh1C1I8R1bQAB198nYfcyRZmhZlm5dnzvlUQlSrbriPsHdEFJVYm0dwruIvoJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the VLAN hash filter of ENETC v1 and v4 is the basically same, the
only difference is the offset of the VLAN hash filter registers. So, the
.set_si_vlan_hash_filter() hook is added to struct enetc_pf_ops to set
the registers of the corresponding platform. In addition, the common VLAN
hash filter functions enetc_vlan_rx_add_vid() and enetc_vlan_rx_del_vid()
are moved to enetc_pf_common.c.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 34 ++-----------------
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  1 +
 .../freescale/enetc/enetc_pf_common.c         | 34 +++++++++++++++++++
 .../freescale/enetc/enetc_pf_common.h         |  2 ++
 4 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index c0aaf6349b0b..d9c1ebd180db 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -215,43 +215,12 @@ static void enetc_pf_set_rx_mode(struct net_device *ndev)
 	enetc_port_wr(hw, ENETC_PSIPMR, psipmr);
 }
 
-static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
-				     unsigned long hash)
+static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx, u64 hash)
 {
 	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
 	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
 }
 
-static int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-	int idx;
-
-	__set_bit(vid, si->active_vlans);
-
-	idx = enetc_vid_hash_idx(vid);
-	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
-		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
-
-	return 0;
-}
-
-static int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_si *si = priv->si;
-	struct enetc_hw *hw = &si->hw;
-
-	if (__test_and_clear_bit(vid, si->active_vlans)) {
-		enetc_refresh_vlan_ht_filter(si);
-		enetc_set_vlan_ht_filter(hw, 0, *si->vlan_ht_filter);
-	}
-
-	return 0;
-}
-
 static void enetc_set_loopback(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
@@ -971,6 +940,7 @@ static const struct enetc_pf_ops enetc_pf_ops = {
 	.enable_psfp = enetc_psfp_enable,
 	.set_rss_key = enetc_set_rss_key,
 	.get_rss_key = enetc_get_rss_key,
+	.set_si_vlan_hash_filter = enetc_set_vlan_ht_filter,
 };
 
 static int enetc_pf_probe(struct pci_dev *pdev,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index d56b381b9da9..7a0fa5fba8bf 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -39,6 +39,7 @@ struct enetc_pf_ops {
 	int (*enable_psfp)(struct enetc_ndev_priv *priv);
 	void (*set_rss_key)(struct enetc_hw *hw, const u8 *key);
 	void (*get_rss_key)(struct enetc_hw *hw, u8 *key);
+	void (*set_si_vlan_hash_filter)(struct enetc_hw *hw, int si, u64 hash);
 };
 
 struct enetc_pf {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index a737a7f8c79e..9f812c1af7a3 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -343,5 +343,39 @@ void enetc_phylink_destroy(struct enetc_ndev_priv *priv)
 }
 EXPORT_SYMBOL_GPL(enetc_phylink_destroy);
 
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
+	int idx;
+
+	__set_bit(vid, si->active_vlans);
+
+	idx = enetc_vid_hash_idx(vid);
+	if (!__test_and_set_bit(idx, si->vlan_ht_filter))
+		pf->ops->set_si_vlan_hash_filter(hw, 0, *si->vlan_ht_filter);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_add_vid);
+
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_pf *pf = enetc_si_priv(priv->si);
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
+
+	if (__test_and_clear_bit(vid, si->active_vlans)) {
+		enetc_refresh_vlan_ht_filter(si);
+		pf->ops->set_si_vlan_hash_filter(hw, 0, *si->vlan_ht_filter);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_vlan_rx_del_vid);
+
 MODULE_DESCRIPTION("NXP ENETC PF common functionality driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
index 48f55ee743ad..253310859ca1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.h
@@ -12,6 +12,8 @@ void enetc_mdiobus_destroy(struct enetc_pf *pf);
 int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 			 const struct phylink_mac_ops *ops);
 void enetc_phylink_destroy(struct enetc_ndev_priv *priv);
+int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid);
+int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid);
 
 static inline u16 enetc_get_ip_revision(struct enetc_hw *hw)
 {
-- 
2.34.1


