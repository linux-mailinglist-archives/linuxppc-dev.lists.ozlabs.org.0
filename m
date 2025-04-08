Return-Path: <linuxppc-dev+bounces-7543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D74A7FD47
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 12:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX33t6C8pz30P3;
	Tue,  8 Apr 2025 20:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744109946;
	cv=pass; b=GuaicWKReaxHockdeeU1efMnRYmUwjPHfnGZF2kacAv1D5P/WfmE3o9U80XqBz7JTmjbvzAqtXDkZ0g4d88NqUdRcUlcAQVdJRiei9Y+ke8z1gojhfDXF+/WYRYInmx3+7Hwm3lJq/RmeIaq2Oid83cQliYGRO/KSOfUBuXU+DN3cNY+W0t5qrYXGdHH8DX+k4bEv0FRE2PffkR3FUJd5rR81gGgGAya0w3GOC4SPxf9PElZgLZuMhmz3TBN8S5dqj1w4uLE/JbGKRl0wTrxOps9bQ2ZbtX1XRLtQUiIST3k1k8v+3eUBqs/rUzD0Pc23Yxu+tpKEXloqm6OcGP0vQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744109946; c=relaxed/relaxed;
	bh=Kn0OqoenPCp7cVyTt5p20CrCiV/bzVPjJ5OlujjLzlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yyt0nBYujnZ+GO7FIgxViVQLxUZKlZNUFJXs9u1q4xPAedU0DnIBV2NgJn9QU7r4Jf/16xd5kHeCiskL7q+x6siNsN2YWsbFRDpKqR9m54w3ee1Zt3K0ZYq63TAlFTzalr1zWNSrTtZSd0SY8ADLbnabIWOnTVwyoD2eJmWEJJAkw9nFPsjFbEvyH7aMvSIfrDu/OJIi/rqviGC/inDfT8qYLLT67/7RAVpa1pkNOl36rflvfhnu10/UGcOGg1RPAeWiSa/isW/pt94xe59mcGvZmWGyvM0qw3i3fUGFnuCBUhBruVTy2K3rwrkDlB1XO9WZihSW6BJynjMIocHpvQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ldpDRaQT; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ldpDRaQT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX33t0J9Pz30Sw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 20:59:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDMqgaiecRvKfdj8P3uE+v6T27cspKot6yRGP5sLgXejBnE55xSP1gOIsVnVg8hSd1CdoUq+Exf+/8UCdypWo+0kMHNrVlzJZebxdQVyft5LtBEP+0AO7Gw3fnGePrV8dLxWptH7EH/fMvR5yjlagD2WvOay/tD8U0v+LSUg0I/XOh/P1BQZtnCw8QBG99r399h3bhzHC6wleyPCdp6r4aKAOgjlinTcSnTaKLaugw6XZ2BAeu/EJMZuQJEltLlb1cPDPhIO1vcjSX1WOxK8leI+G1U1E7+AFCK0WeErRvMxfC/yhqLxpxnuVT4CuVRZbGRgai6pCvUZ/1gm2UsYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn0OqoenPCp7cVyTt5p20CrCiV/bzVPjJ5OlujjLzlw=;
 b=tX7Sfwg0WPREmnogYgZTaxL2DmrpPSHE09wno9w06FQi1JvO1+AQn6s7vagbeN0mDLZPnczJRjqSbJGw1ihIoHhhN6EQg7XwaJPfpOcIr0Sf3vc90kt0qVBhoC42wJqdznAiIhm2xziBw/0zae6WhckANeRAaqsfxqTm03pxK1lDzaZDQygNuy96sFSbi4MWxQ9vPYj17CgfWadQ3hCykiiK4ZEQeFLczpnKC1hZFvr2MoMVxlw7GBq0nET1p89wZyxfOsEJISXsSDrx7iWvWEe7fcWKgCk0wSdMpCH4No7YBY0yx0G0wCpaRalZidN+YENxrxBKKipz9TKNhKjT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn0OqoenPCp7cVyTt5p20CrCiV/bzVPjJ5OlujjLzlw=;
 b=ldpDRaQTNmdMHTNerh2za2vxLjZxHJqho7l7UMIQ0KG8qvB/pbkkwt4dNzxZz8Ii7xayui2xLaPl45fJ78/rB+0J5Q6CKWH1QgWs49dOqaKIs5JK9p+JYNAeKSCjWpH0eAedCIt7MCuiuXPzAHgNmZTBaYJ2xl3HEOhqABpk+YpyZ8xIOXAeA0jWwWdPZPrNZJYxl8X94mTeOSg4nD0z42gH1XBUsQU4ByZlGXlU4sOV5ZJPliamBC2S0XpSpME36H1hmcrAjsfwfWHBJE0uAcQIPGtLfWCMwq2pE5jOJWv6XTgW8xQTwbE+XnPYLDnsOV+54vLmsUDv2Ws9bumFMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:58:42 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 10:58:41 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	christophe.leroy@csgroup.eu,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH 6/6] bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value
