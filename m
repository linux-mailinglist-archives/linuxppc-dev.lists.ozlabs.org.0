Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E5F69A4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 19:57:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nWSl2RjyzDqGT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 03:57:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.82.107;
 helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.b="AhH1mmY+"; dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820107.outbound.protection.outlook.com [40.107.82.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nWQX1WKXzDqGJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 03:55:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3zceZ8s9fJ+r5jvP2Dyt5FNez0197J+VjrK3RcwXMo=;
 b=AhH1mmY+tBWjNuur0Lye+EZo/5ivMxDu4HlI/deciM6SIppBm4Ox4G4oKCdKW46an/SqoXqIOs8RxzyDCIED+bvwHjHOeZVHVCyUspAukmNXRMDpCLIlfaNzD+nizOntoGHOJDb/wkDDCQ3B8JtuiRvxlfc010E2931GaIld54s=
Received: from DM6PR01MB4090.prod.exchangelabs.com (20.176.105.203) by
 DM6PR01MB3674.prod.exchangelabs.com (20.176.64.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 15 Jul 2019 17:55:07 +0000
Received: from DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::88b7:bfbe:79e9:b251]) by DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::88b7:bfbe:79e9:b251%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 17:55:07 +0000
From: Hoan Tran OS <hoan@os.amperecomputing.com>
To: Michal Hocko <mhocko@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Thread-Topic: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Thread-Index: AQHVOD/24o0J5njgPEqkosNO5sbs8abGjx+AgABBUoCAABUugIAAKIsAgAAGUoCABOfTgA==
Date: Mon, 15 Jul 2019 17:55:07 +0000
Message-ID: <730368c5-1711-89ae-e3ef-65418b17ddc9@os.amperecomputing.com>
References: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com>
 <20190712070247.GM29483@dhcp22.suse.cz>
 <586ae736-a429-cf94-1520-1a94ffadad88@os.amperecomputing.com>
 <20190712121223.GR29483@dhcp22.suse.cz>
 <20190712143730.au3662g4ua2tjudu@willie-the-truck>
 <20190712150007.GU29483@dhcp22.suse.cz>
