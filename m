Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AA338950B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:10:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlgrY5NcMz306G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 04:10:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=KPjDnVnw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.244.62;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=KPjDnVnw; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flgqy6ysFz2xvK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 04:09:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWw9u2KQg8ux05rs0yrlvUV5Ul9G8DCvL49Him8RAxYPLB59TvuhYwrBP0/4HXQTGBy326ebpKHjVfLmaOa4bROa8AaG001paiNfMvfN6MK3GXM3MnP17Ce61n84J9m9Gy92jqn+Gmado8WstzQL1dpBH4YjlKk6os8EGDmMyPQMqp0qf+HOps0yM+HRAJw9vev/ybcgR+S68e3Lrzi71foevBUPNPx1u8+xAvVwz1gbctmtWifqe0Br3QSdZRc1DPCFkk+01cnTDeQySwek4wp3qR6HMaGEIixf2try4IVAvGSuWFELIJMH5HLbSF1ZKCCiEcKRiUZETiGqT8moZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEvN+Q8wcft8iVglXI/gKAldatKc9soToihdABSpNgg=;
 b=G6eXgf9fZ5E0I3dKXztQOMigsVGwJl/r+bm230Xi0SMy5UU3eamBZGc+JqQrn62k1nC7D4m3uzAw0K92+Ani1csT4c+7Sqq8LLNY1it8RI26Ckg1wymSUtg60O/Zd/cqdVeGm9m49p7EgftBSu5vegB37zrAar2uGrnCdSAjAeD5H+ByDAyUFXCBwhD+fHGliLAlYIvR6DJpobFiNjQv2OuNI22NUU5OGozaq2iMDkQz+6+FOvCoSj5vUrLta4a6MZg2OHYWK0cykuTn7HKH9kPfkhdZClWwLjWlpqYEqmIK/du7HtBTyI+QUDyu/5oyojrskqQuXO5gncFouKG4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEvN+Q8wcft8iVglXI/gKAldatKc9soToihdABSpNgg=;
 b=KPjDnVnwuEUE+cnhPFowwvT2WoHfwF6QBWaVtuNMpe7h8AwW2iNhfAfJC9KioTggJt5Vkxx3yKA0wZ9xYmxaeyHwoNc39kUZKMY+1Fvke7Ovp3Sb/QpBjspCvn5Z1GNT8bDjk+FRIKz8sSpah8LdWZMrMRsw0nhwk07lNRov7OA=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB4550.namprd10.prod.outlook.com (2603:10b6:510:34::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 18:09:26 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 18:09:25 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "segher@kernel.crashing.org" <segher@kernel.crashing.org>
Subject: Re: Linux powerpc new system call instruction and ABI
Thread-Topic: Linux powerpc new system call instruction and ABI
Thread-Index: AQHXTDxnjXzNFE+v10y5IiWAVxRCH6rqahwAgAAGHYCAAAN7AIAACa0AgABjcgCAAAfggIAABEeAgAAuvwA=
Date: Wed, 19 May 2021 18:09:25 +0000
Message-ID: <adec4377144a44b6f9ddd10c1b5256b80c9ceb50.camel@infinera.com>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
 <20210519143836.GJ10366@gate.crashing.org>
 <11d62aa2488e51ec00fe77f24a1d7cdcc21af0b8.camel@infinera.com>
 <20210519152205.GL10366@gate.crashing.org>
In-Reply-To: <20210519152205.GL10366@gate.crashing.org>
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
x-ms-office365-filtering-correlation-id: 698a2ad3-8a46-431e-6692-08d91af13cd7
x-ms-traffictypediagnostic: PH0PR10MB4550:
x-microsoft-antispam-prvs: <PH0PR10MB45503105310666483BDC6619F42B9@PH0PR10MB4550.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NptOupcbZ8etC7/Bdf090zL4y1Ur80g5by406SXsuyDpUlWLDM0vlKdxnqOM0emTa2/2yck15MA4EgNwvDbspnZJxGsWuj748BRVcZNzgmqdc4FakafDbee6U+3Pt4ThN3+FrtPsEULCnwymAR3ozGQMJpZ+GTH4YZHNxuRtqzsfCSvdXjrqZukQdq9AXX8PYn0Q0fhlHY+5Sgu65ruczJrp1kUHHEfG4AN4eYS7Q6L0xNWoBg8DIck++6UzhLgD9wsIN5aBm59Ojb8S1cCYFVdWXfxTveo8i82wCuPYxfHo+60ryxqPqIHwJHTTVpgvz+RXsBtXiFQo5C4Z6xHGON5+efcV7i2k0PSI8QxS6TOhQYFhi3DHuTU45CQO10sEZ+5Um3te3x2whFUNMvD2qtecH/5ePkJ4MYa6cor6IKnp2cC0VZnIpLpL4VMfytaxiTugKlSAPhItYEuAhR9leujj+UUw6k+ATyju8AmuFG0qAvVKv/RTS6nzr5Qdom8HTFXtcM/bXOmL/LQT7vDX4UlT+gUM5262yHwHTVS1S79/V+EYINOedl4jKAnOHBnxsAlT37pcP2rX448BD2g4cWfNPLVUtDM7yWs2JTJV8mQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(5660300002)(186003)(6512007)(8676002)(6916009)(36756003)(8936002)(122000001)(38100700002)(6486002)(6506007)(4326008)(83380400001)(54906003)(66946007)(64756008)(66556008)(66446008)(66476007)(91956017)(76116006)(478600001)(71200400001)(86362001)(26005)(316002)(2616005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YXdGU0pvNlBvOFhOdHl0Ykt5eStVdTVnQmxrcW0wcmJBbVNFT0UxeEhwZ3hV?=
 =?utf-8?B?Ui93ZVIvM3JFR0pZQTRxU2pjM0lFYjZGTCtqSVA4ZENFL3gxZFRKR1N5ZVlP?=
 =?utf-8?B?Y0d4NVlEY0lic2Q5eEhoTFNOQ2tLV0VSRGtkVkhYUjFVU3BQTGxZblZOOTc1?=
 =?utf-8?B?elNIaTdVYk1mNXd5SHM1Ykl1OWFjODdLNEdRVHEwclE4UWFkYm41Mk01TEJO?=
 =?utf-8?B?VEhaSlRSTmd5TEtZNGFzbzljaDliaHZIYzJ2aFlKQXR3OTYwNEFuS08vMW1p?=
 =?utf-8?B?L0pmeTR2QkoyOXF5VjZ4WHA2Q2hwdUZrTVNjV3R3bDd5N0U3dmRkOUdqdENj?=
 =?utf-8?B?OVpHVG1ZRVpaSFBvVkQwSjlpOHBZUFR0SThZaHlBYWVaY2IzOHFwbjhvM29n?=
 =?utf-8?B?TFhMQS9ybTRNbHE2V3dlMTRXL0pTSC81ZFBWeG95dlpmR1BxREZ5UVRFNm53?=
 =?utf-8?B?cElONnZBUy84QU9MQUxhSWRWLyt4aEcveGZrSjVzdC9OaktkdHVXUDNSTFpt?=
 =?utf-8?B?Wi9rUy9XYklGUjFpRW9ka1ZSdE9yOTJtM1c1TmlSUk1nNmpBYjZpZ3BCK1Ba?=
 =?utf-8?B?TDlpN0dDQldyWEk1ajZzZ1l6OWpnaWw1R2hHWFVVNTJnUFFQM0E2L0hOamNN?=
 =?utf-8?B?d2pLUVZmWk5SZmpGL2RyYmFGRFcvSThYTExRam5nZHJaRmUvdkFKMG1XcU96?=
 =?utf-8?B?eXA3VllnOGFCSUx1RndxcFhwam55NHg3amNxKy9HVGdqWW45dDFiSTIzVE85?=
 =?utf-8?B?aHpiYjNRUTZGeVRlZ05sNGIvUDJWbVBNRGFHQjVDZ2xxclRBRUI4NHY5N1pB?=
 =?utf-8?B?Vm51K2hBLzB5UTlyMDhxK1VWNjFLQkVUOExpRVZmQ2xuR3ZieGtjY1BBbE9Q?=
 =?utf-8?B?bG5vcG9NS3VkYUFxWVV5ajRvTUltL1o0eVE1T0pIcWtWR0JRbDdtSmZuQ3gr?=
 =?utf-8?B?L243OXJzWEc0WnVVYnduT3BqVEdoUytWN2J4VjhRRk1IUDN2eE13UjZFNVVB?=
 =?utf-8?B?RDF5TWdWa2x1WklpMXovTW5ONnRPSDkwOFd0SWVEd0hGdFQyN090QzIyclJI?=
 =?utf-8?B?UVc1UkdVdUpjeXRmeThrNkZDZ0d1Y2VkUXVXTlRPbDVMK0FxeFovVjdudmYx?=
 =?utf-8?B?eXNhWG1YYWRNRjdqRjB2eUpLK25LTkFPNSs1b2tkcXhZYUZCbjJYanppUk9W?=
 =?utf-8?B?bk9vczNhdkJmTjJjR0xSTlNwNzRRU3ZjTWxQem1rb2MwZWFxWk03UW82S1VE?=
 =?utf-8?B?QWJEc2Q0WEw5bTNHVGdic2NtVGVIZ3R2NXZRNEdFK0NhcU93OTFKbmp4dVNz?=
 =?utf-8?B?aW9aRDBwcU9nQStOUmtsUFRvbmpTMVlBalRQYnJ0cVo4ZGYwUlY2b0RlZDhL?=
 =?utf-8?B?Qk5DcnYxOFIzZk9JazFSMVU0dnRHUWdER09kK1ZkTDFIbVI3WlFtK2JsMVZU?=
 =?utf-8?B?MVc4di9ac0NidW5SWjJEV1ZiVjFwZ20vU28xVUdzMENyaC9RMS8vUm1kOGgx?=
 =?utf-8?B?dlk2bWcvVVJab0JmRCtrOFJnc3VzalpaR1lNS0tLWE0ycUNjTE5velpFSHBC?=
 =?utf-8?B?d0dpMTA4MGJhL3BJSlAvS2dIYjYxaGlBMTRtaWsxb2J5L29xTXJhN1JzellW?=
 =?utf-8?B?Y3FBczVadW9DWkF5YmZFeWd3SHBKWGc5UzBVMjBySWRjb0xFVUxBdG9uYjlS?=
 =?utf-8?B?bDYzZU0yUUxjKzhLUjNDVERuNjgzQ1N4ZzVWaFhtTUU4T3ZCbjM0VUlaRmw0?=
 =?utf-8?Q?Q1Y1HrYVsfi8UgOc1ofYE7Pvilg+GULhy16VGo6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D80E71F69DEBF4297094778057807D3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698a2ad3-8a46-431e-6692-08d91af13cd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 18:09:25.8670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKozYHs16G72KWrrGqMCEIWD+zC6VZw7v+oI63YS4lLFjt7YvGAdpLOYyRmF0KR/4uZlU0r4aTI7THF3LCXS/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4550
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
 "npiggin@gmail.com" <npiggin@gmail.com>, "ldv@altlinux.org" <ldv@altlinux.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA1LTE5IGF0IDEwOjIyIC0wNTAwLCBTZWdoZXIgQm9lc3Nlbmtvb2wgd3Jv
dGU6DQo+IE9uIFdlZCwgTWF5IDE5LCAyMDIxIGF0IDAzOjA2OjQ5UE0gKzAwMDAsIEpvYWtpbSBU
amVybmx1bmQgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDIxLTA1LTE5IGF0IDA5OjM4IC0wNTAwLCBT
ZWdoZXIgQm9lc3Nlbmtvb2wgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE1heSAxOSwgMjAyMSBhdCAw
Njo0Mjo0MFBNICsxMDAwLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6DQo+ID4gPiA+IEV4Y2VycHRz
IGZyb20gSm9ha2ltIFRqZXJubHVuZCdzIG1lc3NhZ2Ugb2YgTWF5IDE5LCAyMDIxIDY6MDggcG06
DQo+ID4gPiA+ID4gSSBhbHdheXMgZmlndXJlZCB0aGUgcHBjIHdheSB3YXMgc3VwZXJpb3IuIEl0
IGJlZ3MgdGhlIHF1ZXN0aW9uIGlmIG5vdCB0aGUgb3RoZXIgYXJjaHMgc2hvdWxkDQo+ID4gPiA+
ID4gY2hhbmdlIGluc3RlYWQ/DQo+ID4gPiA+IA0KPiA+ID4gPiBJdCBpcyBzdXBlcmlvciBpbiBz
b21lIHdheXMsIG5vdCBlbm91Z2ggdG8gYmUgd29ydGggYmVpbmcgZGlmZmVyZW50Lg0KPiA+ID4g
DQo+ID4gPiBUaGUgUG93ZXJQQyBzeXNjYWxsIEFCSSAqcmVxdWlyZXMqIHVzaW5nIGNyMC4zIGZv
ciBpbmRpY2F0aW5nIGVycm9ycywNCj4gPiA+IHlvdSB3aWxsIGhhdmUgdG8gZG8gdGhhdCB3aGV0
aGVyIHlvdSBjb25mbGF0ZSB0aGUgY29uY2VwdHMgb2YgcmV0dXJuDQo+ID4gPiBjb2RlIGFuZCBl
cnJvciBpbmRpY2F0b3Igb3Igbm90IQ0KPiA+ID4gDQo+ID4gPiA+IE90aGVyIGFyY2hzIGFyZSB1
bmxpa2VseSB0byBjaGFuZ2UgYmVjYXVzZSBpdCB3b3VsZCBiZSBwYWluZnVsIGZvcg0KPiA+ID4g
PiBub3QgbXVjaCBiZW5lZml0Lg0KPiA+ID4gDQo+ID4gPiBPdGhlciBhcmNocyBjYW5ub3QgZWFz
aWx5IGNoYW5nZSBmb3IgbXVjaCB0aGUgc2FtZSByZWFzb24gOi0pDQo+ID4gDQo+ID4gUmVhbGx5
PyBJIGZpZ3VyZWQgeW91IGNvdWxkIGp1c3QgYWRkIGV4dHJhIGVycm9yIGluZGljYXRpb24gaW4g
a2VybmVsIHN5c2NhbGwgSS9GLg0KPiA+IEV2ZW50dWFsbHkgdXNlciBzcGFjZSBjb3VsZCBtaWdy
YXRlIHRvIHRoZSBuZXcgaW5kaWNhdGlvbi4NCj4gDQo+IFlvdSBzZWVtIHRvIGFzc3VtZSBhbGwg
dXNlciBzcGFjZSB1c2VzIGdsaWJjLCBvciAqYW55KiBsaWJjIGV2ZW4/ICBUaGlzDQo+IGlzIGZh
bHNlLiAgU29tZSBwcm9ncmFtcyBkbyBzeXN0ZW0gY2FsbHMgZGlyZWN0bHkuICBEbyBub3QgYnJl
YWsgdGhlDQo+IGtlcm5lbCBBQkkgOi0pDQoNCkFkZGluZyBhbiBleHRyYSBpbmRpY2F0b3IgZG9l
cyBub3QgYnJlYWsgQUJJLCBkb2VzIGl0ID8NClcuci50IGJyZWFraW5nIEFCSSwgaXNuJ3QgdGhh
dCB3aGF0IFBvd2VyUEMgaXMgdHJ5aW5nIHRvIGRvIHdpdGggdGhlIG5ldyBzeXNjYWxsIEkvRj8g
DQoNCiBKb2NrZQ0K
