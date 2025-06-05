Return-Path: <linuxppc-dev+bounces-9169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D9ACEF32
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 14:28:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCkHf5QYPz2ySg;
	Thu,  5 Jun 2025 22:27:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749124529;
	cv=none; b=P+cCAkLiI7nBYD02pnrhgfmAAHO0tWbdS3Dyow4iWKpJvosVk8DvqinheqQMXE+0haq5fC0QXrGzqW9oJ/Kd+bncrjsBaXrfsLdas6xVSU6L+C1e5qdXPTiUvshrDegGUpuzIj9oWiEarmCyE8wh9fNrK/B9SWDcarlLSQmFaMrxcYzMFJL2aHDaj6OR5feI2kz8AXvgnTF+pcylvxXLTKRW6Ei+w4LhfW/40E7/HpCDxlKFI/gUeJsqEiiFB0WTN8KX2BdYsqut/K6Kxtiqryx9RccDiu+VZZiiszNls2c/3jylDR3j87at3VjK4LbISbOhgeRb5dbk06KQgwv8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749124529; c=relaxed/relaxed;
	bh=rXlgnrnD2yeES9tC2kP2vDA8Z0bsnayASllAK5ZGhkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=KxwQN1pWEFVyldzfowSA2HmIP/bnxCBGISPUYxufTVGEbFsWoCQWrPPwjeGdMLC+PccYcZdPmncAL6uljcyg+dliTlS2S9fPVC/10lZckxOYaFSsTPsQy3G7YM2BPjrUDgXLkvGHU9g7H9ZNlvPF1oA9zZsLdnh5JIIeTcUHpbIetgkQ8tz0WfPHuruPLTmcizh+brsqTX2RkOQvdpd9oS72qZ1PW88WmJjoYTDGG6AN+zxZFQHVrqAml3JKavA3tbhiQirh/0uQKVy3ncIT3XA2cmK88Fxb6SIKaLLqopATyhz/OtFd3XyrYARbkghp7z6v/ZLIX6LeYZi/AVFTGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn; spf=pass (client-ip=159.226.251.87; helo=cstnet.cn; envelope-from=chenglingfei22s@ict.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=ict.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ict.ac.cn (client-ip=159.226.251.87; helo=cstnet.cn; envelope-from=chenglingfei22s@ict.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp87.cstnet.cn [159.226.251.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCjZ64kxjz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 21:55:25 +1000 (AEST)
Received: from chenglingfei22s$ict.ac.cn ( [115.42.62.11] ) by
 ajax-webmail-APP-17 (Coremail) ; Thu, 5 Jun 2025 19:55:00 +0800 (GMT+08:00)
X-Originating-IP: [115.42.62.11]
Date: Thu, 5 Jun 2025 19:55:00 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: chenglingfei <chenglingfei22s@ict.ac.cn>
To: "Sven Peter" <sven@kernel.org>
Cc: j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev, 
	zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on
 Apple M1.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
In-Reply-To: <dafd58ae-0a08-4fe6-b94d-c8c6c8c1fa97@kernel.org>
References: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
 <dafd58ae-0a08-4fe6-b94d-c8c6c8c1fa97@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
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
Precedence: list
MIME-Version: 1.0
Message-ID: <4cfe2276.2c0da.1973ff1cc40.Coremail.chenglingfei22s@ict.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:qgCowAAn2AGUhUFonO0EAA--.19078W
X-CM-SenderInfo: xfkh0wpolqwwthlsj2g6lf3hldfou0/1tbiBgoEDmhBUZjeHwAAsn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.6 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [159.226.251.87 listed in list.dnswl.org]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [115.42.62.11 listed in zen.spamhaus.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 SPF_PASS SPF: sender matches SPF record
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

CgoKJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCiZndDsg5Y+R5Lu25Lq6OiAiU3ZlbiBQZXRl
ciIgPHN2ZW5Aa2VybmVsLm9yZz4KJmd0OyDlj5HpgIHml7bpl7Q6IDIwMjUtMDYtMDUgMTg6MjU6
MDkgKOaYn+acn+WbmykKJmd0OyDmlLbku7bkuro6IOeoi+WHjOmjniA8Y2hlbmdsaW5nZmVpMjJz
QGljdC5hYy5jbj4sIGpAamFubmF1Lm5ldCwgYWx5c3NhQHJvc2VuendlaWcuaW8sIG5lYWxAZ29t
cGEuZGV2CiZndDsg5oqE6YCBOiB6aGFuZ3poZW53ZWkyMmJAaWN0LmFjLmNuLCB3YW5nemhlMTJA
aWN0LmFjLmNuLCBtYWRkeUBsaW51eC5pYm0uY29tLCBtcGVAZWxsZXJtYW4uaWQuYXUsIG5waWdn
aW5AZ21haWwuY29tLCBjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUsIG5hdmVlbkBrZXJuZWwu
b3JnLCBhbmRpLnNoeXRpQGtlcm5lbC5vcmcsIGFzYWhpQGxpc3RzLmxpbnV4LmRldiwgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZywgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwomZ3Q7IOS4u+mimDogUmU6IFtCVUddIHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gY2F1
c2luZyBrZXJuZWwgY3Jhc2ggb24gQXBwbGUgTTEuCiZndDsgCiZndDsgSGksCiZndDsgCiZndDsg
T24gMDUuMDYuMjUgMDU6MDIsIOeoi+WHjOmjniB3cm90ZToKJmd0OyAmZ3Q7IEhpLCBhbGwhCiZn
dDsgJmd0OyAKJmd0OyAmZ3Q7IFdl4oCZdmUgZW5jb3VudGVyZWQgYSBrZXJuZWwgY3Jhc2ggd2hl
biBydW5uaW5nIHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gb24gYSBNYWMgTWluaSBNMSAoVDgx
MDMpIHJ1bm5pbmcgQXNhaGkgQXJjaCBMaW51eC4KJmd0OyAmZ3Q7IAomZ3Q7ICZndDsgVGhlIGJ1
ZyB3YXMgZmlyc3QgZm91bmQgb24gdGhlIExpbnV4IHY2LjYsIHdoaWNoIGlzIGJ1aWx0IG1hbnVh
bGx5IHdpdGggdGhlIEFzYWhpIGdpdmVuIGNvbmZpZyB0byBydW4gb3VyIHNlcnZpY2VzLgomZ3Q7
ICZndDsgQXQgdGhhdCB0aW1lLCB0aGUgaTJjLXBhc2VtaS1wbGF0Zm9ybSB3YXMgaTJjLWFwcGxl
LgomZ3Q7ICZndDsgCiZndDsgJmd0OyBXZSBub3RpY2VkIGluIHRoZSBMaW51eCB2Ni43LCB0aGUg
cGFzZW1pIGlzIHNwbGl0dGVkIGludG8gdHdvIHNlcGFyYXRlIG1vZHVsZXMsIG9uZSBvZiB3aGlj
aCBpcyBpMmMtcGFzZW1pLXBsYXRmb3JtLgomZ3Q7ICZndDsgVGhlcmVmb3JlLCB3ZSBidWlsdCBM
aW51eCB2Ni4xNC42IGFuZCB0cmllZCB0byBybW1vZCBpMmMtcGFzZW1pLXBsYXRmb3JtIGFnYWlu
LCB0aGUgY3Jhc2ggc3RpbGwgZXhpc3RzLiBNb3Jlb3Zlciwgd2UgZmV0Y2hlZAomZ3Q7ICZndDsg
dGhlIGxhdGVzdCBpMmMtcGFzZW1pLXBsYXRmb3JtIG9uIGxpbnV4LW5leHQoOTExNDgzYjI1NjEy
YzhiYzMyYTcwNmJhOTQwNzM4Y2M0MzI5OTQ5NikgYW5kIGFzYWhpLCBidWlsdCB0aGVtIGFuZAom
Z3Q7ICZndDsgdGVzdGVkIGFnYWluIHdpdGggTGludXggdjYuMTQuNiwgYnV0IHRoZSBjcmFzaCBy
ZW1haW5zLgomZ3Q7ICZndDsgCiZndDsgJmd0OyBCZWNhdXNlIGtleGVjIGlzIG5vdCBzdXBwb3J0
ZWQgYW5kIHdpbGwgbmV2ZXIgYmUgZnVsbHkgc3VwcG9ydGVkIG9uIEFwcGxlIFNpbGljb24gcGxh
dGZvcm1zIGR1ZSB0byBoYXJkd2FyZSBhbmQgZmlybXdhcmUKJmd0OyAmZ3Q7IGRlc2lnbiBjb25z
dHJhaW50cywgd2UgY2FuIG5vdCByZWNvcmQgdGhlIHBhbmljIGxvZ3MgdGhyb3VnaCBrZHVtcC4K
Jmd0OyAKJmd0OyBEbyB5b3UgaGF2ZSBVQVJUIGNvbm5lY3RlZCB0byBhIGRldmljZSB1bmRlciB0
ZXN0IHdoaWNoIHlvdSBjb3VsZCB1c2UgdG8gCiZndDsgZ3JhYiB0aGUgcGFuaWMgbG9nIGZyb20g
dGhlIGtlcm5lbD8gQWx0ZXJuYXRpdmVseSB5b3UgY2FuIGFsc28gcnVuIHRoZSAKJmd0OyBrZXJu
ZWwgdW5kZXIgbTFuMSdzIGh5cGVydmlzb3IgYW5kIGdyYWIgdGhlIGxvZyB0aGF0IHdheS4gSXQn
bGwgZW11bGF0ZSAKJmd0OyB0aGUgc2VyaWFsIHBvcnQgYW5kIHJlZGlyZWN0IGl0cyBvdXRwdXQg
dmlhIFVTQi4KJmd0OyAKCkkgZG9uJ3QgaGF2ZSBVQVJULCBidXQgSSBoYXZlIHRyaWVkIHRvIHJ1
biB0aGUga2VybmVsIHVuZGVyIG0xbjEncyBoeXBlcnZpc29yLiBIb3dldmVyLCBpdCBkb2VzIG5v
dCB0cmlnZ2VyIHRoZSByZWxlYXNlIG9mIGNzNDJsODMuIApHaXZlbiB0aGF0IG0xbjEgcHJvdmlk
ZXMgZnVsbCBwZXJpcGhlcmFsIGRldmljZSBlbXVsYXRpb24gY2FwYWJpbGl0eSwgdGhlIG1vc3Qg
cGxhdXNpYmxlIGV4cGxhbmF0aW9uIHdvdWxkIGJlIGFuIGluY29ycmVjdCAKZmlybXdhcmUgbG9h
ZGluZyBzZXF1ZW5jZS4gQnV0IHRoZSBkb2N1bWVudGF0aW9uIG9mIEFzYWhpIHByb3ZpZGVzIGxp
dHRsZSBkZXRhaWxzIGFib3V0IGhvdyB0byBnZW5lcmF0ZSBhbiBpbml0cmFtZnMgd2l0aCAKZmly
bXdhcmUgKEkgdGhpbmspLCBjYW4geW91IGdpdmUgbW9yZSBndWlkYW5jZSBhYm91dCBpdD8KCiZn
dDsgJmd0OyAKJmd0OyAmZ3Q7IFRodXMgd2UgdHJpZWQgdG8gZmluZCB0aGUgcm9vdCBjYXVzZSBv
ZiB0aGUgaXNzdWUgbWFudWFsbHkuIFdoZW4gd2UgcGVyZm9ybSBybW1vZCwgdGhlIGtlcm5lbCBw
ZXJmb3JtcyBkZXZpY2UgcmVsZWFzaW5nIG9uCiZndDsgJmd0OyB0aGUgaTJjIGJ1cywgdGhlbiBj
YWxscyB0aGUgcmVtb3ZlIGZ1bmN0aW9uIGluIHNuZC1zb2MtY3M0Mmw4My1pMmMsIHdoaWNoIGNh
bGxzIHRoZSBjczQybDQyX2NvbW1vbl9yZW1vdmUgaW4gY3M0Mmw0MiwKJmd0OyAmZ3Q7IGJlY2F1
c2UgY3M0Mmw0Mi0mZ3Q7aW5pdF9kb25lIGlzIHRydWUsIGl0IHBlcmZvcm1zIHJlZ21hcF93cml0
ZSwgYW5kIGZpbmFsbHkgY2FsbHMgaW50byBwYXNlbWlfc21iX3dhaXRyZWFkeSBpbiBpMmMtcGFz
ZW1pCiZndDsgJmd0OyAtY29yZS5jLiBXZSBub3RpY2VkIHRoYXQgc21idXMtJmd0O3VzZV9pcnEg
aXMgdHJ1ZSwgYW5kIGFmdGVyIGl0IGNhbGxzIGludG8gd2FpdF9mb3JfY29tcGxldGlvbl90aW1l
b3V0LCB0aGUgc3lzdGVtIGNyYXNocyEmZ3Q7CiZndDsgJmd0OyBXZSBmb3VuZCB0aGF0IHdhaXRf
Zm9yX2NvbXBsZXRpb25fdGltZW91dCBpcyBvbmUgb2YgdGhlIGNvcmUgc2NoZWR1bGVyIEFQSXMg
dXNlZCBieSB0ZW5zIG9mIHRob3VzYW5kcyBvZiBvdGhlciBkcml2ZXJzLAomZ3Q7ICZndDsgaXQg
aXMgdW5saWtlbHkgY2F1c2luZyB0aGUgY3Jhc2guIFNvIHdlIHRyaWVkIHRvIHJlbW92ZSB0aGUg
Y2FsbCB0byB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQsIHRoZW4gdGhlIHN5c3RlbSBzZWVt
cyB0bwomZ3Q7ICZndDsgcnVuIHdlbGwuCiZndDsgJmd0OyAKJmd0OyAmZ3Q7IEhvd2V2ZXIsIGJl
Y2F1c2Ugd2UgaGF2ZSBsaXR0bGUga25vd2xlZGdlIGFib3V0IGkyYyBkZXZpY2VzIGFuZCBzcGVj
aWZpY2F0aW9ucywgd2UgYXJlIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBjaGFuZ2Ugd2lsbAomZ3Q7
ICZndDsgY2F1c2Ugb3RoZXIgcG90ZW50aWFsIGhhcm1zIGZvciB0aGUgc3lzdGVtIGFuZCBkZXZp
Y2UuIElzIHRoaXMgY2FsbCB0byB3YWl0IG5lY2VzYXJ5IGhlcmU/IE9yIGNhbiB5b3UgZ2l2ZSBh
IG1vcmUKJmd0OyAmZ3Q7IHNvcGhpc3RpY2F0ZWQgZml4PwomZ3Q7IAomZ3Q7IFllcywgdGhhdCBj
YWxsIGlzIG5lY2Vzc2FyeS4gSXQgd2FpdHMgZm9yIHRoZSAidHJhbnNmZXIgY29tcGxldGVkIiAK
Jmd0OyBpbnRlcnJ1cHQgZnJvbSB0aGUgaGFyZHdhcmUuIFdpdGhvdXQgaXQgdGhlIGRyaXZlciB3
aWxsIHRyeSB0byByZWFkIGRhdGEgCiZndDsgYmVmb3JlIGl0J3MgYXZhaWxhYmxlIGFuZCB5b3Un
bGwgc2VlIGNvcnJ1cHRpb24uIEknbSBzdXJwcmlzZWQgaGFyZHdhcmUgCiZndDsgYXR0YWNoZWQg
dG8gaTJjICh1c2IgcGQgY29udHJvbGxlciBhbmQgYXVkaW8gSSB0aGluaykgd29ya3MgYXQgYWxs
IHdpdGggCiZndDsgdGhhdCBjaGFuZ2UuCiZndDsgCiZndDsgCiZndDsgU3ZlbgoKQXJlIHRoZXJl
IGFueSBtZXRob2RzIG9yIHRvb2xzIHRvIHN5c3RlbWF0aWNhbGx5IHZlcmlmeSBpdHMgZnVuY3Rp
b25hbGl0eT8gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIHRoZSBkZXZpY2VzIGF0dGFjaGVkIHRvIGky
YwpzaG91bGQgd29yayB3ZWxsIGV2ZW4gYWZ0ZXIgdGhlIGkyYy1wYXNlbWktcGxhdGZvcm0gaGFz
IGJlZW4gcmVtb3ZlZC4KPC9jaGVuZ2xpbmdmZWkyMnNAaWN0LmFjLmNuPjwvc3ZlbkBrZXJuZWwu
b3JnPg==

