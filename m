Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F438D6509
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 16:58:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IiFRUDpc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IiFRUDpc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrR8Z4GnVz3dBZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 00:58:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IiFRUDpc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IiFRUDpc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:2608::600; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=szabolcs.nagy@arm.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrR7n5CnHz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 00:58:09 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BWLgi3w4cCxoidODGSFq9SMVcYKjBf5eK7koMLSshiAQiTvoRHi6LNa0qqz0pw/qTvd81lxlINV7ovEPc94trX2cVnRTlBbDkVIUVPoLLUahcMTEM+oWzlB+ojimg/QxzDzdC9xTV3k8rSXIS3Li36Usuj7kx5ydoq+FrVNhZyaWQTp+6dyeT2KF7PmH6ufBI7vTjKG+ZxQl/RPEgV0KujLlsiKCkLThf58evRswqgbzmgS7L8TpVKDVg9KBGLzXCIpLee3wot4j2BjJTMaxDHrA+Keb/vBuUcB58un6MleH0eGyo3aShyRtkLbt43PauEzeXbNVJTYOInDYN5n1tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fyDs3nrP7CF6zSQzwHD0RccZ+CrYXNXayMa/mBSk0g=;
 b=JCIuuD/NZceAOf5K7zathimnBSUl8qmg3Vpv+HJqtHi67r2ATSKTEhHv2oyX/BqlijeBuCnFC9P2crCr7l0fafcPsc0cc/ufsjrP7iRVH0MV3vyqcY6S6KRFKFJmZl5qp55Hp7xAR5mRmV/7i1i3+TnNFbBCiM6vto1hBXHqoUvGzd/6ZtuD5KfWmrttUkJYSCkJqnSFCIsgFaVkxYyX1+vn8TGXo4FAob1VcThfEZcELzWaEBSia2rZx7CM7UWrFpxgiCaM8E5D6T7qn8zrvopOdiExvIyiT2EwdYr0cl1ZZNLVOxRj7U0VYJaYBnGlqbeAGGfYoYN6Pm5lQ30SKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fyDs3nrP7CF6zSQzwHD0RccZ+CrYXNXayMa/mBSk0g=;
 b=IiFRUDpcAVoQiNqUAO6+YUVP28VgWDAgnBJk/bjpu7IrR41eM5mlIRVIDLFw4OSVdW7r1hZIcTeYKkcEvhubQYWV3S79pivfEMz9ecfqzP+igu06pGpQQ+t+tXCoBtDiMO4oYxZ6sZecUBrffbsvkHsvZwqrvHtpd6PtwZbRhQ4=
Received: from AM6P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::38)
 by DU2PR08MB10013.eurprd08.prod.outlook.com (2603:10a6:10:49c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 14:57:39 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:209:83:cafe::61) by AM6P192CA0025.outlook.office365.com
 (2603:10a6:209:83::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24 via Frontend
 Transport; Fri, 31 May 2024 14:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Fri, 31 May 2024 14:57:37 +0000
Received: ("Tessian outbound c5e515ac9ee1:v327"); Fri, 31 May 2024 14:57:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49ef7dee730dc2c4
X-CR-MTA-TID: 64aa7808
Received: from fc581970f3d6.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1E6A01C6-4485-48B4-8D7B-C3E38CBB81D0.1;
	Fri, 31 May 2024 14:57:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc581970f3d6.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 May 2024 14:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0zbFUfBg9hBCu5I7UuAQOt2hZgHE4XAaWcejDMciIRajACWh7VtW5IecIZqlKq0GxUkk9mN2Ll1YeGJZzcuYMxSZsBPuv5VdeXX2YVTcAnkrpWRasOApOeXG0t9mRYQnY8p9pa6TVgM1Y7+aud9GissT89mPEn61yAteACBFV03oMyPsHX1ZqypRdf99gm/xLhedX8ysDO/pdDU0/y/wpaiAp+vC8drYlWsjJ76yvbafwcYBDuV7fFwJFaMLbemu1GhZcN6z2Wx33pBxbYHiA5v5upOSGeXoYhJBq82shjGu8NlVHsuS2gvrIrxkw2XIhMQ5n0VpJ1tWIQnAW5h6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fyDs3nrP7CF6zSQzwHD0RccZ+CrYXNXayMa/mBSk0g=;
 b=LwwPKJSPjI1C7cvCPSzgMNnVsT6Ee00ZCwhhjhxi3758/B90BaZYzPt41tfHYBhlmfirLF63LgNASUiL495LiGF2sXy+qLZWmrxN83UieX3EQkm888eUWoylwpLTcpsbZTGDu+/1CPKQlSZWzlK5Q8VEblHjIK6EYW5ErY911hAhH/x1U6KwLPNwaT5VU6hW5CRdEyI97o9KL0jZMO0HoD7lyCBSCrgjgSOYwPGv5R02tM5uJoEj5AZ0OF4dHA7IgVbSmNmo6vg7NU5LbpUbtdZvWrpQBHy71T9ggHZ34cXtz6VPdjZx4CkMVA1e1edq7d1PoFWKm7Caz6JG1qt8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fyDs3nrP7CF6zSQzwHD0RccZ+CrYXNXayMa/mBSk0g=;
 b=IiFRUDpcAVoQiNqUAO6+YUVP28VgWDAgnBJk/bjpu7IrR41eM5mlIRVIDLFw4OSVdW7r1hZIcTeYKkcEvhubQYWV3S79pivfEMz9ecfqzP+igu06pGpQQ+t+tXCoBtDiMO4oYxZ6sZecUBrffbsvkHsvZwqrvHtpd6PtwZbRhQ4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by AS8PR08MB9147.eurprd08.prod.outlook.com (2603:10a6:20b:57e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Fri, 31 May
 2024 14:57:22 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809%5]) with mapi id 15.20.7587.035; Fri, 31 May 2024
 14:57:22 +0000
