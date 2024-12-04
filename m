Return-Path: <linuxppc-dev+bounces-3790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA39E3909
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 12:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Fw56Tk4z30WT;
	Wed,  4 Dec 2024 22:41:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=207.171.184.29
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733312469;
	cv=none; b=ROOHnOX77c4RQR+sTcYTOSZcSdjHHHys22L0+rLDlJia+PwybVVEIHr/2UUQDB4yeV36CnqDxUe2rYih/wl43az1u1M6i8xqOk+ZQOH7rzV7cq8GHFwFmoFLADiiHZeULBQ96UGUI1JMCHelFNCWoPTQ7isAoBCXjxASjp1PlPce34BolGhhd7NAyi+TBixlhhrX7NxQ2tnxw8obZ+WWY9ur9xPkCe5u7HRpYMRtwHtHbYj13LoVvIhNkNBuMFKWSPFcARsWKQk6N/7vT14tuchiriCiDs7NpvUMoMP5ypilzhcSuVI2e5bJRJEqL7daWItSdb7M81lbHIRkZGus1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733312469; c=relaxed/relaxed;
	bh=L3N4xnB4hpUkX70oEIl5ay7oOHjK5rWVH5VO26SBMRE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gypjPBHgpj9L0qk48N7Zv6mmgfOBNyFO2SR8Q4G/6gjsjE9+imcLf1AqPLu5+38Mln2S0ZzVeaCk1rbhSsl69iN+RqcdAXqAx2/+QbBDTyu2JcyP41DZppzrNA2xdtR4QKvdVQ4fCbj/bnH1rgGYKioWSKGcctuGyJ/ZDbUS/X2o32THh86Vj/5hGdALwxt8SYFFoLmoL6gFKQdk01xGSl9EYKbZCG1VlzdbCLwlet0G/3m6kMTW6PYkWMRyC5l8pSfoNHVY0+0i2vSatK7uMwt/CEMrAmpKMnuED7w7JSTP06hQ+VyeMnzOLC2QEos1jW+4H9GrJlmJaMyyBpclHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=UO/tm47s; dkim-atps=neutral; spf=pass (client-ip=207.171.184.29; helo=smtp-fw-9102.amazon.com; envelope-from=prvs=061ca9da5=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=UO/tm47s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=207.171.184.29; helo=smtp-fw-9102.amazon.com; envelope-from=prvs=061ca9da5=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3Fw04rKDz30RS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 22:41:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733312466; x=1764848466;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=L3N4xnB4hpUkX70oEIl5ay7oOHjK5rWVH5VO26SBMRE=;
  b=UO/tm47s00ne6mK89oZltuzCB5p6jjyEPHhHVvRgfuI29sftogbwKg3G
   wpwlV6UvfJS3JsKr4zxAlg65kThmr5azehCDfE/XmDTY5q97IBfSbrnp5
   QHlOpAMN7tk78+aXQG07OXu8AUgBJ9gqxWMx6a+mFKKYYOySROpk/yt59
   4=;
X-IronPort-AV: E=Sophos;i="6.12,207,1728950400"; 
   d="scan'208";a="475378494"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 11:40:58 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.17.79:59262]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.10.207:2525] with esmtp (Farcaster)
 id 52e49eb4-420c-4db9-a56f-779f9c594c75; Wed, 4 Dec 2024 11:40:55 +0000 (UTC)
X-Farcaster-Flow-ID: 52e49eb4-420c-4db9-a56f-779f9c594c75
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 4 Dec 2024 11:40:55 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 11:40:55 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Wed, 4 Dec 2024 11:40:55 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Jiri Slaby <jirislaby@kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
	<bhe@redhat.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
	"sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
	"adityag@linux.ibm.com" <adityag@linux.ibm.com>, "songshuaishuai@tinylab.org"
	<songshuaishuai@tinylab.org>, "takakura@valinux.co.jp"
	<takakura@valinux.co.jp>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v5 1/2] kexec: Consolidate machine_kexec_mask_interrupts()
 implementation
