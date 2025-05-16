Return-Path: <linuxppc-dev+bounces-8603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB36AB972A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 10:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzKRq3vRgz2yGZ;
	Fri, 16 May 2025 18:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747382823;
	cv=pass; b=nXrSV+lvAKMKObWEHLjDmb1+aH8vFUnliu1jZuZMjJaXAGeflkFv4QwiTSiqFxKIvjpop0aFqyAhFByWYZnBrcFrlCXvK/MS1pUdb1l5+OVct9S+JICvKXdTpagCADyKIN6XEZdD77ra7Q2hL/v1Z2jM42yv6d+C+YIfJVERHzvfqZCP1RTnrjJZC8P1DhyoKU674WeGW3rZcCgOErh2BT1ZaU3psgxuh/2fVn4FwrZyGLbkS33Ck+4k7tQ962VLqGSkJH81BcZ7fHFOcp0K+VASMLl8bL6V5synlgzQWhgQXe3NhuFcfyqO9g2nHwABUEuQYq51K1wfFM807rULFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747382823; c=relaxed/relaxed;
	bh=DmHtDEyRMYieDfivjDNfPaJX6DVrir+/DNoyoIQmWz0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Kir2ABqQF/5+NhtCSLjHH7v84c/F6CU2bGbXty4WlbBhown2roQ8HkUKL5vDyVv1cdk6hiB5nfZFEQe0Th7qti0O6ZMNwK2A64vyOhpd1rJyGu3W2LNfFekGy8RTKvaqaaYTgKH2LO2qerWFpZXv8C6ZG5z+Y7hT7USXaAUceUMAmJhLOiplxGc9uZTGvs6ZI4BoDMC2UWRvP5oIwJm93WC6U04uris2kaCM8MkqaFNXclMMI/XatJE2p9HCRTBGee/CI6DHskvQfdjPIQmf3eMI3Ky6kUbUGHgPWOIATm1R3PHpv5T1ohjFxuGXgSNqFMB+bWUYP529zd0FutleGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jpRzEyE1; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::609; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jpRzEyE1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::609; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzKRp0qfnz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 May 2025 18:07:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4cUSPBD29U3SnAOs0sLs8lZ9hT0l6qfZp+A6KCmZMbsx2ci6ZzXr7wbDwiBoklZ4MCFFTsULq5KDMX2rpQmA/u2Wr/j2ZIVCZG7cqP+oRiN6Gr2gHAc/soCmV03PPPOjbRnoGoJqT+zk2ZFBMAwaQp8N1QLUPWcIw6EmwX/zeYdtM0dtBr5SE9VXAAt+UBKkMqP+txbPYnWiYbybCpWBdr5bSVGl5+4tTnSAMRanzlTpyoXgagsQcQN9WKY/bTyHDv0NFcVyYqbfGE6lhVZEwYPEhCqH9ob0vYzN4hwKf3wPfL4MLhnrQ0i54RfH0B4D47UWMgl1wurOCiQYhmsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmHtDEyRMYieDfivjDNfPaJX6DVrir+/DNoyoIQmWz0=;
 b=iUhp2RY4kB1oOJ30PmnVm7h8VMZ34V87KERfdt8Eu2Wi4FyXmrvNKAJbMnH3AnBB6Rrq/DtwAxWF0jokkjJk48R/tFsUPfFRPDG626ecpIACwMihTHbZULOvYOcZRhzqJjH3I/IJqvVCQPSloVdS+cdKwzCPJyTXRUElULZY0/Eo2wvhyhxci3Ej+62VkbaSG11he6mRT8V8AqAh2lTpJTFDbPcbvQZQhQUITXZTpGc2oJBhY36j1ma461IVzO6YBz7tPG2/SpGhwGM/bRJ4ro+NLCnb/mq2fSg27EyAW96jYfGvd89gZhOVmVJJsHfazvxdA87ZDTv5ONeakmWIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmHtDEyRMYieDfivjDNfPaJX6DVrir+/DNoyoIQmWz0=;
 b=jpRzEyE1lFhM95fvI4+7KuzxngZL1M3pcxEM0oiD26PFnwoCNbGEPpUNZDJjJLKZxvVBNuJlpuaZg0Zl53f/E4lOUKJYXZoUG1guDCXd1GL2fqWZZ/UCaMbQJBpL1Bx8y5etFPiAOx4DO8fOkI5nq/ep+OotkCJLKbpLg0YIbynnKAmEnzs1tgYof+8xYzefF6GbGymZpqVu3k7PJQoKtkfIPlovBnqxldYglN4d27etIWFfBYdsl5wg+coW9Iq+XfugyJzdIWhYaNxOEtiZi8zGNN4aR9oLtZLozJcIaHSsa7FfXVJlzi6ZPZ0SlXR7htxY/U7oH6im+hfETn84Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS4PR04MB9313.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 08:06:40 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 08:06:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_xcvr: update platform driver name
