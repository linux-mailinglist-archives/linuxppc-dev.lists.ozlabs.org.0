Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCB6663E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 20:43:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsdR00QVxz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 06:43:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bfWC5Lyd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.88; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bfWC5Lyd;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2088.outbound.protection.outlook.com [40.107.9.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsdQ12RNNz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 06:43:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J56Q+1hVpf4zZ8IvfOgtpm32+BB5YjFoIOqYcns6hYbp3NBLEP11ipYnfCqoRHh46MZaGItk+RkHjM04U0mKR/DIrb7nBEhrDfs+n6HMkcWuXg9zTO2fJZbXCRuMUzVR4UP/LcEfRF76uwvA2lGel2n15YI+UB5oh0yJgHjw953I+d7i9hy+IC9ioJUQnodzEBY6OWTMxNiEUa2WbhZmOWq7VBoaK4f64IqQEL3PRs30quTka53xKcXehpXU22odwwAjm36+xtAIjgDlrhbWa9p0/PsaumlNwq4N+7p8lxVAmWRQUp0LN37POMP5kdIIRAPFEW+F3CgjoBgPIB7Z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ3F2CDpNQduvDfisrEVQxE5ckubqKlkk0fTD5rrm5I=;
 b=mnRMCzUqRb8622AciY8CFHaSr8GlcaU7AyoruxxMQs02e+SZE2iNRbpew6c+yq72kZrubquCN8vqWy8kR43AOQLjt1AfJNNBkULMQxx/OTnrvpPk+lVqgsZ4e1aKc/sQZK7rmTVT7UoQgxtTzJwoUfKB4TTThV3Nr6i/PVKaF+UVUwMWRee9nwem6p+cg5cERokyWzU6TVI/VvW2iHAArbxk66BOLi0zQqRgrQFhka82mZ+k5deI6TS0sIkF20YQgbqgL2S9zuBvFT3UChj1oq/uS97hOl4wFS5UoLLApdJLzbKF0TeOJKE3k7KPAFc+Ofy9b1BeLHxZDlyW2GKSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ3F2CDpNQduvDfisrEVQxE5ckubqKlkk0fTD5rrm5I=;
 b=bfWC5LydrHdqyCcplnFeq2bQI43JnB+D5A/fCP4y1nBg6QFlv1gqE3m69vieK2o5OPkKT2wTgc42gLkMbzrv9nTtL0btHBzcl9dQfLq57Qfl7QQ3I+/ouIIjdROnAPwlqBQll4xIDV23k89JcdGY+5yUTDJrjbHAPcRD+wJ1Cn+YM2AR+aIv64VfyVSmaRRIzjmrLE9O0+eAyVQ/Hbejd5pJFVxOOQ0CmTzaQeAN5MryQYhCCkba2MkutnxcPOgWIZYch0oZcmIOCeXSiwC0BQpLWkN8ZCwSqLPb1ZUXhDgmBNV7D5u+ak5CgKvSYn/CfbpxbmSnDZEQ7b4znWi9bQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2399.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 19:42:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 19:42:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, Michael Ellerman
	<mpe@ellerman.id.au>, kernel test robot <lkp@intel.com>, Masahiro Yamada
	<masahiroy@kernel.org>
Subject: Re: usb.c:undefined reference to `qe_immr'
Thread-Topic: usb.c:undefined reference to `qe_immr'
Thread-Index: AQHZJNtYCzyK63V14EyvSo0VqHwZKa6Y1fcAgACMVoCAAD26gA==
Date: Wed, 11 Jan 2023 19:42:43 +0000
Message-ID: <1f3c83a3-95f3-771b-3d45-3e632e2116da@csgroup.eu>
References: <202301101500.pillNv6R-lkp@intel.com>
 <a0e325d2-a9c5-ffca-b2d6-5eea60f9ad3b@infradead.org>
 <87lem9h64t.fsf@mpe.ellerman.id.au>
 <5d8e3316-54bb-40c4-a8a4-dd1b10d1e1a6@infradead.org>
In-Reply-To: <5d8e3316-54bb-40c4-a8a4-dd1b10d1e1a6@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2399:EE_
x-ms-office365-filtering-correlation-id: c3bb2f00-f509-441a-9bb1-08daf40c020b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xjvd0hlE9Ig4Z8xch7fK7gZm4VTxW7rJZNS2X9mF7PmrHxr8atczeKFR2dID9Tz6gXgQbFDI/G+ZPghBYYZROZzvpLNeUJfKsxCn1Nt3t6VsfoUim4oYB9AY267V8nxfCy8gYOHkPYLGTquSrETyphTp+pfvpCkeM9xZgkFoVj/ly0W3L3dlCG6G50rsYvFhG1C8NOk/rVrSiV7BUuWkkqwNOkIydY46yODiN2Obv3BV2qH785jfR61imBey9wZ5aX38cIkRqBuAUW6hcTf9EhmbHhC7wVgRRXW+Rx16Z/tzZG0J7SceFszJPxFxf4LJYgAqRbR4vIjiEN0EATFe+5hYlH3ngg9nlCkx41UxQxwSXwweq0CK16jDpmtYi8tPWPcGb58mUVZz/md5divkc1UKL60AKieFHaF+7Oa1//cFxLROWB+Ummy6Q8oDped91X488BTGJNrmkj56PT5JZbIx6/vxNJicdc3bJ/u+Bxn+C9JDjlAbO4uxDP0Ulnz3gO7epno3g5t0vA0NbTEmtXbkOa/WR/Vwr9fg1dPu8TOLI4k7QrnqaWCcGK8ATPjbjlDaBAdk/KqOPNiubwC/0PwWuS872//wASuq/Gwxk8mYs7MxnMlNyToF4C4oGDk4guG8c+9lIo5L0ijztnnDllyzAk1iET1iElItF0gmgaKMqPUEtuibBF/jNci3HQAYYOqtswsECabMKncVEEHlfudqZWW19cSGxonenxVYyX0vhDdtNRDF3+R7H6w0yfgd+iuMUqvDS+kg0lvd4O8tY2s9LQfwS+Pkenzmy4vV2y6BWhTrpgcBoJSayevt+LJv
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(451199015)(2906002)(44832011)(66574015)(83380400001)(2616005)(66446008)(66556008)(7416002)(66476007)(64756008)(66946007)(5660300002)(8936002)(53546011)(122000001)(36756003)(186003)(26005)(6506007)(6512007)(31686004)(6486002)(478600001)(41300700001)(38100700002)(54906003)(110136005)(8676002)(86362001)(76116006)(966005)(38070700005)(316002)(4326008)(71200400001)(91956017)(31696002)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NWJGa28vQzFZVFNFcjJMNUswOFdTcXB2K0JkZW1ZNTY1UytTNGJPaEtPVUtp?=
 =?utf-8?B?N2I4ajNrMkYxRjNRN0lpUHBJNFViaGNVS3VHTFMzc2dvK2E5MHIzdHpZR01h?=
 =?utf-8?B?YnBJamRLeVY2bXBMOURYREIyT1lsQ2VkVGJ2blhaaDNoUnVKNS9TSVlyU3My?=
 =?utf-8?B?UUVqbUd4cjdRNWFCR0pIc1hpN0ZTNkRWdkhOY25Qb0M5dmw0NngwVWVqUE9q?=
 =?utf-8?B?enpnR0xTckJ4RGFZUGwxNGpZb0NGUitTS0ZNWUdiUlRvcWh6OVBDY2hhYUxi?=
 =?utf-8?B?ZkhnZmFzaVl0RWRxYnRZMjcxOUgzZSszdFErY3hzbDRpdmJXSlJRaHRHc0Rl?=
 =?utf-8?B?cnlSTGhyWkdFN1Vna0FzK1h2RGRBZDI3Y2NGbmlDczRveU4wa3BTSWZiR01p?=
 =?utf-8?B?d1h5aGZjdldIaXBrU25mVEN6OTd0aDIxNTR6TUZ5WVlVaFpPeG1qZDcrV3Iw?=
 =?utf-8?B?alFNQ3lvRU5xdmRpb2RDMEFPL2lNZlVWK21iTmdRSlgvNUhTdTBRazVaL2o5?=
 =?utf-8?B?MGxaS1VHY0NqbjlBNjZ0aXBKbkRkY2lmY3RERkJoUDZaTFRzNDR3dVJoRmhC?=
 =?utf-8?B?OCtiaVJCQ1I2aGZqaE1SS2pzdEh0Vi85ZE1oV254TDBHRU1oa2dIQVYrOXJx?=
 =?utf-8?B?K2NZVmFZOWxncUhOUEVtbmI2amxoVjR5VXN0cEZxR2d6MGl4NmRMell5K0JF?=
 =?utf-8?B?K1NMQ3AvN21SeG50QksrTUd1UzhrQWNVU3VWVitaV21YbVpJWTNTSEpYREE1?=
 =?utf-8?B?ZGVnMHUvVjJxZUVWSDUvQWViY3VxMlBRekd1cjVUVDZncmYwZW1hVVk0RHVl?=
 =?utf-8?B?U3pZM3lJK1hWTFNUTmxkMkZ0MStBdmduWThESlpYWU12WHVPRklQZ0gvdHZV?=
 =?utf-8?B?T2RobmtsSnBoTEwvSXB6MnFVdE9sYmRjV05DUzZhYlJUaE56dy9OZmEwZlBW?=
 =?utf-8?B?YUh5ZVRteFEvdFJRNzhoSE82Tll2ZDFwQWVIREtSSm1naHhGNkpyNGZBME51?=
 =?utf-8?B?UEdCNnRJcTRialJqNGo5RFBlZTFJWk03TkdMcFBwN3V0R0xRWDg5QU43b0Rr?=
 =?utf-8?B?bzVUMXNUc1dtc1ZNVGVObWtySnFsQ3crYlVGbkM1aXJ0SHl2dnZXS0VZeEtw?=
 =?utf-8?B?YkZ6N2RtWUx6Sm9NYVBCWWlWbzM3cXYxQXl5VWs0Q0dhbEVHcmV3RmxLaExS?=
 =?utf-8?B?MDBoUG9mczdreU5KM01lYnZIMkFramhPQ2ZUT093WExidzZEVWV0cDFNdXN5?=
 =?utf-8?B?SzZ6ZUdBTm1DQVB3WEJjR0tSWi9Sb2F4bUhLM3B6VG05QnVuaThMVlg2RGp5?=
 =?utf-8?B?RnM1K2cxV01UZUd5ZUtCa042UHFjcy95Q2ZVdUJuSEhUY2JCWUlhZUEyQXJy?=
 =?utf-8?B?bUcrUy9GK1Q4NWUxck9Jd2JweXIvaW5LK3NabThQOUFtSUtzVHNxbHJXQnZL?=
 =?utf-8?B?Slp0eEllOURJVnVVUStTQVNwb0xQdTNndTFQbG93R3VBcE5Eem5lQ25SazZR?=
 =?utf-8?B?SFdpdzltcFVJaFptamc0d054VW0yY3JudzBGbGU5eGlnMUVHMkNEVG5mSDlZ?=
 =?utf-8?B?RTdVdnU4dWpTMnJyZHd4S3NQRDVYRFRxcmZ6ZUxOcjl5LzdmMHM3M3JsMmRV?=
 =?utf-8?B?eEFPbndQQmk2a09qeTVQSVF3blpZU2NOY0FTcU1tWndxcFN3aTB5S1NVdGNX?=
 =?utf-8?B?alBTb3RVWXBDQXl6QjdnRktNQWZLc2hTTGRXWmNUbzlXTGhzM2pMcWhvbFZv?=
 =?utf-8?B?WEFDbGorQXREd1E2eTB4K3NGUmhVbVZnaEswd0l3KzBveFpRWEVaVEhFODln?=
 =?utf-8?B?d0dHaE1xbVBVL2JZVjd3cW9kNU90NGZFay9wL2JWaU1NMDc0RnRwM2h0R1JU?=
 =?utf-8?B?VkY0WFZ3SjJsTU1GaUdWUVVBVktSZzVnbTc1aFBNamk2QklNVmN4aGhURW9x?=
 =?utf-8?B?OWtodHhrTlV5ejYvZFFwOWRRMUJ6OEhHRmlBY3g2N1ozeStnWG10VkdVRlZs?=
 =?utf-8?B?Y25FZ2FzYVppbTM0UGs2WjZNaUE5emh2YzlzakxET0FNNlZUY3pPaURFQ0wv?=
 =?utf-8?B?YUpybTkxVDhwbjNpOUJMdm1uOWxvOW40clZSV3JtTGJQMnhPaDVGM2FYd3BN?=
 =?utf-8?B?a2ZIQXlPVmg0UmRnNVR1c2UxWUh6YXBOdEJLdmJsWVJJRjRsbk5hdUkrT0VL?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <915D101F6A56714FBCA8B315FADB6B06@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bb2f00-f509-441a-9bb1-08daf40c020b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 19:42:43.7134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XN8aX0K5GQQCJhTFxzPkLQ7JIbSAPcIoQKXVPmkuJqEDOMeY7Fpl34ouwDsLwdwIgx/80HIxP/wNAMkVFX/4GybX8Mcjwz71kAP5qmyhbzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2399
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAxLzIwMjMgw6AgMTc6MDEsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDEvMTAvMjMgMjM6MzksIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6DQo+PiBSYW5k
eSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JpdGVzOg0KPj4+IFthZGRpbmcgQ2Mn
c10NCj4+Pg0KPj4+DQo+Pj4gT24gMS85LzIzIDIzOjU5LCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4+Pj4gSGkgTWFzYWhpcm8sDQo+Pj4+DQo+Pj4+IEZZSSwgdGhlIGVycm9yL3dhcm5pbmcg
c3RpbGwgcmVtYWlucy4NCj4+Pj4NCj4+Pj4gdHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQgbWFzdGVyDQo+Pj4+
IGhlYWQ6ICAgNWE0MTIzN2FkMWQ0YjYyMDA4ZjkzMTYzYWYxZDliMWRhOTA3MjlkOA0KPj4+PiBj
b21taXQ6IDdiNDUzNzE5OWE0YTg0ODBiOGMzYmEzN2EyZDQ0NzY1Y2U3NmNkOWIga2J1aWxkOiBs
aW5rIHN5bWJvbCBDUkNzIGF0IGZpbmFsIGxpbmssIHJlbW92aW5nIENPTkZJR19NT0RVTEVfUkVM
X0NSQ1MNCj4+Pj4gZGF0ZTogICA4IG1vbnRocyBhZ28NCj4+Pj4gY29uZmlnOiBwb3dlcnBjLXJh
bmRjb25maWctcjAyNi0yMDIzMDExMA0KPj4+PiBjb21waWxlcjogcG93ZXJwYy1saW51eC1nY2Mg
KEdDQykgMTIuMS4wDQo+Pj4+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6DQo+Pj4+
ICAgICAgICAgIHdnZXQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2ludGVsL2xr
cC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzIC1PIH4vYmluL21ha2UuY3Jvc3MNCj4+Pj4g
ICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFrZS5jcm9zcw0KPj4+PiAgICAgICAgICAjIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC9jb21taXQvP2lkPTdiNDUzNzE5OWE0YTg0ODBiOGMzYmEzN2EyZDQ0NzY1Y2U3NmNkOWIN
Cj4+Pj4gICAgICAgICAgZ2l0IHJlbW90ZSBhZGQgbGludXMgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0DQo+Pj4+ICAgICAg
ICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXMgbWFzdGVyDQo+Pj4+ICAgICAgICAgIGdpdCBj
aGVja291dCA3YjQ1MzcxOTlhNGE4NDgwYjhjM2JhMzdhMmQ0NDc2NWNlNzZjZDliDQo+Pj4+ICAg
ICAgICAgICMgc2F2ZSB0aGUgY29uZmlnIGZpbGUNCj4+Pj4gICAgICAgICAgbWtkaXIgYnVpbGRf
ZGlyICYmIGNwIGNvbmZpZyBidWlsZF9kaXIvLmNvbmZpZw0KPj4+PiAgICAgICAgICBDT01QSUxF
Ul9JTlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxFUj1nY2MtMTIuMS4wIG1ha2UuY3Jvc3Mg
Vz0xIE89YnVpbGRfZGlyIEFSQ0g9cG93ZXJwYyBvbGRkZWZjb25maWcNCj4+Pj4gICAgICAgICAg
Q09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTEyLjEuMCBtYWtl
LmNyb3NzIFc9MSBPPWJ1aWxkX2RpciBBUkNIPXBvd2VycGMgU0hFTEw9L2Jpbi9iYXNoDQo+Pj4+
DQo+Pj4+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcgd2hl
cmUgYXBwbGljYWJsZQ0KPj4+PiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4NCj4+Pj4NCj4+Pj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOg0KPj4+Pg0KPj4+PiAgICAgcG93ZXJwYy1saW51eC1sZDogcG93ZXJwYy1saW51eC1sZDog
RFdBUkYgZXJyb3I6IGNvdWxkIG5vdCBmaW5kIGFiYnJldiBudW1iZXIgNzQNCj4+Pj4gICAgIGRy
aXZlcnMvc29jL2ZzbC9xZS91c2IubzogaW4gZnVuY3Rpb24gYHFlX3VzYl9jbG9ja19zZXQnOg0K
Pj4+Pj4+IHVzYi5jOigudGV4dCsweDFlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcWVfaW1t
cicNCj4+Pj4+PiBwb3dlcnBjLWxpbnV4LWxkOiB1c2IuYzooLnRleHQrMHgyYSk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYHFlX2ltbXInDQo+Pj4+Pj4gcG93ZXJwYy1saW51eC1sZDogdXNiLmM6
KC50ZXh0KzB4YmMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBxZV9zZXRicmcnDQo+Pj4+Pj4g
cG93ZXJwYy1saW51eC1sZDogdXNiLmM6KC50ZXh0KzB4Y2EpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBjbXhnY3JfbG9jaycNCj4+Pj4gICAgIHBvd2VycGMtbGludXgtbGQ6IHVzYi5jOigudGV4
dCsweGNlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgY214Z2NyX2xvY2snDQo+Pj4+DQo+Pj4N
Cj4+PiAuY29uZmlnIGV4dHJhY3Q6DQo+Pj4NCj4+PiAjDQo+Pj4gIyBOWFAvRnJlZXNjYWxlIFFv
cklRIFNvQyBkcml2ZXJzDQo+Pj4gIw0KPj4+ICMgQ09ORklHX1FVSUNDX0VOR0lORSBpcyBub3Qg
c2V0DQo+Pj4gQ09ORklHX1FFX1VTQj15DQo+Pj4NCj4+Pg0KPj4+IFRoaXMgaXMgY2F1c2VkIGJ5
IChkcml2ZXJzL3NvYy9mc2wvcWUvS2NvbmZpZyk6DQo+Pj4NCj4+PiBjb25maWcgUUVfVVNCDQo+
Pj4gCWJvb2wNCj4+PiAJZGVmYXVsdCB5IGlmIFVTQl9GU0xfUUUNCj4+PiAJaGVscA0KPj4+IAkg
IFFFIFVTQiBDb250cm9sbGVyIHN1cHBvcnQNCj4+Pg0KPj4+IHdoaWNoIGRvZXMgbm90IGRlcGVu
ZCBvbiBRVUlDQ19FTkdJTkUsIHdoZXJlIHRoZSBsYXR0ZXIgYnVpbGQgcHJvdmlkZXMNCj4+PiB0
aGUgbWlzc2luZyBzeW1ib2xzLg0KPj4NCj4+IFNvIFFFX1VTQiBzaG91bGQgZGVwZW5kIG9uIFFV
SUNDX0VOR0lORSBubz8NCj4gDQo+IFllcywgdGhhdCB3b3VsZCBtYWtlIHNlbnNlLCBidXQgSSBk
b24ndCBrbm93IGVub3VnaCBhYm91dCB0aGUNCj4gaGFyZHdhcmUuIEkuZS4sIGNvdWxkIENPTkZJ
R19QUENfRVA4OFhDIGhhdmUgUUVfVVNCIHdpdGhvdXQgaGF2aW5nDQo+IGEgZnVsbCBRVUlDQ19F
TkdJTkU/DQo+IA0KDQpLY29uZmlnIHNheXM6DQoNCmNvbmZpZyBQUENfRVA4OFhDDQoJYm9vbCAi
RW1iZWRkZWQgUGxhbmV0IEVQODh4QyAoYS5rLmEuIENXSC1QUEMtODg1WE4tVkUpIg0KCXNlbGVj
dCBDUE0xDQoJaGVscA0KCSAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBFbWJlZGRlZCBQ
bGFuZXQgRVA4OHhDIGJvYXJkLg0KDQoJICBUaGlzIGJvYXJkIGlzIGFsc28gcmVzb2xkIGJ5IEZy
ZWVzY2FsZSBhcyB0aGUgUVVJQ0NTdGFydA0KCSAgTVBDODg1IEV2YWx1YXRpb24gU3lzdGVtIGFu
ZC9vciB0aGUgQ1dILVBQQy04ODVYTi1WRS4NCg0KDQpNUEM4ODUgaGFzIGFuIFVTQiBjb250cm9s
bGVyLCBidXQgSSB3YXMgbm90IGF3YXJlIExpbnV4IGhhZCBhbnkgVVNCIA0KZHJpdmVyIGZvciB0
aGUgODg1LiBOZWVkIHRvIGRpZyBpbnRvIGhpc3RvcnkuIFdhcyBpbml0aWFseSBhZGRlZCBieSAN
CmNvbW1pdCAzOTQ4ZjBlMGM5OTkgKCJ1c2I6IGFkZCBGcmVlc2NhbGUgUUUvQ1BNIFVTQiBwZXJp
cGhlcmFsIA0KY29udHJvbGxlciBkcml2ZXIiKSwgaXQgZXhwbGljaXRlbHkgc2F5cyBpdCBzaG91
bGQgd29yayBvbiBDUE0uDQoNCkNocmlzdG9waGUNCg==
