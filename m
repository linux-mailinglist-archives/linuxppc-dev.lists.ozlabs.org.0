Return-Path: <linuxppc-dev+bounces-6869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095CA5B8CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 06:57:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBjhG5ffhz3bmY;
	Tue, 11 Mar 2025 16:57:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741672622;
	cv=pass; b=hhBg7zGb1gU+MpgbPTcS3nte+PpT5DhW6I1VSwQr/AW1JJgIKRDF27cIjDKYDqBQXDlXdWg8hkyKBBA2g4y/5GKUsap2zDwJOmTryw5lIn1jQVQuv2S5QPdOImfwIFNi6G2Sn4+XwuvbF7Xsc6j5wshp5ClFS1Mf/aSmQsah9CLLvgLzih6qXEtLFOnx9FHbwFBKPrcgAvPd+i3IH7Ap74j0/m3hgMtNdLnmW2l188JaqXdjRWrUuXtyuCG8lOXQQD3mBPkC5QmegBQnM4r9AibXsXqAb8g5AZ13ffk9bWCMcilklPvQYW+HIxbOThbeSOhpYpXxYICmgSQNgMIiOA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741672622; c=relaxed/relaxed;
	bh=ks9GIO6GtrzYt1TbMCQbs5B1G2hnYgLQq4klaXlrlTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RxnZMlJyma3yb8IraQmQTMJ9UcMvuunJ+E4NnI1yPQ8cCbRd41kOGBh/QeLEtLLcXl9BovyO6bAPwZsh7mZyaCeZ3D5mlrYcAppiot81ihu8eqT9KvzAnUWVPr6p7+hx4bRzUm3ZUxPFzZ8Wb+z/kc2CLQ2OP3MuSPA89AJl47GG64Vl4qD/YUcVaDfGa4HkwKlNKz8ELTlNQgX6uluGcW0Y7/vrMrgqcMXS99SkMrjvXajcvQOvIMcXu3hr6aHXjChseVUi6yZ9mNHiCSPT9TfCC3iWQ3KsFFlJb4mNehZ0167hU2wrag4CJ5Rjm53hsNcjCykLWD70IDC2R9w4sw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NGbqFceW; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NGbqFceW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBjhF6w41z3brC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 16:57:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVPgsBCidGJl1Q2GW4hVFP0SbQFW3QofcIMhrV+liPjplCA3ZA8oXv2ddENt/1C4HghhH5VJyjMhfNCh8GdoaF51c8CCO8CNKMqkmf/jyvIHGVM6NHO/35XFvuii3QcWc41zlUBCYcCMuNknKNecAOpZ0WwTC+0GAhKXmTEOfuCgiQRQ5KvtNL2YTryMGBR80/+mhqZFxngzwmctiU5PVyd5b4qCSl9oj/mCOMyQIcD0fC5DoD2ir99xC6qB/TvR+zxjKk4NiouRe4pVSbXvbcCj1vq9BDo0Cal8Ezb7cTrzHZY6ynTekW8t/Oc3PQvSxeuSQHeQzPnYcYNFgK8ExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks9GIO6GtrzYt1TbMCQbs5B1G2hnYgLQq4klaXlrlTM=;
 b=I+hz8QSWvkeuuXTX0T/qGDhkAiSZcpWceH+W1Pr2EU15slfz7+MUa5vFQm07q6v1ie/guMuvPkB9QFTW/pjiSdMQ6zRmglktaI2HE+5fgrOxJwSdxXjmv83uHk/Ya7EzvYL6qpuf3Ik+tvgPFMoeNNQ9BAzKVtaYKp6aFUW7tP+fUq16o816gr9JFttZllb4qbl75RnQuN4P6loEM3aEzDzwS0InN2GCpddc2NEyJ453g57PN71n09fTeKisAG6pYqHVA7xN9LbNcXiVunzD9b7FyGv6pBtFym+IPRmwu9nNygUtiiBs3/h62TlCGUlB+ntpLFHRxREHdl9nnqhLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks9GIO6GtrzYt1TbMCQbs5B1G2hnYgLQq4klaXlrlTM=;
 b=NGbqFceWT2NkIT3w4ye8DnoLy+C/9GQdc2kG4TbQ1nIZYdiQCSuXVPeEwqwxIVsaUo4bBx4dBpe9Rf6mVGBw0FECf6AJbyMDMubWJU0CO32/HuSYiTButRU6ErrZn9LV/NpzkJehjx9Ak6fR5FSXViGZv7TNwA/hWwW2k+GKtczQTtSXPhHjYPRigLUv840WHpdIFzMFZSETEEka0GJYbGw/uOFt0vr5QMMnwOMhA0TGfGfJJzuU+ky95cRVeXiQ6Dta09bFS23Cx80iJZhtsaFKArS/V6hRgq+z7t5Gmxj03FuPAbBx9xpLRw9kQlF/ga2huLgaEWxl0qhKRnzIYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:56:44 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:56:44 +0000
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
Subject: [PATCH v4 net-next 09/14] net: enetc: enable RSS feature by default
Date: Tue, 11 Mar 2025 13:38:25 +0800
Message-Id: <20250311053830.1516523-10-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311053830.1516523-1-wei.fang@nxp.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1595f987-311d-41d7-d056-08dd60618085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UIw5LvjxJ5nEo3WafE3Gcnm4fz8hyxcgePQamarq+8RwDGC8lkMwEL5nEtcc?=
 =?us-ascii?Q?5xa16n/qK+tihVGmg2CN2vMOdiuSjiZGSBKXQNrawiiRi6P/LQyAf6WM9HA+?=
 =?us-ascii?Q?tqeRH4i7PTc9U5bYDSIQFEZJly0Tey96hoB/gz5tNaCA4OSayTIrx4MFo1jg?=
 =?us-ascii?Q?6cPccqr6t+w79csH7cUbNPPvy1Jb5wpdHghyv/3mFzMMfm6NPh1PU9eBkcDO?=
 =?us-ascii?Q?uy6W6W38cRWYy/iP9C3DiXKMAOtzGb+H5KA88P+UDHeYvDGxuRvUO+pr9ClW?=
 =?us-ascii?Q?VK5KManAPVl6wHx+uPdyfBpcMe6cyE+htVksKH9WfOtbLztWPxb7Q6l4hVdl?=
 =?us-ascii?Q?EJfayOS8FNgarftEvAf5htVLC/VbwmBO0gT+u84gtvPv0yVaX9qIh4i6qOen?=
 =?us-ascii?Q?jb//DNV1nH5JrsZixHJkQZRHgXAseT1L6Ny0QApqcZ3vJoyR1AyEXbqkJ4vG?=
 =?us-ascii?Q?GCukI/J+oqT0l6jBmKc0KSFHzZQJ2LE7arnA15cwluFdorHR+/38LngrEzFy?=
 =?us-ascii?Q?ipWKGpSpzzwSa42I+E1dcugMM+wsYMEObiXooQ99ET2Fu2HD662Z9NKK35D1?=
 =?us-ascii?Q?SHQ4PpdlCxizjY7RPLxURqw9CQuR7IonDQeBZq7duyLJIrUBIu+wvMpazsNL?=
 =?us-ascii?Q?xN45nV1I9ti5sFE+OudLA2yIbx9/0PM1zOIaIXRYbDCrAM2B22PWvOPgJHYt?=
 =?us-ascii?Q?7zuu2zvb/24AIUPI+qFQqme+zT4pgE5lHaXgv9SZCyDsCbgQq/HonEdk6jta?=
 =?us-ascii?Q?CPEFvAG4mm0EBaKpHEolrtB1Tcgp8upVSxJy7DSeV/p7bKtkMfg5pPvbVW0s?=
 =?us-ascii?Q?HBTnUpPSDaFQpo/TRDum3p14pDYB2dAmg95ACOC6PEt0mGmM9AbXPYEkhh2+?=
 =?us-ascii?Q?ZQm/Pbzf2ZtF3Yg61WY3G097Vo1QvsO8vlqFrRTnM4SJQHByOGfu9vQmyDO2?=
 =?us-ascii?Q?zDsGfNpleH2xOBBgOEx0nzR1J5OnawTKzffJSpYQeYIDUblo4AnzerzDHPTd?=
 =?us-ascii?Q?/gD36XxEBoJMV3C2AbZK7idMhPHZfz0reO9oqcDyaefwpZvjJ4uLmykCB8IR?=
 =?us-ascii?Q?h4Yi6BamXdfJiZ2yjU5BrpC9lF2JHHxOgpw65QiIZTfS7tIPV8w6N39noTqM?=
 =?us-ascii?Q?hlShL4+RbosnOISUCVnYoQR0P2ta2u+5QDlZKZKHVwN9ySDC3HGUHXV8S9MM?=
 =?us-ascii?Q?KhwB+WaeK7gxS5fqPsA24oWsBphpB39FA91H1DiDG42gMStELmFkYJqetcB3?=
 =?us-ascii?Q?Zci+/sUOsbzUBcRL5O0Vx1UVG79+9FVi97h8okdEFwyl9acJ0qhO/z1zeNvL?=
 =?us-ascii?Q?JRUwRdp1aATiMu+0BW14TCGeop/bcqk8vOYeSaByAszJ06FBVfjME+edyINY?=
 =?us-ascii?Q?yzJFFKM+gG4OMERaAgK0U1R4AnxCFRBNvq4l/VDyLqSnlqRrQK4sd7574/gZ?=
 =?us-ascii?Q?BTRkma003qU3SoXRK8RJWsf+RvZ2BgHu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+FXkFs6Q7qe7teAU0+KZkpTtdFd+mWow937Ll6LM9jADAy0x9d/4OUm5TYIQ?=
 =?us-ascii?Q?mtKAUFRD9MC9e0at94tv0s35+JaaHUapIt99/aaAVaJ/zC8wDlgT/cWgMBjM?=
 =?us-ascii?Q?I3S6vaCglyKsqCX7B9kwNwYQLtMMg0BXFXjKHRU0YQgVSZbHWDO3hTcbpGel?=
 =?us-ascii?Q?5CZyaW153nKSn0x/Vpv1sGyKL75Z8AQbK/Gs+bn6vzH93xmqInDeNt4SbtEW?=
 =?us-ascii?Q?o30ZS7pmPDiEgEEVFWcUCl04bp8GPcAB4hUa2HLatYNqUgRWQzGyl6qlpXJo?=
 =?us-ascii?Q?ggc2OKrTzB46cWqDtY5BefLpS+TiYZl+q/b3W8Slv22V5wngLiNmvMlX8eUM?=
 =?us-ascii?Q?8LdnKnfIrYFTJoYKuAbjL4BdI55Qwxbde2IwEq21YjNJJJPVIRcLtiz72xgW?=
 =?us-ascii?Q?eS7mpZ+9McnvBlNnu4FM6PzxS3LcJzKhH3gdmivAUyszGi/iGR9XOBxRuP/9?=
 =?us-ascii?Q?TtE3YkVKieRHggZLMwE6/DZDnBykIfh/zdxpeX0etD2l9FyIZ68uhaCjFp5E?=
 =?us-ascii?Q?z5b8KTxaaSTX7y7iLsHDb9Wg5nKi3xUgOaLZ2FUL9LIR8vqgoGgv10sUlfQr?=
 =?us-ascii?Q?mKtCdeCaXB94rhU4oziiaxqSozho3+Fs3rdjHWGN5dmCMva0mx68DFLHUg3u?=
 =?us-ascii?Q?xg0mILshm/cyV3bW468BGCLp1JE0eXm9zBKJpQMGysGl98evmHgn6UOOuYdS?=
 =?us-ascii?Q?7kVLFNtiy++f+JsoqHBIIfoRKrHvND8veUaFdFtQrjyXOUFxX4irfDW5vGRl?=
 =?us-ascii?Q?rhIH3vgdWbXGkhIeS5BTp1N4XrA51rpJAw35bir40qiMOXrDWnYgxI5rb59H?=
 =?us-ascii?Q?MyWjscd8B8ABDB5Jq7MQJHjndBd2LnD6OKyRv+tDFriYrXoT4BFnDrTRvGgl?=
 =?us-ascii?Q?1xdbzbVgMP0RCseKfpuNmwVPzU7t5QRlwkKq5MERAZHd8zm+GCnUkJ3/EFdp?=
 =?us-ascii?Q?63OjnVwk6xDfD5LVpnIqPMGXVuakSQOVGJYww1hwoWtbY6eLpIi3izKtjuxy?=
 =?us-ascii?Q?7pU+j28AeXMsGy1GtmU3jm5kZ/HLomq5A1uaNcPsSugqdG8X9PQELUVZAHT2?=
 =?us-ascii?Q?6q8Y48CkyXgz6ebGSjYIqysJtYqmhM0FKlpV4aRcewhg+ne/dFcuzQr1CHw7?=
 =?us-ascii?Q?oxRl8tDuKI6FinJvzLjaGJQVx829/+q496OLwXa976sxVCq3Xclb7Zyo7DZx?=
 =?us-ascii?Q?2Di43ghlqR8GsbfJtZ1qoKyUiys4f+0Qm0GGIp36Vx3h/8spjguVnQ6/Pge0?=
 =?us-ascii?Q?cCdboa6ppGbVyD8r84tSBEuOiWEII2wtn/7qETR+3pVhWUZZgtg1GxPacTpq?=
 =?us-ascii?Q?2LlEwi9m/HarijacxoHUCn6B2vtEk3uJ0wifjwlj01T3YqWt59v6ZGbOWqn4?=
 =?us-ascii?Q?I0p6TYfBeuQtg7yC6XWU3GgXppDB9cWyw5/zUcHm7v+8t9Mruvi+BZ83wiMQ?=
 =?us-ascii?Q?XDK45HJ5gnqOcY6r4uP1aHXtBESm5Wjtsgl5Qyoy4BBIGZ5GYc0Ee9W3PYJK?=
 =?us-ascii?Q?JXSJsEvKN0ztjE/bmo3UX5Y64mA2hFOZBXu2W/wr3XowT/IiyQY6WKmLksK6?=
 =?us-ascii?Q?16HN23X9kEiKy/Qzfejx/rRz9cFzv05T8z3VWgcp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1595f987-311d-41d7-d056-08dd60618085
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:56:44.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fm5fFQdHa6MsieWPK7LZNFijz6ZPypHEpMGpE5ouuSODY36K2bFHfNNN0A2cs0AdsvNGIqgiUSdapVSCjnqOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Receive side scaling (RSS) is a network driver technology that enables
the efficient distribution of network receive processing across multiple
CPUs in multiprocessor systems. Therefore, it is better to enable RSS by
default so that the CPU load can be balanced and network performance can
be improved when then network is enabled.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 35 ++++++++++---------
 .../freescale/enetc/enetc_pf_common.c         |  4 ++-
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  4 ++-
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 5b5e65ac8fab..8583ac9f7b9e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2420,6 +2420,22 @@ static void enetc_set_lso_flags_mask(struct enetc_hw *hw)
 	enetc_wr(hw, ENETC4_SILSOSFMR1, 0);
 }
 
