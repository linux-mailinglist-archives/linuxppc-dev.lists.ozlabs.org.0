Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B53DB7446F6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 08:33:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=enHroL7T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QtMnl4SPnz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 16:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=enHroL7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QtMms2883z300n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 16:32:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnoYAUwHzmVuvSpwcOTPeP2fkyyuWCbmFjmGwNVDilsXePZZrcG0LsMEEKqw7XKaV/PnPMwfvti/hAe6u63iJYOFVxQC4AVhEqEAhS1B4LSBfzmix15ds4A6kPN3ISiVPUwgufT1DtUxi4XXgdK0RrVCMPit/CXxDHzqLF0eME3wCoC5+2/CRMzenxSlvw7P519nINJ6ToBxsUIIhNRtEbwmnAv24P+kK9ij15Ld62P/iW7Q/wwFE2wV3vZKaK6LenU3dXBzyvsJnlBgW8Qg6p6h6f7qtQeZHOoDCQafn9d9DkC1Na4F3dJ8C+NZ0rZKV1azuNsuklIaIWkxsa0CPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi0r1wXFfE1BM/7VbtbnAdgOjpvKUbvM96khf+LgheM=;
 b=bOFK8JIn6zL72Dk+tO3q9q7vr9HxLmAcO9ogJ6Ey5mTeTYlv/37JMb0o9hEM98WkrvHwQ0lHdIc6wQCGhYx6pQ7tpsqSSDOpqQ5CyAN++o5L/UDFskWzPyO8ZSZwvAu86Yh8ZK6F7ur06zUyqFkAnfcheSBT4BHtAXKz9P6gu5b/hn8fg2HIfUwOrkR7M8/Oeewc8CvR08eK3kvNxo76rDZLjWRgLNHCDhZerKiue2DYJv0vPorE+b6OtkulRhpm5kdsxqWeambC9lkEoYmn2EHuMls1PlXasgjLyJHjaezHIbFcNVEni7TwYmopLzpcAQU3J9OaxzvgI17N3m5OaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi0r1wXFfE1BM/7VbtbnAdgOjpvKUbvM96khf+LgheM=;
 b=enHroL7TCPDmGrfaXQQD1K7OjuKv4sYGAYNQXLSIp72jly12LOl8nSBc7JK5RQcnX5ez596Mu2jM1g9VmQqRjp0MRpl7Six4dEUIu6n8kSy3lWSKhI2u+tvrhTI2QYSuFOzo75CF7Gvrd6bW0Ki1k3ywadl20xVuF8McrVae9nA/9hEL9R86jjtTmJZXEwrgtUOSKbKCN1mS+tecThdA2otyQr3vKvRwYg2AA7+CWy0Qe5JXf9JfglDbt1XCm3snq47ZRNW6rLMgrYOG/xZt09asUULPkiqOYt6l2Rb9I4Hdhm//xzTHnhiArqub2KMZ5gUyNrr62yrgROTr78V+bw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3339.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:145::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Sat, 1 Jul
 2023 06:32:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6544.024; Sat, 1 Jul 2023
 06:32:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc: allow PPC_EARLY_DEBUG_CPM only when
 SERIAL_CPM=y
Thread-Topic: [PATCH v2] powerpc: allow PPC_EARLY_DEBUG_CPM only when
 SERIAL_CPM=y
