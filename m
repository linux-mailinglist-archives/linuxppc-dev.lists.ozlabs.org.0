Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62C1AD488
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 04:33:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Ks03fMBzF0Ys
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 12:33:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=123.58.177.142; helo=m142-177.yeah.net;
 envelope-from=wenhu.wang@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from m142-177.yeah.net (m142-177.yeah.net [123.58.177.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493KqL0pYRzF0Pv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 12:31:54 +1000 (AEST)
Received: from vivo.com (localhost [127.0.0.1])
 by m142-177.yeah.net (Hmail) with ESMTP id 5284B6440B2;
 Fri, 17 Apr 2020 10:31:34 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ANcAoADRCKKtO5p9r33Ll4og.3.1587090694317.Hmail.wenhu.wang@vivo.com>
To: Rob Herring <robh@kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NCw0LzRdIGRyaXZlcnM6IHVpbzogbmV3IGRyaXZlciBmb3IgZnNsXzg1eHhfY2FjaGVfc3JhbQ==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.226
In-Reply-To: <20200416213535.GA2511@bogus>
MIME-Version: 1.0
Received: from wenhu.wang@vivo.com( [58.251.74.226) ] by ajax-webmail (
 [127.0.0.1] ) ; Fri, 17 Apr 2020 10:31:34 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Date: Fri, 17 Apr 2020 10:31:34 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VNS01CQkJDTE9KSk9CQllXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhMSUxLT0xMTUxNN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6NRg6FDo*KTgwMA80TgtCCUhINxdPFBxVSFVKTkNMS0JLTUJNT0tJVTMWGhIXVQweFRMOVQwa
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJTkpVTE9VSUlNWVdZCAFZQU5IS0w3Bg++
X-HM-Tid: 0a7185fa20c86473kurs5284b6440b2
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, kernel@vivo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pj4gT24gVGh1LCAyMDIwLTA0LTE2IGF0IDA4OjM1IC0wNzAwLCBXYW5nIFdlbmh1IHdyb3RlOgo+
PiA+ICsjZGVmaW5lIFVJT19JTkZPX1ZFUgkiZGV2aWNldHJlZSxwc2V1ZG8iCj4+IAo+PiBXaGF0
IGRvZXMgdGhpcyBtZWFuPyAgQ2hhbmdpbmcgYSBudW1iZXIgaW50byBhIG5vbi1vYnZpb3VzIHN0
cmluZyAoV2h5Cj4+ICJwc2V1ZG8iPyAgV2h5IGRvZXMgdGhlIFVJTyB1c2VyIGNhcmUgdGhhdCB0
aGUgY29uZmlnIGNhbWUgZnJvbSB0aGUgZGV2aWNlCj4+IHRyZWU/KSBqdXN0IHRvIGF2b2lkIHNl
dHRpbmcgb2ZmIEdyZWcncyB2ZXJzaW9uIG51bWJlciBhdXRvcmVzcG9uc2UgaXNuJ3QKPj4gcmVh
bGx5IGhlbHBpbmcgYW55dGhpbmcuCj4+IAo+PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCB1aW9fbXBjODV4eF9sMmN0bHJfb2ZfbWF0Y2hbXSA9IHsKPj4gPiArCXsJLmNvbXBh
dGlibGUgPSAidWlvLG1wYzg1eHgtY2FjaGUtc3JhbSIsCX0sCj4KPkZvcm0gaXMgPHZlbmRvcj4s
PGRldmljZT4gYW5kICJ1aW8iIGlzIG5vdCBhIHZlbmRvciAoYW5kIG5ldmVyIHdpbGwgYmUpLgo+
ClNob3VsZCBoYXZlIGJlZW4gc29tZXRoaW5nIGxpa2UgImZzbCxtcGM4NXh4LWNhY2hlLXNyYW0t
dWlvIiwgYW5kIGlmIGl0IGlzCnRvIGJlIGRlZmluZWQgd2l0aCBtb2R1bGUgcGFyYW1ldGVycywg
dGhpcyB3b3VsZCBiZSB1c2VyIGRlZmluZWQuCkFueXdheSwgPHZlbmRvcj4sPGRldmljZT4gc2hv
dWxkIGFsd2F5cyBiZSB1c2VkLgoKPj4gPiArCXt9LAo+PiA+ICt9Owo+PiA+ICsKPj4gPiArc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW0gPSB7Cj4+
ID4gKwkucHJvYmUgPSB1aW9fZnNsXzg1eHhfY2FjaGVfc3JhbV9wcm9iZSwKPj4gPiArCS5yZW1v
dmUgPSB1aW9fZnNsXzg1eHhfY2FjaGVfc3JhbV9yZW1vdmUsCj4+ID4gKwkuZHJpdmVyID0gewo+
PiA+ICsJCS5uYW1lID0gRFJJVkVSX05BTUUsCj4+ID4gKwkJLm93bmVyID0gVEhJU19NT0RVTEUs
Cj4+ID4gKwkJLm9mX21hdGNoX3RhYmxlCT0gdWlvX21wYzg1eHhfbDJjdGxyX29mX21hdGNoLAo+
PiA+ICsJfSwKPj4gPiArfTsKPj4gCj4+IEdyZWcncyBjb21tZW50IG5vdHdpdGhzdGFuZGluZywg
SSByZWFsbHkgZG9uJ3QgdGhpbmsgdGhpcyBiZWxvbmdzIGluIHRoZQo+PiBkZXZpY2UgdHJlZSAo
YW5kIGlmIEkgZG8gZ2V0IG92ZXJydWxlZCBvbiB0aGF0IHBvaW50LCBpdCBhdCBsZWFzdCBuZWVk
cyBhCj4+IGJpbmRpbmcgZG9jdW1lbnQpLiAgTGV0IG1lIHRyeSB0byBjb21lIHVwIHdpdGggYSBw
YXRjaCBmb3IgZHluYW1pYyBhbGxvY2F0aW9uLgo+Cj5BZ3JlZWQuICJVSU8iIGJpbmRpbmdzIGhh
dmUgbG9uZyBiZWVuIHJlamVjdGVkLgo+ClNvdW5kcyBpdCBpcy4gQW5kIGRvZXMgdGhlIG1vZGlm
aWNhdGlvbiBiZWxvdyBmaXQgd2VsbD8KLS0tCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCB1aW9fbXBjODV4eF9sMmN0bHJfb2ZfbWF0Y2hbXSA9IHsKLSAgICAgICB7ICAgICAgIC5j
b21wYXRpYmxlID0gInVpbyxtcGM4NXh4LWNhY2hlLXNyYW0iLCB9LAotICAgICAgIHt9LAorI2lm
ZGVmIENPTkZJR19PRgorc3RhdGljIHN0cnVjdCBvZl9kZXZpY2VfaWQgdWlvX2ZzbF84NXh4X2Nh
Y2hlX3NyYW1fb2ZfbWF0Y2hbXSA9IHsKKyAgICAgICB7IC8qIFRoaXMgaXMgZmlsbGVkIHdpdGgg
bW9kdWxlX3Bhcm0gKi8gfSwKKyAgICAgICB7IC8qIFNlbnRpbmVsICovIH0sCiB9OworTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwgdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW1fb2ZfbWF0Y2gpOworbW9k
dWxlX3BhcmFtX3N0cmluZyhvZl9pZCwgdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW1fb2ZfbWF0Y2hb
MF0uY29tcGF0aWJsZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1aW9fZnNs
Xzg1eHhfY2FjaGVfc3JhbV9vZl9tYXRjaFswXS5jb21wYXRpYmxlKSwgMCk7CitNT0RVTEVfUEFS
TV9ERVNDKG9mX2lkLCAicGxhdGZvcm0gZGV2aWNlIGlkIHRvIGJlIGhhbmRsZWQgYnkgY2FjaGUt
c3JhbS11aW8iKTsKKyNlbmRpZgogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB1aW9f
ZnNsXzg1eHhfY2FjaGVfc3JhbSA9IHsKICAgICAgICAucHJvYmUgPSB1aW9fZnNsXzg1eHhfY2Fj
aGVfc3JhbV9wcm9iZSwKICAgICAgICAucmVtb3ZlID0gdWlvX2ZzbF84NXh4X2NhY2hlX3NyYW1f
cmVtb3ZlLAogICAgICAgIC5kcml2ZXIgPSB7CiAgICAgICAgICAgICAgICAubmFtZSA9IERSSVZF
Ul9OQU1FLAotICAgICAgICAgICAgICAgLm93bmVyID0gVEhJU19NT0RVTEUsCi0gICAgICAgICAg
ICAgICAub2ZfbWF0Y2hfdGFibGUgPSB1aW9fbXBjODV4eF9sMmN0bHJfb2ZfbWF0Y2gsCisgICAg
ICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIodWlvX2ZzbF84NXh4X2Nh
Y2hlX3NyYW1fb2ZfbWF0Y2gpLAogICAgICAgIH0sCiB9OwoKUmVnYXJkcywKV2VuaHUNCg0K
