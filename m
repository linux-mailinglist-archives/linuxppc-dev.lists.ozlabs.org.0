Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36818934F53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 16:46:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=sApcrNAB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=sApcrNAB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPwcD140yz3fR3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 00:46:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=sApcrNAB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=sApcrNAB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f400:7e1a::62a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=szabolcs.nagy@arm.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPwbV1ZXhz3cTf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 00:45:55 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YrRi2jYX2XI281Wb5oNQdJ8pyQPAEZKtCeivB1uZoKfjT3JH+uuUa1mEPk8CgSF1tADmjsZqlzMBlTu4WatjzC9XpAEgUtOOFgT6+7qNsMuCnlrLzsdyuTmV4MaHDtbKhCX0OGKCgIJWSzwlJ5OASYvcPzfkvvq+uWYTEbzWeJNNFJz4HY/9rt6pHwO4dDLgm9SX6zMqeEPoQwsuL8lBCYD8G6G0aU8hqeOpUmNOlh9sacIssWhdLS22wtpumfWtfxPFBJNR8AG41JWtx2CaJPf4UyplbdRXnsiP0/T6J8glOrF7qlHd3JdGwkNDMpKYYN/QnMEvORh7VG7HFvsYig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4EicoIga3irNfep9vd/yS9f61b9izPttbB5R3om0HY=;
 b=IXjtGAaCSV2WKb6YyyKk4RTxoqQnHZp8q65x8wHTmHQ06hGrKQjRd7JkBVJOkQZ2hFUvX2WZWoEbirgx29rS/+jx6QKRC1JE5Q0KI72ISaoo+dbC2hrAn+QEgTowln/83TEqleVI0yqhXM9NmefNAHCWlkwUbSor3DPgdSvPYqJghIvX7543qwdjVZYOdZxpWMj/aLcpfPITvDcDiJ3k31RvpsHvdfBpXjc1Ny+j3O3tApHek/scbDsbx/vn7VX7sc16Qwn8YohqJWZL857LeH+iG+fnzz412m/xTOd95C4VRtyV4h+XwArQ36Vyt0+jGK1c98QN93HJnaxvXwtlsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4EicoIga3irNfep9vd/yS9f61b9izPttbB5R3om0HY=;
 b=sApcrNAB9BE/WAfUq8zR6qnODd3pmMY6n+eJCS5B00scn2hKlHhyZl0IK5YEGndEt4vgfGxCjy+nDg3lHj3Pi3dinXSw8f+pMV5FELgrt+DRIuqzlZBk+fCHD4xbu7WDbjeQRO0HeFyxM2mGxVX5KZS5/gKu/wqZ04XQx2tZ0xI=
