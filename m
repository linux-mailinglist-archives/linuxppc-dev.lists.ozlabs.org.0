Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 310838CE2A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 10:56:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HGj0+l12;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlzDc5Lnqz87j9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 18:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HGj0+l12;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlzCr4WJDz78bv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 18:46:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nph3deotnQnUPqFtrpMu7IjaE4b8BtseARORGACPzY1+ul6TlRwSGJTFaMdgnHdMtOpK656WpDDHhfV3HnJCvcnh2xGH1/t82jlBOrfDinPmbKZtoYppLHyFQWCpDmZFepvtK2fJTXSSXWyU7V44WXFagoxWwXMBgWXeA+m6eJ2JpZDOeRxh/pxvFFHtcFWbqdCB7q8SaRwAm8N90YkfDQrMXRQsDzcfoslxA/dVuvw7kXTmORufbZ7JFCxv0GU99JXxHy4UqLAA543+vRykkEijbi89NlhorhnfljcGJfLupnMvGumfURk/Z/HttwrdwJDi75QuwguBFY93FOAFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8b72OgnbWCgo02jWQa6Q91oKene487G3X6UBJWp1Yg=;
 b=d5OLLViMYImaLi4ZxehNZ1Yq7O41oUKOiSnDb39S8hgFXEQ5wDyPVhIvbKtHX74104sCmtzGT5uscuZFvOYC8Mu426uizLl0D/9NsndiIDZJmnV8SdjMwXV4ylvKlYx+XDeQbltA5CVZpIyxjE9cNTX5xn8/563A/sOWpeF5NkyQiF5IGRvfycATHALVcq1+DD6hRcTZ1KzI4Mb8TSDaGPTZ2VY6RnWRyX3whOzW7an0gAQcY0PALlQNEiWoN/zRIGjHX/3ki+lRMx1IIAvrN1ceABG7PCIHXhGw/ZqcSQq2wZ72cu4RDoSpZeU2wDZhmJgOKKoG6+CGpgi9nuGAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8b72OgnbWCgo02jWQa6Q91oKene487G3X6UBJWp1Yg=;
 b=HGj0+l1248rb7T5oh+mHaEWThcB0ZE3J6JSy8XqzKjpViEf8WQ28cSBSz7lkaqXbXZzkcAb58+Tq7XAYfTY/GZZzOqwHnudijp+fEzSinM35IohJDNpS76349nNsaZp17eLFAH2/8gTd2mgSNVthdcXXDfPNCtOrFzayMvO2RZSfOFCFJA6kRrdyOvvcTezaSBfoXi6T3kZDw7FUD6LJGFCq/CclzLoixUrPTN/kRpx8QOi4djWqZrR7VlUddHURTWt/GzABD0AyPtWor/xSMr2sVbfSiypY+HAKOd53GtazRE565ttBrchgLb72dteEnCV/BeSWyBjqxnEuAtFCsQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2902.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 08:45:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 08:45:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Peter Xu
	<peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>, Nicholas Piggin
	<npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 12/20] powerpc/64e: Remove unneeded #ifdef
 CONFIG_PPC_E500
Thread-Topic: [RFC PATCH v2 12/20] powerpc/64e: Remove unneeded #ifdef
 CONFIG_PPC_E500
Thread-Index: AQHaqIx1idKAqoerOkaC4Nc8KqJ/WbGmB5yAgAAUzoA=
Date: Fri, 24 May 2024 08:45:42 +0000
Message-ID: <b3ca085f-0221-4b0b-99b1-76dbde87993b@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <f70e5249b9e6a9a06e6575aa0efbaf8ba93c3659.1715971869.git.christophe.leroy@csgroup.eu>
 <87a5kf4qf2.fsf@mail.lhotse>
