Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F411F698D4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 07:45:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHQRl5j8Vz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 17:45:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tJhuV1sI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tJhuV1sI;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHQQl71mYz3cGr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 17:44:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC18CKGNyKcEgloh8MsAnqDRlQw8MEe4oHCDkQlzdifICuuwEX1jizamBAiLPyLZD498ON+SKtvVcrdNg37Wj8UqFrD3TTiWd1OotFKM5H9pvC8OPiNF9MhyGO53KOH6y3m4L59CWbwDkMSdvy1QkFo4kg+uqI2surokpv71XIRrcr9I0APra2CPBW1kHDiWBSzUyy63jHMKsh5PgxgfbARYpUsnF2vTXYcwYqjgk5Tkv7ItGc0B7k+aonU7C7rmI/SoHaQ0CVI6IcO4XWM1zpLTCY0qJGDpVLnMTQQ1icp7b3AJYkeCqZ2ZNbYmYLjjMdeyeg/RgT2F36TUWMF2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ISxNaeY1ICMZUY6CGj6epdas+ViXK8f7VXlpFh3Kw8=;
 b=oQ7oqKWF1+M/F+rqXXcrKzMgr1HsyIFtnniRw3G3XJT/WwDvfagKNJMs8IIuLpHxlKehVzxt6NwEFtJyYS3B9jvR1B4WZWrSMnsVY0zK0dwOMh6RqX/VYsNjgCG3LYPIKImnw9gFL6Ckdn65AWa7a1lKEjf1bUIwOdYV90shvJL6NdoYgpZkI+fYMPMCs7otmfo7AdOFH/u2HPZfC23AE86SJENEGuYzJd1PaxzXlYOduOk+w+eI/0LvUjPAs7Yedas75JmP98BSpnAdLWeXr+gAXdKLZEkujEMLyn3YWPPervYPyiNnu1L7w4UNM+OCnnJ10xzY6aAzvol4F/7kFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ISxNaeY1ICMZUY6CGj6epdas+ViXK8f7VXlpFh3Kw8=;
 b=tJhuV1sIOvoMluoxrudzkPodvAOm8F3vAFhfp/LnNMK2ZdulXcEXQ477fY1Z+EdXXOSe2lsaCFDRnrjekaCjYDLjOpOrt4zBybxTFnDieADC3DRM8o8BwgY2OaSU+h/cb8fZ3ctNBLOlhDRY79yHBO+ZegzAkNaOHv8okCoA7gawY8ZNhXyFgmOYGeHLbrp8sbYxfS5k+EOoQpIdPSqvNoYAprDu3ayDD4DKcEk49K4Nr6C2zMgl/Rdi98p40HnDAPeVR97usoSC1yfFlMMPsVA0eeyWA/cmcufBMWz1ol1MV6hXrj8bLZnAhqh2uE8PeoHrkvFmiTLTzAxpVnn0Ng==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2923.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 06:43:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 06:43:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Leo Li <leoyang.li@nxp.com>, Herve Codina <herve.codina@bootlin.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v4 06/10] soc: fsl: cmp1: Add support for QMC
Thread-Topic: [PATCH v4 06/10] soc: fsl: cmp1: Add support for QMC
Thread-Index: AQHZMWDGr2mKBcY6wk6Z5heH8S6KT67Qu02AgACGAoA=
Date: Thu, 16 Feb 2023 06:43:54 +0000
Message-ID: <a5a2ab44-2ec8-66a1-b249-88e41d3a30f9@csgroup.eu>
References: <20230126083222.374243-1-herve.codina@bootlin.com>
 <20230126083222.374243-7-herve.codina@bootlin.com>
 <AM0PR04MB6289BCED290AB979E0DEE3448FA39@AM0PR04MB6289.eurprd04.prod.outlook.com>
