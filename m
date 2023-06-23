Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0473BC51
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 18:05:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GhTi8yO5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnhsY1xdVz3bts
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 02:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GhTi8yO5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::610; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qnhqh5LFWz3bn3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 02:03:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbZpl0FZ23T9i5f3NJWRcqHDHzzmo0rYw3nWamHJSY5uDup9NNLUV9YseyH8sbF+kfTIbnClNm/JRPYCxXiV31Ijgr73s/RYiDPeziknLe2Rya7c5tcG9loieSByp42em/W4KMK4LLAkxxt7aqTdb3aWixwKdplVHg/VC4MfretYm1NHEorm0bwl4omk+qR6SWgm0hPaDxMMJ6vh5FkMWt5KimyZfAabxsdR/z+bBz11JYi8WB0p+DpP5BhXX3+IX/RkPhBptTHVtf2jTnEUzTScjQcXDUcinc5+NCAEfnDnmDgQGwiSgZx5LQjP/f83VQVM1XajFUrGXqYpPy+aTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WnNL7vCNcS2PPKiAj4wBVfbJB2S5tpTMsCyiIay70M=;
 b=CHPLmTtyCjMnO9UvCFwGUN+MCkf30+T+jc21+xZ6uZG0dmVZkuG4tIb8cmRzqOu1rLLFCqrjrvI9m7ajnV6eGMTsnQ4N8ICyZHC6aAQMyW1HBezrl8Z2yBYIp6Z1hBENDt6z2OJQSocydZeWcHEyKKQht0wkGUWNWG/udnhFej3272Dx2xDc4bHCx0BPNHTut5fJaM0Odm3VOicvy8y31ieznyts0AMf+go54PKc3b0NrhtpZjDwAWHlBj97UY79dThyy7BbMSsrMTaAeHr5piwLhz5w+AVOt39vRxe/TpRBH/YZOvvN3DO27NUWm5EhTSnfuh177lrLqRaBXb1u/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WnNL7vCNcS2PPKiAj4wBVfbJB2S5tpTMsCyiIay70M=;
 b=GhTi8yO51YhuhztQCJd90lTBEquYK4s23Lw/myYU3A93nCrb9iwznUchaA2Y0Ge55mKAaNqndj+TnEJxAEvdiEUmGiAmMeyCZq3521oMwP/KThw+Dvw/nsBTyXySqrCMbCnpmSTngZ0wZK/9hJ9fAo23DvnzpTK4ZFKm+3LDrZQTEbZ39DbbU05dE5s5SkpmN+siBE+lRkl2hgBYjoTcTzBOwfd37u9UjDnEIXj3qn7x6mDUl6bV0L/o6RIqLhcDPMlzRXg+13Mbiw6BSgjDPxJP6Bwuv3v/PjD0oAtQjAgItm0XrwsJLh76NqkUfY6Vmz51k//PrEj8gCzJZFWMJQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1642.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 16:03:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 16:03:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
Thread-Topic: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
Thread-Index: AQHZpPgG93TyxZUMyU2+Hlx65DMlQK+Wt1yAgAHXKwA=
Date: Fri, 23 Jun 2023 16:03:23 +0000
Message-ID: <52816249-0d38-31f6-cc0b-ce85c0107f72@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
 <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
 <20230622115659.GO4253@hirez.programming.kicks-ass.net>
