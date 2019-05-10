Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB419C2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 13:06:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450nTF48YCzDqTY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 21:06:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=analog.com
 (client-ip=40.107.78.80; helo=nam03-by2-obe.outbound.protection.outlook.com;
 envelope-from=alexandru.ardelean@analog.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com
 header.b="cJaRCIlX"; dkim-atps=neutral
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780080.outbound.protection.outlook.com [40.107.78.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450nRk3W1qzDqSR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 21:05:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVlpM+6hUpJfEDjmqqh5buswTi9IXWo+idp+3aYvadA=;
 b=cJaRCIlXlhytsC0WOUjovdUXlHRExZWPjhVf03F0+kh9EW3mb68RI6Rnc3cHyEhKGz4sJV9wA82vpcEx/F+iU3ypyrnsW4/k0e997VS2hIGKO+igCU4zzHHlAx2b/kf5RKAjaKA2W3b6tkRnBRfNgWUAFNGQGOnAYoLiEYdp3VE=
Received: from BN6PR03CA0017.namprd03.prod.outlook.com (2603:10b6:404:23::27)
 by BY2PR03MB556.namprd03.prod.outlook.com (2a01:111:e400:2c3a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Fri, 10 May
 2019 11:04:54 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::208) by BN6PR03CA0017.outlook.office365.com
 (2603:10b6:404:23::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Fri, 10 May 2019 11:04:54 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.57)
 smtp.mailfrom=analog.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Fri, 10 May 2019 11:04:53 +0000
Received: from NWD2HUBCAS9.ad.analog.com (nwd2hubcas9.ad.analog.com
 [10.64.69.109])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x4AB4rkt031706
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 10 May 2019 04:04:53 -0700
Received: from NWD2MBX7.ad.analog.com ([fe80::190e:f9c1:9a22:9663]) by
 NWD2HUBCAS9.ad.analog.com ([fe80::44a2:871b:49ab:ea47%12]) with mapi id
 14.03.0415.000; Fri, 10 May 2019 07:04:53 -0400
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: Re: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Thread-Topic: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Thread-Index: AQHVBZFjC5krcc3G0k+g00YBPwx6V6ZhaK0AgAAShYCAAt35AIAAHiKAgAABAAA=
Date: Fri, 10 May 2019 11:04:53 +0000
Message-ID: <d320a13ad06bba87fcb0c04c4143e911723684ea.camel@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-11-alexandru.ardelean@analog.com>
 <20190508122010.GC21059@kadam>
 <2ec6812d6bf2f33860c7c816c641167a31eb2ed6.camel@analog.com>
 <31be52eb1a1abbc99a24729f5c65619235cb201f.camel@analog.com>
 <20190510110116.GB18105@kadam>
In-Reply-To: <20190510110116.GB18105@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.1.244]
x-adiroutedonprem: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <134D0B85CEA25646B3EBD898406EC02C@analog.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(189003)(199004)(426003)(76176011)(102836004)(26005)(436003)(70206006)(446003)(8936002)(7696005)(70586007)(36756003)(14444005)(6246003)(186003)(336012)(2486003)(8676002)(6116002)(3846002)(229853002)(5660300002)(11346002)(47776003)(5640700003)(356004)(305945005)(50466002)(2616005)(476003)(6916009)(2906002)(118296001)(478600001)(126002)(7736002)(86362001)(14454004)(2351001)(2501003)(7636002)(23676004)(106002)(246002)(4326008)(316002)(7416002)(7406005)(54906003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB556; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f76a2088-dc12-4942-d433-08d6d537549b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328)(7193020);
 SRVR:BY2PR03MB556; 
X-MS-TrafficTypeDiagnostic: BY2PR03MB556:
X-Microsoft-Antispam-PRVS: <BY2PR03MB5567CAEF2048D0CACEA3D3CF90C0@BY2PR03MB556.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tULqUEYxx8A1Vcan/qfbE7E/YiNcE+blJBkWLIfZLYQfoW+YJfMk/7pGVcvZ1Zi7zwbrhva5fOWhPlE7BRloVhcy0b7UY+H3u7eHfxlqm2FqcBDBRA6rNCrikJSdpJCdjDevTorMO4v2pbPJ9vgXgpdzx4rSWTBAzaTFpTqnxoN6817pHFRM6OimKYwZT+zkHQBRDborUH0cfCMCTH7W/DYsug3lJUPmoVohbzUw7Qlzb5gflrpKMIIuKRlZUQA5y+LwbgY2fjwZItJ1in7CCdq2yHbgQEyod/D4nUaFXtQNysaVfM6q5P4JW2pJdKeJjrqkRhofhZP8Dy5+VsJYbafZu2hWLTkGR5O0X96SKzhm9VbATpPl5eWgoo6bTpaSEgvMToAEFFE6dQ7aXg+NwW0dDvkkJwZFaifj5Uv3dxk=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 11:04:53.7708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f76a2088-dc12-4942-d433-08d6d537549b
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB556
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDE5LTA1LTEwIGF0IDE0OjAxICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBbRXh0ZXJuYWxdDQo+IA0KPiANCj4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDk6MTM6MjZB
TSArMDAwMCwgQXJkZWxlYW4sIEFsZXhhbmRydSB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMTktMDUt
MDggYXQgMTY6MjYgKzAzMDAsIEFsZXhhbmRydSBBcmRlbGVhbiB3cm90ZToNCj4gPiA+IE9uIFdl
ZCwgMjAxOS0wNS0wOCBhdCAxNToyMCArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gPiA+
ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiBXZWQsIE1heSAwOCwgMjAxOSBhdCAwMjoyODozNVBN
ICswMzAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6DQo+ID4gPiA+ID4gLXN0YXRpYyBjb25z
dCBjaGFyICogY29uc3QgcGh5X3R5cGVzW10gPSB7DQo+ID4gPiA+ID4gLSAgICAgImVtbWMgNS4w
IHBoeSIsDQo+ID4gPiA+ID4gLSAgICAgImVtbWMgNS4xIHBoeSINCj4gPiA+ID4gPiAtfTsNCj4g
PiA+ID4gPiAtDQo+ID4gPiA+ID4gIGVudW0geGVub25fcGh5X3R5cGVfZW51bSB7DQo+ID4gPiA+
ID4gICAgICAgRU1NQ181XzBfUEhZLA0KPiA+ID4gPiA+ICAgICAgIEVNTUNfNV8xX1BIWSwNCj4g
PiA+ID4gPiAgICAgICBOUl9QSFlfVFlQRVMNCj4gPiA+ID4gDQo+ID4gPiA+IFRoZXJlIGlzIG5v
IG5lZWQgZm9yIE5SX1BIWV9UWVBFUyBub3cgc28geW91IGNvdWxkIHJlbW92ZSB0aGF0IGFzDQo+
ID4gPiA+IHdlbGwuDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBJIHRob3VnaHQgdGhlIHNhbWUu
DQo+ID4gPiBUaGUgb25seSByZWFzb24gdG8ga2VlcCBOUl9QSFlfVFlQRVMsIGlzIGZvciBwb3Rl
bnRpYWwgZnV0dXJlDQo+ID4gPiBwYXRjaGVzLA0KPiA+ID4gd2hlcmUgaXQgd291bGQgYmUganVz
dCAxIGFkZGl0aW9uDQo+ID4gPiANCj4gPiA+ICBlbnVtIHhlbm9uX3BoeV90eXBlX2VudW0gew0K
PiA+ID4gICAgICAgRU1NQ181XzBfUEhZLA0KPiA+ID4gICAgICAgRU1NQ181XzFfUEhZLA0KPiA+
ID4gKyAgICAgIEVNTUNfNV8yX1BIWSwNCj4gPiA+ICAgICAgIE5SX1BIWV9UWVBFUw0KPiA+ID4g
ICB9DQo+ID4gPiANCj4gPiA+IERlcGVuZGluZyBvbiBzdHlsZS9wcmVmZXJlbmNlIG9mIGhvdyB0
byBkbyBlbnVtcyAoYWxsb3cgY29tbWEgb24gbGFzdA0KPiA+ID4gZW51bQ0KPiA+ID4gb3Igbm90
IGFsbG93IGNvbW1hIG9uIGxhc3QgZW51bSB2YWx1ZSksIGFkZGluZyBuZXcgZW51bSB2YWx1ZXMg
d291ZGwNCj4gPiA+IGJlIDINCj4gPiA+IGFkZGl0aW9ucyArIDEgZGVsZXRpb24gbGluZXMuDQo+
ID4gPiANCj4gPiA+ICBlbnVtIHhlbm9uX3BoeV90eXBlX2VudW0gew0KPiA+ID4gICAgICAgRU1N
Q181XzBfUEhZLA0KPiA+ID4gLSAgICAgIEVNTUNfNV8xX1BIWQ0KPiA+ID4gKyAgICAgIEVNTQ0K
PiA+ID4gQ181XzFfUEhZLA0KPiA+ID4gKyAgICAgIEVNTUNfNV8yX1BIWQ0KPiA+ID4gIH0NCj4g
PiA+IA0KPiA+ID4gRWl0aGVyIHdheSAobGVhdmUgTlJfUEhZX1RZUEVTIG9yIHJlbW92ZSBOUl9Q
SFlfVFlQRVMpIGlzIGZpbmUgZnJvbQ0KPiA+ID4gbXkNCj4gPiA+IHNpZGUuDQo+ID4gPiANCj4g
PiANCj4gPiBQcmVmZXJlbmNlIG9uIHRoaXMgPw0KPiA+IElmIG5vIG9iamVjdGlvbiBbbm9ib2R5
IGluc2lzdHNdIEkgd291bGQga2VlcC4NCj4gPiANCj4gPiBJIGRvbid0IGZlZWwgc3Ryb25nbHkg
YWJvdXQgaXQgW2Ryb3BwaW5nIE5SX1BIWV9UWVBFUyBvciBub3RdLg0KPiANCj4gSWYgeW91IGVu
ZCB1cCByZXNlbmRpbmcgdGhlIHNlcmllcyBjb3VsZCB5b3UgcmVtb3ZlIGl0LCBidXQgaWYgbm90
IHRoZW4NCj4gaXQncyBub3Qgd29ydGggaXQuDQoNCmFjaw0KDQp0aGFua3MNCkFsZXgNCg0KPiAN
Cj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KPiANCg==
