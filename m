Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24987738E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:11:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=K6atQ5ez;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKm9P5tWlz3dBd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:11:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=K6atQ5ez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm6c3ysnz3dBl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:08:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXxTmkPK84krFsWlFCcH2vVehlSYiR/8ITcfFynOFwFsrKythKYkPZdsGDlqbNUsstAQhGwKtNQ7MozsMhHFMiw/zZ3APxtTVGg4qAwe/NrvWDsb0x8A79g4/A7ud695Pc114uaMVLy/LWfKBQrcPl38ngwreRVw1lmy0cx283kvxbV6rDDPNDrys6wMn0Im+ySd425ZS8GohbSN1i04knNi/Bz2rJ2P/9MS3rI3PFsw2VL5ZS6sEXJlXNGcl/tondvurlxLYW7YoKjldUfdMc+jI3uoPzYDMDKYqVISCzuy2T9EaA0yYiANij4OfNSP2mOTQ4ug6IkgbYhA1jcqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPA/18Tk1ZCoCG4dZq/kK53z4hu/YQYANAynu4su0PI=;
 b=B2yoGAxrCTd0amHQjtl9K9TzC1KnfbppRqRDe3MyCwLOuf36fpgMdRPt1JuUdDPWsyYhkvHqBeS2Oa7EZrvKV/wrgP0ZUS0+GkwURGsG83i84nv2uGhid4+RwFmpyqQEt1TWqD9qdymB7N/FEZ5xI0fwtwMTO/WeW+KH4UrOajli59OYReJnsnTMZAk/cD77+ezz45MVmGrOxDrg/mkVmSd5YKu49gqEBLLc1kuO8G3r+JhWkUwtYWnMZBIaxPLog9g9FrF7fD9qgakUWHN0ArBjQb1xkKNr1u0mfK1d24vVDRMzVeIwafWEFXYe5vvS2J2QpTGyhnh0u3wFKG8frQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPA/18Tk1ZCoCG4dZq/kK53z4hu/YQYANAynu4su0PI=;
 b=K6atQ5ezajm/z7UppUTa5oLvjVulT3Czpi2lhGfhvSPbDbV9/3ifFheDNwjPzb2M0fqocEqLchD9dIJ1cqf/wKGqdmU/qL78J/CTfq1gkXO//pBYEuSfm9b6YUzD0sXXnRfx0YKc4wAIs5J7FNInVZtQxj4EwuyYVBJjo463psXGQOEkvomegety8ASc/7ZFQhP4kcDM4TJ9O+TrWWvvhwnelnfA33DwS/53PCL0cdXSJCf67dAjLxA9P8KrMh19G85HXm6fmus8UTSo7yIeBhyPUIHal5STc08Ww6NHZpOtNwR8G7L6W6tZjukXAQHQjJXWLyWtHJghTT8scMwcXg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2052.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:08:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:08:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH v2 14/28] soc: fsl: cpm1: qmc: Split Tx and Rx TSA entries
 setup
Thread-Topic: [PATCH v2 14/28] soc: fsl: cpm1: qmc: Split Tx and Rx TSA
 entries setup
