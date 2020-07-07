Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE998216339
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 03:02:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B141F21K8zDqfc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 11:02:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B13yW6b5lzDqV9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 11:00:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CbJXs+bs; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B13yW389cz9s1x;
 Tue,  7 Jul 2020 11:00:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594083635;
 bh=qzPV20SJNkcjihYEHYWApl1OnmD+HUg13ZYKS5sj3qg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CbJXs+bso0RcSodKjIkkEw2DV/QxCgKTENyG2295m8U2ho/ZbAARRaHghk9NHB4fC
 bk+5OQTfwS/JSimaNsv5HqZQuhl64uggHDFfHrQC2nnzTtf1BsHLdXyxgsI8eKoyow
 Z56r1E+uKxsIuujzsYZ2GZErmrU/pOjK1XOK/WeCsnAbTyTDeIMRZAUrks8Kh8DpFM
 BVqpFe7sdv8Y2puClVbqvoZ+3y58zGzxD+znrUR/Y8HV+8pckrJx6h9difJw4zHmWJ
 GMsnR8/a82XJEOE8zJRdrWfF7i5gLHguXfBSJ18PF8xpFn2f11ufl0zadR+zSab/Cm
 j2l1nNq4ncXIw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 13/26] powerpc/book3s64/pkeys: Enable MMU_FTR_PKEY
In-Reply-To: <6fa2a91d-c11c-2be4-2057-15f86d4dd39c@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-14-aneesh.kumar@linux.ibm.com>
 <878sfw6b7v.fsf@mpe.ellerman.id.au>
 <cddb4987-860f-f4be-43b0-f164031f9f6a@linux.ibm.com>
 <6fa2a91d-c11c-2be4-2057-15f86d4dd39c@linux.ibm.com>
