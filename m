Return-Path: <linuxppc-dev+bounces-5128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A99A0B162
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:41:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm1P3jysz3c9N;
	Mon, 13 Jan 2025 19:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757641;
	cv=pass; b=hOAtMzULwjxE5aDWMRy6aSLLvo1zqXUex5eHT2kCTCkEYtsLNZ4SWA2NtLhpprkkvW0I0ptj3nDEfVcSvJvnjRkTcjWjR85AkluP4xXQusAdH4GS03w3apjQh2WQuv84G8ZwvgsVG/nSjb4P8u9Ktmy9yixYnuhecKhb3LoL0jBDUlTbynjoyru60br0R85NF0eoy6XoIsGI757T+BmFiNpEv1tu9KoRUJlSg9fW5hKp+WrO+dsLBeB7b0EWKyqtIHRUBI4G4JuRKbac0XkcKVyt3uuKo9bDgyghj8JnxWMKCIi75h8S0tAEobF/NXhNIL5HSs4YqGrcER+eL3TGmw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757641; c=relaxed/relaxed;
	bh=SKmbdyjlUOnASRV1UUrBtrrn//m7/BQBjZhIlweh76w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lDlqRKnFliCLfTE6kucMb5PdXuzuFBWwQIMi8tj1rDUptbueDKGZbYLFvcKrV0i5wOE1isMqtwsxn0e6nShEhFDc+aqPthNz8DXoe5s6fmi4Ls7RcYydjgw8gsBhxYK4Yi46FjHuifpVnBDHDC23BYVSovDnMD9o/6PgZ6b5/SyRZYZgfY8yEi7QZroBSO7ej6K/SnjCxpYYKMJizMVLdZPN9KrUT9urwD/zB+hWZR3/TXJ8/wvd+3KA/tSAbcL6DZm1sTI9oiYAKZIuuFjusl8GWMShCrw24y/PnFJdhyF4Arda3uzpJ9aN0HDSA93DDVAB5+Z7uZK4bE/8p/aufg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LVJCmBe0; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::605; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LVJCmBe0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::605; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm1N1bTjz30h7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPtw7Ud0kg8HPBRCP+yLtEeMPjWyZH+rsOceqcfBWeKjsd9oa5PEfS78X2TwrQ/DphPa3bKlI7k2zl9ZMw6Y7cch5sJW6wBJ+XJhFa5HFTezz+hka3A3Lw0R3sWG66ylguiuvvminJ2x63LflnRkeF4kp51EasyIZmfEyVy0ieVoB1qjQK/4mzmdJIUvpuOiTy3UCgtpi/YRfFoa9brBhWE8eZzpvrp6Sv043Hkm+NgvpCW4vfTTALksl7tB3d4hZANTrCDuj31CB9AAR1EkQC2oUsPQ8b8ZEp6Mup3iiQWD3mugIerLdoGfQQq8xwtLWpmRrVMUkbutCG/vRWC6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKmbdyjlUOnASRV1UUrBtrrn//m7/BQBjZhIlweh76w=;
 b=CHoG+EXtszDKtn3TE6di+Cs56iBt5+se6gSSFk/JB8rwrPHID3YyyB27HS3vPisHUrTXAtAphvK/+chZtqUZ+0Xj49wwmplP5WNvXmKPNfx+MGMRGQZY23srx825r26M605jI44/ymL/czA3xiXESLh/JQNFOQnoMJMIS31+66bTBR0IbmbPrBkvCMHIo16WBnWDqo3IAl88E1wphRNUcpdqWL/xD2lTvK9aBQZfnKuOs+Cm5sYgI2Ih6Onpa8bA1KpIwK+hbcn0tj05jgwzOuLkm0laDWkXperpxp5m94/l6POLdYkenM4hFQzLxTNAlnq+YkUm/BlvPqXAxLRORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKmbdyjlUOnASRV1UUrBtrrn//m7/BQBjZhIlweh76w=;
 b=LVJCmBe0VM/CSy8cvvnkO/AGaVMVyRaxEnvH7M4Pexn587//VDIQUln/TLR+J/n8fxfGHYEQNIxjXCmOugyEtSIL12iSHaKBwgHpmiu8oPYprhnLvn7NecsAsxM/qgx4T2Y+nU0SkElgcbHfW0wVVqNxdtLYI4LjCQF6vIDN2TJo2sxsn6wrHHeJLhIKA3SyHyNa0pSKY1AUIS5YEBi4jykfnAV9A8yEu69VTIT5usYecNSES2zvH4Lry03ozSvXfEveN86H2cQHci8VIbR9lKhmqMkvYhIp+wlz0x4fYnp9ZFB/tBO6OuE6qDH7jDG3gNNcQmecxCTZRkG7pzpCRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:21 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:21 +0000
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
Subject: [PATCH v2 net-next 08/13] net: enetc: enable RSS feature by default
Date: Mon, 13 Jan 2025 16:22:40 +0800
Message-Id: <20250113082245.2332775-9-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8059eff2-57cd-4f89-9655-08dd33adea79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f+pqAaXNmmGBK85XP6H6C/Dm0JfxzEYfmZ8/uIZyiKndBCalX4Q7RwE+Rc9J?=
 =?us-ascii?Q?wjnxLg3m84mWRTwiIZQuNFi0ejJtVbZW8HsKXpmCQZiw2/fu7TASL9OP+KT6?=
 =?us-ascii?Q?wmy7OMFG5UuacW7YGawu4fTIF2xRcJVtxL5vo8LtxlwQaXCuCHxn2z20dIpN?=
 =?us-ascii?Q?ZWn70BQYZuloVGywPHLaMhOXK2vnjbYOFSZuHet3ZzUTrUyDx14kwKosu8NB?=
 =?us-ascii?Q?JxERb+amgyrYAFCuFBD196/5L3CCFygrJdctujkjIxtOMduSt3cKFEqj6Zn3?=
 =?us-ascii?Q?MMbaQFa1soYFEF0ZiuJXTljAtTRTZ2FPnW0VyZ199PcbRwwkzQVihgX0+0Wr?=
 =?us-ascii?Q?E0M4M/Do3iuvLZcPz/1RGzUdmeJM/HlT81InHcM+tRmXJt2D49u5qumlPLtc?=
 =?us-ascii?Q?k9yzbuMQaKXRrPwOj0zva+Zf8okios79pH7uZeso7QMBs6yIIbszRVJ5DTIu?=
 =?us-ascii?Q?093u4mGNbL9rksTaNq2clJaxCrEZpL+NgHVH8aTI7IkLE1Yl6DEDOJdU2HAx?=
 =?us-ascii?Q?pVzvE/75FPLjvKowHh1Z+ZiRUb515euCHjuOhdwW+ceS0MbupmqWxN3l3BmU?=
 =?us-ascii?Q?M8eNp9zsbamJfb6I975xe5cuwwcRCwxlo0L4vykbNNKmhboLvAL/ma+6odk8?=
 =?us-ascii?Q?mvGeDA8tN75AOPuRRAP5Zv6aNn1LWZpbocoB9VASxa6OYRvppIVQMUmlOiet?=
 =?us-ascii?Q?574tN3ADjojWcTpx/e2ukDjzsaElbbSb4PfuQzyA2EIaSSDI/3/ViH/HRJps?=
 =?us-ascii?Q?Rq4Yg3egmRbpQb4Z+4QmG07EUhhKsjicEQVfUK266HeC4Lnq63ySAp/LQlaC?=
 =?us-ascii?Q?58YGnDSKMtznQNAca+iRe436fAZL4OjHdIbHYjY9KyOSZDW7cGxFmbl9VCcA?=
 =?us-ascii?Q?ApfC4cvdI150PB3yTYRdx4s4rBeiLpAWka5MNqt5nL7Am9YZSBcdvGiD9DxW?=
 =?us-ascii?Q?qwH+IFJJz8e8uGeMEo5soRimC2RpUsnOiS9Ql3wQepTvSwBNC+eUC9icyTgo?=
 =?us-ascii?Q?1nw5SgGv3KTk0PSeDyhbTCBYnZX7ME26/Q/sibsIQzgWNqsVxpcvZ+jaeRBI?=
 =?us-ascii?Q?QC6iD0d1m7xwfPSaQ80hxQggAFrsmt8/ZzMzocR9yZlGDshTvnWcdM/BbQ/+?=
 =?us-ascii?Q?bgDu35SSxXpGq/3//Gi0fpKdbTlIwzwXkPtkT+jmGD61hI0/bRV725M898Ms?=
 =?us-ascii?Q?GMCIPWzQmduuE88alY+3EI02yKRGIF3wi9aVyZUTZ7GkJEMF9S5ajetZ3dG2?=
 =?us-ascii?Q?17mkTMyb9wHT8EGgBkEoBvnwyEwQUNfzqlBeT3mnUAUaqzBeMH4iSAr5o8H6?=
 =?us-ascii?Q?xpkvcvDATjcfg8yHAXnDdObK8Kbh07a+aVcMiLbMFWwBRSRFxaZJVaPwOhwq?=
 =?us-ascii?Q?rAOaTaFtQsWow6qXMv4nT2wZRrL0KhnUz036N/ILj4hOLPrso6i2srvCa1bx?=
 =?us-ascii?Q?/iisHu6eMHobJUe9a2OhIANqLyNx3RW7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?StEYm2R4ZqSS2rpqoRL/5pp1i8pgVe3n9DDGjVCWpJ4SukFg2VaVX03PwxL5?=
 =?us-ascii?Q?94fzGdLq7nSiXtj/1RfEFZyi8z+3Z0HHScCYjNpviuAxDPnoZsZHSHakWQqH?=
 =?us-ascii?Q?zd7ohWqAUC6rzdJWEKXFTO4cGIFhY43aslJ1fFV3VPnLyRZmahCONQpD8FGU?=
 =?us-ascii?Q?ZEXC5ybKpSU0psVYfutaGwDBUQwcbpNAtCDoopPxQaCyKt2xncBT6psIrUxD?=
 =?us-ascii?Q?FYnkaKl9MWcvIUZJa1UBQa8xf+3ep5VMKNDOy+aYxejsrZPeNLt18yuGwW6M?=
 =?us-ascii?Q?hznNUwSWn/oe7TnPTcLXPnOsA+EJkeEkjVBSLSEXtL+2SOTy+CINs8klszoQ?=
 =?us-ascii?Q?Bruzfgh0fZPILuwdZnamLSOLpu11fA0yvHqu61OAQDNqT/yC/KqBIISe5v/N?=
 =?us-ascii?Q?oVYjzzAhnuWM8xzZUZkExsTHeI/5KabKStALaJrt8/VCt4VnesuMSVIM5VSj?=
 =?us-ascii?Q?zx6JCTzvgn9WwJ/mZW7j2EIEHscmZ06a+HlcrXPlV1kuc/Br1O/SqbiNRBI0?=
 =?us-ascii?Q?A6r+S329oKyEPHyYAtDn5ZPHHw8EyAc8YZbr6plq5nmKWURx6kgcNEOSC45W?=
 =?us-ascii?Q?L9xyzFR9ht3MOPBL3QAWslcJqQ3241da9FPzTJ1V7ue5qYEWWkIWgMNW0tSl?=
 =?us-ascii?Q?BZG8hwTFpN8T9O6kytmwx6VivzekubQ5wxpzHnVEsOWiXUYN9Vcs7Lvjoh8G?=
 =?us-ascii?Q?S89QUGC9OMNa9m9ww2olBqBvoy+YXEKE/PPuiH+cOw4GLCxVf+R7eBdD5+fj?=
 =?us-ascii?Q?sTU4NboF8pq4fhyXdWz4auqH/KD9zGf6lzsC2sPywwXLEoDDd7QWj12Uv2/s?=
 =?us-ascii?Q?qdkZkdklSmHWoL7uPVNfrP9VkKlLiwfHn/6i5oO1qCfXCocD4AQ6l/DmdNyB?=
 =?us-ascii?Q?gfZaEFfujoAlVPWr/2xCDJ1u/MsOK4ovkvTVoWtv3+hZSW3E7zKI314i9/re?=
 =?us-ascii?Q?qYDd1wvImqRB5uWmh3/Bt2ezKJG9v7lk/7eMGlAHXWFHPgl+05Fmbxq+lmbe?=
 =?us-ascii?Q?TkJroTZTvHOEx+JBDbtkRvIehpajsMTcGdjCdUFN3pTH3aE2dD20bLIEp386?=
 =?us-ascii?Q?0d8CqNb+GsELWRu1ZqOrTsGKRFOKVSa0AKaFuTg7zT8rW+jgr6AMhHNYIkJr?=
 =?us-ascii?Q?RyOyeDvCiPvvOwz3YF9UTWNWzLIExI8P/ROS6nEbB/KwmaWCrvM42LMFcJyt?=
 =?us-ascii?Q?kIuGs4LpJQUETthvgm7ikiqFptNKocLD42Ri2rGGsZ20LJYnProEQS+6FkD6?=
 =?us-ascii?Q?39fkdKnp81ZLgac67CpaOzhyrVGb8FPsPjhn/Rod5rP7wn82mi4M74kbuNO9?=
 =?us-ascii?Q?GWDgJ3/B/iolIPr0MaaCBMHpN79hxqxo7Bp19oOf+OBw2+rRURgRn/V6NDSZ?=
 =?us-ascii?Q?qDhb37S944drTa6D3qsMNYNyGYMQGg77chADh/Xk1GEcI+bZZX/qXoiDIFsM?=
 =?us-ascii?Q?ygh7nWSQWPoOzaA1m0VwpT03G12+ph0eab2uIrO2eeOuGcN33hVESUlCVKBO?=
 =?us-ascii?Q?on7YZgwMYyd5g1u873tfZRTffIkbD8w8r8a3YhmLq+ocU77JGRUQd3Tu6gRY?=
 =?us-ascii?Q?zKPOHcZsgu5K+Q31ozwXgx0qIBT4G64lMM7Qpozt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8059eff2-57cd-4f89-9655-08dd33adea79
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:21.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rsi54Q5Z+MgDI9jBNw+uFsywRYfKBxdLh8iBCYtPzH6YTukhAbGUJGf1UM9kPq9E9sTGfGzegdw8JUS8y7dJVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
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
index 233f58e57a20..e27b031c4f46 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2378,6 +2378,22 @@ static void enetc_set_lso_flags_mask(struct enetc_hw *hw)
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
@@ -2398,6 +2414,9 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
+
+		if (priv->ndev->features & NETIF_F_RXHASH)
+			enetc_set_rss(priv->ndev, true);
 	}
 
 	return 0;
@@ -3190,22 +3209,6 @@ struct net_device_stats *enetc_get_stats(struct net_device *ndev)
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


