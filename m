Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861092B232
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 10:34:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NLMuXB1o;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NLMuXB1o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJDmV5jJ5z3cXN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 18:34:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NLMuXB1o;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=NLMuXB1o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f400:7e1a::602; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=szabolcs.nagy@arm.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJDlm25z3z30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 18:33:19 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Nm7AAGIwgC6q9dhZnn8DSI5v3PUJ39BuFqjn6HMZmuW+ogdlWWvRCWUPe1fhsA0ju2u2HCX3pr4nPTiORa2EiRGkOv6VJP0Gj0t8c1LbsRTebGr8+Cie+Xd64x+g13L08c5MBgmkpNKitllFobunuLN/p5GxhmgmFBv9Ff1B356tG441IDl8dGCF3DobCMaf6ZxqBnq+y/SK/p+c+HrckWXWu/zUWXPxhHk4WF4ucxEr9Rkcx9vEEEYD00KY/r0ndmDdMTxYPs48KkfnrHmoa3cPorAhrBIDBEQ5ofM/Z+1akdwQ6eylt0FayPbPi3n6wmh6RFOa8EhH8VDM8s9s2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fa+/cBsfraTPLWRjUaTedFIB+misiBywHLb6+XVNAvg=;
 b=C4Mj6A9JkotLTbHlO50ECMQF41FQ/SQvn4HbNqgD06wyi4ddkQB56sPMu71nJtcdtxTbdeMYeVLL3w8RgT4Kdx/FuqgMsxRmRasDtdErNnBNu/g14+VSw0TrB63GzOuEDWO/XuVcZ9JpM51rx9nLPHMuw83IAxTInloUwmrAI72PF4a99zwz5ZmB7xcvafpHyXxfJqiUopk0f344nVRuU42m5JL1G4QpRb3yWlvT6CD3x0IPR4xTWi4p5pnV8HIOrrWw/C2A7rxn2isEQwm/09dkziVVf4FG26KTSmU13qqTRxarh2FPB6fKRY9ANdhLEf5/VvrhPSalQwILQWXq4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa+/cBsfraTPLWRjUaTedFIB+misiBywHLb6+XVNAvg=;
 b=NLMuXB1oez5YyZVVgHKZVhT5FI3KaMF1SfGAmcPT+CwoAaw/Na85P2IFCTvcudr1mRG0gtAc1BaVBCfmOHUytNkaCfhHYR1XNHA3INGDLDb12FGcnqr9PLI/lJ2Dgl6b7wtSD9ZKDrn4JevkXWNbtIn3KnL3RQOGLixeA92m+Qc=
