Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D248419A5B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 11:14:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450l0c36j3zDqVK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 19:14:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=analog.com
 (client-ip=40.107.73.62; helo=nam05-dm3-obe.outbound.protection.outlook.com;
 envelope-from=alexandru.ardelean@analog.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com
 header.b="UtgaGDmS"; dkim-atps=neutral
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730062.outbound.protection.outlook.com [40.107.73.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450kz94jt8zDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 19:13:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd+V8yqGMykCDx3832Gazx49N+DzcZoh0jyuHRt5ol4=;
 b=UtgaGDmS/mFN7LqP4rRanlhIErtROJDfXKgcIeQ1c2pUsTHgWkYu7j96Yd2lPftDdz2wXx3xkpYor7R+H8gftiZOSJxx+ATBAk9fPgRuYm3L0Lav4JU1SKRoMBgfFlLd2aeYeN4GFuH2989f+gy+Ay1+8Dk0VQ9Sau1g+bv3pvo=
Received: from BN3PR03CA0101.namprd03.prod.outlook.com (2603:10b6:400:4::19)
 by BN3PR03MB2257.namprd03.prod.outlook.com (2a01:111:e400:c5f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Fri, 10 May
 2019 09:13:30 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::206) by BN3PR03CA0101.outlook.office365.com
 (2603:10b6:400:4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 09:13:29 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.57)
 smtp.mailfrom=analog.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Fri, 10 May 2019 09:13:29 +0000
Received: from NWD2HUBCAS8.ad.analog.com (nwd2hubcas8.ad.analog.com
 [10.64.69.108])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x4A9DRsE000406
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 10 May 2019 02:13:27 -0700
Received: from NWD2MBX7.ad.analog.com ([fe80::190e:f9c1:9a22:9663]) by
 NWD2HUBCAS8.ad.analog.com ([fe80::90a0:b93e:53c6:afee%12]) with mapi id
 14.03.0415.000; Fri, 10 May 2019 05:13:27 -0400
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: Re: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Thread-Topic: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Thread-Index: AQHVBZFjC5krcc3G0k+g00YBPwx6V6ZhaK0AgAAShYCAAt35AA==
Date: Fri, 10 May 2019 09:13:26 +0000
Message-ID: <31be52eb1a1abbc99a24729f5c65619235cb201f.camel@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-11-alexandru.ardelean@analog.com>
 <20190508122010.GC21059@kadam>
 <2ec6812d6bf2f33860c7c816c641167a31eb2ed6.camel@analog.com>
In-Reply-To: <2ec6812d6bf2f33860c7c816c641167a31eb2ed6.camel@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.1.244]
x-adiroutedonprem: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB59C46108248B4E9B7153CD2DF23B7C@analog.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(189003)(199004)(486006)(126002)(86362001)(186003)(436003)(426003)(11346002)(6916009)(2351001)(476003)(2501003)(478600001)(2616005)(47776003)(336012)(446003)(229853002)(5640700003)(5660300002)(305945005)(70206006)(70586007)(6116002)(7406005)(3846002)(7416002)(118296001)(7736002)(8676002)(54906003)(8936002)(6246003)(7636002)(102836004)(76176011)(7696005)(246002)(2486003)(23676004)(36756003)(26005)(356004)(316002)(2906002)(50466002)(14454004)(4326008)(106002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB2257; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed9fe5e3-db8d-4bcc-4243-08d6d527c4a6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328)(7193020);
 SRVR:BN3PR03MB2257; 
X-MS-TrafficTypeDiagnostic: BN3PR03MB2257:
X-Microsoft-Antispam-PRVS: <BN3PR03MB22575AF9CEACED448826345BF90C0@BN3PR03MB2257.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: hz7ohuHgjnC+2gC26Y3onOT2s7J5axPm+umLFJQFpWgNQk6MlgOTYWYEOsKdiXoy1GNT+vGczdwJR2hzhjkPPM1uQL11kNZN6SYSWyKfr2kiZbabqEYBPxg7icedXBmdO+rbB5SwWFk2CrIhe/7lkW+xgUYjQGNgYAWGE0lXiIRaorInlOmQTMPz663NCbL7aaCb7ajYyo05LxXNUMEKTW2Pof7owMPxVhD448BZPhIoBbV1UHHwV/vrelBEVbXLtRY94OqIxeAe7xTw2lhziZuN15WfFYwjblJa6OE/jYP1PkRLhqh4l1AN/UYxDW/icpD8nSoxxD0H5PPn7qhAU0pjn6TkUKbqtid8LuApVz3z+EfmjXcQFNq5JLTewszxUxStGHfqcWVxcM/2aY0TjxPPu7OPuaGxGQvTycbDhqM=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 09:13:29.7933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9fe5e3-db8d-4bcc-4243-08d6d527c4a6
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2257
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

T24gV2VkLCAyMDE5LTA1LTA4IGF0IDE2OjI2ICswMzAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3Jv
dGU6DQo+IE9uIFdlZCwgMjAxOS0wNS0wOCBhdCAxNToyMCArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToNCj4gPiANCj4gPiANCj4gPiBPbiBXZWQsIE1heSAwOCwgMjAxOSBhdCAwMjoyODozNVBN
ICswMzAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6DQo+ID4gPiAtc3RhdGljIGNvbnN0IGNo
YXIgKiBjb25zdCBwaHlfdHlwZXNbXSA9IHsNCj4gPiA+IC0gICAgICJlbW1jIDUuMCBwaHkiLA0K
PiA+ID4gLSAgICAgImVtbWMgNS4xIHBoeSINCj4gPiA+IC19Ow0KPiA+ID4gLQ0KPiA+ID4gIGVu
dW0geGVub25fcGh5X3R5cGVfZW51bSB7DQo+ID4gPiAgICAgICBFTU1DXzVfMF9QSFksDQo+ID4g
PiAgICAgICBFTU1DXzVfMV9QSFksDQo+ID4gPiAgICAgICBOUl9QSFlfVFlQRVMNCj4gPiANCj4g
PiBUaGVyZSBpcyBubyBuZWVkIGZvciBOUl9QSFlfVFlQRVMgbm93IHNvIHlvdSBjb3VsZCByZW1v
dmUgdGhhdCBhcyB3ZWxsLg0KPiA+IA0KPiANCj4gSSB0aG91Z2h0IHRoZSBzYW1lLg0KPiBUaGUg
b25seSByZWFzb24gdG8ga2VlcCBOUl9QSFlfVFlQRVMsIGlzIGZvciBwb3RlbnRpYWwgZnV0dXJl
IHBhdGNoZXMsDQo+IHdoZXJlIGl0IHdvdWxkIGJlIGp1c3QgMSBhZGRpdGlvbg0KPiANCj4gIGVu
dW0geGVub25fcGh5X3R5cGVfZW51bSB7DQo+ICAgICAgIEVNTUNfNV8wX1BIWSwNCj4gICAgICAg
RU1NQ181XzFfUEhZLA0KPiArICAgICAgRU1NQ181XzJfUEhZLA0KPiAgICAgICBOUl9QSFlfVFlQ
RVMNCj4gICB9DQo+IA0KPiBEZXBlbmRpbmcgb24gc3R5bGUvcHJlZmVyZW5jZSBvZiBob3cgdG8g
ZG8gZW51bXMgKGFsbG93IGNvbW1hIG9uIGxhc3QNCj4gZW51bQ0KPiBvciBub3QgYWxsb3cgY29t
bWEgb24gbGFzdCBlbnVtIHZhbHVlKSwgYWRkaW5nIG5ldyBlbnVtIHZhbHVlcyB3b3VkbCBiZSAy
DQo+IGFkZGl0aW9ucyArIDEgZGVsZXRpb24gbGluZXMuDQo+IA0KPiAgZW51bSB4ZW5vbl9waHlf
dHlwZV9lbnVtIHsNCj4gICAgICAgRU1NQ181XzBfUEhZLA0KPiAtICAgICAgRU1NQ181XzFfUEhZ
DQo+ICsgICAgICBFTU0NCj4gQ181XzFfUEhZLA0KPiArICAgICAgRU1NQ181XzJfUEhZDQo+ICB9
DQo+IA0KPiBFaXRoZXIgd2F5IChsZWF2ZSBOUl9QSFlfVFlQRVMgb3IgcmVtb3ZlIE5SX1BIWV9U
WVBFUykgaXMgZmluZSBmcm9tIG15DQo+IHNpZGUuDQo+IA0KDQpQcmVmZXJlbmNlIG9uIHRoaXMg
Pw0KSWYgbm8gb2JqZWN0aW9uIFtub2JvZHkgaW5zaXN0c10gSSB3b3VsZCBrZWVwLg0KDQpJIGRv
bid0IGZlZWwgc3Ryb25nbHkgYWJvdXQgaXQgW2Ryb3BwaW5nIE5SX1BIWV9UWVBFUyBvciBub3Rd
Lg0KDQpUaGFua3MNCkFsZXgNCg0KPiBUaGFua3MNCj4gQWxleA0KPiANCj4gPiByZWdhcmRzLA0K
PiA+IGRhbiBjYXJwZW50ZXINCj4gPiANCg==
