Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42B5171D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 16:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsQrB4yyqz3bqL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:45:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsQqg0QMgz3064
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 00:45:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpOVXGc44b6Mpyn0cEHC622+j2RgdA5cFFs36Gnpe5LsQhOy2EsVud7OIEW3DVaXB1qoAASAR9jrfCwbMci0AoLmRTexkHO7ujXzKOoYzfx9JeK88/CUYm1vrfSZwCfWruX+PPq41Gth/ai1Ai755W0etBzWRjwKUQOgsB3RSaipsXe+Z832iENLzHmucGmM6wlFz+RyR2y9ti7owHb3tuJ8qIb3TzHTOHU1PdPBtH2ZGcIEvogjJvs9LZNusMrqKN8jHjogdHO7xCzbVeepqTf75N+u19NWCFAWKygT5SDWVpMECktlYZKnBrErOyMuUEV6DGavELUM1IQ7PsUWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuoiS9AD1N3CqItKKBECnBI/PRPcbreaYZQavZD8WAg=;
 b=Ty+JueAZ0yntoFkGSHhGPew9OTztiWytn8Izjz8zjseHeN7rRBhddZPqHKnKObj460100JG6Gdwp5QMMvgFfvz6nsnv1jFhM1uWqbthbBZiXABg5G6NNY2dECgeJqSmk17sbI5RPV1J6BeLQVmyM+10N2fKD3Vym+Mrh6p5PWnnNktkT46AZ9rPK82qKJEHA56x+WbByHxv5t1eMlo1rqlDwfVN2SXZFiGgVgzrKInRvN5PNKvRw4KDCpHwcVD37D+GzZNddv80s0/i14vgsYGpsh9GwU5qghBxG21Ud3yCFZHSX6JHRCIPbdf1ehTinzOqNMKBAQd/aNNMEfUIGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2505.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 14:44:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 14:44:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Thread-Topic: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Thread-Index: AQHYWhpl5ryAcxR0pEGOg1yZCKWDp60DyFuAgAErRACAAGpbAIAGVDIA
Date: Mon, 2 May 2022 14:44:56 +0000
Message-ID: <819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220427095415.594e5120@gandalf.local.home>
 <1651129169.fpixr00hgx.naveen@linux.ibm.com>
 <20220428100602.7b215e52@gandalf.local.home>
