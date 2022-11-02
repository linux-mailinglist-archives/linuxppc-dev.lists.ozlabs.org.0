Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA3615FFD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 10:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2MLQ58G6z3cMm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 20:39:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=YurRLD5I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.47; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=YurRLD5I;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120047.outbound.protection.outlook.com [40.107.12.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2MKQ6MCtz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 20:39:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfUFIpnH4qj9rDDOfzFIvm0M0w1gTaKp7L6WIQmnbjvAR262A7oHw7YDNg3klSiyYSkD9+8o03xg5khMqpPbVsfH6EGJNpG5Orz8o695v8WIcySIIXviku3nIuKUHTVxLZte5H86/xYR3zT3OFbvqzUPxe9YWicFuzS0P0V4urh0v2skykkQJb3ixpzQcP3tnXQNyqXVQpY4Y5srzgOMPX8axm56QJtjq/YoZaAHHSWyiOcNQsu5PDZ4psUkurtaeUsDf2lhAcZAiCZf63HhLoqQLJ0UCsAmiYDtYEpwHYOPAllacWa8RlVeWpLJ1U2YkFt0oTRCvHLOqDb8QJolzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ylow2I5cxeJgjPzGlCyux0WNyME9SVkcnF8EgUH658c=;
 b=n9viXOHPI28u7lTUVf9797n8YTaXkbQ29wTzMq+jeaa4zRV4vTj7xqPNLClEC54vyZKQPMb9Oin6CAOG+El/lxdkG1ah+UPHW71pqdpNoIUoc9x6PI6hlV+2wdx6rKPkA7g0V0aa6BgaIH53IeCcsMb/fqotSTtwRdq7kmvLP3a8CUh4haAQO25vmYdhb3q9THC6eQnBtr8nSfTSge4K77X0GxSY9Jnl9TiHjdAtw1DU/3q2yUZiPyY6lSUpVghgKgnFe6viIfB15O/+8aQj/0dKNx2OfDmrbLZTLhl4tcSMYO+fElNmYlJo4OM7df3YhnH7CjxjsjGpYv/PTtExUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ylow2I5cxeJgjPzGlCyux0WNyME9SVkcnF8EgUH658c=;
 b=YurRLD5IQ3TnhJQFPHa4jKZcqLBQCKE4em+NQHzK5OePS+En677skdznSxXxU6KqNlRLv3xVizZ9z7u6PessAP+vRkDHLIEIAPXUcsan7XwEucek9trd5JcTJ03BeljhYptVVgTgyS15Bry4TcZiZkhrBZJQOUlvp4YlyhF/r/lKkZlhYALgrPJJK0xb5V1e3MjOO+oZggCpatY+pZabnnTf7gpTWZbJ1o6yeO54DZUmyVxZjRrrWZf6Bua8yhZV5GNCNctKSaXTM3ok/DtcRoOr3MVzdMG50jbWkwzdvwRLp6Jqam+pF73geJ55TFYyefehgH9GMP658MHi8skdIw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2968.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 09:38:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:38:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 3/7] powerpc/code-patching: Use WARN_ON and fix check
 in poking_init
Thread-Topic: [PATCH v9 3/7] powerpc/code-patching: Use WARN_ON and fix check
 in poking_init
