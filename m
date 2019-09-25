Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94729BDD5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:45:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dbpx6rC1zDqY3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 21:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dbkx4jvrzDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 21:42:13 +1000 (AEST)
Received: from localhost (unknown [65.39.69.237])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 3227F154EC893;
 Wed, 25 Sep 2019 04:42:01 -0700 (PDT)
Date: Wed, 25 Sep 2019 13:41:59 +0200 (CEST)
Message-Id: <20190925.134159.1914660952439794832.davem@davemloft.net>
To: julietk@linux.vnet.ibm.com
Subject: Re: [PATCH v4 0/2] net/ibmvnic: serialization fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190920201123.18913-1-julietk@linux.vnet.ibm.com>
References: <20190920201123.18913-1-julietk@linux.vnet.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-7
Content-Transfer-Encoding: base64
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 25 Sep 2019 04:42:02 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, tlfalcon@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogSnVsaWV0IEtpbSA8anVsaWV0a0BsaW51eC52bmV0LmlibS5jb20+DQpEYXRlOiBGcmks
IDIwIFNlcCAyMDE5IDE2OjExOjIxIC0wNDAwDQoNCj4gVGhpcyBzZXJpZXMgaW5jbHVkZXMgdHdv
IGZpeGVzLiBUaGUgZmlyc3QgaW1wcm92ZXMgcmVzZXQgY29kZSB0byBhbGxvdyANCj4gbGlua3dh
dGNoX2V2ZW50IHRvIHByb2NlZWQgZHVyaW5nIHJlc2V0LiBUaGUgc2Vjb25kIGVuc3VyZXMgdGhh
dCBubyBtb3JlDQo+IHRoYW4gb25lIHRocmVhZCBydW5zIGluIHJlc2V0IGF0IGEgdGltZS4gDQo+
IA0KPiB2MjoNCj4gLSBTZXBhcmF0ZSBjaGFuZ2UgcGFyYW0gcmVzZXQgZnJvbSBkb19yZXNldCgp
DQo+IC0gUmV0dXJuIElCTVZOSUNfT1BFTl9GQUlMRUQgaWYgX19pYm12bmljX29wZW4gZmFpbHMN
Cj4gLSBSZW1vdmUgc2V0dGluZyB3YWl0X2Zvcl9yZXNldCB0byBmYWxzZSBmcm9tIF9faWJtdm5p
Y19yZXNldCgpLCB0aGlzDQo+ICAgaXMgZG9uZSBpbiB3YWl0X2Zvcl9yZXNldCgpDQo+IC0gTW92
ZSB0aGUgY2hlY2sgZm9yIGZvcmNlX3Jlc2V0X3JlY292ZXJ5IGZyb20gcGF0Y2ggMSB0byBwYXRj
aCAyDQo+IA0KPiB2MzoNCj4gLSBSZXN0b3JlIHJlc2V0onMgc3VjY2Vzc2Z1bCByZXR1cm4gaW4g
b3BlbiBmYWlsdXJlIGNhc2UNCj4gDQo+IHY0Og0KPiAtIENoYW5nZSByZXNldHRpbmcgZmxhZyBh
Y2Nlc3MgdG8gYXRvbWljDQoNClNlcmllcyBhcHBsaWVkLCB0aGFuayB5b3UuDQo=