In-Reply-To: <87a5kf4qf2.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2902:EE_
x-ms-office365-filtering-correlation-id: fadfc402-9e13-4ea6-aeee-08dc7bcde583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?eW5GaVFGWkt4ZmVkcnZVbzZnYlAyNHFUOGt1OGh0SmRiVy9WbHhpdDZBeXJL?=
 =?utf-8?B?N0lzbnBZWFRiMnlLUEU2bGZaNUxaK3k5cGdnT0J4c0JlUGpXK3JJWk5LMlMx?=
 =?utf-8?B?V3JuK0grbHVGbExXQ3YzVEFMWXBtSHBHUVRzaUdDQXRDeGFVbi9wVy84ZTRR?=
 =?utf-8?B?M2w3cjhxMlo1dkVxMVI5RmxpMjB2UWhiM2VtKzRlRnBPb0tTOGJVby8zQUxG?=
 =?utf-8?B?L1ZWWEFkYWRyV2p3SXBpMm1vTU0yWXRQZXYxZHNDd01nOXpGLzZWU0lxUnlW?=
 =?utf-8?B?eHZIVGVlWi9IUTM4bjl4R0NKUmx6WVFtclNrc05IUXREMUdzODBFNWJ1RHBQ?=
 =?utf-8?B?UllsWThJdjI4NHB1SkdZYnJZVTI1cGlRRHVLQ1RqMjMxVzlhQVpITUM4VExG?=
 =?utf-8?B?dXF5VXUwTnhpOEdtTEdBQmpSRUNCQXM4WlZhRkpSWXdpcW0rWDlQUHR2M1NY?=
 =?utf-8?B?S3VtNmlwa3pkcnZQMDNNQkYxOVo0V2V6VEw0NzFqTThpMnBCOU5yMnBpM1hW?=
 =?utf-8?B?N1I2c0tmT2JFS2pmQmJzcFBncDJ0d3NNVU4rRkNuUnBPSXlxbTVLellBZ3NC?=
 =?utf-8?B?aGZoUG9menNldEtZU0VUQ2djU3V0eDcrSEF6V3kreHQ3OXYrNldwQi9QUjJt?=
 =?utf-8?B?a3R4STB1Mkxsci9hWC8rNEJacXY0SHBkc1M4d1JqMU9GNVpxdlRCTUlxYXZR?=
 =?utf-8?B?VXJ2Y0IraVhKbWM3T1FqRW1RUmdXdjZPWnFnbW1TblFTd2hzTGJqL2F6M0hi?=
 =?utf-8?B?a2Vmb2xHcThJQ2x0Y3lzSjhlSzVVSDAzUXJBRGZTQThSeDZnTG1OTWZ3L2RO?=
 =?utf-8?B?UTJXd29sRjBoMFRnbnlSbDREVG5hU2wyRXIxT2VlM0d4VXlzdmYvQysyTWNl?=
 =?utf-8?B?aEtWcVlRV2pMRXZublEvV1RPMVNNcDRESTd0U3NLeW5xb1BRWUJZcmIyM1hG?=
 =?utf-8?B?UWl4R3VmNU9LaXpxRnB4cGxlWlJrRE5vL0lCS1hqeDhxUTQ4UUdRTjIwVk0y?=
 =?utf-8?B?ZVJPVjV5R1JXam9USklUb1FDbzYwVEpxREtOZEpRUXI2ZDJkUjBscWtWV2kv?=
 =?utf-8?B?NzhqZjB4UjBPQjV6d2tEOFpqK2hJdnlGTVRRbFE5a3dIOHd5K1ovakdmSjQy?=
 =?utf-8?B?TSs4d01FWWYzYXdkekE1NWF5NGhDRkxqSmlNL2wraW1sL2RlcTZFRHR3K3Rr?=
 =?utf-8?B?UTFMWWkvSERFbVFwTERMRm1IT1dQY2hheGJNQmVzUjJNVElrdndPb2RZYndI?=
 =?utf-8?B?Q2dqWWxIZ01Jb3dhMjdmQXJCUVlWN0oxelBaaDBrdTMvd2NvT2dIRVBxay9j?=
 =?utf-8?B?YzlaSnZvZ0FyMGRaZkxLVzJZQUJvWDliOVNTN1dRYmJqM2s3ZHZIb1k2UzRj?=
 =?utf-8?B?RHNhRWkwTGpZa25pQitraVpqc0psSzREM2g1MXhUY3RTUmU4V3FqWlFtQTRR?=
 =?utf-8?B?Q25hNkljNnN6Z2pyYUJZOTVnUE5EZy9BNDlxRy9majA2UXlPVVlkWTF4cVBG?=
 =?utf-8?B?YVBoR1hsaW54OWd5RUJnbS9qWUlCbHlrb2YrcVEzV3FwU3JmNGxwUjBWcFdJ?=
 =?utf-8?B?dTRvZ0RveEFiSTFlcEpZQkxqRlE4MHk0MmgyT1dtYWJrOFA2TEpCaWxsdXJk?=
 =?utf-8?B?L29RNkxUZWk2a3hlQzNGYjVNZXFxR1AyVzFNR3BmTEFnT3hDd3BLdXk0b0VJ?=
 =?utf-8?B?WDZnU1E1T1RJYS8zSnF2RkVTbzVQRDZ5WTFZZmx5MlB6U25SWjdhRy9SL3Jv?=
 =?utf-8?B?Vm82MUhCRjVPNVRaNU5oUkhYV25LVWl5cXdlcVB0YzRPcnV0N0lqUmJaalMw?=
 =?utf-8?B?U0wreWdPY1FFYW5wbEt0Zz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VEtWOVR6QkorMUk1Ym9pVk9mUW9JWXNSdXpUcUdmc1YyUDVsZ1VzRFM0TkMz?=
 =?utf-8?B?cFBiWXNOL2tTT0docDh0RGtieERFSTRrallvWlBYZExvRXM3b2NUZ2x3bGE5?=
 =?utf-8?B?MW96ZG1yVFRlTTFqSGlRS1FZWjVGWXVoNmVKU3NtNy93WTFweFJITnU3SHZF?=
 =?utf-8?B?MHVXQ20veGFLWnVKbTJ5VG9VWG92Z3pJREhlV1NDSGVodzdHK091WElwWk9s?=
 =?utf-8?B?L2wrTXRkNUFLS0xZajB3M25wOElYT0RhbnhLWW03aVFDRXpHMGdDV0pkTW41?=
 =?utf-8?B?ZkpBRmVyaDNuWWpQYUtiU2YrNGg2VjJON29DTGtnNUxBbERXT3BrUEo5UDVk?=
 =?utf-8?B?VS93S3dPMUlGWHp4N2RQN0dBRjNKWFBXcEVEQlcvMVFMRVpDSVhhTHl0Q2xw?=
 =?utf-8?B?ZnpicTA4TXBPaG5mMEhqUElzU3hBcE1lbnBsbFVOVU9mSFlFU2R4dFJ6QVZq?=
 =?utf-8?B?aWpWUm1kTUdkbWV4U1EwOTNDLzcwdVhZRzdPQ3YrYjZGRlJpMjhaczg2TXRO?=
 =?utf-8?B?cGR0KyttYUJlS1ZFV0JWZEQrVWJ5SDBWa1QrdkhUSCtMSFpwOVlNQjB0dm5k?=
 =?utf-8?B?MktManVxWEFSUHJjL1Y5cVZNWjRNeXQzUVlORkNaVXBIL2M5czZmSEhhNlZw?=
 =?utf-8?B?bkUxa3pPWCtBVnVhOC9CeTRPUkdOeDRPMHNZckFrblhlZWlmaWppUHNnK2xD?=
 =?utf-8?B?am4wdzNXcEUrMEhIUEJGRlBnclFQaW5PTDZvOW1PamZFWVNmd3RQTncvV2xx?=
 =?utf-8?B?QzBtaS9iUmJNYkFTUW4vM2M1c0pGbStxek0xMUE0Ly9OWEUzMlRSVHhqZEF6?=
 =?utf-8?B?SDN2bnJWOGR0ZGl1bVpGYjI0OGR1a1ZMb0FhalBqRjRkeXNueXBQb0NFeXJI?=
 =?utf-8?B?TmtrQ2FuaEpJanMxcFQ1Q0k4N1J3emQxOEpZVFRidHlTWmszR3A3bW1pbmUw?=
 =?utf-8?B?UXF4bWN2UVFpTVNkM0VxNmt6aHo1eTV0RUFUeG9pcXlhY21sRHZSNzRVbzNq?=
 =?utf-8?B?L3lzdS9TdlZZVVpWd1pES0NlY3FENXZhb1AzcCszQnZLM2VuMmsrRWIrdWdL?=
 =?utf-8?B?QksvV0pxYlVIQnVBVVdRSlBYUWJ6ZVpyUVIwaUJuVDFnZ0ptU09zbHg2SEM3?=
 =?utf-8?B?dGpaY2tTaHVqNnY5Q29KcDJHeXBiNFh0bERDK0ZHSmdxNXdJMkdJcW8vMjFP?=
 =?utf-8?B?cm80TmwzeGlXL0dLTTVjOENsZHg0ZkF3ZGhiK0pOaWxZRDUrTGxLM3I1bytI?=
 =?utf-8?B?UlF5WjZBOVU0bWpGcWR0K0l3OHZacU9LVUZ0bVh1ZW4wTXY2YXNtaWJsbkp5?=
 =?utf-8?B?YWZjS1lsMTNyOFM5Z0JRK0NFaTc2VFBxUjNGbHFxcUlNL253aE11eTBQUDRL?=
 =?utf-8?B?bElRNXFpLzZvYzNHc2gvRkdXSmxEK3VhYlh4REE5N1Y4MENJSG9nSVRqZXhm?=
 =?utf-8?B?b3dqTzZFd25PSlpWRER5RW1VVnBNSW9SOWE1UjdQTUJrQ3ZRRHkxMEEvR29a?=
 =?utf-8?B?MHV6U0U4c2ttMklLZDhqOXgyb1JrMi9zTnI4anBUeEFBRWxvSmVJVUswNkc1?=
 =?utf-8?B?Rm8vSjRybGNXdTBpSEY3MStURmVzRVhhV3A5OG0xY3VUYitrTmNNUU9UOFRi?=
 =?utf-8?B?alVJNEVxMWVnOVBRU1hONzNvM01SalpzdXUybUhQRU8zMkJJV0o2WXA0N3Jx?=
 =?utf-8?B?SWVUS2N5S2s2SlovSndIV0lOUXh0aUFVOWFWdnNtY0dUSmQyeGg0SERyNzNU?=
 =?utf-8?B?Sktod2RRZkFHNFlJb0J5Qml2ZXZBSFZGMzVpeXJwaDRsS2gweTNkZDhjcWVI?=
 =?utf-8?B?amg4UlhOQ2VqUHVJWGQwZHhWcjYyT2lWTWdGTi9wbE9pWk5OR0l2OE8yWjYz?=
 =?utf-8?B?d0IvSVJ2Uk1Nc1NGTTZyek1XV1VYLzQweU1XaG4zVmwwckpsMDhBeHRPZjBz?=
 =?utf-8?B?QmRmVm1pdzc0a09XeHpGclZjYXJIUXV4enFvTEtEOWVHOEpMTkI2ajhJUjVM?=
 =?utf-8?B?SXZoalhKZ0RrakIrRnluS2NtSm5CM3FRbUk2ejZVSktFNXJENEtpRDZQdWpx?=
 =?utf-8?B?KzNseFI0Qjh3RnZwaWw5Q3RBSnVJbUpwUC94QmtlWTN4K1BIdWUrbGQxalN0?=
 =?utf-8?B?ZE1TUXJLRURyaVZkRDZMSVAybFJ4cWNzTy9OWVYrQ2hDd2t2anUyVUJFc0lR?=
 =?utf-8?Q?rrE6ScgtgbOAe87Kh6Ku2n3+vc6IDH9QnnLF97QPZ99j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD10ECFF13F6FB4BB593CD9078BB4481@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fadfc402-9e13-4ea6-aeee-08dc7bcde583
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 08:45:42.8509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lY+1axgHD0pc648YDnxj+p7qIpbsQozQpibbBBH18AdUSl6x9sgyE/6lHP/zkVRaxfFMVyNrreZRa8aMIq5XZEWkvaae+WIgU/8bkPtdeSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2902
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA1LzIwMjQgw6AgMDk6MzEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBXaGVuIGl0IGlzIGEgbm9oYXNoLzY0IGl0IGNhbid0IGJlIGFueXRoaW5nIGVsc2UgdGhh
bg0KPj4gQ09ORklHX1BQQ19FNTAwIHNvIHJlbW92ZSB0aGUgI2lmZGVmIGFzIHRoZXkgYXJlIGFs
d2F5cyB0cnVlLg0KPiANCj4gSSBoYXZlIGEgc2VyaWVzIGRvaW5nIHNvbWUgc2ltaWxhciBjbGVh
bnVwcywgSSdsbCBwb3N0IGl0LiBXZSBjYW4gZGVjaWRlDQo+IHdoZXRoZXIgdG8gbWVyZ2UgaXQg
YmVmb3JlIHlvdXIgc2VyaWVzIG9yIGNvbWJpbmUgdGhlbSBvciB3aGF0ZXZlci4NCj4gDQoNCkdy
ZWF0LiBJJ2xsIGFwcGx5IG15IHNlcmllcyBvbiB0b3AuDQoNCk5vdGUgdGhhdCBpdCBkb2Vzbid0
IGFwcGx5IGNsZWFubHkgb24gbWVyZ2UgYnJhbmNoICg0NzI3OTExM2M1ZDApLCBhIA0KMy13YXkg
bWVyZ2UgaXMgbmVlZGVkOg0KDQokIExBTkc9IGdpdCBhbSAtMyANCn4vVMOpbMOpY2hhcmdlbWVu
dHMvMS02LXBvd2VycGMtNjRlLVJlbW92ZS11bnVzZWQtSUJNLUhUVy1jb2RlLnBhdGNoDQpBcHBs
eWluZzogcG93ZXJwYy82NGU6IFJlbW92ZSB1bnVzZWQgSUJNIEhUVyBjb2RlDQpBcHBseWluZzog
cG93ZXJwYy82NGU6IFNwbGl0IG91dCBub2hhc2ggQm9vazNFIDY0LWJpdCBjb2RlDQpVc2luZyBp
bmRleCBpbmZvIHRvIHJlY29uc3RydWN0IGEgYmFzZSB0cmVlLi4uDQpNCWFyY2gvcG93ZXJwYy9t
bS9ub2hhc2gvTWFrZWZpbGUNCi5naXQvcmViYXNlLWFwcGx5L3BhdGNoOjU1NDogdHJhaWxpbmcg
d2hpdGVzcGFjZS4NCgkJCWRlZi0+c2hpZnQgPSAwOwkNCndhcm5pbmc6IDEgbGluZSBhZGRzIHdo
aXRlc3BhY2UgZXJyb3JzLg0KRmFsbGluZyBiYWNrIHRvIHBhdGNoaW5nIGJhc2UgYW5kIDMtd2F5
IG1lcmdlLi4uDQpBdXRvLW1lcmdpbmcgYXJjaC9wb3dlcnBjL21tL25vaGFzaC9NYWtlZmlsZQ0K
QXBwbHlpbmc6IHBvd2VycGMvNjRlOiBEcm9wIEU1MDAgaWZkZWZzIGluIDY0LWJpdCBjb2RlDQpB
cHBseWluZzogcG93ZXJwYy82NGU6IERyb3AgTU1VX0ZUUl9UWVBFX0ZTTF9FIGNoZWNrcyBpbiA2
NC1iaXQgY29kZQ0KQXBwbHlpbmc6IHBvd2VycGMvNjRlOiBDb25zb2xpZGF0ZSBUTEIgbWlzcyBo
YW5kbGVyIHBhdGNoaW5nDQpBcHBseWluZzogcG93ZXJwYy82NGU6IERyb3AgdW51c2VkIFRMQiBt
aXNzIGhhbmRsZXJzDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0K