Date: Tue,  8 Apr 2025 13:58:14 +0300
Message-Id: <20250408105814.2837951-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
References: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0013.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::15) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: c183c98d-85e6-457b-62b2-08dd768c5317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ux49HGJKMpQ3Jp59biDBeR+mDqY5ADKDcG3hPW33EFQgo6wnlYeRxeqKIHKm?=
 =?us-ascii?Q?C8bo3EzOZ7ZaPyWAEkJ7kv4ZNm3J4eJ1cJChQx05RwohHQax6QUwgpmlM0UW?=
 =?us-ascii?Q?YHBhicYJ5zZS2ByU+pBs3XZHdT32gjsuCVSLfCHnjc91MmnRowLRvO9rl37E?=
 =?us-ascii?Q?LgVmZhLz/tDvg16KPAIKPW3Y6Qe64zEx8/V7jEi6Sy+x1OLdRi/KO5GWjz5n?=
 =?us-ascii?Q?q7OrMi9BhUnFTfRfEp6g213cbo9hPv94wLgL9Rj3qK8T7s69hIrItpwzOuoE?=
 =?us-ascii?Q?jsuajixpMj+wjXdVpNj94k9qe1yhX2xj/omKo81WfLcwmjF0ICV4Rp9/Vh4/?=
 =?us-ascii?Q?M+yNZr59IbdSY20WYkwfEC2qQqVuC+soYbIUMdkAZzncFqk43qyzYZ2dWJ1L?=
 =?us-ascii?Q?Iel1FRLTr4EK4zjYVwUu4+Pu8meHRLom46MzyzlfDiosR0bJMLZWh9Ghg+GR?=
 =?us-ascii?Q?al9DtyiHyr2iSBHIcLLCjSHUaNnVtEjXbwXcaJFoku8L5oKFRgS75aW1fjfx?=
 =?us-ascii?Q?AcLguW2bMpQHLmX1Nji2kuANqL7XyY9JxqmiOGtTq9J9HRpIHLHa2BL7tgLF?=
 =?us-ascii?Q?8/pvMZP5yjnDRuJ8q72Tg9zgR357WKXduUKqsWcoN3ceq7AW08+GUt2RIkxB?=
 =?us-ascii?Q?SrSQzC0ytxFPik1jZUmBXuWRX3VddGhbs0roOGYX8AKxo1vahtxzILPxVf4m?=
 =?us-ascii?Q?DiGEVMLQAMQ3/3Y1aOHvLajqsPK+K08MWkGYnaVnUD5Keq0wOK6liOTfX2Zv?=
 =?us-ascii?Q?XjXtjluH2ZkFVU8+SkNUrtbB0ef06u1XayrJtEK28h9AfGrzg10Lq4N6Xk1p?=
 =?us-ascii?Q?BGtbmQ8lBitfI1iRt07BisEaCYqmEnvU94lAIvSQMrgp1NLq5ygucyo60g8B?=
 =?us-ascii?Q?BTsb5jNXBo+Gnn6p90pCcw1QM8HNJc0rS3VQebSYWTrL7l0hEr8zt+1CCg40?=
 =?us-ascii?Q?7dGdmkrljdMk5OXb/+IYkRFQYZnrW39GcrxgQeJjIqfvRBOLleqFub+n/8Iv?=
 =?us-ascii?Q?6aHIBNKOD7viXSayi6HuJKCStyiJ77lhgMpQm+6oc1RLRna0T99ZYIWSYI+l?=
 =?us-ascii?Q?xccF6rPTNtz7gKjr49Nc17n+TlD6Co68ZzMyppbQT9gqgtjvHtNNV1nR6Xg6?=
 =?us-ascii?Q?PxgTATpGvl7V2YNZX2O1VyIp5W3Yek8ywA/PDFf7EM4lxiaxWFlM5Wo6HKyC?=
 =?us-ascii?Q?SLx8ENFS3JW2vSix/dksxnhdNUUcrJROK01OjM9a9DkIjmHycqh002HPg2Rk?=
 =?us-ascii?Q?kfl3ooO27ykNYTfp/DwgHowoToM00M2ovWRCA1VwkFQdNBT/BhBCUJmPnMuz?=
 =?us-ascii?Q?CuDButFpXbbPKdvyyIGD1gEZt6r+o8PLiGsbGVra4D7SfXPW2RdtjOohnzoT?=
 =?us-ascii?Q?/hkKviTmH1lulWyJOyzmD90hh/lJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SZYrE2DYb6fOLvzQ6/FZnPT5K3mbij1pK6k9/RvHma1rG7iOkcPXDNvDHiQ4?=
 =?us-ascii?Q?q1OBxMZC+uvKIGZvzGqTUaV8IqxlrB1EVqyL7aaAUweeW/PcDCtpAjNb6Uxb?=
 =?us-ascii?Q?Rly3t83NEYl6EId3nOURdLQ8nXkr5LeL18wwSS7RM0s2a3WxdYG0Up/r2iUy?=
 =?us-ascii?Q?A8Cpi6VfqUwPSVg9ZXqoBYU59iGjvYDorQWF4UxQSvA38ybcwimiwV1vcEJW?=
 =?us-ascii?Q?PgT2VBv5Y7KEBVBoq6n7wwc/pwcnMG3uOy+2jCQB8dpi9evg8r8YvG8xkkeJ?=
 =?us-ascii?Q?RpZuEpC7FPZXWUDtkru1dY5svG3FFStq1aUfCL5WTyZX6lyviKfIM9LYEeDM?=
 =?us-ascii?Q?DiCDpiSXeeo92V8JKMRpOExnPTeJ3+vFDeqLgfsw+sjrtAjN+XoShv6LkxYO?=
 =?us-ascii?Q?rRGbx0tzGqFhzRATJGqPyTpZAd6M7jXnzKC4URr/d8lCfifZGssSfPIHjEJg?=
 =?us-ascii?Q?K/uD0qMhbyHNcNdnrvzwqC+ysPEE+gfKXZADBYWRjuA8cZPh5OcR6YWQBc/3?=
 =?us-ascii?Q?WnBhYTZcaLbM6dH6Sa5KCHvsMoPZxLvdBuwaL1cVE2meCXu8xXQ14EjNO0AV?=
 =?us-ascii?Q?8HRt1YrdZChpwbTYyntOjJ48+6PeTdrE15sFW4VxJmf8SAlUdGw7M91mRTRB?=
 =?us-ascii?Q?FczJRYEKjt6amfz/Mm9X/Rv1jUYul8CjqjuNK20QNDnSmVG/LqJyo3e/YzFy?=
 =?us-ascii?Q?KwkPsk03ZLB+sFQWNinueLrMu+6ix3+h13YaSCRFZXEVxfGNLqjJhu4w2DGm?=
 =?us-ascii?Q?NkOSHAjZFkLEQZObXNnRfWXCbeHVLgUprRvJDj/FXWwzmn48sYSZvJCHiJFk?=
 =?us-ascii?Q?DJJTGtBFKMZRGdV8XVnhtTaXEK7f8Ehm5v/rEbGMoxA3oSqpxTmasjf9wmGX?=
 =?us-ascii?Q?62dY5oM9voIha85AXaJB6q6qfPUo8jLmOwci0LskYh91Hai+P5otnMxGBPaP?=
 =?us-ascii?Q?1+s1pRHaKlaG5aEN4aYiqq4PmpfEByNnr2W760QqbGmAY0XXPzNHp88Z70io?=
 =?us-ascii?Q?lEjvJ65ajT1hKEzNv72ZuKJ10US6MrVHtwhWK0hWZSJfa+J5wfc/eWEyt2ro?=
 =?us-ascii?Q?MIJ9BvPwWiooVCDnQ9lzeOu6ipbCPuWL8D21SlWw/tUOop+/dsadxPR2kpt5?=
 =?us-ascii?Q?M+dUviOp7xYidJ+qbiCcSLh6w5op6JVa0XiVe6vaDX6Yj+JepWhbKFC6VRGB?=
 =?us-ascii?Q?ylnrQOISZbv86eO4wOCsRDh6gdw7Xu+FVHdRFYNyCzl0eVxtG1XyO7A4TL+q?=
 =?us-ascii?Q?CFhwwAsnXN39lS3Ylisok+gi5CZw5ZYSWBz5nJwk4u/9jE8lcoKozrnPHQhr?=
 =?us-ascii?Q?F7OYDc9QIZ8M2TIQvaGcGPoB+NvbMrJ2sNQvS0KBlOTsUXqMUTt2n+4E023E?=
 =?us-ascii?Q?xYroQfbWWeJdKfkhQUmviUmYI3uehKcleOyK0XR4kZ0Ysl6oo223tRwVG6lZ?=
 =?us-ascii?Q?FsrWUY9AqKcTSrpjmA/9QZ857AwGi9I/BBbAyWZo2RDdgYH/dxPN0LXSW8AO?=
 =?us-ascii?Q?r9QbABpbj0mZ+BwKHDJ3sVXmsFgrPhjMqOJnSw3PCk4HGYsr9XyD9hodPryz?=
 =?us-ascii?Q?FydP9dEB+bM8k/miKcg7QAN9P6xqgjH+7SpKIFhD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c183c98d-85e6-457b-62b2-08dd768c5317
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:58:41.9285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLV4C1JAxlRELy5qymaxPYNlgHmunkgWKhoUfwT3DMrRC5uEfN+JAp1eqrAbSq7xcfM50YnpyPbdBFfqaroPXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

In case the MC firmware runs in debug mode with extensive prints pushed
to the console, the current timeout of 500ms is not enough.
Increase the timeout value so that we don't have any chance of wrongly
assuming that the firmware is not responding when it's just taking more
time.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/bus/fsl-mc/mc-sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/mc-sys.c b/drivers/bus/fsl-mc/mc-sys.c
index f2052cd0a051..b22c59d57c8f 100644
--- a/drivers/bus/fsl-mc/mc-sys.c
+++ b/drivers/bus/fsl-mc/mc-sys.c
@@ -19,7 +19,7 @@
 /*
  * Timeout in milliseconds to wait for the completion of an MC command
  */
-#define MC_CMD_COMPLETION_TIMEOUT_MS	500
+#define MC_CMD_COMPLETION_TIMEOUT_MS	15000
 
 /*
  * usleep_range() min and max values used to throttle down polling
-- 
2.34.1


