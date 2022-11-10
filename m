Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C09624329
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 14:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7N032NSPz3f3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 00:26:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wb9jCPRd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.71; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wb9jCPRd;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120071.outbound.protection.outlook.com [40.107.12.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Mz62Zpjz3cB5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 00:25:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPeA0R8x6KHVd3GSyDcdRm4Al/zGbfBLlVkj/Uw+B8C74ECu0S6A7xzm9dobdDS6HzUmi/vMj/mBATQOEBoPTKDjUqCktasApdRIhrczsqtFiJAZty5j7y5XzyvpBAYRKMwlwBSnrEIJeYFoDTo7W4LLDLX044/Z9CAroNhB6WAgZI2r+fbsEkYiOZ3j5g7TqBYjiFqYh916UfHT49HN7PhaUQg8IhunzJ/fghnxc8wLC0gBplV4QdVoYCWqMj8kw7M/tQuBCG39KL4JFZgkoxmVbnCsxRsmXTZJtz88sJS/wMgYkfwzzJu+Zz94CgFMSwhUFUtGdYIfJ6GwyAmIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfHnl39cwiwBE6j/OlxqABpGR1pJe6XuFNtEVBaLdwU=;
 b=OUn8BXlQ4NjTWc5z8XVcD2RrsYZ04+k9850hhby4FEZ8yhTvH9zHa5mp1U2km0DmjO4kJ/dNYep6BKrEi4A5HrV3BhUYpMvhMMPB3sTno729lDGnUPJCO31EDBI2ViwY1AndKavSvwY/FpJR0FQbJ5hwV2Tf5nkLTti7ULsfrEw6WEnOrtgUM0IKDwc+Br7oupWuRlSEnEkfSvsp2YHVriz1YerlPW7i9a0Uw8KRQIGPKRGe7PJpLDBGgreAZeKi3e5BuXuoZNIeJk/cK1DYu4iJAYV5yEUsKTBZ2H1r7w9sWghfJvt9khyAeiQiHo2nb797nvboSnXOhiSRtSOvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfHnl39cwiwBE6j/OlxqABpGR1pJe6XuFNtEVBaLdwU=;
 b=wb9jCPRdnVay9Iv8+tLBG5lEJVU74UPDChptsERKJBmDr9vUoFtYiAUn2FnOoPXWCheUvfo01YxkADojniEVL7qWPWufjRGrhm8zDRNM0wavIyYa8pR5nWL/pu5UbojFcC/KWxPIDC9RY0KvPKE01mHP4//RUVjW75rl1DIEbFc0b8IbSenOZiL+8bswMYiNeUEF0ruzz+2w4kIoFFA8+Ll/SnQpuPr/tHeEAgr5f89bJw5UbxUD1zWG9T0RbrfFlZABnbKo9GcY0IQjIAn3sEtVUigUL5IygoiOphRj8wvDXJq4kf6QTx5tEUJsa+y/FkWGRmVVVVCRKIPJadqVvQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2492.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 13:25:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 13:25:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] virt: fsl_hypervisor: Replace NO_IRQ by 0
Thread-Topic: [PATCH] virt: fsl_hypervisor: Replace NO_IRQ by 0
Thread-Index: AQHY2URawvlb70lw00u1NUcfuO3g4K44XTIA
Date: Thu, 10 Nov 2022 13:25:14 +0000
Message-ID: <bccb8729-7f0a-5f97-d1b1-5401ed9f3235@csgroup.eu>
References:  <20dd37b96bac0a72caef28e7462b32c93487a516.1665033909.git.christophe.leroy@csgroup.eu>
In-Reply-To:  <20dd37b96bac0a72caef28e7462b32c93487a516.1665033909.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2492:EE_
x-ms-office365-filtering-correlation-id: e7ba78b0-ec71-42e3-7907-08dac31f00c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Rl7jAUcmOXRI+tLCH4ci2mR7bHtqnzld9FMujeV32ezSWcz9dzeaUQ3jTZ9s0V2qxhhcZQZ3N4dKXGP6IFJAXrw2QH7/GwhGpSpBi+7DGq2JzAZ/mA6X7TOm7lBh5q/2FC7YN/4AKejGy62llR8IJEouAPwhzDmdkeIlH5hsydTWuZjmahY+WlpwZXZJLv8krqfE6UTKURpEgBqoD419ZzdITPpH5vyado4ncTf0zNbg/LArHY3qDkRBKdMVNe0mPdyiFnEykFjh5IE4xPuXROuLS4fyvEXkkUr8hGSuQulalCIsuFyE6nF7elVlkVoK1YyTSBMl6dmtfgD2uFpx7I+p3BLxflOY5CTevBg90kjyiLGZhZZIuBWl3JEdtUFqfKLTRYjkfiEUqSjPAVDMOg6SUYu66vRCEiGXvS5vEP8MQXEQAzoRFiVGyjPFZXIfElVQrRSKaMpI3PJi+1VEAAwRIc3UlpCwitq69fdismm3kcrgT+RHg0U8YjFVsd6AM5JxM9BZkFGIotYZplyiK278Gjz7LBGRmaLwEutOg/fwHpHLqj42BEsobAPdkIFUGtYfcsVUr8apenf+oUAeKAkpPTsPhBfyL4IZShElDvkgIT1CZaJIcdGNeyDKS+ozPdv2ZCEbH3/g2ON6z9C+q6ZqBHDRE1OLy5yuEsoXAyCwhy9kSyqhoqiqBvPkj0ReD//0XLKVNtKYz7gx7IHqkx6j5TOtCUCUkYPjbGQxLtYxMGIAjtYFjEEocyg6w3XUFkoJlTxBJbaVVF9Lzr71xQ3sYvoh+CqjVxVI5Um7BijxB4QxcVfzW8A7LlLtrdD3IWnfelHD49/G/HaV2fFthQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199015)(36756003)(6512007)(26005)(31686004)(31696002)(38070700005)(38100700002)(122000001)(83380400001)(66574015)(186003)(44832011)(6506007)(2616005)(2906002)(91956017)(5660300002)(66476007)(41300700001)(8676002)(66446008)(76116006)(66556008)(66946007)(86362001)(4326008)(64756008)(478600001)(6916009)(54906003)(316002)(71200400001)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RHRXUnZFTHVlWVdXSG5GUEpQdkFya0dWT3BYS2hCVUk5a3EwTzdodUpKdkdQ?=
 =?utf-8?B?OG91ZEMvWHpNZWpoUlZPK0dBY1JvM3RhZUdZdVNqVkt2ZVNnRllEN2g0UmpO?=
 =?utf-8?B?WmgyREozQnBpL04xZXpqN2JVc09UYWF6cWduK082R0ZrN3NRcjE5RkNYNGtN?=
 =?utf-8?B?MjhIY2Ewd0IrVU8zdnJDN2hxR0hhWkV5Unp2M0c3MnN2dElFWVZPK1cyblZY?=
 =?utf-8?B?MkVnWnlCYVlSS3ovckJYbUcrb29TY08zOXBlMXNGb0x4WDYzZzVuamxtbmNU?=
 =?utf-8?B?OFZHTjJqelkyVWk4Nk55Ky92TjBqVW5BdmlmVlNXekJzczRMU2RjOU5Na1RQ?=
 =?utf-8?B?SkxrOVhMMGNFUjNoaTV4SEk3M0c1S3RvbVYvZjN4ZnpnRUhxLzYwUkcyaTJp?=
 =?utf-8?B?NGdBMU5vU3ozbjJKdEdaa1hXSkwxUlJrelF5WUM1R2pYSWxuVGdrcFVSVmZl?=
 =?utf-8?B?RHdaN2I4NHB2c2cyd09wRms0NWROL2pmb0pSSThTN2hwUUpIV1ZHUGRxZVlL?=
 =?utf-8?B?a05yMWFib1cyZmU3ZzArWENCbm9NMmp5emdscDUrWXFHUVA5QUd4ZkloYjQ5?=
 =?utf-8?B?UHN1ZkpZNXJaUUdXeFI2REFocFVrdzAyc2lpNURLRkpSK3NuTE5TRG1XUGpt?=
 =?utf-8?B?RXpJVndFbzMwMnFEb1grZWxQQkJBUDBwRitaczYyWFV3R1U2T0xNemdxMER6?=
 =?utf-8?B?Y1BPa2NiNzM0TFhaZjhXYkJDRzZlT3JkZ2FkTVg1dk1kTmhPUkg2eEI5MGJv?=
 =?utf-8?B?K29UU2dUeWpxT0JSTE5HRGkwbTdxd0ppdDZpaTBiZGNWSjlkZW1KbEVyc0dZ?=
 =?utf-8?B?eDBreTBlb0pCV29ETE5xeDlueXIycVpiYTd2cWc2SCtaZnJOK0wwaDB2b2hx?=
 =?utf-8?B?dXRxRGU5aTJSemtweHF5VEJZWWhGbGhVbnFVbWswT08rSTYzL3IxUmQ2d0li?=
 =?utf-8?B?TTZTd2VmdTdoM1hRWksyTkJyOUF0N2p5WWc0V1JKejZ1eCtLM25yM0twd1pU?=
 =?utf-8?B?TkI5Q1NSRmZhWDRvMWc0Y2RkV2RrYUEyVkh3MGtLTjVGb0xuSVNLZjQ0RGNF?=
 =?utf-8?B?TlJWdTF0M1JRbk9XeGx0RmdoRUI4RXc1dUZodDh5V0w0b3E1ODNwRW5jeEJ0?=
 =?utf-8?B?Vk1xWFE0QXZQNUlQS1RGMFlxcytzS290NXgrUVhWRlMyNXk3MEZwV1huZlJm?=
 =?utf-8?B?Z1laT2ZKUlFZOEV4V04rNzZGZ0VMK0xSeGxiTVdLbGhWdnNCMzl6S1AwclJY?=
 =?utf-8?B?YTZRMVM5dGp3Y0ZuZVhVeXdrNEp0b2hYTk5Xc3NtbG9ySzVnWThJdjJSekkw?=
 =?utf-8?B?S2NwWXZYQmpXNzVVWkhCZjJUQWp0MThtVUVBazJibFJUa2pBZHRiazBHWklo?=
 =?utf-8?B?N0hacnlwbFJhQXV6RS9nSjVnOHVtcXVjZlFNaVBkMnpFOUxmaldkMUV2OFpm?=
 =?utf-8?B?TW91ZHppdERldE9XVTJnYW1DL1liL2M5S0dvd1JrcW9yeFBVNmhVMzE5Rkkr?=
 =?utf-8?B?dGc0ZE9PTHRqVVVxOTBtUWZtaDR5SlYyU1VlYXBaTitxcE5jc1RLS09zVjFN?=
 =?utf-8?B?c2syNVdOeHFSOWlidk40WkNpYldBWmJ5UjltRXd4ZXJRb29TY0oxMGNiclp3?=
 =?utf-8?B?UWdJRmc3U3FRZ3pFZDZQNStuZkVNN3lMbzVoTHBpa0kxYkpjc1FCNzhTaE1U?=
 =?utf-8?B?dzBGMGNpeFZZUjBXMEQ4eWliQXl0dVRQM0dsdkRpU1E4TVRUYmRFN0tRalI5?=
 =?utf-8?B?M2FzQTZDOEE2TzI5ZjIvRVQ5TmRsYVBtdDdZSGhKdWVvaVY2QXJFbjJVeGYy?=
 =?utf-8?B?R0hPY1BjZjhQUjZUSSswa21XQm0xQUhHWU1UUlZmUVBOV29xVTBuTXkrRXNN?=
 =?utf-8?B?Yk9ZNUNWMTVySHM3TmRDbWp5Tzh0bmIwL3k0OGZMd1l5d1pNbEZudk5ZaFVX?=
 =?utf-8?B?ZDlSMWJQRXRhdUhIQXIwSVhocU1vdzVPRUtXdGlEWGdvdUFjYW9tT3FhZVg1?=
 =?utf-8?B?RFRPRTF2MVlmVEMzMTNKMEc4S0EzVjdVZHBVaXY1R0xSY2xHZzl6ZUN2bzN5?=
 =?utf-8?B?Q09mTllKc2FuTzNjTmluRUlpZjQrSGxCaGFpeHNEeGJHbFZqSVQwbHNjMnFY?=
 =?utf-8?B?cUsvN0NWNEl1b2NxWnEyTlMrdFNyOThlbzVlam1VQnh6dWI3QktxS3lBZ1g0?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1ED45521DA4D794C8F3018EF706EBBE8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ba78b0-ec71-42e3-7907-08dac31f00c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 13:25:15.0090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SlmVZEd3SsbtSuqBmjGRXv0FNbcFwDxbFZR4sMo91Q6WD5bcWuQMixab0HUstE6k9IjfWUKGKdfUqUDRzrsXT4lAtNJTX7blU/QiJXBjfno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2492
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgR3JlZywNCg0KTGUgMDYvMTAvMjAyMiDDoCAwNzoyNywgQ2hyaXN0b3BoZSBMZXJveSBhIMOp
Y3JpdMKgOg0KPiBOT19JUlEgaXMgdXNlZCB0byBjaGVjayB0aGUgcmV0dXJuIG9mIGlycV9vZl9w
YXJzZV9hbmRfbWFwKCkuDQo+IA0KPiBPbiBzb21lIGFyY2hpdGVjdHVyZSBOT19JUlEgaXMgMCwg
b24gb3RoZXIgYXJjaGl0ZWN0dXJlcyBpdCBpcyAtMS4NCj4gDQo+IGlycV9vZl9wYXJzZV9hbmRf
bWFwKCkgcmV0dXJucyAwIG9uIGVycm9yLCBpbmRlcGVuZGVudCBvZiBOT19JUlEuDQo+IA0KPiBT
byB1c2UgMCBpbnN0ZWFkIG9mIHVzaW5nIE5PX0lSUS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KRG8geW91IHBs
YW4gdG8gYXBwbHkgdGhpcyBwYXRjaCwgb3IgaXMgYW55IGNoYW5nZSByZXF1aXJlZCA/DQoNClRo
YW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNv
ci5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jIGIv
ZHJpdmVycy92aXJ0L2ZzbF9oeXBlcnZpc29yLmMNCj4gaW5kZXggMDcwMzUyNDlhNWUxLi5mOGI0
Mzg5ZDYwZDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jDQo+
ICsrKyBiL2RyaXZlcnMvdmlydC9mc2xfaHlwZXJ2aXNvci5jDQo+IEBAIC04MzksNyArODM5LDcg
QEAgc3RhdGljIGludCBfX2luaXQgZnNsX2h5cGVydmlzb3JfaW5pdCh2b2lkKQ0KPiAgIA0KPiAg
IAkJaGFuZGxlID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAiaW50ZXJydXB0cyIsIE5VTEwpOw0KPiAg
IAkJaXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobnAsIDApOw0KPiAtCQlpZiAoIWhhbmRsZSB8
fCAoaXJxID09IE5PX0lSUSkpIHsNCj4gKwkJaWYgKCFoYW5kbGUgfHwgIWlycSkgew0KPiAgIAkJ
CXByX2VycigiZnNsLWh2OiBubyAnaW50ZXJydXB0cycgcHJvcGVydHkgaW4gJXBPRiBub2RlXG4i
LA0KPiAgIAkJCQlucCk7DQo+ICAgCQkJY29udGludWU7DQoNCg==
