Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E014C812B85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 10:21:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WnwLfpPO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrRfr4FlRz3w0M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WnwLfpPO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrRf30Sdzz3vmf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 20:20:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afycax50xjGPNepJ+6M6erP16Pj93cM6eFE+S/c691+MbkcCfmOJ2FLL1VgQ9QX9AnnH5eeoBTQM1DNbRyse0wDdgowzXW2V7474Y2K/SGpCyX085UtrkeyGrGJvJ3f3PdgObXJbtEHufKXNunQd2Fa12GDxwHOgRuL43OkTfqh3rOCs5/+e8zvER3ADp4cym0snOjzkygrSkOYde5pxMuiUJ8BvsM6h7P02dM416yJ1hDWpofthwC8a/AenUuLM+dNVvwkDpiAHMlbV2fRO4p+sNI/WbjgJQX9uTUWQ0cM2CK74DilfbsQkQN3Rpng0dnFLbi8PYFGZxvw/XPIygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fkqx4aPyZqrVhO9pnGAMQGFu3sqVyRKxctUP8Rrl7fQ=;
 b=HokpYlC/jBy/5vSZr1EXbWCxTdZqzFAkMEyy47I5t8wc8IexsP62mhfBBnXbHUUx8/oAgy8JMv6nQOsaZC+8O2CuSzqFYOGRJ6O5AE7BlchEPnk4ZPxW5unWt4LqrjTbta6qF6L+L0JjSWdlJvu0EQPqnlLFVR4ChUfdFw3Vj2Ay272uO5463Pop8Pf+hViuVVTPB9J7TmpHXF4t8j3D4DMnkblsFsGW3YznisCriHuWKMue1yZ9ntYwWE476uQ7WOF5Z6DRoGOgYWmQ9+RKed0neIoNDpc+BhibPqbL0ylXJhuXYrCZX3OvpwxTOTxZhGAIbK2pXXMYFNelF04tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fkqx4aPyZqrVhO9pnGAMQGFu3sqVyRKxctUP8Rrl7fQ=;
 b=WnwLfpPONguVlrbCJs+WBe1R82SL4g3xEtDfi2sjl1GyHDLRzJhmSKvZvj3+rQc1TUdLOytTWspkn3BCKH+OpgybFt/oTkoXFIc2ShE9VGy2Ga65Ve/t6+DlcOkj5FcIY6yM+Ka6Y8FzgPWZR0+dxAnbOODDkWp4C+AlTHiop8Tu6ng5cxMl2+T8KaIcbCvu9JHCE49NHFjl7t03Wik41BPm64C7ULBlDZeQKn29DolmFko5NnT8O2XAsWPZCEvXtQa3Np8IHBsoL77oTmqUKJmJ3VbO6FmaeGZJaoRIGZtuypXWZ+mj6tlZH8YtFl6rTNh09fwx7RDHPDxMyBrq1Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3344.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 09:20:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:20:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"dvyukov@google.com" <dvyukov@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 11/13] powerpc: Implement architecture specific KMSAN
 interface
Thread-Topic: [PATCH 11/13] powerpc: Implement architecture specific KMSAN
 interface
