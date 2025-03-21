Return-Path: <linuxppc-dev+bounces-7258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0856EA6B5EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 09:17:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJwKQ2bj3z30CB;
	Fri, 21 Mar 2025 19:17:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742545034;
	cv=pass; b=iP6OTYO56dmrQpEnT6QJTYXpl95lwFuo6G5VNYb2sZm0kGDdrbPlaXQ2kE+Pud1+jQsUU/+K2fJ5LUiWTJiOpgVwo7qCdMQfAkHWvRg1CccdOLysR4br4PJZ3Lv1xRfkqRMsQXQXMKrq/gzx3Ona/BHQdghS6ccYfF0XWFrCVXhLLmwjrYSg8nQwCW7bOl5Yg4qZ3SJcAndQYQ3mS5usWwEovqGr8QfaDvgpX50pmt0tZfR1iPPoktw88s2PDStZ/tJvJx3ivBDuAT8446YqTx2Bpa4ieitwLvjSiDGP4vNVory8DawVK7ZdiV8ESlBd49g4H5ZoLZ75imMk0ls/+A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742545034; c=relaxed/relaxed;
	bh=5RvRkAKIVI9q9r+L/FzG/Y84uSgRTrWVxVq9ny+9Vaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dizPTCWDU+y1tbiOdDsodFLzXJKXDNb258qV6XEqKcWPNm1w7gOsU4wZzdGEFE/gk1HAe8zMpWoA24XD8EeidZJTNS7VWrXr652pVdqFlztbOTIqVAhxr45FdYhpqPTWfEAL8dOTrh7X/YoABH+3hXY8fa1teXfXetUTbGM3OkiWojs+xyNxNJ1mN0hE8fiomj9E/8LEFkEVX3kRkkYdB/F500Q71GYx4TTyQX68Tm89kCeAa3+KyoVa3+jaF3cSrlsRgKR0as0yHe3l8J5+c87nv6U1mh2K9RMrQZaEOywWEBJz+Z0o7sNKxQ05IYcelNEPPgjMI8MCV9yzPneciA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H6GvZrsx; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::62a; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=H6GvZrsx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::62a; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJwKN6RbZz3093
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 19:17:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy7v2F5HjUvE7Z8N/1sqL+doHWCE1g3FVfApRzGhvDItl616cljjnLqB9imgxQFCoiplXLSPds8TPqeJ3CUZfWQkCguB2MkjqL+xlOdbjeUI5btN9RlIfWgBiZ5T5Cza8GiJ6yJ2nvtC1EaVppBDecL2XVyaKpWrMWhcyHmEa3tgjnEDKJDOiSwYb89hpWzrtYS018TT8Y8EIbvX8CmKWe0sTNgHirkX26P1TKrpA88BoX4P+bPn9AgA61E94vU/7o6ij8MsnAWrR9CS/QGiv3eftjmwTNFTbig5j50pTWf+ziEI3WvbbMHvdFAmpCuYa3d4nDpYWVCf0mGMuqiAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RvRkAKIVI9q9r+L/FzG/Y84uSgRTrWVxVq9ny+9Vaw=;
 b=BWoYCxLUnq74/KsUZuu0HXOT1159h8k6HdCvMcIDTwe6H2ptDHzGM0otTIvB8Vhoe1tvp3euzbc7Rj6s/fLobUYWgboSkfO6RpO5wNw3IKz0T+S5W2xhSXKBVctljMobz+nchbQDqrQNevJPXCLO3dU7++ErhBC/t0nZcPoHBkcPv3YbcoUeRtl8NXJ3uG8ohk1D5xea1G+8lg6su0VBAsmKjOLlMO8QAzxEJFAGZ4nEktTIj3fYKmC+Bqessa1/L08mhF80jlByXXeHgJxV9edgjkhlrPHimcYJ9kzZiitHNI+bli3/YllvdygPaHXlpYyUGVbSrtXQJjSFnyc5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RvRkAKIVI9q9r+L/FzG/Y84uSgRTrWVxVq9ny+9Vaw=;
 b=H6GvZrsx/a4y59LZwKz4p8X57C9QTt5blysudE5CLnQwDQY2bwyU5ixnorsM+RI2U3DGql1tBS5hgCq58sTIpLkJd0ZDYo1kN5v6a+RT7/vd4BLLUCEHzh7LDEXDjWxCLw2B+n+6cF963XrEOD8cEs0j36KgxawG0RTMNgChtLK9E5FJtiz6i+mDWL85nsbU7HWxTDqD/8YC1M/ugBEEoBgcL2Y1wdP5Pgqh2lUNM00EMUggxpwp1/4G/C4Nhy0cRuqWLSZ2CvtQnk3YcOHJySbAK/wiRmHPNS5M4+Ax2UMe3i0Jq7COl3UN0gf+C3vBqCGv78xgi/zIttwu3GkHMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10559.eurprd04.prod.outlook.com (2603:10a6:150:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Fri, 21 Mar
 2025 08:16:52 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 08:16:52 +0000
Date: Fri, 21 Mar 2025 10:16:49 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linux@treblig.org
Cc: stuyoder@gmail.com, christophe.leroy@csgroup.eu, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Message-ID: <jz2ci3idg7kabbfunyzklolsgc4d3yla2oatma7nxodfvgqnp6@2yzm3yti5ljz>
References: <20241115152055.279732-1-linux@treblig.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115152055.279732-1-linux@treblig.org>
X-ClientProxiedBy: ZR0P278CA0093.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::8) To AS8PR04MB8868.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10559:EE_
X-MS-Office365-Filtering-Correlation-Id: beb0a90d-b38d-47ea-e0c8-08dd6850bc31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q2sChoWCG21wGRGAzMtMa5WAYObuGkIoHEUlb1LZ5rWZfkK95NKfA8zrQ3uB?=
 =?us-ascii?Q?wld+8m7AbBcFqciYf9lDIskys+lYbhb+AkUH+DjgUhRmMoAZJl5Bs0+TY7jX?=
 =?us-ascii?Q?WEecjb2bBDrPr2/n0gHrVAy09XPfH6Crp/Dib/9ZE2y/IHJyS6b7DBlnlxQx?=
 =?us-ascii?Q?srFn2B31eNf0vDJRWhgONHYPktKUQTlzhyvlnsdk4D90pfV8iLMQt/MO1KAR?=
 =?us-ascii?Q?FNUMJZbtgM4lFpYu4XnrbbgIC1vhhrfuaKJBILDHj3sx/YRwFUYJlohIJDVo?=
 =?us-ascii?Q?WW1LekaoRZOLudYRxMRc3RK//fnWWpYgEolDT8KKCsg7hcMNdSOdfNmAx63a?=
 =?us-ascii?Q?88BjocQf3zfg75sF6nrr9jyodoap2H8toO/hQ8aggpN+PItYF27ob+cGkGrb?=
 =?us-ascii?Q?fuYLfszev62w1kz79Lby42377gntV85Dbi4iB2LRlxpYQ6WewQJkKPspJcSt?=
 =?us-ascii?Q?ApoPX053xKhezd3JQ3gO95YZDUnXHI63fekAoWtFraA467c+EspLjzbyE3+z?=
 =?us-ascii?Q?Mh0Zv2NCVRC0THxc6mm6h7ICKI60Uq93GcCQgJqirU0QMkfXxujde9NzI9cz?=
 =?us-ascii?Q?HCjcAKnLgF+51shZTdnzhgd1vcT8a9ASpCRH5cbJ2NImcTxTzT1RPN+El35R?=
 =?us-ascii?Q?4OhYNfTkQh3GTmfnzDXr77iqj2X557hPNW2t6AuCORgq3axPoCSn1+Ds2048?=
 =?us-ascii?Q?AG+N/D+pfrHuqX5AwoX+9OHGMPQVoo1EE+mJ6lLycXB/yd5VOekYFV7HJNVB?=
 =?us-ascii?Q?ROTkWCLl1h6a5H5YjfrIy26EmEDQpNwXZ2Qey+4PdrmbeIek+iwlRd5YtKEm?=
 =?us-ascii?Q?VBTwLsRPJtvN7tpjVjsfAQa6/vU8UZHpbeZ+1BvqmJQ5SVCFX1TYjJuLEc0X?=
 =?us-ascii?Q?zRp6wKGoCkLtd4V3JSkI5MwT8/r6A18TwUx2T/TB+WwUcxB9eP+Gd7ZeM0Vg?=
 =?us-ascii?Q?Tt2Hle+XB/2ksv5Js/XExBzI0V6107/5MveP4zDWXpaAvdXrcoAjnPgR2NGS?=
 =?us-ascii?Q?78yV6VezwhdY2xAU4Ago3ZBooStVsVQuW4BiuCWzxAkf+lGpKtBcXc7STIdm?=
 =?us-ascii?Q?UAu0dHng8A97O4i0ch6en/XtnZnyMrb1/jvIlXMiAuQ6aCN/DaQH8e1gBgp8?=
 =?us-ascii?Q?LKI8MkauHAR//m8sG/peeC6XP7E8zfoP5fCmHQm6qB1UJjRzH3A6oS4DueF1?=
 =?us-ascii?Q?mfgLqn+G0BJF4e0nELSMdti48VdQ184JlEA16cAwE27eNB0Ly2vYvhtlbIR8?=
 =?us-ascii?Q?PuvVQny6VT87b0HC3muJcUpfWh965c5iQ4YQCbLFxsmIGZJhBTGs/9MnfDAn?=
 =?us-ascii?Q?IFRNjSsl0FEjn7YlpHEe19hJO9ccR69IOJ7U+8LtuDJIp4UfL1LLlN7VQmQe?=
 =?us-ascii?Q?frFPzrp5UoN4Ofk1O8G/SqmdxFAr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+b8+wKxI89AYgzmg5GiK4HDQLZ0JB8d+iu5jxDmOvOT1yWECL1i9z0MUHrQv?=
 =?us-ascii?Q?8Qoufa+QF5JD5HcVuuPzwGquXTqLPOp56Z5ShMwVccQLhXlhMXJ4EGocbxjL?=
 =?us-ascii?Q?4Kk3PpWAnw2Rk6rls/gdZORD0TPqBVrOQrV2BlNGeaKLgG/ocHgoC/DIINmQ?=
 =?us-ascii?Q?YGJYyPCl9LvYwbMKYJUbbTLtPIX56D/YiPdc40ER2F7x/ZmHh1OMyOYqfLBN?=
 =?us-ascii?Q?TbpOAtTbS/6Cnlxjtv5F0Q7IjBfbMHuq/q6tzu8KZ1XyX7YppS/FC7Fro+Ac?=
 =?us-ascii?Q?O1kTaah89WoCvnDprO7oiM7zfgEjJ80wNdAGcUyP9d+vZr35RvXCTG/AfPv3?=
 =?us-ascii?Q?FIbLnl1F1BBgmBpTiFMdlX5AciP59GIlkSgOjksiB22lzlTw3t/O444w1kea?=
 =?us-ascii?Q?vTKvfvf8M4MPi7rdnOW7uIHtH+Zk3fntDrLpa7kUXgSst2DMZIoTt6s0XnFY?=
 =?us-ascii?Q?UyWS8bvVPKndJp9xlvKKcbSeQGlDe/A9R6D4G2/jHd3J81Q0q6isF+xV48Sd?=
 =?us-ascii?Q?XxdrcmnViHwsPELOSfAvCJeQ62VR9akiQ5/oIZtBFitwNEtMJMQ6+/BgI0L4?=
 =?us-ascii?Q?li5jVeuYKibW65LvtKDncC8R4cFezU7IrK1LwqLyvwke5JcmrlDqUsJqHv9f?=
 =?us-ascii?Q?OmmflqNIVkIpii+da0GccFEaBXWcp0qOfkISVtf5ttdscEYjru9PAJTCxxCp?=
 =?us-ascii?Q?He+Sezl1ts+dtBK/oRlVLYTpt9QfuOajtN70X9ilwwEyNMPZfNfuHlZ+S39t?=
 =?us-ascii?Q?R1DEDgMSthKUZTZi2FXsCIqSUAaBDk91MT6/HgxPMiXg/borySwSRs50BvPU?=
 =?us-ascii?Q?B1QtbCXw9mULHD/zZVxkDJDhDnIRVzk5iFkR7OzguE7b94Ve/nHExPrDW3io?=
 =?us-ascii?Q?3LfMou6bU0eZ3LO+TFaZC9uachegPZbAy//Gx2WfybdnvI0UVd+fG9RXN3Ha?=
 =?us-ascii?Q?N7sDjRh4/xCw2qTKCWXSpDLiruMMTtFqmLbzjH/mJjis2ZS1WPGzUQDmj0iy?=
 =?us-ascii?Q?SJEOJklJUNSxd0zJov6N9TKlCDzxznYpGZhoYuSEAcD6GBmcJasCgGVR2n2I?=
 =?us-ascii?Q?dpbSCcYRvn41iL/vVCtU7SZzekJCtGao2ZwW2mYa1pjSzOw2muhaTeDBnWJm?=
 =?us-ascii?Q?okAoTuVFELIvSZMYOKAImZJ091RX764QJRjy/71CISTdEQB0jI43cFL0Z9EY?=
 =?us-ascii?Q?AeYovNr/yYAgausmRi1MqEJ7hZsFFDKbMxkBTJuZNpcYcE98uTX4hJ906sOP?=
 =?us-ascii?Q?ojYXGtmB1V9H0oEz/rgd1ellShb8ZH/tFyTHsGX7IWanRChiAlrGcV/goItn?=
 =?us-ascii?Q?eMh97UmuVDSUErO44CRtcqbUg6SdnSSNQLH6GdqpczuVkXG3WGYcY0MjHJ/p?=
 =?us-ascii?Q?QRzapUIBOISMxLDY56KopCPSnn5Vjs6lsBz+8NThxZeY5QqrAm6FM4OuCbyJ?=
 =?us-ascii?Q?+UDyNVBRHwf0MWFojhK/9LuXdILvvkyYhUfGUGAw1hVuEy+lh6I9mS6MNlTy?=
 =?us-ascii?Q?lhfKkopAfBDpyTAlwVwjnzzAz0q4Sg4MQN61m8U3wDVbf3KlyUspt0ffNhVU?=
 =?us-ascii?Q?vAPplyBqQe+RtdVTVhkdsOoClJbv4EHgTAyUpSce?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb0a90d-b38d-47ea-e0c8-08dd6850bc31
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 08:16:52.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nS9q4i+KuC5L+oFDci5TKhVC25AiMbD8GkJMIcby1RXBl8gY9ciLaBhGvXycEDCPDh/yGSOTY8rJPR6AnykLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10559
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 15, 2024 at 03:20:55PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> fsl_mc_allocator_driver_exit() was added explicitly by
> commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was added in 2015 by
> commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>


