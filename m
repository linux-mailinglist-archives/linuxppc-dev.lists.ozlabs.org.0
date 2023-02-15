Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B4697749
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 08:19:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGqGC2ds0z3cjB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 18:19:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=onOqXrgd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0e::60b; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=onOqXrgd;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGqDk6ly2z3f63
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 18:18:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vycdgwf7PpM3X2nG4DVHnGWEP6WCdEsvQ9SE3Z/g76j9w0BRG3Lj/YjPj41nrk/Um+1fpV69B4tbhpJzgC62nDyXMxtLXzpJ10Tv/HDythx/f91c8od8dMQUWLKf1+pf4eiL4rpU7StaQaF4TtpetJsqG6zE40nPQ5NGNE5CqX08UC8fev+fVBzTE0AdnXNxIWPkfU9C7kSPnFAnJreENJLTwgSssjFKXuXhFH2f4aLeY4jcoGApNBsQeAdSa4iXeNJFPFHIQnItc+krHssNl6uvz5zufBTmHTBhpCpQIOVkr8i6DzQVoynrjr0smkIQYx1ER+71LdOfA485Fa0+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVFSDDQyzqogJXMH4RgAw61LL7OI6tDN1LqjTaJjmSk=;
 b=HWI0Hun9v2aHtKd8AkkmZqKW4O43tTMXH6U18sr2jGYXo4IWmCuwUNoBN1y8dZDfRDtUfAafjOziJyfaROIjxeAk6Bp2qbwOwC1GXZmTavVPIR4BOJTlOtqF3m3sRwaUhR30/F0MI7a8nKaYKf9Q0qFcB2CA1vgUe9bOZCpbr9MXaSBiyeqLy0A8rNuFJPw8o0nfpRJPM1tt7AYFEi9aXPX4F0m3vy+0n2shLA9NWrAHSrNMIcqtIIoeOUyYRNOvNQ4haWX/kfM8NbZTx0DUd9HkgK4rr8pf57G0Sr+ON8OCBm2rghvC3Y18zDGnklnN6UJfUAI6GO5koBPkNBuI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVFSDDQyzqogJXMH4RgAw61LL7OI6tDN1LqjTaJjmSk=;
 b=onOqXrgdKqZla1TGtBzxNJJknCyAzRLkxkktl9MY2VoSCm67fKj+6gtKNjwr8kagxKdqjxx9QwHwT4BQzpHUKLSt5+0zfKLcbY6FfqgR/CvjGwUZI4EmHGBPF6yvshrH/a4Fgdx+VByZ7qcx8iCWK4SedVhEyJQGX0GbcrsjAZjKTV448+kQlZj25PFD6WsKwH6BsSlmbmtlg6lObQYt9goZy7srchPkGYbzv5D2C785/fUfjIYwqULa10m0IV+mJ4/SwZQrXnoldhlcNTmP7R8wD5DdsmoS29fgLwq1Niz73QEPuszcRTAizHRK8NRDp+ms9jb3u+dsPcIFpWcxjw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3433.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:148::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 07:18:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 07:18:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v7 6/7] powerpc: mm: Add p{te,md,ud}_user_accessible_page
 helpers
Thread-Topic: [PATCH v7 6/7] powerpc: mm: Add p{te,md,ud}_user_accessible_page
 helpers
Thread-Index: AQHZQOHQkmCTuUtzx0au4jLDUIQrj67PmY8A
Date: Wed, 15 Feb 2023 07:18:12 +0000
Message-ID: <ae131554-a034-9bed-2dfa-a2cbc1456174@csgroup.eu>
References: <20230215020155.1969194-1-rmclure@linux.ibm.com>
 <20230215020155.1969194-7-rmclure@linux.ibm.com>
