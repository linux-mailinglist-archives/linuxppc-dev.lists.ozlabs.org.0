Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E858B6CAC1F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 19:47:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlgJJ5BBxz3fVD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 04:47:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jv4IBtvL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jv4IBtvL;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlgHK64gvz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 04:46:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK0aHgju0orirAHmax/lpiCiDg1/QbMcJAtHsbQYo8CUJMtlh5FTwnqVBbCea8hkLk9khAtEoixgAlSrmyOdb4nUeIM7gzWihko3U48og8dos39bUbXLu+dil8t1F8ka6VP1UEVN83oCTOUjVbiy5UInlLX6Q+ORPKcuEfGecD9KryUzmSC48vqeHbvSaANOLJ3kCYr5dv1SgbGyqJCLneNoHy5oJ6Z72bEg49xbnQorZ/DjBqc8LYFmGm49Xs1XEkP7O7ESozVyEl5p1ggYB1wnI0PJnwykKTAhnSKJh0vxEIxdPwcTtj3v8wnf+rYKs+DIkgxibVtEFnKwTiPaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtOn+m2xXZGfsOk6FUjrr22VmFU5eOPOFYWu1E9Gh6g=;
 b=C6PP1DqMCszaGaQQKVTj5lDn0eC+Gg4lhSb++SH8pse1fRDupK51dBqhVhxvwzEG6lNfISc+JwNAt5yODJmXA9sv4NJtC2Htx63L5GvbRgMrQuRAjnt5ADgjI2bDYISzhQyjPVVKIt5+K+hhIGL87Vg5UPb97BKPnDtvlKDwlfYIhNGgB0L4/i7qp9ytLGNNoKGuxVDsoUGxn/vSZldnpxFMfiUk0O6wbBM56zzger+Mj22AE3QrJX5L6k2MLPe+BKx3NBKUpn/j3cRdA7Y2rpEUmc15+c3AnYvq35FQLuJGzm8v2f+fB8R3M4QhovYo7M9G7DMFRW9KsnkCMkL+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtOn+m2xXZGfsOk6FUjrr22VmFU5eOPOFYWu1E9Gh6g=;
 b=jv4IBtvLD3LRbWoI5DaxWDNRwAMLNTWKEZX3FOTjoT+dy4Qs9WA8JoWLoVQjWX+D97vm3Vky9dsZipsmNPxM5SbCH+w+4qdFynoVYNeEqKN6eWGOu2D3KK+txEHiPfUdduBdSosGToDcrBcwmQAcFS5y1ryJkEuBzZuSjtA9lYY3h55qlb0OD2B+Ug1oHAFUQa2OMUhQy4K3AFzqTK6cXNM0Ho5MwLObbFQzy16Bv5hUQ1HO+Ji9KKEEczZhbPg4T3mg+Wt1G5Zo4vdm4aVPxt9fxX5tgpLYfw+j/m6G9SvQ65uTn4yBSoJO405fSvndyULxfMiYHchN3jGDB38ebw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3406.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 17:46:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%5]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 17:46:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: merge 32-bit and 64-bit _switch
 implementation
Thread-Topic: [PATCH 1/2] powerpc: merge 32-bit and 64-bit _switch
 implementation
