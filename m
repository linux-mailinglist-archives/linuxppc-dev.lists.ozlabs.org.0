Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A02695136
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 20:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFwCj63Kjz2xHH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 06:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CEEK93Ul;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e1b::606; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CEEK93Ul;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFwBl5fVmz3bVD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 06:58:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhzH2751Pu4zITgFQY2A27RJ6H3e2NC1kQUbTcA6cFkPpev5hcJl7wVoucGsyNERYO+7WkWofn9JOXKDUsBA360ohomo9Jv1hrD3vywutUjpPqVi/p0LU/nGDMUNp4FsOF4Ff7XHsOddQy4dL6YTAoQuRSypvJQBj3DaQn/le20JbHBvWEGERJv4ou6dSk0Gk+IInlBVpaFR5ilk2Sq9+ISDIXYRuxsd3VP1JGN30h4H2mnAa56APRZFkCIdPWPi+8ooWYzj30hS2wyhFoLbsLsjxyM5vqfgEB2e3Yf8hAs/1TR14huEhuqsR4q8YOVkpU+EWfQGe4IXAOpiMFM5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EgfJr6G89pYUOcPmz8mSKRLBVxMQKYhvklrE9qMFy8=;
 b=LHSAphpvg1QKnOfudFba90R8/gqwnAhB57dtve+WVwoMNB9euVQXa5qE/408AYcwLp4dkz/C/dL73x5XBqLq1yoXEMelTVgOvZ0pbteCZJIZPJ5DJyOkWLSFvaPyEfIlVGMMVPSpANLtnv63Prs9VjYH9iU8rPVu5mNqLYF8tfHfromOJw3hXsv1vAD0lWDqnBsruGhCw+pLETM8SWS+kvUiIcAvEaUEycB3LMR3b0vjBOYSmEKpr2MInUSp1QlGlQdj7oGEejwUxcNsD6Ry0lytCncQl1yBwpNys3SXktbCwausiHchZnyljoIhvp1TX1Gj/SGe5QJWjcB1BfZ4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EgfJr6G89pYUOcPmz8mSKRLBVxMQKYhvklrE9qMFy8=;
 b=CEEK93UlhWfUwYaASFruRrTndudhBJcXd47GJHTfK2RQthJ2piDm1lZ9p+RQXBpP+SJcClu6YfWZnnUr6LIrvZIRw1Ubto1mCctCu3xWUlJSZ99V2HfF3WZyEBB+Eo/cU2GGzrHlssT0wR9dPpAPhS1adl0Tafzw8UFpb+45fgQXST1Mbus+PG7oP4Vvx9OoZzKBmYC43zd9egGx74DgbFv9k/a/4k68xNuFjowWw1UMNNAGTyBAY4ApPPbX+K7ucEBfxLHH7Ek6WhDCWGYS6tEXQg1FKQzKSxdBuVFCNAJC6jjrpv3PKrlZfZADOfpY0xV2K/D1ygAIFbA9tBU1Qw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2072.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 19:58:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 19:58:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Topic: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Index: AQHZF9ztPi//ZqICU0+kVOYLIruL1K6qdjuAgAHJHgCAAF4XAIAZafeAgAeT44A=
Date: Mon, 13 Feb 2023 19:58:15 +0000
Message-ID: <ceb80ec7-57cc-ba39-88f9-72fc8fa67930@csgroup.eu>
References: <20221224211425.14983-1-pali@kernel.org>
 <20230122111631.dgw5uwtfjsqack57@pali>
 <22db0b5a-1b7f-a94b-1092-a314d57dedf5@csgroup.eu>
 <20230123200922.scnwgne3dsip24lg@pali> <20230209001507.nc2njllc32pjp2az@pali>
