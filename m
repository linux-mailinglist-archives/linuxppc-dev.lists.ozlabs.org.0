Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E218D66D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 18:29:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Lfj0THfk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Lfj0THfk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrT9M5wGNz3fnP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 02:29:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Lfj0THfk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=Lfj0THfk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:260f::605; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=szabolcs.nagy@arm.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:260f::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrT8Z3X6bz3d89
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 02:28:57 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aC+i3wFGAxHEKQa9fhjzfKiKshiwfEYJaGV5b5W1UrqcS5LBMsOipqCsrfqzkbqW6FsIogrV8+0GZpUhobgTQuX0CJ0S4jscCfvPZuXtmK5p8+bP4OifxIs7/2n+hMDSZUffmOE7zKmx0BW2NO56zlyjIKwIHHIuzXnXep7qSfM6D1bs+c1WUpfBwWI8LsPHJrmbT5gKcoj1PWvwbVzrJC/GUoT/rqo1Znq+sK6XA3dZfp3ydIuZJ5YCBYfWWm1jH+/jF+Hwen7RVc8EGStAVjVZsY+x+/VLojVZmqSH8tQibnCtMi51dLQsvG/OGDRvUox6s4I+hkPgQq6Zwb62cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/kn/zHXt6gVzEQJw5AhtJAJkce3Y+lTdMX6Rnr75uc=;
 b=iSEFB6LHIJdzky4CbQTph5WVVr6JVVqjggH1K308RBVsC+zen8LaFEz093jq7RsANwO5Z91lRf/kwJPxAG2vxsCgVXECdb7c3zgdXdfN+H0rK3ScdB6pt+sgqbDYntS7YhII3AhQbJmnmGjk1q0JOBrOIp1UzkvhQyQUV8aVl3TEZZPZFga6cHUZJbuDgls69N0uIE9l0L+jQQdLRgdPNzMPOMGp+Xy68xN7oBmhVq05d0Civ+n6l4WxzFFWxn75zWz5IuOpVig60RzLaVkpEsXNQhWyWbeuQIPDZb0WMcqjuhRrOIB9EEWpw1m55f4Ce8wIH8r8cW7BWFPOIkiq3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/kn/zHXt6gVzEQJw5AhtJAJkce3Y+lTdMX6Rnr75uc=;
 b=Lfj0THfkcXU+tUgJiFdIC9gN6uf3BubapL8UJ+FFRmv/9z9qh5BtOTBl/gOYT8YlTxBEONOY+ixzoSV1IVlkt4TQsuf1S3cmFfGOVgC/NV8NrNTDDvxKkoRE/3zmXAEuD/P9hQcZU69pN6M/ZDOMyqPh27pPQKQxPAuiG35LRRg=
