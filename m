Return-Path: <linuxppc-dev+bounces-7617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1BA85968
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 12:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYt1Z3S96z3c86;
	Fri, 11 Apr 2025 20:18:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::624" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744366706;
	cv=pass; b=oaCM/DZKgonlXBFBEK4LJhKZkNqu8npoatc3//e9/+YapJ/aAWkK6N0CEQSPqBgRCyHXfAtq5K4YrRK+6YDheiqfr6CzKSh+0rhl/gTVPmqYJJp2UQBXSRz1EY1wkticj6S3JiO2pblLszjHVG51QiHJUl2dKHlb7S5yqvtPG7Gk13B30V8aJ9k9gVcU5Saym8Fy2upyxrGxJEkXYj+jDO4Q0X1A91yd8f+uX9ILMzCWaru2jxW8+kHEgPX1U/4b8r18ucMfOCBOW1ahvwCu/5OcP/Bigq19j2qN8vvM+xnHk70QmiUiEYyV2wEnjvo5e08ZB6GYBhqjjyeruDU6Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744366706; c=relaxed/relaxed;
	bh=x5qTXJDZPp4S7AwHuNkJ4fICSW1yygF+ddd8uCRnfZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cJgW7BI4MUjii/M4a1pOeu2EvbuCnl+DfKYG83KIkIjbSDQsAywLhiPg8hZkruEzHPcmrnFMsnJ2p6cdrwu5+efHBCjCh1wC+8yS1gRsKBlQal98no1tvVVIb+gI6ZH6KoCHdbMqQ43Q/tm7fLFpq3Ewa2ijIWdVytN+C9GQiuz4XvYBgOmhVaNOHBfdXa5HKcONncCj56T1DonAR3PyKWs0IgLsGI8tMAnmlrmnsJuQSRbA2r38scehvZgtsdM8cd/pMkmyW2vqPEGgQdopGbqA18dgrOnGHo+VS3lrhTMmSK8lrAeZptypG05Bv2f17qlcn6QKfrx+5sz8R0BYeA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BuwcbAtj; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::624; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BuwcbAtj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::624; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYt1Y4sDGz3c7H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 20:18:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Up1EJNDi4VzuUusf8r81Sa772TqE+bXfzRzGjDPNurAh3POixGPiRU4n/Pr1NeflfiYrjo/JpYCPAs2SkY2ZLcfPRJXnzfR3ce6I9+OGFiKPKVq7dFAYrzwXx5AbTUmet2MPBTmegTY7BJUy4yvNxa7tDxmGv9Q7ummqWGRdFhaTeqWzzPhnjYWVZdYgMpR0axqdJ7IaGhqhQoSbIKbf/C0ksRbovBBwvHd+Cx+QG5IWu/ilT3kHtx456Ane2J7Gp6hv6VD0ERPxATuY3BdC+duBEtifcEik0HmmEWgCEOkGc3YAolpz7CXPvOpKBA2aACaBHhzTFHWlr9iXHb8A7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5qTXJDZPp4S7AwHuNkJ4fICSW1yygF+ddd8uCRnfZg=;
 b=qc/N6RCQtnPR3adfBEZELCfSHdInUBE6ToBqAWHNnAAHU03A8tc560Dchl7EaRef12ZPqDaUgQT4qBkW0iOMtduytM/zDeRIW8sCx5dFGrsjC2PdR8fqz+7DIRb56uHnh1fin83vkWnEnFSiWQvYB11FY06QtY5VrNsNagIQ+nrMMjjfrVS3I8TTZ/th/s7CSDWKw8k5WuxkTT8oKjlEU2vJe2QCLBC0d3pgWohFc6sxh5Qp1wNaVf7NEGtYebeRLjaqQ9b6s0gMwj9l++S98AKNzvR2SU/YfUdDE/7DZ+uSOZKpWCJdt8Z4tJLlogqy6ByA6GUarKvjU2TXkcq2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5qTXJDZPp4S7AwHuNkJ4fICSW1yygF+ddd8uCRnfZg=;
 b=BuwcbAtjsf4EApyVbiTUm+5hzbZQrt/sQtHtdPguVH7l46I0dZyWgazsczjsXE3F3E2TWLoDAAEnms9ch9AQncYiRoYhji67/KKbT+20HxNFFdZWTnubneRzaxjdtpl40uKU9vXQMIU3jPMTkZEnE8bsR8OY6rFtn5nEq5Sf5uaAfOyDzV2qlTBMSG3lC/x74J/GpXHE/aCxo99UKa4YP+nV7BQyq/WleYkflCUAhByv4TYv1CFMYgPvb/JVwMUlOst+0zdpqRBoEFloKMCURwQ8WH2IJC9prvSuv6LQjeyZiq/5oCJtX+VqOxu6C0BL6AarveRlhFDYJJV7F3yeSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:18:07 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:18:07 +0000
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
Subject: [PATCH v5 net-next 14/14] net: enetc: add loopback support for i.MX95 ENETC PF
Date: Fri, 11 Apr 2025 17:57:52 +0800
Message-Id: <20250411095752.3072696-15-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 938f7920-2460-47e3-93b6-08dd78e2273f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jGQtE9QNEW4WGk1hmKcMHPNLFvzeXM6u+0d7eEXtGyyJ+O9AjBnyc4ZN4KHf?=
 =?us-ascii?Q?Lq+tYLzi3z3GspuTcMDJPcdF9EArLTDzY77FNdnRKVVD/LXa3btSIq+krbea?=
 =?us-ascii?Q?haQ5XReq6hRoPKZ+2aeGqjKpU37J8gT18YRdlew9qJpJRAq8V2E6VHFjfTW8?=
 =?us-ascii?Q?5dX1n1R/q76/jTsbxpNrA6TUVKg6roTjzORh6mgA5fWF1D45U8iL3UfZMolZ?=
 =?us-ascii?Q?KPlciFWuFBWqZN86g0aUDXPrQfq6CuvZWhRAen2djs+v9Q9OtAa6vrszfGeo?=
 =?us-ascii?Q?T5vWMbdcOJ//ThU3yJkV2i8b3k7vAaFOgLrT36xWx5bWPrs4NOtIDt4VYBrr?=
 =?us-ascii?Q?GG8Ii3UfpFeLZ9VnsiUAs0rrvApocjHzeWpPIPqqlmzRtNYzSqpOJ9TtGkbp?=
 =?us-ascii?Q?LlWtaW2AdrnFz+rsYcAZkejqJLSF+VHFHD8GLbHRITWrIwhgyBawdf915J8K?=
 =?us-ascii?Q?Kl8SuUV2CxCO87RJ7PsSW1Z8uenY1MvjaxeIccwgJVcCWkBImnvVH8z7g+w7?=
 =?us-ascii?Q?gnO21q/CHt3q199KzV73JrjeQjt9BbDSNxYchtWVN+QBL7D3tjog1qUjmpvB?=
 =?us-ascii?Q?WwVbJk7qL6+kBO8HNU8ng8vlyc44VoDGsfUzzfZeWBFYtGeWJLIm5pMoZjfL?=
 =?us-ascii?Q?FofjNZTx6rah4vtOIDn8/KowBvnIbARM95DOTjxUsJqeJH+MSmCZzEmk0qdV?=
 =?us-ascii?Q?fijyoIHYrxIjPza1djigm9dQ5vGKnBmhcywc8yBAUJq44mXfee0oTOF/FaBY?=
 =?us-ascii?Q?w19uI4oAcGaNAGlIqt1v/v48YpkpxIQT3D21pJF6vzRca2G5nzh1CI+2uMw3?=
 =?us-ascii?Q?2Jg+QYARNTRuxeBS3+QTRFpIeuOc/vS/XOGP00ifJOUJmENBiImO79l8zfWL?=
 =?us-ascii?Q?ot9BcoVqOHBqXtBfyM5vlrBP6vmHxAJ8X2VDmklYK12PQIMWjLT3jFDT2mJh?=
 =?us-ascii?Q?RSEh3yu4vUoLWWTG2O1WRDxcCT4cB+afOyQi2fOB5IlNmPd5+sC+UpK1yN+c?=
 =?us-ascii?Q?7p29nvxLO3opo225zX62LtshK733+TjX4FcLXNWq7+vsB8V2gFPsCO1rAD/L?=
 =?us-ascii?Q?3/ZRMbLhNZlLlaRzVk3NAhMGLNWpYRu69qiUp3hYcabAnVq1CGPHD0Ph3kqn?=
 =?us-ascii?Q?kfSZ2cgtUnb8O1/M4u88uOre2w7W27J+tuSDL/Gh9+nmLgX6h7Rl/z12gKiB?=
 =?us-ascii?Q?holT8iIBG+7ow6CPyzRUuY0AXwmKvs7TgDOUacMaCknP/H9mGFnOV2bHv1lF?=
 =?us-ascii?Q?+j8TXGRzQus7vA6CtBjb0MUD04Fy/7A6gXqD8IIXS7I6M7m1dGa7Q2jm513V?=
 =?us-ascii?Q?2PxGxH9WzS4mhCaezPn+j4P9q/XC6rUfzIKdROowRmFOUT737GBr2lJKZQYL?=
 =?us-ascii?Q?0dd4jfm8PQbhHYGUXL2PsS6EJ5FbKPod2xlWi0FUdTid2TtVRb4kIKpk9cKW?=
 =?us-ascii?Q?2/cddYzCcZhDMEHnluyEBCE6+b+qXVUxPcVg3Qxq91LjLyJEeTCCbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YdzRGZ41BqRewFvY18/dgozjBaRz3hvIGMlLUgHuMwdA1LKEPOiHlAkY3neS?=
 =?us-ascii?Q?8H7eXNL+J8Ygx36Mec9rij3Q09YGpAA0O2UlDDKGO5gBJIo9h4ZJI9Ru740v?=
 =?us-ascii?Q?+1kL6ladjE+N3oLB4pyAhYh5OXfwtYziiQ4v7jbvqdL4UU9+eyh9lQYqNOAS?=
 =?us-ascii?Q?xuuEHa6GkU+Vv0PpB0qnIOqWbxOLvy2v010gBOycRCnVVLIxdZlt4IYsYeoz?=
 =?us-ascii?Q?OplPDmhqMfmMy2YqwJVpSowwcGmy5nGOBI4UQnjEE29yg5PL0O6XbHaiSsIl?=
 =?us-ascii?Q?uzD2pZScW62UuDniOI7ePXmZzK8XQSETm2XfWtPh1SojvdXI6CCZmisT8o3y?=
 =?us-ascii?Q?ZozTUW8sHnYguwXjDv9Oi+Ks5TsGrbYrgw7De1P99XvLqrN63M87CvyACaMN?=
 =?us-ascii?Q?Z3dAuzHpAj0wX7mV8VQEc3JZSONRmhRfOOWp1nJTSSZNR0zamkYuuYgfQ7BE?=
 =?us-ascii?Q?2HH7PvGt7eVvXiINOP+X8yJSBgKMq3WrTUimnEL20G3RtTtfbPFs58WBYNrC?=
 =?us-ascii?Q?iDRpV21M76n7sHlXzRNukf2rpNUvO57fxvIETAEMPR+tj1GkmmVwHH/ljKff?=
 =?us-ascii?Q?rRiEJExYmdEh4HaPFGKkJ8BDaEh0/D6iP8cz0xsldbrP1oOwQnerZnm7eQja?=
 =?us-ascii?Q?4uLrAmQn+qE9k+r7Ox3z0I2F4ioV/dIAci89MAZPygW+UN0exs7KninUp+AJ?=
 =?us-ascii?Q?RRxM6Mx0wKPU3J9vaL/TuAPzmnHS4rTVdUQ15yeaoohDZRm48DCzraNuwOVc?=
 =?us-ascii?Q?yDKHO+84/sddUHfaW6FUFeGBAV2z8FdbM4ROuKdb2Q6AFkhe8qbbw+Btig6f?=
 =?us-ascii?Q?bN4AXpoF4p9bRMLG3jLuO23icpAc2Jxvd6jbRaqpEHhEoUGyFnV8ZfdRmj+y?=
 =?us-ascii?Q?NEUf89U29RHvMv+MsrvNFDprcR3TP5oTXRk6HcA2cE47ZNMDMT+pAgoxlFs6?=
 =?us-ascii?Q?ICU03fn8aCRU1HnKcvZzyHfl+ygm8WxpIbWX7pcURgGI/y2kPdj+fIO9PtkY?=
 =?us-ascii?Q?8rwyIkCF6UsqcCVAcPqTHbJWrttUiQDo9OeyWU7TokX7KbnRlpcoVwGgCGSa?=
 =?us-ascii?Q?4z99EMosap5PtdhAkYm6qdaMx3SKxTVwztrVVVnuQg/0AYXmHVzX1pVnGChh?=
 =?us-ascii?Q?Sml1x2BO9AEQQFAGb2hKe3zk24yW618JmESS0Jmv6dI4AATfJ308PB5ZRx/F?=
 =?us-ascii?Q?mWDxJLKup6C/e7RZV7ekGuXf+n5YlF+9ZiOojk2rWG/+NAG4Y9VrKJbjtg6S?=
 =?us-ascii?Q?tGkNK3lRTOAYu5fF2jQ3/9onp/jGm0EqfiAV8nEyRq4ye5UR+SWce+cf+2HY?=
 =?us-ascii?Q?Ar/hNChsGwthr0ZZupLCXJaflbzDUqHpmFZXEHR15Igd6HKkI8HXAENXt5tc?=
 =?us-ascii?Q?vMflglDxMop3RxP4tPTl7aJdtvMEObTD6Ufe5WllfHbagqJwwK9XEDKaaQa5?=
 =?us-ascii?Q?kP8Lm49IbsYGXHCsKx5MqHG9/7iQvRZFD5ehmEhd7fgBNKiyyb3cgdJ5O0/O?=
 =?us-ascii?Q?ubPhvsJrnuBa/GqYWi0d/2dagxvEQm1O7C+FX1aX/eh61VE1EqqPVPN+5sFH?=
 =?us-ascii?Q?RCKUOrUJTQ/R1qN3RpfOMY3i7iHS7X9GZb2ySThL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938f7920-2460-47e3-93b6-08dd78e2273f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:18:07.5522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6AqOvKdmI+27xA/pc8iC0vMv3YJGSHkkdBsaf4IlJPLDWUCY66aaJW3DPa8AIoSHFa+EjatNaPmb/9PSpzg9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add internal loopback support for i.MX95 ENETC PF, the default loopback
