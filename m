Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B74FAC79
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 09:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kbjdg4B6zz3bqL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 17:04:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kbjd80xzvz2xlF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 17:03:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB+a4o1bCyyGjPKqmngLyADqcsZg93qtwZPx4LZwqJ3RgwGsf1czZmI+CSH73xRwCoFUKtgd90qM09UC9UQl4ZqcW+xOLpTiaaAGGJMbBRcp5BLS3V7vP7xMR99DrPjJZUL/FrMygq7aVgSXormCoZZmr5FOGgKfMobskS9y4OoMoUmv/Uvil5jraNDM2+2QJ5/9kralXtyiHYvlmInsHD3p6HDwc5vbZ7+0TFTjvQ84o6dw1stJ/OEgRoAkSBTgs81K9JIARn8qEKfkCSUOx82xYHayyippcZXvAF9VqUjnGmNXpiyIj6AYurliTvSkPPhSKXMR4BRekLwB1mad7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW4I7coS16ua4C7YaqPuqYFoiQa8PYFksY7C6INXuD0=;
 b=FuD5tlU3Gul8d3xyfIxkHdB1K625AF6PCYw2asdED3vaISWegHxGoJ1c0Nv67tkswkqkZsSsD3LwslBN5i/gPKvzadL/uNDvLM2lPcFJ0w+srkM0LCPbvJa0g/JlCQ0sPJ2MHKOi6MXJUs9kjrJsDC3OuknEkxqCrZNWD3mGXP1b753wpwsZlr/qgBNOA0y+LciZKsgkhjwvuQznH8yTG+dB2ZJiRGpROfcFwdhfM4PjaN19DzyfLCf7KCzagi70OFU/dAsAqXtp6b8QmQxIB8xtv/yiMeUIzs4cdjjubz77mmVb8nu+Ybs8RaWbvKZtcN62jLEg/iLED/OU0iU9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2589.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Sun, 10 Apr
 2022 07:03:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.028; Sun, 10 Apr 2022
 07:03:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] macintosh: fix via-pmu and via-cuda build without
 RTC_CLASS
Thread-Topic: [PATCH] macintosh: fix via-pmu and via-cuda build without
 RTC_CLASS
