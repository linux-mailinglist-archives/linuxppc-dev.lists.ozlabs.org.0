Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34391645B25
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 14:40:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRz2310l5z3c6d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 00:40:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hxkpkaot;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=hxkpkaot;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRz0r3kVVz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 00:39:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM7BF5w9UFrPOGn9fgrWui6fQCqk2YUcCeUW2Ox6JqQc9GhEmXecld8JFRmBqonXsHPktgfKV5Gb+ZUOvGvhUCuEGqeWLB9crgLbSXVXZ9JEPyxDtnPSST3XRuNHz/tsM/3gR3FKKDxsB0tL1Wv8tTPMshTUlc2H29FACsoi38q29T0UAQK2qLK2mRgG1CBTd20Pkh+/fDHa6Z10v8keep/1v7SplesFFmF2na8F+gFQi2tPAZiDkse/ccJRNhj6cAH1+6s0SxEy3aJftIgP+b+kcrMmVyNau5rWWosKikFQG1XA6sieuVZcgL0PPs62LdtRQ2/bXPUH/VlWYw7XlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsZOF5tqbIg+uGR4osBdWrhFjm5QTWtt7gH2h2fN9S4=;
 b=Nvra5MgpFsuYKhmtBYjf2JzhVtVWrXMmx27n87qA571l565PlB4tzA1AXTcuIQS/eSSDxUY7FCkZEqyP70skVgyrI+cfw8tGXT2txdTnGcCElCaIgom2bGsMyBJwmhqQs5IMutUzzEttdwqjH7wwaZXgUm45iE22iNxPeSSdkQHetT+shd26tRkRwsk8So1o0oRQHCOj7hnrb5eTd+9auWKTp6JVsIjYRc4iCY5Q3PdpVr3FGJ1rtRKuUpnraNS+JRJsScTJJ6MG6aQOtJStCSNPwE+iqr7VyU7zLgdEQyo+nXlgnN0+ENanqdw6eKiWfX/Q6lH1zIz/oUBfh/ZUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsZOF5tqbIg+uGR4osBdWrhFjm5QTWtt7gH2h2fN9S4=;
 b=hxkpkaotub5mKuGkMTABsldDpCH8OJEVJRyfghH8JjJDqktpsP/kxLb80HbW98OZ0tYsE+EZz7PVO860bZM5svJ1dea0NFiN3YumIe4wgsKlgYlU1N4nivY/R7tFit2P9YpuDX4yvsnofWQ6QvuyWb+k7AL/PdrugtEBZg6vRyyWIy9gRBmb+F94QwrFmqUAU9LkTm/WVom7wGHdgIEwjM0kblZuxBSHCX3o8SNGaF6ipRyPc5Tg92FJSl9nfirEv1m3G05Ft5qeV5G+YGCeTctfCXt1nsgBugMHwwGTfSQdM4mPvASM0EM1syLuRHmSjX2B/+BHCCxTqbze92ViiA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2461.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 13:39:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 13:39:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index:  AQHYusSLeJySvCAqP0OhPUxxriPKGa3Eku+AgAABwQCAAACcgIAAAKWAgAD+hYCAQJR5AIAk37aAgAEKKwCAJeCDAIARGb8A
Date: Wed, 7 Dec 2022 13:39:18 +0000
Message-ID: <aa61fc51-c6ea-2ad9-42c6-c62b280ab034@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
 <20220829085451.upubyo5e7uop72lb@pali> <20221009110652.h7senqesk7nabxmn@pali>
 <20221101221255.gwaem6w7upv545fw@pali>
 <00398948-d06c-3894-5be3-acb6cc09ff6b@csgroup.eu>
 <20221126163044.cnoccovve4a74a7l@pali>