Date: Fri, 31 May 2024 15:57:07 +0100
From: Szabolcs Nagy <szabolcs.nagy@arm.com>
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <ZlnlQ/avUAuSum5R@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503130147.1154804-18-joey.gouly@arm.com>
X-ClientProxiedBy: LO4P123CA0165.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::8) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR08MB7179:EE_|AS8PR08MB9147:EE_|AM3PEPF0000A795:EE_|DU2PR08MB10013:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2309eb-6197-4eda-6c5b-08dc81820344
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:  BCL:0;ARA:13230031|376005|366007|7416005|1800799015;
X-Microsoft-Antispam-Message-Info-Original:  =?utf-8?B?U1psQmpTR1pkQ3FDekdlVXNGNFBrQ1FOTXpsT0hHZ1N5OEhpeUpGeVhXNXY2?=
 =?utf-8?B?WGFMWnZGT3Fza1B0b3V4Ulg2bWE4SHZocHM3UkJoS3BXVEdURVpyMW1VNThQ?=
 =?utf-8?B?d3RibEFrV0xVSUVUdHNCNUxjZitXQWlhSnBkV2dNTFNzZXAwTEFZbHh2QXB5?=
 =?utf-8?B?aXhyTEJ5a0hPWUpCUnJDYzhnNUptSnhwZ2tWSVVmdGhLZldJaE5sV2xrS0FN?=
 =?utf-8?B?MVRHVlJUUHV2NDBxcDRMaHNyWTlneTByZFVuZnhxbGNrTTNSSGJDY2p3ZHpU?=
 =?utf-8?B?eVVkejlrL1dPRzRra1FwbjRyMGRpWFVyZ2wrLzNQNS9ZZEtSQnl0Qy9kLy82?=
 =?utf-8?B?aEorR1dHSFZKSjRkYStJQXF5eUVqaWRvalQ1SnpKZFlHcU9JUTF3VHRCM2dq?=
 =?utf-8?B?YVdjVHU0bkFXV1R4VnFGa0FkL1dtMUJ4MXB2NU9Yc3VwM003WjQrRWo4L3E2?=
 =?utf-8?B?NEJLdUtVenROUFQ4V0VySWVRNVUrTldVdHBwUUd3MEg2blU1QmN3OVN4SDcx?=
 =?utf-8?B?ZmhucTR6ZUg0MmNlSG1ia05VVVpEU3ltMnhLbFdWT0h1b1BMWFhOMnMrYVFL?=
 =?utf-8?B?dzNPQVVjYWRBZlJacnlyeFpWejB1UzFZUCsvSTdkVnNqbHlLT0NzS054Z0c2?=
 =?utf-8?B?L1BEWjk2Zm1UVkVVZ0E5bFlDQy9HZG5HUmQ2Smc2UzBaK2VPcEwvaVkwV1Z4?=
 =?utf-8?B?ZFVYUHBxOUgyZ1NzVG1QSDRVbnF6TFVNVXN2aHdQcURGWmJ2dVprcTNkb3U0?=
 =?utf-8?B?WU1Mc21KNVRwT29zNmMyc3JPWlJtWCs2MzE4VzUwbVU1b0dqNU5CbWFlbDBX?=
 =?utf-8?B?a2pjRFVkTXNWWVlCcGFFeFBDWnh2ZjljT3NsRkRXcGk4WnhvVHkrckZFME9w?=
 =?utf-8?B?cTc4OGJnS2pTdHg1QnFxaXFJZ1Jua1RtbUZyaXZldjRrZ1Z0Z20zRTdWY0Jx?=
 =?utf-8?B?L28yeFlRVVBpREtXT3N2ZklTdUYveXRzbEJ2RUVWSHJLc1ZLczlma1NmZWVy?=
 =?utf-8?B?SDN4ZnIxYkd4VEE0bFBEZE9uMmhhOEVsRE1RNHdWSnErelRsRGJPV21PWk1m?=
 =?utf-8?B?WVVwdnAvME9hR3VEenBZV0JvM3hwTnFtMEd6Y2o5NHZVOXQzVTFpQVViVUhI?=
 =?utf-8?B?eHorVkNZR3MyU1l0L0RIdE1uUFl4QzhxTHh6VzVYSW5QMWt1am5MeEJpOHVk?=
 =?utf-8?B?TUJiMjRoazliNURpaCtVc3pCUmQ1OFdweThRUkk2M3FLemJjSDIzeFQ5ZERP?=
 =?utf-8?B?eFhUV2IxNEY1TWhaOXBJWEpnYU95bUUxdTVIc1JNbzJGZEx1MllrMXhUQ3Fi?=
 =?utf-8?B?UmRQSjhwcTNDYnVXQTRRcXE4N0EvaVRhaDFYL2hGTG1TanIxQ0pOelZ5N1lT?=
 =?utf-8?B?Sld5aEJUSzlmWVV6ZHdzL09OYnhGZHJGMzVaV3VnRDVPajUvYnVTM2lwaEM1?=
 =?utf-8?B?Y3ZoTUVZejgvUWdPdG5CWGZ0dXhXdGtITHlKQ2VMTDcrQmJ4ZnZ6VkNXUFl6?=
 =?utf-8?B?MExwRVdjRG84a2tRUFFWbVBvUndWNnB1NXhwRUVxZkNkY1I0dlluUkRKRFVF?=
 =?utf-8?B?V0NLa1B6cmpOa3oxQjBmRWVibTQ5b0dFa0RtdnBnMzE1c3IzTTlPbkR5SFNP?=
 =?utf-8?B?WkNnOStDM1k2VzZJL0xGcHMyWmpJMG9kQXVobkxxY0RmcEVtM1ovUGFIZUtj?=
 =?utf-8?B?K2x1a3JBbkxwVC9taXI5R2NyYkYycGx6bGlxV1RjRlpFMjRxc1IyR1N3PT0=?=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	1174fe25-a175-4ede-f27f-08dc8181f9f1
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?TVB3emNqMmJVVFdtdVo2MlVFMEUvWXdhTkRpMmR1eGtkODJRa0lNU1dQVStn?=
 =?utf-8?B?VEFGcFZzS210MjMvbHFFMFRTV0MzZkl4N1RmMDRYR2FDbnlJSDJkSWl2WjNX?=
 =?utf-8?B?U2tsSFozT1ZRTTNVNGhhNHpEQjBnVERuNVhyZ0x1SVFVUlNGS2xaUTJFNVpv?=
 =?utf-8?B?ajB3VC9HTTNPaWVOeCtCYW15MGtOT0t4TTdUSUh4aWJOdUdzeDhHMFIvRno1?=
 =?utf-8?B?VThydzh2MTlqeUozR0l5cExodlVMbG5QQjkwL2NiTTgvN3o3L3QvK2RqdTZn?=
 =?utf-8?B?VTRxUFBIUk1ROEJBbHlKcE1SZjkrazYxWFpib2JvSVAxQzNxK2dYQytOR244?=
 =?utf-8?B?MGs1d0VSaS9aWTZ4bXlsKy9FeDBMN2xQZ3crYkJxZXFKUW9ham1wT1ArUlZO?=
 =?utf-8?B?YWNPZXZJU0ZuNnBkd3J0bU1qMktSTEhQUlBXQ1MvUlZFdEowaEZSUE1QUTlB?=
 =?utf-8?B?RWExQmRJK3N3cDdXUEZSd05LZEU2dm5vWmRXb01tSFo1TDdKblJKelhTaEty?=
 =?utf-8?B?cFlHYnp4ZzJuWkNpemFKWW1qbUR3N2k3Z213dk5aNDJudXJXZk44MmtZdGJq?=
 =?utf-8?B?SkdZUUczN2Q2ZUZnUitqR3JoMVU4ZDRiQ3FQUWRrd0NMdE5zQmxRSTlCbG90?=
 =?utf-8?B?Unpqb0dDTGVEcFNoaVB4NUFNZElvT1F1YVVJdUl5cE82YU9jQzVQblVPTHFk?=
 =?utf-8?B?cTIvUGc1ZEZlZk96NW9HZVhrZEdOSUwxRks1MXRqcTNRQzBhWGFjKzRiSFpV?=
 =?utf-8?B?T2xnYkkzNjRtcG9iT2tibTk0anVqN3RHWHByRGFHN2pXN1hlcUp5VjVYWXdG?=
 =?utf-8?B?cjJsU2VWUmltTUl3bWVnbGd2VkJMb1VkSDU0bjFKL3V3dGdQZi9JQzJJello?=
 =?utf-8?B?QXBKNHBWMHZVQmRFNUN5aXBRR25tZjR6QlhZbncxb2xuN1YwVXp1c2xHaC9G?=
 =?utf-8?B?MWlCeGpzVHVWZFRTWmluQW9sOFBSTzZJdGUvYmRMdlp4WnpyWlFMeTd3UXJx?=
 =?utf-8?B?RkFIVkpsOGk5dTlwTjgxZVdQS2IxbzM3bGRzUE01WW56OWlJMnV4ajBJWXdY?=
 =?utf-8?B?cFNUS1RmdVBGUUt4OURIcm5XV3VkakFrZW5YM3JxRk80RXRnM0Ztc0hmaDBj?=
 =?utf-8?B?TlpBcUVRTHNLS09GSmw4cGp3N0JTZ09CVDRMdlhGQlF5SEc5VWl1VDdXVVF6?=
 =?utf-8?B?VTNDTU1HUG9EajFMbEdXRVMvU2lmaGRHdW00dEhMOGduM1FVNVBxTFpBbVdy?=
 =?utf-8?B?L2ErVnVjT052TitPbmJHU2xIV0QxZ3VhakFiSGZzWUJYcEFHdmQ2NmJ6dlFI?=
 =?utf-8?B?Y2t0NkhVTCtFYWVpcE53VENZSU11dE9FNjJ5dmJHUHBjdzlFOWhQbXo0TTYx?=
 =?utf-8?B?Rmg0WGJLLzZUM2pLZUZuSEJLN2JPT08zekl1UlRNRy9yUVQ4Q3hta1VUODBu?=
 =?utf-8?B?RURRWEFRR1lWY1MzOWJPWlIyYzJsYUM2ZlFrZEtVTG1CVjhoZXI5T0dGTFQ0?=
 =?utf-8?B?aFRoeGNYNURpc0srV3ZCRUcxZXg2UktsOVkrQnA5UGN2bGt1aFFmeUYrSDdF?=
 =?utf-8?B?SFdIU1dOTEs2RmRTNkllN3FKTytpSWZTZFNicFVBcE9mK0VSWVdxMFd2dGJX?=
 =?utf-8?B?b0tpVFRHUzZxL1FvOThWVlJnc05pbkJTYjhXZ2M2Z1kraG5aWmJhZ2Z0bnp6?=
 =?utf-8?B?QVo0NlI4WkE2ZEhPSGQ3NWJZODN2bUNhdUhlY1ZrTmlNSjNVeER5SWk1WjNL?=
 =?utf-8?B?cHZOZ3JpVXlleHBnQTdPZjAxSENMYWhpb0ZzcHJyay85NUZ1aGtVK1NIZ2xq?=
 =?utf-8?Q?WCUSjjPF5gDRo07WQHiKS6ICwdCKLZpb4GvhE=3D?=
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 14:57:37.9846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2309eb-6197-4eda-6c5b-08dc81820344
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10013
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
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 05/03/2024 14:01, Joey Gouly wrote:
> Implement the PKEYS interface, using the Permission Overlay Extension.
...
> +#ifdef CONFIG_ARCH_HAS_PKEYS
> +int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long init_val)
> +{
> +	u64 new_por = POE_RXW;
> +	u64 old_por;
> +	u64 pkey_shift;
> +
> +	if (!arch_pkeys_enabled())
> +		return -ENOSPC;
> +
> +	/*
> +	 * This code should only be called with valid 'pkey'
> +	 * values originating from in-kernel users.  Complain
> +	 * if a bad value is observed.
> +	 */
> +	if (WARN_ON_ONCE(pkey >= arch_max_pkey()))
> +		return -EINVAL;
> +
> +	/* Set the bits we need in POR:  */
> +	if (init_val & PKEY_DISABLE_ACCESS)
> +		new_por = POE_X;
> +	else if (init_val & PKEY_DISABLE_WRITE)
> +		new_por = POE_RX;
> +

given that the architecture allows r,w,x permissions to be
set independently, should we have a 'PKEY_DISABLE_EXEC' or
similar api flag?

(on other targets it can be some invalid value that fails)

> +	/* Shift the bits in to the correct place in POR for pkey: */
> +	pkey_shift = pkey * POR_BITS_PER_PKEY;
> +	new_por <<= pkey_shift;
> +
> +	/* Get old POR and mask off any old bits in place: */
> +	old_por = read_sysreg_s(SYS_POR_EL0);
> +	old_por &= ~(POE_MASK << pkey_shift);
> +
> +	/* Write old part along with new part: */
> +	write_sysreg_s(old_por | new_por, SYS_POR_EL0);
> +
> +	return 0;
> +}
> +#endif
> -- 
> 2.25.1
> 
