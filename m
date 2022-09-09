Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A45B33AD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 11:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP9Ym1Wbkz3bhf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 19:24:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Sv9y5MWK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP9Xy1FYjz2xBl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:24:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Sv9y5MWK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MP9Xs2Mxvz4xG8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:23:57 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4MP9Xs2J6rz4xY8; Fri,  9 Sep 2022 19:23:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.87; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Sv9y5MWK;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90087.outbound.protection.outlook.com [40.107.9.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4MP9Xq2VdFz4xG8
	for <linuxppc-dev@ozlabs.org>; Fri,  9 Sep 2022 19:23:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNB+OL3a39EOB+RgNw8KO232yYgmOYk4bJUuIp6I/SDhx4KPpQyZA5iADOvgin6OiucpANFpxTOKQpUzaWVRjsH3i8WClJVvZFMVYFMeWNBnP4wr0b0DaDD74eZL1fKrb1F9CtclibsMCQR5V2Rh5L2yXxDe+fGDw93G2x/sQuy+cEapLOXcogDbZRNjF/i6n4gLj2bORm9n6Rn3W3aukFwQ4NpiRMoC6C86w7Dh1XdtHcsgxXFFRH9M4F+OrAcBFgmFFn7MFo+OIcxMDebudPDkL2BUDWrCWdZMUl5o85J28uxUtSAgr9bfRCC+26dVUmU7r26WKPN4jOjxQG2mNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d9eh1hei4FAB9kymIlNnHV3ttCYleKmecSrFcLj+y8=;
 b=GkbONAw34buzVonGPBQop2hReg79zGQwkyMbm0N70H6vKQfsUHZfJG1KF40cU9MIjh79C2O2OIbsr22AJQupLi6Uv/8tIgs+WCUI21cpj+fhs0Jhr2+UAR8NN8NyGfqepcI8F1c+NVS1CNmAhhOEj++B01EsdEsSz0aowMcaus3D7WNwNllvTEkgJkatxurYneT/y9lNIokJX7P+P2Na20N6hacRgVCac8sSDCTv9Z5kpLWAZqvvpsruMxcr5nPlh+aO7kUTjMVs/Ur49mLwxDQ+22ejVxfgJplHwd+DTXJyEjLDJe6cSx4Ec5LFFHFqewSfhNCUHiVOsL+9v3jkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d9eh1hei4FAB9kymIlNnHV3ttCYleKmecSrFcLj+y8=;
 b=Sv9y5MWKAwTKi01wuVEV72atN8YqVGvKW65SWWLqaHoagstRztNN7Db/jzvDlAImE98nP0oyYjTlcy4s4U4KPJWjEEUJdPWDgM4yTi5vHgTfEF/4mWa+VupTE2ukcY8GTCr5kjDBS0jK7tI6kGDHiiGsgprqvTUUSfyFH8MQu/9LW+2bidK7Wsh+bkUIZ/6oa0l6SS6+uhDhV8x/swFM/m41buB7JZOyq1uUArXhfHDVZig6OtVTeJoegsMB8z26egBkGf+68Eqt82n6GRxeYUwF9fcD9oQse6ubG/SUUXi/2pYggx0o3WgPPJXjzJnwjwAdI4BGUtgD2WDBUaAdRA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15; Fri, 9 Sep
 2022 09:23:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 09:23:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Russell King
	<linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Peter Chen <peter.chen@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mike
 Rapoport <rppt@linux.ibm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	Masahiro Yamada <masahiroy@kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH 6/6] init/Kconfig: remove confusing config EMBEDDED
Thread-Topic: [PATCH 6/6] init/Kconfig: remove confusing config EMBEDDED
Thread-Index: AQHYw2/pGxYbgfPSk0+djbz0q5RXjq3W1NsA
Date: Fri, 9 Sep 2022 09:23:48 +0000
Message-ID: <ca25a32d-aadb-f0d0-9e24-70fbabc4d377@csgroup.eu>
References: <20220908104337.11940-1-lukas.bulwahn@gmail.com>
 <20220908104337.11940-7-lukas.bulwahn@gmail.com>
