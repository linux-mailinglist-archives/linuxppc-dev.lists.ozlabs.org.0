Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 040417A94A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 15:23:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrx0f6NtKz3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 23:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrx021XXmz3c40
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 23:22:25 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-275-3ANp1ejCPpKMCXrfXPnzNA-1; Thu, 21 Sep 2023 14:20:59 +0100
X-MC-Unique: 3ANp1ejCPpKMCXrfXPnzNA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 21 Sep
 2023 14:20:58 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 21 Sep 2023 14:20:58 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Shuai Xue' <xueshuai@linux.alibaba.com>, Bjorn Helgaas
	<helgaas@kernel.org>
Subject: RE: Questions: Should kernel panic when PCIe fatal error occurs?
Thread-Topic: Questions: Should kernel panic when PCIe fatal error occurs?
Thread-Index: AQHZ7ISwt0MI+BDoAEe5dUPUvfmXNrAlQDAw
Date: Thu, 21 Sep 2023 13:20:58 +0000
Message-ID: <2e5870e416f84e8fad8340061ec303e2@AcuMS.aculab.com>
References: <20230920230257.GA280837@bhelgaas>
 <d84b6d17-7fe9-222a-c874-798af4d9faea@linux.alibaba.com>
In-Reply-To: <d84b6d17-7fe9-222a-c874-798af4d9faea@linux.alibaba.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Linux PCI <linux-pci@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Li4uDQpJJ3ZlIGdvdCBhIHRhcmdldCB0byBnZW5lcmF0ZSBBRVIgZXJyb3JzIGJ5IGdlbmVyYXRp
bmcgcmVhZCBjeWNsZXMNCnRoYXQgYXJlIGluc2lkZSB0aGUgYWRkcmVzcyByYW5nZSB0aGF0IHRo
ZSBicmlkZ2UgZm9yd2FyZHMgYnV0DQpvdXRzaWRlIG9mIGFueSBCQVIgYmVjYXVzZSB0aGVyZSBh
cmUgMiBkaWZmZXJlbnQgc2l6ZWQgQkFScy4NCihQcmV0dHkgZWFzeSB0byBzZXR1cC4pDQpPbiB0
aGUgc3lzdGVtIEkgd2FzIHVzaW5nIHRoZXkgZGlkbid0IGdldCBwcm9wYWdhdGVkIGFsbCB0aGUg
d2F5DQp0byB0aGUgcm9vdCBicmlkZ2UgLSBidXQgd2VyZSB2aXNpYmxlIGluIHRoZSBsb3dlciBi
cmlkZ2UuDQpJdCB3b3VsZCBiZSBuaWNlIGZvciBhIGRyaXZlciB0byBiZSBhYmxlIHRvIGRldGVj
dC9jbGVhciBzdWNoDQphIGZsYWcgaWYgaXQgZ2V0cyBhbiB1bmV4cGVjdGVkIH4wdSByZWFkIHZh
bHVlLg0KKEknbSBub3Qgc3VyZSBhbiBlcnJvciBjYWxsYmFjayBoZWxwcy4pDQoNCk9UT0ggYSAn
bmVicyBjb21wbGlhbnQnIHNlcnZlciByb3V0ZWQgYW55IGtpbmQgb2YgUENJZSBsaW5rIGVycm9y
DQp0aHJvdWdoIHRvIHNvbWUgJ3N5c3RlbSBtYW5hZ2VtZW50JyBsb2dpYyB0aGF0IHRoZW4gcmFp
c2VkIGFuIE5NSS4NCkknbSBub3Qgc3VyZSB3aG8gdGhvdWdodCBhbiBOTUkgd2FzIGEgZ29vZCBp
ZGVhIC0gdGhleSBhcmUgcHJldHR5DQppbXBvc3NpYmxlIHRvIGhhbmRsZSBpbiB0aGUga2VybmVs
IGFuZCB0b28gbGF0ZSB0byBiZSBvZiB1c2UgdG8NCnRoZSBjb2RlIHBlcmZvcm1pbmcgdGhlIGFj
Y2Vzcy4NCg0KSW4gYW55IGNhc2Ugd2Ugd2VyZSBnZXR0aW5nIG9uZSBhZnRlciAnZWNobyAxID54
eHgvcmVtb3ZlJyBhbmQNCnRoZW4gdGFraW5nIHRoZSBQQ0llIGxpbmsgZG93biBieSByZXByb2dy
YW1taW5nIHRoZSBmcGdhLg0KU28gdGhlIGxpbmsgZ29pbmcgZG93biB3YXMgZW50aXJlbHkgZXhw
ZWN0ZWQsIGJ1dCB0aGVyZSBzZWVtZWQNCnRvIGJlIG5vdGhpbmcgd2UgY291bGQgZG8gdG8gc3Rv
cCB0aGUga2VybmVsIGNyYXNoaW5nLg0KDQpJJ20gc3VyZSAnbmVicyBjb21wbGlhbnQnIG91Z2h0
IHRvIGNvbnRhaW4gc29tZSByZXF1aXJlbWVudHMgZm9yDQpyZXNpbGllbmNlIHRvIGhhcmR3YXJl
IGZhaWx1cmVzIQ0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBC
cmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdp
c3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

