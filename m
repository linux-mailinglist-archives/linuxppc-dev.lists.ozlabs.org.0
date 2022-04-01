Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E624EECE0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 14:08:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVJq72HYYz2yxL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 23:08:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::629;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVJpf2YT2z2xSM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 23:08:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHnO1jRopV+RH1WOLBU3tnyq3VUxwhu0JMeDAGI0MVvpQ8WYD/0FIrZTLZZJ62Wvx0KeHV0Z5q9lY2aFYSSta/FWvoL3o7NpIpgV9uCOYL7sXpAm3eUQ1yT9Nvh5yxJ0q8nRF/dB+pKVXDrcFFbGrmGJcvQjlQQ/8W2b8/ZOXfcUeA9PTzJEjHMijvuiHaQ+k2xzrS49N/TmWUziZJ3pLf88TypZuhcL5Td/2g9WTRJyuKl04MXCeKEdqFI141qsZcersWcnVVzYEEeXp9dEc21FdF05qEaUImaZPn89zRsQhe3blChWKw4lVN4IDKGNCLHdXWogznOXCFlFzwsIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSoGAP3N0d1LIEF7YNsGsJE97xMLterKwBZN1ftSOdE=;
 b=mtzj3qqxQXDzb7bp0MJdtWkw/tkBiq4FV3G3fehK3kw5ZFuzvFcSzyITH3f6LSZdpu8sFQBdkTzSJDT5S36TmIHdW6TPFbNK2GeUvsXrDp+jaRfenZRzvnZI4/zcXQ0xIyfF1k2/yDqThw9hSiTB7+ELKmyBWDW5FDGHzRDWwPdDO7wTmw6NE54MzfXj3eBYfQ/BxPfAxtwm9e9RqTg7l9j5swhLB+xSqXotSe8gBRdQLq+TRWODwzfMk/m0OD/3Wha1cldirK1BZb8IgyRl+Ty33zDldX556aQXwpfIjiPc6i/6L5yvOInvw+ByU65kUvP7joZhjwegSA5j3AwEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 12:07:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%7]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 12:07:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] Revert "powerpc: Set max_mapnr correctly"
Thread-Topic: [PATCH v4 1/2] Revert "powerpc: Set max_mapnr correctly"
Thread-Index: AQHYQPIfLR67jdMa+ECWra/lL4RyQqzUnbCAgAAGL4CABk/xAIAADHyA
Date: Fri, 1 Apr 2022 12:07:46 +0000
Message-ID: <2f89bb08-6946-3dab-1cb4-ad6f950c035e@csgroup.eu>
References: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
 <b2ff771c-01ef-3f14-f22d-9248735fdc77@huawei.com>
 <87sfr2fjms.fsf@mpe.ellerman.id.au>
 <34355f36-1122-9c22-e717-73a957a31a3e@csgroup.eu>
 <87ee2hf3on.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ee2hf3on.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6761f29-2399-48b3-343e-08da13d83c25