Thread-Index: AQHZv9JX+cwD2uDeikW7lorHIO5djK/gH2yA
Date: Tue, 8 Aug 2023 08:08:37 +0000
Message-ID: <f877e58b-4787-eadb-c0de-fbe1268b0774@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-15-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-15-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2052:EE_
x-ms-office365-filtering-correlation-id: 7a91a89c-e5f2-49c7-cefd-08db97e6ab63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AD4/WsECY+CHp6NOV8e6cWbVnA1VpCupf/QLC+MRHD+azE7VF4ixSEiyqgNebzl7pmOuj4ONCen0iranAQl5FGGY6YLBspNtisfcm/PinQ3oPOABzPZuVqt4hbzBs+TZjcea5SVdOVCLL/LHAHVIztFA9WJkNr23zes5t4pKPqfQdfwmVlr4PCQ/RG/vjsU9guyw/5PgbCEf9qVK9hPx0scNTntU7gSwwTJe4pSC8O6PlBBhpB4Eb+hGFo+zJrFG/aiEIL2LCrdk+4YMTlIw3+HeC9B3WS9Z9968hKDSSEF3u1uVuGj/8H5raRbP6NMtAt9DZQrEvoS+7EUNZY4VQg8rNVQwXA16HPvV7txsghidrIxe5WPi1cUpLCta+9qr0RgG7oyWgtCXPPEUGSNSyGoxwVBjsNuYuxtQcydVFZhR6SxOe1V+eHL8XRalKPt/piRlvHqhLRYS4T6kkltXa49Mw31NUxYI2KI80WjMNJ281W0gyltAlr576wOoMJnVgnFU+bgrn10UyhB4UAVyo2GeiDjsQNa7y+nXEx4ElU5/9Elx/PDh0jikaP6ScVh/Pjusl5ESxDDucIwagLmkBRyLRiLP038/rMGPKMryrz7Haj/3iykzabXTCsKHcxzkFwOIsojLtC08gVdLq1YNH2jIJiVLMP30INqtj8sUegf+YjKOdZSdOP0RENAEUn4j9FqDtpAwJeIc3+XSJG4OaAh+yGhqG1BKjkn6hsTV9XRdZMRlQmWUq0kfrfOT7WtwqdHKkEPfiMQtsVxAOfhJFQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39850400004)(90021799007)(451199021)(186006)(1800799003)(90011799007)(2616005)(36756003)(4326008)(6512007)(316002)(86362001)(122000001)(921005)(54906003)(76116006)(110136005)(38100700002)(66946007)(91956017)(478600001)(66446008)(64756008)(71200400001)(66556008)(31696002)(6486002)(66476007)(6506007)(41300700001)(26005)(38070700005)(66574015)(8676002)(8936002)(2906002)(83380400001)(7406005)(7416002)(5660300002)(31686004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ei9NNGZMRXNvb1c5dTQ4ZmhmTElIeDBlb2hnSFN6ZzZFUE5mSytOekJrVm1W?=
 =?utf-8?B?T0FZQ1BHTys3NWlWdDZCazRUL2pRajI2RVoxRytlbjhJR2lKbmEwZFI0a3Vj?=
 =?utf-8?B?b1REL004aXVlMzJSWXJReVpRWUFidkhHSFBOMjZBamVraVMyQmxkWVpMZ1NG?=
 =?utf-8?B?dmJ0TnhyTjU0NklDL0hyYnNOTGNmbVZyYTg2OTBROVhXWlZsempCZ1kvdjdw?=
 =?utf-8?B?encwUTYvQ0tSREg4Yk41blZVVjNZSlhZUGVxU0tjQlU1bWhzcnZTbzVhU0dR?=
 =?utf-8?B?MXo4bkpLVjFFeEo2eUxhUCtjcmhWbzArcVA4YURqTjUvT3BSN2pFNmJSMkxo?=
 =?utf-8?B?bzc2NVRQMlY0elhLM2NzdUZCaUQvR3hCZ2prMmV1SFpVejJNREZmRHcvNUNn?=
 =?utf-8?B?TC93M1FJWmtHNTBicTVLaDZNZThISXVCMnR2d1hoRE5tVGM0UTRRa251RjhD?=
 =?utf-8?B?dlJnNHhmMEhscUhMeFAvWGE1QmpUZHNYdU5yQUFDSzZ1ejY3NlBiRnA2azRh?=
 =?utf-8?B?WXN2OFVsOEZyV3FscGhQM053RkN6MlQ5UE9sdVRNUStzL0tQaWNTMHA4NDVR?=
 =?utf-8?B?RmRocEZLUGt0STZiSkMvNDg2YXRPS0h3My8rN0R2Znp2SVI2R1p5MzJaenB0?=
 =?utf-8?B?bEsveGM0alhpa3loU0lJcjAvMXJ4RFZZZjJuSkZuYVJMNFl1WnYwUytDa2VM?=
 =?utf-8?B?amJ5YVUwZ1BhSE9ueXlOZ2JHMlU2Z0RCUkVHQnpWQ2Jmekdvclk2QXl4VlJv?=
 =?utf-8?B?anFJRjVaWGs3R1ZkSC9kenphZk1tREtsbDVVZ3RzR3lFWkREZ0hGS1ZaMEtu?=
 =?utf-8?B?aWYzSjJlRUtCWW9NRE5JbDVWbzlHazRZQ3ByVlppeDk3RGhZaHlJL2E2Y212?=
 =?utf-8?B?SExzRkkvNlczUjU5TnAzenNsNHkzWnNBWGlzQ1ZXNXh5MFhZTjFzdnVVUUZL?=
 =?utf-8?B?dzl3ZitpcldrZDR5UFVsNUFFN3JOR0FOdzByaXdKSUIvaTRhTWNDS3ByeHcx?=
 =?utf-8?B?S2ZqYVp4SzU3Y05GL1UxRFVuTlY3RnpaMkxlOEFscDhzczNqb3U3cjUyU0Y5?=
 =?utf-8?B?TnhsZkRxMDZTK0FEM1I2WjEwRGkySUpnTkZ3OW56WkcvL2FCNUE0ZVpURFJT?=
 =?utf-8?B?bHp0bGh5MStQODFoa3BsZkFUbGdzU0J6RWQ1VVFZYmJqOFdrRU52Z1V6MTBk?=
 =?utf-8?B?STFyVEhuMDF1N3FEQWs3eHc0bUcxdEVKTU1TSUxWZkVXWEswcjZjdmhiWHRi?=
 =?utf-8?B?L0NqVzJ0TWkvbU80eXJpdUxmMVpLWnR3WlEveFdYTlROOVZyTTBhS3hsb1M1?=
 =?utf-8?B?Vzk0MDRXQ3dXWmlNS1puNmhlMzBQL3htYWgwcG8zVGFGM25Qd3hTMUx2L1hj?=
 =?utf-8?B?M2U5YmFtRzBrSTQxWEtkNStTdTZOZXpRMlVYK25BZVJiUjkzUUs3ZzZmb1JR?=
 =?utf-8?B?MFAxOGxzZm56cGpiU2xLbzl2bERJdmlHZGNZaFZFQ0ZHS09TeWZleGIwaXFJ?=
 =?utf-8?B?VDlVVko0R2p5T1RLdlNRSFpZV1BYT2RVTkxXSW1xcTlESVFwY0psQjR0MUdV?=
 =?utf-8?B?MW5JWkZJVDFKdjNVV1NPV1pIcXRnc2czakQyZzZCb2FxR2JFUGJiV1lrRXZn?=
 =?utf-8?B?NWptTFlaaHBJVDd1SWlvTUhJWlVMZmppRGNOL2JQb3E4YzV3TjAyUlY2bWFE?=
 =?utf-8?B?enQ5ek9VazRSUER6UjkvMmZEb0VjVXFlWUkyZm5MYmpuLzBlZmQ4Ry9la2E2?=
 =?utf-8?B?SnFQTVcrRVpYRmg5M2JURUFsRDhqNHplRlNKSE42MWNFaXNta1JUODFQNXd6?=
 =?utf-8?B?c05QMkJISWJQM3dJclV6ZFFueWllRUtVVnVFanhPVG9BazZJMlB4NlQxRDkx?=
 =?utf-8?B?WjY3Z2tRYXdld0w4STl1Z0Z2UkxzVWt5dW9LdlpveG10Z3hwcGRNMXFsQUpE?=
 =?utf-8?B?ejlrWVh4cmt1ZHc1NmFpU3RiTTFLeThtOW80cUlad0pHQmo2QnRrRjBycktY?=
 =?utf-8?B?a2tndkk0RXhKMzhwcnBOZzdrS2ZuSERHSUQwOW1TSmRwUXJqbUFwcE1WclBE?=
 =?utf-8?B?Qkkxak9YbFpwRlVaRUcyV2o5MzIxRVN5ekZDWnhyMUIxUlVHVlR5NUhpa0lk?=
 =?utf-8?Q?mQKmJAnzVTZIJrvhecDbuh3c3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4763CE33D28FF240983D5CFB7C8D2196@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a91a89c-e5f2-49c7-cefd-08db97e6ab63
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:08:37.6734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5fa3IjxlIzetQ5NcV6zJfglN3l9/71g236BxVwf0smtp3hRRHx00z0dFh9V6l2MH/MIHwkKL9jHqojZNx0Yr00KBJahKO7JK5p7Qf09QlsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2052
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgVHggYW5kIFJ4IGVudHJpZXMgZm9yIGEgZ2l2ZW4gY2hhbm5lbCBhcmUgc2V0IGluIG9uZSBm
dW5jdGlvbi4NCj4gDQo+IEluIG9yZGVyIHRvIG1vZGlmeSBSeCBlbnRyaWVzIGFuZCBUeCBlbnRy
aWVzIGluZGVwZW5kZW50bHkgb2Ygb25lIG90aGVyLA0KPiBzcGxpdCB0aGlzIGZ1bmN0aW9uIGlu
IG9uZSBmb3IgdGhlIFJ4IHBhcnQgYW5kIG9uZSBmb3IgdGhlIFR4IHBhcnQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4N
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgfCA0OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L2ZzbC9xZS9xbWMuYyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiBpbmRleCAxNDZlZWJj
MTI3MzcuLmM4ZGRkMmE1NGJlZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3Ft
Yy5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYw0KPiBAQCAtNjEwLDE0ICs2MTAs
MTQgQEAgc3RhdGljIGludCBxbWNfY2hhbl9zZXR1cF90c2FfNjRyeHR4KHN0cnVjdCBxbWNfY2hh
biAqY2hhbiwgY29uc3Qgc3RydWN0IHRzYV9zZXINCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAg
IA0KPiAtc3RhdGljIGludCBxbWNfY2hhbl9zZXR1cF90c2FfMzJyeF8zMnR4KHN0cnVjdCBxbWNf
Y2hhbiAqY2hhbiwgY29uc3Qgc3RydWN0IHRzYV9zZXJpYWxfaW5mbyAqaW5mbywNCj4gLQkJCQkJ
Ym9vbCBlbmFibGUpDQo+ICtzdGF0aWMgaW50IHFtY19jaGFuX3NldHVwX3RzYV8zMnJ4KHN0cnVj
dCBxbWNfY2hhbiAqY2hhbiwgY29uc3Qgc3RydWN0IHRzYV9zZXJpYWxfaW5mbyAqaW5mbywNCj4g
KwkJCQkgICBib29sIGVuYWJsZSkNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGludCBpOw0KPiAgIAl1
MTYgY3VycjsNCj4gICAJdTE2IHZhbDsNCj4gICANCj4gLQkvKiBVc2UgYSBUeCAzMiBlbnRyaWVz
IHRhYmxlIGFuZCBhIFJ4IDMyIGVudHJpZXMgdGFibGUgKi8NCj4gKwkvKiBVc2UgYSBSeCAzMiBl
bnRyaWVzIHRhYmxlICovDQo+ICAgDQo+ICAgCXZhbCA9IFFNQ19UU0FfVkFMSUQgfCBRTUNfVFNB
X01BU0sgfCBRTUNfVFNBX0NIQU5ORUwoY2hhbi0+aWQpOw0KPiAgIA0KPiBAQCAtNjMzLDYgKzYz
MywzMCBAQCBzdGF0aWMgaW50IHFtY19jaGFuX3NldHVwX3RzYV8zMnJ4XzMydHgoc3RydWN0IHFt
Y19jaGFuICpjaGFuLCBjb25zdCBzdHJ1Y3QgdHNhXw0KPiAgIAkJCXJldHVybiAtRUJVU1k7DQo+
ICAgCQl9DQo+ICAgCX0NCj4gKw0KPiArCS8qIFNldCBlbnRyaWVzIGJhc2VkIG9uIFJ4IHN0dWZm
ICovDQo+ICsJZm9yIChpID0gMDsgaSA8IGluZm8tPm5iX3J4X3RzOyBpKyspIHsNCj4gKwkJaWYg
KCEoY2hhbi0+cnhfdHNfbWFzayAmICgoKHU2NCkxKSA8PCBpKSkpDQo+ICsJCQljb250aW51ZTsN
Cj4gKw0KPiArCQlxbWNfY2xyc2V0Yml0czE2KGNoYW4tPnFtYy0+c2NjX3ByYW0gKyBRTUNfR0JM
X1RTQVRSWCArIChpICogMiksDQo+ICsJCQkJIH5RTUNfVFNBX1dSQVAsIGVuYWJsZSA/IHZhbCA6
IDB4MDAwMCk7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyBpbnQgcW1jX2NoYW5fc2V0dXBfdHNhXzMydHgoc3RydWN0IHFtY19jaGFuICpjaGFuLCBjb25z
dCBzdHJ1Y3QgdHNhX3NlcmlhbF9pbmZvICppbmZvLA0KPiArCQkJCSAgIGJvb2wgZW5hYmxlKQ0K
PiArew0KPiArCXVuc2lnbmVkIGludCBpOw0KPiArCXUxNiBjdXJyOw0KPiArCXUxNiB2YWw7DQo+
ICsNCj4gKwkvKiBVc2UgYSBUeCAzMiBlbnRyaWVzIHRhYmxlICovDQo+ICsNCj4gKwl2YWwgPSBR
TUNfVFNBX1ZBTElEIHwgUU1DX1RTQV9NQVNLIHwgUU1DX1RTQV9DSEFOTkVMKGNoYW4tPmlkKTsN
Cj4gKw0KPiAgIAkvKiBDaGVjayBlbnRyaWVzIGJhc2VkIG9uIFR4IHN0dWZmICovDQo+ICAgCWZv
ciAoaSA9IDA7IGkgPCBpbmZvLT5uYl90eF90czsgaSsrKSB7DQo+ICAgCQlpZiAoIShjaGFuLT50
eF90c19tYXNrICYgKCgodTY0KTEpIDw8IGkpKSkNCj4gQEAgLTY0NiwxNCArNjcwLDYgQEAgc3Rh
dGljIGludCBxbWNfY2hhbl9zZXR1cF90c2FfMzJyeF8zMnR4KHN0cnVjdCBxbWNfY2hhbiAqY2hh
biwgY29uc3Qgc3RydWN0IHRzYV8NCj4gICAJCX0NCj4gICAJfQ0KPiAgIA0KPiAtCS8qIFNldCBl
bnRyaWVzIGJhc2VkIG9uIFJ4IHN0dWZmICovDQo+IC0JZm9yIChpID0gMDsgaSA8IGluZm8tPm5i
X3J4X3RzOyBpKyspIHsNCj4gLQkJaWYgKCEoY2hhbi0+cnhfdHNfbWFzayAmICgoKHU2NCkxKSA8
PCBpKSkpDQo+IC0JCQljb250aW51ZTsNCj4gLQ0KPiAtCQlxbWNfY2xyc2V0Yml0czE2KGNoYW4t
PnFtYy0+c2NjX3ByYW0gKyBRTUNfR0JMX1RTQVRSWCArIChpICogMiksDQo+IC0JCQkJIH5RTUNf
VFNBX1dSQVAsIGVuYWJsZSA/IHZhbCA6IDB4MDAwMCk7DQo+IC0JfQ0KPiAgIAkvKiBTZXQgZW50
cmllcyBiYXNlZCBvbiBUeCBzdHVmZiAqLw0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bmJf
dHhfdHM7IGkrKykgew0KPiAgIAkJaWYgKCEoY2hhbi0+dHhfdHNfbWFzayAmICgoKHU2NCkxKSA8
PCBpKSkpDQo+IEBAIC02ODAsOSArNjk2LDE0IEBAIHN0YXRpYyBpbnQgcW1jX2NoYW5fc2V0dXBf
dHNhKHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgYm9vbCBlbmFibGUpDQo+ICAgCSAqIFNldHVwIG9u
ZSBjb21tb24gNjQgZW50cmllcyB0YWJsZSBvciB0d28gMzIgZW50cmllcyAob25lIGZvciBUeA0K
PiAgIAkgKiBhbmQgb25lIGZvciBUeCkgYWNjb3JkaW5nIHRvIGFzc2lnbmVkIFRTIG51bWJlcnMu
DQo+ICAgCSAqLw0KPiAtCXJldHVybiAoKGluZm8ubmJfdHhfdHMgPiAzMikgfHwgKGluZm8ubmJf
cnhfdHMgPiAzMikpID8NCj4gLQkJcW1jX2NoYW5fc2V0dXBfdHNhXzY0cnh0eChjaGFuLCAmaW5m
bywgZW5hYmxlKSA6DQo+IC0JCXFtY19jaGFuX3NldHVwX3RzYV8zMnJ4XzMydHgoY2hhbiwgJmlu
Zm8sIGVuYWJsZSk7DQo+ICsJaWYgKGluZm8ubmJfdHhfdHMgPiAzMiB8fCBpbmZvLm5iX3J4X3Rz
ID4gMzIpDQo+ICsJCXJldHVybiBxbWNfY2hhbl9zZXR1cF90c2FfNjRyeHR4KGNoYW4sICZpbmZv
LCBlbmFibGUpOw0KPiArDQo+ICsJcmV0ID0gcW1jX2NoYW5fc2V0dXBfdHNhXzMycngoY2hhbiwg
JmluZm8sIGVuYWJsZSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiAr
CXJldHVybiBxbWNfY2hhbl9zZXR1cF90c2FfMzJ0eChjaGFuLCAmaW5mbywgZW5hYmxlKTsNCj4g
ICB9DQo+ICAgDQo+ICAgc3RhdGljIGludCBxbWNfY2hhbl9jb21tYW5kKHN0cnVjdCBxbWNfY2hh
biAqY2hhbiwgdTggcW1jX29wY29kZSkNCg==