In-Reply-To: <20220428100602.7b215e52@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acbafefd-b27c-4f0c-5dec-08da2c4a53a4
x-ms-traffictypediagnostic: MRZP264MB2505:EE_
x-microsoft-antispam-prvs: <MRZP264MB25051689D5ABC9D828BDDDB8EDC19@MRZP264MB2505.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3MGSmhjC0ul0ZnILtAN/uWpLUgltNoG6KqEJeHn66nz+kxIUfd5DTDmV5ZzPfu3jD9JE17Dk7k/b+7Ar6JQgcsksOUusy38uXuY+J5/7HY7zbUA5SNyp5497umLC3BXGEobhCvklzWVe9lT9UkRGh04ehvwPhy7hw97ZoS//As4Ism9TUT1EotFsXoO9+SGN/rLZbKYU5LITpAVwqAEM+8CkZYq9ZpxIyg2z4VbOVGIwNkchXRrmQlbIosTG2B7kDn6AF9VcxtrWvjr1+YfcxMuyVkYHMSf/XTKEA/E+c5CtY9CRWjPUTDQG0giixJG2FvCdpAAjmcIgMq4lTiWbQgNtFn6IQ3dhE/g7vKadTp/08chsctb4bxWRuT4PvViG0m3w4/v+bBnNsJWBtmjOZ0Yqpoi8DseMv2Ogxd7heqOjrwyFhEcvKpKjXDA6pdV5nSYhnOrEKSsIyESKkRhA8Zd7mUL85PVM8+yIJExU6DtBYXiHPBFbWBfh2TXuqzvrc7al6xCPA6aY4HllAO3gz5s4yHeAxUk6fIkAk+3+TTMmF87zkYfEteUQgS60wefgG8frMtTl+hH1oYeEimNKfiGiBTv7cWVCOyVD//5N/0X8+WMDvfFW7VjtyuGnMmDO60RKWU/XuVpF8uW743F0/cqPU1CVyFNOubRBLSr68+nfpevW4Tm5YhsNYMNVp5BidZyGVYc4ZME2VnFHW9p7BRGloXizfMkPMCZQYNWcpP6SnGJi4Za57AkZdYPqueNW71KnsIsaupq1YcCcq4z3Iw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(83380400001)(76116006)(8676002)(66476007)(66446008)(64756008)(66946007)(66556008)(66574015)(31686004)(4326008)(2616005)(110136005)(54906003)(186003)(316002)(2906002)(31696002)(86362001)(26005)(6512007)(6506007)(71200400001)(36756003)(5660300002)(44832011)(4744005)(38100700002)(508600001)(8936002)(122000001)(6486002)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVY3VUM0R3R0c0JpUjBZRm5tL0ZGWjJnOXRIaDh3R1k1L09Ia3p3YXVQT0hk?=
 =?utf-8?B?YmUzd2FtZW5HKytKcUtpQzhUeCtmQUlSZkp4TXFCRnVBdHJIMGlsUlJXU0Qw?=
 =?utf-8?B?QU1sc21YMGxqRHFhOVB5UDBhQm1tcWl5bUx0djE0cUpHL3Q3cVJIV09uOURj?=
 =?utf-8?B?dUJmZ3hmZ25wOE5mV0V5enhEUGd4dmQrY2xMN2NqaUZRZnpva2JqYmxpb1dP?=
 =?utf-8?B?ZnFxTWNZVUVHSlFaazNVMUdQb3RkRUFvL2t4UFIrUVpkZkZOOWdMaTJ5N3gx?=
 =?utf-8?B?RDNJcjFVSU5nWGRaSUFQU3JZd2V0Wnd1T2R0dDQweWswN1JZZk92MndLSmgx?=
 =?utf-8?B?T0UrOUp0SXYxam43a21BQWRWVWEydGdqQ291Qi9aYkFjdmdjVE5rS0lQeEMx?=
 =?utf-8?B?SkhFWmRJN0IrVHo2dmlQemFNcUNCek50aG1mN1NicTk0NFNXMDI3cmk5M1B4?=
 =?utf-8?B?Rk9jcU5tVklncFY2ZHJlMThYMkRsMmhtbE1CRldtdTYwQ0owQzRjNEVyVXND?=
 =?utf-8?B?eXk4cloyT0dTRUR0TThndVlSUGR6UXBGTDZsMGNKbXFxUXkvN2MwN0xVMmRq?=
 =?utf-8?B?d203NktMYWJiS2lWUEtIZFFGRFgwcGF4WXVOeTFZcWVyZmVBQ0JaMFY0MG5C?=
 =?utf-8?B?aG5IQ2x2RVVlL3d1ZGpqV3hWb0MvZ2h2NE4vekFWOEhCTDRnQkF0NlhLck9H?=
 =?utf-8?B?N1QyNDF2MFVLQnhzdXE2Y0lPTE9EVVQvZWNDZ1RocmZ4VG1hQ1F5Qks4N05I?=
 =?utf-8?B?dlNERHc2REdUc1ZvUVRrci8vQTltaWdwMUtDclhGcnR4NkxtSzk2ckx5VVd6?=
 =?utf-8?B?NUNTY2xXUjYzcndhdlh2aGxzUkZQRzdtVTE2Y1J3TFlEWVdMUE5PSjZ4TFYx?=
 =?utf-8?B?N0c0M3FiNUZuUkZOY3AydUxMZnVFbitWaVhWckVaMmIwNHFhd2ZqRU9JZCtX?=
 =?utf-8?B?U05mdzNnZXQyM3F4OE5RRHJQell4VEt2b1JDczR2OVNtV282OCsxdnd5aGNq?=
 =?utf-8?B?NHlqQXZUMGk2QTJMUHpRbTJIanQxY0wvWUhZUHdXUm1pakdnSDZaUmZTM2hl?=
 =?utf-8?B?MFRpd3ppTHBJeW5iaVV2Sy9HUEpkTWU2eUFmck9RVU9VOG81dmt3Mi9CeVNU?=
 =?utf-8?B?dGVCL3dhT3h0N0xubHJJdnYrMEpHRkNUb3dMZmRzcy9XMktCV2x6cmdTVCto?=
 =?utf-8?B?b3NmZ3FxempDazV6S3hNcCt1TWtMeHhBR1Byalk0WEtzSVNNZGJpYStpZ0xJ?=
 =?utf-8?B?ZTJEaFZBdmc1b3N2MlFMTTI0bEQwSXQ0Q2FyVnV2U29CelJxSmdYczV1ZGZ1?=
 =?utf-8?B?cUVmKytST004aXMwQUtMMDhnaUlFaENsYndXejl3aHNPekVmVlZiN2hzZWI1?=
 =?utf-8?B?Q1k2MGFDeG84RVgxcm80UmJ2TGp4TXRyT0lybHRWNGNsbG5idGhlb1ZCTDFm?=
 =?utf-8?B?bFFud2g0bmZGTTFkK2N0R2c0alFhR1Q2UitTT0p4eFJmQ1pDNXpBSGdzelFG?=
 =?utf-8?B?aDB5OGRTUlIrZnUyYmhtNEdEcVFYMEREUmhlT0FFMjJRaFZ0Sk5hSUc5RmdG?=
 =?utf-8?B?Vyt0cUtTMDdDM3VEYVBCQWkxdExGVUZjemNMWnpWQTIwTDlNc1VQWGRMK096?=
 =?utf-8?B?YVMxemQ5SGkwcG02RmFuMUM3VXc1VWRITUlQNmtMVEw1bWM3cFdjUzNWL0Er?=
 =?utf-8?B?RDlTNWx4NEgwaE9NdWsybFVLNkpISTdXSkxHckkzWlBEYlZwUEFnMWE2WUNQ?=
 =?utf-8?B?OFUrbHY5NmczTTZDZjliUjBRZUhEd1lpMWhodWovNDljUWoyZmVCVy9NY2c4?=
 =?utf-8?B?Q1hpL2NSYndSRUhsd3ErODJWelNJL2JPeVArVkZ5bU9xTE96VXQrTFBDM1A5?=
 =?utf-8?B?ZU1VU2FnelFWTVRBOCs4aHU4YkxaK3dHd3VDVXZGZTRlbU5oSmJFYytMYUhp?=
 =?utf-8?B?czVmMFlwc1ZrbUpzRndQLzFvSWlYS3ZzMXR0a3JGKzM5SWEwak1pV2xaMVNX?=
 =?utf-8?B?bk1OMzN2ZWlnTU94SWpzbVRvUURUbjJDa0FidzBBaFQxWVlKNXdYVUk5cG5p?=
 =?utf-8?B?K3FZbWM1MkU1WkNiN3VxZ0hkQUJZemcvMGd4QUZEMWJyb1Z1SENXTktJSUtB?=
 =?utf-8?B?bVdoSXNPeHpQTHNEck9ldW93ZE9rZlovbzRpN2FJSE8wZVNWYndxK1dSUmY0?=
 =?utf-8?B?YTcwZ0pvZUJPSWZGQXpkT3hteEZXL2lMa1owWHlHMDZMUHd3c0wxa3JVTVhM?=
 =?utf-8?B?bFFqMlVxU01LeENKZWcvR2tieDdsdGowYmFadm1OMk14djJwaEQ5VWlpclRL?=
 =?utf-8?B?cHFrWjNJVjRPT1R2T05UK2Q0MGJIb1IwWVJORGY4T3oyOHh0OUxKRjhmSExR?=
 =?utf-8?Q?Sfwm9wHb+Eh7iaHCnIsgslyipMlPyh/QWjoBl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75FDF63224B2004F862A4B4CE09BE46D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acbafefd-b27c-4f0c-5dec-08da2c4a53a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 14:44:56.8517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AvHYitxpdtUUp1zS5nJ7N5HIxTSSJ2uziWuKOofr+NkBKM6MMQifwGHoEW1Fdx+5ss3VR3DiKsxrYKnwyN8Mx4yHLD06ZbcRrHHuWyTi8xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2505
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA0LzIwMjIgw6AgMTY6MDYsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgMjggQXByIDIwMjIgMTM6MTU6MjIgKzA1MzANCj4gIk5hdmVlbiBOLiBSYW8iIDxu
YXZlZW4ubi5yYW9AbGludXgudm5ldC5pYm0uY29tPiB3cm90ZToNCj4gDQo+PiBJbmRlZWQsIHBs
YWluIG9sZCAtcGcgd2lsbCBiZSBhIHByb2JsZW0uIEknbSBub3Qgc3VyZSB0aGVyZSBpcyBhIGdl
bmVyaWMNCj4+IHdheSB0byBhZGRyZXNzIHRoaXMuIEkgc3VwcG9zZSBhcmNoaXRlY3R1cmVzIHdp
bGwgaGF2ZSB0byB2YWxpZGF0ZSB0aGUNCj4+IG1jb3VudCBsb2NhdGlvbnMsIHNvbWV0aGluZyBs
aWtlIHRoaXM/DQo+IA0KPiBQZXJoYXBzIGFub3RoZXIgc29sdXRpb24gaXMgdG8gbWFrZSB0aGUg
bWNvdW50IGxvY2F0aW9ucyBhZnRlciB0aGUgbGlua2luZw0KPiBpcyBkb25lLiBUaGUgbWFpbiBk
b3duc2lkZSB0byB0aGF0IGlzIHRoYXQgaXQgdGFrZXMgdGltZSB0byBnbyBvdmVyIHRoZQ0KPiBl
bnRpcmUgdm1saW51eCwgYW5kIHdpbGwgc2xvdyBkb3duIGEgY29tcGlsZSB0aGF0IG9ubHkgbW9k
aWZpZWQgYSBjb3VwbGUgb2YNCj4gZmlsZXMuDQo+IA0KDQpJZiB3ZSBkbyB0aGF0IGFmdGVyIHRo
ZSBsaW5raW5nLCB3b24ndCBpdCBiZSBhIG5pZ2h0bWFyZSB3aXRoIHRoZSANCnRyYW1wb2xpbmVz
IGluc3RhbGxlZCBieSB0aGUgbGlua2VyIHdoZW4gdGhlIGRlc3RpbmF0aW9uIGlzIG92ZXIgdGhl
IDI0IA0KYml0cyBsaW1pdCA/DQoNCkNocmlzdG9waGU=
