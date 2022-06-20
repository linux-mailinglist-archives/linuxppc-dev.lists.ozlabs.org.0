Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC3F5518E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 14:31:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRTXf0sjlz3cD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 22:31:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=SjUFNX35;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.50; helo=m1550.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=SjUFNX35;
	dkim-atps=neutral
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRTWt5bSXz2xD4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 22:30:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=W2zaJ
	ZZZmWCsovcjbBPv8wVDU6mq90VO6c2xwP7F890=; b=SjUFNX350XJ3COY/c9/Bj
	hpKd42XenFerfK5w8IUsuUbILIjb/KvkbgQHQJ9gdq+I0qL7JjQn10Y6R6Rm0Qpq
	TqZeaw1CcoIvOHWv8mCBS18/cu4Ow4dTyEvAd65LHPDB9ETOJMZbgv74P0jrN5x/
	AJtiFY035orupok84a+dGY=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Mon, 20 Jun 2022 20:27:05 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Mon, 20 Jun 2022 20:27:05 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
Subject: Re:Re: [PATCH] powerpc: kernel: Change the order of of_node_put()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <1f3cdf9c-7437-65e7-c226-c53e17a722b7@csgroup.eu>
References: <20220617112636.4041671-1-windhl@126.com>
 <a6a5e5b3-ffd1-904b-bba1-22baff5f7b67@csgroup.eu>
 <61c85548.1a55.18175d69e21.Coremail.windhl@126.com>
 <c9785db9-b74d-540e-9c83-4db7bee10303@csgroup.eu>
 <30af2253.74d8.181806c9337.Coremail.windhl@126.com>
 <1f3cdf9c-7437-65e7-c226-c53e17a722b7@csgroup.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <16a2a6b2.8542.1818114aeea.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowABXrPCaZ7Bi8RE6AA--.41388W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hkmF1uwMPrXgQABsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gpiccoli@igalia.com" <gpiccoli@igalia.com>, "paulus@samba.org" <paulus@samba.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CgoKQXQgMjAyMi0wNi0yMCAxOToxMTozMywgIkNocmlzdG9waGUgTGVyb3kiIDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+SGksCj4KPkxlIDIwLzA2LzIwMjIgw6AgMTE6MjMs
IExpYW5nIEhlIGEgw6ljcml0wqA6Cj4+IAo+PiBIaSwgQ2hyaXN0b3BoZS4KPj4gCj4+IFNvcnJ5
IHRvIHRyb2J1bGUgeW91IGFnYWluLgo+PiAKPj4gTm93IEkgaGF2ZSBmb3VuZCBvdGhlciBidWdz
IGluIHNhbWUgZGlyZWN0b3JpZXMgKGkuZS4sIGFyY2gvcG93ZXJwYy9zeXNkZXYpLAo+PiB3aXRo
IHRoZSBvbmVzIEkgaGF2ZSBzZW50IGJ1dCBub3QgcmVjaWV2ZWQgYWNrZWQtYnkgb3IgY29uZmly
bWVkIGVtYWlsLgo+PiAKPj4gU28gSSBuZWVkIHRvIG1lcmdlIHRoZSBvbGQgb25lcyBpbnRvIHRo
ZSBuZXcgb25lcyBhcyBhIFBBVENILXYyIGFuZCB0aGVuIHJlc2VuZCB0aGUKPj4gb2xkIG9uZXMg
Pwo+PiBvciBqdXN0IHVzZSBhIG5ldyBQQVRDSCB0byBzZW5kIG9ubHkgbmV3IG9uZXM/Cj4+IAo+
PiBJIGFtIGFmcmFpZCB0byBtYWtlIG5ldyB0cm91YmxlIGZvciBtYWludGFpbmVycywgc28gY2Fu
IHlvdSBzaGFyZSB5b3VyIHZhbHVhYmxlCj4+IGV4cGVyaWVuY2U/Cj4+IAo+Cj5IZXJlIGlzIHRo
ZSBsaXN0IG9mIHlvdXIgcGF0Y2hlcyA6IAo+aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2xpbnV4cHBjLWRldi9saXN0Lz9zdWJtaXR0ZXI9ODQyNTgKPgo+IEZyb20gbXkgcG9p
bnQgb2YgdmlldywgZm9yIGFsbCB0aGUgcGF0Y2hlcyB0aGF0IGFyZSBzdGlsbCBpbiBzdGF0dXMg
Cj4ibmV3IiBpdCBpcyBiZXR0ZXIgdGhhbiB5b3Ugc2VuZCBhIHYyIHdpdGggbW9yZSB0aGluZ3Mg
aW50byBhIHNpbmdsZSAKPnBhdGNoLiBXaGVuIHRoZSBwYXRjaCBpcyBpbiAidW5kZXIgcmV2aWV3
IiBzdGF0ZSwgaXQgaXMgYmV0dGVyIHRvIG5vdCAKPnVwZGF0ZSBpdCBhbnltb3JlLgo+Cj5TbyBp
biB0aGUgbGlzdCB0aGVyZSBhcmUgZm9yIGluc3RhbmNlIHNldmVyYWwgcGF0Y2hlcyBmb3IgcG93
ZXJudiwgc28gaXQgCj53b3VsZCBiZSBnb29kIGlmIHlvdSBjYW4gcmVncm91cCBhbGwgb2YgdGhl
bSBpbiBhIHNpbmdsZSB2MiBwYXRjaC4KPgo+Q2hyaXN0b3BoZQoKVGhhbmtzLCBDaHJpc3RvcGhl
LgoKSSB3aWxsIGZvbGxvdyB5b3VyIHJ1bGVzIGFuZCB0cnkgdG8gZ3JvdXAgdGhlICduZXcnIHN0
YXRlIG9uZXMu
