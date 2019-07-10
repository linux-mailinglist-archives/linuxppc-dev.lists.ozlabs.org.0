Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0C6410B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 08:16:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k8861NRgzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:16:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.78.112;
 helo=nam03-by2-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.b="gZgPJvbE"; dkim-atps=neutral
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780112.outbound.protection.outlook.com [40.107.78.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k86G57FkzDqGL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 16:14:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB59O9DSuXg8zohOMHP+9hfqBpWgnXWURBlZvVfxfSSENk6u5KFXMtJaOm7EKMDC6bY5ivoQ3LcJMUK1+lQ541pNns5oAdTp2ACweIPEUpVGVu52Q9CvGbPFCo822uU7VLJnYsRZ/T4rOFKomwAmbyJjnvOGuvff6MxmdSsaDQtsU0Be8jYkdqTK9uJe+VRjOYV3TRiA70Wgd0VWKYOnVtQHlTqVFLQkR5iVWnb4Nw9zpDy4OU+2NIjF37ZS13jP1aoRLhkJJA4lNoCWDHe7CXWgFEUqbGJWtHCdkb5AaDi0ZI6AmnjqIFQWtBB71zrqeXVuLDuGNDxOWOioehVy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g1lBb0bDtADPgbIBk0VMonLJceDG+gkmXYT0LxGevY=;
 b=gaQzI5CR1wJGPrvh3fWKtgNA1lUnD+gH4q3jUIGJcKVz/GDY5dlkAujstiAsdftGFhu6mQ+RDshZOTXSjXo4uTVXIoUtGWSsHPLfa/tLYDGVY/mzcBiQbsN+3SrA857DI/D2UPIjAj3mmiVMKHoPE0HsyEvtNvdGmdg1dLdfY92XZb5NgLxWWNSWlLifcmOhYmZzx6cedyRTV6bkZopahExrdOYHj9oRSIR8r2hMupnGigHBUZMbsRtXb7MVLNFCCtJcrgzAjDwhHr6LTvqF4+sXD4gsw5CZ4Jb8oqVqGjrScNP6WQ8YkaqeeBCMR26TvaE2HgCTjjmEU2oQjWujfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=os.amperecomputing.com;dmarc=pass action=none
 header.from=os.amperecomputing.com;dkim=pass
 header.d=os.amperecomputing.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g1lBb0bDtADPgbIBk0VMonLJceDG+gkmXYT0LxGevY=;
 b=gZgPJvbEWGgJt54AhIa/SjeQf/Drki9xhBLAU+FZmFlxmqVmr1gFHEoySgFEyHS6kp+0POFrSwNhj0AuzyQKu/BmkeQ5I+vXrsOmjfz+2WNVVoPThu3E5zOU00hEcIgxIQeXryaVHGskcGl+9nPsLNoOOfkUC/Ay22jZHQaEeHw=
Received: from BYAPR01MB4085.prod.exchangelabs.com (52.135.237.22) by
 BYAPR01MB3927.prod.exchangelabs.com (52.135.195.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 06:14:24 +0000
Received: from BYAPR01MB4085.prod.exchangelabs.com
 ([fe80::9dbb:1b4c:bace:ef80]) by BYAPR01MB4085.prod.exchangelabs.com
 ([fe80::9dbb:1b4c:bace:ef80%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 06:14:23 +0000
From: Hoan Tran OS <hoan@os.amperecomputing.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/5] x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Topic: [PATCH 3/5] x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Index: AQHVK6WX71HRsQts10W3HaW79T6UP6as+COAgBWploCAAM/wgIAABGyA
Date: Wed, 10 Jul 2019 06:14:23 +0000
Message-ID: <50032a84-9453-8ab3-8d42-5bd8c1504640@os.amperecomputing.com>
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
 <1561501810-25163-4-git-send-email-Hoan@os.amperecomputing.com>
 <alpine.DEB.2.21.1906260032250.32342@nanos.tec.linutronix.de>
 <1c5bc3a8-0c6f-dce3-95a2-8aec765408a2@os.amperecomputing.com>
 <alpine.DEB.2.21.1907100755010.1758@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907100755010.1758@nanos.tec.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:903:77::14) To BYAPR01MB4085.prod.exchangelabs.com
 (2603:10b6:a03:56::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [27.68.67.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d28e77e-328a-4b52-10e8-08d704fdda51
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR01MB3927; 
x-ms-traffictypediagnostic: BYAPR01MB3927:
x-microsoft-antispam-prvs: <BYAPR01MB39270A08E415E78ED4090157F1F00@BYAPR01MB3927.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(396003)(366004)(39840400004)(199004)(189003)(54534003)(305945005)(476003)(486006)(446003)(11346002)(2616005)(6512007)(6486002)(71200400001)(6246003)(107886003)(71190400001)(53936002)(6436002)(229853002)(31686004)(81166006)(25786009)(81156014)(8676002)(478600001)(8936002)(7736002)(256004)(6916009)(4326008)(68736007)(14454004)(3846002)(31696002)(99286004)(66476007)(76176011)(64756008)(66556008)(66946007)(52116002)(66446008)(26005)(186003)(316002)(102836004)(7416002)(53546011)(6116002)(386003)(6506007)(86362001)(54906003)(5660300002)(66066001)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR01MB3927;
 H:BYAPR01MB4085.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ukd5q2O0kG1P7Fa8HN5gD4Wne0noqQrCX22aDCdhndEtGDAnPvruESK/Fva9oBjMrk1XackbtuG0mTunHgv8CyIa/UZHkgTXqwSMmTFVnZdg2ZFr7cbFnCGD7W9fTnUdbyiVBehrWWaXBn2LEmO8GuSkOMSzB7yIlMEc3y80CYsStJoCs7f0b8tsB+sCC2ArGeDbYgcd8yGLNeDsWkkzY01U2mTfklP4v7i67kjMZKOWucYepAzDUGQJE9oRSS9y+wSyZB94qY+/1IBfLf4N2VzjdVdrX0Bb4cAVAqeqoEj+TPFYAH+te/ZUL2eBW5NBiH4lEzVquDIr1kWgdIpOYG8NQIrjGmfc7yqEMXiXFHQSkfx1cJWUFW/eOnfxnYvMMWnhJH7JfBw7JTTRsqvV+0kDGcAdPHSqmcd3lR4Hjk4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8083A5B2C8C78E4686C4EDE0FC38BDB0@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d28e77e-328a-4b52-10e8-08d704fdda51
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 06:14:23.6394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB3927
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Open Source Submission <patches@amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oscar Salvador <osalvador@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgVGhvbWFzLA0KDQoNCk9uIDcvMTAvMTkgMTI6NTggUE0sIFRob21hcyBHbGVpeG5lciB3cm90
ZToNCj4gSG9hbiwNCj4gDQo+IE9uIFdlZCwgMTAgSnVsIDIwMTksIEhvYW4gVHJhbiBPUyB3cm90
ZToNCj4+IE9uIDYvMjUvMTkgMzo0NSBQTSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOg0KPj4+IE9u
IFR1ZSwgMjUgSnVuIDIwMTksIEhvYW4gVHJhbiBPUyB3cm90ZToNCj4+Pj4gQEAgLTE1NjcsMTUg
KzE1NjcsNiBAQCBjb25maWcgWDg2XzY0X0FDUElfTlVNQQ0KPj4+PiAgICAJLS0taGVscC0tLQ0K
Pj4+PiAgICAJICBFbmFibGUgQUNQSSBTUkFUIGJhc2VkIG5vZGUgdG9wb2xvZ3kgZGV0ZWN0aW9u
Lg0KPj4+PiAgICANCj4+Pj4gLSMgU29tZSBOVU1BIG5vZGVzIGhhdmUgbWVtb3J5IHJhbmdlcyB0
aGF0IHNwYW4NCj4+Pj4gLSMgb3RoZXIgbm9kZXMuICBFdmVuIHRob3VnaCBhIHBmbiBpcyB2YWxp
ZCBhbmQNCj4+Pj4gLSMgYmV0d2VlbiBhIG5vZGUncyBzdGFydCBhbmQgZW5kIHBmbnMsIGl0IG1h
eSBub3QNCj4+Pj4gLSMgcmVzaWRlIG9uIHRoYXQgbm9kZS4gIFNlZSBtZW1tYXBfaW5pdF96b25l
KCkNCj4+Pj4gLSMgZm9yIGRldGFpbHMuDQo+Pj4+IC1jb25maWcgTk9ERVNfU1BBTl9PVEhFUl9O
T0RFUw0KPj4+PiAtCWRlZl9ib29sIHkNCj4+Pj4gLQlkZXBlbmRzIG9uIFg4Nl82NF9BQ1BJX05V
TUENCj4+Pg0KPj4+IHRoZSBjaGFuZ2Vsb2cgZG9lcyBub3QgbWVudGlvbiB0aGF0IHRoaXMgbGlm
dHMgdGhlIGRlcGVuZGVuY3kgb24NCj4+PiBYODZfNjRfQUNQSV9OVU1BIGFuZCB0aGVyZWZvcmUg
ZW5hYmxlcyB0aGF0IGZ1bmN0aW9uYWxpdHkgZm9yIGFueXRoaW5nDQo+Pj4gd2hpY2ggaGFzIE5V
TUEgZW5hYmxlZCBpbmNsdWRpbmcgMzJiaXQuDQo+Pj4NCj4+DQo+PiBJIHRoaW5rIHRoaXMgY29u
ZmlnIGlzIHVzZWQgZm9yIGEgTlVNQSBsYXlvdXQgd2hpY2ggTlVNQSBub2RlcyBhZGRyZXNzZXMN
Cj4+IGFyZSBzcGFubmVkIHRvIG90aGVyIG5vZGVzLiBJIHRoaW5rIDMyYml0IE5VTUEgYWxzbyBo
YXZlIHRoZSBzYW1lIGlzc3VlDQo+PiB3aXRoIHRoYXQgbGF5b3V0LiBQbGVhc2UgY29ycmVjdCBt
ZSBpZiBJJ20gd3JvbmcuDQo+IA0KPiBJJ20gbm90IHNheWluZyB5b3UncmUgd3JvbmcsIGJ1dCBp
dCdzIHlvdXIgZHV0eSB0byBwcm92aWRlIHRoZSBhbmFseXNpcyB3aHkNCj4gdGhpcyBpcyBjb3Jy
ZWN0IGZvciBldmVyeXRoaW5nIHdoaWNoIGhhcyBOVU1BIGVuYWJsZWQuDQo+IA0KPj4+IFRoZSBj
b3JlIG1tIGNoYW5nZSBnaXZlcyBubyBoZWxwZnVsIGluZm9ybWF0aW9uIGVpdGhlci4gWW91IGp1
c3QgY29waWVkIHRoZQ0KPj4+IGFib3ZlIGNvbW1lbnQgdGV4dCBmcm9tIHNvbWUgcmFuZG9tIEtj
b25maWcuDQo+Pg0KPj4gWWVzLCBhcyBpdCdzIGEgY29ycmVjdCBjb21tZW50IGFuZCBpcyB1c2Vk
IGF0IG11bHRpcGxlIHBsYWNlcy4NCj4gDQo+IFdlbGwgaXQgbWF5YmUgY29ycmVjdCBpbiB0ZXJt
cyBvZiBleHBsYWluaW5nIHdoYXQgdGhpcyBpcyBhYm91dCwgaXQgc3RpbGwNCj4gZG9lcyBub3Qg
ZXhwbGFpbiB3aHkgdGhpcyBpcyBuZWVkZWQgYnkgZGVmYXVsdCBvbiBldmVyeXRoaW5nIHdoaWNo
IGhhcyBOVU1BDQo+IGVuYWJsZWQuDQoNCkxldCBtZSBzZW5kIGFub3RoZXIgcGF0Y2ggd2l0aCB0
aGUgZGV0YWlsIGV4cGxhbmF0aW9uLg0KDQpUaGFua3MNCkhvYW4NCg0KPiANCj4gVGhhbmtzLA0K
PiANCj4gCXRnbHgNCj4gDQo=
