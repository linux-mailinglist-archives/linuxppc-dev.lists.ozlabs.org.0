Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3450055B7CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:48:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWcGb0kKJz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:48:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pGWZNTRn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.40; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pGWZNTRn;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90040.outbound.protection.outlook.com [40.107.9.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWcFs48PTz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:48:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekb2jO2TGz0bpRyOUCwW/JUNjOtOcdw6ZJuL1Itv4tDn02a8V3iisAvCs3eepxAQaqBX4BVqLcNtncrdONS6Y0Max1LsLlKNahmE8reBqeKYZanSBf5JHtpkrvR79Lujm8EeLYCzzejzlUiBizL7ILfw4IN9620E8ysNKJxLKVUPKKR8iFKThkWhWH0gsT8xgmHkcpmQAU0F4tCWnt+kgJ7/5Yr1/+jm+GyDJzAIsRCeFznu7HDhuaRPGyjI15EPiGFrmc09FYAe6eNzlJnyJGdo/G/jLXG1SVrdi95vUxhj0jCYm8Wx6XJsGwNXAjbRVzQr9sC2UIMMgJvTbYHsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1Q33phjBECCtetFkImhoykw5BTUIAQDmxJrl6FRRNI=;
 b=BnL/ozCE9LpIHZpr8e63VMncrMB3+qH61I5c3/ybP/r2MEjFb3wgNoVAE40XJCHjyAFXvmPT2kn2sX6PGjOUFCX6jzvBjgCn+xkNxgkorzOwf8MEU2ZzEjpUOTS4b0Wmei6w1G3kt3YjdWfezJ1SWbZA2ABrtuqaC2tmv44k69bFc26AYmv/RlXFSQxEiDnJLK2BqSGlRHxlCuGC8IKAaeSBdCIyl39vD6eQdJT88AAcMxwAgAoIIvCyb/Ud8M2AjV+PeWijJSn3t6HlYhmX+7k8hfo+VrUiS5bc3Ie2Jz/qz2jo818l38xq1eRio05e1NUkleP51DKKUo1IeTsdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1Q33phjBECCtetFkImhoykw5BTUIAQDmxJrl6FRRNI=;
 b=pGWZNTRnmLexpMa7Q/nqL+cJ8M93Hl0791x7PDWm4jDiKl5HbUb7WSlF3u5UUamYA4z0kygDA6/FdaedDDx1QGDItYJbQDnsnQQo370tqXwMYlgsvCVVeE4Ix/Cmrb4l/cEK4ss72f+Hs6eL9JnIU7Tv1f/S/Z6bZxLt4EomrMJquvmWQzQ+JLur6/EGLv9fX3wsZTJJS2TdJMDp/iQoqCfbgpSxE+4ZNyssBjEA4nNwu+THrpoHGP6GtQPU+QpED9Y5//breZIuoZXQPtEgnMo8GVZ3jB3Zu4mPdG88NKD6HX9Uyoj9doFWejyPFd4zNCzykwLwLKm3V6UNmts2FA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1617.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 05:47:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:47:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 01/26] mm/mmap: Build protect protection_map[] with
 __P000
Thread-Topic: [PATCH V4 01/26] mm/mmap: Build protect protection_map[] with
 __P000
Thread-Index: AQHYh4UJI5SazA4DbUS8logWIeWXuK1iw8qA
Date: Mon, 27 Jun 2022 05:47:42 +0000
Message-ID: <6d213700-9e7f-409a-3dc7-186eeae87099@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-2-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-2-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 627a2f02-a3ec-4244-2a4f-08da58008d5b
x-ms-traffictypediagnostic: MR1P264MB1617:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  FvpwNnecMqvEhKSRaF0JGfkPlXWTCIholoUWM1P8LBk4pQtufEdp7+/Tu8cO7uT1TPahAxV8v+UB//+aZu9iScjF7TAzKewVbvlThG2cO/N5MMUbLmdeG5VrYuFiUjc4xyFmWAtpXC8RaXEXDL6EEbEhLhU6QVh1VUi3Rt9Wy3pO2FA23VePBa6ejl3UlO5OE5JHX67vMMocOBOj6kAr2/fIxbfCAJjr3iAqg/T2YuWvYzMytjzWieT4yf0heKHl+xoQml6ampl4c6sCU6sG4yRsx+npjKVvLhvHxxK3f0Z1gtOyBONR0+tywoMfDpb0GPJrmxKeQ7cpRLYSk+1WgZAyZI1HjIK87STREoyuFfy0bPPfeH3FTNI8qBqrkp/WbQX1IivogUf18SRamJp8M0WF+ERPDuqT/nmJBjgJ74cBPtTEvD6JQxxbnEEdk7YJfxnC227f3/LMtKpIekZl0kmibfVFxqalt1Bdwv+xdmxkRuUufVfFC0OqCn8UpNZv8elBhZSV9L7tW9B3u9nuOjXwwNCJcBhK0KRrX4863FbShWeo2WXTDwAXv3vEj+BwpKoJXh9AUYrS4UabKz6TKzBWluxfr7Qw4TGzNNkoPdCTjLLrBpc948mU/803U0e9BpQDS5qvQIaSh+Z832naLYgL3yjwrKI0f44uBDnX08a7zkdZ+Hhdd3ViwWG2scve4KkdUbCmWFL6NT5sYaIdVLBgzjq8ajH9YC2Bii4FTqzHQVXvmeY4JDNhKiLFT0QWKRkGKojSYfUkH+yRzddujtSOEFWtdzz/b255ZJjZKdHO669QQiTHuifINxT59imkMGmHklceq63m3ykj/+p+rpoym9CmTPaxn6UxS2WiwWg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(36756003)(31696002)(86362001)(316002)(7416002)(2906002)(122000001)(54906003)(31686004)(110136005)(6512007)(6506007)(26005)(38070700005)(6486002)(66556008)(76116006)(4326008)(38100700002)(5660300002)(66476007)(66946007)(66446008)(8676002)(64756008)(71200400001)(2616005)(186003)(41300700001)(83380400001)(91956017)(44832011)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z29haGtUVTlwdlYvczUyVmREK0xXMnBFS1I2ZDcxWUZyRFBnM1FOQTlFdlBG?=
 =?utf-8?B?WlZERUVoUGhONXNJVmJYMzJiR2lsWjBsdTRXbmxseUxSdm1yNEYwK2xjUlZE?=
 =?utf-8?B?Q3ZTNmp5N1VUN2NxR2V3UmwrbEwxMngrUGVsTFhydm1GcXRsaTc1MC9WUVh5?=
 =?utf-8?B?a1BZOFdOYnV6WERjUUNFV1dXb2pEbUJvc0piZEp2dUZvVXphWWRWUVVuRGNn?=
 =?utf-8?B?MXh2YlYreGM4algycUpnblVFVGVsbCtScmo2RFpSbjRVNE9odTlTUHBMRGth?=
 =?utf-8?B?SFllMFRsVkRxdnJMaS9oZHRSZjNQZnZJRFh1bkJyRGlOQmJpd0hnNHBiTVFU?=
 =?utf-8?B?MDFlL2ZhUHlZeDdHNGE5ZlA2T29PZ3pycWVQRUNnVFo2QXFTSWtmc1h2b29l?=
 =?utf-8?B?b3doa2NMaXpWNWhKN0FTWWtJU0Y4RDZld2ZtZkZ3Vkh4dWtHcHAwN09PeXpK?=
 =?utf-8?B?Y1VkbGJlUkh5clB0ZUNUYjhpYU1DcmhYUVB3djFNZ2FxRjdRK0ZaS21IVTJ6?=
 =?utf-8?B?TTdxMlhRMFIrT1krU2JqNEZpc3ZoUzQxUExUa296YTl2NS9pVTliUFkxcVox?=
 =?utf-8?B?NjI4V0sxRFBEQSsyOCtTcXJYV0NIY096RUJrb3Y1K1ovZTZiU2p6OW9nSGo5?=
 =?utf-8?B?NXV1VVh4dEh2SUxKVDFVMXFOMGpmWVMrY0I0T2U2ditlUGs3WFdzWVcrYXF1?=
 =?utf-8?B?WjViLzVuZG5zaWJ4RkNKYThSbld6U2Zmb3hTd2ZjYm1POUZiNktxTTFIRjlz?=
 =?utf-8?B?VXE0Z2JQczBQa3lmK043Wm9yVXhxTnJaRFhvK3prK1M3MW1KNUI4S0VndTlp?=
 =?utf-8?B?Z0Y0ZEJLVnJQZGt3QzdkdHFHMHVxSWpkcmFOamxpaE1BdWtVeFZUUDRCcXV2?=
 =?utf-8?B?TStXdGU4a2d1bFVMNFV4dW8xYnVKb0VDdmw4dk96dXlGYTdEa2lvei94Vndw?=
 =?utf-8?B?QkFKN1NmOWtOQ252UkhGRFhOK25JWnJFWE9mdjZlbDV3R0ZwNVpkRjBRVnF4?=
 =?utf-8?B?d3FXR3htK3Y5ZDViV2R1OHNJZ05GNExSL2lZR2lON2J2YXBNT1pzS2JhVjY2?=
 =?utf-8?B?WGdTa2dpR1FYakdJTmdDN3pTZnl1NFBKUXR5SzV0QlZVSytBZkMwdlV1M3FM?=
 =?utf-8?B?TnhNb3VXVExLeTV6OHc5L1BRRW5qakZoeFV3WlZrckprWTRkczlkckdtSlpQ?=
 =?utf-8?B?WGRKcFhiKzVRMG1xWVVaaWtFVGVqRkZITlJxcGEwZy9RU3pxOG52RjhKT3pC?=
 =?utf-8?B?b1BPaFB1cGorSnpKb0ZRems2RzBCQ0JwYm90WHFtcXowU3dSZndhdkdVQnVF?=
 =?utf-8?B?NmF3eG0vOU8vZ1dTWTk5ODVQM0FUOG9zVVpMZlYyTDQrYWtNVC81SHlHT1FD?=
 =?utf-8?B?SFlOd1JSQmhJOXRUd1pJZXBSZ3RPcm9UOXFUeVBCOUdqQ29HZWU4UU91ZnZU?=
 =?utf-8?B?bHo5SERDM3VWdWVORzVhOGRHeTJvUWNaM2JILyszYWZ5K2pZa0dEU3c1UEJQ?=
 =?utf-8?B?RTN3YVpTSFNhUzM1TXNnSitodFc1Y1Fobjc2ZTdFdzJrb29tOGVDRi9CaE02?=
 =?utf-8?B?ejR4V2M3Y3RzbVl1dkdhdnhJSm9UU0tIaTMrWHEzeWpvb0wzdHBENTdxb2lQ?=
 =?utf-8?B?L1FLOExMckJuVjVaU2krS3dha3ZQR1FOc25Xak9VWkFmTHpXSlRRazRqOUJL?=
 =?utf-8?B?ZWpQdVVKZjFPSS9TMHRTZG0zdGdOOW44NjJNY2JhUUtWbUY0SjRPNlRXN1pD?=
 =?utf-8?B?MG1kK3lnblluTVZ3YThLT3M4OGZRK1BHOVYxajBOZHVNZ01icmNFNTN2TGcy?=
 =?utf-8?B?L3B3c0wvUnFOTktwWEM1WXN2RnAzcjZzQUxLNGJ1c3hLc0hhQjIyNnlGc3hY?=
 =?utf-8?B?djJEZ3RwMzFsOWx1aTVWOU9nZmx0a1NIOGFHcVA5SWo3bkNQSEFRbDJNWjg5?=
 =?utf-8?B?VGIxdlFJVTA2WFpnbU50NVJnWENRVmp3YmJsbW1ZVFBvL2pCVjY2R0tQYVEz?=
 =?utf-8?B?Nk5lY0pSazBXS2libXcwbWRac0hrVGw1NDlXRmJZSVdzaWVhbG9LZVVNOE9u?=
 =?utf-8?B?ZUJERENNUENWaDFGNXVKTHZaMVN3RmpmbHk4cElTTG5ON0x3RGQzMHh4ME5E?=
 =?utf-8?B?NXdFUXRqbldNSXo5UmJ4V0xzZWtuNFlZaFlhT2hFWFRqbXplNjB6M2hRUm9o?=
 =?utf-8?Q?3iKYOjTFDWBgsTwSf39vo00=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A29F3570E7FDF74DB67B48A483FC2F0E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 627a2f02-a3ec-4244-2a4f-08da58008d5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:47:42.0684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hE62QeN2RLuUqEHkHoanaJmzM/T2gj9KkWRc/pL8hdtx6yzO5xhFyqyMlx0OeS5mbtKOqglLf7RzE0FGUOp+nBGUJNjupF3I9Uw3X7rdGTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1617
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-snps
 -arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IEJ1aWxkIHByb3RlY3QgZ2VuZXJpYyBwcm90ZWN0aW9uX21hcFtdIGFycmF5IHdpdGggX19Q
MDAwLCBzbyB0aGF0IGl0IGNhbiBiZQ0KPiBtb3ZlZCBpbnNpZGUgYWxsIHRoZSBwbGF0Zm9ybXMg
b25lIGFmdGVyIHRoZSBvdGhlci4gT3RoZXJ3aXNlIHRoZXJlIHdpbGwgYmUNCj4gYnVpbGQgZmFp
bHVyZXMgZHVyaW5nIHRoaXMgcHJvY2Vzcy4gQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BS
T1QgY2Fubm90DQo+IGJlIHVzZWQgZm9yIHRoaXMgcHVycG9zZSBhcyBvbmx5IGNlcnRhaW4gcGxh
dGZvcm1zIGVuYWJsZSB0aGlzIGNvbmZpZyBub3cuDQo+IA0KPiBDYzogQW5kcmV3IE1vcnRvbiA8
YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZw0KPiBD
YzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWdnZXN0ZWQtYnk6IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gU2lnbmVkLW9mZi1ieTog
QW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+DQoNClJldmlld2Vk
LWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4g
LS0tDQo+ICAgaW5jbHVkZS9saW51eC9tbS5oIHwgMiArKw0KPiAgIG1tL21tYXAuYyAgICAgICAg
ICB8IDIgKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaA0KPiBpbmRl
eCBiYzhmMzI2YmUwY2UuLjQ3YmZlMDM4ZDQ2ZSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51
eC9tbS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaA0KPiBAQCAtNDI0LDcgKzQyNCw5IEBA
IGV4dGVybiB1bnNpZ25lZCBpbnQga29ianNpemUoY29uc3Qgdm9pZCAqb2JqcCk7DQo+ICAgICog
bWFwcGluZyBmcm9tIHRoZSBjdXJyZW50bHkgYWN0aXZlIHZtX2ZsYWdzIHByb3RlY3Rpb24gYml0
cyAodGhlDQo+ICAgICogbG93IGZvdXIgYml0cykgdG8gYSBwYWdlIHByb3RlY3Rpb24gbWFzay4u
DQo+ICAgICovDQo+ICsjaWZkZWYgX19QMDAwDQo+ICAgZXh0ZXJuIHBncHJvdF90IHByb3RlY3Rp
b25fbWFwWzE2XTsNCj4gKyNlbmRpZg0KPiAgIA0KPiAgIC8qDQo+ICAgICogVGhlIGRlZmF1bHQg
ZmF1bHQgZmxhZ3MgdGhhdCBzaG91bGQgYmUgdXNlZCBieSBtb3N0IG9mIHRoZQ0KPiBkaWZmIC0t
Z2l0IGEvbW0vbW1hcC5jIGIvbW0vbW1hcC5jDQo+IGluZGV4IDYxZTYxMzVjNTRlZi4uYjAxZjAy
ODBiZGEyIDEwMDY0NA0KPiAtLS0gYS9tbS9tbWFwLmMNCj4gKysrIGIvbW0vbW1hcC5jDQo+IEBA
IC0xMDEsNiArMTAxLDcgQEAgc3RhdGljIHZvaWQgdW5tYXBfcmVnaW9uKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLA0KPiAgICAqCQkJCQkJCQl3OiAobm8pIG5vDQo+ICAgICoJCQkJCQkJCXg6ICh5ZXMp
IHllcw0KPiAgICAqLw0KPiArI2lmZGVmIF9fUDAwMA0KPiAgIHBncHJvdF90IHByb3RlY3Rpb25f
bWFwWzE2XSBfX3JvX2FmdGVyX2luaXQgPSB7DQo+ICAgCVtWTV9OT05FXQkJCQkJPSBfX1AwMDAs
DQo+ICAgCVtWTV9SRUFEXQkJCQkJPSBfX1AwMDEsDQo+IEBAIC0xMTksNiArMTIwLDcgQEAgcGdw
cm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdIF9fcm9fYWZ0ZXJfaW5pdCA9IHsNCj4gICAJW1ZNX1NI
QVJFRCB8IFZNX0VYRUMgfCBWTV9XUklURV0JCT0gX19TMTEwLA0KPiAgIAlbVk1fU0hBUkVEIHwg
Vk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JPSBfX1MxMTENCj4gICB9Ow0KPiArI2VuZGlm
DQo+ICAgDQo+ICAgI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAg
IHBncHJvdF90IHZtX2dldF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncyk=