In-Reply-To: <20190712150007.GU29483@dhcp22.suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR22CA0094.namprd22.prod.outlook.com
 (2603:10b6:903:ad::32) To DM6PR01MB4090.prod.exchangelabs.com
 (2603:10b6:5:27::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [27.68.67.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4704a9c4-8b92-4f81-164d-08d7094d9237
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR01MB3674; 
x-ms-traffictypediagnostic: DM6PR01MB3674:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR01MB36744935B19F92FFC249CEBEF1CF0@DM6PR01MB3674.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39840400004)(366004)(346002)(376002)(396003)(136003)(189003)(199004)(54534003)(53754006)(8936002)(446003)(11346002)(2616005)(52116002)(478600001)(4326008)(26005)(31686004)(66066001)(6306002)(486006)(5660300002)(54906003)(7416002)(186003)(6512007)(316002)(6246003)(966005)(6506007)(386003)(53546011)(68736007)(110136005)(81156014)(2906002)(81166006)(8676002)(102836004)(53936002)(76176011)(476003)(6486002)(6436002)(66476007)(3846002)(66556008)(7736002)(66946007)(229853002)(14454004)(66446008)(64756008)(6116002)(71190400001)(71200400001)(305945005)(99286004)(25786009)(86362001)(256004)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3674;
 H:DM6PR01MB4090.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1poJLgy+gWrA2JZ8jvvSrr9id+coISlkua49IowNQJdYwMzPsTSWqzrmv2GTlG16sbpALs+nru8nLWGn6vaVFe2C8HbyqToZicyABq8RUtNtjwq7usE4yboJTDBlKymVrlD8hrUG2u4vHEoXjREB3zHyFT9F6YDZyELQlctle6xsSqd76WNQ9+2nq0WV81M4GRvRCDEbUrtqO3Nw8bfc6D/Y/Z92RM8vkJp1KQNGj1dmgzK6WIj2DNCEEoRAE5t8BulWiJFcu7QUkIXLyBuMNMBlPyzBBIpHmHXKqWSK6J1tkNQJmUfMOqD7qmxmcywQNur5l3d5X8/8eE2lJlVKK1MU9wXw98G0WCzQ/7Iue7gms5Tvk/fOuVB1pfRupuuzg0DphPXpYFjxt/2+Ulvm8OJunBD8crV7N6ETjA2rU84=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFFF5D632E6E314BACC1D6CCF19F1523@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4704a9c4-8b92-4f81-164d-08d7094d9237
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 17:55:07.2856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3674
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "willy@infradead.org" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCk9uIDcvMTIvMTkgMTA6MDAgUE0sIE1pY2hhbCBIb2NrbyB3cm90ZToNCj4gT24gRnJp
IDEyLTA3LTE5IDE1OjM3OjMwLCBXaWxsIERlYWNvbiB3cm90ZToNCj4+IEhpIGFsbCwNCj4+DQo+
PiBPbiBGcmksIEp1bCAxMiwgMjAxOSBhdCAwMjoxMjoyM1BNICswMjAwLCBNaWNoYWwgSG9ja28g
d3JvdGU6DQo+Pj4gT24gRnJpIDEyLTA3LTE5IDEwOjU2OjQ3LCBIb2FuIFRyYW4gT1Mgd3JvdGU6
DQo+Pj4gWy4uLl0NCj4+Pj4gSXQgd291bGQgYmUgZ29vZCBpZiB3ZSBjYW4gZW5hYmxlIGl0IGJ5
LWRlZmF1bHQuIE90aGVyd2lzZSwgbGV0IGFyY2gNCj4+Pj4gZW5hYmxlcyBpdCBieSB0aGVtLXNl
bGYuIERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucz8NCj4+Pg0KPj4+IEkgY2FuIGhhcmRseSBt
YWtlIGFueSBzdWdnZXN0aW9ucyB3aGVuIGl0IGlzIG5vdCByZWFsbHkgY2xlYXIgX3doeV8geW91
DQo+Pj4gd2FudCB0byByZW1vdmUgdGhpcyBjb25maWcgb3B0aW9uIGluIHRoZSBmaXJzdCBwbGFj
ZS4gUGxlYXNlIGV4cGxhaW4NCj4+PiB3aGF0IG1vdGl2YXRlZCB5b3UgdG8gbWFrZSB0aGlzIGNo
YW5nZS4NCj4+DQo+PiBTb3JyeSwgSSB0aGluayB0aGlzIGNvbmZ1c2lvbiBtaWdodCBhY3R1YWxs
eSBiZSBteSBmYXVsdCBhbmQgSG9hbiBoYXMganVzdA0KPj4gYmVlbiBpbXBsZW1lbnRpbmcgbXkg
dmFndWUgc3VnZ2VzdGlvbiBoZXJlOg0KPj4NCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWFybS1rZXJuZWwvMjAxOTA2MjUxMDEyNDUuczR2eGZvc29vcDUyZ2w0ZUB3aWxsaWUtdGhl
LXRydWNrLw0KPj4NCj4+IElmIHRoZSBwcmVmZXJlbmNlIG9mIHRoZSBtbSBmb2xrcyBpcyB0byBs
ZWF2ZSBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUw0KPj4gYXMgaXQgaXMsIHRoZW4gd2Ug
Y2FuIGRlZmluZSBpdCBmb3IgYXJtNjQuIEkganVzdCBmaW5kIGl0IGEgYml0IHdlaXJkIHRoYXQN
Cj4+IHRoZSBtYWpvcml0eSBvZiBOVU1BLWNhcGFibGUgYXJjaGl0ZWN0dXJlcyBoYXZlIHRvIGFk
ZCBhIHN5bWJvbCBpbiB0aGUgYXJjaA0KPj4gS2NvbmZpZyBmaWxlLCBmb3Igd2hhdCBhcHBlYXJz
IHRvIGJlIGEgcGVyZm9ybWFuY2Ugb3B0aW1pc2F0aW9uIGFwcGxpY2FibGUNCj4+IG9ubHkgdG8g
aWE2NCwgbWlwcyBhbmQgc2guDQo+Pg0KPj4gQXQgdGhlIHZlcnkgbGVhc3Qgd2UgY291bGQgbWFr
ZSB0aGUgdGhpbmcgc2VsZWN0YWJsZS4NCj4gDQo+IEhtbSwgSSB0aG91Z2h0IHRoaXMgd2FzIHNl
bGVjdGFibGUuIEJ1dCBJIGFtIG9idmlvdXNseSB3cm9uZyBoZXJlLg0KPiBMb29raW5nIG1vcmUg
Y2xvc2VseSwgaXQgc2VlbXMgdGhhdCB0aGlzIGlzIGluZGVlZCBvbmx5IGFib3V0DQo+IF9fZWFy
bHlfcGZuX3RvX25pZCBhbmQgYXMgc3VjaCBub3Qgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGFkZCBh
IGNvbmZpZw0KPiBzeW1ib2wuIFRoaXMgc2hvdWxkIGhhdmUgYmVlbiBjYWxsZWQgb3V0IGluIHRo
ZSBjaGFuZ2Vsb2cgdGhvdWdoLg0KDQpZZXMsIGRvIHlvdSBoYXZlIGFueSBvdGhlciBjb21tZW50
cyBhYm91dCBteSBwYXRjaD8NCg0KPiANCj4gQWxzbyB3aGlsZSBhdCBpdCwgZG9lcyBIQVZFX01F
TUJMT0NLX05PREVfTUFQIGZhbGwgaW50byBhIHNpbWlsYXINCj4gYnVja2V0PyBEbyB3ZSBoYXZl
IGFueSBOVU1BIGFyY2hpdGVjdHVyZSB0aGF0IGRvZXNuJ3QgZW5hYmxlIGl0Pw0KPiANCg0KQXMg
SSBjaGVja2VkIHdpdGggYXJjaCBLY29uZmlnIGZpbGVzLCB0aGVyZSBhcmUgMiBhcmNoaXRlY3R1
cmVzLCByaXNjdiANCmFuZCBtaWNyb2JsYXplLCBkbyBub3Qgc3VwcG9ydCBOVU1BIGJ1dCBlbmFi
bGUgdGhpcyBjb25maWcuDQoNCkFuZCAxIGFyY2hpdGVjdHVyZSwgYWxwaGEsIHN1cHBvcnRzIE5V
TUEgYnV0IGRvZXMgbm90IGVuYWJsZSB0aGlzIGNvbmZpZy4NCg0KVGhhbmtzIGFuZCBSZWdhcmRz
DQpIb2FuDQoNCj4gVGhhbmtzIQ0KPiANCg==
