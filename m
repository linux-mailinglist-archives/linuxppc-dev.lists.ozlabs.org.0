Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1379D929
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 20:50:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EUxP1Oww;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlXj24CRLz3dF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 04:50:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EUxP1Oww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::603; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlXh60x1tz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 04:49:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUnfvjznMQSx0ufEOoTeGzQxwccHot/sXaTGLgEs4d25uY70gibQ7KiWPMJZU9CQjWSepyUxg/UqLhzo4EZyCaEf8Z1rCHQr6mEVqFIIq9kSRnc8dijlEOZE2o6qSRseDz52S/LQhmuRdUM3Tq2lPy4xOrdY+fAu66epAnpxcHUkJ5G4T4cgr9TUIgqfoO7ROVtMMOlGwDm1H7Z9WpwNVymxnoGQmNYzeB1JjwdE4EBmeRPql1uuCp/FjAPs03WdRdo1xJAjTi/MIH8EgwfSJnx0TfFeRMtdje85EndUXQxBcrdkg9Z6kTkTfVFjOfIxGL6v8hv5/mf9kpkgwL631Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teCKCYwIyhUSuuF4FfXAlULaQRwcj7iBACpMP0qRhKw=;
 b=Paxnambz4PtrAGCABmJM6RVkt0nVqmUqCgmGK0YpK6xpZz/9SH2WDxf0y7wrCxFVI1FLF2MttTKZ/i+az1PYTAWpVxvthdz0Pmu2nOpxLj7wR+NQmorzKuwTHIcwlBBfvhh9kjRGJLCgiNH9ZbjElayCQ2MlYMCZFjl7IAOk6CwKOCr18Cpkxr28DzYeu8NJPNR6uoQS7gwAXGMH6oCV5x737hpGZffhhoVgQ3O8/UOVH+tk0+r6Rws+Un+/8dUs32mVQ+aFAsud+NVUHf/tUeXZ4MBj65ETfqTM7GHccLXibtDOiAJc6Q21sDsAEwlFdBr8LeEynAvpWQD9eNQyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teCKCYwIyhUSuuF4FfXAlULaQRwcj7iBACpMP0qRhKw=;
 b=EUxP1OwwiEgS33MFkGTbGivqtgsu3ro4ENnI5evYC9ZoUWn5L8E7QV+d5SDSKURxSj7Jf39bkHefiEggGoKnHhOZjFhpfzhQjvCz6Pe5XZwnQQ5+oUyHbx16qPPuPYlbmx0+v6v/ubu/imcjK/LhqtYqcCJRjqPZwSnAwpUBF6nR3a4qcMJtFKP4ouKA3Ohsa0z4eHCo+9T9clkUa+JhO/MMXIwwKCa/xcGNEfyg4Ll0gkaeaSDRmr6u5V2l3owwEHJYYXkQpntL7EuU4W8hgdmihJrSwz25DfOdkRozyFngCimz1SHMjNGceXk0bduzpBDdCIj5Yaec49gwLyGSQg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3403.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Tue, 12 Sep
 2023 18:49:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 18:49:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Conor Dooley <conor@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Thread-Topic: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Thread-Index: AQHZ5WH2BcxmfZPRPE6nid3HeITn7LAXfukAgAAKBoA=
Date: Tue, 12 Sep 2023 18:49:26 +0000
Message-ID: <992a2b31-e21f-eee3-8bfc-a65b69fe5bd7@csgroup.eu>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101444.225809-1-herve.codina@bootlin.com>
 <20230912-overplay-donated-080eb97803d6@spud>
