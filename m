Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6624B13A3AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 10:20:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xlLY1QB2zDqN3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 20:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.53; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=U2ERUgUs; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xlJP6gh7zDq9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 20:18:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icwqyOHJOZzbrh24eq27wgn9FpqdBFFtOyyUHZXGQHORzaShHZ/YjwcC8YaiV6bdReYKDmcqHqNucHTpvSeDajFZ2GL1/5CmRUbOhDGXrt5xve0a9R1OSBRG5Q8rQwwoNNYcytABlpRGP5/I6x7m3511mGSQngK4ThQsstmIRugjh1ajWCWRJil7KW2m0Wp/9Sway5xq+6zQulZcDRFDOLJylKqAmyd7v8gMvesLxob3I8zBZmf5SZjL2sQUYvw/q4rFmlD/FYMXXGhvLk54YaftcCRWK6M/tcgOwXNKLmlp5hAHHPFxLi20vCjp66ZNb7CyGoiYr1F3+JJ+Br1whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCAeHVLnuAKA404Da1gLxidImbEoQbb7cppqruuhfHo=;
 b=lz+ygtfnJTG/n81Tsw23uD+BewSexCk9nJqgOUTThZs8f3VVwty4AgA3tmtQFNy+Xt7znglBtT7VW4/wrdy0Bbvdv+vw9EkNhEwqQtLcJIb7FlE3+HiK8hfTvlIoSC98fdXWTWQuqkHZqN3lFWBkwgaKlN/yEQFWrkH9tFm4p7VX4CEWRET1C+dINJZb3q52Lr/SX2iS6hWV6pKaNYcQ4Q1yScLg1YBfRMOSo8jSpmDduMajEYlmfRszHnuLe72SAK3ISOCEgvz7aOwnNlj6eQI+X2FspfPaNr4DgSQsMWYZ3EoK98JEZHvfGOJSnzvCn4pkWncYfeOAfMcBBpLTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCAeHVLnuAKA404Da1gLxidImbEoQbb7cppqruuhfHo=;
 b=U2ERUgUshVAKuxMqxF32Q2UPnbqimxoRJ7W/i1FVz1Nw4BZ5yidtE0JJ73Xs81K53qH6kqcqY/fA0ijzvfmJAsHHC4P2VmI+h1IMGtsUNUiTTomjYj0jwAcFW12dw0jLZ2/LfNodHIJ8+k+XVucHfk0Eh8bg5PPtCPKHfE7D5aA=
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com (20.179.0.89) by
 AM6PR04MB4392.eurprd04.prod.outlook.com (20.177.39.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Tue, 14 Jan 2020 09:18:53 +0000
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::932:9fab:97d3:1a82]) by AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::932:9fab:97d3:1a82%7]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 09:18:53 +0000
Received: from [10.171.82.13] (89.37.124.34) by
 LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Tue, 14 Jan 2020 09:18:52 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Timur Tabi <timur@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Scott Wood
 <swood@redhat.com>, York Sun <york.sun@nxp.com>, "b08248@gmail.com"
 <b08248@gmail.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Thread-Topic: [PATCH] evh_bytechan: fix out of bounds accesses
