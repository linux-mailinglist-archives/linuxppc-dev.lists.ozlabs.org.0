Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 895254B1466
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 18:41:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvkZ01s6Bz3cT1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 04:41:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::604;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvkYQ03xtz3bVL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 04:40:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGUgKuaVXyvLWKVqwzAG1ompjyMfb1zcRvRjiMwfisroDmul6f00jd/wa+Bad8hq5onsmiTJ/eEkSVeEe5ZdHwkPJk/dwdvayhgIxWPfZFkoj3P1/iPU0+hG02f7/i3LM/n2vAqS84aTnaJ+hOAzITtR2N2bdOdkloSm/72BgVK64J9NxD5wNUPe3eI1ubDDCbnem/Vw7BjSCosdigI4rYidxcuNtvpSGYI7pzKIWVfWqDT8dKGJGOL/kGz6aNIwvSBkoxJizCSJ14BN9m5GFoZB59ivePmPuJkZUdR6jiBzIp0pQqCF3b3ElmeXK1lvqWe18aOov9VFRbML2aL+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw4Sn6oQupcnvIgJxgQUfP3FXpiZ4s6pu038qbonK0Q=;
 b=TH1+m9kR3jzm14eKMQzCEij5HxAZ1g0DK6h4lWdpXo0SGFsV8iqbANAfLB4Up8/d4SqqgjhdgSRBoD31gbHLUAdIuVCXSB9+b2KnUpMWU8ykpcs+3fToGv6JndaH8xubj3pKRw4JtpP5fY3rTkYEXk4N5SjUhIZX0eff/g5D+sY4BoPanfloU781o3SEASQASVyBPXoUd9hCGqAVhPMSia/HwBljYl+nCFglv5FUyxaaJNVqfi+BplClHPmqTHCTUwtw8X2q3PhbZbHRU2aChAGdoCICieFPWi8yq1JrIl5S8fD+Ki5NXoT6f04MfAmcNGy9F2F8haFhRnNV03tpjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3850.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 17:40:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 17:40:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anders Roxell <anders.roxell@linaro.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/lib/sstep: fix 'ptesync' build error