Received: from DU6P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::17)
 by GV2PR08MB8075.eurprd08.prod.outlook.com (2603:10a6:150:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 16:28:00 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::24) by DU6P191CA0023.outlook.office365.com
 (2603:10a6:10:540::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24 via Frontend
 Transport; Fri, 31 May 2024 16:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Fri, 31 May 2024 16:27:59 +0000
Received: ("Tessian outbound c528c7fbb6d7:v327"); Fri, 31 May 2024 16:27:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7366e6efe3ddcea1
X-CR-MTA-TID: 64aa7808
Received: from d362836c4795.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 02DD0AC8-7D2C-4EA7-B564-1BB6BED8F992.1;
	Fri, 31 May 2024 16:27:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d362836c4795.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 May 2024 16:27:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlqpQAQsVLplNdzfMZnrrU5zZ3W0wck2+RNWcxGh4P5hwsmvE+djdTBS+sjcEj70lIcN3PLXIF0kulznRekIhFAPpKmJxD/RypWSy7c4NVU4EDctmWdpGQK70e1ZxVB4YSpA2VDBkjvsIlshmwl2d5Ps0EUN1VAC4o/sBV2CvVG1zUUAFLagHA7iCjx8FKpjd9f+yUuVRsNB1CfXE6Mz7quj5dUr4bFVFcfo5RCKwlNulJRGPg4w7BtRGnbN5nTJBfFWeEMs3xfgCjbShNtYwEOwv2OnXPOdXh/34FSY5BCH41uJ9StBCVjqNjAr6U30RumnpWSnyUpp86kxM2POiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/kn/zHXt6gVzEQJw5AhtJAJkce3Y+lTdMX6Rnr75uc=;
 b=ifCMjfci/LdFa3lx8tQy+vd5yPOgkfUBSnh2JI5pINpouYnZlCn+IEW+fIF216M1vaRzd9BVhG0T8ymIbUFvbckycib0Jfyf3oRr8AHb9apJgcjH7n6+B9bQUWvSyNE9btsPqHB1zQH+iUEluDyQqrAIH9DFlxGCuMXG+agLa1RqhVc6e0J3S55r2ppsgECQnKKlxOzS/n4HZVC5WVYIHUzGQ8AIEVpHeHyMNe64ROgllF2gQJkWmBL4D8bShRY7GtuyVrRqjE2JSD9C4k728K9392CBrxFk/UqiGGrEytSnOwQj3Jt7b03mHRIu7MtkLKFBqXe7GVTCP+cJJMVfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/kn/zHXt6gVzEQJw5AhtJAJkce3Y+lTdMX6Rnr75uc=;
 b=Lfj0THfkcXU+tUgJiFdIC9gN6uf3BubapL8UJ+FFRmv/9z9qh5BtOTBl/gOYT8YlTxBEONOY+ixzoSV1IVlkt4TQsuf1S3cmFfGOVgC/NV8NrNTDDvxKkoRE/3zmXAEuD/P9hQcZU69pN6M/ZDOMyqPh27pPQKQxPAuiG35LRRg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by AM0PR08MB5441.eurprd08.prod.outlook.com (2603:10a6:208:17d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Fri, 31 May
 2024 16:27:46 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809%5]) with mapi id 15.20.7587.035; Fri, 31 May 2024
 16:27:46 +0000
Date: Fri, 31 May 2024 17:27:30 +0100
From: Szabolcs Nagy <szabolcs.nagy@arm.com>
To: Joey Gouly <joey.gouly@arm.com>, dave.hansen@linux.intel.com
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <Zln6ckvyktar8r0n@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <ZlnlQ/avUAuSum5R@arm.com>
 <20240531152138.GA1805682@e124191.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240531152138.GA1805682@e124191.cambridge.arm.com>
