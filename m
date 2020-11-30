Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8E22C8C97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 19:21:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClD8Y3tgNzDqkP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 05:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClD685jyczDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 05:19:35 +1100 (AEDT)
IronPort-SDR: UnQvwOUE3GNdPLwxqqn/3fffwZBLor9hzxlIPPyefBIPDyRwNyECogU550rIwy9FFvVDO5Dz13
 VKIHBr5vUSQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169187609"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="169187609"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 10:19:33 -0800
IronPort-SDR: XS1ISZYLRuHr2DP6wa+hnr2WbMlBroaPLFVMDoyVIDoBZGj3fB2+pzVl69W66H0oG/Gb4RGpz7
 zALQS1ilcxMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="314662861"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2020 10:19:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 10:19:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 10:19:32 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Mon, 30 Nov 2020 10:19:32 -0800
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "helgaas@kernel.org" <helgaas@kernel.org>, "David.Laight@ACULAB.COM"
 <David.Laight@ACULAB.COM>
Subject: Re: [PATCH v6 4/5] PCI: vmd: Update type of the __iomem pointers
Thread-Topic: [PATCH v6 4/5] PCI: vmd: Update type of the __iomem pointers
Thread-Index: AQHWxqR5T+KTElL2ckS1iiGCxL3tTang6SEAgACKCACAABBbgA==
Date: Mon, 30 Nov 2020 18:19:32 +0000
Message-ID: <f562dfc0043763ad6df3574dc9b7f0440687e66e.camel@intel.com>
References: <20201130172058.GA1088391@bjorn-Precision-5520>
In-Reply-To: <20201130172058.GA1088391@bjorn-Precision-5520>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6FB06213AE4BE4191D81BA8794047FC@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "kw@linux.com" <kw@linux.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>,
 "paulus@samba.org" <paulus@samba.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "jonnyc@amazon.com" <jonnyc@amazon.com>,
 "toan@os.amperecomputing.com" <toan@os.amperecomputing.com>,
 "will@kernel.org" <will@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "rrichter@marvell.com" <rrichter@marvell.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "nsaenzjulienne@suse.de" <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIwLTExLTMwIGF0IDExOjIwIC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBPbiBNb24sIE5vdiAzMCwgMjAyMCBhdCAwOTowNjo1NkFNICswMDAwLCBEYXZpZCBMYWlnaHQg
d3JvdGU6DQo+ID4gRnJvbTogS3J6eXN6dG9mIFdpbGN6eW5za2kNCj4gPiA+IFNlbnQ6IDI5IE5v
dmVtYmVyIDIwMjAgMjM6MDgNCj4gPiA+IA0KPiA+ID4gVXNlICJ2b2lkIF9faW9tZW0iIGluc3Rl
YWQgImNoYXIgX19pb21lbSIgcG9pbnRlciB0eXBlIHdoZW4gd29ya2luZyB3aXRoDQo+ID4gPiB0
aGUgYWNjZXNzb3IgZnVuY3Rpb25zICh3aXRoIG5hbWVzIGxpa2UgcmVhZGIoKSBvciB3cml0ZWwo
KSwgZXRjLikgdG8NCj4gPiA+IGJldHRlciBtYXRjaCBhIGdpdmVuIGFjY2Vzc29yIGZ1bmN0aW9u
IHNpZ25hdHVyZSB3aGVyZSBjb21tb25seSB0aGUNCj4gPiA+IGFkZHJlc3MgcG9pbnRpbmcgdG8g
YW4gSS9PIG1lbW9yeSByZWdpb24gd291bGQgYmUgYSAidm9pZCBfX2lvbWVtIg0KPiA+ID4gcG9p
bnRlci4NCj4gPiANCj4gPiBJU1RNIHRoYXQgaXMgaGVhZGluZyBpbiB0aGUgd3JvbmcgZGlyZWN0
aW9uLg0KPiA+IA0KPiA+IEkgdGhpbmsgKGZvcm0gdGhlIHZhcmlhYmxlIG5hbWVzIGV0YykgdGhh
dCB0aGVzZSBhcmUgcG9pbnRlcnMNCj4gPiB0byBzcGVjaWZpYyByZWdpc3RlcnMuDQo+ID4gDQo+
ID4gU28gd2hhdCB5b3Ugb3VnaHQgdG8gaGF2ZSBpcyBhIHR5cGUgZm9yIHRoYXQgcmVnaXN0ZXIg
YmxvY2suDQo+ID4gVHlwaWNhbGx5IHRoaXMgaXMgYWN0dWFsbHkgYSBzdHJ1Y3R1cmUgLSB0byBn
aXZlIHNvbWUgdHlwZQ0KPiA+IGNoZWNraW5nIHRoYXQgdGhlIG9mZnNldHMgYXJlIGJlaW5nIHVz
ZWQgd2l0aCB0aGUgY29ycmVjdA0KPiA+IGJhc2UgYWRkcmVzcy4NCj4gDQo+IEluIHRoaXMgY2Fz
ZSwgImNmZ2JhciIgaXMgbm90IHJlYWxseSBhIHBvaW50ZXIgdG8gYSByZWdpc3RlcjsgaXQncyB0
aGUNCj4gYWRkcmVzcyBvZiBtZW1vcnktbWFwcGVkIGNvbmZpZyBzcGFjZS4gIFRoZSBWTUQgaGFy
ZHdhcmUgdHVybnMNCj4gYWNjZXNzZXMgdG8gdGhhdCBzcGFjZSBpbnRvIFBDSSBjb25maWcgdHJh
bnNhY3Rpb25zIG9uIGl0cyBzZWNvbmRhcnkNCj4gc2lkZS4gIHhnZW5lX3BjaWVfZ2V0X2NmZ19i
YXNlKCkgYW5kIGJyY21fcGNpZV9tYXBfY29uZigpIGFyZSBzaW1pbGFyDQo+IHNpdHVhdGlvbnMg
YW5kIHVzZSAidm9pZCAqIi4NCj4gDQo+IEJqb3JuDQoNClllcyBpdCdzIGp1c3QgdGhlIHBhc3N0
aHJvdWdoIHdpbmRvdyBmb3IgUENJIGNvbmZpZyBidXMgb3BzLg0KDQpSZXZpZXdlZC1ieTogSm9u
IERlcnJpY2sgPGpvbmF0aGFuLmRlcnJpY2tAaW50ZWwuY29tPg0K
