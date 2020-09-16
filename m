Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AB526B96E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 03:34:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrjLc22GKzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 11:34:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.59; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=qiStkqiK; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrjJj1c4czDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 11:32:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OY53K516Emsy7H/z3MuKpwCyNrlTmGjppjI4M1IfejVaIFV+Lci+/ok9zPyjiIVw2ixIYC7ArYJG5hYFWi0KuCsfUta3fLQNBOirVJXKzojFOpQ9KnHlf7ZVxQeXeCBfUoWcwuBYrgnSbWDRo97OGUfR53eJjulYygYVVIeNqUJ+4a/m/GIhBC8iEkqlCo9wKL02uOclj7z7rKJ1xZEnsk7KgiIVmcJMcPzzZyDdSxI9fJgJQaw1aQmPiXCDtFu6x+gK00bLPpATCuf7jE5mHKzX/4xOOj4TRmhFxR89ssapKkTwJSm2KUcT+EA+5b7hWw/Whbrj+Z7Y5pwLEnqEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mk32yOrUufwnZWpQoYh4SFJ7kxtmrrCSTauetfS3Ug=;
 b=NmdVFgJJiQDF5xQdmj8assSKFw1Ncw2U52yYFoFx4yA0HLdr8nsfdPUG/tj4/Qe2rqn5lTcHlPATnm5TUbFFBjyjKFxg3tFIq0sP6B7oJFfxx5f23jAN09nadvNdFsLL1ZRKtkJzpkrgDjZ1rDj07bxbF7WpbVmMkJPDxk5zzJtN502BRuukHJTn7yS1UwZ9gUfeN8jYubktgNed8ZbXpOoiaWUZ3qvgCt0xRF500mal10c9MozNHU1DRJIhmpuIg7KV8xEyoRD38FYOV69hFGlnKRAX6VQWj9s/OHwO4qehE2TiplSVwaShy8Yld1yqBNsqXlgi/BABSDHTM9rzuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mk32yOrUufwnZWpQoYh4SFJ7kxtmrrCSTauetfS3Ug=;
 b=qiStkqiKtxIOxzHnB032xlaZXRT7uabtb0kHHEuabTGoB5MafGHahEcbeaiYY2DKvHoc9GDGHgjJmrjiiHfHp6Dxm+4TReG+Z8lxna/VhsZZTVATEqLr8No5E0v1YgLLF66b+UjriXzEgzH1O5Tc+SGkM6ggQKKRk9iuDDQDGIQ=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB5703.eurprd04.prod.outlook.com (2603:10a6:20b:a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 01:32:29 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 01:32:29 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Ard Biesheuvel <ard.biesheuvel@arm.com>, kuldip dwivedi
 <kuldip.dwivedi@puresoftware.com>, Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] soc: fsl: rcpm: Add ACPI support
Thread-Topic: [PATCH v1] soc: fsl: rcpm: Add ACPI support
Thread-Index: AQHWi1Bdrf69Hjks3kmx49279KDQI6lpiwOAgADt6GA=
Date: Wed, 16 Sep 2020 01:32:29 +0000
Message-ID: <AM6PR04MB5413903EAAEDB2EED2E254C6F1210@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200915110647.846-1-kuldip.dwivedi@puresoftware.com>
 <4e008f0a-69da-d5c2-4dfc-ef8695e17f47@arm.com>
