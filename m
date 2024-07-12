Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9949B92FA0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 14:15:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=SENHjsWO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL9XJ2vzRz3fRm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 22:15:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=SENHjsWO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL9Wb1Wn2z3cXd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 22:14:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iji0/sqjnpbY1eBIlAeiEzecRI2+hx38hELGNBWMC4wGU34d/B9xEAP+l9TXfEuUEBAqqUiMZcM2VYaOQM6Lm3XGGWsgGK6JYfIvBFip8pC1M7DDEKaHVmNaJpc1k/NAc8D6u5nyGv2FcTXXx1Y2O7Lu5bk6tSS9Pj8/n/Xp1Q69mmX+gref9fZfvUgOGT54/jkQomAd08yB/yOm/NdoURMUA1odhiLiL0Bwu5nuCLD0V1rDAQHcrAEsB004+wTcw0wqkOqdoT+9GLsEklJALZtkxWVczm7OELbnus6iE+6e3DqKd1Q5uG1npJN/2alX2gAckWSV9YO1YKdWLZ0glA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP/rgZntE9b0tmOx8WkX2U4HW+/dQyIx/gcF23pQJCc=;
 b=cnlxEXFndLzmNlfmya+XNChuq21MHjt9nA4X+TzQH0PhUIwhP0FKlOUh2LnhoPBNNWX0imsU3kvrrt798fnU+kTAhWM4BR0fw9iAztAaq+54KIB8+sjiAkpZcczlpW/o7tKwZrPuFYLkMSR53GvwTpddNpp7U/cQ2yXnZLEWGblhlHIceZI1D1SQxb1wF9pn8e5pTSkp7wKZVDBLzs9tj2PUiZiBx6BsYybl0YKuQoeOR1NKZtX6gBiJ2mf22yup4w7TQAle93mJcdg4e5He6NrTjRWxMreh6ebI19YiWVQ3D8TuDGwIACsSsxvQIqZtnpkBtfnzs5Wwoei/ip6seg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP/rgZntE9b0tmOx8WkX2U4HW+/dQyIx/gcF23pQJCc=;
 b=SENHjsWOOOZ/R8RCuwq7sYqZihvFRL/9/9WzPbQmCvfxkh/BrgTDNF4cGRHwH077OPNWe/j3/39mptYcnp6g+Q+XYL4G/0EBTG9lepKYXFxfx71rexvn9k2CGbu6xFeCtaZ/2Biir9g0fUArd92W8K/czYtvw4xTm4DOOCsECxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 VI1PR04MB6832.eurprd04.prod.outlook.com (2603:10a6:803:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 12:14:04 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Fri, 12 Jul 2024
 12:14:04 +0000
Date: Fri, 12 Jul 2024 15:14:00 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] soc: fsl: qbman: FSL_DPAA depends on
 COMPILE_TEST
