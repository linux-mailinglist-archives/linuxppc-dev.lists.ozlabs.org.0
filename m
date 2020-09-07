Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9725FD50
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 17:42:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlXbV6cSZzDqNp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 01:42:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.237.88;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=HX7J/T2b; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlXW81DNCzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 01:38:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC2ACyp6bHZx0kxfNaheYqipZ2m08f3fiSGvX9PqAG+/V1pt74fk/70SBPITQ1Oluna6KJSZqXaZ73Har3FbzD1MY7jkKpCZ9nFhx50B3Yy4LYtDhNUhSTwLDc6U7ysGd5kVYG0gk1H33MzrYXEtFMPlONaRyc3k8IAVoIdWSPZd9ALioM6b8M8xlVIPkNhnVUjr5iyUKxiX0XTugoSHhI0WWFpSV4EtbyH/xGdyhil/QCMOS9VsMF14EuXFqYfzT6Dp3Eqvpc8dIAkOI6m/pwHntMCXZ0FiFrGJVLsA712jOAXPV34q5POEpWRvur1VOCBGSQiGgF1mjFiRSC4Tfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihe6/PY8x7jgMUtSRi9RjGktMK+6ZT5krQXAd6IahAc=;
 b=eQWdmuj6u+FdtE/ol2TRp7HxmBVss9rGemyAkVQPCiKTpB/RapzEbmYzKUwKYZBpzF7tC06CEPPsMQMpRI/1Siz2JVx6eQyjJU7kIFU5K+NiFDxbUPkLqEkLGRbeejLaZeSLLQTF2zaY+B63pP2ReNLefEwfwr5QhFl2MO5tmMygclTadPtduWwYD8g6fUBj5ttjFLmgYKdvDrsy6lpP/JVirJIiiQhyUkMUB0Gtpm/KIvitm+SgSWYctsrL83bDYp0QESq+xAI9JBqV0VMSCXfHFtkuRk/KfaBUInnM7tXT5nK/gR2PdJBgigEmtSorwHWrpHtn0YyI637d+lT1Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihe6/PY8x7jgMUtSRi9RjGktMK+6ZT5krQXAd6IahAc=;
 b=HX7J/T2btCfxbGzmy0IOgn9qacGA4Rq6BIZvr+XQewx8AAindcNCNXZTnaiEc6y+IO29d0ssSZ/0ewjWPJTZPtUy4WtuUyP+K+kQ6+p0VWaeOW27Zjq2N7PWWpUUtQsVJVlFsDWXwssJyn7TjDwcsRFOnQvZVZrKk2yjtUj5yEw=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2312.namprd10.prod.outlook.com
 (2603:10b6:910:49::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Mon, 7 Sep
 2020 15:38:37 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d%7]) with mapi id 15.20.3326.026; Mon, 7 Sep 2020
 15:38:37 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "broonie@kernel.org"
 <broonie@kernel.org>, "paulus@samba.org" <paulus@samba.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "Chris.Packham@alliedtelesis.co.nz"
 <Chris.Packham@alliedtelesis.co.nz>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4CAB+sMAIAAYfwAgAEDTwCAAPtVgIAAOXwAgABIbACAAAjQgIABm7wAgAD5+gCABBXPAIAAjqOAgAALRACAAAUXgIAA9CsAgADXoQCAAFDQAIAETfoAgAVdPQCAAGBxgA==
Date: Mon, 7 Sep 2020 15:38:37 +0000
Message-ID: <a6bae2a775c3e6b9115a1371157404c4e0f8a73a.camel@infinera.com>
References: <1598940515.6e06nwgi0c.astroid@bobo.none>
 <6054f0ec-d994-105b-6399-6cdb65ddd1b6@alliedtelesis.co.nz>
 <23d13439e4cc1872c29db2f93e715a61f4843943.camel@infinera.com>
