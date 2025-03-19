Return-Path: <linuxppc-dev+bounces-7195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A0A683D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 04:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHZCm4cRbz2xTh;
	Wed, 19 Mar 2025 14:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::604" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742355460;
	cv=pass; b=RXCc7ySsqWe+tyWAVeCu84+NSCmHDIe9fWD9jjzULsFOiILYQWGKCRNpoURO2wHoWgp+r8Mm4rro9BkdGKwB9s0Af4sie0lkcdST29/HSYHJ0AX6KrFfB48s08JBRwEmI/lz+6/KS5+eO3wn+WkE2yPISK7sZ5F73UD3PzBbeCsJcxtYPryJ/JHil1WonualBZELJsSsDARUGv/+Xra4rq8Cma8h3ckRSu7VcwVEi6s22/VMJTh1BKknkQCSBYSjgGeKtUuyirVQJ8WULxfd3q7iB9ne51OpEfN5D7h1eMtIYG3tRhEzHEMM4Q/z+ryJzi1KoaHkto03rB84nult0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742355460; c=relaxed/relaxed;
	bh=EmxTbGPwtUFa1PtyR6FIn43tFIDRWZ+KN9ylEkIO/v4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jKg3gQzZ6PzjkjwWGf1VaeQ3IVFSeF8509Iio0XGoVltIVvzdA8B4iWJARwR0WEalBkdtr4hfgqnE6tvjQiOx+2U21dm2HVjW84zFBkz05BZtW+43lItALreH77y3bM43TzOubYVYUFGeEoDDdwjroykx/MwZJ4oHZzlFu0nU1T+gKaLJw7tQVq4xrpEWHXLA5cfMGUh/v0S9YplasZoLK0GAi+GkKVRVkZ9WWLhL144GtrV/bQ3oyEQawhi6lxf7k1/5RUs2YHI3MgJjMGymbSHwguu4ULzIyfrejiq/l0BXTmrus+p2CEstNY6Oa9VKw50aKKdEQIk8I+sFgzIqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KLopuN0K; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::604; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KLopuN0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::604; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20604.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHZCk6Yhpz2x9g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 14:37:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M592+N4/NdzDB1dXZtAK8RssytIdD+SPCkTyTnH2EybSoLg+5u7DLRwSzi0MnpPPmNsBQaBOCsSzNLgpUQxxnmScV0lN2/esliWouxmkqbyEIqB39yeITLkGR/05tMwFTnOPnYebqQczy/h8K8oaopINSOSbpcSLsW4edM2TUZFtbDMFjVQeEAmaLzoH+zywI7UDGtvqOTIrKBnvtQ488x91WuBT8tJRXtqzY8nnkcJ3At3HiPR8pzHeHCMhle8vDrElbTr2W0TAJmRFiIQ105PnkFy4EWkE6tYJl63/Fw0h6wsizc0MAhvhoa43DhiqX6ybhOT1Hhks1dAioadTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmxTbGPwtUFa1PtyR6FIn43tFIDRWZ+KN9ylEkIO/v4=;
 b=A7u4XZZNystCBk7CfDQYhDbredKcsh1Ka3cietSEsGQbLz8IxxZgROgkMSuQcWGajdTSrklQ1teFDWJPZTiPzPOnVa5WWmYfkJu2FxYFQTcMhhxO96k5u1Thv3YM8r+r67jeqr27qlCmTObtXo7OrfRCbNV15u1vy1UsVwGRgU4O9KNzWQzc5VyzPYcekjfbjpZlO/WI2vvvWXmyqnoDC37BRpIBXsiwnKC4VX0kWiYbhvjPFDp9awEpxoB8wsCUWpljU9bpLCSrNsR1cLtHRZe6o/sCtIIyDdROP3r64ecKpJ7fkExGyGNrOUVh1T7YrX7AHoBcjy2jRsl6P7gFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmxTbGPwtUFa1PtyR6FIn43tFIDRWZ+KN9ylEkIO/v4=;
 b=KLopuN0K0wMiL3T/uXn6Ea0skgjg5fwn+lejoahbA/Iwht6naUYDshMK+STPa3YEz9uMtFEJxp4M7T4mTh00d339q5PUP2i9onH2eu4n3+jVlBeiwQiLRQdW2SYlQhXGtMkJ5xah4mI3vLX/txpsm3lgNMY5P3Q8eI9HzAgQg/KWM+DNAChN36ONcik70twlD2KsgHsY1+vVVyNESyfeqpWuO9P4rexxKZqttHD08TqrI178junQXxCpU80VWR2PvUcScIeqTOZDQoNrJe6XalB2XcRjmkMTe1+leHTYsB9TNWf7yYVfbidjPsLHF4tMq5Sy09Vfa98MGooeX5iUnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10669.eurprd04.prod.outlook.com (2603:10a6:10:58e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 03:37:17 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 03:37:17 +0000
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
Subject: [PATCH] ASoC: fsl_asrc_dma: get codec or cpu dai from backend
Date: Wed, 19 Mar 2025 11:35:04 +0800
Message-Id: <20250319033504.2898605-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB10669:EE_
X-MS-Office365-Filtering-Correlation-Id: 743d1be8-2e40-4441-9a34-08dd669758c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5TSg3TclpSne8RbBSV1h8WbLuZEQyAAlkgnnlnkxrSCpQZh6e04nBuun7IqT?=
 =?us-ascii?Q?W23eR6mX3St+w4nOuj49ORnrxNaP7AmnQ9Mg4mgoNPUOBcjp97vv7+HURovR?=
 =?us-ascii?Q?TBufYm9CPjZflSedL60fzlotBN9lbtPR9cptNTfKdAiz/ZUE2Dw8F7q01NXw?=
 =?us-ascii?Q?MJYgDwDFmBJCdjYWqyjXfudAfBuB0hmV6IYHdxC7LYRe2zMzAqmnF5p0N5f+?=
 =?us-ascii?Q?Ek8BJqCuv3UgITPfJhxaZ1zsafk11yljHPhkWSG+QI+v6ngKG7+zo5OdsUqn?=
 =?us-ascii?Q?tYPP23PwpbI/Ae6xriwXYh/MfP122RNRtOSn27mbAkYOEFsI/AT/yKNZVq0t?=
 =?us-ascii?Q?va++pd6kRAkTx8EX+6aCxVjBwuWfGWJS9FgaoXi7jTPM3dVpOhNrVJprasfH?=
 =?us-ascii?Q?leREzBgVL+I08sUwSpGcvrL7CmbxRg42jqkDvfMVHCxNj0nAeLYOideqVibY?=
 =?us-ascii?Q?iSI/4MTte+tTMoT438Zj4pklt8miNkqJs9AMhDdVTMBs43qdPFdwC35aKVAt?=
 =?us-ascii?Q?IXpAvL32G3Dg/Ir2C/y2ZXBVDTgvevYVfGdCw8C0CwjVdgUdGXKeranwI6Vz?=
 =?us-ascii?Q?aVko2n/HP/mvwrFOIFA5dA6DXuL6H/+Lu/Qlyetd6EY9JU/WOFj40SuwuJPo?=
 =?us-ascii?Q?ByZ1J1NNROtBUKFC4wh5SPat30Y48KhDIakh02DtYy8k+bUdjTVHUpV043ku?=
 =?us-ascii?Q?+8nBNVY2P0sdyQktwfZTGBVf6QzUIQs0BYEKeOWLISNe5X531fke4gR4/Dki?=
 =?us-ascii?Q?jp2J5Fi0X7S+UTs2LLdpWD36nwoTSws5T3RY0N1WWSmkntNIPHPib8A5Tyz7?=
 =?us-ascii?Q?v/vh3uQqT/DaDmhak0MbkovM3Qnpn2JnpO40zyI/6m8QGL/bfF4W2t1nIGLv?=
 =?us-ascii?Q?XZWLwrqCHm4NLWFqy8wBN3yiTdWEgML8yHEMAsoHIu9NEku66eDymBVMbQte?=
 =?us-ascii?Q?W2OPMP3hGTZPctHudlCzP4sY7l+JLlx7J8uX7Qyqj1NVb69iBe7yO9Q0Bxvg?=
 =?us-ascii?Q?Dlwu///71wVHu29d/RyhL/20XRTW3L13ELeSHWptIwP9PZX1Gdd+Sx8cuCkI?=
 =?us-ascii?Q?4bIW07BUC47lHzV1mnTh38yfB7sATood8+m6QQuKJdpmvK+dTwUhE7YZx/MM?=
 =?us-ascii?Q?MJAGJ7qlIYkw7fLjmGrObG8wzFQGxn6D6wNlCNlmzINbolDfuHyfmGj8SgDr?=
 =?us-ascii?Q?eq+7Z2IcXuL5uTYYT2+fziNZ64SF0hdqjA3IC4R7bH5+e0SpUl3dg3j949QG?=
 =?us-ascii?Q?MnahqFjDpOYH9JwD3jd28qRHrUz5wTXe6RWiHS4uOT8U9TWHODfkmqGbZz0d?=
 =?us-ascii?Q?H9hhUMYWRpL3QhVCbFrkLeqGq0iaS95Zm7hmaHghMv+6MtLyfNSRc2DS3nOb?=
 =?us-ascii?Q?5wiFWq60NnbAHk5ds7gRy8wtiyiDlerugoq3SkkHi+6Kc0NmM8sihUHUDqvz?=
 =?us-ascii?Q?671COgMTps+G5egL8kw0XGXRZcI6E+fIn6QwQsWwYWN/PnDdfsqKzg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aYz/XZC3BD+qehgxdGCRzS6emiH8vX13x1Qocc6xq2lJKBM9Yg6j+KJ2gB6u?=
 =?us-ascii?Q?dYhVBhRuwF3bXd1y3Vs2SvFtjXIP31jbSMvt3hHNvH8YjBZLZA+OKNgOOw21?=
 =?us-ascii?Q?1dyMvHOh+haQH2s8gj/qECsm96DH4kZ8ZwOXbUdLMlG2ULD9odV9JggFjX+X?=
 =?us-ascii?Q?wvYMwqQ+t+u/YTwpktPzc0h2uTTi775hGR/xUjabUY3yXddzPLO/dAeejhPa?=
 =?us-ascii?Q?pqZggUroWynxkvw0YxhtRwWR82mxjXqvNkeA9tiR5pokfjL3zGW+8PD6LL3A?=
 =?us-ascii?Q?TCezMlfSYBdvJ0lx3OfhTkgUu3prfysiyczePCvMcZxYEWNxr5SVycxukQiX?=
 =?us-ascii?Q?zsNDXip1ChNwBym5qRB6EVc03e1SvUiA49pam2xvCVb53pHKn5mUpLZC0VSq?=
 =?us-ascii?Q?s3x6YIjFlgZSLSf/oZcDZ7mzHJAUsPJ01AlhVFpE0MyHEABDEl/YqMPwCnyw?=
 =?us-ascii?Q?CKXSg49ORQ3Fe2PaYImxqZvbCBa9xtNx8LdvjDjdn+YBLskrt6qO01qK0idB?=
 =?us-ascii?Q?Y8HHHRO6dSJBUfbYAeg3Hf3tisiq3SbGHgGuGuWjEKcOVlgKMYdqe2o9ZtDS?=
 =?us-ascii?Q?8cu1i14B3PAv3UDfqM2Ylrlur47Wpn2/SK/gEMBvnGfp5t1nmRdIw1t2/1g8?=
 =?us-ascii?Q?SSAgkS96+dXmwsY1GtkvP3xnaXDKL3jjC6DGxKOx1Kw1/4nVEy1oZcNj0tWi?=
 =?us-ascii?Q?rQTud99VW0jTi1U3ZpZq2Mm1D7ElocUGKrDa2l2IRd9fve+XdEKEKgdXgYV+?=
 =?us-ascii?Q?ShLTfkC2+PSRNo4TOZGm15WM+a0XSKUcEuekNTbWndL3BhzPjGJBShvWUHJP?=
 =?us-ascii?Q?puEBKNWersoVpIKUXi3mKv1EB7MjFmmCEsNOOuztvX1tHWS9Tv2h08FSZtVx?=
 =?us-ascii?Q?19t2dl0cLNo5+avvlhtCQ17uwvahNT7xEquXo7dZtzoHSsGoCDlFN1DflyIs?=
 =?us-ascii?Q?D78u+V34jl9DmxFdYQvSiUEh7dnzwWH6N2Uuz948C7G1BlMxAeWFycLS0FU+?=
 =?us-ascii?Q?Yc2YbcPj/6eHhMMb0qVn+sC7sdS4Rjdvrl5F4iIHSo4BPoh9cBBQuxUKJ1BY?=
 =?us-ascii?Q?2GJ89FKrvvx4sEWQ4XV4Jb72H8DD5GS0m+twFadYoQfuqIzwgLP660pA5WXF?=
 =?us-ascii?Q?LlfXidmK7neKrSE/fPNdVUEYmf+RCrCEz0KTv+kY8FUnbX8kx6LUfdnIE8Hz?=
 =?us-ascii?Q?K6/ODoQuYvj4ifVauNVZcEcgktVlziOoVkGzgb6ZR7z/RUsAR4sxhk31XqoT?=
 =?us-ascii?Q?MPh0kxfrieCsifXnDlY2ddJINQNwckx708YaRHFd4JugrypWXyEVXJOMLunQ?=
 =?us-ascii?Q?bPt8zIp9MrHctaIMshonNSMrZOQ5JEkgqaE3SF2D80AgLS2g1VrHXtyFq62I?=
 =?us-ascii?Q?KhfapMdzoarAnr06O2Izx4Y07B8vRwfxh6NCRT+IMgllzjN92V7vyzYs4YFF?=
 =?us-ascii?Q?eu7M918qIxmcu8jRbToHyynesTdhNxQHEjOWXKvOW3OL8cX5nkqfFGcstcHS?=
 =?us-ascii?Q?zixPRz0IbV/QnapQ53neW8ebAgup+B+8L3wo9YAj+V4kv6cM/J00Kg6rwahR?=
 =?us-ascii?Q?/SeSVz54yYnPqNg+HoZs7bMkoiAkZayIewGwc7sx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743d1be8-2e40-4441-9a34-08dd669758c5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 03:37:17.4246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reTHGoXTad2ARZ9dU+D3TXOI0mSvT/ngfwI0vtcuYe1Gbs51MCnOMStmnZcUO4YdszyuVk1REdyy+YWWKrT/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10669
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With audio graph card, original cpu dai is changed to codec device in
backend, so if cpu dai is dummy device in backend, get the codec dai
device, which is the real hardware device connected.

The specific case is ASRC->SAI->AMIX->CODEC.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index f501f47242fb..1bba48318e2d 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -156,11 +156,24 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	for_each_dpcm_be(rtd, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *substream_be;
-		struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(be, 0);
+		struct snd_soc_dai *dai_cpu = snd_soc_rtd_to_cpu(be, 0);
+		struct snd_soc_dai *dai_codec = snd_soc_rtd_to_codec(be, 0);
+		struct snd_soc_dai *dai;
 
 		if (dpcm->fe != rtd)
 			continue;
 
+		/*
+		 * With audio graph card, original cpu dai is changed to codec
+		 * device in backend, so if cpu dai is dummy device in backend,
+		 * get the codec dai device, which is the real hardware device
+		 * connected.
+		 */
+		if (!snd_soc_dai_is_dummy(dai_cpu))
+			dai = dai_cpu;
+		else
+			dai = dai_codec;
+
 		substream_be = snd_soc_dpcm_get_substream(be, stream);
 		dma_params_be = snd_soc_dai_get_dma_data(dai, substream_be);
 		dev_be = dai->dev;
-- 
2.34.1


