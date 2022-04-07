Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB84F7708
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 09:15:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYt255z2yz3bg2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 17:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYt1Z4kdGz2xgY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 17:14:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbdsk6xda9rI2/InwJ3r3g2LleHZdnbQIEAmp6/lFSnHOFbxzaQhfdh+gEHS71sEsnhF6VnJUNx+cA1DuHMVZobdIOu2Aq4kx7xV6SEH2RxQwEc8EVV1yHKlVeE8HK3GL4ryx4swmL08hlHcNz+qTQ+TGAdrVB51gzwuUp9oqF0dPWkKErFG090Q74l1hKC5eT5qm6uZhtUmcpUzZbCxeEkaAUJk2/WqFuhhs3mVxdgGObzt3EhudMTpzck/Cl1Md3enwWdsttqo3Cq1qHpi1fagZ9jJ7gSpdGDk2ZUuq5tX69XwPyEICT+5elUBg3MgAZlL8mNwnkCFbGV97umleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f34FjguZN2FaIrQblvcaVpSOy9ShMfOdtUQtNzCfbbg=;
 b=m2fPFyH0hqVAAPYJfYMt9wYpyrygr9s63LukplSBmripisb+/fd/qtc/Ig1hXSiGlFGUjrilfy4oYtZBlUERMIGNkO10Y6064SfsJR1A7O6FPlRANsE1cluHBxpUAcEAgIXZ4IvUgwJfd4FaL58sMyo/lN251MN6qF2fFdtDmaWJ1t3CAKpAK/OLrFs3NMdL2XSqceXu7ngVDG+l2nJsTm4MMtqHxKa6P9izSxoToyx/mmgT+c7kUkPcr0qZ/Y0YCgCgzhMlMKXQmJRq1G26k7Yy3bAkD7mJ9XSBZC62ZmT/twhq2pTGpRLa/yHgwcj/LvdLFLe3MckjfTkWI1yr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3629.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 07:14:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 07:14:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] macintosh: fix via-pmu and via-cuda build errors
Thread-Topic: [PATCH] macintosh: fix via-pmu and via-cuda build errors
Thread-Index: AQHYSih99qU/OqN7XUaQvD1dT4ef1Kzjx28AgABCgoA=
Date: Thu, 7 Apr 2022 07:14:35 +0000
Message-ID: <e0d0b771-2459-1050-03f8-1bd1f70d7569@csgroup.eu>
References: <20220407023700.7216-1-rdunlap@infradead.org>
 <c8c2b89b-8546-8449-a27e-ef6e89186e26@infradead.org>