Thread-Index: AQHaLlJRapjZClFrTEO0LVVzss3B4LCogMwA
Date: Thu, 14 Dec 2023 09:20:06 +0000
Message-ID: <f75e5273-6c5f-4b47-ae2c-3cd21a0b5289@csgroup.eu>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-12-nicholas@linux.ibm.com>
In-Reply-To: <20231214055539.9420-12-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3344:EE_
x-ms-office365-filtering-correlation-id: 15e6f427-e304-451b-dec2-08dbfc85dc5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RLcd+lcQLsOiDW0R2Of+mKInZiIVMWixg1WKw75tHjdHXx7hDFh+mBVnFksGmibLOLn11Pi0lRKLLn2xF95vURQfZJHOx5hNg5ICfHBh/8CC3gYRjpNiXiQbMIAW0kEZIgXETPN6S2KWN+iZiedO4840uKYMFIy6Ne6ULP5aTij44Om4vZrdYSL+azhjRh0OkX4PYMMykAK2binzk45yntdGkvAbGU3zlye6tuHzySQ0+i5e5OyXiWqNzf1SgMPnM5TnUjGmEoXCYukqgvdHUqXzCRlvu9Mm9uoAU8Asr9RLyfqb/OtH08u1K4mn+dzN7ZU2uMHwwVkl8Y02g0jjDWjcPPb1Lly9PVcHDTD+yQ9TKQZ2JQ6wwZtvVULHotj6q2lPlm3KNHHUDGJFTKz4UARKgpXfnBBZQFWvwtewsbsvnkzFbfn7A0j8GXMeGPTDVudydTVqtctjGd/2tlWNRbVFfJPCpRFTiaPvQBy+KgzXfH1jqTlLB7WeQp0i0VEAU2V2kMh8RExmJT8ERBrSW8VZnlOh5+AP/joF5v5DV/wRrpD48aYZ6faosFvm9BhcW15Dlfg+ndEhwqcCaD7XjCTLqNEOHWqqAMatnEaQdLGNeMCfwZ2nB2GFB5qp+P34CKn6NsM2XcU4y7M4WoirirBMCHGDg73iXQF3x6jNyWGGwl6qy96+l2Wbvngv0Jad
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(396003)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(8676002)(44832011)(8936002)(316002)(54906003)(66446008)(64756008)(4326008)(66556008)(66476007)(66946007)(76116006)(110136005)(91956017)(36756003)(122000001)(31696002)(86362001)(38100700002)(31686004)(38070700009)(478600001)(71200400001)(83380400001)(6486002)(6512007)(6506007)(41300700001)(5660300002)(2616005)(26005)(66574015)(2906002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q2RwOWJES21QRVNWZG9ER0JuSXpya3cyUmxlVEZRZldSUWtYYTlJZEtuUm5J?=
 =?utf-8?B?emRmWkpRcnF3dkdzVUkvMWtXZ3ljaWVmdG5FTk9NWERJRGRQc0lYUVBZUFNP?=
 =?utf-8?B?bEM3YXhidDVHNFNVcGFoREJEb1JSdUFYcXg1TFY4OFVRbjF2cGVCNEN5MWRw?=
 =?utf-8?B?R3ZFRldNcldqSGxnSVgrbFkwR2ZDc1hEVHd4SnhITXFaS2o3VDV3cDdBdTRQ?=
 =?utf-8?B?ZTBaSVc3VVVpMy9OcUtpdy8xNURrYVJ6eitTRjBPWVVUNGhaajE2bnBJWm5Z?=
 =?utf-8?B?U0RSVTVPMjJmUmdBdEpBOUxjdGU0bGdpbDBCUm1SQVFJRERVdGVuQTZLU3VX?=
 =?utf-8?B?RUVVeUx4aG16WXA4SUdxYjQvR2dKNFVOL0JCY2tjWUo2WUQ3eVpIUGxuR05J?=
 =?utf-8?B?TmE4VC94cEs3Q2xhdlM3RkhYZXlQZUNSZCtYdUZma0ZTMFcrai8zOEhkTW1D?=
 =?utf-8?B?N24vNUhRcVN0MjdBcXRhRVRPWTd2M3Q2Q1NQQjc2YUVPaHpzbElBQU5iang4?=
 =?utf-8?B?WjVxa3oraXZ6YUJFNUNtRkhVMVNjR29KVDhuNnJZQ0hrUktOUExMaHZxSmZZ?=
 =?utf-8?B?aTVuUVF6ZGk0bjJYS0JOUzdiZDVpMUtDVmJpbWRsZkwrOGhhdC9maHZuTXRS?=
 =?utf-8?B?ZnZmUEJ2ZmRLQmNrRmhkalV1clFVeUNHMkM1TXRoeHlaSFJ1bEJoQ0czVWJF?=
 =?utf-8?B?cTlrWEtPd1E2QVpmdHV0aWhVMTN2TWJaZWdpNmJONDRSQVdLSFM5bTRiRW9w?=
 =?utf-8?B?WW9wdkttRlhZTHhmbHZKVXZvbjk5ZlhFdHVmZ2Q5cVI0c1pPM1NDc3BjeVM3?=
 =?utf-8?B?TjhZN2doVXpIVE80QW02M0RUNmk5Y3U0S1hMVTdJREgwenYvb1RaNDI4Q1hB?=
 =?utf-8?B?dmhzcUtjYXNkRXJGNlRmN1Vpa0NOd1hveW1FN3FsWmVXQUdGS1NnMXV6MnlE?=
 =?utf-8?B?NmJXM0xVbU5IdHlSeHBTTXhVTmtBNG5lL01xV0xSaE4yMTVvUFlCZFVJTzlk?=
 =?utf-8?B?cGIyYXlhN0tWaVRKaFg3VXNmMDE2allFQ1hDRkZUKzJNcXpMdlBXelQraHdI?=
 =?utf-8?B?SUFVaEZTMW5UQUJXK2wrdksrWVZLendaR2swdlRYNGVNMUl3WjVGS0J1dTZx?=
 =?utf-8?B?RWgvWXpIaGVpV29NblMzLzh4MmxCRTR4cCswU1pKM015RFpiUTMyc2xNbUZW?=
 =?utf-8?B?aUIyTGJ1eEl6U1ZCVy9CUFd1RE9GTTB4YzE3UU1TS3UzTXVxcGhFa01DRk9R?=
 =?utf-8?B?UURlL2NKM1RXYmxPNTlONVNicDlvZ0E3S2hwWXl4Zm4wcVJLeHlLUlJxWGhG?=
 =?utf-8?B?OU5yUWkzcWl4T2FjejIzQ0E2MVRqL2ZVdC9ET0I1S2cvNUlkVUJjRGdUTjB5?=
 =?utf-8?B?TTJqVVRmYkhibEJSZEc1a1EwUkxFV3J0MHZpdlhWMmVncXpDNjN2N3FrbjRk?=
 =?utf-8?B?SFA1UDJQQUZJQkxNQ0JWUEUrT0lNTDJPaWlkWElybE8zNzV6d0dBS3JhV2Vr?=
 =?utf-8?B?SldtbllHYlpBSXkrZS9KeEpxUXNQVDNzaXRXb1pYb2F3TFlrbDJ2blBVUitq?=
 =?utf-8?B?bjNrMEtsZmFhcHNCT2poYXJOOTlNOVFyUVhGTlY1TXlaQUVkaTRDRExNTTNi?=
 =?utf-8?B?MUlHQXJpQXFFYVJoa05kVnFQY3JUZXlPc3B2ZUczUmxtdHJQU1BZcEFOdFZx?=
 =?utf-8?B?NG9rOGtLQmZWK01wYSthVUFtZGNlMXJGY2hPL2VBS3BVVkVrOHBZd2sxZG01?=
 =?utf-8?B?MEh4RUd5cm5WQkNUcnc4WjRNbGU2MW5IS2xnUTFYVjVWT1FISjFVbnczMy9G?=
 =?utf-8?B?WWtQaTV6KzJqclN2ZGo0TXZVQjJYUlJINWJhN0xWVUpETDdqODMzVkxOODdW?=
 =?utf-8?B?bUwxYnEvWTF6djBrUzBhOGNoeU1DcHJiZGFqZDd1akxNS2ZCeURHbFJuUXZK?=
 =?utf-8?B?UW43VUZmdDBvc3NQS1lXb3pyK3NseUtWaURUQWpjSmF2UTdwZHFyTm8zdXI1?=
 =?utf-8?B?dHhUVWRJOVFIa1ZBVmZvL3hUOTkyM0hKdFhCUlVzcWM1VnUvTEhSMDB2K0kw?=
 =?utf-8?B?bjdIczFXQmYxSmhJbGpWcDYwMFdqNVEvSGVoS2IrMjlLWmJPYWNJTVBZcUJI?=
 =?utf-8?Q?Y10rsH/N4ROU9eeNaps6+diY1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED20B952632B2E4987B5228C12A31EAB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e6f427-e304-451b-dec2-08dbfc85dc5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 09:20:06.0620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XR0YNE1DvcPoq6I2MRdrBNIwlF2/aoghjxcplejDYD+mUSqARu9WGSBDtweNGApFad+ij9adw+F3cvLy1ooBuNilsi5h61kZ9OSkyhL3Q9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3344
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMDY6NTUsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gYXJjaF9rbXNhbl9nZXRfbWV0YV9vcl9udWxsIGZpbmRzIHRoZSBtZXRhZGF0YSBhZGRy
ZXNzZXMgZm9yIGFkZHJlc3Nlcw0KPiBpbiB0aGUgaW9yZW1hcCByZWdpb24gd2hpY2ggaXMgbWFw
cGVkIHNlcGFyYXRlbHkgb24gcG93ZXJwYy4NCj4gDQo+IGttc2FuX3Zpcl9hZGRyX3ZhbGlkIGlz
IHRoZSBzYW1lIGFzIHZpcnRfYWRkcl92YWxpZCBleGNlcHQgZXhjbHVkZXMgdGhlDQo+IGNoZWNr
IHRoYXQgYWRkciBpcyBsZXNzIHRoYW4gaGlnaF9tZW1vcnkgc2luY2UgdGhpcyBmdW5jdGlvbiBj
YW4gYmUNCj4gY2FsbGVkIG9uIGFkZHJlc3NlcyBoaWdoZXIgdGhhbiB0aGlzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTmljaG9sYXMgTWllaGxicmFkdCA8bmljaG9sYXNAbGludXguaWJtLmNvbT4N
Cj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ttc2FuLmggfCA0NCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRp
b25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9r
bXNhbi5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ttc2Fu
LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va21zYW4uaA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJjODRmNmZmMmVlOQ0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rbXNhbi5oDQo+IEBAIC0wLDAgKzEs
NDQgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+ICsvKg0K
PiArICogcG93ZXJwYyBLTVNBTiBzdXBwb3J0Lg0KPiArICoNCj4gKyAqLw0KPiArDQo+ICsjaWZu
ZGVmIF9BU01fUE9XRVJQQ19LTVNBTl9IDQo+ICsjZGVmaW5lIF9BU01fUE9XRVJQQ19LTVNBTl9I
DQo+ICsNCj4gKyNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ICsjaWZuZGVmIE1PRFVMRQ0KPiArDQo+
ICsjaW5jbHVkZSA8bGludXgvbW16b25lLmg+DQo+ICsjaW5jbHVkZSA8YXNtL3BhZ2UuaD4NCj4g
KyNpbmNsdWRlIDxhc20vYm9vazNzLzY0L3BndGFibGUuaD4NCj4gKw0KPiArLyoNCj4gKyAqIEZ1
bmN0aW9ucyBiZWxvdyBhcmUgZGVjbGFyZWQgaW4gdGhlIGhlYWRlciB0byBtYWtlIHN1cmUgdGhl
eSBhcmUgaW5saW5lZC4NCj4gKyAqIFRoZXkgYWxsIGFyZSBjYWxsZWQgZnJvbSBrbXNhbl9nZXRf
bWV0YWRhdGEoKSBmb3IgZXZlcnkgbWVtb3J5IGFjY2VzcyBpbg0KPiArICogdGhlIGtlcm5lbCwg
c28gc3BlZWQgaXMgaW1wb3J0YW50IGhlcmUuDQo+ICsgKi8NCj4gKw0KPiArLyoNCj4gKyAqIE5v
IHBvd2VycGMgc3BlY2lmaWMgbWV0YWRhdGEgbG9jYXRpb25zDQo+ICsgKi8NCj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCAqYXJjaF9rbXNhbl9nZXRfbWV0YV9vcl9udWxsKHZvaWQgKmFkZHIsIGJvb2wg
aXNfb3JpZ2luKQ0KPiArew0KPiArCXVuc2lnbmVkIGxvbmcgYWRkcjY0ID0gKHVuc2lnbmVkIGxv
bmcpYWRkciwgb2ZmOw0KDQpNaXNzaW5nIGJsYW5rIGxpbmUuDQoNCj4gKwlpZiAoS0VSTl9JT19T
VEFSVCA8PSBhZGRyNjQgJiYgYWRkcjY0IDwgS0VSTl9JT19FTkQpIHsNCg0Kb2ZmIGlzIG9ubHkg
dXNlZCBpbiB0aGF0IGJsb2NrIHNvIGl0IHNob3VsZCBiZSBkZWNsYXJlZCBoZXJlLCBjYW4gYmUg
DQpkb25lIGFzIGEgc2luZ2xlIGxpbmUgKGZvbGxvd2VkIGJ5IGEgYmxhbmsgbGluZSB0b28pOg0K
DQoJdW5zaWduZWQgbG9uZyBvZmYgPSBhZGRyNjQgLSBLRVJOX0lPX1NUQVJUOw0KDQo+ICsJCW9m
ZiA9IGFkZHI2NCAtIEtFUk5fSU9fU1RBUlQ7DQo+ICsJCXJldHVybiAodm9pZCAqKW9mZiArIChp
c19vcmlnaW4gPyBLRVJOX0lPX09SSUdJTl9TVEFSVCA6IEtFUk5fSU9fU0hBRE9XX1NUQVJUKTsN
Cj4gKwl9IGVsc2Ugew0KPiArCQlyZXR1cm4gMDsNCj4gKwl9DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyBpbmxpbmUgYm9vbCBrbXNhbl92aXJ0X2FkZHJfdmFsaWQodm9pZCAqYWRkcikNCj4gK3sNCj4g
KwlyZXR1cm4gKHVuc2lnbmVkIGxvbmcpYWRkciA+PSBQQUdFX09GRlNFVCAmJiBwZm5fdmFsaWQo
dmlydF90b19wZm4oYWRkcikpOw0KPiArfQ0KPiArDQo+ICsjZW5kaWYgLyogIU1PRFVMRSAqLw0K
PiArI2VuZGlmIC8qICFfX0FTU0VNQkxZX18gKi8NCj4gKyNlbmRpZiAvKiBfQVNNX1BPV0VSUENf
S01TQU5fSCAqLw0K
