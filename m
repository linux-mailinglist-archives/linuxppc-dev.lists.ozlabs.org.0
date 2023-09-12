Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C690E79D7C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 19:40:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AVluuXBj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlW7r4G6pz3cDl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 03:40:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AVluuXBj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlW6v34s1z2xm4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 03:39:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KunMHHhhyRmpCx2ArlUv479YuybIMfeyeddAJQMVfYi/BBDXhXsDR8/XfmCbBJi0QSetH7SwSsMMKGEyOm60wf0bpSZpWhtIhjDpdGxkKYOxUzVqA0/FSbjanv2cyrt3nXpJshkxfi/cmxTmhZRVS0JMS3UldxjPVLldadf26GqwBtCMs34AK1sgw/22xHRgnbABH+32fMe/amxg3wDg55U+VBxm7UNpKs74p4vC4IuweuykOIN9zMlZVHpTmZ3bghhSQ6j18J0IjnwyZ0/Vn28bjAT27kQ+JGFxiEJve26fn2z3E4xdvJTb+fDXTkSwcNMXaxSPBWRxtYY5BWi3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHV58t+hh4k3gNNssbIq6S5cych00tN+93mwy5B4TCU=;
 b=T6OVCa5/v/4ToQrVtF9VdTiErxKqiujCkkhW90H2JVpFBysRrgOSHjQHk4zrdWXBgqr0xiLMBWDbFQXwac8HWGKu0BoUlAjZwSR9hv80Rp5QWpMmliwPk5wsW4ZFt0VlJqeaplTkLtvhM8kIaXRu4WIBf9YyEGnTofoOuNzu3aVtBtQdkc5yz98my5Z4iLF0inuLtzx6G3qo8REi1yM1PEg9++yS13TDQ66nWG2p7zIaDCN9BbBG48XfBo/s4llVeJbyX7k7ZYAil9kojm1ZlrdVTR436ppIDu33Ju7PH6xnLWUrU/0znIPv1ItKX88EbECJ90CO15yYA8mDa5W4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHV58t+hh4k3gNNssbIq6S5cych00tN+93mwy5B4TCU=;
 b=AVluuXBjPV1OmmqMoEbiMVJpczn4W5RC3ikCoMK+mDYdNxRHQHXUnl3kvJuhRucES0BBCk3xulopdSTuTdi6PC1c2ZNk42Wrt159kxRZiIcgdoKB7zc0AO4Ki1Bi5y8SvADzxt00HMf8cyw2jV8laoVVZlUywxSfvkkfZmhjq7lq36YWwa3mp+qPuEbZjXWZtRrNJqNGnv7Kx4m3Iyzl052lcI+RB1a1oat+ueI8IIo3fGhBMH1baxG651C8KLQ7jbSiYpSTajKhPqSPYXlghwmGD2AKYM0txJJIqdWxbcIxt5XomnZMyNbxpmi7uiJ9DFrUWDGudxrYwZrZ2Ri/Hg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3364.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 17:39:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 17:39:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftACAASA2gIAAlqsAgAQFCICAASjBgIAAAdaAgAubzoCAAH9ogIAAiW+AgAAbyoA=
Date: Tue, 12 Sep 2023 17:39:10 +0000
Message-ID: <453090a5-0d01-40ee-50a5-794c8f0f1f95@csgroup.eu>
References: <20230811014845.1bf6771d@yea> <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
 <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
 <20230901004417.631dc019@yea>
 <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
 <20230903230635.5751b620@yea>
 <438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
 <c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
 <20230912021147.57c85033@yea>
 <22f67fc2-ae70-bbc7-ca2a-dffbf62731f3@csgroup.eu>
 <20230912175941.0fca47bb@yea>
