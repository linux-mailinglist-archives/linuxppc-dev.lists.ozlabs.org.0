Return-Path: <linuxppc-dev+bounces-6085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDBA30FE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 16:33:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yslny6VLmz308V;
	Wed, 12 Feb 2025 02:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739287990;
	cv=pass; b=eASe+pcrI11Od7urhtYHbWlhPqNwNq6YLRlugDI8Td/H2hBH/Aen9OXCSkT2gBY+4+yCfPNybwCQl+S4IChSkUbMiI96cpTBhGEgUdXe8qlczsYgSdkj3yora1dO8hn7Vaptdr/5hg+DURsLD78cW+cB54QwRMkfl1b5VCtSmi+ljlR36pDd+qQxLax6Xz2bHA77w5GwKsY8dFcDP33PtPz7Fpaatj43qoAG9B2G0FUSeOzmxNeKnsdGBSGJqL0Ref5VlyIeg+Ky1idnLVmp/CMqBJ4McOMh9Y4hc+2qHFCA7GmjX57Z9uVGP7k41CwS4eWk8qquYEsnGSo412OcDw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739287990; c=relaxed/relaxed;
	bh=ZKu6jAxgDZFCPTqIB9AiZML1i0BxHfhQGgppfq2OnWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OPnRz4g943/8XTZkCznMoaEiLK0Ee7NvdZkXeBQXbpmDyK1FcJ1l4FZwrxEv11q8olqOg5vZaYs9CSlbOhhkcOZI47V/K9hUDkOpVVn2ZkoCPiDuduBqlbkMOySqn++ekcIMY0i54AFcztXuf6Hb41Y6l0K2OJXGjRFFA28RnciuMDuhgZZbjuZWAuxtMtdN4BjRQCTklaG5Tj4om0sJR9p2mlDNq8tqWCjrgqX4axWbsU59EyYjJDr1HReRXAl7FFrICHCtqGaSUfGteiFrjSO5ZAjd3xB0lX+KNyVFKV4+8oiLbNCbzoGxdGJCm4/oAuwA0saG/btlw83fQ2nZyA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ma3awLe9; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Ma3awLe9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yslnx3tXMz3024
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 02:33:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzR24K5jH9S1h1P6kE32XLT6QCbr39qd3r54qMxovvXQrhEceMQ4C9v89gyktHN89i8cG5x7nzeeQbUxol1H9iZq6H/+vBDn15jqstmr+TU1EriEujvxRpPWr6mAohGc5G+xUMZ1Nwz+k39yoVn+OIbmtxEjfiCgCMSg6Jj9Noe5W1GrA0lWRi8M1eYn940360zUm70vbQzOAwWN+ojZL5I8GZymsNTJ+ojWbro3Ar1gQOLef5L8Eq2iQeqvUrfOEluvTA8qERqBKh3y/7/i/7/9IlDl+49y6X37DGqkvZa0Zdkglky1Vy8pYOH0P2WBRjl+TwNaB2spRJxOj1kteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKu6jAxgDZFCPTqIB9AiZML1i0BxHfhQGgppfq2OnWE=;
 b=RPdXEZvDI0w5ACyJnEHubIumpLAxxBFjXr6+qmeHBTsziys3C9/X/CvOGEP6h4cDjkSY8nlZcNoXDFNzbI+g4fDY88Kl78OQZ2ySv4AQmqv6m+rHCy6VehvTg7Ibk+IxhICGgUqWnX362f4AzEBO5S5YRkCiaXZHjL65F9PVL8b1t04sCfaK5BGcuqm/zJbSm6DEnISfIYk0cZh9oJc2pgT8lVtf5X9pnCXqDtT7mZq3Q4JLxduoWTscQzMkY/H6T1TNmEMxvJBD5EM2yUcRE2oEd2Tq5FlvqNgQpX0ro7Dwmh18b9oz5Fjn+N+BhqYcf47WMU4exoK/pRxaXmqeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKu6jAxgDZFCPTqIB9AiZML1i0BxHfhQGgppfq2OnWE=;
 b=Ma3awLe9fJfL8duPD94wa3QZCmwjODj+g1e+NOzxuy94l0cmVtyInbA4Vly+BuGXMZO/kNZNd45HKUnNMb8kskXRL9mqcMmRGMwko4iu/WICIqsqLRxOn/vOBGxTsvA97gBhGotZm1W5YqtyM1xjyF/Y5olv+WDHj/weo0aFE4Xta79SwIVSldnbyddgR26e4o4M2vw77Uz5I5gyrus3vhKL4lmJqFEYMSW5K9OhpADFtpQEAGO9H3x5auxrvZ0xgdlZ2lxb/fSEdDvc7bRaGHML1KD/V6350xXeoj/uwLAgtHoED5eUF8srKMYeyOVrCZzDfozhPA/uthGWnzvHFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9737.eurprd04.prod.outlook.com (2603:10a6:800:1dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 15:32:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 15:32:44 +0000
Date: Tue, 11 Feb 2025 10:32:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: imx-card: Add playback-only and
 capture-only property
Message-ID: <Z6ttkyfUapRKGMsk@lizhi-Precision-Tower-5810>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211035737.3886974-2-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a0ea598-d287-4de5-a5bc-08dd4ab154bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5J60R+Cw0poxNic0NdyiZJmDbu3yfcsfqTr3Ve4VNP2mcSx1xPmgvzqykW2?=
 =?us-ascii?Q?OJ/mKhWkoMx8CU2/O5jsunvwZ9uBlFA30Jj2/23luV+ucPSLG6uJDrKsOJrZ?=
 =?us-ascii?Q?SUV5OT79zxzYDzlK5J6doA5GMO/gsHn0pUbAJF//s7V6g3zQ6HcbdkuNEr3v?=
 =?us-ascii?Q?PIrdXqF2F8bHU1mDi2b3O0XfXbpNEa7JdEJfD04/dyGumgo1MCa8HbT1uQZO?=
 =?us-ascii?Q?DPxFo+plo9R55OVWnt+frBk/vZl6k2gLTuSK0CwC2+7V603NT+mL0gfb94Kw?=
 =?us-ascii?Q?LtkSFNQo3G0Clksrl0Zq4dF7992PiE8A/IzOezwful0oG0SLIz4/s/9ZWwXz?=
 =?us-ascii?Q?X+BAb3S4T5FRU4pqWYWVqvZrR9HExHJypw16qIA7FHktAWq8wRdT7h7+Iw6g?=
 =?us-ascii?Q?VI6ZYWPJpHusxOqM6JQlHNxctJ6cmldxV9dX7h/ezngRyDdTg8E05pzk45dw?=
 =?us-ascii?Q?QQtrwvS36OGmdRP7h3ggfczt0h8Chc3DFMHrP+udyH2crzZdeCTtNM0MXZR/?=
 =?us-ascii?Q?AM+vFo6h9bo4ckXZaHR7DhfLfbyzp4wHVa7ijzLgyTvHz/gkWWLNJO7wj+8b?=
 =?us-ascii?Q?kj7tZ1j0WGX3T0KGpZpaN/rvnLFMYXJX+n+ouigRmaP7wsWRpM+rYekmwFhm?=
 =?us-ascii?Q?NFZDNJZEhOjbqcDAas0rsycg4XKHHbm/bHeT1E7DeA76ryDbM9xLajZwCdfG?=
 =?us-ascii?Q?Ke/BKEi5TYq4H7MbQuD3qD1ZP0GdrSxLT8H/kBpAiZRwQlY1zHJGlaK/ZYeu?=
 =?us-ascii?Q?7otWH0g91UEdLUX8JxxaHPEaJ4sOxtUscIpcDiZeFyhQJMhgPs4JTuOWZx/d?=
 =?us-ascii?Q?9idh05A5IA4AMHZyD6d7aQ5fuGImB8TRzZC+23TfjLGyrLM3yrL+aFq2bUZ9?=
 =?us-ascii?Q?ab00NJdnTrWhTAJacdP+HDGBblDBcKdSX7GxnMVkGE6+amRHyPTsc2CrhfOV?=
 =?us-ascii?Q?Ci4W6BzjquaWFAFh45BmDAUXU9zRDSBJG6esXq2/BhENaih5VEkOloZsYc26?=
 =?us-ascii?Q?qBV5boGdlW0KUGY9+vnIkziBZhQ0seYwbNqSP9ecPCBswa5dMHeoMVpOgtFc?=
 =?us-ascii?Q?8aCY6vi9DB5qlWc7IT5an6uqGaB7O+ohjvb1J4nDXG3LJ85XRqtKZ2KUKuwK?=
 =?us-ascii?Q?J0xFMrh0zt+mOP+/SpqgRgrNS20bFL4hvWAtjfsRT8mIuhpbAfLLNSqwM6yR?=
 =?us-ascii?Q?+Nf3eK4rcwrxNRyqB2Nj7tlOKWDbUKtAWyiZN5bO8iYypEHvL8Cf/VBOGQwh?=
 =?us-ascii?Q?zEfVPQXa188N8K3KFrw0PdS9VaqK/P4iIyIK6vb1+FKpeWeIzckUdrZdp/3G?=
 =?us-ascii?Q?4cRn3cZtzBzi6pRbNrWgBXa0hr++m0B6d4YBrOogkMBiybaX0EGUTfe4bYlC?=
 =?us-ascii?Q?VBg96ymC/aSD7G1xe4gz9XIs/Cp3ho74VvpRSxDiqfqA+zoKKKgSXAD2LWSC?=
 =?us-ascii?Q?o138QheRiM0O4icT1VCu1zUqEvABNdT8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5UdJ1xcBstBFVepGosntPkqXH4OAJMeq928MONBhIOzGGKU55MviPhhgtLDe?=
 =?us-ascii?Q?JymGQeUgWvDYyBfznuESeRsr54SoSRFy4crjG4cN2LvUAQLvq7/YshPYDfg2?=
 =?us-ascii?Q?MMi6x7MypYDm3zeB5M6qBZ5XPiHS+jFXK23Q6yljkevnvY5oJs345wBHIQ9X?=
 =?us-ascii?Q?0kq/UpuspeqJtpZnnw7XAKqmA76bMP/oKuz3M8g2qLkPm7YOoJ09wRoYwZfe?=
 =?us-ascii?Q?jrscTBXXaIxP4BGpFrIPNAA8upHn5UrVFFkWw4cyvw25rMyjkVvvi+81xrzw?=
 =?us-ascii?Q?l5M9GUjl9/cHNWxdo4jJC9WWVHJJ9FPmX2cTc3e3u+njZzvm0wBRD41zLmU9?=
 =?us-ascii?Q?O2p4Z2jDaHJfnpP0hYoFaw4ZuyfibfB5fVnu82MqMKF2xTm4Ews/Urtdh6Hq?=
 =?us-ascii?Q?2fpmmq4O02BnrhKYEw2k3LFXhfXzsc1YYRJG62sfdCx/fWQQOIkOOjSLurLE?=
 =?us-ascii?Q?xNcvfCbk4VgcjUW6msLq8Jjx8pcsi14+DJkXM1Cl9IjQVUNL3j9PJll0h+WR?=
 =?us-ascii?Q?+eCOC2CRzhQa0hghbLnY/i+nXASsf4uvLVAm4jliSPTvVwbKNtXSFuxkJqiZ?=
 =?us-ascii?Q?TpG9WsQJr6GC86yF97eMyP35ikW/2BGHEDbeM3ml+sqaTB7AxqtXW6LGRl4R?=
 =?us-ascii?Q?vfYWWrWgVwGqFy0UCe3CUt0Z4VklwzXHmPWYkldnjM8TnnTEgjeYhsugVjN9?=
 =?us-ascii?Q?y981gV1uyzgne36w9rOUEmBzG3IYJPHQzkXHs8p6no6hDfoGuZDtg/1oQj5a?=
 =?us-ascii?Q?1styyVt55XC4p3Q1CKvHvKmwRNsYlfi5hqTLTJ9oak2kSfXSd2ajWEiwWRRO?=
 =?us-ascii?Q?E9z2Dueco/zPJoLolP9MGKq4rDW6yUhjG7w+FVQ77CLkH24qDwLrTRR+YmEa?=
 =?us-ascii?Q?EVA8a7WgX5Qa6tYFRxvLKvwpEXG2cq+JnAOurnUKqBXPYDAfSQJz9UGAwUAW?=
 =?us-ascii?Q?Q5D8y3PVFKW46wSuP/syMGHe8PpMNm4UBSRA03I9tk/N+6R+mn/tDOO0X55I?=
 =?us-ascii?Q?R+Dv9JxY3GBo0nDXTBlUP03bg0wfKid/5z2z9CcT20zDyhmvN5FTKMzBlQ5j?=
 =?us-ascii?Q?ei1uK0Ox9ca17DCU4IAfLGqWtnVd14E67CwesijafPJYk15TX2ZZICk83yEF?=
 =?us-ascii?Q?lpBZhB1vFk/X3VhAKR4zLUCBF4Drl0BQD0NkgEt7KCNKALeCQ/YNUKszgcWu?=
 =?us-ascii?Q?vmuj1f0aihSMbQp+WAJitupHhEMU7Ijn0VMuUt8gm6wSc+ZZwkKeBAQwA5w1?=
 =?us-ascii?Q?IVogjQzytyW8XEHPJESjah9r15k5UBbIS1jFrYzlYRztwXfjVo2efE6Q2B0J?=
 =?us-ascii?Q?od9fLdy6DrkXxUyZ9z7eLKxz/nHfoy0cZk13r5oXoFwfhHK5LFDq/XioPzZL?=
 =?us-ascii?Q?gJcEVu7jWbSdfgCF8p1qEI/jgZcItUirIy3e1rG+OYDrRzH60Zn03x3TYkKY?=
 =?us-ascii?Q?hqvEsXjU/emRnbVUyS6VeApJItZbxwlGItu8bDbJxeJ2GXPNB9zDUI149H+A?=
 =?us-ascii?Q?FyrlvP/U7KSfd2xBvUCH2ACJi42Tme4VQ5IYQcpq7jEeiwKY0mKIv+/5OBUC?=
 =?us-ascii?Q?G6S9yom+fbKtl3rpNF3T3KVlriTWxUtLbKA+gTQ9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0ea598-d287-4de5-a5bc-08dd4ab154bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:32:44.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +97GAzltezRavIc1YJOp69ltwoHiKS5xJcIyBSxxMmHsxjoizkISoZpWEy7epjPw+1JDcEbIqxwas8o+WjzhkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9737
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 11, 2025 at 11:57:36AM +0800, Shengjiu Wang wrote:
> Refer to audio graph card, add playback-only and capture-only property
> for imx-audio-card.yaml for the case that only playback or capture
> is supported.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index f7ad5ea2491e..86571fa930f6 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -46,6 +46,14 @@ patternProperties:
>          description: see tdm-slot.txt.
>          $ref: /schemas/types.yaml#/definitions/uint32
>
> +      playback-only:
> +        description: link is used only for playback
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      capture-only:
> +        description: link is used only for capture
> +        $ref: /schemas/types.yaml#/definitions/flag
> +

why not ref to audio-graph-port.yaml?

Frank

>        cpu:
>          description: Holds subnode which indicates cpu dai.
>          type: object
> --
> 2.34.1
>