In-Reply-To:  <AM0PR04MB6289BCED290AB979E0DEE3448FA39@AM0PR04MB6289.eurprd04.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2923:EE_
x-ms-office365-filtering-correlation-id: 5dbedfbc-007b-431b-9376-08db0fe92c23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Z4ZKC6DfNOKMUbmXdP+SHtsZmNwPeIXS6vieJ1pbURNIwmgNhrXKHc94nNXXYquNnGqC2EkWVqWdwahBUU3lI7HyjuiwQ6+sZ5eqREVG02W6yqFkzvWxYb6stmoYt1/VNUR1/3g4m3Om0tep/KzB6Q+LZUbTZabDOa5+HXx6Mice0rNssM29v/jEURyOy2cZVwMX92Hv7pIyT6lBH5ZsS1bUJTv70ElLtK/9kzELiE5aBRt5kHhxbxCYsASkVmZevQcKW8fw84O/ztX5n2vSv6/RFj62ZUOSIHMWh6UjtTKDpCPHTMI03efAzzXfv4D6gpRshYYWJZO5L1H4LOcpJ2XZyh4A1Owha4jSjaZ4zU6NcgRD/CAxi/qLVE72PUbFJVLMKZ68dfPb1IS+sOi/av1oRqEbDoNI4moUyhytusHgTguBQoEGMPZsV3UrK/E5kXG7uERVaAadRU+4DzYYpe3tn5wEYrnmIM2YpBcwxlLDUmQblvqjgWbkBWgR8YUfKrII2FfZCja2/jzt8PRXXHToXQjoFdwZvlM3HJoqBLNy0oPds4IjqqL7eTEHnPaq8oyRjMLYXmJhdo/OOPM1ffttY+7Lkl8ZlXPQkpGIr1z+KRqEDhveB/spd7XIuDUtlGKkt7ah/AxoTNzIc/GxEhlwAP7ArA0NLjpDQImhLtur/X6FMBOa+kV2ZxFywsH1rL7prNjuzsAtw9QJnSukO1h8oPV1QSyQada2cBsU5g8VDkhrhq/FmU4c/nCJeutUWdDgZe9fX/PpNMcvr87qyQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199018)(6486002)(478600001)(71200400001)(83380400001)(38070700005)(921005)(31696002)(122000001)(86362001)(38100700002)(186003)(26005)(6512007)(2616005)(36756003)(6506007)(53546011)(8936002)(41300700001)(2906002)(7416002)(5660300002)(44832011)(31686004)(91956017)(4326008)(76116006)(66446008)(64756008)(66946007)(8676002)(66476007)(316002)(54906003)(66556008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Ri9hOXpxd2IvR2wwT0M4Y05SNW1SR1VOcEJDMFBaZGRSdXMzSDVwajN2dFlW?=
 =?utf-8?B?d0hlYld2QUJtVmoxU082TGFxUngzZmZxTEliRm12K0kxclZyU21OV05yRjZJ?=
 =?utf-8?B?TW8yd0ExZlpMak1sY2pnK3JDZmxxL1p6RUkyQlY3dmJNQmZhV29VMzVITkll?=
 =?utf-8?B?V2tvVFNjY08xQXY1VkQ4VHU4N0RPdE5NS3NaakdwY2NaYkxWNUs1c2tGZlN3?=
 =?utf-8?B?dmt1NDdQT2cvMUEzL21tcytySnY3bnUxbmZWc3k0SENZUk1zQk0yV3R2Yk4x?=
 =?utf-8?B?aWx1V3A5R010VUdDQ0Z6ZFR1WDduQXBBdkUvbGhUdFhSU2FGdXl0ZlVjOS83?=
 =?utf-8?B?Q3hLNXpKMzQzejlPRmIvdlEvTjlWa3ZHSHY5R254dFNwT2pqbm5VdWhkWjM5?=
 =?utf-8?B?K0xxSEpTcEhTYk45R0dNaWFuUzFqUDc3SzM2TlFjKzdPZU9OVzVoYXhRZ1hD?=
 =?utf-8?B?YUtiSkxpZTdEQ2NLL3VGWXRtc3ZiSlFBSm9STkxqd1ZCTXNIT1QzanBSU3o3?=
 =?utf-8?B?bUlMc0hOaFM3V25weWprblBRWU5SYUQ3QXREN1FCV2FyTlRYcFVOTGUxL1VK?=
 =?utf-8?B?bFRQQ3lkaTllY2lhTFE3R0tCN3Z2V2Jndk11SEFuWmxQSlhqVkhyaTBtNXNp?=
 =?utf-8?B?QVQzWHhVTGM1ZDNKWnJ3SVk0L3B0bjd0R3FUTWJiMFBxWFJMckZOL0NoSC83?=
 =?utf-8?B?dVVPd1JxU3UyWjJWUnNvc1d4ZS92WUZ2ZlJFNWwweFVhRDkvUk43K3NlcnJP?=
 =?utf-8?B?SlBocVRFZ0JlRzc5T2lxbHlEaTdqTDM4SDYrUi95S3dLYnNHaDVwMTVIWVFL?=
 =?utf-8?B?RU56NWRBYUdtSnZkaE5rZ1RJcXpscFU0MU1YbDlPVEpQd003bmV2cFFvQy91?=
 =?utf-8?B?ZGU3eityOHhTUkR2UnMyS01aYkpoT1VxeDV2OFV6OWNaZ3k5MlYwdGdFL0tt?=
 =?utf-8?B?TXdUdWVDakFVeGd5K1VMNEtFTk9INytXK1picWNkYko0NEozb29XZm1KdXNC?=
 =?utf-8?B?b05yR0ZPdG9aZDJVTVM2Si9RU0doQ2xubG9MTmV1VXB2N1hqSW01RWFRckhJ?=
 =?utf-8?B?UU9NVHltaURFM0NnKzBuaFFEQWhObnpjUmM3S0NLc2JaUEs4TDFha043YllT?=
 =?utf-8?B?OXlTZ1NHOFF3VndnRFdpTzBjYlFPMDlQNDBUY09RMkVYbnRyMnVFUVVNNXhH?=
 =?utf-8?B?eXY0dk9GbWMwUGdva2dSeG9sTDZUMW1ZcUc0bzM3a2pwdTJ2ZEVJampYRlIx?=
 =?utf-8?B?WTVIOWg5RWlVMzFJa1RUa3E4STFCSjNNclFYZkJ5VTlwMXlWUlRsb2RhS2dM?=
 =?utf-8?B?QVQ5SzZRK1VWQWpEMXFJZDMvY0x5VS9ONW13Q1k1ekNQZ1ZjTTcvWFlBQWlt?=
 =?utf-8?B?c1EveHp3WXFjSUptSkJxVHdSQVd4dHlqdEVIbFNrdlZSaFBlK3QvTGUwaHdI?=
 =?utf-8?B?K0JESS9Odk9MRE5RTWhSbjZwczkyQ2EwQmNkUFVGdFJ6OCs4NkltRzhseDNn?=
 =?utf-8?B?bElINlgzQmtITlZobXJYWTZTaGhIbkwrQnMwd1V2SGV0WVRtZ2lKRGY2elVk?=
 =?utf-8?B?NHJwVVJuTE5EYkpJOEJBUVpqMjhRbnRTU3RLc3VxMUV1U3g1REJlWURSNk9L?=
 =?utf-8?B?OEVpQ2VyUHhqSHJQZHo0VWdWV0RTcjFIdW5wMk1hZFI4d1FPKzA2Skx0SUZ2?=
 =?utf-8?B?Z1dXT0k0bTdpMzhtR1pFdWFtQkhteUU2b0p4NUR3R05XQnJWNW9RWG9VWW51?=
 =?utf-8?B?UkdObFkyZ25DdnNFOWhJMGpMY05BZ2lWYXZzQkdwY2NmenI4cE80TTFtc2R5?=
 =?utf-8?B?Lzh6eVlVUitUVnhUckpIaVlJR0Jsdml0RnBXQWVSbmdIajlEaGViZVdrandW?=
 =?utf-8?B?Z094eDhGYURXNFpSSXJ2NmY5c3E0eGFVYnJsS1dTQ2dBZktva0ZlOHpzeW9k?=
 =?utf-8?B?Y2xYQW1OeVUwTWJQZGoyeFVVMHF6VzZVdGtTOWFnRElnbjlyZkREVXI5NGR5?=
 =?utf-8?B?S1FqQm9xeTJ5S2NkdUZVUFdXdHMyc1dCbDNEQVNEVG84Z1FhRXZCOS9DRysw?=
 =?utf-8?B?Q0FIRVk4aG9sc1VCcHJyc3Ayd29mbnB0UHE3dW51SlJQTFlNbTZKbDFOdnRx?=
 =?utf-8?B?aUFKbWhabXVqR3lwMnNYSmo1MTNUT1lhSmtCOElvaXF0b2ZHcnJ2VnRXKzZk?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C3ADCA8726B1A4B96CC4E914F3F920B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbedfbc-007b-431b-9376-08db0fe92c23
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 06:43:54.5226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2HTky386KpwDD/iuH86hbCXH+ynBSr7Rw8pNF+MrJeyqwhIayJ0pXWp0zSGIA5BM+mVM7YfE/QFmXD0iXttY6GZsrR+0N9Bs9HtPpyXFFL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2923
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAyLzIwMjMgw6AgMjM6NDQsIExlbyBMaSBhIMOpY3JpdMKgOg0KPiANCj4gDQo+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogSGVydmUgQ29kaW5hIDxoZXJ2
ZS5jb2RpbmFAYm9vdGxpbi5jb20+DQo+PiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyNiwgMjAy
MyAyOjMyIEFNDQo+PiBUbzogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+
OyBMZW8gTGkNCj4+IDxsZW95YW5nLmxpQG54cC5jb20+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBr
ZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+PiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2kr
ZHRAbGluYXJvLm9yZz47IExpYW0gR2lyZHdvb2QNCj4+IDxsZ2lyZHdvb2RAZ21haWwuY29tPjsg
TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPjsgQ2hyaXN0b3BoZQ0KPj4gTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT47IE1pY2hhZWwgRWxsZXJtYW4NCj4+IDxtcGVAZWxs
ZXJtYW4uaWQuYXU+OyBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPjsgUWlhbmcg
Wmhhbw0KPj4gPHFpYW5nLnpoYW9AbnhwLmNvbT47IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVy
ZXguY3o+OyBUYWthc2hpIEl3YWkNCj4+IDx0aXdhaUBzdXNlLmNvbT47IFNoZW5naml1IFdhbmcg
PHNoZW5naml1LndhbmdAZ21haWwuY29tPjsgWGl1Ym8gTGkNCj4+IDxYaXViby5MZWVAZ21haWwu
Y29tPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgTmljb2xpbg0KPj4gQ2hl
biA8bmljb2xlb3RzdWthQGdtYWlsLmNvbT4NCj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPj4gZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGFsc2Et
ZGV2ZWxAYWxzYS0NCj4+IHByb2plY3Qub3JnOyBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0
YXp6b25pQGJvb3RsaW4uY29tPg0KPj4gU3ViamVjdDogW1BBVENIIHY0IDA2LzEwXSBzb2M6IGZz
bDogY21wMTogQWRkIHN1cHBvcnQgZm9yIFFNQw0KPiANCj4gVHlwbzogY3BtMQ0KPiANCj4+DQo+
PiBUaGUgUU1DIChRVUlDQyBNdWx0aWNoYW5uZWwgQ29udHJvbGxlcikgZW11bGF0ZXMgdXAgdG8g
NjQgY2hhbm5lbHMgd2l0aGluDQo+PiBvbmUgc2VyaWFsIGNvbnRyb2xsZXIgdXNpbmcgdGhlIHNh
bWUgVERNIHBoeXNpY2FsIGludGVyZmFjZSByb3V0ZWQgZnJvbSB0aGUNCj4+IFRTQS4NCj4+DQo+
PiBJdCBpcyBhdmFpbGFibGUgaW4gc29tZQlQb3dlclFVSUNDIFNvQyBzdWNoIGFzIHRoZQ0KPj4g
TVBDODg1IG9yIE1QQzg2Ni4NCj4+DQo+PiBJdCBpcyBhbHNvIGF2YWlsYWJsZSBvbiBzb21lIFF1
aWNjIEVuZ2luZSBTb0NzLg0KPj4gVGhpcyBjdXJyZW50IHZlcnNpb24gc3VwcG9ydCBDUE0xIFNv
Q3Mgb25seSBhbmQgc29tZSBlbmhhbmNlbWVudCBhcmUNCj4+IG5lZWRlZCB0byBzdXBwb3J0IFF1
aWNjIEVuZ2luZSBTb0NzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVy
dmUuY29kaW5hQGJvb3RsaW4uY29tPg0KPiANCj4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QgdG8gbWUu
DQo+IA0KPiBBY2tlZC1ieTogTGkgWWFuZyA8bGVveWFuZy5saUBueHAuY29tPg0KDQpUaGFua3Mg
Zm9yIHRoZSByZXZpZXcgYW5kIHRoZSBhY2suDQoNCldlcmUgeW91IGFsc28gYWJsZSB0byBoYXZl
IGEgbG9vayBhdCBwYXRjaCAyIHdoaWNoIGltcGxlbWVudHMgc3VwcG9ydCANCmZvciB0aGUgdGlt
ZXNsb3QgYXNzaWduZXIgKFRTQSkgPw0KDQpDaHJpc3RvcGhlDQo=
