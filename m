Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D04E20AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 07:45:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMQ9d4ZTwz3bYf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 17:45:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMQ990Rqbz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 17:45:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayFVgdjCZqAWUOpFf1jy53iUOjAJ0gOBuQHP2oVRSNW8Bt8Z3FedagnIEV9crgVFua4aRh/ywiBN+LrOFpVNE79IPdyaxnjnkGTXiNSEzyXUyNghtYki1n85x5ELk6xBQl58qcIEfBHA40dF6OODR17LYh4Ib5VbZaE/Ttsi2WnwAQulV0q4D7MpcuGWmd9htPJCB+18+FJWcb0e3Yz+8u262YzQzd7lm46aOYt0DAvomI9/oP5N2qLOqhfUQK7KjAbX3RmSBPyCMOEQts8KViCHuHeEho7gvXbHRhxzwE81yOaOsNeZydiCung8keDeTsq1tGyjR6orGB+7Ds08+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm1LEUz5FjhdFv/fnuq2oDL6gtN00yZjZr5OSPZ7DgY=;
 b=oB0+LWUO4FaDzVrZD4CPe+RxxYra/vehKm0uzuK8enToYO41BkzsiKiDlp4ZLBQ6vzz//8ZQOg2A8D0k94X47QaWF9Pxz67Eq3GgSHBClnR9elfk+64j3+5uwQGOJpz1Pq07TCpbT6N4Rf4dWTtwug2R7r9yzQhsrMiWPp+ZCRu6uup50x4P/54NPxwILv3mz/b2EZxQ0SfWF26l+ieUMRhDTabZOGUhD13Kjb/QVo37PIxsIIPYlXDw9LqNTrXnaIeeyWZu55to9k3xudP0ADn6aEydmRCs3xkiBlNNU5QFzREC8ywh2t/nXHE6MLKbaJYbROoFF4ZrgLXIssG07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3678.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:185::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Mon, 21 Mar
 2022 06:44:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 06:44:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Meng Tang <tangmeng@uniontech.com>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "shengjiu.wang@gmail.com"
 <shengjiu.wang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, 
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Thread-Topic: [PATCH] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Thread-Index: AQHYOqvBzLFyXfTTU06JJla+IZPstqzJaQAA
Date: Mon, 21 Mar 2022 06:44:54 +0000
Message-ID: <951b1a57-99d7-caaf-2bf4-7a308a6ff3a8@csgroup.eu>
References: <20220318093536.15385-1-tangmeng@uniontech.com>
In-Reply-To: <20220318093536.15385-1-tangmeng@uniontech.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13fb7fd3-9beb-4321-743c-08da0b064ef5
x-ms-traffictypediagnostic: PR1P264MB3678:EE_
x-microsoft-antispam-prvs: <PR1P264MB36789CEDD5615A8EBD6C30DDED169@PR1P264MB3678.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZhYoys+xn0SGnu539mQ4FDdVa5xmTd77tqCAUGo/Uh5Jn0Wf6N6YrKaRGL48Ydy7WAkXQYCmQ0xs+svutKNAP3dCiXJ+vhdc9AEpIX09V9plCAw7XbIZG40SsflmEOSgDvpa21BdcixQL0AFamNWMKqhoG40QJCj4TGTIkz9qcBHgsoGOJWEvvBxZAxdyvM4dEh5H3o6jGLrIj1tpsjCKKr3Il+pIiDpk6MWnitNk6p5baZu4I749c3+fyovFKiv0OQC9d2ZBiu1aHBI+mwOMETIMjRlHyHbpS9CqjjAmqLlGMH56Vh9RCeccP3XJAz4Z37b4u5cx7FdzH6xhcLbwf1UrD9lm1s9okKYvgMv66dQqCFx8JRN9uRXKFXSLMTKIlLvK9f4jucwpWp8jy+D9JezN/zdJVYLN3doxzhRGoex8ToxDKZQmTfLVSdaazcjGaGIATDUXqmUmg0OdvtHcQV2wHVk/Hip8v/yixCBDlZGrPxlikI6zfzsQ6JVBveHlOpehVCeumNbLCJIB9Za9uk1pZlRVhEXEXOtdsF/W8TvatHDfYHfBpM4Vd9cO3uIQJdNhxeyLkOzkqEG2LZi2wlVMM99BbpGfLTiRrfnX0kNe8Wl0ymuqgxU6vwfYM3WBa5lyzbfzXoHXOw3y1iLlY1XjwJfUJAicQuJun+b0w4Orq0kSA0oRaEz44/X4Y4LS7DbEoD5sbW7Q+XzKBVAVGimqB9OakmeDINbCRsW3cvqefnHoF9zxN/Rx7o6FoKgmt6lOscLXCVsZpoqBDDT5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(83380400001)(316002)(31686004)(110136005)(8676002)(4326008)(66476007)(66556008)(54906003)(6486002)(71200400001)(66946007)(38070700005)(76116006)(36756003)(66446008)(64756008)(86362001)(2906002)(6512007)(508600001)(2616005)(8936002)(31696002)(38100700002)(122000001)(44832011)(7416002)(5660300002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE9Vdy8wdkl6bDB5Q1dvYkM2MHlVandESHVRVzJEK3ExZWJBempiVzZhYkF2?=
 =?utf-8?B?VEtSdE5pQlEyTThCdXBMQUd5bm45OXpNMHZ5Vk5wNkdzdWVRRFlzV0JVcjZE?=
 =?utf-8?B?QWhXUkVBbnRjY2d6M21ISmRBQ243RlVTVG1xbHNSZDhMYnJJajlDMWxGMWJt?=
 =?utf-8?B?SlkrdFhhbnJzczA2NHlHanVZTWhnZXdWeklkTWV0ZnExZkZsTzJkUEdHb2dt?=
 =?utf-8?B?Q0ZSdnJEQjdFeEQ2ZGVMa29ZV3p2VUJHcWN2clNCczRIbUtjdUxXc3NLSUY4?=
 =?utf-8?B?UWt4dXpLQ2ptazh1eDUxQlBYVUljZEJNNjZRdVYvMzVyT0I5R3ZMa3NDRWVp?=
 =?utf-8?B?bFViVG1QUmVzMG1ZaVpDL0paVy9kYXNxU0poVnNUZnNkeHZpckIyTlRUU2d2?=
 =?utf-8?B?OTlKcEZ1UVorallOL2JUY0NEdFVJdXFabk1tU2d2RUtXdVVkeVFPUWhOR1NB?=
 =?utf-8?B?QWhnanlyZGtCaTYydmNzc3hLOVNrVkR2RGM1RFB1emMyOXJLbUZvdk1ZdDlU?=
 =?utf-8?B?TFNFWXpGTVlZejZTWDg5UzkvQng0bThsTjNScVBPVVQ5cytrTEVOOXRSK0xL?=
 =?utf-8?B?VXRLYzI1ZTJQU2RXajNRalJSWTVJcVBDV1dqRTR1V1FhajlDK2lvSjZwT2dE?=
 =?utf-8?B?YkpPQnpPT01SbTRiK3czd0dmQlJwdjd2YWZRL2thV0FPelNic2t3WjE0MlJB?=
 =?utf-8?B?cDJObmw3K2hGQW91UzhWN1VEQWRacVhMRDg2VHdxT0Z0Rzd0N1Y4Qk9uU21H?=
 =?utf-8?B?WVRPcktUeW1jQ0NJc0h6c3VxOUlNZ2YwOXZJSDNaamRrYXRQbnhKNFdhci9o?=
 =?utf-8?B?NUFjRUNKbmxpUW1zNEZOTldaeWNCM0FRdEE0elc1RUtoVnJjL3htRzZPM3hs?=
 =?utf-8?B?ZjQyWmRBQzZib3Z0RkpWclRHS05RK0VsbnN0OTVFVHMxeVpSZzEwdnVCdVV2?=
 =?utf-8?B?ZFJaR2Z5Z2RGbk9xVis0QWhVaGw2amhJVGpqdDR1dkc0em1xRmdncitRV2xk?=
 =?utf-8?B?ZHpOelRYcDkrRkFNdWx5UmpNUll0TmhKdHFtdzBpbHNOK1E0cHNjb2tDbUVY?=
 =?utf-8?B?c1lqd2JGanR6eFZQUjNjNWJWVWtJNTBHYTlIMVp1dm9nTXJwcnczb0JyUDBQ?=
 =?utf-8?B?bDBFRDJxb3BicDArb3FwUDY2S0tTT3FZVjdyWmJaU0xrVnJYWHBHNG14NEVS?=
 =?utf-8?B?MDE0QjJpVTdQUjBocE5IWGRrekE4eFMvSitKN1hKME5hTk5vN3JRZy9pbUZO?=
 =?utf-8?B?eDc4OFd4Ti9FMXlLb2tSeDY1RENoWG93NCtNb1JON3JTQXdYOUJtS1hXSldM?=
 =?utf-8?B?Z1NZdHlsYkVkbGZUT05FSHFsNnpra2h4UkRyejFpTDIrdW1RcDExRUU4amhU?=
 =?utf-8?B?YXBHK1h0TExUWmVXYnhxNEJSQmp6MjV2U0gxT2RURjdnYTk2Y29UTGdPeENW?=
 =?utf-8?B?aWtkazRzdUdYcjhvMzkzZXF3SmlhUFNXOWJSMCswaUYyN2pPZnZtRGNmUHRD?=
 =?utf-8?B?cWRqbUlBWFlYUzhUaGx0NUNlTksxYUhUWVRBNjdzc3NQL1NOelVoaHM2RkIz?=
 =?utf-8?B?NHo0UkZZOHN0bGlxS0ZuSmk1Snp1bTFQWkdmaURyMlJJQ1A3UmRyNC9TaUVn?=
 =?utf-8?B?blRlVzMwT25WNm80TWJJUE1LeEtWQ24vTXozeFFKWXBoREVpTmJaUVdwSnd3?=
 =?utf-8?B?SmNUTWhwdy94Z00xY2xjZEFXSnVBTzZVcDVtby92a01aQ2R4MlFpV29lR1Mr?=
 =?utf-8?B?L1NRUDRybmlJQWc3dHFCSDVjU3FxOWVhMWhEbzZDc1lSbmprMXdMNFFveEV5?=
 =?utf-8?B?SFVLRWgxaFI0TXViNHdld3I0djdxZXozK1pSZUZ5YWs2WjdXVmdwNnA0N1hz?=
 =?utf-8?B?N1ZRdDFVTHFMdncyY2I3Q25JNzVwTUZ4V1Q3WWdmM0hGWWdHanpjM3lHaWtW?=
 =?utf-8?B?MlBIZGJMYXAzZ3E0c0tEYzh4TEZvdG1KdjJRUVBuS1N4R2ZVb1ZaQlA4blhS?=
 =?utf-8?Q?gBemH7nGdOSyB7JRW7Jvo2zRQzpRRk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ED349096337CC4D89F95480A3F3FE67@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fb7fd3-9beb-4321-743c-08da0b064ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 06:44:54.8139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EyT5eTVhrnPCB5wD1OfLxtwxXoyPGEY3P2ZozaL/ZHN75dra+WXxyFTLmJJR/Qn1CN38Aw1u0lA8Rh4YcIhdFy78iezwqaW+WE5aDKR5O7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3678
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

DQoNCkxlIDE4LzAzLzIwMjIgw6AgMTA6MzUsIE1lbmcgVGFuZyBhIMOpY3JpdMKgOg0KPiBUb2Rh
eSwgaHBfamFja19ldmVudCBhbmQgbWljX2phY2tfZXZlbnQgYWx3YXlzIHJldHVybiAwLiBIb3dl
dmVyLA0KPiBzbmRfc29jX2RhcG1fZGlzYWJsZV9waW4gYW5kIHNuZF9zb2NfZGFwbV9lbmFibGVf
cGluIG1heSByZXR1cm4gYQ0KPiBub24temVybyB2YWx1ZSwgdGhpcyB3aWxsIGNhdXNlIHRoZSB1
c2VyIHdobyBjYWxsaW5nIGhwX2phY2tfZXZlbnQNCj4gYW5kIG1pY19qYWNrX2V2ZW50IGRvbid0
IGtub3cgd2hldGhlciB0aGUgb3BlcmF0aW9uIHdhcyByZWFsbHkNCj4gc3VjY2Vzc2Z1bGx5Lg0K
PiANCj4gVGhpcyBwYXRjaCBjb3JyZWN0cyB0aGUgYmVoYXZpb3IgYnkgcHJvcGVybHkgcmV0dXJu
aW5nIDEgd2hlbiB0aGUNCj4gdmFsdWUgZ2V0cyB1cGRhdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWVuZyBUYW5nIDx0YW5nbWVuZ0B1bmlvbnRlY2guY29tPg0KPiAtLS0NCj4gICBzb3VuZC9z
b2MvZnNsL2ZzbC1hc29jLWNhcmQuYyB8IDE2ICsrKysrKysrKystLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvZnNsL2ZzbC1hc29jLWNhcmQuYyBiL3NvdW5kL3NvYy9mc2wvZnNsLWFz
b2MtY2FyZC5jDQo+IGluZGV4IDM3MGJjNzkwYzZiYS4uZjI2NDFjMmNiMDQ3IDEwMDY0NA0KPiAt
LS0gYS9zb3VuZC9zb2MvZnNsL2ZzbC1hc29jLWNhcmQuYw0KPiArKysgYi9zb3VuZC9zb2MvZnNs
L2ZzbC1hc29jLWNhcmQuYw0KPiBAQCAtNDU3LDE2ICs0NTcsMTggQEAgc3RhdGljIGludCBmc2xf
YXNvY19jYXJkX2F1ZG11eF9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ICAgc3RhdGlj
IGludCBocF9qYWNrX2V2ZW50KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIHVuc2lnbmVkIGxv
bmcgZXZlbnQsDQo+ICAgCQkJIHZvaWQgKmRhdGEpDQo+ICAgew0KPiArCWludCByZXQ7DQo+ICsN
Cg0KWW91IGRvbid0IG5lZWQgdGhhdCBuZXcgbG9jYWwgdmFyLiBUaGVyZSBhcmUgY29jY2luZWxs
ZSBzY3JpcHRzIHRoYXQgDQp0cmFjayB0aG9zZSB1bm5lY2Vzc2FyeSBpbnRlcm1lZGlhdGVzIHNv
IGRvbid0IGFkZCBhIG5ldyBvbmUuDQoNCj4gICAJc3RydWN0IHNuZF9zb2NfamFjayAqamFjayA9
IChzdHJ1Y3Qgc25kX3NvY19qYWNrICopZGF0YTsNCj4gICAJc3RydWN0IHNuZF9zb2NfZGFwbV9j
b250ZXh0ICpkYXBtID0gJmphY2stPmNhcmQtPmRhcG07DQo+ICAgDQo+ICAgCWlmIChldmVudCAm
IFNORF9KQUNLX0hFQURQSE9ORSkNCj4gICAJCS8qIERpc2FibGUgc3BlYWtlciBpZiBoZWFkcGhv
bmUgaXMgcGx1Z2dlZCBpbiAqLw0KPiAtCQlzbmRfc29jX2RhcG1fZGlzYWJsZV9waW4oZGFwbSwg
IkV4dCBTcGsiKTsNCj4gKwkJcmV0ID0gc25kX3NvY19kYXBtX2Rpc2FibGVfcGluKGRhcG0sICJF
eHQgU3BrIik7DQoNClNob3VsZCBiZQ0KCQlyZXR1cm4gc25kX3NvY19kYXBtX2Rpc2FibGVfcGlu
KGRhcG0sICJFeHQgU3BrIik7DQoNCj4gICAJZWxzZQ0KPiAtCQlzbmRfc29jX2RhcG1fZW5hYmxl
X3BpbihkYXBtLCAiRXh0IFNwayIpOw0KPiArCQlyZXQgPSBzbmRfc29jX2RhcG1fZW5hYmxlX3Bp
bihkYXBtLCAiRXh0IFNwayIpOw0KDQphbmQNCg0KCQlyZXR1cm4gc25kX3NvY19kYXBtX2VuYWJs
ZV9waW4oZGFwbSwgIkV4dCBTcGsiKTsNCg0KPiAgIA0KPiAtCXJldHVybiAwOw0KPiArCXJldHVy
biByZXQ7DQoNCkFuZCBjb21wbGV0ZWx5IGRyb3AgdGhhdC4NCg0KPiAgIH0NCj4gICANCj4gICBz
dGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGhwX2phY2tfbmIgPSB7DQo+IEBAIC00NzYsMTYg
KzQ3OCwxOCBAQCBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIGhwX2phY2tfbmIgPSB7DQo+
ICAgc3RhdGljIGludCBtaWNfamFja19ldmVudChzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1
bnNpZ25lZCBsb25nIGV2ZW50LA0KPiAgIAkJCSAgdm9pZCAqZGF0YSkNCj4gICB7DQo+ICsJaW50
IHJldDsNCj4gKw0KDQpBbmQgZG8gZXhhY3RseSB0aGUgc2FtZSBoZXJlLg0KDQo+ICAgCXN0cnVj
dCBzbmRfc29jX2phY2sgKmphY2sgPSAoc3RydWN0IHNuZF9zb2NfamFjayAqKWRhdGE7DQo+ICAg
CXN0cnVjdCBzbmRfc29jX2RhcG1fY29udGV4dCAqZGFwbSA9ICZqYWNrLT5jYXJkLT5kYXBtOw0K
PiAgIA0KPiAgIAlpZiAoZXZlbnQgJiBTTkRfSkFDS19NSUNST1BIT05FKQ0KPiAgIAkJLyogRGlz
YWJsZSBkbWljIGlmIG1pY3JvcGhvbmUgaXMgcGx1Z2dlZCBpbiAqLw0KPiAtCQlzbmRfc29jX2Rh
cG1fZGlzYWJsZV9waW4oZGFwbSwgIkRNSUMiKTsNCj4gKwkJcmV0ID0gc25kX3NvY19kYXBtX2Rp
c2FibGVfcGluKGRhcG0sICJETUlDIik7DQo+ICAgCWVsc2UNCj4gLQkJc25kX3NvY19kYXBtX2Vu
YWJsZV9waW4oZGFwbSwgIkRNSUMiKTsNCj4gKwkJcmV0ID0gc25kX3NvY19kYXBtX2VuYWJsZV9w
aW4oZGFwbSwgIkRNSUMiKTsNCj4gICANCj4gLQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gcmV0Ow0K
PiAgIH0NCj4gICANCj4gICBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIG1pY19qYWNrX25i
ID0gew==