In-Reply-To: <20230215020155.1969194-7-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3433:EE_
x-ms-office365-filtering-correlation-id: e30dd44b-3f5a-464d-eb9d-08db0f24cc66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bBs8UgwvizfRq29man+Tv+yV1km/wx6jJtMgVCv9XbtahUXII5FOcDYdmEFLwwfR5F7HLJ4Zg0ehUX6UgqhuxzbvN3A72dhwVC1xoADgTIUOVEdm7s7uGtJOW3sIg9hJAIQAX1O19+i+9n4ywFaYzlu1GguKTFp8+5NAH+N6wtH69nf5XCy+K6FxcXbm/riqzXlqsi0lnx0UoxLfImTn7r0cawlNosx5W2kFZNd1in0FC06jg5Z3q/xSloJV6FanJ5zO7sWowJVKgybbt9cdUXF4E3DOHJcRy4EZ7ubi5+TgGzWXji/jrm65Fm2FVBKqMrivXZReOvNIycD8e2uL+DzkCQe4FgEsv8m0smyVDf0wWAG4C3c41PYV9QAIq/BaF3KG4DqcZAYbRK8v6PuHyLa05q9wK+irUFVnjcpStKD4M+jCKkhKbChHVfmawCzfar8pJGcXApGVH+fmWYIZRGPn/cENVoBZ/qjdvPsYHB1nCoy5biafpphPOmt/PT+HTE/aH+HbU+WfUwRJIW8NnTIK9oZQkG31NhlPtG44cGr1PGs2xcZXLOfIVyyZT6oARlcSE4umLAl10nGcBInrHTx61LaSJzhZ+rBYG9Cq0LA4cR9bJDI+J/GHbtInweUvmfSqF3eGsg8WWcyEk0nuBp5krT0j/Qjo0ZjWPbNIYAy9BshOHqUnixkPdn2Dt8fwTNQkqvOSJ4zg0k09N3qZoaelZGh6hBuuNqFvgBW4xqrjo8dVY/cxsXYb/Cyinr76E98F5q3hXEAKvGrA4zJ1oA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(5660300002)(2616005)(36756003)(478600001)(66446008)(86362001)(64756008)(66476007)(66556008)(316002)(4326008)(110136005)(66946007)(91956017)(6486002)(76116006)(71200400001)(8676002)(31696002)(26005)(8936002)(6512007)(38070700005)(186003)(6506007)(41300700001)(2906002)(122000001)(38100700002)(31686004)(83380400001)(66574015)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L3NPb2F1QUdzRzc4S1hqYmJRak5GNjNlenJDWUdTb0QxRXFUS1FITWloanpP?=
 =?utf-8?B?aU0yTkR6eStXS1RJNmQ2NHdmUHB6NERTcTRuVUhJdUVobkh6dUZ2dEd3OGpz?=
 =?utf-8?B?b2FraEMzbmxwQlhnSFdqZHhqdXVhclR6dnBINksvNUZieWhWTUd2N0tqS3dU?=
 =?utf-8?B?Wlo3dGNQb1NNNFRXRXI2aUpHaUFkR0Z5TFN3bmJUZmpDMkttRTJpV1lSQmJs?=
 =?utf-8?B?QUJnMFFPY1RvU0VoVGo4Qno1SWZkQmJ3cEllZnJlVjhocElyU2QrTFZSTWsr?=
 =?utf-8?B?dHhqZUdwRDdSekgzQVQrZGthYkw4bjhZS3BFOWdHdHRQbGMyKzRMampWaUFw?=
 =?utf-8?B?L0RIRWV0d0J1ZVJsQkVYYXNzNXZCSzJoR01WdUJVdzVOZW9uaENBRHQwdFk2?=
 =?utf-8?B?b3Awb3pDYjdOSFhoS0RwcjI2VG9JKzRoUjJKQVdUc25pUllMQy9KMVlWc2tH?=
 =?utf-8?B?cDZNS3NJdmJYNUtxVi8xakFmZ293ZFZhWUFaeWR2Sm03eERva3AxTWh5cjFn?=
 =?utf-8?B?OEV4enowOTlOMDlhVmNUVHhydjk0MEVIZEt4M1QwNW4yaG9QV25UVmo3aFhL?=
 =?utf-8?B?VHhzdjMvL28xdE9aRHE4NWZacGdIZGIzRE15MVBIR2FlMFlZV2MzRTFWdmE5?=
 =?utf-8?B?cE5WSGRvVWdpS3g5UkpQZHNlYzJ1dlVVbStwNmJTVW5aeDl1eTltc1c1WXN3?=
 =?utf-8?B?d3R2TTZKU2ZvZTNQSzgzUGdZYzZVL3pQZkdZaDlRWmhodTcxWHNEdFVUQ3Nw?=
 =?utf-8?B?ZWtoTll4cUFvTi9hSmtHTGdDU0QzVHdSQXlyZEpNU25YbmRkRStLM0EzZ3RO?=
 =?utf-8?B?YnlEZjNmemZJNTVUeEQvSmRLTzRUTDRVUi9ieWZVby9PQ0JTTmE2dUxUSWNB?=
 =?utf-8?B?ZFVycFBxTnhueklKak5VbXJGamt4TUVsaUI5a2hSOGFaWjdMZ0RNVTgvN2FP?=
 =?utf-8?B?VUErVFhRamlscDlGNUtrOXUyemRHRi9RaG5QL01EaUkvVGtKNmY4Y0pvZnFx?=
 =?utf-8?B?K2tXWk5IK2ZYdjBXNnlBTHhUVXpDcktCMERXemx0a25Gc2ZKMUxQM3IrK1dt?=
 =?utf-8?B?SHNKQ0lZNWV0bU5IeGgvRDk3VDdubndLd3VJdjEwT2s0UEJRY0hubEF5OUsr?=
 =?utf-8?B?QWFzQ3Q4cE4rWjh0V0pKTWlLZG1hYVJmVmluS2J2cTIyd1U4MGowd2kxemhY?=
 =?utf-8?B?Y3p5Tng2bDR5a0RvaVJVUmdHSEE4SnQzSE5DZ0t4YzduVWxlMlZmN1kxMTFI?=
 =?utf-8?B?N0ZQUW1xNm1IbDRmWVIxMVd0NlhDeHpiTzNzaDc2RzMrUXFoY0FvR21saWZz?=
 =?utf-8?B?M252RjVxaW92aDN4YzB1dnRZanpBMmo5MTd0bDh5UTljbTk1RU9UemdlTXZq?=
 =?utf-8?B?cEFXdXY2T2NFSjBoTElndVQveStzUXdXRTBmTEhPWG5tWnAvQTJTNDczR1hO?=
 =?utf-8?B?M0MwbmM2UXpIemtJb0E1SmlDZWV1OE14aGIydEc0SFBqV2JuaWtWU3NsT0Zs?=
 =?utf-8?B?dmlrNVNOclp0TUtMNkcxbG04cGVnNzNaMzRud0VsMWF1a0RSNXIzdTliWTc3?=
 =?utf-8?B?c2VrRm1GNHhnbGVKbXJLNE1iVWlKNGFCWU9HMjdMZ0FBWmZxdzEwbk5qcnpw?=
 =?utf-8?B?UlNzd1p0cUxNeXZIcFJjSEtKTzlUc0Nwemt4RWQvYVNiSzZCZnI2elNOeVZT?=
 =?utf-8?B?N1dCT0g1OGpaUlJJNDgrZWhKWkhEQkhJdDlVeU5jSGIxdHp4SW1yUzJYV2dS?=
 =?utf-8?B?NFo1dmNpeFpkWFlUN1djTmlrNFQxVW8wUlJ3Uzd2N1FYa1pGdXdHdmRVVWpk?=
 =?utf-8?B?ditneHFmTHM2WkZaMVlZTHVZN0FnY2tFTUJIa0NaZzJOUjFFeFAxaXl2SG4r?=
 =?utf-8?B?VG40MW81QUVMMVZFdndjRmJXSFIzY0RZWEtpTXRSenZVQVBPcnFjcnl4TTVU?=
 =?utf-8?B?VGdmNUpoa3MvYkpRR0pZQkRJNnBqNTl3VkFnTmZ3V2dEdnFuazBsMmhTRUl5?=
 =?utf-8?B?R1VpUEtLZjd4eGNraGYza2xZei9OM3hJM0JIOFFid0N5UkMyVHFCaDY4YkRL?=
 =?utf-8?B?NHN1NmFVTklKTWRzUlF2YjRyK21JK2RSNk9XS2pyV0JzeU5mMm13TjFiZHNV?=
 =?utf-8?B?dE13Rk56L2dtN3dmV0l2ejl6Nkl0aURGNVBHSWFBam9aT1RKS0dKR3Y5TG1x?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9662084250E8C742B60E77D78325FB26@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e30dd44b-3f5a-464d-eb9d-08db0f24cc66
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 07:18:12.5124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jm2DaaDejuGve3Ysg48+bGYRZKr95DjC41TF2f8tmbK3g/hZDDhYtE0HoZqWQ1UrZDvSpqK5HC1r8fSyaeWse5gy08ZePqPs/KX445Lzz3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3433
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