Received: from AS4P189CA0059.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::29)
 by AS4PR08MB8141.eurprd08.prod.outlook.com (2603:10a6:20b:58c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.31; Thu, 18 Jul
 2024 14:45:33 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:20b:659:cafe::b5) by AS4P189CA0059.outlook.office365.com
 (2603:10a6:20b:659::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19 via Frontend
 Transport; Thu, 18 Jul 2024 14:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.5 via
 Frontend Transport; Thu, 18 Jul 2024 14:45:33 +0000
Received: ("Tessian outbound 0808e8e76ea3:v365"); Thu, 18 Jul 2024 14:45:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 353639cb5c53a94f
X-CR-MTA-TID: 64aa7808
Received: from Le5933fce3642.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF32D5CA-27E6-415C-AAE1-B7587D42A90A.1;
	Thu, 18 Jul 2024 14:45:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le5933fce3642.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Jul 2024 14:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPBVG+5adpoDeOHQonqzv6CMdIcdxgNOyKV5p5nFy/TMTIF066/wY/XtLV7u6blIQ3X2x8q6+MFM/ctetJSxZ5niaKcSOmCkP1egIjcNuoWnhD5cvciL5/Tzr16COvS04ybs8MhnYWWNwZesh+ZbSrqgMBXab7y0WyrN/hDvy3Zfmup23py4TobJRuxd/QwaYj2EHkN1XKwJ7PAo/xqOZ1bUSS2RBga/M1cOCzMxz37/Wr2JY6j1wz52deo9z3g7lnn3Phtg632Vh4pnPeV1jGjL3hg+HEDI9ON3pt9uF1MVGFJJ5D3zjUbyB9DhiOmw5vSbXNrwKgeBtAi915d9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4EicoIga3irNfep9vd/yS9f61b9izPttbB5R3om0HY=;
 b=usjoHcF7H5QRL9+59sMp6xHdkJoRfcg3y/eWQOujhRSntQdH8Z2YOSGkAXvdNaKSXdr9oeiHH3x9TQIio3fCYAcil8uJBAUjeMNBfjAwvAFh8yMqFjfFv1pII1tncBy1JmXOuPw6gvM/DZz/BuKjpAe2Jeuexj3lX6bbQTGiGH8rcsbfjdZccAGKdKsSEfvP36q0GRxtq6r3leqjPKv4xdo16UMlIrUGpEhLHbRA3xtUmUT+0DE87Znz+s2/soDVlUnI33pg1DgPe6YR1OjiBawybU1pfhyU8+kDYDD22vSjC5ApnPd+fpA9M5mgJnzPQL+G3cgLcGs95qpgPpkxhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4EicoIga3irNfep9vd/yS9f61b9izPttbB5R3om0HY=;
 b=sApcrNAB9BE/WAfUq8zR6qnODd3pmMY6n+eJCS5B00scn2hKlHhyZl0IK5YEGndEt4vgfGxCjy+nDg3lHj3Pi3dinXSw8f+pMV5FELgrt+DRIuqzlZBk+fCHD4xbu7WDbjeQRO0HeFyxM2mGxVX5KZS5/gKu/wqZ04XQx2tZ0xI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by GVXPR08MB7822.eurprd08.prod.outlook.com (2603:10a6:150:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 14:45:18 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809%6]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 14:45:18 +0000
Date: Thu, 18 Jul 2024 15:45:04 +0100
From: Szabolcs Nagy <szabolcs.nagy@arm.com>
To: Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <ZpkqcGwdkK78KBZY@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <ZlnlQ/avUAuSum5R@arm.com>
 <20240531152138.GA1805682@e124191.cambridge.arm.com>
 <Zln6ckvyktar8r0n@arm.com>
 <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
 <ZnBNd51hVlaPTvn8@arm.com>
 <ZownjvHbPI1anfpM@arm.com>
 <20240711095000.GA488602@e124191.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240711095000.GA488602@e124191.cambridge.arm.com>
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR08MB7179:EE_|GVXPR08MB7822:EE_|AM4PEPF00025F99:EE_|AS4PR08MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 058a7727-b1dd-4d87-5994-08dca738475f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:  BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:  =?utf-8?B?bHduTFVjNlR0MHlWeTYxbjN5OWhuSjczLzQ1MHJzMVZQOFg0QXlJVG4vY0h4?=
 =?utf-8?B?OFZ4dXJ1RFluVGdMVCsyanU2L0gyY3l2bGhNK29ma1lyMXE4ckpVNHl4L1BF?=
 =?utf-8?B?Z2QwdFRnNmo4aVRsZzZsVVJ2NHBIRHpPTzNvd0RycUtRSG13aUNqVnVBM1M1?=
 =?utf-8?B?aDAvZTN3ajNSck9JSVRlenVnUVlPOWZFZkorenRHMXlvbmUvK2pEcllIRmFX?=
 =?utf-8?B?WHdrbjhySGs3WDhVeEprZTJFdXVKTm9oc01yeWUxVnR6VDhiZ3FTckhUekxU?=
 =?utf-8?B?ZUJ5K0pIYis1UkxZdlc5UmtoWHp0Q2FTeC91N0kvbVVXVTNFVWNOM3piY3dG?=
 =?utf-8?B?QytRdXYyRmFrOW5HcUlldWRMQ3M4L3h0M1dSK2Y0NE0rMHBZQThyakEyQS96?=
 =?utf-8?B?RHRuSDRQMUVIOWZrUDdqdFZDN1NmbFNuZ0RzNmcvWWdKZGJFUEpESDZMdHYr?=
 =?utf-8?B?WXdSNUJPQmxEZDJsQ2VYSVFiSGpPa2NHOHYyNkROc1FxMDhrTGh1K0FTSWs4?=
 =?utf-8?B?bnJISGtIRlJzVFQ4bFVIM1pZUlJPKzdQcnJIWVBNNENiclJpaE8wNXJlbVJ2?=
 =?utf-8?B?aVJDeUNwVVNTMEVFbEFtSUZIK3FJdmpUUHhGc2ZpZVhnWkh1cmROcnRXWjRI?=
 =?utf-8?B?ZEdDbkQxWVlJSFlJZklhSWdtYk9kQWV2RUxPTjhXZ3RYQXBmeWpqR0VySTY3?=
 =?utf-8?B?UXJLNmdNT21YcmtXbTJmK2ErbklMeFFmTEdpaTlEZzB5U1FnTzg0V3FwcGdI?=
 =?utf-8?B?aTRXamxNQXYrTlhrT0FGYis5TDBXQ1hHZUtIZmtSdWh1WU1ibVFnN08zZEVP?=
 =?utf-8?B?YWlVaTBZL2tCZE1ZaWY0SjBQQ2tJejkxNWQ5dndtQ0N5TGppQWNXYmltOTdt?=
 =?utf-8?B?N2kxemhyMmJUMUhDRURWN0tXS2lWTWxKZVN4ZlNEejFuWVhaSVBVU2hrQTFQ?=
 =?utf-8?B?YmJyRTJHelY4bEw5RU41STdUT2xXK0VIQ1pLZmNyS1c1TGx6SVpBOEt2MDgw?=
 =?utf-8?B?Y2c5WTk0dE1zNkNIVGV6ZEdBdUMxWjNiSmpLYjFUb2FOZHdvVThsS1JnbEpo?=
 =?utf-8?B?YldWYk1nQ0NvcDRvVEJuQnVwUTJnSGlndzNGLzJNdGRSOVlINWhMS2I0UXd2?=
 =?utf-8?B?bXZNTkthTTQ0V1E1UzRNdytxM3pmTlh3WlJTQ2xHdkRweEhmRVZ5bGxNRFJS?=
 =?utf-8?B?RnhYZEtnWmRaK1VTNmRaR1l2d1JmUVpVVStkN2hEUTB3Mm1qUVlQNTVBOXps?=
 =?utf-8?B?OXA0bi9DaUp1RlhJd3NiVnVRWUJGVWZEK090d0o3WkNwTzVkV1ZxUW1VRCsr?=
 =?utf-8?B?M3gwU1BDbGlCTnZmd0lGUkJ1eUd4bmJOckhGaGQyamZrSHNzLy9nTDdDRU5N?=
 =?utf-8?B?NlJBN1pSTFlaMWxXMGUySVR2U0I1MDBGR25PT05zMHdiRVpzS0o0YTFsWEE2?=
 =?utf-8?B?bGVMdGQ0RHpWdmFOeko4SnVtV01lNjlpV2xYY3dZaDYvWFVGVm5qcUl0Z21H?=
 =?utf-8?B?SG16ZjVZQ2VXaE9ZN0VJQ2xkMXZ1Rnd0cm5GMkNncEF3R1FhbXp2SGZDMkdr?=
 =?utf-8?B?dFR0UWZra0pndmI3UldsejdQYmVOVzJVNm9ueUhSR0Z0WERaZXJXYy91N0Yz?=
 =?utf-8?B?RzNPekxFR1Q2Z1BQK0FNaGZ4VGFYNkllRlNCVThwdG5rT3ZMTmtmTjBrUEt6?=
 =?utf-8?B?bFhTZnVERGFwTWhUR1lMV01Fdi85Wk1DRElHd2U0YTVwTEhwNUdqZ1BmMW8x?=
 =?utf-8?B?MVZYNndvcUlEVlBuQ1dEcWJWbFM4amM1V3BVUjhMNGNTRjg4SXNXbnlDR2Jl?=
 =?utf-8?B?YXZiTFhGM3VGOG5OQTA3Zz09?=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:  ip=[2603:10a6:10:2cc::19];domain=DB9PR08MB7179.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	7fffc864-169c-438b-8f34-08dca7383e3d
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|34070700014|36860700013|1800799024|35042699022|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?endNT1hZc3Fzb1NWd1R0bjd5V3FOYlRFUjFIZFR5bFV6ME41cHJ3QjBXa3Ay?=
 =?utf-8?B?TDUya2dpb2NOUU9ob0xKUVFMNzBTL3cxSHJVZkFPRjk2aUdodkNyZ1JUc0lE?=
 =?utf-8?B?RS9vUzVsWnlxUW9EdVRxYnp1TUZpbkF0UitqMWk0TDUrZTg2ZVA4K2R5TVJO?=
 =?utf-8?B?NFdxb1o4dEJmWU10dEdFUW1HMkZEUC9lV3YxckhXRStqeTZ6Uko1MFNXRGoz?=
 =?utf-8?B?QWtqSmM5U2dmd2hJSktOQjJNTHlVNGUxRGJaeFpsYmRIOE5XVGp0a0RjVEJP?=
 =?utf-8?B?TjB4QjA2Vk9kZmVhVEFZcklJRWtDRVBDV3ZwRGthRVNsV3BTNDU0SXczd0VH?=
 =?utf-8?B?UWJkcVJKTDk3enBadHF0UWZFTW9BK09Xd0oycGt5MklSdXVFQ3RWWUR2WXNY?=
 =?utf-8?B?bUIrcDlqQUgrNGJCQ2NsaFhGMU9WeVo1TGtVOFZWSUVDREo1Zm9JZ2ZEOG00?=
 =?utf-8?B?ZkVuWVlnVXA5UC9Kd09WUXNLRm1WZllpWStjdXl2TXRxUGpxNTU2NWhTMTdN?=
 =?utf-8?B?NE5ORFY5OFFxbW1yQ2p0R0xqWVJkOXNIZHVvSjRTTDFXYWdQZWpYTTY1WStY?=
 =?utf-8?B?YVhPajZZcXNwUmgzZVdQOERPZEc0dWlpSmVmOFBBRmg0UzQ1R251TW1ZdEda?=
 =?utf-8?B?M2hOcWJhTEV3RjRYRVN0NVI3Z2g2MVgrUmNFUnZzdHVtblJKTnB2Wk9DQVNU?=
 =?utf-8?B?bkJ6b2Z0bkRQUmtqREtlMkQ3Umh6clhtT2VlTE9Od1RYUmJHc0dBME5wdmRS?=
 =?utf-8?B?aE1EZkhwQzI5WmVVcU54VS9XUkdQYTBuTklDYmg4N3ZFa1VMM2I5ekFtellK?=
 =?utf-8?B?bzF6U0twaVJnRkxHRnBGdTBuQVZjdStVYUhGMWU5S3hGVm50NVhSTkd3L0lJ?=
 =?utf-8?B?TDJiUzl1MVhDbDJ6VmhkbzhkQ05OeEwxVU1OQWdEZUhDSkxqdTRWaWU1QzJs?=
 =?utf-8?B?Y05EMXpVVW1iQjIyejRJZ0NPWUxuM1hvZjVxZktXb05GZlpyOE82VHJ0bXZ1?=
 =?utf-8?B?MFlNZGtvNytvRXlyMEFRd3hTejg5WWZUOHl3ZG1SWnpCUStLcFBlQ2VIemJ3?=
 =?utf-8?B?Rm1YU0ZlZ3VJelJuNVBvbFZiSVY0VHlabmZMcjZEc09nZ0RxQS9odUozWk1Z?=
 =?utf-8?B?Zy9LSjBWRVlWb1hFZUpQN3NBQzRtT3ZkM3RQNzZWZ2JuYWJkWFd0NmtXdndP?=
 =?utf-8?B?R3BjQUJkRmFKSy93QVB0ZUJ5anQxOEozUWRDWmlTQTBOY21uKyt3SXNMK2ln?=
 =?utf-8?B?UVBaR0ZlZHBnNFBzTm95SGtkQng4K2krc2tuRVBqanBlRFA2NG5DcWJ6U1Zy?=
 =?utf-8?B?ZlJyYmtqZk9DMnUzUzBsV0s0Q2ZnWnV4UkdoQnI5MWFsVVpLYktydVg5dk5Z?=
 =?utf-8?B?cmxlUm9kaW9oSnlKcnJVUCtVM21INFBvQ0hYS1ltMXNVa3dRN2d5VkJVdE9T?=
 =?utf-8?B?aGtVRStMVElQYXVVbmlUQ1RGdWtwaFpYRFo2NFJFbXQvUVBVeHh2MkxXWG13?=
 =?utf-8?B?L28zdzEzTDBZQjdzNDh5aW94TjdpZCtqWGtqSFRjNHBxOW5XTEN1MlVvRUlH?=
 =?utf-8?B?YmwyTkN3T0Rob0xpRHhlMDZiQ2RDNzgydEhJa3EvZ2hYRmxFWDNaaHA4eUZS?=
 =?utf-8?B?RTI0OSt3cXZZZEFVKzZNNVlQR05IZ3BjY3JPUEtZNmVaMDJoL1J4TlRWWmVB?=
 =?utf-8?B?S1JPeWhaN1o5Q0dvYzYxTThsNWxTZEo5RG1QTG9GcE5xZjVaMk9SWFY5QWYz?=
 =?utf-8?B?VW9SYUZiU2syMWs4LzlWVlR3cFdzNXZ2SC8rNWxSQUdzdlhkWHdJZnZEWkRk?=
 =?utf-8?B?R2dxUmlMSWFkb0tScTRSMXg1akxCblhHdU5QYklhWW9ySDdtRlVmUXQ3eVhQ?=
 =?utf-8?B?TXFNMHg1UGoxb2g0YmNlU09FSHlRVldQZ2tmY3ZmVXpSWkYxd1Y2S0w4dFUz?=
 =?utf-8?Q?3M+wvFky/k53ttAO5s2JYFLklugrW8iv?=
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(34070700014)(36860700013)(1800799024)(35042699022)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 14:45:33.6581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 058a7727-b1dd-4d87-5994-08dca738475f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8141
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
Cc: dave.hansen@linux.intel.com, linux-mm@kvack.org, yury.khrustalev@arm.com, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, Florian Weimer <fweimer@redhat.com>, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 07/11/2024 10:50, Joey Gouly wrote:
> On Mon, Jul 08, 2024 at 06:53:18PM +0100, Catalin Marinas wrote:
> > On Mon, Jun 17, 2024 at 03:51:35PM +0100, Szabolcs Nagy wrote:
> > > to me it makes sense to have abstract
> > > 
> > > PKEY_DISABLE_READ
> > > PKEY_DISABLE_WRITE
> > > PKEY_DISABLE_EXECUTE
> > > PKEY_DISABLE_ACCESS
> > > 
> > > where access is handled like
> > > 
> > > if (flags&PKEY_DISABLE_ACCESS)
> > > 	flags |= PKEY_DISABLE_READ|PKEY_DISABLE_WRITE;
> > > disable_read = flags&PKEY_DISABLE_READ;
> > > disable_write = flags&PKEY_DISABLE_WRITE;
> > > disable_exec = flags&PKEY_DISABLE_EXECUTE;
...
> > On powerpc, PKEY_DISABLE_ACCESS also disables execution. AFAICT, the
...
> Seems to me that PKEY_DISABLE_ACCESS leaves exec permissions as-is.

assuming this is right the patch below looks
reasonable to me. thanks.

> Here is the patch I am planning to include in the next version of the series.
> This should support all PKEY_DISABLE_* combinations. Any comments? 
> 
> commit ba51371a544f6b0a4a0f03df62ad894d53f5039b
> Author: Joey Gouly <joey.gouly@arm.com>
> Date:   Thu Jul 4 11:29:20 2024 +0100
> 
>     arm64: add PKEY_DISABLE_READ and PKEY_DISABLE_EXEC

it's PKEY_DISABLE_EXECUTE (fwiw i like the shorter
exec better but ppc seems to use execute)