In-Reply-To: <20220908104337.11940-7-lukas.bulwahn@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3145:EE_
x-ms-office365-filtering-correlation-id: f76df87a-5515-4fec-4cee-08da924500aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  c+Fx23TCLWg03k7bOXDjlr02RKL4ithZ+/cZSo6JJFZPHy8My2AjNEJ+Gi4oVv8UEOjvZTVRZdmwvxZ4gJV4k/viKCPeG6DA1ZTRiv47+1B70xSnWluWC3RYw2KoYGfDEmpcexdaCrpsCA64y75/Z3dLBi5FTNGHuKIVDfeAGIwSfNgjNNA9uSaSokMN9cZ97dDV3sQffrCftwOLgk+ZbIvqeZZzMJLVj82DHqxi9vsfrOKQTyBTNoJDogiNj1i3mDTuV8wVJcQ7sKrDU8X4wQufJf0GwBQIfLr7EiXqL/kCQY0D444SVVsxo9DLE2yYjddDyN2SJw3ZUB5MU/dMHeJB/3mqrkyVWLy2oGLg3P3Ai0iW1Wvgv2JLdX+lRqLlOqVC6XBrZOfezIPIpsD7sHAE6NwSKZ2cwz/9YVNPTkXJlk7f3poyEgmba2m/7mRrdP/P4I9R61OVx+DDQCHhSTnbKL7160RYhc8hCoL+sMJofckEBi4H/6Cp6fFLCfDGPXryCU4g8IHePMikh6FI/VpKw7h8qrOHJQP3xyMyOjKXLYn6twWu4rw2SntpyHdpE+1zsN3j6+ld/l4GnTQQ+EkqOyn5pVMIxGlzbLyzsHFl1Vzrk9xUnhpZomCprExbwKWaBbwqTX8k9KyDB9y5T/O0wYdNBL4dgvqKl1UV7HAaoEwbE2+UpAokWCZkPWH96FdonTC+l47JQd4Hg9jngq80gmhV50EYewmVKzTPPiKGjR/zoYa7vTQRP542q21kv7dwd87gjIQN9XmOcQc9x8R2dHVT1ovEJSAJIjSGypTHYi3asDTFKDijqhVdXzcq8VgpahlzBUXLb9LKHjIKZYXSNPtn+U2QQZ3hlku5P+Y=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(31686004)(921005)(38070700005)(2906002)(6512007)(44832011)(7416002)(5660300002)(6506007)(26005)(36756003)(71200400001)(8676002)(41300700001)(2616005)(66476007)(6486002)(8936002)(86362001)(122000001)(54906003)(186003)(110136005)(76116006)(66946007)(38100700002)(478600001)(91956017)(4326008)(316002)(66574015)(66556008)(64756008)(66446008)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QnYyaC9nUDk4ZEhYR1crczRnREpQRmRGWHRqTlF3dWkyT3A3RW54QzJaQkV6?=
 =?utf-8?B?eXJ4M1NnZGRzUkdYL1lpRHRaYzcvYVc3VFVTSmhzNE9icEwzU09EWk5hdXZU?=
 =?utf-8?B?RXpOWDlWaUR3QnRaVHVGVkp0QW1pQUU1OFN0WiszeHRhUS96aXFzSllwNmZ4?=
 =?utf-8?B?a2RZUDNudC9GM2F1VTZaR21kMldjdlRFOWVjMUdIODc5UlhUUXpvVGVYcWhC?=
 =?utf-8?B?MU0ySHQ5Y0ZHZS81NEJlZXlzU0Rxb1dtM1FlMkFjNjFQNzRSYkVjNllXRUFz?=
 =?utf-8?B?aWp5dENBUGYvdStqelNkOXU1UHN1b0M4RkdIWVJRQW9PNGVtNklJTlcyUUYx?=
 =?utf-8?B?N2tGV2loYVNVd1BlZXQ1ejZLa0tsSTZwaFY5T2dqd2VTZDVyWVg5dlNMcFRl?=
 =?utf-8?B?U3ZPTkFqUGRHN24xL3hVNjdYNzRaTWwwaG5pUys2Sko3bUU5eWxEOTNUSDJi?=
 =?utf-8?B?ZXRpaDh2cGU1bEtDZ2pXZDhwZFgvR3BLTWMwZ0lYd1VmQ0FZOWNWRC9vU1BK?=
 =?utf-8?B?RzVUMUpHM0lsV1FWNndLd3RRRTRLZVc1cnZpUWpRUWtucVJVdE1zdXRsS1Bz?=
 =?utf-8?B?cGdEakhVZXRNMjQzRC94MG51TnVGTkZoVkxmcTRrR1BjWXp6c1ZwdzJqMGJ3?=
 =?utf-8?B?WWJrQUJCK3MyMmNXaGRKdW0vVkhucUZzWUQxWUxwRzZhWnBEQ1hjeTRqQ2Zn?=
 =?utf-8?B?M3hNdW4rdjY5UWpncWROMktwWFkyeTNCWDFVdi9xZkN0cVB3MzY5djFGTEFT?=
 =?utf-8?B?MGsxTGdwMHVqS0FBZXJHTWllREZxMng0Tnp0UTlTSlR4SDlqWjU3V3M3WWhj?=
 =?utf-8?B?Vmlna0RBMFcwNTFua25zSjEvdTN0d2x2a1pUUUF5T0RTSFErUmd4bTVLOWx0?=
 =?utf-8?B?L0Y2ZDJnUjh3SS95SHBzUGFxRXpOdVRyUGk5SUhHdzU3QThpRWJETlhxUnhK?=
 =?utf-8?B?bGtrR1hUN2dBazd5SlgzUjV1by9FOGtMTGJoR3JLTDU4VGIxa1RDRVRKQk9R?=
 =?utf-8?B?RkxTWmJUQ0hDNFZ1YS9hVURERkRLTnU4dmJBVHBpOS9MUmlUd1lYQmFhVnJK?=
 =?utf-8?B?L2xZOUdIYjgxMXRmQXBhVkRYOXFzN2RCUUVZRG9UVmtNd25tbERNUld6NnUy?=
 =?utf-8?B?QnZrR0RUVWJhY3NZcGxvQnROK3E3VTZ6Z3dmYlR5TmNDa1J2M2hDU2dWd2JY?=
 =?utf-8?B?MXZBRDkyOTVsbEQ5UGtIYWxYbW9oeFo4aFNtQlJkT0dwMTBTd0M1RzlJM045?=
 =?utf-8?B?NW9qaE8wT3YyZkQyY3BLMGNqaDFzWUE1MnBCQXFCUlJhbEJNMElTc29nSFJv?=
 =?utf-8?B?Q0NFZUs0b1hLNlNWVzVzZ3htTzJYUURQclhKLzdQVkVzSEthSWJmeUFvOEpU?=
 =?utf-8?B?SnBpMVJGZEwycE5QbHAyb0FJcitzWkxKbHEwbFRKd05ETlJ0MHBYallCeEVI?=
 =?utf-8?B?aGRzMkNJMEhwakFtUlhqYjFkNHZvaWUyM2Jpemd5Z3dCUGpweHc3N2liNCtX?=
 =?utf-8?B?cHdGaTVCdWc1TTBLUmhDcTVjSHZDcFl4bG4xS0VobGRyaXJkNTc3V3Zibllh?=
 =?utf-8?B?TWM0blBkUHZmSElFMUFuWjRnZys2djF0WEI1UGRhL2VNOVE4QW5XV2JuWi9x?=
 =?utf-8?B?N056TmE5N2pkdFB2UFhHTHlVejI2YVQwNkVIdUxrZTNxcjZKWWFIS0dOVkxV?=
 =?utf-8?B?RWZ2d0trdkFPNzVqeWswWHk2WVNMNFR3MWsvTHVzaG1XalE1bG5uNjJqSFQv?=
 =?utf-8?B?TXNJdDAwRXo0QWxpd0ZJZGsxeFJSYUFPcGE3SjJ2KzU4Zm4rTndndjhuZVpV?=
 =?utf-8?B?KzhOeHlVQUZPK1pGSWtyMFBYZkhxMUVYb2xpallpYWlmdnRRdlZLQ1p6aWR1?=
 =?utf-8?B?S3pZRE9EMkVoNCtIaFZJeWhHUmV0djNLTzgrdWtySXJpTlM5TUpBVGJEUVZx?=
 =?utf-8?B?TEVueHhwb3FFc3B6bkV1NUNHVjRZSE9EK09kWHFldHhBc0xRb3NEcWx2Tmdk?=
 =?utf-8?B?VHZGOG9hYXpJS2NsQlRUbUNKKzZ1ZzJjZ2lTK1A1Sks4eVdJazJnT1V4NFVH?=
 =?utf-8?B?K1ZWWW5uODhaMm1oUk9UQ1MxQVJaRW5MVnZ2SmwxR3hyYUxCZFJ4NDhpWThy?=
 =?utf-8?B?TXNLempBZ0xod2s2RWlwcFAweGNrc1ZIZFN6K3RRZ254VFZoSmJST0NoOCtV?=
 =?utf-8?Q?yDiFgAfvExXUfR44FLS6PAs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F339ED2C96FECF42BAC28C46A6C34E4A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f76df87a-5515-4fec-4cee-08da924500aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 09:23:48.7437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s0rmBYBeHdtkLYh8Q9bqqbJvd21NVwFiSuYErSsSxG8Y1IUksAfIMo4KcKpGP+vEFi9WOIe3cm1LL/gzMc+IKdAlCfv2LUfFxGn0ZTYguIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3145
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KyBsaW51eHBwYy1kZXYNCg0KTGUgMDgvMDkvMjAyMiDDoCAxMjo0MywgTHVrYXMgQnVsd2FobiBh
IMOpY3JpdMKgOg0KPiBDb21taXQgNmExMDhhMTRmYTM1ICgia2NvbmZpZzogcmVuYW1lIENPTkZJ
R19FTUJFRERFRCB0byBDT05GSUdfRVhQRVJUIikNCj4gaW50cm9kdWNlcyBDT05GSUdfRVhQRVJU
IHRvIGNhcnJ5IHRoZSBwcmV2aW91cyBpbnRlbnQgb2YgQ09ORklHX0VNQkVEREVEDQo+IGFuZCBq
dXN0IGdpdmVzIHRoYXQgaW50ZW50IGEgbXVjaCBiZXR0ZXIgbmFtZS4gVGhhdCBoYXMgYmVlbiBj
bGVhcmx5IGEgZ29vZA0KPiBhbmQgbG9uZyBvdmVyZHVlIHJlbmFtaW5nLCBhbmQgaXQgaXMgY2xl
YXJseSBhbiBpbXByb3ZlbWVudCB0byB0aGUga2VybmVsDQo+IGJ1aWxkIGNvbmZpZ3VyYXRpb24g
dGhhdCBoYXMgc2hvd24gdG8gaGVscCBtYW5hZ2luZyB0aGUga2VybmVsIGJ1aWxkDQo+IGNvbmZp
Z3VyYXRpb24gaW4gdGhlIGxhc3QgZGVjYWRlLg0KPiANCj4gSG93ZXZlciwgcmF0aGVyIHRoYW4g
YnJhdmVseSBhbmQgcmFkaWNhbGx5IGp1c3QgZGVsZXRpbmcgQ09ORklHX0VNQkVEREVELA0KPiB0
aGlzIGNvbW1pdCBnaXZlcyBDT05GSUdfRU1CRURERUQgYSBuZXcgaW50ZW5kZWQgc2VtYW50aWNz
LCBidXQga2VlcHMgaXQNCj4gb3BlbiBmb3IgZnV0dXJlIGNvbnRyaWJ1dG9ycyB0byBpbXBsZW1l
bnQgdGhhdCBpbnRlbmRlZCBzZW1hbnRpY3M6DQo+IA0KPiAgICAgIEEgbmV3IENPTkZJR19FTUJF
RERFRCBvcHRpb24gaXMgYWRkZWQgdGhhdCBhdXRvbWF0aWNhbGx5IHNlbGVjdHMNCj4gICAgICBD
T05GSUdfRVhQRVJUIHdoZW4gZW5hYmxlZCBhbmQgY2FuIGJlIHVzZWQgaW4gdGhlIGZ1dHVyZSB0
byBpc29sYXRlDQo+ICAgICAgb3B0aW9ucyB0aGF0IHNob3VsZCBvbmx5IGJlIGNvbnNpZGVyZWQg
Zm9yIGVtYmVkZGVkIHN5c3RlbXMgKFJJU0MNCj4gICAgICBhcmNoaXRlY3R1cmVzLCBTTE9CLCBl
dGMpLg0KPiANCj4gU2luY2UgdGhlbiwgdGhpcyBDT05GSUdfRU1CRURERUQgaW1wbGljaXRseSBo
YWQgdHdvIHB1cnBvc2VzOg0KPiANCj4gICAgLSBJdCBjYW4gbWFrZSBldmVuIG1vcmUgb3B0aW9u
cyB2aXNpYmxlIGJleW9uZCB3aGF0IENPTkZJR19FWFBFUlQgbWFrZXMNCj4gICAgICB2aXNpYmxl
LiBJbiBvdGhlciB3b3JkcywgaXQgbWF5IGludHJvZHVjZSBhbm90aGVyIGxldmVsIG9mIGVuYWJs
aW5nIHRoZQ0KPiAgICAgIHZpc2liaWxpdHkgb2YgY29uZmlndXJhdGlvbiBvcHRpb25zOiBhbHdh
eXMgdmlzaWJsZSwgdmlzaWJsZSB3aXRoDQo+ICAgICAgQ09ORklHX0VYUEVSVCBhbmQgdmlzaWJs
ZSB3aXRoIENPTkZJR19FTUJFRERFRC4NCj4gDQo+ICAgIC0gU2V0IGNlcnRhaW4gZGVmYXVsdCB2
YWx1ZXMgb2Ygc29tZSBjb25maWd1cmF0aW9ucyBkaWZmZXJlbnRseSwNCj4gICAgICBmb2xsb3dp
bmcgdGhlIGFzc3VtcHRpb24gdGhhdCBjb25maWd1cmluZyBhIGtlcm5lbCBidWlsZCBmb3IgYW4N
Cj4gICAgICBlbWJlZGRlZCBzeXN0ZW0gZ2VuZXJhbGx5IHN0YXJ0cyB3aXRoIGEgZGlmZmVyZW50
IHNldCBvZiBkZWZhdWx0IHZhbHVlcw0KPiAgICAgIGNvbXBhcmVkIHRvIGtlcm5lbCBidWlsZHMg
Zm9yIGFsbCBvdGhlciBraW5kIG9mIHN5c3RlbXMuDQo+IA0KPiBDb25zaWRlcmluZyB0aGUgZmly
c3QgcHVycG9zZSwgYXQgdGhlIHBvaW50IGluIHRpbWUgd2hlcmUgQ09ORklHX0VNQkVEREVEDQo+
IHdhcyByZW5hbWVkIHRvIENPTkZJR19FWFBFUlQsIENPTkZJR19FWFBFUlQgYWxyZWFkeSBtYWRl
IDEzMCBtb3JlIG9wdGlvbnMNCj4gYmVjb21lIHZpc2libGUgdGhyb3VnaG91dCBhbGwgZGlmZmVy
ZW50IG1lbnVzIGZvciB0aGUga2VybmVsIGNvbmZpZ3VyYXRpb24uDQo+IE92ZXIgdGhlIGxhc3Qg
ZGVjYWRlLCB0aGlzIGhhcyBncmFkdWFsbHkgaW5jcmVhc2VkLCBzbyB0aGF0IGN1cnJlbnRseSwg
d2l0aA0KPiBDT05GSUdfRVhQRVJULCByb3VnaGx5IDE3MCBtb3JlIG9wdGlvbnMgYmVjb21lIHZp
c2libGUgdGhyb3VnaG91dCBhbGwNCj4gZGlmZmVyZW50IG1lbnVzIGZvciB0aGUga2VybmVsIGNv
bmZpZ3VyYXRpb24uIEluIGNvbXBhcmlzb24sIGN1cnJlbnRseSB3aXRoDQo+IENPTkZJR19FTUJF
RERFRCBlbmFibGVkLCBqdXN0IHNldmVuIG1vcmUgb3B0aW9ucyBhcmUgdmlzaWJsZSwgb25lIGlu
IHg4NiwNCj4gb25lIGluIGFybSwgYW5kIGZpdmUgZm9yIHRoZSBDaGlwSWRlYSBIaWdoc3BlZWQg
RHVhbCBSb2xlIENvbnRyb2xsZXIuDQo+IA0KPiBBcyB0aGUgbnVtYmVycyBzdWdnZXN0LCB0aGVz
ZSB0d28gbGV2ZWxzIG9mIGVuYWJsaW5nIHRoZSB2aXNpYmlsaXR5IG9mIGV2ZW4NCj4gbW9yZSBj
b25maWd1cmF0aW9uIG9wdGlvbnMtLS1iZXlvbmQgd2hhdCBDT05GSUdfRVhQRVJUIGVuYWJsZXMt
LS1uZXZlcg0KPiBldm9sdmVkIHRvIGEgZ29vZCBzb2x1dGlvbiBpbiB0aGUgbGFzdCBkZWNhZGUu
IEluIG90aGVyIHdvcmRzLCB0aGlzDQo+IGFkZGl0aW9uYWwgbGV2ZWwgb2YgdmlzaWJpbGl0eSBv
ZiBjb25maWd1cmF0aW9uIG9wdGlvbiB3aXRoIENPTkZJR19FTUJFRERFRA0KPiBjb21wYXJlZCB0
byBDT05GSUdfRVhQRVJUIGhhcyBzaW5jZSBpdHMgaW50cm9kdWN0aW9uIG5ldmVyIGJlY29tZSBy
ZWFsbHkNCj4gdmFsdWFibGUuIEl0IHJlcXVpcmVzIHF1aXRlIHNvbWUgaW52ZXN0aWdhdGlvbiB0
byBhY3R1YWxseSB1bmRlcnN0YW5kIHdoYXQNCj4gaXMgYWRkaXRpb25hbGx5IHZpc2libGUgYW5k
IGl0IGRvZXMgbm90IGRpZmZlciBzaWduaWZpY2FudGx5IGluIGNvbXBsZXhpdHkNCj4gY29tcGFy
ZWQgdG8ganVzdCBlbmFibGluZyBDT05GSUdfRVhQRVJULiBUaGlzIENPTkZJR19FTUJFRERFRC0t
LW9yIGFueQ0KPiBvdGhlciBjb25maWcgdG8gc2hvdyBtb3JlIGRldGFpbGVkIG9wdGlvbnMgYmV5
b25kIENPTkZJR19FWFBFUlQtLS1pcw0KPiB1bmxpa2VseSB0byBiZSB2YWx1YWJsZSB1bmxlc3Mg
c29tZWJvZHkgcHV0cyBzaWduaWZpY2FudCBlZmZvcnQgaW4NCj4gaWRlbnRpZnlpbmcgaG93IHN1
Y2ggdmlzaWJpbGl0eSBvcHRpb25zIGNhbiBiZSBwcm9wZXJseSBzcGxpdCBhbmQgY3JlYXRpbmcN
Cj4gY2xlYXIgY3JpdGVyaWEsIHdoZW4gc29tZSBjb25maWcgb3B0aW9uIGlzIHZpc2libGUgd2l0
aCBDT05GSUdfRVhQRVJUIGFuZA0KPiB3aGVuIHNvbWUgY29uZmlnIG9wdGlvbiBpcyB2aXNpYmxl
IG9ubHkgd2l0aCBzb21lIGZ1cnRoZXIgb3B0aW9uIGVuYWJsZWQNCj4gYmV5b25kIENPTkZJR19F
WFBFUlQsIHN1Y2ggYXMgQ09ORklHX0VNQkVEREVEIGF0dGVtcHRlZCB0byBkby4gRm9yIG5vdywg
aXQNCj4gaXMgbXVjaCBtb3JlIHJlYXNvbmFibGUgdG8gc2ltcGx5IG1ha2UgdGhvc2UgYWRkaXRp
b25hbCBzZXZlbiBvcHRpb25zIHRoYXQNCj4gdmlzaWJsZSB3aXRoIENPTkZJR19FTUJFRERFRCwg
dmlzaWJsZSB3aXRoIENPTkZJR19FWFBFUlQsIGFuZCB0aGVuIHJlbW92ZQ0KPiBDT05GSUdfRU1C
RURERUQuIElmIGFueW9uZSBzcGVuZHMgc2lnbmlmaWNhbnQgZWZmb3J0IGluIHN0cnVjdHVyaW5n
IHRoZQ0KPiB2aXNpYmlsaXR5IG9mIGNvbmZpZyBvcHRpb25zLCB0aGV5IG1heSByZS1pbnRyb2R1
Y2Ugc3VpdGFibGUgbmV3IGNvbmZpZw0KPiBvcHRpb25zIHNpbXBseSBhcyB0aGV5IHNlZSBmaXQu
DQo+IA0KPiBIZW5jZSwgYWxsIHVzZXMgb2YgQ09ORklHX0VNQkVEREVEIGhhdmUgYmVlbiByZXBs
YWNlZCB3aXRoIENPTkZJR19FWFBFUlQuDQo+IA0KPiBDb25zaWRlcmluZyB0aGUgc2Vjb25kIHB1
cnBvc2UsIG5vdGUgdGhhdCBhbHJlYWR5IHByb2JhYmx5IGFyZ3VpbmcgdGhhdCBhDQo+IGtlcm5l
bCBidWlsZCBmb3IgYW4gZW1iZWRkZWQgc3lzdGVtIHdvdWxkIGNob29zZSBzb21lIHZhbHVlcyBk
aWZmZXJlbnRseSBpcw0KPiBhbHJlYWR5IHRyaWNreTogdGhlIHNldCBvZiBlbWJlZGRlZCBzeXN0
ZW1zIHdpdGggTGludXgga2VybmVscyBpcyBhbHJlYWR5DQo+IHF1aXRlIGRpdmVyc2UuIE1hbnkg
ZW1iZWRkZWQgc3lzdGVtIGhhdmUgcG93ZXJmdWwgQ1BVcyBhbmQgaXQgd291bGQgbm90IGJlDQo+
IGNsZWFyIHRoYXQgYWxsIGVtYmVkZGVkIHN5c3RlbXMganVzdCBvcHRpbWl6ZSB0b3dhcmRzIG9u
ZSBzcGVjaWZpYyBhc3BlY3QsDQo+IGUuZy4sIGEgc21hbGxlciBrZXJuZWwgaW1hZ2Ugc2l6ZS4g
U28sIGl0IGlzIHVuY2xlYXIgaWYgc3RhcnRpbmcgd2l0aCAib25lDQo+IHNldCBvZiBkZWZhdWx0
IGNvbmZpZ3VyYXRpb24iIHRoYXQgaXMgaW5kdWNlZCBieSBDT05GSUdfRU1CRURERUQgaXMgYSBn
b29kDQo+IG9mZmVyIGZvciBkZXZlbG9wZXJzIGNvbmZpZ3VyaW5nIHRoZWlyIGtlcm5lbHMuDQo+
IA0KPiBBbHNvLCB0aGUgZGlmZmVyZW5jZXMgb2YgbmVlZGVkIHVzZXItc3BhY2UgZmVhdHVyZXMg
aW4gYW4gZW1iZWRkZWQgc3lzdGVtDQo+IGNvbXBhcmVkIHRvIGEgbm9uLWVtYmVkZGVkIHN5c3Rl
bSBhcmUgcHJvYmFibHkgZGlmZmljdWx0IG9yIGV2ZW4gaW1wb3NzaWJsZQ0KPiB0byBuYW1lIGlu
IHNvbWUgZ2VuZXJpYyB3YXkuDQo+IA0KPiBTbyBpdCBpcyBub3Qgc3VycHJpc2luZyB0aGF0IGlu
IHRoZSBsYXN0IGRlY2FkZSBoYXJkbHkgYW55b25lIGhhcw0KPiBjb250cmlidXRlZCBjaGFuZ2Vz
IHRvIG1ha2Ugc29tZXRoaW5nIGRlZmF1bHQgZGlmZmVyZW50bHkgaW4gY2FzZSBvZg0KPiBDT05G
SUdfRU1CRURERUQ9eS4NCj4gDQo+IEluIHY2LjAtcmM0LCBTRUNSRVRNRU0gaXMgdGhlIG9ubHkg
Y29uZmlnIHN3aXRjaGVkIG9mZiBpZg0KPiBDT05GSUdfRU1CRURERUQ9eS4gVGhhdCBvbmUgdXNl
IHdhcyByZW1vdmVkIGFzIHdlbGwsIFNFQ1JFVE1FTSB3YXMgbWFkZQ0KPiBjb25maWd1cmFibGUg
YXQgYnVpbGQgdGltZSBieSBleHBlcnRzIHVzaW5nIG1lbnVjb25maWcgaW5zdGVhZC4NCj4gDQo+
IEFzIHRoZXJlIGFyZSBubyBmdXJ0aGVyIHVzZXMgb2YgQ09ORklHX0VNQkVEREVEIGFuZCBDT05G
SUdfRU1CRURERUQgbmV2ZXINCj4gbGl2ZWQgdXAgdG8gaXRzIGludGVuZGVkIHB1cnBvc2UgZGVm
aW5lZCBhYm92ZSwgc2ltcGx5IGRlbGV0ZSB0aGlzDQo+IGNvbmZ1c2luZyBDT05GSUdfRU1CRURE
RUQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQGdt
YWlsLmNvbT4NCj4gLS0tDQo+ICAgaW5pdC9LY29uZmlnIHwgOCAtLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luaXQvS2NvbmZp
ZyBiL2luaXQvS2NvbmZpZw0KPiBpbmRleCA5ZTNmZDc5YjA4OWMuLmQ3NDI5ZTBiOGNhZSAxMDA2
NDQNCj4gLS0tIGEvaW5pdC9LY29uZmlnDQo+ICsrKyBiL2luaXQvS2NvbmZpZw0KPiBAQCAtMTgx
OCwxNCArMTgxOCw2IEBAIGNvbmZpZyBERUJVR19SU0VRDQo+ICAgDQo+ICAgCSAgSWYgdW5zdXJl
LCBzYXkgTi4NCj4gICANCj4gLWNvbmZpZyBFTUJFRERFRA0KPiAtCWJvb2wgIkVtYmVkZGVkIHN5
c3RlbSINCj4gLQlzZWxlY3QgRVhQRVJUDQo+IC0JaGVscA0KPiAtCSAgVGhpcyBvcHRpb24gc2hv
dWxkIGJlIGVuYWJsZWQgaWYgY29tcGlsaW5nIHRoZSBrZXJuZWwgZm9yDQo+IC0JICBhbiBlbWJl
ZGRlZCBzeXN0ZW0gc28gY2VydGFpbiBleHBlcnQgb3B0aW9ucyBhcmUgYXZhaWxhYmxlDQo+IC0J
ICBmb3IgY29uZmlndXJhdGlvbi4NCj4gLQ0KPiAgIGNvbmZpZyBIQVZFX1BFUkZfRVZFTlRTDQo+
ICAgCWJvb2wNCj4gICAJaGVscA0KDQpUaGF0J3MgZmluZSwgYnV0IHdoYXQgaGFwcGVucyB0byBl
eGlzdGluZyBkZWZjb25maWdzIHRoZW4gPw0KDQokIGdpdCBncmVwIC13IENPTkZJR19FTUJFRERF
RCBhcmNoL3Bvd2VycGMvDQphcmNoL3Bvd2VycGMvY29uZmlncy80MHgva2xvbmRpa2VfZGVmY29u
ZmlnOkNPTkZJR19FTUJFRERFRD15DQphcmNoL3Bvd2VycGMvY29uZmlncy80NHgvZnNwMl9kZWZj
b25maWc6Q09ORklHX0VNQkVEREVEPXkNCmFyY2gvcG93ZXJwYy9jb25maWdzLzUyeHgvdHFtNTIw
MF9kZWZjb25maWc6Q09ORklHX0VNQkVEREVEPXkNCmFyY2gvcG93ZXJwYy9jb25maWdzL21nY29n
ZV9kZWZjb25maWc6Q09ORklHX0VNQkVEREVEPXkNCmFyY2gvcG93ZXJwYy9jb25maWdzL21pY3Jv
d2F0dF9kZWZjb25maWc6Q09ORklHX0VNQkVEREVEPXkNCmFyY2gvcG93ZXJwYy9jb25maWdzL3Bz
M19kZWZjb25maWc6Q09ORklHX0VNQkVEREVEPXkNCg0KVGhleSBuZWVkIHRvIGdldCBjb252ZXJ0
ZWQgdG8gc2VsZWN0aW5nIENPTkZJR19FWFBFUlQgaW5zdGVhZC4NCg0KQW5kIHRoYXQgbmVlZHMg
dG8gYmUgZG9uZSBiZWZvcmUgeW91IHJlbW92ZSBDT05GSUdfRU1CRURERUQuDQoNCkNocmlzdG9w
aGU=