DQoNCkxlIDE1LzAyLzIwMjMgw6AgMDM6MDEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
ZGQgdGhlIGZvbGxvd2luZyBoZWxwZXJzIGZvciBkZXRlY3Rpbmcgd2hldGhlciBhIHBhZ2UgdGFi
bGUgZW50cnkNCj4gaXMgYSBsZWFmIGFuZCBpcyBhY2Nlc3NpYmxlIHRvIHVzZXIgc3BhY2UuDQo+
IA0KPiAgICogcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICAgKiBwbWRfdXNlcl9hY2Nlc3Np
YmxlX3BhZ2UNCj4gICAqIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZQ0KPiANCj4gQWxzbyBpbXBs
ZW1lbnQgbWlzc2luZyBwdWRfdXNlciBkZWZpbml0aW9ucyBmb3IgYm90aCBCb29rM1Mvbm9oYXNo
IDY0LWJpdA0KPiBzeXN0ZW1zLCBhbmQgcG1kX3VzZXIgZm9yIEJvb2szUy9ub2hhc2ggMzItYml0
IHN5c3RlbXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGlu
dXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gVjI6IFByb3ZpZGUgbWlzc2luZyBwdWRfdXNl
ciBpbXBsZW1lbnRhdGlvbnMsIHVzZSBwe3UsbX1kX2lzX2xlYWYuDQo+IFYzOiBQcm92aWRlIG1p
c3NpbmcgcG1kX3VzZXIgaW1wbGVtZW50YXRpb25zIGFzIHN0dWJzIGluIDMyLWJpdC4NCj4gVjQ6
IFVzZSBwbWRfbGVhZiwgcHVkX2xlYWYsIGFuZCBkZWZpbmUgcG1kX3VzZXIgZm9yIDMyIEJvb2sz
RSB3aXRoDQo+IHN0YXRpYyBpbmxpbmUgbWV0aG9kIHJhdGhlciB0aGFuIG1hY3JvLg0KPiAtLS0N
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCB8ICA0ICsr
KysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCB8IDEw
ICsrKysrKysrKysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL3BndGFi
bGUuaCB8ICA1ICsrKysrDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9w
Z3RhYmxlLmggfCAxMCArKysrKysrKysrDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Bn
dGFibGUuaCAgICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysNCj4gICA1IGZpbGVzIGNoYW5n
ZWQsIDQ0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvMzIvcGd0YWJsZS5oDQo+IGluZGV4IGEwOTBjYjEzYTRhMC4uYWZkNjcyZTg0NzkxIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUu
aA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaA0K
PiBAQCAtNTE2LDYgKzUxNiwxMCBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9tb2RpZnkocHRl
X3QgcHRlLCBwZ3Byb3RfdCBuZXdwcm90KQ0KPiAgIAlyZXR1cm4gX19wdGUoKHB0ZV92YWwocHRl
KSAmIF9QQUdFX0NIR19NQVNLKSB8IHBncHJvdF92YWwobmV3cHJvdCkpOw0KPiAgIH0NCj4gICAN
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcihwbWRfdCBwbWQpDQo+ICt7DQo+ICsJcmV0
dXJuIDA7DQo+ICt9DQo+ICAgDQo+ICAgDQo+ICAgLyogVGhpcyBsb3cgbGV2ZWwgZnVuY3Rpb24g
cGVyZm9ybXMgdGhlIGFjdHVhbCBQVEUgaW5zZXJ0aW9uDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+IGluZGV4IGRmNWVlODU2NDQ0ZC4uYTZlZDkz
ZDAxZGExIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0
L3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Bn
dGFibGUuaA0KPiBAQCAtNTM4LDYgKzUzOCwxNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHRlX3Vz
ZXIocHRlX3QgcHRlKQ0KPiAgIAlyZXR1cm4gIShwdGVfcmF3KHB0ZSkgJiBjcHVfdG9fYmU2NChf
UEFHRV9QUklWSUxFR0VEKSk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlubGluZSBib29sIHBt
ZF91c2VyKHBtZF90IHBtZCkNCj4gK3sNCj4gKwlyZXR1cm4gIShwbWRfcmF3KHBtZCkgJiBjcHVf
dG9fYmU2NChfUEFHRV9QUklWSUxFR0VEKSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBwdWRfdXNlcihwdWRfdCBwdWQpDQo+ICt7DQo+ICsJcmV0dXJuICEocHVkX3JhdyhwdWQp
ICYgY3B1X3RvX2JlNjQoX1BBR0VfUFJJVklMRUdFRCkpOw0KPiArfQ0KPiArDQo+ICAgI2RlZmlu
ZSBwdGVfYWNjZXNzX3Blcm1pdHRlZCBwdGVfYWNjZXNzX3Blcm1pdHRlZA0KPiAgIHN0YXRpYyBp
bmxpbmUgYm9vbCBwdGVfYWNjZXNzX3Blcm1pdHRlZChwdGVfdCBwdGUsIGJvb2wgd3JpdGUpDQo+
ICAgew0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9w
Z3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL3BndGFibGUuaA0K
PiBpbmRleCA3MGVkYWQ0NGRmZjYuLmQ5NTM1MzNjNTZmZiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmgNCj4gQEAgLTIwOSw2ICsyMDksMTEg
QEAgc3RhdGljIGlubGluZSB2b2lkIHBtZF9jbGVhcihwbWRfdCAqcG1kcCkNCj4gICAJKnBtZHAg
PSBfX3BtZCgwKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX3VzZXIo
cG1kX3QgcG1kKQ0KPiArew0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiAgIC8qDQo+
ICAgICogUFRFIHVwZGF0ZXMuIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIHdoZW5ldmVyIGFuIGV4
aXN0aW5nDQo+ICAgICogdmFsaWQgUFRFIGlzIHVwZGF0ZWQuIFRoaXMgZG9lcyAtbm90LSBpbmNs
dWRlIHNldF9wdGVfYXQoKQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L25vaGFzaC82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0
L3BndGFibGUuaA0KPiBpbmRleCBkMzkxYTQ1ZTBmMTEuLjE0ZTY5ZWJhZDMxZiAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgNCj4gQEAgLTEy
Myw2ICsxMjMsMTEgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwbWRfcHRlKHBtZF90IHBtZCkNCj4g
ICAJcmV0dXJuIF9fcHRlKHBtZF92YWwocG1kKSk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlu
bGluZSBib29sIHBtZF91c2VyKHBtZF90IHBtZCkNCj4gK3sNCj4gKwlyZXR1cm4gKHBtZF92YWwo
cG1kKSAmIF9QQUdFX1VTRVIpID09IF9QQUdFX1VTRVI7DQo+ICt9DQo+ICsNCj4gICAjZGVmaW5l
IHBtZF9ub25lKHBtZCkJCSghcG1kX3ZhbChwbWQpKQ0KPiAgICNkZWZpbmUJcG1kX2JhZChwbWQp
CQkoIWlzX2tlcm5lbF9hZGRyKHBtZF92YWwocG1kKSkgXA0KPiAgIAkJCQkgfHwgKHBtZF92YWwo
cG1kKSAmIFBNRF9CQURfQklUUykpDQo+IEBAIC0xNjQsNiArMTY5LDExIEBAIHN0YXRpYyBpbmxp
bmUgcHRlX3QgcHVkX3B0ZShwdWRfdCBwdWQpDQo+ICAgCXJldHVybiBfX3B0ZShwdWRfdmFsKHB1
ZCkpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdWRfdXNlcihwdWRfdCBw
dWQpDQo+ICt7DQo+ICsJcmV0dXJuIChwdWRfdmFsKHB1ZCkgJiBfUEFHRV9VU0VSKSA9PSBfUEFH
RV9VU0VSOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGlubGluZSBwdWRfdCBwdGVfcHVkKHB0ZV90
IHB0ZSkNCj4gICB7DQo+ICAgCXJldHVybiBfX3B1ZChwdGVfdmFsKHB0ZSkpOw0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gaW5kZXggYWQwODI5ZjgxNmU5Li5iNzZmZGI4MGI2Yzkg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBAQCAtMTY3LDYgKzE2Nywy
MSBAQCBzdGF0aWMgaW5saW5lIGludCBwdWRfcGZuKHB1ZF90IHB1ZCkNCj4gICB9DQo+ICAgI2Vu
ZGlmDQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdl
KHB0ZV90IHB0ZSkNCj4gK3sNCj4gKwlyZXR1cm4gcHRlX3ByZXNlbnQocHRlKSAmJiBwdGVfdXNl
cihwdGUpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX3VzZXJfYWNjZXNz
aWJsZV9wYWdlKHBtZF90IHBtZCkNCj4gK3sNCj4gKwlyZXR1cm4gcG1kX2xlYWYocG1kKSAmJiBw
bWRfcHJlc2VudChwbWQpICYmIHBtZF91c2VyKHBtZCk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBwdWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHVkX3QgcHVkKQ0KPiArew0KPiAr
CXJldHVybiBwdWRfbGVhZihwdWQpICYmIHB1ZF9wcmVzZW50KHB1ZCkgJiYgcHVkX3VzZXIocHVk
KTsNCj4gK30NCj4gKw0KPiAgICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8NCj4gICANCj4gICAj
ZW5kaWYgLyogX0FTTV9QT1dFUlBDX1BHVEFCTEVfSCAqLw0K
