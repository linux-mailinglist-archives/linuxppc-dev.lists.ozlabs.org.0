Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B93538B78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC2hP3jkBz3bn4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 16:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC2gv5TFjz30Bl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 16:39:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giPI0aLceugHsYZSvULEnNXxOTfzF12NAkLHSjUwEpyvPW4X9WcmzDEqWvWGNE6fxdmEUpX5o49ibsj00lX35aH6PaDPRUMTFVqroEOjlNkUNKfeDjxDxdnzawOL2Taw+hr3tRr2/M/Fr47wbhHQtVpZljMKzSSnXIvGYK2G/gEt/d25jZdOeYGP/VQa9vV2uolxLh9+motm/l27c0oNOzR/i6ttMFB0+JygpRcdtXpiFgxvwlkdTWhF3BIb5v3GgjJwUeo3sNC7qbIFrVD3cyxNUYPfY/++lYTJcgkEpaQyQWB64zJFNaZYBt9G6SpXHLTbB4QE3aBqzH6R2I5VIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKkiKu9DzKHJuVHFrinhkpW3H9ft9sO+TYtANvv3y+4=;
 b=DcmUPVbPgbb2V8Kao8/FZO1zkAbpHIpfxJM8kzZz5ybhUdBxnvaSxKc4VebN/F3Dobp4uCejbADM1aHPlg9PJqCn8REJCmWXWputzkhydzDKuSkynWLY75F9EXdTw3a8nwFvjo5vIQZ1XCQBozNoF9psZYYnH2W7GSnrEwrRpT9iwYXoVVTaUfHUlD9sfAo5lDeHA4+NeGlxKWDX/U7xnlKDaAyq+YwwjZFQIMzhWuyv0fRz7YKWxNqhK10jDl/SgNRpQM7s0c2s+uKijUFjLRn5O0Ue2eHJw7j8O3O1KgFDSyAbdUJrFK78jc5qLE0Uw9kCaVZWXo/QBtit42qEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1820.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 06:39:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 06:39:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/irq: Increase stack_overflow detection limit when
 KASAN is enabled
Thread-Topic: [PATCH] powerpc/irq: Increase stack_overflow detection limit
 when KASAN is enabled
Thread-Index: AQHYdEFGF6KZ7IDne0qF7MOozfFi4K04hM8AgAAE+4A=
Date: Tue, 31 May 2022 06:39:19 +0000
Message-ID: <c8ebf8bd-5bb8-0aac-4df1-630ac468b563@csgroup.eu>
References:  <a07c6616ea19a28e9af6008b58ff6ac6ae90efa1.1653927631.git.christophe.leroy@csgroup.eu>
 <87ee0akys7.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ee0akys7.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30f1fc9f-f9b0-4622-c68b-08da42d04a32
