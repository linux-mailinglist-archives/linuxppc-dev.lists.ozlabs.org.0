Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D81666206
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 18:35:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsZb20tm0z3cFP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:35:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kdc3bVZo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kdc3bVZo;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsZZ53L45z306Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 04:34:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHRKo7TQL1Esb1j2U0kAfYqph9EVGF1li/fBvjY/oe9vbYp9kauCFljE14seuhddn9fnW2la9yXmy2AgacICDZNx95VWkUG1+Ozd2sE41mhh1ehTX12vXFm9d7IHcA89fxhw4lCAUUnsjqfwrVb6OFfX0io02IUahUQdQAwA6uvyFIyL3UKch9ny9xHLcFYOjDITQCsoXkvSVZN4BtM3v9X9rJufgcoDzwFgg8RumosuKxAZQ7M+As+rfPUJkrhboAqxueyvpjn5BdA9eDeY11JBBAZHhuM/W/qoTJRQaRKOjkf7KDOE4draGg+eA5id0v/vJlaMsWyX07aF5TcfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLEjeDr9JX0s7zuniTfZsDe4F7aWU3DoQS0NQKYXc8w=;
 b=OMX+cZeu4bt9IfNF1O+rDzc8enJxhEi67wLdSZ3g07fpChPFLkLgrGiFl8+goVWfoe0yInMqgeg/j4zu4zhY5WuqxIdOf7KYHgxEQWtLCsLnzBlwd+ecZsH+6v/lJFd2atAtxi1bmsC0598GtQSf5Yu6VLKlc/Dsf4PC15ZB2L8KHq+gqLJ9vqaF9kWw+wEqFMesCqpuHIyCCWv+F1MyCUwwkEJNeq4y0Cje9WZ2lRmFpUMtPvUwyc1e9/0TVw39+uN4DwwODO4mKD5Kiy2FHmtpB7rbsBuoBzlIPAtbEuSrESMIpxrLE9BesBc0NQsQ3CR3W6CkWmElDXgnJm8yKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLEjeDr9JX0s7zuniTfZsDe4F7aWU3DoQS0NQKYXc8w=;
 b=kdc3bVZoYmi8L0v9G1PXqEwJhpc9vM92rI0PLMApzNVaPAOgX8pTqD63skgGEsTpPxItEgWEcpI48pF8C3eUgCUUVGETyrryuON5ZJCzXodI5x+e8BwaPj5TqglN2WEprqYfr/RO+EzWg9eIMv01+Oo0q4fUOqjU1jL3D62p0V6fLfAjXI6l8EYd2P/5MT5lzHluMSEz/ywpBR9ex0fCO3qxiP+yIxadONBDZqqjjNjr0eR5u8kmv91jdLAUWtTdVtWMk3dspVEA23lj7v2F3Al6eG15sAMSIZqK4hzzmLfMQX4s6/ao1mmzyk+r0xvPA0uQS0P4SXs+KTCOYRQdxQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 17:34:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 17:34:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 06/10] soc: fsl: qe: Add support for QMC
Thread-Topic: [PATCH v2 06/10] soc: fsl: qe: Add support for QMC
Thread-Index: AQHZIe1KiCJWjZ4L0UmZQZF6SLJUjK6ZRZeAgAAckQCAAB/rAA==
Date: Wed, 11 Jan 2023 17:34:32 +0000
Message-ID: <1073680a-ed56-5b88-b9b8-2b4d468e990e@csgroup.eu>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-7-herve.codina@bootlin.com>
 <f46eb64d-ad4c-7531-60b0-68961f171ed8@csgroup.eu>
 <20230111164018.676a8ca1@bootlin.com>