In-Reply-To: <20230912175941.0fca47bb@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3364:EE_
x-ms-office365-filtering-correlation-id: 86483ba9-78d8-426f-923f-08dbb3b72c2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4UT7EWZcRJVrTfYZYnvEbA9SASl87C96RtJiIwROIpxjVvBz2VXv6vdAvqmgXpLvoPJeDnKXHSoUh7tQNdq1Y3eOIdKZwOXXYWZXTwgZAxHGLWdUN+RBuFDV2Ob6fGMFGogvcaKGDxlYWmFdn2D/8EpW8vMm2Y6k5STFtiepMQwde18acsWZG5leAriu4M1OwqySQgmyCsFmos3tmerSX07vQm3qRpRzxknf9YAmbsI9SUNzRLtjGVjmIbjDvzjAV7BSMPELJ5eJi+sSRTYjbIKg+lXb2vXH2GiZm02OLDW2BeEUpkvfL7EMld3pK4xc6mlE6c+QAyQHGgyo6t060U+62zgA30j0qBtjtuvpYE5TWL1o/UMLCY3vU4mC1tyeHraIXXUop29ZSnWnavcG8pFrb9+kwAEtORBk4DOru4C87UQaNg0SsNxFvFtO5zYoTG7DOV/a//wAdlYOLzxU2r0eKUv702sLkmMNVZS5v0MXdpakbxyWy81Z1j3cMvnA7VanKmX+7qYCGmrDT3GViEdmSqVu2oHJJL9UhzfTRpXnt1z/bJcExKgrtYFIPRofYVX0vtcUQs7Ae9GU5WjO0X8EWfKO6P57B+Nf1d2z3vMjAHEkGQybmFBeSh/I07ncX7r8QIUZFb6JDrDDSTR50gc9l2UPsSu16q439tI0WNFfUvqnTWKNLE10HVcTH0lZ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(6506007)(6486002)(6512007)(71200400001)(83380400001)(38070700005)(122000001)(38100700002)(31696002)(86362001)(66574015)(2616005)(36756003)(26005)(66946007)(66556008)(64756008)(41300700001)(91956017)(76116006)(66476007)(66446008)(54906003)(316002)(6916009)(2906002)(44832011)(5660300002)(31686004)(4326008)(8676002)(8936002)(478600001)(19627235002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TWZGa29zank3dkRQMXVVcEJxU1RyTGhrRldvRHh6NC9abWxYQmFBUFRwdW5Z?=
 =?utf-8?B?ajNmTDNYNVJkcFNjWHBKbEQ5N0s3VnpabTJqK3FTZjBIdXd1OXlCL1o3cCtE?=
 =?utf-8?B?bng0SVJyK1NTd3laeDlEZUgrUEcvWGpvcmhWT2k2Vm9ScjBadWp0STYzSFQv?=
 =?utf-8?B?SkRsR3FJOUFScU9PMytVYTE4cHM1K2dkaWN6b0JuYXNnRnFGY3BQV3VTckdT?=
 =?utf-8?B?TStTdklnOGh2QnBkM2t3SmxpQlpqcmJWbXRwb1dNSUhjelR4bTlYeTY5cGt6?=
 =?utf-8?B?WlIwbWNjaGpEKytOdVVsOU1KTlBRZFRaZzNaWHU3N3laZUFPSHBzTEpLaHVt?=
 =?utf-8?B?ZDFIbTNNblUyTll6U2FjT3Y4OXdvZXlTeVZhdmJHU1RFR3d4ajQrOElRY2ZI?=
 =?utf-8?B?VndUWktQOEw0RHFVUUVocTRJNDlrbHdZZTZCeFFQdWM1ak56UlZ2Yzg5a2RP?=
 =?utf-8?B?WE1YVjVPV3VxVEFpV2hiNzNtS1Ixc2tycU1rU0M2QUVuWk9KVTM4MDNRK0VL?=
 =?utf-8?B?ektMNUU4eTdaN3JaaTVVK0dwcm1FNWlWMnBEREQ1RVozeXY5OWFOQzRNR05K?=
 =?utf-8?B?dE9kdHlSenlNVWNTMG1mQlU0NjA0QWk5QlQrM01GYUNiM1dKWmpLS3FEcWtL?=
 =?utf-8?B?U3Y5KzdpdTFGcnpKQUU1LzlJYlIweDN6QkdZc1dkR3huemZVOERPQTZ1Q1hU?=
 =?utf-8?B?WnNkN09McVk3RDNYUWVpb3FQWnhySzlJdGw5VW1BMDRPOUFFRFd0UXU0RWJJ?=
 =?utf-8?B?SzhtM1h3WDRyZ3ZYTWIxdXpIUXJvam0rSTdWeTBBbHA4M3NMZTB4UWJmWjFp?=
 =?utf-8?B?OVZGZ1ZxTGtkY1VKdWxRdGlwNHFZQ01GOCsvVFUwMkdpVU5MM0k4VE5hMWU5?=
 =?utf-8?B?cVErMjRnbVRRczArd0JlQUhjWUlGN3FSSUZmd1VaOHh1NkloZGdvL0JUYm1B?=
 =?utf-8?B?elM5dmM4OFFnMEw0ejMraTRteE9rbldCL0FvWW1uVERYRVJlZ1JoVk91VHIz?=
 =?utf-8?B?cmNyWEdiKzl4N0FQTmdFUWlkSGdsRDRaVk9wOW85WTFNdGp6T2czSW5FeThS?=
 =?utf-8?B?T0JjOFJkdFd5WnlucXZqUEROSklQWXJkNmpTbnJGb2oyUG5RNDJxc1JrL09q?=
 =?utf-8?B?dElSVmFITktyblZadEp2WnEzdFNFcmlNZnVzQTlzY0JZOHVqTjdpOVkzZTly?=
 =?utf-8?B?OWZaV0xCN3lyOEJmUWNaaGtUbGVsRGlLeEZTM016R2JBS0l1ZXpiVWFIS0JE?=
 =?utf-8?B?Tmx3aE1oL05yaENDVDNDR25oV2UzYzN0SFhjVnQweTJMOW1qTWJoemlpMWJo?=
 =?utf-8?B?NFNjL1hRTEtGK1RpR0QwakxCUzBWekVxRmk2a0lQSkJqYVkvZ0tZWkdyVzRj?=
 =?utf-8?B?U0pjK0VNRVR1YjRMelhkMGVuYllCVzRTWHdldFhJK0cyYVFOZGQzRlc4eWNZ?=
 =?utf-8?B?M0tvV2lYSG53eTZkY2ZHMUJwN1BNRCtVdHBCUExZbHEvZGYzc0hrdVg1WS9X?=
 =?utf-8?B?d25PRjdzakl4SXVJcGxtQnBua3VuWmsyWitsQk5wY0kwbHBTQUZpeUhLZXlk?=
 =?utf-8?B?aU5zbXdURWhVWXNiMTcxVGFOSDA5dmF0NlE5aFNYQ2pPcGc0eVp2QkRERzEr?=
 =?utf-8?B?U2NNbVljMjVZRjVadmZqdzN4NjIzK3FXdkRDVlhhdlM3MFRjNlIvQmwxVXl5?=
 =?utf-8?B?Ly9ncWRJMGlLaGs2T1NqUWNDeG9lVkdHWHJ0RnBCdTM1WUovTGd3MUtTQkd4?=
 =?utf-8?B?UUswWkdIU1pKdk9RTXJ5b1pMVUtTdlpsK1JCUTkyT29RdWVvLy81Vnd4aEtO?=
 =?utf-8?B?ZFJicjlZb1pST0FMTnQwYlNBOEtKQzNQUEpPQnhidjNPNkVjSnJBNDZMc2hn?=
 =?utf-8?B?bldRa0JNNmtDWEhxRkQ1NkpKRzJGNFVBSHloZUpia0cvcEoxdVJJLzZ5RGFk?=
 =?utf-8?B?NzNyL0ZVOXhxeFh4Q2VBQzFNekFBalVNQ0Z1Z0tvUHVKM2VVOFJxM2Zlemkx?=
 =?utf-8?B?eFZXekNkS00xaG1ocEJMTzlSTllLSUdXZ28wZkFZVVBsTEVkSUQzNDVoLytT?=
 =?utf-8?B?aVZycTZHa3dXZGV5MmNGMWxNekE3bndUd0NEWWJSUXJYZmRYanp4TzdxeHM3?=
 =?utf-8?B?QUdDdEhsbFdwM2tveXFJTzVQTFMxUXVscUMyK1lJYmhGT0VCRGFvY2dJeVpQ?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF51D917DE69C945A1DA8C104B31DFC6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86483ba9-78d8-426f-923f-08dbb3b72c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 17:39:10.4460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPsE4kSyvRBLLsXJZrURA2WqJQxT8zlvZbjgsFfuh8Kuzr1ayhX0gPqoJQtMk4NdkjilFnldZrjuEnz3pfot5VP3um9vJcow00UIArH8mP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3364
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

