Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11D45128
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 03:22:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q2sn4VKvzDrRG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 11:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.48; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="SqK3aqqX"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q2rB2qLgzDrPX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 11:21:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YmwdtJs4Wqng2BX4vdSF2RAU6KnfAhsdC4DrddbwPQ=;
 b=SqK3aqqXoA0UdNdsjpANn+K9ZfRrtdCvyhoZocvFXhhh0ZNF436LB26nnCSiNDjrDSzRlybmyp6a/LwYYwaxhpuxyYmBZZbcv15rYc17LWV4shOhWvJuNke3cG40R7lMpviAPPCVX5nTpZr4X+zMrCme74d2sdNzBZSRa71eaUI=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3012.eurprd04.prod.outlook.com (10.173.254.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Fri, 14 Jun 2019 01:21:18 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::38dc:f8e6:b29a:54c6]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::38dc:f8e6:b29a:54c6%6]) with mapi id 15.20.1965.018; Fri, 14 Jun 2019
 01:21:18 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/3] dt-bindings: pci: layerscape-pci: add
 compatible strings "fsl,ls1028a-pcie"
Thread-Topic: [EXT] Re: [PATCH 1/3] dt-bindings: pci: layerscape-pci: add
 compatible strings "fsl,ls1028a-pcie"
Thread-Index: AQHVCvDaGb043xOzIkucXDyWoGqpkKaaP+cAgABI/RA=
Date: Fri, 14 Jun 2019 01:21:18 +0000
Message-ID: <AM5PR04MB329999D245D9C549C9631F71F5EE0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
 <20190613205930.GA9003@bogus>
In-Reply-To: <20190613205930.GA9003@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65504fd2-86e9-474d-5e9e-08d6f0669a3f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3012; 
x-ms-traffictypediagnostic: AM5PR04MB3012:
x-microsoft-antispam-prvs: <AM5PR04MB3012962ABAACD15A6520AAD4F5EE0@AM5PR04MB3012.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(13464003)(53936002)(186003)(6116002)(99286004)(7696005)(6506007)(8936002)(64756008)(81166006)(76176011)(4326008)(81156014)(229853002)(68736007)(26005)(33656002)(256004)(25786009)(71190400001)(71200400001)(5660300002)(8676002)(52536014)(6246003)(53546011)(3846002)(102836004)(478600001)(486006)(446003)(14454004)(66066001)(74316002)(44832011)(476003)(54906003)(86362001)(7736002)(55016002)(76116006)(66446008)(2906002)(6916009)(11346002)(66476007)(305945005)(66556008)(9686003)(7416002)(73956011)(316002)(6436002)(66946007)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3012;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XywbbYQYOoMMXW7eH45eu/VkPdRGxDpmnStIGRG5ilOmNSE6EO5SSDtLf/KgXhibzzOvQ1T+/gkmCWiVYY9/dUDpuC4JZ2zrt5zEKxatUKG4//OlB3hRqS+nYJTuAvxLibaSITeuLKx0eLzTrwxJXSL7qthJZNlJAO0UIJJgNsmAPODuND8rw+tNnh/1p0no5qTh6JZBSMaphO4dRUz4BcEz8jyo7rlDsiy2Ho7erPAzaq2/1aEF/4shj5YUq8fMdnGIppi/KOG+dOTC2kbNSV4OaEWue5V08fNN6xW/fueLv9OY0tssSZ3Zt/DKdRGcXIFv9s4Gm+6Rm6cDxYZGe0tsJDgq/cTsl2+WZ/qM3rCGFQPB4SFx9zflbb2sMAoyR2033sDiNGKexTI9JX0R1Pv5m+tB6no4o92TNs5o4Vg=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65504fd2-86e9-474d-5e9e-08d6f0669a3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 01:21:18.2229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiaowei.bao@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3012
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "pombredanne@nexb.com" <pombredanne@nexb.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOcTqNtTCMTTI1SA1OjAwDQo+IFRvOiBYaWFvd2Vp
IEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFzQGdvb2dsZS5jb207IHJv
YmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+IHNoYXduZ3VvQGtlcm5l
bC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNvbTsNCj4gbG9y
ZW56by5waWVyYWxpc2lAYXJtLmNvbTsgYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc7DQo+IE0uaC4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgTWluZ2thaSBI
dSA8bWluZ2thaS5odUBueHAuY29tPjsNCj4gUm95IFphbmcgPHJveS56YW5nQG54cC5jb20+OyBr
c3Rld2FydEBsaW51eGZvdW5kYXRpb24ub3JnOw0KPiBwb21icmVkYW5uZUBuZXhiLmNvbTsgc2hh
d24ubGluQHJvY2stY2hpcHMuY29tOw0KPiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOyBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eHBwYy1kZXZAbGlz
dHMub3psYWJzLm9yZzsgWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+IFN1Ympl
Y3Q6IFtFWFRdIFJlOiBbUEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogcGNpOiBsYXllcnNjYXBlLXBj
aTogYWRkDQo+IGNvbXBhdGlibGUgc3RyaW5ncyAiZnNsLGxzMTAyOGEtcGNpZSINCj4gDQo+IENh
dXRpb246IEVYVCBFbWFpbA0KPiANCj4gT24gV2VkLCAxNSBNYXkgMjAxOSAxNToyNzo0NSArMDgw
MCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4gQWRkIHRoZSBQQ0llIGNvbXBhdGlibGUgc3RyaW5n
IGZvciBMUzEwMjhBDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dl
aS5iYW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGNp
L2xheWVyc2NhcGUtcGNpLnR4dCAgICAgfCAgICAxICsNCj4gPiAgMSBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+ID4NCj4gDQo+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KW1hpYW93ZWkgQmFvXSB0aGFua3MgYSBsb3Qg
Zm9yIHlvdXIgcmV2aWV3Lg0K
