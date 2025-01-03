Return-Path: <linuxppc-dev+bounces-4599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BF7A00430
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:23:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYRl5nj0z3048;
	Fri,  3 Jan 2025 17:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885411;
	cv=pass; b=KRXTCULOw5XA2lZcp+jJEhN7+6OPT4TkyKgOW08pmuBnT7PegCbw+SFTN5i8LNGIIE0JJugkCqJRgi9tbeq/5+v4eDY6+Y1yk9r/Jlxi6f15Doayl/2R1zwWZTqAcwljglpyyA0fiRgZO+U2+w1mZUPiXi0IAI8mxoKsEoXE9ReWrOBCxLAqbdepoIINU4fQYDAhzZfzACPflHqILVnaAAKDG5Aj/CgGAyJBcoek09tVQP9VKzNFIOTqknolLB6+7VMguVAG313vxoX0nRoaQVZrxVhrQ3CJAoAl+HmG9oaRQqP/XRRwIN/iQ4uGyd/VfNvL1Ob8hoZriMfnFZyGZw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885411; c=relaxed/relaxed;
	bh=qIXDhH5SgQR3bxvFEYH62B32Nky0LwiVnCao6GRTEMI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e7FnwAW7kEgg71ZMswizWN7mu0GhZ5XaqReSvoVOnnubL4Z+1zj3B+uhIW3WwvHhPmCQ126Z52bGJrTyAmrKW2SFUpSdw459pq46sQ3U7p7rsHW+hd64Hs7nPccSZadf4Mg4iF8lULjtaTEEHNBMkWxeLAgd1sg/5fzGjjDRntZ8Cm+nRMbF1GfvM4dmgbIpuDLf+NzzpDKqNqGf0oZL6ZQEJR3UXReV8O9r5xMmBf2UnxhriPhQIZ9m8aZtgqa0XuzrIGL13P2PsY6lrGmHQsOTjR5Dg9Ap4mJuKIhul0gsYapKxY4xk6ppjNCUc54CP9jeRuExS30ejfVpAjo7pw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LVsjgVKv; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LVsjgVKv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::611; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYRk0dYsz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:23:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp+OPRqB0MvAJiI/i3RoOuVukd5ZG+QeHCcpwkt3GGIyt6gUcjW8VE1WjQOQGJPHsVEcVS65QcR55VAiYx9RlSPeqFDLvw6lmHm3ddp9cZbe0+CxQhJi0Tp01IuykdMmW8Nmry6l7fFs3CPpb33uvffDTgPgcryR0qM5NanZRKZnaf/XJFu0DgxkgTXBIyrGcDXkQb4nOz3ihVuQFxcWVVw8ypQhuqZbFdFbWA7ebLwPcWQ1Z3YkuM10+zgBwr4ElxhjQGRilsQaccFihsQ9IKUk3Fd8s7Lb1fereOLjRNWACqCIeM6fDAlTgo8B3L8rQpToIBaVW6RxjxPrWO6NCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIXDhH5SgQR3bxvFEYH62B32Nky0LwiVnCao6GRTEMI=;
 b=NPku/dLGhjCkBraj3FIKVnt15lOYOxgvomDQXM3WZ6kYdd7o9c+9XyYstX0dcwZqqbccM4hXCOuIdIO6gnEVuQ7aq4XEIGnQzPXfMshhhR/9B2HeP76jyqYnLI4rIxJ6tKJzIF7j8LaYm9IEypx+XC6lEp5M6tsKGD2lJiAFq0wx4Q+GSEb1kyQ371w2uGUBC+I3TlmalhqbIjhLGbCU0V/Fjvfml3RLmLpEZF5Mzfjd5dE9sTk8bml/Irh+5O+0vhqMVZMV/TccEoj8hlRrYhD1fqJud9mjJ63KTdGIAikCO36kggxnlNiHF37krjYMnY1HBobEOA/YF0Vr1Dxn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIXDhH5SgQR3bxvFEYH62B32Nky0LwiVnCao6GRTEMI=;
 b=LVsjgVKvL4/jQ1yduhggph+LWemjymzaL+ioi4cw8E+5PFffqMGTJAm3H7xHUrdV2k1inUFfylQiUzv+sJjFy07Xbx+/PddOJX6xYmUYX4nN6n9Qx+AAK5N87aq3VyXloSOiXoIJeAvxGGMSosx8YnY0r80+CHXCCAUeE+bCOqW7YSBglrfygFocuaX5iKfLIYprFHNJe/yLh/KqNsEgkXPhV5V7nii3C3OEhYUO9GVhpoRePdmp0xl+oJ+QeqI8P2ngnCFYiy2+DoeYxW2PxA5ZiU7sqhxyvTEuwi9FdRBGsjZRL688UbBG6jGq2PRMWzfxk8o4vT0fyuucNWfucA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:22:57 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:22:57 +0000
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
Subject: [PATCH net-next 00/13] Add more feautues for ENETC v4 - round 2
Date: Fri,  3 Jan 2025 14:05:56 +0800
Message-Id: <20250103060610.2233908-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: a60118d2-8afc-40c7-6c0b-08dd2bbf10b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VdMZLXJAzwv9iOLTYQiIiiIsT8umYpydoeZVnWGnCavdsf4PETQhnpmzP6Z5?=
 =?us-ascii?Q?VSgFY2DWTdvKagVlVkjKmX5he9++mpNfKtVJq0QKkc7sal7rwdkh3wpFAkYm?=
 =?us-ascii?Q?UHZOevrzFkgvdTuASZcLE4Yre5UAgon+y6bhg+buFTuV6x8ElSiOIm2lDg/Y?=
 =?us-ascii?Q?7RXyy5+0FO9oblTyEqr4++HgzOlPmi3/lUEtGvvtyECSFepINqY+K8dkf069?=
 =?us-ascii?Q?CECA12qlN/1d+WYGAdHvcoogtjbfg4uslIsYKMEQOeMVrZDsCizrHRkzCC5t?=
 =?us-ascii?Q?MNOBrMXBnzp9mGWruFJFIgDjgn6XrZYqjJ3gst0UmBFCOA3t7piT/AGU1/AO?=
 =?us-ascii?Q?xe3kwLW/oI9Ku+bLdTk18jeZ4kSApTZLbW4NnqERhFRvIyUybKQB55Hif+8f?=
 =?us-ascii?Q?osHWxmRc2rTMhxc/DJVxPI6fE8Dc8r7TT5Rs9Fl8krCqsekKz87UANUFUoia?=
 =?us-ascii?Q?/nuYf08tqTITSp+K9EbDRqzM68fTUlO/7KGmvW+Wu3FrJ3EELECGX84hFaO9?=
 =?us-ascii?Q?qkUqGJvbdk6Zr2qyKGuimwPed0J5W2pPpK9Uj7vXzrk+Pv89R2VrVY4iBhEa?=
 =?us-ascii?Q?N73l/TBbHvim1+UwmYOoJ8rflgFvuBNRUtpHd9jTyRcSt2X2Q5OqNp/CO2bZ?=
 =?us-ascii?Q?gTVaNK09mfLXayX35ILGi2wllaNui0zu0IQuYv45DVlnjFtfvxueDsVjNTzV?=
 =?us-ascii?Q?lown4cxZNgO5BaDvwdfKdsepZ4BLi9DcRWA5DGPCbtlfSt6NHR+IIO7PwsIL?=
 =?us-ascii?Q?4V0SsOE5Oi9bPFJ0SrIJDaTr62nf71HWzR6TtBCrxkmpRgOktJw895poSv6p?=
 =?us-ascii?Q?FVj+9JBzUeg/cp2xySNM8UMO057KhvHchdSDBDwITeisX5XrDJIwyEHrlNqL?=
 =?us-ascii?Q?pHe/XXD//Y3oblAbxwy0eo4XKNz2FeOlYqFYGGmAfZDODkN/DlqX0WL1c5ar?=
 =?us-ascii?Q?6dKETSwBUDxJwJtY8DZz5N4m3RVE8dEsDm1YRDy/xyhl7EbwP19gu2JSBWKQ?=
 =?us-ascii?Q?pnTRKvSwlmsY04YdXgJ+s1/X72t95yGNmoGYRToCXTbenyeWrVeVvDltf2IY?=
 =?us-ascii?Q?hrkXgIiEUIdwRluVIkPRRVKieQFPjctONJWbiB3e8VnC0f8N1NPGY7p/a32q?=
 =?us-ascii?Q?X66Ygy4qoxKl0tgxHHaFhQC0wBQVBqURgczsdw3eXLuUfmBp+ECz3UDHlbhw?=
 =?us-ascii?Q?6tN7x3ek490ovxVUnFX5RZmRinhLFDOd77Ys2Q/A1JgNPE8rOEE5ODePm2av?=
 =?us-ascii?Q?pO1tiqkhTYfE5StWBJgbizKKIM9ybp3J90l1Ny/I9rqmgZOTeZHOJUIwg5p1?=
 =?us-ascii?Q?bG7iP0pFNbitPMFWzOVAR7OjgTQsoUht74nC5Y+wYSqU5+wWr/l3ThuALcGC?=
 =?us-ascii?Q?614VlyzzCbDDzc9AOI0PcMMX33CEfcEjY6wmDyTuSRzDHrXGzG0U4YsJz622?=
 =?us-ascii?Q?XG63vys6Xq0Ecknlizfi6r521GdGsUsa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OyO59vwc879NwVkPYOvWZlAf5feaRDxjttZEyHyTc7v47FrHSlqcj4fH+z/?=
 =?us-ascii?Q?K0ZQqrgXZgorEZjDD8cbTezVLXxnc/fxxYFf2khsI3WCXcJn+lP3aMdpUOow?=
 =?us-ascii?Q?ZslV8Je2n3st7/TyQZZHH81vpdiiJLR7K5NN89aPv0KOOz9ODApbSIfM9iAp?=
 =?us-ascii?Q?Z8i67zGZt+hM9zWT+/to8K2a6SVK+q8meY2/r7pdkBa5BU333cib9TxLW8xN?=
 =?us-ascii?Q?2XikZtDO9jfkG1PTFZ/71/70VdHD5phxthr3c4wrsqk8M3mrnegR+mBokafD?=
 =?us-ascii?Q?uD9zsFm6MREGVsBMpbekLy5cgRVT4TwzCzDIXYM9oyhetCovmHDnrZPB8Me6?=
 =?us-ascii?Q?RM7TpasUzA88M5oKQykwpaxoM5ueDOcU+wWic+UB065gGktPLiqhxDsVTfc8?=
 =?us-ascii?Q?Zam6NoFUtfICzsEmzCSQ/Bd8UUDanrHWdm9CaI4RzMwv7mkgyekSHsq4iybS?=
 =?us-ascii?Q?nHVLndA4pJUN8t3dt8kYkd2gjuZ6AuRDN4EjKrgIiXvDtyy5SmYHLH4ReIct?=
 =?us-ascii?Q?TVxZoQ+Foo6aOPMFcj1VD/b917/Y1x2Kt1Rmnb12hmLsYsJDwgKlNOZO/vmA?=
 =?us-ascii?Q?7voZPg8jhPdaP9uO4Q3J14L+BZPZM5C5cFtgLQoFPp2N8gZKN2wGFDUpH/WP?=
 =?us-ascii?Q?A6fEQph5PVmqaIHLV4ywHhUg/M9n+cBpN/1V/esG4hD0dnX6sDXkCuHMBqhP?=
 =?us-ascii?Q?k/qL1p/K51CsISpowNmuNo4kcZyZFidofbtbicpvyR7rL+f4zr8u2jbmPnvL?=
 =?us-ascii?Q?uph1DSolBodBYyHekQ9U35hUHgyYmWTfU4TH6bpDKIO7M1fZNLt5n2wRQRxh?=
 =?us-ascii?Q?atiknBxCClKC7uNJG2fhGS4+xvG+TPCZKcbNQJt0Lsg9fVdsVyTEh9dr7vML?=
 =?us-ascii?Q?W2nmVJ3PkJNa7dcXFIxQBS2G0WhB4VsRwwrzR5psSAxHmxJhZNbjoHHsVFYJ?=
 =?us-ascii?Q?MTqCLknLhqrejKD1Nbu8qAQedt3MzP71VRCqXGqPSabwXlrM6MxUDg6TS3vF?=
 =?us-ascii?Q?D8/+cdEA6Hpc70DKMT6ZPeIoBxrr4Y1WWrIxnntIOpAeL8GfIn9PaRAGOqOi?=
 =?us-ascii?Q?/igPgSO0DTTO6Phb5nxjbjPc+rMb+CQYC8cXS5+Af+9yOpHptsK+MnYSVKVB?=
 =?us-ascii?Q?Nr+By3IvPOSzkNGXRaxuAcgnJ6PgYKXdbdHmPofjaR9MQfGs78NYsPM1lHbv?=
 =?us-ascii?Q?6UQwFVf9XDk5/MsBhClnesIR5dxOuRk51NZXC5u+IYEp8p29WZjHyWCUN6t5?=
 =?us-ascii?Q?bPzpjIg6pJjpcyQ+b/dW0oLZ2z+ey0pV/T1yqOqRdyNBIZ2INYxwrOILvAmZ?=
 =?us-ascii?Q?wpvSWZTQGlqnZD+XEO1DcacFeNHBTddnPJjIvk6gfbUHyawMCGATfa7CUPQB?=
 =?us-ascii?Q?SYBqevmaL0r+lS23IPi9/alwyhGlOishlAFbDz3NICVXuvd4aZ95LcAgMV3Y?=
 =?us-ascii?Q?gYjsPmnSAtD5eqKlGjck+KoKPz9NM3TpJajkaFM2F3c3V3IJ8TMXI2U5ZylL?=
 =?us-ascii?Q?+3g9KT7o4BsKw1YFtL0gsm+tZPc5pOP+DyugcNdYr367JejgcMRVks/ZSoPf?=
 =?us-ascii?Q?AfzlGnrqwGFLhySt1vrUtZsKChJSzXrVsfHNNRju?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60118d2-8afc-40c7-6c0b-08dd2bbf10b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:22:57.7640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrqH6E6Oi6+Psjl99cEbglC3Fd+CmmwW7jtYh/qPwvCUmVfRHQAOs3EqpQaMwaF0wqeIJa2ptaggebuHJgk8gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch set adds the following features.
