Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1E641E17
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 18:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQCbb0yk0z3bgm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 04:00:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1Zo+HcTJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::610; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1Zo+HcTJ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQCZZ1Ylcz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 03:59:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2CFlN/frUyykZTxHO0odZo5P8x+pDo8rJwpJlstYX0zAkhjzRDacbimtqWJgFUP8mKDv6HCDv5vJCLF+0p8hWo4ZHU6Q+LZ5Gl3WHdUFeCf+4/LoP0DM2BzKSOnf1DscUTrC1l+V8kCfeiiTaFh9HvXFzVSBnvWnXMENKWrpkDUG+XDBDa8938vUCrLtbP7VmeHEQ1sCaD7rsl32zSF5tQD6hXKFmE++coV8UnnNBSj55OzFsxSl0S16IsR4WORHiMRF0Hg4XCNHhYQ+znkGp/ccYpiZ7C8UWySqnUL7i0RFLfVoeUbItHUzesd/Yw/J/+5Z0VKuLj8abUrmdPOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiTlKtmrCEbTyTIEo/VtHtESVFh23ooKH8nOyPuBupw=;
 b=YQT807CWFRHcMkm952FniEIeO2ywzjU3wW6grHyigx46mKzD05atl7C64unJBGrBCK8ZboJnZjP9M10PZwV/qmG4F2u2sTE5cpNkXk4wDHONFlaZC8HCVmPRko3Ze/h+PbuaPz5dF9J4WAOF5SKqXct92BPByZRyHHcgQaDm0f6LbfpN6opAUiQGa1/J0VNeEV3txIHqF80b8uYvAScjWXYDlUdmfJk+9nzJSlaAE6VbmVLZq0PAQ7vStn2wWwmDV+FyQ7EKQMCeHFvxbJk5cDukRvW6mrnamyJxDOtOc7hUPilv025aZa3TceQeJkqjeWyqBVEwSvL3/WbcpPwDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiTlKtmrCEbTyTIEo/VtHtESVFh23ooKH8nOyPuBupw=;
 b=1Zo+HcTJbHIApBhtQX3b+lMSBTlak687uQJ+kWopkU58/BnmaAZ/m0HRb3cB5WuDnYYVdDhcixz/bLZ4pBbcaoyNoVjMS8J6aVpwVjdZNrXOr/gz3ivWk27ZfFWcVtZQZHyFh0asT2hSl/RbL/V79z9fZgOVkWv3FVceHkXb8CkaOW4+8Bs8JmQUdL5FMh1UiR1r2+MGLF+h5Zn96W3IN/ZFyYbBKwytTISpT2teh5THz/7hhjsAWQHsRckVBlxBDTmVOiTiw5S0Mn4z0hPNAGA83ou0Lu7o8FoS07g6VZzBPozrq2hNWJNf55TC3kkMUyzz3B8jufXr5ShNmeL27A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2922.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:18::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Sun, 4 Dec
 2022 16:58:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.013; Sun, 4 Dec 2022
 16:58:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Fangrui Song <maskray@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Thread-Topic: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Thread-Index:  AQHYvKf5WSu8dJNxYk+eVO8ie3qNK63YW3QAgBwgtICASlSggIAAzUiAgB4gigCAAMt2gA==
Date: Sun, 4 Dec 2022 16:58:53 +0000
Message-ID: <3ec9737e-3d1a-c014-b91a-0e2d406a3b3d@csgroup.eu>
References: <20220830193701.1702962-1-maskray@google.com>
 <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
 <20221115004625.x4wl6zbg4iiuxl5t@google.com>
 <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
