Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C67B024
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 19:34:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ykFL3FrHzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 03:34:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.68.113;
 helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.b="avBQUkdJ"; dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680113.outbound.protection.outlook.com [40.107.68.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ykBH1cDDzDqVd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 03:31:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiyNpSz64BfSw0warQY4fsHK0/j/YGdJpBR71SAqatxVOLsuDA7R/T9RnDCWV6PdwOkpzbpKhJG0FZJhUSn15r0OH5tS6yTiSwNZgzguZOGzCLOgzOHAOgJjgCAWyjS88F3B+IeRNuWS5YFY2bRrII0tIzTIr3VL/F6g3uZyv1R7plIfBpmRJ3ko7I4TEFaIuSBF9koj/dbXqXJDJ2JLiV5COy8gn75cAx04HT+END63Nl8qW9lXvSXVzEBLGr/L/h4kozGZWr+9+0n0J540jAC/i4NQeXsvmvjdaeqCK4hg5IpxMXqTELLlRL4mM4De+sfm1DJM2swh7FQd+507qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dpvwj1Vtrl40s/CzWekqNXiV7V74mCDmjAcgNvX+1w=;
 b=Ro/9uQiobS+LlZ9N2nwDHiJQLS74pEQTK/jzsXdL/oVdohE5oFSMabbRRLczWTHAgGMNmB18YFhJ/qtRZZ5UsqvljHjJEiqKQOcvY4xSiF/K/YMS+SKulxoYY6yNKT6G1mgfHu+YR9eG8mXjzP9ZmRBicLesBAmIcayGYVXShGNnbFI2XAblpMaCyMsqP0gR2o9mecM71mqXJlJEpmZud1E+pxaQDA5PXbCRsQmkso59gm5Kmx4IFqr/fbEogjFDezpI2ZdJjWPH29nMtLMdGIJ+YUSRPc3jjAYQ9dEJBxFUP/Wnzd9RYKxSj8zlZ9iF/bdVYJmMhlqlUUIEM9ojnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=os.amperecomputing.com;dmarc=pass action=none
 header.from=os.amperecomputing.com;dkim=pass
 header.d=os.amperecomputing.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dpvwj1Vtrl40s/CzWekqNXiV7V74mCDmjAcgNvX+1w=;
 b=avBQUkdJHvGi9jjVzaXBrY6tSW94+DIMAflTgen1OPiyTrbfG+9yaMyhuHVqlpU/ji5NgTE7jFBoJLgjWvOjRkncOMvJWdIcQYV1Np5oOB5fgpP3FNh6Shs7Cb7A2MyXZmrFqrhY3HrOYM0xYFLiJSj8XyAjDZbNYQbiC8HXm14=
Received: from DM6PR01MB4090.prod.exchangelabs.com (20.176.105.203) by
 DM6PR01MB5164.prod.exchangelabs.com (20.176.121.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 30 Jul 2019 17:31:27 +0000
Received: from DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::88b7:bfbe:79e9:b251]) by DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::88b7:bfbe:79e9:b251%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:31:27 +0000
From: Hoan Tran OS <hoan@os.amperecomputing.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Thread-Topic: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Thread-Index: AQHVOD/24o0J5njgPEqkosNO5sbs8abGjx+AgABBUoCAABUugIAAKIsAgAAGUoCABOfTgIAW8L6AgACbnwA=
Date: Tue, 30 Jul 2019 17:31:27 +0000
Message-ID: <d100011c-d5b4-a8c3-d3c0-d8f6dabd1363@os.amperecomputing.com>
References: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com>
 <20190712070247.GM29483@dhcp22.suse.cz>
 <586ae736-a429-cf94-1520-1a94ffadad88@os.amperecomputing.com>
 <20190712121223.GR29483@dhcp22.suse.cz>
 <20190712143730.au3662g4ua2tjudu@willie-the-truck>
 <20190712150007.GU29483@dhcp22.suse.cz>
 <730368c5-1711-89ae-e3ef-65418b17ddc9@os.amperecomputing.com>
 <20190730081415.GN9330@dhcp22.suse.cz>