1. Compared with ENETC v1, the formats of tables and command BD of ENETC
v4 have changed significantly, and the two are not compatible. Therefore,
in order to support the NETC Table Management Protocol (NTMP) v2.0, we
introduced the netc-lib driver and added support for MAC address filter
table and RSS table.
2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
3. Add RSS support for i.MX95 ENETC PF.
4. Add loopback support for i.MX95 ENETC PF.

Wei Fang (13):
  net: enetc: add initial netc-lib driver to support NTMP
  net: enetc: add command BD ring support for i.MX95 ENETC
  net: enetc: move generic MAC filterng interfaces to enetc-core
  net: enetc: add MAC filter for i.MX95 ENETC PF
  net: enetc: add debugfs interface to dump MAC filter
  net: enetc: make enetc_set_rxfh() and enetc_get_rxfh() reusable
  net: enetc: add RSS support for i.MX95 ENETC PF
  net: enetc: enable RSS feature by default
  net: enetc: move generic VLAN filter interfaces to enetc-core
  net: enetc: move generic VLAN hash filter functions to
    enetc_pf_common.c
  net: enetc: add VLAN filtering support for i.MX95 ENETC PF
  net: enetc: add loopback support for i.MX95 ENETC PF
  MAINTAINERS: add new file ntmp.h to ENETC driver

 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |  11 +
 drivers/net/ethernet/freescale/enetc/Makefile |   4 +
 drivers/net/ethernet/freescale/enetc/enetc.c  | 103 +++-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  58 +-
 .../ethernet/freescale/enetc/enetc4_debugfs.c |  93 +++
 .../ethernet/freescale/enetc/enetc4_debugfs.h |  20 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  12 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 537 +++++++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c |  65 ++-
 .../ethernet/freescale/enetc/enetc_ethtool.c  |  71 ++-
 .../net/ethernet/freescale/enetc/enetc_hw.h   |   6 +
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 140 ++---
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  32 +-
 .../freescale/enetc/enetc_pf_common.c         |  46 +-
 .../freescale/enetc/enetc_pf_common.h         |   2 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  19 +-
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 468 +++++++++++++++
 .../ethernet/freescale/enetc/ntmp_formats.h   |  61 ++
 include/linux/fsl/ntmp.h                      | 178 ++++++
 20 files changed, 1731 insertions(+), 196 deletions(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_formats.h
 create mode 100644 include/linux/fsl/ntmp.h

-- 
2.34.1


