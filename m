Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B3268097
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 19:28:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqGgS5SlqzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 03:28:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.59; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=tDDqSlUu; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30059.outbound.protection.outlook.com [40.107.3.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqGb62P7zzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 03:25:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWjVp0ipsjKsxAr+yrk1ZIHrx1e0MaiYUqF3DVfinCZE1QAHutd1bg2xFOmZncWZ2IPue3GRGAGmMOIX3rah/fibGCzfXA9IKH3tRJbfy0HfMViCUiw8zUcuFHZuZplMMXN7hnoFsGChkH0KNSaWAz3DZf+P0NSfTROU9WH+BwWAWP9wfT36tbhf3rjHK7QF5059TeOfSI40wxJSTbkxUEwx0X+CwL6WMaHDFGGvIZa6Nqf/bIyEoWk2fPrqrQ8+IK9UUGgX7sg91yYWswp9SPVcRxhYS5JOjVVOczzXfnmKI7AmM2/9LuiORmOieOGydHn9mtyvteyFYiimbqVMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiHjR5R9ujcLLngfGraTqgPiSsHxB3eZRPXfKoqpC1k=;
 b=jq01PnO+PG74S+5d/y4owGydeJ2V2m0DtUx+udUM+BKfT2sZOgZxazbRKyN/OgGjMfn1sWlralvcDbKBMp/lCkY3UM2pDbLnM8/ma+UKEgQlEEsiygjlbur4AlDSDR5H3UgkXRVEGVtfoaef0xS5ZwG53y8O0eSQZxVRFATZt1kyFsIVQSpfy2QWNL86Rtvm4t/fjovcyM3VNQ9rzW8APkEbbWFFRGmVoic3peetnxs1Rt9h4veYvMwVdVEgTIbGNd2TE5+UopHNmcttJ835TkWMUenPNbOiFk17Hvp5p/PVuq4pfl65HOd3/LjrX923H18cAYqSMISlrs/nWu0WKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiHjR5R9ujcLLngfGraTqgPiSsHxB3eZRPXfKoqpC1k=;
 b=tDDqSlUubg85GL1ruKw6YaC3FMSD2exiIEuqjRelQkUfXRNL14qJaV6g2i2Z3bnzN6DWMR4m9PW+ih7ekGdIvAsk7EV+Cy7Viw0eTsltMbbXXMF68OXsyRxQPpsWkb9qLO9DBFNE+UElA/GOQNi98FV7+1B+w4gA/VaUoK37JUY=
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0401MB2378.eurprd04.prod.outlook.com (2603:10a6:3:23::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Sun, 13 Sep
 2020 17:24:58 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::c872:d354:7cf7:deb9]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::c872:d354:7cf7:deb9%3]) with mapi id 15.20.3370.018; Sun, 13 Sep 2020
 17:24:58 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCHv7 12/12] misc: pci_endpoint_test: Add driver data for
 Layerscape PCIe controllers
Thread-Topic: [PATCHv7 12/12] misc: pci_endpoint_test: Add driver data for
 Layerscape PCIe controllers
Thread-Index: AQHWb8aBRZdiLZ/OOk28uglaOdQ7EqliXdwAgASoBQA=
Date: Sun, 13 Sep 2020 17:24:57 +0000
Message-ID: <HE1PR0402MB337142281BB4864869D374F084220@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
 <20200811095441.7636-13-Zhiqiang.Hou@nxp.com> <20200910181756.GA622331@bogus>