In-Reply-To: <23d13439e4cc1872c29db2f93e715a61f4843943.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.92 
authentication-results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92efe64c-e5cf-4452-de44-08d85344167d
x-ms-traffictypediagnostic: CY4PR1001MB2312:
x-microsoft-antispam-prvs: <CY4PR1001MB231272194898BAB67411D6ABF4280@CY4PR1001MB2312.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lxiyakzUWYe5hL06403QHbO5tSVKvCYHMowuV5Fcfg0vbtfY+7V6gxX3v0SZ8Q4ddZh032iR9AoUy3KmE7ByUPp5P0T7ZGsvcw5dWJYb7zBWTgdMuDHWr7Bh+Yl9ltW4ZbVhpmaKsCLoBLFKn4PuUnvPdH3cxgUJx9+BdTKx7SkdkktSFlf4PY+c76czI8WDVHkzrs6ADcvZxYo3iaHYsKG8AZSVHN6mojBFD/pK4dgaXrBH954apyPvu7arJGeMAUV+daxEwG4Cm/bm1MEVGcMgoCyqg9K/f1cI6ryFJdTb3TJGM0u1HfBLC/aUD/uuQAnstzBdUcBSfJOVtEJwJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(6486002)(8936002)(5660300002)(4326008)(8676002)(186003)(54906003)(2616005)(316002)(86362001)(6506007)(110136005)(478600001)(66946007)(64756008)(66446008)(36756003)(66556008)(66476007)(91956017)(76116006)(2906002)(7416002)(6512007)(71200400001)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: L/AECQQhP2PIio0kWOwUiBwz9BLQcunhjmFRvorQA9cmyu9EkXHuFSy66Vg2petGZhwKL0h0ExGAcWNYfyZHHU+pU1JSuAJUvKvgEWJpPQPI99mHiOuJHuC8O7H3sa86rZOkYxaTRzHgV5MzSyJrs2KsQxBTlM0GYvs84Km3WAOho2Z0WOu4XJz1pnJ7Hx1QVIjuAd+CfcN6kfm8XSoMnniBjdunAAuutmL3MxvObVpWq+hkmdoAo49v11CeG1lkzuwEdAJr/mBJ96xpoVPP21NusZUMucMAElm1XsyvQ4SBRmg6Ro4kIFmGwXzzCOHB7fDlpos4GzgFPIwn4Y1JbdNBO/TcEZZ2b3TbHDpcx5XW7IvyFbiMej0PkKl+Mn96GBgGpHnh9wOtSAsoaacn9PMooMSheC9nl60WkHayIQL9SV9LNDXUAiHFNYpW5s/Wp6mMR6VT1ontaIb8hX2h/PVJBa8/GCFjo7yABN1mAwy6KlU6BUWT/TW0b5GnqOlWMJKfvrBz72V+Tu4IwSl71V2ahdWXfPt9tCvcrt+b8f7Z7/LO6+KwzVP1WTu8CmP3oLT4kdPOeKdMVq27OvYlyHsFvXnSZxJ1zIvQt1tEyKAuIeq3npqAfQtLwBMk7fDWjmHCs25IGP8U0tQPib93Pw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <806B7407E014DA4A9B4348B2D1F8516F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92efe64c-e5cf-4452-de44-08d85344167d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 15:38:37.1515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Se9W/nknR1rFsXGgkMNmjO5Tnm5nGWCdNm8jVqSYINkXvgPoVTDIvvYLQYkFV4npHufv10ngzQnRnHZ97fYCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2312
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

