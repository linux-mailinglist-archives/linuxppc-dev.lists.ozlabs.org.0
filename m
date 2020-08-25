Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F0251698
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 12:25:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbQ9K448WzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 20:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.223.87;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=LJgyMFlY; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbNKf4j3mzDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 19:02:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTLk4YEkWL6KxBPnejzr9TpWb6a2OIvO0WDf17IexnyHpM/ic9D1EjX0AFlzKFaEUeAMNh0dV9zal0IqoIzddbNUGPKPGOyPXsoOJDXCDNm1rgI+glmnGF3x82w7FDOsb8DJgtJm25nc6S75h5vsYjakhmlGR7PK60NtL3zkseFtZq01p+sEZTJdG9wWzCzjRx4lnAbY2hj6eiXgp1CI76u4FtPWps/YzoMxUU+66RJzkXdVGI6+LCLKuy4m3NP6JD+ZuxhEQLIo97g8/L1ptEdshffxea6rwuFcP4o9g+L5+LPWP7fHs2WXqFrOFQvUNxjsntYx4C/Ap+XSlFH+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t5Zw+DQR9ElsO2fMCj5PjHpzvIb4Vn/QWV4JIwpSUQ=;
 b=mkPmBtn5au0E8dTQZOrxn4kYQlE4RGR5UoMYEHAhy+DqP+6sTcCuo5BbOatZUZjU8IpRCrXH7N5PpV7vlZUG9cni0xBK1rotMhBsOc1zPLogcHORydTOZcJCBDh1FLmXTOC8KJ/9hwbxesszt7e1yrSv82elBZtR6tTaNpbUFgMaE/4v2t35Ku8UtweAE/PEOx/ee/dKqJhazMCw9jKSq6rgydcwjjsiKjYP8EmeE/p7OAOB9O9dQJp47pm5ph4F93oxhUw0obbCBT1rkwAsYbcS3ttEs//oI7cEpKyHUbovGt2zsP2Ho/Nws4mYodCjkjRNdiOJxxgVYdk0YKaBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t5Zw+DQR9ElsO2fMCj5PjHpzvIb4Vn/QWV4JIwpSUQ=;
 b=LJgyMFlYaVti+os4QkSYhUhVCWzTsjxzbV7RIViHGhwzFhx8pyAOOGO5i5qShrlSIE5/TVaYexo4+AeW38E/yvAottBStsskFGe8ahgQevK3UsXngo8rGlShpKKnAosHK+7EuqaX42kK9aYWaoE5W5k6KH/sUh4VDuDCY3vtJd8=
