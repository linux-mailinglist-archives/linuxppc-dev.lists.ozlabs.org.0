Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390877738B0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:42:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=iyQVsLxR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKlXF0sS6z3cRY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 17:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=iyQVsLxR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::605; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKlVF1HfRz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 17:40:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCgGkuNQ927fdwx3Ob5DXI46V9wBqgvlpovZhW9biavF9ObotX6UXPrHt96VA1Tc3dDA7NRux/fyCSLlYgJjOU1PAIsMQtAMgQ11rnRPcxklyYyRfj84LGTGEEiYUBALOa/Db17G6Lvmx7lwMy51tP6c1AsEupp+VjcOpK8uGwnTYW87fbdh2YQfjaauYBoQilQMj5O5+0eiisjYYZ0bO+CPzezhEeTUUC26Z3+H8SRkQozvA7rv0dPLFiISfShZncwu10odKqMpGOLppBfCHz6Ig6Ayy0sIPKovCY125B87ovYSvunTzOAYM7sqd8M8rPg/JDxjpOct8W106TQB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHLZjzV3G2P09k9pJt2GLKCK9DsWEWpXRGy5+HwzWYY=;
 b=QF37hYSTTZ0A6/9wNKBfOzXR55MUG6mCThsjWA2WgZp1Dj0qv1qXPizn96RMUFGETbdAZTpQgDk5Lkr2Ntc7gOrOALJBUnTLgQFB7g4Eqf3CPHseGz53q5c79evNxpbfIzq0oKAC92q+QlHrO/VxuareVEI2lAwA4rDF2Yhaf+u7VOp6HQJaIE5X/GMXamHRd1E6Gh6s6nnT/yKzc75PZ6zZcC2DorH26nSkel95hc7aHhqBTj6GvD+T+7MT9owTtCVmQNYHRpht/TdxLi8syU39J+P5iIwoHWJmBVmjytC0plHLU/Kh8xaSpJcAvCd8oFxb5ApAwdbefWeDmbydoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHLZjzV3G2P09k9pJt2GLKCK9DsWEWpXRGy5+HwzWYY=;
 b=iyQVsLxRgyluveYQKSDH1j9+ardS8K4FiqMCwsA793hUi+F4JGDUj+vn1BY2WxEjTPprHHstdiFxiGD8pB4cXFQyEJ/F/eecgjUSu3XqClyF+ST+V3C62OnHihE0k9XvwXbA+I/NjM3o6JcAuTV9+9m4F7meP9w37emoGge8mamTb3uYkVBQiUSRAyFQ+UZqFawRWmjCq2bDXEHqYoqfclP0uOOVNcp708BefE0hBdNpzEgIzDJultiaiL5JShFMhlDLffDwIIn0Q4pH9I5pS/kOauciEgcWNT8xDfYVKQ2fOuXDnQmyw+eZbFhnCw3AuMHDWOO4zXzzgxJ/SFiaxg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3348.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:40:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 07:40:42 +0000
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
Subject: Re: [PATCH v2 02/28] soc: fsl: cpm1: qmc: Fix __iomem addresses
 declaration
Thread-Topic: [PATCH v2 02/28] soc: fsl: cpm1: qmc: Fix __iomem addresses
 declaration