In-Reply-To: <20230912-overplay-donated-080eb97803d6@spud>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3403:EE_
x-ms-office365-filtering-correlation-id: 2b0ee020-d340-48b7-439a-08dbb3c0fd4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XFxrvl9owCqrNZeDY/XcGN5yCWPF7kr0dnNrsouvx347hEFCDMqXQZLENHwx4F6LbLjvG88yzOj7ZDu2dZ1G50MI8354VoiXczdExoMI4mgszm8JZIFrKER3XjX/ofn2ku+crY4zD98HKAkhvK5F7lJJXWRKDVXK3SBz+zLlP6o2up2xv2nuujhPQiQeaC8Vjw8oc4YMm3DxORliS3JMq6zI/I3lxgeLJE6jR837eq4iQq0H7fskrRx4TrXhbPdvaAMsaP7FQ8teDClR5GDn4ao5V3XgStKK8mergLRcLygIU8h5+LBeIj3hQaduDssZf5URX7UH9rWEIK42K0Z8OYE/4Sl8sXPD6GtHiapNMAjroDrJsfNysp8v4d11YzPXuUxJ73/F6bwTUNZcft7qXk3W6O28dkY73fkGVSXPssc6UWjyXsL08bTfoXEKsMXl48qB9ZqLQJN33NK/XfebJQEdHYohMGShgEV2+cOKJ2zCWA4sm4Ze1Nsi1iukbkOggeap13Y93uuXgfaikmvOQBxM3DxVH1gWv44DPBjWc7Ku4DRSc9bN+yKmaV555Hx2PguaokubY3BThSw87vOBwmKr3vfW0olEX49uqwzddsjxXdqy6aCiiLWTaaWyzrhqt5Q28LRG3AeLVUJI/IlvXLqu2+IsVIb+uH8vHXINWxBUMKdY7rqCDGGPbxMoyyFK
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199024)(186009)(1800799009)(36756003)(4744005)(2906002)(31696002)(86362001)(26005)(6512007)(7406005)(7416002)(31686004)(2616005)(71200400001)(122000001)(38100700002)(44832011)(38070700005)(478600001)(5660300002)(6486002)(6506007)(316002)(8936002)(4326008)(8676002)(76116006)(66946007)(41300700001)(110136005)(66556008)(54906003)(91956017)(66476007)(66446008)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cGxXQkRWUnN5aGp0R1c2ZmdhTWgxWGRZSE12ZlhUS2lBbDRtdUIrS3cxdFNr?=
 =?utf-8?B?NUZGc1dXQ2tWUGF3ZDJmZ294Sy9DMm91OWlWTUdUQTJ0RnBGTkdtNXpFNEh4?=
 =?utf-8?B?K2NrVkgvUnRDUUd1eXBKc2hEVncrQzduY21rbndwb05hbDhQUE1kNENaTXpP?=
 =?utf-8?B?ZFpPM2o1Q2tHMXFtWW5xc1JzQ21Wa0Z2ZDM0VlJoNkpzZXJpR0MySkFDd3dT?=
 =?utf-8?B?Y3FKK2NXRnZtUEZnd2JWNUFya1creEEwMHFaUkY0ZzRiVWczNjR4QzVnblpF?=
 =?utf-8?B?dWY2UWVZUC9BSFZ3d09pTGRFaW1NVFJPR3FjVUFXbTVjUUM5Yko0VUg2THFp?=
 =?utf-8?B?WHZZTFc5VUtud2J4Z1pjenR5eWU5WGhSUXJrQk1URitCeER1WCttUFp6SmZ3?=
 =?utf-8?B?dEtSaThRNnRSSy9Ybk5qRTZZbEpKTUJyZ1JrVmF5bklYYTBkWVFCZGx1YjBT?=
 =?utf-8?B?d25wNmRac283R2VMRzExcUw4RC90dytkMUZJenBpNmptTjV0eDl6VkdJeDlP?=
 =?utf-8?B?NGZkanRCdS9aTjZzOUtzK0R0Y0p3RlZJWEhmbUZQNXVSbjJ1VWJBaEt2UmtM?=
 =?utf-8?B?V2tjSW1jUjNETzBjQk1vTjJzdzA3ZGpON2lwN056dUpKdXJnaktieElHcTdW?=
 =?utf-8?B?UE9sbVZSZzZnUDdPZHlCMWVDRG1JSExUbTZQbVQ2aHVYajNRYm4vNmpYTkZa?=
 =?utf-8?B?cjVIcVJ4MEZCV3B6NmJ6YVdSLy90cDVSOW5VTW5MVVlqYnBrQ05nUU0rMzF6?=
 =?utf-8?B?RkNkNTBuWUowSG9pOENBWTB4T1o5YjlzNFhpbWE1eXVkNjFqdmY4bEVWTEUr?=
 =?utf-8?B?dFpqUkFhZTFXS1VlM09QZm0zWEcwSXY2QTZPQ3pqRWtRdkNyaHRTeTlSV0hL?=
 =?utf-8?B?RE9EbXp4RDl1YUl5TmsxSkJ0QXRsdnU2bVJqRlozKy9nMUJVOEt4T05KdDlh?=
 =?utf-8?B?dnJpZFdldVBnMFR6ZjlQS2R0M2pvTUJudFNsSDBZQ3dHd3JOUUkxNU5ENDJx?=
 =?utf-8?B?ZDFZUk8wdWduNFFyYnE1S3pVTFZNNjJRQklodGk1azhUZTRwbitsRExneEJw?=
 =?utf-8?B?ZTN3WGN1Y0lzb2NwdVprdkloelFrNm1XejgwTUZYRDRldTRjUW4rTFFTV3Bp?=
 =?utf-8?B?dkVFdHlxUmYxamtKa0RwS0g0TlZuZnFmQzgwTUU3eU9ROFFVbjBLSmNjMk5y?=
 =?utf-8?B?SGpkdzBZMjZOSFExeUtiVW9wVEJTa2l6N2NTbTlIemJ3TGY5eWlueGhWMld0?=
 =?utf-8?B?cGFYWXpOVmsyVU5Ud3NseG1Fdnd1NzhtaTNTc29JUDdUMW1UQk1iNXNFaXQ3?=
 =?utf-8?B?YXB4akdlYURycmNTMXJFOElmbmVONXVTekhTZThobjRBNk9MQmhNUVl1NTJX?=
 =?utf-8?B?UGdaelI5aVVkWlZrd2x0WjRhOEowMTFHUnJyaEdEZ294alBSYy9uT1JDVkw5?=
 =?utf-8?B?VjJqL3c3WllaSXBuL2s4bUtUY0xRd0VRTEVOanpiMHl2ZnpLdlBvVjVFd3lB?=
 =?utf-8?B?eHJFdWJvN1pSL1Q1VTR6ZTJJeHZIR1VrYVNzMVZoNThrcmdPOFRZbHByZ3JB?=
 =?utf-8?B?REFsUlBOR2N1dzczS1JPb1ljalRFSzlqZHE5YjNKdXBLSkJvK2hYMG9YTStr?=
 =?utf-8?B?Skg4dnRENjVYZHRrN1RESVp2NzNLZDlGakgzWEhRcEtIOGc4TUllZXpJQm5L?=
 =?utf-8?B?RkFtU2N5NzZOc3BzRnRrVkE0WlZPQXlRSzFtd3lBKzJxSFpNc1UvY3dEU0E5?=
 =?utf-8?B?WWE4YTh1ZWVvc0hSWXpOS0M5RWhVdFVSM1F4V1JhSWVtK1J1WW1wWG1WSU9M?=
 =?utf-8?B?ekNMcGVGN0FpTGdBYWNPQ0dKM2VYNDFUWTdVdVZQdHFFZHZUNHRHOUhmdXla?=
 =?utf-8?B?WlkrN2w3RUFxOER2ekJNREVWbUg4WHQ0U3pDU1VCZXhtRmxQZlpxcFF1K0hP?=
 =?utf-8?B?aDVyZUNIdmYwdWNPcWNLTXE4ZkpuNm5PVXp2c29ON0ZqYm5JeXJwQ21iN2RX?=
 =?utf-8?B?Y1VRWjIySU1jaGh5YWhyby9naU5MZFJsV256WHpLT2xLM0w4TndYOEhPbVF0?=
 =?utf-8?B?OVRabG8vWHAxVzFNai9jUjUySzBtRFBYVm1XbDF1dk8zWjlNWmRFZGkxYnRV?=
 =?utf-8?B?V3RhcXVzQmx3czZMOG9HVno5Z3hxWWlEcXRUWXdiaGhQZzNuTWd4Z0xYN3Ri?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEA972C0B6483E47B16A7E7B39482E89@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0ee020-d340-48b7-439a-08dbb3c0fd4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 18:49:26.7243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7W35dA86Zsv3bMD2qlY3Pg5JR1J1edSwgsE9aNl8Tmr3ElZcbpv/FFWNUk/GrHcQ+a9LtvxAid/Ihcunco1YanF89wLT1uRIezNsBFzt/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3403
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
Cc: Andrew Lunn <andrew@lunn.ch>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.or
 g>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA5LzIwMjMgw6AgMjA6MTMsIENvbm9yIERvb2xleSBhIMOpY3JpdMKgOg0KPiBZ