In-Reply-To: <20230209001507.nc2njllc32pjp2az@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2072:EE_
x-ms-office365-filtering-correlation-id: 1b0b23db-ac5d-4960-189d-08db0dfca513
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xmT86bWgP6Ly74/2O7lGkJtmpRDeZUdpbn/ZGudSsh5jxbmMUIxbG88fXVsCFLYBbdTWK5x6IWNfo2YJOTNB7uCwJbdRhtc4KIBnfW8PxTDvQZehd7FWQF+538RvXU0YbNjfTbEF1ATWeHMm3bE0LZjYQHljS8ROEBQipBLi98xQYBLYi68CHo8EkZTOxFxbMepNzOKUphcbqgSq/RgixYg34UJ3UBv7fJI5b+TCxzL2qYhmunKVw8102qPF4mH10HWi7pHrqV2UP/GhSObyclfubnF7f8DbEqivNTLLCFWkgzVB5FEwOLvHuVE+NjByTeLuWCEfjSrOlVro4jI2K5KE3f/d3SIQ6Gom4X+sXIRvNE40QiUGjP/cAdr/4UwRWg0C3CvWgg+Mm1AeD4saQCz/4gofZTkG0z5skFOHrYkGrz7YvtQs0cA94G5FPrMVJL2eQOsXAmDr+pJWd5fVVr9I/j7QgTg/2krIs8mTPmPmdIB05XzPQMGYJlIlAjlAwc+0+LjkiOZHMO6FsnfUuadz/3JbegBK43WTn12sm1PGQQ95o7DezYL0H5EeJp57nLnMzM6tIhfQwTw9lJlcA+NoljlNfu0MkxAgI7DH7KKsKFI39wKLF0uOsHPbh7UyloGz62wQ4ZIt3/CQSJSXHbvTIpJtwwEP7+S1JOBIksoYPM1gyhKxH4cdI1dlMaTTrM7NYvcht7t4diOwr+6/wtI6anNm4gTyIcWzy5Mlk6mTVlHCMm6oEYoIgEvQDVgpKEHMSPWx2lTYOIktcGYjyw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199018)(31686004)(36756003)(54906003)(41300700001)(91956017)(316002)(8676002)(66556008)(64756008)(4326008)(76116006)(6916009)(66946007)(66476007)(66446008)(38070700005)(38100700002)(31696002)(86362001)(122000001)(26005)(6512007)(71200400001)(186003)(6506007)(478600001)(2906002)(44832011)(2616005)(8936002)(66574015)(6486002)(5660300002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MzA3YTYvUy9HeXVZbllOTW9PT3JpTzg5YWJaTzBONmRFMkRoeXQ1MGZvTXpv?=
 =?utf-8?B?eDRucGIrNGpEU3o2UnpQdFRHckdlRDdHak55VW52VnNsTDFwK2RoZzR2aHBr?=
 =?utf-8?B?aVpCUThSMHVUVFpndmVmWHlPbEhxbk9XRXZBeUw2RFhhc01uMmJVSkNGZ2Vy?=
 =?utf-8?B?cnlSUFhMN21waHMwSTVVTVVGVjlvbHo2UkJYM1NyQ3RlUU5oeElLVTZ0Wlg2?=
 =?utf-8?B?VUdOdGhsbkY5ZU1MM1gwcndBV2RvWHRqOXBQYmFzYUFKbHZUZ1NPNHVjNEp3?=
 =?utf-8?B?U0N1S2JjeFpFNHVxUmRaalpiRFFLUWEwZGY5WG5wLy8zbDhkRXJUS3VSM211?=
 =?utf-8?B?L2R4YllUbWQxb0hlMDl0TTZTaWFUdUYzelB3Q0lmbHBTb201aUY1T0NOSDhM?=
 =?utf-8?B?eHl6UDdseVNHUTdNai9qZGlkSHlRUGhFSHhwYXM5OTd3WndPbURVQk9IaTVu?=
 =?utf-8?B?QUczOUcxTThHc0srOTg1QUhzR3piNDhUVXkyb2EzK3ZCbngyVG9uQ2RLWnFF?=
 =?utf-8?B?WU5BSmpFQ3pjT3pzTVVFbGhJbXZ0YnQrbVU2UXB5dmJ1ZVNEeG11dE9NdjE0?=
 =?utf-8?B?VXRrd3BlbkwrcEY1UHNjTkk0UDgycFlWeVlyaUh3alpSRmpaelJTdEQxd2x3?=
 =?utf-8?B?SVBWM2RmQjlIK3VPNzFNNDlkYjBiR1VCeWk5enpjMTdGd0xsalpaUUVLUmNr?=
 =?utf-8?B?SzlxY1JTV3ZTWXgrd01hZHJ3WkdDbVl4WjRsa0pneFIrQVBvMDZ1blNEWXJ0?=
 =?utf-8?B?b1craFRsbGlweEJyZCs5Z2Rhb1JKQThVdHlqWGJlR29XVTB2ckl2dnRlZ2Nt?=
 =?utf-8?B?Zm5KTzRXL3VFc29ETENKZk1SZW45NERNM3QrQVlEdEpUL2ZaNG9Kd3dyYjVG?=
 =?utf-8?B?ZXJCYWpJSzVtL1hyaEFYVmJPMWpnd0kyTVp0clQycDZVRGtOTmtDNHh5MmI3?=
 =?utf-8?B?WEtRVFhTSW5CR0dtS1g3dWdJRnRWTjdEaEVjVmRLYU4zZENVZHZJcVJlWm5Q?=
 =?utf-8?B?RU1sQnVkTjQreG4vTHh0OTZBeGVzbUZDT2txZFFhUW9kZ1N0L3hRMitFU3dz?=
 =?utf-8?B?M043OVlMaU1EQk9Pc1F2SW5lZlBzQWRPblgya0dwMG9uMkQzcTVSNEZDUnVx?=
 =?utf-8?B?RHJVYW81c04zYXFYbE4wTXZHelJmeTUyL2E4NFBmcnVQb3BHU3NaWlZXcUNy?=
 =?utf-8?B?azNTU1VNQnZ4NkV6TTFieW0zVmZLSlBoUWJqVUpwRWpqaVNNaERkZEZlZENG?=
 =?utf-8?B?K3EvdWU5d3NCTkExbXNEeU9TZG9teTdVU2h0SmFiMGNrem5zNEJndEJrQmR3?=
 =?utf-8?B?c21JOTdLbkNiWWZQMGVLWFhoZzFzZVlCd2JJUDZwbkFJMGV3V2NvZjErQlZO?=
 =?utf-8?B?Y1pnNGt5SXFqOUJpR1FEUmluWmVsazgxTUlTV3QwcXExYUF2SGphUFg5SEpW?=
 =?utf-8?B?aHY4RDRpREdYMmpqZ0lsQ2JURGc5bm13eHNISTRwa0thMUVZbkFCeWd2di8w?=
 =?utf-8?B?QkV2bnM5Qm9RNkVKVXFkbHJvY1F0RnBBdkVnS29FNnBSbE8xWkZBS1VydlZk?=
 =?utf-8?B?L04zKys3eHlWTWNFUWNvOXRIWEpMRjdVR1NoclpsQlRrdy9jc1pkaFIrVDFG?=
 =?utf-8?B?blUrRlZxZUx5blBhQXpTZ2cxTUUwN1M2R2VGbjh0dm1iT1l1ZFZjZ0pCSElz?=
 =?utf-8?B?VkhFQ2JjRUtSYzYyU1dIMWliZjFjL1R6ejM0NzkvZE1tRjRsVTY1Q2ZUdHpv?=
 =?utf-8?B?OVA2d3FxenJSUHdwSE93WE1iNStMZU9pZ2NIdEdxZmNwaUllNUV0SEdMdnpQ?=
 =?utf-8?B?RDJiS2dXNlVLRkN1Ymwzb0pzci9IZUs4czVvWUFleGVXL1ZhbFV1cldIK1ZT?=
 =?utf-8?B?Zlh5NTIrWm96RzNGS0xsT0cydldEaEw5YlorcGlsWkpaK2tNTDlma3QxYnVv?=
 =?utf-8?B?czRtZUZ0c2VqNTJjVGxubDVJR3Y1TXRSRGZHNWk3OE85WWtGOGVxWGtpZC9N?=
 =?utf-8?B?cWZRVHRZd2xWNHJwQnplYVNOUmxZUHB4Z20yN0dqeEJ3RUw4c0hBVnNMVHNG?=
 =?utf-8?B?dlBCVk1ZRlJxdjRXZ3V0dm9aRm1NVXptdE92UnQ2QmJUWGk3TXlERk90dHNT?=
 =?utf-8?B?VDUwWWtiSUFaWjIxYStkM2d0emlSbGNaYTlwa3NUcllDUzB4bnRXY3FrbWRV?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F052F3AA7F94443A520A2E0DC0987FC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0b23db-ac5d-4960-189d-08db0dfca513
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 19:58:15.5312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRlhG+67W/nqRENq6neFW7UzmiJ6tu+E0u2M9uoTV7ppnnywcQL7OAmTrEKci92OxgcdM5cE016Z27X7mTbrRPcs5jADyzMl/gyFEM+jEys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2072
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzAyLzIwMjMgw6AgMDE6MTUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+Pg0K
Pj4gVGhpcyBwYXRjaCBtb3ZlcyBhbGwgcDIwMjAgYm9hcmRzIGZyb20gbXBjODV4eF9yZGIuYyBh
bmQgbXBjODV4eF9kcy5jDQo+PiBmaWxlcyBpbnRvIG5ldyBwMjAyMC5jIGZpbGUsIGFuZCBwbHVz
IGl0IGNvcGllcyBhbGwgaGVscGVyIGZ1bmN0aW9ucw0KPj4gd2hpY2ggcDIwMjAgYm9hcmRzIHJl
cXVpcmVzLiBUaGlzIHBhdGNoIGRvZXMgbm90IGludHJvZHVjZSBhbnkgbmV3IGNvZGUNCj4+IG9y
IGZ1bmN0aW9uYWwgY2hhbmdlLiBJdCBzaG91bGQgYmUgcmVhbGx5IHBsYWluIGNvcHkvbW92ZS4N
Cg0KWWVzIGFmdGVyIGxvb2tpbmcgaW50byBpdCBpbiBtb3JlIGRldGFpbHMsIGl0IGlzIGV4YWN0
bHkgdGhhdC4gWW91IA0KY29waWVkIGFsbCBoZWxwZXIgZnVuY3Rpb25zIGJ1dCB0aGlzIGlzIG5v
dCBzYWlkIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCkkgdGhpbmsgaXQgc2hvdWxkIGJlIHNhaWQs
IGFuZCBtb3JlIGltcG9ydGFudCBpdCBzaG91bGQgYmUgZXhwbGFpbmVkIHdoeS4NCkJlY2F1c2Ug
dGhpcyBpcyBleGFjdGx5IHdoYXQgSSB3YXMgbm90IHVuZGVyc3RhbmRpbmcsIHdoeSBJIGNvdWxk
bid0IHNlZSANCmFsbCBtb3ZlZCBmdW5jdGlvbnM6IGp1c3QgYmVjYXVzZSBtYW55IG9mIHRoZW0g
d2VyZSBub3QgbW92ZWQgYnV0IGNvcGllZC4NCg0KSW4gdGhlIHR3byBmaXJzdCBwYWdlcyB5b3Ug
bWFkZSBzb21lIGZ1bmN0aW9uIHN0YXRpYywgYW5kIHRoZW4geW91IA0KZHVwbGljYXRlZCBpdC4g
V2h5ID8gV2h5IG5vdCBrZWVwIGl0IGdsb2JhbCBhbmQganVzdCB1c2UgaXQgZnJvbSBvbmUgDQpw
bGFjZSB0byB0aGUgb3RoZXIgPw0KDQpCZWNhdXNlIGFmdGVyIHBhdGNoIDMgd2UgaGF2ZToNCg0K
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L21wYzg1eHhfcmRiLmM6c3RhdGljIHZvaWQgX19p
bml0IA0KbXBjODV4eF9yZGJfcGljX2luaXQodm9pZCkNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
ODV4eC9wMjAyMC5jOnN0YXRpYyB2b2lkIF9faW5pdCANCm1wYzg1eHhfcmRiX3BpY19pbml0KHZv
aWQpDQoNCmFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X2RzLmM6c3RhdGljIHZv
aWQgX19pbml0IA0KbXBjODV4eF9kc19waWNfaW5pdCh2b2lkKQ0KYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84NXh4L3AyMDIwLmM6c3RhdGljIHZvaWQgX19pbml0IA0KbXBjODV4eF9kc19waWNfaW5p
dCh2b2lkKQ0KDQpXaHkgbm90IGp1c3QgZHJvcCBwYXRjaGVzIDEgYW5kIDIgYW5kIGtlZXAgdGhv
c2UgdHdvIGZ1bmN0aW9ucyBhbmQgYWxsIA0KdGhlIG90aGVyIGNvbW1vbiBmdW5jdGlvbnMgbGlr
ZSBtcGM4NXh4XzgyNTlfY2FzY2FkZSgpIA0KbXBjODV4eF9kc191bGlfaW5pdCgpIGFuZCBhIGxv
dCBtb3JlICBpbiBhIHNlcGFyYXRlIGNvbW1vbiBmaWxlID8NCg0KQ2hyaXN0b3BoZQ0K
