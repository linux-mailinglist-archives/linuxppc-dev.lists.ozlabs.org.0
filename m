Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 145AC697C60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:54:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyhH6lpcz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:54:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tl7P6eJX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe02::625; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tl7P6eJX;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on0625.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGydJ6jL5z3gLd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:51:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsoKR2Yc2U65BiJKo9OIHQd26/uuf0/jcpJWxrZHu/uplzGcuwrV7hFHKeOWgQWmCD/rDmVIfE1cBNoKvUJjNM20MnjLpDn5E0leRBCpgbeZS8bptkK0u6psGUK0jPLUlDTUKajTfZN3QMcvhXPlT6Y/Yg2oONq+uIdtA2Sg/AtTSQFQUftHNfxwaZs5vUem3Vl8xticWF808/+jYD6fuvePGczCEe+BJ5wglgsXuPXzgmyCfXc272izXCUhXS0xcop+5v+q+oJhoCygOlV67JV3pJJz+UCjgk9vg+/6+xP115UFgxXHrt9dFPYkqLO85OQswn5KWFd2oy88BAcwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyLcHahteACMrGF68YjoUCsPe4rRSX0yX9FSkSL06hs=;
 b=IzOHeYuEcc2rbrJuKA2FNcVIjMYWdQZhdQE2ee2o5IT3nsRsVxYBYLUKR8JYbqkQW7RnXttnaeGgjrK7JcOXCrfp4lyXdNxt4RwWiEEHwk+TFw6q7gh9IuRsZve09ulfqUOqDHXGq6UStDNUBECoqCAUSAzJulifO+2UpTZwADZFLzNMssKT+pb2TNiH7bWJyi2nUtqvz3vyfluN698LdWFI1xCLESlhuCfLKKYJPc0seh3NHP66tEQKizCiFnQM20bNQkQJ0I0w9slEfsaOPmCRVe0QJLRx0ZQ6C/q8mEXnLsVz2MMiEwZFlGj3c3sumRG2GXe3wani0EHNQg3Iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyLcHahteACMrGF68YjoUCsPe4rRSX0yX9FSkSL06hs=;
 b=tl7P6eJX9ucaWnpTp7lteW+DvR5YcHzj6ZF0Br3QOikM8ia3ojnNqe+Wie7Mx7fj0ulz+tt6KTDoh7XL1oICIkGGNubGo7PIbpn8iAchVPfFoy3bPtRfK5+qrUZJ5N/yxc7lqWXoM3IWGC06ZZMbzdg1WSVl1LtTBw0dV/5C07Q9DBYPt1RV1T5TBMn+BwkipT2k2Pv+kFS8gNWQmzufwb+d96Wo8daoKwmt/zBdPBpjeWBOJlzoaHMEzRrdfepWwjCxM02r9Eh6ZYadHRXwc8u6SXUti51n/3sB1+UOkAVXU6h1WneMLqr4uMSTY1UPbRI7NhMbcXwtxtzOXWDKfQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2466.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:33::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:51:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 12:51:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: kernel test robot <lkp@intel.com>, Herve Codina
	<herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao
	<qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
	<Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
	<nicoleotsuka@gmail.com>
Subject: Re: [PATCH v4 06/10] soc: fsl: cmp1: Add support for QMC
Thread-Topic: [PATCH v4 06/10] soc: fsl: cmp1: Add support for QMC
Thread-Index: AQHZMWDGr2mKBcY6wk6Z5heH8S6KT67QFAgAgAABpYA=
Date: Wed, 15 Feb 2023 12:51:27 +0000
Message-ID: <677f9924-9867-7cda-cb8c-92fdea28a16c@csgroup.eu>
References: <20230126083222.374243-7-herve.codina@bootlin.com>
 <202302152037.NXHi2aFY-lkp@intel.com>