W1NOSVBdDQo+ID4gDQoNCj4gPiA+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIGZ0cmFjZSB0aGUgaW50
ZXJydXB0IGhhbmRsZXIgZnVuY3Rpb24gYW5kIHNlZSBpZiB5b3UNCj4gPiA+IGNhbiBzZWUgYSBk
aWZmZXJlbmNlIGluIG51bWJlciBvciB0aW1pbmcgb2YgaW50ZXJydXB0cz8gSSdtIGF0IGEgYml0
IG9mDQo+ID4gPiBhIGxvc3MuDQo+ID4gDQo+ID4gSSB0cmllZCBmdHJhY2UgYnV0IEkgcmVhbGx5
IHdhc24ndCBzdXJlIHdoYXQgSSB3YXMgbG9va2luZyBmb3IuDQo+ID4gQ2FwdHVyaW5nIGEgImJh
ZCIgY2FzZSB3YXMgcHJldHR5IHRyaWNreS4gQnV0IEkgdGhpbmsgSSd2ZSBpZGVudGlmaWVkIGEN
Cj4gPiBmaXggKEknbGwgc2VuZCBpdCBhcyBhIHByb3BlciBwYXRjaCBzaG9ydGx5KS4gVGhlIGdp
c3QgaXMNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWZzbC1lc3BpLmMg
Yi9kcml2ZXJzL3NwaS9zcGktZnNsLWVzcGkuYw0KPiA+IGluZGV4IDdlN2M5MmNhZmRiYi4uY2Ix
MjBiNjhjMGUyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1mc2wtZXNwaS5jDQo+
ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWZzbC1lc3BpLmMNCj4gPiBAQCAtNTc0LDEzICs1NzQs
MTQgQEAgc3RhdGljIHZvaWQgZnNsX2VzcGlfY3B1X2lycShzdHJ1Y3QgZnNsX2VzcGkNCj4gPiAq
ZXNwaSwgdTMyIGV2ZW50cykNCj4gPiDCoMKgc3RhdGljIGlycXJldHVybl90IGZzbF9lc3BpX2ly
cShzMzIgaXJxLCB2b2lkICpjb250ZXh0X2RhdGEpDQo+ID4gwqDCoHsNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgZnNsX2VzcGkgKmVzcGkgPSBjb250ZXh0X2RhdGE7DQo+ID4gLSAgICAg
ICB1MzIgZXZlbnRzOw0KPiA+ICsgICAgICAgdTMyIGV2ZW50cywgbWFzazsNCj4gPiANCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2soJmVzcGktPmxvY2spOw0KPiA+IA0KPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoC8qIEdldCBpbnRlcnJ1cHQgZXZlbnRzKHR4L3J4KSAqLw0KPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoGV2ZW50cyA9IGZzbF9lc3BpX3JlYWRfcmVnKGVzcGksIEVTUElfU1BJRSk7
DQo+ID4gLSAgICAgICBpZiAoIWV2ZW50cykgew0KPiA+ICsgICAgICAgbWFzayA9IGZzbF9lc3Bp
X3JlYWRfcmVnKGVzcGksIEVTUElfU1BJTSk7DQo+ID4gKyAgICAgICBpZiAoIShldmVudHMgJiBt
YXNrKSkgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9j
aygmZXNwaS0+bG9jayk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBJUlFfTk9ORTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gDQo+ID4gVGhlIFNQ
SUUgcmVnaXN0ZXIgY29udGFpbnMgdGhlIFRYQ05UIHNvIGV2ZW50cyBpcyBwcmV0dHkgbXVjaCBh
bHdheXMNCj4gPiBnb2luZyB0byBoYXZlIHNvbWV0aGluZyBzZXQuIEJ5IGNoZWNraW5nIGV2ZW50
cyBhZ2FpbnN0IHdoYXQgd2UndmUNCj4gPiBhY3R1YWxseSByZXF1ZXN0ZWQgaW50ZXJydXB0cyBm
b3Igd2UgZG9uJ3Qgc2VlIGFueSBzcHVyaW91cyBldmVudHMuDQo+ID4gDQo+ID4gSSd2ZSB0ZXN0
ZWQgdGhpcyBvbiB0aGUgVDIwODBSREIgYW5kIG9uIG91ciBjdXN0b20gaGFyZHdhcmUgYW5kIGl0
IHNlZW1zDQo+ID4gdG8gcmVzb2x2ZSB0aGUgcHJvYmxlbS4NCj4gPiANCj4gDQo+IEkgbG9va2Vk
IGF0IHRoZSBmc2xfZXNwaV9pcnEoKSB0b28gYW5kIG5vdGljZWQgdGhhdCBjbGVhcmluZyBvZiB0
aGUgSVJRIGV2ZW50cw0KPiBhcmUgYWZ0ZXIgcHJvY2Vzc2luZyBUWC9SWC4gVGhhdCBsb29rcyBh
IGJpdCBvZGQgdG8gbWUuDQoNCkkgc2hvdWxkIGhhdmUgYmVlbiBtb3JlIHNwZWNpZmljLiBJIHRo
aW5rIHlvdSBjYW4gbG9vc2UgSVJRcyBhcyBmc2xfZXNwaV9pcnEoKSB3b3JrcyBub3cuDQpDb25z
aWRlciB0aGlzOg0KMSkgWW91IGdldCBUWCBJUlEgYW5kIGVudGVyIGZzbF9lc3BpX2lycSgpDQoy
KSBFbnRlciBmc2xfZXNwaV9maWxsX3R4X2ZpZm8oKSB0byBwcm9jZXNzIGFueSBjaGFycyB1bnRp
bCBkb25lLg0KMykgTm93IHlvdSBnZXQgb25lIG1vcmUgVFggSVJRDQo0KSBmc2xfZXNwaV9pcnEo
KSBjbGVhciBldmVudHMgLT4gSVJRIGZyb20gMykgaXMgbG9zdC4NCg0KIEpvY2tlDQo=