In-Reply-To: <20230622115659.GO4253@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1642:EE_
x-ms-office365-filtering-correlation-id: 6326e190-80b4-482e-2d09-08db74035f51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  adJe7mo1/0tJbL+iUVp3oFbP93fGq8px/jnZjmzm4b6fm1oUeR4gNm5RadCdHUHSjxAVVvofkXPMPy3RroZwVUu2GNB1LQCKRfuKerveAcVg+lHI3GOl43R+ngvHh9KYRg/PvwCL/8NaTTUJ7KLWbW2EA6MoIZKSSjxR4xITNqrzqyuwA4u6i8p0gzFCk1FzQ4oLkUamJm0CEoZ2MuoTWIDtB9YQZtICtnKpqyYlDEefwjvfYsmy1HO9ePQ/PEqWwpPJ/cMRYdA/YzPt0JmuYVWV5kfex0uEKvWa52v2czoV2XECX0Od+SAzb3dODXbItmCHzxeDn3o7C9449fThzlNsTHGvEhcIz7mZKIejcm/723IA8mM0bZnBJ0K7oex1BDdlsxRGvPxhpjoRJUhl9gwsISYswMC93PD3cG76BtdH6B0XOIb8uUUGzTfzqWvmKUqa6/YtrwLfZFAXKJGaXqXR0KflfkuAVUh7iHJpbAZjUHln7TQiOpbQHlMgA2XoPGfzNy8K00aAg36v7cvqpO0SeneARJe8aF7c/GxUEkxx7hkUqYxWgXiwn872c/xqcoYrOUvFRh5aoVgT6XhKMhCH7sRUsjbQuqiWxve9EebL6OpPKB2NqSUdyK1B1hAwOEmRH6rLh8gFF29LPnfK7IPhFh205K35UCVyMfdWF+jNk57RW9uL/kXPHKMvYPXv
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(451199021)(91956017)(31686004)(8936002)(8676002)(44832011)(66946007)(66556008)(66446008)(66476007)(4326008)(6916009)(316002)(76116006)(64756008)(5660300002)(41300700001)(2906002)(54906003)(31696002)(86362001)(478600001)(6486002)(71200400001)(36756003)(83380400001)(2616005)(66574015)(6512007)(6506007)(186003)(26005)(38070700005)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d2FxdHpNV2pRTktLdFFFK0FLckFNWFpCVkNISFdIMkU2bjJRQkJseCs1aVNq?=
 =?utf-8?B?NUY0a1lKejFUbDZPOVhiZ1U5WjBWTVYzUUVhRjhqR3daclFEN3JjeU1tMkRE?=
 =?utf-8?B?R2FFc2Q5d0xqQU5ZTjBWUDlEWGtYYnNWa0hQaDZQSHJaUlp0ZFo1dDVMZXh2?=
 =?utf-8?B?aG16RFkxNUJ5ZCthTWJkdDJyNnZpUVBsZFdSUFowYVFsaS82NHBUbHVEbkRv?=
 =?utf-8?B?dmczK1NCQ1poVTl5RmlEanZYcGxEekRxaVRVbFlncXFYWDhEa2JsRS9XbGsw?=
 =?utf-8?B?L0VmR0VNeVZMdS9rMC9tczB6UkViWG13dlVROTZUZHhvSm9qQjNjYmJ3cWkz?=
 =?utf-8?B?dXZvQU5VaVV2TXpHV2R3cWtDcmNhNmVSdzlCNnZ0aWcwYTJtcC84Z2JpVlJE?=
 =?utf-8?B?dDRTV1VJZzVabmxmaWVvVWg4dnB4K0tZUk9CRVEwcDRxUENXS2swcUlJK0hj?=
 =?utf-8?B?V3JFdHN2ZXBNOTVWOVpFUzhUcFNsdFo0R0I0Q0RhVENLTE9rL3JWV1phRUhH?=
 =?utf-8?B?Umx2TlU1UWcxcVFkSHRXYlF2d3ZJek4xZ1pyQXRrVGxSOFBaM2JGV21MOEJV?=
 =?utf-8?B?NGlJUXZoOVRwMHprRUhQbkVwL0c3bVZPeHdNZk5xN0pRV2Z6WkF5WVVxRS9q?=
 =?utf-8?B?NzVwOHVwcHV6THU4ZlF2cWNuSUVpdFIyR094VHZpNGNUZE5EUElnWFRTU3d6?=
 =?utf-8?B?UG9aakZ4NHlWQVV4WTh3Y2x2ZmNab2JJQUhMbTUwSHFqTFhrYkc5NmRWdWQr?=
 =?utf-8?B?WjR2VVNHbVBZNTlnc3p6cGcwdjNoeVhkYzRXSXhGUWtib2NXUGlyRXRnSnZL?=
 =?utf-8?B?V2FpYTBiZzNsRmxFVFpIV1BmcFR2VHJ0UXdsNXRPYnZZM3JvZ1FIcjVFL1dr?=
 =?utf-8?B?UmNkcmlvcG0zYW1LUWZ1VS9ONVdERXV1VCsvdDFCemNFbW56UnhERFNlWDZG?=
 =?utf-8?B?TWhGVFJFR0theVQ3ZmVmMmdMdHJmbFc1QzQ2VG95N0YrMVZQdmdBU2Y2TFM4?=
 =?utf-8?B?WE1yU1BaQ25qbGV5cWhPSXhxdlhEazlkRVY4OWtEVVRLTU5aUStxRUhKUWQz?=
 =?utf-8?B?dmIxWHg5ZEtsM0I0d1g3aHBWQnJyWFQ1ZndRR2l3MXZ6dmdNRFdRUkpPRzIr?=
 =?utf-8?B?V1hQU01uaG5udmdNWGZWNlMvWTEzeTFDRTdnbnYzbzJsbG1Zd2FSdFE1MmVz?=
 =?utf-8?B?MzZoM0FycFNUcUdMV2piOTNxd0tyQlZLb1E3bzZMcG10ZHJQWHYzanBxeE5N?=
 =?utf-8?B?RE9ybHNuRi9QLzlBZ2ZSTTJXSFg5alpURVZ2UVNFUjFYamVDVkNQZk5pOCtw?=
 =?utf-8?B?UDh6VFBRTDZhdndIamJmb0dnZENXdDhneUx2b1NSV3BnaHBjNFdKSGE1ZjM3?=
 =?utf-8?B?ZjFWQVVSdmljZWNMSGZKV1lmRkRwREp2YkdCSlFjcDZmSzE4WDYxbjRHK093?=
 =?utf-8?B?dlFNUUZxRkUwYjBBRjlzclc2WkFsNlFLaktkU3pVL3dCeitWSyt4aEx3SnR2?=
 =?utf-8?B?TXB1TGcyUzk1emJYeEtQV2lFYTM4akZBMnRxT1RPUXRuS0ZKOGZBQ2IvUk9C?=
 =?utf-8?B?UlQvWmZmME9ENjhVb084ckdXem0vQTBxT0NoNERqb1B5V1A4RUF6dXdQWUh0?=
 =?utf-8?B?SXJiVzZJcUNpSUljUWE0NXhDcjRQQ2tORzNWWWNqcHB4N0Z5MjFSaVNPM0JK?=
 =?utf-8?B?RXVCOGQvd0JoaDZwMEY5UzlXRHVNaHB5bUh2YUVJOFpFc1BGZkNQSWRJN1BJ?=
 =?utf-8?B?T29qallxWC9VRExsRktaSmpCNGkvQm4rajdZQ29LYWpEZWVGMEdQOW1uSG4y?=
 =?utf-8?B?MHJVVi9ZSTduZHVKY3JtRUNGOHZDbUZuL2RsV28ybmoybkxZaWJnUVVWRFdJ?=
 =?utf-8?B?OExIWWpwMUZQRllSL1dEbVA3M1V0THF2SWUwUlZtSGZFYXp5UEJGdUUyc3JD?=
 =?utf-8?B?ZmJ3YmhUZjVOdFZIVEFENWpDVENkeXZtMVRrN2ovUnFESzVmZmJaUjZ6cUJ5?=
 =?utf-8?B?bjJsbExnck9wOFlWMFN3V3gyVi9TSGdsRDZVTmRYUkMrV3YvbzhJZ0h5REZn?=
 =?utf-8?B?djdBc2xiKzBBUjJtVDVaSzY0bFpyejJ0dm5uMHpRQmYxZXRtMFpmVDY1VHcy?=
 =?utf-8?B?ZkU3NGJ6SmVGZjBBeVRpV3RHZXowV3g1bktaenFKbVZsUENmbUlleE5VRjRD?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6ACC12E16E7794DB0579BBD52F38C33@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6326e190-80b4-482e-2d09-08db74035f51
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 16:03:23.5853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0A5F7F/ms+ylOVHdaKwM4fGgLq3n2Ug8GadTucO3mkr27eSG7iPY3Nf3icFtHWhjR3MswgdPKeBGpjjkyHQ+0wFtch9Vl67dWaxQD2Otfdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1642
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzA2LzIwMjMgw6AgMTM6NTYsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgSnVuIDIyLCAyMDIzIGF0IDEyOjU0OjM2UE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvY2hlY2suYyBiL3Rv
b2xzL29ianRvb2wvY2hlY2suYw0KPj4gaW5kZXggZjg1MGFiODkyYWQ1Li44YWM1NzExYTA1NWYg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy9vYmp0b29sL2NoZWNrLmMNCj4+ICsrKyBiL3Rvb2xzL29i
anRvb2wvY2hlY2suYw0KPj4gQEAgLTIxOCw2ICsyMTgsNyBAQCBzdGF0aWMgYm9vbCBfX2RlYWRf
ZW5kX2Z1bmN0aW9uKHN0cnVjdCBvYmp0b29sX2ZpbGUgKmZpbGUsIHN0cnVjdCBzeW1ib2wgKmZ1
bmMsDQo+PiAgIAkJImt0aHJlYWRfZXhpdCIsDQo+PiAgIAkJImt1bml0X3RyeV9jYXRjaF90aHJv
dyIsDQo+PiAgIAkJImxidWdfd2l0aF9sb2MiLA0KPj4gKwkJImxvbmdqbXAiLA0KPj4gICAJCSJt
YWNoaW5lX3JlYWxfcmVzdGFydCIsDQo+PiAgIAkJIm1ha2VfdGFza19kZWFkIiwNCj4+ICAgCQki
bXB0X2hhbHRfZmlybXdhcmUiLA0KPj4gQEAgLTIzMCw3ICsyMzEsOSBAQCBzdGF0aWMgYm9vbCBf
X2RlYWRfZW5kX2Z1bmN0aW9uKHN0cnVjdCBvYmp0b29sX2ZpbGUgKmZpbGUsIHN0cnVjdCBzeW1i
b2wgKmZ1bmMsDQo+PiAgIAkJInNldl9lc190ZXJtaW5hdGUiLA0KPj4gICAJCSJzbnBfYWJvcnQi
LA0KPj4gICAJCSJzdGFydF9rZXJuZWwiLA0KPj4gKwkJInN0YXJ0X3NlY29uZGFyeV9yZXN1bWUi
LA0KPj4gICAJCSJzdG9wX3RoaXNfY3B1IiwNCj4+ICsJCSJ1bnJlY292ZXJhYmxlX2V4Y2VwdGlv
biIsDQo+PiAgIAkJInVzZXJjb3B5X2Fib3J0IiwNCj4+ICAgCQkieDg2XzY0X3N0YXJ0X2tlcm5l
bCIsDQo+PiAgIAkJIng4Nl82NF9zdGFydF9yZXNlcnZhdGlvbnMiLA0KPiANCj4gU29tZW9uZSB3
ZW50IGFuZCBjaGFuZ2VkIGFsbCB0aGF0IGluIHRpcC9vYmp0b29sL2NvcmUgOi0pDQo+IA0KPiBC
dXQgcGVyaGFwcywgbGlrZSB0aGUgdWFjY2Vzc19zYWZlX2J1aWx0aW5zW10gYXJyYXkgYmVsb3cs
IHNob3VsZCB3ZQ0KPiBzdGFydCBtYXJraW5nIHNlY3Rpb25zIHNvIHdlIGNhbiByZW1lbWJlciB3
aGVyZSBzdHVmZiBjb21lcyBmcm9tIGxhdGVyPw0KDQpPciwgbm93IHRoYXQgaXQgaXMgYSBIIGZp
bGUsIG1heWJlIGVhY2ggYXJjaCBjb3VsZCBoYXZlIGl0cyBvd24gSCBmaWxlIA0KZm9yIGFyY2gg
c3BlY2lmaWMgZnVuY3Rpb25zID8gVGhlbiB3ZSdkIGdldDoNCg0KZGlmZiAtLWdpdCBhL3Rvb2xz
L29ianRvb2wvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXJjaC9ub3JldHVybnMuaCANCmIvdG9vbHMv
b2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL25vcmV0dXJucy5oDQpuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi42NjRmMTdkMzkwMjYNCi0tLSAvZGV2L251
bGwNCisrKyBiL3Rvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXJjaC9ub3JldHVy
bnMuaA0KQEAgLTAsMCArMSwxMSBAQA0KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovDQorDQorLyoNCisgKiBUaGlzIGlzIGEgKHNvcnRlZCEpIGxpc3Qgb2YgYWxsIGtub3du
IF9fbm9yZXR1cm4gZnVuY3Rpb25zIGluIA0KYXJjaC9wb3dlcnBjLg0KKyAqIEl0J3MgbmVlZGVk
IGZvciBvYmp0b29sIHRvIHByb3Blcmx5IHJldmVyc2UtZW5naW5lZXIgdGhlIGNvbnRyb2wgDQpm
bG93IGdyYXBoLg0KKyAqDQorICogWWVzLCB0aGlzIGlzIHVuZm9ydHVuYXRlLiAgQSBiZXR0ZXIg
c29sdXRpb24gaXMgaW4gdGhlIHdvcmtzLg0KKyAqLw0KK05PUkVUVVJOKGxvbmdqbXApDQorTk9S
RVRVUk4oc3RhcnRfc2Vjb25kYXJ5X3Jlc3VtZSkNCitOT1JFVFVSTih1bnJlY292ZXJhYmxlX2V4
Y2VwdGlvbikNCmRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL25vcmV0dXJucy5oIGIvdG9vbHMv
b2JqdG9vbC9ub3JldHVybnMuaA0KaW5kZXggMTUxNGU4NGQ1Y2M0Li5mNzI1ZWQzNzUzMmQgMTAw
NjQ0DQotLS0gYS90b29scy9vYmp0b29sL25vcmV0dXJucy5oDQorKysgYi90b29scy9vYmp0b29s
L25vcmV0dXJucy5oDQpAQCAtMSw1ICsxLDcgQEANCiAgLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi8NCg0KKyNpbmNsdWRlIDxhcmNoL25vcmV0dXJucy5oPg0KKw0KICAvKg0K
ICAgKiBUaGlzIGlzIGEgKHNvcnRlZCEpIGxpc3Qgb2YgYWxsIGtub3duIF9fbm9yZXR1cm4gZnVu
Y3Rpb25zIGluIHRoZSANCmtlcm5lbC4NCiAgICogSXQncyBuZWVkZWQgZm9yIG9ianRvb2wgdG8g
cHJvcGVybHkgcmV2ZXJzZS1lbmdpbmVlciB0aGUgY29udHJvbCANCmZsb3cgZ3JhcGguDQoNCg0K
PiANCj4+IEBAIC0xMzM1LDYgKzEzMzgsOCBAQCBzdGF0aWMgY29uc3QgY2hhciAqdWFjY2Vzc19z
YWZlX2J1aWx0aW5bXSA9IHsNCj4+ICAgCSJyZXBfc3Rvc19hbHRlcm5hdGl2ZSIsDQo+PiAgIAki
cmVwX21vdnNfYWx0ZXJuYXRpdmUiLA0KPj4gICAJIl9fY29weV91c2VyX25vY2FjaGUiLA0KPj4g
KwkiX19jb3B5X3RvZnJvbV91c2VyIiwNCj4+ICsJIl9fYXJjaF9jbGVhcl91c2VyIiwNCj4+ICAg
CU5VTEwNCj4+ICAgfTsNCj4gDQo+IERvIHdlIHdhbnQgdG8gcmVuYW1lIHRoZSAnbWlzYycgc2Vj
dGlubyB0byAneDg2JyBhbmQgc3RhcnQgYSAncHBjMzInDQo+IHNlY3Rpb24gdGhlcmU/DQo+IA0K
DQpTdXJlLg0KDQpUaGVuIHRoYXQgd291bGQgbG9vayBsaWtlOg0KDQpkaWZmIC0tZ2l0IGEvdG9v
bHMvb2JqdG9vbC9jaGVjay5jIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQppbmRleCAyYjYxZjgx
ODBiZWEuLjJkNTY0ZDBlMmFlMSAxMDA2NDQNCi0tLSBhL3Rvb2xzL29ianRvb2wvY2hlY2suYw0K
KysrIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQpAQCAtMTI1OSwxMyArMTI1OSwxNSBAQCBzdGF0
aWMgY29uc3QgY2hhciAqdWFjY2Vzc19zYWZlX2J1aWx0aW5bXSA9IHsNCiAgCSJzdGFja2xlYWtf
dHJhY2tfc3RhY2siLA0KICAJLyogbWlzYyAqLw0KICAJImNzdW1fcGFydGlhbF9jb3B5X2dlbmVy
aWMiLA0KKwkiZnRyYWNlX2xpa2VseV91cGRhdGUiLCAvKiBDT05GSUdfVFJBQ0VfQlJBTkNIX1BS
T0ZJTElORyAqLw0KKwkvKiBtaXNjIHg4NiAqLw0KICAJImNvcHlfbWNfZnJhZ2lsZSIsDQogIAki
Y29weV9tY19mcmFnaWxlX2hhbmRsZV90YWlsIiwNCiAgCSJjb3B5X21jX2VuaGFuY2VkX2Zhc3Rf
c3RyaW5nIiwNCi0JImZ0cmFjZV9saWtlbHlfdXBkYXRlIiwgLyogQ09ORklHX1RSQUNFX0JSQU5D
SF9QUk9GSUxJTkcgKi8NCiAgCSJyZXBfc3Rvc19hbHRlcm5hdGl2ZSIsDQogIAkicmVwX21vdnNf
YWx0ZXJuYXRpdmUiLA0KICAJIl9fY29weV91c2VyX25vY2FjaGUiLA0KKwkvKiBtaXNjIHBvd2Vy
cGMgKi8NCiAgCSJfX2NvcHlfdG9mcm9tX3VzZXIiLA0KICAJIl9fYXJjaF9jbGVhcl91c2VyIiwN
CiAgCU5VTEwNCg==