+static int enetc_set_rss(struct net_device *ndev, int en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+	u32 reg;
+
+	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
+
+	reg = enetc_rd(hw, ENETC_SIMR);
+	reg &= ~ENETC_SIMR_RSSE;
+	reg |= (en) ? ENETC_SIMR_RSSE : 0;
+	enetc_wr(hw, ENETC_SIMR, reg);
+
+	return 0;
+}
+
 int enetc_configure_si(struct enetc_ndev_priv *priv)
 {
 	struct enetc_si *si = priv->si;
@@ -2440,6 +2456,9 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
+
+		if (priv->ndev->features & NETIF_F_RXHASH)
+			enetc_set_rss(priv->ndev, true);
 	}
 
 	return 0;
@@ -3232,22 +3251,6 @@ struct net_device_stats *enetc_get_stats(struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_get_stats);
 
-static int enetc_set_rss(struct net_device *ndev, int en)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
-	u32 reg;
-
-	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
-
-	reg = enetc_rd(hw, ENETC_SIMR);
-	reg &= ~ENETC_SIMR_RSSE;
-	reg |= (en) ? ENETC_SIMR_RSSE : 0;
-	enetc_wr(hw, ENETC_SIMR, reg);
-
-	return 0;
-}
-
 static void enetc_enable_rxvlan(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index c346e0e3ad37..a737a7f8c79e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,8 +128,10 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 072e5b40a199..3372a9a779a6 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -155,8 +155,10 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	ndev->vlan_features = NETIF_F_SG | NETIF_F_HW_CSUM |
 			      NETIF_F_TSO | NETIF_F_TSO6;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* pick up primary MAC address from SI */
 	enetc_load_primary_mac_addr(&si->hw, ndev);
-- 
2.34.1


