Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02A1B2394
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 12:05:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495zhg5GcfzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 20:05:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=115.236.127.107;
 helo=mail-m127107.qiye.163.com; envelope-from=wenhu.wang@vivo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivo.com
Received: from mail-m127107.qiye.163.com (mail-m127107.qiye.163.com
 [115.236.127.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495zg00VSfzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 20:03:53 +1000 (AEST)
Received: from vivo.com (wm-12.qy.internal [127.0.0.1])
 by mail-m127107.qiye.163.com (Hmail) with ESMTP id 54E4F82460;
 Tue, 21 Apr 2020 18:03:43 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AHEAGAB5CMixysy1ydkfyaqy.3.1587463423329.Hmail.wenhu.wang@vivo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MixSRVNFTkRdIG1pc2M6IG5ldyBkcml2ZXIgc3JhbV91YXBpIGZvciB1c2VyIGxldmVsIFNSQU0gYWNjZXNz?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.227
In-Reply-To: <20200421093427.GC725219@kroah.com>
MIME-Version: 1.0
Received: from wenhu.wang@vivo.com( [58.251.74.227) ] by ajax-webmail (
 [127.0.0.1] ) ; Tue, 21 Apr 2020 18:03:43 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>
Date: Tue, 21 Apr 2020 18:03:43 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUlXWQgYFAkeWUFZTVVITkxCQkJISU9MQkNOQ1lXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhMSE9JSk9ISkJIN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Mz46PDo5Tjg2EgMCCAJKAh8QHQIaCgJVSFVKTkNMT01IT0lDT0pKVTMWGhIXVQweFRMOVQwa
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJTkpVTE9VSUlMWVdZCAFZQUhCTkw3Bg++
X-HM-Tid: 0a719c31857c986bkuuu54e4f82460
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
Cc: robh@kernel.org, arnd@arndb.de, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, kernel@vivo.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pk9uIFR1ZSwgQXByIDIxLCAyMDIwIGF0IDA1OjA5OjQ3UE0gKzA4MDAsIOeOi+aWh+iZjiB3cm90
ZToKPj4gSGksIEdyZWcsIEFybmQsCj4+IAo+PiBUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMg
Zmlyc3QsIGFuZCB0aGVuIHJlYWxseSB2ZXJ5IHZlcnkgdmVyeSBzb3JyeQo+PiBmb3IgZHJpdmlu
ZyBHcmVnIHRvIHNpZ2ggYW5kIEkgaG9wZSB0aGVyZSB3b3VsZCBiZSBjaGFuY2UgdG8gc2hhcmUg
TW91dGFpCj4+IChyYXRoZXIgdGhhbiB3aGlza3ksIHdlIGRyaW5rIGl0IG11Y2gsIGEga2luZCBv
ZiBCYWlqaXUpLCBhZnRlciB0aGUgdmlydXMuCj4+IAo+PiBCYWNrIHRvIHRoZSBjb21tZW50cywg
SSdkIGxpa2UgdG8gZG8gYSBiaXQgb2YgZG9jdW1lbnRhdGlvbiBvciBleHBsYW5hdGlvbiBmaXJz
dCwKPj4gd2hpY2ggc2hvdWxkIGhhdmUgYmVlbiBkb25lIGVhcmx5IG9yIGVsc2UgdGhlcmUgd291
bGQgbm90IGJlIHNvIG11Y2ggdG8gZXhwbGFpbjoKPj4gMS4gV2hhdCBJIGhhdmUgYmVlbiB0cnlp
bmcgdG8gZG8gaXMgdG8gYWNjZXNzIHRoZSBGcmVlc2NhbGUgQ2FjaGUtU1JBTSBkZXZpY2UgZm9y
bQo+PiB1c2VyIGxldmVsOwo+PiAyLiBJIGltcGxlbWVudGVkIGl0IHVzaW5nIFVJTywgd2hpY2gg
d2FzIHRob3VnaHQgb2Ygbm9uLXByb3BlcjsKPgo+SSBzdGlsbCB0aGluayB0aGF0IHVzaW5nIHVp
byBpcyB0aGUgYmVzdCB3YXkgdG8gZG8gdGhpcywgYW5kIG5ldmVyIHNhaWQKPml0IHdhcyAibm9u
LXByb3BlciIuICBBbGwgd2UgZ290IGJvZ2dlZCBkb3duIGluIHdhcyB0aGUgRFQKPnJlcHJlc2Vu
dGF0aW9uIG9mIHN0dWZmIGZyb20gd2hhdCBJIHJlbWVtYmVyLiAgVGhhdCBzaG91bGQgYmUgd29y
a2VkCj50aHJvdWdoLgo+Cj50aGFua3MsCj4KPmdyZWcgay1oCgpTdXJlbHksIGJ1dCBzbyBob3cg
d291bGQgdGhpbmdzIGdvPyBTY290dCBzYWlkIG5vdCBmaXQgZm9yIGhpbS4gQW5kIGhlIHdhcwpn
b25uYSB0byB3cml0ZSBhIG5ldyBwYXRjaChPaCwgIHRoYXQgaXMgd2hhdCBJIGhhdmUgYmVlbiBk
b2luZy4uLi4uLGFuZCBJIHJlYWxseQpkb25vdCB0aGluayBoZSBuZWVkIHRvIGRvIGl0KQoKVGhp
cyBpcyB0aGUgZmluYWwgdmVyc2lvbiB1c2luZyBVSU8sIGFuZCBldmVuIENocmlzdG9waGUgaGFk
IFJldmlld2VkLWJ5LApodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTIy
NjIyNS8KCklmIG5vIGVuZGluZyByZWFjaGVzLCBJIGhhdmUgdG8gbWFrZSBhIHN0ZXAgZm9yd2Fy
ZCB0byBrZWVwIHdvcmtpbmcgd2l0aAp0aGUgbWlzYyBkZXZpY2UgdmVyc2lvbi4KClRoYW5rcywg
YW5kIHJlZ2FyZHMsCldlbmh1Cg0KDQo=
