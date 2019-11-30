Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE70110DC23
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 03:11:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PvyK04TlzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 13:11:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=huawei.com;
 envelope-from=shaolexi@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PvwC5gSJzDrCG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 13:10:03 +1100 (AEDT)
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 9E2AD20E91B7584E05B2;
 Sat, 30 Nov 2019 10:09:46 +0800 (CST)
Received: from dggeme752-chm.china.huawei.com (10.3.19.98) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 30 Nov 2019 10:09:46 +0800
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 dggeme752-chm.china.huawei.com (10.3.19.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Sat, 30 Nov 2019 10:09:46 +0800
Received: from dggeme762-chm.china.huawei.com ([10.8.68.53]) by
 dggeme762-chm.china.huawei.com ([10.8.68.53]) with mapi id 15.01.1713.004;
 Sat, 30 Nov 2019 10:09:46 +0800
From: shaolexi <shaolexi@huawei.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kasan: KASAN is not supported on RELOCATABLE &&
 FSL_BOOKE
Thread-Topic: [PATCH] powerpc/kasan: KASAN is not supported on RELOCATABLE &&
 FSL_BOOKE
Thread-Index: AdWnHIDkM/vwrYwhTsCdrVcoI4ZaIw==
Date: Sat, 30 Nov 2019 02:09:45 +0000
Message-ID: <448c0af8be2247a780ed42bc401ff50c@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.103.252]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: "Wangkefeng \(OS Kernel Lab\)" <wangkefeng.wang@huawei.com>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "liucheng
 \(G\)" <liucheng32@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PkxlIDI5LzExLzIwMTkgw6AgMDg6NDYsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXQgOg0KPj4N
