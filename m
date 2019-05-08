Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2617D63
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 17:37:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zgbP0R49zDqRk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 01:37:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=analog.com
 (client-ip=2a01:111:f400:fe49::609;
 helo=nam03-dm3-obe.outbound.protection.outlook.com;
 envelope-from=alexandru.ardelean@analog.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com
 header.b="Mi3Xs1RZ"; dkim-atps=neutral
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zch20cj6zDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 23:26:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRZOazIR7In+02p6vDsRizpcnxBWx1U//h0MEIEuZuc=;
 b=Mi3Xs1RZR1Kk+9QXXdeLCo8LvH71RvweK88Lp8oOtgh22y7zUwWEHAVk/8NUHjE2KwzUQnuoX6z3YpP+BGC5DbMSAxk+Z+07rj9W/9VF7pgKWq8mzmZ/O53Qy+mJj7jhPTUQW7S5tpYn4NiZ/bCdRjZQhZSSjGo97Kg1QMa3Zxk=
Received: from DM6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:5:100::27)
 by SN2PR03MB2270.namprd03.prod.outlook.com (2603:10b6:804:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Wed, 8 May
 2019 13:26:33 +0000
Received: from CY1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by DM6PR03CA0050.outlook.office365.com
 (2603:10b6:5:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11 via Frontend
 Transport; Wed, 8 May 2019 13:26:33 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.57)
 smtp.mailfrom=analog.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT011.mail.protection.outlook.com (10.152.75.156) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 13:26:31 +0000
Received: from NWD2HUBCAS9.ad.analog.com (nwd2hubcas9.ad.analog.com
 [10.64.69.109])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x48DQUQM021820
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 06:26:30 -0700
Received: from NWD2MBX7.ad.analog.com ([fe80::190e:f9c1:9a22:9663]) by
 NWD2HUBCAS9.ad.analog.com ([fe80::44a2:871b:49ab:ea47%12]) with mapi id
 14.03.0415.000; Wed, 8 May 2019 09:26:29 -0400
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Subject: Re: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Thread-Topic: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Thread-Index: AQHVBZFjC5krcc3G0k+g00YBPwx6V6ZhaK0AgAAShYA=
Date: Wed, 8 May 2019 13:26:29 +0000
Message-ID: <2ec6812d6bf2f33860c7c816c641167a31eb2ed6.camel@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-11-alexandru.ardelean@analog.com>
 <20190508122010.GC21059@kadam>
In-Reply-To: <20190508122010.GC21059@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.1.244]
x-adiroutedonprem: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6166AD703C20264A8933E29F0D6472FA@analog.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(199004)(189003)(7696005)(76176011)(229853002)(356004)(70206006)(7416002)(7406005)(316002)(2486003)(23676004)(305945005)(7736002)(7636002)(47776003)(6246003)(4326008)(54906003)(2906002)(106002)(6116002)(3846002)(446003)(14444005)(36756003)(478600001)(186003)(102836004)(126002)(486006)(2616005)(476003)(2351001)(86362001)(2501003)(70586007)(118296001)(50466002)(336012)(8936002)(5660300002)(14454004)(5640700003)(6916009)(4744005)(436003)(426003)(26005)(246002)(11346002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR03MB2270; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfdadccb-4d44-4864-c715-08d6d3b8c9c3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328)(7193020);
 SRVR:SN2PR03MB2270; 