>     
>     TODO
>     
>     Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> 
> diff --git arch/arm64/include/uapi/asm/mman.h arch/arm64/include/uapi/asm/mman.h
> index 1e6482a838e1..e7e0c8216243 100644
> --- arch/arm64/include/uapi/asm/mman.h
> +++ arch/arm64/include/uapi/asm/mman.h
> @@ -7,4 +7,13 @@
>  #define PROT_BTI       0x10            /* BTI guarded page */
>  #define PROT_MTE       0x20            /* Normal Tagged mapping */
>  
> +/* Override any generic PKEY permission defines */
> +#define PKEY_DISABLE_EXECUTE   0x4
> +#define PKEY_DISABLE_READ      0x8
> +#undef PKEY_ACCESS_MASK
> +#define PKEY_ACCESS_MASK       (PKEY_DISABLE_ACCESS |\
> +                               PKEY_DISABLE_WRITE  |\
> +                               PKEY_DISABLE_READ   |\
> +                               PKEY_DISABLE_EXECUTE)
> +
>  #endif /* ! _UAPI__ASM_MMAN_H */
> diff --git arch/arm64/mm/mmu.c arch/arm64/mm/mmu.c
> index 68afe5fc3071..ce4cc6bdee4e 100644
> --- arch/arm64/mm/mmu.c
> +++ arch/arm64/mm/mmu.c
> @@ -1570,10 +1570,15 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
>                 return -EINVAL;
>  
>         /* Set the bits we need in POR:  */
> +       new_por = POE_RXW;
> +       if (init_val & PKEY_DISABLE_WRITE)
> +               new_por &= ~POE_W;
>         if (init_val & PKEY_DISABLE_ACCESS)
> -               new_por = POE_X;
> -       else if (init_val & PKEY_DISABLE_WRITE)
> -               new_por = POE_RX;
> +               new_por &= ~POE_RW;
> +       if (init_val & PKEY_DISABLE_READ)
> +               new_por &= ~POE_R;
> +       if (init_val & PKEY_DISABLE_EXECUTE)
> +               new_por &= ~POE_X;
>  
>         /* Shift the bits in to the correct place in POR for pkey: */
>         pkey_shift = pkey * POR_BITS_PER_PKEY;
> 
> 
> 
> Thanks,
> Joey
