Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89A1C07EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 22:30:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cn7x311yzDrFd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cn5X17lZzDrBc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 06:28:32 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 95EB8128AE846;
 Thu, 30 Apr 2020 13:28:20 -0700 (PDT)
Date: Thu, 30 Apr 2020 13:28:19 -0700 (PDT)
Message-Id: <20200430.132819.1445821468387589728.davem@davemloft.net>
To: julietk@linux.vnet.ibm.com
Subject: Re: [PATCH net] ibmvnic: Skip fatal error reset after passive init
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200430182211.24211-1-julietk@linux.vnet.ibm.com>
References: <20200430182211.24211-1-julietk@linux.vnet.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 30 Apr 2020 13:28:20 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tlfalcon@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogSnVsaWV0IEtpbSA8anVsaWV0a0BsaW51eC52bmV0LmlibS5jb20+DQpEYXRlOiBUaHUs
IDMwIEFwciAyMDIwIDEzOjIyOjExIC0wNTAwDQoNCj4gRHVyaW5nIE1UVSBjaGFuZ2UsIHRoZSBm
b2xsb3dpbmcgZXZlbnRzIG1heSBoYXBwZW4uDQo+IENsaWVudC1kcml2ZW4gQ1JRIGluaXRpYWxp
emF0aW9uIGZhaWxzIGR1ZSB0byBwYXJ0bmVyonMgQ1JRIGNsb3NlZCwNCj4gY2F1c2luZyBjbGll
bnQgdG8gZW5xdWV1ZSBhIHJlc2V0IHRhc2sgZm9yIEZBVEFMX0VSUk9SLiBUaGVuIHBhc3NpdmUN
Cj4gKHNlcnZlci1kcml2ZW4pIENSUSBpbml0aWFsaXphdGlvbiBzdWNjZWVkcywgY2F1c2luZyBj
bGllbnQgdG8NCj4gcmVsZWFzZSBDUlEgYW5kIGVucXVldWUgYSByZXNldCB0YXNrIGZvciBmYWls
b3Zlci4gSWYgdGhlIHBhc3NpdmUNCj4gQ1JRIGluaXRpYWxpemF0aW9uIG9jY3VycyBiZWZvcmUg
dGhlIEZBVEFMIHJlc2V0IHRhc2sgaXMgcHJvY2Vzc2VkLA0KPiB0aGUgRkFUQUwgZXJyb3IgcmVz
ZXQgdGFzayB3b3VsZCB0cnkgdG8gYWNjZXNzIGEgQ1JRIG1lc3NhZ2UgcXVldWUNCj4gdGhhdCB3
YXMgZnJlZWQsIGNhdXNpbmcgYW4gb29wcy4gVGhlIHByb2JsZW0gbWF5IGJlIG1vc3QgbGlrZWx5
IHRvDQo+IG9jY3VyIGR1cmluZyBETFBBUiBhZGQgdk5JQyB3aXRoIGEgbm9uLWRlZmF1bHQgTVRV
LCBiZWNhdXNlIHRoZSBETFBBUg0KPiBwcm9jZXNzIHdpbGwgYXV0b21hdGljYWxseSBpc3N1ZSBh
IGNoYW5nZSBNVFUgcmVxdWVzdC4NCj4gDQo+IEZpeCB0aGlzIGJ5IG5vdCBwcm9jZXNzaW5nIGZh
dGFsIGVycm9yIHJlc2V0IGlmIENSUSBpcyBwYXNzaXZlbHkNCj4gaW5pdGlhbGl6ZWQgYWZ0ZXIg
Y2xpZW50LWRyaXZlbiBDUlEgaW5pdGlhbGl6YXRpb24gZmFpbHMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZXQgS2ltIDxqdWxpZXRrQGxpbnV4LnZuZXQuaWJtLmNvbT4NCg0KQXBwbGllZCwg
dGhhbmtzLg0K
