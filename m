Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2619C290D35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 23:22:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCfHg2V01zDqpk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 08:22:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.55; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=mftObbXZ; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCfFV21MzzDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 08:20:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAaEk/jT3vCYVkgz7cVuv+TyWts2dxOALxPqlQhNtdy/tWTSbN4OJQzsCcgJFKkuzGihT6nCiLb8yTyp3eO2Cq3vzEgUOnMQzDatRQ1oKKy/iZPZcjnGN5N4Dg5Un64eVH8Y2OXk98Ta1aJVxfbFxVrlvcmiXph2ufARlp3Qvly/hL/Q4vnCR4vHGyJzJS76ICOKRyB6Sf9kocfCNiHOHUbaSlFhwYmtTCgmdJjuIndqOP5xhz6hE9RCUEcnL3xN7zZhbt8BccyYHva9Vq6Cd++BPyUqu2NN/xPxYy5E7F7ETQNvkynOBScCPVBI6I+kVUfl9iB7ep14Z5FZHOjqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hz8qTgkyBLowAHVw9ZhyYOpgOFg5eejo14Jj5JjfC3Q=;
 b=AX5nXCDH0khz2zh27fkrDxSiaSo7unzL33TIhtIq8nUQaU5Mkauq2h4VSh4v4sNe4DJadGUsyNc63RzFNCWfGCJpSEg1x4jNa66DePemDT4qWIJ9KGHcDr2TESg42j4HhF4iEYjzIIY//CbaOfFyzHpKyh6LS55H8g7KcV4VlYncE47M/EBv2su5m9kHfi3q74syDNjCdQIsP4FFaCdqIEeLvTjUTRct0MCJNecq44qVkGPLMbxVUl3wMQl6W8vZ7pn0XiuU4EDJgPrHOVaZNW2l+zXzn97zFMifPBA+lZqfaeTpBe4NOtmtzBGyodhTXVYki3cb/cUq9fOS6+1o2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hz8qTgkyBLowAHVw9ZhyYOpgOFg5eejo14Jj5JjfC3Q=;
 b=mftObbXZA+/uqatunA3eQgUnIVpsKFNWxO555NeVbGbE7h/IkVDH+jSaTocvflzKfJBS+UtKHXyyGiUUsY/pdtngpmfWpkhMYmrvQVdmTwwwCLPlaxpR2+1SbXnr2YwDGXJK7L1J6PpisIbWjvOLVgEYe29IZuOnuJTsLbwWthY=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VI1PR04MB5949.eurprd04.prod.outlook.com (2603:10a6:803:da::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Fri, 16 Oct
 2020 21:20:20 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b106:ac49:e3c7:6dc8]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b106:ac49:e3c7:6dc8%7]) with mapi id 15.20.3477.021; Fri, 16 Oct 2020
 21:20:20 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Yi Wang <wang.yi59@zte.com.cn>, Roy Pledge <roy.pledge@nxp.com>, Laurentiu
 Tudor <laurentiu.tudor@nxp.com>
Subject: RE: [PATCH v2] soc: fsl: dpio: Change 'cpumask_t mask' to the
 driver's private data
Thread-Topic: [PATCH v2] soc: fsl: dpio: Change 'cpumask_t mask' to the
 driver's private data
Thread-Index: AQHWo4esz/0AiFkoRU+e9mBI5L5uvqmatrFQ
Date: Fri, 16 Oct 2020 21:20:20 +0000
Message-ID: <VE1PR04MB6687D89E4E1BDC4429552B8E8F030@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20201016064858.9438-1-wang.yi59@zte.com.cn>
In-Reply-To: <20201016064858.9438-1-wang.yi59@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zte.com.cn; dkim=none (message not signed)
 header.d=none;zte.com.cn; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.185.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 336c07bf-ecef-474b-5914-08d87219499d
