Return-Path: <linuxppc-dev+bounces-396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AA395BD06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 19:22:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqVPq0gHyz2yVb;
	Fri, 23 Aug 2024 03:22:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724347343;
	cv=pass; b=Cl+y7QuNHaRc1+3T0tFbghOPtG8Sp24f19mKBQdzgBl/JqaHD8bSzTulzeSgjm7v0xIkGBYG/oE5e82/7SSopi6aB3EMBlnLkjmEySRxQeFkx8Dkg0C1WGaxdDm6lwA7rLBCjM7U/P2MBKS8aUHFNFbAoduGd21A7lZBb5VSV6rb4ec6dn6y1gXz/Sy/ZiU2Wrc+wbgEuekf1rjW1jV6+xXAGvMHkl29fV/XwPAzSzNNsjerlL36ndmUhSPPvtR/O7ojCWCMRnIu7RAHSGpyU/zjx+Ozw0ErzKfxyRxtdTtJAHKojc702sJgMEovdt+yrzL3Y3xZznSCTDfB9Mrzug==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724347343; c=relaxed/relaxed;
	bh=WFJ0iysv3Sy0L0UXHGihcYR/SurEZF349Vnwoisyqzs=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityhea
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=luBEgYS/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2612::62a; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=luBEgYS/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2612::62a; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqVPp3nXSz2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 03:22:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM2ymJiTDhgyj8TXdDPu1qKkvjEnNLjVqKrPGG51st3IOnhKS1YYIxRfG+sONZCaIHcsHOA5I3+Y67GWMK81sjrIXQQkPyE556vESEBIq4NtYuIo0zcEGAHlzOmC0xvdDQ4WgSmg7VZZID9W52gmXL+k4wsK7F4ce1kAkNmilYwelRGoqKtHIe3zZY7E6/LCoA6tKtEzX1QIF9iIQdtAhG7sDHs8LpYnsRlj9W9xamtD+C8HIXsJ/ltxzITDIeAKDqEhX1MhBIKpP29uy4fuveRlR/KCuU0uT5Bukdq8Qhxr8xfIYzs3bQrZtI3rp0Oq7rkdAbBfYJR4/4Plx50YRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFJ0iysv3Sy0L0UXHGihcYR/SurEZF349Vnwoisyqzs=;
 b=awCyg8urmK7loYS63wJJPlWEs0nFtoc9G6tsxNAvXw0kjIFx5LbYcM2dGYjiI1VkqsHN1mCv2s/UvdBHhHBn45/K8HYvjdsBujvP9N12tu9pJJ4EdEgCfS0htcJ/TS5R/Mn9YRoNYN6xg5KXkkIVX5eeXVapB/D98WcLvsHvIzMK0lN5+hlVNLBE3Ze5EfOrGv2HGZuVY/L5cI2NwMnk6NYeEYiqMk77I5ASntVF4bwIYZySvoW2z6C74UDYtDDFbNKPCjFKMMNkKQRy6frjnO2j/dKMdSNCWvTyRZ1CdOQApH2QKEt9Pd/zY+uKpL7hYMa32d4RTXnKHzfA5c0wHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFJ0iysv3Sy0L0UXHGihcYR/SurEZF349Vnwoisyqzs=;
 b=luBEgYS/dz18/mLIYaClrgZFNqOQsz3S3NP5ch1D1UV4OpCbltlgwAxAJGrhGtc6LWWUP2Ntki8u4LANJNJCILio52+/oS2lVpO2gvQolhTrXJl6VrwGlXTUry3BG95gmnMrUG5MS4sQmuWVkW+mJawlE/PH7yl7uZRoXBx0CSaa84TY2A6D6Cm3E1L2cmY3XUotjNKVd2lzKAbFVpn2x890K0RSSJWk5eZQJvmFlqlNyneCHvPRjB/Gd43t/Od0LZzhxi6KgVUDa29kZ8C84mvn9i9mwacyBxj9wTAAAQcL/0NywxnRVNHzr7nOT95/xWzBYgXpVjCnr7yS5ujukg==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by DB9PR07MB7753.eurprd07.prod.outlook.com (2603:10a6:10:26e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 17:22:03 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 17:22:03 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Peter Xu <peterx@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, Dan Williams
	<dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alex Williamson
	<alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
	"x86@kernel.org" <x86@kernel.org>, Alistair Popple <apopple@nvidia.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>, Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Thread-Topic: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Thread-Index: AQHa2JUJlWxXufeiak2xn74HyFoRpLIzvnGA
Date: Thu, 22 Aug 2024 17:22:03 +0000
Message-ID: <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <20240717220219.3743374-3-peterx@redhat.com>
In-Reply-To: <20240717220219.3743374-3-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|DB9PR07MB7753:EE_
x-ms-office365-filtering-correlation-id: cdd64b60-f0c0-42ed-facc-08dcc2cef0a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGRZL1BpM2gvTzZZRHJqOENHLzhoV1pLVkdFZ0MzWWV3VXpxQlZXRU51c2lL?=
 =?utf-8?B?SWVqOGVLZDdFeHJYd2FWVGJzNzdDYTBQQzlXcjdLamFncWtHblRTYWcwOTFr?=
 =?utf-8?B?eE0wR3pJV0tnUy9XanFwNUEvQzF6bzV1M2N1SkdKYlQvTDMrU0FYTGpYRklZ?=
 =?utf-8?B?UXFqQ2pVRVJjcVhNR0FETjNSQWNiRVpDdzIzT3dWM1lUeXN0SGVFZ2twTHdH?=
 =?utf-8?B?cjMrOGxjbW5PT1lTZWorSEVaOVAyeHUyOXVYTzFnZ2hHTVlQVnlmNmVXSnhj?=
 =?utf-8?B?MGRlcHR6dlk3S3l1czZCWTZIblJ1ejZTQlF4Szl4VERnRVB5UWpXRFhaVWlV?=
 =?utf-8?B?ME5zNU43T0lIWG1yVEh3N251QTJINitpbTQ5SGtpaFVrOWNJYnNqdlZoWjdM?=
 =?utf-8?B?UUNqMm8rc20xY3VFMmk4ZGhtNlVPS2hmOGJNRi9OMUorbEtzK2JXOFd4S2FU?=
 =?utf-8?B?cFhueEF0aTNmU3Z6RkxWbmlKUTZHUU9raTRzWEkyNXZaVlRGd3plYmRtV3ps?=
 =?utf-8?B?TngrVWh0YmF1a0x1OXR0ZDRrV2F0dG1ReHhuNUNha0xHcHU5ZkRyYjlDei91?=
 =?utf-8?B?VllxbEh3WXJYVHdSVGM5SSt5Vm1HSVZ3MVQ1VkoxczFoRWlvVnM3aXJZRnZi?=
 =?utf-8?B?ZHJGNm41WkpsbzVJck1OazV4c1Yxc1VvLzdUSitXeG5oenY3aEZTNis0NkJL?=
 =?utf-8?B?U2dtVHpYZEZQVDZlTmsyZzdMUVdONTRJcS82aHJUT2VycityRkJYcCszSmxx?=
 =?utf-8?B?Qmg2Z3VRMVVWK2xBemdwQ1J1MzE3dllyTDlyYmhMako4L2J5M0twblVEem1H?=
 =?utf-8?B?bFplMjArZEZsdis3UlFIM0ZJdm9kR1B0MEk0Q1hvSmowUWZua05Jdm1scXpz?=
 =?utf-8?B?LzVHRVdtYS95eGh2cWtjcUdIOGNwYU1lYSsydFpwSkZ0cE9yb2V1bDhibDdL?=
 =?utf-8?B?ck5zY2RRd2tRWmxwbzhXM21BUFphbXZKWXZvU2tjZ1ErMkpycGtUOFNyZENP?=
 =?utf-8?B?aFlzTHQ0TnZCVW14VVUrR2dDbGVtbkZFbHk3WjhPMWRoVHliUWRDZDFyaVdn?=
 =?utf-8?B?VDlzN0FlelV0QTFMRVUzcmxIT1JVN2JWQTRLNHhCcmI2UFhhV1ZIZFVZeGg3?=
 =?utf-8?B?QWZlTkZGcEszckNhM0lkbXlSNG0xKzNjNEVkNlRRQTNSZlJkb0tMbDlDRjF3?=
 =?utf-8?B?S2dZWFI1aTVHRjkyWjdQeUxrbHZSVHU1N1MxS05QSEVnYzMzSzltdnJDSGxy?=
 =?utf-8?B?WFJPN2wvYXE0YiszWUd2WXBnZUtOMHdGWjNmQ0FHWDNIWk44cjRPeitqWllS?=
 =?utf-8?B?U3FRazZ0alNZdzV0ZEFrRklMcFU3OWN5ZkdER0ZpNGloMG95cllINzYxMG5u?=
 =?utf-8?B?eXlmeG5tRmRvSE1NVGsrN0NWa2RwcnY2WEdkaUQ4bTFQOVZWOVNBdllrNlVW?=
 =?utf-8?B?NFY2ZHl2Sm1aVGJKSEFSaEZGcVg3SmFjV2l4eHlieVcrUFpIa3cyWFJ0OTl1?=
 =?utf-8?B?bjhPOFVnWlNhbmZNVVdzSWZNWlhZYXYvTFgrTVZ2TDkxcXp2eXVzWS9xU05s?=
 =?utf-8?B?ZVdvem0rdmNrY2lMdytaTUZBdkRIVTdjK3QzV3FRYnZ3SUlwbzF5L2YwSVFH?=
 =?utf-8?B?Z0x0RWFaSzNyTWE2WHh2eStDSDg1WjRlOXdac3VLWU5GV2Y4TGFJdVBmS2pw?=
 =?utf-8?B?QVN6K2Y2UmdWQlNUaXhHWlpWKzg5VjBicDBHWXZERmdPL21kcG4vTnZoT29m?=
 =?utf-8?B?RDQ2bFN4VVFQOE93aFMySllWQVR6bGJXR1RCSVh6c21abERNVXExWHNvcmo2?=
 =?utf-8?B?NUVMWjdaVFdtb1MvTzQzSlNzVlJmUkgyVUpYQ3JOcFo1M2RlVWhMZGJ6S2Vs?=
 =?utf-8?B?RVhaZ05xaUlDUnFXTUNyMThHUzhmdEtyNGVvbm04S1c2ZHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFNiTFJGWDFFemtaQi8vVWt0VWk3MUI4WHB0Q3RUWGViZU00K0RGRlNTYXVK?=
 =?utf-8?B?Tk13cjdZQUpvSlZ6RVNZVlRjQVMxdE8wTUQvVUs3VDRMTlBobjlXOUpHZ0ww?=
 =?utf-8?B?aERSNzVTTmg5MmNOVGRKTm1YcGJmZzB4Wk1FbFI1WEVFSUREMHNjdFIvT0NI?=
 =?utf-8?B?UnhRMlk2dHlJaTE3THkyelJjVjFjQjdFNkhrT2dZUjZYbXhlL3dXV2RwaUxZ?=
 =?utf-8?B?bGdsU0Vwa2pVdVViS1FXdWIwYzN2TXpCNmRQODNPN3IzaUJleldSN2dGSVdj?=
 =?utf-8?B?NGZ4YUVuRjJaVWZWRkpBOUV5YVdTMXp2N1pMNU8wZnpFbG5rSWZQRC9VY2p5?=
 =?utf-8?B?M0VEMkNvMkxPY0M4U2N5ZmMzOURMdStKcXIxM0pQRlRnbzZIV0RVM3VVdi9p?=
 =?utf-8?B?M2pRQlA4SGNVN1JCTktWZEZYUi8yOFQ4QjAwQWRuNDgxZFhlUHNEaVFZbDB6?=
 =?utf-8?B?RnMwaDhuSlpmOEZDdXBPVGs2Q0I5c3NnK3lrWVQ4Q0o4UmhDUlUwUnhxT2xO?=
 =?utf-8?B?dFRoS05kcW9KeTFkbXA1M2xBbEttaVRIQ01oUVo2OTQ1M2RxdjF1MktNU0w5?=
 =?utf-8?B?aCt2RmVzTjMzSlBZb2FWbTliYXpxSnBvVm5wRHlMdFlKYUI3WkJVcWEvVkxY?=
 =?utf-8?B?KzFQdXNnRVRucTZqR2xma1FmZzBMU09oczgrMXI2bVBqdGJlTzd0NDZIQktB?=
 =?utf-8?B?N2RTSE9JS3ZoRHlYVlRpR3o3c3VWVnJOM2U4dW5WeE4vcW9wMFZaVkRucXY4?=
 =?utf-8?B?VHZ6Qk5ONGVWMElZQW1vZUhmdnBYUHhaSHRqWUt0cDRyR1BrY0xPbGtKZ1ZR?=
 =?utf-8?B?OUlPNTBtQlZiTHZROEVBQ1NFRHVXR2JxdFBhdjJxWjlYVXcrV2h6NTBGaTF2?=
 =?utf-8?B?UCtIdWJLZTZHbXlFaHJMOVl1dXgxRVpSRWY4ckxpU0YyYmZiNDVXVUM5VDJx?=
 =?utf-8?B?ZG1JTWp3cWNBWFBVQ3NVZk5ROHVvK0JSYnQwdzdGSFNoZENYdzcrQjhyNFNX?=
 =?utf-8?B?RVZleGJnY3picjFUb0RhVmZZYmkrSEh1bDNYTUpjOFBHRHF6dklkYjVQUXNH?=
 =?utf-8?B?MW5NNm5Ld2FVMHllZlVOdElOYWtsUklsN25vaGc5S09kOFQyY21YbnpUWElM?=
 =?utf-8?B?V0FYL2pNVnJTS1FMbDM4N0kxVVdaMnZKWUZyOFZSTGtiUnhHRFpxUGpaVi9Y?=
 =?utf-8?B?MkwwMzNXQ2orMzBsVC82NDlScnVZVTZ2YnY1WnB4anZvNkJ2aDVFNEppZFJZ?=
 =?utf-8?B?QzQxY2ZnR3BHOHpEdW9OSm5mNEphbiswK0NUS24yNnJXaWUxZklvTDA3bkF3?=
 =?utf-8?B?cC9Qd3crYUY3V21rdUMzc1RWMEVENE9uV3ZDa0doakZoWEtOdjN4VjJFakN0?=
 =?utf-8?B?Ty9Kem9HazJkK2laUGhRcUFOMnZKbWVnaGZLd3Y1WFF3MkFPdWtrbkFFVmFU?=
 =?utf-8?B?NDFvSnVjaEF0blBZTlpyWHdkNEZFdDBLLzhvU2NhRkNySVBrYVRZR0phMW5t?=
 =?utf-8?B?cEkvWm1FVXFUb20yU1BicGY0Zzd2aWNnR2ppR0RhaE9jUzkxdk51b24ycEdZ?=
 =?utf-8?B?MDdzM2Z2Z2tjUXdBbTVOUDJvVHhXQkpveXE4RmR5ckVvZ0Y1MHVSR3Y1QTlt?=
 =?utf-8?B?TEFmOUM5cUs5UjI2c2JCQWtsbm9qZmFVV0VIV2tFbTExKzNJTHFhMnd0amVs?=
 =?utf-8?B?UFVISGVIY1lBOGNXRk5BTnJxY0hPQkcvU2J6eS8rV2kzWXlqcTJBTU1hL1py?=
 =?utf-8?B?Ym1jbkViSVBZZXZrZTVVcFc5d1ZaZDhSZnd5KzMwczg2aituc0RxVEIzTUVp?=
 =?utf-8?B?ZDRpQnpuTHZBdjkwejZzTjZtc2FIbFZ4VTJoazErTHBxUE1zRWY5cTBRUklr?=
 =?utf-8?B?VXAzYTlPeGJ0bEJDYXdYbTdiMlV0RkVieXI5TWNzUUJRaTRmcHVvSXE0L3Ex?=
 =?utf-8?B?bWd2bDBNQWRqb0tWMHhkWTRyNzczb1VQWDdwNmZJd0RXaWZDaUpLeHdnb2Ir?=
 =?utf-8?B?OWxjK1Zlak8yS3k0Nm1iRThGcmF3MHNUSldNUjdhZkRCakU5SXMyZlhSaXli?=
 =?utf-8?B?SDVwS1JlUmlNVVNYM25MMGx4N2NhZTRvRUNoR0VuSVVXUktkM3ZoRTNhazNT?=
 =?utf-8?B?Z2Z6OU0vMUFzWHM1Z0JVeXl6R3RORDE3NXRkaWRnM2tGbFFMRXlXcXFkOTRv?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46D14600A8B86647A72444B2647C0A7B@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd64b60-f0c0-42ed-facc-08dcc2cef0a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 17:22:03.6215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXIzEMqfl3xuyXbADQ284tAEgUjf6f6+Qnt35vHi0EgJwm71pjf2H8hX55yK7ofurTNC/iq7wcVXgGvMFTxrGkyVvZH3agupZLD9HArf+b/j0OQmIwGUbDnscVxX/FIe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7753
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DB9PR07MB7753.eurprd07.prod.outlook.com

DQoNCkxlIDE4LzA3LzIwMjQgw6AgMDA6MDIsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IEludHJv
ZHVjZSB0d28gbW9yZSBzdWItb3B0aW9ucyBmb3IgUEdUQUJMRV9IQVNfSFVHRV9MRUFWRVM6DQo+
IA0KPiAgICAtIFBHVEFCTEVfSEFTX1BNRF9MRUFWRVM6IHNldCB3aGVuIHRoZXJlIGNhbiBiZSBQ
TUQgbWFwcGluZ3MNCj4gICAgLSBQR1RBQkxFX0hBU19QVURfTEVBVkVTOiBzZXQgd2hlbiB0aGVy
ZSBjYW4gYmUgUFVEIG1hcHBpbmdzDQo+IA0KPiBJdCB3aWxsIGhlbHAgdG8gaWRlbnRpZnkgd2hl
dGhlciB0aGUgY3VycmVudCBidWlsZCBtYXkgb25seSB3YW50IFBNRA0KPiBoZWxwZXJzIGJ1dCBu
b3QgUFVEIG9uZXMsIGFzIHRoZXNlIHN1Yi1vcHRpb25zIHdpbGwgYWxzbyBjaGVjayBhZ2FpbnN0
IHRoZQ0KPiBhcmNoIHN1cHBvcnQgb3ZlciBIQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0Vb
X1BVRF0uDQo+IA0KPiBOb3RlIHRoYXQgaGF2aW5nIHRoZW0gZGVwZW5kIG9uIEhBVkVfQVJDSF9U
UkFOU1BBUkVOVF9IVUdFUEFHRVtfUFVEXSBpcw0KPiBzdGlsbCBzb21lIGludGVybWVkaWF0ZSBz
dGVwLiAgVGhlIGJlc3Qgd2F5IGlzIHRvIGhhdmUgYW4gb3B0aW9uIHNheQ0KPiAid2hldGhlciBh
cmNoIFhYWCBzdXBwb3J0cyBQTUQvUFVEIG1hcHBpbmdzIiBhbmQgc28gb24uICBIb3dldmVyIGxl
dCdzDQo+IGxlYXZlIHRoYXQgZm9yIGxhdGVyIGFzIHRoYXQncyB0aGUgZWFzeSBwYXJ0LiAgU28g
ZmFyLCB3ZSB1c2UgdGhlc2Ugb3B0aW9ucw0KPiB0byBzdGFibHkgZGV0ZWN0IHBlci1hcmNoIGh1
Z2UgbWFwcGluZyBzdXBwb3J0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgWHUgPHBldGVy
eEByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4L2h1Z2VfbW0uaCB8IDEwICsr
KysrKystLS0NCj4gICBtbS9LY29uZmlnICAgICAgICAgICAgICB8ICA2ICsrKysrKw0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2h1Z2VfbW0uaCBiL2luY2x1ZGUvbGludXgvaHVnZV9t
bS5oDQo+IGluZGV4IDcxMTYzMmRmN2VkZi4uMzc0ODJjODQ0NWQxIDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2h1Z2VfbW0uaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2h1Z2VfbW0uaA0K
PiBAQCAtOTYsMTQgKzk2LDE4IEBAIGV4dGVybiBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgdGhwc2l6
ZV9zaG1lbV9lbmFibGVkX2F0dHI7DQo+ICAgI2RlZmluZSB0aHBfdm1hX2FsbG93YWJsZV9vcmRl
cih2bWEsIHZtX2ZsYWdzLCB0dmFfZmxhZ3MsIG9yZGVyKSBcDQo+ICAgCSghIXRocF92bWFfYWxs
b3dhYmxlX29yZGVycyh2bWEsIHZtX2ZsYWdzLCB0dmFfZmxhZ3MsIEJJVChvcmRlcikpKQ0KPiAg
IA0KPiAtI2lmZGVmIENPTkZJR19QR1RBQkxFX0hBU19IVUdFX0xFQVZFUw0KPiAtI2RlZmluZSBI
UEFHRV9QTURfU0hJRlQgUE1EX1NISUZUDQo+ICsjaWZkZWYgQ09ORklHX1BHVEFCTEVfSEFTX1BV
RF9MRUFWRVMNCj4gICAjZGVmaW5lIEhQQUdFX1BVRF9TSElGVCBQVURfU0hJRlQNCj4gICAjZWxz
ZQ0KPiAtI2RlZmluZSBIUEFHRV9QTURfU0hJRlQgKHsgQlVJTERfQlVHKCk7IDA7IH0pDQo+ICAg
I2RlZmluZSBIUEFHRV9QVURfU0hJRlQgKHsgQlVJTERfQlVHKCk7IDA7IH0pDQo+ICAgI2VuZGlm
DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX1BHVEFCTEVfSEFTX1BNRF9MRUFWRVMNCj4gKyNkZWZp
bmUgSFBBR0VfUE1EX1NISUZUIFBNRF9TSElGVA0KPiArI2Vsc2UNCj4gKyNkZWZpbmUgSFBBR0Vf
UE1EX1NISUZUICh7IEJVSUxEX0JVRygpOyAwOyB9KQ0KPiArI2VuZGlmDQo+ICsNCj4gICAjZGVm
aW5lIEhQQUdFX1BNRF9PUkRFUiAoSFBBR0VfUE1EX1NISUZULVBBR0VfU0hJRlQpDQo+ICAgI2Rl
ZmluZSBIUEFHRV9QTURfTlIgKDE8PEhQQUdFX1BNRF9PUkRFUikNCj4gICAjZGVmaW5lIEhQQUdF
X1BNRF9NQVNLCSh+KEhQQUdFX1BNRF9TSVpFIC0gMSkpDQo+IGRpZmYgLS1naXQgYS9tbS9LY29u
ZmlnIGIvbW0vS2NvbmZpZw0KPiBpbmRleCA2MDc5NjQwMjg1MGUuLjJkYmRjMDg4ZGVlOCAxMDA2
NDQNCj4gLS0tIGEvbW0vS2NvbmZpZw0KPiArKysgYi9tbS9LY29uZmlnDQo+IEBAIC04NjAsNiAr
ODYwLDEyIEBAIGVuZGlmICMgVFJBTlNQQVJFTlRfSFVHRVBBR0UNCj4gICBjb25maWcgUEdUQUJM
RV9IQVNfSFVHRV9MRUFWRVMNCj4gICAJZGVmX2Jvb2wgVFJBTlNQQVJFTlRfSFVHRVBBR0UgfHwg
SFVHRVRMQl9QQUdFDQo+ICAgDQo+ICtjb25maWcgUEdUQUJMRV9IQVNfUE1EX0xFQVZFUw0KPiAr
CWRlZl9ib29sIEhBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRSAmJiBQR1RBQkxFX0hBU19I
VUdFX0xFQVZFUw0KPiArDQo+ICtjb25maWcgUEdUQUJMRV9IQVNfUFVEX0xFQVZFUw0KPiArCWRl
Zl9ib29sIEhBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQgJiYgUEdUQUJMRV9IQVNf
SFVHRV9MRUFWRVMNCj4gKw0KDQpXaGF0IGlmIGFuIGFyY2hpdGVjdHVyZSBoYXMgaHVnZXBhZ2Vz
IGF0IFBNRCBhbmQvb3IgUFVEIGxldmVsIGFuZCANCmRvZXNuJ3Qgc3VwcG9ydCBUSFAgPw0KDQpD
aHJpc3RvcGhlDQoNCj4gICAjDQo+ICAgIyBVUCBhbmQgbm9tbXUgYXJjaHMgdXNlIGttIGJhc2Vk
IHBlcmNwdSBhbGxvY2F0b3INCj4gICAjDQo=