In-Reply-To: <20200910181756.GA622331@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45aa14b1-155a-4ed3-1002-08d85809f037
x-ms-traffictypediagnostic: HE1PR0401MB2378:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0401MB23784C97663CB852A5D0387C84220@HE1PR0401MB2378.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rCtoSfh8bT/tJI4u4nJqe/DwJPeYeezebKQlBuXcWwKt1VyYnxSOyTVsIH2PfDqqbV0Uo4ej7hw611y9YZ5kGCdHSANxLifI2QQRe//h8WSzYFiJ0Bl6hUcfeyAD/UEofea/kYhgHtXxEOFpaSBAo23cyvQUIk04CjSDAuJdM5dETEKzsxmUdEncwwqp31NN8PIstf97LSiFArt9R0dRER+ojR+YIN+UJFKaSK1gmGy/wy+Nln64dyQ+bRq4yQTKZ6A5DEBXwJ7v89h6g6wlHRxVAuHGl4NUAqwRNX0lSWVQ3qlfmWijWRk5neX06jlFgwBsrFEEPPOgHYAPNbGi9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB3371.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(83380400001)(52536014)(7416002)(5660300002)(4326008)(8936002)(8676002)(2906002)(33656002)(86362001)(71200400001)(316002)(6506007)(53546011)(9686003)(55016002)(66946007)(186003)(26005)(64756008)(66446008)(66556008)(76116006)(478600001)(7696005)(6916009)(66476007)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: GCkmhClWjudxOiow0VRu5C9WDs87Q9GpxoSATiLEChZ93bIuefwYc7BQlyMhW7kR7tnVNF1qYYAzPSRawR+g4Xl0waLKvdnJxc80Mfwo1BQnJ+OHDWNSlaVRHUKuMT0PC/qVSdoohJ/WjSTHhkUxmuPjrj6fxvJiHt4rhp81zyxhw5CnKw/ArLFmATPFuglIWLmqkCDuNRKGTl/GCoaDsqGxZPSEPPKIe3YdGTcCptrjYZShNYaS43uSU7Qces9CJS/IEjI02qHtp2V1iv92DVYvUiICkSJRHAxoXi02rSWpf+6cwqgLAs3dsEczplqOZsCbHyaPbjPYRLh7YaLvoEZ8qh6TxKVS/uUKUg3ruAEO6D4ZFpr3/hlgLOeB6EkoqymVPznOtoCY/WGYW33FF42rua88EjGHoFfQh2/Bx1zfTAkamFzowHxOqAcSrn2EiguX0Uaf97GalBAyQnLOp7/1j+Azxq5d+r4yXkN5BUM6K1LViIPtnJGc8GLHz8QF2NkgjTlg83cBPIN+Mr+omnbkrlHiVh1BGhalJnihwjAsfjJnGERK96COn7/559g6jzqvBunauL4ubr13PCe5+tDtb8ptLegO99MoJ6iHjN5pVoRMX+8EOTtkN9sFNX1Vi77DLaLm2mZugEg23vrFYQ==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45aa14b1-155a-4ed3-1002-08d85809f037
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2020 17:24:57.8966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPXM8RP/5wg7BWRK6UahVulS+onciLr3JQDtctes/xQiKBxDyrjORLlnhI/nmwB5l65KMTXoD0x0gQzHDuOafw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2378
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
Cc: Roy Zang <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "kishon@ti.com" <kishon@ti.com>,
 "M.h. Lian" <minghuan.lian@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "andrew.murray@arm.com" <andrew.murray@arm.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUm9iLA0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmV2aWV3IGFuZCBhY2shDQoNClJlZ2Fy
ZHMsDQpaaGlxaWFuZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjDE6jnUwjExyNUgMjoxOA0K
PiBUbzogWi5xLiBIb3UgPHpoaXFpYW5nLmhvdUBueHAuY29tPg0KPiBDYzogYmhlbGdhYXNAZ29v
Z2xlLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTS5oLiBMaWFuDQo+IDxtaW5naHVhbi5saWFu
QG54cC5jb20+OyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47DQo+IGxpbnV4cHBjLWRldkBs
aXN0cy5vemxhYnMub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgUm95IFphbmcgPHJveS56YW5nQG54cC5jb20+Ow0KPiBhbmRy
ZXcubXVycmF5QGFybS5jb207IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxvcmVuem8u
cGllcmFsaXNpQGFybS5jb207IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBNaW5na2Fp
IEh1DQo+IDxtaW5na2FpLmh1QG54cC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
Ow0KPiBqaW5nb29oYW4xQGdtYWlsLmNvbTsga2lzaG9uQHRpLmNvbTsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSHY3IDEyLzEyXSBtaXNjOiBwY2lfZW5k
cG9pbnRfdGVzdDogQWRkIGRyaXZlciBkYXRhIGZvcg0KPiBMYXllcnNjYXBlIFBDSWUgY29udHJv
bGxlcnMNCj4gDQo+IE9uIFR1ZSwgMTEgQXVnIDIwMjAgMTc6NTQ6NDEgKzA4MDAsIFpoaXFpYW5n
IEhvdSB3cm90ZToNCj4gPiBGcm9tOiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29t
Pg0KPiA+DQo+ID4gVGhlIGNvbW1pdCAwYTEyMWY5YmMzZjUgKCJtaXNjOiBwY2lfZW5kcG9pbnRf
dGVzdDogVXNlIHN0cmVhbWluZyBETUENCj4gPiBBUElzIGZvciBidWZmZXIgYWxsb2NhdGlvbiIp
IGNoYW5nZWQgdG8gdXNlIHN0cmVhbWluZyBETUEgQVBJcywNCj4gPiBob3dldmVyLA0KPiA+IGRt
YV9tYXBfc2luZ2xlKCkgbWlnaHQgbm90IHJldHVybiBhIDRLQiBhbGlnbmVkIGFkZHJlc3MsIHNv
IGFkZCB0aGUNCj4gPiBkZWZhdWx0X2RhdGEgYXMgZHJpdmVyIGRhdGEgZm9yIExheWVyc2NhcGUg
UENJZSBjb250cm9sbGVycyB0byBtYWtlIGl0DQo+ID4gNEtCIGFsaWduZWQuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiA+IC0t
LQ0KPiA+IFY3Og0KPiA+ICAtIE5ldyBwYXRjaC4NCj4gPg0KPiA+ICBkcml2ZXJzL21pc2MvcGNp
X2VuZHBvaW50X3Rlc3QuYyB8IDggKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiANCj4gQWNrZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo=