In-Reply-To: <202302152037.NXHi2aFY-lkp@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2466:EE_
x-ms-office365-filtering-correlation-id: 4d0ecd82-9925-4501-254d-08db0f535a7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4tGq6X13vNsyCju5JUJo9MCB3LHwhb26EVO2bh4MQ6W0XgE2WE+Zm8od73KyA3AO6oCAylrRXZKEX/SvweKODzA1PM9qK/ZTCWRMkJI/cmqbFlbpXQRNacLpTN/Y4YH6hiPywHRaiXmTav1rWnCX1WHOpMJXd2mh7f8YHmNoGL6ySAp8qygNQXLW3Bev0ORYEXymH4PsmO9kjCtQAyRAoybHEtit2E5DxVfqo1MqvRDP8ZewXsfCDU4LqnDZEnAHPRexlEu7Ljnej6CRXdKZ0I2L0aFI7QKk3hYEaw3KxEh0Qm/9b6szSZF4iIhl/gywDgNQlEYoGzI9RGggYc9SsnNLB7qLOXh0wQRw2l6bNfV9+a+ai/IunGcc5Nf77WnlweCQT+QQmO+GhRUVk682pbfRaupH4phNiZ8YwDN3JHBOec/k8nRO1+JjDElLImCb/z3Lj5BH2Gp1vzHWC8sTCwCBGPJFuEWh2y1jlxMkmhGJSCTv+L9ofqgb0BJq6Mvqm8RaZcmAC25Qm8H83qwU0krC+7NBLWIPmHcLrUjzM2UT5TeXoXztRwPfZvaaUOv47YaLE3MakAmx5/Av58VWJ9EWWhaJ5cRvGlUUty8pd+DVsziSwXCjMlrkOyHxQGtbmvXO4gzHiSW8T66OQ5QYwPfkLI+gipGcUE2i6XFX5wHpZl7VyOL/4qLqOPqHFFupJctGESrK1Sr9NrZrLAQTUTvp1p1FTpqK1MJh1qJnIE2GHMNqJ6VlPmMGZ9fSBK9L8e13ToR26OdGDxS3re7wdRpMVkoEx/5bdXX7V5ldSihZq6G8R7Hr5bU3jNoiEeZ3
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(39850400004)(396003)(346002)(451199018)(44832011)(7416002)(83380400001)(66574015)(38070700005)(921005)(122000001)(38100700002)(36756003)(71200400001)(478600001)(6486002)(966005)(31696002)(86362001)(2906002)(2616005)(31686004)(6512007)(6506007)(26005)(76116006)(186003)(91956017)(66476007)(66446008)(66556008)(316002)(66946007)(64756008)(41300700001)(4326008)(110136005)(8936002)(54906003)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a2FRcnJKNDBiYVI3ekxaWjFjb3loakIva3UxbzE1VzAxVHc5L05ZYSthamxW?=
 =?utf-8?B?Tjl6YUx4dFNnVHJQZlNOa1BGWUpkZGNIb21vOUtDMmNvUm5sWUNTNmkrNzN5?=
 =?utf-8?B?MTN5ZHZBb2FBUEZ1eG9iaFg0VWIyZXBVMzRlMExMQk5QTXI2QXRVK1Y2czg2?=
 =?utf-8?B?RmM2SFJNeXZPdDdUOW5xbXhlVWRVMGIwWTgxQ29CQWUzYXkycldlQkxlWDg0?=
 =?utf-8?B?RGlxclRmbDNMM25LR0h1eWpMSVdFelZ6b0JQUHNHUnlQOE9NQ3RvUk1sYjYr?=
 =?utf-8?B?eUdEVTY5UHJZZXpTaDFLQWI5S2wzazRLbWNhbmE0emtwWVgyOHU3eEdFc2R2?=
 =?utf-8?B?K2V1OFBzbW5GTXhoQzQvWXArMUhLZlR0ZVZmUUt2R1Q0Mzc2YVlNNFllSGs4?=
 =?utf-8?B?VXpzWWs4L0Fqb0NkekxrUWljNEk4L3JWa1UxT1gvOUhhLzN4bkNsUGd3WWJI?=
 =?utf-8?B?a1dFYmh2c1NsRk53MHp2QWFNT0JIckZ2dHZleHNpZHhKQmRTSkpQSGpST2Qv?=
 =?utf-8?B?MXlrYWl3WE9NSnJQaVRFeGpiUGV5N0N2TElveFZ6LzU4Y2xnZmJSeWkwN1RK?=
 =?utf-8?B?V2tXSHoyMGtGY0IzMm5QYWJTbEtPRXh4T0VUUmxwaFdYampINVBzYnEyRDhj?=
 =?utf-8?B?Z3RSM3Q2aStBeUZ3WkwrVWhyaE1qQWYrMXFqc0diWGttZ3gyK3hrRnRtaEpo?=
 =?utf-8?B?WXBKYW9iVDgxT2g0bzdUeXZzS2dkTDdXdVU0Um05QS9VTStRNXBGMHlxcTg3?=
 =?utf-8?B?Zk5jTVJhZXZRbVFXbU9XSWpSaTNRUlQrVkNYRnE0aTh3WDMxeVYwUmsvSUkr?=
 =?utf-8?B?dDJtRkhEaWFMTmVyRC9kSHpNYy85S1JaVlR2UjJjVGdLY1ZFWGJIVGxjRXJE?=
 =?utf-8?B?UXNjV3Z3WEtGOXhkMHI4WnNKczdDL2hXWnFsRlFDYk9zQzhXdlp0ay9BcnAz?=
 =?utf-8?B?UlZBYVN2aVlrMjJCbEFHRlJhaG12cmlZdEpvTEhDVnNxdFJxVDBwODBsWkpT?=
 =?utf-8?B?RFRSUzI0QTlHRHByN2RkVlltckpaZTQ2NXE4NU5SVWlMSUtaY25kT3pjNGhX?=
 =?utf-8?B?aTc5cHlqblVFZERJUzk4bzlmSVFYd0VlQWZmYWFiaEJJRWNuaHU2Qmx0Mk80?=
 =?utf-8?B?c0QvQmt4ZWhvNnJVa3JkazRvM3JPZ0s2RW9oRENBbnpQd0J5V01kT1F4VG9Z?=
 =?utf-8?B?QnpwSGxlVURUWldLYW1QRmNoR3BycFVaTld1eVkvSEMxOTlYRHErWmZ3QkVn?=
 =?utf-8?B?TmtBSDhkcHR6NThMMzhpclBsSGJNWDgxYjRHNHRNdThaTU5aOHdyeG9MalZ5?=
 =?utf-8?B?QWxxclVzNlROblltRDFxb3Y0Qmt0Tm5jcmdFZmYycDNyTGtFS0s0S3A0bFBG?=
 =?utf-8?B?K1hyYWlDWnQ2aFpYMFRuTWZLWE1NWnlMNnNKR215STRtTlFCMjNqamdhSTE4?=
 =?utf-8?B?b2RkNStuVDIvWTI3cjFLa0oyK21UVXVxVE52azNlWmJ5eVYzb3ZpemRoQlJn?=
 =?utf-8?B?ZXdSVGVGOHJWNnZCWERnSDk1NXhxQ2JIeDlDSTBwcHBVMEZMbVdUbjdSYUVr?=
 =?utf-8?B?SUxQbDU1eEtYakp3dXlLMUFlMlBibGtSQ0xhMHJRcnE1TFJBMTdCQnAzd1Jk?=
 =?utf-8?B?UmYvQ0xPVytOQ1hza3ZuUUZ6RnJpdzkzNUJQcFlWbWdFOGxaTXpWRXdwNEs1?=
 =?utf-8?B?MHFNYmVkbXhZTHFIb3F2VGN3MGdjc0c3VytXRHI1eGpqcXIzNGJ1MHJDODF5?=
 =?utf-8?B?d1dtV2ZmYTFxWTRLYkN5c1hZRHNWbi9EdWxHQkpNYnEvcnJvRmdESVRsTnBN?=
 =?utf-8?B?Yk54bTVJS1ZNMDJieEo3bWFydEpDSTgxQmoxUjVsMmZrTC9zMWFEY0ZteTZl?=
 =?utf-8?B?TGJJcWt3cTNTU2tKcTNER2NqMFZPOGVmUkpVUk01eFphelJqZ2xLVXVBS0dI?=
 =?utf-8?B?aUg5S0RKMjduTVhYUS9mbTNJdFFxeHRDdEJmTmdabVJoMVFDb2h6WFhuZE1V?=
 =?utf-8?B?eGpSNWVXWXR0VmJJL1hMY3ZyR1RzZE1LM1BXOHIzS0JicUlNNjhrWWV0N2VJ?=
 =?utf-8?B?VnA2U1d4MVRzUXFlSjVrTFpjTDRVUUQ1Rjh0RXJpdzFEeEsvNENCY3NDUkdn?=
 =?utf-8?B?OEU2aEdQL2hjV0tyZ1NKa1FOUklkNDBvQ00zSGI3SU54aFpMazk2OTVOTGFs?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C9344F7DDF43F42BE06EDA3178F08BE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0ecd82-9925-4501-254d-08db0f535a7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 12:51:27.7688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OhOBvdNdKOeJF+pD+U8fbzQ3IjDzZTCmvLNTzoZnPuC8XZqXg5wpxRd0WbgIppA/Ir629dnfIBjdQzPygSSiBUWVKQxkMvwCJclPtzoUjgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2466
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAyLzIwMjMgw6AgMTM6NDUsIGtlcm5lbCB0ZXN0IHJvYm90IGEgw6ljcml0wqA6
DQo+IEhpIEhlcnZlLA0KPiANCj4gSSBsb3ZlIHlvdXIgcGF0Y2ghIFlldCBzb21ldGhpbmcgdG8g
aW1wcm92ZToNCj4gDQo+IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gYnJvb25pZS1zb3VuZC9m
b3ItbmV4dF0NCj4gW2Fsc28gYnVpbGQgdGVzdCBFUlJPUiBvbiByb2JoL2Zvci1uZXh0IHBvd2Vy
cGMvbmV4dCBwb3dlcnBjL2ZpeGVzIGxpbnVzL21hc3RlciB2Ni4yLXJjOCBuZXh0LTIwMjMwMjE1
XQ0KPiBbSWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwga2lu
ZGx5IGRyb3AgdXMgYSBub3RlLg0KPiBBbmQgd2hlbiBzdWJtaXR0aW5nIHBhdGNoLCB3ZSBzdWdn
ZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVudGVkIGluDQo+IGh0dHBzOi8vZ2l0LXNjbS5j
b20vZG9jcy9naXQtZm9ybWF0LXBhdGNoI19iYXNlX3RyZWVfaW5mb3JtYXRpb25dDQo+IA0KPiB1
cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvSGVy
dmUtQ29kaW5hL2R0LWJpbmRpbmdzLXNvYy1mc2wtY3BtX3FlLUFkZC1UU0EtY29udHJvbGxlci8y
MDIzMDEyOC0xNTI0MjQNCj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9icm9vbmllL3NvdW5kLmdpdCBmb3ItbmV4dA0KPiBwYXRjaCBsaW5r
OiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwMTI2MDgzMjIyLjM3NDI0My03LWhl
cnZlLmNvZGluYSU0MGJvb3RsaW4uY29tDQo+IHBhdGNoIHN1YmplY3Q6IFtQQVRDSCB2NCAwNi8x
MF0gc29jOiBmc2w6IGNtcDE6IEFkZCBzdXBwb3J0IGZvciBRTUMNCj4gY29uZmlnOiBwb3dlcnBj
LWFsbHllc2NvbmZpZyAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIw
MjMwMjE1LzIwMjMwMjE1MjAzNy5OWEhpMmFGWS1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gY29t
cGlsZXI6IHBvd2VycGMtbGludXgtZ2NjIChHQ0MpIDEyLjEuMA0KPiByZXByb2R1Y2UgKHRoaXMg
aXMgYSBXPTEgYnVpbGQpOg0KPiAgICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJj
b250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jp
bi9tYWtlLmNyb3NzDQo+ICAgICAgICAgIGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MNCj4gICAg
ICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXQvMjBl
YzJlYWNiNzZjYTcyNTJhYTI5MzRmNTMzNTc2NjM2NTJlZGQwZg0KPiAgICAgICAgICBnaXQgcmVt
b3RlIGFkZCBsaW51eC1yZXZpZXcgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGlu
dXgNCj4gICAgICAgICAgZ2l0IGZldGNoIC0tbm8tdGFncyBsaW51eC1yZXZpZXcgSGVydmUtQ29k
aW5hL2R0LWJpbmRpbmdzLXNvYy1mc2wtY3BtX3FlLUFkZC1UU0EtY29udHJvbGxlci8yMDIzMDEy
OC0xNTI0MjQNCj4gICAgICAgICAgZ2l0IGNoZWNrb3V0IDIwZWMyZWFjYjc2Y2E3MjUyYWEyOTM0
ZjUzMzU3NjYzNjUyZWRkMGYNCj4gICAgICAgICAgIyBzYXZlIHRoZSBjb25maWcgZmlsZQ0KPiAg
ICAgICAgICBta2RpciBidWlsZF9kaXIgJiYgY3AgY29uZmlnIGJ1aWxkX2Rpci8uY29uZmlnDQo+
ICAgICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy0x
Mi4xLjAgbWFrZS5jcm9zcyBXPTEgTz1idWlsZF9kaXIgQVJDSD1wb3dlcnBjIG9sZGRlZmNvbmZp
Zw0KPiAgICAgICAgICBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxFUj1n
Y2MtMTIuMS4wIG1ha2UuY3Jvc3MgVz0xIE89YnVpbGRfZGlyIEFSQ0g9cG93ZXJwYyBTSEVMTD0v
YmluL2Jhc2gNCj4gDQo+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2lu
ZyB0YWcgd2hlcmUgYXBwbGljYWJsZQ0KPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4NCj4gfCBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1r
YnVpbGQtYWxsLzIwMjMwMjE1MjAzNy5OWEhpMmFGWS1sa3BAaW50ZWwuY29tLw0KPiANCj4gQWxs
IGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiANCj4gICAgIHBvd2VycGMtbGlu
dXgtbGQ6IGRyaXZlcnMvc29jL2ZzbC9xZS9xbWMubzogaW4gZnVuY3Rpb24gYHFtY19wcm9iZSc6
DQo+Pj4gcW1jLmM6KC50ZXh0LnFtY19wcm9iZSsweGQ4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgZ2V0X2ltbXJiYXNlJw0KPiANCg0KSSBndWVzcyBhIGRlcGVuZGVuY3kgb24gQ09ORklHX0ZT
TF9TT0MgbmVlZHMgdG8gYmUgYWRkZWQuDQoNCkNocmlzdG9waGUNCg==