Thread-Index: AQHZXxrM0wC58WXGZU6h/1lDyB2rXa8O6ecA
Date: Mon, 27 Mar 2023 17:46:28 +0000
Message-ID: <0dd771db-bb07-420e-8372-b021cbfe22fd@csgroup.eu>
References: <20230325130651.2457266-1-npiggin@gmail.com>
In-Reply-To: <20230325130651.2457266-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3406:EE_
x-ms-office365-filtering-correlation-id: 0734b74f-5284-4685-1988-08db2eeb3145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NELr0hCBLzujd+8WpD9yGK87q5cklQImp/Jmveeagyln4bQcz5oa46FzdMdxHBbmlOM+lQnzai2iaSx/7pnJvZMWHeF9JnCFtK+bLnf6tOCn6UPqwyZMOneOCJsZr7LavKv2Gdit5S+DSvjoXPoapt4NPkmr2uxc22CZ27I4/NWOPhMO5EzevQhKHy8WqLg/7NAwJIfKpdPd1tqqckb8bZ5gHe/+x1KmW+shfQ9rxo1vRhp9DnmhoyT1M7vYmghEa9XZZ0fNgn2CH9dYQDG94NN+zcrFBjByUlNSGPlpV1UDowyMwBijv/2MFvDmUk9rrjDgS3abY5FLZl1Y/EhS/dDofwom37aindaSZlFWXnW4pOU7e1W9Lnlh1jSrvnKN27Gtc/MydkmufBBeykbT277YnZNzaqcuieZe79pgl7oUCN0SNvfk5HNuof7H8y4YwruOGNdjlCMe5MBpBGJplSGKi4S9AHf7uwGq5NpGiexzRNDlVZ/ryzEQyCkg8nqpBFoBJ7dh9eUE6uOxj2P++n+wirvYJXXFHIof1Je9jRQN8CH59IthZe466Sq8wjXzORjqlyZMEH0+nK3ePzimlrmLJNWQVM09/JpsMVgj3GwnXYywue6N+bixOcyu+w/vQaSdNB27IhY5OZwTcd6ec8YFfTf6LmX61Ylzw6wNpM8CfoXcarVO8KGzH17yLqqA
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(6512007)(6506007)(26005)(41300700001)(186003)(6486002)(71200400001)(2616005)(83380400001)(31686004)(478600001)(316002)(4326008)(66446008)(38100700002)(66476007)(2906002)(6916009)(8676002)(64756008)(66556008)(66946007)(76116006)(91956017)(44832011)(36756003)(31696002)(5660300002)(86362001)(38070700005)(8936002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OHZPU0pYRVI3bVozWi9UZkR4L0pVdzdyZE9WVHAwK3Rua3lpaUdOY3FILzdQ?=
 =?utf-8?B?Q1AvZVlFZzE2Zmk5MXdQUmZNTDdYT1J3OFAwdW1kNFFrM2NHM1MrSnZRcjNW?=
 =?utf-8?B?aTFZRGlLQVdpREJlNGgzZFY4dXkzdVNDN25xNnUvbVJhWTZQY2lpak1Bc2dw?=
 =?utf-8?B?Tjk3MnZ4UzIrUVlCUnA5a1E5SGdIRkhSUWVIdThkOVR0eGpTTzRiV2pvMUUy?=
 =?utf-8?B?RW1BUUZSZHZPZEZGTXdTU2tUMkVEWWJXWjNJcDIwalZ5SE44WllEMzNYbW5n?=
 =?utf-8?B?cE5MaFBrWW9kSkRsdEREaEFSMUlkQUQxZmFJRVcyTmZERzRsQXA1UHhDdVRJ?=
 =?utf-8?B?ay9GME10YWZmVWVKU25iaXZ0RjVhczlvZ0JkMWhFNmRJOEp3b0VvbkxJbGh6?=
 =?utf-8?B?R3BBK2xMa3NOcm1FMzNmZXNXeGp3R2JrR2c3OVNSMHpWUERMSUVnaVV3WDBU?=
 =?utf-8?B?U0R2SHJ3SXkxZExJWFR1eHFFWExzell6eUxFOHNSYjQxMnFIQWJuZEJNRS8y?=
 =?utf-8?B?ZkFxU1RvRzYwRFNRcS9qRFkzcC96TzBTM0VCZGJEQ081cE8vZ2RRSktUUUlv?=
 =?utf-8?B?OE51THdqOWRPRmNEYVJzNXUvQkVmK2dBbVUwalFVK2lWakxCZDlucDBrMzhB?=
 =?utf-8?B?RS9MbWtBTm9sNkdJT0tqd0NkSHQ1VFA4NWJacVdxcDcxNk1waVRSZmp2aEhV?=
 =?utf-8?B?RHpYV0VpK3l6aVNoUU5pdkpmUVFXTDNZeHIwTkVzM3ZzTk1ydXJDOENkYm9s?=
 =?utf-8?B?QlFFd0cvZHh6YTJaYnBkdVFlWEM4blhPN2x1L0hNYjcwbHlweVE3VFVYL2JW?=
 =?utf-8?B?aGI4M2RSbFlnTXY5MFNKR2UvbXpIdEM4WHRhRW83cmxiV3BwNHFuOU9qMExx?=
 =?utf-8?B?cEl2b0dDOE5QaTBQemNHZkZDYitoYUJxRkxpUWdnM0dXRXV1T3A2K2UyZ2d2?=
 =?utf-8?B?ZVJGQVI0MUNTSzNveTA2ajNySDdtcytNWTUzdVhTWFF4Q3p3WkhtZkRGbjBa?=
 =?utf-8?B?UVlRWEVKcFcrbzNyRENvOHljNmExSU5GRFV6NzVPZG9nOGZ0NmhwWDUra1p5?=
 =?utf-8?B?eW9xQkg5TG16eWc3N3p3aGZNbUtzVXhMeGNKOVhObEZpbmpVcTRvYUFENWxK?=
 =?utf-8?B?aThkbTBlU2ZsQ1dZQlIrZm8zbmNJcHNLc0dBbEtRYzQ5V0VYVFdBSmxTR2FN?=
 =?utf-8?B?MzVEOWxOYUg1ZkhuSUhsMFJsc2VZMHZ2dkJMOXdiT1JyaUlmV2Qwd0M2blV4?=
 =?utf-8?B?TUQ0MFlSbW55RHM1eC9INjNMNjFHd3Q4WnozS1RqN0RBV3kxQzVmYm1NZU44?=
 =?utf-8?B?UGYvMWJxc1lrdWFUSzF0V0htRGdZOU9tK3pPalNkOHI2M3FpY1UvclJ1K3VV?=
 =?utf-8?B?Z0Jhc0gzMXk5cXowV2tVNEx1aFRTZGdmUkpMOTQ0WUFzMVcvakZxR0lCZkxF?=
 =?utf-8?B?UDRKWDJqSkxReEF0czNjNjgwRHJyeERhQVZjd0hyeUpxMjY4NElMUVhwUE0y?=
 =?utf-8?B?UGxwaTlVdWRUbTY1YkxxSXBxdFhGcWU3NlhsR0J5T2RPUHU5Ti9aMk5zZFRx?=
 =?utf-8?B?ckZ4MzA1V2dVTWYzbDZNNXNZVmcvS014WXZURDlPako2RmExWHZJLzBZNHNz?=
 =?utf-8?B?UDFoZkNpT21JWTR0WHBNZUZRbHlzODNaREtBUkNaMU9lZzIwUnlIdVpwZ3JJ?=
 =?utf-8?B?Rmc4S3hmTFRhb0Urd0FmYUtDbEZQMlA5Rm5Oc0pVcm1xTWp5SlVkUGFoOHE0?=
 =?utf-8?B?Tko3K2JUcWNtWTdUamk0QkRjY2RMWHN1WjcwN1BLT01KbnNRSjZ6dWo1UjU3?=
 =?utf-8?B?cUxXNTJoMCt3RnpabkY5YllzMkM2cndPd0FFRHFsSWZwaDJ5WUllRnNhcE12?=
 =?utf-8?B?bnViNzV2NUtGdXVmWEM3V3dJZzZuMTYvWFB5YUdXK0t6NVphN1RyRkhaZ0ZB?=
 =?utf-8?B?d2xoeTlLczViTTc0Vno0bVBpQ2Rwcm5ieU1teFNRMzVWc3ZTaGRMa3FWRVNO?=
 =?utf-8?B?ZzdVSGZKaWZZMGNqVGk4NnRoN3ZSOGI1QTBzRGs4eXlmcVkvSXo1VG9kVW5v?=
 =?utf-8?B?UFBlVTZHb0pnaGJiVG8yWGYzd0xod0Zrcit5VTJlTkN1NnNvbi9wcHZZYlAr?=
 =?utf-8?B?bDBhQWZ3c0hpYTJ3c1pWcHhNUHQ2RVl4WEY1dk52TWNoaTlRR1J6TVg5MXZv?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C2105CA98D4F24B983950DB33C8F1ED@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0734b74f-5284-4685-1988-08db2eeb3145
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 17:46:28.1292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdh8o1oXvdblZwdkXOC782x16uepJZafhVKVRdym213rD2EgCkxXbzb06NaioulzZ4QseD5Ja2Jn5qpQKVXr1wPQEFk4p7sRHCjzKYwZxIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3406
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

DQoNCkxlIDI1LzAzLzIwMjMgw6AgMTQ6MDYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBUaGUgX3N3aXRjaCBzdGFjayBmcmFtZSBzZXR1cCBhcmUgc3Vic3RhbnRpYWxseSB0aGUgc2Ft
ZSwgc28gYXJlIHRoZQ0KPiBjb21tZW50cy4gVGhlIGRpZmZlcmVuY2UgaW4gaG93IHRoZSBzdGFj
ayBhbmQgY3VycmVudCBhcmUgc3dpdGNoZWQsDQo+IGFuZCBvdGhlciBoYXJkd2FyZSBhbmQgc29m
dHdhcmUgaG91c2VrZWVwaW5nIGlzIGRvbmUgaXMgbW92ZWQgaW50bw0KPiBtYWNyb3MuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPg0KPiAt
LS0NCj4gVGhlc2UgcGF0Y2hlcyBhcmUgbW9zdGx5IGp1c3Qgc2h1ZmZsaW5nIGNvZGUgYXJvdW5k
LiBCZXR0ZXI/IFdvcnNlPw0KDQpJIGZpbmQgaXQgbmljZSwgYXQgbGVhc3QgZm9yIFBQQzMyIHBh
cnQuDQoNCkZvciBQUEMzMiBnZW5lcmF0ZWQgY29kZSBpcyBhbG1vc3QgdGhlIHNhbWUsIG9ubHkg
YSBmZXcgcmVvcmRlcmluZyBhdCANCnRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24uDQoNCkJlZm9y
ZSB0aGUgY2hhbmdlIEkgaGF2ZToNCg0KMDAwMDAyMzggPF9zd2l0Y2g+Og0KICAyMzg6CTk0IDIx
IGZmIDMwIAlzdHd1ICAgIHIxLC0yMDgocjEpDQogIDIzYzoJN2MgMDggMDIgYTYgCW1mbHIgICAg
cjANCiAgMjQwOgk5MCAwMSAwMCBkNCAJc3R3ICAgICByMCwyMTIocjEpDQogIDI0NDoJOTEgYTEg
MDAgNDQgCXN0dyAgICAgcjEzLDY4KHIxKQ0KLi4uDQogIDI4YzoJOTMgZTEgMDAgOGMgCXN0dyAg
ICAgcjMxLDE0MChyMSkNCiAgMjkwOgk5MCAwMSAwMCA5MCAJc3R3ICAgICByMCwxNDQocjEpDQog
IDI5NDoJN2QgNDAgMDAgMjYgCW1mY3IgICAgcjEwDQogIDI5ODoJOTEgNDEgMDAgYTggCXN0dyAg
ICAgcjEwLDE2OChyMSkNCiAgMjljOgk5MCAyMyAwMCAwMCAJc3R3ICAgICByMSwwKHIzKQ0KICAy
YTA6CTNjIDA0IDQwIDAwIAlhZGRpcyAgIHIwLHI0LDE2Mzg0DQogIDJhNDoJN2MgMTMgNDMgYTYg
CW10c3ByZyAgMyxyMA0KLi4uDQoNCkFmdGVyIHRoZSBjaGFuZ2UgSSBoYXZlOg0KDQowMDAwMDAw
MCA8X3N3aXRjaD46DQogICAgMDoJN2MgMDggMDIgYTYgCW1mbHIgICAgcjANCiAgICA0Ogk5MCAw
MSAwMCAwNCAJc3R3ICAgICByMCw0KHIxKQ0KICAgIDg6CTk0IDIxIGZmIDMwIAlzdHd1ICAgIHIx
LC0yMDgocjEpDQogICAgYzoJOTAgMjMgMDAgMDAgCXN0dyAgICAgcjEsMChyMykNCiAgIDEwOgk5
MSBhMSAwMCA0NCAJc3R3ICAgICByMTMsNjgocjEpDQouLi4NCiAgIDU4Ogk5MyBlMSAwMCA4YyAJ
c3R3ICAgICByMzEsMTQwKHIxKQ0KICAgNWM6CTkwIDAxIDAwIDkwIAlzdHcgICAgIHIwLDE0NChy
MSkNCiAgIDYwOgk3YyAwMCAwMCAyNiAJbWZjciAgICByMA0KICAgNjQ6CTkwIDAxIDAwIGE4IAlz
dHcgICAgIHIwLDE2OChyMSkNCiAgIDY4OgkzYyAwNCA0MCAwMCAJYWRkaXMgICByMCxyNCwxNjM4
NA0KICAgNmM6CTdjIDEzIDQzIGE2IAltdHNwcmcgIDMscjANCi4uLg0KDQpFdmVyeXRoaW5nIGVs
c2UgaXMgaWRlbnRpY2FsLg0KDQpOb3Qgc3VyZSwgbWF5YmUgcmUtdXNpbmcgcjEgaW1tZWRpYXRl
bHkgYWZ0ZXIgc3R3dSB3aWxsIGludHJvZHVjZSBsYXRlbmN5Lg0KDQpDaHJpc3RvcGhlDQoNCg==