mode is MAC level loopback, the MAC Tx data is looped back onto the Rx.
The MAC interface runs at a fixed 1:8 ratio of NETC clock in MAC-level
loopback mode, with no dependency on Tx clock.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5: no changes
---
 .../net/ethernet/freescale/enetc/enetc4_pf.c   | 18 ++++++++++++++++++
 .../ethernet/freescale/enetc/enetc_pf_common.c |  4 +---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 421378212a73..711047f7074b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -101,6 +101,21 @@ static void enetc4_pf_set_si_mc_hash_filter(struct enetc_hw *hw, int si,
 	enetc_port_wr(hw, ENETC4_PSIMMHFR1(si), upper_32_bits(hash));
 }
 
+static void enetc4_pf_set_loopback(struct net_device *ndev, bool en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_si *si = priv->si;
+	u32 val;
+
+	val = enetc_port_mac_rd(si, ENETC4_PM_CMD_CFG(0));
+	val = u32_replace_bits(val, en ? 1 : 0, PM_CMD_CFG_LOOP_EN);
+	/* Default to select MAC level loopback mode if loopback is enabled. */
+	val = u32_replace_bits(val, en ? LPBCK_MODE_MAC_LEVEL : 0,
+			       PM_CMD_CFG_LPBK_MODE);
+
+	enetc_port_mac_wr(si, ENETC4_PM_CMD_CFG(0), val);
+}
+
 static void enetc4_pf_clear_maft_entries(struct enetc_pf *pf)
 {
 	int i;
@@ -527,6 +542,9 @@ static int enetc4_pf_set_features(struct net_device *ndev,
 		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
 	}
 
+	if (changed & NETIF_F_LOOPBACK)
+		enetc4_pf_set_loopback(ndev, !!(features & NETIF_F_LOOPBACK));
+
 	enetc_set_features(ndev, features);
 
 	return 0;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 8c563e552021..edf14a95cab7 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -134,10 +134,8 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
-	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~NETIF_F_LOOPBACK;
+	if (!is_enetc_rev1(si))
 		goto end;
-	}
 
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_NDO_XMIT | NETDEV_XDP_ACT_RX_SG |
-- 
2.34.1