Thread-Index: AQHZq9+BfEgYCx9rHk6MHtdYh8X8q6+kc8cA
Date: Sat, 1 Jul 2023 06:32:10 +0000
Message-ID: <2deffb78-1271-9688-93b5-4d534a00090f@csgroup.eu>
References: <20230701054714.30512-1-rdunlap@infradead.org>
In-Reply-To: <20230701054714.30512-1-rdunlap@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3339:EE_
x-ms-office365-filtering-correlation-id: fb395294-271a-4ed0-7f85-08db79fce659
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JZrzFReJn4xNXTZRcF4rES+6gxP9hknKXSOscNxfMOWjqqxbEmM0WFTnJa1z5Qo8p1ZRHfTbKvYErDweHi09O5BSLeehnh3sKAarohRv8TUd1l7pc+30qoZlrIXSD3yEnvcIenzzHVDNiAfdDBbZl7vneZiI6clNahGEVY9z+1DoeOgikR3RF8hyttB3jQHNXq6JtZEOa8P5VrcBgF1EhUXDJC/eQc0bGy5amUWmurWS6xDjfjVki5JbOn5ssNQx8SNDSqOosKPGtWG1LqPtsgbC10nq8818033i/4j/E/+N0u3Jn/TDufbnCsh3PAaBrMb7TKbymx73GF1kaHLDMwe2KSZ/Ef0fUpY9jRlaiWdhM1Qai1s/k1PejuMEnwni8NMTIwvqfvx8yPDGFKp9mpFL//EgIoT1Q661ynWJvb5PFmLYv4AmQ3DzSzTdw4eSbXFwYERqKC4k7d97TnM3cEHBxD/A7TrhPeYtF+F/RD/KcRJLbwd9j2Vc0RuJ8FObi8Wq8xgBn6wcgwSEpK8fyfNR1qcfvOI+3eqpkc8c/HHx7y66lC8cLSWReVGKs8iavGFyUrLjZAWcWpgbAUzb3CPoldeIvePpnWRTFKfiobMBNrdrkf5fylhp2z7LfbXIL3j2DS4FkCe2M8173iFidhuEvsf4vZMqdpE5axLFAWP0lQyjtoUfKnU0pvvNSUHk
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(39850400004)(346002)(451199021)(110136005)(54906003)(2906002)(478600001)(26005)(41300700001)(6486002)(86362001)(8676002)(8936002)(31686004)(31696002)(5660300002)(71200400001)(36756003)(44832011)(316002)(66556008)(66476007)(66446008)(64756008)(66946007)(122000001)(38100700002)(4326008)(38070700005)(6506007)(91956017)(76116006)(2616005)(6512007)(186003)(66574015)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aU91emJtY1FWNkV3N1FIWWVTelVua0pWQmkxM3o4KzZzYXFxL0dPaWc1Slpw?=
 =?utf-8?B?ZERuZG1OOGlFei80NnYyRG1IOFEzYVFXL25GWkVIdVlXUlFqTmtFa3R6NC9J?=
 =?utf-8?B?QVR6UnpiQytMSVl3Y3JVZStTTU5SWHg5c1JhKytTK2VDTW9MWjdWU0M1a0Fw?=
 =?utf-8?B?ZGpXUkplNHpXbzBvVnBmZDhzczFOSjRzMjBwNlM4QVh1UFg5ZE9QR2l0WmRF?=
 =?utf-8?B?Y2NPZll2bmROZHdpL2hYaTd2WkllT1lOWm9xTm5kQkRmMlRUY1YzbVQyOGVv?=
 =?utf-8?B?dG1jbkxuaVdTVG93ZkZZLzRJSnBZUHJPM3VZemJlakc5a0p6akxtclJ0NTVq?=
 =?utf-8?B?NUtLWmlNTU4zQmxSZ1RaUkpOVHRCd2tWYmxMUGxsNzM2b3EwMTdRc2R6bHZh?=
 =?utf-8?B?RjFSeVJ6amJ0NlVQZ0QzSHc0QXhhVE1IUzM4dUR0MmdLR0daeVdlZ2tBbW9T?=
 =?utf-8?B?SGw4cUZURUQyTnh4WWh5NVpKQ01jNkJqRTJXUlc1RnlPalFicHdKZzg3ZHd4?=
 =?utf-8?B?SWdaNzYvS08zejJYSkJCTEM2Q1NpRGNmOS9iaTlTV05Qajd4UU9QaUR6YjFL?=
 =?utf-8?B?V1p4NU8wVHFGemhidFk3RTFHWksxNFRDNFRUWGQ4MmFMNTVJaXpkN0hDOFEy?=
 =?utf-8?B?OTZCbXNjbi9adFJ0Z2dIZmhKaG9oVEsxODluZlA4R1o5WDJLaGpDTCt2WkU0?=
 =?utf-8?B?cEtqbXZPZ2pSQzlwcXFRVno0SzNORWlwNXpLWDRhRVJMY1lHZnZQc2EwUVVU?=
 =?utf-8?B?UGRSc1V1UmxrQ0pZQ0d0Y3pZY2xNOTZjOEZCVlBaM0J1UUZMUEN3ak1PYkV2?=
 =?utf-8?B?Z0o2WUhhU1JEdHdGcGNETndtZU5MUG5vVTZPY1F2T0tONURocEorNUhDV3pp?=
 =?utf-8?B?SnVDM1ZuMDNtK1F5WDk5b3RSR2wwOC9GdHRQQ0pNdHJpZGUvZE5LZzZRQXdL?=
 =?utf-8?B?UGovRHpqUWpBV1d3ZkRqdTJmUm5qWklCa09mcWpNMWpET1VQblhOTGZ1VFBJ?=
 =?utf-8?B?dndLRmlmWHRsQkdiR3hFY0JHVmRrdCtCNHdxc29HZkxjZVJTR2tna0xuWEVu?=
 =?utf-8?B?M3RhVzFub3p5WkNTL21zcUI2WTQwVTc2a0M1b1BDa3l2VnVydkIzQktrN0Iy?=
 =?utf-8?B?Nlh4YmphelltSDBJcHZlYTVWelgzM0t6RFU1b2lKTEZDcG1qMlNXU04wbzhE?=
 =?utf-8?B?YzdnUzRZT0FlRXJZemlIOTVpTDBMTFZWS2ZCYndGQlhxczdNWFh4aGRhZVRw?=
 =?utf-8?B?ZFR3VFhEMDVMbGxLYXNkVGplM08vVG14d3BlVVFmL2ZUVzlWMnpqd0NTWEw1?=
 =?utf-8?B?UDBiWG01UkMwc0hYYkg2NHVhT1JJa0ZSMXVFN0QzSTE1Sm5YM05VSFVvY3o0?=
 =?utf-8?B?SXNkQ1piMGUveWVzWW5MZ0p2dnJGL0hGTlRhSFlUdWtSMEh5M2hCMXMwbGRS?=
 =?utf-8?B?UlprTjE1RVhyRHZzbytISEg4aHc0WTYzYTVvb0hvVFlqaHdQeVVWbHh5bzRF?=
 =?utf-8?B?eXd4Tko1MjBXNGxGcFdYejcwdUYzU204ajlEeXVsRjEwQzhreis2VUthUmxY?=
 =?utf-8?B?cHpHdmxEVWtSYmVSWXN1c0lwVnU5ZFFITm0yVHJvdFVTNlFhQjR1L3krSGxj?=
 =?utf-8?B?U01tOStHWmFJdjF5NjJvMmVXTTNtL3BMRUNkdTFhVytYaURaczlhK0R0ZFVa?=
 =?utf-8?B?S2w3cE5uMFpPSXdRZ1owRnVYUFpDN0RzL1pvM1B4SXlDMmtsc0l6RzhNVVNq?=
 =?utf-8?B?dTBhdXZ6S0gyOGVKcWt0eFlQejlFRlNjRGRCQXpINFowb2llSExMQ3R1T0Rq?=
 =?utf-8?B?UDhPa0tqSno2TTRrd1BvNitaY0puR0lpVUdnNU4wOE9Pbys0eXh2TGtkcUNL?=
 =?utf-8?B?eTlmUGE1MEUwSGtKdkRWREI3WVFjY2NraERMUjRvNzNRcldZREJsanN4enZU?=
 =?utf-8?B?SzFkWG1xeHcza1dYdCs3L1Vxa1BkUDZIbVQ4WG1uWjY0c080UEdRUzdjSC9J?=
 =?utf-8?B?MWdza1ZGVktOMWhNZlhiZERjTTNMdnVoWWptQWJ1RWpOOVU0RXFJcXFEYkhy?=
 =?utf-8?B?cWs0ZXlXbEl5dlhuYW9MYmU1eFk2NEdaeVJidXdrb0lKcERKcnppWlF0OElF?=
 =?utf-8?Q?KdGHeqTuaVN0LXl8j48qzvt6+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C2C2F352160384DA74D574BDF235343@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fb395294-271a-4ed0-7f85-08db79fce659
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2023 06:32:10.5914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4mkJ8IBH0yg5ho7j2x3TBKTHku1k6bB8qUyVBH+q7O/7gPDQtSOAWpndFpcb2YX5gl/A2OZM7d9INmkPzEw2S+yYR1LWm6Mrn0NL+JXwwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3339
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA3LzIwMjMgw6AgMDc6NDcsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBJ
biBhIHJhbmRjb25maWcgd2l0aCBDT05GSUdfU0VSSUFMX0NQTT1tIGFuZA0KPiBDT05GSUdfUFBD
X0VBUkxZX0RFQlVHX0NQTT15LCB0aGVyZSBpcyBhIGJ1aWxkIGVycm9yOg0KPiBFUlJPUjogbW9k
cG9zdDogInVkYmdfcHV0YyIgW2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydC5r
b10gdW5kZWZpbmVkIQ0KPiANCj4gUHJldmVudCB0aGUgYnVpbGQgZXJyb3IgYnkgYWxsb3dpbmcg
UFBDX0VBUkxZX0RFQlVHX0NQTSBvbmx5IHdoZW4NCj4gU0VSSUFMX0NQTT15Lg0KPiANCj4gRml4
ZXM6IGMzNzRlMDBlMTdmMSAoIltQT1dFUlBDXSBBZGQgZWFybHkgZGVidWcgY29uc29sZSBmb3Ig
Q1BNIHNlcmlhbCBwb3J0cy4iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4NCj4gQ2M6IEt1bWFyIEdhbGEgPGdhbGFrQGtlcm5lbC5jcmFzaGlu
Zy5vcmc+DQo+IENjOiAiUGFsaSBSb2jDoXIiIDxwYWxpQGtlcm5lbC5vcmc+DQo+IENjOiBNaWNo
YWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IENjOiBOaWNob2xhcyBQaWdnaW4g
PG5waWdnaW5AZ21haWwuY29tPg0KPiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4g
UmV2aWV3ZWQtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0t
DQo+IHYyOiBhZGQgUGFsaSdzIFItYjsNCj4gICAgICBkcm9wIFNjb3R0IFdvb2QgZnJvbSBDYzog
bGlzdA0KPiANCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1ZyB8ICAgIDIgKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1ZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnLmRl
YnVnDQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnLmRlYnVnDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9LY29uZmlnLmRlYnVnDQo+IEBAIC0yNDAsNyArMjQwLDcgQEAgY29uZmlnIFBQQ19FQVJM
WV9ERUJVR180MHgNCj4gICANCj4gICBjb25maWcgUFBDX0VBUkxZX0RFQlVHX0NQTQ0KPiAgIAli
b29sICJFYXJseSBzZXJpYWwgZGVidWdnaW5nIGZvciBGcmVlc2NhbGUgQ1BNLWJhc2VkIHNlcmlh
bCBwb3J0cyINCj4gLQlkZXBlbmRzIG9uIFNFUklBTF9DUE0NCj4gKwlkZXBlbmRzIG9uIFNFUklB
TF9DUE09eQ0KPiAgIAloZWxwDQo+ICAgCSAgU2VsZWN0IHRoaXMgdG8gZW5hYmxlIGVhcmx5IGRl
YnVnZ2luZyBmb3IgRnJlZXNjYWxlIGNoaXBzDQo+ICAgCSAgdXNpbmcgYSBDUE0tYmFzZWQgc2Vy
aWFsIHBvcnQuICBUaGlzIGFzc3VtZXMgdGhhdCB0aGUgYm9vdHdyYXBwZXINCg==
