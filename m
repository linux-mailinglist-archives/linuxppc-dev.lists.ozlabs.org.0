Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EBC4E2127
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 08:20:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMQxK41G1z3bZh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 18:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::629;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMQwr6Lkwz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 18:19:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYefm28foBvKGGpfuD+nQ7ZySRP2EHWWdLbRrJfTgnHDcdR10Tm7qIwcU5lwgeZ6zTwgnn/4Jd5VyLBdy7tViTNpnk+kr1DkFfNOi6Xc6YHGLcvfgNhu4ggtPmFD2ZJEX8bh0xIaign7VLcEcuWsCYO9/SzUFkK7UxMJTJTCNfEI93Bav4SxttXabtsMovvybRlYZa0WHcIG42j9NU1Lst9X5rs3+iTrXg5/mVdugcTJ6og4EcreJtZ/Hds6Fn/5MECuhSa8j35rU97HNuO0kvx0dR4OTiZysUlk7j9mq5jxPIP6YX1uiMUpMkd7q9I9sTQ77Vt2ZQT/GZwOpEURYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3hOT6iVFhTc6kcOEzi/Kmj8mAP5Ty6/XJHIBQ926l8=;
 b=g2exwe0ATh+V+wY0OGENBJR3GDARezoWO27d81GWTfabq6dpTcoC2fq/jlhNU6gBkqQf9ZC/bBsRQQRq2jlbRXaM7wGSH9BTRjRgSUH6PIs1qmxtLZEz0wQJVSTVIRaAHheW42LYmZzjral27cl/Atnvykickm0ij2UF8TIVwwL7hGREfxny8iPTY2KpnRoYppat8h98t1g1+J4LaWzeAB+Bqrr/oN73ePxawMXgSnmJ47ljTjM1mIFqIeS9Hq7kwGtVXDoufDSQ+RieCRMbM4prYgaDNXRu4AnWGIcBBq2Qx6UwwmLfA5Y/tJ2/e5oNRhlnat4LJoyK+vw+O6o3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1796.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 07:19:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 07:19:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Meng Tang <tangmeng@uniontech.com>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "shengjiu.wang@gmail.com"
 <shengjiu.wang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, 
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Thread-Topic: [PATCH v2] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Thread-Index: AQHYPPE89zXVZC4UwUqhDGdlYkZV26zJbhOA
Date: Mon, 21 Mar 2022 07:19:19 +0000
Message-ID: <baf5e846-baef-dd51-c115-f900b37e8c82@csgroup.eu>
References: <20220321065754.18307-1-tangmeng@uniontech.com>
In-Reply-To: <20220321065754.18307-1-tangmeng@uniontech.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c49896b9-1414-402b-692c-08da0b0b1dcd
x-ms-traffictypediagnostic: MR1P264MB1796:EE_
x-microsoft-antispam-prvs: <MR1P264MB179600773142E5A358326BD0ED169@MR1P264MB1796.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L2mCFe3T41iK80jT3H/DxIk3gyR5NxKfqnlTROkPsFbLaYJsSMuDoBxTAztSR69wkqKteR08hsmzA5hpPCE/b9hgkWQqyBOPUh05unxym7mmnXBpoAFWhMeleR7Bmiirmp8uatEFihCxxqs1PLe2JOf84Wy9Ull3Sjfj7XPKG5cuBSE5rFsdgXkFe2TKvdb6KHKb0zoAQRA1iLacsbLnMDrjE6+KN/7YvEi4AchlSw2s7L7RaLwH7dK0+8ItBg92nnWgIpOLRPJ6/hOfJLysuCfhlWu/P8Ibqto3kl4aV667VNUsEJiqVKQbmodGy4YWm4E8X9Akzi1rrBxUV9zl0KAwb2WfLTMhdDDcAlLCOznnleex6CL7j8vXq171h35gk54rjaUudMpyX0iSEvjv97lB5vIKwPAfC4t5kQjtVeW6Foi90yaI8cpBuwGiC76a4sFu8nCXGAE4MbZmuRvmkLT0w2lkc6OiRQKJ4atshFcrlj05xVQ2pLwnQwYu2YEs2wpAk72VM4sXot45LvoBkH0+T6X1k1a2CkqZSKhm1NfthGmsn1eKGWA5nsfcOWyhd/SX6dynO+JbG+EHfZrWMqEBqBHyDTFxNZukgFAWW1n28BSdpfw1HGRE/oj0JFdYBaE8mREhoqhKAIsD8RdXXNbf0kpBtA54QFwircrq6L+0tWcExjTW2MEjo7h9Rl5ZePqD/ISe1D8b7DyFw+EwmvnH+Y4aKWsMcjHYcqtWcZfS8uJZ1hIuFZY3zG0QIC4y5onW6XXsd2GmB/vmeTxZ2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(91956017)(31686004)(8676002)(66946007)(76116006)(2616005)(66556008)(66476007)(66446008)(64756008)(36756003)(508600001)(122000001)(54906003)(6486002)(38100700002)(38070700005)(8936002)(44832011)(5660300002)(83380400001)(316002)(26005)(186003)(31696002)(71200400001)(86362001)(2906002)(110136005)(6506007)(6512007)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3Z4b1p3YjdyNFJNRk5Oc2JaeFRQTkxPQVdnc3hoaGdBeGxmWExnL05QU1Fs?=
 =?utf-8?B?eXRaVHpETWU1WU9VcFAxUDQ4eUFmM1hZcVZCbDVoU2pvMWFhRWF5SmlPZWFP?=
 =?utf-8?B?U1ROT1NYU3N4Q1l4Q0VNU2ZVQnRRUUFrUVJLejgyb2lKUGJMUjFHdEVuWG9J?=
 =?utf-8?B?ckEzb1JvZUh1R3RNdlc1amd3bFlkbk5maWpqQXNIcWtXZHA2Z1FkZWZFNzh6?=
 =?utf-8?B?MDVsL2x5SUJ6OFNzQTIxWi9VaE9hUG9UTnA4WWdaOW5mTFRnYkQ4eFFSQ0Vq?=
 =?utf-8?B?d2J2QzdXTUxQeVJwRFY1VzE3eXNUU1pzWkZzY0xzamlvSzJCRnhhUThaNHJD?=
 =?utf-8?B?ak5GMUMyb1lVbTdGZ2NyMG5zck44WVJDVWxYcDJMYzdlVFpMQ2VSWWRselVD?=
 =?utf-8?B?K3FJM1hJalhRRTlTNEhkZTI2Q1Zzcnoyb2g4VCtXVHlaaXlkUjRSTkY3TG9S?=
 =?utf-8?B?RUpnNkpieTVRMjN4bW93dlNjZFREcks1RFMwWGFrWWV5Nm4wQ2xVR09VS0xL?=
 =?utf-8?B?LzAzdmJGN0VTdEprZGp1cmFSM1ZxdHp3eE83Y3p0TnJPajVZUTA5amtkakxR?=
 =?utf-8?B?TEpHbmFDTzZpbUZldUhua0tRUGNJOURRUldIYmJYVitCWjFzVW5UcmNGcitP?=
 =?utf-8?B?bWp0bEJoTGRkTjdRbHZXNjVPTEdBaENLTVFYMUk5RTk3Q1lYTGJNS0dncFR2?=
 =?utf-8?B?RUxoMS9nNW56TGxtbFE5dW91TGE1Snc1ajlmbVhPS2Y3dUZlelBTUWRMS1d1?=
 =?utf-8?B?OVlPRHVXZndBNTVIV2ZUZlNRUkpvVm51TjQvN01Jbyt4S2NKTG1NZy9nRE5l?=
 =?utf-8?B?NzFjZWN3alpVU3h5TGdlRi9EOWRWZ3IzdEZIYkdqSElaTG8ybGJxVkhySXY4?=
 =?utf-8?B?UmFaMVh6QVNYS3RHb2hvajcvSzN5WDEzSDJzeHNiZ0UwMmtrU2VwVFJ3OFZ0?=
 =?utf-8?B?ZnZIOGdpRzA0TTNqcDdtSitneWl5Znc3OUNMUEd4RzN2b1VNSFp0UXNyU21O?=
 =?utf-8?B?TDVSWEZXekRzUkorNGRsZTRobDYyZkNaNElnOVgzRGd4TmhtOWFrK285ZUNn?=
 =?utf-8?B?OWk4eVhocC9STHhOZlJFU3phcXZtM1RFN3ZaR2Ireit4ZTIvZXBFYkk2S1JJ?=
 =?utf-8?B?QkFpM1lONmFmOFRvc1NQajgyZE9tZUM0aXRjNElScDcxdFR4eFRtRVVpM0Nl?=
 =?utf-8?B?Uk5yNUhORkpRSEdlZEpTRmk0a3JLT2hFQllQTGM4dWVxMUVFMlRkMDlXQU1k?=
 =?utf-8?B?bDMySFcxR2l0SlZOK2Q3UG0wZCtOYUpFcVlmbTB3WDZ4MGtFeVkrNy9CMHo1?=
 =?utf-8?B?OEVBZTlnbTVwT1VSbS9aQnRNUmgvbWQrUDRyUzRYTGw1dDZYdW9LVmFSTm94?=
 =?utf-8?B?QVJqRkVDOTQ3TWp1SktCTncvKzA4b1krbFZ5c1JPM3RHRk5IUVpYblVwYXRX?=
 =?utf-8?B?c2I1V2VyN3BOVlRkTmN5TVVUaGFxTHZoaHJVMnFwanlJMDZvWWFRZWJ3N25U?=
 =?utf-8?B?NDhhdUdOOEp3YjBSaWd5Yk9iT09RT1REdXZ5TGhneXZMOEVmNVdzTlFYMmQ2?=
 =?utf-8?B?SVJpRlR3aHpVZmRhNlJ3T3FDeGFmQzUxZllDT3h0RWl5MGIybUxUVm1rMlhq?=
 =?utf-8?B?YUZybkUwNE1PdTE4Y0p0SWRHallQOEd3WmxLSStJMlZsOFN0Zzk0RmY3dkNV?=
 =?utf-8?B?eFg3VFF6ZXBtWXpCZ2xsT0I0Mm1iZVZuNE1TWlpUVjVoMFNGb3ZFai9nd081?=
 =?utf-8?B?TmVGdmc2bEZHeGpuRXB6TFFxL1NsN0xHRC9sbjhaelpoejdVWDJVeHN2aC8x?=
 =?utf-8?B?Q3gwemhodTBmTnZnYU5aTW9TZndDVUNyZHUwZ0FONnR0ZEVTK1hKK0U4NWIz?=
 =?utf-8?B?eVpWRHpuQXlnTU5aaHdDbEhuRFFhN1JYVzBtRmJiekFUak1MUjRqUXY4WVor?=
 =?utf-8?B?SWtzRU1UbGdyeWlxc0dGd0Rja0pzZnFCdGxiL2VrK0xmWDQvNmlGVlZmRFdj?=
 =?utf-8?Q?n0hsKAygKr43WBB4oLWYgCFBrWJNes=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5210D198BCBDEB49B07502DB1CCC5738@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c49896b9-1414-402b-692c-08da0b0b1dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 07:19:19.7955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCiH+OUpOaRZlwskzPUKj3UlpSCgrvqwTMrqsfF9CP/cl52aQvprcezjGDp92JIGP0Om9jsdHiKsjYpTyYcR12OnjaRegrUCtup25vi17AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1796
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDc6NTcsIE1lbmcgVGFuZyBhIMOpY3JpdMKgOg0KPiBUb2Rh
eSwgaHBfamFja19ldmVudCBhbmQgbWljX2phY2tfZXZlbnQgYWx3YXlzIHJldHVybiAwLiBIb3dl
dmVyLA0KPiBzbmRfc29jX2RhcG1fZGlzYWJsZV9waW4gYW5kIHNuZF9zb2NfZGFwbV9lbmFibGVf
cGluIG1heSByZXR1cm4gYQ0KPiBub24temVybyB2YWx1ZSwgdGhpcyB3aWxsIGNhdXNlIHRoZSB1
c2VyIHdobyBjYWxsaW5nIGhwX2phY2tfZXZlbnQNCj4gYW5kIG1pY19qYWNrX2V2ZW50IGRvbid0
IGtub3cgd2hldGhlciB0aGUgb3BlcmF0aW9uIHdhcyByZWFsbHkNCj4gc3VjY2Vzc2Z1bGx5Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTWVuZyBUYW5nIDx0YW5nbWVuZ0B1bmlvbnRlY2guY29tPg0K
DQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1Pg0KDQo+IC0tLQ0KPiAgIHNvdW5kL3NvYy9mc2wvZnNsLWFzb2MtY2FyZC5jIHwgMTIgKysr
Ky0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2ZzbC1hc29jLWNhcmQuYyBi
L3NvdW5kL3NvYy9mc2wvZnNsLWFzb2MtY2FyZC5jDQo+IGluZGV4IDM3MGJjNzkwYzZiYS4uZDlh
MGQ0NzY4YzRkIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvZnNsL2ZzbC1hc29jLWNhcmQuYw0K
PiArKysgYi9zb3VuZC9zb2MvZnNsL2ZzbC1hc29jLWNhcmQuYw0KPiBAQCAtNDYyLDExICs0NjIs
OSBAQCBzdGF0aWMgaW50IGhwX2phY2tfZXZlbnQoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwg
dW5zaWduZWQgbG9uZyBldmVudCwNCj4gICANCj4gICAJaWYgKGV2ZW50ICYgU05EX0pBQ0tfSEVB
RFBIT05FKQ0KPiAgIAkJLyogRGlzYWJsZSBzcGVha2VyIGlmIGhlYWRwaG9uZSBpcyBwbHVnZ2Vk
IGluICovDQo+IC0JCXNuZF9zb2NfZGFwbV9kaXNhYmxlX3BpbihkYXBtLCAiRXh0IFNwayIpOw0K
PiArCQlyZXR1cm4gc25kX3NvY19kYXBtX2Rpc2FibGVfcGluKGRhcG0sICJFeHQgU3BrIik7DQo+
ICAgCWVsc2UNCj4gLQkJc25kX3NvY19kYXBtX2VuYWJsZV9waW4oZGFwbSwgIkV4dCBTcGsiKTsN
Cj4gLQ0KPiAtCXJldHVybiAwOw0KPiArCQlyZXR1cm4gc25kX3NvY19kYXBtX2VuYWJsZV9waW4o
ZGFwbSwgIkV4dCBTcGsiKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBub3RpZmll
cl9ibG9jayBocF9qYWNrX25iID0gew0KPiBAQCAtNDgxLDExICs0NzksOSBAQCBzdGF0aWMgaW50
IG1pY19qYWNrX2V2ZW50KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIHVuc2lnbmVkIGxvbmcg
ZXZlbnQsDQo+ICAgDQo+ICAgCWlmIChldmVudCAmIFNORF9KQUNLX01JQ1JPUEhPTkUpDQo+ICAg
CQkvKiBEaXNhYmxlIGRtaWMgaWYgbWljcm9waG9uZSBpcyBwbHVnZ2VkIGluICovDQo+IC0JCXNu
ZF9zb2NfZGFwbV9kaXNhYmxlX3BpbihkYXBtLCAiRE1JQyIpOw0KPiArCQlyZXR1cm4gc25kX3Nv
Y19kYXBtX2Rpc2FibGVfcGluKGRhcG0sICJETUlDIik7DQo+ICAgCWVsc2UNCj4gLQkJc25kX3Nv
Y19kYXBtX2VuYWJsZV9waW4oZGFwbSwgIkRNSUMiKTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAr
CQlyZXR1cm4gc25kX3NvY19kYXBtX2VuYWJsZV9waW4oZGFwbSwgIkRNSUMiKTsNCj4gICB9DQo+
ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayBtaWNfamFja19uYiA9IHs=
