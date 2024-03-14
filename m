Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198887B9F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 10:04:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bA45GRL4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLz70hJZz3vqC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 20:04:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bA45GRL4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLyK2Vgzz3dWv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 20:03:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcaaxDxb37X/vdMMNN0e52ecul1aZHDFrlLi5dSwDcGX+PRV9XQrRf59Gl67jOuPNn5J90MNpegeSA/WpdUFMecb/RhY29cjFEVp4sDr7HupLpw30sLvaOjCjDasqPqZq77fRvz7AqQStzqXY/QzwS5QEViDYNnapGuNvdLdX/orBeQK5m35Z7MBPLR4GuuzzIxWpRjVD+LkJSGDgn5DnshZKTdN1SHDr4c4puUbo3ReEDM/0EH9MqPJwJ1QtDyfEIh+u85prd/OX2anYbHS8LE9DgjKdqHxNcJSxej450v6UJ5Deafth725/hU/Jq+mXrBQfp1xqDMKZkVJjz+ndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PZQasx8bRth7OEKkOyx32xIxI4xX77oeXfeqR4syUU=;
 b=MVZdK8O9bvU6Po8+wg+dxBId0C3WU5liBNr0EFTVChXWYYGXCTARZsAF+ry1QPGi0zkGWYQHbDcpdtDQQhwTaNF26X7XUVyr1QVkhvGAzcsMPV6Y75V54Fl4GUQ9u36juYHv1SWs1b6DWbLqFayqPlrMnPGJbyoXwY6i/O3M2GH/FV1mNNJWOTu0a4vPhLrjhUd89aoGkAef7YhXeLQxOWpOEvrtO/m8dRpOs8R3ZZcJ0vxdzPHFmAEMfZoce4t00ww9nz5e3KFiikc3fdoqr01NpO8ahqc2W40lWK3la0tmo/sTyr03jFkMCxcqW5iK1sNdSDbGAOiy3fzbMtvoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PZQasx8bRth7OEKkOyx32xIxI4xX77oeXfeqR4syUU=;
 b=bA45GRL46EdDq5sPmbfAmQswF5Yto0Lm/7wDvaE8XUW4YJBhn05UDQrswnoA5XYj6IWSTWF3beLYz7JNlyiweRYmI53p4AvZeXWMV7QnYMByg5rGGP5sMh+GalBeOzoqtQa/yXBI2ZH0VI/+Ogdr5Uke4qEZEbIwQSspcgKvKnuHMOM9jNR4LEC6vOyQ0JDUCaIcwwkLNvnE/CXwB5NB+3hf5HkA1igy93zElbLNrU4wtoeVg/UvtXCfTekH5Xuqef3/v/v7CuoWy9uM1O9bQ+Af4vy7i9iRC8qvKfYSsvQQzKY6NgWlGpjjZQq11NsG7tcL6t6reFGa4jHHITLSMg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2876.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 09:02:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 09:02:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "longman@redhat.com"
	<longman@redhat.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "marek.behun@nic.cz"
	<marek.behun@nic.cz>, "kabel@kernel.org" <kabel@kernel.org>
Subject: Re: [PATCH v6 1/9] locking/mutex: introduce devm_mutex_init
Thread-Topic: [PATCH v6 1/9] locking/mutex: introduce devm_mutex_init
Thread-Index: AQHadewqHAuHWb4npEyQZnENGgQAMrE28PWA
Date: Thu, 14 Mar 2024 09:02:55 +0000
Message-ID: <4f5b44fc-fa48-4525-998d-08cd6958d1bc@csgroup.eu>
References: <20240314084531.1935545-1-gnstark@salutedevices.com>
 <20240314084531.1935545-2-gnstark@salutedevices.com>