Received: from AS9PR06CA0042.eurprd06.prod.outlook.com (2603:10a6:20b:463::27)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 08:32:55 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::25) by AS9PR06CA0042.outlook.office365.com
 (2603:10a6:20b:463::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Tue, 9 Jul 2024 08:32:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7762.17
 via Frontend Transport; Tue, 9 Jul 2024 08:32:54 +0000
Received: ("Tessian outbound 7c3e8814239e:v359"); Tue, 09 Jul 2024 08:32:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f64dcc8c5b7c941b
X-CR-MTA-TID: 64aa7808
Received: from 34990bff5547.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 635D81E7-D5B7-4838-9F51-AE528AEE27A6.1;
	Tue, 09 Jul 2024 08:32:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34990bff5547.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Jul 2024 08:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lj66p5Bbg3qbGUNS4u7VmfhPrbvMf7D7KOXbohf10gDiP4fOm9P37SpcvH4semFb4ygHD5ElM5P84t6RmOkjdyA33jHnUIRnuMaXON9RzbOPVsLh+6edZx6m4HzJJQMG9JljZR0nYc3z4m2QRDH4PoFwEIwZUJAvaa3dZubjuQzm83mJDvQeZLCaOxgrWhjAHjU0hNo2KQODsUnGEeqMeeJbiYlEqtOYPf/1GTMKsKakvnwMV0Uz2oie6AJz2GGjRfmXdZDeP/Yd5V83mQHEZcHLquPFeMXEO0a1vrl36Pg58nGTd/QouojdPeY7RmVyzMbKRGcK7ecBz5pyYIZQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fa+/cBsfraTPLWRjUaTedFIB+misiBywHLb6+XVNAvg=;
 b=bxVubXjY7fTFxPhxKCCpV7/dIM9n0A/tXmEvmOV+JjTjUrSivam+bK4CF8lJtAu2LZF6n3u8Fr2u3G1G1gx3iTsbrI5SAa5l+xLfSDgHGlQp2jQ2pwDdkecM0nA6OeoXZm0CyX4A5puKQoUNFpFxb2XswCWLyocURnfuS3KPXHtT/FmmgevB/I8i2MjJIhdFgb2gwfX0hRftrYCf+XZGVffpjNrK0wla8xKee5LwMkmOCJ7GNyTEXbf1sg0Dj6kT6OmQz3VOg9xuhRxR4D/HBRz0/lFJvFqgCueEVX9JYTVaZbaPTRmZ7g+wXBAWmXLrgHYOCKAFg1K7S+j6bRBsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa+/cBsfraTPLWRjUaTedFIB+misiBywHLb6+XVNAvg=;
 b=NLMuXB1oez5YyZVVgHKZVhT5FI3KaMF1SfGAmcPT+CwoAaw/Na85P2IFCTvcudr1mRG0gtAc1BaVBCfmOHUytNkaCfhHYR1XNHA3INGDLDb12FGcnqr9PLI/lJ2Dgl6b7wtSD9ZKDrn4JevkXWNbtIn3KnL3RQOGLixeA92m+Qc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by AS8PR08MB10361.eurprd08.prod.outlook.com (2603:10a6:20b:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 08:32:35 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809%6]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 08:32:35 +0000
Date: Tue, 9 Jul 2024 09:32:21 +0100
From: Szabolcs Nagy <szabolcs.nagy@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <Zoz1lbjrp+y3HXff@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <ZlnlQ/avUAuSum5R@arm.com>
 <20240531152138.GA1805682@e124191.cambridge.arm.com>
 <Zln6ckvyktar8r0n@arm.com>
 <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
 <ZnBNd51hVlaPTvn8@arm.com>
 <ZownjvHbPI1anfpM@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZownjvHbPI1anfpM@arm.com>
X-ClientProxiedBy: LO4P265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::7) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR08MB7179:EE_|AS8PR08MB10361:EE_|AM3PEPF0000A798:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: be35fe40-5943-4994-0579-08dc9ff1ba93
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:  BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:  =?utf-8?B?S0wrRXVOYldzS1lSZDU0QjZHTzZKTlM5RzkwSkF4cHpOVVMwTzVMN25qajln?=
 =?utf-8?B?bm9oazNnNlMreXBzWFQ0UmFUUmJHb2RUa2FtTUVWR0g4dnZNTWI5a2tRbE5p?=
 =?utf-8?B?blUyMk4xd1k5OTVNRSt2Z2VMRnFIbzBadTBjelNySW83NzkzSllrTjFIMFhn?=
 =?utf-8?B?UUszVnRUMmZ3WGVDMnJ3ZDkzMzN0M0pzNGcyZTZWd0I5cmxVTWZVYXZrdGhj?=
 =?utf-8?B?K3ZPTWxaL09kMTJhdE5DQ0g0ZUtnYjhHSEhoOGlFUFZYc2VuR21yRWw3Smcz?=
 =?utf-8?B?Z2N3Q3BKVlJVQ2Z6SkJxTUw1dkhFaG5BeEVuMyt4SmNYWnRUNlV3MGQ5K1kv?=
 =?utf-8?B?L2RTb2VYNFIyU09LRDBKbUU3dzBudG9YalM1dnBtMExYNmhTcDhWOEFHQzVF?=
 =?utf-8?B?ODkvRkNBdkNTMndiZnJTZnlmK2E0WWp3VEIySTJTQkVQM0htNW8wbVkvb2ZO?=
 =?utf-8?B?ZG1aeVBkSTFtL2pWT2RzS2dsSjc3amxaa2dUY0hUMkkwRzhyaFBhYXFrZXFB?=
 =?utf-8?B?L2dRRzcrMEcwUkdqNFljNHBUbXZxbGdXNVppYXNTaUlaWDBkVXJNQ0Z2akl6?=
 =?utf-8?B?azZvcjFKeTZRL1hsRDYrMVhlKytkVzFqdVlCbHBXYkVsUTFOQXBZc1dZSVlx?=
 =?utf-8?B?aDRGMGV4WlJKbFEzRzZjVVhHS3BzWHJsZ0UwS2s4T01YdWUxTTJEbWVKSTUw?=
 =?utf-8?B?T0JMVTE2eWg3Q0R0Ylh6TmNKV21jeE5JdzZueGZ3aTlYMXhnditQenFSRUxp?=
 =?utf-8?B?SFZwb0hZRDFqTDIzSHFpTUI0YncyUGQ2aWlSeGRJaVlHQWd6bGtmekRocHhq?=
 =?utf-8?B?SnVmV095aXI2K2dVaVhrRUhFeEl2ajNjU1RwTTZ4Vk1oSmpaV05LcFhTTW9p?=
 =?utf-8?B?R2V6TmJqZWFSY2ExWTlTVWhEM3ZMQ2k3d3FWRTJHRDRvMTluc2pKRk1xUlV4?=
 =?utf-8?B?eUxPZkZDc2drQ3JmeXZhTHNwWDlrZnVOb3JNUTYxV1pXY0I4ZTU1dDE2eUVh?=
 =?utf-8?B?YWhrZ2RwTzJEOFJiUEtCRWFKSlhlWFA3R2xHSW5xQmErelpsbzhIanA2N2lP?=
 =?utf-8?B?dU8vVkc1bVhmRzZzeWVacG96bEpvenF6WDBuSmRmWmlVelVKOUx1cmw4dFIv?=
 =?utf-8?B?Qk1XRFhmMG9CcUNhd1V2T3FzTW80dTF0Wm4xdWcvRnlZNC8rb3lFNS9KNlpN?=
 =?utf-8?B?RmpDMXJXVWZaUHdNd3FSeGpzNXVHYTYrdmp3dXFxRlJSQzVDazYzTG53S2lZ?=
 =?utf-8?B?d2xzTmpGQm53U3lISFh0V3BCSmFCanZFdksvQ0IzV2h3N2NhWGlJWTlOdlRJ?=
 =?utf-8?B?ejJHbjBkRkZkTCtRekJnSXM5MFQwMm0zQm4rV3AwaFk1dXhFSDZacTdsTmM2?=
 =?utf-8?B?TXhPaUlRZFJHVTFMQWtoZEtEcnk4bHZseHFYU1NvVWwwMXFYTHdTT3QwTjYx?=
 =?utf-8?B?eS9LNHBqTmVuSVcyMnpZUERQTHJDVVI4QzgwVkZNWWIxMGZEd08renVUdmlG?=
 =?utf-8?B?YjlpY1cwSmVNeFF5ZC9NVDBuYTU5WU9VcGtjdC9ncUtkcVpBSkdxcUtqVVdp?=
 =?utf-8?B?ZjRvMXByeXdNc2FPcHJETWlEZXpsOWFJV1pCM204bEl3aE13NkJnWDBBbzdP?=
 =?utf-8?B?QVM3eGdHZWRSQWJvMHQ4NDhTK2lSN1F2ZjV4MHFVZ0N6LzZRUjIwVDdWSjRs?=
 =?utf-8?B?QnVGajVVZGRFS2lzbkNmUzR3cmx3UmRRYmFBdFZ1UStMMERZelVLSU9Zd1Qv?=
 =?utf-8?B?TURSTmFFY3oyNElmOUNwMTJvME9SVnd1UnExdnNDMkt4RFBBYmtWOXQ5ZDRk?=
 =?utf-8?B?VCtpTFZWWXU1N0RZd2Y0dz09?=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10361
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	b0ede9e4-ae99-4548-f34b-08dc9ff1aefa
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?cXFQckpYc3NiMXljYjd3ZDJEaHEwcVNyaWxBTDcvblA2MnBDR1BrcHJ2WFlL?=
 =?utf-8?B?dms0ajlnUHRObnAvRGdOcHJrU3N6Y1pyUVFSa2NqbUxSZjhnU1NDbXlyTzRG?=
 =?utf-8?B?TnJYMElQQTMvcXBTSXprUDJZVDQ3UTBvWE9xNm1Na21NVVhRQ2x1N3RTTDZY?=
 =?utf-8?B?c05ucEpvbTlzQS9TeW83TG1yOGZQNDByUEs3bjQ2anp4c25FaURPbitXRGc3?=
 =?utf-8?B?eGNOVGIxL1BhdlV3SWdaN1R1cVNaa2dBWFRqY1JML0tyUWp1eFZJR0x3UzZ1?=
 =?utf-8?B?YTl1Uk9YdWpRU0huQnNzQlNGQjdRaFpUdk85cVZGZ2pha0FSOE1FK0tTd1pT?=
 =?utf-8?B?NHZzQ0haSThLVTFNVmpwWjFtd1huTldmYUdxL0VwY3pGeFA0TVpwekdWY2E0?=
 =?utf-8?B?dkZiYzJDZ0c5UTl6UHg0eTJGYjdWZ2ZsUUZRaGlyK29UeDRQNVlKYmpLdGR6?=
 =?utf-8?B?dmZ0NjNiUXRUK3p2WUlrMW1ZVDNnLzJGOEVXemVVODdjaUlUTVVmaHhuNGto?=
 =?utf-8?B?NmY4ZkkwTHpldkowQmtCbGVrTWkxWWZvdWliWTkrd29WSUFUb3FJTi9YblJT?=
 =?utf-8?B?R2VmVkVnSEhsSFlnOG4zNTUySjM0K3htVXJYd3FIVEFtWDNZMGx3anBOWWx0?=
 =?utf-8?B?Y3hmV084NDM3aHY5MG9QVDF0T3BEMXlpbUN5ZUUwNFpjelFaRXpmVlo3Uk5Z?=
 =?utf-8?B?Y1hKTVJ6WVc3TWl4cXp0Y09PVnJ0bTYrRHlmU3l3NVhpb2hBSmZGQmU2MWtQ?=
 =?utf-8?B?eDA2NFNoT3lqTGM2MXd4bDlHRktDT0VIVGI5blNmSTZKYjgvZ21jY0Mxc1BC?=
 =?utf-8?B?aHBZY1U1VUdEYmFtbFk0bExIMUtOa0JxbGpkNWtUTk9nanFjeHBEdm93cHEy?=
 =?utf-8?B?MTJKVFMvbVAzbGwzMWE0Y3dadTVRcEhsc2wrMFNXNVpnWHRPNVc1VnJNaHJm?=
 =?utf-8?B?dXFrR2xsdmd3VmJOdmlRdk55a2NmbzZXOWd4RjM0aU1FSlNIbTAxclUwRkVi?=
 =?utf-8?B?c01JeVluWWM0SHpEeFVLSmFyUnFlenpLbEU1TFJLZXpsK3dRNEhkcGlyeksv?=
 =?utf-8?B?eDJWVFBFOXdXblhhZFdPV250dTlOY0J6WC9sY3BlUWJlZlVDam9BTituWkpD?=
 =?utf-8?B?YmZOemoxdzhHdUlKSElGR3hwWkxGNHhZSWdwN2hYV3dVQWVGNU1TMDN1Tzdu?=
 =?utf-8?B?RDNxZVMreE9tQmVQVi94TSttbU15QmRQNVQrTjZQeC9YaUI0TFVIMEV2M0ZM?=
 =?utf-8?B?QnlqNWI5NzBCc0VpMGRHdDZZcXdKVklqWFh6dlZQbHZiOWVGYjdjK3FPNjJX?=
 =?utf-8?B?THhvWlFwUkxlOEZEN01CN2hEL1psSVNlTjlJaWRRVjQzcG54RnZ1ZkpQWXRW?=
 =?utf-8?B?VDE3dDgxMUFiRUk3NHhnR2lxYWswV0R3UlZGaUluUTJrTHlONGxqeVJtZG44?=
 =?utf-8?B?WlNqUzlOUjdGY2lBdkZsaUgyYVJia2YvVTdlZmxKNVNqSkxQazd6bTRYSWhk?=
 =?utf-8?B?aU9UQk1KZE1PeU9QRjRWdndEMWtkdlJ0d2VlU0pHaDFpZTN6SFFLbHdCNTI3?=
 =?utf-8?B?MCsvVFI0WUZhVkVvWUxGckZodnIxamp4RHBlR2VUZ3ZQREpRRzVGVWF1UnZX?=
 =?utf-8?B?a0VjR1l1SGkzWVRCMlU5aTBvY0txMm5yZXJLMGxOYWVCR1ZlcnN4U3dLNnp5?=
 =?utf-8?B?TjNGMHpsUVQrUXdzSTFLMk9ERWN4clpzWlNuUS92VElBWTNUV2I4UlQ3N3hj?=
 =?utf-8?B?UVJkZThQTGpHek5MVnQ2RDFWNTc4WlQrUmFCRzZxeHJHdHhPazM5WnI2b0RV?=
 =?utf-8?B?UUpKWGJHUVpya2VsV1VQZzU0NUdCYnFzV2lITFNzcVFjQ1hzNzNLYXVWaTBZ?=
 =?utf-8?B?OEtmOXlvWSt4NmhuSnhENThUOVpQNGZSSmEyTlVEdVh2dE4vSGYrK2RISGVW?=
 =?utf-8?Q?zh2jB+Kp0vKtpPql+QYT866SYQQRghqz?=
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:32:54.5118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be35fe40-5943-4994-0579-08dc9ff1ba93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
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
Cc: dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, Florian Weimer <fweimer@redhat.com>, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 07/08/2024 18:53, Catalin Marinas wrote:
> Hi Szabolcs,
> 
> On Mon, Jun 17, 2024 at 03:51:35PM +0100, Szabolcs Nagy wrote:
> > The 06/17/2024 15:40, Florian Weimer wrote:
> > > >> A user can still set it by interacting with the register directly, but I guess
> > > >> we want something for the glibc interface..
> > > >> 
> > > >> Dave, any thoughts here?
> > > >
> > > > adding Florian too, since i found an old thread of his that tried
> > > > to add separate PKEY_DISABLE_READ and PKEY_DISABLE_EXECUTE, but
> > > > it did not seem to end up upstream. (this makes more sense to me
> > > > as libc api than the weird disable access semantics)
> > > 
> > > I still think it makes sense to have a full complenent of PKEY_* flags
> > > complementing the PROT_* flags, in a somewhat abstract fashion for
> > > pkey_alloc only.  The internal protection mask register encoding will
> > > differ from architecture to architecture, but the abstract glibc
> > > functions pkey_set and pkey_get could use them (if we are a bit
> > > careful).
> > 
> > to me it makes sense to have abstract
> > 
> > PKEY_DISABLE_READ
> > PKEY_DISABLE_WRITE
> > PKEY_DISABLE_EXECUTE
> > PKEY_DISABLE_ACCESS
> > 
> > where access is handled like
> > 
> > if (flags&PKEY_DISABLE_ACCESS)
> > 	flags |= PKEY_DISABLE_READ|PKEY_DISABLE_WRITE;
> > disable_read = flags&PKEY_DISABLE_READ;
> > disable_write = flags&PKEY_DISABLE_WRITE;
> > disable_exec = flags&PKEY_DISABLE_EXECUTE;
> > 
> > if there are unsupported combinations like
> > disable_read&&!disable_write then those are rejected
> > by pkey_alloc and pkey_set.
> > 
> > this allows portable use of pkey apis.
> > (the flags could be target specific, but don't have to be)
> 
> On powerpc, PKEY_DISABLE_ACCESS also disables execution. AFAICT, the
> kernel doesn't define a PKEY_DISABLE_READ, only PKEY_DISABLE_ACCESS so
> for powerpc there's no way to to set an execute-only permission via this
> interface. I wouldn't like to diverge from powerpc.

the exec permission should be documented in the man.
and i think it should be consistent across targets
to allow portable use.

now ppc and x86 are inconsistent, i think it's not
ideal, but ok to say that targets without disable-exec
support do whatever x86 does with PKEY_DISABLE_ACCESS
otherwise it means whatever ppc does.

> 
> However, does it matter much? That's only for the initial setup, the
> user can then change the permissions directly via the sysreg. So maybe
> we don't need all those combinations upfront. A PKEY_DISABLE_EXECUTE
> together with the full PKEY_DISABLE_ACCESS would probably suffice.

this is ok.

a bit awkward in userspace when the register is directly
set to e.g write-only and pkey_get has to return something,
but we can handle settings outside of valid PKEY_* macros
as unspec, users who want that would use their own register
set/get code.

i would have designed the permission to use either existing
PROT_* flags or say that it is architectural and written to
the register directly and let the libc wrapper deal with
portable api, i guess it's too late now.

(the signal handling behaviour should have a control and it
is possible to fix e.g. via pkey_alloc flags, but that may
not be the best solution and this can be done later.)

> 
> Give that on x86 the PKEY_ACCESS_MASK will have to stay as
> PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE, we'll probably do the same as
> powerpc and define an arm64 specific PKEY_DISABLE_EXECUTE with the
> corresponding PKEY_ACCESS_MASK including it. We can generalise the masks
> with some ARCH_HAS_PKEY_DISABLE_EXECUTE but it's probably more hassle
> than just defining the arm64 PKEY_DISABLE_EXECUTE.
> 
> I assume you'd like PKEY_DISABLE_EXECUTE to be part of this series,
> otherwise changing PKEY_ACCESS_MASK later will cause potential ABI
> issues.

yes i think we should figure this out in the initial support.
