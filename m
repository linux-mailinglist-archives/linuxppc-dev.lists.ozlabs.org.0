Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDC764D6A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 07:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXjXs1bmHz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 17:50:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xnAAMPgQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.71; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xnAAMPgQ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2071.outbound.protection.outlook.com [40.107.9.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXjWs4Hx4z30hh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 17:49:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beH0n4wPlHom9JmbmELl6brBOVdSNlTp2ofDAqHBT9IRga3Vux9lw9RDRRvXvlsMfF3y2eKv89chSIZcdskYA4ye9+QmV0qfJ2QEMdnSemCZhRHenNp8UjZw0s5mC3HTFwTVdPDvJrE8XCPSEzuUxf2PZI2TGm5hdEI4dxEyI9x3fmHa+5ykdkuzce+2E4sA0T2X8FUQf8r1BURFB3AK9KiFTp/Mi2Qp/urwrq1io7HGUAdCkD2EQqueJzCezGJz/6x9ynOYXoxEaSs/QNvoXoQS7KTadKeUrSp+LRU8H1Ry0hWqCLB2WoMF7T//C8anI2AJHQ5xUjyMSdHcJ5Q/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwUY7wEqdf6zKwCxrz6JZrf0gopPNaRqQssXPKYxp40=;
 b=Yse68zPl8ttmzh9NYH7tblFPxTGIHLNDApXeLmQwGN+HNINuHDQSMvoktkF/xsauP30StJ6oQFCwKhVXv2hzXA1hVCuKogfZpgoExYJULqCNsEFBZ7hrkDuZddGeEl5eYlj5GnummR9HLZxU155HfVdxGan3BL7TCcBm14SAVACbrlovFv7wYXVSZCXwFe9khkUECKo6c1F9fl5OVMeN3Lz7EY6m3bq/WVLHQC9/XMLs392mg4smiUuzoF3jKDeCQD6OqMOI7WZmfS6fs7S1ZrRQj3E7594gOwh9mjfDk9/dBu1rVcz0hsg8z63CwMXtXbiT1NkbV1aDcfR5w/X0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwUY7wEqdf6zKwCxrz6JZrf0gopPNaRqQssXPKYxp40=;
 b=xnAAMPgQJsFvqAaiPgdAI0/LnhxiEV1XQiO0r5ec4gOyM4OEeepvakiars24A4T2gHUSQ0t6ZqJkHnIOXETD4ZrF5aJHhLSvl62+pdq5/gkDsLcyCNSve+7wX6gLWvA7KRIOO8/H/EZ9KpXYesASewrmi0EwJskUHPy+VRlfpVttBZBH0MnDFkLF7RdFfNYeUFJwZXRZVDX4lE/3lgpTb+mav8+UBEe0my8ijfIcHwYv/Hb8PeWw/sXhqsERVi+iKayRX7yK9VOaSOOseYrSPQIyzmkECvpnGoeLDxM8GJe43seYQLl1gZLvqDMOQE9z+iYOzyKdp3o5BjLVy2DdgA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2487.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 06:49:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 06:49:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Thread-Topic: Mass-building defconfigs: many fail with assembler errors
Thread-Index: AQHZDnTLuXllxd0H9kO+fMt5FDvnvq5rLtkAgAJJpICAAQ1CAA==
Date: Thu, 15 Dec 2022 06:49:08 +0000
Message-ID: <592bf160-80c2-ec5b-43bf-b8d91e57fc7b@csgroup.eu>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <87bko8j73z.fsf@mpe.ellerman.id.au>
 <20221214144525.pecvb4cmnvth6n62@lug-owl.de>
In-Reply-To: <20221214144525.pecvb4cmnvth6n62@lug-owl.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2487:EE_
x-ms-office365-filtering-correlation-id: 53405d34-efbd-4cf0-6c20-08dade687769
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xwvQxqVLD19jGrHat3PMAF8w5gZWyqRGFNwjmjEMgs5WJtfP75j+4IqztbZjy4QkMEAE2kesdWmwM9rDCCTGdikDJYgYC1759Jt4XEn0/r5mGAmmy1D64zLcNn3TsiK2MPglT5xXi4Jg/CRtbos8ovS6H6FA9Fy1E+EjhCzDVe+u4cdUYjvRB+ZBkGlFMMJnxWuVhw0Tlu39gF8u8sWLZ7QtLJL+wA6c8Irx/nLUB8V3GpmsQ5LGJO6QPGx0u7/ZMTjXr4VXUs6PxkMkrPy5JBBntNNKFnEKXPac1+Ydr29oRKHtw7W2WfLFiK4pSzg4t9Ob/otSCzFwl4wUl58X01y9NWm9T6+cm3Y/T5s8LeVOe3l3WmEs5JTJHdVCqkeVwFInUwXQHZlaF/6BjOQeT7D3cVEhmY8kaDaVxzqAeoHjIskHBHGcY6kSFasN9AQDeRDJR09c0dhGcA6NAN/QuK3TBLQz3UJIhb7smJfvKk0PYb8L5a8qkJnIn5fYPLTnnmJ4oBMMLWTMpP23ujtFSzwN0R8I6tgtup/dd+rfBaDcmnCLygtSHl0XEqV7ULnSEZi3mEGwBCts09mz3QCMvd2YK2AQaDPf35UKaGpMOJ0Hvf/xwL5OFXixubdaZTFMs+by02oJX3MMpVz2mTlRC4LXqAdsunH0tIfBXTf2k4cHCXTcZSMJ4X2Y4GZxfML3NIn20s0JQa6yoIDLHkOalm9Td6wNMspBh365ggoXuEFQ0XbgdqCZHmcDdQTXXqSBRYeCYOyuldr+oxU5zcdz4y+CKLRQw9C0KLbLN0Syuf4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(31696002)(86362001)(41300700001)(4326008)(31686004)(66446008)(478600001)(76116006)(966005)(66556008)(6486002)(66946007)(66476007)(91956017)(4001150100001)(2616005)(71200400001)(2906002)(64756008)(6506007)(8936002)(122000001)(8676002)(38100700002)(110136005)(5660300002)(36756003)(6512007)(186003)(26005)(316002)(38070700005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MEFrNFYrSlVmTzB2MFhjeWJoNlB6Y3lUUnUveGV0R2NWWHdEZFowbDNrcnRq?=
 =?utf-8?B?QStUK0x4TEJsK0JUN3dlVlIrSmZiVVV5VU1HUWprQW9OU0lZTlVXbmI5NWQ1?=
 =?utf-8?B?djd2a09aRGtWaHZxRzByYk9GS3htRVFGd2ErazRKWWhYY1RkZ3NSK3VGck1v?=
 =?utf-8?B?RndhTVFkWXFFWWpZRE13OHJ0eDhoUFV1WVZmOCtaWkNsT0IrOGx2OGxCQjk1?=
 =?utf-8?B?cmlFMEFDc1BoaVloSDhINmUwdVdPSk1jUkdweVUzVnRScVluM0U2NFBBRldS?=
 =?utf-8?B?b2RyRDZYR1RVa08zYkRFMDVXMHVXbitLdW1scUZnRE1MT05jbmJqMi9IVmZk?=
 =?utf-8?B?YkdyNlFIZW5lTTI2cjBiZHFGWlBVZmcwTmxwcjdHbjRUVVNRUllTZnlxaUVO?=
 =?utf-8?B?Tk5aTkZCUGlmbCs2dXlpWUFibkJaWDVvRURpdFpTMGEwT0ljR3JKbWlvV3R6?=
 =?utf-8?B?WE40RHp6aUZ0OWdDaTFnOFF4Tk1LZGhrTlNuVDNtdllTUDNuZngyR3I5S2Iw?=
 =?utf-8?B?aHFyT1VMOHFFcURiay80dkljNFp0bEJYSFZ6OGlYNi9hY3FZOTlaZzNnSmxM?=
 =?utf-8?B?V2ZyQnpVSEZ2ZzZOYUd4Z3ZFR2JwOGd3cVArSXh1eEZHajVOZW82dkJqTHFF?=
 =?utf-8?B?dUh2Mk1PSFZycXhJTnVQQWpTYVM3UlR1YmRYZVJUSFNzZVlXSmhTdkpVWVVF?=
 =?utf-8?B?QWlpSy82T3JGSWNsU21OU0FqY0g0VHlTOUdMNmNrZDVSakVOLzZCTVl0V0hQ?=
 =?utf-8?B?NWpvSnlWSWtYYWhWZm9ZZkJsdzB1aC9nbmFKTzQwOHZVOVdUNGZXNU9qVC9Z?=
 =?utf-8?B?WGliaXJlRUlCVittcmFRRnl2ODV6S0ZPbEFlTENpNlFwNmZSZWhSYlE1Rm1u?=
 =?utf-8?B?UWdNZkhyTVNLRUlCR01SYkxCQzAxNWV0S2JHOEVVTnhDV1M4SjMyWVNYT3FF?=
 =?utf-8?B?dUI0QXNGbENIVjBZdjZGdmRVdWNaWEVJdHhYTDNPM25xZG1ramNablkwd1FS?=
 =?utf-8?B?NDBPRmxTOXJFM0ZiWExYeFRzUWZLanRtVGhlU3FGZGtsWEZaek9pd1JpamdR?=
 =?utf-8?B?cC84QmJqcjhaRUZZTDY4dGQ5YU9takdVUGdwdTV1OTV0N244SzZIZmtlMVc3?=
 =?utf-8?B?bTEzcEZTVlJIcWQ0RXEzRmJFVjl1QndyanZ2Z3JhbEpHSFRjcHU1VXFQODUr?=
 =?utf-8?B?cG9YeEVER0RzakZGMFl5ZWo1TGFaQUJub1MwelF4VlgwSW9VbTR6d0ZDK095?=
 =?utf-8?B?RDBtUitmWm5obDNDQ1ZXQkNScFVOL2dvTFlFd001eWR4bCtzdVBrTHQ1c3lL?=
 =?utf-8?B?cXdsNjkwVDNIblRHZjdCOUswcHFHTG1Ic2l4Yk1IVkY5SzJBZXpuelhYQVlC?=
 =?utf-8?B?QlpOL0ViVzBUcExwcklnZkVCYk5VZlpyU0VRMU9OdWxDMGxsQlFuU3ZtYm8w?=
 =?utf-8?B?NUErRmJTZDZ2Si9wMUo1V2pQMG5PVXY1WTJGcmE5SmZWK2p2ZUt0UitRTVhJ?=
 =?utf-8?B?dlVqbHRaUXN3NUNWYTd2NFY3dll6SVhYV3kzbUJYVUJGMm9ZUXExQ2FHOThj?=
 =?utf-8?B?bVBSMnR6dGhqV29takR3cGRteEYvQXgxMXJVR1FxVXRRK0lpK1Q0MTUraHJ4?=
 =?utf-8?B?RU9WQnNlSWlWVWF4ZzhNU1FmTXFMRVZCVWFYb0Z2RHI4cFFsV1RlMkJmcU14?=
 =?utf-8?B?cjFhZnhMYW9SRnVndzNMT3A3QmlWZEVKNnZsTEdiMkwzbUVuQWRsZ0lQM1Rl?=
 =?utf-8?B?bFNKaWlvR3FNMi9RejJweHJhSzN5aTJEQ3d2eEFPWGlDaGxBOTBxYVpZY2d3?=
 =?utf-8?B?a0RhWXpzTEJYQmM1OVdMNTJLdVgwOUNBb3dvb3pwV1I5YUxBVE5GQjllNDho?=
 =?utf-8?B?R0tCOTJ2U0tWZThtMzdTTHo5ZXFqTkFQMU5zL1NySzV5ZTErVFNmWFg2R2o0?=
 =?utf-8?B?UkJsd3AzdUNSaTBqWG96RkwzbmlCQnpjYndqODNCdUlNeVhrbWxWMUk2S04x?=
 =?utf-8?B?SXBxSGIvdmg5MkxjNHdBcUllVmEwdTZSaTJoK1cwckF0ZjBKb2FETnZUYno0?=
 =?utf-8?B?TFR2WENpMVUxS3VNYjgxcnAxQ0xxTVRoYVVyWjFHbEJvZE83S0FiRElFdFZX?=
 =?utf-8?B?MVlIQWxhbzVvbmV3aTBvUnQ3M3ZJZTlvWmJHL3MyYUxnc1pIQlFoRyt4Y2VU?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDC4EC496948BB45A6B68AD39F7A36C7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53405d34-efbd-4cf0-6c20-08dade687769
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 06:49:08.7240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75RUQgAXafCGltaOUIPr4c75JbDCoL2HivxpJjQ/lhzI4yrZGs2TTb/HNWOaNfc636YS7qy/0EprsdKio02aJ7vEUwx/U7rxJ/+aeLKVBEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2487
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjIgw6AgMTU6NDUsIEphbi1CZW5lZGljdCBHbGF3IGEgw6ljcml0wqA6
DQo+IE9uIFR1ZSwgMjAyMi0xMi0xMyAxNDo0OToyMCArMTEwMCwgTWljaGFlbCBFbGxlcm1hbiA8
bXBlQGVsbGVybWFuLmlkLmF1PiB3cm90ZToNCj4gWy4uLl0NCj4+IEJvdGggdHJlZWJvb3QtYWtl
Ym9uby5jIGFuZCB0cmVlYm9vdC1jdXJyaXR1Y2suYyBhcmUgZm9yIDQ3NiBzbyBzaG91bGQNCj4+
IHByb2JhYmx5IGJlIGJ1aWx0IHdpdGggLW1jcHU9NDc2LiBlZzoNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmls
ZQ0KPj4gaW5kZXggZDMyZDk1YWVhNWQ2Li5hY2I2ZWRkYWNlOGYgMTAwNjQ0DQo+PiAtLS0gYS9h
cmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZQ0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2Jvb3QvTWFr
ZWZpbGUNCj4+IEBAIC04OCw4ICs4OCw4IEBAICQob2JqKS9jdWJvb3QtdGFpc2hhbi5vOiBCT09U
Q0ZMQUdTICs9IC1tY3B1PTQ0MA0KPj4gICAkKG9iaikvY3Vib290LWthdG1haS5vOiBCT09UQ0ZM
QUdTICs9IC1tY3B1PTQ0MA0KPj4gICAkKG9iaikvY3Vib290LWFjYWRpYS5vOiBCT09UQ0ZMQUdT
ICs9IC1tY3B1PTQwNQ0KPj4gICAkKG9iaikvdHJlZWJvb3QtaXNzNHh4Lm86IEJPT1RDRkxBR1Mg
Kz0gLW1jcHU9NDA1DQo+PiAtJChvYmopL3RyZWVib290LWN1cnJpdHVjay5vOiBCT09UQ0ZMQUdT
ICs9IC1tY3B1PTQwNQ0KPj4gLSQob2JqKS90cmVlYm9vdC1ha2Vib25vLm86IEJPT1RDRkxBR1Mg
Kz0gLW1jcHU9NDA1DQo+PiArJChvYmopL3RyZWVib290LWN1cnJpdHVjay5vOiBCT09UQ0ZMQUdT
ICs9IC1tY3B1PTQ3Ng0KPj4gKyQob2JqKS90cmVlYm9vdC1ha2Vib25vLm86IEJPT1RDRkxBR1Mg
Kz0gLW1jcHU9NDc2DQo+PiAgIA0KPj4gICAjIFRoZSBwcmUtYm9vdCBkZWNvbXByZXNzb3JzIHB1
bGwgaW4gYSBsb3Qgb2Yga2VybmVsIGhlYWRlcnMgYW5kIG90aGVyIHNvdXJjZQ0KPj4gICAjIGZp
bGVzLiBUaGlzIGNyZWF0ZXMgYSBiaXQgb2YgYSBkZXBlbmRlbmN5IGhlYWRhY2hlIHNpbmNlIHdl
IG5lZWQgdG8gY29weQ0KPiANCj4gV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIGl0IHNlZW1zIHRo
aXMgZml4ZXMgdGhlc2UgYXNtLXJlbGF0ZWQgYnVpbGRzOg0KPiANCj4gbGludXgtcG93ZXJwYy1i
YW1ib29fZGVmY29uZmlnDQo+IGxpbnV4LXBvd2VycGMtY2VsbF9kZWZjb25maWcNCj4gbGludXgt
cG93ZXJwYy1lYm9ueV9kZWZjb25maWcNCj4gbGludXgtcG93ZXJwYy1rYXRtYWlfZGVmY29uZmln
DQo+IGxpbnV4LXBvd2VycGMtcHBjNDR4X2RlZmNvbmZpZw0KPiBsaW51eC1wb3dlcnBjLXJhaW5p
ZXJfZGVmY29uZmlnDQo+IGxpbnV4LXBvd2VycGMtc2FtNDQwZXBfZGVmY29uZmlnDQo+IGxpbnV4
LXBvd2VycGMtc2VxdW9pYV9kZWZjb25maWcNCj4gbGludXgtcG93ZXJwYy10YWlzaGFuX2RlZmNv
bmZpZw0KPiANCj4gLi4ud2hpbGUgdGhyZWUgcmVtYWluIHVucmVzb2x2ZWQ6DQo+IA0KPiBsaW51
eC1wb3dlcnBjLWFzcDgzNDdfZGVmY29uZmlnDQo+IGxpbnV4LXBvd2VycGMtbXZtZTUxMDBfZGVm
Y29uZmlnDQo+IGxpbnV4LXBvd2VycGMtcHBjNjRlX2RlZmNvbmZpZw0KPiANCg0KQ2FuIHlvdSB0
cnkgd2l0aCBiZWxvdyBjaGFuZ2VzICh5b3UgbWF5IGhhdmUgdG8gYXBwbHkgbWFudWFsbHkgYXMg
SSdtIA0Kbm90IHN1cmUgbXkgbWFpbCBjbGllbnQgcHJlc2VydmVzIHRleHQgaW50ZWdyaXR5KToN
Cg0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9NYWtl
ZmlsZQ0KaW5kZXggYmY1ZjBhOTk4MjczLi4zMjQ1ZWVjOTU2MjcgMTAwNjQ0DQotLS0gYS9hcmNo
L3Bvd2VycGMvTWFrZWZpbGUNCisrKyBiL2FyY2gvcG93ZXJwYy9NYWtlZmlsZQ0KQEAgLTIwMSwx
OCArMjAxLDE1IEBAIEtCVUlMRF9DRkxBR1MgKz0gLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRh
Ymxlcw0KICAjIG9mdGVuIHNsb3cgd2hlbiB0aGV5IGFyZSBpbXBsZW1lbnRlZCBhdCBhbGwNCiAg
S0JVSUxEX0NGTEFHUwkJKz0gJChjYWxsIGNjLW9wdGlvbiwtbW5vLXN0cmluZykNCg0KLWNwdS1h
cy0kKENPTkZJR180MHgpCQkrPSAtV2EsLW00MDUNCi1jcHUtYXMtJChDT05GSUdfNDR4KQkJKz0g
LVdhLC1tNDQwDQogIGNwdS1hcy0kKENPTkZJR19BTFRJVkVDKQkrPSAkKGNhbGwgYXMtb3B0aW9u
LC1XYSQoY29tbWEpLW1hbHRpdmVjKQ0KLWNwdS1hcy0kKENPTkZJR19QUENfRTUwMCkJCSs9IC1X
YSwtbWU1MDANCitjcHUtYXMtJChDT05GSUdfVEFSR0VUX0NQVV9CT09MKQkrPSAtV2EsLW0kKENP
TkZJR19UQVJHRVRfQ1BVKQ0KDQogICMgV2hlbiB1c2luZyAnLW1hbnkgLW1wb3dlcjQnIGdhcyB3
aWxsIGZpcnN0IHRyeSBhbmQgZmluZCBhIG1hdGNoaW5nIA0KcG93ZXI0DQogICMgbW5lbW9uaWMg
YW5kIGZhaWxpbmcgdGhhdCBpdCB3aWxsIGFsbG93IGFueSB2YWxpZCBtbmVtb25pYyB0aGF0IEdB
UyANCmtub3dzDQogICMgYWJvdXQuIEdDQyB3aWxsIHBhc3MgLW1hbnkgdG8gR0FTIHdoZW4gYXNz
ZW1ibGluZywgY2xhbmcgZG9lcyBub3QuDQogICMgTExWTSBJQVMgZG9lc24ndCB1bmRlcnN0YW5k
IGVpdGhlciBmbGFnOiANCmh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgv
aXNzdWVzLzY3NQ0KICAjIGJ1dCBMTFZNIElBUyBvbmx5IHN1cHBvcnRzIElTQSA+PSAyLjA2IGZv
ciBCb29rM1MgNjQgYW55d2F5Li4uDQotY3B1LWFzLSQoQ09ORklHX1BQQ19CT09LM1NfNjQpCSs9
ICQoY2FsbCBhcy1vcHRpb24sLVdhJChjb21tYSktbXBvd2VyNCkgDQokKGNhbGwgYXMtb3B0aW9u
LC1XYSQoY29tbWEpLW1hbnkpDQotY3B1LWFzLSQoQ09ORklHX1BQQ19FNTAwTUMpCSs9ICQoY2Fs
bCBhcy1vcHRpb24sLVdhJChjb21tYSktbWU1MDBtYykNCitjcHUtYXMtJChDT05GSUdfUFBDX0JP
T0szU182NCkJKz0gJChjYWxsIGFzLW9wdGlvbiwtV2EkKGNvbW1hKS1tYW55KQ0KDQogIEtCVUlM
RF9BRkxBR1MgKz0gJChjcHUtYXMteSkNCiAgS0JVSUxEX0NGTEFHUyArPSAkKGNwdS1hcy15KQ0K
DQo=