Received: from DM5PR1001MB2393.namprd10.prod.outlook.com (2603:10b6:4:2f::24)
 by DM6PR10MB2923.namprd10.prod.outlook.com (2603:10b6:5:70::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 09:02:03 +0000
Received: from DM5PR1001MB2393.namprd10.prod.outlook.com
 ([fe80::f479:8789:7e25:e3de]) by DM5PR1001MB2393.namprd10.prod.outlook.com
 ([fe80::f479:8789:7e25:e3de%6]) with mapi id 15.20.3305.025; Tue, 25 Aug 2020
 09:02:03 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "yebin10@huawei.com" <yebin10@huawei.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Thread-Topic: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Thread-Index: AQHWee+zZeLUHMNpPkKw58UdehD37KlG8waAgABWdYCAAAPLAIABOTqAgAACbIA=
Date: Tue, 25 Aug 2020 09:02:03 +0000
Message-ID: <fbe07ffea894ee60ba2f87266697be966a8437eb.camel@infinera.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
 <20200824082122.GA336539@kroah.com>
 <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
 <87d03gjgbw.fsf@kernel.org>
 <2c2317ff8385f75466cbfa1f0109a1f2c3acbc48.camel@infinera.com>
 <877dtnjed8.fsf@kernel.org>
In-Reply-To: <877dtnjed8.fsf@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.90 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6e39d50-1efd-4b20-8eb5-08d848d58916
x-ms-traffictypediagnostic: DM6PR10MB2923:
x-microsoft-antispam-prvs: <DM6PR10MB2923298F44767FEA741E42A5F4570@DM6PR10MB2923.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EKDwqNdSOSLS+Z2ezFdupLvjzxfhNJg5XqS2MKiNtxOrvBTFYx43tUFrPACWBqpI6ndDfYCR0p1e8fpkRXZkK1UJaZBTlz6vCFyIWmD6v37gIhsAb8w6/madZ6jaDzuizofjmg01ip5U/hkRqe9+wj91A6/avrR2+HNtS0bBqg7En2EaAqzcWwQJqkCx76Xgl6yJFdzhxg555Z68KsAcjDUOKky9MVsDGL4s88opT97NrACtxg72BeKSumg+5ktyWuRsKBrPaKaD4Qr2Gjtij69Tm3oqtqe1aEO88tzxhInH2MJV1Em6d9GGBwODruYf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1001MB2393.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(6512007)(478600001)(36756003)(8676002)(2616005)(86362001)(186003)(8936002)(2906002)(76116006)(66946007)(91956017)(26005)(4326008)(5660300002)(66476007)(316002)(110136005)(71200400001)(6506007)(64756008)(66556008)(66446008)(83380400001)(6486002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /2vSnodC708JklP82bTqAD13dAFrBpl12CYSpdFqlRROChnzR3Hg4jOka9dy5yI3SWB81RC29pojmmh8foo1QfI2/1/G+SGxzh7VxMgVLlHkMnvSFSh28SUPxeTfhUgLUm/6jDCryxeiZau49Xi/uICgbIUgFgi1ijgj87FALtxi6WEBVFOmFgL1XbHq7Y2LdhNyiMPRyVCDddawgsn7S3syEChtDyiJz/h+6oB7tU21POMrP1LkxeAwO6RvovMtVF7BR3QzLREUq+sCWNsD7npOypvD1klNSQsuAFBz0a5T622+VnNl/pK68Dhup7WsZVpFs+ZPDrAqtG09GDiur67SY16G5nM5EfGgVH9mzSqw7ra+akA54BCWt+uKfkrmaGJToKIWpEYzWbacsQN9oTgMoCNCLtNI9uye8BDb2Sh3Yb9bwMj95gsoXREoejiiEJ1gqQHdFb+HF1fcGE8y3+PLpT70d9RWtF3KDfPzGRQoIHPRPMvR7Y2jrnVh+So8s1Na2IVtQwtFpsDaft7IqvaiMlrpqI2fULsyCNdzd99P4yJDFRmdb/aHA5mOEpt7F+enzojytKOFVHSgxppzetc9FvE9t/xSiZLAbAfPhQAvczkKK5oJL8Jq6ubxoS+WU3vgwdBBfxkFvvSh9Y0+Eg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_fbe07ffea894ee60ba2f87266697be966a8437ebcamelinfineraco_"
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1001MB2393.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e39d50-1efd-4b20-8eb5-08d848d58916
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 09:02:03.6426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybSBhcZZ3if43WDGQAKGNzXFcj1Hmg1i52iu8RwIhXfrBNA0t8AUflNx9G1mFucGnITu/h0OiNmFNrkkw+X3+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2923
X-Mailman-Approved-At: Tue, 25 Aug 2020 20:23:43 +1000
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_fbe07ffea894ee60ba2f87266697be966a8437ebcamelinfineraco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA4LTI1IGF0IDExOjUzICswMzAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQpK
b2FraW0gVGplcm5sdW5kIDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbTxtYWlsdG86Sm9h
a2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+PiB3cml0ZXM6DQoNCj4gT24gTW9uLCAyMDIwLTA4
LTI0IGF0IDE2OjU4ICswMzAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+PiBKb2FraW0gVGplcm5s
dW5kIDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbTxtYWlsdG86Sm9ha2ltLlRqZXJubHVu
ZEBpbmZpbmVyYS5jb20+PiB3cml0ZXM6DQo+Pg0KPj4gPiBPbiBNb24sIDIwMjAtMDgtMjQgYXQg
MTA6MjEgKzAyMDAsIEdyZWcgS0ggd3JvdGU6DQo+PiA+ID4NCj4+ID4gPiBPbiBNb24sIEF1ZyAy
NCwgMjAyMCBhdCAwNDowNDozN1BNICswODAwLCBZZSBCaW4gd3JvdGU6DQo+PiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZZSBCaW4gPHllYmluMTBAaHVhd2VpLmNvbTxtYWlsdG86eWViaW4xMEBodWF3
ZWkuY29tPj4NCj4+ID4gPg0KPj4gPiA+IEkgY2FuJ3QgdGFrZSBwYXRjaGVzIHdpdGhvdXQgYW55
IGNoYW5nZWxvZyB0ZXh0LCBzb3JyeS4NCj4+ID4NCj4+ID4gU3RpbGwgdGFraW5nIHBhdGNoZXMg
Zm9yIGZzbF91ZGNfY29yZS5jID8NCj4+ID4gSSBmaWd1cmVkIHRoaXMgZHJpdmVyIHdhcyBvYnNv
bGV0ZSBhbmQgc2hvdWxkIGJlIG1vdmVkIHRvIG9uZSBvZiB0aGUgQ2hpcGlkZWEgZHJpdmVycy4N
Cj4+DQo+PiBOb2JvZHkgc2VudCBhbnkgcGF0Y2hlcyB0byBzd2l0Y2ggb3ZlciB0aGUgdXNlcnMg
b2YgdGhpcyBkcml2ZXIgdG8NCj4+IGNoaXBpZGVhLiBJIHdvdWxkIGxvdmUgdG8gZGVsZXRlIHRo
aXMgZHJpdmVyIDotKQ0KPg0KPiBNZSB0b28sIEkgZ290IGEgZmV3IGxvY2FsIHBhdGNoZXMgaGVy
ZSBhcyB0aGUgZHJpdmVyIGlzIHF1aXRlIGJ1Z2d5Lg0KPiBHb3QgdG8gbGl0dGxlIFVTQiBrbm93
bGVkZ2UgdG8gc3dpdGNoIGl0IG92ZXIgdGhvdWdoIDooDQoNCnRoaXMgd291bGRuJ3QgcmVxdWly
ZSBVU0Iga25vd2xlZGdlLiBJdCBvbmx5IHJlcXVpcmVzIHNvbWUgbWlub3IgRFRTDQprbm93bGVk
Z2UgYW5kIEhXIGZvciB0ZXN0aW5nLg0KDQpobW0sIE9LLiBJZiBpdCBpcyB0aGF0IHNpbXBsZSBJ
IG1heSB0YWtlIGEgY3JhY2sgYXQgaXQoYnV0IHRoZW4gd2h5IGhhc24ndCBOWFAgYWxyZWFkeSBk
b25lIHRoYXQgPykNCkkgd291bGQgbmVlZCBzb21lIGd1aWRhbmNlIGFzIHRvIHdoYXQgdGhlIGlu
dm9sdmVkIGZpbGVzIGFyZT8NCg0KICAgIEpvY2tlDQoNCg==

--_000_fbe07ffea894ee60ba2f87266697be966a8437ebcamelinfineraco_
Content-Type: text/html; charset="utf-8"
Content-ID: <0A415295A541194FAB0313EBB02F51D2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUdWUs
IDIwMjAtMDgtMjUgYXQgMTE6NTMgKzAzMDAsIEZlbGlwZSBCYWxiaSB3cm90ZTo8L2Rpdj4NCjxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDsgYm9yZGVyLWxl
ZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2PkpvYWtpbSBUamVy
bmx1bmQgJmx0OzxhIGhyZWY9Im1haWx0bzpKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbSI+
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb208L2E+Jmd0OyB3cml0ZXM6PGJyPg0KPC9kaXY+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj48Zm9udCBjb2xvcj0iIzczNzM3MyI+Jmd0OyBPbiBN
b24sIDIwMjAtMDgtMjQgYXQgMTY6NTggKzAzMDAsIEZlbGlwZSBCYWxiaSB3cm90ZTo8L2ZvbnQ+
PGJyPg0KPC9kaXY+DQo8ZGl2Pjxmb250IGNvbG9yPSIjNzM3MzczIj4mZ3Q7Jmd0OyBKb2FraW0g
VGplcm5sdW5kICZsdDs8YSBocmVmPSJtYWlsdG86Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5j
b20iPkpvYWtpbS5UamVybmx1bmRAaW5maW5lcmEuY29tPC9hPiZndDsgd3JpdGVzOjwvZm9udD48
YnI+DQo8L2Rpdj4NCjxkaXY+PGZvbnQgY29sb3I9IiM3MzczNzMiPiZndDsmZ3Q7IDwvZm9udD48
YnI+DQo8L2Rpdj4NCjxkaXY+PGZvbnQgY29sb3I9IiM3MzczNzMiPiZndDsmZ3Q7ICZndDsgT24g
TW9uLCAyMDIwLTA4LTI0IGF0IDEwOjIxICswMjAwLCBHcmVnIEtIIHdyb3RlOjwvZm9udD48YnI+
DQo8L2Rpdj4NCjxkaXY+PGZvbnQgY29sb3I9IiM3MzczNzMiPiZndDsmZ3Q7ICZndDsgJmd0OyA8
L2ZvbnQ+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxmb250IGNvbG9yPSIjNzM3MzczIj4mZ3Q7Jmd0OyAm
Z3Q7ICZndDsgT24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMDQ6MDQ6MzdQTSArMDgwMCwgWWUgQmlu
IHdyb3RlOjwvZm9udD48YnI+DQo8L2Rpdj4NCjxkaXY+PGZvbnQgY29sb3I9IiM3MzczNzMiPiZn
dDsmZ3Q7ICZndDsgJmd0OyAmZ3Q7IFNpZ25lZC1vZmYtYnk6IFllIEJpbiAmbHQ7PGEgaHJlZj0i
bWFpbHRvOnllYmluMTBAaHVhd2VpLmNvbSI+eWViaW4xMEBodWF3ZWkuY29tPC9hPiZndDs8L2Zv
bnQ+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxmb250IGNvbG9yPSIjNzM3MzczIj4mZ3Q7Jmd0OyAmZ3Q7
ICZndDsgPC9mb250Pjxicj4NCjwvZGl2Pg0KPGRpdj48Zm9udCBjb2xvcj0iIzczNzM3MyI+Jmd0
OyZndDsgJmd0OyAmZ3Q7IEkgY2FuJ3QgdGFrZSBwYXRjaGVzIHdpdGhvdXQgYW55IGNoYW5nZWxv
ZyB0ZXh0LCBzb3JyeS48L2ZvbnQ+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxmb250IGNvbG9yPSIjNzM3
MzczIj4mZ3Q7Jmd0OyAmZ3Q7IDwvZm9udD48YnI+DQo8L2Rpdj4NCjxkaXY+PGZvbnQgY29sb3I9
IiM3MzczNzMiPiZndDsmZ3Q7ICZndDsgU3RpbGwgdGFraW5nIHBhdGNoZXMgZm9yIGZzbF91ZGNf
Y29yZS5jID88L2ZvbnQ+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxmb250IGNvbG9yPSIjNzM3MzczIj4m
Z3Q7Jmd0OyAmZ3Q7IEkgZmlndXJlZCB0aGlzIGRyaXZlciB3YXMgb2Jzb2xldGUgYW5kIHNob3Vs
ZCBiZSBtb3ZlZCB0byBvbmUgb2YgdGhlIENoaXBpZGVhIGRyaXZlcnMuPC9mb250Pjxicj4NCjwv
ZGl2Pg0KPGRpdj48Zm9udCBjb2xvcj0iIzczNzM3MyI+Jmd0OyZndDsgPC9mb250Pjxicj4NCjwv
ZGl2Pg0KPGRpdj48Zm9udCBjb2xvcj0iIzczNzM3MyI+Jmd0OyZndDsgTm9ib2R5IHNlbnQgYW55
IHBhdGNoZXMgdG8gc3dpdGNoIG92ZXIgdGhlIHVzZXJzIG9mIHRoaXMgZHJpdmVyIHRvPC9mb250
Pjxicj4NCjwvZGl2Pg0KPGRpdj48Zm9udCBjb2xvcj0iIzczNzM3MyI+Jmd0OyZndDsgY2hpcGlk
ZWEuIEkgd291bGQgbG92ZSB0byBkZWxldGUgdGhpcyBkcml2ZXIgOi0pPC9mb250Pjxicj4NCjwv
ZGl2Pg0KPGRpdj48Zm9udCBjb2xvcj0iIzczNzM3MyI+Jmd0OzwvZm9udD48YnI+DQo8L2Rpdj4N
CjxkaXY+PGZvbnQgY29sb3I9IiM3MzczNzMiPiZndDsgTWUgdG9vLCBJIGdvdCBhIGZldyBsb2Nh
bCBwYXRjaGVzIGhlcmUgYXMgdGhlIGRyaXZlciBpcyBxdWl0ZSBidWdneS48L2ZvbnQ+PGJyPg0K
PC9kaXY+DQo8ZGl2Pjxmb250IGNvbG9yPSIjNzM3MzczIj4mZ3Q7IEdvdCB0byBsaXR0bGUgVVNC
IGtub3dsZWRnZSB0byBzd2l0Y2ggaXQgb3ZlciB0aG91Z2ggOig8L2ZvbnQ+PGJyPg0KPC9kaXY+
DQo8ZGl2Pjxicj4NCnRoaXMgd291bGRuJ3QgcmVxdWlyZSBVU0Iga25vd2xlZGdlLiBJdCBvbmx5
IHJlcXVpcmVzIHNvbWUgbWlub3IgRFRTPGJyPg0Ka25vd2xlZGdlIGFuZCBIVyBmb3IgdGVzdGlu
Zy48L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PmhtbSwgT0su
IElmIGl0IGlzIHRoYXQgc2ltcGxlIEkgbWF5IHRha2UgYSBjcmFjayBhdCBpdChidXQgdGhlbiB3
aHkgaGFzbid0IE5YUCBhbHJlYWR5IGRvbmUgdGhhdCA/KTwvZGl2Pg0KPGRpdj5JIHdvdWxkIG5l
ZWQgc29tZSBndWlkYW5jZSBhcyB0byB3aGF0IHRoZSBpbnZvbHZlZCBmaWxlcyBhcmU/PC9kaXY+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj4mbmJzcDsgJm5ic3A7IEpvY2tlJm5ic3A7PC9kaXY+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRl
ci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPC9ibG9ja3F1b3Rl
Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9Ii14LWV2by1zaWduYXR1cmUtd3JhcHBl
ciI+PHNwYW4gY2xhc3M9Ii14LWV2by1zaWduYXR1cmUiIGlkPSJub25lIj48L3NwYW4+PC9kaXY+
DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_fbe07ffea894ee60ba2f87266697be966a8437ebcamelinfineraco_--
