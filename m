Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E58F6CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 00:09:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468gc12fmqzDqws
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 08:09:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=nam04-co1-obe.outbound.protection.outlook.com
 (client-ip=40.107.69.57; helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=christian.koenig@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="G3554fXf"; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468b7x4KfJzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 04:48:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ed3wjnMC2jnujVCyEcLbiI4EKGaS6kx89nOcYKFWH//FIEPhVVEsaNgpikXgjAZwQVsbsJLNAMNxM7lOCCzuo3zPT2Jz0n2EX1Dndeufrv6PvpeOLGiq8A2J+EDsDNGAWIuXm3MiO1XW1BkycdC6an/l3sNMNztfz2cB3g3FvcHrsmg+V4MjYobeT+SjSW39Nbp2PXCKyOcm2ivNn7BLf8FgddBpBz0EWsiO9M8Yq0y8viHvAcE0V8lHgwSg5R112kPo5qu1/i9XzSN0UK6k3cXWlLV07teX3HxboSeqKiH70pXZIbbq5TW/TpcVQvA+lPbwjG8VVKbWhsLds/NhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NadzRhwtuA6ArRuD6NOhqWbstpm1uivQ3xu+dkzOqo=;
 b=AvISbA38EEJcpP4mpVCpXiejopTaSYKG7aRVQiaUEY35JLgwXa4Udjw7lOkq+TalYoJE7HRCygmnfvNOHN7gN2GUF+VgHRRl+oezKlkD0cS319D8bYKtg6k+8cFolQDx1vnw+mnPHbWWByd+Iu/Llh7BNeX9y2/ZnrZTCexunF/Zt7T0L6rApS5y6NcPQQjo+ZxYUoV24/J41I6CqXX2IxMZXe5f9ESN0Vm4VfwvG3/IUzXIsd8T905P/ltC8rmSp636A8mjEFc/gxEk7b2h68rTmDkBGPcyEOQT1LpLPzTRdgIQTVVzriPSh4vdcqipK2ixYDsxUezGW4KITiLBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NadzRhwtuA6ArRuD6NOhqWbstpm1uivQ3xu+dkzOqo=;
 b=G3554fXfEN4qbOP/qHFcdMDe6k3ZN//RlEq2za0X3fvg6tjfCL0brUuz/lcM/pieb0PAKeiASVHLQl/1hZwwvASl+a1WGQEwokRGAkadaWIOZhBdlk6CDggoqVVzXIG4AN43k0h37aborUFYTcvIUXPlfsTkyp3jd8jQJDvpQKA=
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2552.namprd12.prod.outlook.com (52.132.141.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 18:48:39 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 18:48:39 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
Thread-Topic: [PATCH 0/6] drm+dma: cache support for arm, etc
Thread-Index: AQHVU5oNNOxMlz9qwEmEj3ngxE6Zpw==
Date: Thu, 15 Aug 2019 18:48:39 +0000
Message-ID: <215e5cb7-0fcf-48db-a656-817054dde420@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-originating-ip: [2a02:908:1252:fb60:bd2d:7c77:81e:aad8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2514fa9-77f8-49be-1700-08d721b13029
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2552; 
x-ms-traffictypediagnostic: DM5PR12MB2552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB255214EEF333B823A6F6C66583AC0@DM5PR12MB2552.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(14454004)(66556008)(66446008)(54896002)(6246003)(53936002)(64756008)(7406005)(6916009)(66476007)(31686004)(71190400001)(71200400001)(486006)(6436002)(46003)(186003)(229853002)(66946007)(6512007)(6486002)(6116002)(7416002)(102836004)(91956017)(76116006)(316002)(9686003)(4326008)(6506007)(54906003)(25786009)(31696002)(99286004)(476003)(86362001)(8936002)(81156014)(256004)(2906002)(14444005)(5660300002)(7736002)(8676002)(81166006)(478600001)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2552;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xWHN4Av3cSgMnFPvGSf0CsX4O91rEgoC61m24+ZxNzR8rQu3Xi79cfdP/sWxfEAV01nYjiyNB9h8FSEgtMKKnO/U+5PK1PinVVP26YWyD8JNyef9vvStuE25DZy1hJuzq2GER3ZclQJfXvlHYh8Iki7CFgEuYrKGgi+RIAKHyiU0gK2PD7F08cPtQ5S+fxhOkz1uK+1CnxsOVujsg34VPw1WTMN3kzzP1NLhyXgCz6EwryG6dWpi2NBS77dspsLG+PtGj5Mk/uKqEeTezIXBVESr79XAMEW69fAfCIQwkHjEfTw+jYZju0SwMn5UHh94PhXUJeBeRHAHref253/xXeaG9L2cItnzknzOYS8fbYQftyEzMZCJ5RdrXRbPWC9RakMPCraolf+Vv0UzGdP+Q3gDQ1inzsz08CKeDGE1X1E=
Content-Type: multipart/alternative;
 boundary="_000_215e5cb70fcf48dba656817054dde420emailandroidcom_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2514fa9-77f8-49be-1700-08d721b13029
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 18:48:39.3813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIJIm9ImRaw3rFMgGWOlXxJ5ndN4qPjulrVuNfdS9B81H4DWxC/2IzVtHlqqp+cZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2552
X-Mailman-Approved-At: Fri, 16 Aug 2019 08:03:08 +1000
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
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Imre Deak <imre.deak@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO
 GPU" <linux-arm-msm@vger.kernel.org>, "Sharma, Deepak" <Deepak.Sharma@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND
 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Enrico Weigelt <info@metux.net>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_215e5cb70fcf48dba656817054dde420emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnkgaWYgdGhlIHN0eWxlIGlzIG1lc3NlZCB1cCwgcmVwbHlpbmcgZnJvbSBteSBwaG9uZS4N
Cg0KQW0gMTUuMDguMjAxOSAyMDoyNyBzY2hyaWViIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPjoNCk9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA2OjIxOjAwUE0gKzAwMDAsIEtvZW5pZywg
Q2hyaXN0aWFuIHdyb3RlOg0KPiA+ICAgKDIpIEFkZCBzdXBwb3J0IGZvciBETUFfQVRUUl9OT19L
RVJORUxfTUFQUElORyB0byB0aGlzIG5ldyBBUEkgaW5zdGVhZA0KPiA+ICAgICAgIG9mIGRtYV9h
bGxvY19hdHRycy4gIFRoZSBpbml0aWFsIGRpZmZlcmVuY2Ugd2l0aCB0aGF0IGZsYWcgaXMganVz
dA0KPiA+ICAgICAgIHRoYXQgd2UgYWxsb3cgaGlnaG1lbSwgYnV0IGluIHRoZSBmdXR1cmUgd2Ug
Y291bGQgYWxzbyB1bm1hcCB0aGlzDQo+ID4gICAgICAgbWVtb3J5IGZyb20gdGhlIGtlcm5lbCBs
aW5lYXIgbWFwcGluZyBlbnRpcmVseSBvbiBhcmNoaXRlY3R1cmVzDQo+ID4gICAgICAgd2hlcmUg
d2UgY2FuIGVhc2lseSBkbyB0aGF0Lg0KPg0KPiBNaG0sIHdoeSB3b3VsZCB3ZSB3YW50IHRvIGRv
IHRoaXM/DQoNClRvIGF2b2lkIHRoZSBDUFUgbWlzc3BlY3VsYXRpbmcgaW50byB0aGlzIG1lbW9y
eS4gIEZvciBleGFtcGxlIE5WTWUgU1NEcw0KaGF2ZSBhIGZlYXR1cmUgY2FsbGVkIGhvc3QgbWVt
b3J5IGJ1ZmZlciB0aGF0IGlzIGEgbG90IGxpa2UgeW91ciBzdG9sZW4NCm1haW4gcmFtIGZvciB0
aGUgR1BVIGNhc2UuICBXZSBjdXJyZW50bHkgaGFuZCB0aGUgU1NEIGENCkRNQV9BVFRSX05PX0tF
Uk5FTF9NQVBQSU5HIGFsbG9jYXRpb24gaWYgaXQgcmVxdWVzdHMgc3VjaCBhIGJ1ZmZlci4gIElm
DQpwb3NzaWJsZSB3ZSdkIHJlYWxseSBsaWtlIHRvIG1ha2Ugc3VyZSBubyBzcGVjdWxhdGl2ZSBl
eGVjdXRpb24gYnVnDQoob3IgaW50ZW50aW9uYWwgYXR0YWNrZXIgd2l0aCBhIGtlcm5lbCBleHBs
b2l0IGZvciB0aGF0IG1hdHRlcikgY2FuIGVhc2lseQ0KYWNjZXNzIHRoYXQgbWVtb3J5Lg0KDQpX
ZWxsLCBmb3IgdGhlIGdyYXBoaWNzIGNhc2UgSSBhYnNvbHV0ZWx5IG5lZWQgdG8ga2VlcCB0aGUg
bGluZWFyIGtlcm5lbCBtYXBwaW5nLiBCZWNhdXNlIGZvciBjZXJ0YWluIHVzZSBjYXNlcyB0aGUg
bWVtb3J5IGlzIGFjY2Vzc2VkIGJ5IHRoZSBrZXJuZWwgYWxsIHRoZSB0aW1lIGFzIHdlbGwuDQoN
CldoeSBzaG91bGQgYWNjZXNzaW5nIHVuY2FjaGVkIG1lbW9yeSBiZSBtb3JlIG9mIGEgc2VjdXJp
dHkgcHJvYmxlbSB0aGFuIGFjY2Vzc2luZyBjYWNoZWQ/DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4N
Cg0K

--_000_215e5cb70fcf48dba656817054dde420emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CA9606059AAF674B8FB926F30C33B122@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj5Tb3JyeSBpZiB0aGUgc3R5bGUgaXMgbWVzc2VkIHVwLCByZXBseWluZyBmcm9t
IG15IHBob25lLjxicj4NCjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+DQo8ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+QW0gMTUuMDguMjAxOSAyMDoyNyBzY2hyaWViIENocmlzdG9waCBIZWxs
d2lnICZsdDtoY2hAbHN0LmRlJmd0Ozo8YnIgdHlwZT0iYXR0cmlidXRpb24iPg0KPGJsb2NrcXVv
dGUgY2xhc3M9InF1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4
ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2Pjxmb250IHNpemU9IjIiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTFwdCI+DQo8ZGl2Pk9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA2
OjIxOjAwUE0gJiM0MzswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZTo8YnI+DQomZ3Q7ICZn
dDsmbmJzcDsmbmJzcDsgKDIpIEFkZCBzdXBwb3J0IGZvciBETUFfQVRUUl9OT19LRVJORUxfTUFQ
UElORyB0byB0aGlzIG5ldyBBUEkgaW5zdGVhZDxicj4NCiZndDsgJmd0OyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBvZiBkbWFfYWxsb2NfYXR0cnMuJm5ic3A7IFRoZSBpbml0
aWFsIGRpZmZlcmVuY2Ugd2l0aCB0aGF0IGZsYWcgaXMganVzdDxicj4NCiZndDsgJmd0OyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB0aGF0IHdlIGFsbG93IGhpZ2htZW0sIGJ1
dCBpbiB0aGUgZnV0dXJlIHdlIGNvdWxkIGFsc28gdW5tYXAgdGhpczxicj4NCiZndDsgJmd0OyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBtZW1vcnkgZnJvbSB0aGUga2VybmVs
IGxpbmVhciBtYXBwaW5nIGVudGlyZWx5IG9uIGFyY2hpdGVjdHVyZXM8YnI+DQomZ3Q7ICZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgd2hlcmUgd2UgY2FuIGVhc2lseSBk
byB0aGF0Ljxicj4NCiZndDsgPGJyPg0KJmd0OyBNaG0sIHdoeSB3b3VsZCB3ZSB3YW50IHRvIGRv
IHRoaXM/PGJyPg0KPGJyPg0KVG8gYXZvaWQgdGhlIENQVSBtaXNzcGVjdWxhdGluZyBpbnRvIHRo
aXMgbWVtb3J5LiZuYnNwOyBGb3IgZXhhbXBsZSBOVk1lIFNTRHM8YnI+DQpoYXZlIGEgZmVhdHVy
ZSBjYWxsZWQgaG9zdCBtZW1vcnkgYnVmZmVyIHRoYXQgaXMgYSBsb3QgbGlrZSB5b3VyIHN0b2xl
bjxicj4NCm1haW4gcmFtIGZvciB0aGUgR1BVIGNhc2UuJm5ic3A7IFdlIGN1cnJlbnRseSBoYW5k
IHRoZSBTU0QgYTxicj4NCkRNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGFsbG9jYXRpb24gaWYg
aXQgcmVxdWVzdHMgc3VjaCBhIGJ1ZmZlci4mbmJzcDsgSWY8YnI+DQpwb3NzaWJsZSB3ZSdkIHJl
YWxseSBsaWtlIHRvIG1ha2Ugc3VyZSBubyBzcGVjdWxhdGl2ZSBleGVjdXRpb24gYnVnPGJyPg0K
KG9yIGludGVudGlvbmFsIGF0dGFja2VyIHdpdGggYSBrZXJuZWwgZXhwbG9pdCBmb3IgdGhhdCBt
YXR0ZXIpIGNhbiBlYXNpbHk8YnI+DQphY2Nlc3MgdGhhdCBtZW1vcnkuPGJyPg0KPC9kaXY+DQo8
L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2
Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPldlbGwsIGZv
ciB0aGUgZ3JhcGhpY3MgY2FzZSBJIGFic29sdXRlbHkgbmVlZCB0byBrZWVwIHRoZSBsaW5lYXIg
a2VybmVsIG1hcHBpbmcuIEJlY2F1c2UgZm9yIGNlcnRhaW4gdXNlIGNhc2VzIHRoZSBtZW1vcnkg
aXMgYWNjZXNzZWQgYnkgdGhlIGtlcm5lbCBhbGwgdGhlIHRpbWUgYXMgd2VsbC48YnI+DQo8L2Rp
dj4NCjxkaXYgZGlyPSJhdXRvIj48YnI+DQo8L2Rpdj4NCjxkaXYgZGlyPSJhdXRvIj5XaHkgc2hv
dWxkIGFjY2Vzc2luZyB1bmNhY2hlZCBtZW1vcnkgYmUgbW9yZSBvZiBhIHNlY3VyaXR5IHByb2Js
ZW0gdGhhbiBhY2Nlc3NpbmcgY2FjaGVkPzwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwv
ZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPlJlZ2FyZHMsPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+Q2hy
aXN0aWFuPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+
DQo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+DQo8YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0
eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5n
LWxlZnQ6MWV4Ij4NCjxkaXY+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MXB0Ij4NCjxkaXY+PC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0K
PC9kaXY+DQo8YnI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_215e5cb70fcf48dba656817054dde420emailandroidcom_--