bywNCj4gDQo+IEknbSBub3QgYXUgZmFpdCBlbm91Z2ggd2l0aCB0aGlzIHRvIGxlYXZlIHBhcnRp
Y3VsYXJseSBtZWFuaW5nZnVsDQo+IGNvbW1lbnRzLCBzbyBqdXN0IHNvbWUgbWlub3Igb25lcyBm
b3IgeW91Lg0KPiANCj4gT24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMTI6MTQ6NDRQTSArMDIwMCwg
SGVydmUgQ29kaW5hIHdyb3RlOg0KPj4gVGhlIExhbnRpcSBQRUYyMjU2IGlzIGEgZnJhbWVyIGFu
ZCBsaW5lIGludGVyZmFjZSBjb21wb25lbnQgZGVzaWduZWQgdG8NCj4+IGZ1bGZpbGwgYWxsIHJl
cXVpcmVkIGludGVyZmFjaW5nIGJldHdlZW4gYW4gYW5hbG9nIEUxL1QxL0oxIGxpbmUgYW5kIHRo
ZQ0KPj4gZGlnaXRhbCBQQ00gc3lzdGVtIGhpZ2h3YXkvSC4xMDAgYnVzLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KPj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pg0KPiANCj4gTWlzc2luZyBhIGNvLWRldmVsb3BlZC1ieT8NCg0KTm8sIEkgZ3Vlc3MgaXQncyBh
IGxlZnQtb3ZlciBvZiB2ZXJzaW9uIHY0IHRoYXQgSSBzZW50LW91dCB3aGlsZSBIZXJ2w6kgDQp3
YXMgQUZLLg0KDQpJZiBhIHY2IGlzIHNlbnQgSSB0aGluayB0aGlzIGxpbmUgY2FuIGJlIHJlbW92
ZWQuDQoNCkNocmlzdG9waGUNCg==
