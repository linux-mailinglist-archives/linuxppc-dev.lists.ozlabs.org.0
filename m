Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83C617844
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2x9H45Wqz3cFb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:04:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hInCeMht;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.47; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hInCeMht;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120047.outbound.protection.outlook.com [40.107.12.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2x8K0C3Rz2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:03:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE5zLDraMKEkOEOLqgZDQC+3tO0ytJTbIvwW6o5ZIOxuun+jQCfXwhoo/y5sTmbEpaPJAulXX3Re4rep/VPMAw7uuTCyoW2E0L9DViZysc22WutmjjUwmIk+eB4jq3FEGH8fapCFVshcfNc5SQqSGQJkg1PLWc5nJwrif3RGmOlVKHzHOnket+QpjVKG/i8TrJF5RUwuoz63L3RH/iSdoKjl6DzbzM1TOor4NlX59vVF1h8L30O/8zPj0g+lpn4yLjjckzl6VJyACniG81U3RALnHSfIc8aE90D/h+ojlhYLPBIdrhWc7SylCrKQMTUoOq5vCooRDo0A+Ay3OtPQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0bJl3PueXL1AHJ9t+ZHHHbLdONmevgx7epdZljsFFE=;
 b=Ogx1mpTo5hhdRl9jcNRsnFnvnGFC2O9fktD8NatHuTmOgDYvgFEIbJLKOjcujS6NWI4VYgi9A6n9vNxHkEscjsS1/6QH3lL+mZFO//3PWTcGuBNOUyBaqVdm+5uXl5VsTCC8jx8DNhy+gAaAFszWIE2vd1AHtazaQbgkUUplqtvjzqUKNr7mDHUpls4UZM5vGa2QN9hzmv9g/coeyl2/qGh76ZwlsrP7LNPhVjehvR+NCCLuEVR93e3U0AvnrCx5wjLUKdH+4462SlEXCLc7xgKxB/yT2XFC3stOBhiz6ZioUryfSteHLs729dwCrKzQtY5Xc1jNAcmGEmo2Bc7UZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0bJl3PueXL1AHJ9t+ZHHHbLdONmevgx7epdZljsFFE=;
 b=hInCeMht4m0O28MbPCzmEkuuFT9Nj6qIwr/Oo/Fy9zdNpjW319y4lbpkFCVr/2BEjCW4Gzgphb0BkFDysaJ1QmPv048Lpze7YVSiH0LHBWpLaR2VMUDKnOGRKta9+zfsUuY4bqEyHk11trOBljMgv5Tz8QBbDsjWzlSh9HYBmD6BgPilj8jh9Bd+OtlA/aoO0cZUF0sERW3pIb4PjJjl5AWuGB4wlG3tsr9LycnoTHNicTLAuKj9QfSc/vYeLLy/MMrJtUXKZHyFUFgjjs8Ukw1e5NtX7ISM2C/OTPFClnLpd9em1zApwnfchyIQNZn3fmgY9UqFROOKsl+Tm/cX0w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:02:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 08:02:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Topic: [PATCH v3 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Index: AQHY50DabMWE5kp8GEGzy5e/CEe4lK4s5tKA
Date: Thu, 3 Nov 2022 08:02:52 +0000
Message-ID: <1e757f97-79da-40f9-b039-88a569189778@csgroup.eu>
References: <20221024003541.1347364-1-rmclure@linux.ibm.com>
 <20221024003541.1347364-2-rmclure@linux.ibm.com>
In-Reply-To: <20221024003541.1347364-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2041:EE_
x-ms-office365-filtering-correlation-id: e4b2c292-84d2-409a-e4cf-08dabd71ceeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  sug4YpN0ZXcKtN0OqRHie/5muaPSVyK6ovrpCQMD31rCys/YqvCMyD/TbcNQlaJBY8Hr0Zfwk32wGqhore5BWKoyYyYbj0B2qoSUcv2bJk1cMTCE5vbozt8kRj7yD9t8gI3Y8+6ctb+ExTyKmfus7Mzehx44DTTfoGBZbsgoqvX3wwsc7zLa0K6pi1F3i9Qm+p8AMrcxG1/t0dCDJPLJISqDXRALJk4DOK2pLZ6wazqj+ARkhcYtCIg5PQIjnXXZtzXEeUdQ/wvUusEl06TTJoLxa/vlMZ2rv2rPQUcGAcHRGz6/PuBkwnDuWLigI2kWuvDMOx5MT0Roa/Mmnl85hRkKOdSEAOn6KqneQlI7wNxPcJRgHQoOw387ykYoxGH/iKXub6nwB9d+xDonrrBoY++U50qjHLg9l7owO9QcL/fb8wDW3X0lsxD8CvQLIt4nRnjmVBVCTnEAlGbbar65DzBSJpRw7nTdhAirwjWmAszVEAaNxHId8dmfwU2gBXR3r3pSp6SKzJaudOmi5OFXSAHnTPr6HOlZYYx1Zcpi07IojWZIp9mFRylRnYp+5thw04phLm3gLeyU9eocmd5084lwt646L8bt/By7jSYYb+plLKLLPalYpMqNOJ8+p0pMivxTCjO5dz9kqJrCwXXXlkp+xzcI+yMd7WAHGQK6/xh/SgFcwevCYtzFcFiGFtTsxuaD3E4wCg/LdyPpdoWcsr1xHVsIuV51+/I98LhgtSGn8H1PeNx4uNcsw6cJ14DPQ0rRWFrkC9qyOJ2zssir3Q/rQbQ9CaiJd27RsAyOxjFopVe9v2YDAf8Sa9Zpr0NjkTB/gVfmwDUm7gQ3qIC89g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(346002)(396003)(366004)(376002)(451199015)(44832011)(66476007)(66446008)(64756008)(6486002)(66946007)(478600001)(66556008)(91956017)(76116006)(66574015)(2616005)(186003)(5660300002)(8676002)(316002)(38100700002)(122000001)(2906002)(71200400001)(41300700001)(83380400001)(110136005)(38070700005)(36756003)(31686004)(6506007)(8936002)(86362001)(26005)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cndrZms3QVE1LzBMVXdaR0Y3djhhcVFydXRBSUNDUXE5N2l1ak42c2llc1k1?=
 =?utf-8?B?UUJlR2tGQWdYVHFVY094b09NbEkramxaZGJjY3FPREhqK3JBdHh2RG11N256?=
 =?utf-8?B?VG9kZXZBWWtYUzNaUmdSUUZOY3B1SFNWUE03bStibTRhbUpzbnp6dmJzVnd1?=
 =?utf-8?B?aWlkOFJ0c21RNGVmaDZzQWEzenozTnhxb1BZem03RFdVbHNsNndSWVEzNW5F?=
 =?utf-8?B?Ui96TWhDMHo2ZGZJc1A3WUZmalhCeXRjUFMwTHdWQ3lSSXU4dWJNQ0djc1Zx?=
 =?utf-8?B?ci9xQWNlT0NuNGVDY1BVSDFBaHNSWlVuOXo2S2R0aWN3cStYcVYrOHlNa016?=
 =?utf-8?B?Q3BFeDlJMk5iQnFaM2x6d1BmTTN0cktYVFZtY3NyUGFONlBZaUlCaHY4VlZK?=
 =?utf-8?B?UWUzSFYyei95RWVZaG5iU0Y5N1ZZeGRXelZzV3RnaktJVzhjRm4xUUFaeHlM?=
 =?utf-8?B?MUU1SjN4STZRVFJ6MVVGdDM0QkJKdFVTMlRZbm9UbzAySG84QThrU09yRXpP?=
 =?utf-8?B?QUJ5TWpsUWNVVXJmNDFIR0trSEc4UitzYzJCZmoyN1ZqOWNRNVhNbzBBUjBP?=
 =?utf-8?B?NU1acXZ1bGxMaTNxWC9FYkpHU2lxNEFIbURlVnhJakE1Mk9pWmw4TDdKZXZV?=
 =?utf-8?B?RGFSV3lSaWdmanM1eGI3WXJhbC85T2wxWWpETmVmcU43UHRySlp5RERSeHli?=
 =?utf-8?B?TlNoRUYwbjRpMjgzZzhkZWRZbDV0Q3pzVkNwYXVZM0dkZTFoN2k2YTYxbjZD?=
 =?utf-8?B?b3dFcEROOWw4NUpKQUdYWnl2TlgwZ1lzcENwaHlYZ1ZwQW1GY2JsQW1Xb1lG?=
 =?utf-8?B?N093NXZrNVh0bmF2UjFnUmE2emJRZThkV3lzU2VBVllwWWZOYThYNmNSeGFS?=
 =?utf-8?B?U0pqQXFDdnZFN1lpOXNVb1NtRk9JZGMyaDloV0lBY1dzMFp0V0kwQWNtOEl1?=
 =?utf-8?B?czhJWWo3NEZ5RmxsTlZJWHZEUVRFak84TmpDWVJ2TzZ4cmZmd0s3SjFxNCty?=
 =?utf-8?B?WUFPM2RDRWNMeXlSeG5ua0V4TzkvaU5CL3lHTDllcTR6bzcyM3VESFNqS1Jo?=
 =?utf-8?B?aE5TeFlXOG5HRGxNQmZEYVQwRGYzRi9JM0k3VVI3MkRrQWUzY1lsSUxKSmVs?=
 =?utf-8?B?R2tyK3RxSXFQOFhvcy81MzFkRHc2ajRuMjl6NXczVmZFYlE5aXM0SjFlbSsz?=
 =?utf-8?B?S0xsdXkweGtPVDFzVXVLaURmVE1RQ2VSSm5Mb1lFRmlacFg3Y0gyTTJCaEdJ?=
 =?utf-8?B?NlRoWkxCTElTUXVaY0xTQVFjUGZpZllMdGZMcmlDMDAzZU1IdFpKL2FTS1Fh?=
 =?utf-8?B?YU0wNHVsdUpqZEs5bm0rNzVVN2pONHdUQkg2dXJVT3QwaWk4dVRmbGhjalJ2?=
 =?utf-8?B?VkFWbWcvZnBKcHFxYlQ3RmpUeVovOUMxZFR1d2hkemdJSVZpd2wvcjJHSDhJ?=
 =?utf-8?B?VkRhdWEzYTF6dHhzb0VZa0EyVERSYjE5Q0ZjRWZESFgxRVR1R2hFUFhCVWph?=
 =?utf-8?B?b3JCaU8zMm9QVUlrNFR6cmx4RzJlUitlMXY1MkFDVHE2cEVqaVBNZUt3TEs5?=
 =?utf-8?B?dHBvcG1LdVJsbDBkZ1BQSTFEWktiUzVRUnpBWUxjZ1JCYXovUm45YjJ3UE9F?=
 =?utf-8?B?RWF5aXdYM08veE1XTE9HRER5ejA4OUNHblV0clpoKzY1eW5vcE94MjI1OU41?=
 =?utf-8?B?aTlvMk1MYTZObUtVRjNDQlROUUx5MHR0Vjl3c2x3QU5rblozWlVOeldlSmJI?=
 =?utf-8?B?aVVhQUc1OTZWMVJqYjhEY1FDcUhSbG05NW9GYTdSdThhcFRlbGtoUitIYng5?=
 =?utf-8?B?elVnNGg3L2dCVWJHUUYwVHVsU2QrSTFqR0w1di8wcjU3dk04K0UzT0NVV2lr?=
 =?utf-8?B?SERtZ1ZMY1Z6M1BFYXNmOWF2ZFU0MkZvUHdkVkg5L1JXT3NwcU52eW15NHhk?=
 =?utf-8?B?c3k4ejhoU21Xa3lEamUzS1BjTk41dWc1eVlBNlBVcTBZWEdzT25qSTg5NGtW?=
 =?utf-8?B?ZzFHWmZDNGtqRFRVWWtnS1dyWXdiVkMyNUhjbThjS093b0hMbmtpYjBXSjJZ?=
 =?utf-8?B?SUJERUhDNkxVWmlIZi9JZ3g3SXpWNVJka2VOQWVCNnl3bkxBaStaOGhRcExy?=
 =?utf-8?B?bXp0MjJyWEdieGYxd0ZZOE1PNG9ZZUtzeURvWWRTNlU2am1PMStRLzBMaGNK?=
 =?utf-8?Q?mOBSnfJU5jm1QGwq8RUrN3o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9085B10FCB0B8D419C1B5F78AAAE81B4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b2c292-84d2-409a-e4cf-08dabd71ceeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:02:52.6397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLCrhp3/pDwoJqo533TVadeuZeL7TWVbJdKwjmt7TGXyh3movNlUc+cMy0wnBRcsBN+54OBEXya8x+ktybqXsidqlIYmLr81xokfhydETyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2041
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzEwLzIwMjIgw6AgMDI6MzUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
ZGQgdGhlIGZvbGxvd2luZyBoZWxwZXJzIGZvciBkZXRlY3Rpbmcgd2hldGhlciBhIHBhZ2UgdGFi
bGUgZW50cnkNCj4gaXMgYSBsZWFmIGFuZCBpcyBhY2Nlc3NpYmxlIHRvIHVzZXIgc3BhY2UuDQo+
IA0KPiAgICogcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICAgKiBwbWRfdXNlcl9hY2Nlc3Np
YmxlX3BhZ2UNCj4gICAqIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZQ0KPiANCj4gQWxzbyBpbXBs
ZW1lbnQgbWlzc2luZyBwdWRfdXNlciBkZWZpbml0aW9ucyBmb3IgYm90aCBCb29rM1Mvbm9oYXNo
IDY0LWJpdA0KPiBzeXN0ZW1zLCBhbmQgcG1kX3VzZXIgZm9yIEJvb2szUy9ub2hhc2ggMzItYml0
IHN5c3RlbXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGlu
dXguaWJtLmNvbT4NCj4gLS0tDQo+IFYyOiBQcm92aWRlIG1pc3NpbmcgcHVkX3VzZXIgaW1wbGVt
ZW50YXRpb25zLCB1c2UgcHt1LG19ZF9pc19sZWFmLg0KPiBWMzogUHJvdmlkZSBtaXNzaW5nIHBt
ZF91c2VyIGltcGxlbWVudGF0aW9ucyBhcyBzdHVicyBpbiAzMi1iaXQuDQo+IC0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oIHwgIDQgKysrKw0KPiAg
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgMTAgKysrKysr
KysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oIHwg
IDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5oIHwg
MTAgKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrKysrDQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jv
b2szcy8zMi9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3Bn
dGFibGUuaA0KPiBpbmRleCA0MDA0MWFjNzEzZDkuLjhiZjFjNTM4ODM5YSAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4gQEAgLTUzMSw2
ICs1MzEsMTAgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbW9kaWZ5KHB0ZV90IHB0ZSwgcGdw
cm90X3QgbmV3cHJvdCkNCj4gICAJcmV0dXJuIF9fcHRlKChwdGVfdmFsKHB0ZSkgJiBfUEFHRV9D
SEdfTUFTSykgfCBwZ3Byb3RfdmFsKG5ld3Byb3QpKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgcG1kX3VzZXIocG1kX3QgcG1kKQ0KPiArew0KPiArCXJldHVybiAwOw0KPiAr
fQ0KPiAgIA0KPiAgIA0KPiAgIC8qIFRoaXMgbG93IGxldmVsIGZ1bmN0aW9uIHBlcmZvcm1zIHRo
ZSBhY3R1YWwgUFRFIGluc2VydGlvbg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9v
azNzLzY0L3BndGFibGUuaA0KPiBpbmRleCBmOWFlZmE0OTJkZjAuLjMwODMxMTFmOWQwYSAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgN
Cj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4g
QEAgLTYyMSw2ICs2MjEsMTYgQEAgc3RhdGljIGlubGluZSBib29sIHB0ZV91c2VyKHB0ZV90IHB0
ZSkNCj4gICAJcmV0dXJuICEocHRlX3JhdyhwdGUpICYgY3B1X3RvX2JlNjQoX1BBR0VfUFJJVklM
RUdFRCkpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcihwbWRf
dCBwbWQpDQo+ICt7DQo+ICsJcmV0dXJuICEocG1kX3JhdyhwbWQpICYgY3B1X3RvX2JlNjQoX1BB
R0VfUFJJVklMRUdFRCkpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3Vz
ZXIocHVkX3QgcHVkKQ0KPiArew0KPiArCXJldHVybiAhKHB1ZF9yYXcocHVkKSAmIGNwdV90b19i
ZTY0KF9QQUdFX1BSSVZJTEVHRUQpKTsNCj4gK30NCj4gKw0KPiAgICNkZWZpbmUgcHRlX2FjY2Vz
c19wZXJtaXR0ZWQgcHRlX2FjY2Vzc19wZXJtaXR0ZWQNCj4gICBzdGF0aWMgaW5saW5lIGJvb2wg
cHRlX2FjY2Vzc19wZXJtaXR0ZWQocHRlX3QgcHRlLCBib29sIHdyaXRlKQ0KPiAgIHsNCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmgNCj4gaW5kZXggOTA5
MWU0OTA0YTZiLi5iOTIwNDRkOWQ3NzggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oDQo+IEBAIC0zNTQsNiArMzU0LDcgQEAgc3RhdGljIGlu
bGluZSBpbnQgcHRlX3lvdW5nKHB0ZV90IHB0ZSkNCj4gICAjZW5kaWYNCj4gICANCj4gICAjZGVm
aW5lIHBtZF9wYWdlKHBtZCkJCXBmbl90b19wYWdlKHBtZF9wZm4ocG1kKSkNCj4gKyNkZWZpbmUg
cG1kX3VzZXIocG1kKQkJMA0KPiAgIC8qDQo+ICAgICogRW5jb2RlIGFuZCBkZWNvZGUgYSBzd2Fw
IGVudHJ5Lg0KPiAgICAqIE5vdGUgdGhhdCB0aGUgYml0cyB3ZSB1c2UgaW4gYSBQVEUgZm9yIHJl
cHJlc2VudGluZyBhIHN3YXAgZW50cnkNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25v
aGFzaC82NC9wZ3RhYmxlLmgNCj4gaW5kZXggNTk5OTIxY2MyNTdlLi4yM2M1MTM1MTc4ZDEgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5oDQo+
IEBAIC0xMjMsNiArMTIzLDExIEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcG1kX3B0ZShwbWRfdCBw
bWQpDQo+ICAgCXJldHVybiBfX3B0ZShwbWRfdmFsKHBtZCkpOw0KPiAgIH0NCj4gICANCj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcihwbWRfdCBwbWQpDQo+ICt7DQo+ICsJcmV0dXJuIChw
bWRfdmFsKHBtZCkgJiBfUEFHRV9VU0VSKSA9PSBfUEFHRV9VU0VSOw0KPiArfQ0KPiArDQo+ICAg
I2RlZmluZSBwbWRfbm9uZShwbWQpCQkoIXBtZF92YWwocG1kKSkNCj4gICAjZGVmaW5lCXBtZF9i
YWQocG1kKQkJKCFpc19rZXJuZWxfYWRkcihwbWRfdmFsKHBtZCkpIFwNCj4gICAJCQkJIHx8IChw
bWRfdmFsKHBtZCkgJiBQTURfQkFEX0JJVFMpKQ0KPiBAQCAtMTU4LDYgKzE2MywxMSBAQCBzdGF0
aWMgaW5saW5lIHB0ZV90IHB1ZF9wdGUocHVkX3QgcHVkKQ0KPiAgIAlyZXR1cm4gX19wdGUocHVk
X3ZhbChwdWQpKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3VzZXIo
cHVkX3QgcHVkKQ0KPiArew0KPiArCXJldHVybiAocHVkX3ZhbChwdWQpICYgX1BBR0VfVVNFUikg
PT0gX1BBR0VfVVNFUjsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbmxpbmUgcHVkX3QgcHRlX3B1
ZChwdGVfdCBwdGUpDQo+ICAgew0KPiAgIAlyZXR1cm4gX19wdWQocHRlX3ZhbChwdGUpKTsNCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDM2OTU2ZmI0NDBlMS4uM2NiNWRl
OWYxYWE0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTE3Miw2
ICsxNzIsMjEgQEAgc3RhdGljIGlubGluZSBpbnQgcHVkX3BmbihwdWRfdCBwdWQpDQo+ICAgfQ0K
PiAgICNlbmRpZg0KPiAgIA0KPiArc3RhdGljIGlubGluZSBib29sIHB0ZV91c2VyX2FjY2Vzc2li
bGVfcGFnZShwdGVfdCBwdGUpDQo+ICt7DQo+ICsJcmV0dXJuIHB0ZV9wcmVzZW50KHB0ZSkgJiYg
cHRlX3VzZXIocHRlKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBib29sIHBtZF91c2Vy
X2FjY2Vzc2libGVfcGFnZShwbWRfdCBwbWQpDQo+ICt7DQo+ICsJcmV0dXJuIHBtZF9pc19sZWFm
KHBtZCkgJiYgcG1kX3ByZXNlbnQocG1kKSAmJiBwbWRfdXNlcihwbWQpOw0KDQpwbWRfaXNfbGVh
ZigpIGlzIHNwZWNpZmljIHRvIHBvd2VycGMgYW5kIHdlIG1heSB3YW50IHRvIGdldCByaWQgb2Yg
aXQuDQoNCkNhbiB5b3UgdXNlIHBtZF9sZWFmKCkgaW5zdGVhZCA/DQoNCj4gK30NCj4gKw0KPiAr
c3RhdGljIGlubGluZSBib29sIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZShwdWRfdCBwdWQpDQo+
ICt7DQo+ICsJcmV0dXJuIHB1ZF9pc19sZWFmKHB1ZCkgJiYgcHVkX3ByZXNlbnQocHVkKSAmJiBw
dWRfdXNlcihwdWQpOw0KDQpwdWRfaXNfbGVhZigpIGlzIHNwZWNpZmljIHRvIHBvd2VycGMgYW5k
IHdlIG1heSB3YW50IHRvIGdldCByaWQgb2YgaXQuDQoNCkNhbiB5b3UgdXNlIHB1ZF9sZWFmKCkg
aW5zdGVhZCA/DQoNCj4gK30NCj4gKw0KPiAgICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8NCj4g
ICANCj4gICAjZW5kaWYgLyogX0FTTV9QT1dFUlBDX1BHVEFCTEVfSCAqLw==
