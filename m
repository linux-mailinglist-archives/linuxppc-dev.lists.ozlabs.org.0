Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A397A806ABA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 10:31:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mtCVHO/y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlXGz0pHHz3dLc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 20:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mtCVHO/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlXG41SDLz30K6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 20:31:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KA0Br93S2aYNWnTrImOKoWNpwMCtUJ0zj0Hsr292+z5agIge4srw7tJCIWPC2GYIWIIyyG07WBt7WlYaecxrKVSI1WceNnHNs5potX2DkMFVrJp53FgM0O0eNEckqDY6pRKk4oueyKjnIhb6xsZzbARcphSjhcWb0JjfWt8pt1GAAirhPqQKwfREDjvX9tExVgPyVhJg3VY2sDn5Q/VC4vbSmsggz39+GhczmTryMt4QF/IGobiNyUTlWn9BEgnkImXMNJPWKqo8WBWpaqrKHEDcE9DtWuFrtGnD/0G/gY4lLeicSERcR0TCYi26pxdwxXCY3dpOV/Ug47fMq+Qurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Okq+LWVFSdy1yk+MYHdjirVz0zac+Ro81PAs8JF72w=;
 b=WkUa7peH3BP0acyxUWO2ceDA8IJxGVL06DhEsyjzrJVkSqaTMpluwtSUsP724/qSjfrL41xcHzXIgpdZmsp5N90upUD6kHzsDZFJPlmIxT7Z20tRzqKSNJ71Bqnz3iy5INTKV16T7kFVRX/IUsJiydCnAVTlXSVRtLTEVKDG+8gO404AqYqapwRd/BcCQVgl2R7VAJGmPX5uv6x81xnSGwxfLAxNElCPICSHYYMagGwbJ7Oa/0EfxFWo/qwh9MrXxA99KB8f4IYFO3uKBI+xA2QQyGmHhbdjTSaxvXTQYJGGKDPzq1VBcBg7Fk8rxyGGils63IY9a//fD+MedVyyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Okq+LWVFSdy1yk+MYHdjirVz0zac+Ro81PAs8JF72w=;
 b=mtCVHO/yDiOw231fWh8CPaK94SleU4CmceN6794R90PYXa0tkgwx+ezCZ699w4+iQUNq32SqKLrj08ZQ2GFf5LNpLJGdnt9PW+H3JAtSERDaifap73z6IYAH9Ypn3LgZ16TAHXzw0CvjNPWxrYBGKxgl2wOjS5fBXlxa4RM2RaPBBlY3LC2Mdoe3Gq7JVcSaS+YL00sYn4xiq3TVJDAJLmPfYJvpdZAejFytA6wFRYSXxkdc1X5VIxyZ8KqkXYW4Xq0cJkbyFgehE8zRquL2685EWgdcRoL6dxI0LAbesnVyTTodYlbnIUx6EZNlkSXnJIAiJ6ohKSi3seyXM12TRw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1701.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 09:30:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 09:30:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
Subject: Re: [PATCH 12/27] tty: hvc: convert to u8 and size_t
Thread-Topic: [PATCH 12/27] tty: hvc: convert to u8 and size_t
Thread-Index: AQHaKBceFfLXTsgZGkKSi8+G3WtYpLCb/ZiA
Date: Wed, 6 Dec 2023 09:30:46 +0000
Message-ID: <f0d05148-881b-4973-afc1-31709523560e@csgroup.eu>
References: <20231206073712.17776-1-jirislaby@kernel.org>
 <20231206073712.17776-13-jirislaby@kernel.org>