Thread-Topic: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Thread-Index: AdtGQRkhPCy0bAvuc0C5GQef/95iog==
Date: Wed, 4 Dec 2024 11:40:55 +0000
Message-ID: <4192766c8f02494a82db68f5732c6dd2@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.85.143.173]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-10.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

T24gMTIvNC8yMDI0IDE6MDIgUE0sIEppcmkgU2xhYnkgd3JvdGU6DQo+PiArDQo+PiArY29uZmln
IEdFTkVSSUNfSVJRX0tFWEVDX0NMRUFSX1ZNX0ZPUldBUkQNCj4+ICsgICAgIGJvb2wgIkNsZWFy
IGZvcndhcmRlZCBWTSBpbnRlcnJ1cHRzIGR1cmluZyBrZXhlYyINCj4+ICsgICAgIGRlZmF1bHQg
bg0KPj4gKyAgICAgaGVscA0KPj4gKyAgICAgICBXaGVuIGVuYWJsZWQsIHRoaXMgb3B0aW9uIGFs
bG93cyB0aGUga2VybmVsIHRvIGNsZWFyIHRoZSBhY3RpdmUgc3RhdGUNCj4+ICsgICAgICAgb2Yg
aW50ZXJydXB0cyB0aGF0IGFyZSBmb3J3YXJkZWQgdG8gdmlydHVhbCBtYWNoaW5lcyAoVk1zKSBk
dXJpbmcgYQ0KPj4gKyAgICAgICBtYWNoaW5lIGtleGVjLiBGb3IgaW50ZXJydXB0cyB0aGF0IGFy
ZSBub3QgZm9yd2FyZGVkLCBpZiBzdXBwb3J0ZWQsDQo+PiArICAgICAgIHRoZSBrZXJuZWwgd2ls
bCBhdHRlbXB0IHRvIHRyaWdnZXIgYW4gRW5kIG9mIEludGVycnVwdCAoRU9JKS4NCj4NCj4gVGhp
cyBjYXVnaHQgbXkgYXR0ZW50aW9uLiBJdCBsb29rcyBsaWtlIHlvdSB3YW50IHRvIGFsbG93IHBl
b3BsZSB0b2dnbGluZyBpdD8gSSBiZWxpZXZlIG9ubHkgYXJjaCBjb2RlIHNob3VsZCB0dXJuIGl0
IG9uIGFzIHlvdSBkbyBieSAic2VsZWN0Iiwgbm90IHVzZXJzLg0KDQpUaG9tYXMgR2xlaXhuZXIg
aGFzIGFsc28gY29tbWVudGVkIGFib3V0IGl0Og0KIg0KVGhpcyBzaG91bGQgbm90IGJlIHVzZXIg
c2VsZWN0YWJsZS4gSnVzdCBrZWVwIGl0IGFzOg0KDQpjb25maWcgR0VORVJJQ19JUlFfS0VYRUNf
Q0xFQVJfVk1fRk9SV0FSRA0KICAgICAgICBib29sDQoNCndoaWNoIGRlZmF1bHRzIHRvICduJy4g
SnVzdCBhZGQgYSBjb21tZW50IHdoYXQgdGhpcyBpcyBhYm91dCBsaWtlIGl0J3MgZG9uZSB3aXRo
IHRoZSBvdGhlciBvcHRpb25zIGluIHRoYXQgZmlsZSB3aGljaCBhcmUgb25seSBzZWxlY3RhYmxl
Lg0KIg0KDQpJIHdpbGwgZml4IGl0IGluIHY2Lg0KSSdtIGp1c3Qgd2FpdGluZyBmb3IgYSByZXBs
eSBpZiB0aGUgbmV3IGNvbmZpZ3VyYXRpb24gb3B0aW9uIHNob3VsZCBiZQ0KcGxhY2VkIGluc2lk
ZSBvciBhZnRlciB0aGUgZm9sbG93aW5nIHNlY3Rpb246DQpgYGANCm1lbnUgIklSUSBzdWJzeXN0
ZW0iDQoNCmVuZG1lbnUNCmBgYA0KDQpUaGFua3MsIEVsaWF2DQo=