In-Reply-To:  <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2922:EE_
x-ms-office365-filtering-correlation-id: 6dffa5e2-b34c-4d31-aec4-08dad618d2eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  s5srBfTcZSQqhCsk4pkNeLGiyT8kdkasof6tJAFsXH6tw2p4unC+33ChkDLe380wbd9FaxCHwlNwKONZGGI5wsARl3vdK3ox+WsCVkR76QyGWWDkb9WbafmfrKzd+30JqCK1khWyJtJtZtri5NFwBLsaVUbL/E6P6D/RO7OIZm0tpowKFfcuydEiNpv1fTSfiDh8FEyt4lDuqlNu0v3Ohy6jta9yMfkSo5ZFbxfAvELuIAAx2svyzK0WRrRhSHHcThTJUlfqyMR3MYoOri9+mnAHZGt4iVvG+d1XZftDGNshi+kMQSWzvQSenPFXsdvOFecOA6wX/rKeP89XxPXwlyjSvpTW+SyqghbAQwjyTFQkaWdnmBRp4C7gCyFcbieG16YyUv75IH5RJYC/UGvPs9pkGQQ/1amoz3kkovEsjQPbPFDCjxziN28gVHFN983Ia3yjtO+QiZB4C1b/Y0hvsidKVlU3bYAFezQ2Rbbq7dOzqwcCgQ2xE76sP/Q8fRP/p2FhFuVY/4Fd7lfVlMcWepYkJkRtibTFRsU+J6qbin/ALDrmMyrRMkozNmEhmzxbd5ynEAXuT17hLVefp8b9/Q7mB8j+PtaVz2y8bMwd5/ZlLbYxl3+dj8AUn08duX5LTk41VFl/TB5xCO0nfHQ4uqlDkUPheQzhdnYKycEAsVmBKXsmNiRzZEguwot0EjNQk+X3DoWKc+41hVJVMAIaW36tcixKTR5otCRge23RHnsSvvhR/wEDFUucliTpNgWBWetWwdiIqzRW7UY8TGsxpA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39840400004)(346002)(376002)(136003)(451199015)(71200400001)(53546011)(6506007)(186003)(2616005)(83380400001)(66574015)(38100700002)(66946007)(122000001)(6486002)(66446008)(66556008)(76116006)(64756008)(86362001)(7416002)(66476007)(4326008)(8676002)(41300700001)(8936002)(54906003)(110136005)(316002)(5660300002)(31686004)(478600001)(44832011)(91956017)(6512007)(38070700005)(4001150100001)(31696002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?czdzdDF6Zk9BUXd2ZlgyNm45WTAvZ2pkS3pmQ3hvc2lHWjA3WHIzcGhzSkhF?=
 =?utf-8?B?cm9ZNGxZTHQ3SHhRbXkzbnZ6ZUNaY3E4MEZTdU5zaGc4ekg4RllZdHhlTjZZ?=
 =?utf-8?B?S1JSU0ZXMDA5TnlWVThMeWJ1ck9OSElJMEVDNGxHbU54alp1czh1dnhJZjRr?=
 =?utf-8?B?bzBFWm1kNEE3WEpxWVBKNHlDUjB2SnJ6N0g1T1kzeWE5bktTeEZGRUFlVk5v?=
 =?utf-8?B?WTlaYUViTUpuZ0hTcFRKUGtTUGFnQndqOU9XbisvMnp2VHF4VTM4ZG44NVdM?=
 =?utf-8?B?Wm12TlcwckhDNXRPdE9KSEVQWUN4S3oveFo2TUFlZCtTaXk4VmJFUTA5QkZk?=
 =?utf-8?B?OGtjVEt1Rjc3M1pjTkIzVlc2bTAyWkRobDhWVUZHbElHUXR3elFsYWszQ2c3?=
 =?utf-8?B?cEJYczdkSzVuY05nZk9WVXcxZEZUWW52QTlvYXFQK0pReGtVd1RnMUVZOE1a?=
 =?utf-8?B?K2ZoeTVVOEJsQzlYZnA1akZNMHpOaTZXQjNpenNmRVNNdmVhNzFlbUtpS1pT?=
 =?utf-8?B?WHkzRlJITkd2ZmoyR2NVcmZKVjVkNHlBVHFWM05GdGxPc05uMVkwVmZRb1Bp?=
 =?utf-8?B?d01SdnRpMzl2RWpuQ1FjeWNianJOTkRKUnJpWXNzQThjajIzY2VLOWljRXhE?=
 =?utf-8?B?RmJhNW1EMHhoRlNHV1U4NXVxSldRUU9RK3NhWCtwYThybkZ3Nm9QMndiQzRO?=
 =?utf-8?B?aytTbjE4NVdtWHoybjM2QWpUTVN5SUNGcklka09Mbm14cTFabHNFVlNqSTlQ?=
 =?utf-8?B?M29GdlVDdkJ0RldKM1dLSVNETk11Vk54dHNBMUVRNWpOcEpBTm53cDdVbWxB?=
 =?utf-8?B?cENxQ3dGRzhaWVhEcEJ0amFNY1ZINldPWmxhaVE5MnBwNldEaFpkZEZqTWNh?=
 =?utf-8?B?MXdJK2FBTGZNMU53c21JM2pBL29ZTXBEVGRXaHlQM1NYNzRPL0RxcFNndTRM?=
 =?utf-8?B?SFRGQUQrZk5QTml6b3NtVGJYTUJrdXM3VExLODBHQnpIRk9paE91alF6Ymxn?=
 =?utf-8?B?eitsUkhsczQ0aUx0dmU5VmYyeWNjSE4xanJZeVB2MWNHYWhGVDdzMmpXbU9y?=
 =?utf-8?B?bWQzMU5uMlFTTnE0aDRXQkV4azdTWkwvZjBZenhwWHNyc3dBL3R4RzBPaUFT?=
 =?utf-8?B?WStxalZXazZhM0RFejRqdmhMVFdRNWtvdnZSWC9tajZTWmJqM0Rhb2JycUUz?=
 =?utf-8?B?M0NLMmF3b01pVGM4V2RDVktkWndvbFViclhjdUI4RUtVOGtxaWFnRDhIVno4?=
 =?utf-8?B?dW9JS2pvcXJXUHIxUEZDbkt5elo3aEtxZE1KTUM0TjNFOFg2OHVTZ2hPR1lu?=
 =?utf-8?B?NXBSYzlEYkZ3QkM3OUpXeE9FWXFGb3JzNEE5aENwTHg0M3ZQMDdzNGhsK0cy?=
 =?utf-8?B?OE9TSHB4TzhZS2ZDNnNMcDUzdU13Vy9RZy9td3FiUW8rZHdKVVBHVTh6NmRS?=
 =?utf-8?B?TVBuY0NZMVJqNTh3VzlJMlJaOFZiM1pJWlIxMkc4d0ZWNzlXSVlHemFTNnd4?=
 =?utf-8?B?ZDlFYkF4VWFoNm1YNjBZL2pDRThDRXlnVURQWktMNklvYnFWQkREdHJnS2ZO?=
 =?utf-8?B?QWNnY2NoSmR6L0d6ekxPaTNBeXNTeVFQQXNvTWRYSkdlNVVoZ0JxbXZ3RXVr?=
 =?utf-8?B?MVc0aE1EeUN1TWxYSkp2c0JoL0NBNjlCT0h2U2Jqc2lIelNQdWN1UWdiYlRW?=
 =?utf-8?B?SC9sZU1oNE8zQm9jVUlJYVlTMjFxNGk1K0p6K0tvb2o1Rjg3TnQ1a2REeWxo?=
 =?utf-8?B?T09jdVA5eFVBMWphQVNCKzRscWdCeWJsOHY5RGN5cXA2ejE1Vy9YL01Ic21Q?=
 =?utf-8?B?MU9XM1puWHJXbU9BeG43R253eG9LNHBmUG9XdzBwNkltMGxzZFJuV21XaHRq?=
 =?utf-8?B?TjFFdWQwWjhKdHBoQlhMb3VEZEtnTVcvbFQxKzhFSDlseXVyKzdUTHJvYmFp?=
 =?utf-8?B?a1c1blhmc2paWXNrdjZjRkdJU0NIOGFpVDhEY0c2RHdNMXFncDFkajc5RW1o?=
 =?utf-8?B?bjI4YlRRWlpYQ3Ntekt4MWxaWjlVZ2haeTNjNXBLWWdBR0lRWVVmeERIMjFm?=
 =?utf-8?B?UzJTYzRycnBaT1NGTTBXUGlUd21uNFBqd0xqSURuUlJOa2RyYlp6cFRiL2JS?=
 =?utf-8?B?VkkvR0wwRlk3WmVHMjFIcW0rTVNHTlMwZlRWdzFDYU03VWRoWUZ5M0V2ZU1u?=
 =?utf-8?B?czhzSitnWjRZVHJmcElKYnh2OW80dkZObUdxMTdWLzduUVF0aEQyRDIrbmpk?=
 =?utf-8?B?NmZ3OVJ1WGQxeWI2Y3orRkFDUUhnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2B1CC23DAF1C04DB7526A2D63E0D88F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dffa5e2-b34c-4d31-aec4-08dad618d2eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2022 16:58:53.2253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qI7O9H5NmOmoLFFz3nzw4piuIMZtIgaNTcglG/xvWeK5J6HBygei7E8vVFrcMDza8Ecs4NOtbUXReM8Pi4miY+HMQtMJaXtGnLMtesF9gzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2922
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjIgw6AgMDU6NTAsIEZhbmdydWkgU29uZyBhIMOpY3JpdMKgOg0KPiBP
biBNb24sIE5vdiAxNCwgMjAyMiBhdCA0OjQ2IFBNIEZhbmdydWkgU29uZyA8bWFza3JheUBnb29n
bGUuY29tPiB3cm90ZToNCj4+DQo+PiBPbiAyMDIyLTExLTE0LCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4+DQo+Pj4NCj4+PiBMZSAyOC8wOS8yMDIyIMOgIDA3OjI1LCBGYW5ncnVpIFNvbmcg
YSDDqWNyaXQgOg0KPj4+PiBPbiBTYXQsIFNlcCAxMCwgMjAyMiBhdCAxMjo1MyBBTSBGYW5ncnVp
IFNvbmcgPG1hc2tyYXlAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4gT24gMjAyMi0w
OC0zMCwgRmFuZ3J1aSBTb25nIHdyb3RlOg0KPj4+Pj4+IFRoZSBhY3R1YWwgaW50ZW50aW9uIGlz
IHRoYXQgbm8gZHluYW1pYyByZWxvY2F0aW9uIGV4aXN0cy4gSG93ZXZlciwgc29tZQ0KPj4+Pj4+
IEdOVSBsZCBwb3J0cyBwcm9kdWNlIHVubmVlZGVkIFJfKl9OT05FLiAoSWYgYSBwb3J0IGlzIG5v
dCBjYXJlIGVub3VnaCB0bw0KPj4+Pj4+IGRldGVybWluZSB0aGUgZXhhY3QgLnJlbFthXS5keW4g
c2l6ZSwgdGhlIHRyYWlsaW5nIHplcm9zIGJlY29tZSBSXypfTk9ORQ0KPj4+Pj4+IHJlbG9jYXRp
b25zLiBFLmcuIHBvd2VycGM2NGxlIGxkIGFzIG9mIDIuMzggaGFzIHRoZSBpc3N1ZSB3aXRoDQo+
Pj4+Pj4gZGVmY29uZmlnLikgUl8qX05PTkUgYXJlIGdlbmVyYWxseSBuby1vcCBpbiB0aGUgZHlu
YW1pYyBsb2FkZXJzLiBTbyBqdXN0DQo+Pj4+Pj4gaWdub3JlIHRoZW0uDQo+Pj4+Pj4NCj4+Pj4+
PiBXaXRoIHRoZSBjaGFuZ2UsIHdlIGNhbiByZW1vdmUgQVJDSF9SRUxfVFlQRV9BQlMuIEFSQ0hf
UkVMX1RZUEVfQUJTIGlzIGENCj4+Pj4+PiBiaXQgbWlzbm9tZXIgYXMgcG9ydHMgbWF5IGNoZWNr
IFJFTEFWRVRJVkUvR0xPQl9EQVQvSlVNUF9TTE9UIHdoaWNoIGFyZQ0KPj4+Pj4+IG5vdCBjYWxs
ZWQgImFic29sdXRlIHJlbG9jYXRpb25zIi4gKFRoZSBwYXRjaCBpcyBtb3RpdmF0ZWQgYnkgdGhl
IGFybTY0DQo+Pj4+Pj4gcG9ydCBtaXNzaW5nIFJfQUFSQ0g2NF9SRUxBVElWRS4pDQo+Pj4+Pj4N
Cj4+Pj4+PiBXaGlsZSBoZXJlLCByZXBsYWNlICJlZ3JlcCIgd2l0aCAiZ3JlcCIgYXMgImVncmVw
IiBpcyBkZXByZWNhdGVkIGluIEdOVQ0KPj4+Pj4+IGdyZXAgMy43Lg0KPj4+Pj4+DQo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogRmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+DQo+Pj4+Pj4g
LS0tDQo+Pj4+Pj4gWy4uLl0NCj4+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IFBpbmcuDQo+Pj4+DQo+Pj4+
IFBpbmdeMiA6KQ0KPj4+DQo+Pj4gQ2FuIHlvdSBleHBsYWluIHdoaWNoIEFSQ0hfUkVMX1RZUEVf
QUJTIGNhbiBiZSByZW1vdmVkIHdpdGggdGhpcyBjaGFuZ2UgPw0KPj4+IEhvdyBpcyB0aGUgdmVy
aWZpY2F0aW9uIGRvbmUgaWYgQVJDSF9SRUxfVFlQRV9BQlMgaXMgcmVtb3ZlZCA/DQo+Pg0KPj4g
QWxsIEFSQ0hfUkVMX1RZUEVfQUJTIHJlbG9jYXRpb24gdHlwZXMgY2FuIGJlIHJlbW92ZWQuIEFz
IGV4cGxhaW5lZCwgdGhlDQo+PiByZWFsIGludGVudGlvbiBpcyB0byBjaGVjayBubyBkeW5hbWlj
IHJlbG9jYXRpb24sIGFuZCB0aGlzIGlzIGRvbmUgYnkNCj4+IHRoZSBuZXcNCg0KV2VsbCwgdGhl
cmUgd2FzIGEgdHlwbyBpbiBteSBxdWVzdGlvbiwgSSB3YW50ZWQgdG8gYXNrICd3aHknLCBub3Qg
J3doaWNoJy4NCg0KPj4NCj4+ICAgICBjbWRfdmRzb19jaGVjayA9IGlmICQoUkVBREVMRikgLXJX
ICRAIHwgZ3JlcCAtdiBfTk9ORSB8IGdyZXAgLXEgIlJfXHcqXyI7IFwNCj4+DQo+PiBpbiB0aGlz
IHBhdGNoLg0KPj4NCj4+IGdyZXAgLXYgX05PTkUgaXMgdG8gd29yayBhcm91bmQgc29tZSBHTlUg
bGQgcG9ydHMgKGFuZCBsaWtlbHkgb2xkZXIgcmVsZWFzZXMNCj4+IG9mIHNvbWUgcG9ydHMgZXZl
biBpZiB0aGVpciBsYXRlc3QgdmVyc2lvbnMgYXJlIGZpeGVkKSB3aGljaCBwcm9kdWNlDQo+PiB1
bm5lZWRlZCBSXypfTk9ORSBkeW5hbWljIHJlbG9jYXRpb25zLg0KPiANCj4gUGluZyA6KQ0KDQpP
aywgdGhhdCBzZWVtcyB0byB3b3JrIG9uIHBvd2VycGMuDQoNClJldmlld2VkLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo=