x-ms-traffictypediagnostic: PR0P264MB1820:EE_
x-microsoft-antispam-prvs:  <PR0P264MB1820A8354F849D45F76F9664EDDC9@PR0P264MB1820.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bh0j65tEBc6rw8Dm+OL6V+8VVsOfRKNac+8v+OFix1R/97VmG7I7F7StPonb9t9Rx+MoKyDicn+exeSuDyzlh53+oGXcrKQTXMhSEyhubCR5pP6uQ+yn97ibT1zOGZPyIrYQLP6AHO9FD6OQNvc9/q975DrfPV/BpW6EnDFDYiUJrfNwTWjDJslBl9R+WIPcAwYJmzjHk9vMU1iF0lUZif0hM2tsWeUJEt9389r6CaXDh6ofFLDRujUFhwRVoV+jKdRDC2k2Vr38VkqlzHP0zmYYszjb0JPDlNk+uMME2yTy+jJUm5nOtrXoKjyNxhyixJAgfenH1pBGCKOPtXk9B7ZSOBh99uiRlFqyjFSgP5CCmXHEQM8QWJlPU611kcZhgz8aQzT9i+tJ0gduN8q1TfwvtoUHQOWYLDUGIhacbNxgQdJ0nL34J+i3rvcfolnr/D3/9dHZ28DhNN/cqVKOi50+fgivdrZP23TYvSBZtLUhnJaz7d0mBpm3LJ1shBaCZ29HsWNsxVKAnacTvUwFf8DL68EWmX9IMb8/6xMsAUh4vsutqYsZOxAzSriYsuu3plPyGSPFczqRVBP7HzzCQ7oKyxh4Oa9hnayu96bcZQ4yUS0kxdK74zpUVsKzWGpU/wrMXSart+s8UONbIFWyR6R02GjuwDOiHZg+333Szg1TwL0XfWpCDzIgkR6+XmEcMWnXHFbvMihOlu0i6/5HWL0AEVFZOprEKJwIbCaPuMTpqgxHkxIbbjS+FQ/Os/fiiolzYESD+ZApUwkVebkRfw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(38100700002)(44832011)(86362001)(31686004)(71200400001)(122000001)(76116006)(64756008)(91956017)(66556008)(5660300002)(66446008)(4326008)(66946007)(66476007)(66574015)(36756003)(83380400001)(8936002)(8676002)(2906002)(110136005)(54906003)(38070700005)(19627235002)(316002)(2616005)(6512007)(6506007)(26005)(6486002)(45080400002)(508600001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L09aeHNGb0ZhTFBsWncvUjdFQy9yaWM4L2FGMndZZHhXMjdGNWlsWDljWlZ3?=
 =?utf-8?B?R3FDa0VUTDF2ZHBOOGtmVDVOcVBMUHV3RzZRWld5enBEU0JSSVhLdlBmbzZj?=
 =?utf-8?B?RlgwU0hTRUJPOWRjZmNpK1hlamJVZ2ZnV1phWkdCZUQ3M1hya1FDQVZxalpB?=
 =?utf-8?B?SStINDZ4TDU0Snl3Y3BCbHN0VmwyOGc4d1Q5QmNadW5EZHRvS2x3QXVxQkRQ?=
 =?utf-8?B?Tk01R09Kc3VnS0RoYkw4Y3dQei81TEpWV0lQZXhYTUxSK2YxQWdQc1ZpVU56?=
 =?utf-8?B?Y0RGcUhNbThyUlUzbE01bHF4ZTRqY0QzWThWYkNjV3ZXSk1KYnN1M2VzeXRW?=
 =?utf-8?B?ZFFTTWhkeXY5SDE5WW5HNkNzZURLVjRMVCt6S2VzbkE0RnRWc3c0NjdZRUV4?=
 =?utf-8?B?aTdtQm01c20xZkMxby9ablJJS0hUR3E3R2VuM1luQ3l3b2krVHM5TFdQbkZH?=
 =?utf-8?B?ZlN0cFBzSmJ0VWkvUmJsQW40M2JqZlZIeU1tLzNEbDd4akNjVnAydTM3MjBO?=
 =?utf-8?B?TGlYTTFiVVZjK0k3c1B1cXNTNUlJZzRpei9qSVBlRTllM0VSdmZsVko3czR0?=
 =?utf-8?B?bW53WWxSUWQyY0lhbmprVkhzcy9EazliNTA4d0g4R3d3YXl5NlFia0VXaTFT?=
 =?utf-8?B?ZlUzd0xWS0QwVjd4bjd2SGxKaEJ5dmo3RGpKYTc3ZmJkbHRrWHJMckZXbUt4?=
 =?utf-8?B?YVBvSTBab3NpTmZQTklZZlVjWmtaWTdmV2lmbVJuVWk5VVJsdFYySTZnOXE4?=
 =?utf-8?B?WlUrck9MaGpDTTBKVXFxUkl4TUVOVXYwbFlhWCszT1d0UEg4ZU1kVm9HdG5q?=
 =?utf-8?B?V3RIUFBRajNFWldscG9Na29lbUxyVGZ4OXBvRVRhTEdRMUJUUjRYWEtyTWZj?=
 =?utf-8?B?SnA4NUVzOEhvUnE0S3AwazFqcEw5Y3JGS3B2eUVEMlYrd3NjeldhV2RIVVJQ?=
 =?utf-8?B?MkJxSlFzNGIwMk1DbHRWZDAwd0gvZFlXeHAxWTBWOVFBblBKbmRUT3o4NWlv?=
 =?utf-8?B?OURSd3Q0MENDTk1iWUc2SmFJNTJYbUdHSDhkMW0vRGdCWnZ4NU0wSEV1TDN6?=
 =?utf-8?B?YXo4ejcrSy9ZWm4vZ0Z3dzJXazVvR2h1RGZNV0xyZWt0dEVQQjFaelZrWUo5?=
 =?utf-8?B?cTQ3SU1IZHl1VFIwY3dNclhhUzgxb045WHpNRmFCUFJFbWZIRWRhT3VPckdq?=
 =?utf-8?B?aXhwdEtHYXBtdjJjNGh5eUJ1UldCUHo5QTE5eEhXdVFEL21JTExZakVjVjls?=
 =?utf-8?B?aTBkNXZvU0NVeTNKTGxqM2ZaYTZTNkM3RzhIMlBwVm5Td0NNZFFhZjl2cm04?=
 =?utf-8?B?d3VUZDVnaXV5WXpXUVlCOFdGb01uUis5bzI1SElLQ1c2KzhtWC95YUtZUlUr?=
 =?utf-8?B?TUhFbTRROGR2SlVLOEwydWVWeGV0TWk0QlF6LzVwRVdYZU8veEYyS3gxSjhG?=
 =?utf-8?B?TWVHWFdLK0c1cS9reVhkK2NNVVk1WU90MmVBMmU5TS9GMTlSQjBNMVE5ZTNr?=
 =?utf-8?B?ODF2ck15Wjcxa1pMeTZCRzZ5WEx6OXJXYVpsbHhoTnE1Nkg5a3MyMHp3Ly9x?=
 =?utf-8?B?UWZVSUp3QjhrR29zUDhHVWRPdFlkMTNoTG1xd0Z4ZDdkeUNyVWt6ajdaSjUw?=
 =?utf-8?B?T2ZRWFUvdGRuN0F3KytKMWg3cHlzSktTZVhPWldEOEtFNk1tNm1UWDNxNGhk?=
 =?utf-8?B?dm5FNjQ2dmJTemc5eExRbjgxZGhoOXhGWGw1SllIUzVobjNvVThacVVWOUlZ?=
 =?utf-8?B?M0tncVUxSDhBeitsKzFzdng3ZVdXU0E3U00rZmIrZTdMcmZXb1JvMU9tblRX?=
 =?utf-8?B?dFVFWFZ6Z3ZFT3laSG4rcXhMNHpKNm1zTjdzQ1NPeVBPdFB3VnpmdVc1YTFz?=
 =?utf-8?B?a1A2WnJMVVJQQnllY2pDU2tyNVB0ZGZsZXI5bEJBRXlEY3g5NytzZjVWMFNz?=
 =?utf-8?B?RTlKc3E3VGM3U1g0cFVyS0pkSXhCTktXY1I3dWRzcGFDdE1GdkdjUlFPSXBU?=
 =?utf-8?B?eFExcTFkNGlwaWhUOUV6Y2k1eWxSVkJEeThydi9jZ2JHWHpqVEJxc3N0OVRC?=
 =?utf-8?B?UHdCWXYrNC9JUm5JM0FySEl2T2RoMFU1UUkyRnB3L0Z4Ym9JM3p5ODNkQTk5?=
 =?utf-8?B?Z1ZLaVBCNUtrNmF5RGtTb3NoUFFwb0RiQmYwcFlmbmIxOGJDajdtcHJVeW1j?=
 =?utf-8?B?SnltRGFoQkRGYndGejhDU0cyQUhtSzcyUEF2S0x0UTA0VVNDWDg0WkhCMERv?=
 =?utf-8?B?ZlMwNEwxU0hoSEp2a2tQd25mK3YySnZMU1BTUmYzblZUK1VsNlpocG8vODUw?=
 =?utf-8?B?Tk16Rlp4OUNBWGZtWjZ5MVBqMmRjaGxaa0hLUmpUaWo2UjJ0M0pRVktRdC9U?=
 =?utf-8?Q?KnA+nqzbhO3Esx+fasGL2bseQiU0kd+nuhQOu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A28170ABA7172D4AB935D0286B9B2ACA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f1fc9f-f9b0-4622-c68b-08da42d04a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 06:39:19.1662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRLv7RaA0E44KrzZExBKCDYpXC/M47S0hN1Jr7simswKITAr89h46kM859kp08xW0ktO8G7oUesJR0GVpChN3PsbLMDJOo+lMN2v2LcRwqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1820
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzA1LzIwMjIgw6AgMDg6MjEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBXaGVuIEtBU0FOIGlzIGVuYWJsZWQsIGFzIHNob3duIGJ5IHRoZSBPb3BzIGJlbG93LCB0
aGUgMmsgbGltaXQgaXMgbm90DQo+PiBlbm91Z2ggdG8gYWxsb3cgc3RhY2sgZHVtcCBhZnRlciBh
IHN0YWNrIG92ZXJmbG93IGRldGVjdGlvbiB3aGVuDQo+PiBDT05GSUdfREVCVUdfU1RBQ0tPVkVS
RkxPVyBpcyBzZWxlY3RlZDoNCj4+DQo+PiAJZG9fSVJROiBzdGFjayBvdmVyZmxvdzogMTk4NA0K
Pj4gCUNQVTogMCBQSUQ6IDEyNiBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDUuMTgu
MC1nZW50b28tUE1hY0c0ICMxDQo+PiAJQ2FsbCBUcmFjZToNCj4+IAlPb3BzOiBLZXJuZWwgc3Rh
Y2sgb3ZlcmZsb3csIHNpZzogMTEgWyMxXQ0KPj4gCUJFIFBBR0VfU0laRT00SyBNTVU9SGFzaCBT
TVAgTlJfQ1BVUz0yIFBvd2VyTWFjDQo+PiAJTW9kdWxlcyBsaW5rZWQgaW46IHNyX21vZCBjZHJv
bSByYWRlb24oKykgb2hjaV9wY2koKykgaHdtb24gaTJjX2FsZ29fYml0IGRybV90dG1faGVscGVy
IHR0bSBkcm1fZHBfaGVscGVyIHNuZF9hb2FfaTJzYnVzIHNuZF9hb2Ffc291bmRidXMgc25kX3Bj
bSBlaGNpX3BjaSBzbmRfdGltZXIgb2hjaV9oY2Qgc25kIHNzYiBlaGNpX2hjZCA4MjUwX3BjaSBz
b3VuZGNvcmUgZHJtX2ttc19oZWxwZXIgcGNtY2lhIDgyNTAgcGNtY2lhX2NvcmUgc3lzY29weWFy
ZWEgdXNiY29yZSBzeXNmaWxscmVjdCA4MjUwX2Jhc2Ugc3lzaW1nYmx0IHNlcmlhbF9tY3RybF9n
cGlvIGZiX3N5c19mb3BzIHVzYl9jb21tb24gcGtjczhfa2V5X3BhcnNlciBmdXNlIGRybSBkcm1f
cGFuZWxfb3JpZW50YXRpb25fcXVpcmtzIGNvbmZpZ2ZzDQo+PiAJQ1BVOiAwIFBJRDogMTI2IENv
bW06IHN5c3RlbWQtdWRldmQgTm90IHRhaW50ZWQgNS4xOC4wLWdlbnRvby1QTWFjRzQgIzENCj4+
IAlOSVA6ICBjMDJlNTU1OCBMUjogYzA3ZWIzYmMgQ1RSOiBjMDdmNDZhOA0KPj4gCVJFR1M6IGU3
ZmU5ZjUwIFRSQVA6IDAwMDAgICBOb3QgdGFpbnRlZCAgKDUuMTguMC1nZW50b28tUE1hY0c0KQ0K
Pj4gCU1TUjogIDAwMDAxMDMyIDxNRSxJUixEUixSST4gIENSOiA0NGExNDgyNCAgWEVSOiAyMDAw
MDAwMA0KPj4NCj4+IAlHUFIwMDogYzA3ZWIzYmMgZWFhMWMwMDAgYzI2YmFlYTAgZWFhMWMwYTAg
MDAwMDAwMDggMDAwMDAwMDAgYzA3ZWIzYmMgZWFhMWMwMTANCj4+IAlHUFIwODogZWFhMWMwYTgg
MDRmM2YzZjMgZjFmMWYxZjEgYzA3ZjRjODQgNDRhMTQ4MjQgMDA4MGY3ZTQgMDAwMDAwMDUgMDAw
MDAwMTANCj4+IAlHUFIxNjogMDAwMDAwMjUgZWFhMWMxNTQgZWFhMWMxNTggYzBkYmFkNjQgMDAw
MDAwMjAgZmQ1NDM4MTAgZWFhMWMwYTAgZWFhMWMyOWUNCj4+IAlHUFIyNDogYzBkYmFkNDQgYzBk
Yjg3NDAgMDVmZmZmZmYgZmQ1NDM4MDIgZWFhMWMxNTAgYzBjOWEzYzAgZWFhMWMwYTAgYzBjOWEz
YzANCj4+IAlOSVAgW2MwMmU1NTU4XSBrYXNhbl9jaGVja19yYW5nZSsweGMvMHgyYjQNCj4+IAlM
UiBbYzA3ZWIzYmNdIGZvcm1hdF9kZWNvZGUrMHg4MC8weDYwNA0KPj4gCUNhbGwgVHJhY2U6DQo+
PiAJW2VhYTFjMDAwXSBbYzA3ZWIzYmNdIGZvcm1hdF9kZWNvZGUrMHg4MC8weDYwNCAodW5yZWxp
YWJsZSkNCj4+IAlbZWFhMWMwNzBdIFtjMDdmNGRhY10gdnNucHJpbnRmKzB4MTI4LzB4OTM4DQo+
PiAJW2VhYTFjMTEwXSBbYzA3ZjU3ODhdIHNwcmludGYrMHhhMC8weGMwDQo+PiAJW2VhYTFjMTgw
XSBbYzAxNTRjMWNdIF9fc3ByaW50X3N5bWJvbC5jb25zdHByb3AuMCsweDE3MC8weDE5OA0KPj4g
CVtlYWExYzIzMF0gW2MwN2VlNzFjXSBzeW1ib2xfc3RyaW5nKzB4ZjgvMHgyNjANCj4+IAlbZWFh
MWM0MzBdIFtjMDdmNDZkMF0gcG9pbnRlcisweDE1Yy8weDcxMA0KPj4gCVtlYWExYzRiMF0gW2Mw
N2Y0ZmJjXSB2c25wcmludGYrMHgzMzgvMHg5MzgNCj4+IAlbZWFhMWM1NTBdIFtjMDBlOGZhMF0g
dnByaW50a19zdG9yZSsweDJhOC8weDY3OA0KPj4gCVtlYWExYzY5MF0gW2MwMGU5NGU0XSB2cHJp
bnRrX2VtaXQrMHgxNzQvMHgzNzgNCj4+IAlbZWFhMWM2ZDBdIFtjMDBlYTAwOF0gX3ByaW50aysw
eDljLzB4YzANCj4+IAlbZWFhMWM3NTBdIFtjMDAwY2E5NF0gc2hvd19zdGFjaysweDIxYy8weDI2
MA0KPj4gCVtlYWExYzdhMF0gW2MwN2QwYmQ0XSBkdW1wX3N0YWNrX2x2bCsweDYwLzB4OTANCj4+
IAlbZWFhMWM3YzBdIFtjMDAwOTIzNF0gX19kb19JUlErMHgxNzAvMHgxNzQNCj4+IAlbZWFhMWM4
MDBdIFtjMDAwOTI1OF0gZG9fSVJRKzB4MjAvMHgzNA0KPj4gCVtlYWExYzgyMF0gW2MwMDA0NWI0
XSBIYXJkd2FyZUludGVycnVwdF92aXJ0KzB4MTA4LzB4MTBjDQo+IA0KPiBJcyB0aGlzIGFjdHVh
bGx5IGNhdXNlZCBieSBLQVNBTj8gVGhlcmUncyBubyBzdGFjayBmcmFtZXMgaW4gdGhlcmUgdGhh
dA0KPiBhcmUgS0FTQU4gcmVsYXRlZCBBRkFJQ1MuDQoNClllcyBidXQgZW5hYmxpbmcgS0FTQU4g
b2Z0ZW4gaW5jcmVhc2VzIHRoZSBzaXplIG9mIGFueSBmdW5jdGlvbnMuDQoNCkFuZCBieSB0aGUg
d2F5IGhlcmUgeW91IGhhdmUgTklQIGluIGthc2FuX2NoZWNrX3JhbmdlKCkNCg0KQnV0IEkgY2Fu
IHRyeSB0byBwZXJmb3JtIHNvbWUgbW9yZSB0ZXN0cy4NCg0KPiANCj4gU2VlbXMgbGlrZSB0aGUg
MksgbGltaXQgaXMgbmV2ZXIgZ29pbmcgdG8gYmUgZW5vdWdoIGV2ZW4gaWYgS0FTQU4gaXMgbm90
DQo+IGVuYWJsZWQuIFByZXN1bWFibHkgd2UganVzdCBoYXZlbid0IG5vdGljZWQgYmVjYXVzZSB3
ZSBkb24ndCB0cmlnZ2VyIHRoZQ0KPiBjaGVjayB1bmxlc3MgS0FTQU4gaXMgZW5hYmxlZC4NCg0K
SSB0aGluayB3aGF0IHRyaWdnZXIgdGhlIE9vcHMgcmVhbGx5IGlzIFZNQVBfU1RBQ0suIFdpdGhv
dXQgVk1BUF9TVEFDSyANCndlIGp1c3Qgc2lsZW50bHkgb3ZlcndyaXRlIG90aGVyIG1lbW9yeS4N
Cg0KPiANCj4+IC4uLg0KPj4NCj4+IEluY3JlYXNlIHRoZSBsaW1pdCB0byAzayB3aGVuIEtBU0FO
IGlzIGVuYWJsZWQuDQo+Pg0KPj4gV2hpbGUgYXQgaXQgcmVtb3ZlIHRoZSAnaW5saW5lJyBrZXl3
b3JrIGZvciBjaGVja19zdGFja19vdmVyZmxvdygpLg0KPj4gVGhpcyBmdW5jdGlvbiBpcyBjYWxs
ZWQgb25seSBvbmNlIHNvIGl0IHdpbGwgYmUgaW5saW5lZCByZWdhcmRsZXNzLg0KPiANCj4gSSdk
IHJhdGhlciB0aGF0IHdhcyBhIHNlcGFyYXRlIGNoYW5nZSwgaW4gY2FzZSBpdCBoYXMgc29tZSB1
bmludGVuZGVkDQo+IGFmZmVjdC4NCg0Kb2sNCg0KPiANCj4+IFJlcG9ydGVkLWJ5OiBFcmhhcmQg
RnVydG5lciA8ZXJoYXJkX2ZAbWFpbGJveC5vcmc+DQo+PiBDYzogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2ly
cS5jIHwgMTYgKysrKysrKysrKy0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2tlcm5lbC9pcnEuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmMNCj4+IGluZGV4IDg3M2U2
ZGZmYjg2OC4uNWZmNGNmNjlmYzJmIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5l
bC9pcnEuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9pcnEuYw0KPj4gQEAgLTUzLDYg
KzUzLDcgQEANCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4NCj4+ICAgI2luY2x1ZGUg
PGxpbnV4L3BndGFibGUuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3N0YXRpY19jYWxsLmg+DQo+
PiArI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+DQo+PiAgIA0KPj4gICAjaW5jbHVkZSA8bGludXgv
dWFjY2Vzcy5oPg0KPj4gICAjaW5jbHVkZSA8YXNtL2ludGVycnVwdC5oPg0KPj4gQEAgLTE4NCw3
ICsxODUsNyBAQCB1NjQgYXJjaF9pcnFfc3RhdF9jcHUodW5zaWduZWQgaW50IGNwdSkNCj4+ICAg
CXJldHVybiBzdW07DQo+PiAgIH0NCj4+ICAgDQo+PiAtc3RhdGljIGlubGluZSB2b2lkIGNoZWNr
X3N0YWNrX292ZXJmbG93KHZvaWQpDQo+PiArc3RhdGljIHZvaWQgY2hlY2tfc3RhY2tfb3ZlcmZs
b3codm9pZCkNCj4+ICAgew0KPj4gICAJbG9uZyBzcDsNCj4+ICAgDQo+PiBAQCAtMTkzLDExICsx
OTQsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIGNoZWNrX3N0YWNrX292ZXJmbG93KHZvaWQpDQo+
Pg0KPiANCj4gV291bGRuJ3QgaXQgYmUgY2xlYW5lciB0byBqdXN0IGRvOg0KPiANCj4gI2lmZGVm
IENPTkZJR19LQVNBTg0KPiAjZGVmaW5lIFNUQUNLX0NIRUNLX0xJTUlUICgzICogMTAyNCkNCj4g
I2Vsc2UNCj4gI2RlZmluZSBTVEFDS19DSEVDS19MSU1JVCAoMiAqIDEwMjQpDQo+ICNlbmRpZg0K
DQpXZWxsLCBhcyB5b3UgdGhpbmsgMmsgaXMgbm90IGVub3VnaCBldmVuIHdpdGhvdXQgS0FTQU4s
IHRoZW4gd2Ugc2hvdWxkIA0KanVzdCBpbmNyZWFzZSBpdCB0byAzayA/DQoNCkluIHRoZSBtZWFu
dGltZSBJIHdhcyB0aGlua2luZyBhYm91dCBtb3ZpbmcgdGhlIHRlc3QgaW50byBfX2RvX2lycSgp
LCBzbyANCnRoYXQgaXQgd2lsbCBiZSBkb25lIG9uIElSUSBzdGFjay4gVGhhdCB3b3VsZCBlYXNl
IHRoaW5ncyB1bmxlc3Mgd2UgDQpvdmVyZmlsbCB0aGUgSVJRIHN0YWNrIGl0c2VsZi4NCg0KQmVj
YXVzZSBldmVuIGlmIHdlIHB1dCBhIGRldGVjdGlvbiBsaW1pdCBhdCAzIG9yIDRrLCBhcyB0aGUg
ZGV0ZWN0aW9uIGlzIA0KYXN5bmNocm9ub3VzIHdlIHN0aWxsIGhhdmUgYSByaXNrIHRoYXQgdGhl
IHN0YWNrIGZpbGxpbmcgYmUgbXVjaCBtb3JlIA0KdGhhbiB0aGUgbGltaXQgYW5kIHN0aWxsIGJl
IHVuYWJsZSB0byBwZXJmb3JtIHRoZSBzdGFjayBkdW1wIHdpdGhpbiB0aGUgDQpyZW1haW5pbmcg
c3RhY2sgc3BhY2UuDQoNCj4gDQo+PiAgIAlzcCA9IGN1cnJlbnRfc3RhY2tfcG9pbnRlciAmIChU
SFJFQURfU0laRSAtIDEpOw0KPj4gICANCj4+IC0JLyogY2hlY2sgZm9yIHN0YWNrIG92ZXJmbG93
OiBpcyB0aGVyZSBsZXNzIHRoYW4gMktCIGZyZWU/ICovDQo+PiAtCWlmICh1bmxpa2VseShzcCA8
IDIwNDgpKSB7DQo+ICAgDQo+ICsJaWYgKHVubGlrZWx5KHNwIDwgU1RBQ0tfQ0hFQ0tfTElNSVQp
KSB7DQo+ICAgDQo+IEFuZCB0aGVuIHRoZSBjb2RlIGNvdWxkIHN0YXkgYXMgaXQgaXM/DQo+IA0K
PiBjaGVlcnMNCj4gDQo+PiAtCQlwcl9lcnIoImRvX0lSUTogc3RhY2sgb3ZlcmZsb3c6ICVsZFxu
Iiwgc3ApOw0KPj4gLQkJZHVtcF9zdGFjaygpOw0KPj4gLQl9DQo+PiArCS8qIGNoZWNrIGZvciBz
dGFjayBvdmVyZmxvdzogaXMgdGhlcmUgbGVzcyB0aGFuIDIvM0tCIGZyZWU/ICovDQo+PiArCWlm
ICghSVNfRU5BQkxFRChLQVNBTikgJiYgbGlrZWx5KHNwID49IFNaXzJLKSkNCj4+ICsJCXJldHVy
bjsNCj4+ICsJaWYgKElTX0VOQUJMRUQoS0FTQU4pICYmIGxpa2VseShzcCA+PSBTWl8ySyArIFNa
XzFLKSkNCj4+ICsJCXJldHVybjsNCj4+ICsNCj4+ICsJcHJfZXJyKCJkb19JUlE6IHN0YWNrIG92
ZXJmbG93OiAlbGRcbiIsIHNwKTsNCj4+ICsJZHVtcF9zdGFjaygpOw0KPj4gICB9
