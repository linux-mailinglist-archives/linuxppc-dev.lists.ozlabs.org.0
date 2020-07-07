Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E37812165E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 07:33:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1B172RgdzDqlh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 15:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mediatek.com (client-ip=210.61.82.184;
 helo=mailgw02.mediatek.com; envelope-from=chinwen.chang@mediatek.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mediatek.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=HZrNFt0Q; dkim-atps=neutral
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B19zX2Q4qzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 15:31:48 +1000 (AEST)
X-UUID: cfbde1c3c24641f794aedd704777a07c-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QHbkWGB6AYr/otqaU50brYqQUJizQSU9qyIN4GtkzDg=; 
 b=HZrNFt0QpmEcTcwk3dctytFB7Ysd1tNRcGOL5AYYCkhG8TSg+4ioB81h9L/VtfD6ebSde7vh7uN55RH6AoewtEzlFBFgyWVXIvcF6wcbjkce9sDzFpKY/f1q8FMqSvr0D29ZHSP3IKjlqT9CufY8SsyVy+pFN3NPe2nkpjevOIA=;
X-UUID: cfbde1c3c24641f794aedd704777a07c-20200707
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <chinwen.chang@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1227173683; Tue, 07 Jul 2020 13:31:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 13:31:36 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 13:31:36 +0800
Message-ID: <1594099897.30360.58.camel@mtkswgap22>
Subject: Re: [PATCH v12 00/31] Speculative page faults
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Date: Tue, 7 Jul 2020 13:31:37 +0800
In-Reply-To: <490c0811-50cd-0802-2cbc-9c031ef309f6@linux.ibm.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
 <3d3cefa2-0ebb-e86d-b060-7ba67c48a59f@linux.ibm.com>
 <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
 <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
 <1594027500.30360.32.camel@mtkswgap22>
 <490c0811-50cd-0802-2cbc-9c031ef309f6@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BD21DAF844DD646E121434B7D084E5A7BA97FF2EEB9E645A621535C561C7DB242000:8
X-MTK: N
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
Cc: jack@suse.cz, sergey.senozhatsky.work@gmail.com, peterz@infradead.org,
 Will Deacon <will.deacon@arm.com>, mhocko@kernel.org, linux-mm@kvack.org,
 paulus@samba.org, Punit Agrawal <punitagrawal@gmail.com>, hpa@zytor.com,
 Michel Lespinasse <walken@google.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrea
 Arcangeli <aarcange@redhat.com>, ak@linux.intel.com,
 Minchan Kim <minchan@kernel.org>, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 zhong jiang <zhongjiang@huawei.com>, David Rientjes <rientjes@google.com>,
 paulmck@linux.vnet.ibm.com, npiggin@gmail.com, sj38.park@gmail.com, Jerome
 Glisse <jglisse@redhat.com>, dave@stgolabs.net, kemi.wang@intel.com,
 kirill@shutemov.name, Thomas
 Gleixner <tglx@linutronix.de>, Haiyan Song <haiyanx.song@intel.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, miles.chen@mediatek.com,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIwLTA3LTA2IGF0IDE0OjI3ICswMjAwLCBMYXVyZW50IER1Zm91ciB3cm90ZToN
Cj4gTGUgMDYvMDcvMjAyMCDDoCAxMToyNSwgQ2hpbndlbiBDaGFuZyBhIMOpY3JpdCA6DQo+ID4g
T24gVGh1LCAyMDE5LTA2LTIwIGF0IDE2OjE5ICswODAwLCBIYWl5YW4gU29uZyB3cm90ZToNCj4g
Pj4gSGkgTGF1cmVudCwNCj4gPj4NCj4gPj4gSSBkb3dubG9hZGVkIHlvdXIgc2NyaXB0IGFuZCBy
dW4gaXQgb24gSW50ZWwgMnMgc2t5bGFrZSBwbGF0Zm9ybSB3aXRoIHNwZi12MTIgcGF0Y2gNCj4g
Pj4gc2VyaWFscy4NCj4gPj4NCj4gPj4gSGVyZSBhdHRhY2hlZCB0aGUgb3V0cHV0IHJlc3VsdHMg
b2YgdGhpcyBzY3JpcHQuDQo+ID4+DQo+ID4+IFRoZSBmb2xsb3dpbmcgY29tcGFyaXNvbiByZXN1
bHQgaXMgc3RhdGlzdGljcyBmcm9tIHRoZSBzY3JpcHQgb3V0cHV0cy4NCj4gPj4NCj4gPj4gYSku
IEVuYWJsZSBUSFANCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgU1BGXzAgICAgICAgICAgY2hhbmdlICAgICAgIFNQRl8xDQo+ID4+IHdpbGwtaXQtc2Nh
bGUucGFnZV9mYXVsdDIucGVyX3RocmVhZF9vcHMgICAgMjY2NDE5MC44ICAgICAgLTExLjclICAg
ICAgIDIzNTM2MzcuNg0KPiA+PiB3aWxsLWl0LXNjYWxlLnBhZ2VfZmF1bHQzLnBlcl90aHJlYWRf
b3BzICAgIDQ0ODAwMjcuMiAgICAgIC0xNC43JSAgICAgICAzODE5MzMxLjkNCj4gPj4NCj4gPj4N
Cj4gPj4gYikuIERpc2FibGUgVEhQDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNQRl8wICAgICAgICAgICBjaGFuZ2UgICAgICBTUEZfMQ0KPiA+PiB3
aWxsLWl0LXNjYWxlLnBhZ2VfZmF1bHQyLnBlcl90aHJlYWRfb3BzICAgIDI2NTMyNjAuNyAgICAg
ICAtMTAlICAgICAgICAyMzg1MTY1LjgNCj4gPj4gd2lsbC1pdC1zY2FsZS5wYWdlX2ZhdWx0My5w
ZXJfdGhyZWFkX29wcyAgICA0NDM2MzMwLjEgICAgICAgLTEyLjQlICAgICAgMzg4NjczNC4yDQo+
ID4+DQo+ID4+DQo+ID4+IFRoYW5rcywNCj4gPj4gSGFpeWFuIFNvbmcNCj4gPj4NCj4gPj4NCj4g
Pj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6NDQ6NDdBTSArMDIwMCwgTGF1cmVudCBEdWZv
dXIgd3JvdGU6DQo+ID4+PiBMZSAxNC8wNi8yMDE5IMOgIDEwOjM3LCBMYXVyZW50IER1Zm91ciBh
IMOpY3JpdCA6DQo+ID4+Pj4gUGxlYXNlIGZpbmQgYXR0YWNoZWQgdGhlIHNjcmlwdCBJIHJ1biB0
byBnZXQgdGhlc2UgbnVtYmVycy4NCj4gPj4+PiBUaGlzIHdvdWxkIGJlIG5pY2UgaWYgeW91IGNv
dWxkIGdpdmUgaXQgYSB0cnkgb24geW91ciB2aWN0aW0gbm9kZSBhbmQgc2hhcmUgdGhlIHJlc3Vs
dC4NCj4gPj4+DQo+ID4+PiBTb3VuZHMgdGhhdCB0aGUgSW50ZWwgbWFpbCBmaXRlcmluZyBzeXN0
ZW0gZG9lc24ndCBsaWtlIHRoZSBhdHRhY2hlZCBzaGVsbCBzY3JpcHQuDQo+ID4+PiBQbGVhc2Ug
ZmluZCBpdCB0aGVyZTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2lzdC5n
aXRodWIuY29tL2xkdTQvYTVjYzFhOTNmMjkzMTA4ZWEzODdkNDNkNWQ1ZTdmNDRfXzshIUNUUk5L
QTl3TWcwQVJidyEwbHV4MkZNQ2JJRnhGRWw4MjRDZFN1U1FxVDBJVldzdnlVcWZEVkpORVZiOWdU
V3lSbHRtN2NwUFpnNzBOX1hoWG1NWiQgDQo+ID4+Pg0KPiA+Pj4gVGhhbmtzLA0KPiA+Pj4gTGF1
cmVudC4NCj4gPj4+DQo+ID4gDQo+ID4gSGkgTGF1cmVudCwNCj4gPiANCj4gPiBXZSBtZXJnZWQg
U1BGIHYxMSBhbmQgc29tZSBwYXRjaGVzIGZyb20gdjEyIGludG8gb3VyIHBsYXRmb3Jtcy4gQWZ0
ZXINCj4gPiBzZXZlcmFsIGV4cGVyaW1lbnRzLCB3ZSBvYnNlcnZlZCBTUEYgaGFzIG9idmlvdXMg
aW1wcm92ZW1lbnRzIG9uIHRoZQ0KPiA+IGxhdW5jaCB0aW1lIG9mIGFwcGxpY2F0aW9ucywgZXNw
ZWNpYWxseSBmb3IgdGhvc2UgaGlnaC1UTFAgb25lcywNCj4gPiANCj4gPiAjIGxhdW5jaCB0aW1l
IG9mIGFwcGxpY2F0aW9ucyhzKToNCj4gPiANCj4gPiBwYWNrYWdlICAgICAgICAgICB2ZXJzaW9u
ICAgICAgdy8gU1BGICAgICAgdy9vIFNQRiAgICAgIGltcHJvdmUoJSkNCj4gPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gPiBCYWlkdSBtYXBzICAgICAgICAxMC4xMy4zICAgICAgMC44ODcgICAgICAgMC45OCAgICAg
ICAgIDkuNDkNCj4gPiBUYW9iYW8gICAgICAgICAgICA4LjQuMC4zNSAgICAgMS4yMjcgICAgICAg
MS4yOTMgICAgICAgIDUuMTANCj4gPiBNZWl0dWFuICAgICAgICAgICA5LjEyLjQwMSAgICAgMS4x
MDcgICAgICAgMS41NDMgICAgICAgIDI4LjI2DQo+ID4gV2VDaGF0ICAgICAgICAgICAgNy4wLjMg
ICAgICAgIDIuMzUzICAgICAgIDIuNjggICAgICAgICAxMi4yMA0KPiA+IEhvbm9yIG9mIEtpbmdz
ICAgIDEuNDMuMS42ICAgICA2LjYzICAgICAgICA2LjcxMyAgICAgICAgMS4yNA0KPiANCj4gVGhh
dCdzIGdyZWF0IG5ld3MsIHRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMhDQo+IA0KPiA+IA0KPiA+
IEJ5IHRoZSB3YXksIHdlIGhhdmUgdmVyaWZpZWQgb3VyIHBsYXRmb3JtcyB3aXRoIHRob3NlIHBh
dGNoZXMgYW5kDQo+ID4gYWNoaWV2ZWQgdGhlIGdvYWwgb2YgbWFzcyBwcm9kdWN0aW9uLg0KPiAN
Cj4gQW5vdGhlciBnb29kIG5ld3MhDQo+IEZvciBteSBpbmZvcm1hdGlvbiwgd2hhdCBpcyB5b3Vy
IHRhcmdldGVkIGhhcmR3YXJlPw0KPiANCj4gQ2hlZXJzLA0KPiBMYXVyZW50Lg0KDQpIaSBMYXVy
ZW50LA0KDQpPdXIgdGFyZ2V0ZWQgaGFyZHdhcmUgYmVsb25ncyB0byBBUk02NCBtdWx0aS1jb3Jl
IHNlcmllcy4NCg0KVGhhbmtzLg0KQ2hpbndlbg0KPiANCg0K

