Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 941DA805154
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 11:55:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=je1aAyvm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sky9v0WZMz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 21:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=je1aAyvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sky3V1qqNz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 21:49:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feinGU5h3PWWyz2PbjBcn825bdXrL0WdSujr3n1BhouvLWN/i3MPkqq+vHor2tP/1NMlvw0TwQKnAOucAOJscJkGfopnYHZnWWXu/65/aUaMrewBh3Np/31R9wuYZvIfsXiP+T6ZJp9gRbSZcorvTftD7+qpsSohkDzWHcuhKi+LaQOlRnbQBdfOW+/3Eu68jU5AA1O4aK3QQhcMqPPCY6EFr3EbticK9LbTDNBo2zBmuC7pPwfFVkotgwGLhsJuMK+o6Cy6YErs9y3k267MH0784iMuwfX06mtyXisOGT1X0OnDPKRdHUUtXDgCXkWvAkhs6hEdSnM+av85XOka6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCB6I8XK6pO9mX4a+oXa8Upzq00pK9aaaTMJpchytGs=;
 b=Hsc794F2Bk05CJ43CKfRlJ4gx7jBjCZKo6ixJhlhX2Ukft7dTgDJaovWXRKvXnNyU+RJcDF7WOhQwwgL9+WEYlhbtiYSnqx4Rlwe/C9e7AY/21Bca+KyLyspEgx/drTjT6xPjC/ccDuNhCrLGLKN5/dXPBhp35/yJhEQu0tp/LMLKT7ADNluTXFnGXfU0WDbQT6Wh1yKOSJIb0Vd0xhjOMrQewJucVQNSWaz9oRMo9hk/Me4HD/YnUNf9FSRgounWuWawVHg+OuTosSs+TJlEkEuNN51gv2s0HZMzwHzg/khC3QLTlaIQ8Sbjd6osBdWdpsH2ws33ZWA6/ykxbu8VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCB6I8XK6pO9mX4a+oXa8Upzq00pK9aaaTMJpchytGs=;
 b=je1aAyvmV5Js2o4kM6mf0AtITbpxc4sxzLYj+SPmyS82lRBSPp/xVpiAo7zsbnf8OC0EvxcBi7FgUCLENNITPKwizuMq4oLfqTyIqGbZh8TqhlSzHGxWBEQnK0kQkkab64gm+jbtg2FcGfL6L6SwEU+bVGBhgBds1h1biS2a7vl9JpCpgW68FdWgdD0evbsOQHCRTrJUUPQ3H35mAwX9rKp0CuLCpd1OaZ5KagODq+kWkAMnXITPH7tExTPWsXjePW14LwxRyJJCsdPXlYTjuPAQ7PPVkfG3ATV+6fArS99HNonamFbMRHApWkU5yf+9JEP88UbGKGcO81W/Z1tmpA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3382.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:117::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.24; Tue, 5 Dec
 2023 10:49:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Tue, 5 Dec 2023
 10:49:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] MAINTAINERS: powerpc: Transfer PPC83XX to Christophe
