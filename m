Return-Path: <linuxppc-dev+bounces-5126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49EA0B15F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:40:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWm0t6mFTz3cVd;
	Mon, 13 Jan 2025 19:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736757614;
	cv=pass; b=dk6EReHBM+5P0wjkIMDMdLNGbyNCzkucJo3/uZT4yJEKiwnd12jFhQvCtMbmqDC8DF5JYMtWXMMpMGrwKB+SBqnV5iTb+z9nsob6jT5eelw6z+eAy2dm+J5QcdTNWwkAc5Iy1ln9XcLlmdlahqW162HqdzfP8HBWsuU23cgye3CbexsqJ4LRLnw8WYYkMLGxFRP+f2BOfCuwRLE2ALcdtHRgLbWRI+CSfxD1zO0lFP1TPK20ImNBjuhLgUBZHIF+ssOpV02TIl+fGqgvXbUTev5H0a92/7+QLwJWKUZT2dzfCPqhegAK8R9HhBf+A9sd1ZOirO1Dg2AMDx7rwxyK2g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736757614; c=relaxed/relaxed;
	bh=LL0zpCYuNsrm+dSQosKaPelH0k3flvNhybnHr5dmcQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eeyi18cHMUORBIbYJBDFdQYtmAg2RvG/KWVfzyzGNRc+a2I6kbwnjIFIybKxbLYYQOhD4joNPhttnixDQFFdOTeH0FLNHi6WrUBDPIBh9Zth5BKe0Towb0IKKgB5cvyA+e1hAQlDtvZowJSMyso3ynUwTV+os9xqz5dn2s6inmKZAV4C8zaZozhlRRCQMsjlWzx2BUz3ugWnC8qOFoC/wL5lVCOOPPlxtpcfYuyQGA52+8Qi1r1M3MqaVoA5lVOsZ2M7Srj6mn7FrwXzLX1jcai59BTkzDHJOBQ4VW6KtO5OvXzE81tyZHU94ADcbQb3hKafL7SRxpAhLuWY6CPoHw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QzE/GLk6; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QzE/GLk6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWm0t2084z3cWq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:40:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lr5q0Ui9atyeeMN46fOhj6moYiUfQQltNOMhLp3yR1i0FtKB09mvieV29/DcbqRKWX+2zki67rj5kQSil+PiY9HnwrucZlPPqqAugpsjwuYTPX7WHb0wF/Sot1k4RS1Luhj4L2319Hj77gm9hKDLhxWA+Qyb20IyivQ9pjs/H9nWNPqMljAfCoeKydzg3OgBpXinAhhBAlSaWc4QysvXqHovkS1al1WUQYCM5RuEnDUm0brWcHNf9ngfv/xZ8xoS4dCupbRZ3yaWxw+ADPPt12+csqZNnS4oUxwuOjwZTJS+Veno+3gXLd+si3p46a5ULMHszQ6Tq7XPDo+daKnBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LL0zpCYuNsrm+dSQosKaPelH0k3flvNhybnHr5dmcQ0=;
 b=fqRbcq2s/IYVbrG3muhWPgT9XfBmIhlb8u1uB2DUSRYFVdhz7/e6BqgNzKb/Gm//h1V6gAziIMilufsH3cXCTYAdL1hXTce3oDrcxAi0LBS+HBRZ8sx3bhAkix17lC65klDnA+WUrf0KoiU09YPW/9GjZL2Q0yuY/SLwIGlyFBllDZRa0MfipTxhA4w1v5Mr+FBfoc1xFXETq/OGakWFXe/6ElUUxkhxXFsjVP/Bt93+m3qfLeE4Y5CTT1oT90WuqK1Ok++8TiQfHJ/zoMBqL413GGf+lGzRaqVM7K2exueHFLtviV54A8Zuj54X75JHHqaAcYzPOuHLu80oWoladA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LL0zpCYuNsrm+dSQosKaPelH0k3flvNhybnHr5dmcQ0=;
 b=QzE/GLk6vxTkcEAnkEUrpCIatPJPy5CRnZ3tXXC+40ajyqFivv+LsME5P0MPd3keHUMvTmYjDuCP5vs8MsoGJazrtK+Not+KBbj4/HJO5AMOxvzLKB5yYI/9GkbDhGBULRRIcjGe5xX0eZKGZ3nlG69k9souOAhQqc5duiiXFP8tvS+HveIh/LSZFlt6HOIGvqrKWneqdsMR7Z3ljff6OhwdxqqIv0S/xGZ0YHt/kOS+6roW2fDYMXosbU37RVAX58zM4zbSOw/XTNtVgSyEbWI6YXC3XeMx0PXOc9QdCzK77CpB4+04V8eM7sFN8BZ/Hn/8ivUS3JVfoO4SeZGuvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:40:12 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:40:12 +0000
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
Subject: [PATCH v2 net-next 06/13] net: enetc: make enetc_set_rxfh() and enetc_get_rxfh() reusable
Date: Mon, 13 Jan 2025 16:22:38 +0800
Message-Id: <20250113082245.2332775-7-wei.fang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7c993ea1-7967-4a74-873e-08dd33ade52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TQzLFhU0Q4n02tTaVB7+9xmaQrIMFn68hwCmSXCt7D4glJJ0aqlAz7eTBSZT?=
 =?us-ascii?Q?kKtlbOuKkvJwlNA81Fn/sAkZqHjxstR5cf+nuLYCKTAqzMHQWM1cgY3PJxdp?=
 =?us-ascii?Q?ISEro139o08DzKpMWvNcEqMxOHTDLi1dYgHxpvGY3TWf5o5pBcViDA000gCJ?=
 =?us-ascii?Q?TWFMFtq3Ao15wRaRPcmcX501K3LSk3AvywifOCD0EQMGxmfkWT71LOhAETAF?=
 =?us-ascii?Q?h4TrI9/ZdqrHDICZB1jsZSxjzeWsLEDJfgL4+AN6ZAUx8qFftc3JDWSNnE76?=
 =?us-ascii?Q?hpEn8RkL1DcdXYwTIl1tdtVfh+PQFgSmGDwvVNLgyJS1NRIBpOPfEuDhcoUF?=
 =?us-ascii?Q?1VbYX/J3uMBjbciWN4L1ndBJEcZupaVFkj7oHGTLTBh1cUwALOyKujTXZOdK?=
 =?us-ascii?Q?QimiFhsIuEb/RSVr+zk/taMUA8xcCIFlcjf/YfBMV5uRQRoCK/IOTl/4gKvY?=
 =?us-ascii?Q?Q8ZPTYL4lbpB2e3iPB+kLTJNvdGoOxKWT6dcT/9hs+/W1AQYk3UMs+11UMe8?=
 =?us-ascii?Q?H2Mn6TC14khgtUaax06DlhZ+xph9W3qE3cCdQhCs2cjtqwHtnfw9jLzBcu4T?=
 =?us-ascii?Q?GGu+GWKjALVtxcH89K0LAakFaFaLxbDTc3EJDcaSS+Sj24fuhGpfbDqDwuRg?=
 =?us-ascii?Q?RgeeAZd7Gi5wLzUgtfFJPbcUCdTf1+ZinbH/MT2njndQhSRz2J3v1/44Uu6V?=
 =?us-ascii?Q?r1ATh8n0K+qc/bhCN319lLxLl2P2i+xdK+bd9QOgrtJxMmwSl+Xu/j3lPO3f?=
 =?us-ascii?Q?zIVw4ggaoBUyrboIOeBKwkQt59gtHhhVuTlcsP+b7TKFDidM1VtIXUfH9+8V?=
 =?us-ascii?Q?BmScLS60V6B5wz/wFl8eTetreW+44sVVQ0jCgYp4I4n+eU6UphamGiTAvACg?=
 =?us-ascii?Q?FyJJMTYNCO5bZcmzfE/rUoc8vfKt/VFbSywJhDxNOu/s5/i8/v0XSPnuI/JM?=
 =?us-ascii?Q?DD9yCt+I4ieyZAoIQI1TT8EzXXe+VGrrtxeBDD4hVpLd5MNYaOZ65sVWfSjS?=
 =?us-ascii?Q?MEaRDMtuEfwSKNT6HIs94uduuhnlcY76ZKP0korfBNWT0iOPKkCHxNJlXcW5?=
 =?us-ascii?Q?N9jhN4QGEFLrUbNBKGxDSE+Y2NwpD/80rgH1c62ZmA/ErUR9R2Dsx1qcgk4m?=
 =?us-ascii?Q?rnIfvyH85NSQTUjOTlK7h6fjvLDBafsAYPY7QyWFkXuZeAtuUIy/VxGp9tKx?=
 =?us-ascii?Q?VZBUT5NSJRWBiKhE2V04tezFgrD7pX2d2Ulu3x8+fgp6UCX144D23lwaBFcO?=
 =?us-ascii?Q?2VQqhc1P/gRS7E87BzqlJtQR7bfWXfvn6bzVzIPndn8GWFx7ymjPp1MXntE9?=
 =?us-ascii?Q?PhKIKe7lNuQTPGBYIh3BEkV9ppoHUgSZd8C+9YUE2etWOCOvOAzYBXmHWhq6?=
 =?us-ascii?Q?dS0pB+WLOBKlzUBNNwmbW844JLZgNyzogSOFZXe/X3BcB86+u8rpOApImAEk?=
 =?us-ascii?Q?X8zB9m6uBZPWNC3GOphvcpYGpVE71gL0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rx/aHn0lGlhyW0wnvcz6xVXRHjGC/aZItsI+TEzjZ4rnpKz3twPuEUu4uYyM?=
 =?us-ascii?Q?PUhN1mtePZto+f3UHZNHphFmHUD0zQKYX5bTTIldGQqTgop66iPE42I1FQs0?=
 =?us-ascii?Q?DQCPP1+IFwF1L3JTHRiizTMXw77CrHd2D15QIeG2c+vPxXbojQCxu/Wr6lqP?=
 =?us-ascii?Q?zlqn8vdtVDzzbww/NcgwuCKDR9iPUxuNro3ohO/fSIz4jO3C7a2cs5V94Fws?=
 =?us-ascii?Q?91kW4aIKDcZSh59KN936xlCuwh/M29Sg37YZ5COR+i6yfjkNbS+xUUw1zZtQ?=
 =?us-ascii?Q?CckBnAxwvHGlKcDEHDicuGOcjZ5/m2JwYTYMBS49H3kvrJIvlR8ofU6+fZoM?=
 =?us-ascii?Q?l6SXsNEe9wV3ueVZoETTTlUXC8f1LHKIZWXHMUhsoGwwvhYzpCrfeu55ka05?=
 =?us-ascii?Q?CNXF6DBJinCPNoy9jEiQYk0kzpJ/DqwniqkzF/Yv8VzzyNeRRbryqQ7Xy4Qr?=
 =?us-ascii?Q?XirGapnZG7ivG3PkNAfTxZcWyK83dXnj6Rda2r5Up+dSTVpQtOiV1BM5muXO?=
 =?us-ascii?Q?0nMmNLdB8WjAY46Q0+dTlqG/lcHA9KW8gVAw3F34XTVFBrj2tWCEIIAWn2AD?=
 =?us-ascii?Q?Uq2+t4lPmBqTuBNHC8Ur9ZMXNLkngfWEWXdR++jOmFW4kQ6L7OnqACpqOuD1?=
 =?us-ascii?Q?2IQlLJPh72MQL/vtfmQlZo6jdmqIvLRPtLh2qa8RbBPEMlnbt08n4VGDoeGe?=
 =?us-ascii?Q?mMFyER3MvH9MMMvYSg32RHQjICxZ3vEj5qKuym8b678u27GoDgEQNdCNgWRj?=
 =?us-ascii?Q?Yq2+bdRBH5wXhU4A4J98hKI/76LkEhMOsM0cu0UVuKPj4VyWRLd6WdbDNvE0?=
 =?us-ascii?Q?pqYdjuGGy2w8lAkj0vFUCP2WJYQ5FqJTDO4cue8phBfpl8tO+LrTaliFaElh?=
 =?us-ascii?Q?35n40u8yF+DbrQGHv4cvMh9oBFyGjJhsx1ZOJWD9On7tOA+j4woxOo3zPt5b?=
 =?us-ascii?Q?nKD1coe7rPfckzgcbVuy77En0elcM3iOCzPxg4luE3jt1aNOZMSJdK3PbHvZ?=
 =?us-ascii?Q?+QZD4Tly+HGFkH6Y2UPd4oX6ARTdekpsR8nBbAKFX9GTKWiu+Z2viJxiUYsd?=
 =?us-ascii?Q?OqoiMKUqPzHMpYV2whw9PuI82giWO2Oy1+FzMJNhM4b2oQR9F80jOQVDX728?=
 =?us-ascii?Q?9fQCU2KirPLAUUL6obfPA61R6G+pESVWdsANGqSwYyeLzcPNvm27HXXLY3cW?=
 =?us-ascii?Q?zSK8bHfYpmsS4IhcnK6m4fdWHri+Oh8szqnu6c5SmXCbnJsAn/tcCbaaygnW?=
 =?us-ascii?Q?pFqEdIOIjpm7rAKBdHnCcLY9KJs9hdc/n77saWlFcHPFq8MxE0vF2ZYPgkAP?=
 =?us-ascii?Q?nTfPn4p5VVDfmIB2NUkecHcecxq6wxtcypYlJKNGqzPNF4GtcIjZ2DawPj/2?=
 =?us-ascii?Q?E4blvWsHBEwZd9b5WPH8CkGBEF9UzDDwMZUZgBpMK8zRTJ6gOpnQ7PMYIFLv?=
 =?us-ascii?Q?+lJhik5HToq5h0ddw+BsLuCX+IWjr6+iJGQnoPo1JK8T7Qip4M3l7hm5Mx7A?=
 =?us-ascii?Q?rn8ngGWM4C/X9PuQirEutyhSa1v1olSE6buYuzE+pCY5fqx91ypr4LFt/8AG?=
 =?us-ascii?Q?uG8favyryCulKaQSTJLTSVMoR5+Y8Afut0odkMNo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c993ea1-7967-4a74-873e-08dd33ade52c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:40:12.6002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOBe0/ndomIhhbfoCDuYl/YhqsytI0aa3dc5GPrRLjjovYjgw/JLubD6jlNSqv7LnGPvRKbsahCqSSx/hmh7tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Both ENETC v1 and v4 support Receive Side Scaling (RSS), but the offset
