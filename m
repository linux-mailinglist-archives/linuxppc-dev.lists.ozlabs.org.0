Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD524D1496
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 11:18:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCWW15SSJz3bcY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 21:18:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::611;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::611])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCWVY5Cwpz2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 21:17:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTcVIaUpDP8F+tT7aHcf6d8HI5NGCsn2Au0a04RCIWsJ2lKWV6rA6iGwiRF0Dt8HvPrw7ggj2z5+AH6VOZYvtuH8JWnUdq7qC+b6OdKzqnmAX/0dIOIakAbjhmyUwMkGq6ieQx2Ljq8Efl84H5BGZiJr6b86ZBhMjWnl4wRB3DxcSyXt21jBnR5J2yxmP4HXJlfc6v8wZvUCelvn9/CiZo6q3ofiW/xjW29rgOzDgmDA4GP9mwPk+D2giadqSW0LhkSUk9+76h9IKPKRvWmMI8QkpUdFLPfmQkW4Np9F0FKHRd/2msYaa6b6LjxLPdxTL71gKPEkcC5dkiscaHZkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQx98CxIkacCsMBNTqI4yWh7bDYFE/w3tc7ULFzmTLU=;
 b=P525QeSMUAqRC0IhUIj6DSmURa4WiT75v5D1dqPpwmpxBLiQ2U47NegqGd99a6Ph4kJmDortNv2UNySErl3kfFjbcY0q0ZJbDl/UZRVoOuvzEJ4A0Qq5P4ogG52+RZYPThAGNsPRXueIHkLE9IoGXjbQf82cDWJM7BN5tJHMPn35Y01Fkl5lY+xwga/TB/uhxL9PZMXWepQRzveDolpuiLpeP6U/KT7CWNicJrDm9dvRZEpPM4RZWmqPGZC+8HeChHHXGAAH1JudXYNLPQx4Z4cPOnD+ApK6vjq150mLfmOaMqP2JtFmiu97J+2DYPgUmyQIMq8FjmfCAPxIwcXqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 10:17:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 10:17:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: YueHaibing <yuehaibing@huawei.com>, "jk@ozlabs.org" <jk@ozlabs.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>
