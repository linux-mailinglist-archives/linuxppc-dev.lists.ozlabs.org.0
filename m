Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE212C8094
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:08:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkztS43ZLzDrDm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 20:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkzrT6tjPzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 20:07:03 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-80-IWcXTuCBM3uUJIkbSzc7wQ-1; Mon, 30 Nov 2020 09:06:57 +0000
X-MC-Unique: IWcXTuCBM3uUJIkbSzc7wQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 30 Nov 2020 09:06:56 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 30 Nov 2020 09:06:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0tyenlzenRvZiBXaWxjennFhHNraSc=?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>
Subject: RE: [PATCH v6 4/5] PCI: vmd: Update type of the __iomem pointers
Thread-Topic: [PATCH v6 4/5] PCI: vmd: Update type of the __iomem pointers
Thread-Index: AQHWxqWOFrNLxNoH9E63s2U4AbPR/6ngYYng
Date: Mon, 30 Nov 2020 09:06:56 +0000
Message-ID: <81f4ddc2f0524b4b80c8a0bfa2df57fe@AcuMS.aculab.com>
References: <20201129230743.3006978-1-kw@linux.com>
 <20201129230743.3006978-5-kw@linux.com>
In-Reply-To: <20201129230743.3006978-5-kw@linux.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Michal
 Simek <michal.simek@xilinx.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Robert Richter <rrichter@marvell.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogS3J6eXN6dG9mIFdpbGN6eW5za2kNCj4gU2VudDogMjkgTm92ZW1iZXIgMjAyMCAyMzow
OA0KPiANCj4gVXNlICJ2b2lkIF9faW9tZW0iIGluc3RlYWQgImNoYXIgX19pb21lbSIgcG9pbnRl
ciB0eXBlIHdoZW4gd29ya2luZyB3aXRoDQo+IHRoZSBhY2Nlc3NvciBmdW5jdGlvbnMgKHdpdGgg
bmFtZXMgbGlrZSByZWFkYigpIG9yIHdyaXRlbCgpLCBldGMuKSB0bw0KPiBiZXR0ZXIgbWF0Y2gg
YSBnaXZlbiBhY2Nlc3NvciBmdW5jdGlvbiBzaWduYXR1cmUgd2hlcmUgY29tbW9ubHkgdGhlDQo+
IGFkZHJlc3MgcG9pbnRpbmcgdG8gYW4gSS9PIG1lbW9yeSByZWdpb24gd291bGQgYmUgYSAidm9p
ZCBfX2lvbWVtIg0KPiBwb2ludGVyLg0KDQpJU1RNIHRoYXQgaXMgaGVhZGluZyBpbiB0aGUgd3Jv
bmcgZGlyZWN0aW9uLg0KDQpJIHRoaW5rIChmb3JtIHRoZSB2YXJpYWJsZSBuYW1lcyBldGMpIHRo
YXQgdGhlc2UgYXJlIHBvaW50ZXJzDQp0byBzcGVjaWZpYyByZWdpc3RlcnMuDQoNClNvIHdoYXQg
eW91IG91Z2h0IHRvIGhhdmUgaXMgYSB0eXBlIGZvciB0aGF0IHJlZ2lzdGVyIGJsb2NrLg0KVHlw
aWNhbGx5IHRoaXMgaXMgYWN0dWFsbHkgYSBzdHJ1Y3R1cmUgLSB0byBnaXZlIHNvbWUgdHlwZQ0K
Y2hlY2tpbmcgdGhhdCB0aGUgb2Zmc2V0cyBhcmUgYmVpbmcgdXNlZCB3aXRoIHRoZSBjb3JyZWN0
DQpiYXNlIGFkZHJlc3MuDQoNCklmIHRoZSBjb2RlIGlzIHVzaW5nIG51bWVyaWMgb2Zmc2V0cyAo
aGFyZHdhcmUgZW5naW5lZXJzIGxpa2UNCm51bWVyaWMgb2Zmc2V0cykgdGhlbiB5b3UgY2FuIGdl
dCBzb21lIHR5cGUgcHJvdGVjdGlvbiBieSB1c2luZw0KYSBzdHJ1Y3R1cmUgdGhhdCBvbmx5IGNv
bnRhaW5zIGEgc2luZ2xlIGZpZWxkIChjaGFyIGluIHRoaXMgY2FzZSkuDQoNCglEYXZpZA0KDQot
DQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwg
TWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2Fs
ZXMpDQo=