of the RSS key registers is different. In order to make enetc_get_rxfh()
and enetc_set_rxfh() be reused by ENETC v4, the .set_rss_key() and
.get_rss_key() interfaces are added to enect_pf_ops.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  1 -
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 42 +++++++++----------
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 18 ++++++++
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  2 +
 4 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index ca1bc85c0ac9..fb53fb961364 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -537,7 +537,6 @@ int enetc_set_mac_flt_entry(struct enetc_si *si, int index,
 int enetc_clear_mac_flt_entry(struct enetc_si *si, int index);
 int enetc_set_fs_entry(struct enetc_si *si, struct enetc_cmd_rfse *rfse,
 		       int index);
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes);
 int enetc_get_rss_table(struct enetc_si *si, u32 *table, int count);
 int enetc_set_rss_table(struct enetc_si *si, const u32 *table, int count);
 int enetc_send_cmd(struct enetc_si *si, struct enetc_cbd *cbd);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index bf34b5bb1e35..56ba82830279 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -4,7 +4,8 @@
 #include <linux/ethtool_netlink.h>
 #include <linux/net_tstamp.h>
 #include <linux/module.h>
-#include "enetc.h"
+
+#include "enetc_pf.h"
 
 static const u32 enetc_si_regs[] = {
 	ENETC_SIMR, ENETC_SIPMAR0, ENETC_SIPMAR1, ENETC_SICBDRMR,
@@ -681,51 +682,46 @@ static int enetc_get_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
-	int err = 0, i;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
+	int err = 0;
 
 	/* return hash function */
 	rxfh->hfunc = ETH_RSS_HASH_TOP;
 
 	/* return hash key */
-	if (rxfh->key && hw->port)
-		for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-			((u32 *)rxfh->key)[i] = enetc_port_rd(hw,
-							      ENETC_PRSSK(i));
+	if (rxfh->key && enetc_si_is_pf(si)) {
+		struct enetc_pf *pf = enetc_si_priv(si);
+
+		pf->ops->get_rss_key(hw, rxfh->key);
+	}
 
 	/* return RSS table */
 	if (rxfh->indir)
-		err = enetc_get_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = enetc_get_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
 
-void enetc_set_rss_key(struct enetc_hw *hw, const u8 *bytes)
-{
-	int i;
-
-	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
-		enetc_port_wr(hw, ENETC_PRSSK(i), ((u32 *)bytes)[i]);
-}
-EXPORT_SYMBOL_GPL(enetc_set_rss_key);
-
 static int enetc_set_rxfh(struct net_device *ndev,
 			  struct ethtool_rxfh_param *rxfh,
 			  struct netlink_ext_ack *extack)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
+	struct enetc_si *si = priv->si;
+	struct enetc_hw *hw = &si->hw;
 	int err = 0;
 
 	/* set hash key, if PF */
-	if (rxfh->key && hw->port)
-		enetc_set_rss_key(hw, rxfh->key);
+	if (rxfh->key && enetc_si_is_pf(si)) {
+		struct enetc_pf *pf = enetc_si_priv(si);
+
+		pf->ops->set_rss_key(hw, rxfh->key);
+	}
 
 	/* set RSS table */
 	if (rxfh->indir)
-		err = enetc_set_rss_table(priv->si, rxfh->indir,
-					  priv->si->num_rss);
+		err = enetc_set_rss_table(si, rxfh->indir, si->num_rss);
 
 	return err;
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index cc3e52bd3096..f050cf039733 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -512,6 +512,22 @@ static void enetc_mac_enable(struct enetc_si *si, bool en)
 	enetc_port_mac_wr(si, ENETC_PM0_CMD_CFG, val);
 }
 