Subject: Re: [PATCH v2 -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
Thread-Topic: [PATCH v2 -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
Thread-Index: AQHYMtUvdPPapc+yBUitMuBGROoOTay1Rc2A
Date: Tue, 8 Mar 2022 10:17:37 +0000
Message-ID: <0d55feb0-e77d-1a10-cfe0-b3302872d407@csgroup.eu>
References: <20220308100928.23540-1-yuehaibing@huawei.com>
In-Reply-To: <20220308100928.23540-1-yuehaibing@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc700ccc-68f4-451c-10c3-08da00ecdead
x-ms-traffictypediagnostic: PR0P264MB0026:EE_
x-microsoft-antispam-prvs: <PR0P264MB0026387851EDD164262E9C45ED099@PR0P264MB0026.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RNDEtari1YUxNWcZsbEUdEPXoOWQT45OngV9V/kjsMJTpjAt87Xs3L41SOHp4/zYwfyPaY5uujGTzW7gtTg3S4yAQJxxGkn/3LT3ZF8zKjo3cNC/zcEbu05S1FRYnfnrjVfWapLOpjDEhjmnysYYy8q7VVxWmggRBlnCqJ5UmmNIk/Ht37sOOwy7oCwEyY2ifwFHdpDaVpt3dJXvWzWh82Vw89bZ7YXWULsii8IO0uV5buxwLFL6IUaqFQAOkBTEAE9s/+wwarN8/1l1YEQQZeK0uyW7CokilyWqBrZlMnZFGwDaUn2+38jKOeIdwW5qHgeFPtZk+tLoPm+Hdc9P2087Rhjls32KtUO/t4a7Am7b2TRpa75qNt0uTHuxpsiiQJ4BOaQA1rQDURmZWhTtxjXdSY2GLsn2b6+/JH56p87Mpdp7/8Mtza0uCjnOV6sNkecXTiRBL6WlXSjqS3ZPQ1Z26THqhamtDZgyH55TYh7bNSEcnG9vlsyjppOA60kML2kGThLb6Vm3I5utNEwJXr2aj6eJgPuBMddPMCy5Aog7zBiLbICASaYXZaGFQHNdaCqyMIX5NtyyxLRAJM5yIH3D9pHCIM0QFkQUTJmWqbkpxzBgPlM6fuQv2/Lg0L3ukeBX7cMZbrBi+xM52Z2Vu9plp8E2ACd8miAh5OnR3HAqiGVmepCHv4ctSk1GdvwD5ARdSvw+sznrM+4JbsOOnqfGvxN0hih4HadS4QGCJo7QXsSQQnwdbPUH1scgmK2bfzB1ORyKOFK7QRGz9KlKGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(122000001)(36756003)(26005)(6506007)(6512007)(91956017)(66946007)(2906002)(83380400001)(31686004)(71200400001)(4326008)(86362001)(8936002)(44832011)(5660300002)(6486002)(186003)(66574015)(2616005)(8676002)(508600001)(66476007)(66446008)(66556008)(31696002)(64756008)(316002)(110136005)(54906003)(38070700005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1gvUWo0UWRCVEpPSk5DbnNzL3JCOWVWWTFuNUsyKzJxM1Y4c3JTRk9ERS9Q?=
 =?utf-8?B?T0hzeGRuUnNTQ3FZaUQ5QzhsNW1VSVFyN3FKTnpKTXM0amRMTTlKemplSVVT?=
 =?utf-8?B?akZTRjlKTlRSdm5NcWRZWjVCTVAxUVFuakJXMDh6bzJXeU9HeFdxWkZVRVdF?=
 =?utf-8?B?L0ZvNHpveVJYbzg4Y29xeGJLS0N1U093MnRmUkpiTzNuZFU2Lzl4YUlheWNN?=
 =?utf-8?B?VkkvM2Q3WTdBOGdQeDJlai83RUY4TllreForRnkwWkNuZWdndlNGNmk5S0No?=
 =?utf-8?B?a0tjcEJuME45SFpMNlBDckRRYXV3RFpzK2pTeGJrVWY1dkFDMlpueHJWcE9W?=
 =?utf-8?B?dHI3a2RlYjk2NE5ROFl5R3lpL3Y4cUNjbVZwclMvWWNqNm56aStNejlqZ2dB?=
 =?utf-8?B?TGo1YnBwUUtwMit5RDNXVTRrOURlS0V6V2Z3OUhTTktGem5UaDFVZjJMVVg0?=
 =?utf-8?B?Sy9qNlU4N250WTNFT1QzSkZSNFV1WFd4ZlB5WGxTOXFyZlN5clR3OElmMGFY?=
 =?utf-8?B?Z1orWHdHVitIcVg0S2lhNFpaczA4LytFUy92TUJDMDBVcE94ZXpBakFBNFlL?=
 =?utf-8?B?TmU1MDg2dFAzM0RZdWE4Z0k3S0pjK2xmUEJTTDVZeWltRzZTQTUvZElTNFBH?=
 =?utf-8?B?NVpHSWRxcGxlK2xwQWJKSDlWM0V6b01qN2QzRC9Bb3ExMlZGUE9jNnpYU0hx?=
 =?utf-8?B?YlRyeFd5eWQrTUtac2lWVTNqSlhVV2VMTWladkw2allXYVpYMXhobDZZWkhS?=
 =?utf-8?B?YlB1TU9DOElMSDVOTWMzdWdxbEcwSTVCTXhGMk55Z0w1MGxGREhvblNHeWhT?=
 =?utf-8?B?d1VWR3RoSzVob3hMWjloZXpPNjcrb0hUbW5XVXA0Nm5NMEQzRzVmUk9SZkJM?=
 =?utf-8?B?RGh1NkdSUjlrZFFkUFo4YTNsWC9RMDZsMkt5OERhT0Zoa0NIOUpiQ1NheW5L?=
 =?utf-8?B?WkxDWFJkUHlZM3h0YldlRTZOTjFHSFJkaGRuRUVmdk1ISU9tSC90S3F2WUkr?=
 =?utf-8?B?NXgwQU1UbllGa2wrQ2V6L0E2U1N6UDBrd2pKOUIrWnNzd3RlU2hyenhvVURj?=
 =?utf-8?B?b1pYeHNuUFNMYTkvd0FRaHlOTFFCczhWeCtITmVPSFMvaTI2NzQ0UmFWRGpv?=
 =?utf-8?B?eWhOZU53NWhwc2dCcUhOSS9NY3M2cDlKVDd0SGk2RzhMaFlwajZCR29xbXdK?=
 =?utf-8?B?eW5QTElMZHliSklMdHNGa2RUa3ZYWHNrMGJBd3hEUElNS0JQVTQvQzE1N3hK?=
 =?utf-8?B?cmR0eEFocDc0WUQ1QlROcTJKT2xXdGpwY2Q1TWgrbCtVSmdReFJOaXJpT25I?=
 =?utf-8?B?Mk5SUXVvaWk1VE9qOTQyT0N3MjVxeXpRem5LZnRhN0pidEU3dzA5QTJpYVdF?=
 =?utf-8?B?d21IREo4UlpiRkQ5Z1lQRVFwQTdVbUYxTlFFTW1JU1dRbkFRdFExQWUrT2tz?=
 =?utf-8?B?MXppcG5WWWxXZnVwbVdsY2E2NjJNU3hEbTZKbjVCWE0vRk5Qd1NBd01DVW40?=
 =?utf-8?B?b3A1T2hxWUVCYTBNM0NsYytFbjRJMDBKUkZHZHNiK2V0QVRaczJyUnkvMTdN?=
 =?utf-8?B?WXlNb21KUWl6TWhEQ2lKUUc5NER6a0ZUYU82c3dhL0pVSnMzV2dmajA2L2VY?=
 =?utf-8?B?ZDRxWGk1RjROUk9Dd3ExMXU3eEF5K05yaFg5S0ZYR3VFQ1ZPMTJySmkxSHUy?=
 =?utf-8?B?VUt5YUFXZk55aXlVQ0VXVXpXdDNhTkY3aGduSnZDa2N1YUZYcXlMaEYwZDht?=
 =?utf-8?B?cEQyNTdLOHIrdjBWTUJRWFAxdDNUSFdxMWpEU1MrUld5Si9INUJhSVFZcG5E?=
 =?utf-8?B?ejJYTHJhL1lQd2o1NDErKzdFRklzQm90WFVDNjk3RnEyUDRqU2dnVUt0c0F1?=
 =?utf-8?B?ZTZOK2hKc1ZNeHVOZnY4QUR2d3dlZjdKSlRHMytGbWR0ekdTM1A2R0hBaFRY?=
 =?utf-8?B?SHhzRk1CaDdONXdGUXMvUXozQ0RxQ2dQTGVReHFQZmkwUytwYnhhV0IvSmJD?=
 =?utf-8?B?TmpPU3lMMkJWUGdDUU5GN2wzSS91UUpPS3hnZHd4Rys3MFhaSUwyTVFnVHY1?=
 =?utf-8?B?U0QxbHp5eWRzeVZuRnFITlg4bjBqaHdkSlRVbDJiVGFvV2RiOS95cExnY0ZG?=
 =?utf-8?B?cmdGZEZsVXUycVpITE9iQndCd0pFdFQ0d01SMDF3Mk9CUW9OaXhrRHllbmhO?=
 =?utf-8?B?SHJ6UFRMTUd5Ri9Oai8yZ2ovMlRHaDAzckZVQVFMUEtOYlg4enZ5dHpSbGMr?=
 =?utf-8?Q?KCm96CmVrtrOPEgBFm0MN9nAjFmPN6lUdtDuDhK+XI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F6113E13D82B741A401EC95653C8775@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bc700ccc-68f4-451c-10c3-08da00ecdead
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 10:17:37.3418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4DTx4WFkjbpkZGDblLu/SYfvbRiVnzkKPoKVsjYjNn0Kb/DfM6DxZ0Zyw7hbvOz929BDUyOXsPnRW/YmLr7q30XGoJx79z1rGeI0StRZ5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB0026
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzAzLzIwMjIgw6AgMTE6MDksIFl1ZUhhaWJpbmcgYSDDqWNyaXTCoDoNCj4gYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL3NwdWZzL3NjaGVkLmM6MTA1NToxMjogd2FybmluZzog
4oCYc2hvd19zcHVfbG9hZGF2Z+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVu
Y3Rpb25dDQo+ICAgc3RhdGljIGludCBzaG93X3NwdV9sb2FkYXZnKHN0cnVjdCBzZXFfZmlsZSAq
cywgdm9pZCAqcHJpdmF0ZSkNCj4gICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4NCj4gDQo+
IE1vdmUgaXQgaW50byAjaWZkZWYgYmxvY2sgdG8gZml4IHRoaXMsIGFsc28gcmVtb3ZlIHVubmVl
ZGVkIHNlbWljb2xvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJp
bmdAaHVhd2VpLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gdjI6IHVzZSAjaWZkZWYgaW5zdGVhZCBv
ZiBfX21heWJlX3VudXNlZA0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwv
c3B1ZnMvc2NoZWQuYyB8IDQgKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zL2NlbGwvc3B1ZnMvc2NoZWQuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9zcHVm
cy9zY2hlZC5jDQo+IGluZGV4IGQwNThmNjIzM2U2Ni4uOTliZDAyN2E3ZjdjIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvc3B1ZnMvc2NoZWQuYw0KPiArKysgYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvc3B1ZnMvc2NoZWQuYw0KPiBAQCAtMTA1Miw2ICsx
MDUyLDcgQEAgdm9pZCBzcHVjdHhfc3dpdGNoX3N0YXRlKHN0cnVjdCBzcHVfY29udGV4dCAqY3R4
LA0KPiAgIAl9DQo+ICAgfQ0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19QUk9DX0ZTDQo+ICAgc3Rh
dGljIGludCBzaG93X3NwdV9sb2FkYXZnKHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqcHJpdmF0
ZSkNCj4gICB7DQo+ICAgCWludCBhLCBiLCBjOw0KPiBAQCAtMTA3Myw3ICsxMDc0LDggQEAgc3Rh
dGljIGludCBzaG93X3NwdV9sb2FkYXZnKHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqcHJpdmF0
ZSkNCj4gICAJCWF0b21pY19yZWFkKCZucl9zcHVfY29udGV4dHMpLA0KPiAgIAkJaWRyX2dldF9j
dXJzb3IoJnRhc2tfYWN0aXZlX3BpZF9ucyhjdXJyZW50KS0+aWRyKSAtIDEpOw0KPiAgIAlyZXR1
cm4gMDsNCj4gLX07DQo+ICt9DQo+ICsjZW5kaWYNCj4gICANCj4gICBpbnQgX19pbml0IHNwdV9z
Y2hlZF9pbml0KHZvaWQpDQo+ICAgew==