X-ClientProxiedBy: LO4P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::14) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR08MB7179:EE_|AM0PR08MB5441:EE_|DB5PEPF00014B92:EE_|GV2PR08MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: b6beb165-317f-4442-d335-08dc818ea2e5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:  BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info-Original:  =?utf-8?B?dmxJMnZEUElMU1lGRDQydmRJRzJITnBMOS9WWXV5UC9UYlBMTjRqT1ZCaGhy?=
 =?utf-8?B?TVBkODhzUVRjYUIrOXhNdlV1OURLTnFYNlUxeWpOUGR0L1UrSzNYNGJIbHBX?=
 =?utf-8?B?ZXBVN3ZLR1dFZElmK2FYaVVzVFo0cDF5b0wzTkJmWTBCODZoVE5RTW96Tkxr?=
 =?utf-8?B?T0wyYUY2Rzk0cUhiSXNEcEZsTWVrWjVyMWN6R0xsN3Z6VkIyMEt6aEdGQ0tm?=
 =?utf-8?B?WTdBQU5hSVdua3VpemRFeXM0TjNweEVxalYybTc4NUIvNzBkTjNZeGxydmhR?=
 =?utf-8?B?UXZqc3V1Uno4cDB5eTRsSld3cFhkM2w1ZnIyeWYwKzhvazhkNStCa0s3U0xI?=
 =?utf-8?B?QW91R0RVVm5MZkUreUhsYVBVWUlWZFc2R0hQdXhwZHBiQm02ZXJDQjd0eFlF?=
 =?utf-8?B?NmFBS2N5MmlHTnJ1OEJjaFBjc1AvbEJDNWloSDNtVlRmaEtRa3cvVTByMHFz?=
 =?utf-8?B?TUh2aUliZUl6NGI3TkJUc0pDdy9WT3dzVmJrR05GRHVreGNGdlhmZkhVdTlu?=
 =?utf-8?B?Mk03eCtUdTZNOGtNTXNRemhqWXFiUmFSZksvOFNmZmFaKzBISmNNc3pmYXFr?=
 =?utf-8?B?SzlUQmlLeW9rSmFWbmhLZEY4UEozSS8yVzhBY3VVSFpERDNMdzk3allpSXdi?=
 =?utf-8?B?VzRIWWdhMHQzdTVKaUFsbnhBblhsRVBmQTFTU1djN1I5K2dncFM5eGxBM3Rx?=
 =?utf-8?B?MVBMR3JuUzRPM2g3akw1OWVZc2ZUUENzVTMzNE1CMzhUT043VW0zVXlxMXNP?=
 =?utf-8?B?M0RTQzhYZUtqanhyc29xaEZOZzFiVUFmc2kxKytnY3U2L01NYUZLQ0FObTVJ?=
 =?utf-8?B?RXVLbHJjVkpVVlljSGs4Y3BpVkE3N01LQkRwMmhBcE9SeEVWNXdrdlBBcTVG?=
 =?utf-8?B?ajdxNWk5UnRIZmJKZWgxeFlCMFkzZWYwSDhnZVp5U1RmV1FvWE1GaVBWUTZB?=
 =?utf-8?B?eEdYamR0QjNOMlhvVWZCcWNwY2g0MlQwRWFTRGxobEt2MXlvell5bThtY01y?=
 =?utf-8?B?eVZza1hQTC80VldCeDVyNkRXaTkyWW1hWmF0NHZIM0NFZUt2ZEJVTlQ5aUti?=
 =?utf-8?B?bmY4YkVDZU83VUFPbnVXdDc5TDJsaEZEcmwyRWRLUGwxMEM2UWpEUWJqYTIw?=
 =?utf-8?B?ODY3L2pjbk4yMWxzSnZnK0xXZWg2Y2F6U1BYVElxTi9UeSt2SmdVVStTNHht?=
 =?utf-8?B?dkhjNWJpZWFHZk9CRHhNOW1tQ3RlM1h1VDYxa2lUZllnc0dsZUhLSDJ4Kzg1?=
 =?utf-8?B?NkZpb2NIWkxaS1FtVWNycWp1SlJFWGdIbjh4Nlp5N2NWRlRtYWNjdE9YQjdq?=
 =?utf-8?B?dTVwajQ5eVdZbDhBV09hby9rR0QzSFhqb0lSWXlhcVdPcVVqRDJqVkVoSmQz?=
 =?utf-8?B?QW92bHpXTExKTHQwYlUrMFJHb3ZuTkFOTVp3WlJZYjNrRXBvSk5XR1k2UlB5?=
 =?utf-8?B?TEdDclZmVk1BblBXbXYxVWRJbkZleTlFVE1LSHAycFZueS9YU1BTV1ZnQjlq?=
 =?utf-8?B?MDRCV2NxSU0wTGpEZ0l6RG9KNXBHb0NURWdCMXkzelFqNzZOV0xoUlpGdytJ?=
 =?utf-8?B?RnJvZHFJUVdldUNHdGZXREhncFpaWkZjb01DamdPUzhSblhqM2tDZUV3ck9i?=
 =?utf-8?B?Q21xd2h1WUZOcHRYQTNaaTY1dDZadEplaUpzYlNlcTdxdnZJNVZlR2MxYXhV?=
 =?utf-8?B?VWFjWHllYURRa2NuU2JVaDFNVHpLVzRqMFQ2c2VhVXUzNUFJRENQYzRRPT0=?=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	fd97360e-b982-47d8-3fb8-08dc818e9ae9
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|35042699013|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?alNzNThWbUg1SFJlR0RtWFUxZ2t4K3pEQ0tRRjY5eGlieU1CNmJ1Y1p3bzkv?=
 =?utf-8?B?bjB2RTQ3aHFVM0NZcXRSYjNldklWVEFWcXRGeGZKUTVpNUQ3bGNyd3VPRW15?=
 =?utf-8?B?NmJDVVgrcHBZRXJmMEFwMnV0S1ZBN2lzUytqd28zaVdtZFNEZk1BVUN0STVo?=
 =?utf-8?B?aUtGVkM1RGJybDMrbGYvaXZEb3hzK3BlcUlPSHlnNy95WG9hN0VnTi92YzR4?=
 =?utf-8?B?MUdUandjM2xqMENlRkh4dG9lVVFBcXdMdGhnL0tEd0FCZW1QbDBjNmVnQ1Qv?=
 =?utf-8?B?dmtJS1BBN3JzT1UyQUNKZ1daSTdpaVZpRnNxalZlRngvdXg4N01VTnNpdGdh?=
 =?utf-8?B?K0ZHcGdpQmRRajRFNE1qb043T21LVk9zTUwrSGlWUmsrYUJRY0V2NmZTd0J6?=
 =?utf-8?B?a0RYVC9VUk1mSys4QjJoRkFEMGpORENzbUI4YTRZOFpJZWhqVmg3ZnBELzFl?=
 =?utf-8?B?L3FzU2tIbjk4bWF5VGpkMDZNamJyekhQQjdsZ2ZpOFIzVEZyeG42YVg2SUN5?=
 =?utf-8?B?blhQSmhYQkRKVXU1RWlvWG1ySEhmV0d2eTgya2NSQlRrR0dSWS9EUzl0cDll?=
 =?utf-8?B?TUwrS0YzaEkyd010cXFtL0xDeURGQ2JXQkZaTlFDd0FJcWhoVFdSVWhMSlZY?=
 =?utf-8?B?VS9rSWllaDhmR01NL3NNeGJCRTFaQU5aMDAxQWZZWFdET3UvYXVJRkFvbzEw?=
 =?utf-8?B?SDJ0bHZ3RkJhSTJSUE04Ymo3ZWJ4bU4wdG01UVM3VnpNTjVqMG0zS2RLYm8v?=
 =?utf-8?B?UEJBWWxKTW1JTHltQWRmOWdacWFyUGR0WkxZQkg0MUhSMGo5MnJyMXFGOUNz?=
 =?utf-8?B?R1Z6d2ZFdEROZzlOM3J5RGtxeEtVZ0o2WDhPcEJoMlE1bXBZcytwd2hGVk5R?=
 =?utf-8?B?Z0paNE1MZjdoUzJ0ZzFUdFVHQk5KS3ZWSnZibXl0RkFVdnE5eDlkRGJzdWVk?=
 =?utf-8?B?S0JkZ0FVaGoyTFZQdmxGUkJZZ0crSUpXQmtjcGkyN0tqdXBjUDJlMitmQkRO?=
 =?utf-8?B?SVNHaXEwMmxqTmlRY05SK0N2cnhRZmp3aXVlVmJaUU5RdERDbkFBTXF0UkE3?=
 =?utf-8?B?MDNCUW5vUDUwQzB3VVJLZ3VSOFNvVG1YVFlSNmRIMCtQajh1NXNaa3JOWVgw?=
 =?utf-8?B?RzdvUWlKYjRJc3QrSFFHNFI0aGxEWGhQY3o3L0Y0OGhTZU9lTG9UMndMeFBq?=
 =?utf-8?B?TXpZNVNPS2lwWXA2cVlxTTc5TmRZNDdFOTdieHZGWDBhZmpmSEM3b0xSREho?=
 =?utf-8?B?aWIrV0pUempWei9pVGs2RmFPdjlQdnVuWmNCQ0w5ZXo3bmxnaXhqOUdpekJx?=
 =?utf-8?B?aHpiOTF4RThSMkJqeTl3UXZVbHQ3TmN3TVVMVDA1ekQrMWtSY2RUK0MyaTU5?=
 =?utf-8?B?YXRzMXcwaE1pK2pqMXVYdW5zK0JUaTc3ZC94TkJKVGJCV240c3JXaXBNaVJ4?=
 =?utf-8?B?MmxRVFBsd2RLL1NiMi9UaHpZTFJPUUFsaFdaUEF5MWxlTTlZM2JEVkRuUk5a?=
 =?utf-8?B?K29QeGRuTWNmbDdTOE5FS1JaVFNnVlNDWDV4R2I2d3ZuN2wwa1dERERPTlpF?=
 =?utf-8?B?TTRtOGdobGF0TUZIbWtGeTZaaWlqdU1YK3lESTNwQmlnK05uQmloZWRFemF5?=
 =?utf-8?B?Z3N6aVJhNEhWTzZzdGdINWQrbUU5eDl0TThKN3B6N0ZVUC90S2d5MjJZUG45?=
 =?utf-8?B?YXhWd25RdHdIS0FsQ3dWTVpyd0Z6eXY4bDFCelM0dEJRMHNvV0VWQmJ4S2Jr?=
 =?utf-8?B?bUhpc2tzMUJ0ME5UQjFwM3VaQkY1THo4MHdDRzhCTjRsSGFiZ0hpSVY1SXp5?=
 =?utf-8?B?MXZ2KysvR2pyTGpkSmU4YytHOGV3a3gvbzFQcDF2WjFLOEFpVVFna0l6dUVK?=
 =?utf-8?Q?RWLP7qTm54hdQ?=
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(35042699013)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:27:59.7921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6beb165-317f-4442-d335-08dc818ea2e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8075
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
Cc: catalin.marinas@arm.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, Florian Weimer <fweimer@redhat.com>, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 05/31/2024 16:21, Joey Gouly wrote:
> Hi Szabolcs,
> 
> On Fri, May 31, 2024 at 03:57:07PM +0100, Szabolcs Nagy wrote:
> > The 05/03/2024 14:01, Joey Gouly wrote:
> > > Implement the PKEYS interface, using the Permission Overlay Extension.
> > ...
> > > +#ifdef CONFIG_ARCH_HAS_PKEYS
> > > +int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long init_val)
> > > +{
> > > +	u64 new_por = POE_RXW;
> > > +	u64 old_por;
> > > +	u64 pkey_shift;
> > > +
> > > +	if (!arch_pkeys_enabled())
> > > +		return -ENOSPC;
> > > +
> > > +	/*
> > > +	 * This code should only be called with valid 'pkey'
> > > +	 * values originating from in-kernel users.  Complain
> > > +	 * if a bad value is observed.
> > > +	 */
> > > +	if (WARN_ON_ONCE(pkey >= arch_max_pkey()))
> > > +		return -EINVAL;
> > > +
> > > +	/* Set the bits we need in POR:  */
> > > +	if (init_val & PKEY_DISABLE_ACCESS)
> > > +		new_por = POE_X;
> > > +	else if (init_val & PKEY_DISABLE_WRITE)
> > > +		new_por = POE_RX;
> > > +
> > 
> > given that the architecture allows r,w,x permissions to be
> > set independently, should we have a 'PKEY_DISABLE_EXEC' or
> > similar api flag?
> > 
> > (on other targets it can be some invalid value that fails)
> 
> I didn't think about the best way to do that yet. PowerPC has a PKEY_DISABLE_EXECUTE.
> 
> We could either make that generic, and X86 has to error if it sees that bit, or
> we add a arch-specific PKEY_DISABLE_EXECUTE like PowerPC.

this does not seem to be in glibc yet. (or in linux man pages)

i guess you can copy whatever ppc does.

> 
> A user can still set it by interacting with the register directly, but I guess
> we want something for the glibc interface..
> 
> Dave, any thoughts here?

adding Florian too, since i found an old thread of his that tried
to add separate PKEY_DISABLE_READ and PKEY_DISABLE_EXECUTE, but
it did not seem to end up upstream. (this makes more sense to me
as libc api than the weird disable access semantics)