Thread-Index: AQHVxr/zKCtNFfWOrE6GT6IEXEdd/Kfoi7oAgAAXDACAAC53AIAAkBCAgACIdgA=
Date: Tue, 14 Jan 2020 09:18:53 +0000
Message-ID: <50f587a7-ce2d-08e1-3b28-15afb04b6463@nxp.com>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <8736cj8rvr.fsf@mpe.ellerman.id.au>
 <5f17b997-8a6c-841e-8868-c0877750e598@kernel.org>
 <47d31d84-78ed-fd90-f3d9-8ce968126497@nxp.com>
 <87tv4yalmm.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tv4yalmm.fsf@mpe.ellerman.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::27) To AM6PR04MB5878.eurprd04.prod.outlook.com
 (2603:10a6:20b:a2::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 09a15e7a-c0eb-446d-78f8-08d798d2c5f4
x-ms-traffictypediagnostic: AM6PR04MB4392:|AM6PR04MB4392:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB439285AC7DBBB2F71F6BD259EC340@AM6PR04MB4392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(316002)(44832011)(956004)(478600001)(110136005)(2616005)(31696002)(66946007)(6486002)(66446008)(54906003)(66556008)(53546011)(52116002)(4326008)(16576012)(64756008)(66476007)(16526019)(186003)(5660300002)(31686004)(71200400001)(8676002)(26005)(81156014)(2906002)(36756003)(8936002)(81166006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4392;
 H:AM6PR04MB5878.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KapD0HP0aDeN5REw0MnI1xBIJKLq0el7WP3HeXInAety8D/xBUFYimFp+Wdr7xPcc4wJ7Nt3zAYEz2YeArdqqtoVjY8sLXjrQ4PX+qkBnXlfcl8ePmlBOY+K/LLhfBY1x7nSAozX8iB1Iz5qGX/b4sVfWsZ82fVSeRZDool106I8h9ETTAHHKgfUTV4byECYl1C94LuO4/nnu+NtvQ2Gam1HBF2BP/p35PnjVOrEz5shFVS467kVjpcrtJWyEQ20PplzxW+I602D6yyVToV5kPpswc6wjNZ3YwV/ai/65dGjxOgAyWkW03V7NjSmzeNjENjSZk7A5yhy+nF4y/8vDHt8OUgY/c5uDRTN+rs+8uytO/MMeiFi3KxSCnDyepAL9JbOE0gZu1eqlWO+qYGiSjM4JhWPz32V9l9E/L57Ifz5YxGL5YvfhN9e8NYRDYOI
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF60B7B425C2D64990D9140BD49224B4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a15e7a-c0eb-446d-78f8-08d798d2c5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 09:18:53.0550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5MlcTvcKja/+uut0GnhE08n8UqU+uvhgzsoDkwibJ0APlU4XuwB95UGzVCsUiLETIERF4TqsSrzj+cXlZTTaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4392
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
Cc: Diana Madalina Craciun <diana.craciun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMTQuMDEuMjAyMCAwMzoxMCwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4gTGF1cmVudGl1
IFR1ZG9yIDxsYXVyZW50aXUudHVkb3JAbnhwLmNvbT4gd3JpdGVzOg0KPj4gSGVsbG8sDQo+Pg0K
Pj4gT24gMTMuMDEuMjAyMCAxNTo0OCwgVGltdXIgVGFiaSB3cm90ZToNCj4+PiBPbiAxLzEzLzIw
IDY6MjYgQU0sIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6DQo+Pj4+IEkndmUgbmV2ZXIgaGVhcmQg
b2YgaXQsIGFuZCBJIGhhdmUgbm8gaWRlYSBob3cgdG8gdGVzdCBpdC4NCj4+Pj4NCj4+Pj4gSXQn
cyBub3QgdXNlZCBieSBxZW11LCBJIGd1ZXNzIHRoZXJlIGlzL3dhcyBhIEZyZWVzY2FsZSBoeXBl
cnZpc29yIHRoYXQNCj4+Pj4gdXNlZCBpdC4NCj4+Pg0KPj4+IFllcywgdGhlcmUgaXMvd2FzIGEg
RnJlZXNjYWxlIGh5cGVydmlzb3IgdGhhdCBJIGFuZCBhIGZldyBvdGhlcnMgd29ya2VkDQo+Pj4g
b24uwqAgSSd2ZSBhZGRlZCBhIGNvdXBsZSBwZW9wbGUgb24gQ0MgdGhhdCBtaWdodCBiZSBhYmxl
IHRvIHRlbGwgdGhlDQo+Pj4gY3VycmVudCBkaXNwb3NpdGlvbiBvZiBpdC4NCj4+DQo+PiBNb3Jl
IGluZm8gb24gdGhpczogaXQncyBvcGVuc291cmNlIGFuZCBpdCdzIHB1Ymxpc2hlZCBoZXJlIFsx
XS4gV2Ugc3RpbGwNCj4+IGNsYWltIHRvIG1haW50YWluIGl0IGJ1dCB0aGVyZSB3YXNuJ3QgbXVj
aCBhY3Rpdml0eSBwYXN0IHllYXJzLCBhcyBvbmUNCj4+IG1pZ2h0IG5vdGljZS4NCj4+DQo+Pj4+
IEJ1dCBtYXliZSBpdCdzIHRpbWUgdG8gcmVtb3ZlIGl0IGlmIGl0J3Mgbm90IGJlaW5nIG1haW50
YWluZWQvdXNlZCBieQ0KPj4+PiBhbnlvbmU/DQo+Pj4NCj4+PiBJIHdvdWxkbid0IGJlIGNvbXBs
ZXRlbHkgb3Bwb3NlZCB0byB0aGF0IGlmIHRoZXJlIHJlYWxseSBhcmUgbm8gbW9yZQ0KPj4+IHVz
ZXJzLsKgIFRoZXJlIHJlYWxseSB3ZXJlbid0IGFueSB1c2VycyBldmVuIHdoZW4gSSB3cm90ZSB0
aGUgZHJpdmVyLg0KPj4NCj4+IFRoZXJlIGFyZSBhIGZldyB1c2VycyB0aGF0IEkga25vdyBvZiwg
YnV0IEkgY2FuJ3QgdGVsbCBpZiB0aGF0J3MgZW5vdWdoDQo+PiB0byBqdXN0aWZ5IGtlZXBpbmcg
dGhlIGRyaXZlci4NCj4gDQo+IEl0IGlzLCBJIGRvbid0IHdhbnQgdG8gcmVtb3ZlIGNvZGUgdGhh
dCBwZW9wbGUgYXJlIGFjdHVhbGx5IHVzaW5nLA0KPiB1bmxlc3MgaXQncyBjYXVzaW5nIHVuc3Vz
dGFpbmFibGUgbWFpbnRlbmFuY2UgYnVyZGVuLg0KPiANCj4gQnV0IHRoaXMgc2hvdWxkIGJlIGVh
c3kgZW5vdWdoIHRvIGdldCBmaXhlZC4NCg0KUmlnaHQuIEkgc2VlIHRoYXQgU3RlcGhlbiBhbHJl
YWR5IGNhbWUgdXAgd2l0aCBhIHByb3Bvc2FsIGZvciBhIGZpeC4NCg0KPiBDb3VsZCB5b3Ugb3Ig
c29tZW9uZSBlbHNlIGF0IE5YUCB2b2x1bnRlZXIgdG8gbWFpbnRhaW4gdGhpcyBkcml2ZXI/IFRo
YXQNCj4gc2hvdWxkbid0IGludm9sdmUgbXVjaCB3b3JrLCBvdGhlciB0aGFuIGZpeGluZyBzbWFs
bCB0aGluZ3MgbGlrZSB0aGlzDQo+IHdhcm5pbmcuDQoNCkkgY2FuIG9mZmVyIG15c2VsZi4gSSds
bCBzZW5kIGEgTUFJTlRBSU5FUlMgcGF0Y2ggaWYgbm9ib2R5IGlzIGFnYWluc3QgaXQuDQoNCi0t
LQ0KQmVzdCBSZWdhcmRzLCBMYXVyZW50aXUNCg==