x-ms-traffictypediagnostic: PAZP264MB3151:EE_
x-microsoft-antispam-prvs: <PAZP264MB3151227E0AF24A41C8A1DFF1EDE09@PAZP264MB3151.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: siB1DnYsTFK1qAc7Z4OBRg4kbFBOGKS6bMpJukLagSKnx2lDrOiRLzE5O2UJ3N8/EbkjB+vP2SNuVYQ1ZSlHg16iAxJj0AV63LUafB2DMaejs78INIG97WsllUnVJAEbSVBKO5ZdJdMuKvmtOG4H2QxUY75XDqr+Wm4t38KL190KlpxdKg91JAQzAjIWAXN9VQbkEErzZyLZPZDX3407CH8tvu1oWdqaqO3JGSeg4X5emw9qyTHr+shK69RdOYzVqCwehhBwn0XdbbnYtHdPWLopWOOQU3Ri63hTv5HSzyLsFavL3ykvuVLl+k4Y4N4CQPjk55UGp8tOsu0npSbDpCWefLD4ySpAhEAxBkJP5TerXb2Duq1WvxeWzDdGY7EDisY8XlO1MrR4vBpwn3mIX+/+wePpvfwyFaKrFie3ffwkEkIP1n3fqdtxqDJ3z4X6hzaJ7VfBnXVx4FnFC/zf6OCNP85Z/r2DtdzrKCop/y1Q23xPJ8Ng7ZqUXikizLGPkHnCyuCIlENDNBShmwwVVa6zfNXg29i6mvgq0IICkkJLMWWRx1ULytkSAPdO3foLAmDEDE76plmtcHwXi69Zmzt9MHHTpGJOvuWjqoZn3aAaw1ONzGvuGkweGSCDoGiK5w7EGAwd3znJDpbDHelRDrlge61aRUTBpd3YazmcrmlYX/n9H9jsWNXuDj9GuoRs7OqonTIemofbPYZ+g+KTAVS0Nv9qTELXk3Brybt3El5B/ffyTrev6pmhjLHc4/9DuqRHtZhSor47xH1W+/gSeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(186003)(36756003)(2906002)(122000001)(316002)(26005)(54906003)(2616005)(66574015)(38100700002)(83380400001)(110136005)(66446008)(31686004)(71200400001)(8936002)(508600001)(31696002)(86362001)(66556008)(66476007)(66946007)(64756008)(4326008)(8676002)(76116006)(91956017)(44832011)(6506007)(5660300002)(6486002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDBweEdEQVBFM29rdVVleE5LNzd4S0xSSHFFcjNROTZ0eWNOVWJxcnAyUi9h?=
 =?utf-8?B?dHF5RDBXZmMyRVhlZEUxZ0tMVmhVMUU3aStnYXEyWHJwVHJsUGtKaE40bE0z?=
 =?utf-8?B?MmVOclVLdEtoT2tXd0lPUENlN0kwY3lydjdKd2h3b05ESVBxck9LMzU3aHow?=
 =?utf-8?B?dWFJVGtRL2dJN2lLNkVhdW5uZjlKQjB2SmRteUlyczBtS203N2N4MVZCT1g0?=
 =?utf-8?B?bmttVE5Ya2JTcEhCTFF2Tm1YcnZLSVUveVdQaXRQRHpObTQxQ2I0bVZCdnJy?=
 =?utf-8?B?NEtUTWNnV0lwWkVOd0RZaEdMM2g1S3JFN0dZVU9uZFBKQTlMQ0FleHEyaFY0?=
 =?utf-8?B?Z2pLNlpsZDRxVVM0S25hc2Urb05tZVpoVjFteTcxMk52TWo4TFhUZlY3UHQ3?=
 =?utf-8?B?NjdXajBxUHN0dHZjWCt6dTlCTGNzNVhPSyt4Y0hyM3Npb2RFTjM2dEtuWlox?=
 =?utf-8?B?azltdXhlbzYvcHNLN3h5eUZlaGsrRjk1aHdvb0NHaDlacVpWRE1MK1hIR0VR?=
 =?utf-8?B?RWNsZi9CQ1AraTFnWkxDZHNldXFmMmJabWdaV3daRlJJQlIzWmtoTno3cWdy?=
 =?utf-8?B?SldsTzhBQmJPTGpNQUd1Y05pSGhmNzc0TWNZMVZMdnpHMHNDczlkTDlybHVD?=
 =?utf-8?B?V011cHNtNVlSOHRKK2JjeWdvSlBOdUwxSm9nMDdZK01jaDJodnQxR0poc0hD?=
 =?utf-8?B?Y2xKampRVExjYSs2Vk12aVhyVlZXRkhYMlZRUzlrZVh2S1R4dEdDcm51Y1ZK?=
 =?utf-8?B?T2lCS2ZPZHVmdHJkMEVmaExrZVFEZTVaNm1ncGUwYm96b3oranZyOEhYL3RL?=
 =?utf-8?B?S0RTOHJCeUtsNlI4WDdTUDMweTNyS2J5WTZSU3Y3RXRzeEZ4T0xxbjdzR3BH?=
 =?utf-8?B?dGNGMEVqSDFqS3p0N0VhUTg1bFg0dkR2T0Y1UjQxT2NnWk1VeGh6Q1NjUnFG?=
 =?utf-8?B?Y3hMd29VTGNrbml2UjVXMzJZYWE2Wm0xalQ2UWVRK0FFTFB0cGFETXNnRVVx?=
 =?utf-8?B?bkZ2Y3F0VllybjZoeW5aTDR5MjBOR09kSDdHVmVHTktvOW5BZ0NGczhMWi9m?=
 =?utf-8?B?ai96T2t0V3VWWGF0Q2lZN3dWaWZQRGs2NWRSeVVuYWJGeUVsOHFBbXZNWGNR?=
 =?utf-8?B?WHE1NEpHUXB1azAyRktHcVdiVG9acWVQSjFOMXgyTEpXd2dvSGcySkNGOU5N?=
 =?utf-8?B?aE8xUUphYzJMNUdmSlNmTzZZdmo1dkdMclZYOUpRTkpFTVpkaEZGcVYzL2dm?=
 =?utf-8?B?c1Z1RXF6ZzJJMmdqdEtuTmI3dXNod0dIR3lYZjg2VGsvUmNPNTZnSVI1Mjdi?=
 =?utf-8?B?MTc4SUJRUUdUY3pHcDBGd3BtUy9WeTMrRnIxbFFqMElDZVdmQTZ0OHQvKzVR?=
 =?utf-8?B?WVV2dk9rclpEb25aMnQ1YlZxazZYTk1qRlZrSGZXeWdEb2NjbU0wSEp4RDJu?=
 =?utf-8?B?cUU2WW96UUx6b2Nxc3FZOXVJZGlUVUM3elBPdmRRamlJSUxzTkZOSm1PTjBE?=
 =?utf-8?B?bmtlU2pUa2p2YWZZVzR0VDUzMFNHUXRyRjV2RzN1dzdJZURYZWx4eVJod3NR?=
 =?utf-8?B?Y3JYVzVEMGYvamcyQkZQMjhMZ3ZhV0tRd0U2SEVqSnlOL0NFcmFqQXVzRURs?=
 =?utf-8?B?SkVtZHdDTTFSaTM3ME4wWjczMUV1SHhrSDdMaTI1N2Q4MS9ER3Zna2lwdklU?=
 =?utf-8?B?V0lZL2xaRURJZjJvT3JnWk1Wb3c5dTZlQnFtYjQ2Wlc3T295M2hXYXRhMEhI?=
 =?utf-8?B?ZDJHaEtZaUUvVFhZUmRidXZDKzR1dVkrZzJ4alUxakhZSzZjTWVITFZVdW01?=
 =?utf-8?B?NGUxUFk2bmlVb09kdlhYODM0ZDdZRmhzRVRJSWVFcUJOMzRXZGNTa1pLdlJD?=
 =?utf-8?B?L01wckprendMZkdtRnYzZ3ZldjRSUlg3NUUxeVFSNGlyNXlPRmlrRFA1bGd4?=
 =?utf-8?B?M0lvaUxwM3VuQzFpdnJpNGxabVdOUjNsbUxGbWNPdEpTaGdrWmFEOEMyN3p5?=
 =?utf-8?B?Rm9YcGxqbHlvTlpiTXA3YjBtbWwzK1h2d2w4eEV3Q2Z2WktHR3JiYkpwenhj?=
 =?utf-8?B?RGZ3Qm0xcjRPazZMTW9oMkwxR1BaN2Y4NVdqMkhjN2o2UDFqQnRadUN4RzVv?=
 =?utf-8?B?V2tXcXc4dDRyOXRoTHF2NWhCMW14UzZKRkUwOGxKd3BObXpoWlRlbXl1bEhz?=
 =?utf-8?B?RFN2Ym5sMXoxYkw5MHJnYmV4YjZqSFB0VlEraWhFMSsvMG9SN2lzWDNDdm5J?=
 =?utf-8?B?bjZLV0RaVjFhL0NScFd0dkRWWnlhY1BEaURSKy9hOVJlNDI2T0RGZysvcE9J?=
 =?utf-8?B?MndCWEhWNEJWYWxzU2MvUHgxUTBzUWVuc2dCb3lzMHhCZWlwTjZQUEF1Q2tm?=
 =?utf-8?Q?eSAbc0xOhY+vrjL/Lx4k1db9X0RF8+q+v07Zj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B2C29F66EA5134080BE07299AE9471F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a6761f29-2399-48b3-343e-08da13d83c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 12:07:46.8656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbnMbpvwvlMIWp2Z/Oo47LUXD1KUTl4EfZ72/xIiYVEwkSxAQWElQYrm2sdknqEgJBnknTCZkZcRgSu+wup9YxGUohfUl14kAe14OuFsa00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3151
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
Cc: "songyuanzheng@huawei.com" <songyuanzheng@huawei.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA0LzIwMjIgw6AgMTM6MjMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAyOC8wMy8yMDIyIMOgIDEyOjM3LCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6
DQo+Pj4gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cml0ZXM6DQo+
Pj4+IEhpIG1haW50YWluZXJz77yMDQo+Pj4+DQo+Pj4+IEkgc2F3IHRoZSBwYXRjaGVzIGhhcyBi
ZWVuIHJldmlld2VkWzFdLCBjb3VsZCB0aGV5IGJlIG1lcmdlZD8NCj4+Pg0KPj4+IE1heWJlIEkn
bSBqdXN0IG1pc3JlYWRpbmcgdGhlIGNoYW5nZSBsb2csIGJ1dCBpdCBzZWVtcyB3cm9uZyB0aGF0
IHdlDQo+Pj4gbmVlZCB0byBhZGQgZXh0cmEgY2hlY2tzLiBwZm5fdmFsaWQoKSBzaG91bGRuJ3Qg
cmV0dXJuIHRydWUgZm9yIHZtYWxsb2MNCj4+PiBhZGRyZXNzZXMgaW4gdGhlIGZpcnN0IHBsYWNl
LCBzaG91bGRuJ3Qgd2UgZml4IHRoYXQgaW5zdGVhZD8gV2hvIGtub3dzDQo+Pj4gd2hhdCBlbHNl
IHRoYXQgbWlnaHQgYmUgYnJva2VuIGJlY2F1c2Ugb2YgdGhhdC4NCj4+DQo+PiBwZm5fdmFsaWQo
KSBkb2Vzbid0IHRha2UgYW4gYWRkcmVzcyBidXQgYSBQRk4NCj4gDQo+IFllYWggc29ycnkgdGhh
dCB3YXMgdW5jbGVhciB3b3JkaW5nIG9uIG15IHBhcnQuDQo+IA0KPiBXaGF0IEkgbWVhbiBpcyB0
aGF0IHBmbl92YWxpZCh2aXJ0X3RvX3Bmbihzb21lX3ZtYWxsb2NfYWRkcikpIHNob3VsZCBiZQ0K
PiBmYWxzZSwgYmVjYXVzZSB2aXJ0X3RvX3Bmbih2bWFsbG9jX2FkZHIpIHNob3VsZCBmYWlsLg0K
DQpZZXMgdGhhdCdzIHByb2JhYmx5IGhvdyBpdCBzaG91bGQgYmUgYnV0IG5vbmUgb2YgdGhlIG1h
aW4gYXJjaGl0ZWN0dXJlcyANCmRvIHRoYXQuDQoNClRoZSBiZXN0IHdlIGZpbmQgaXMgc29tZSBh
cmNoaXRlY3R1cmUgdGhhdCBXQVJOX09OKHNvbWUgdmFsbG9jIGFkZHIpIGluIA0KdmlydF90b19w
Zm4oKS4gVGhhdCdzIHdvdWxkbid0IGhlbHAgaW4gb3VyIGNhc2UsIGFzIGl0IHdvdWxkIHRoZW4g
V0FSTl9PTigpDQoNCg0KPiANCj4gVGhlIHJpZ2h0IHdheSB0byBjb252ZXJ0IGEgdm1hbGxvYyBh
ZGRyZXNzIHRvIGEgcGZuIGlzIHdpdGgNCj4gdm1hbGxvY190b19wZm4oKSwgd2hpY2ggd2Fsa3Mg
dGhlIHBhZ2UgdGFibGVzIHRvIGZpbmQgdGhlIGFjdHVhbCBwZm4NCj4gYmFja2luZyB0aGF0IHZt
YWxsb2MgYWRkci4NCj4gDQo+PiBJZiB5b3UgaGF2ZSAxR2J5dGUgb2YgbWVtb3J5IHlvdSBoYXZl
IDI1NmsgUEZOcy4NCj4+DQo+PiBJbiBhIGdlbmVyaWMgY29uZmlnIHRoZSBrZXJuZWwgd2lsbCBt
YXAgNzY4IE1ieXRlcyBvZiBtw6ltb3J5IChGcm9tDQo+PiAweGMwMDAwMDAwIHRvIDB4ZTAwMDAw
MDApIGFuZCB3aWxsIHVzZSAweGYwMDAwMDAwLTB4ZmZmZmZmZmYgZm9yDQo+PiBldmVyeXRoaW5n
IGVsc2UgaW5jbHVkaW5nIHZtYWxsb2MuDQo+Pg0KPj4gSWYgeW91IHRha2UgYSBwYWdlIGFib3Zl
IHRoYXQgNzY4IE1ieXRlcyBsaW1pdCwgYW5kIHRyaWVzIHRvIGxpbmFybHkNCj4+IGNvbnZlcnQg
aXQncyBQRk4gdG8gYSB2YSwgeW91J2xsIGhpcCB2bWFsbG9jIHNwYWNlLiBBbnl3YXkgdGhhdCBQ
Rk4gaXMNCj4+IHZhbGlkLg0KPiANCj4gVGhhdCdzIHRydWUsIGJ1dCBpdCdzIGp1c3Qgc29tZSBy
YW5kb20gcGFnZSBpbiB2bWFsbG9jIHNwYWNlLCB0aGVyZSdzIG5vDQo+IGd1YXJhbnRlZSB0aGF0
IGl0J3MgdGhlIHNhbWUgcGFnZSBhcyB0aGUgUEZOIHlvdSBzdGFydGVkIHdpdGguDQoNClllcyBz
dXJlLCB3aGF0IEkgbWVhbnQgaG93ZXZlciBpcyB0aGF0IHBmbl92YWxpZChzb21lX3ZhbGlkX3Bm
bikgc2hvdWxkIA0KcmV0dXJuIHRydWUsIGV2ZW4gaWYgdmlydF90b19wZm4oc29tZV92bWFsbG9j
X2FkZHJlc3MpIHByb2ZpZGVzIGEgdmFsaWQgUEZOLg0KDQo+IA0KPiBOb3RlIGl0J3Mgbm90IHRy
dWUgb24gNjQtYml0IEJvb2szUy4gVGhlcmUgaWYgeW91IHRha2UgYSB2YWxpZCBQRk4gKGllLg0K
PiBiYWNrZWQgYnkgUkFNKSBhbmQgY29udmVydCBpdCB0byBhIHZpcnR1YWwgYWRkcmVzcyAod2l0
aCBfX3ZhKCkpLCB5b3UNCj4gd2lsbCBuZXZlciBnZXQgYSB2bWFsbG9jIGFkZHJlc3MuDQo+IA0K
Pj4gU28gdGhlIGNoZWNrIHJlYWxseSBuZWVkcyB0byBiZSBkb25lIGluIHZpcnRfYWRkcl92YWxp
ZCgpLg0KPiANCj4gSSBkb24ndCB0aGluayBpdCBoYXMgdG8sIGJ1dCB3aXRoIHRoZSB3YXkgb3Vy
IHZpcnRfdG9fcGZuKCkvX19wYSgpIHdvcmtzDQo+IEkgZ3Vlc3MgZm9yIG5vdyBpdCdzIHRoZSBl
YXNpZXN0IHNvbHV0aW9uLg0KPiANCg0KQXQgbGVhc3Qgb3RoZXIgYXJjaGl0ZWN0dXJlcyBkbyBp
dCB0aGF0IHdheS4gU2VlIGZvciBpbnN0YW5jZSBob3cgQVJNIA0KZG9lcyBpdDoNCg0KI2RlZmlu
ZSB2aXJ0X2FkZHJfdmFsaWQoa2FkZHIpCSgoKHVuc2lnbmVkIGxvbmcpKGthZGRyKSA+PSBQQUdF
X09GRlNFVCANCiYmICh1bnNpZ25lZCBsb25nKShrYWRkcikgPCAodW5zaWduZWQgbG9uZyloaWdo
X21lbW9yeSkgXA0KCQkJCQkmJiBwZm5fdmFsaWQodmlydF90b19wZm4oa2FkZHIpKSkNCg0KDQoN
CmhpZ2hfbWVtb3J5IGJlaW5nIHRoZSB0b3Agb2YgbGluZWFyIFJBTSBtYXBwaW5nDQoNCkNocmlz
dG9waGU=
