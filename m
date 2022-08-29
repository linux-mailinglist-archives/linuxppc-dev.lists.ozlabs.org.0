Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FF5A4584
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 10:54:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGPPg6kYrz3btQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 18:54:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JMC9oMwh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.82; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JMC9oMwh;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120082.outbound.protection.outlook.com [40.107.12.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGPNs44jCz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 18:53:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNZk2YYitwib+UvpBEM3vIvV3fCA1MYM4nZdmf3NOK1g4We3i8a0z2Y1fgp3L0HM9wYVbGt1b6fsij5BGJIXz9vHZ6kwkcA0gBxnjBn78a+y8FY2T1frQGfFg1DGbQ/wO4zU/BqBgKVJO2qXUXoN7GFAbRFZxP2n8fh+dffB/Wy2urw0WiW15w5w4721fyY75OHyLN9H/6kFlQPsJH92f6Jkh2ycf/cTupLyi4wxlmQn5zR8xZzl9f5Xhg9wPpLk+l/6J5mILR2uRsGLHfBEmtLz4kJIMJ+u5wUZhTqvc1HklQCwRPIuHrYa/Y+d07uSeEu0En+xsSaTNTySzvsgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZGoT5sG1TjLqjEoF8ksvUCEcw/juMZrNOB31+iTMLw=;
 b=nJEr5V3rELvkr/zD656AYVDOdB78zIf0hpjUXNXFZef/b8U9Cd8jdaVI6fnsSFi3VGwcV6ntvP8CHuMO5X6mUpDQxncxu+G8k3M9+ZfRWafmYx38A5SGJ683ixLyrCXvTwfZsTKDUxIMVSMiEeTveGI1CO1GJ0iSMRkZJ27TVglCCe6GsoNUopKmtMjtyAUXtCEZNbiDnZz4HIHeoKFdX4YOau8phuLwVK4Z3MPiEoWzb0V67YBDdTrlCBrS55lV7OnDzxS1EU/U5nHZ4rwoa/J2UrWLXqtv6gRNevUA9O9L324a6Q14zM9RcwkQZOZqNy2RUFh6fnIW27nCZykTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZGoT5sG1TjLqjEoF8ksvUCEcw/juMZrNOB31+iTMLw=;
 b=JMC9oMwhZWxr1XqUiTpUB4DxUlS6ZGMrJOyXRuSJxUcfBEBMF60a1yDkAGPpzBbYlVbU0syfgF1XpAKzT65rgdmJSbD8WXJZWv0R9DD4cR0eXxfTW7QTmnEu3R5dSBOQ4RxaYx4LqnVU+CFG+viztBrMTFZMagF9U5dMotRxkPupaCmililoCg1a7o4pcz2AyOFUfBlN3jUAG+DLolEr3vZOhyaFcgZfQteyAFaSEZlj/2yj2Cank8FYYSsc6mY7lJqzeSWPceYfBOfoPw62prj7AzejeEmfVSuLNzk3McbJMSnPqmoNlNBg7bty0WJYBZHoVi5BMyrbwZBpijvDhg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3480.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:142::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 08:53:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 08:53:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>, Nayna
	<nayna@linux.vnet.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Topic: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Index:  AQHYspAas1zqUQZbRU+OYz0CGvi/xa2z0aMAgAAZ/PCADAxdAIAAF/qggAFxSoCAAAd/sIAABvOAgAAHS4CAAH+M8IABDWTAgADXxgCAARVXAIAAk18A
Date: Mon, 29 Aug 2022 08:53:13 +0000
Message-ID: <a5cb3cec-6c99-16de-eee1-c3c5a58a5e11@csgroup.eu>
References: <20220815190608.47182-9-elliott@hpe.com>
 <20220817232057.73643-1-elliott@hpe.com>
 <e6e99e33-4279-690d-88b8-9e732551c17c@linux.vnet.ibm.com>
 <MW5PR84MB1842E554A4677FA177D73E23AB6D9@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <1eb670ab-b238-8406-510d-c8dad46a2fb5@linux.vnet.ibm.com>
 <MW5PR84MB18421D567F8CA4E5AC99B7C3AB729@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <018a65de-60ce-1906-c461-44dc95353ab9@linux.vnet.ibm.com>
 <MW5PR84MB1842FE1C4B5218959C2608F4AB759@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <c45efdf7-a677-acb7-84c1-b64284d414a4@linux.vnet.ibm.com>
 <MW5PR84MB184208ECF216DD025CE9D35BAB759@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <MW5PR84MB1842263C39734FD662F991E2AB749@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <MW5PR84MB184220E67A8141565A8D04CCAB749@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <1e9a46d4-5511-5b89-28ef-582231a94562@csgroup.eu>
 <MW5PR84MB18429921D0AD9D1BDAB9CD8AAB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To:  <MW5PR84MB18429921D0AD9D1BDAB9CD8AAB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da251639-d814-4f9a-f8a1-08da899be7f9
x-ms-traffictypediagnostic: PR1P264MB3480:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  B/XLMto3snNCmZE68OZ2mGQqV2OuEsLo9vtPMIUu+uJueZutN69jA0CNkBx4b7EIzsdwKh+xU8mBhUMXD9u4p7WVkqgRGgbdXhogoUPUc4BphpwHkzo2bxgcVRzIpC00yKXxWGHrH7MnG0+SQyOew1WH5AQB5MDfHGZULYKp86R4g63kwuMFLaFQz8Emwb1BEXiJPKB36wu+X6+TI1AUp6lxH4uZFB3ESsgXkXy+jFFJzkW5fwyzghEz5vS13aiIg2qLuRM/KQgwDbKcEA6TP5K/SqqKqOI46gjejUpPSvk9ZguRexbMebO4+249I5PNL6ZaAo1jSsvPC2mHsz1l23CWA7sdnbD77Z73cH1hESN2wRWscnhBr4i68SWEg+x0I89CsX024LzuwTR8878ORpZoY3fFbR49XhGbxnAJumNgH+GYG4aghwjREWiq4WEBO1kAzgYi74P5AnOhfLr5hUklKWeVJ1hEZo8PpGjrcBMjwz4VgfCmrTo6WGYbwJTFG292/tnA0MJPrzpRMuGZXXKAzlKpCQBVWvOnlFLWDAUkURtWDgydQG0kfgPT1Gq4KZOCh50f673/zKk7JrQlNq4hJlfUEh4D35X+pvbjF7A7OZD5WNFCRsUuJ3FCfbKQ566S3jFBNws+yYBikGDGd4RI66J83hIvPv5Dl3r0GX05FlYGdKD4jfESz+CFPeKzZow0w2KI68Jg7xtq7t7C+BV1Ex4bGS4Mj5wVkUFZaZCUQ5er4ndi8ZflKeprYTR7ni9V20w1sw3xcaXFDVc6gYfOm/FsDV1NmO9QxPwinALvvRi032EYhCLNNfuxe2ebTvX5EyXTmde7cgz+MQkrYw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(8936002)(8676002)(110136005)(64756008)(66446008)(66946007)(66556008)(66476007)(31696002)(296002)(4326008)(71200400001)(31686004)(91956017)(316002)(6486002)(76116006)(5660300002)(36756003)(38070700005)(86362001)(478600001)(41300700001)(83380400001)(26005)(53546011)(6506007)(2616005)(38100700002)(122000001)(6512007)(2906002)(44832011)(66574015)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YXFGR1hqcWxiU1p4c3FmNG5HUzJVZzIrR2dwQW9Pc1d1aS9ZbmVBbzNFY0ox?=
 =?utf-8?B?K3dxVG1Nakkza29EaWtvUnNrekhtTFdnWFdEZ21EUWdzZkFtNFlhbyt2N283?=
 =?utf-8?B?cTl5NC9qZTdXTGxsSXM1UjRORHlmZHB2VGNRemZkU3Z6akZySndJSE95ckxs?=
 =?utf-8?B?OEZ4QXpMejN4ZHBOY05uOGhVVkkza0dqQzhabFEzNXEvNjdQRjV6QjN5TnRR?=
 =?utf-8?B?ZnpaMjh0c2dQb3JIT0tNM0JlcGhmYnVCNVBMa1JrbHJDZ2t1Nm1kdGduQ01U?=
 =?utf-8?B?QmNyaGNsQXV5MUpJSktKcy9xM1YrazRlUkdKcC83ZHQ2ZGJPVEpleFBtWVpp?=
 =?utf-8?B?cm4xbGV2ekZiM1JFL0pvOU0wZCsrZGQ5eEZKSW9PSkVPVnpzYnhZUlFzSUFh?=
 =?utf-8?B?eG9UWnVGanlwUkZSN1hBOU5SU1RTM0sxVDNLTVNZQ1hTQXUydmtuSE9ZbDZW?=
 =?utf-8?B?bDlyam83eURLWk15VzJJOXFJaVlEcU10c3RLRTQwb29rZ2lQaXlYMHZoUDhF?=
 =?utf-8?B?TFRwZGt0WlJ4NTlhMjIwTHZNVFQyamJSRWhJZWZTSXM2WWdBdVlVOHlLc0Zq?=
 =?utf-8?B?RkI2Z2p6bnBBOG9aRHM3cVRGL2FncWhsVVRqSytHanBYS0ltNXJDdzkzRE5y?=
 =?utf-8?B?QWxObEVEQlpzWmI3NEcrOXVHYVpzdWdmb2dPZ2xLY05UVG1iWG02eUdaamFu?=
 =?utf-8?B?Vyt1cFRSTzk2ZnJnZkkveFJieUNOa2NpQmZpaGd4OTFBS2xoUkhoVy8yaWZa?=
 =?utf-8?B?VVRSd3BUN2F2dDNDcG94QUg5UlFXbWVYVnJTSHUwSmNJaGxhVkQ3UTZhWFlB?=
 =?utf-8?B?Nkw0eHFjVG1rYUhLQkdzUHI5SUtkcURKN1ZhL3pLdFhDb2hIREVBY3VDc0p1?=
 =?utf-8?B?VzZvZ0UzeEpKTmtIOWpHL2tnZU1TOWRzbVVxVFBxN1RpbGhDUERqcjIrNW5D?=
 =?utf-8?B?UVBkTk50dm5lNnVaSUV4VUYveWoyOFVaUHNDUGdmYlJUSjNBN09wcDMwdjlZ?=
 =?utf-8?B?ZFpySXk2SktpRkRvcGxTUUw4eFRuU0U3R3pPQ0xSTTNRQ1ppU1BzOUVwb3A1?=
 =?utf-8?B?MTdnWitMT3pVUHN1a0UycHpTOTNOVi90bTY2OFF5RmpXUndScWJ2TFlsUHcz?=
 =?utf-8?B?UGhzb0xJUDZlUm95U01zUTBobnZYWlQ0enB1eUp4OFh4OHM3NGh3TGZPNDJs?=
 =?utf-8?B?MXlEMnRHeFMwdWd4dm4ybDkxNVVRVUJDb29SbkZiNW9NenVQSGlzZ25EN2dl?=
 =?utf-8?B?SWlpYnZob2NNTFZ2UEYzaW1hN0dndisxeGdxLzg0b2txcUI3TWRkZFNobFAy?=
 =?utf-8?B?aVFjSzJBUHlWWnM2NHBEbUlhVTVJcTd6R25rRkdROXl1TTQzZVhKMXMvamZO?=
 =?utf-8?B?S3RzeWxxR1U4TVlrRGIya2tFSlB1U0RxNkRJZU81d2wxcnlPMkZsdW9oR1NG?=
 =?utf-8?B?Y0k5dCtGdHlLWDNoSEVsLzczTzVhcTlkQkVtbkVGUjJVUEE4RXZONUZJL2dT?=
 =?utf-8?B?SkJ2dUExNGFUOFhaQjIrbXF0cUY2eStJSVVTUHE4Sm12MHFudC9GTkJXQktp?=
 =?utf-8?B?NDU5VXVTQTd1cDFBTk1qOU5yT2xXTEttb1NCS1BaVDBvVUJQdEUyaVlxNzJP?=
 =?utf-8?B?Yk4zWUI0WmJ1a3YrZktRc1NxYzJQU0lsa2tHNXlveEVuNkgvc2ZmYVNKbXgx?=
 =?utf-8?B?eGtKd0h3UHZrVHFzSW9MVjlMSmtoUXYxc3Z6WTIwcktDY0doTkE0ZW9zMVFr?=
 =?utf-8?B?Rmk3eTdRdjRyc01IamFsSTFJSS80anE5aVdWdVZCM25xcjZWeXYzZHVkMUVZ?=
 =?utf-8?B?OVh0YWIzYmRQTVArUytxeVgzS3N0WGEwcnNnYzlRQlRaODViZDNDcUJXQWJp?=
 =?utf-8?B?dzN2Y3F3L0I3eTV5YjJMSzBhWVpBbGdyNGM3QXJuWElSekZmbTVXYVdHQXVF?=
 =?utf-8?B?R3hlSG12OXJKNnFqZEw4RHl6SzB6bGMrN2wxTEVrV1BPK2VvK1RQcitWNVlw?=
 =?utf-8?B?Zm9OcndHQTV3WkpMYWdZK3A0cGpjYW8wTkpJWXQzQjdQeitkb2gwb0pqU2M0?=
 =?utf-8?B?ZTNSNEQvb3I4SWw4QlVodS9lenBsVFBFdVpSOHY3SFdhN2w0dE5DNXpZK0tu?=
 =?utf-8?B?WHJrbktTTzBXU2JvNG9jRFlHOWswdEFBRk5KVExYdEpaaXVhNHplUDRwQURP?=
 =?utf-8?Q?T29vPma0WIVYs6i2ycM8E40=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <234546C95CEAAF43958013F3C247F0B6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da251639-d814-4f9a-f8a1-08da899be7f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 08:53:13.0874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hzREo7e5+Qf0h9GSY4cYC7P992ynITT1h1SrSSdpZ6UdrQvmRtC6wcel68XgBCiWJovaDHv1MuYbKIArGbggdpbUYstz+dI1MU5UsYLcfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3480
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDI6MDUsIEVsbGlvdHQsIFJvYmVydCAoU2VydmVycykgYSDD
qWNyaXTCoDoNCj4gDQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IFNlbnQ6
IFN1bmRheSwgQXVndXN0IDI4LCAyMDIyIDI6MzMgQU0NCj4+IFRvOiBFbGxpb3R0LCBSb2JlcnQg
KFNlcnZlcnMpIDxlbGxpb3R0QGhwZS5jb20+OyBOYXluYQ0KPj4gPG5heW5hQGxpbnV4LnZuZXQu
aWJtLmNvbT47IEFuZHJldyBEb25uZWxsYW4gPGFqZEBsaW51eC5pYm0uY29tPg0KPj4gQ2M6IGxp
bnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAw
LzEwXSBjcnlwdG86IEtjb25maWcgLSBzaW1wbGlmeSBtZW51cyBhbmQgaGVscA0KPj4gdGV4dA0K
Pj4NCj4+IEhpLA0KPj4NCj4+IExlIDI3LzA4LzIwMjIgw6AgMjI6MDYsIEVsbGlvdHQsIFJvYmVy
dCAoU2VydmVycykgYSDDqWNyaXTCoDoNCj4+PiAoYWRkaW5nIENocmlzdG9waGUsIHBlcg0KPj4+
IGJiYTQ5NjY1NmE3M2ZjMSAoInBvd2VycGMvMzI6IEZpeCBib290IGZhaWx1cmUgd2l0aCBHQ0Mg
bGF0ZW50IGVudHJvcHkNCj4+IHBsdWdpbiIpDQo+Pj4NCj4+Pg0KPj4+IEFkZGluZyBsaWJtcGMt
ZGV2ZWwgZ2V0cyBhbGwgdGhlIGFyY2hpdGVjdHVyZXMgYnVpbGRpbmcgZXhjZXB0IHBvd2VycGMu
DQo+Pj4NCj4+PiAoSSBhbHNvIGluc3RhbGxlZCBnY2MtcGx1Z2lucy1kZXZlbCB0byBnZXQgdGhl
IG5hdGl2ZSB4ODYNCj4+PiBidWlsZCB0byBkZXRlY3QgcGx1Z2lucy4pDQo+Pj4NCj4+PiBIb3dl
dmVyLCBwb3dlcnBjIHN0aWxsIGZhaWxzIHRvIGJ1aWxkLiBTZXZlcmFsIG9mIHRoZSBMaW51eCBz
dGFuZGFyZA0KPj4+IGluY2x1ZGUgZmlsZXMgZW5kIHVwIGluY2x1ZGluZyBub2RlbWFzay5oLCB3
aGljaCBpbmNsdWRlcyByYW5kb20uaCwNCj4+PiB3aGljaCBoYXMgYSBwcm9ibGVtIGZpbmRpbmcg
YSBnbG9iYWwgY2FsbGVkIGxhdGVudF9lbnRyb3B5IHdoaWxlDQo+Pj4gYnVpbGRpbmcgaW5pdC9t
YWluLm86DQo+Pg0KPj4gSXNuJ3QgaXQgZml4ZWQgaW4gbWFpbmxpbmUgYnkgY29tbWl0IDAxMmU4
ZDIwMzRmMSAoImdjYy1wbHVnaW5zOg0KPj4gVW5kZWZpbmUgTEFURU5UX0VOVFJPUFlfUExVR0lO
IHdoZW4gcGx1Z2luIGRpc2FibGVkIGZvciBhIGZpbGUiKSA/DQo+IA0KPiBZZXMsIGFkZGluZyB0
aGF0IHBhdGNoIGZpeGVzIHRoaXMgcGFydGljdWxhciBwcm9ibGVtLiBUaGFua3MhDQo+IA0KPiBO
ZXh0IHVwIGlzOg0KPiBDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gOTQ6IC50ZXh0LmZy
ZWVfaW5pdG1lbS4NCj4gaW5pdC9tYWluLm86IGZhaWxlZA0KPiBtYWtlWzJdOiAqKiogWy4uL3Nj
cmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ5OiBpbml0L21haW4ub10gRXJyb3IgMQ0KPiANCg0KQ2Fu
IHlvdSBwbGVhc2UgcHJvdmlkZSBzb21lIGNvbnRleHQsIHdoaWNoIC5jb25maWcsIHdoaWNoIHZl
cnNpb24gb2YgDQpnY2MvYmludXRpbHMgZXRjIC4uLi4NCg0KRldJVywgZnJlZV9pbml0bWVtKCkg
aXMgc3VwcG9zZWQgdG8gYmUgaW4gYXJjaC9wb3dlcnBjL21tL21lbS5v