Thread-Index: AQHYS7a3NBighPLsDU63nOOZAn64XazouqcA
Date: Sun, 10 Apr 2022 07:03:13 +0000
Message-ID: <ae85daa9-97a4-3ed2-5692-0d4545a88b58@csgroup.eu>
References: <20220409020821.10229-1-rdunlap@infradead.org>
In-Reply-To: <20220409020821.10229-1-rdunlap@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 343c1256-4da9-4cb9-17bd-08da1ac02e22
x-ms-traffictypediagnostic: PAZP264MB2589:EE_
x-microsoft-antispam-prvs: <PAZP264MB25896ED385E99AAE25E2F0CDEDEB9@PAZP264MB2589.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PN4w1zQj/9dGu9JwqQtMK9vFprk954HqxYU8VzcZPfwi+/BHWWtEIsmXnMlQ4QloPwOHkmVWnx7qO7G7qbjNF9iDY/5EqefHST4vXe4wdlUzA0D1VRRFCVYceXGi9sZ/Ba1O+EkilnqBDMDiuiGwzUnfrPGOfQdIz4UYJI1XqVqYbtid0ShWbeel+L+4+mOYoZxMo/KCeeqOEySNDctG0ZgbSMyGm4UNJG2difZ+LRtCpDig9sQLftpetu8LYXXetaWGlwhCIyBwp7AY24fgvnzZjuPqqx7jGXOKRUzYoMaFO53KhYFSIpEkFRHzw7s6O2IhzTYKQ3J7a9vt3aEEqCiayaK7dCkaKp9BGEeTWTB/gxgLPYVda0e0XuRRpGrVAIOf/K3/HzEtGULyHWs6TwVZVm7p4QSYagkRXOBZ4FX1Xgt9j6CCTdjPH6j5ecWylEWjCCAW2U5wkUuWwHi4+wSlxGWBTXFG3fSwtTIPidwHi2DbFrQq1HBEEHeiopBspukqSDgO5WDe16q04FydMaKyqum77Ghv/EXbNIMUN8Q5ZDMiF1Gw/wg+keWpx0mUbpQPx+eHYB0PCtZQU/vPz+rGMMFT8EwjOeHJ/D1nqXx2t3GFk1XZD6gjPkQxs5flg4Hx9qI9OcUenzOq8OoiIG/bD1IwN5eXjszmZA0xgquFY6tYDNGh/+V5hAWv74SxOhfRzonQquWmqmUtA3Ke+ODb4g//DBgBTVIzpiwuIh43aGyZtAMiHkl7xu1CRh4l6Ks45BUCdTCGdiM/4T5FLQ/09vglrA9HWLUlemnHGIihvlCrAFdR7JnqUtGLg8/gTiZLcqiLtEji54RMQVaNCqi21VFep3ZZsjRoYP1G8Tg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(122000001)(31686004)(31696002)(6506007)(36756003)(2616005)(44832011)(5660300002)(6486002)(66946007)(66556008)(76116006)(66476007)(38100700002)(508600001)(66574015)(26005)(186003)(38070700005)(7416002)(110136005)(6512007)(4326008)(54906003)(2906002)(316002)(91956017)(64756008)(66446008)(8676002)(8936002)(83380400001)(71200400001)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmFNbEZOLzF4TUpGeU45QWt5blNMcjBtYldhYVhkRytBdUQwTDZ6cUE3K083?=
 =?utf-8?B?b2ZYZC9KdUhHeFNWb0pZSlI3OXJPWXRrSEVOS25qQ2pIbEtZSHEwT0R4U3Zl?=
 =?utf-8?B?WEdLL0RLWXNVek1IMjhMczBlSzFTZ09kOTQrZ0tTSFZaSi9DMmlGME5uTFZM?=
 =?utf-8?B?WmpYZTdqcGhXVjRJbmV6K295TnZacmgyMXRpdFF1emxlSnA4VkhjUmg3MUMv?=
 =?utf-8?B?MGViWEE2aGtYL2h0Y2JCMUFhVWUrK3VYbm00UHBLNUFvaW5EWUtXNXEzQUZ1?=
 =?utf-8?B?c3dnRE12VlVXa1pjQUlEMHVBZTM4OE1vM1c3YjYvVTQ0L1RRYndmTUhGR1pk?=
 =?utf-8?B?Y1FwUFdvd2lxbklIWldPUVhYa1ZOVU9POWRTUzJMaXZiWnBld0h4Y25ZZ3Fp?=
 =?utf-8?B?YXU5WEF4WFl0NjdXRFhEakR0c3RxOWh3eGhJNnpidFlPVVhCWGRuNTNERnB6?=
 =?utf-8?B?TW1vUlJZUy9jSnFDNWtOdkd2K1lvempTeEN6RkFxTmhGekZ6bVhWUHJTM0NO?=
 =?utf-8?B?bEhnQTYwVEQxYXp0RnJZcGVubWpvTHNnN0NxdC9UN0sxYUxaSUUwU2F0SWFV?=
 =?utf-8?B?QlRudGZvSEp4M0ZFcS9rR1AvNUx4ajc5Z3FSVjhqNDM4M0t3N2JyWWc5bnY5?=
 =?utf-8?B?dVNsS2drTW1pam00STJCUjlYUzg4THlWZmdWS0xLQkF0bVNzZFdkeklpOXAy?=
 =?utf-8?B?RWVvY3BXbHp4WXRya2grRFExRWtKTUl3V05YU20yaEp0aCtsNjZaa1VsNndl?=
 =?utf-8?B?MlRyNXF4N3lXWm41bUsxZ29nMy9kMk0ybzFuVVU2a2xyM1hyLytQTFI4V2VJ?=
 =?utf-8?B?S2JYRHNBYlllb3l6b00zNzFJS2luampHMEJ1OFVLRHRvM0NxUlFzS3ZvK01D?=
 =?utf-8?B?N0ptMWRYTUZKa3JBeTlmNHhqeENuN3QrVFphVG1YUnlubVgvZVpnQ3FQQ2hC?=
 =?utf-8?B?YWI2MGlEVm5YQVVqWFRPWTB1Q3Y5VXUxcmcwY0w3Y1FuZ1VsMS9jZ3dGb0Y1?=
 =?utf-8?B?UHRaSUpuL2VDZkpBbWdyMVlmbkZ1OUtLc1c2UFhTcmN0bmhTRU9ucFlVVytn?=
 =?utf-8?B?NWJpTVJyVm9EYmZzZzhTTEc3dUY4U2Q0ZGtkVXdaZ0FZeUtsNERjK3dld3M0?=
 =?utf-8?B?RGRuZk5QdStOYmIxRkg1ekZCaDlZNHFGQ1BDYnk5QTFtd0FleDRiOXpRTHcr?=
 =?utf-8?B?MnNHN3hSblNYaXN5M0ZqaDZiUCswcXhLSGtXWWowNVRhYStZUGlBdVlwQlEr?=
 =?utf-8?B?RDlYeFRSWHdIL0VOSzVxNy9OaEZSNmpTUEdua1VpdWNFSHVJd3R2K2dpaDdS?=
 =?utf-8?B?aHVRY2dxT3grd1dqQng0cnBoM3RudVJhVUdKMVpGQnVkSWQ1QkdSOEh1SjZZ?=
 =?utf-8?B?b3RYTWdCeTBDSm1MWXZYbW1TN2dhZUd0M2Fob2J1TkRIYVJCWlpPcHNBanlE?=
 =?utf-8?B?Rmg3dFBnZ1ZMbHJOT0dEbFR5SmVjU1paQ2RlOUpMc29rYUg0aGxGWnlLa2tw?=
 =?utf-8?B?Q09HWDl5Y3ltWUEwSFhxUXhob0w1REd3c25hdTQ3NWRNMHJyelNlb0dScURh?=
 =?utf-8?B?Tm41a3lTWWNDbnhUTmFWT3Q1YjhyYkRubGgzbkZrcjdKU05rUWZqTlE1bkpN?=
 =?utf-8?B?aFpHdDJMNGZ2QTRCQ0xWb0swd0MzcC9nUGNROTkvWFdpMEV2cGh6cGQrcThE?=
 =?utf-8?B?dnFRZktiL0F0WWNaSXc4em9lN2RWNm1UQmdVdXRqT21KUkhIdWdXY2Qrdm9C?=
 =?utf-8?B?eUVCMVhGbEx1NWJCNm1FWDNncGovbTlxcG96RXFhdFowek1XR1o1N3hMYWtu?=
 =?utf-8?B?aUJ4U0QvR21mU2R4UkZsb3hUZ0tNOWZRS2NGckhKSEZBaEh1ZTBJUmlQUDR3?=
 =?utf-8?B?bjN4bjhrYTV3cXVIa1ZOZ0NTbmNJWnQvcnk2dWpqSVd0Rlh0K2VMZ1pKT3dW?=
 =?utf-8?B?aXhSS1VEaERBSUdMZUMwWmcvb0FGM2VZSHFTQ3hyeHpMSDk2dGJ2QnNyYzlw?=
 =?utf-8?B?ZW4xbzRmbWlGTUpsMFUwSXQ5YTBZQ2tSbXZEQjFaeG1CakF1TGxUVWZsUmxP?=
 =?utf-8?B?djh3Q2V4M3JCUjh6WXdZQnhPSG9QajhSemQxU3ZHbzRiT0pUb1U5NDV4Q2lp?=
 =?utf-8?B?L2dLRHkyeVB1bEVkckI1OFRrRXNCN2ZJZWptb2Nvdkd3Y1BybUVqOXhPSXF0?=
 =?utf-8?B?b1crUkpYa3U5SzkyZEliTVlzR3NicXBPYkU2SEE5Y2JKRzhyTVpPNVMwdzRJ?=
 =?utf-8?B?eUluQlpNQWE3Q3RTRU9hdkJ4VWI3Y0wraUVSRzBGZnpabVdGcHFLaTljc3Fa?=
 =?utf-8?B?OXVuN0ErWDFYN0NCNTRKVWttU1JyK2JlM2RJUlhUaXVkZktFVzVYNGRnb3Fm?=
 =?utf-8?Q?NXrm9Mdke/f/Q0NTw0INswhZpeXdTDfQJfIdC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AC157D716EF2D4CAF91C227AD5EDFFE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 343c1256-4da9-4cb9-17bd-08da1ac02e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2022 07:03:13.5137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5QrcskfMFjN2Z+vsfhD8HHCjaTLm3EgcQmiXwNprBw79c1aIdtCvFSUsil0y3BH8fiifDhDaycUY/QWI/TWUZ70v5vyPvlJXCFr5xYikfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2589
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
Cc: Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@linux-m68k.org>,
 Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA0LzIwMjIgw6AgMDQ6MDgsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBG
aXggYnVpbGQgd2hlbiBSVENfQ0xBU1MgaXMgbm90IHNldC9lbmFibGVkLg0KPiBFbGltaW5hdGVz
IHRoZXNlIGJ1aWxkIGVycm9yczoNCj4gDQo+IG02OGstbGludXgtbGQ6IGRyaXZlcnMvbWFjaW50
b3NoL3ZpYS1wbXUubzogaW4gZnVuY3Rpb24gYHBtdV9zZXRfcnRjX3RpbWUnOg0KPiBkcml2ZXJz
L21hY2ludG9zaC92aWEtcG11LmM6MTc2OTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcnRjX3Rt
X3RvX3RpbWU2NCcNCj4gbTY4ay1saW51eC1sZDogZHJpdmVycy9tYWNpbnRvc2gvdmlhLWN1ZGEu
bzogaW4gZnVuY3Rpb24gYGN1ZGFfc2V0X3J0Y190aW1lJzoNCj4gZHJpdmVycy9tYWNpbnRvc2gv
dmlhLWN1ZGEuYzo3OTc6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJ0Y190bV90b190aW1lNjQn
DQoNCllvdSBkb24ndCBuZWVkIFJUQ19DTEFTUyBmb3IgdGhhdC4gQWxsIHlvdSBuZWVkIGlzIFJU
Q19MSUIgSSB0aGluay4NCg0KV2hhdCBhYm91dCBzZWxlY3RpbmcgUlRDX0xJQiBmcm9tIG02OGsg
S2NvbmZpZyBqdXN0IGxpa2UgcG93ZXJwYyBhbmQgYSANCmZldyBhcmNoaXRlY3R1cmVzIGRvID8N
Cg0KU2VlIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTgtcmMxL3NvdXJj
ZS9hcmNoL3Bvd2VycGMvS2NvbmZpZyNMMjY5DQoNCk90aGVyd2lzZSwgSSB0aGluayBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gbW92ZSAoYW5kIHJlbmFtZSkgDQpydGNfdG1fdG9fdGltZTY0KCkgaW50
byBrZXJuZWwvdGltZS90aW1lLmMgaW5zdGVhZCBvZiBvcGVuY29kaW5nIGl0IHR3aWNlLg0KDQpD
aHJpc3RvcGhlDQoNCg0KPiANCj4gRml4ZXM6IDA3OTJhMmM4ZTBiYiAoIm1hY2ludG9zaDogVXNl
IGNvbW1vbiBjb2RlIHRvIGFjY2VzcyBSVEMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPg0KPiBDYzogQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBr
ZXJuZWwuY3Jhc2hpbmcub3JnPg0KPiBDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFu
LmlkLmF1Pg0KPiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1Pg0KPiBDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+DQo+IENjOiBBcm5k
IEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiBDYzogRmlubiBUaGFpbiA8ZnRoYWluQGxpbnV4
LW02OGsub3JnPg0KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4NCj4gQ2M6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4NCj4gQ2M6IE5p
Y2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPg0KPiBDYzogbGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gLS0tDQo+ICAgZHJpdmVycy9tYWNpbnRvc2gvdmlhLWN1
ZGEuYyB8ICAgIDUgKysrKy0NCj4gICBkcml2ZXJzL21hY2ludG9zaC92aWEtcG11LmMgIHwgICAg
NSArKysrLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gLS0tIGEvZHJpdmVycy9tYWNpbnRvc2gvdmlhLWN1ZGEuYw0KPiArKysgYi9k
cml2ZXJzL21hY2ludG9zaC92aWEtY3VkYS5jDQo+IEBAIC03OTQsNyArNzk0LDEwIEBAIGludCBj
dWRhX3NldF9ydGNfdGltZShzdHJ1Y3QgcnRjX3RpbWUgKnQNCj4gICAJdTMyIG5vdzsNCj4gICAJ
c3RydWN0IGFkYl9yZXF1ZXN0IHJlcTsNCj4gICANCj4gLQlub3cgPSBsb3dlcl8zMl9iaXRzKHJ0
Y190bV90b190aW1lNjQodG0pICsgUlRDX09GRlNFVCk7DQo+ICsJbm93ID0gbG93ZXJfMzJfYml0
cyhta3RpbWU2NCgoKHVuc2lnbmVkIGludCl0bS0+dG1feWVhciArIDE5MDApLA0KPiArCQkJICAg
IHRtLT50bV9tb24gKyAxLCB0bS0+dG1fbWRheSwgdG0tPnRtX2hvdXIsDQo+ICsJCQkgICAgdG0t
PnRtX21pbiwgdG0tPnRtX3NlYykNCj4gKwkJCSAgICArIFJUQ19PRkZTRVQpOw0KPiAgIAlpZiAo
Y3VkYV9yZXF1ZXN0KCZyZXEsIE5VTEwsIDYsIENVREFfUEFDS0VULCBDVURBX1NFVF9USU1FLA0K
PiAgIAkgICAgICAgICAgICAgICAgIG5vdyA+PiAyNCwgbm93ID4+IDE2LCBub3cgPj4gOCwgbm93
KSA8IDApDQo+ICAgCQlyZXR1cm4gLUVOWElPOw0KPiAtLS0gYS9kcml2ZXJzL21hY2ludG9zaC92
aWEtcG11LmMNCj4gKysrIGIvZHJpdmVycy9tYWNpbnRvc2gvdmlhLXBtdS5jDQo+IEBAIC0xNzY2
LDcgKzE3NjYsMTAgQEAgaW50IHBtdV9zZXRfcnRjX3RpbWUoc3RydWN0IHJ0Y190aW1lICp0bQ0K
PiAgIAl1MzIgbm93Ow0KPiAgIAlzdHJ1Y3QgYWRiX3JlcXVlc3QgcmVxOw0KPiAgIA0KPiAtCW5v
dyA9IGxvd2VyXzMyX2JpdHMocnRjX3RtX3RvX3RpbWU2NCh0bSkgKyBSVENfT0ZGU0VUKTsNCj4g
Kwlub3cgPSBsb3dlcl8zMl9iaXRzKG1rdGltZTY0KCgodW5zaWduZWQgaW50KXRtLT50bV95ZWFy
ICsgMTkwMCksDQo+ICsJCQkgICAgdG0tPnRtX21vbiArIDEsIHRtLT50bV9tZGF5LCB0bS0+dG1f
aG91ciwNCj4gKwkJCSAgICB0bS0+dG1fbWluLCB0bS0+dG1fc2VjKQ0KPiArCQkJICAgICsgUlRD
X09GRlNFVCk7DQo+ICAgCWlmIChwbXVfcmVxdWVzdCgmcmVxLCBOVUxMLCA1LCBQTVVfU0VUX1JU
QywNCj4gICAJICAgICAgICAgICAgICAgIG5vdyA+PiAyNCwgbm93ID4+IDE2LCBub3cgPj4gOCwg
bm93KSA8IDApDQo+ICAgCQlyZXR1cm4gLUVOWElPOw==
