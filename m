Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D41F150E48
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 18:00:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BDbv0QcLzDqLM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 04:00:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.68.87;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=Lk62Mgcn; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680087.outbound.protection.outlook.com [40.107.68.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BDX45qdXzDqGl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 03:57:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9jRuk5x8vIIo/WmrUqLgorQOUwaPXWTMDgAWBwkMG50YgSi1njqS6sjDu7Zbcfz5kl70BYj7iEvxTiTDPGk4r/RHMafN80O1NZJcqQ5bd0cx8OsePUntLBUlnbdgGdOC2uk/iI9ucZap4ja+1wXh95OlTKXOvdPM1Z6YQP4fPhqNHxz988PUw3zfQ8VZZisq0oe3IlpOmZpkuaGcbSs1yaaSqWMM79uT8Vc+r9l5njIzA/5dgBae1IEURF/DZKqRVdXW+phi7pf91l/agIJLdCm9L4WEccAV7KaBSaA1/h/gom52AVJHaGi+poa19tXhzxJmbw/4j+PyUlgOx20ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oG8EhnfJI/mtTvQpd7S/DQAPmeWwUzWs3Q+kAr3FOw=;
 b=MGlkl43AkUFLeO1ougsCCnXvuVggIy/i3dC3sj9XHIj1UggjkuOD7QnI+2k9HVPGuYRY1aK+D2DyQepvUIMZDngu3V0gCmNP5e/l8Vjptxjcmv0tUSieeY9lATtI+uNyijF6e2u+pwi8PqiKR+KeuoCJT6+obT4i0XclBPBAiieKDkGoYztEiCwAYGTU8vINpnvAUv5kdUMtZq+agv7eQK9fALHpiLZYyMbnhBbghPCIP5wtuzQLNHtjQmNeguMr9/J+vEZNO6Cy5K/SFbarKH/y24QFiFcnZfhfCpwb7Yad22V30qOEK6YY2spn7SD7Gt4GB07kvDJyGUmzk1SvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oG8EhnfJI/mtTvQpd7S/DQAPmeWwUzWs3Q+kAr3FOw=;
 b=Lk62MgcntyyQT0p08lgXoJl0ynuwKEY1Zso9pVjhpPynqnd6ppxuwPHzu/snrwVOqhExU8EAU/5iMHJxXjBTTYQ02rfLbfgx3fYu/1ZZN8WHh0dXJizX6BXkitU+lT/0pPB8f0bSL6HRNRURETge/FgP4TQUTnp7Cslrnxkoi3c=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.77.152) by
 BN8PR10MB3122.namprd10.prod.outlook.com (20.179.136.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.30; Mon, 3 Feb 2020 16:57:19 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::6922:a072:d75e:74ef]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::6922:a072:d75e:74ef%7]) with mapi id 15.20.2686.031; Mon, 3 Feb 2020
 16:57:19 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "paulus@samba.org" <paulus@samba.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/32s: Slenderize _tlbia() for powerpc 603/603e