Date: Fri, 16 May 2025 16:03:34 +0800
Message-Id: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS4PR04MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6216f7ef-8eb0-4751-4491-08dd945095d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2RB64vemiQNv1I75nKiT7OLWonMO76plPJ77ytDxmhq3B8Fcmoe4mMutAHRl?=
 =?us-ascii?Q?l6L0RRM8lVg6AaS+MZzXVfAjZgp/qgx8ZLC/qQ3Dp0vX94AIUBeQ1z+P2Z4P?=
 =?us-ascii?Q?1jbI+dgVxEELlSdGRBE82lEEcO1yD4+sjgHDb/AsR5kH6WitemYYo1YCIrOf?=
 =?us-ascii?Q?8/43RPkKpIUsKu03G5scoc8QuzUVjgee0A0LEo+s2whiiFLKEcxFzy9AiZzr?=
 =?us-ascii?Q?10j9Lm/BOWYRxILdvHyiDhmFEm15O/DsDYPcFprlfKwwWXwK+FqoojhwZj/J?=
 =?us-ascii?Q?Tl9yqLO7eg43j8U2etKJ+G0dDdO1OKlJoqVT5pkRUe2jNi4haKkgIyLs5IlO?=
 =?us-ascii?Q?VhSIz44KyKsqkjhlN5Dq12p/Z7dGOvkDKW3prSowqsRGv6NkjVSts6nrqnnJ?=
 =?us-ascii?Q?RXyB9nP9mw2wu1UaulR3wt5TtzwvK64PQUFY7Vja2y2NrR1dZsILLf7Tqzew?=
 =?us-ascii?Q?4hloITxKPxzF1/MHxvJWwFEeTz5MXbK89ZboCkG7LpjLSnohReKwro31CR5S?=
 =?us-ascii?Q?du8JCqLpKDmktcKbMVrmCRzZvTYuPMIz50ERJ4i9VOGWE8giD5WCo/YKZ5Ed?=
 =?us-ascii?Q?hdoJJxwzBCg4ono2B0wyH0om3hNYtck++yJmV6twDmWN73mmBWLfuqbj+8ax?=
 =?us-ascii?Q?nQ+kFLwOyCbieIbCbduL9Ipy8i2C81qxhmvseS9CDkg4+wdT8Amqov0Rolia?=
 =?us-ascii?Q?vibjRVQLfAtepHzxoMBLRA4qeqX2S2avpxLICSTb56tivQLe4dDPuEZOrOSX?=
 =?us-ascii?Q?7qCqEeT2e5YN4Qs5QbgGTc+u/f8l10y+10FYS+kGqdcePskVTVmCWFZqBRbE?=
 =?us-ascii?Q?BeoRJ0KKtEw5guDvUYahrCRU2sjEyLFqWHIxKCImdVVAbjdaDu+WXtgnK2SD?=
 =?us-ascii?Q?zR3Ias7hZLtFvi9ExV9CFG8Ct4BWdzDqrpmXD2nDBhYSb8Y4uhRDQSa0bu/6?=
 =?us-ascii?Q?m5dbihIEaRg3+MxA0s8jNqh08awfG9TFTetV0g9s8iEqZUWSm9sqj8biR6EI?=
 =?us-ascii?Q?8oBHi/V5REJShDHZiZOh6zMblVdhAsLULUBABQLH8ouyZw7t1ido6fRh+vT8?=
 =?us-ascii?Q?K2MkevvAOzaalNfDirdZ+sNUrgVmcex5ShO7pb+oVHypQNrZZRnmo+D//c1c?=
 =?us-ascii?Q?n8b0bMPbh1nSIBX13A5PVuOFsNnH9VW0nRU4blgrhOicKGDqF0YwEa/6hFSP?=
 =?us-ascii?Q?Cqvz5OdMEDNdKcQ57r6OEVqVR1wiSzksaA6BmLnMw1FcvcAmuWNY8lwSXxIO?=
 =?us-ascii?Q?EaB+fKkwJHJJCFHXQCSj+XMr/EVXFwJybXB9amPhsuYxDvOASe6wh15dy3ae?=
 =?us-ascii?Q?uDKsatoNPQPmJWjJHCEyMMdftrVtQeU7WcMjAmPsizo3hVJd0h0S3xm1Aefz?=
 =?us-ascii?Q?MKZq4wYJScUz882jidhh8PPAuI/l7Zp+LGfgV+q/VLR+ABAkPGGk11LWyDBg?=
 =?us-ascii?Q?KR7j1vNurJDueXuubhK+XjLkP82LqUby2+AH8ObtU6lSvYVc7qClnNP+RNXO?=
 =?us-ascii?Q?aiZtj/00UL5AqIc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QjlC+bat9NKtcHVZMRfbipPWebwwhs4XgUly6aMAe5k4IcPClZXFpktV/D+h?=
 =?us-ascii?Q?NdAJ9i+NReqWBzCX77nHANeZOEGcJBuxRXohB1vCVBnxi1XQj295YKTDWI/3?=
 =?us-ascii?Q?tCa/a2z4lGXC0w4ftk8Goyl32isrNHBpSeQSBXpAdpVGZ0w3keVKNI/Ikoii?=
 =?us-ascii?Q?cVHZVtjjstoI4vFPZcESMwhN8+JT/s8eqizTuz0UVaFZL++9WC8a+mByF73H?=
 =?us-ascii?Q?w5TkDnMewZwljdRUM0k0zg0LkNz8SwN8hWQ1lXi/bWoveDl8r4f0a76dZncF?=
 =?us-ascii?Q?pg6piVkAwZ02znzm95R2TNKBRFfn+7um6S0s0hENf/BBqP25mDplvvglZpEc?=
 =?us-ascii?Q?ef0A441iTMIVhjA+9rjjFpYsjETALR0XgvdlVujsE0hYri32ifqDE4Ua8IZ9?=
 =?us-ascii?Q?aZC3wmGzEDGLfk+izvr2CJU7E+DqgGibOUeFgTyNTAcrcn4xzGZlaiqX8+mB?=
 =?us-ascii?Q?f/384fX5VfWtBJCOnIQFuuWRbxxqBGj+4ppCkpqZNWao1aM02IXSvTR6CqzZ?=
 =?us-ascii?Q?fBAvaHCPedFHCgiS4aCd3sEr0VkQxVUb0jd7JEHkT1LIWZh5LCmlvF2gjlil?=
 =?us-ascii?Q?QQ/aZ4j0qRybLeoNlzxcdBJbpd+DF0GuSW8EhMQrBytNbDEgx4L+HjQbJHX/?=
 =?us-ascii?Q?P8wItS2V20HRvQtYvOg/0U38kHtCJ9XQ2JPNwo5EQa+k91hRHnL2rS6bcK5v?=
 =?us-ascii?Q?bLgCGJcsQu+E1veud4v8FhJ7w+7twukKxozCpAM1ELZoQ//0Vhtfr8oVJ5hp?=
 =?us-ascii?Q?fdoqzyPWBZ8fadijipP3f+q2Fu+pZh927LWtRbODyByPqh6Rl1z1nhsOnaxp?=
 =?us-ascii?Q?BYnSYHlFJmnGa2uvR13aFrrwHJKbAfpyBWNSvaqbV0nC800W1cegCXv5+mfi?=
 =?us-ascii?Q?Wj/jj28629iwYH+VB80aUQSc3pB3BHneOMwsfrSXJSeR4RRor6mY+Urken9y?=
 =?us-ascii?Q?EN6PJEerlvWjJdNqwwwodujFZHq/RVN1oXEznbyrjBq6cVVN7U8II4oVJMgV?=
 =?us-ascii?Q?zcM9NmEvvkOgdvbOKxo0IHd3bcDLXiqduWwTiOoMO9KPFuYXT1+f0T/EIgK2?=
 =?us-ascii?Q?+VNJt7qswklzk8OR9jfQQmNkm73XU+Q02rvSfTYlb3ubA/rNHnanUvTHq6ZL?=
 =?us-ascii?Q?BLivOgpgnyOwdcvHf/gMpOsP3W/c+iwCJhWx2UyIdIEV1rZg4fvh1rFdOGkF?=
 =?us-ascii?Q?C2Mu72tRhAGqO8Vd3o+QZvmEYG3tUOIB7D32rq+hB8nfE8vOKafOmyEPO5uL?=
 =?us-ascii?Q?keQysfR6/f5MW/jAFubEEwuzhNZWd3/FT+AOzHjZqmn5gSyGwZlXxSY8/Tzu?=
 =?us-ascii?Q?k2Nyj6PCdazHW2dx7WWPYEjbC3/qYd49H0Fhob7LaTs7ozL24oDdGwl9lUoE?=
 =?us-ascii?Q?J0rWsXfFMNEqLOGZwxY6/AUQD0pUq6i+uOcL6AAPNke5LPpGZ/DSdsthLzax?=
 =?us-ascii?Q?o36g7JoyKn3aiUFy9E+YlPiRB/MgOLkrzDEVBVd0pcVyxS0LmysDFtgJ7tfn?=
 =?us-ascii?Q?vuW/cJto0CHxGIz1S73k1FbdQo3EfOPU3hDnJT1AU1FQv2F5DStorpE4J0+E?=
 =?us-ascii?Q?ChIfJPOR4IxpHGkj7yAONHTzCUJxfakJFL+YNk4z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6216f7ef-8eb0-4751-4491-08dd945095d8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 08:06:39.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfm/P6/wQamsCieUGhmtO9Ff2gJsk3HBHC4TS0LdncUpxsDKr+aAaXvw7T+wnW4rIKtVEuKzkHADuBB+JvXLTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9313
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

XCVR driver is not only used for i.MX8MP platform, so update driver name
to make it more generic.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 83aea341c1b6..e3111dd80be4 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1827,7 +1827,7 @@ static const struct dev_pm_ops fsl_xcvr_pm_ops = {
 static struct platform_driver fsl_xcvr_driver = {
 	.probe = fsl_xcvr_probe,
 	.driver = {
-		.name = "fsl,imx8mp-audio-xcvr",
+		.name = "fsl-xcvr",
 		.pm = pm_ptr(&fsl_xcvr_pm_ops),
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
-- 
2.34.1