Cj4+DQo+PiBMZSAyOS8xMS8yMDE5IMOgIDA4OjA0LCBMZXhpIFNoYW8gYSDDqWNyaXQgOg0KPj4+
IENPTkZJR19SRUxPQ0FUQUJMRSBhbmQgQ09ORklHX0tBU0FOIGNhbm5vdCBiZSBlbmFibGVkIGF0
IHRoZSBzYW1lDQo+Pj4gdGltZSBvbiBwcGNlNTAwIGZzbF9ib29rZS4gQWxsIGZ1bmN0aW9ucyBj
YWxsZWQgYmVmb3JlDQo+Pj4ga2FzYW5fZWFybHlfaW5pdCgpIHNob3VsZCBiZSBkaXNhYmxlZCB3
aXRoIGthc2FuIGNoZWNrLiBXaGVuDQo+Pj4gQ09ORklHX1JFTE9DQVRBQkxFIGlzIGVuYWJsZWQg
b24gcHBjZTUwMCBmc2xfYm9va2UsIHJlbG9jYXRlX2luaXQoKQ0KPj4+IGlzIGNhbGxlZCBiZWZv
cmUga2FzYW5fZWFybHlfaW5pdCgpIHdoaWNoIHRyaWdnZXJzIGthc2FuIGNoZWNrIGFuZCByZXN1
bHRzIGluIGJvb3QgZmFpbHVyZS4NCj4+PiBDYWxsIHRyYWNlIGFuZCBmdW5jdGlvbnMgd2hpY2gg
dHJpZ2dlcnMga2FzYW4gY2hlY2soKik6DQo+Pj4gICAgLSBfc3RhcnQNCj4+PiAgICAgLSBzZXRf
aXZvcg0KPj4+ICAgICAgLSByZWxvY2F0ZV9pbml0KCopDQo+Pj4gICAgICAgLSBlYXJseV9nZXRf
Zmlyc3RfbWVtYmxvY2tfaW5mbygqKQ0KPj4+ICAgICAgICAtIG9mX3NjYW5fZmxhdF9kdCgqKQ0K
Pj4+ICAgICAuLi4NCj4+PiAgICAgIC0ga2FzYW5fZWFybHlfaW5pdA0KPj4+DQo+Pj4gUG90ZW50
aWFsIHNvbHV0aW9ucyBjb3VsZCBiZSAxLiBpbXBsZW1lbnQgcmVsb2NhdGVfaW5pdCBhbmQgYWxs
IGl0cw0KPj4+IGNoaWxkcmVuIGZ1bmN0aW9uIGluIGEgc2VwZXJhdGUgZmlsZSBvciAyLiBpbnRy
b2R1Y2UgYSBnbG9iYWwNCj4+PiB2YWlyYWJsZSBpbiBLQVNBTiwgb25seSBlbmFibGUgS0FTQU4g
Y2hlY2sgd2hlbiBpbml0IGlzIGRvbmUuDQo+Pg0KPj4gU29sdXRpb24gMSBzZWVtcyB1bmVhc3ku
IG9mX3NjYW5fZmxhdF9kdCgpIGFuZCBjaGlsZHJlbiBhcmUgZ2VuZXJhbA0KPj4gZnVuY3Rpb25z
IHRoYXQgY2FuJ3QgYmUgc2V0IGFzaWRlLg0KPj4gU29sdXRpb24gMiB3b3VsZCBkZXN0cm95IHBl
cmZvcm1hbmNlLCBhbmQgd291bGQgYW55d2F5IG5vdCB3b3JrIHdpdGgNCj4+IGlubGluZSBpbnN0
cnVtZW50YXRpb24uDQo+Pg0KPj4gSGF2ZSB5b3UgdHJpZWQgbW92aW5nIHRoZSBjYWxsIHRvIGth
c2FuX2Vhcmx5X2luaXQoKSBiZWZvcmUgdGhlIGNhbGwNCj4+IG9mDQo+PiByZWxvY2F0ZV9pbml0
KCkgPw0KPg0KPkkganVzdCB0cmllZCBpdCB3aXRoIFFFTVUsIGl0IHdvcmtzLiBJJ2xsIHNlbmQg
YSBwYXRjaCBvdXQgc29vbi4NCj4NCg0KWWVzIEkgdHJpZWQgYnV0IGNvdWxkbid0IGdldCBpdCB0
byB3b3JrIG9uIGEgUDEwMTAuIFRoZXJlIG1pZ2h0IGJlIGNvbmZsaWN0DQpzb21ld2hlcmUgZWxz
ZSB3aXRoIG15IGtlcm5lbCBjb25maWcuIFdpbGwga2VlcCBvbiBkZWJ1Z2dpbmcuDQpUaGFua3Mg
Zm9yIHRoZSBwcm9tcHQgcmVwbHkgYW5kIHRyeWluZyBpdCBvdXQgb24gcWVtdS4NCg0KTGV4aQ0K
DQo+DQo+DQo+PiBPbiBvdGhlciBQUEMzMiwga2FzYW5fZWFybHlfaW5pdCgpIGlzIHRoZSBmaXJz
dCB0aGluZyBkb25lIGFmdGVyDQo+PiBhY3RpdmF0aW5nIHRoZSBNTVUuIEJ1dCBBRkFJVSwgTU1V
IGlzIGFsd2F5cyBhY3RpdmUgb24gQk9PS0UgdGhvdWdoLg0KPj4NCj4+IENocmlzdG9waGUNCj4+
DQo+Pj4NCj4+PiBEaXNhYmxlIEtBU0FOIHdoZW4gUkVMT0NBVEFCTEUgaXMgc2VsZWN0ZWQgb24g
ZnNsX2Jvb2tlIGZvciBub3cgdW50aWwNCj4+PiBpdCBpcyBzdXBwb3J0ZWQuDQo+Pj4NCj4+PiBT
aWduZWQtb2ZmLWJ5OiBMZXhpIFNoYW8gPHNoYW9sZXhpQGh1YXdlaS5jb20+DQo+Pj4gLS0tDQo+
Pj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyB8IDIgKy0NCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcgaW5kZXgNCj4+PiAzZTU2Yzlj
MmYxNmUuLjE0ZjNkYTYzYzA4OCAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZp
Zw0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+Pj4gQEAgLTE3MSw3ICsxNzEsNyBA
QCBjb25maWcgUFBDDQo+Pj4gICAgICAgc2VsZWN0IEhBVkVfQVJDSF9BVURJVFNZU0NBTEwNCj4+
PiAgICAgICBzZWxlY3QgSEFWRV9BUkNIX0hVR0VfVk1BUCAgICAgICAgaWYgUFBDX0JPT0szU182
NCAmJg0KPj4+IFBQQ19SQURJWF9NTVUNCj4+PiAgICAgICBzZWxlY3QgSEFWRV9BUkNIX0pVTVBf
TEFCRUwNCj4+PiAtICAgIHNlbGVjdCBIQVZFX0FSQ0hfS0FTQU4gICAgICAgICAgICBpZiBQUEMz
Mg0KPj4+ICsgICAgc2VsZWN0IEhBVkVfQVJDSF9LQVNBTiAgICAgICAgICAgIGlmIFBQQzMyICYm
ICEoUkVMT0NBVEFCTEUgJiYNCj4+PiBGU0xfQk9PS0UpDQo+Pj4gICAgICAgc2VsZWN0IEhBVkVf
QVJDSF9LR0RCDQo+Pj4gICAgICAgc2VsZWN0IEhBVkVfQVJDSF9NTUFQX1JORF9CSVRTDQo+Pj4g
ICAgICAgc2VsZWN0IEhBVkVfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUUyAgICBpZiBDT01QQVQN
Cj4+Pg0K