Message-ID: <20240712121400.bnjcexqpqgjhlmuc@skbuf>
References: <20240710230025.46487-1-vladimir.oltean@nxp.com>
 <20240710230025.46487-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710230025.46487-6-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1P190CA0050.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::15) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|VI1PR04MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 87de5cd9-5b81-49b2-4c02-08dca26c1ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Z8PHRIMoXiakr6nzisewkmsNtS7AjnsQ3U8peP4V1CAPYx3UaRJpR1fQP3DF?=
 =?us-ascii?Q?XMAtYTg9hvGmYlRfvmhJvQ4XbvAde14YOngaVT3LA3UvLd7TDgNaeQhWESVt?=
 =?us-ascii?Q?DfUEvQwuNyQXoekGEhQDjeCozVj+nHt6FsjeWOWYuDOA6O1Jh/ONvPDCAn5l?=
 =?us-ascii?Q?ZF25AvXDY6sPeQkoUz2rkjodVzjrZBFHe+qcb4/taGFwlSEus7V1C+QVPo2N?=
 =?us-ascii?Q?bbnRYifL0q6cEo/8LI7BZGGNJam77lTOygpvHd8OQpqCpCbr8OliE6hI3IWr?=
 =?us-ascii?Q?Rq5OWyjeaim4cupwKU2OJQ5IHRXKIGFFrWrIekEeljVuXTe61AjCCvUNCg0Z?=
 =?us-ascii?Q?+CcVy6cBXJsbHJqSfpJbbVEeWX9IUaXONgYIsvooSHx5dHToKxCmG4Bf1XCQ?=
 =?us-ascii?Q?6//GcbscR5xwj7zztHCztPeydpviAPc0S05eRZvmcwGpmNxCDLQqukM/a4x8?=
 =?us-ascii?Q?4K8AO1KW0iVevQbJIvHh3YS2lXF/M2ZD9zw+WmgUkbcXwiW1fRXzl52lf0e4?=
 =?us-ascii?Q?zrA0UYsSnL26Vt7Uh/uInrSSA71PV2Hh5G9Lbr2zvNbg8WjX9Zt6QFjX8IP+?=
 =?us-ascii?Q?iiP/HivlOK0KUPRvHF11aX/RmScdRnI6y2oIfJ7pIWCKvbRFkxzh7jhZCRX7?=
 =?us-ascii?Q?RJpWmCZhloXbXMjs94TY/HuUCNscrBKVFj2GWKQbBooORmxYI/ypKVfaa0UG?=
 =?us-ascii?Q?NfZiQ1bglOrJjyk/inRRC1L7AJoDjo2DAj2BRvy7Z6m/8tS/zWt8Jv1jnOiq?=
 =?us-ascii?Q?+XFBzjY8i+bUHbpPc52ewh/KBcHFGUGkOSILCilVk7pkwQ3fGdqSxjDOxKVh?=
 =?us-ascii?Q?JH15IxWo2BSAPlVdYjsxYzUyxRwo3ht3wW1eMfZnu/5mu+/boLK0p+CtKOnP?=
 =?us-ascii?Q?u8kLHx/KvDn3G8ViJuzYGoV2ShpWH8tJDqYx+E8d1GK9jDusmuXYk5gWtsTd?=
 =?us-ascii?Q?pW4bNYqlG/LgFLcPE64rXGp4paIsXEMRXeeIpgb2QHawKpX71ZoEESXnjn41?=
 =?us-ascii?Q?137rQay+tlJflRaONw936lYu046C8SFtakjx1czWnEE7X6z/PLFW1lZfGfqz?=
 =?us-ascii?Q?2EEKxnSVUo5OSEtlXjtWIyrpUP9OydafgpoNAypO4IJ7wCVAIGZ9zNwIyHK8?=
 =?us-ascii?Q?3SBLq7Kkzwf4H1sF+AE2zOAg7gT4o5NJxnhXv0NGEkB6hvJ1IhaNw1VXUT2L?=
 =?us-ascii?Q?lit2SI9DbGdo7Hd/tK8iY6mDH8PieySVbwUsS1XezPvvF/i/TGhMzLEG2P4G?=
 =?us-ascii?Q?RlJ+2Mo6JZwmFfJwOGZmT6s73+c3+Xb5KHoxpp6JhBIoYLFT7iv3miEGZ3HZ?=
 =?us-ascii?Q?aGDf6QiDvA+aeCjAzSw09H/NLTUO6RRwFh0wR1kkWAIp3w=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mwrH13oB9sYaHPABXmGBbkvCsxpWTgrfKCyUfwLCiJNmSEOqDryTlAmE5rnH?=
 =?us-ascii?Q?DtTKbHVFBjfjfD+qATpVlJVe4fuinb6vdS4o7spx7MKVbDK4DQeFhYOQ+LY1?=
 =?us-ascii?Q?DsT6L+6GOpRFhXQ9LvKxJAN/JuExNFGh2d3ARkqab4KfOGkvet1uxQhT3/mG?=
 =?us-ascii?Q?QTm+eRytWm0NgG4C06H6awmepaSShMqaBssvd1cDT64N82uMDWD1wG0BAIVR?=
 =?us-ascii?Q?OvszR84+mG0DVnl2+tH9WEm4xAQ+MopxOgPfC6hDr0OEFkN1ArxJb/r0u4oz?=
 =?us-ascii?Q?D6yhov/yMAWEhYFhOjEgP58ShPzcwCL4J0dcQnxMsxY4J+3ldfWWYMFsqS7s?=
 =?us-ascii?Q?RrR0z6wLLugNw32SBcMb7BvdWbDbKF9FIH19JoF5mko/okeNxi++ykY/EbnW?=
 =?us-ascii?Q?O7rYvG64VB9Eo2uH/V3GoP//6czuHH0BS9kFas/TwxZMOlU+cJMAnqKRmb83?=
 =?us-ascii?Q?DI/zxmEgoRVLADubf3EwwFzfj3Qez/d2TAjrczHUsaoa+SH/Qv0YQ1po/ZCJ?=
 =?us-ascii?Q?YXLam+lPx/IrZ2T9IHXm0eZbNXbzKtbCqAL7nGoYk9/T+/DEjQKjm2oYVqaT?=
 =?us-ascii?Q?ZSih/BR6QuxFdV1hTdK+nYMeHfoYfEn8UINWA9u+7Xs8f9Fp3r2cmv8lPR/Q?=
 =?us-ascii?Q?hgkgCm5/IScgGGJb3ynKKuBcjpvxXlVcN6rsJHskHLCM/wHGeXBi3sKREek1?=
 =?us-ascii?Q?6Oke8tX120IQsoQ5hbPiJAqCSz3gsk4AE295BQCCAhfsu8+6C9iL1CX5q/jP?=
 =?us-ascii?Q?sELk79g4mw15HBfvVuTeBgFbqeXEH0Q2fNBlqSuBrTqVzSndLVimYykYNHSs?=
 =?us-ascii?Q?X72lmaR9GeFnDQZugokKQ8OycDBXXmIajQd9P2zqFnUKzPI2qgI13lPDRkwo?=
 =?us-ascii?Q?Z4jlvkmRaWcLqKO8JjGkwe3wU3oMl/mdis9p/xbztc7juUrBy/obcTSrCLZa?=
 =?us-ascii?Q?FQt6ZsD+KHh9dwh6ZHaJ0kfGZn+XiRtKILpmPF16VMAY7KTDiBZ8j8co1NKG?=
 =?us-ascii?Q?WcfaD2N+ECEKChd7DOen2JZ146sqgHluC/Yf4wW09i+5gDk9+ssQfE4sAmM0?=
 =?us-ascii?Q?JgkJ9SsDO69h88q5sAgv6ItFMyTb1TjAtgvu40jM5kjuNeZeWy5y5cVdbYXv?=
 =?us-ascii?Q?r1F2VF2nIbWjhSXKUM7k8mvJ0jedmkqR3kumMMrKD51uMx6z5v+UsMRaZq2U?=
 =?us-ascii?Q?Zj+B9gPW3K7DccgQ9Ur691zEIu8y69QcnqgWyKKQZnIXT63nqDE9ZfaMvj+3?=
 =?us-ascii?Q?nNyQWS8S5KzvWlMSz1ean5Bsu1W8Tyna+BsM/2kog9B3ETHrXA0IkVeX2vfD?=
 =?us-ascii?Q?/oup73O2JRE81iSLeXXue4cSiPtRB+VIj3Oa46ksfbaSmO/NiYRcp0xVKQoY?=
 =?us-ascii?Q?AW3Q87+6S2fAXd7sYWjpSEsOMqGK4/jO+5okRNvLknwmtEGh19BsQGF89ABU?=
 =?us-ascii?Q?Ksp9hUTHvlnNz7ei1ApTL+PUA53UUfF4SAS43lBgnWt5fRAYRfDA3yaRtM+D?=
 =?us-ascii?Q?h6oy0wTrGiUOMgwcMEjd9H05zLMWso2lSDXH1qaCv2rKERc/2NKs0KiSngIh?=
 =?us-ascii?Q?SLMlM6EOABNehBUFU1gNywbeufZIUWp80r0bDVeolI0mL3vTULU7kwSqRW+D?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87de5cd9-5b81-49b2-4c02-08dca26c1ef0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 12:14:04.0394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srUeFOSCBLcL+Qy219mfEp+DYlV6x7a+XyrfiYZpIngJEwjOsPv+7GKTEe+ysrm2O9RIp70Pv+BS9yhtvyryJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6832
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Madalin Bucur <madalin.bucur@nxp.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 11, 2024 at 02:00:25AM +0300, Vladimir Oltean wrote:
> From: Breno Leitao <leitao@debian.org>
> 
> As most of the drivers that depend on ARCH_LAYERSCAPE, make FSL_DPAA
> depend on COMPILE_TEST for compilation and testing.
> 
> 	# grep -r depends.\*ARCH_LAYERSCAPE.\*COMPILE_TEST | wc -l
> 	29
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---

I don't know why nipa says there are 800+ new warnings/errors introduced
by this patch, but it looks like a false positive (or I can't seem to
find something relevant).
