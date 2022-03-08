Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2C4D1AFD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 15:52:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCdZk2Zkkz3bTL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 01:51:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::611])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCdZB5zhlz30FC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 01:51:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIbQ+WhXooVFKrBYVd0JghSZNi40yUVPZD4BwHyDX569m9F5l2qzoMN+AUo6wlMXo9jvdqTfAIsoJNLvme6NZXmx/dI0AIQ2wx/cMRYK5rXcxNIs6eKs/wxvdBuxsZ+GEx3Dj0MxvL69aN3v/CMXPd0RSU2FkEPuJJnicYcE6R8XhlDZ5cm0sH6+JrDO4vVxcue4a0hBrf0Lduwj2ulfonS3PIEJBZwapz0zM92iQoFXTJHR/q0Jcz5LRzNYLwlYiCEoDeQP/t+e+lgeXpNXk1kqfzsSOsEIB6pHuvgqRmIGBIXxdhsXMvgXidV8H5y94vC9iy0j0p7cQvAPV3vdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIgFzHwHengfpOVeM9Wh+Zv1wbl97eG+NGE5EnrHLfM=;
 b=PNvU0HbsZTjnqEFiDiW0+p6Wku+SCg6qpoWnJ4k7EdsXyW6+Mfftms0r2pRai3opsm3iNSUPp9k4OjPzmWffg44WHhBqdeyhxH2xVENRqgcdJn03qaZ6Fnn+KVzmiellVf8Bd9lCrIUV8UBlPlzLUNBop1K+A9G/LDyBmCsxrxErZ/75HSgNd06alGYk0F05NZSbs8P1x0c9j1X+ynyYj9oO0JwEJDNoPchD9ARSG1YqAuFPAZgdJov/HBGaTy56SM67lE+2VFxNtydUpB91gcBt6UKCVn+0pa3M2l+9H/xXtiVJ+Yte/sC+Iz9+Xl+ALL8wta2nkxMNyNpWVFUC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3866.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 14:51:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:51:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 00/14] powerpc/rtas: various cleanups and improvements