In-Reply-To: <4e008f0a-69da-d5c2-4dfc-ef8695e17f47@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f1f1a716-59f4-4040-a1b1-08d859e0600b
x-ms-traffictypediagnostic: AM6PR04MB5703:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB57037132E42C1DD9EB981A74F1210@AM6PR04MB5703.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: egN7I5Jy1GCrIk7o7BRBL3ogVkfID08SY6tlKjLa9LA7RHWYZBV2f/h63JSs/ek/hUW5QSDuG1qlWXhyXq5YNPxBdlu126Y1GSp+zfoIjU75WUYLSOVTPHCppie8+IGaTiAaM1OB9Bvs/VnsWR/wfiVuLEzQt4j5pOdteIm+pk/loPUNDzPr0kwrKI+jhPooeaezs8BzNBYRmUFCu071HJjSezr6TLxGwgKyFCvO41uKE1yfcIX42D+qgq3YiOcWrDJ9JkgHiH3mWpZlZhjrLvpDl1I5QS38Ba0FUutcxpTbw3mPxBMT9k9/SuEXSOubXiJtVHWbGgI+ZzjfLXQjERXqq79UyA/oiJgik9CKY7roQ/q4qwqqrrxWkWYeAtq6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(186003)(33656002)(83380400001)(4326008)(26005)(55016002)(316002)(9686003)(8676002)(86362001)(8936002)(71200400001)(7696005)(6506007)(110136005)(54906003)(478600001)(53546011)(2906002)(52536014)(5660300002)(76116006)(66446008)(66946007)(66556008)(66476007)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mFM7I1VNcD0sgaiVXZJBC3emN5UOCIBUMs971CnnsGSPFUe8c85vxSyz6YgAB1YDdxFWL5s4AmDmseTRexqPlFUDtRQ10SlMPfblwjbvTXrQ88UzJNeEb7sDbCTY+AIbL3PHOFWhBN02d1fc+mNFKZkdJaJ0zLL0ifpRw/opec3+DE6dd0NX4ISFdUt3c3/XamRLnUfLRK5Zyl4WuEkg3bJ+KuRequNOmnbkNnKfa/42pMGjOaQIhCnF0Q2F5uagq5Bz1fhFS8hlNqz6i8LzkEjsOAlBOBZXITpAMVjyIle84xFeAprWGEibEo46c3A51KR7THD6zt1g/dbr1IdF1xG6Qlbt6qq8/MGvxqcmmxtMgeDzvn04b0UWJ3BuwJVB/0HfsN5xrt9UYcOgiKH51AESAXaOfjOQhSDlXxjdaMGIL5KnVUmdgXdL5CDrN2uKDHK6pqgsgk05P1vgGGHxHSBlJs55TsJPMkFv8Y3CILeHYp3wnoyr+BBfmElOtg3QcV2JQq+v8fwscQ0WAduxy/JN5iRwF1WJx5wOIrAl+HUhZj6orPRkfRE86FV3npzGcYWud71he4EWZA/d4ZwjPrcO+IRbMj0ica7MREnXHijoPqG/NCNZeQh1uChz/XT+pGP3AhXfNBg5C7RWjs8hsA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f1a716-59f4-4040-a1b1-08d859e0600b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 01:32:29.0827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXpuymu37LxB2uo29vmNNAZ6J8RzWBUsGw9xtBZzpk+XwOXyAI8i0rjhO6seZvIVlHbfkoex++jm09ZLzdHVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5703
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
Cc: Biwen Li <biwen.li@nxp.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 Arokia Samy <arokia.samy@nxp.com>, Paul Yang <Paul.Yang@arm.com>,
 Varun Sethi <V.Sethi@nxp.com>, tanveer <tanveer.alam@puresoftware.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQXJkLA0KDQpPbiBUdWVzZGF5LCBTZXB0ZW1iZXIgMTUsIDIwMjAgNzoxMCBQTSwgQXJkIEJp