In-Reply-To: <20190730081415.GN9330@dhcp22.suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR14CA0034.namprd14.prod.outlook.com
 (2603:10b6:903:101::20) To DM6PR01MB4090.prod.exchangelabs.com
 (2603:10b6:5:27::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [4.28.12.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 064f48f0-c434-4356-49d7-08d71513c001
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR01MB5164; 
x-ms-traffictypediagnostic: DM6PR01MB5164:
x-microsoft-antispam-prvs: <DM6PR01MB51647A820E23BA8DC5ED60C0F1DC0@DM6PR01MB5164.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(189003)(199004)(54534003)(8676002)(3846002)(6116002)(7416002)(7736002)(25786009)(2906002)(76176011)(71200400001)(71190400001)(6246003)(305945005)(52116002)(26005)(478600001)(5660300002)(102836004)(186003)(53936002)(11346002)(6512007)(446003)(2616005)(6486002)(476003)(6436002)(31686004)(6916009)(486006)(54906003)(229853002)(68736007)(99286004)(86362001)(4326008)(66446008)(64756008)(8936002)(81156014)(66946007)(53546011)(6506007)(386003)(66476007)(31696002)(81166006)(256004)(316002)(14454004)(66556008)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5164;
 H:DM6PR01MB4090.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i0S9/fCjfev4t4mP+iL9KF/iGB7s2EgAtQdYLocxCP/PXh3RTe6KRbOGLDsPANckZIOFxe7lGY6xgba0YiumuwnIPaPkI/Vh3P/kG1Bm3T3ZOFwGa5qMZIIiepSyJRk9JRyO7Ru7B3Mosg3QTm62kTezrmVDH3zcBHQvo6M0yYUHgdAO9UPn6hmBUq+gME/+DCkagk8bfO8K/A3x2I7NGCfYqUvSet+4TRTQYuWQvYmw7JbZAiWO+LNFz4fg9Yjf7xKOH8c8uIY5EM2o1K36ExGbgd2rKxxPFzKQOkc5FPM0uyV/1nCoai5Nz6NPPoINZyIjAZ4MTtf7otqUEQ2dWC0F86NzSKhmOAT4+kZa6qUde1roOO3QHVs1maRYqEZFLuBdNywvZnC+SmAQR6sbA3xsmVguH1U1eCw+4sGbd6A=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F25D28E1CB44404EB408F8B8C25EAF53@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064f48f0-c434-4356-49d7-08d71513c001
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:31:27.1673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5164
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
 Will Deacon <will@kernel.org>,
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

SGksDQoNCk9uIDcvMzAvMTkgMToxNCBBTSwgTWljaGFsIEhvY2tvIHdyb3RlOg0KPiBbU29ycnkg
Zm9yIGEgbGF0ZSByZXBseV0NCj4gDQo+IE9uIE1vbiAxNS0wNy0xOSAxNzo1NTowNywgSG9hbiBU
cmFuIE9TIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gT24gNy8xMi8xOSAxMDowMCBQTSwgTWljaGFs
IEhvY2tvIHdyb3RlOg0KPiBbLi4uXQ0KPj4+IEhtbSwgSSB0aG91Z2h0IHRoaXMgd2FzIHNlbGVj
dGFibGUuIEJ1dCBJIGFtIG9idmlvdXNseSB3cm9uZyBoZXJlLg0KPj4+IExvb2tpbmcgbW9yZSBj
bG9zZWx5LCBpdCBzZWVtcyB0aGF0IHRoaXMgaXMgaW5kZWVkIG9ubHkgYWJvdXQNCj4+PiBfX2Vh
cmx5X3Bmbl90b19uaWQgYW5kIGFzIHN1Y2ggbm90IHNvbWV0aGluZyB0aGF0IHNob3VsZCBhZGQg
YSBjb25maWcNCj4+PiBzeW1ib2wuIFRoaXMgc2hvdWxkIGhhdmUgYmVlbiBjYWxsZWQgb3V0IGlu
IHRoZSBjaGFuZ2Vsb2cgdGhvdWdoLg0KPj4NCj4+IFllcywgZG8geW91IGhhdmUgYW55IG90aGVy
IGNvbW1lbnRzIGFib3V0IG15IHBhdGNoPw0KPiANCj4gTm90IHJlYWxseS4gSnVzdCBtYWtlIHN1
cmUgdG8gZXhwbGljaXRseSBzdGF0ZSB0aGF0DQo+IENPTkZJR19OT0RFU19TUEFOX09USEVSX05P
REVTIGlzIG9ubHkgYWJvdXQgX19lYXJseV9wZm5fdG9fbmlkIGFuZCB0aGF0DQo+IGRvZXNuJ3Qg
cmVhbGx5IGRlc2VydmUgaXQncyBvd24gY29uZmlnIGFuZCBjYW4gYmUgcHVsbGVkIHVuZGVyIE5V
TUEuDQoNClllcywgSSB3aWxsIGFkZCB0aGlzIGluZm8gaW50byB0aGUgcGF0Y2ggZGVzY3JpcHRp
b24uDQoNCj4gDQo+Pj4gQWxzbyB3aGlsZSBhdCBpdCwgZG9lcyBIQVZFX01FTUJMT0NLX05PREVf
TUFQIGZhbGwgaW50byBhIHNpbWlsYXINCj4+PiBidWNrZXQ/IERvIHdlIGhhdmUgYW55IE5VTUEg
YXJjaGl0ZWN0dXJlIHRoYXQgZG9lc24ndCBlbmFibGUgaXQ/DQo+Pj4NCj4+DQo+PiBBcyBJIGNo
ZWNrZWQgd2l0aCBhcmNoIEtjb25maWcgZmlsZXMsIHRoZXJlIGFyZSAyIGFyY2hpdGVjdHVyZXMs
IHJpc2N2DQo+PiBhbmQgbWljcm9ibGF6ZSwgZG8gbm90IHN1cHBvcnQgTlVNQSBidXQgZW5hYmxl
IHRoaXMgY29uZmlnLg0KPj4NCj4+IEFuZCAxIGFyY2hpdGVjdHVyZSwgYWxwaGEsIHN1cHBvcnRz
IE5VTUEgYnV0IGRvZXMgbm90IGVuYWJsZSB0aGlzIGNvbmZpZy4NCj4gDQo+IENhcmUgdG8gaGF2
ZSBhIGxvb2sgYW5kIGNsZWFuIHRoaXMgdXAgcGxlYXNlPw0KDQpTdXJlLCBJJ2xsIHRha2UgYSBs
b29rLg0KDQpUaGFua3MNCkhvYW4NCj4gDQoNCg0K
