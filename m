Return-Path: <linuxppc-dev+bounces-394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDE95BCC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 19:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqV6Y1d5Lz2yjJ;
	Fri, 23 Aug 2024 03:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:7e1a::604" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724346548;
	cv=pass; b=n/sGzL8MjGBXpFiuGIAON9FGOj3lugD2lFaf8Qc6Chb8Ra3leE4isnaB8wZhMvkaVSGFVkDSXpxM5QnBgbhL0cpqbFM6amJVwVE55vq8hlMS3EMl0mQfYCAe552QgNepl0Qfvjd53B5IIBfsvH2NVm9wxtJDwKuSM8pNXZr6eOt2QhB1dG0mURGkU4KHKi2gbb/yy8ic+/wa0+gOkeVDnfIC6ETh5PnNdJopAGLd3SPsXB496G4EdqnXyxwrS81MbgVH4qqnWXu19m8gX+qZmxwsKUyS6YIM4PPpAOqpjgo+FHQZaZ2uYsqX9cQ2yyJo92vMArRRkD3f1Dpu5nKULg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724346548; c=relaxed/relaxed;
	bh=Y2vXrIygXQFW5hVbHd+TCVD15IEiLHqsu0feZ6aUKYM=;
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
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=XiEAJLzS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:7e1a::604; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=XiEAJLzS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f400:7e1a::604; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqV6X1G7rz2yhn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 03:09:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1jIhml2yneieDSuMsK1QYfKUXc4cepQFnnYkElQJuorLaQJzt8Uyj4B2aPF4PvEx9eQOUS+e11eWO5DlOazE5woWPDfvTOiVtKFkpY7X+7TWv0c2zBw9UkgWlQW9+te/Yyq/u+JDuq0YA+5KNENFiOH1H9Wm4Eer2+z8P6a8ehDF/BS2pbYfdG7NLzlXMSgkkdNBMne01d+Z1n3a82OAUJiT8nnzlD6RnBUltqpb3z5zgGEZSmxJqtrxyDDUhLc1VP5B+XiXWGvVAW7O5dZfY9QktMDoqCOkp//S2kMBCjcUb8PzBKNaxy//Bvjrk23PYcTXxKkcLF1GXBcUBfRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2vXrIygXQFW5hVbHd+TCVD15IEiLHqsu0feZ6aUKYM=;
 b=Pt5lcSSTthtFRE+5USC0UK9+46ncKt3HORjQ5MfK5MQ2KsM9XQc91aWPfbc0K25MmurwgTm+LT0cMd8UuzEyUSkSSTsOdIm6nntT1nbWXNXR3gyouKNCtohdA//Pku+FkdQha5EtnYfLcVvJcb1wRGgW6kyNLmv3WCG9754IC3Ju/1Nw6v37SKd7UJq4DOBYM6f1+H179XZtkwtx/vaGbKTTQNl3V4pybkd2MXbhynyjLnOs8V2n6cj0ENlgzYsqApPMjES7lBFU3y8hqDWt/dQmGbXLghkX9451oCXepLMR1qrpJgG4AoZ4MrVUpJmwLrw87yDDCqd1oO3ITB5nqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2vXrIygXQFW5hVbHd+TCVD15IEiLHqsu0feZ6aUKYM=;
 b=XiEAJLzSUqqI1gIJ8RNkEpuAAyzHfmLaDizvBvbG5t2KcFuskN3uhrnqw4BuFnU/22OfbVrg78kNizg70h+AHeSMYmE243m/nVfXl3Ei3Q6o0XCBXLu3FyoZLNpain4h1XNyjS4dZL8Q1LiIn4g3tiTU+FeWUYmHF1HAMZPlaBRpG+1dSnCcpvfUUjyS58ogrZAuj2FyWLXgP/lnzELjCV8zHZUhV5lpo2egNARMFZQIFoCznYW0j8c3g/Vyf/I+I3oun5Uc6JAPoYbXg7lojbRWo8BLm/IbjTNT9hxTG1u5zW7bxFsXSxRO9yMH3iHdS/lpMGq36qJ6K+o/jRoQ1A==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PA4PR07MB7709.eurprd07.prod.outlook.com (2603:10a6:102:f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 17:08:42 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 17:08:42 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Dan
 Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alex Williamson
	<alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
	"x86@kernel.org" <x86@kernel.org>, Alistair Popple <apopple@nvidia.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>, Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
Thread-Topic: [PATCH RFC 0/6] mm: THP-agnostic refactor on huge mappings
Thread-Index: AQHa2JUNu9N8uL100kGRL2xmWOHsiLICxUKAgAAiHACAARlNgIAA1eIAgC7kKIA=
Date: Thu, 22 Aug 2024 17:08:42 +0000
Message-ID: <4d12ae9a-de08-425d-8ee1-5b55e7e48254@cs-soprasteria.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <cf36725d-c197-4c07-8998-d34711335fdb@redhat.com> <Zp57ZLk2IQoHOI7u@x1n>
 <cfe94481-233a-421c-b607-08517588de6c@redhat.com> <ZqAayNSDf_6cfziw@x1n>
In-Reply-To: <ZqAayNSDf_6cfziw@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PA4PR07MB7709:EE_
x-ms-office365-filtering-correlation-id: cffe9d89-2eb5-4ef4-76a0-08dcc2cd130b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MzR1aE4zcmtOUHozWDRYQ2VnNDZqM2NoekYwckZvK3lJR0tseGhjeFhyOTJw?=
 =?utf-8?B?Q2VyTjkvaVZPdUxBZE1aajF6Qk9JRlJSV3BvSVVCUkRORXFqV3FPUW42OCtr?=
 =?utf-8?B?QXg2OUtCa3dNQ1EraGtaaDdzangvZWZDS0NCUWdtZlpKZ0JNNjJSOWJneHVN?=
 =?utf-8?B?Qmdmd2ozaG43amllTHFLMWtxeW1YRExITDVxQmEvWjU1S3hZZHJRTEFyeVg5?=
 =?utf-8?B?bEpBbGN3QTlWWVJBQlZiblRkbjdCYURKVUdybkplb2NaSlRUd3VCNnhSSnhp?=
 =?utf-8?B?YXN2d2QxV2x2SUYwQ3cvdWFMYzJzZlRZMXVaS1JPZy9zb0NkL0pxTXVlL2ZR?=
 =?utf-8?B?Yzc0ZEcvOVpRVHJOemgrdkxFTWRUellZZHZDZ1h5N1R2eU90NFV0V1U2V1FB?=
 =?utf-8?B?ZjZyZVNxMFJISjNacFFoWlViQ3YvTEcxQWhZNkZzNUVsOWlxOXB1emc3SGkx?=
 =?utf-8?B?TG14dDJnNS93ME9SQnJ0RkNsVVp3M09UL0FQM3kxV3lQdnF4TXUrRjFJekdO?=
 =?utf-8?B?aEhtYWMyeVE0NTdPUE9LQ1FURklzRGxydjFGMjFuNmIrbFErR3VjYlNHWmtC?=
 =?utf-8?B?S1JQRE00emJmalBGdmhUV2dJVVBzWUpSUEhjSzZsV2hQaGx2N00zN1gwU25P?=
 =?utf-8?B?RkFzcm5iUW4yK0RRWm9aaStjQ25yM0I0TjdRaytrbnJNZlVvZE1kMkNFalYv?=
 =?utf-8?B?SFQ4aHdod1JjYkxzaHhXQWVWQlZlTmhvcXdzbC9TTWFLcFcraGlkZlNrYVVs?=
 =?utf-8?B?UHhhZkhNZ0owNCtQREhBMmluVmpRWDVwZ3BXcGNMVWt4WEJTVXVTUnBQQ3dw?=
 =?utf-8?B?OFlMTHhGWlg0V3lVdmJqb2FHTGRUNHNkUlpVbU04UXZpakppSkxnM3pHWFhZ?=
 =?utf-8?B?Uy9jWU01NU9PWTFkNnJ4bGVoWWJxQWVyQzA5eitOUWVGTkVNZFA0ak9PRms2?=
 =?utf-8?B?VkU0bTFFRVByMW9EZ29BNWpYdEcyZ2J5K0JHN3Bvd3hRY1FsekVkcWpTOS8x?=
 =?utf-8?B?NzNHdUFOUndsaXMrdjVGeDE1TkZydmVCM05WT3Y5ZVpTcXFWM0FDRnJSbSs0?=
 =?utf-8?B?UFUwVWtzQk9TS0lEYmNlYXdMTjlMQjN5QVRnRlZqVy9hVzMvY0N2WEJ5dEFM?=
 =?utf-8?B?eHFQL2duUDhBUnM5UEdjVjB3ZVRqaWt1ODhNTk9ZT3pxT3NSZHRlc2JkVTZo?=
 =?utf-8?B?Rlc1ZWVwcjRnck53UElEUTEyclptdjFQSnVMRFdNR3BYenNERllib2FZcVZq?=
 =?utf-8?B?N2xwNjR0SkJjc1AvaWJjMWRWOUNzM0VSOHFrTjVlSk5BNU5OQTFBVW1QSEk0?=
 =?utf-8?B?ekpjTk4zZzV2TjBGbnBpZDJaOC9rNE5obHBUUE1iMU5xdUxyc0pyU2NiN3o1?=
 =?utf-8?B?bFIrYUQydlZWTHJIdzdvS0pxY0Izb3hCWE01KzNJNDdaemFxZ0V5MExQMUcx?=
 =?utf-8?B?bjNWcStrYit2TlpFOW5oRmdUQ1BGa2tkSU5LQitrTDN6TmxQVHNyREpaZldT?=
 =?utf-8?B?ajVkQ1VaaG9PbDN5cDJFNWQ0YXh0M1UycER2RVlCM2pCTnRzSGJhK0w2S3Zo?=
 =?utf-8?B?cGhwenZGNzYxRFBOamJCdStKcUtoZFhNcEloSkEvUytWRkh3cjZHZ1lyQ3Zp?=
 =?utf-8?B?VWZvc3BVRjlyWGErT2Zyc3hwU3FWV1RPdGNMOXk3RWN3ajNXeVRSQTRjeW1n?=
 =?utf-8?B?VjNJcnlOR1V0dWxaUmJzenFjV1RwZkpsR0ZlZkQyVm5oRFpRVTdCeENLQTls?=
 =?utf-8?B?QXFKb1Y4ZlFicTBUNklxMW9tVGdZT3RJZ3BNMWQwZURZUXhYRGVWRzZYakh3?=
 =?utf-8?B?WS9CQzN4aG92V1k5M0JPVkVHUEdSeWVXak1jTklNcUh0YTlpY252bnR5Vi95?=
 =?utf-8?B?amNTYStJUm9MN0ZzSXVZNGV0RmRrWExMT3VlbUlxYVpCK0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWxyazg1cGQxZktMQll3djN3SXNIakxaZENLbEdZTW9SbUhGVEtpNWd6Qnlx?=
 =?utf-8?B?SzNFRWUzOHY1VGxkYk5YMWU2dlJHQU50cW9EVGdiWWpQc0N2YVg1di9pZ2s1?=
 =?utf-8?B?dldzU0hNTW5JWU10RnpkYkZWODBESm5PRlZHL3cxTVhkRTBwVHBra1lpaXYw?=
 =?utf-8?B?Q0FyTkplMlV0WmFER0I4TCtiSzdDMTNJV0hrL3ZFcktUVGlmTzZWTjBQS3VT?=
 =?utf-8?B?YVdYam9lK2J1c1Rwd2NIRmVLZmY1MFdFRFB6NXZjYW1MclM5bEFlYkdwUmhL?=
 =?utf-8?B?aWh0a2daTDl3REs2WFZoakplU1I0azljUFdCMkFjWmQrZEdKUUVINy83amlY?=
 =?utf-8?B?d3M3czhIcU1MUzBXQ3RpeXZ0eVZIa1VMclNWNnNYcXpPY2tpWDd3azc4aTg2?=
 =?utf-8?B?dUI4L1FTeTd0Q0k1K2pmRzBPd0FESVh0eVBJLzJzeWVEcFdISjBFalBscmEz?=
 =?utf-8?B?WVJSOTdyTWYxTXBJKzFWOXF3SUUwNFdpemx2YnRnSEtJVmNzc1ppT0Q5NEJ6?=
 =?utf-8?B?a3ZESkhuSHJ1Y0p5SnE4T2Z4NkhiR3FKelFFWVNMY1psVnJJSHNFL2lGMmE1?=
 =?utf-8?B?TFZIRHR2TFFYdE1KUkpCMUg0VEJnVUdLOHljZnFnZXdTN3RGV1RsTTE1MjlG?=
 =?utf-8?B?TUdnckhhRlRpUVR4WXZGSENVcTd6N3p2RFZaYnVjc085RzlYMkw4UkpxYlRU?=
 =?utf-8?B?QzVNeHV5V2hBVk5FMUdSRUNteU5XQkJyWWFvbmZtUWlzekFkc3RWYnR5a3ha?=
 =?utf-8?B?OTVGY1dHWE9xOU5UMzRyeEtlUU9DdWZ1bGNrM2VUR0w3MCtKMEhKd2FUaERi?=
 =?utf-8?B?UXc3Y2crVFJLTW1vcHdWWU9YUEpzeTVmbjErRW9zYWFFaWQ3T2Y2ZGFPZTZP?=
 =?utf-8?B?eThzWkVTVHJFTVoycjRVRVRIQTdTN3VheTcya05yZ1g2K0ozYjFHS0JBeDZy?=
 =?utf-8?B?RnlDSkZnbmxGaUFBQ0txU1kzaFdydnl3UHRZSlRtTlc4cU1yRXlEVkJCMlk3?=
 =?utf-8?B?UXNvN0tjY21IdGxaQ3hNRDFLcVVMcDI2aFZKTVJONHVDUUZDRHVuQ09GM25v?=
 =?utf-8?B?NXpIL0FPQTMwbXVOQnc2bG85VjgyVUFRSGRLWFZyd0EzOEExNlNpVDcvTFZr?=
 =?utf-8?B?TXlvSkJVMFBUalViYUI2bEVrODNpR2diRWdnSVVRNzhUSnlJTzJrcWdFbytq?=
 =?utf-8?B?anEwZStncUtEbWxqWkpWbWJTUXp4OWw4cXcwcENUeUtseGJLQWhPSU5qUVhC?=
 =?utf-8?B?UlJCdUkwVjhSSFlEOU91WU1LV3hPbHhISG5WN3NGRjNlR2V0Y0loRzlKTWFK?=
 =?utf-8?B?MytON0lWQXVmNmJvNXJvQ1VNNDVvQkRMa2I4RFNIVHJFZXptWHRXeTVjeHhM?=
 =?utf-8?B?MFhVaFB6MHF5S3VWTGZjckdFaVlFYncyVkhEanBOYlM4RmRWYTdHbm16UFFr?=
 =?utf-8?B?NEt3MTF0KzBzTUdzbGh4eWYyVllFLzBCWHVZRlV3NmZlbmZHbHR4aks2R1dk?=
 =?utf-8?B?UUo3ZXlzRjRXNjViNGpDK1FMS0hiT2JlQzM1OE5YYUh3aHBGcU9ZTkJSUDAx?=
 =?utf-8?B?SHkyczJQYzZjdDNkQTIza0hUUXdWSjROa0RBQ21wZHNCN2MxMUJra1RJdmxl?=
 =?utf-8?B?RHZJSytqM1lKc1VRYmUyNlFwcDhYZEhxVjZDSTNTUHNMTVNKRzljdjk0aDd2?=
 =?utf-8?B?a2M4VSt2WkRZc2RaTUpoUjc4VFBZL1p3bTR6dUlrTkF6aXhxWHJTdTFvR2g1?=
 =?utf-8?B?Z2xiUzQxRkhRTlNWSHpZUTdEU09VK3FXYmRaZ2MrUWZpMkc5WkVOaVIyWWdo?=
 =?utf-8?B?Rm9ZN2w2L2NUT0dIVm11dlZMVE1Gcy9VbEZZbjIvaXJVUGFVVkI5a1pxaVNU?=
 =?utf-8?B?L296OEt3K3EzcHIzNnJ5aGNuWGRUNjNqWCtacDBFVGtYdHBBUU5pMGwrbjE3?=
 =?utf-8?B?b1JaZHpRTENpZWE2M3RyMExFKzJuZGc2a01nOEwvRTA4aFp5eHllMmFpekhM?=
 =?utf-8?B?NTNid2trQ1JnWWI1Z1BhUElta0RNWlpyRmRFMnhwNFQxRXZXQ2JucEpIU2Jq?=
 =?utf-8?B?U3ZZY3ZJOFRXQzM5Z1pGVmY2YjI0dEJodktTWHZ2cEFpTTh5YlI3NFdRUG1X?=
 =?utf-8?B?dm15VnRJK3BObElaTGhFSmZ2WWMwK3dSM2dZSDVLNG15SHlLYm9ZTVJHdkVB?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD07A77A70A0734DA2B8B041219C4449@eurprd07.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cffe9d89-2eb5-4ef4-76a0-08dcc2cd130b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 17:08:42.3192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z3QpsNGGFgsRu9uo5PRWmpA/oKG3uwiIXgPdxTsXBWpM9fioF6LJZvp68Eez7J3S2L1vQrMQ2yo7OQxxScnLuBYLwvxjt3DX+dv6d6yzsMyHMSVnlstUUnjicOkNdLd0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7709
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
X-OrganizationHeadersPreserved: PA4PR07MB7709.eurprd07.prod.outlook.com

DQoNCkxlIDIzLzA3LzIwMjQgw6AgMjM6MDQsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+Pg0KPj4+
DQo+Pj4gTm9ybmFsbHkgSSBkb24ndCBzZWUgdGhpcyBhcyBtdWNoIG9mIGEgImNvZGUgY2h1cm4i
IGNhdGVnb3J5LCBiZWNhdXNlIGl0DQo+Pj4gZG9lc24ndCBjaGFuZ2VzIHRoZSBjb2RlIGl0c2Vs
ZiBidXQgb25seSBtb3ZlIHRoaW5ncy4gIEkgcGVyc29uYWxseSBhbHNvDQo+Pj4gcHJlZmVyIHdp
dGhvdXQgY29kZSBjaHVybnMsIGJ1dCBvbmx5IGluIHRoZSBjYXNlIHdoZXJlIHRoZXJlJ2xsIGJl
IHRpbnkNCj4+PiBsaXR0bGUgZnVuY3Rpb25hbCBjaGFuZ2VzIGhlcmUgYW5kIHRoZXJlIHdpdGhv
dXQgcmVhbCBiZW5lZml0Lg0KPj4+DQo+Pj4gSXQncyBwcmV0dHkgdW5hdm9pZGFibGUgdG8gbWUg
d2hlbiBvbmUgZmlsZSBncm93cyB0b28gbGFyZ2UgYW5kIHdlJ2xsIG5lZWQNCj4+PiB0byBzcGxp
dCwgYW5kIGluIHRoaXMgY2FzZSBnaXQgZG9lc24ndCBoYXZlIGEgZ29vZCB3YXkgdG8gdHJhY2sg
c3VjaA0KPj4+IG1vdmVtZW50Li4NCj4+DQo+PiBZZXMsIHRoYXQncyB3aGF0IEkgbWVhbi4NCj4+
DQo+PiBJJ3ZlIGJlZW4gcmVjZW50bHkgdGhpbmtpbmcgaWYgd2Ugc2hvdWxkIHB1cnN1ZSBhIGRp
ZmZlcmVudCBkaXJlY3Rpb246DQo+Pg0KPj4gSnVzdCBhcyB3ZSByZWNlbnRseSByZWxvY2F0ZWQg
bW9zdCBmb2xsb3dfaHVnZV8qIHN0dWZmIGludG8gZ3VwLmMsIGxpa2VseSB3ZQ0KPj4gc2hvdWxk
IHJhdGhlciBsb29rIGludG8gbW92aW5nIGNvcHlfaHVnZV9wbWQsIGNoYW5nZV9odWdlX3BtZCwg
Y29weV9odWdlX3BtZA0KPj4gLi4uIGludG8gdGhlIGZpbGVzIHdoZXJlIHRoZXkgbG9naWNhbGx5
IGJlbG9uZyB0by4NCj4+DQo+PiBJbiBtYWR2aXNlLmMsIHdlJ3ZlIGJlZW4gZG9pbmcgdGhhdCBp
biBzb21lIHBsYWNlcyBhbHJlYWR5OiBGb3INCj4+IG1hZHZpc2VfY29sZF9vcl9wYWdlb3V0X3B0
ZV9yYW5nZSgpIHdlIGlubGluZSB0aGUgY29kZSwgYnV0IG5vdCBmb3INCj4+IG1hZHZpc2VfZnJl
ZV9odWdlX3BtZCgpLg0KPj4NCj4+IHBtZF90cmFuc19odWdlKCkgd291bGQgYWxyZWFkeSBjb21w
aWxlIHRvIGEgTk9QIHdpdGhvdXQNCj4+IENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSwgYnV0
IHRvIG1ha2UgdGhhdCBjb2RlIGF2b2lkIG1vc3QNCj4+IENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRSwgd2UnZCBuZWVkIGEgY291cGxlIG1vcmUgZnVuY3Rpb24gc3R1YnMgdG8gbWFrZQ0KPj4g
dGhlIGNvbXBpbGVyIGhhcHB5IHdoaWxlIHN0aWxsIGJlaW5nIGFibGUgdG8gY29tcGlsZSB0aGF0
IGNvZGUgb3V0IHdoZW4gbm90DQo+PiByZXF1aXJlZC4NCj4gDQo+IFJpZ2h0LCBJIGhhZCBhIHBh
dGNoIGRvZXMgZXhhY3RseSB0aGF0LCB3aGVyZSBpdCdzIGNhbGxlZCBwbWRfaXNfbGVhZigpLA0K
PiBmb3IgZXhhbXBsZSwgYnV0IHRha2luZyBDT05GSUdfKiBpbnRvIGFjY291bnQuDQo+IA0KPiBJ
IHJlbWVtYmVyIEkgaGFkIHNvbWUgaXNzdWUgd2l0aCB0aGF0LCBlLmcuIEkgdXNlZCB0byBzZWUg
cG1kX3RyYW5zX2h1Z2UoKQ0KPiAod2hlbiAhVEhQKSBjYW4gb3B0aW1pemUgc29tZSBwYXRoIGJ1
dCBwbWRfaXNfbGVhZigpIGRpZG4ndCBkbyB0aGUgc2FtZSBqb2INCj4gZXZlbiBpZiBhbGwgY29u
ZmlncyB3ZXJlIG9mZi4gIEJ1dCB0aGF0J3MgYW5vdGhlciBzdG9yeSBhbmQgSSBkaWRuJ3QgeWV0
DQo+IGRpZyBkZWVwZXIuICBDb3VsZCBiZSBzb21ldGhpbmcgc21hbGwgYnV0IG92ZXJsb29rZWQu
DQoNCldoZW4gSSBwcmVwYXJlZCBzZXJpZXMgDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtbW0vbGlzdC8/c2VyaWVzPTg3MTAwOCAsIEkgDQpkZXRlY3RlZCB0aGF0
IHNvbWUgYXJjaGl0ZWN0dXJlcyBkZWZpbmUgc29tZSBwWGRfbGVhZigpIGZvciBsZXZlbHMgdGhl
eSANCmRvbid0IHN1cHBvcnQsIHRoYXQncyB0aGUgcmVhc29uIHdoeSBBbmRyZXcgaGFkIHRvIGRy
b3AgdjIgYXQgdGhlIGxhc3QgDQptaW51dGUuDQoNCkFuZCB0aGF0J3MgbWF5YmUgdGhlIHJlYXNv
biB3aHkgc29tZSBvZiB0aGUgY29kZSB5b3UgZXhwZWN0IHRvIGdldCANCmZvbGRlZC1vZmYgcmVt
YWlucy4NCg0KU2luY2UgdGhlbiBJIHNlbnQgdjMgdGhhdCBmaXhlcyB0aGF0LiBEb24ndCBrbm93
IGlmIEFuZHJldyBpcyBwbGFubmluZyANCnRvIHRha2UgaXQuDQoNCkNocmlzdG9waGUNCg==