DQoNCkxlIDEyLzA5LzIwMjMgw6AgMTc6NTksIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IA0KPiBwcmludGs6IGJvb3Rjb25zb2xlIFt1ZGJnMF0gZW5hYmxlZA0KPiBUb3RhbCBtZW1vcnkg
PSAyMDQ4TUI7IHVzaW5nIDQwOTZrQiBmb3IgaGFzaCB0YWJsZQ0KPiBtYXBpbl9yYW06MTI1DQo+
IG1tdV9tYXBpbl9yYW06MTY5IDAgMzAwMDAwMDAgMTQwMDAwMCAyMDAwMDAwDQo+IF9fbW11X21h
cGluX3JhbToxNDYgMCAxNDAwMDAwDQo+IF9fbW11X21hcGluX3JhbToxNTUgMTQwMDAwMA0KPiBf
X21tdV9tYXBpbl9yYW06MTQ2IDE0MDAwMDAgMzAwMDAwMDANCj4gX19tbXVfbWFwaW5fcmFtOjE1
NSAyMDAwMDAwMA0KPiBfX21hcGluX3JhbV9jaHVuazoxMDcgMjAwMDAwMDAgMzAwMDAwMDANCj4g
X19tYXBpbl9yYW1fY2h1bms6MTE3DQo+IG1hcGluX3JhbToxMzQNCj4ga2FzYW5fbW11X2luaXQ6
MTI5DQo+IGthc2FuX21tdV9pbml0OjEzMiAwDQo+IGthc2FuX21tdV9pbml0OjEzNw0KPiBpb3Jl
bWFwKCkgY2FsbGVkIGVhcmx5IGZyb20gYnRleHRfbWFwKzB4NjQvMHhkYy4gVXNlIGVhcmx5X2lv
cmVtYXAoKSBpbnN0ZWFkDQo+IExpbnV4IHZlcnNpb24gNi42LjAtcmMxLVBNYWNHNC1kaXJ0eSAo
cm9vdEBUMTAwMCkgKGdjYyAoR2VudG9vIDEyLjMuMV9wMjAyMzA1MjYgcDIpIDEyLjMuMSAyMDIz
MDUyNiwgR05VIGxkIChHZW50b28gMi40MCBwNykgMi40MC4wKSAjNSBTTVAgVHVlIFNlcCAxMiAx
Njo1MDo0NyBDRVNUIDIwMjMNCj4ga2FzYW5faW5pdF9yZWdpb246IGMwMDAwMDAwIDMwMDAwMDAw
IGY4MDAwMDAwIGZlMDAwMDAwDQo+IGthc2FuX2luaXRfcmVnaW9uOiBsb29wIGY4MDAwMDAwIGZl
MDAwMDAwDQo+IA0KPiANCj4gU28gSSBnZXQgbm8gImthc2FuX2luaXRfcmVnaW9uOiBzZXRiYXQi
IGxpbmUgYW5kIGRvbid0IHJlYWNoICJLQVNBTiBpbml0IGRvbmUiLg0KDQpBaCBvaywgbWF5YmUg
eW91ciBDUFUgb25seSBoYXMgNCBCQVRzIGFuZCB0aGV5IGFyZSBhbGwgdXNlZCwgZm9sbG93aW5n
IA0KY2hhbmdlIHdvdWxkIHRlbGwgdXMuDQoNCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0v
Ym9vazNzMzIvbW11LmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvbW11LmMNCmluZGV4IDg1
MDc4M2NmYTljNy4uYmQyNjc2N2VkY2U3IDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jv
b2szczMyL21tdS5jDQorKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvbW11LmMNCkBAIC04
Niw2ICs4Niw3IEBAIGludCBfX2luaXQgZmluZF9mcmVlX2JhdCh2b2lkKQ0KICAJCWlmICghKGJh
dFsxXS5iYXR1ICYgMykpDQogIAkJCXJldHVybiBiOw0KICAJfQ0KKwlwcl9lcnIoIk5PIEZSRUUg
QkFUICglZClcbiIsIG4pOw0KICAJcmV0dXJuIC0xOw0KICB9DQoNCg0KT3IgeW91IGhhdmUgOCBC
QVRzIGluIHdoaWNoIGNhc2UgaXQncyBhbiBhbGlnbm1lbnQgcHJvYmxlbSwgeW91IG5lZWQgdG8g
DQppbmNyZWFzZSBDT05GSUdfREFUQV9TSElGVCB0byAyMywgZm9yIHRoYXQgeW91IG5lZWQgQ09O
RklHX0FEVkFOQ0VEIGFuZCANCkNPTkZJR19EQVRBX1NISUZUX0JPT0wNCg0KQnV0IHJlZ2FyZGxl
c3Mgb2YgdGhhdCB0aGVyZSBpcyBhIHByb2JsZW0gd2UgbmVlZCB0byBmaW5kIG91dCwgYmVjYXVz
ZSANCml0IHNob3VsZCB3b3JrIHdpdGhvdXQgQkFUcy4NCg0KQXMgdGhlIEJBVHMgYWxsb2NhdGlv
biBmYWlscywgaXQgZmFsbHMgYmFjayB0byA6DQoNCglwaHlzID0gbWVtYmxvY2tfcGh5c19hbGxv
Y19yYW5nZShrX2VuZCAtIGtfc3RhcnQsIFBBR0VfU0laRSwgMCwNCgkJCQkJCSBNRU1CTE9DS19B
TExPQ19BTllXSEVSRSk7DQoJCWlmICghcGh5cykNCgkJCXJldHVybiAtRU5PTUVNOw0KCX0NCg0K
CXJldCA9IGthc2FuX2luaXRfc2hhZG93X3BhZ2VfdGFibGVzKGtfc3RhcnQsIGtfZW5kKTsNCglp
ZiAocmV0KQ0KCQlyZXR1cm4gcmV0Ow0KDQoJZm9yIChrX2N1ciA9IGtfc3RhcnQ7IGtfY3VyIDwg
a19lbmQ7IGtfY3VyICs9IFBBR0VfU0laRSkgew0KCQlwbWRfdCAqcG1kID0gcG1kX29mZl9rKGtf
Y3VyKTsNCgkJcHRlX3QgcHRlID0gcGZuX3B0ZShQSFlTX1BGTihwaHlzICsga19jdXIgLSBrX3N0
YXJ0KSwgUEFHRV9LRVJORUwpOw0KDQoJCV9fc2V0X3B0ZV9hdCgmaW5pdF9tbSwga19jdXIsIHB0
ZV9vZmZzZXRfa2VybmVsKHBtZCwga19jdXIpLCBwdGUsIDApOw0KCX0NCglmbHVzaF90bGJfa2Vy
bmVsX3JhbmdlKGtfc3RhcnQsIGtfZW5kKTsNCgltZW1zZXQoa2FzYW5fbWVtX3RvX3NoYWRvdyhz
dGFydCksIDAsIGtfZW5kIC0ga19zdGFydCk7DQoNCg0KV2hpbGUgdGhlIF9fd2VhayBmdW5jdGlv
biB0aGF0IHlvdSBjb25maXJtZWQgd29ya2luZyBpczoNCg0KCXJldCA9IGthc2FuX2luaXRfc2hh
ZG93X3BhZ2VfdGFibGVzKGtfc3RhcnQsIGtfZW5kKTsNCglpZiAocmV0KQ0KCQlyZXR1cm4gcmV0
Ow0KDQoJYmxvY2sgPSBtZW1ibG9ja19hbGxvYyhrX2VuZCAtIGtfc3RhcnQsIFBBR0VfU0laRSk7
DQoJaWYgKCFibG9jaykNCgkJcmV0dXJuIC1FTk9NRU07DQoNCglmb3IgKGtfY3VyID0ga19zdGFy
dCAmIFBBR0VfTUFTSzsga19jdXIgPCBrX2VuZDsga19jdXIgKz0gUEFHRV9TSVpFKSB7DQoJCXBt
ZF90ICpwbWQgPSBwbWRfb2ZmX2soa19jdXIpOw0KCQl2b2lkICp2YSA9IGJsb2NrICsga19jdXIg
LSBrX3N0YXJ0Ow0KCQlwdGVfdCBwdGUgPSBwZm5fcHRlKFBIWVNfUEZOKF9fcGEodmEpKSwgUEFH
RV9LRVJORUwpOw0KDQoJCV9fc2V0X3B0ZV9hdCgmaW5pdF9tbSwga19jdXIsIHB0ZV9vZmZzZXRf
a2VybmVsKHBtZCwga19jdXIpLCBwdGUsIDApOw0KCX0NCglmbHVzaF90bGJfa2VybmVsX3Jhbmdl
KGtfc3RhcnQsIGtfZW5kKTsNCg0KDQpJJ20gaGF2aW5nIGhhcmQgdGltZSB0byB1bmRlcnN0YW5k
IHdoYXQncyBjb3VsZCBiZSB3cm9uZyBhdCB0aGUgZmlyc3QgcGxhY2UuDQoNCkNvdWxkIHlvdSB0
cnkgZm9sbG93aW5nIGNoYW5nZToNCg0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9rYXNh
bi9ib29rM3NfMzIuYyANCmIvYXJjaC9wb3dlcnBjL21tL2thc2FuL2Jvb2szc18zMi5jDQppbmRl
eCA5OTU0YjdhM2I3YWUuLmUwNGYyMTkwOGM2YSAxMDA2NDQNCi0tLSBhL2FyY2gvcG93ZXJwYy9t
bS9rYXNhbi9ib29rM3NfMzIuYw0KKysrIGIvYXJjaC9wb3dlcnBjL21tL2thc2FuL2Jvb2szc18z
Mi5jDQpAQCAtMzgsNyArMzgsNyBAQCBpbnQgX19pbml0IGthc2FuX2luaXRfcmVnaW9uKHZvaWQg
KnN0YXJ0LCBzaXplX3Qgc2l6ZSkNCg0KICAJaWYgKGtfbm9iYXQgPCBrX2VuZCkgew0KICAJCXBo
eXMgPSBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKGtfZW5kIC0ga19ub2JhdCwgUEFHRV9TSVpF
LCAwLA0KLQkJCQkJCSBNRU1CTE9DS19BTExPQ19BTllXSEVSRSk7DQorCQkJCQkJIE1FTUJMT0NL
X0FMTE9DX0FDQ0VTU0lCTEUpOw0KICAJCWlmICghcGh5cykNCiAgCQkJcmV0dXJuIC1FTk9NRU07
DQogIAl9DQoNCkFuZCBhbHNvIHRoYXQgb25lOg0KDQoNCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvbW0va2FzYW4vaW5pdF8zMi5jIA0KYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF8zMi5j
DQppbmRleCBhNzA4MjhhNmQ5MzUuLmJjMWMwNzU0ODlmNCAxMDA2NDQNCi0tLSBhL2FyY2gvcG93
ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMNCisrKyBiL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0
XzMyLmMNCkBAIC04NCw2ICs4NCw5IEBAIGthc2FuX3VwZGF0ZV9lYXJseV9yZWdpb24odW5zaWdu
ZWQgbG9uZyBrX3N0YXJ0LCANCnVuc2lnbmVkIGxvbmcga19lbmQsIHB0ZV90IHB0ZSkNCiAgew0K
ICAJdW5zaWduZWQgbG9uZyBrX2N1cjsNCg0KKwlpZiAoa19zdGFydCA9PSBrX2VuZCkNCisJCXJl
dHVybjsNCisNCiAgCWZvciAoa19jdXIgPSBrX3N0YXJ0OyBrX2N1ciAhPSBrX2VuZDsga19jdXIg
Kz0gUEFHRV9TSVpFKSB7DQogIAkJcG1kX3QgKnBtZCA9IHBtZF9vZmZfayhrX2N1cik7DQogIAkJ
cHRlX3QgKnB0ZXAgPSBwdGVfb2Zmc2V0X2tlcm5lbChwbWQsIGtfY3VyKTsNCg0KDQoNClRoYW5r
cw0KQ2hyaXN0b3BoZQ0K