+static void enetc_set_rss_key(struct enetc_hw *hw, const u8 *key)
+{
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		enetc_port_wr(hw, ENETC_PRSSK(i), ((u32 *)key)[i]);
+}
+
+static void enetc_get_rss_key(struct enetc_hw *hw, u8 *key)
+{
+	int i;
+
+	for (i = 0; i < ENETC_RSSHASH_KEY_SIZE / 4; i++)
+		((u32 *)key)[i] = enetc_port_rd(hw, ENETC_PRSSK(i));
+}
+
 static void enetc_configure_port(struct enetc_pf *pf)
 {
 	u8 hash_key[ENETC_RSSHASH_KEY_SIZE];
@@ -975,6 +991,8 @@ static const struct enetc_pf_ops enetc_pf_ops = {
 	.create_pcs = enetc_pf_create_pcs,
 	.destroy_pcs = enetc_pf_destroy_pcs,
 	.enable_psfp = enetc_psfp_enable,
+	.set_rss_key = enetc_set_rss_key,
+	.get_rss_key = enetc_get_rss_key,
 };
 
 static int enetc_pf_probe(struct pci_dev *pdev,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
index 3b0cb0d8bf48..916818d2fdb5 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
@@ -39,6 +39,8 @@ struct enetc_pf_ops {
 	struct phylink_pcs *(*create_pcs)(struct enetc_pf *pf, struct mii_bus *bus);
 	void (*destroy_pcs)(struct phylink_pcs *pcs);
 	int (*enable_psfp)(struct enetc_ndev_priv *priv);
+	void (*set_rss_key)(struct enetc_hw *hw, const u8 *key);
+	void (*get_rss_key)(struct enetc_hw *hw, u8 *key);
 };
 
 struct enetc_pf {
-- 
2.34.1


