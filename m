Return-Path: <linuxppc-dev+bounces-9163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD11ACEA64
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 08:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCZff2mSBz2yLB;
	Thu,  5 Jun 2025 16:43:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749092984;
	cv=none; b=evra+5ef4mhMZnP7vDq+ttXs06btsad4jE4FlzdxTKI3rWb10Ahswhf1TXUS67+VftIVXvhRdpDndns0sKpNmPOvWcP/x7qAfeeI5aqYaah19tKTdlFOioHFlahSm9nImrsKrhVp2HA7mbXmgZhjpvUzBzcE5MFrvgAKyxdyPim6sVZq2CruRhvgCMvYmIhfEH9jGG1OE2H7QUWMj8N//+jbKtrQBwdfXRndEFiMLC4S1VkpmDCXlYvD1JNy3B9c46tjCDuMZXkARWMtuh0YCp8h78td5fNVlXm6Lh5/T0cCFsdhdymIB2Gw+jGRFWTKM0gtpiHeKfL/s3bX6QIdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749092984; c=relaxed/relaxed;
	bh=jg24Yo+Bw83kcQE5Zz+uHIe9HXkorbFQAvED/E/Ahmc=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=j+othx3H+d26hYeurCT07HGcUlBzg1DHNQKPfoHJzIsybWsYeUeMXvBWUS6dMcFb+Wu7UPVoBKAprMMz0x/a119O+D00PlaGL7Fp8yvGiJTjVJQVCv0YkWoHsrNrl0hMyZyCGxyxyV2rb4haB0LwcmlKNp/7YzUaCcC+kSgzFQCbUOzT2MiCuNcGVWgXc8vnKGSlH4DWGz/6/wc0S9B4Y/5mLjP1ISees94MnJRYREVQcyYdsVk7owAi3ew747HE9ZADEZ+fwA361q7jtxFL0DJcv1ePtjdDv3xE5QBO3P8ubhBCCNV+qrsNMWyLVRgjbMTlNfYaVKKwyRcp3OA/dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn; spf=pass (client-ip=159.226.251.20; helo=cstnet.cn; envelope-from=chenglingfei22s@ict.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=ict.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ict.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ict.ac.cn (client-ip=159.226.251.20; helo=cstnet.cn; envelope-from=chenglingfei22s@ict.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 385 seconds by postgrey-1.37 at boromir; Thu, 05 Jun 2025 13:09:43 AEST
Received: from cstnet.cn (smtp20.cstnet.cn [159.226.251.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCTvW0Hzmz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 13:09:42 +1000 (AEST)
Received: from chenglingfei22s$ict.ac.cn ( [115.42.62.11] ) by
 ajax-webmail-APP-10 (Coremail) ; Thu, 5 Jun 2025 11:02:51 +0800 (GMT+08:00)
X-Originating-IP: [115.42.62.11]
Date: Thu, 5 Jun 2025 11:02:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?56iL5YeM6aOe?= <chenglingfei22s@ict.ac.cn>
To: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev
Cc: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, 
	chenglingfei22s@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	andi.shyti@kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2025 www.mailtech.cn cnic.cn
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
Message-ID: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:tACowABnWYXcCEForT8GAA--.62932W
X-CM-SenderInfo: xfkh0wpolqwwthlsj2g6lf3hldfou0/1tbiBgoEDmhA0QvjOgAAst
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Spam-Status: No, score=2.9 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGksIGFsbCEKCldl4oCZdmUgZW5jb3VudGVyZWQgYSBrZXJuZWwgY3Jhc2ggd2hlbiBydW5uaW5n
IHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gb24gYSBNYWMgTWluaSBNMSAoVDgxMDMpIHJ1bm5p
bmcgQXNhaGkgQXJjaCBMaW51eC4gCgpUaGUgYnVnIHdhcyBmaXJzdCBmb3VuZCBvbiB0aGUgTGlu
dXggdjYuNiwgd2hpY2ggaXMgYnVpbHQgbWFudWFsbHkgd2l0aCB0aGUgQXNhaGkgZ2l2ZW4gY29u
ZmlnIHRvIHJ1biBvdXIgc2VydmljZXMuIApBdCB0aGF0IHRpbWUsIHRoZSBpMmMtcGFzZW1pLXBs
YXRmb3JtIHdhcyBpMmMtYXBwbGUuCgpXZSBub3RpY2VkIGluIHRoZSBMaW51eCB2Ni43LCB0aGUg
cGFzZW1pIGlzIHNwbGl0dGVkIGludG8gdHdvIHNlcGFyYXRlIG1vZHVsZXMsIG9uZSBvZiB3aGlj
aCBpcyBpMmMtcGFzZW1pLXBsYXRmb3JtLgpUaGVyZWZvcmUsIHdlIGJ1aWx0IExpbnV4IHY2LjE0
LjYgYW5kIHRyaWVkIHRvIHJtbW9kIGkyYy1wYXNlbWktcGxhdGZvcm0gYWdhaW4sIHRoZSBjcmFz
aCBzdGlsbCBleGlzdHMuIE1vcmVvdmVyLCB3ZSBmZXRjaGVkIAp0aGUgbGF0ZXN0IGkyYy1wYXNl
bWktcGxhdGZvcm0gb24gbGludXgtbmV4dCg5MTE0ODNiMjU2MTJjOGJjMzJhNzA2YmE5NDA3Mzhj
YzQzMjk5NDk2KSBhbmQgYXNhaGksIGJ1aWx0IHRoZW0gYW5kIAp0ZXN0ZWQgYWdhaW4gd2l0aCBM
aW51eCB2Ni4xNC42LCBidXQgdGhlIGNyYXNoIHJlbWFpbnMuCgpCZWNhdXNlIGtleGVjIGlzIG5v
dCBzdXBwb3J0ZWQgYW5kIHdpbGwgbmV2ZXIgYmUgZnVsbHkgc3VwcG9ydGVkIG9uIEFwcGxlIFNp
bGljb24gcGxhdGZvcm1zIGR1ZSB0byBoYXJkd2FyZSBhbmQgZmlybXdhcmUgCmRlc2lnbiBjb25z
dHJhaW50cywgd2UgY2FuIG5vdCByZWNvcmQgdGhlIHBhbmljIGxvZ3MgdGhyb3VnaCBrZHVtcC4K
ClRodXMgd2UgdHJpZWQgdG8gZmluZCB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUgbWFudWFs
bHkuIFdoZW4gd2UgcGVyZm9ybSBybW1vZCwgdGhlIGtlcm5lbCBwZXJmb3JtcyBkZXZpY2UgcmVs
ZWFzaW5nIG9uIAp0aGUgaTJjIGJ1cywgdGhlbiBjYWxscyB0aGUgcmVtb3ZlIGZ1bmN0aW9uIGlu
IHNuZC1zb2MtY3M0Mmw4My1pMmMsIHdoaWNoIGNhbGxzIHRoZSBjczQybDQyX2NvbW1vbl9yZW1v
dmUgaW4gY3M0Mmw0MiwgCmJlY2F1c2UgY3M0Mmw0Mi0mZ3Q7aW5pdF9kb25lIGlzIHRydWUsIGl0
IHBlcmZvcm1zIHJlZ21hcF93cml0ZSwgYW5kIGZpbmFsbHkgY2FsbHMgaW50byBwYXNlbWlfc21i
X3dhaXRyZWFkeSBpbiBpMmMtcGFzZW1pCi1jb3JlLmMuIFdlIG5vdGljZWQgdGhhdCBzbWJ1cy0m
Z3Q7dXNlX2lycSBpcyB0cnVlLCBhbmQgYWZ0ZXIgaXQgY2FsbHMgaW50byB3YWl0X2Zvcl9jb21w
bGV0aW9uX3RpbWVvdXQsIHRoZSBzeXN0ZW0gY3Jhc2hzIQoKV2UgZm91bmQgdGhhdCB3YWl0X2Zv
cl9jb21wbGV0aW9uX3RpbWVvdXQgaXMgb25lIG9mIHRoZSBjb3JlIHNjaGVkdWxlciBBUElzIHVz
ZWQgYnkgdGVucyBvZiB0aG91c2FuZHMgb2Ygb3RoZXIgZHJpdmVycywKaXQgaXMgdW5saWtlbHkg
Y2F1c2luZyB0aGUgY3Jhc2guIFNvIHdlIHRyaWVkIHRvIHJlbW92ZSB0aGUgY2FsbCB0byB3YWl0
X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQsIHRoZW4gdGhlIHN5c3RlbSBzZWVtcyB0bwpydW4gd2Vs
bC4KCkhvd2V2ZXIsIGJlY2F1c2Ugd2UgaGF2ZSBsaXR0bGUga25vd2xlZGdlIGFib3V0IGkyYyBk
ZXZpY2VzIGFuZCBzcGVjaWZpY2F0aW9ucywgd2UgYXJlIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBj
aGFuZ2Ugd2lsbCAKY2F1c2Ugb3RoZXIgcG90ZW50aWFsIGhhcm1zIGZvciB0aGUgc3lzdGVtIGFu
ZCBkZXZpY2UuIElzIHRoaXMgY2FsbCB0byB3YWl0IG5lY2VzYXJ5IGhlcmU/IE9yIGNhbiB5b3Ug
Z2l2ZSBhIG1vcmUgCnNvcGhpc3RpY2F0ZWQgZml4PwoKV2XigJlyZSBoYXBweSB0byBwcm92aWRl
IGFkZGl0aW9uYWwgbG9ncywgY29uZmlncywgb3IgdGVzdGluZyBhc3Npc3RhbmNlLiBBbnkgZ3Vp
ZGFuY2Ugd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKCgo=