Thread-Topic: [PATCH 00/14] powerpc/rtas: various cleanups and improvements
Thread-Index: AQHYMvO2FV90ev6pf0WUmJZNElPxD6y1kfkA
Date: Tue, 8 Mar 2022 14:51:05 +0000
Message-ID: <a2d673d4-be6a-8977-d802-d50ea2d02422@csgroup.eu>
References: <20220308135047.478297-1-npiggin@gmail.com>
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52fd5a1a-1881-4f98-94ec-08da011312ae
x-ms-traffictypediagnostic: PAZP264MB3866:EE_
x-microsoft-antispam-prvs: <PAZP264MB3866F4D4F900675818D361E5ED099@PAZP264MB3866.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wuWo+25Nm3JP1ENDyaKSRohNawBWmqjCIVDoTcUaDDPRoC8p9M+YoDUDrHOOkIGuR4nBQGLXDcA2oJ83EkRKn/AN6ocXE6o9cNK7Gwjg+x6yD65A7HH39XqPp19cN/oq9EAy4YzZ3VXaf6qozWhG55H63LnXtOYUBeRi+9sw5kgcjOksS64IansxcXOxwq122WazPIkjgfYH6L/WHnpLkdw1i+vdIlEq81CarhyBmqn+pdyY7a6FUWJGhUxETseJVQwP4/OGW4IjltnBz5XHk/+9y2Yfawv+Tri5yAXIWidCfPLH+9lfdupmhDPQxZ3vAuZYA02GdVa5657feqt4NvhRBcS7OxX3+LjvqWkobeG6JxHZ+qkrL7jD/jhV55hpBvY51UN97hW9j6Te8DDE4xE9QSspi4WgfpXYQVanmGlq3a0XyQknOvv1eyQrgcfBaW1xi+k7+NkoXJRWqzRQOHK2XY+A/XbseFuuMbk44bwySsHIQDQxnrre8EDtsHLLBGF48Llay+gjDTz+vk2Y7iASfd0aj9NS58jd3VMWddCKBQzP0SNDxW8pZ1iyNRdcTJMcA4/92phk9aRY+k+WaU+4YDXjr2v7EmsTf1UY4BWENPJHVR1C/bF+aHetVfky9Hpq5nfVv9dWtxWzR3fg+gSkFAwjCljYGMXRrWkGEWZZrPySq7omcuLAGsd/2TbIiiZw+eOw819RDSoFLrCPpJsCJnSD0iyOrZh/BPMnwszCgutSYV3/+8WfXMMX4ESMUQZ0zMbfsNXx/YGN1WVIzrBOqAydOxlo3BrsVxg0MUnO7BsOcorJMZhVI70deS6q5rHOI4rkhfE9c7DejzXENXz1pw/VlFMc5RiT+goODas=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6486002)(38070700005)(4326008)(508600001)(38100700002)(71200400001)(110136005)(122000001)(66946007)(6506007)(6512007)(316002)(36756003)(31696002)(5660300002)(8936002)(31686004)(86362001)(44832011)(83380400001)(2906002)(66574015)(66556008)(64756008)(66446008)(66476007)(26005)(186003)(2616005)(76116006)(91956017)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlFRZzdSaHdvNzMzTHZGQytzbm4xV2Q4N0ZwemdYWkYxc1FjN3dNT1Ixd1Ra?=
 =?utf-8?B?RVJmc25SSFNLdW9KQ1RiNnVXaUlHMzFkMkdnWGhWWVJkVEhYRGRtUFlGcGV3?=
 =?utf-8?B?MjJ1aUZkbjhoVUZkNVg0a2ZMTnl3aVlaUFZCZGpRV1NxZUkra2VicTkrczBM?=
 =?utf-8?B?VkxpSksvdTE4cjAvWEJQRG1MU0JMZlBJa0RQMmNKbFZkcnJRRDJNUnlHRkNZ?=
 =?utf-8?B?dmd5eVdGYmJXTHZnMjdmK3NSdVhLd29XQW5WaW9Pa1hnSnpBQjVaeXBpWWZl?=
 =?utf-8?B?SUlWek1zSVZUNTZsVkEwbDk0RmJ0RGdBandhNGk1Ti8za1htWC8yOXhFL3lq?=
 =?utf-8?B?bzNMenVzVHdBbjN2dUkvL0xIOGpPRmFLM1lPUUt6U0M4dmoyaTZhUkJQRkw4?=
 =?utf-8?B?QnQvL0F5aFJTd0ZaZGNXYSt2MEd1UUNZUVlCb2ZNSFlJZGMxY3hmZmxMSUh6?=
 =?utf-8?B?VGVmUFR5dEVQTEVmMzJEOFlqQkNBMDJsWnExOUxmWUcwNUV4bWZTRUFicmpW?=
 =?utf-8?B?bUpSVnUrUHROYWUxYkNnVnp2WktFekY0NDNJNncxa2luMHVjUWpYM2htYW9D?=
 =?utf-8?B?NDVuR25SUm9XMzBLaVBZQzBCdytJajlNejN6MkJSQ0paMUdqY0x6UlRmOU5J?=
 =?utf-8?B?RDI4U2xWMWNGY0p6SVhTekgwN0tqOU13ajVjSThaVnRpTXdJbGlBOXBwaWRZ?=
 =?utf-8?B?bWN2RmsrNzl2UWJLVDhsYm9DQVlKRHZUeXNQM1lXNFBmRkJoc0k3c0ljRVg3?=
 =?utf-8?B?ckdXU1lxK0hXMzhYTVkvS2IrVVpNUURsSWhlemFxTnVCdVlDb0ROTE9rYUhC?=
 =?utf-8?B?MzByVDVDSlA5SHcvakdxWVpPTThjVDRpNDVlUzNWWTRwSUNIZG1mS0tMaU1n?=
 =?utf-8?B?SktucTBOeXZtUHUrSmZwUzJQUFQ5bkREUDFVT1ZGRWZhNk9sSWVCY3pnOUxL?=
 =?utf-8?B?VzBVbll1eU5BNVJ2NUY1L25tVXozRDhqeTVKRHJXVzVQenFSYjhFQXFka0hn?=
 =?utf-8?B?azJoK1lYSVVLZ3pabmxMUjRodmY3L3BTZThyeXRmcUc0SkpCWEQxYWhWWncy?=
 =?utf-8?B?QkcwR2NDTVRmcUZ4ZjJydEFPU1R1cmprNUNpNjNkZmxmWS9nSitjZENBU1hk?=
 =?utf-8?B?b1FCZm5IcFE5WnR3TDErT1lkbzhnNHMzTzhQS2dhZmN6Yk1LRCswNnZLV0Rs?=
 =?utf-8?B?NmJVVXA0TVVhT211QXlJRVRUMjRUbnpxWmtZMC9FeUs4c3pkZ04wOFk4UzVQ?=
 =?utf-8?B?UGhORVY3RDRiVU5tYjRRWlg3NDNsNWd4T056WWZyeVVmb0Rkck5NQVNOa3FI?=
 =?utf-8?B?S25sMzE5SSsvcXczQ1B0Yzcyc1VESzdxRmVUUUdoRGp5MTJGTW9JU2VBN2xR?=
 =?utf-8?B?OE9FeDA0dmhuU1dzaXY2Wk5UeTlpTkcwZmIrYmxtZDhqbE1MdEV6Y2NOWC84?=
 =?utf-8?B?OWNKcjFkVm8vNENPUHV5c01ad25rcjhTSlV4SVg5Q3hQOXBmaldDTUJUblF1?=
 =?utf-8?B?dCttVFIveVlYS0NwdTZMeXVrTGpxaTlsdnRLemRlT3YzdnVuMnNWRVRieDNl?=
 =?utf-8?B?NUNoS3JtZUFDWTNzWXcxWS9rOUdvekVDWTIzQk5razJyV2tHUFBQVGxxRlBW?=
 =?utf-8?B?bkVUd2lOUkY0THBxL1E2Lzl0a25hUUQ0UitkZDV6T2lxeVJVN1M3U0t0cTBa?=
 =?utf-8?B?RzV6RzJVSWt4R2hqc1g1b1NlUEd3STFmc2F0enhRR3ZYSW9TQ0kweThvTEtC?=
 =?utf-8?B?VGgrcHhlYStFVlZibExiaWFzNmdJbklYdU16M0ZhVDl2RG5HWDhVVE5XZFlX?=
 =?utf-8?B?c1pVdG54Skg2N3FlcWdUTTZvMnVDaDBSTmxPaWpSb0RsbjdtRkg1bDluVU9u?=
 =?utf-8?B?bkpkSzlidHM5amJ1dkl4NzhueEs3clk0cUZWWDBERUhLUHJ6RktxdE5nTjZP?=
 =?utf-8?B?N2t3aEExK2dEUWZ2MUNMVTZFaEx1WVFZVnl5ODhudkl4dVF5bUNLWjZyWHpx?=
 =?utf-8?B?ZmpLTVBLSC92YXFlbkRoYmlFZjNSZmxCdkhMWjNja1J2T1R4cTRZNmdkbU0r?=
 =?utf-8?B?QkVTQVJmSFdxQnY4UXVyR3p5TjcvU2hjaU1OZnBvUnhSTEE5c2pnMHhjblY5?=
 =?utf-8?B?WTFXb1Bkd3ZlaWg5VGo3TU50UVNnZmZlUFBzb3NiWjNSTko2Ulo3Zm92SlJS?=
 =?utf-8?B?UlU3MGp5cDVaZ0J5UVcwNHVHbzVINTQ2VmNHb0poNlF3RkdDZmJ2TXVpQVVN?=
 =?utf-8?Q?p32I/H5SY7J2ue4Fcg2Hj7Mgm8jYILtiqUbjf/aF6g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8CD3C498234F34B89F4FEFDB5B0A8D0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fd5a1a-1881-4f98-94ec-08da011312ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:51:05.5003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oO86A38eXX3w0zvXmhEf6+rAxEhgHbM1msuz5YIdi47HcDedcJbt4Y9vyMUslcqzbGtbqRcnbbvCAW16twTidmJQCiqqGc9E/6Q702e9SZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3866
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTmljaywNCg0KTGUgMDgvMDMvMjAyMiDDoCAxNDo1MCwgTmljaG9sYXMgUGlnZ2luIGEgw6lj
cml0wqA6DQo+IEkgaGFkIGEgYnVuY2ggb2YgcmFuZG9tIGxpdHRsZSBmaXhlcyBhbmQgY2xlYW51
cHMgYXJvdW5kIGFuZA0KPiB3YXMgcHJvbXB0ZWQgdG8gcHV0IHRoZW0gdG9nZXRoZXIgYW5kIG1h
a2UgYSBjaGFuZ2UgdG8gY2FsbA0KPiBSVEFTIHdpdGggTVNSW1JJXSBlbmFibGVkIGJlY2F1c2Ug
b2YgYSByZXBvcnQgb2YgdGhlIGhhcmQNCj4gbG9ja3VwIHdhdGNoZG9nIE5NSSBJUEkgaGl0dGlu
ZyBpbiBhbiBydGFzIGNhbGwgd2hpY2ggdGhlbg0KPiBjcmFzaGVkIGJlY2F1c2UgaXQncyB1bnJl
Y292ZXJhYmxlLg0KPiANCj4gQ291bGQgcG9zc2libHkgbW92ZSBwYXRjaCA5IGVhcmxpZXIgaWYg
aXQgd291bGQgaGVscCB3aXRoDQo+IGJhY2twb3J0aW5nLg0KPiANCj4gVGhhbmtzLA0KPiBOaWNr
DQoNCldoaWxlIHlvdSBhcmUgYXQgY2xlYW5pbmcgUlRBUywgbWF5YmUgeW91IGNvdWxkIGFkZCB0
byB5b3VyIHNlcmllcyB0aGUgDQp0d28gZm9sbG93aW5nIHBhdGNoZXMsIHVubGVzcyB0aGV5IGFy
ZSBub3QgYXBwbGljYWJsZSBhbnltb3JlID8NCg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIxMDcxNDEyMjc1My43NjAyMS0xLXpodWFu
Z3lpMUBodWF3ZWkuY29tLw0KDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXhwcGMtZGV2L3BhdGNoLzIwMjEwNTI2MDkyMDIwLjU1NDM0MS0xLWNoZW5odWFuZzVAaHVh
d2VpLmNvbS8NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBOaWNob2xhcyBQaWdnaW4gKDE0KToNCj4g
ICAgcG93ZXJwYy9ydGFzOiBNb3ZlIHJ0YXMgZW50cnkgYXNzZW1ibHkgaW50byBpdHMgb3duIGZp
bGUNCj4gICAgcG93ZXJwYy9ydGFzOiBNYWtlIGVudGVyX3J0YXMgYSBub2twcm9iZSBzeW1ib2wg
b24gNjQtYml0DQo+ICAgIHBvd2VycGMvcnRhczogRml4IHdoaXRlc3BhY2UgaW4gcnRhc19lbnRy
eS5TDQo+ICAgIHBvd2VycGMvcnRhczogQ2FsbCBlbnRlcl9ydGFzIHdpdGggTVNSW0VFXSBkaXNh
YmxlZA0KPiAgICBwb3dlcnBjL3J0YXM6IE1vZGVybmlzZSBSSSBjbGVhcmluZyBvbiA2NC1iaXQN
Cj4gICAgcG93ZXJwYy9ydGFzOiBMb2FkIHJ0YXMgZW50cnkgTVNSIGV4cGxpY2l0bHkNCj4gICAg
cG93ZXJwYy9ydGFzOiBQQUNBIGNhbiBiZSByZXN0b3JlZCBkaXJlY3RseSBmcm9tIFNQUkcNCj4g
ICAgcG93ZXJwYy9ydGFzOiBjYWxsIGVudGVyX3J0YXMgaW4gcmVhbC1tb2RlIG9uIDY0LWJpdA0K
PiAgICBwb3dlcnBjL3J0YXM6IExlYXZlIE1TUltSSV0gZW5hYmxlZCBvdmVyIFJUQVMgY2FsbA0K
PiAgICBwb3dlcnBjL3J0YXM6IHJlcGxhY2UgcnRhc19jYWxsX3VubG9ja2VkIHdpdGggcmF3X3J0
YXNfY2FsbA0KPiAgICBwb3dlcnBjL3J0YXM6IHRpZHkgX19mZXRjaF9ydGFzX2xhc3RfZXJyb3IN
Cj4gICAgcG93ZXJwYy9ydGFzOiBDbG9zZSB0aGVvcmV0aWNhbCBtZW1vcnkgbGVhaw0KPiAgICBw
b3dlcnBjL3J0YXM6IGVudHVyZSBydGFzX2NhbGwgaXMgY2FsbGVkIHdpdGggTU1VIGVuYWJsZWQN
Cj4gICAgcG93ZXJwYy9ydGFzOiBDb25zb2xpZGF0ZSBhbmQgaW1wcm92ZSBjaGVja2luZyBmb3Ig
cnRhcyBjYWxsZXJzDQo+IA0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ydGFzLmggICAg
ICAgICAgICAgIHwgICA0ICstDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgfCAgIDIgKy0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMg
ICAgICAgICAgICAgICB8ICA0OSAtLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5
XzY0LlMgICAgICAgICAgICAgICB8IDE1MCAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC9w
b3dlcnBjL2tlcm5lbC9ydGFzLmMgICAgICAgICAgICAgICAgICAgfCAxMzIgKysrKysrKysrLS0t
LS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvcnRhc19lbnRyeS5TICAgICAgICAgICAgIHwg
MTQ0ICsrKysrKysrKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmll
cy9ob3RwbHVnLWNwdS5jIHwgICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2Vy
aWVzL3Jhcy5jICAgICAgICAgfCAgIDcgKy0NCj4gICBhcmNoL3Bvd2VycGMveG1vbi94bW9uLmMg
ICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgIDkgZmlsZXMgY2hhbmdlZCwgMjI3IGlu
c2VydGlvbnMoKyksIDI2NSBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9wb3dlcnBjL2tlcm5lbC9ydGFzX2VudHJ5LlMNCj4g