X-MS-TrafficTypeDiagnostic: SN2PR03MB2270:
X-Microsoft-Antispam-PRVS: <SN2PR03MB22702FB510E95C53ECE1B38AF9320@SN2PR03MB2270.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fV1p6yRnB85jQZJN7eRbmOVfYHNwky9etvny6vTDXhePyeWXsqL1v2Aesb+Wk2QXqNCdHVI7JxPpMwTuJmBLaQ98M5NyNZ6XAm57uPOwak+8pn1MIc9yqsnCgia/XHmaLRDKnfXPVsH6Dygj8nYwt/0eV2mYNm9yTO8q0OeU2Og99154RYQ9n8VC3F0OaaBq7VRly+zYEpsK/KpXipHcs3BgmCCQ4nFSeqWpM/F2P+H7TCUsZxK/t9wXauan74KDJNvfmggirOduBXb04+FG6sVpxsKYTszlRJOKYk27ytxWmH843gqE47SClPstH2PhW66aSpufvNJ0pbqiMVZw6BPG0s0jouyFZkplH++TiX/GsSSRxs9pL+v1FgQVuD5jfwwE6cpi+GA0D9SnaPwM45pGQJSeNO4gm4s7r+wCjks=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 13:26:31.5064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdadccb-4d44-4864-c715-08d6d3b8c9c3
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2270
X-Mailman-Approved-At: Thu, 09 May 2019 01:00:55 +1000
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

T24gV2VkLCAyMDE5LTA1LTA4IGF0IDE1OjIwICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiANCj4gDQo+IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDAyOjI4OjM1UE0gKzAzMDAsIEFsZXhh
bmRydSBBcmRlbGVhbiB3cm90ZToNCj4gPiAtc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBwaHlf
dHlwZXNbXSA9IHsNCj4gPiAtICAgICAiZW1tYyA1LjAgcGh5IiwNCj4gPiAtICAgICAiZW1tYyA1
LjEgcGh5Ig0KPiA+IC19Ow0KPiA+IC0NCj4gPiAgZW51bSB4ZW5vbl9waHlfdHlwZV9lbnVtIHsN
Cj4gPiAgICAgICBFTU1DXzVfMF9QSFksDQo+ID4gICAgICAgRU1NQ181XzFfUEhZLA0KPiA+ICAg
ICAgIE5SX1BIWV9UWVBFUw0KPiANCj4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgTlJfUEhZX1RZUEVT
IG5vdyBzbyB5b3UgY291bGQgcmVtb3ZlIHRoYXQgYXMgd2VsbC4NCj4gDQoNCkkgdGhvdWdodCB0
aGUgc2FtZS4NClRoZSBvbmx5IHJlYXNvbiB0byBrZWVwIE5SX1BIWV9UWVBFUywgaXMgZm9yIHBv
dGVudGlhbCBmdXR1cmUgcGF0Y2hlcywNCndoZXJlIGl0IHdvdWxkIGJlIGp1c3QgMSBhZGRpdGlv
bg0KDQogZW51bSB4ZW5vbl9waHlfdHlwZV9lbnVtIHsNCiAgICAgIEVNTUNfNV8wX1BIWSwNCiAg
ICAgIEVNTUNfNV8xX1BIWSwNCisgICAgICBFTU1DXzVfMl9QSFksDQogICAgICBOUl9QSFlfVFlQ
RVMNCiAgfQ0KDQpEZXBlbmRpbmcgb24gc3R5bGUvcHJlZmVyZW5jZSBvZiBob3cgdG8gZG8gZW51
bXMgKGFsbG93IGNvbW1hIG9uIGxhc3QgZW51bQ0Kb3Igbm90IGFsbG93IGNvbW1hIG9uIGxhc3Qg
ZW51bSB2YWx1ZSksIGFkZGluZyBuZXcgZW51bSB2YWx1ZXMgd291ZGwgYmUgMg0KYWRkaXRpb25z
ICsgMSBkZWxldGlvbiBsaW5lcy4NCg0KIGVudW0geGVub25fcGh5X3R5cGVfZW51bSB7DQogICAg
ICBFTU1DXzVfMF9QSFksDQotICAgICAgRU1NQ181XzFfUEhZDQorICAgICAgRU1NDQpDXzVfMV9Q
SFksDQorICAgICAgRU1NQ181XzJfUEhZDQogfQ0KDQpFaXRoZXIgd2F5IChsZWF2ZSBOUl9QSFlf
VFlQRVMgb3IgcmVtb3ZlIE5SX1BIWV9UWVBFUykgaXMgZmluZSBmcm9tIG15DQpzaWRlLg0KDQpU
aGFua3MNCkFsZXgNCg0KPiByZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQo+IA0K