ZXNoZXV2ZWwgd3JvdGU6DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIHNvYzogZnNsOiByY3Bt
OiBBZGQgQUNQSSBzdXBwb3J0DQo+IA0KPiBPbiA5LzE1LzIwIDE6MDYgUE0sIGt1bGRpcCBkd2l2
ZWRpIHdyb3RlOg0KPiA+IEFkZCBBQ1BJIHN1cHBvcnQgaW4gZnNsIFJDUE0gZHJpdmVyLiBUaGlz
IGlzIHJlcXVpcmVkIHRvIHN1cHBvcnQgQUNQSQ0KPiA+IFMzIHN0YXRlLiBTMyBpcyB0aGUgQUNQ
SSBzbGVlcCBzdGF0ZSB0aGF0IGlzIGtub3duIGFzICJzbGVlcCIgb3INCj4gPiAic3VzcGVuZCB0
byBSQU0iLg0KPiA+IEl0IGVzc2VudGlhbGx5IHR1cm5zIG9mZiBtb3N0IHBvd2VyIG9mIHRoZSBz
eXN0ZW0gYnV0IGtlZXBzIG1lbW9yeQ0KPiA+IHBvd2VyZWQuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiB0YW52ZWVyIDx0YW52ZWVyLmFsYW1AcHVyZXNvZnR3YXJlLmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBrdWxkaXAgZHdpdmVkaSA8a3VsZGlwLmR3aXZlZGlAcHVyZXNvZnR3YXJlLmNvbT4N
Cj4gDQo+IFdoeSBkb2VzIHRoZSBPUyBuZWVkIHRvIHByb2dyYW0gdGhpcyBkZXZpY2U/IENhbid0
IHRoaXMgYmUgZG9uZSBieQ0KPiBmaXJtd2FyZT8NCg0KVGhpcyBkZXZpY2UgaXMgdXNlIHRvIHRl
bGwgSFcgd2hpY2ggSVAgKHN1Y2ggYXMgVVNCLCBTREhDLCBTQVRBLCBldGMpIHNob3VsZCBub3Qg
YmUNCmNsb2NrIGdhdGVkIGR1cmluZyBzeXN0ZW0gZW50ZXIgbG93IHBvd2VyIHN0YXRlICh0byBh
bGxvdyB0aGF0IElQIHdvcmsgYXMgYQ0Kd2FrZXVwIHNvdXJjZSkuIEFuZCB1c2VyIGRvZXMgdGhp
cyBjb25maWd1cmF0aW9uIGluIGRldmljZSB0cmVlLiBTbyBpbXBsZW1lbnQNCnRoaXMgUkNQTSBk
cml2ZXIgdG8gZG8gaXQgaW4ga2VybmVsIHJhdGhlciB0aGFuIGZpcm13YXJlLg0KDQpSZWdhcmRz
LA0KUmFuDQoNCj4gPiAtLS0NCj4gPg0KPiA+IE5vdGVzOg0KPiA+ICAgICAgMS4gQWRkIEFDUEkg
bWF0Y2ggdGFibGUNCj4gPiAgICAgIDIuIE5YUCB0ZWFtIG1lbWJlcnMgYXJlIGFkZGVkIGZvciBj
b25maXJtaW5nIEhJRCBjaGFuZ2VzDQo+ID4gICAgICAzLiBUaGVyZSBpcyBvbmx5IG9uZSBub2Rl
IGluIEFDUEkgc28gbm8gbmVlZCB0byBjaGVjayBmb3INCj4gPiAgICAgICAgIGN1cnJlbnQgZGV2
aWNlIGV4cGxpY2l0bHkNCj4gPiAgICAgIDQuIFRoZXNlIGNoYW5nZXMgYXJlIHRlc3RlZCBvbiBM
WDIxNjBBIGFuZCBMUzEwNDZBIHBsYXRmb3Jtcw0KPiA+DQo+ID4gICBkcml2ZXJzL3NvYy9mc2wv
cmNwbS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvZnNsL3JjcG0uYyBiL2RyaXZlcnMvc29jL2ZzbC9yY3BtLmMgaW5kZXgNCj4g
PiBhMDkzZGJlNmQyY2IuLmU3NWE0MzZmYjE1OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Nv
Yy9mc2wvcmNwbS5jDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3JjcG0uYw0KPiA+IEBAIC0y
LDEwICsyLDEyIEBADQo+ID4gICAvLw0KPiA+ICAgLy8gcmNwbS5jIC0gRnJlZXNjYWxlIFFvcklR
IFJDUE0gZHJpdmVyDQo+ID4gICAvLw0KPiA+IC0vLyBDb3B5cmlnaHQgMjAxOSBOWFANCj4gPiAr
Ly8gQ29weXJpZ2h0IDIwMTktMjAyMCBOWFANCj4gPiArLy8gQ29weXJpZ2h0IDIwMjAgUHVyZXNv
ZnR3YXJlIEx0ZC4NCj4gPiAgIC8vDQo+ID4gICAvLyBBdXRob3I6IFJhbiBXYW5nIDxyYW4ud2Fu
Z18xQG54cC5jb20+DQo+ID4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4NCj4gPiAgICNp
bmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+
ID4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gQEAgLTU3LDggKzU5
LDEzIEBAIHN0YXRpYyBpbnQgcmNwbV9wbV9wcmVwYXJlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4g
PiAgIAkJCQlyY3BtLT53YWtldXBfY2VsbHMgKyAxKTsNCj4gPg0KPiA+ICAgCQkvKiAgV2FrZXVw
IHNvdXJjZSBzaG91bGQgcmVmZXIgdG8gY3VycmVudCByY3BtIGRldmljZSAqLw0KPiA+IC0JCWlm
IChyZXQgfHwgKG5wLT5waGFuZGxlICE9IHZhbHVlWzBdKSkNCj4gPiAtCQkJY29udGludWU7DQo+
ID4gKwkJaWYgKGlzX2FjcGlfbm9kZShkZXYtPmZ3bm9kZSkpIHsNCj4gPiArCQkJaWYgKHJldCkN
Cj4gPiArCQkJCWNvbnRpbnVlOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCWlmIChyZXQgfHwg
KG5wLT5waGFuZGxlICE9IHZhbHVlWzBdKSkNCj4gPiArCQkJCWNvbnRpbnVlOw0KPiA+ICsJCX0N
Cj4gPg0KPiA+ICAgCQkvKiBQcm9wZXJ0eSAiI2ZzbCxyY3BtLXdha2V1cC1jZWxscyIgb2YgcmNw
bSBub2RlIGRlZmluZXMgdGhlDQo+ID4gICAJCSAqIG51bWJlciBvZiBJUFBERVhQQ1IgcmVnaXN0
ZXIgY2VsbHMsIGFuZCAiZnNsLHJjcG0td2FrZXVwIg0KPiA+IEBAIC0xMzksMTAgKzE0NiwxOSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByY3BtX29mX21hdGNoW10NCj4gPSB7
DQo+ID4gICB9Ow0KPiA+ICAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcmNwbV9vZl9tYXRjaCk7
DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19BQ1BJDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
YWNwaV9kZXZpY2VfaWQgcmNwbV9hY3BpX21hdGNoW10gPSB7DQo+ID4gKwl7ICJOWFAwMDE1Iiwg
fSwNCj4gPiArCXsgfQ0KPiA+ICt9Ow0KPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKGFjcGksIHJj
cG1fYWNwaV9tYXRjaCk7ICNlbmRpZg0KPiA+ICsNCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIHJjcG1fZHJpdmVyID0gew0KPiA+ICAgCS5kcml2ZXIgPSB7DQo+ID4gICAJCS5u
YW1lID0gInJjcG0iLA0KPiA+ICAgCQkub2ZfbWF0Y2hfdGFibGUgPSByY3BtX29mX21hdGNoLA0K
PiA+ICsJCS5hY3BpX21hdGNoX3RhYmxlID0gQUNQSV9QVFIocmNwbV9hY3BpX21hdGNoKSwNCj4g
PiAgIAkJLnBtCT0gJnJjcG1fcG1fb3BzLA0KPiA+ICAgCX0sDQo+ID4gICAJLnByb2JlID0gcmNw
bV9wcm9iZSwNCj4gPg0KDQo=
