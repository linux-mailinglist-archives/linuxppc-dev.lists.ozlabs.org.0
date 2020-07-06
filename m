Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CDC215575
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 12:23:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0hVt3WKdzDqWr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 20:23:50 +1000 (AEST)
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
 header.s=dk header.b=c3hGBkH5; dkim-atps=neutral
X-Greylist: delayed 309 seconds by postgrey-1.36 at bilbo;
 Mon, 06 Jul 2020 19:30:21 AEST
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B0gK91DmdzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 19:30:20 +1000 (AEST)
X-UUID: c9905f7431944e508dbbb009edc3e747-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nNaLPXZtrGfnJf6M3QSucpG3gM0B0VN8+vf4nIaK9dk=; 
 b=c3hGBkH5SMkPA/6ub3cyadr6E7kdrz6QAVcJJkqIDVSb3isux9uCVzHA9QHZybA7PKSsY45CKqxd4QRb+XHSs2+qfur5JRzhDmFzsD0Z1G+Q0glahqnRRDjUD5kIB8MJfWEG6GWH/4UUinSHeTksBiC6gzYIau8lI3NW8Kvnxr0=;
X-UUID: c9905f7431944e508dbbb009edc3e747-20200706
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <chinwen.chang@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 935689036; Mon, 06 Jul 2020 17:25:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 17:24:57 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 6 Jul 2020 17:24:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Jul 2020 17:24:58 +0800
Message-ID: <1594027500.30360.32.camel@mtkswgap22>
Subject: Re: [PATCH v12 00/31] Speculative page faults
From: Chinwen Chang <chinwen.chang@mediatek.com>
To: Haiyan Song <haiyanx.song@intel.com>
Date: Mon, 6 Jul 2020 17:25:00 +0800
In-Reply-To: <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
References: <20190416134522.17540-1-ldufour@linux.ibm.com>
 <20190606065129.d5s3534p23twksgp@haiyan.sh.intel.com>
 <3d3cefa2-0ebb-e86d-b060-7ba67c48a59f@linux.ibm.com>
 <1c412ebe-c213-ee67-d261-c70ddcd34b79@linux.ibm.com>
 <20190620081945.hwj6ruqddefnxg6z@haiyan.sh.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Mon, 06 Jul 2020 20:22:23 +1000
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
 David Rientjes <rientjes@google.com>, paulmck@linux.vnet.ibm.com,
 npiggin@gmail.com, sj38.park@gmail.com, Jerome
 Glisse <jglisse@redhat.com>, dave@stgolabs.net, kemi.wang@intel.com,
 kirill@shutemov.name, Thomas
 Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 zhong jiang <zhongjiang@huawei.com>,
 Ganesh Mahendran <opensource.ganesh@gmail.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, miles.chen@mediatek.com,
 vinayak menon <vinayakm.list@gmail.com>, akpm@linux-foundation.org,
 Tim Chen <tim.c.chen@linux.intel.com>, haren@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDE5LTA2LTIwIGF0IDE2OjE5ICswODAwLCBIYWl5YW4gU29uZyB3cm90ZToNCj4g