Thread-Index: AQHZv9I7hBUFLqDQB0acyyZVljFTjK/gF58A
Date: Tue, 8 Aug 2023 07:40:42 +0000
Message-ID: <6eff02f1-c3fd-d265-ae7e-ec10438b1901@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-3-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-3-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3348:EE_
x-ms-office365-filtering-correlation-id: 164ec022-05cc-4529-1edb-08db97e2c4b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CKfOC/mA2BKLWqR1Ad+cQA8Yj5M9NeL5lEElKuBHZ1XFp1XhEMegfMaArFeEMFj5bBYsM95cXKEZw/v63A8Fr6In2qeHVUQWIiIoEiRdsoNPHdoXxgK94fQB6UhrGLPXYwOsiIVVv5ELpVHlic0yWgrAlRQ8j/wvYL1Ug4NFgOTCFYaLKTFMK+3LhkpATYRt3wnxEfmLK15m5OCQ5TEku2EwF41XeLTOxUPlezbGy3oPVUkb5F1CWvc3QVkkrA/na7o4VHEKFUOfAjv4YssNs9yD6ZZCLHOmkyG7shnyM6M50O4ATDmAzpkZx9yM8JyCAJnVaJNtLituSuwqFHucWpPzgV4hjG2HjUuoMFVxXx569wX0AdbqNYF2NavLFZwQZ0i35kfT2nUcmM9UhryrCO5aeN2gsbXAKX/u3y2j8R755Pol2rni0oesr5fC++eZxNjVcRwjFLKFrozMZWkfb5qxUfxBmFlLxpnzIIsQ4n7su2DcV5oUvZSDLBNLXJDCwoBeNzPeyT+EjDT91PG781H+y9oYuVfBjuPRA8TZ8IRfAVFkrp2tlCTGD0FZ+nENFVKhgxwO8Fu8LoPmfxO+8RvsA8OH++t+R0DGx0Rip2Alobh46eywcHSiyNat/IqkE2ayao0aLrWHA3sjRsonhCYGxTrlTG+UsP7N3R4PQIiIY/ALa2N2yAdC8Iy3xRa2B/FS3e6VF/COrfBUBsAnIdjcD5JykRdRchI2SqSGLXI7xAlyUOAnSJanQNwWZMstfa7U1RsWLx0stQIQGvehdg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(39850400004)(136003)(90011799007)(186006)(1800799003)(90021799007)(451199021)(2616005)(6486002)(122000001)(921005)(478600001)(83380400001)(31686004)(66574015)(6512007)(6506007)(26005)(41300700001)(66446008)(76116006)(66556008)(66946007)(91956017)(64756008)(66476007)(316002)(8936002)(8676002)(31696002)(4326008)(2906002)(71200400001)(36756003)(110136005)(54906003)(38100700002)(38070700005)(86362001)(44832011)(7406005)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akkrVitmZXdERDVkWHNTYWRGa3FSazdhMUdaa0RnQTJubkp1bURtTXV1TXZo?=
 =?utf-8?B?d3hQNThQRGpSc25QUlM3WC9vSmdqcHJXOEpHNHN6QWVuVWVnMFhVMytuRmpa?=
 =?utf-8?B?azRrY0o3OUNSZ25COWFZZE5Qa2RCeFVBUmcyOTJHaUM4a0lBL0QwQUZMeTBj?=
 =?utf-8?B?N0xwNnhOWTlRMHhneHJkNElOV2plRE5YMWt2anZxRHR2U0ovR3VKbHc0aCti?=
 =?utf-8?B?bnVIYVYvZjd1LzlBYlNhNFh1T0RwK24yYzFsMVR1N3pYWmVmUXIzdmhSUnlv?=
 =?utf-8?B?T1FoWHlDQnVqUDBuamdPNHJZMG9DcWcxdkMzWGZmUjBuT2l0UHVGcDBiMzY1?=
 =?utf-8?B?RHU0eURSUWRaWXpublV1cHRQNjBta0Jib0c5VHlTSjlMNHRQdW8wU2E5TWsr?=
 =?utf-8?B?Q3lPcjRPZDRUQTgwb3JUTERGeXZRRUlFY3dxUm5SaWlBMjNLeTR4M3NmRmY3?=
 =?utf-8?B?MGRQNlNQdE9QTGl1Rm1RZEtudS80Q255SXNZZ2t4MEtMcE9NNXkrUzlEMkF5?=
 =?utf-8?B?N3lTQ0JBaFc4Uy9mSEI1MjJCOC9yVVMvTkJoZU1jdU1POCtCZGJhYm0wNEV4?=
 =?utf-8?B?TnJGcHhTNkpJRTlaeWdraTBuWkp6Ui9mQVg5RXBOT1lzenVCVVJ1eUZyRDln?=
 =?utf-8?B?WWZnT0J3cVdIQUxKOEVnT3NpRVpUbXhHTldMRE5jdmNFYXdlQW1peXdqZytz?=
 =?utf-8?B?bjR3K21oVE5RcUNjdHFwUStaN2ZGdFIzbksvOC9qZHJDdlc3VjlyYjl4bnhV?=
 =?utf-8?B?dVNxcVU5djN6Yk84blptZnpkZ3o4anJ4a2M1Szd1L3NUSllKWFcvVWN3dm5D?=
 =?utf-8?B?b05IOHRQM3F0MWt0amRYQ1RnZ25xdzRzMkxrajFiQUxGYlJuaU1DcTRyMGx1?=
 =?utf-8?B?dUNHQklpY2JMTXdFT3BCQnRyTiswSUNlcEhPRlZBVW5NYWFEOTZ4anRlaDFr?=
 =?utf-8?B?N2E1cExCQVpmell6ZnZOY1dGRm9jZWRzcHVDM09ZV2FuSGJSdDh2aDZyYy9h?=
 =?utf-8?B?Qno2K1NxT3FESmVVRElpbnBaRW1aYTNUdUpNYzVXSmxIUEY1TU5NdDJKU2gw?=
 =?utf-8?B?bUxSQWMvcHo4dk1PeGpWU3NmTFhjbStOeDM3bXdlbUlTSnNPSGVrVlZuZkM2?=
 =?utf-8?B?OVp1S25nSjZFOVpYTk1HVHB0dUlYc0x4ZVdMWVZ6emJtUzltdGJPb2pVQktM?=
 =?utf-8?B?ZnQvaWNFcjd6SzhNekQyNzBKUkNkZUlTL0VjWW84V1d0cVRKUnBUckhYa29Z?=
 =?utf-8?B?TVZ1OU1ZemhhWVErRm1nWm5CN1dQN2VOTEd2NFFuZ1FuMVlPR2FhWDd5WjB2?=
 =?utf-8?B?cC83ZjB1Q3JzWEoyQTkwVG9lRVVkT2pOSFVaMkU4WHpEWGpWcmdJbWw5SFgv?=
 =?utf-8?B?MEY3Y1RMYlpQa3VDeU9OOUc4NkxiQkJUNWVXVDhPbDBPM1dmejdYbHI0Mi9C?=
 =?utf-8?B?UVdqcGxjL055bzNjN2ZPMndkdGpEQnl5eVcrWHpxZFZVOHBLYzNmdDkvMGpi?=
 =?utf-8?B?R1Y0UXZqUjhoYjdmbDJkdm9CNHdYYzRYOWtMQ2RFQThTbDh2dHVNTlZEekJV?=
 =?utf-8?B?Q1BmWWlkdDhGNkVqcUM2ejJ0WW5QRTFsbWhHZVhjc3l5bDZyMDJ4NlF1R3pX?=
 =?utf-8?B?ZEl6NlU1b25QZ2g2NTMvcEpvais5b2JnQzIxOWlOQ01GbmFFRTFaYm1uKzZC?=
 =?utf-8?B?VHRydEFlTVM5WldVdUgvajlqVUZ5dWRjT3d1cjlMWld0V1l1cXpsS2EwL1Q1?=
 =?utf-8?B?YXhPYTVISFlhNEsrMWtuZ2oyWnYzdDZMbGV3dDh1RnJRajBQYmF6emNNMGw0?=
 =?utf-8?B?aWliSXFpN2t2Z2UyeGVpYjN5bmowTnNwRzZkSkhWZmJYbk12eWloaW9pajJM?=
 =?utf-8?B?S2hiMGY0cUVINFpYeUpLVkFhV0txQXRHbVg4SU83RDVRK3lCc2E4OEg2elhZ?=
 =?utf-8?B?RHBuck5PN3d0VGRCVFJKUGg5MU9VVWtLMnFEL1YvSnNvSTVrNEZjWm1HcDNU?=
 =?utf-8?B?MS9CR3lVMEo5c3I4VmJuM0xCbG51Q3Q3NHlvajc2d2RON1ZYMHFnR0JhY09h?=
 =?utf-8?B?NjUxRFRPYklCd3cwSEVmZFp6ZmhPSGlLdEpCQUUyVkQ2ZEVIdzdIcThKUkpo?=
 =?utf-8?Q?rjO3x9w1eB1sJTzom6V25RUeD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F16BCAE0D990374D9768215748CA9D2E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 164ec022-05cc-4529-1edb-08db97e2c4b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 07:40:42.1064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6V0nbaoTvq1kjdxrBtWwQ+aD0J93RRazJUWqoHSMA+x6jiHvb3Ub2ffi/YR0HMoZRp2HeMrjndnYe2RnVpr9qAyDwHOB29dbpaqpvvSMJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3348
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDEsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBS
dW5uaW5nIHNwYXJzZSAobWFrZSBDPTEpIG9uIHFtYy5jIHJhaXNlcyBhIGxvdCBvZiB3YXJuaW5n
IHN1Y2ggYXM6DQo+ICAgIC4uLg0KPiAgICB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3Np
Z25tZW50IChkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZXMpDQo+ICAgICAgIGV4cGVjdGVkIHN0cnVj
dCBjcG1fYnVmX2Rlc2MgW3VzZXJ0eXBlXSAqW25vZGVyZWZdIF9faW9tZW0gYmQNCj4gICAgICAg
Z290IHN0cnVjdCBjcG1fYnVmX2Rlc2MgW25vZGVyZWZdIFt1c2VydHlwZV0gX19pb21lbSAqdHhi
ZF9mcmVlDQo+ICAgIC4uLg0KPiANCj4gSW5kZWVkLCBzb21lIHZhcmlhYmxlIHdlcmUgZGVjbGFy
ZWQgJ3R5cGUgKl9faW9tZW0gdmFyJyBpbnN0ZWFkIG9mDQo+ICd0eXBlIF9faW9tZW0gKnZhcicu
DQo+IA0KPiBVc2UgdGhlIGNvcnJlY3QgZGVjbGFyYXRpb24gdG8gcmVtb3ZlIHRoZXNlIHdhcm5p
bmdzLg0KPiANCj4gRml4ZXM6IDMxNzhkNThlMGI5NyAoInNvYzogZnNsOiBjcG0xOiBBZGQgc3Vw
cG9ydCBmb3IgUU1DIikNCj4gU2lnbmVkLW9mZi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2Rp
bmFAYm9vdGxpbi5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9zb2MvZnNsL3FlL3Ft
Yy5jIHwgMzQgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMN
Cj4gaW5kZXggYjNjMjkyYzlhMTRlLi43YWQwZDc3ZjE3NDAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvc29jL2ZzbC9xZS9xbWMuYw0KPiArKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcW1jLmMNCj4g
QEAgLTE3NSw3ICsxNzUsNyBAQCBzdHJ1Y3QgcW1jX2NoYW4gew0KPiAgIAlzdHJ1Y3QgbGlzdF9o
ZWFkIGxpc3Q7DQo+ICAgCXVuc2lnbmVkIGludCBpZDsNCj4gICAJc3RydWN0IHFtYyAqcW1jOw0K
PiAtCXZvaWQgKl9faW9tZW0gc19wYXJhbTsNCj4gKwl2b2lkIF9faW9tZW0gKnNfcGFyYW07DQo+
ICAgCWVudW0gcW1jX21vZGUgbW9kZTsNCj4gICAJdTY0CXR4X3RzX21hc2s7DQo+ICAgCXU2NAly
eF90c19tYXNrOw0KPiBAQCAtMjAzLDkgKzIwMyw5IEBAIHN0cnVjdCBxbWNfY2hhbiB7DQo+ICAg
c3RydWN0IHFtYyB7DQo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gICAJc3RydWN0IHRzYV9z
ZXJpYWwgKnRzYV9zZXJpYWw7DQo+IC0Jdm9pZCAqX19pb21lbSBzY2NfcmVnczsNCj4gLQl2b2lk
ICpfX2lvbWVtIHNjY19wcmFtOw0KPiAtCXZvaWQgKl9faW9tZW0gZHByYW07DQo+ICsJdm9pZCBf
X2lvbWVtICpzY2NfcmVnczsNCj4gKwl2b2lkIF9faW9tZW0gKnNjY19wcmFtOw0KPiArCXZvaWQg
X19pb21lbSAqZHByYW07DQo+ICAgCXUxNiBzY2NfcHJhbV9vZmZzZXQ7DQo+ICAgCWNiZF90IF9f
aW9tZW0gKmJkX3RhYmxlOw0KPiAgIAlkbWFfYWRkcl90IGJkX2RtYV9hZGRyOw0KPiBAQCAtMjE4
LDM3ICsyMTgsMzcgQEAgc3RydWN0IHFtYyB7DQo+ICAgCXN0cnVjdCBxbWNfY2hhbiAqY2hhbnNb
NjRdOw0KPiAgIH07DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgcW1jX3dyaXRlMTYodm9p
ZCAqX19pb21lbSBhZGRyLCB1MTYgdmFsKQ0KPiArc3RhdGljIGlubGluZSB2b2lkIHFtY193cml0
ZTE2KHZvaWQgX19pb21lbSAqYWRkciwgdTE2IHZhbCkNCj4gICB7DQo+ICAgCWlvd3JpdGUxNmJl
KHZhbCwgYWRkcik7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSB1MTYgcW1jX3JlYWQx
Nih2b2lkICpfX2lvbWVtIGFkZHIpDQo+ICtzdGF0aWMgaW5saW5lIHUxNiBxbWNfcmVhZDE2KHZv
aWQgX19pb21lbSAqYWRkcikNCj4gICB7DQo+ICAgCXJldHVybiBpb3JlYWQxNmJlKGFkZHIpOw0K
PiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBxbWNfc2V0Yml0czE2KHZvaWQgKl9f
aW9tZW0gYWRkciwgdTE2IHNldCkNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBxbWNfc2V0Yml0czE2
KHZvaWQgX19pb21lbSAqYWRkciwgdTE2IHNldCkNCj4gICB7DQo+ICAgCXFtY193cml0ZTE2KGFk
ZHIsIHFtY19yZWFkMTYoYWRkcikgfCBzZXQpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBxbWNfY2xyYml0czE2KHZvaWQgKl9faW9tZW0gYWRkciwgdTE2IGNscikNCj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBxbWNfY2xyYml0czE2KHZvaWQgX19pb21lbSAqYWRkciwgdTE2IGNs
cikNCj4gICB7DQo+ICAgCXFtY193cml0ZTE2KGFkZHIsIHFtY19yZWFkMTYoYWRkcikgJiB+Y2xy
KTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgcW1jX3dyaXRlMzIodm9pZCAq
X19pb21lbSBhZGRyLCB1MzIgdmFsKQ0KPiArc3RhdGljIGlubGluZSB2b2lkIHFtY193cml0ZTMy
KHZvaWQgX19pb21lbSAqYWRkciwgdTMyIHZhbCkNCj4gICB7DQo+ICAgCWlvd3JpdGUzMmJlKHZh
bCwgYWRkcik7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSB1MzIgcW1jX3JlYWQzMih2
b2lkICpfX2lvbWVtIGFkZHIpDQo+ICtzdGF0aWMgaW5saW5lIHUzMiBxbWNfcmVhZDMyKHZvaWQg
X19pb21lbSAqYWRkcikNCj4gICB7DQo+ICAgCXJldHVybiBpb3JlYWQzMmJlKGFkZHIpOw0KPiAg
IH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBxbWNfc2V0Yml0czMyKHZvaWQgKl9faW9t
ZW0gYWRkciwgdTMyIHNldCkNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBxbWNfc2V0Yml0czMyKHZv
aWQgX19pb21lbSAqYWRkciwgdTMyIHNldCkNCj4gICB7DQo+ICAgCXFtY193cml0ZTMyKGFkZHIs
IHFtY19yZWFkMzIoYWRkcikgfCBzZXQpOw0KPiAgIH0NCj4gQEAgLTMxOCw3ICszMTgsNyBAQCBp
bnQgcW1jX2NoYW5fd3JpdGVfc3VibWl0KHN0cnVjdCBxbWNfY2hhbiAqY2hhbiwgZG1hX2FkZHJf
dCBhZGRyLCBzaXplX3QgbGVuZ3RoLA0KPiAgIHsNCj4gICAJc3RydWN0IHFtY194ZmVyX2Rlc2Mg
KnhmZXJfZGVzYzsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gLQljYmRfdCAqX19pb21l
bSBiZDsNCj4gKwljYmRfdCBfX2lvbWVtICpiZDsNCj4gICAJdTE2IGN0cmw7DQo+ICAgCWludCBy
ZXQ7DQo+ICAgDQo+IEBAIC0zNzQsNyArMzc0LDcgQEAgc3RhdGljIHZvaWQgcW1jX2NoYW5fd3Jp
dGVfZG9uZShzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+ICAgCXZvaWQgKCpjb21wbGV0ZSkodm9p
ZCAqY29udGV4dCk7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgCXZvaWQgKmNvbnRl
eHQ7DQo+IC0JY2JkX3QgKl9faW9tZW0gYmQ7DQo+ICsJY2JkX3QgX19pb21lbSAqYmQ7DQo+ICAg
CXUxNiBjdHJsOw0KPiAgIA0KPiAgIAkvKg0KPiBAQCAtNDI1LDcgKzQyNSw3IEBAIGludCBxbWNf
Y2hhbl9yZWFkX3N1Ym1pdChzdHJ1Y3QgcW1jX2NoYW4gKmNoYW4sIGRtYV9hZGRyX3QgYWRkciwg
c2l6ZV90IGxlbmd0aCwNCj4gICB7DQo+ICAgCXN0cnVjdCBxbWNfeGZlcl9kZXNjICp4ZmVyX2Rl
c2M7DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+IC0JY2JkX3QgKl9faW9tZW0gYmQ7DQo+
ICsJY2JkX3QgX19pb21lbSAqYmQ7DQo+ICAgCXUxNiBjdHJsOw0KPiAgIAlpbnQgcmV0Ow0KPiAg
IA0KPiBAQCAtNDg4LDcgKzQ4OCw3IEBAIHN0YXRpYyB2b2lkIHFtY19jaGFuX3JlYWRfZG9uZShz
dHJ1Y3QgcW1jX2NoYW4gKmNoYW4pDQo+ICAgCXZvaWQgKCpjb21wbGV0ZSkodm9pZCAqY29udGV4
dCwgc2l6ZV90IHNpemUpOw0KPiAgIAlzdHJ1Y3QgcW1jX3hmZXJfZGVzYyAqeGZlcl9kZXNjOw0K
PiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAtCWNiZF90ICpfX2lvbWVtIGJkOw0KPiArCWNi
ZF90IF9faW9tZW0gKmJkOw0KPiAgIAl2b2lkICpjb250ZXh0Ow0KPiAgIAl1MTYgZGF0YWxlbjsN
Cj4gICAJdTE2IGN0cmw7DQo+IEBAIC02NjMsNyArNjYzLDcgQEAgc3RhdGljIHZvaWQgcW1jX2No
YW5fcmVzZXRfcngoc3RydWN0IHFtY19jaGFuICpjaGFuKQ0KPiAgIHsNCj4gICAJc3RydWN0IHFt
Y194ZmVyX2Rlc2MgKnhmZXJfZGVzYzsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gLQlj
YmRfdCAqX19pb21lbSBiZDsNCj4gKwljYmRfdCBfX2lvbWVtICpiZDsNCj4gICAJdTE2IGN0cmw7
DQo+ICAgDQo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZjaGFuLT5yeF9sb2NrLCBmbGFncyk7DQo+
IEBAIC02OTQsNyArNjk0LDcgQEAgc3RhdGljIHZvaWQgcW1jX2NoYW5fcmVzZXRfdHgoc3RydWN0
IHFtY19jaGFuICpjaGFuKQ0KPiAgIHsNCj4gICAJc3RydWN0IHFtY194ZmVyX2Rlc2MgKnhmZXJf
ZGVzYzsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gLQljYmRfdCAqX19pb21lbSBiZDsN
Cj4gKwljYmRfdCBfX2lvbWVtICpiZDsNCj4gICAJdTE2IGN0cmw7DQo+ICAgDQo+ICAgCXNwaW5f
bG9ja19pcnFzYXZlKCZjaGFuLT50eF9sb2NrLCBmbGFncyk7DQo=