Thread-Topic: [PATCH] powerpc/32s: Slenderize _tlbia() for powerpc 603/603e
Thread-Index: AQHV2rIGZrz+QhEtGU6AUzvbXw5RXKgJsJeA
Date: Mon, 3 Feb 2020 16:57:18 +0000
Message-ID: <bfab6635148b83deed8ac9fcbb19dde8c32fb988.camel@infinera.com>
References: <12f4f4f0ff89aeab3b937fc96c84fb35e1b2517e.1580748445.git.christophe.leroy@c-s.fr>
In-Reply-To: <12f4f4f0ff89aeab3b937fc96c84fb35e1b2517e.1580748445.git.christophe.leroy@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f155cfb-76c1-4f58-ef69-08d7a8ca213d
x-ms-traffictypediagnostic: BN8PR10MB3122:
x-microsoft-antispam-prvs: <BN8PR10MB312290A6882919B4C066B363F4000@BN8PR10MB3122.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(4326008)(71200400001)(81166006)(66946007)(66446008)(54906003)(186003)(81156014)(6486002)(36756003)(5660300002)(6512007)(86362001)(8936002)(2906002)(6506007)(2616005)(110136005)(478600001)(26005)(76116006)(91956017)(64756008)(66556008)(66476007)(316002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3122;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tX6bXyu0maiQa28Xs2liHjRK4uz5jjiQUAuVlEDs/8WQeILM2kK7a1m/ACjOmvwVADp209CZxb1Cimf3WYEVShHLh8cavYP8bUc1bFaxsedHJg9dR/FAivopjzHSy/n1P/NoHqDGSC8D9bQ/fHVaf3SSoNkXC1Vw5dLKkKYGgB+0QqyRSE4iB35A/5b/0fclomASIeY7z3Ucv1ZunwjxXGdh7R1LVoaogtIMt+ii+ooJneyXeFJLrrnZi1uSUtAHnUUyO7xN0CiGWWbjjewlIF/rNkY8Zj6+aj3Av80mlboflt8KaSjYoUlDcNu0PKWJUdfsVJtV40A7wfF1FA45MLOPcWn8o3MbPco79o0kzAN7dy54QQEPmsG24HjPI+zMGgqcwi28VGnVkJbTU1oSjKhx65+JuxxKMzRY1QPPHeoQxoW9YsRGDRb2IG9Wc+gt
x-ms-exchange-antispam-messagedata: pjbDxDaUKy8E1YJg/+2i+4VKrhsZgQ3gJbm7U8C8rsHzrF5qRsbRS7onvZF5g/qB1bK7htgYpcPE2lv+ADHkWmkIeEcqWFzKjyx4TIeq2vsMeRvnNFo2967SC2ZtwZLhQmLH6u0jasCRDgjB8CKrPA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4BAA88EE63DCB40B83010576C289562@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f155cfb-76c1-4f58-ef69-08d7a8ca213d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 16:57:18.9292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKWz+LJ5lbVv3KApuDMyAlqA75HM1LdaOmJAu7nbk3bvvC2SIS2YKqiSV/dAaZMewezc9vdNO8XK4Dmmsp/Vnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3122
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIwLTAyLTAzIGF0IDE2OjQ3ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiBfdGxiaWEoKSBpcyBhIGZ1bmN0aW9uIHVzZWQgb25seSBvbiA2MDMvNjAzZSBj
b3JlLCBpZSBvbiBDUFVzIHdoaWNoDQo+IGRvbid0IGhhdmUgYSBoYXNoIHRhYmxlLg0KPiANCj4g
X3RsYmlhKCkgdXNlcyB0aGUgdGxiaWEgbWFjcm8gd2hpY2ggaW1wbGVtZW50cyBhIGxvb3Agb2Yg
MTAyNCB0bGJpZS4NCj4gDQo+IE9uIHRoZSA2MDMvNjAzZSBjb3JlLCBmbHVzaGluZyB0aGUgZW50
aXJlIFRMQiByZXF1aXJlcyBubyBtb3JlIHRoYW4NCj4gMzIgdGxiaWUuDQo+IA0KPiBSZXBsYWNl
IHRsYmlhIGJ5IGEgbG9vcCBvZiAzMiB0bGJpZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPg0KPiAtLS0NCj4gIGFyY2gvcG93
ZXJwYy9tbS9ib29rM3MzMi9oYXNoX2xvdy5TIHwgMTMgKysrKysrKystLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvaGFzaF9sb3cuUyBiL2FyY2gvcG93ZXJwYy9t
bS9ib29rM3MzMi9oYXNoX2xvdy5TDQo+IGluZGV4IGMxMWIwYTAwNTE5Ni4uYTUwMzlhZDEwNDI5
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvaGFzaF9sb3cuUw0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvaGFzaF9sb3cuUw0KPiBAQCAtNjk2LDE4ICs2
OTYsMjEgQEAgX0dMT0JBTChfdGxiaWEpDQo+ICAgICAgICAgYm5lLSAgICAxMGINCj4gICAgICAg
ICBzdHdjeC4gIHI4LDAscjkNCj4gICAgICAgICBibmUtICAgIDEwYg0KPiArI2VuZGlmIC8qIENP
TkZJR19TTVAgKi8NCj4gKyAgICAgICBsaSAgICAgIHI1LCAzMg0KPiArICAgICAgIGxpcyAgICAg
cjQsIEtFUk5FTEJBU0VAaA0KPiArICAgICAgIG10Y3RyICAgcjUNCj4gICAgICAgICBzeW5jDQo+
IC0gICAgICAgdGxiaWENCj4gKzA6ICAgICB0bGJpZSAgIHI0DQo+ICsgICAgICAgYWRkaSAgICBy
NCwgcjQsIDB4MTAwMA0KDQpJcyBwYWdlIHNpemUgYWx3YXlzIDQwOTYgaGVyZSBvciBkb2VzIGl0
IG5vdCBtYXR0ZXIgPw0KDQo+ICsgICAgICAgYmRueiAgICAwYg0KPiAgICAgICAgIHN5bmMNCj4g
KyNpZmRlZiBDT05GSUdfU01QDQo+ICAgICAgICAgVExCU1lOQw0KPiAgICAgICAgIGxpICAgICAg
cjAsMA0KPiAgICAgICAgIHN0dyAgICAgcjAsMChyOSkgICAgICAgICAgICAgICAgLyogY2xlYXIg
bW11X2hhc2hfbG9jayAqLw0KPiAgICAgICAgIG10bXNyICAgcjEwDQo+ICAgICAgICAgU1lOQ182
MDENCj4gICAgICAgICBpc3luYw0KPiAtI2Vsc2UgLyogQ09ORklHX1NNUCAqLw0KPiAtICAgICAg
IHN5bmMNCj4gLSAgICAgICB0bGJpYQ0KPiAtICAgICAgIHN5bmMNCj4gICNlbmRpZiAvKiBDT05G
SUdfU01QICovDQo+ICAgICAgICAgYmxyDQo+IC0tDQo+IDIuMjUuMA0KPiANCg0K