Thread-Topic: [PATCH] powerpc/lib/sstep: fix 'ptesync' build error
Thread-Index: AQHYHnv/qTR3VtVzM0CZ/YB6171GbKyNDYwA
Date: Thu, 10 Feb 2022 17:40:15 +0000
Message-ID: <7fbbb7b3-9a57-c50b-937b-7c4efeeb158e@csgroup.eu>
References: <20220210124404.34773-1-anders.roxell@linaro.org>
In-Reply-To: <20220210124404.34773-1-anders.roxell@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5279fb6b-f45c-4d80-abe3-08d9ecbc65b5
x-ms-traffictypediagnostic: PAZP264MB3850:EE_
x-microsoft-antispam-prvs: <PAZP264MB3850D1A4D62C15052A34003EED2F9@PAZP264MB3850.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2FSH8dPJ0vfP8iIN+Q+v2iRtpP4Pc2l+UBF51chwUAsulFv1Oa69gVKAgsmwaHIYBj+3YqfKVc4xr+/9aYBgLj+5r/AUyOlZGE5jHbt/j6YsqNBecSsaUkV7fsv6h6WkAIMslqq211czbBrMa/FOJl0HFd7hnInuEvUQNgxP2ebfkiiNsTn9mmMRLBlH5uBc3XmJfgi6MnL6eROq13V8vc5huQsbpJdYJtKSe7JDMFIFagCEWjRxsMqNncKku+IE/DiMoSnSDMCfXDDrbi6qgrztqkc7A5ZC38ILbVQFcUGhIxyIEu5xgyJm5vNb7YOkqVFlAO29Z2j+ljdnY60xRbPXKs1Fr7KAX4RQAMEPtyP7FHxfx39wDZIye3WK+0wafP/ByiqGHGt0d0qMpR1Wyu/t6zh/tBJz8YysOMDD33baYnU631RpOVIjxJgwhGo/xfcKFkQa0/P2xoE0bUhFlQeIm5tGpa/jGfJUVS0IHReVnVd2NaCmEdkYrDOXHRQxS2HTptqvJoBCgxAtlscua7kRNf0KJRLFxavSIJ5rFIF4UfQiZmobVvJVL6MerpeMv4C04pCSmTuWrC+jl+D1n4OeqavHhZKaqf7rGmDorJCjvMPtCSWyaTVZ+agIRPewTbYI45isy7PDy/Ad2v87FC7vZhsaxH6iCP2Oc3Wm/icBWGwDUX9iPekCD80T9HeOeFYPlpm4Y6pYvDqZvkMqNmcbaEPvtWSFy99+ryrrJicmenjt5FQA0QSSVFTHxBtc1JI8i0uHWfK4c2DJdwl3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(38070700005)(186003)(508600001)(6486002)(66574015)(38100700002)(31686004)(44832011)(5660300002)(2906002)(122000001)(2616005)(71200400001)(8936002)(110136005)(54906003)(316002)(6512007)(8676002)(31696002)(64756008)(76116006)(66446008)(91956017)(66946007)(66556008)(66476007)(83380400001)(36756003)(6506007)(4326008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkNYSnhOZEpNUnRmZnVxcTUrTEhNbnI5TWlCcUV4TnFzaFBKaCtLVVptT25r?=
 =?utf-8?B?WnZCUk92RW8vMGR3V1ZnQkYxeENWbXZFUWdtMGpCTW1sTEVPTTNucmFMR3BQ?=
 =?utf-8?B?bVFZTUtiaVlnWEhPNDdKdlEwMk9qbm4zSTRYWXZ6UnQ2Ry9BdWtZd3g1TVY1?=
 =?utf-8?B?QkNrUjVPa0FyQlRmZDZVQTYxQy9qZnZvQlFxa3prTEJsejFEdGlJVWE0SDJs?=
 =?utf-8?B?K3Z5NFhZSjVOKzRTYjJJMytLOTM2SC9TSEVCazBqNmVVeTBFSWduSi8xNkl4?=
 =?utf-8?B?azVJOENWVlArTzR2b3VYcUhaYUhicEpxTFJScDV2OXY5N3ZMclU3amM5WEFa?=
 =?utf-8?B?dDEzcGYxOTRBZENOaXQwN3JhY0I2TUlrVnNnMWl0RUhmYVZHcmcyMEdHUUo5?=
 =?utf-8?B?NWdqdUxHV0ZNcExBdk5FQ2l5dWpVTWlDL0lVcTlOcVlDY2F0S2VtRFh4eDNC?=
 =?utf-8?B?ZGNaclFxcHJqYnloQ1p4dVU3d2g0VDlQME5iaENPQndaV0tDM1Vub2J0TlhW?=
 =?utf-8?B?c2pSei9waVNBNWx4alhuTWxVMGVnOVhYc2N0MWR3VlBjVXM2cGhBa2N5Mm9l?=
 =?utf-8?B?dmM3MGZvNTM5Q2tSVnQyQ012Vm8ra1o1VmN0MmZaMjhGd01kU0prQ2ZqSE5H?=
 =?utf-8?B?c2Vqc0xVbldGWVJYSHRTbkZXaDd0UU9XRmx6ME5ObWdXMldCK1dMNlNVK0t0?=
 =?utf-8?B?Qm5ydEVJQ25JL0hLa1VVS2k2ckdPWU52ZW04cktxcFkzUTg4NlBveEVwWTRk?=
 =?utf-8?B?ZHNxSUZzRlBkYmozTzdQY1NWSFpqakN2S0dDbTdBL05aSmZmeGxXUHUzSG5s?=
 =?utf-8?B?Q0FTNU9rWXZBMGZ0NlhEdGZ6VVEyTlF1TGZPUUFmK2NHSGQ5UFFhZThvMXFO?=
 =?utf-8?B?d01ER1VUamoxNVAzNENmUmh5dzNORlViY09kbG9NajdjSmF2ZU1ZVHRlSnJN?=
 =?utf-8?B?WGlmcU9GWTAzS2RvcmgyZGkzN2hQVGhpem9OOUlwUWR1K1kzWCtKOEtHN3d6?=
 =?utf-8?B?eGlvZkwzd05iUXgzMHRxVTRVYnhWc2ZQTTVvbWl4Y2hUQnF0VWFhYUhQTDFt?=
 =?utf-8?B?MUJtcTR0ZEVXTWRha1RlSUJUcVU5Y1hvaHVoUnYxREpjcnVZbUdqOFJMd1JE?=
 =?utf-8?B?elFwMlliZzh6OUNaU0x2Tk1DL2ludlYyWllkN0hFK2lmL0pIbEpCV0ZRS2VT?=
 =?utf-8?B?Y2QwcHppMWNCUHdDbjFOOHhhSDhuYzZZaHlwMDhEODJDS2tWMzZjUzc2Zmxh?=
 =?utf-8?B?NHFQNXpXd0taRFFDcHQ2Q3kzeldKU0NZV1lCK09WTmNWejFjeU9aajM3T2Jo?=
 =?utf-8?B?ajhQckx0cFhaMmdYSElhOXQ3Qms5TUtua3VpWFk4YXZVZEgzVVhXMGI3TjdP?=
 =?utf-8?B?WXFqZnpuTDFRNHFVK0psRU45dG5mbDhVYnhjMFJIb2FxMEJ1VTNhQmljY0tz?=
 =?utf-8?B?eFpWTERYOHFwdGExWk5rSjBjQW1WYkI3V0ozWUFjL29Ga2dDNlFDV3UxTjdR?=
 =?utf-8?B?eTA4TVZQZXo0NHc5VW8zL3QxSGs2U1NlaE1IMm5FNUROa1lYWmxzL3o3aWdK?=
 =?utf-8?B?Yi9lc29ZS1JJK1BQL214SHRaYXRMTWpmU1N1aXBhbmk1V3RyZEpNWklUNE5N?=
 =?utf-8?B?ZDZLaGZjaGdOVm9OUkF6Z0ErVmYzbVVyRGp2clFlZ1ZydndXRTc0VlZiRFU5?=
 =?utf-8?B?czlueHg3b2trbFlLVVZHeTBDUXlDaklFNlBaV3RWSUtsT1c4QlpiaUpJbHg3?=
 =?utf-8?B?WTN5eDNGRFBsUWFrZEdDZnNiQVhKQW5nakRVN09kS0lrSjJsVmFzMXFZL0Zo?=
 =?utf-8?B?M1VhZ0pzOXdOR3JkMm5XdmhrNjhIZS80UVZ4bFRXYkdaN09aUWJaOGFES3Yw?=
 =?utf-8?B?eEhmcjE4d0hYckR3OWd6aWNzMlV0b081OENwaXIrZ21McCs5MStIRUdZT2t4?=
 =?utf-8?B?NjhZWGtzbnBZbmhmaHdUQnhzSG01YmcvNnIyWk9GR2lDNFQxMERYZVpUeUZP?=
 =?utf-8?B?ZlFmaSt5cGpHSGN4YWFoeWlUMktDclkzamJONWoxODdVNnplTkpIT3k2TGxK?=
 =?utf-8?B?QnJOMkZybEl1K2JUY25Tb0IveEVSZldtT1ZSZWV2WUNOam55c2YxbWdRY0lY?=
 =?utf-8?B?UmcrUjh3NVJucFduZGwvSlkySStIZnZweFlqUVp1MnE4UkZjMTEyUy80cmdo?=
 =?utf-8?B?ckxERkJHcTlYbHpTdTliWEtibUZRV0hPcjh0aWFBMzg1SGNUYlNsOVY3NXZ2?=
 =?utf-8?Q?HJasq/De/YzvTLeN6uIR3osSHi0od4ssn/ZRaLSOUk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9984B59EE6CF9444934BE915EB26D925@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5279fb6b-f45c-4d80-abe3-08d9ecbc65b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 17:40:15.3265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esXGB3YKv0530fJu7D/330+FW0fh5nGKHPTjwLNBLBy4xFnAwnDYvOTvFHOJJ4KsAoiTWshj2dF+DqVyn7D+BomgSWovx9WPi/SQCiZ8tAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3850
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzAyLzIwMjIgw6AgMTM6NDQsIEFuZGVycyBSb3hlbGwgYSDDqWNyaXTCoDoNCj4g
QnVpbGRpbmcgdGlueWNvbmZpZyB3aXRoIGdjYyAoRGViaWFuIDExLjIuMC0xNikgYW5kIGFzc2Vt
YmxlciAoRGViaWFuDQo+IDIuMzcuOTAuMjAyMjAyMDcpIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJy
b3Igc2hvd3MgdXA6DQo+IA0KPiB7c3RhbmRhcmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6
DQo+IHtzdGFuZGFyZCBpbnB1dH06MjA4ODogRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGU6IGBw
dGVzeW5jJw0KPiBtYWtlWzNdOiAqKiogWy9idWlsZHMvbGludXgvc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDoyODc6IGFyY2gvcG93ZXJwYy9saWIvc3N0ZXAub10gRXJyb3IgMQ0KPiANCj4gUmUtYWRk
IHRoZSBpZmRlZiBfX3Bvd2VycGM2NF9fIGFyb3VuZCB0aGUgJ3B0ZXN5bmMnIGluIGZ1bmN0aW9u
DQo+ICdlbXVsYXRlX3VwZGF0ZV9yZWdzKCknIHRvIGxpa2UgaXQgaXMgaW4gJ2FuYWx5c2VfaW5z
dHIoKScuIFNpbmNlIGl0IGxvb2tzIGxpa2UNCj4gaXQgZ290IGRyb3BwZWQgaW5hZHZlcnRlbnRs
eSBieSBjb21taXQgM2NkZmNiZmQzMmI5ICgicG93ZXJwYzogQ2hhbmdlDQo+IGFuYWx5c2VfaW5z
dHIgc28gaXQgZG9lc24ndCBtb2RpZnkgKnJlZ3MiKS4NCj4gDQo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnICMgdjQuMTQrDQo+IEZpeGVzOiAzY2RmY2JmZDMyYjkgKCJwb3dlcnBjOiBDaGFu
Z2UgYW5hbHlzZV9pbnN0ciBzbyBpdCBkb2Vzbid0IG1vZGlmeSAqcmVncyIpDQo+IFN1Z2dlc3Rl
ZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gU2lnbmVkLW9mZi1ieTogQW5k
ZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBhcmNoL3Bv
d2VycGMvbGliL3NzdGVwLmMgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9saWIvc3N0ZXAuYyBiL2FyY2gv
cG93ZXJwYy9saWIvc3N0ZXAuYw0KPiBpbmRleCBhOTRiMGNkMGJkYzUuLmQyMzc3MmY5MWEzNiAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9zc3RlcC5jDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9saWIvc3N0ZXAuYw0KPiBAQCAtMzI2NCwxMiArMzI2NCwxNCBAQCB2b2lkIGVtdWxhdGVf
dXBkYXRlX3JlZ3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnN0cnVjdGlvbl9vcCAq
b3ApDQo+ICAgCQljYXNlIEJBUlJJRVJfRUlFSU86DQo+ICAgCQkJZWllaW8oKTsNCj4gICAJCQli
cmVhazsNCj4gKyNpZmRlZiBfX3Bvd2VycGM2NF9fDQoNClNob3VsZCBiZSBDT05GSUdfUFBDNjQg
aW5zdGVhZCBvZiBfX3Bvd2VycGM2NF9fDQoNCg0KPiAgIAkJY2FzZSBCQVJSSUVSX0xXU1lOQzoN
Cj4gICAJCQlhc20gdm9sYXRpbGUoImx3c3luYyIgOiA6IDogIm1lbW9yeSIpOw0KPiAgIAkJCWJy
ZWFrOw0KPiAgIAkJY2FzZSBCQVJSSUVSX1BURVNZTkM6DQo+ICAgCQkJYXNtIHZvbGF0aWxlKCJw
dGVzeW5jIiA6IDogOiAibWVtb3J5Iik7DQo+ICAgCQkJYnJlYWs7DQo+ICsjZW5kaWYNCj4gICAJ
CX0NCj4gICAJCWJyZWFrOw0KPiAgIA==
