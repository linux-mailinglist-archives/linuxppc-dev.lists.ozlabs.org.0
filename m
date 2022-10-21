Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7A606EAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 06:12:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtrdX4Tfsz3dwP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 15:12:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mtrcz4fvPz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 15:11:30 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-248-s68IOj53PiiIuHOXq5VdrA-1; Fri, 21 Oct 2022 05:11:24 +0100
X-MC-Unique: s68IOj53PiiIuHOXq5VdrA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Oct
 2022 05:11:23 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Fri, 21 Oct 2022 05:11:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Tony Luck' <tony.luck@intel.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Subject: RE: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Thread-Topic: [PATCH v2] mm, hwpoison: Try to recover from copy-on write
 faults
Thread-Index: AQHY5QLKTeMIBBrbhUi0l3qIy2avP64YPAZA
Date: Fri, 21 Oct 2022 04:11:23 +0000
Message-ID: <1643d19d795b4a8084228eab66a7db9f@AcuMS.aculab.com>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
 <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
 <359bae4e-6ce3-cc7e-33d0-252064157bc6@linux.alibaba.com>
 <Y1IbOAvpGzA8bst1@agluck-desk3.sc.intel.com>
In-Reply-To: <Y1IbOAvpGzA8bst1@agluck-desk3.sc.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew
 Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogVG9ueSBMdWNrDQo+IFNlbnQ6IDIxIE9jdG9iZXIgMjAyMiAwNTowOA0KLi4uLg0KPiBX
aGVuIHdlIGRvIHJldHVybiB0byB1c2VyIG1vZGUgdGhlIHRhc2sgaXMgZ29pbmcgdG8gYmUgYnVz
eSBzZXJ2aWNpbmcNCj4gYSBTSUdCVVMgLi4uIHNvIHNob3VsZG4ndCB0cnkgdG8gdG91Y2ggdGhl
IHBvaXNvbiBwYWdlIGJlZm9yZSB0aGUNCj4gbWVtb3J5X2ZhaWx1cmUoKSBjYWxsZWQgYnkgdGhl
IHdvcmtlciB0aHJlYWQgY2xlYW5zIHRoaW5ncyB1cC4NCg0KV2hhdCBhYm91dCBhbiBSVCBwcm9j
ZXNzIG9uIGEgYnVzeSBzeXN0ZW0/DQpUaGUgd29ya2VyIHRocmVhZHMgYXJlIHByZXR0eSBsb3cg
cHJpb3JpdHkuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

