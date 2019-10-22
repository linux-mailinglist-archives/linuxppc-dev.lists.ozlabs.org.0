Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA9E0C11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 20:57:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yN6Z5cshzDqPb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 05:57:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=daktronics.com (client-ip=40.107.81.70;
 helo=nam01-by2-obe.outbound.protection.outlook.com;
 envelope-from=matt.sickler@daktronics.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=daktronics.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=daktronics.com header.i=@daktronics.com
 header.b="cIfdbfWW"; dkim-atps=neutral
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810070.outbound.protection.outlook.com [40.107.81.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yLlj1QtXzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 04:55:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxBBDI5Hbch/qzVP3JJKncVckwcs/NxxkO0AaeAkSypuhNCkz6ZTM93mPKCS83mQu6P5kB20JF5Ioqdh1C1aXhw/ksJ08NKCoiorsUTjiU65FcLvgixGtIXVehWBk7Hyan4OJVwM0n6qvPACSki+eVxdPKZ2kRRc1SSIpzvh8kFJPISSfee+glqwzchYTN/s5s5wsZza4QuVcZ6Urf+rJRGtxFgHPMTge2/7w5deOffAd2w+bbb3pWNOwccGFzBayXjM22G4c1xHRpuuVQ99aU1NhZFHY5avjSwJRYekf2ueXi4P5R/MqlNsSN49bkz6mq0j4f4WFnrKEmVBOmNbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1thR0bk6as6nO9GCMTPrp4CeRx1jloAgo/zT6b5nWdI=;
 b=XMoCjBPwki0zEQJBOV9t5dLQUybleiVwPp66a1woPm/aDYJUKmjchfT1TIRwajodD7hwsJcssFBfQuAfqXJ5q6XnhWWXNJLG2l0X4sr+KZhPgihlRdkVfefaQIRanSf7TS0evRrzSiuiFWkvM3ARVGt5NB9DG/gaEdtgVc29Pmy7hGdW6ZNur4hdC7Pvk2luSS2fWjW2wKQhJyisTWeW49tQ9r3Q3RYWudwZVbL+Ek9MynnZMB90APuQiyD+cp3fJMLdngMHtk9Xw5ZcCtj8jdTsJfVOuJVqiwOqjoeXsi8k57AVom+9OPbyXDu8xnEOYSuxb0fU3EQdVQZdf1ti1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=daktronics.com; dmarc=pass action=none
 header.from=daktronics.com; dkim=pass header.d=daktronics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daktronics.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1thR0bk6as6nO9GCMTPrp4CeRx1jloAgo/zT6b5nWdI=;
 b=cIfdbfWW/bd6l8KsEcHxV9GA8J9PbwTiteh5MZK4Q5VZa3OmQSSn/+6v/4uxPKC6yH/CZEGntUgBQkVVtu7UVf7WHNWY8vvEipBKQUa82AYHvPht52o3Ge5nWe+76WbW56BGwiDzSu9ziyVy6feH+WvSX1WuaBCCdFJRcpO8BJw=
Received: from SN6PR02MB4016.namprd02.prod.outlook.com (52.135.69.145) by
 SN6PR02MB5422.namprd02.prod.outlook.com (20.177.249.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 22 Oct 2019 17:55:55 +0000
Received: from SN6PR02MB4016.namprd02.prod.outlook.com
 ([fe80::ec31:ae9d:c354:319a]) by SN6PR02MB4016.namprd02.prod.outlook.com
 ([fe80::ec31:ae9d:c354:319a%5]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 17:55:55 +0000
From: Matt Sickler <Matt.Sickler@daktronics.com>
To: David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RFC v1 07/12] staging: kpc2000: Prepare
 transfer_complete_cb() for PG_reserved changes
Thread-Topic: [PATCH RFC v1 07/12] staging: kpc2000: Prepare
 transfer_complete_cb() for PG_reserved changes
Thread-Index: AQHViPxcbvM0mySGyk+6f2twxm2iBqdm8Y8g
Date: Tue, 22 Oct 2019 17:55:54 +0000
Message-ID: <SN6PR02MB4016D75C028B7A1BEA005697EE680@SN6PR02MB4016.namprd02.prod.outlook.com>
References: <20191022171239.21487-1-david@redhat.com>
 <20191022171239.21487-8-david@redhat.com>
In-Reply-To: <20191022171239.21487-8-david@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Matt.Sickler@daktronics.com; 
x-originating-ip: [63.85.214.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14d5229b-224f-4510-04eb-08d757191616
x-ms-traffictypediagnostic: SN6PR02MB5422:
x-microsoft-antispam-prvs: <SN6PR02MB54226B9C5616DE2F7361BA9EEE680@SN6PR02MB5422.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(189003)(199004)(6506007)(7696005)(2906002)(99286004)(7366002)(76176011)(7406005)(33656002)(446003)(71190400001)(71200400001)(11346002)(76116006)(486006)(2501003)(229853002)(64756008)(66946007)(52536014)(66476007)(476003)(66556008)(66446008)(4326008)(186003)(26005)(102836004)(14454004)(7416002)(5660300002)(25786009)(8676002)(81156014)(81166006)(316002)(6436002)(14444005)(305945005)(256004)(7736002)(55016002)(74316002)(66066001)(86362001)(8936002)(9686003)(66574012)(478600001)(6116002)(6246003)(3846002)(54906003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5422;
 H:SN6PR02MB4016.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: daktronics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GV0bdRparBfPQYQiFd5mobcttfMeUhasgAomG69+R6ITIQuSKj+emPcWIYxlfOeRZy7MfLPZvE0mrCWT5GUzDgSo8zpDESD97P2ir2D7xoK9e61oMQ+Bx4Kg2caoViGj2WeFmmTziW2k7agIX4XGyNhSGCJOvEVktQjXoRZEtbpqetl6kkPcdW9P9zX7eK3ZDb72F7GWH1wJcjovFD4l8fhPNq4z08ljVEPZiSdW+lQ0C8ZiapkjXU1dulIsfOssr4NGHB8w8LopgfEB1NLvmf4HjZTHyYYRwCoqXKshIQXBaIdMd9cH+TC9QvWZJ/3Zm4kX4CRF1TmOSULUXtBoIFydeaIk3/QeIwhe7YIE+YoznNeUMCtzFDHpiMXHT5MUfSJhS8lIvE6GUCCkxPEAiEjThv9TxOVIUBT4hrASPTrDtpY3d+q81Uds88Po4IyJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: daktronics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d5229b-224f-4510-04eb-08d757191616
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 17:55:54.8547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: be88af81-0945-42aa-a3d2-b122777351a2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2clwrltXeRtnk4WAd1cR0av6VmYgyUI7pYiHi+h0yWZNiiBmnQ5vA2nFJzB1mWYYjXQrWLx8smHBcAJsa5mmTpCJBljsFUUXPbDCrP/Hhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5422
X-Mailman-Approved-At: Wed, 23 Oct 2019 05:28:43 +1100
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 =?utf-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 KarimAllah Ahmed <karahmed@amazon.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 Ben Chan <benchan@chromium.org>, Kees Cook <keescook@chromium.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Madhumitha Prabakaran <madhumithabiw@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Nishka Dasgupta <nishkadg.linux@gmail.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Oscar Salvador <osalvador@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 =?utf-8?B?U2ltb24gU2FuZHN0csO2bQ==?= <simon@nikanor.nu>,
 Dan Williams <dan.j.williams@intel.com>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>, Qian Cai <cai@lca.pw>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Todd Poynor <toddpoynor@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Allison Randal <allison@lohutok.net>, Jim Mattson <jmattson@google.com>,
 Vandana BN <bnvandana@gmail.com>, Jeremy Sowden <jeremy@azazel.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Springer <rspringer@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PlJpZ2h0IG5vdywgWk9ORV9ERVZJQ0UgbWVtb3J5IGlzIGFsd2F5cyBzZXQgUEdfcmVzZXJ2ZWQu
IFdlIHdhbnQgdG8gY2hhbmdlIHRoYXQuDQo+DQo+VGhlIHBhZ2VzIGFyZSBvYnRhaW5lZCB2aWEg
Z2V0X3VzZXJfcGFnZXNfZmFzdCgpLiBJIGFzc3VtZSwgdGhlc2UgY291bGQgYmUgWk9ORV9ERVZJ
Q0UgcGFnZXMuIExldCdzIGp1c3QgZXhjbHVkZSB0aGVtIGFzIHdlbGwgZXhwbGljaXRseS4NCg0K
SSdtIG5vdCBzdXJlIHdoYXQgWk9ORV9ERVZJQ0UgcGFnZXMgYXJlLCBidXQgdGhlc2UgcGFnZXMg
YXJlIG5vcm1hbCBzeXN0ZW0gUkFNLCB0eXBpY2FsbHkgSHVnZVBhZ2VzIChidXQgbm90IGFsd2F5
cykuDQoNCj4NCj5DYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4NCj5DYzogVmFuZGFuYSBCTiA8Ym52YW5kYW5hQGdtYWlsLmNvbT4NCj5DYzogIlNpbW9u
IFNhbmRzdHLDtm0iIDxzaW1vbkBuaWthbm9yLm51Pg0KPkNjOiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+DQo+Q2M6IE5pc2hrYSBEYXNndXB0YSA8bmlzaGthZGcubGlu
dXhAZ21haWwuY29tPg0KPkNjOiBNYWRodW1pdGhhIFByYWJha2FyYW4gPG1hZGh1bWl0aGFiaXdA
Z21haWwuY29tPg0KPkNjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+Q2M6
IE1hdHQgU2lja2xlciA8TWF0dC5TaWNrbGVyQGRha3Ryb25pY3MuY29tPg0KPkNjOiBKZXJlbXkg
U293ZGVuIDxqZXJlbXlAYXphemVsLm5ldD4NCj5TaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5i
cmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4tLS0NCj4gZHJpdmVycy9zdGFnaW5nL2twYzIwMDAv
a3BjX2RtYS9maWxlb3BzLmMgfCAzICsrLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9rcGMy
MDAwL2twY19kbWEvZmlsZW9wcy5jIGIvZHJpdmVycy9zdGFnaW5nL2twYzIwMDAva3BjX2RtYS9m
aWxlb3BzLmMNCj5pbmRleCBjYjUyYmQ5YTZkMmYuLjQ1N2FkY2M4MWZlNiAxMDA2NDQNCj4tLS0g
YS9kcml2ZXJzL3N0YWdpbmcva3BjMjAwMC9rcGNfZG1hL2ZpbGVvcHMuYw0KPisrKyBiL2RyaXZl
cnMvc3RhZ2luZy9rcGMyMDAwL2twY19kbWEvZmlsZW9wcy5jDQo+QEAgLTIxMiw3ICsyMTIsOCBA
QCB2b2lkICB0cmFuc2Zlcl9jb21wbGV0ZV9jYihzdHJ1Y3QgYWlvX2NiX2RhdGEgKmFjZCwgc2l6
ZV90IHhmcl9jb3VudCwgdTMyIGZsYWdzKQ0KPiAgICAgICAgQlVHX09OKGFjZC0+bGRldi0+cGxk
ZXYgPT0gTlVMTCk7DQo+DQo+ICAgICAgICBmb3IgKGkgPSAwIDsgaSA8IGFjZC0+cGFnZV9jb3Vu
dCA7IGkrKykgew0KPi0gICAgICAgICAgICAgICBpZiAoIVBhZ2VSZXNlcnZlZChhY2QtPnVzZXJf
cGFnZXNbaV0pKSB7DQo+KyAgICAgICAgICAgICAgIGlmICghUGFnZVJlc2VydmVkKGFjZC0+dXNl
cl9wYWdlc1tpXSkgJiYNCj4rICAgICAgICAgICAgICAgICAgICFpc196b25lX2RldmljZV9wYWdl
KGFjZC0+dXNlcl9wYWdlc1tpXSkpIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICBzZXRfcGFn
ZV9kaXJ0eShhY2QtPnVzZXJfcGFnZXNbaV0pOw0KPiAgICAgICAgICAgICAgICB9DQo+ICAgICAg
ICB9DQo+LS0NCj4yLjIxLjANCg0K
