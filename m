Return-Path: <linuxppc-dev+bounces-4602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0437FA00436
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYRq6krxz306x;
	Fri,  3 Jan 2025 17:23:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885415;
	cv=pass; b=ZuQB1DfnGVmTwkk2GriOJe26HZcZjPxfTG5rgCIbrq7+MNpi78r2rznrMqo5Hrc0zwL7TAdn0SwQpybGc4ndIr0iZNcmsySL8dHp/s576gEkCxhgK+Qk2ZhB0RvEZsbnNhx4VC4xyGruHROaQT3qjtauN0t4vrISo15wBecVgWgUrAVzuQFy8mug3qiwi3+AoaO2ZV/fJAWSKzdx/zUpF5OxwF4Dz8aI9hGWAfvDjj/kwY2ud5WQKEKNKeklBbbw2+A/Y2XcOh66fk0PHH5S0joaDBZ6Uj1WXVluKmVFnDcxMQE6JGONnUSQyzR7DkwrmEGLiQPowp0IeBPE16T/4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885415; c=relaxed/relaxed;
	bh=Frje4D6TNqQF+pyuj9y2OYoAXlHlQgjqBjLKkPyV0UE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H0DkrRwkJAU1BftPV10JuB+C+FOzxsLwYGR8o6H9T+trmWWRNp9BHkPxNbMJ8lyhB3G1nkcb1sLXxryeZ+dlEKRr/MgabGQc4+a+lOfK+hAzWpsOaplcOAS8bPOi2XP0P86lrg9LXMj6VBq0vvnx7yBnSOWjWNdkEyIey2S1GgIcuGJ8OmjAD4lo6GeZkCzfKyWtrsem0cJ+ggoi+uihyS7AwSO30JG8dGNi4eWR52oJvAEy7/ZPJg+ARlqME99VQ9Sycs0BPdkC+LNgkRokDVr/6fa7zGSV4uyE/OD+WbDf8fLZ7pBnkLhJdJo7QWS+ZDIinDI7Otbm/oF6HoFk9A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QRPBYAMM; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QRPBYAMM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYRq1qHmz30DV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRlD2OGbEu1Ud5kyTekjw/wAFS4EmohBmfY5OtNyoe4jMwpMqU2pH/ubOjGFoPosDrjowdtJCc/hf1H2emTWDsIWl52VdoNBQnWz6D5rYWcQaO5MrUr95N91kzC33pOi3DJnyMLmc5bxVtqa0Q3zKirLPKou7nYEOf+P3lYBztZtoM7cujxgFhZ129JuZkqGufvX4zgPYiJ+VZnpO2YEWVQwhH6S2f1JYVEqAVevL9pyv9HQAMNXwZsxxML/2FCfvo1WCDHcJn/Tj4IeLcrZZqVoiAKj5rL+zv1caEDqsTaeWfd584EwwwqgG/El+lbk10lwXh8mB1Vh3jTWxDc2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Frje4D6TNqQF+pyuj9y2OYoAXlHlQgjqBjLKkPyV0UE=;
 b=iYOmMNn0YNfr+PGxNGahKFsA8pkyjni5zrTLgTbmFRMaur0figj9LIaFEZTioLthOJUfR+s3J7ED99hNTp+pAW2OgDNBCC0Y86rwa8SaT5rC/+ZLyZFB4c+FFwZPI6KC1rN/m3qIHLJQLiG4zn/NKPnof9jWMFFcY9K2HSipeg8A5nq9ZOsNaNDuthtCki8cIkQmaILGEs+qdz+uAxmt8yyz+T0mtxCw1JcW3yHv+SG3RdpkfjGq7oMBJ0VLtqQ4qNxsk6hS2JtT4yDyqqfAvf/tepBuxCfT/da1dkcwWjyhnAoQxV6RuUFzhVyIk5EEzbD3Tu+WRGX8r6bXKfT8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Frje4D6TNqQF+pyuj9y2OYoAXlHlQgjqBjLKkPyV0UE=;
 b=QRPBYAMM9d1aI/WAmLrWQORu723chsLUYlEegoojc8Ldj6cZhw4itczjo/o6PrIyYJ8swNXqLTJJryFD1mJhC+m5gA34g24gfjZLcOaUrVPEmYVPs/x6zurL1ts+r7l1hZBd1KGEO5kspXFDLUgs+Ik5Vc8XjC93fQEU72lMMTF84/h/NhJLACS7xOyKFKSSaB8UksDVe5dfJIXuxtOlYLbxCmLReylsdNNExwDbiy3oMWUOFbiHykXke5JI7BZ66ukAu0A0peE84+m9zh9/trAmIjg3LS3Em1XbVJ3kF9ot9W03PI/llIjLxFZyEZoy54KklQ3DRKlKOjr4BSUK/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:17 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:16 +0000
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
Subject: [PATCH net-next 04/13] net: enetc: add MAC filter for i.MX95 ENETC PF
Date: Fri,  3 Jan 2025 14:06:00 +0800
Message-Id: <20250103060610.2233908-5-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e287a3-9d51-4a0b-f214-08dd2bbf1c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nVF5ybJovqumJB8Jn4amt0SPcunZ35DCMXFgSzmegxMZNlWYALUkWrTXvYNa?=
 =?us-ascii?Q?QIGnRTTaQOkNlUt6dLnVuMSfaGWXBsxxkBs5xCO++UZUkIund8Zhhyck/IhP?=
 =?us-ascii?Q?lXsX0tdhG86EGILrwqq5LFbOB7ZCzioSvOCvDqStgIb4ytrxRlC0aFcWrhjW?=
 =?us-ascii?Q?WUbAdx/dtxu5EU1D1fW49iIh4tJ7KJjbx8fsvlGBRXUM3MBqPp0bqvNifBhV?=
 =?us-ascii?Q?aoDZVB4vdsISpKti0v6getBMIgjWs1EdtsPJx28NwEYnFujuIydKaarq1GHL?=
 =?us-ascii?Q?P3kESznQGEjxAHAke4VaMG5kirqAr24UqPr+nf51G0ZNZbrjbvqZMP665eRh?=
 =?us-ascii?Q?yI3H5vKbXtHQofYzMjYhvAAphppe+RxqSRJWfwkfdvZ0bhU3zCt38zS6eDSf?=
 =?us-ascii?Q?K0fiLBDTJwoTVWL1KwTtPUz92yuFRizdw+9cx0dwMFKIBXZkf+UsalsXXlkw?=
 =?us-ascii?Q?Qb+iXuWm0QnNromXY8c6haLHj03QpgLa28FrvWYVEVY8HMVZACs7/at8jkF8?=
 =?us-ascii?Q?bqT0L3hz+h7MP9qr5c1AvAms/ptFZk+TLF5bvqpI9H8Vf4oy2RiF2uD2+HMI?=
 =?us-ascii?Q?EUg+QrAhaBSfQaeqxxqSFv0JEPQ0x8PvTJJ5I5gOmIg7m5eS0k86LPfJ1f7z?=
 =?us-ascii?Q?KTIddCWto86s3FPbTKxoLuibtTgAiImeW5PPyRFSQp8PzngTBU+2k9xvvmiF?=
 =?us-ascii?Q?ttUMoaLMewPvV0d+KvNLHWTfGat5cPpEYdsvcorr6ouk1xUkQz4hPLBg5P7G?=
 =?us-ascii?Q?hLU1XVqZADg+QlIv3gmSI12wsTG1z11iXz6cqbR+N9CIQujyVFJUsg/F3N2i?=
 =?us-ascii?Q?RF94Szbg1EtcftzXW50jEdpxytv5XiMO1mNpAE2XSK4vqlqL034VW28Wdxe1?=
 =?us-ascii?Q?MozJm1i0W+DRgCq2zYbMK1425VHMs5OxkylVVGUZU4gYdbGg23SyN4WwQD4u?=
 =?us-ascii?Q?iSRaZDnakP882TltjCCTqAzm2FTjWpz1gmvp01FrYhLXSlg0NR5NgTyv3AzY?=
 =?us-ascii?Q?5JVFCJiBcLRZviqeb9FbIlldGD/g+a6mWspBRUYh3KEDhAqvUz6Lo2NXMF3v?=
 =?us-ascii?Q?hJPsIUs/RcCFdEnblFIqeVqtx53bjSIxS02Lr5nNHfbNC1eUFufZXdRbO6D6?=
 =?us-ascii?Q?H/i58B7yvIO9SRXvwGRNQPZ+7AFS107AxX6PX4ZBmw1e52cGOa4y2N+QpePu?=
 =?us-ascii?Q?6lMWe51OfGkXMYu+ubkPD7/5KEGLWVkgfRfQT0sDh75By2SjbFy7J8AaPmxw?=
 =?us-ascii?Q?uFUnIIes+SU4k8v1DBSM/SVuXEFbZDp7OzpjANi6dCmz4qh5aaxQ4lqR5/+r?=
 =?us-ascii?Q?rKTmRqjoCum/UYN0AR4XqHIA8VlIdZJo4LGwgwTqwC4jMzHJkmkx3Jn+dPGq?=
 =?us-ascii?Q?r/XKqhEYTY40dW98ufyczHvisXp8C5Joy3Pb7TrafiE1G/C2kvKhsnV/pFkX?=
 =?us-ascii?Q?fvIn4m4BQZZ0l5NnPZbcg1JCCzbpJBeJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B7W3wsnLbzNLtlOC3bR/frLgeaHqOaugYPF4NWFxBgGSCtVd3CDqkqTU+vua?=
 =?us-ascii?Q?lHqIqsWer60SrrbMwOVE8X7yyTDJr04G1bOGf9pyDU3ibbJcckCAldpCO53R?=
 =?us-ascii?Q?SFChiqCSCsPBrHzBdZkDxmaqbUWfImW2gDXc9DT5zfbK1bPaewRw2k9VtZuE?=
 =?us-ascii?Q?MwygKv0FlXyueYqzCcYxyzCOz2awi31qGqqtIUZHQKXIZoCK/uMf16zfnPD2?=
 =?us-ascii?Q?PW5TR6Wq2sjushZT2yQ1fQgBGZO2r39ToOATFMu0Aot/F+ACFAzr/AJKHO6f?=
 =?us-ascii?Q?ZVHaGJiXJaMzNMY9Y29CkV3MoDErHWeHM6sM2041R7xBkq9uV7KSfCf7knl1?=
 =?us-ascii?Q?4CQ4Z1Or2qxWTgxswTr7P0MW+3hn1PTB4Fu74dgOb/yq3iFilf/bA2rOx8jz?=
 =?us-ascii?Q?Gjtpcy8TsVxUOUAbXeiAy/Ud8ALcAXJz2KlmFEInignn1IZlNxoKu/fb8LLJ?=
 =?us-ascii?Q?IjwN56myozMh8ODpMg+TDisbnxcFcDo4TNBkr1YDVgLOcQMLssdBKK7RcyjD?=
 =?us-ascii?Q?uRthElB1Y0ZiMXHmuNVM6o59/BNVxDb4dNPdLrlRwHoAC8ojtZVY2P3KTsjW?=
 =?us-ascii?Q?ZI62hKlZlPZKs/6H9ojzG0bSPaPC/m5XtF+l8fMbTgIjjlAF/mUFS+TLXmKu?=
 =?us-ascii?Q?VysPsWIVsjs+YKviWx/r53iaNzWZYqoZ+ihzhRADHCY4z0Bw67QemjTj69UJ?=
 =?us-ascii?Q?HugBRVuxaI/v3tYLOvkgqb3wxi3qOPCxtOxx6yUyM8wZC9ZmsVJh40vI6JC3?=
 =?us-ascii?Q?cbzILZLJXtg6i4s0IqvXmd4q1vmIeHyyiRLyzTrxjF6o4DmkHa2DtNSoVDjO?=
 =?us-ascii?Q?9sIERO6+v3tOG66gjCd7RKPdMgTVnZKaSvqkiL2BeaMCOQ6eHRvoBznSBr6X?=
 =?us-ascii?Q?8eRbkYKOrrZor7LKoMOYbuFid4XwRqx7hbSj2tWMtiV7poqGzyh/ztNZO6mm?=
 =?us-ascii?Q?9nhffP+tHPmA86ZB8yqNQv9zEVy301ekQqQJAWN/pzjnIT9jdt0SXlzNd73u?=
 =?us-ascii?Q?xP2z4vttKPwV+ttTAU5lAotB5XtqMNCxfYR6Bdbs3k8YV4ZPH2yIeiJZcylz?=
 =?us-ascii?Q?mI5rwkIsC5+DJvvuL0VibQci7PjVvijAXXV/fKZMgxbjURipcqgPHgYR0Xip?=
 =?us-ascii?Q?TDUdCaEKxBouoOdtwrxzuhx5JLDaSYI+WptoJUHyx3sHkSXvu/nKMJN4hlED?=
 =?us-ascii?Q?AvCa4jNheZFIKRJgsDITuQOxgmu8HpcR63Ub/lXOPUYIH802yACou+b3CFD5?=
 =?us-ascii?Q?eOeTrZenT7pi0vcG2KtDtx37gks9pu+iK0Us8ii+H03wHiTDPyL+pDnkER2i?=
 =?us-ascii?Q?qbHv4jFAs9RORG4C+oXtLJB1iAP2WcrhssHmvXA174/7DQgBMFwNlPuYdPqQ?=
 =?us-ascii?Q?nQVKmpkCjVAgRqB6Y45A+JC4XbmoSiEN6LhYxgudOYFHEh1Xf+KSgULgZLMS?=
 =?us-ascii?Q?ItS5wLKyrXSBax9XjBJS8a2NSLJsHJ/6QZDKvQZpe8T8wyE7qfUf3md5Pyz0?=
 =?us-ascii?Q?ZWb1pW5LO4a/JTni2B52Td410/5uvjhIiV7Cd5rq4tcDof8yAVsI+VIfMaep?=
 =?us-ascii?Q?TNnFJ9WGQARLkZ5ATrJBpKh8kfBDVuNWkvKBTC7h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e287a3-9d51-4a0b-f214-08dd2bbf1c11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:16.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3eAsITxdAZxRBx+6Q1v3LWgzwMLMK2WLb4JJxPRnvxByCLO2K6APKmgQsCIfT71APaXmhBd+SuyLE/Gl5vrmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
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
index b957e92e3a00..6ec849949267 100644
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
@@ -755,10 +1154,14 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
 	if (err)
 		return err;
 
+	err = enetc4_pf_wq_task_init(si);
+	if (err)
+		goto err_wq_task_init;
+
 	pf = enetc_si_priv(si);
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


