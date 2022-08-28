Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5431F5A3EEB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 19:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MG17G1X9Fz3c3V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 03:40:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KRP4QV9J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.55; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KRP4QV9J;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90055.outbound.protection.outlook.com [40.107.9.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MG16T6GRHz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 03:39:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rah8Yh74BEeKA9BNS6AvRphVZzeooB/tV/wRKCFaa1+FZbu6zMRRHrUIODmUbLg17Gn5gVrazCnk7KEcWUME3qtbgOeocNA4eTR3SDmLkaTz1tWGKWBPonrdFryfEafBJ+beqyU7JFSQUgjwuVvRE4buh6FsZMLoM0QAaxPRZBTCgTAEPadnF7sztN2zKw/HjutWSRJWUrh+wnkimRL+iBOxqvpk7GSLBvZYf6qRqPYhtIUB1jZ4cyT9inLCdtw2XK6iUZpsQlYMIhULbNhXIvFg3TwKq05NfZLab9FCK1AJUXOMtCGc6AbLjymQ1uBx4phjeuu0za4DFrHGEgEZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q723f+UcmIXKe2lHm/VsFJenU+KQcd/V1TRuCC2uie0=;
 b=Mt/owdN+X05p6IhMpljRH8hXwPCmoI9YG50UC7LZYb0Z1IimIKh5fV1YbY0deWjAZWxnnQxRGuCtUCLQ/pR7zjlNZ3kOhSr+X6PZr76cDRO931ps0cKCfespbAPjmi8tP2r+cdoN8mKW07eF1I6ujIdH8BvhGT4/Fh/f1ERQ/ZETx/m+aEwDf3PWl40J9H/DKYHdsTCRy/ULMKu404EZQL3sZ1xLVdkjJWBO/RigHugIr/kApb8NHGIgXg+T96t/KDf2YlbXz2WdXatKIWOjF4qMG2hQ8AEJ4FmEiq7wWL9UxNsSXjSDkI1xdHG2AVGG3dANRBqClngOErlkvkV/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q723f+UcmIXKe2lHm/VsFJenU+KQcd/V1TRuCC2uie0=;
 b=KRP4QV9JyRmqgRa5nHusme7P+8HsI9GVdolauINvSykBIAElNcONB6SiMOg/l9s906YeSiy9rr3vr37ZgPtMabQl6RoJKa1l18gXDU6pYfq0n8qgaOYRkaIBqNWn1fUGBmI+U3j1fgaiPdXw2InyK3Rp3P7sK++gTSj7FUEVXfRkqNjco7DyDEtERFZ3m/1biVuMv48McTtTGZD/SHpcgfqgdYVziIOeVT61VDUeqskBCvw4IJUrQahgcjZCkBO6uUcXDQpCVQMTccLjm2fh+bDehqnx9Xl67+OZnd4E/wDf4/i9SdLBda9eilqSQ9aC78DHT7UCmanKXJZ6N94BBg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2881.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:36::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 17:39:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 17:39:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index: AQHYusSLeJySvCAqP0OhPUxxriPKGa3Eku+AgAABwQA=
Date: Sun, 28 Aug 2022 17:39:25 +0000
Message-ID: <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
In-Reply-To: <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7da06b6c-6164-41c2-70ce-08da891c4053
x-ms-traffictypediagnostic: MR1P264MB2881:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  T4i1bsw1O4nQSPP6yya6zcR51yB6A86Y1wPrGo2Yg7JlkA34GLcFzsoUhxhrA/C92qAlOPbVGC2i76P6N+3fzLtGoQyb5rfapb+F0+tLREV2g9TZhsBhFqwh4aG0rAOSMf86OsIZbjbjk7GVTXGyACvqcN7OwC5H8Pwqm943sKQcWzdC/IezbwYLvGxWu/YfJrXJ1pXphtayLNBCO8hUnKemEfVgTqRvzn7u8uRQImMhgwyd3p0n3j6p1bZxqUYZzZXaB8xSKgJVPb1Y/v0Ppbgj2qha7bJfHbJbDEUjT7/9R8e8KyBTYmeEwzxvIzcNbdWwvTOxTKm3wNNuVAqQH4aaQAncFFC4SpqeS7I034dIU8j8T+ZJg+7w2pHYwIQkc2GUaREYGHbCGBpeCmJ4zNjRqMFWN/v8+7gERfv5SXiMsIoHKqEWH2Fm+H2mVi42cBUgl4CqIQGFRi0v+kyziV/bn9s+Y5E6xmG63ZzmSGI48NklcZQeL7jZl2vgT0giDbAjUA6aBgc71xIBGSNiWi4ar7/KAPlQIr2CVGcKM93NOeUuYvbHFGaOb2hX3w/ME60O5Vib1cE1LXxF6usgHHGtq26Xb5c2+j2OSV4Tuv7z918vaqIW+XXhiFII/Ok1VlBNj+XUv3QKmEgJzoSklTH/VFPwGdqp524m0iHqGWsIcVG9pH9LnM+vnxd8jhhwNnanwapnmxeRspMYkRUUFC5hsLVef4AwW8+8gN4QYih9snhsb41B/+vYOP6QeS1taitHrkVPdk7wYElHVW8QRUSoxSrXF9Lcw2A1fb6ae1ykxF287HoBMmQTM0PysdoF9fdHcJSV/Tdd9K4A8Qzyfw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39830400003)(136003)(376002)(396003)(366004)(122000001)(36756003)(316002)(38100700002)(83380400001)(31686004)(71200400001)(54906003)(110136005)(66476007)(66556008)(478600001)(6486002)(91956017)(66446008)(64756008)(4326008)(76116006)(8676002)(66946007)(38070700005)(41300700001)(5660300002)(8936002)(44832011)(6506007)(26005)(6512007)(66574015)(186003)(2906002)(31696002)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Smh3Zlg5bTBiZ1huekxBMjhxek9HSFBsdU82bHdNRXozSjVLbVh2TUs2WDd2?=
 =?utf-8?B?NHdFSVNQR3B3QkdrdlpHa0Zscm9ZbFROUmI5aWZwRjZhamlGakxjcjVyUzZn?=
 =?utf-8?B?TUQycU80RGdLTm9aUzBRREp6OUYyVis2T1gydnB3bVk4NC9OY0xueE5tTG0r?=
 =?utf-8?B?S0VSWGdOSHB5bGl6Um9YSk9oU2EyOHRPWWp4VmdzS0kyeEZGczk4eGw5NUVW?=
 =?utf-8?B?b04wUWtiTkViSy9Tb3B4KzN0WW0zTUNtbG1RZ1oybEE2Nk9RcVNMTElsRFZz?=
 =?utf-8?B?SmFhVHdQempHTG82UXY2UGJFUnJ0TUtoOG9PdkRjUmJVNldtRGJJWFI4NlN0?=
 =?utf-8?B?NCtvYjh2Qk5lakUyR0svdUFFejFZU0FpVzBxcXA4clVDV3podUlBQTkwd1I4?=
 =?utf-8?B?ek5NaU1uUmRxSkpMOU5sbmNxeWlGTEJrVExSejdXMi9oSVFtaElwZE8zUXNW?=
 =?utf-8?B?VFJPMjZtVVJkR0RNTXh3V2FPOHNJbXlkalVPczhFVCttaFZGRVlpL1hqbTlB?=
 =?utf-8?B?RzlnUGlzRVQ1RFQ1VGJ4dkppTGZEVTIyMjRRMkZ5N3BsQ0hBam9Jb1BIM2lz?=
 =?utf-8?B?QWQvMlk2VWZ3ZTBnVkdSbVlzV05qYkxpK2FBcDBJL3hQRUhFUGlkUThoYXY0?=
 =?utf-8?B?K0Zicjc2TkpJcmdpa2dLMEhMRG9MYVFQSHFkMG0zSWFVQjZEM3FwYU83Lzg4?=
 =?utf-8?B?aU9RRnluNHN6VjhCNytZZysrOTkwUjY5MklNbzI0YS9JWklhaG5VcjFvb1l2?=
 =?utf-8?B?MHQzRUJianEra3FmUzh4VkpwbUF1NVNwd0h1eTBSZFJKSkZQL2lUeisvTlgz?=
 =?utf-8?B?THRUTUFuVnlaTmRGVlcrOEIxL0NJSWxuLzJIeTBUTDFtRWhidHZ1MFBQbjNz?=
 =?utf-8?B?dUZralU2Rzc5Y2F3aVVLeTBLeXkzZU8rcFFUZm5NTjB0aHFJZlpwWHhNeHFu?=
 =?utf-8?B?RTBGdm5wWHNUVmNGMW9XMjUvRVFGaUhHR2lQYjJybXl0cTlFY28yblFzNHZi?=
 =?utf-8?B?VmxmbXdFdEd3TkJPSlBXYWF4R2xpK2ZkQ0FOR0VZQnlqcWxhd0lKZDFxd2wz?=
 =?utf-8?B?VTQ3dGwreXBjdkF5U1NIVEx0UzEreWtBWGkzdUNybENHQ2oxSm5ldnpsQWpC?=
 =?utf-8?B?Q2lTMGZ4Nzd2bVJjRWY2VGp1ZmJ6a3JCdzFpbXJiN1FiOFFnUkw2Nk0rdXNF?=
 =?utf-8?B?OHR0TDNJRXN5ek9uYjV4ZGJWWWZvOFNBSWgveURRYW8vREJYanRTWmovUGZX?=
 =?utf-8?B?SDRKajBubXFSeUh1cE5UZGd2VlNDRGlHNkxham9CQXFOa054c3dRV3dKblg2?=
 =?utf-8?B?Zk4vcU1lTE1ndWF1Z1orQVczQ01TbFIwR25LeTA1VGxSRng2TnFpWVN3SUIw?=
 =?utf-8?B?eElsY1U1dFhiUWlHcjc4dGFsYnZlVWFvbzl4bkJROEk0dzdMMEhPbTh6OHQ1?=
 =?utf-8?B?L1EzOFpxT1hqaXlwc1B0MGVNdmhJMDVISlJWVjFFL3BPa1dFYkFkMjBzWHMz?=
 =?utf-8?B?Q0ZBUk9ORm5pd212Q1lMOFduNHlRTlQ1OTFqSTdjKzhvbCtOcW9JaFF5WDZh?=
 =?utf-8?B?bU1RS2paUnZUU3VIN3VndW5rYWcvTmRpNExOVUR3cmR6K2MxaUdXUnBrcDJO?=
 =?utf-8?B?NlJHM0IzZjdSVndMcTVyUVlWS0NvQm1rTlVkcDF4dStKUHFLTTZDa0d0VUFx?=
 =?utf-8?B?ZnBTKzArT1BxSzJuM0dJemhtUVpFa3pSc1pDUmVkK2JoamZHMHhyd2xZTzhw?=
 =?utf-8?B?MTcxWnduQ0lnbzNjYU9KdlkzUy9mUFVrUDBDb29yS2RFS1ZCdm5oYTU3UDJ5?=
 =?utf-8?B?TE1mOUtGeUhvYnJ4cXNGcTQwM2ttV2lQcFh1bUx4OXI5S21pSnZWYXA4cEZS?=
 =?utf-8?B?TFBCOEFSL0RXeG1XYVJqYUhVSXFvQzJ2TVVZZUsrRE9GOTk4bGZmTzdrTzg3?=
 =?utf-8?B?RFhqZnBnMnlzM1ladHlZWUtQa3Q4alNwVWZsaUN6V05RS08wMm1mNFVZQjdz?=
 =?utf-8?B?YWhBU1VFNGtJMmVkQ0Rjdnc4WmMzcVQvOFRzblVMVXJxSm04Mjlzd2JBcEdL?=
 =?utf-8?B?VkNnVkt1VnpHMHhGSFlRb2ZEN2RFdkw5UGJLOUtFZ0RkQytlZ1d6U28rT0N5?=
 =?utf-8?B?R2ZUVCtBdkhuTktPTzIxUTl3Nkt2clpkcFdTNVg3dXZnbzFIOWk5akUvQXB4?=
 =?utf-8?Q?OGxgBPRCqA6clL2ztGL1/qA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B0767599BC81B46B8328CF8C46620A7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da06b6c-6164-41c2-70ce-08da891c4053
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 17:39:25.7177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1g6yYzMgDTDqIKr0nN5VKAPVCE//pU1q16/pzBaTvwqNMniWB9Ov8T5SCIiSuAdpd3ib0Lpjq7JuWpD0Z9kAAm7WWgyXVNlgysLOGwfVzgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2881
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