SGkgTGF1cmVudCwNCj4gDQo+IEkgZG93bmxvYWRlZCB5b3VyIHNjcmlwdCBhbmQgcnVuIGl0IG9u
IEludGVsIDJzIHNreWxha2UgcGxhdGZvcm0gd2l0aCBzcGYtdjEyIHBhdGNoDQo+IHNlcmlhbHMu
DQo+IA0KPiBIZXJlIGF0dGFjaGVkIHRoZSBvdXRwdXQgcmVzdWx0cyBvZiB0aGlzIHNjcmlwdC4N
Cj4gDQo+IFRoZSBmb2xsb3dpbmcgY29tcGFyaXNvbiByZXN1bHQgaXMgc3RhdGlzdGljcyBmcm9t
IHRoZSBzY3JpcHQgb3V0cHV0cy4NCj4gDQo+IGEpLiBFbmFibGUgVEhQDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BGXzAgICAgICAgICAgY2hhbmdlICAg
ICAgIFNQRl8xDQo+IHdpbGwtaXQtc2NhbGUucGFnZV9mYXVsdDIucGVyX3RocmVhZF9vcHMgICAg
MjY2NDE5MC44ICAgICAgLTExLjclICAgICAgIDIzNTM2MzcuNiAgICAgIA0KPiB3aWxsLWl0LXNj
YWxlLnBhZ2VfZmF1bHQzLnBlcl90aHJlYWRfb3BzICAgIDQ0ODAwMjcuMiAgICAgIC0xNC43JSAg
ICAgICAzODE5MzMxLjkgICAgIA0KPiANCj4gDQo+IGIpLiBEaXNhYmxlIFRIUA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNQRl8wICAgICAgICAgICBjaGFu
Z2UgICAgICBTUEZfMQ0KPiB3aWxsLWl0LXNjYWxlLnBhZ2VfZmF1bHQyLnBlcl90aHJlYWRfb3Bz
ICAgIDI2NTMyNjAuNyAgICAgICAtMTAlICAgICAgICAyMzg1MTY1LjgNCj4gd2lsbC1pdC1zY2Fs
ZS5wYWdlX2ZhdWx0My5wZXJfdGhyZWFkX29wcyAgICA0NDM2MzMwLjEgICAgICAgLTEyLjQlICAg
ICAgMzg4NjczNC4yIA0KPiANCj4gDQo+IFRoYW5rcywNCj4gSGFpeWFuIFNvbmcNCj4gDQo+IA0K
PiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAxMDo0NDo0N0FNICswMjAwLCBMYXVyZW50IER1Zm91
ciB3cm90ZToNCj4gPiBMZSAxNC8wNi8yMDE5IMOgIDEwOjM3LCBMYXVyZW50IER1Zm91ciBhIMOp
Y3JpdCA6DQo+ID4gPiBQbGVhc2UgZmluZCBhdHRhY2hlZCB0aGUgc2NyaXB0IEkgcnVuIHRvIGdl
dCB0aGVzZSBudW1iZXJzLg0KPiA+ID4gVGhpcyB3b3VsZCBiZSBuaWNlIGlmIHlvdSBjb3VsZCBn
aXZlIGl0IGEgdHJ5IG9uIHlvdXIgdmljdGltIG5vZGUgYW5kIHNoYXJlIHRoZSByZXN1bHQuDQo+
ID4gDQo+ID4gU291bmRzIHRoYXQgdGhlIEludGVsIG1haWwgZml0ZXJpbmcgc3lzdGVtIGRvZXNu
J3QgbGlrZSB0aGUgYXR0YWNoZWQgc2hlbGwgc2NyaXB0Lg0KPiA+IFBsZWFzZSBmaW5kIGl0IHRo
ZXJlOiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9sZHU0L2E1Y2MxYTkzZjI5MzEwOGVhMzg3ZDQz
ZDVkNWU3ZjQ0DQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IExhdXJlbnQuDQo+ID4gDQoNCkhpIExh
dXJlbnQsDQoNCldlIG1lcmdlZCBTUEYgdjExIGFuZCBzb21lIHBhdGNoZXMgZnJvbSB2MTIgaW50
byBvdXIgcGxhdGZvcm1zLiBBZnRlcg0Kc2V2ZXJhbCBleHBlcmltZW50cywgd2Ugb2JzZXJ2ZWQg
U1BGIGhhcyBvYnZpb3VzIGltcHJvdmVtZW50cyBvbiB0aGUNCmxhdW5jaCB0aW1lIG9mIGFwcGxp
Y2F0aW9ucywgZXNwZWNpYWxseSBmb3IgdGhvc2UgaGlnaC1UTFAgb25lcywNCg0KIyBsYXVuY2gg
dGltZSBvZiBhcHBsaWNhdGlvbnMocyk6DQoNCnBhY2thZ2UgICAgICAgICAgIHZlcnNpb24gICAg
ICB3LyBTUEYgICAgICB3L28gU1BGICAgICAgaW1wcm92ZSglKQ0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAgICAgICAg
ICAgICAgICAgICAgICAgICANCkJhaWR1IG1hcHMgICAgICAgIDEwLjEzLjMgICAgICAwLjg4NyAg
ICAgICAwLjk4ICAgICAgICAgOS40OQ0KVGFvYmFvICAgICAgICAgICAgOC40LjAuMzUgICAgIDEu
MjI3ICAgICAgIDEuMjkzICAgICAgICA1LjEwDQpNZWl0dWFuICAgICAgICAgICA5LjEyLjQwMSAg
ICAgMS4xMDcgICAgICAgMS41NDMgICAgICAgIDI4LjI2DQpXZUNoYXQgICAgICAgICAgICA3LjAu
MyAgICAgICAgMi4zNTMgICAgICAgMi42OCAgICAgICAgIDEyLjIwDQpIb25vciBvZiBLaW5ncyAg
ICAxLjQzLjEuNiAgICAgNi42MyAgICAgICAgNi43MTMgICAgICAgIDEuMjQNCg0KDQpCeSB0aGUg
d2F5LCB3ZSBoYXZlIHZlcmlmaWVkIG91ciBwbGF0Zm9ybXMgd2l0aCB0aG9zZSBwYXRjaGVzIGFu
ZA0KYWNoaWV2ZWQgdGhlIGdvYWwgb2YgbWFzcyBwcm9kdWN0aW9uLg0KDQpUaGFua3MuDQpDaGlu
d2VuIENoYW5nDQo=