Date: Tue, 07 Jul 2020 11:02:49 +1000
Message-ID: <87zh8c3znq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IkFuZWVzaCBLdW1hciBLLlYiIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4gd3JpdGVzOg0K
Pj4+DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIExldCdzIGFzc3VtZSAzMiBwa2V5cyBvbiBQOCBiYXJlIG1ldGFsLCBpZiBpdHMgbm90IA0K
Pj4+PiBkZWZpbmVkIGJ5IGRldmljZQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRyZWUu
IFdlIG1ha2UgdGhpcyBleGNlcHRpb24gc2luY2Ugc2tpYm9vdCBmb3Jnb3QgdG8gDQo+Pj4+IGV4
cG9zZSB0aGlzDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcHJvcGVydHkgb24gcG93ZXI4
Lg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKCFmaXJtd2FyZV9oYXNfZmVhdHVyZShGV19GRUFUVVJFX0xQQVIpICYmDQo+Pj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNwdV9oYXNfZmVhdHVyZShDUFVfRlRSU19QT1dFUjgpKQ0KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlYXJseV9jcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUlNf
UE9XRVI4KSkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGtleXNfdG90YWwgPSAz
MjsNCj4+Pg0KPj4+IFRoYXQncyBub3QgaG93IGNwdV9oYXNfZmVhdHVyZSgpIHdvcmtzLCB3ZSds
bCBuZWVkIHRvIGZpeCB0aGF0Lg0KPj4+DQo+Pj4gY2hlZXJzDQo+Pj4NCj4+IA0KPj4gSSBkaWQg
YSBzZXBhcmF0ZSBwYXRjaCB0byBoYW5kbGUgdGhhdCB3aGljaCBzd2l0Y2ggdGhlIGFib3ZlIHRv
DQo+PiANCj4+ICDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gIMKgwqDCoMKgwqDCoMKgwqAgKiBMZXQn
cyBhc3N1bWUgMzIgcGtleXMgb24gUDgvUDkgYmFyZSBtZXRhbCwgaWYgaXRzIG5vdCANCj4+IGRl
ZmluZWQgYnkgZGV2aWNlDQo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqIHRyZWUuIFdlIG1ha2UgdGhp
cyBleGNlcHRpb24gc2luY2Ugc2tpYm9vdCBmb3Jnb3QgdG8gZXhwb3NlIA0KPj4gdGhpcw0KPj4g
IMKgwqDCoMKgwqDCoMKgwqAgKiBwcm9wZXJ0eSBvbiBwb3dlcjgvOS4NCj4+ICDCoMKgwqDCoMKg
wqDCoMKgICovDQo+PiAgwqDCoMKgwqDCoMKgwqAgaWYgKCFmaXJtd2FyZV9oYXNfZmVhdHVyZShG
V19GRUFUVVJFX0xQQVIpICYmDQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoZWFybHlfY3B1
X2hhc19mZWF0dXJlKENQVV9GVFJfQVJDSF8yMDdTKSB8fA0KPj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBlYXJseV9jcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9BUkNIXzMwMCkpKQ0KPj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcGtleXNfdG90YWwgPSAzMjsNCj4+IA0KPg0KPiBXZSBzaG91
bGQgZG8gYSBQVlIgY2hlY2sgaGVyZSBpIGd1ZXNzLg0KDQpZZXMsIHRoZSBBUkNIIGZlYXR1cmVz
IGRvbid0IHdvcmsgYmVjYXVzZSBQMTAgd2lsbCBoYXZlIGJvdGggb2YgdGhvc2UNCmVuYWJsZWQu
DQoNCj4gCXJldCA9IG9mX3NjYW5fZmxhdF9kdChkdF9zY2FuX3N0b3JhZ2Vfa2V5cywgJnBrZXlz
X3RvdGFsKTsNCj4gCWlmIChyZXQgPT0gMCkgew0KPg0KPiAJCS8qDQo+IAkJICogTGV0J3MgYXNz
dW1lIDMyIHBrZXlzIG9uIFA4L1A5IGJhcmUgbWV0YWwsIGlmIGl0cyBub3QgZGVmaW5lZCBieSBk
ZXZpY2UNCj4gCQkgKiB0cmVlLiBXZSBtYWtlIHRoaXMgZXhjZXB0aW9uIHNpbmNlIHNraWJvb3Qg
Zm9yZ290IHRvIGV4cG9zZSB0aGlzDQo+IAkJICogcHJvcGVydHkgb24gcG93ZXI4LzkuDQoNCldl
bGwsIGl0IGRvZXMgZXhwb3NlIGl0IG9uIFBvd2VyOSBhZnRlciB2Ni42LCBidXQgbW9zdCBQOSBz
eXN0ZW1zIGhhdmUNCmFuIG9sZGVyIGZpcm13YXJlIHRoYW4gdGhhdC4NCg0KQW5kIGFsc28gdGhl
IGtlcm5lbCBoYXMgYmVlbiBlbmFibGluZyB0aGF0IG9uIFBvd2VyOSBiZWNhdXNlIG9mIHRoZQ0K
Q1BVX0ZUUlNfUE9XRVI4IGJ1Zywgc28gdGhpcyBpcyBub3QgYWN0dWFsbHkgYSBiZWhhdmlvdXIg
Y2hhbmdlLg0KDQo+IAkJICovDQo+IAkJaWYgKCFmaXJtd2FyZV9oYXNfZmVhdHVyZShGV19GRUFU
VVJFX0xQQVIpICYmDQo+IAkJICAgIChwdnJfdmVyc2lvbl9pcyhQVlJfUE9XRVI4KSB8fCBwdnJf
dmVyc2lvbl9pcyhQVlJfUE9XRVI5KSkpDQo+IAkJCXBrZXlzX3RvdGFsID0gMzI7DQo+IAl9DQoN
CllvdSBuZWVkIFBWUl9QT1dFUjhFIGFuZCBQVlJfUE9XRVI4TlZMIGFzIHdlbGwuDQoNCmNoZWVy
cw0K