DQoNCkxlIDI4LzA4LzIwMjIgw6AgMTk6MzMsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAyOC8wOC8yMDIyIMOgIDExOjU2LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKg
Og0KPj4gV2hlbiBDT05GSUdfVEFSR0VUX0NQVSBpcyBzcGVjaWZpZWQgdGhlbiBwYXNzIGl0cyB2
YWx1ZSB0byB0aGUgY29tcGlsZXINCj4+IC1tY3B1IG9wdGlvbi4gVGhpcyBmaXhlcyBmb2xsb3dp
bmcgYnVpbGQgZXJyb3Igd2hlbiBidWlsZGluZyBrZXJuZWwgd2l0aA0KPj4gcG93ZXJwYyBlNTAw
IFNQRSBjYXBhYmxlIGNyb3NzIGNvbXBpbGVyczoNCj4+DQo+PiDCoMKgwqDCoCBCT09UQVPCoCBh
cmNoL3Bvd2VycGMvYm9vdC9jcnQwLm8NCj4+IMKgwqAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2Nj
OiBlcnJvcjogdW5yZWNvZ25pemVkIGFyZ3VtZW50IGluIG9wdGlvbiANCj4+IOKAmC1tY3B1PXBv
d2VycGPigJkNCj4+IMKgwqAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2NjOiBub3RlOiB2YWxpZCBh
cmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFyZTogDQo+PiA4NTQwIDg1NDggbmF0aXZlDQo+PiDC
oMKgIG1ha2VbMV06ICoqKiBbYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGU6MjMxOiANCj4+IGFy
Y2gvcG93ZXJwYy9ib290L2NydDAub10gRXJyb3IgMQ0KPiANCj4gY29yZW5ldDY0X3NtcF9kZWZj
b25maWcgOg0KPiANCj4gIMKgIEJPT1RBU8KgIGFyY2gvcG93ZXJwYy9ib290L2NydDAubw0KPiBw
b3dlcnBjNjQtbGludXgtZ2NjOiBlcnJvcjogbWlzc2luZyBhcmd1bWVudCB0byAnLW1jcHU9Jw0K
PiBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlOjIzNyA6IGFyY2gvcG93
ZXJwYy9ib290L2NydDAub10gDQo+IEVycmV1ciAxDQo+IG1ha2U6ICoqKiBbYXJjaC9wb3dlcnBj
L01ha2VmaWxlOjI1MyA6IHVJbWFnZV0gRXJyZXVyIDINCj4gDQo+IA0KDQpTZWVtcyBsaWtlIGlu
IGZhY3QsIEU1NTAwX0NQVSBhbmQgRTY1MDBfQ1BVIGFyZSBub3QgdGFrZW4gaW50byBhY2NvdW50
IA0KaW4gQ09ORklHX1RBUkdFVF9DUFUsIGFuZCBnZXQgc3BlY2lhbCB0cmVhdG1lbnQgZGlyZWN0
bHkgaW4gDQphcmNoL3Bvd2VycGMvTWFrZWZpbGUuDQoNClRoaXMgZ29lcyB1bm5vdGljZWQgYmVj
YXVzZSBvZiBDRkxBR1MtJChDT05GSUdfVEFSR0VUX0NQVV9CT09MKSArPSANCiQoY2FsbCBjYy1v
cHRpb24sLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQVSkpDQoNCkkgdGhpbmsgd2UgbmVlZCB0byBm
aXggdGhhdCBwcmlvciB0byB5b3VyIHBhdGNoLg0KDQo+IENocmlzdG9waGUNCj4gDQo+IA0KPj4N
Cj4+IFNpbWlsYXIgY2hhbmdlIHdhcyBhbHJlYWR5IGludHJvZHVjZWQgZm9yIHRoZSBtYWluIHBv
d2VycGMgTWFrZWZpbGUgaW4NCj4+IGNvbW1pdCA0NDZjZGExYjIxZDkgKCJwb3dlcnBjLzMyOiBE
b24ndCBhbHdheXMgcGFzcyAtbWNwdT1wb3dlcnBjIHRvIHRoZQ0KPj4gY29tcGlsZXIiKS4NCj4+
DQo+PiBGaXhlczogNDBhNzU1ODRlNTI2ICgicG93ZXJwYy9ib290OiBCdWlsZCB3cmFwcGVyIGZv
ciBhbiBhcHByb3ByaWF0ZSANCj4+IENQVSIpDQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
ZyAjIDQ0NmNkYTFiMjFkOSAoInBvd2VycGMvMzI6IERvbid0IGFsd2F5cyANCj4+IHBhc3MgLW1j
cHU9cG93ZXJwYyB0byB0aGUgY29tcGlsZXIiKQ0KPj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jD
oXIgPHBhbGlAa2VybmVsLm9yZz4NCj4+IC0tLQ0KPj4gwqAgYXJjaC9wb3dlcnBjL2Jvb3QvTWFr
ZWZpbGUgfCAxNCArKysrKysrKysrLS0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9ib290L01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4+IGluZGV4IGE5
Y2QyZWE0YTg2MS4uMTk1N2EzZGU3YTFjIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2Jv
b3QvTWFrZWZpbGUNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlDQo+PiBAQCAt
MzgsMTMgKzM4LDE5IEBAIEJPT1RDRkxBR1PCoMKgwqAgOj0gLVdhbGwgLVd1bmRlZiAtV3N0cmlj
dC1wcm90b3R5cGVzIA0KPj4gLVduby10cmlncmFwaHMgXA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJChMSU5VWElOQ0xVREUpDQo+PiDCoCBpZmRlZiBDT05GSUdfUFBDNjRfQk9PVF9XUkFQUEVS
DQo+PiAtaWZkZWYgQ09ORklHX0NQVV9MSVRUTEVfRU5ESUFODQo+PiAtQk9PVENGTEFHU8KgwqDC
oCArPSAtbTY0IC1tY3B1PXBvd2VycGM2NGxlDQo+PiArQk9PVENGTEFHU8KgwqDCoCArPSAtbTY0
DQo+PiDCoCBlbHNlDQo+PiAtQk9PVENGTEFHU8KgwqDCoCArPSAtbTY0IC1tY3B1PXBvd2VycGM2
NA0KPj4gK0JPT1RDRkxBR1PCoMKgwqAgKz0gLW0zMg0KPj4gwqAgZW5kaWYNCj4+ICsNCj4+ICtp
ZmRlZiBDT05GSUdfVEFSR0VUX0NQVV9CT09MDQo+PiArQk9PVENGTEFHU8KgwqDCoCArPSAtbWNw
dT0kKENPTkZJR19UQVJHRVRfQ1BVKQ0KPj4gK2Vsc2UgaWZkZWYgQ09ORklHX1BQQzY0X0JPT1Rf
V1JBUFBFUg0KPj4gK2lmZGVmIENPTkZJR19DUFVfTElUVExFX0VORElBTg0KPj4gK0JPT1RDRkxB
R1PCoMKgwqAgKz0gLW1jcHU9cG93ZXJwYzY0bGUNCj4+IMKgIGVsc2UNCj4+IC1CT09UQ0ZMQUdT
wqDCoMKgICs9IC1tMzIgLW1jcHU9cG93ZXJwYw0KPj4gK0JPT1RDRkxBR1PCoMKgwqAgKz0gLW1j
cHU9cG93ZXJwYzY0DQo+PiArZW5kaWYNCj4+IMKgIGVuZGlmDQo+PiDCoCBCT09UQ0ZMQUdTwqDC
oMKgICs9IC1pc3lzdGVtICQoc2hlbGwgJChCT09UQ0MpIC1wcmludC1maWxlLW5hbWU9aW5jbHVk
ZSk=
