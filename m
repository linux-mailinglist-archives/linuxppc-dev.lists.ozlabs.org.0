Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131D389236
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 17:07:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flbnn1NPbz30DQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 01:07:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=JNYLBoHI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.220.63;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=JNYLBoHI; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlbnD2c8fz2xdM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 01:06:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9Ygoz6cJujAR13Cjjcxqp8qOTrk7zMKyy99ifXq3yDPq4ZruVd0DTG22FTkncz+ZH4p8dKfo+T9I2m3MeGg21XuxRQjyEiaI1si8TxnHfwlS1PPKOpcXqXyLeAD1AFN19rUE2NerOb31BKCg8CaUXKdCjVP14d2uAU52PI8uNfi1jUCeo5mSxvOHUiQZFbLfyFDrWUuuaIi3jvfxKYvxDqvkvaLxSBWrz4OE0swC8K7AvDhEeHDgpYHfIdQfSpuiBMGm09aaQnN09yHtP0TRW9jaP8WL2bvElr0mBvlYE/DPdY8kcKDXt2hyfYIZCJ/Mx7g5s0mCpUDw0nOC2uKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ijFUELZ8pSSXiQx2WytB/1aPVLFg585xvaeT3Gj5eY=;
 b=QgUMfQrnisNzV0HPAHRznEg/5YstfxVIiwQtp7Wn2nVVRUKcIKF94NVWTYKbj6XV5AGM2r0jNgnWPQk0SRWA1fpj4E4A16i/RX1Xwt0KndZHlW22uERhmVcUVnkuYj3AwrgnAQVXuoPZ5KrVZ2YmXjTATkNbmGN2jTPJoPWq7ZTC2A9kKcDI2MJpCgOQBrimkHrvstyvmrB9BG1BRCAmpOkIFYavKXC2uInyGWI31uisTvtRIOPUF/TG5+pPOum1HFFawnOB4yJxv+i6j1lRpvf+51fOsmny+XPkZKw3SNLAO9dA4aS9R8rkN1yC34HEZcT6ifdwm/8mbXQBjDm2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ijFUELZ8pSSXiQx2WytB/1aPVLFg585xvaeT3Gj5eY=;
 b=JNYLBoHIle4MEqjU94hRGe5xnsyjdMoFnJ1hvMc/wNHKFoCKmXeDcUz0yMTP10TYvJzgd9HhSWlU0yL+X3EoLQBeUtJIBRMY+V2La5/yj3VvqrU9eGOIX8Uy5/YKT0UFT7Tvw87oQekaW4LU3kvc/g0Ggnt6ssoOPu47i4BUoUQ=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB4789.namprd10.prod.outlook.com (2603:10b6:510:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 15:06:50 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 15:06:50 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "segher@kernel.crashing.org" <segher@kernel.crashing.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Thread-Topic: Linux powerpc new system call instruction and ABI
Thread-Index: AQHXTDxnjXzNFE+v10y5IiWAVxRCH6rqahwAgAAGHYCAAAN7AIAACa0AgABjcgCAAAfggA==
Date: Wed, 19 May 2021 15:06:49 +0000
Message-ID: <11d62aa2488e51ec00fe77f24a1d7cdcc21af0b8.camel@infinera.com>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
 <20210519143836.GJ10366@gate.crashing.org>
In-Reply-To: <20210519143836.GJ10366@gate.crashing.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: kernel.crashing.org; dkim=none (message not signed)
 header.d=none;kernel.crashing.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e600d8a8-854e-4577-c472-08d91ad7ba92
x-ms-traffictypediagnostic: PH0PR10MB4789:
x-microsoft-antispam-prvs: <PH0PR10MB478919153C99B129B5A0C2D3F42B9@PH0PR10MB4789.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OEzQ0OHhhjdGSJqDMpMJSsUlyjntykjCqtPdqReuml7lPtJqnOevmtRWV1gwuWGYfi83Am1/8QXaO8FdvEtCmzxUftSIpXM/KVufdPvZYWt3tsUSZC4RagyDld8SCsOw+EUcGW/KF4N+gzf1Bpz/p7ckjB+NVbvGEM4hb5qBEj4jaSDFyJro2OCQe3tWDS1gP48DKdV/jUU771w4j6Gar8WgrKL3gRwwIk9nIOWbkPFAJ1ijY4RsPWgjMHfxJQPJ/O+e/FxnEtayGjOLWkhbxQdP2RbnlxR436jRX1fMaqmPhE830ExiG0OylN08/pkj5d6uvJ0JtrbZjlypWJ/9w7B+R/uZoGDSQ7eE7tv0C9wzEcUFWZZ0hXr/MosE760/na9yuh/6cT9PtQbyO8jBFrCwXrk3M1d4mrKuMWmDoQ3kzhJIC6YPPnwVx0QAlI6KhFA5M9OHLpQnkTrp12LfCZ8yS7PHy1NPwCqFOdfS+EY6Un+j7ox2ewiXfNwkpJBbRn5H0vLxcE7E+LJUnTKK8eF7QqJbyVKuWpk2QF9Zg2u/zsYAEjaVVENRq8vPKFbtuhSqUuvD1BFEE/wkahmB6xHmYcVwqO3YTks/AY91xg0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(110136005)(6506007)(54906003)(5660300002)(83380400001)(36756003)(86362001)(26005)(6512007)(71200400001)(66946007)(66476007)(64756008)(122000001)(4326008)(66446008)(66556008)(316002)(38100700002)(478600001)(186003)(2616005)(8676002)(91956017)(4744005)(76116006)(8936002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Tk12Zm1Ka1VOV2F3OXEzazFFalc1YlNmTTRyT3ZDRHdvUXE3WThwUVdjYTUy?=
 =?utf-8?B?SEhUbkFNUTF4WTY0R0RiSkNmREE3M2JOTEpNeHl3RDhxNU56NnhKZTRvM0Vw?=
 =?utf-8?B?UnZaTEo2QVZEc1ZhVVljS0EvdXZrR3ZGbTV1OFpORGtzNDUybHUzVVZZOVY5?=
 =?utf-8?B?ZXFERC9NaVpDZ3ZTWTc3aFpMZ3dhZSsvR2xEUVJUV1lXcmZLUUE3QnZ4U21G?=
 =?utf-8?B?WEFPSVBNa253WW5oa3kxMU9GdGxCU2ZzUVduUGFGeUpLYlRvTE1TRHNtNktu?=
 =?utf-8?B?REFqOHJaUDk4bkFVOVRBM2VKUXpzaGV0cGxtdFh1UE9mNGRnZm5BN3dKSW1C?=
 =?utf-8?B?SDJ2MFhjUTF6MzhlQ1lvQzIvMXpDMEw1Mld2QjFDekgxZzFDVXN2MmdWb1NI?=
 =?utf-8?B?TFhuM0xGZmlpME9sMHB1NFU0WjVvem80ejZTRVFzWG03TGxVdkhtQ0FwMFd0?=
 =?utf-8?B?WTIzVzJwTFFCN1VWaHFVdDc1dFJ1a3J4eENyNjBhZlkzOVNLUE1KcGI0OERx?=
 =?utf-8?B?bTJZNDdGOTBENUt1enNKM2FwU2VTTE5JMVpGekxUaVB2UWJzeVdnTEpWcnhG?=
 =?utf-8?B?b1ZDS3FKUzB4OTRYUEwzRW42N0NLY0pzWmhISC8zRDB6WFNjQlR6TFJsV2Yx?=
 =?utf-8?B?eFZlcjdiSklQVXp2aE9ody83bi95V0RGVllkNzJxcVNGcEJIWTQ5L0psRTRy?=
 =?utf-8?B?T3Y1alMzRWJVVXRTVGdDMGdKUGwxNDYvWFk2NllyeDJCOUo5RlhMZ095NnJp?=
 =?utf-8?B?Y2N5V1JlU2krQk91bk1ZK3JMSUoydHR3VjFmcTNSWUtmZDdxYXUxTEwrZytq?=
 =?utf-8?B?TGVHZlhHeDZ6WnVMRW02bU9yMEl6Vkx0cUdwNERnNlk3bUxrTDFOY0QzandY?=
 =?utf-8?B?QjJ3Rllma1hpUFRjYWVRL2YwSmtGWmwzZEJSRWpOYS9SdDU0Z0N4MGRJN0sw?=
 =?utf-8?B?c0hYSUhsbzBxVExXT1FtTURPNFpPbW9EeVZUeVgwWXBFM0pVay9hMGozdnYv?=
 =?utf-8?B?UkRvVXZ3bXptYjZiV01XbnN4TWd0MzcvSWJnT0Z6cVVzOEJVMXk3QXp6cWZD?=
 =?utf-8?B?N2NZTHczcHV5VjNxYWUyUWEwdFE4aFpmMDVFYzM2L0ZObW9Qcm5Ha2lzekJp?=
 =?utf-8?B?U2Q3T3NlWjJtTzFOck52TVRqMzhhcW5hbmhHY1I5YllQR0w5eUVBMjdkaFZz?=
 =?utf-8?B?bWlhZDM0dFQxZ1dNNDluWStidU50RGxRQlFPMktDOEFQNmVhSVk3UU85NFRt?=
 =?utf-8?B?Rm8wM3pReElaVE04cHpoRVNYeElpQ3QrT29lYzh2eEg4T3Zabm9QR2xFMXIv?=
 =?utf-8?B?OGVWcHhKbmE4UWNGMUdDeTdtMnZ0LzJ5bzNIa3FYNndEaEdmTlNkVkhWb1B5?=
 =?utf-8?B?b3hZcEhSVXJWSkhQbU8vbTBlRGx3SHRUd2p2My9uQ3R3a1U3MXBmeDZaajhL?=
 =?utf-8?B?VS91ZHpjT28wRlgzYmFZeG5oNVNPUlpjT0ZRNEYyYWZvVnQ5T01uSTQvZGVM?=
 =?utf-8?B?TElpeDlQeSs3elVMQUVxN2l6Nm1ZTFNnSFhnTWQ3YkRBMUFLM3h1SFRvVDM1?=
 =?utf-8?B?YkpNWDZ5WFdCOTBZSzE2SWxaNFRveUJ0dHRqb0FETEh2ZGhsNStVbURDVkZx?=
 =?utf-8?B?WWNuZjFVMGc4d0lLQ0xaS094MFdidWthNzhKaWtRQ3E4WFB5ZU9kMUppWHJQ?=
 =?utf-8?B?ZkUxdWUxVU1TS1BSRUpJZVgxRkJGU3pGT0htZG9DaVB4VDc2ZU5lTS8vTFYr?=
 =?utf-8?Q?TiiJSdf13EzmTA8yPGJZjw0rf+DASCQRs3Ci7+F?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9599865831E8BB47BC25377FCE4F13A0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e600d8a8-854e-4577-c472-08d91ad7ba92
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 15:06:49.8892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JplSRkI3sR+fUr72z76I7h9FLJAY1XJn1z52dTzXWj/M26ejPbxQnlNaUJzSRcgNKnxtWJJimLclvYPK8Okx0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4789
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
Cc: "musl@lists.openwall.com" <musl@lists.openwall.com>,
 "ldv@altlinux.org" <ldv@altlinux.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA1LTE5IGF0IDA5OjM4IC0wNTAwLCBTZWdoZXIgQm9lc3Nlbmtvb2wgd3Jv
dGU6DQo+IE9uIFdlZCwgTWF5IDE5LCAyMDIxIGF0IDA2OjQyOjQwUE0gKzEwMDAsIE5pY2hvbGFz
IFBpZ2dpbiB3cm90ZToNCj4gPiBFeGNlcnB0cyBmcm9tIEpvYWtpbSBUamVybmx1bmQncyBtZXNz
YWdlIG9mIE1heSAxOSwgMjAyMSA2OjA4IHBtOg0KPiA+ID4gSSBhbHdheXMgZmlndXJlZCB0aGUg
cHBjIHdheSB3YXMgc3VwZXJpb3IuIEl0IGJlZ3MgdGhlIHF1ZXN0aW9uIGlmIG5vdCB0aGUgb3Ro
ZXIgYXJjaHMgc2hvdWxkDQo+ID4gPiBjaGFuZ2UgaW5zdGVhZD8NCj4gPiANCj4gPiBJdCBpcyBz
dXBlcmlvciBpbiBzb21lIHdheXMsIG5vdCBlbm91Z2ggdG8gYmUgd29ydGggYmVpbmcgZGlmZmVy
ZW50Lg0KPiANCj4gVGhlIFBvd2VyUEMgc3lzY2FsbCBBQkkgKnJlcXVpcmVzKiB1c2luZyBjcjAu
MyBmb3IgaW5kaWNhdGluZyBlcnJvcnMsDQo+IHlvdSB3aWxsIGhhdmUgdG8gZG8gdGhhdCB3aGV0
aGVyIHlvdSBjb25mbGF0ZSB0aGUgY29uY2VwdHMgb2YgcmV0dXJuDQo+IGNvZGUgYW5kIGVycm9y
IGluZGljYXRvciBvciBub3QhDQo+IA0KPiA+IE90aGVyIGFyY2hzIGFyZSB1bmxpa2VseSB0byBj
aGFuZ2UgYmVjYXVzZSBpdCB3b3VsZCBiZSBwYWluZnVsIGZvcg0KPiA+IG5vdCBtdWNoIGJlbmVm
aXQuDQo+IA0KPiBPdGhlciBhcmNocyBjYW5ub3QgZWFzaWx5IGNoYW5nZSBmb3IgbXVjaCB0aGUg
c2FtZSByZWFzb24gOi0pDQoNClJlYWxseT8gSSBmaWd1cmVkIHlvdSBjb3VsZCBqdXN0IGFkZCBl
eHRyYSBlcnJvciBpbmRpY2F0aW9uIGluIGtlcm5lbCBzeXNjYWxsIEkvRi4NCkV2ZW50dWFsbHkg
dXNlciBzcGFjZSBjb3VsZCBtaWdyYXRlIHRvIHRoZSBuZXcgaW5kaWNhdGlvbi4NCg0KIEpvY2tl
DQo=