In-Reply-To: <20221126163044.cnoccovve4a74a7l@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2461:EE_
x-ms-office365-filtering-correlation-id: 9aa10061-a3a4-41e2-052e-08dad85870e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oeFbu8rFX64/CibffZMs+VTzzU621ZpEYgZBn70TvDWJHJRNMwy++6SBvYip6BIz6+c72pAUv+7FTQdVh5LFd0aztRc+HAo9AT2JwuOpjGwaOCcbAYFf3B6PleodoBOSXarUHuPR6cGYZWiTF+Ep05wp3bDU4e9VJMqZv6LUUxxCF3VqCSXU8dDzQk+c+UFGYga8v8k1NXTDyijU19+DCa4kKjDqFcR0pNMZejBV8jE06aXROcaYnhhL6gquA4UITGGh4stDXCi2xBUYKJCUCedmd0UbRPF0nA8oiaUIgyFVBUYQJti42nii2IBMn1Ck+PTdSOy/r4urEz6p7f/a9tD30MMYhl6hsQrctkoDQ0M2AR/J1HIY3L2aSRpqt57Z+n9sydmURw9/LOKMdb+qmRch2DdUuZY9zT6euH/y+Z7FweuGX2cm1U/0TVINNVBAuHxVlPDqQlfYiQ9l/UsH4pQRXaT9/OZn+TI12Sh1A3YSRyBfLCTm/XpfLet2AnsiW4BSZUVt750JfITOhVzBfigokR8AQGcjCQfMNcUJYAU0qld/tocoXu0rmLXyUx0U50Jb6oOelIQHbGqy8PKHpaAIUdGFfwZp/JsH5ErR/7BuBSzTHnsAdfAIUpGiTleGIspLbWm4Zs44sdT2EMcURmvHP6CFChqYEhsPS05KwUwWPcFZtpHp7kRhgMIOHrfVpLGa/D06Vp5t7jsvw1vmUC0KLDCSRg3CyXl6CLHfLa6Wg2SCujwWBO6XFoBWMzqwx8oskSwIr68Z8JdvPU3nkQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(83380400001)(122000001)(8936002)(31696002)(86362001)(44832011)(91956017)(5660300002)(2906002)(38070700005)(66574015)(4326008)(41300700001)(478600001)(186003)(26005)(64756008)(6506007)(6512007)(66946007)(2616005)(8676002)(66556008)(6916009)(76116006)(66446008)(54906003)(66476007)(31686004)(6486002)(316002)(38100700002)(71200400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YXBqSWx1eXdNRFNXdlk4dU4zVk9TbkprMmt6OVdZU2lQVGF5QmVTMTVGQUdq?=
 =?utf-8?B?YWR1WEpNdWRkUFJHRFF5TzdlVGNRODdyZW15MU8xeWh3ZlJwR0s1RHlUMTMx?=
 =?utf-8?B?SnBpaU9qZis0VHZVZDhxa3hmLzZtS1h0NlRLMjNuanJNbUNqVmhHVk5lYU5D?=
 =?utf-8?B?RTJsWkRGNzZaQ0JQWko2WnBtcUlhN3F6V1lTTVhkdVNFeHBzNFdIbm8zSjI3?=
 =?utf-8?B?TnMydHhRYkJ6cUduTnhGYnZFUzFDbEtKbklMc0VEZ3BMVGFMY0U1OFFEeExX?=
 =?utf-8?B?Z3h1ZUdXWHd3VkFlVzUwbTJCMEtMRGlCSFVsNHJ4YWpaV1RQVkpDemV2bU1z?=
 =?utf-8?B?dTc1N1A4RFhkemlKOG04NlpoMDhBOEhmdXNDQzlhRFg3Ym9KR2lrcjFERXBS?=
 =?utf-8?B?V1ZMVVpFTytlU1FPRlUxMVQyeDdCV1g4NzZjVkMxZ2F4dkNsNGxnL0VmY2Ro?=
 =?utf-8?B?azdXR21vaEdnWFMwRG9lMkJPZ3UvV3R3VkhTdFhJOU1YS0dySm5oNFJydGZL?=
 =?utf-8?B?eGNwNDMxUnphYWlSRG0yM2I2MzViVkNQR1EwN2gybllzMTl6Y0VHMnRlL3M2?=
 =?utf-8?B?bi82dGJaVUljWVMyWWRPRkU2QWR1clBWWndybUw3ajY0aU5JSFp4dlB3dmkr?=
 =?utf-8?B?d3l0Q1VaY3NlV2xLeHloSXc2Zk9tMTYwbWRydmVmRmRiMWVaRU5WaWVFakoz?=
 =?utf-8?B?WmtzY0JZRjZhOU5ZRzBvRlp6eXJQVUVRU0JnUHNVaHVETVNjNnJuR3RaM3Q0?=
 =?utf-8?B?Ym9sUEd4N1cvQjYxU0Q5VmhMbWJXU2psY1lvR1RSUWtYMkZsQnlyMEwvRmly?=
 =?utf-8?B?SlRjTEIzejlhOE53dXkwa0h0bnlleW9XbjBTOE5sdWY4NlJVMTNQaW5QVllJ?=
 =?utf-8?B?NkF1STlXbnpUSEhHaVBzSlkydVdCVEZzeG5FMmZKWEhLbGNVTGJZVUpHUU9s?=
 =?utf-8?B?cHUvQ0hKU3dHQlY2cE5hMnh0ZHRtVXM3RXBzaHVPc0c1T2FDZzkrYVlYR3JX?=
 =?utf-8?B?SUxqai8zWmtldlZrM2g0SG5Hd3N2WTczTEI4cEZyOGd5ODErQ0xETUNsY3JX?=
 =?utf-8?B?ck9ROVZHZXFCVVE5aGQ2b0FLYTVWWVpXekhVOWw2dk8yako3OVBGYXFBZ3h1?=
 =?utf-8?B?K29aV0J4NDVCTWxKaXFHWE9XOXZiZUlFNHBFN01TeDM1K3FFY0NRQ1N0RS8w?=
 =?utf-8?B?SXV3K0hoaFR2Rm4waGVFcjVYeUJZK2lCc1RmT1FCR01qRDVldkd0RWo1Z3ZC?=
 =?utf-8?B?cXlhUHNaTVVjNENtYmNsOXhNaTc1am52cHNYTnozZ01yRHFvNjdBRTRQMVpz?=
 =?utf-8?B?ZStaQVRLYjJOSGErYzNwQUJ6ZnlWVW5RSnBicE9HSTRzOWlpU0FCSncxeVU2?=
 =?utf-8?B?ekZzLzlmVXQrdld5clFobGhneXR6R25KMEs4TWNwMnZQQTFOUEVjVEluWVBj?=
 =?utf-8?B?enpJdVhGWWdRek9XUFZ1QkQ0amovTTczd2FqMm5DTzRIYXZ2UEw2VXhxcW1q?=
 =?utf-8?B?YlRZN3gvSGt5cm1VZEZkbm9jT0p5NDEyeU1DT3hvcUp6VjJ4Q3FUbE10SW1l?=
 =?utf-8?B?UExPTVBuK2hKYVcrVEVxY3NCQUJpVHdDcTJIdUd6TXdnYlk1YVJ1ZzdxVGl2?=
 =?utf-8?B?anRtUFVLTkdiWC8zbzdiYmRlZy9rYnVBNlk1V0ZMcnc3WG1BWVh5MVhBaHhU?=
 =?utf-8?B?RTV0Q1dFM1lkbi94b0I3TFdzUmtjeGNWdUdCYWNKNGoxMjZORnFOSXBvZU8y?=
 =?utf-8?B?cDVoSjUvQThuNHlwdXRNRE96MlRySXJqQnNuTFhMS2JBZDZWZGE2VmNmL0kz?=
 =?utf-8?B?NE5JM0EzRjR0YUhtclArOU5oeUR6NllOS1FnUUUyczNqc0tkYW1SM3VIbncy?=
 =?utf-8?B?Y0d3TzJaWHhCbTZha0pwUEJUbExaTEYvbUtPSURXcWtqczhRUWc4cm96SlBh?=
 =?utf-8?B?QUMvQk15ZmlSb1BVUjRBQzNKaldpMlVTd2VHSGdDUnNnQmJsUWpUOUZ5T1Jl?=
 =?utf-8?B?ZDZoOWlrS1BTTlp5REZTZG0wTVY1SnpGV3hZeExTM3BGTVlYV3czSnYreHVP?=
 =?utf-8?B?dnhacHQrRnB3ZFh0RkRhOUFmM0RBc2RIOTE4VGhJZEVnb1FTMW5maDQzcTVJ?=
 =?utf-8?B?RHVvOFpoSGl4YVNubzdJb0hUN2dYZWZJMXZIa1dvL0U4TkNCTlRZTFpyZTlF?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <164B308F89B1484DA4EE9BB7A6A61EC3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa10061-a3a4-41e2-052e-08dad85870e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 13:39:18.8641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlrKq69JNeUSl8B6khj3bq5GF9dFxcf+tPUGwTv5G0QE47gDPoZBG7dRlARkH/LgnxTRoV3TeN657wD8Yl87MfdTCACKHT+6MSaozKJxcOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2461
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzExLzIwMjIgw6AgMTc6MzAsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFdlZG5lc2RheSAwMiBOb3ZlbWJlciAyMDIyIDE0OjA1OjM1IENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+PiBMZSAwMS8xMS8yMDIyIMOgIDIzOjEyLCBQYWxpIFJvaMOhciBhIMOpY3JpdMKgOg0K
Pj4+IE9uIFN1bmRheSAwOSBPY3RvYmVyIDIwMjIgMTM6MDY6NTIgUGFsaSBSb2jDoXIgd3JvdGU6
DQo+Pj4+IE9uIE1vbmRheSAyOSBBdWd1c3QgMjAyMiAxMDo1NDo1MSBQYWxpIFJvaMOhciB3cm90
ZToNCj4+Pj4+IE9uIFN1bmRheSAyOCBBdWd1c3QgMjAyMiAxNzo0Mzo1MyBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4+Pj4+IExlIDI4LzA4LzIwMjIgw6AgMTk6NDEsIFBhbGkgUm9ow6FyIGEg
w6ljcml0wqA6DQo+Pj4+Pj4+IE9uIFN1bmRheSAyOCBBdWd1c3QgMjAyMiAxNzozOToyNSBDaHJp
c3RvcGhlIExlcm95IHdyb3RlOg0KPj4+Pj4+Pj4gTGUgMjgvMDgvMjAyMiDDoCAxOTozMywgQ2hy
aXN0b3BoZSBMZXJveSBhIMOpY3JpdMKgOg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
PiBMZSAyOC8wOC8yMDIyIMOgIDExOjU2LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKgOg0KPj4+Pj4+
Pj4+PiBXaGVuIENPTkZJR19UQVJHRVRfQ1BVIGlzIHNwZWNpZmllZCB0aGVuIHBhc3MgaXRzIHZh
bHVlIHRvIHRoZSBjb21waWxlcg0KPj4+Pj4+Pj4+PiAtbWNwdSBvcHRpb24uIFRoaXMgZml4ZXMg
Zm9sbG93aW5nIGJ1aWxkIGVycm9yIHdoZW4gYnVpbGRpbmcga2VybmVsIHdpdGgNCj4+Pj4+Pj4+
Pj4gcG93ZXJwYyBlNTAwIFNQRSBjYXBhYmxlIGNyb3NzIGNvbXBpbGVyczoNCj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4gICAgwqDCoMKgwqAgQk9PVEFTwqAgYXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5v
DQo+Pj4+Pj4+Pj4+ICAgIMKgwqAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2NjOiBlcnJvcjogdW5y
ZWNvZ25pemVkIGFyZ3VtZW50IGluIG9wdGlvbg0KPj4+Pj4+Pj4+PiDigJgtbWNwdT1wb3dlcnBj
4oCZDQo+Pj4+Pj4+Pj4+ICAgIMKgwqAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2NjOiBub3RlOiB2
YWxpZCBhcmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFyZToNCj4+Pj4+Pj4+Pj4gODU0MCA4NTQ4
IG5hdGl2ZQ0KPj4+Pj4+Pj4+PiAgICDCoMKgIG1ha2VbMV06ICoqKiBbYXJjaC9wb3dlcnBjL2Jv
b3QvTWFrZWZpbGU6MjMxOg0KPj4+Pj4+Pj4+PiBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm9dIEVy
cm9yIDENCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IGNvcmVuZXQ2NF9zbXBfZGVmY29uZmlnIDoNCj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+ICAgICDCoCBCT09UQVPCoCBhcmNoL3Bvd2VycGMvYm9vdC9jcnQw
Lm8NCj4+Pj4+Pj4+PiBwb3dlcnBjNjQtbGludXgtZ2NjOiBlcnJvcjogbWlzc2luZyBhcmd1bWVu
dCB0byAnLW1jcHU9Jw0KPj4+Pj4+Pj4+IG1ha2VbMV06ICoqKiBbYXJjaC9wb3dlcnBjL2Jvb3Qv
TWFrZWZpbGU6MjM3IDogYXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5vXQ0KPj4+Pj4+Pj4+IEVycmV1
ciAxDQo+Pj4+Pj4+Pj4gbWFrZTogKioqIFthcmNoL3Bvd2VycGMvTWFrZWZpbGU6MjUzIDogdUlt
YWdlXSBFcnJldXIgMg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBT
ZWVtcyBsaWtlIGluIGZhY3QsIEU1NTAwX0NQVSBhbmQgRTY1MDBfQ1BVIGFyZSBub3QgdGFrZW4g
aW50byBhY2NvdW50DQo+Pj4+Pj4+PiBpbiBDT05GSUdfVEFSR0VUX0NQVSwgYW5kIGdldCBzcGVj
aWFsIHRyZWF0bWVudCBkaXJlY3RseSBpbg0KPj4+Pj4+Pj4gYXJjaC9wb3dlcnBjL01ha2VmaWxl
Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoaXMgZ29lcyB1bm5vdGljZWQgYmVjYXVzZSBvZiBDRkxB
R1MtJChDT05GSUdfVEFSR0VUX0NQVV9CT09MKSArPQ0KPj4+Pj4+Pj4gJChjYWxsIGNjLW9wdGlv
biwtbWNwdT0kKENPTkZJR19UQVJHRVRfQ1BVKSkNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJIHRoaW5r
IHdlIG5lZWQgdG8gZml4IHRoYXQgcHJpb3IgdG8geW91ciBwYXRjaC4NCj4+Pj4+Pj4NCj4+Pj4+
Pj4gSXQgbG9va3MgbGlrZSB0aGF0IENPTkZJR19UQVJHRVRfQ1BVIGlzIGJyb2tlbi4NCj4+Pj4+
Pj4NCj4+Pj4+Pj4gICAgICAkIG1ha2UgQVJDSD1wb3dlcnBjIGNvcmVuZXQ2NF9zbXBfZGVmY29u
ZmlnIENST1NTX0NPTVBJTEU9cG93ZXJwYzY0LWxpbnV4LWdudS0NCj4+Pj4+Pj4gICAgICAuLi4N
Cj4+Pj4+Pj4gICAgICAjIGNvbmZpZ3VyYXRpb24gd3JpdHRlbiB0byAuY29uZmlnDQo+Pj4+Pj4+
DQo+Pj4+Pj4+ICAgICAgJCBncmVwIENPTkZJR19UQVJHRVRfQ1BVIC5jb25maWcNCj4+Pj4+Pj4g
ICAgICBDT05GSUdfVEFSR0VUX0NQVV9CT09MPXkNCj4+Pj4+Pj4NCj4+Pj4+Pj4gQ09ORklHX1RB
UkdFVF9DUFVfQk9PTCBpcyBzZXQgYnV0IENPTkZJR19UQVJHRVRfQ1BVIG5vdCENCj4+Pj4+Pg0K
Pj4+Pj4+IFllcywgYmVjYXVzZSB0aGVyZSBpcyBubyBkZWZhdWx0IHZhbHVlIGZvciBFNTUwMF9D
UFUgYW5kIEU2NTAwX0NQVS4gV2UNCj4+Pj4+PiBuZWVkIHRvIGFkZCBvbmUgZm9yIGVhY2guDQo+
Pj4+Pg0KPj4+Pj4gSSBzZWUuLi4gV2lsbCB5b3UgcHJlcGFyZSB0aGlzIGZpeHVwIGZvciB5b3Vy
IHByZXZpb3VzIHBhdGNoPw0KPj4+Pj4NCj4+Pj4+IEFuZCBJIHRoaW5rIHRoYXQgZm9sbG93aW5n
IGNvbnN0cnVjdA0KPj4+Pj4NCj4+Pj4+ICAgICAkKGNhbGwgY2Mtb3B0aW9uLC1tY3B1PSQoQ09O
RklHX1RBUkdFVF9DUFUpKQ0KPj4+Pj4NCj4+Pj4+IHNob3VsZCBiZSBjaGFuZ2VkIGp1c3QgdG8N
Cj4+Pj4+DQo+Pj4+PiAgICAgLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQVSkNCj4+Pj4+DQo+Pj4+
PiBCZWNhdXNlIGlmIHVzZXIgc3BlY2lmaWVkIHRoYXQgd2FudCBidWlsZCBmb3Igc3BlY2lmaWMg
dGFyZ2V0IENQVSwgaXQNCj4+Pj4+IHNob3VsZCBub3QgYmUgc2lsZW50bHkgaWdub3JlZC4NCj4+
Pj4NCj4+Pj4gQ2hyaXN0b3BoZSwgc2hvdWxkIEkgZG8gc29tZXRoaW5nIGluIHRoaXMgYXJlYT8N
Cj4+Pg0KPj4+IENocmlzdG9waGUsIGFueSBpbnB1dCBmcm9tIHlvdXIgc2lkZT8NCj4+DQo+PiBI
aSwgc29ycnkgSSB3YXMgb24gaG9saWRheSB1bnRpbCB0b2RheS4gSSdsbCB0cnkgdG8gaGF2ZSBh
IGxvb2sgaW4gdGhlDQo+PiBjb21pbmcgZGF5cy4NCj4gDQo+IE9rLCBEaWQgeW91IGhhdmUgYSB0
aW1lIHRvIGxvb2sgYXQgaXQ/DQoNCkkganVzdCBzZW50IGEgcGF0Y2ggZm9yIGl0Lg0KDQpDaHJp
c3RvcGhlDQo=