x-ms-traffictypediagnostic: VI1PR04MB5949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB59495F57ED9B330D69EA71A08F030@VI1PR04MB5949.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6j7spWvTfYxtRqZppnnR7pRre/vf5VwjgLDn2aMSzZ8zBhszddq2pV7R/OrvXhzZc6pvGaC7DkCHL/ufAUy9ywU4fMFidDA7hOjfg9ky/52Wmg195jHUbMwI3teS1tO2SXOvJmnDIH0i2s/jMf7YNu1uzzctAUIECANR5oE1WlqXgl2Uft0DX9DQ6K6DnIlf07HDozrjRstiHPqYMTmTOgHsLjCBL+el3+H3JG5hJnav4v9Gf8P+nz5Rvr9t+OpKHmoeUjolS6ESbNEerDA/osVZ7rcONhWMB12HyKb1r2VZLWT+c7YZZnpROojW160hshQB51ve4b5Sc07rEgcJEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(86362001)(66446008)(316002)(54906003)(52536014)(26005)(110136005)(55016002)(478600001)(6636002)(9686003)(4326008)(33656002)(186003)(45080400002)(2906002)(83380400001)(6506007)(7696005)(64756008)(5660300002)(8676002)(66476007)(66556008)(76116006)(53546011)(71200400001)(8936002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: qHCe91yfm07rU93N91E4qZpMrUU1Cer3yXYljpouJGeghu5imyjqV/aFm/i6aWDokuiKewJyHQ1qNvOSJgG/4FvVzP1d6bmsR2O44UiGtfgNz30C+COW8fssOqRBDuxNPOkJ40VbK+zcG6ACOITUNH0PmLheJsNVQ8muREW7LuL7xFr4P3mHjLuQzXveQM8bdAnbmxcNJ0s3ZYNeq+70xczaJn1SlD5FCgNYk9z3VQDP/EfXZcdD2w0xuI09J4hzLrko1OcFTIXiYLyIQlWUUak1ZzXADM5iCGfL8msbuDIRjs91vwIBCcWbNiZYd+jOoJyK6FhkhCdlpfV42M5Gz9lZ3F510e3uULNvcdls/xhHBPJt3w1iaCN9Yo9ju9ZNeG8JrdwhnIL21IYakg+RQcn/Bi5+kgvCPE/Te6lfj6kyn6B1/IsrdBb491TeEZJIjs3t0TG8/L8f7TNo4D/tnlfz6n6oczNp1W0oqxV3UFS+i8RPTbz1OoUcnkDi2vwHlqT9+bPuzMicBSEU1c73EqqAp4e2pkyqReQn1TtFEIlAreGEmRLqAqU3SNWpiMRvefKlr8kJFFDkj6uPpc6jkfZdA775wn4xBd4QIZVXYM5y/zs6EBaN6XQ+7Wtdor8DumlutsEtkWg1vTsGVsldsA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336c07bf-ecef-474b-5914-08d87219499d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 21:20:20.6593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSV2dudpqL5pyeLxcR1Mmn/2Q99ZVj5sFtFVhLgeGrEz+0gUPHM9BkYTDgpiJT1xEoht1BEZvpFk0sILqxOeog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5949
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
Cc: "jiang.xuexin@zte.com.cn" <jiang.xuexin@zte.com.cn>,
 Hao Si <si.hao@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lin Chen <chen.lin5@zte.com.cn>,
 "xue.zhihong@zte.com.cn" <xue.zhihong@zte.com.cn>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWkgV2FuZyA8d2FuZy55
aTU5QHp0ZS5jb20uY24+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxNiwgMjAyMCAxOjQ5IEFN
DQo+IFRvOiBSb3kgUGxlZGdlIDxyb3kucGxlZGdlQG54cC5jb20+OyBMYXVyZW50aXUgVHVkb3IN
Cj4gPGxhdXJlbnRpdS50dWRvckBueHAuY29tPg0KPiBDYzogTGVvIExpIDxsZW95YW5nLmxpQG54
cC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eHBwYy0NCj4gZGV2QGxp
c3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4g
eHVlLnpoaWhvbmdAenRlLmNvbS5jbjsgd2FuZy55aTU5QHp0ZS5jb20uY247IGppYW5nLnh1ZXhp
bkB6dGUuY29tLmNuOw0KPiBIYW8gU2kgPHNpLmhhb0B6dGUuY29tLmNuPjsgTGluIENoZW4gPGNo
ZW4ubGluNUB6dGUuY29tLmNuPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjJdIHNvYzogZnNsOiBkcGlv
OiBDaGFuZ2UgJ2NwdW1hc2tfdCBtYXNrJyB0byB0aGUgZHJpdmVyJ3MNCj4gcHJpdmF0ZSBkYXRh
DQo+IA0KPiBGcm9tOiBIYW8gU2kgPHNpLmhhb0B6dGUuY29tLmNuPg0KPiANCj4gVGhlIGxvY2Fs
IHZhcmlhYmxlICdjcHVtYXNrX3QgbWFzaycgaXMgaW4gdGhlIHN0YWNrIG1lbW9yeSwgYW5kIGl0
cyBhZGRyZXNzDQo+IGlzIGFzc2lnbmVkIHRvICdkZXNjLT5hZmZpbml0eScgaW4gJ2lycV9zZXRf
YWZmaW5pdHlfaGludCgpJy4NCj4gQnV0IHRoZSBtZW1vcnkgYXJlYSB3aGVyZSB0aGlzIHZhcmlh
YmxlIGlzIGxvY2F0ZWQgaXMgYXQgcmlzayBvZiBiZWluZw0KPiBtb2RpZmllZC4NCj4gDQo+IER1
cmluZyBMVFAgdGVzdGluZywgdGhlIGZvbGxvd2luZyBlcnJvciB3YXMgZ2VuZXJhdGVkOg0KPiAN
Cj4gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRy
ZXNzIGZmZmYwMDAwMTJlOWI3OTANCj4gTWVtIGFib3J0IGluZm86DQo+ICAgRVNSID0gMHg5NjAw
MDAwNw0KPiAgIEV4Y2VwdGlvbiBjbGFzcyA9IERBQlQgKGN1cnJlbnQgRUwpLCBJTCA9IDMyIGJp
dHMNCj4gICBTRVQgPSAwLCBGblYgPSAwDQo+ICAgRUEgPSAwLCBTMVBUVyA9IDANCj4gRGF0YSBh
Ym9ydCBpbmZvOg0KPiAgIElTViA9IDAsIElTUyA9IDB4MDAwMDAwMDcNCj4gICBDTSA9IDAsIFdu
UiA9IDANCj4gc3dhcHBlciBwZ3RhYmxlOiA0ayBwYWdlcywgNDgtYml0IFZBcywgcGdkcCA9IDAw
MDAwMDAwNzVhYzVlMDcNCj4gW2ZmZmYwMDAwMTJlOWI3OTBdIHBnZD0wMDAwMDAyN2RiZmZlMDAz
LCBwdWQ9MDAwMDAwMjdkYmZmZDAwMywNCj4gcG1kPTAwMDAwMDI3YjZkNjEwMDMsIHB0ZT0wMDAw
MDAwMDAwMDAwMDAwDQo+IEludGVybmFsIGVycm9yOiBPb3BzOiA5NjAwMDAwNyBbIzFdIFBSRUVN
UFQgU01QDQo+IE1vZHVsZXMgbGlua2VkIGluOiB4dF9jb25udHJhY2sNCj4gUHJvY2VzcyByZWFk
X2FsbCAocGlkOiAyMDE3MSwgc3RhY2sgbGltaXQgPSAweDAwMDAwMDAwNDRlYTQwOTUpDQo+IENQ
VTogMTQgUElEOiAyMDE3MSBDb21tOiByZWFkX2FsbCBUYWludGVkOiBHICAgIEIgICBXDQo+IEhh
cmR3YXJlIG5hbWU6IE5YUCBMYXllcnNjYXBlIExYMjE2MEFSREIgKERUKQ0KPiBwc3RhdGU6IDgw
MDAwMDg1IChOemN2IGRhSWYgLVBBTiAtVUFPKQ0KPiBwYyA6IGlycV9hZmZpbml0eV9oaW50X3By
b2Nfc2hvdysweDU0LzB4YjANCj4gbHIgOiBpcnFfYWZmaW5pdHlfaGludF9wcm9jX3Nob3crMHg0
Yy8weGIwDQo+IHNwIDogZmZmZjAwMDAxMTM4YmMxMA0KPiB4Mjk6IGZmZmYwMDAwMTEzOGJjMTAg
eDI4OiAwMDAwZmZmZmQxMzFkMWUwDQo+IHgyNzogMDAwMDAwMDAwMDcwMDBjMCB4MjY6IGZmZmY4
MDI1Yjk0ODBkYzANCj4geDI1OiBmZmZmODAyNWI5NDgwZGE4IHgyNDogMDAwMDAwMDAwMDAwMDNm
Zg0KPiB4MjM6IGZmZmY4MDI3MzM0ZjgzMDAgeDIyOiBmZmZmODAyNzJlOTdkMDAwDQo+IHgyMTog
ZmZmZjgwMjcyZTk3ZDBiMCB4MjA6IGZmZmY4MDI1Yjk0ODBkODANCj4geDE5OiBmZmZmMDAwMDA5
YTQ5MDAwIHgxODogMDAwMDAwMDAwMDAwMDAwMA0KPiB4MTc6IDAwMDAwMDAwMDAwMDAwMDAgeDE2
OiAwMDAwMDAwMDAwMDAwMDAwDQo+IHgxNTogMDAwMDAwMDAwMDAwMDAwMCB4MTQ6IDAwMDAwMDAw
MDAwMDAwMDANCj4geDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAwMDAwMDAwMDAwMDA0MA0K
PiB4MTE6IDAwMDAwMDAwMDAwMDAwMDAgeDEwOiBmZmZmODAyNzM1Yjc5Yjg4DQo+IHg5IDogMDAw
MDAwMDAwMDAwMDAwMCB4OCA6IDAwMDAwMDAwMDAwMDAwMDANCj4geDcgOiBmZmZmMDAwMDA5YTQ5
ODQ4IHg2IDogMDAwMDAwMDAwMDAwMDAwMw0KPiB4NSA6IDAwMDAwMDAwMDAwMDAwMDAgeDQgOiBm
ZmZmMDAwMDA4MTU3ZDZjDQo+IHgzIDogZmZmZjAwMDAxMTM4YmMxMCB4MiA6IGZmZmYwMDAwMTJl
OWI3OTANCj4geDEgOiAwMDAwMDAwMDAwMDAwMDAwIHgwIDogMDAwMDAwMDAwMDAwMDAwMA0KPiBD
YWxsIHRyYWNlOg0KPiAgaXJxX2FmZmluaXR5X2hpbnRfcHJvY19zaG93KzB4NTQvMHhiMA0KPiAg
c2VxX3JlYWQrMHgxYjAvMHg0NDANCj4gIHByb2NfcmVnX3JlYWQrMHg4MC8weGQ4DQo+ICBfX3Zm
c19yZWFkKzB4NjAvMHgxNzgNCj4gIHZmc19yZWFkKzB4OTQvMHgxNTANCj4gIGtzeXNfcmVhZCsw
eDc0LzB4ZjANCj4gIF9fYXJtNjRfc3lzX3JlYWQrMHgyNC8weDMwDQo+ICBlbDBfc3ZjX2NvbW1v
bi5jb25zdHByb3AuMCsweGQ4LzB4MWEwDQo+ICBlbDBfc3ZjX2hhbmRsZXIrMHgzNC8weDg4DQo+
ICBlbDBfc3ZjKzB4MTAvMHgxNA0KPiBDb2RlOiBmOTAwMWJiZiA5NDNlMDczMiBmOTQwNjZjMiBi
NDAwMDA2MiAoZjk0MDAwNDEpDQo+IC0tLVsgZW5kIHRyYWNlIGI0OTViZGNiMGIzYjczMmIgXS0t
LQ0KPiBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uDQo+IFNNUDog
c3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMNCj4gU01QOiBmYWlsZWQgdG8gc3RvcCBzZWNvbmRhcnkg
Q1BVcyAwLDItNCw2LDgsMTEsMTMtMTUNCj4gS2VybmVsIE9mZnNldDogZGlzYWJsZWQNCj4gQ1BV
IGZlYXR1cmVzOiAweDAsMjEwMDYwMDgNCj4gTWVtb3J5IExpbWl0OiBub25lDQo+IC0tLVsgZW5k
IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBGYXRhbCBleGNlcHRpb24gXS0tLQ0KPiANCj4g
Rml4IGl0IGJ5IGNoYW5naW5nICdjcHVtYXNrX3QgbWFzaycgdG8gdGhlIGRyaXZlcidzIHByaXZh
dGUgZGF0YS4NCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guICBTb3JyeSB0byBjaGltZSBpbiBsYXRl
Lg0KDQpTaW5jZSB3ZSBhcmUgb25seSBzZXR0aW5nIHNpbmdsZSBiaXQgaW4gdGhlIGNwdW1hc2ss
IGl0IGlzIGFjdHVhbGx5IG5vdCBuZWNlc3NhcnkgdG8ga2VlcCB0aGUgY3B1bWFzayBpbiBwcml2
YXRlIGRhdGEgYXMgd2UgYWxyZWFkeSBrZXB0IHRoZSBjcHUgbnVtYmVyIGluIGRlc2MuY3B1LiAg
VGhlIGJldHRlciBhbmQgZWFzaWVyIGFwcHJvYWNoIGlzIHRvIGFjdHVhbGx5IHVzZSBnZXRfY3B1
X21hc2soY3B1KSBBUEkgdG8gZ2V0IHRoZSBwcmUtZGVmaW5lZCBjcHVtYXNrIGluIHRoZSBzdGF0
aWMgY3B1X2JpdF9iaXRtYXAgYXJyYXkuICBXZSBkb24ndCBldmVuIG5lZWQgdG8gZGVjbGFyZSB0
aGUgbWFzay9jcHVfbWFzayBpbiB0aGUgcmVnaXN0ZXJfZHBpb19pcnFfaGFuZGxlcnMoKS4NCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSGFvIFNpIDxzaS5oYW9AenRlLmNvbS5jbj4NCj4gU2lnbmVk
LW9mZi1ieTogTGluIENoZW4gPGNoZW4ubGluNUB6dGUuY29tLmNuPg0KPiBTaWduZWQtb2ZmLWJ5
OiBZaSBXYW5nIDx3YW5nLnlpNTlAenRlLmNvbS5jbj4NCj4gLS0tDQo+IHYyOiBQbGFjZSAnY3B1
bWFza190IG1hc2snIGluIHRoZSBkcml2ZXIncyBwcml2YXRlIGRhdGEgYW5kIHdoaWxlIGF0IGl0
LA0KPiByZW5hbWUgaXQgdG8gY3B1X21hc2suDQo+IA0KPiAgZHJpdmVycy9zb2MvZnNsL2RwaW8v
ZHBpby1kcml2ZXIuYyB8IDkgKysrKystLS0tDQo+ICBpbmNsdWRlL2xpbnV4L2ZzbC9tYy5oICAg
ICAgICAgICAgIHwgMiArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL2RwaW8vZHBp
by1kcml2ZXIuYyBiL2RyaXZlcnMvc29jL2ZzbC9kcGlvL2RwaW8tDQo+IGRyaXZlci5jDQo+IGlu
ZGV4IDdiNjQyYzMuLmU5ZDgyMGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9kcGlv
L2RwaW8tZHJpdmVyLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL2RwaW8vZHBpby1kcml2ZXIu
Yw0KPiBAQCAtOTUsNyArOTUsNyBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX2RwaW9faXJxX2hhbmRs
ZXJzKHN0cnVjdA0KPiBmc2xfbWNfZGV2aWNlICpkcGlvX2RldiwgaW50IGNwdSkNCj4gIHsNCj4g
IAlpbnQgZXJyb3I7DQo+ICAJc3RydWN0IGZzbF9tY19kZXZpY2VfaXJxICppcnE7DQo+IC0JY3B1
bWFza190IG1hc2s7DQo+ICsJY3B1bWFza190ICpjcHVfbWFzazsNCj4gDQo+ICAJaXJxID0gZHBp
b19kZXYtPmlycXNbMF07DQo+ICAJZXJyb3IgPSBkZXZtX3JlcXVlc3RfaXJxKCZkcGlvX2Rldi0+
ZGV2LA0KPiBAQCAtMTEyLDkgKzExMiwxMCBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX2RwaW9faXJx
X2hhbmRsZXJzKHN0cnVjdA0KPiBmc2xfbWNfZGV2aWNlICpkcGlvX2RldiwgaW50IGNwdSkNCj4g
IAl9DQo+IA0KPiAgCS8qIHNldCB0aGUgYWZmaW5pdHkgaGludCAqLw0KPiAtCWNwdW1hc2tfY2xl
YXIoJm1hc2spOw0KPiAtCWNwdW1hc2tfc2V0X2NwdShjcHUsICZtYXNrKTsNCj4gLQlpZiAoaXJx
X3NldF9hZmZpbml0eV9oaW50KGlycS0+bXNpX2Rlc2MtPmlycSwgJm1hc2spKQ0KPiArCWNwdV9t
YXNrID0gJmRwaW9fZGV2LT5tYXNrOw0KPiArCWNwdW1hc2tfY2xlYXIoY3B1X21hc2spOw0KPiAr
CWNwdW1hc2tfc2V0X2NwdShjcHUsIGNwdV9tYXNrKTsNCj4gKwlpZiAoaXJxX3NldF9hZmZpbml0
eV9oaW50KGlycS0+bXNpX2Rlc2MtPmlycSwgY3B1X21hc2spKQ0KPiAgCQlkZXZfZXJyKCZkcGlv
X2Rldi0+ZGV2LA0KPiAgCQkJImlycV9zZXRfYWZmaW5pdHkgZmFpbGVkIGlycSAlZCBjcHUgJWRc
biIsDQo+ICAJCQlpcnEtPm1zaV9kZXNjLT5pcnEsIGNwdSk7DQo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2ZzbC9tYy5oIGIvaW5jbHVkZS9saW51eC9mc2wvbWMuaA0KPiBpbmRleCBhNDI4
YzYxLi5lYmRmYjU0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZzbC9tYy5oDQo+ICsr
KyBiL2luY2x1ZGUvbGludXgvZnNsL21jLmgNCj4gQEAgLTE1MSw2ICsxNTEsNyBAQCBzdHJ1Y3Qg
ZnNsX21jX29ial9kZXNjIHsNCj4gIC8qKg0KPiAgICogc3RydWN0IGZzbF9tY19kZXZpY2UgLSBN
QyBvYmplY3QgZGV2aWNlIG9iamVjdA0KPiAgICogQGRldjogTGludXggZHJpdmVyIG1vZGVsIGRl
dmljZSBvYmplY3QNCj4gKyAqIEBtYXNrOiBjcHUgbWFzayBmb3IgYWZmaW5pdHlfaGludA0KPiAg
ICogQGRtYV9tYXNrOiBEZWZhdWx0IERNQSBtYXNrDQo+ICAgKiBAZmxhZ3M6IE1DIG9iamVjdCBk
ZXZpY2UgZmxhZ3MNCj4gICAqIEBpY2lkOiBJc29sYXRpb24gY29udGV4dCBJRCBmb3IgdGhlIGRl
dmljZQ0KPiBAQCAtMTg0LDYgKzE4NSw3IEBAIHN0cnVjdCBmc2xfbWNfb2JqX2Rlc2Mgew0KPiAg
ICovDQo+ICBzdHJ1Y3QgZnNsX21jX2RldmljZSB7DQo+ICAJc3RydWN0IGRldmljZSBkZXY7DQo+
ICsJY3B1bWFza190IG1hc2s7DQo+ICAJdTY0IGRtYV9tYXNrOw0KPiAgCXUxNiBmbGFnczsNCj4g
IAl1MTYgaWNpZDsNCj4gLS0NCj4gMi4xNS4yDQo=