In-Reply-To: <20230111164018.676a8ca1@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2140:EE_
x-ms-office365-filtering-correlation-id: e0677e9d-a65b-479c-55c9-08daf3fa19e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KyRoUg/UErc5jUtXOiE3CpFqdvymV+3JmTpmGTabTy+L7cRFY8BwHYDR/igEWO0+oRumxNxvlxDaq23gaPEfD/XcVx0ibLpB32/sIajDkxdrw8yT992IeyJOYP3LgKiJOTX+5O8xNmku/Gp80pLY2ZArp9UG897Rw908EGM1Ac366q25pSfQFR+p1NgW3i0sfU6c/sDBKhxjrRH5+tzhQm/L9dTaio2Jb/5KKvsyU1CNDL0Q3DMXQMfmRLjNkyEkJEgEfi6icMJIW2k0Iv2WUgcjye2mP+C7TsVMJEPkf9qFOH6RFer0Mv7Vljxw8Frwjf29p2rOp9UudZEUvqYOxbFZNw1oPHZj3TSeXrcbAUB2C13IQQw9jAeuPEQx2MKNZLZKq9I7CxNe1XcdfpgsxrOL0k7D+mnP9RwYbYtZgh2Jd601t6+rYphyaHYhyqoNFHH7j6I8WFhSg5GZ4jRH+qAgWihYs1GMYgPHHggVEHk9XTjmR6Jtqrrww3n85Yq9HuyaPpD818bAH1knV3bI4LamuxCHWQDFFjH5SRG3NeQEKLXSdjvDt+j4gVJJSQyJ0rHY87aPVY2S+JGqr4N/kaCoKF1NaqisWlwUgPHlAvxwQhfMebb/U+oSR9Cvq0KtaHmx/HuE1Bs9W2yyVTXxT6/zZmqa5vT79r/AboVTX65hSnVNYutWiMxi840lAy2bNUbl8NkBQW+fQFlRLqtsW2q2ASXli/Pv9EPSUpVKhtOfAQHyvJe6MoZSeiMf+LrRSFUX3Sv0zDEowN6beXn/bA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(451199015)(6506007)(38100700002)(122000001)(31686004)(2906002)(6486002)(478600001)(2616005)(7416002)(26005)(186003)(6512007)(44832011)(5660300002)(71200400001)(316002)(8936002)(38070700005)(36756003)(86362001)(66574015)(31696002)(41300700001)(64756008)(91956017)(6916009)(8676002)(76116006)(54906003)(66946007)(66556008)(4326008)(66476007)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MlorMVZrQmFvNTl3eFg5Z09jQVpOZkV3Si9NNk5HU0hWMVNMQ2hoSVlBN0NJ?=
 =?utf-8?B?UDlTa2JwR01FUVdGdmcvVVBKYjNHanJ3UDBOWW9JcVJQYnVobnV0c3IwUzJE?=
 =?utf-8?B?T3hZdlc4MWc5VnZramY1VmpUdVE2d3podUtMdmsxMWRvUXZ0TVVCUlI5SFl6?=
 =?utf-8?B?U0VzelhtU3YxcUNwbTRFY1NYdTJOb2hnNFB6S095Nm1HdmRZWWhXWTc4bHdI?=
 =?utf-8?B?TitzcVN3YkRkdXQ1Z1h4REp0R05OZTRya1VQU0RpL1dUeFQ0MUJZVzJLSHVo?=
 =?utf-8?B?TlI2OXJnazF1anFIWTI5M0x2NVk4d08wT0p5V2xUSDAweE5Ubys4T2FVYUto?=
 =?utf-8?B?RVFaM2hUK1BKTDNWZE5lc0ZaVVRUNEpsakJjM2w1T2M2czMzL0NySDJ6aHAz?=
 =?utf-8?B?L2RuWG04YkxUR3JrUlBrVUowZ2JaWmE4VVhZUG1rNE5yWEVZMEVpdU5PVG5E?=
 =?utf-8?B?YzhlRDZzMEZKZ1N3L3pQQmwrVzVZQkNYSjI0cExsa0lKWm9jYUk2eEtZUDN2?=
 =?utf-8?B?OHZ3MjZCRHRYQXRsTStnUmdYK3JLM1VMR3Y1Q25jaWtlRmIvelZJOVFGTnp5?=
 =?utf-8?B?NXNyMExtM3RZazNrQ09rUWhMRnRqRFA2LzdyVCtjRC9STnY3YlJ4KzR1dUls?=
 =?utf-8?B?OTFJUXFXbnZlR1UwMVcxdjBTdGVHNXc2bEVTZ0FlV1B6akJXbG1SRUZMU2Nk?=
 =?utf-8?B?V0hrbWc4Myt2dUpUMk9oMjRRVi9nR2RhNVZ6ZXlzSzdGazBUM3AyeVY4dDZD?=
 =?utf-8?B?ejcxZUV5VWJqZ3VxWDFrUTBMN1lwUkpWR0ZCQzhKU0tmcE5ka1V1QjdWZFNJ?=
 =?utf-8?B?ZDdPZ1I2VmxBWkJvek9LWHBiQzdNNkkzVDRldjR6MkIyQksyNzVKMkZNRk9n?=
 =?utf-8?B?Yi9MSUQ3WDBlVXRmbW9RdmpFZjBzdEZZTlBoSmRlSk9qdmloTlZYcEVuRUpv?=
 =?utf-8?B?UFpTSUNONTNPYlZtQ2Ztc1lqSFZQQ3I2NFJHZkJUR3NQMGU4V05HMU1USTRF?=
 =?utf-8?B?OGNVTTZ3RWxSMG9mRk9VV09lUkVuR2dFeDZvbDJ0Q0lwdyt1Q2lFTGFIaWpB?=
 =?utf-8?B?YXN0NTFJNURRZVJxOGVxRlJKWk92UDBFcEZsaFhtVUhEZkdYeXhjMVBkRFlL?=
 =?utf-8?B?SWhnTkFRWmIrQ0pxK1JVRTA4OU9PdzRXVEJac0V1REh5VWNJK1N4a3d5US92?=
 =?utf-8?B?WDFVeUNldEk2QzVnZDRaQ2V4SzA4UXlrK29IOWY5N3R2QWJGVkJXWWJBb0lB?=
 =?utf-8?B?YjFjTU53aTNxbTUyVlAyS1BORWRmeEsxSTQvOFhXRzJRNGk4RjBsRElGY2xI?=
 =?utf-8?B?RUw5VUdneklHdVdaZWJyUEc5NlpTb1hjMUc2SnNwMGd6azJaTXRrOTBGME5l?=
 =?utf-8?B?VTRZbjFXU0ljN2U5RUhvODJjb0syTmZRRDFza2hqMjdJQW9mYmV2Qmw1bnBD?=
 =?utf-8?B?STJ3WDFWVCtlWDYyV3NYRDloUUtjekhiSUNqaDF6VVVENzUraTlMTUlLMlc5?=
 =?utf-8?B?eUxUVmNheVhpY3dOcEdRMW5kZzN5a2FNb2RzSWllRFFUYURoblVrK0VLVlNC?=
 =?utf-8?B?ams2TnZzNCt4Z3RXKyt5V3E3UmN1WGt6L2wwcmdwTHI3Njc4WUVhSldyWFpa?=
 =?utf-8?B?R3VrUys1a25UNFZvLzBDeFJQcFh2b3I1MFFrb09CZ2FHQWpQSDVPeVAvOVB6?=
 =?utf-8?B?UVJQckxqMDltVDY5dnhuMEZTL3hsMGxnZVh2UHc0Tm5nZC9ZZkJ3bTE3R1Bh?=
 =?utf-8?B?Q3ArSTlCYmRDRDVwYWdBOWpjdlNDbWxwT3NWUUwzaDRoWHdSWHU1UHM5WXM4?=
 =?utf-8?B?QUhad1cvNk9jNGdnME5jNzBXRGRZVWJkMDJ3ZFBhS0Z3UDQzR3RHam5RTXdG?=
 =?utf-8?B?QXpUckdYbVE0Snh1NnUvK2hQeHdSTmxYZXVBU2dCV2lRaG5ZaTdWM3ErWkZz?=
 =?utf-8?B?dzJCa1FmSmEyNHI1S3IvbGFWQ2c0SWoyVS9ubktVb3RGRm1LcU5Bbyt0VHZN?=
 =?utf-8?B?cTJ5QlVKa3VKUUNCWUZNS0Uzbm95VkFkb212RWlzb0crdExIQ1NXL0dua0Mw?=
 =?utf-8?B?ZlVRUk82amdod3JTSTgydXpyTU5HVlQ1YmhUb09VMWVJM0VHU3J6aU9rS3Z4?=
 =?utf-8?B?M2xDUzlXSWJ0bElCajcvbUlyT3FTbithcmt5SXEyYlQ3MXVBbktTa3dWcFJS?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6070D77E60655142A4EA24A20990473C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e0677e9d-a65b-479c-55c9-08daf3fa19e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 17:34:32.7827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QTs8sPl+iEBN89kyB4tOb0XM9Qhzz2jSpBP0e7b39XRWR8q2vIOIsvVGXLfEFRGUt7tfpZ4VIpqd+94ZHmeKRkOxxM3CZwoMQzXTGnXYNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2140
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAxLzIwMjMgw6AgMTY6NDAsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBI
aSBDaHJpc3RvcGhlLA0KPiBPbiBXZWQsIDExIEphbiAyMDIzIDEzOjU4OjAzICswMDAwDQo+IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+IA0K
Pj4gTGUgMDYvMDEvMjAyMyDDoCAxNzozNywgSGVydmUgQ29kaW5hIGEgw6ljcml0wqA6DQo+Pj4g
VGhlIFFNQyAoUVVJQ0MgTXVsdGljaGFubmVsIENvbnRyb2xsZXIpIGlzIGF2YWlsYWJsZSBvbiBz
b21lDQo+Pj4gUG93ZXJRVUlDQyBTb0Mgc3VjaCBhcyB0aGUgTVBDODg1IG9yIE1QQzg2Ni4NCj4+
DQo+PiBTYW1lLCB0aGF0J3MgUU1DIGZvciBDUE0gZm9yIHRoZSB0aW1lIGJlaW5nLCBzaG91bGQg
dGhhdCBiZSBtYWRlIGNsZWFyDQo+PiBpbiB0aGUgc3ViamVjdCA/DQo+IA0KPiBBbHNvIHNhbWUg
YW5zd2VyOg0KPiBXaWxsIGNoYW5naW5nIHRoZSBzdWJqZWN0IGJlIGVub3VnaCBvciBkbyBJIG5l
ZWQgdG8gbW92ZSBpdCB0byBuZXcNCj4gY3JlYXRlZCBkcml2ZXJzL3NvYy9mc2wvY3BtLyBkaXJl
Y3RvcnkgPw0KPiANCj4+DQo+PiBRRSBhbHNvIGhhcyBRTUMgYW5kIHRoaXMgZHJpdmVyIG1pZ2h0
IGJlIHVzZWQgZm9yIFFFIFFNQyBhcyB3ZWxsIHdpdGgNCj4+IHNvbWUgZW5oYW5jZW1lbnQsIG1h
eWJlIHRoYXQgY291bGQgYmUgZXhwbGFpbmVkIGhlcmUgPw0KPiANCj4gWWVzIGFuZCB3ZSBwbGFu
IHRvIGhhdmUgaXQgd29ya2luZyBvbiBRRSB0b28uDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluayBp
ZiBJIGFkZCB0aGUgZm9sbG93aW5nOg0KPiAgICBUaGUgUU1DIGlzIGFsc28gYXZhaWxhYmxlIG9u
IHNvbWUgUXVpY2MgRW5naW5lIFNvQy4NCj4gICAgVGhpcyBjdXJyZW50IHZlcnNpb24gc3VwcG9y
dCBDUE0xIFNvQyBvbmx5LiBTb21lDQo+ICAgIGVuaGFuY2VtZW50IGFyZSBuZWVkZWQgdG8gc3Vw
cG9ydCBRdWljYyBFbmdpbmUgU29DLg0KPiANCg0KVGhhdCdzIGxvb2sgZ29vZC4NCg0KPj4NCj4+
IEkgc2VlIHlvdSBhcmUgdXNpbmcgaW5fYmUxNigpLCBvdXRfYmUxNigpIGV0YyAuLi4uDQo+PiBU
aGF0J3Mgc3BlY2lmaWMgdG8gcG93ZXJwYyBhcmNoLCBtYXliZSBpdCBpcyBiZXR0ZXIgdG8gdXNl
IGlvcmVhZDE2YmUsDQo+PiBpb3dyaXRlMTZiZSgpIGV0YyAuLi4uDQo+PiBTZWUgY29tbWl0IDNm
MzlmMzhlYTkxZCAoInNvYzogZnNsOiBxZTogcmVwbGFjZSBxZV9pb3tyZWFkLHdyaXRlfSoNCj4+
IHdyYXBwZXJzIGJ5IGdlbmVyaWMgaW97cmVhZCx3cml0ZX0qIikgYW5kIGNvbW1pdCA2YWM5YjYx
Nzg2Y2MgKCJzb2M6DQo+PiBmc2w6IHFlOiBpbnRyb2R1Y2UgcWVfaW97cmVhZCx3cml0ZX0qIHdy
YXBwZXJzIikgZm9yIGluZm9ybWF0aW9uLg0KPiANCj4gWW91J3JlIHJpZ2h0Lg0KPiBJIHdpbGwg
c3dpdGNoIHRvIGlve3JlYWQsd3JpdGV9ezE2LDMyfWJlLg0KPiANCj4gSSBwcmVmZXIgYXZvaWQg
dGhlIHVzZSBvZiBxZV8qIHdyYXBwZXJzIGFzIHRoZSBkcml2ZXIgaXMgbm90DQo+ICh5ZXQpIGNv
bXBhdGlibGUgd2l0aCBRRS4NCg0KQnkgdGhlIHdheSB0aGF0IHdhcyB0aGUgcHVycG9zZSBvZiBj
b21taXQgM2YzOWYzOGVhOTFkICgic29jOiBmc2w6IHFlOiANCnJlcGxhY2UgcWVfaW97cmVhZCx3
cml0ZX0qIHdyYXBwZXJzIGJ5IGdlbmVyaWMgaW97cmVhZCx3cml0ZX0qIiksIA0KcmVwbGFjZSBx
ZV8qIHdyYXBwZXJzIGJ5IGRpcmVjdCB1c2Ugb2YgaW97cmVhZCx3cml0ZX17MTYsMzJ9YmUNCg0K
U28geWVzLCB1c2luZyBpb3tyZWFkLHdyaXRlfXsxNiwzMn1iZSBkaXJlY3RseSBpcyBwcmVmZXJh
YmxlLg0KDQo+IA0KPj4NCj4+Pg0KPj4+IEl0IGVtdWxhdGVzIHVwIHRvIDY0IGNoYW5uZWxzIHdp
dGhpbiBvbmUgc2VyaWFsIGNvbnRyb2xsZXINCj4+PiB1c2luZyB0aGUgc2FtZSBURE0gcGh5c2lj
YWwgaW50ZXJmYWNlIHJvdXRlZCBmcm9tIHRoZSBUU0EuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5
OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCj4+DQo+PiBJbiBzb21l
IHBsYWNlcywgeW91IGNvbW1lbnRzIHVzZSB0aGUgbmV0d29yayBzdHlsZSwgbm90IHRoZSBnZW5l
cmljIHN0eWxlLg0KPiANCj4gSSB3aWxsIGZpeCB0aGVtLg0KPiANCj4+DQo+PiBDaHJpc3RvcGhl
DQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcsDQo+IEhlcnbDqQ0KPiANCg==