In-Reply-To: <20231206073712.17776-13-jirislaby@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1701:EE_
x-ms-office365-filtering-correlation-id: 932b1c25-1d2f-4e6d-9f43-08dbf63e06d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XooLZ2XzalOounorjlV9WH+6wSGYESTJyjwumEViGJD2JBByih6jDtBpZE1WHROGyZHFvUdcUEe7ZsMSZl+eLP37Mgpuu+Fr2eiTzIIbNBegLK2ebchlj30+IvjUHJ7Qz92aMY272sXLMR11jyjZLbovb6NfFzQQIddCKo3pvaGrhdqIVa0pduyEjCZf0F0cc6y7FCffBOGTPdB1nGUD+JwWjkqpVPGvU8j3aWGvYA4abv8YPOHfEvkmQXSdzNacFK5JtpSrrbJYlcuKHoYHNS5EFYXY2FiVnK1c9Aoz5QOIQql16Fo9FeN3cwB2XgCRluTS9+bT4kxTYojJyHi99rfE7xWhTUkv+DtwfzIWK4H0AULEKwko24HYsb5y4UXV3K0t/zKAyyez9X+rX99uD8EtyXavpGZ74dMH06sdXp6SlUVmqHnVRufhSVdz/M1kWE4EceWtfiNgpxou6A8HyE2edG91gK1Jbtx6+unFSpTIDr9PCxOXNvot/oNseL50kra6xZJ7FPIJ7yneU1Dxo5qj9GRwLivwKhTOkyGrA5lAxHEdoc6k/cxDvg+7yzR2+m7+0VrFb4EOyF9tltemqSVYTVMZ3CLRj7iP/yauivQkrOeUvKDOJosutbjczb76yAsUq9ElSzqblitxkFEtGIFe4telnmaIZ5hzUECJF059/XAcoYqUuCQQ3lMIzicU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(39850400004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(7416002)(2906002)(5660300002)(44832011)(36756003)(41300700001)(122000001)(86362001)(31686004)(4326008)(8936002)(8676002)(316002)(110136005)(76116006)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(91956017)(38070700009)(31696002)(38100700002)(6486002)(478600001)(83380400001)(71200400001)(6506007)(26005)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bDBlV2lWRzFBd0lJRHdpT1NVcjNhalA0TDIvUXJqUGlzMTY5cHU4MkNiRzdT?=
 =?utf-8?B?KzlOMTIvcDN3NVo4UkdMQ1ZPRkIyNnR4MTVFTDg1dkZkZUFUT0NJVzZpdUtp?=
 =?utf-8?B?UFh0bGlrV2EzK056Z3RSa25HMlZWMWxmeDBYdlZyMG1TWFF5TUhMRjRMcktx?=
 =?utf-8?B?cTlrN1RKaXBGQU9rbDdzaFhtcFRUMFhrVEZYN0wxWnQwZlNLZTFyK2V4eUxY?=
 =?utf-8?B?WGZ3V2p2UVR0emgzUmJoamlLdEtRejg0TWQ4VEJyTEg4WW5tU2tBcHZPbTJU?=
 =?utf-8?B?eXYvUmpIenJjbmFwL2pDNDBCZDB3cGhKalhzQU50STZRSDRST0RpdVA4eFVT?=
 =?utf-8?B?YjA3ODV0TVBKcVFhVnRMdzE1WS9HYzQzb0tOMUk1bmlsS1k1MVBjenJjMlA0?=
 =?utf-8?B?Z1dWTTZhc2xta3JWQXNDbnRKMWRvSHF1bDg1bnBRUlZUeHZGSXV2LzA2QjJv?=
 =?utf-8?B?a3VEWmZMTldOMHhXZnZyT3l5RC9zMTVnUEE5MkliaEoxQkRiUW1FT0sxSTJs?=
 =?utf-8?B?YkEzVXRlVEF0RHZqRjFaWWJNMTE5REwwL0lIeHhUeWFOeVpOcnhSM1VkWFY5?=
 =?utf-8?B?azIrWGFRbERoL09mclNxWmFQV0JNOCt4N09IWklVSGtQeVI4ekJ3RTM2NDBB?=
 =?utf-8?B?YmR5aFFJWGdPWEZQL0VyQ2JHOEovbjlHVXcxQ1lmQkpKNjF0TkpQNzlRS0Vo?=
 =?utf-8?B?Tk80MGdueDFEZDFkRitib21JZGZsT0pMOFk2SXZpblJpRGcxd3U3b0szWXNB?=
 =?utf-8?B?KzZGaFZIS3VNU00yV0lVQXdmMGJhN0UwL2NocXVsZFVuMHBsQnhMclNSMkdn?=
 =?utf-8?B?bzlpeWYrN09yUjdsbXdmVGZpbnFlMFowMUdWdGpVZGViVCtiQ2I5V1RQUXVt?=
 =?utf-8?B?SWNVVU14OFBiTGJXVnZlSC9RNk0rV1F3b2xwWlpmTlhNUzdHc2w5VFFMVDFN?=
 =?utf-8?B?a3hNWGZ0UmRoRzAzWmtFeDlRcWJkS2J6L3o4WEo1TmNpbEQ0cDlsZ2ZUbVJV?=
 =?utf-8?B?b3o3aVBHYkdrbDUyNE12c2s4aTRBakVlcG1KbWlKc2dDZGJEVlBvb3lHS0VY?=
 =?utf-8?B?Mms4VnVyUDJNcWwyTEdzM1dYQmZMVDhla2JlK2FFWEV2UXMyWDA0cjE4R25T?=
 =?utf-8?B?eFdQSFhMUUpLOEpXOXF2eFZyZklyRTVtOFpUdnUzRHJlS1RyZnRrenM4YTFX?=
 =?utf-8?B?bHpWRWVsTFRMOTRMYmpBdCtnREM2V1BMOStNdVVPUFBycEpVa0p4Wnl0bGVP?=
 =?utf-8?B?RDIwSHhVOTNsdlBwSlAvbFYxTkpwK2JEcmJweXBDL3NFZnFzdE9VOStNVlk0?=
 =?utf-8?B?Vmd0aWRYRXg0TkVyVmM4UTJ0SjRXVkJvWjBTL1hLa1p5d1NKQmE0bUpIQ20y?=
 =?utf-8?B?MnVubnNkU3dZZWlDbkRFRWRMNUVoblJnL0N4VUc2T3VXYmNxQVRBODFPYkxx?=
 =?utf-8?B?WTBiWXV3akhZbGJXQ2U2RlE1a0FBeEovRWp0TjJmUDJhdkhac3N0cjRISlJZ?=
 =?utf-8?B?RENUNjMvazZMcDRhT2I2OEM3TGgzcUczUDVKSHFLb1N2cTRlQ2k0NmtSVlFN?=
 =?utf-8?B?WXVHbHVKQUlOV29uRW1HWGE5UjcvYjduSVJReFhubWhtbjU2dCtTOUZQWTJk?=
 =?utf-8?B?OGFkamdkZUN0MFBXQi91MzhCZ1JpZUE5ZTlHNlZUYUJpS0IyNitwbk9sREMv?=
 =?utf-8?B?MjJPZXNNQ1RKSnR1aDBqWXdzeVAxakpKT005TDBwV3FZWnE5bTlrRnQrK3hu?=
 =?utf-8?B?ZlRKbThxYWNnUDRIYnppc2JtZ3JsVXQrNHlhWUJzRkFTdUQ3c1JIRW8xZWNZ?=
 =?utf-8?B?aFNPVkdCcDc4eFFaYzlzTGVxQlZ5TTA5Y1p3WmpXamJuWVhtSGxjNHFQOUZa?=
 =?utf-8?B?TEFuaG5lVmk2dE1jWUNtdUhqZEVUR1craElqZUdBVnFZMmMyN1dkS2RWLzVP?=
 =?utf-8?B?YVBIUUxsVkRwNmFETmFwd1lsVU9BUExNdWhWMzR4MWhvT3FVVnkxQ2pSVzdD?=
 =?utf-8?B?OXNYaVI1ekxkRzgxNEdnb0NqT3NrVitIUnUvQkpDUXFLT2llQ011dUU3bytE?=
 =?utf-8?B?amJJU2pMVVl2UWd6VmZsdGJzdVl2TytZWGNQcEdNN1dBeEw0K01YQlgxK2hk?=
 =?utf-8?Q?Dd/heGRjyZ+1BFpsKXlPBoVRC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D78A85787EBC984BB501A2F643C37733@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 932b1c25-1d2f-4e6d-9f43-08dbf63e06d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 09:30:46.5879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keYyLUHIy8yK/xDdhBVB/8wb0vuVfRk13+mCDlA2JvZOg9kN+l6Mo8RdyylwN47RsfoigDlIjfUfol+qFdu+mC/UdpS/XxUatEsSvLLHbps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1701
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEyLzIwMjMgw6AgMDg6MzYsIEppcmkgU2xhYnkgKFNVU0UpIGEgw6ljcml0wqA6
DQo+IFN3aXRjaCBjaGFyYWN0ZXIgdHlwZXMgdG8gdTggYW5kIHNpemVzIHRvIHNpemVfdC4gVG8g
Y29uZm9ybSB0bw0KPiBjaGFyYWN0ZXJzL3NpemVzIGluIHRoZSByZXN0IG9mIHRoZSB0dHkgbGF5
ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKaXJpIFNsYWJ5IChTVVNFKSA8amlyaXNsYWJ5QGtl
cm5lbC5vcmc+DQo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+
IENjOiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPg0KPiBDYzogQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBDYzogQW1pdCBTaGFoIDxh
bWl0QGtlcm5lbC5vcmc+DQo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiBD
YzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPg0KPiBDYzogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4NCj4gQ2M6IEFsYmVydCBPdSA8YW91QGVlY3Mu
YmVya2VsZXkuZWR1Pg0KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gQ2M6
IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LmRldg0KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZw0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHZjb25z
b2xlLmggICAgICAgfCAgNCArKy0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2h2c2ku
aCAgICAgICAgICAgIHwgMTggKysrKysrKystLS0tLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9vcGFsLmggICAgICAgICAgICB8ICA4ICsrKysrLS0tDQo+ICAgYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy9wb3dlcm52L29wYWwuYyAgICAgIHwgMTQgKysrKysrKy0tLS0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9odmNvbnNvbGUuYyB8ICA0ICsrLS0NCj4gICBk
cml2ZXJzL2NoYXIvdmlydGlvX2NvbnNvbGUuYyAgICAgICAgICAgICAgfCAxMCArKysrLS0tLS0N
Cj4gICBkcml2ZXJzL3R0eS9odmMvaHZjX2NvbnNvbGUuaCAgICAgICAgICAgICAgfCAgNCArKy0t
DQo+ICAgZHJpdmVycy90dHkvaHZjL2h2Y19kY2MuYyAgICAgICAgICAgICAgICAgIHwgMjQgKysr
KysrKysrKystLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvdHR5L2h2Yy9odmNfaXVjdi5jICAgICAg
ICAgICAgICAgICB8IDE4ICsrKysrKysrLS0tLS0tLS0NCj4gICBkcml2ZXJzL3R0eS9odmMvaHZj
X29wYWwuYyAgICAgICAgICAgICAgICAgfCAgNSArKystLQ0KPiAgIGRyaXZlcnMvdHR5L2h2Yy9o
dmNfcmlzY3Zfc2JpLmMgICAgICAgICAgICB8ICA5ICsrKystLS0tDQo+ICAgZHJpdmVycy90dHkv
aHZjL2h2Y19ydGFzLmMgICAgICAgICAgICAgICAgIHwgMTEgKysrKystLS0tLQ0KPiAgIGRyaXZl
cnMvdHR5L2h2Yy9odmNfdWRiZy5jICAgICAgICAgICAgICAgICB8ICA5ICsrKystLS0tDQo+ICAg
ZHJpdmVycy90dHkvaHZjL2h2Y192aW8uYyAgICAgICAgICAgICAgICAgIHwgMTggKysrKysrKyst
LS0tLS0tLQ0KPiAgIGRyaXZlcnMvdHR5L2h2Yy9odmNfeGVuLmMgICAgICAgICAgICAgICAgICB8
IDIzICsrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvdHR5L2h2Yy9odnNpX2xpYi5j
ICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKystLS0tLS0tLQ0KPiAgIDE2IGZpbGVzIGNo
YW5nZWQsIDEwNyBpbnNlcnRpb25zKCspLCA5MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHZjb25zb2xlLmggYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vaHZjb25zb2xlLmgNCj4gaW5kZXggY2NiMjAzNDUwNmYwLi5kODQxYTk3MDEw
YTAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9odmNvbnNvbGUuaA0K
PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHZjb25zb2xlLmgNCj4gQEAgLTIxLDgg
KzIxLDggQEANCj4gICAgKiBWaW8gZmlybXdhcmUgYWx3YXlzIGF0dGVtcHRzIHRvIGZldGNoIE1B
WF9WSU9fR0VUX0NIQVJTIGNoYXJzLiAgVGhlICdjb3VudCcNCj4gICAgKiBwYXJtIGlzIGluY2x1
ZGVkIHRvIGNvbmZvcm0gdG8gcHV0X2NoYXJzKCkgZnVuY3Rpb24gcG9pbnRlciB0ZW1wbGF0ZQ0K
PiAgICAqLw0KPiAtZXh0ZXJuIGludCBodmNfZ2V0X2NoYXJzKHVpbnQzMl90IHZ0ZXJtbm8sIGNo
YXIgKmJ1ZiwgaW50IGNvdW50KTsNCj4gLWV4dGVybiBpbnQgaHZjX3B1dF9jaGFycyh1aW50MzJf
dCB2dGVybW5vLCBjb25zdCBjaGFyICpidWYsIGludCBjb3VudCk7DQo+ICtleHRlcm4gc3NpemVf
dCBodmNfZ2V0X2NoYXJzKHVpbnQzMl90IHZ0ZXJtbm8sIHU4ICpidWYsIHNpemVfdCBjb3VudCk7
DQo+ICtleHRlcm4gc3NpemVfdCBodmNfcHV0X2NoYXJzKHVpbnQzMl90IHZ0ZXJtbm8sIGNvbnN0
IHU4ICpidWYsIHNpemVfdCBjb3VudCk7DQoNCldvdWxkIGJlIGEgZ29vZCBvcHBvcnR1bml0eSB0
byBkcm9wIHRoaXMgcG9pbnRsZXNzIGRlcHJlY2F0ZWQgJ2V4dGVybicgDQprZXl3b3JkIG9uIGFs
bCBmdW5jdGlvbiBwcm90b3R5cGVzIHlvdSBhcmUgY2hhbmdpbmcuDQoNCkNocmlzdG9waGUNCg==