In-Reply-To: <c8c2b89b-8546-8449-a27e-ef6e89186e26@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac5f14b6-d537-4ff8-bfe8-08da186645a6
x-ms-traffictypediagnostic: PAZP264MB3629:EE_
x-microsoft-antispam-prvs: <PAZP264MB3629A9CD7C7A6382C5358A33EDE69@PAZP264MB3629.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PyXFCk2tvLswV/yAAhp+xJNblxwUh15sRnuao5ieXdZlS5/sx+g2Y38s+yfM1Wos3YnaKKzo6ETO+1bBYoZe0Ed0/zPFM/RMUP/Wg1hO5yt9UHdIHb0XVajzV9wcyCvW56PTGObB49jR55diYJQ6/v4F0zF4my+FQeOAqmMpAJp0Od3oSd1WF/n9jdO8FkiAuciY4topggxtQ17c5O8nKO5n4RxtvQfrfZESHoAqJ53rtyl/V54uF0PV9fPZwAzlntAIKYCJ7Cuxl0FS6oLHUHk8gorJ9BI42ByBnk8l/BgV/YekopY2Gc0RsbtDPL2osJhsmv9QTBPUPcZkYOAqhTpLkJoqw6dWuu9+cMLWZsGT1Cc1CxZBJMbqr+liUtL/jvF8hhQ11nGUMvV5hEte5jcRx4t0agCgUlIoCJxpUk1M9PRkGL050iQH92e9ryaZLRvR8WF05pjQdx0HFbkShKp2du05ndokQHIyTreiCRELK35CIs63NPnZVbYxuOWKuvhsluYAuxlWjyKczXMwEsuA6FvKl1MDunnGDoAUXRZzrG/xL75xHbs49FL94INEIdY0eeDTuHXeSjfGDm7nt228UET0uMEEtmMxVsQmTbqgB7GKUoq+Bsy9qO2P1qdtAyMlYFv/AMh09kB6/JM61IErLiCuSqpqjT4eG3e1r4mfVbXsUiuXD7QMgO+ZS36cAt261p+3F6MsSFeusCIdNE/ye3Ma+Rv/vFYPxJFN7eTJnaa+Mdya2ixwcuwfaaZJGq0gxEyKbCxhsKtIpCrZCofzJ/9wzjCofE4gNLL8AgYxVsSseOHQ82eTJXKLd1InaLoZ4sK03GW90q1XKsABOwDCuiB9Ugq3mOFEbkj5DOU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(508600001)(5660300002)(8676002)(4326008)(38070700005)(38100700002)(8936002)(66446008)(66556008)(64756008)(66946007)(76116006)(66476007)(6486002)(966005)(2906002)(122000001)(86362001)(91956017)(2616005)(6512007)(54906003)(36756003)(31696002)(4744005)(44832011)(53546011)(110136005)(6506007)(7416002)(31686004)(26005)(316002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkdrN3FTdWM4MzJMeXpSSW1yOUdIYzZIdDJDbXFBZG1MSzY0cFNaN3RvMWpB?=
 =?utf-8?B?KzNvYWpiRXlZUlRZdXBXT3RhcU9zUEpyc0R3UzI5TmJ6U05PQVdnK2tKbWNX?=
 =?utf-8?B?MzV3M3NobW9iVDQwVkRRcDJ0aEYwT0YvZEtoQUZwcGJCZjJtQjlZMkhwSUJa?=
 =?utf-8?B?Q2REYytrOUZDQlFBWk5jU3VRUml6Z0VJQ2ljOWQ2STFOVk9aamZQUXN2cVZp?=
 =?utf-8?B?dmNUbE1UL0VOK1VVTjF0cng2eUVwMm9VKzRsemsvVDZIRlF6M0hOTXJScm11?=
 =?utf-8?B?K0RVR1RpcFBsS25TQjVDWEJzK01WSUkrMnNEdmdRM1NuQTFnQ3E5ZG9oWDcw?=
 =?utf-8?B?TXJ3eHZSNmZWRHZlRzQ2SFZhVStWcUo2Vko3Wjk5cTE2NEU5dGl2Y21xMXVQ?=
 =?utf-8?B?d21xbm1ZVXhCQ2pVVE9wcVBmNDRaN0RUNjUrc1UrSVpyckVrdDVNSExKbHQ2?=
 =?utf-8?B?ZXlsWHZ2L2Q0cGkzbWRuZVlLTlY4R2Q2T0dUNklLNnNRRy9ML3o0S2RLZlh6?=
 =?utf-8?B?a0lPOVFjNGRXNk11SVZyWmkxMnhzSUMrTUVDaHN5bUNFUU8wMTNSc2tISjhp?=
 =?utf-8?B?WHJidU1TSWRydXBGSjF6dGM4MnRneStwRTNTSnk0YnZJZHZQa0NNU2xlZ2xK?=
 =?utf-8?B?SEV4aE15TXJlTEJ5SXQ1OGNHV1BmdUl3OXQzUEF4Z2N4NjcyemdFVUhMQkQ3?=
 =?utf-8?B?ODRHdm12SVM3LytqaWpBSXhsdWVTQjBoeGx1am5KdEJEWEdqbEhndnBwQWEv?=
 =?utf-8?B?RXl4QlV2bzdOMnBoVWVHNitNK0VCRkZheWQvZjBoNGYzM1RoVDU1UFhnYmFw?=
 =?utf-8?B?cTV4bDkrQTIrYkdaanBqRXM0bkx2ZUZ5V1laYWZVdFZjNWZ1am1uUThrUFJR?=
 =?utf-8?B?RkhuNGphOC9Gclo3Q1d1OHN0c2I0TmJQSHFOOENVaytxYmoxMWRFd1kwWDhD?=
 =?utf-8?B?dW0wTTIxclE1M2FDYVhOSEJHT0MxWGNlbzdGbmNqWVRCNlMwcUhGcEUwNXVP?=
 =?utf-8?B?OUpDS0ljOXhxeWRRQ2NNOWg1NHI0Tm9qRGpDT2x3NTZZVXg0QTZESWM5ckJm?=
 =?utf-8?B?Smx5dE8zYUJEQ1JrZExLQ05LaUFUYzlOVWtKOUxmQXlNYlpuYkpvQUlyZVV4?=
 =?utf-8?B?ZmZyeHhRSWxQcEE4Z0NTa2hOeXhGVStNcjFnQWRTT3EyMldaRFdOWVc2MFIr?=
 =?utf-8?B?MStIRTVnbU1nS1gxZGI0eGNOdFdOODZsd2hGekNydkFCQm1SSzduZk1Eb1hX?=
 =?utf-8?B?TFcvNW1XM2FQQWZmUk9FYkhaVVpvS2ZuV1BpOTBlWmF2UFk1bGJYcnFZTzNG?=
 =?utf-8?B?NkV2cFJhTXFFUFRNSkxxbTN4ZlN6V1lQT3cxazdzM0l2bUV5WlNaOVg4Y25Z?=
 =?utf-8?B?bmNXS1NEM0hpV094WWVjeGNkODRBV09rd0RKblpFSnorY1dNa1BjdndIY21i?=
 =?utf-8?B?VkpHNlNvWndpUXVuT29JeHlLNjdjR3JkRVgrNXVBVjlFUkJvem4ydWVnNHFq?=
 =?utf-8?B?TkJISFpjTnAvRDA1TGNFazhaTmJjQ3hJbU1HYkdZKzlVUXhpVEE5RThoRUdX?=
 =?utf-8?B?ZEd5L3h3NUgrcVpsRzRta05aM1QwbzNPYXpXSzdLSzVNQUFOZEM3cFZjeVJo?=
 =?utf-8?B?cXkycThtZkplMGFqWUdHUjFzZGhtZldsa3czYzdOdjI1aGZIRENwcU13RUdL?=
 =?utf-8?B?dlNpNHVxTW1oK21veDlNTkd5SG5lc1lLRGkxQjhkaHRpYU1OTmF1dWNscXdp?=
 =?utf-8?B?aUZycWFRVVIyK3ZRQjY5Y0c1NFhCVHNtTFNxTHc2WmV4WForL3pWWGU2bEZ1?=
 =?utf-8?B?VThEY3p6MU5vMERHWkNzRGd4UTRTSHRScHdRc201SnBxaHdvQUFEaXA1UFhZ?=
 =?utf-8?B?YW9URFN6TEwxVEZMWDZsUHpnalVXSXp4b1UxOGF0bGlhL05NcytiMDZ4RVJS?=
 =?utf-8?B?ejhCWUxMeVlqMnN1d056akpaR0dmVlR3WWoxcmRjSzJMZTJEM0VHZ3RMbnN5?=
 =?utf-8?B?VUx2a3VrMWhzc05tcWJHRzYxdy9CMFA3ekRMY3lYNGJyTDZ2WVdBV1doUjVH?=
 =?utf-8?B?eVB0Mjk3ZVM0OGFoblZjTVUxZGFabytjYXQwdlRONHdhZ04wQ2pJeWZhNHFK?=
 =?utf-8?B?RWxwM3Z2cG1GN3VMK0thb1JEYksyYjE3SlJaVnFFMW4vSUtvVmRZdkRraVBy?=
 =?utf-8?B?MkZUVXZPZzNvQXpMb2pwUWtkUzlNcTNHdUVYNGtIY3QrN2R4cXY3VWl4SXJn?=
 =?utf-8?B?Um1mQXRNZEN6cDVMb1RoMWVHcmJQTzlrZVV2cnFFamc2S0UxempoajdES2xi?=
 =?utf-8?B?NkFPZFg4bitYZ2w1Qlg2VXFRVkRrclltSmIrYS8xZ3ZUdnNKK2JEY05qKytW?=
 =?utf-8?Q?/x7YRbXvL6lM6B3n9et9tF0b5jErYgqS0/lqx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9ED132362980543A91E5348874FCBB3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5f14b6-d537-4ff8-bfe8-08da186645a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 07:14:35.9852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xG2JwSQlqagQo047jNfTU+hrBPfHtEcCqV8LijtUi5dboitC8Ve3E0UAVXm4rkqZA4Eto23zgrPVtPoJDqTVWmBwZZO5ZfZiLuIu3xn/A5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3629
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
Cc: kernel test robot <lkp@intel.com>, Finn Thain <fthain@linux-m68k.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA0LzIwMjIgw6AgMDU6MTYsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDQvNi8yMiAxOTozNywgUmFuZHkgRHVubGFwIHdyb3RlOg0KPj4gV2hlbiBDT05G
SUdfSU5QVVQ9bSwgdGhlIGlucHV0XyooKSBmYW1pbHkgb2YgZnVuY3Rpb25zIGlzIG5vdA0KPj4g
YXZhaWxhYmxlIHRvIGJ1aWx0aW4gZHJpdmVycy4NCj4+DQo+PiBXaGVuIENPTkZJR19SVENfQ0xB
U1MgaXMgbm90IHNldCwgcnRjX3RtX3RvX3RpbWU2NCgpIGlzIG5vdCBkZWZpbmVkLg0KPj4NCj4+
IEZpeCBtdWx0aXBsZSBidWlsZCBlcnJvcnMgYnkgbWFraW5nIHRoZXNlIEtjb25maWcgc3ltYm9s
cyByZXF1aXJlZCBieQ0KPj4gQURCX0NVREEgKFJUQ19DTEFTUykgYW5kIEFEQl9QTVUgKFJUQ19D
TEFTUyBhbmQgSU5QVVQpLg0KPiANCj4gQWggeWVzLCBGaW5uIGhhcyBhbHJlYWR5IGZpeGVkIHRo
ZSBJTlBVVCBwcm9ibGVtcyBoZXJlLg0KDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXhwcGMtZGV2L3BhdGNoL2Q5ODc2NjNiYmVkMThkN2RiZjEwNmRiNjA2NmE3NTkw
NDBiNGU1N2EuMTY0NzgzNzAyOC5naXQuZnRoYWluQGxpbnV4LW02OGsub3JnLw0KDQo+IA0KPiBN
YXliZSB0aGF0IHBhdGNoIGhhc24ndCBiZWVuIG1lcmdlZCBhbnl3aGVyZSB5ZXQ/DQoNClRoZSBw
YXRjaCBoYXMgY29tbWVudHMsIEkgZ3Vlc3Mgd2UgYXJlIHdhaXRpbmcgZm9yIGEgbmV3IHZlcnNp
b24gPw0KDQoNCg0KPiANCj4gVGhlIFJUQ19DTEFTUyBwcm9ibGVtIGlzIHN0aWxsIHByZXNlbnQg
QUZBSUNULg0KPiANCg0KDQpDaHJpc3RvcGhl