Thread-Index: AQHY6Cx8Hk/07iT4JUaf2Gh0/ohwRa4rbXUA
Date: Wed, 2 Nov 2022 09:38:47 +0000
Message-ID: <90f075a3-54b3-b74e-385d-b9f40f055a3c@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-4-bgray@linux.ibm.com>
In-Reply-To: <20221025044409.448755-4-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2968:EE_
x-ms-office365-filtering-correlation-id: 73ef1ae4-508b-469b-e8c4-08dabcb60aa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ifjgbish6L0eH7jrrS1OelAWION439YYvi9lhiq96MCPAgww/w8lfWWQ208SH/yx/SPlY3otBgQ64FpaGJQrZlDWKOXqI/6IYD3bN4+elsJUbdOkG+XM1C97x7K3RPX8ASjaqrm3djvGUKm8qywlPMlSp3WqwZoGK7JLmKsBPxsRtGUCDkwLwUgeyiMgW+ldEbahshXj4ZwHzsNs/d7okb9cC8Ofddg/zW+YZbh86CP3IYRCJQnCQBsd2A/STYlalEqnRkau4PHlpUVFf40ZzfBMgprPbBqDGVkxUz9Qbc70KbsjzEWKF3+1Pl/o3rLUq8BkzRX5TEDD3aD2fmLKcCSM/ucwZ5500z6GY2kPsbsTNwZW9ahoJNR2OjgKzg13HcUkN/ZUcc8cj4wC56WKGX6iLDwBeraCNLrorBub9VXMb2wNRQPwsiNkElYml2hz1TnC0Ggk8/uUOuYRCrR0sKL2XNSHLE3bIC6O7S4uQxA/iyKTJzKVPEbouI+oJbjA9NLGfxEEoDs5CkSdeb0XA3RUIGbAWK7q9PiWGQjMJtPQxcW4Gqf7ZHj1RlpcwDkEbFD1ewx9ZZHtrc/1OWrh2sZpw3jQXyzT5NCcMbvMKX0vgQEujwTdaTFHVnVBYVPs1ksOmT0GeK0wOOdVu1bA/5PZSs4AjLrGI2P86OCqVKCQIRwtEf18Q26wATprwLcKWNALMt+JK5OMhZ3b5UaH2JRpSMlGNkpAnRAPT6oiUe4FiK5me9PMLZFpktBgBTyaUfTBWe9EAGcmoNtEAI6MkRochflUYjup31oTL4KL2gSMKCZRJpezoJingXVJKOxETNaLPd36BQqd2kPujAL8nw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(451199015)(54906003)(110136005)(478600001)(44832011)(66946007)(6506007)(76116006)(2616005)(64756008)(66476007)(66556008)(71200400001)(91956017)(6486002)(26005)(6512007)(2906002)(41300700001)(66574015)(4326008)(186003)(5660300002)(8936002)(83380400001)(66446008)(31696002)(86362001)(38070700005)(31686004)(38100700002)(316002)(8676002)(36756003)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZWVyaG5ZWFJ2WFVnZzFPOVN2b3VtV1pVWGdldkNDOHBCNm1mRGFZZmtYclhN?=
 =?utf-8?B?UVQ5RDQ2ajZ2RVZmWThhTGo4Q1lLa01wSTRPc0RmY3V2ajFLV0Jwa01kNnZy?=
 =?utf-8?B?QisvV09aVzN4Q29UTHVOWlVNa1NwZi9tMndjYkhWeWE3YUJZbmE0bnVlbjNC?=
 =?utf-8?B?d09LaTdDYzFXN0FHam9Zd2sxK0Rra1VBaDA4ckMvRERRRHJkOWhpb2d4WG5v?=
 =?utf-8?B?RmlVT0dqZ0xSVTBMRytTZzBMQ3lwZTh5NllZeTZ0VUlodmlrSUNpdTB0SGpO?=
 =?utf-8?B?RytKdFRxbkFHbEJWWm5YenZuSHZIcFhkbVlCRDlCUDVQMk1lZjJJMjR2cDBT?=
 =?utf-8?B?dW50dDIxc2Y4UUpuTHJ4TVMrNFk3blJXdjQ4TVFoeW1tYTdCSWRNQ1RyUUVi?=
 =?utf-8?B?S3hxZUgrbkJneFFhMWtTd2REc0hqZk04d1dCSWg4QUY3K3gvdk5SeWlSZjdQ?=
 =?utf-8?B?LzN1MDZYQk9YSXQxYjJyclY2cG9mOFhGWk04cVRUbDJ3bERBdWJxODZPRTYw?=
 =?utf-8?B?bVhuUTlUalowT2lzWDRyNDNLdWRlM2lmUC91Mzk4M3RUZDNRWm5ZWjVCOUVJ?=
 =?utf-8?B?dVhxaGFyc1FUdFlhcTRzL3JyTEZYWUFZREZaY0pJb1o4VmF5VjRpTXpxRlJ1?=
 =?utf-8?B?VmtxTXpCRGV2TitQdklSeGxoQ01JeS9ERVViaE9lQjEzZy9tS1FYeTFMSW42?=
 =?utf-8?B?TjdaMXQxNXJwc3FuYkdGb2hCUUNsQWt0dWFXcmp0QldmcTcwRCtSNzR0d0RI?=
 =?utf-8?B?a0hDN0w0d042OW9uVThVMkYyNi9hVUQ3NjIyanRjaE5wRkdqbHdVSDl3RU9a?=
 =?utf-8?B?TUd0QXpHei9yQmcyZk5uMU9Fd05wNldwdmFnYXQzZWdUYjd2ZmM2T2dOdVE3?=
 =?utf-8?B?V2dOOElLcFlxQ3dzdFhtdjFUL2lZK2h3N2NpelhSYUg2QlIvVFhuaTcwRXEy?=
 =?utf-8?B?dDRxTlo0bkJQd1U5cFhnenpMZXJqc29kK2FqbzlUM2lLMy9LQzFkamlPUXJn?=
 =?utf-8?B?WjZUQll6bXdxVFFHdUFjOXlkNTFMb1hYMTY2Q2FJclo1SjZtMVBhZ1JwSC9n?=
 =?utf-8?B?TmF5K3ZrcTZyMkxIRjRyMkdja0hwblk4dUptcXpldXMzR2pFak1EcEJBQkR1?=
 =?utf-8?B?RnVPbmRLSk5ybFhOS1FDbVUySEJVbDNndnEza1RBdll6T3RYV3Baa2RCaktx?=
 =?utf-8?B?alE0K1ZBcXZFaU1qb3pQTnM0eUlmWVNhU0ZTZW1uclZpYWZyVVlhS0tlbXRJ?=
 =?utf-8?B?QWV6dXYrdEVkYmF4cXU4TkJ0TXdPL3FOT3NwSEtkNmh0ZVJObnBJOWRSVGNw?=
 =?utf-8?B?OWdZNHVuTDhTZGdmUWNVZW5GVWVnSzMyMjN3dnVOejcxSVpoYklDUjlHZ0tX?=
 =?utf-8?B?eGNHMkhZZENnRE1XUnBoaE93UmVoeW1IR1A5L0pjMFJYaDVhUlR2dXR6WjhW?=
 =?utf-8?B?SWV3OEJrdTRBUjhVUmpvd1BYeUZxOUkxbzNNUUZSYy81am4wSlNmM0dhNDA5?=
 =?utf-8?B?VGl2blhIYmd5Z1UvZElHamlsY1BvYUpWNjBwUXVycnZsUk10OTg1enhwOHlN?=
 =?utf-8?B?c3NQSE9MdlRGWWNUTnlDdmlIV1lFR0pYdnRjVFIzMkRlV0NPdThocVJmVDR3?=
 =?utf-8?B?bUgrVTgwQWNZR1VBM3lDSHhLbDI2VWlTbHAvV0ZDTXc2ZkI1KzRybmc5L3dN?=
 =?utf-8?B?NThibWtWazN3UVhMa0YwZGN2dHJXcndMZHhrVXlWQW82YXVKZHpXeFk5dXBk?=
 =?utf-8?B?cWlGdCt1VGZFMHdDVkt5WmVsSzdBQTNESndYdWI2MkRZZ3Q0aE8xOStBZjJV?=
 =?utf-8?B?VThtcjJ4N2lTOTdYekwzbndyQTBLSWZFcnNXK25pWG1kQ0lCcXlHZHd6L0Ey?=
 =?utf-8?B?NWZPTXhvSks4cEpRRUkyQldhOWZwdEpEUU4xSEl0VkJNdVFteDhVZTFaWE9T?=
 =?utf-8?B?dTZQS2Q2QkhRdXo2MTB5ZXlaZnNLajUyMSt0MlVtd0JvYktPOGtwWHRjaDhi?=
 =?utf-8?B?U3FUU3ZzRi9kbVVTenJFT0I3Yk1YMmRZZm5NaDRFZ3ZzVlA2a2NIR2tkc1Fw?=
 =?utf-8?B?ZUR3SnhNQkJheE9BajQxdzJjd1Biclg2ODZqa1oyY3E1ZnhWcDk5RXJlcTVm?=
 =?utf-8?B?QzV2RXZjYjZsMU1sam9aT1Qrbk1QSVJhSnRKVDhoR3ZFTG1QY2NEYnVVaCsz?=
 =?utf-8?Q?CbLXFOq5KWftp6X5GsQQblA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0154171C2131C249A0A3E85E3F1ACF40@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ef1ae4-508b-469b-e8c4-08dabcb60aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:38:47.4683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2WwWYlGF+lcc6Nx7FBtJzakKEI70VlitcDDaTlU2/I1ssQC80s9EWSMALKSzDvuJIyp4tNCQgX5WWIjMz6pY+QBI0zl2gowfASisE7/0nkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2968
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
QlVHX09OKCkgd2hlbiBmYWlsaW5nIHRvIGluaXRpYWxpc2UgdGhlIGNvZGUgcGF0Y2hpbmcgd2lu
ZG93IGlzDQo+IGV4Y2Vzc2l2ZSwgYXMgbW9zdCBjcml0aWNhbCBwYXRjaGluZyBoYXBwZW5zIGR1
cmluZyBib290IGJlZm9yZSBzdHJpY3QNCj4gUldYIGNvbnRyb2wgaXMgZW5hYmxlZC4gRmFpbHVy
ZSB0byBwYXRjaCBhZnRlciBib290IGlzIG5vdCBpbmhlcmVudGx5DQo+IGZhdGFsLCBzbyBhYm9y
dGluZyB0aGUga2VybmVsIGlzIGJldHRlciBkZXRlcm1pbmVkIGJ5IHRoZSBjYWxsZXIuDQo+IA0K
PiBUaGUgcmV0dXJuIHZhbHVlIG9mIGNwdWhwX3NldHVwX3N0YXRlKCkgaXMgYWxzbyA+PSAwIG9u
IHN1Y2Nlc3MsDQo+IHNvIGNoZWNrIGZvciA8IDAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5q
YW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0KPiBSZXZpZXdlZC1ieTogUnVzc2VsbCBD
dXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPg0KPiAtLS0NCj4gdjk6CSogUmV3b3JkIGNvbW1pdCBt
ZXNzYWdlIHRvIGV4cGxhaW4gd2h5IGluaXQgZmFpbHVyZSBpcyBub3QgZmF0YWwNCj4gLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgfCAxMyArKysrKy0tLS0tLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyBiL2FyY2gvcG93
ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IGluZGV4IDU0ZTE0NTI0NzY0My4uM2IzYjA5ZDVk
MmUxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiBAQCAtODIsMTYgKzgyLDEz
IEBAIHN0YXRpYyBpbnQgdGV4dF9hcmVhX2NwdV9kb3duKHVuc2lnbmVkIGludCBjcHUpDQo+ICAg
DQo+ICAgc3RhdGljIF9fcm9fYWZ0ZXJfaW5pdCBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShwb2tp
bmdfaW5pdF9kb25lKTsNCj4gICANCj4gLS8qDQo+IC0gKiBBbHRob3VnaCBCVUdfT04oKSBpcyBy
dWRlLCBpbiB0aGlzIGNhc2UgaXQgc2hvdWxkIG9ubHkgaGFwcGVuIGlmIEVOT01FTSwgYW5kDQo+
IC0gKiB3ZSBqdWRnZSBpdCBhcyBiZWluZyBwcmVmZXJhYmxlIHRvIGEga2VybmVsIHRoYXQgd2ls
bCBjcmFzaCBsYXRlciB3aGVuDQo+IC0gKiBzb21lb25lIHRyaWVzIHRvIHVzZSBwYXRjaF9pbnN0
cnVjdGlvbigpLg0KPiAtICovDQo+ICAgdm9pZCBfX2luaXQgcG9raW5nX2luaXQodm9pZCkNCj4g
ICB7DQo+IC0JQlVHX09OKCFjcHVocF9zZXR1cF9zdGF0ZShDUFVIUF9BUF9PTkxJTkVfRFlOLA0K
PiAtCQkicG93ZXJwYy90ZXh0X3Bva2U6b25saW5lIiwgdGV4dF9hcmVhX2NwdV91cCwNCj4gLQkJ
dGV4dF9hcmVhX2NwdV9kb3duKSk7DQo+ICsJV0FSTl9PTihjcHVocF9zZXR1cF9zdGF0ZShDUFVI
UF9BUF9PTkxJTkVfRFlOLA0KPiArCQkJCSAgInBvd2VycGMvdGV4dF9wb2tlOm9ubGluZSIsDQo+
ICsJCQkJICB0ZXh0X2FyZWFfY3B1X3VwLA0KPiArCQkJCSAgdGV4dF9hcmVhX2NwdV9kb3duKSA8
IDApOw0KPiArDQo+ICAgCXN0YXRpY19icmFuY2hfZW5hYmxlKCZwb2tpbmdfaW5pdF9kb25lKTsN
Cg0KV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG5vdCBlbmFibGUgdGhlIHBva2luZ19pbml0X2Rv
bmUgYnJhbmNoIGlmIHRoZSANCmFsbG9jYXRpb24gZmFpbGVkID8NCg0KPiAgIH0NCj4gICA=