Thread-Topic: [PATCH] MAINTAINERS: powerpc: Transfer PPC83XX to Christophe
Thread-Index: AQHaJzmwpGbOOYk/v0m/w7YDPpNjLrCagwQA
Date: Tue, 5 Dec 2023 10:49:35 +0000
Message-ID: <6241ba17-e1a5-418f-b16c-904a28b1e762@csgroup.eu>
References: <20231205051239.737384-1-mpe@ellerman.id.au>
In-Reply-To: <20231205051239.737384-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3382:EE_
x-ms-office365-filtering-correlation-id: 641b02e4-2449-4108-acff-08dbf57fdf60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mpi2CQAlNNkJdRztgNcZ+rBLEbs71ppUL30v9IEhbEZRj8gl6EUSPsNlZxj531o73JIAXC9JV+i8Ffck4E7aScQSTwwHQAgj9lhfJkPtiLMAoETwztRz3+5/UOayILxw0IU06L0xOoxvRKhmXQrYh3A1RnR+LsFKqrphewbQSBCbj9OEwHr3TM/9W3ocAc8SEAnA1Azm3Zy+P6BxOK7wyZIIVsIb72YD5GVVW1uPX/bLuEcGwUKDQes8cyBQvQpesNhoSswZpBQkExK/MzZdIXG1u0LnWyCLMl1h7oW2WvOkp8nyx+vx0iPdDwkdbS8a8gG1bf8Vd0nrIDEHXLmcl4c7BGw/bym8mtb4z5yZs06dfFNJGk9FB3CFikVFCS6Ia3Sl+hMuGDLsjZbcsAGukOBk8mhTD9KGBYt6QaCQ6FQly2ec4G8qJ1B4ioROSpgXbeClUn8w/uZkQc8o0QxVc3qMc1AElrLNGDL5e9SABD1kKfH8/EpXjd9YV3JwxdqJ/VaztPBhzxjIai9j0E22YwOqmehS7e64HKeu2bK2o5lqKHaS4bGR2E1fDlKtA5OcKQL1VH/zfM7/W3+Yz96l3bdqpDl+EJTygL6Qw7geNhjgOW1J8DJbzqb+h55XbtFfL5IW8fxI1OjhhX3ckIW5v1YtQHTHCW1e71+0Wicv7VE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(86362001)(38070700009)(5660300002)(83380400001)(122000001)(31686004)(38100700002)(31696002)(36756003)(6506007)(71200400001)(966005)(44832011)(6512007)(2616005)(26005)(8676002)(8936002)(4326008)(41300700001)(478600001)(6486002)(66946007)(316002)(54906003)(110136005)(76116006)(66476007)(66556008)(64756008)(66446008)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QS9veDQvVkgyVkI1cjlGZExzQzMxVWdMVmt2WUh4ZlYwUjNZdDE1Y0ZlZ1RX?=
 =?utf-8?B?cXgyZGpMVXJGemJWbnIxcUhuRllaaGR0RWE3aWZIZDkxVVp5MFBQVUtWTldP?=
 =?utf-8?B?WEd0NlJTeTA3bUV1djIyTTVyZkV4alF0YkV6RGRYL0Z4eUt0MmlWbm5OT25m?=
 =?utf-8?B?a21zbzcvdHBoUERWOXIrUlVMK1p2ZGpaN2FPQ1ZyRkxOdTQxVURvZHBaUDFN?=
 =?utf-8?B?RXhGNXlMUEUvQTRzZ0Ivc0pSei9PR3VGUFNMUUpXSDUxRU9GRVFudHdYZmlz?=
 =?utf-8?B?Zkhwb1VrdGc5RSthWlR3T0NyQkVXVGdQUjRzbW1lblk3YXRMMkJNNDNpSllH?=
 =?utf-8?B?cU5XNGdTdVgwZytQZkU4M2hJMlR5UERaOTk2bmwrS2ZGTno5Sm9OaHo0N2Rv?=
 =?utf-8?B?U1lpYkl6MVVKN0gxb2M2ajU0eFRkQ2JETGxxeHJJSldLZkhENDhTVGhLWSsv?=
 =?utf-8?B?bkRLVHAwVGNhd2JFcVlZeXovZTZMUUptdXRjQnA5cEsvWUJBZVczMVJnaW1m?=
 =?utf-8?B?a1A1R0JxamtpVHF3RzRVQmFWczBkQXF2Y1F6YUQyWk9OTEgxZWtvd0tTVEpk?=
 =?utf-8?B?Sk4zSm4wOWxqSlF2QzZSOFdwdFQ2ZmRxdGhHeXJTVTQ0Q1ZTK0N2d3JCUnB4?=
 =?utf-8?B?OVNXZHkzMzZ6aXRNc0Vlc1pOeGMyT0RsNm92QzRqRFAveVovZWt2a0FkMFNQ?=
 =?utf-8?B?azl6NjE1QVdLTXduRWk5ZEFNRWd3bTEwa1FKSER4Wm9wNjVmRmQ5aU5VRDRr?=
 =?utf-8?B?bnkxbktxbGNxazRyckM2R3hIbjBYbmhNVlUzdjluOTU2RjMwdkMyN0g3YVEy?=
 =?utf-8?B?N3JTQjFDNFh6bDEyNmcycUVvZThZbHkyS21TMWZkYjkwSXBjUlc3RSszdDhX?=
 =?utf-8?B?VkRUMzhKMDZSa0tBa0R2cUQ2L1h4NnBvT2daSjBRd3BRVWJ5MHpvbzRSTWV4?=
 =?utf-8?B?NitmcEEzQmRhNElUNURHNGt2R0NjNkN2U05BRi9nNW9NRzhvSDJoOC9tNURG?=
 =?utf-8?B?NjRDL3hET0paZTdVa1JIVks1WWs1aU5xNGtWRHFVc09IcjdlMW9uTVdDZGM4?=
 =?utf-8?B?TlBVNms3Tk4zYkFFMHVBaWJnLzZOUGo5bkRsaVFJSlYxTE9Ock1FUjhSZ1Fw?=
 =?utf-8?B?ZzNOR0h3MjZqWHZjeU9xQ1dtbEdKVjhob01CaDZ0dmUvandKbW5Kb0dWbS90?=
 =?utf-8?B?ZzA0QmVSSksxb0VyanJsOFVLQlpvcStKcEd0QnJOSUZ5R0E5RDE5amhqLzF0?=
 =?utf-8?B?emR1NWhOaHd3N3EvcEdsd1o0UnJTOGxaYmRBNVVZL24vMENSdnhCV0hUdkJF?=
 =?utf-8?B?QytJTlJmTnl4R3dha0Z5ckFrOUR0MlN2ZEIxMkEzNDh4aWRBMEprR2lwaWpX?=
 =?utf-8?B?Q1BBNzJVb3Fydkp4cnVxSEtuVjdNdDhCMG14YlhBcmF2ZVFHanc1U2U2OTF3?=
 =?utf-8?B?UTBMOWJGNW1SS2RrSHRrc0dFczJ1MG5kTHBRY0swazRvYmhydENKTDM4WEYv?=
 =?utf-8?B?ZXMzVk85YnYzQW55Z3JLNG1LbUNWdFBzMGc3cXk4a0Z1Z25mN1V2Y2lIaXFL?=
 =?utf-8?B?cmVUMG9lZjVJcFU2byt2Y1plMGNGa2dPK3BidURGbDIwcmp6anJrQWx3SzYw?=
 =?utf-8?B?YnMzSjB3YjRIMmdoZWtiOUcvVmxtajBUZm8zaDl0WC9UNGhjcjF2Nkx4akxB?=
 =?utf-8?B?R1VGL2ZaVmVxNkdKS0hLSnU1WmVzSjRNS3YwTnh6SDBEYTVZdmhCc0x2amNQ?=
 =?utf-8?B?OGNyOStsSStPZ1d4SURRaU5zSXAwWmRXR0ZhRkN4NFo2WjJsWXJlZmVya1BW?=
 =?utf-8?B?VFlJY0tXdDZLNjB6d1hBeE5yR0hJdTIvbThmU09FMElUcEV3WHg3ZEdFR2Jm?=
 =?utf-8?B?UUxabjJhdld5aXNuUXVXSmxIQnNhZlZMUXdud2xsbzlwZHFUR1BOd2ZQcVZ2?=
 =?utf-8?B?cjNxNE40bituUXA1ZFYzUXNaY3dSRmZOZlpvTWpESHVZSktnejBVbi85d3lR?=
 =?utf-8?B?SFRYb1lPazgrWnJBT0p0K0NnbGo1Z2kyU1R3WFhUZnBDdDdhWXZZWnBwSzht?=
 =?utf-8?B?Y3hjYnpwQlZicVdpeTRxWnpISHBkUXRTZ2p0ZEFLZlNKWDZSbE02TnMySXJs?=
 =?utf-8?Q?XRGEbsyM9GhqhuShfwRd/6b60?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB92D4D4AEB6DF44BECC69E554D480FD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 641b02e4-2449-4108-acff-08dbf57fdf60
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 10:49:36.0196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHQKJQIjAioVPdQkv2V5IQy2DqFZ1eWo7ry55GvxeS9iz25UgEAfChfQREDgrxnBL9+7rTgvzxO/gZehC3qmRsUSSb65K4U8tH/L1lGUqfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3382
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
Cc: "oss@buserror.net" <oss@buserror.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzEyLzIwMjMgw6AgMDY6MTIsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSB2b2x1bnRlZXJlZFsxXSB0byBtYWludGFpbiBQUEM4M1hYLg0KPiANCj4g
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzdiMWJmNGRjLWQwOWQtMzViOC1mNGRmLTE2
YmYwMDQyOWI2ZEBjc2dyb3VwLmV1Lw0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBFbGxl
cm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KDQpBY2tlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIE1BSU5UQUlORVJTIHwg
NiArKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gaW5k
ZXggNTYyZDA0ODg2M2VlLi5kNGVmZTQ4Y2MzNmEgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJT
DQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC0xMjI4NywyMSArMTIyODcsMjEgQEAgUzoJT3Jw
aGFuDQo+ICAgRjoJYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy80MHgvDQo+ICAgRjoJYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy80NHgvDQo+ICAgDQo+IC1MSU5VWCBGT1IgUE9XRVJQQyBFTUJFRERFRCBQ
UEM4M1hYIEFORCBQUEM4NVhYDQo+ICtMSU5VWCBGT1IgUE9XRVJQQyBFTUJFRERFRCBQUEM4NVhY
DQo+ICAgTToJU2NvdHQgV29vZCA8b3NzQGJ1c2Vycm9yLm5ldD4NCj4gICBMOglsaW51eHBwYy1k
ZXZAbGlzdHMub3psYWJzLm9yZw0KPiAgIFM6CU9kZCBmaXhlcw0KPiAgIFQ6CWdpdCBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2NvdHR3b29kL2xpbnV4Lmdp
dA0KPiAgIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9mcmVlc2Nh
bGUtbDJjYWNoZS50eHQNCj4gICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cG93ZXJwYy9mc2wvDQo+IC1GOglhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgzeHgvDQo+ICAgRjoJ
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4Lw0KPiAgIA0KPiAtTElOVVggRk9SIFBPV0VSUEMg
RU1CRURERUQgUFBDOFhYDQo+ICtMSU5VWCBGT1IgUE9XRVJQQyBFTUJFRERFRCBQUEM4WFggQU5E
IFBQQzgzWFgNCj4gICBNOglDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+DQo+ICAgTDoJbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gICBTOglNYWlu
dGFpbmVkDQo+ICAgRjoJYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84eHgvDQo+ICtGOglhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzgzeHgvDQo+ICAgDQo+ICAgTElOVVggS0VSTkVMIERVTVAgVEVTVCBN
T0RVTEUgKExLRFRNKQ0KPiAgIE06CUtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPg0K