In-Reply-To: <20240314084531.1935545-2-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2876:EE_
x-ms-office365-filtering-correlation-id: 20c964c7-aa0e-4197-c3a9-08dc440589ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  By1mM81/H8U61/LysVeKU+nQeBoLIejXmiq7JEPG6ymN0ReSqMXwfRShpf3RjpSDex6b7wsNmWMZFQGK8HNIb3drbwFVuyYoYIVBk423jCDHeNRkLyEE0yOmcZg885zXqXLszmxNJTfpZ14caZLnq4Eu0q4eZWUdq7ojKER0dG4HJkc2OT/ANRkwFP68fp+X2lzMKDiY15cYco/n+d0bxWDJgYHgjB5CnaR0QQ5bgVGQecAN3tzNnNV6D64P50uyfKLG6NRXtQcGAQOA816lPdFFvcfe6HcLh4mqqz+efKJSNQPHkKxb8/P439bQR+6bqgF9g8hMh/6by0W3cRPjVgppbt5orggTRZ00rKnSMi3ZDC0nYsU7IZywur5mLS5B/lgTKtfeYsTpIvP9GyLH98Yvqc+3eBmHQBFphryK1zW4kXMtL9dRoaY12DqmqABjvqHeRgxAkHLZSdBUq3frKTvpgIhuQzdERxsNrzxB5SjQs3K08V0IOZ9WkVzkdMJ084x5M3Excw5C+wRjWidswCM5fDLOdvze6O3IoRMO1+2Aog/HoS9tnra7Obc1SgwZRRjJRbj0wTlz2VvQSutpSvnKFboI4VdvZ9rLFFnmAxTGAxr0rMyIDTarmrsPsbTcVVJKqTI8XsDkvkuyh+i77XjzLaYkNR1J4fFTgbaZMgVbXEGtw1ENNvZJXh0y/D0WoFZR+BeMW9DrRd9clTBi5xcJH4BiyOKL6sSiZIAV07A=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VEZ2SlphUi9JY0lhaDArb1VWRmcwaFgySUhDQlBVb1RUb1dzT1hJSmIwQUlu?=
 =?utf-8?B?RWtDanR4TGlsY2xDTDlMNk41UTVhOHAwK1NFcGwwRVYyQmxzbHNXVDF0SWdt?=
 =?utf-8?B?RjU2cEsvbSs2U2x5YmNKNUhaclIrTlNSMmZWK0hMVjVoS1AxcDd6elM3cFJE?=
 =?utf-8?B?VmxZeWE4Q1dYV2NPU211VzhCNHA3WnE1U3NmdXo2NmxUWG5lS2R5d24vbjhI?=
 =?utf-8?B?bWpXaU9qaGlKWDFEbGFLYXVlNkhrR1AvYXZHdFRCMDlXRGIwQWR1ejRtZ29O?=
 =?utf-8?B?K003UXdEY05GWTdhNzRhVTJ5bElqdWszTE0zMThTV0dka0ExVGpwSnhiZWRO?=
 =?utf-8?B?bFRCbTBub1pWSHZQNE0xd2x5bTZoT3FlVnc3bWp1MmdGdnBGVGVQNjF4MWM5?=
 =?utf-8?B?Qm9NbjFkdXpob1JpNjFERE1vdUZIZFUrRmpHTDZxR1VFU1BwakJuVnpCS3pD?=
 =?utf-8?B?dWpveVFQMFY0RTZjVUxnK1Zobklzdkt2bjExRENyeWludVBoR3J0akJENjdm?=
 =?utf-8?B?QjhsSDhYSG5Vdm0yQmNuejBXSFlabTZCUkhsS25oQk9qMGcwZEtKaC9Ncmhn?=
 =?utf-8?B?TW5HREZXUWJ5cTNtelJvWmxVMUFKeWM2aGVQeFRyeGRhYURXWXJsL01vSHRz?=
 =?utf-8?B?SVNzN0E2NzNWRzdJOEJ1MHdPaERFMitKeGIzeWRvSjVnY1k0dXZiYkkvcjZK?=
 =?utf-8?B?QUNUMTduVGxra3M1R1NtUXp5aWpZQWZwL1ZTWENYRmQ2cFZWeks3M1pKbXEr?=
 =?utf-8?B?bFFIcXl1MUlUcVc1Y1JxcWdLdFM3enR6bCtta2VSenJ5ZzFQZ2Y2LzFaK29w?=
 =?utf-8?B?aTdGbFBkVllKQ2lua01FaWhnSms4dUdoY1lrcnRwcXdoQ2MydTJwZjZkZ2w5?=
 =?utf-8?B?WlVvQTltS3ZMbmQ2TExVdzJncE1Bd205am5ZWThnTG5yUHBBajhIK0xlUE5x?=
 =?utf-8?B?ZkRGa0x4TmpGcG9HZlNOKzZSZVJZdGI1b3ZITnplZjJCMzE4OW9PSkJDa05G?=
 =?utf-8?B?WlNiUDR0UFFJcXl2cGtFbWh5cDZKNEllM2ZFS1dsYWlhaDRBWFJBK05TZmFU?=
 =?utf-8?B?SHNwNDk3L0g3cml5dE8vNTFpbWVocDk5OFR4aVR5MEd4MDBad0d5a0Rkd0tV?=
 =?utf-8?B?clNCMTlXODF2MENYZjc3NGFxaFBIelB2bkNXYlpMT1NVajhUUWxkbXI0NnNr?=
 =?utf-8?B?cmZoaFBzRG0zci9vWXAxTWJ1VE9qUDE0TkQ4dUwwalQ1N2NBRngyWEpxUHEy?=
 =?utf-8?B?czBNcHdnUHZFRzBRWUtIOStZR0FQbVRIWFIwV2lKemN4dVBwbWI0SHdEYkFZ?=
 =?utf-8?B?aWRrWjMyeDJVSkU1Qm5SaXN3dnZsOTgrb0tHSlRkdld0c1Awd1JkNE1NdDQz?=
 =?utf-8?B?Sk1xN1FHamhqb3VxK3dvejJwTTZxckpHZkJMUEZSajA2cFA1Yzdpek9maTRC?=
 =?utf-8?B?MVpvc3VwbGhBMHMwR2NaT2dKYXV6bDhHWUpDTEIybytqaFRwYzQ2TjEveFd0?=
 =?utf-8?B?dldhSndoSENGa2xiRzNRUnkrcXkxTUpqbC91TnI4V3pFb05EOEppQjFyYzIr?=
 =?utf-8?B?WXEvY0JjV3gwUC84ZnZPRlFNajRQUlFZRkJMNjV0YTJYZ1Q4dFpTN2wwWUFK?=
 =?utf-8?B?VkUxR3J2NUlXVTMrWTY0ZDNFdW9OUm93L0xScVpMWk0vY0tTb3RCZzUvMjhs?=
 =?utf-8?B?aWhqRFN2Sy9uWi9xMHR1TDJrNi9KVnZicTh1R1pEWVBreU9QdDc2enhONTBw?=
 =?utf-8?B?MXZLOEgvTm1HYk9iUjFqQVk2bUZMZlIvWTJEUDdHaG9QV0dwUmk2MXc5NzhM?=
 =?utf-8?B?NlpqRE5uM0hjMkVVZ3VHWTNQOFoxb0Q5dENUVzB4eldHS1ljcHJlUVhpZ1Vq?=
 =?utf-8?B?U2o1WDQ2OGFLK2thbk1lSnFITGE2YjZrTWYvNU95aTVyNVI0anlsa3l4NDUv?=
 =?utf-8?B?WEx6Qlo3SXpYeXFabG9ON255cFFtbUp4dVkzenl1RG5yeGFsdGhCOUxTbG1u?=
 =?utf-8?B?MllMVWw3bjQ5ZFVYdTBINU52WEhtTFpyN3BYdEpDV2hZekI3R3IvcFRodjlz?=
 =?utf-8?B?aWVZc0Y5emFiRUNkaG1UY1QrNW83eGwwM1ZlSVVjU2psRElCRXNGbStBNDNu?=
 =?utf-8?B?RStIN3hpb2ZhOWt3MWtZZ2dGRVZIc0lFWXRmYmR4VTk2OWJWMHl6VWMvaXRQ?=
 =?utf-8?B?N24wVXJ1RDZRTUplU2NIYlpIUVpYcFY0TlM0SEVUeUNrMS9BWUMvNWJrSlFE?=
 =?utf-8?B?ZkVEN3FnMlpwVFhWWEJpc1Q3OXFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06471F29C05EA547AD416D641C1D80E5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c964c7-aa0e-4197-c3a9-08dc440589ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 09:02:55.8984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ate7EQ0EB6BzhDtY1LqYC7rrGC9I0gLZfYnh1VBhI8Ia6cXqNLvK6oz416l+vYzDvLtY0k4zIqp0ucp1yk7JON5XA+EAB6C4akIow3vRbFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2876
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAzLzIwMjQgw6AgMDk6NDUsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBV
c2luZyBvZiBkZXZtIEFQSSBsZWFkcyB0byBhIGNlcnRhaW4gb3JkZXIgb2YgcmVsZWFzaW5nIHJl
c291cmNlcy4NCj4gU28gYWxsIGRlcGVuZGVudCByZXNvdXJjZXMgd2hpY2ggYXJlIG5vdCBkZXZt
LXdyYXBwZWQgc2hvdWxkIGJlIGRlbGV0ZWQNCj4gd2l0aCByZXNwZWN0IHRvIGRldm0tcmVsZWFz
ZSBvcmRlci4gTXV0ZXggaXMgb25lIG9mIHN1Y2ggb2JqZWN0cyB0aGF0DQo+IG9mdGVuIGlzIGJv
dW5kIHRvIG90aGVyIHJlc291cmNlcyBhbmQgaGFzIG5vIG93biBkZXZtIHdyYXBwaW5nLg0KPiBT
aW5jZSBtdXRleF9kZXN0cm95KCkgYWN0dWFsbHkgZG9lcyBub3RoaW5nIGluIG5vbi1kZWJ1ZyBi
dWlsZHMNCj4gZnJlcXVlbnRseSBjYWxsaW5nIG11dGV4X2Rlc3Ryb3koKSBpcyBqdXN0IGlnbm9y
ZWQgd2hpY2ggaXMgc2FmZSBmb3Igbm93DQo+IGJ1dCB3cm9uZyBmb3JtYWxseSBhbmQgY2FuIGxl
YWQgdG8gYSBwcm9ibGVtIGlmIG11dGV4X2Rlc3Ryb3koKSB3aWxsIGJlDQo+IGV4dGVuZGVkIHNv
IGludHJvZHVjZSBkZXZtX211dGV4X2luaXQoKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2Vvcmdl
IFN0YXJrIDxnbnN0YXJrQHNhbHV0ZWRldmljZXMuY29tPg0KPiBTdWdnZXN0ZWQgYnktYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0Kcy9TdWdnZXN0
ZWQgYnktYnkvU3VnZ2VzdGVkLWJ5Og0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGluY2x1ZGUvbGludXgv
bXV0ZXguaCAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBrZXJu
ZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jIHwgMTEgKysrKysrKysrKysNCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L211dGV4LmggYi9pbmNsdWRlL2xpbnV4L211dGV4LmgNCj4gaW5kZXggNjdlZGM0Y2EyYmVlLi5m
NTdlMDA1ZGVkMjQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXV0ZXguaA0KPiArKysg
Yi9pbmNsdWRlL2xpbnV4L211dGV4LmgNCj4gQEAgLTIyLDYgKzIyLDggQEANCj4gICAjaW5jbHVk
ZSA8bGludXgvY2xlYW51cC5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9tdXRleF90eXBlcy5oPg0K
PiAgIA0KPiArc3RydWN0IGRldmljZTsNCj4gKw0KPiAgICNpZmRlZiBDT05GSUdfREVCVUdfTE9D
S19BTExPQw0KPiAgICMgZGVmaW5lIF9fREVQX01BUF9NVVRFWF9JTklUSUFMSVpFUihsb2NrbmFt
ZSkJCQlcDQo+ICAgCQksIC5kZXBfbWFwID0gewkJCQkJXA0KPiBAQCAtMTE3LDYgKzExOSwzMSBA
QCBkbyB7CQkJCQkJCVwNCj4gICB9IHdoaWxlICgwKQ0KPiAgICNlbmRpZiAvKiBDT05GSUdfUFJF
RU1QVF9SVCAqLw0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19ERUJVR19NVVRFWEVTDQo+ICsNCj4g
K2ludCBfX2Rldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAq
bG9jayk7DQo+ICsNCj4gKyNlbHNlDQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgaW50IF9fZGV2bV9t
dXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKQ0KPiArew0K
PiArCS8qDQo+ICsJICogV2hlbiBDT05GSUdfREVCVUdfTVVURVhFUyBpcyBvZmYgbXV0ZXhfZGVz
dHJveSBpcyBqdXN0IGEgbm9wIHNvDQo+ICsJICogbm8gcmVhbGx5IG5lZWQgdG8gcmVnaXN0ZXIg
aXQgaW4gZGV2bSBzdWJzeXN0ZW0uDQo+ICsJICovDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsN
Cj4gKyNlbmRpZg0KPiArDQo+ICsjZGVmaW5lIGRldm1fbXV0ZXhfaW5pdChkZXYsIG11dGV4KQkJ
CVwNCj4gKyh7CQkJCQkJCVwNCj4gKwl0eXBlb2YobXV0ZXgpIG11dGV4XyA9IChtdXRleCk7CQkJ
XA0KPiArCQkJCQkJCVwNCj4gKwltdXRleF9pbml0KG11dGV4Xyk7CQkJCVwNCj4gKwlfX2Rldm1f
bXV0ZXhfaW5pdChkZXYsIG11dGV4Xyk7CQkJXA0KPiArfSkNCj4gKw0KPiAgIC8qDQo+ICAgICog
U2VlIGtlcm5lbC9sb2NraW5nL211dGV4LmMgZm9yIGRldGFpbGVkIGRvY3VtZW50YXRpb24gb2Yg
dGhlc2UgQVBJcy4NCj4gICAgKiBBbHNvIHNlZSBEb2N1bWVudGF0aW9uL2xvY2tpbmcvbXV0ZXgt
ZGVzaWduLnJzdC4NCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMg
Yi9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQo+IGluZGV4IGJjOGFiYjg1NDlkMi4uNmFh
NzdlM2RjODJlIDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvbG9ja2luZy9tdXRleC1kZWJ1Zy5jDQo+
ICsrKyBiL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMNCj4gQEAgLTE5LDYgKzE5LDcgQEAN
Cj4gICAjaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaW50
ZXJydXB0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2RlYnVnX2xvY2tzLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgIm11dGV4LmgiDQo+ICAgDQo+
IEBAIC04OSw2ICs5MCwxNiBAQCB2b2lkIGRlYnVnX211dGV4X2luaXQoc3RydWN0IG11dGV4ICps
b2NrLCBjb25zdCBjaGFyICpuYW1lLA0KPiAgIAlsb2NrLT5tYWdpYyA9IGxvY2s7DQo+ICAgfQ0K
PiAgIA0KPiArc3RhdGljIHZvaWQgZGV2bV9tdXRleF9yZWxlYXNlKHZvaWQgKnJlcykNCj4gK3sN
Cj4gKwltdXRleF9kZXN0cm95KHJlcyk7DQo+ICt9DQo+ICsNCj4gK2ludCBfX2Rldm1fbXV0ZXhf
aW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jaykNCj4gK3sNCj4gKwly
ZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9tdXRleF9yZWxlYXNlLCBs
b2NrKTsNCj4gK30NCj4gKw0KPiAgIC8qKioNCj4gICAgKiBtdXRleF9kZXN0cm95IC0gbWFyayBh
IG11dGV4IHVudXNhYmxlDQo+ICAgICogQGxvY2s6IHRoZSBtdXRleCB0byBiZSBkZXN0cm95ZWQN
Cg==
