Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 671DB66B40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 12:58:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lVKQ1cTQzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 20:58:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.80.135;
 helo=nam03-dm3-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.b="RLzxHkxs"; dkim-atps=neutral
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800135.outbound.protection.outlook.com [40.107.80.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lVHF479qzDqst
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 20:56:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAcDhTCCszW+EvtBveUDZM7yH6cPZubOi2R9jyvB+p8=;
 b=RLzxHkxsAekTYM3YvJ169/tJGHBAUyq2BDSjAskAP8r/+tWetDCFu5V+kRlclXCdFEyMm3YwY5Q4SYor9m9ABtXmyTsaN1asQV8WILPOfomLFfdIsGw3M7OFVBvTSNU7TVI0+quFRrZ+ssyj0Yus9rC869dhYQWcxRxjYqw/ZR0=
Received: from BYAPR01MB4085.prod.exchangelabs.com (52.135.237.22) by
 BYAPR01MB4024.prod.exchangelabs.com (52.135.236.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Fri, 12 Jul 2019 10:56:47 +0000
Received: from BYAPR01MB4085.prod.exchangelabs.com
 ([fe80::9dbb:1b4c:bace:ef80]) by BYAPR01MB4085.prod.exchangelabs.com
 ([fe80::9dbb:1b4c:bace:ef80%7]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 10:56:47 +0000
From: Hoan Tran OS <hoan@os.amperecomputing.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Thread-Topic: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Thread-Index: AQHVOD/24o0J5njgPEqkosNO5sbs8abGjx+AgABBUoA=
Date: Fri, 12 Jul 2019 10:56:47 +0000
Message-ID: <586ae736-a429-cf94-1520-1a94ffadad88@os.amperecomputing.com>
References: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com>
 <20190712070247.GM29483@dhcp22.suse.cz>
In-Reply-To: <20190712070247.GM29483@dhcp22.suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::15) To BYAPR01MB4085.prod.exchangelabs.com
 (2603:10b6:a03:56::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [14.161.176.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 807a3fd4-bfd6-442a-a336-08d706b7a280
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR01MB4024; 
x-ms-traffictypediagnostic: BYAPR01MB4024:
x-microsoft-antispam-prvs: <BYAPR01MB40241C259D44AE3593493E10F1F20@BYAPR01MB4024.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(199004)(189003)(86362001)(102836004)(54906003)(7736002)(52116002)(68736007)(53936002)(66066001)(76176011)(3846002)(6246003)(8936002)(99286004)(386003)(107886003)(81156014)(81166006)(8676002)(6116002)(305945005)(6506007)(53546011)(31696002)(186003)(26005)(14454004)(71200400001)(71190400001)(5660300002)(31686004)(6512007)(66946007)(2906002)(4326008)(446003)(316002)(14444005)(476003)(229853002)(6486002)(6916009)(25786009)(6436002)(256004)(11346002)(66556008)(64756008)(7416002)(66476007)(486006)(66446008)(2616005)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR01MB4024;
 H:BYAPR01MB4085.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: clhGm3T4TfgYriMEPdp+Yc+KHXC4dtGOA1DU0V7WJc5Mna/izBjYCUx9ZdOUovfNYZKJ2iOqefoJbRlfGAgRulkZjR1B2eeMA1M2ERswnTyWQLcnuMV0nU03EPFFjLMuvUXDkZao3WZA5CPxjpsCvlX9hLVSKzHiiVLbwmVLmjv4vz0o7SQNDOZBPQAQNEuMyNM4K1UskC/5cbrC9Q90eMcmP7BXfJKW4YY4asD/ucxsllVoDzKVNI0KIMbCSdDOLeFEZQHzHvH0yaW1jVn4c/PNOK7vHHFURpMEFHNsw7UXciQ2G7EObLLLAY4pRTaigJsWiU936lcHSOoDxgR9RsWiabBh1Eg9nF6LjFofTIKeWenTKlpWUcfNN9fJ1/dzekRUE71jberJ6szigN0RYRtGt3C3V+K3CJOTzYk/jpM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25482F5148BFF740873F45BB6828D5BF@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807a3fd4-bfd6-442a-a336-08d706b7a280
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 10:56:47.5823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4024
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oscar Salvador <osalvador@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCk9uIDcvMTIvMTkgMjowMiBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOg0KPiBPbiBUaHUg
MTEtMDctMTkgMjM6MjU6NDQsIEhvYW4gVHJhbiBPUyB3cm90ZToNCj4+IEluIE5VTUEgbGF5b3V0
IHdoaWNoIG5vZGVzIGhhdmUgbWVtb3J5IHJhbmdlcyB0aGF0IHNwYW4gYWNyb3NzIG90aGVyIG5v
ZGVzLA0KPj4gdGhlIG1tIGRyaXZlciBjYW4gZGV0ZWN0IHRoZSBtZW1vcnkgbm9kZSBpZCBpbmNv
cnJlY3RseS4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgd2l0aCBsYXlvdXQgYmVsb3cNCj4+IE5vZGUg
MCBhZGRyZXNzOiAwMDAwIHh4eHggMDAwMCB4eHh4DQo+PiBOb2RlIDEgYWRkcmVzczogeHh4eCAx
MTExIHh4eHggMTExMQ0KPj4NCj4+IE5vdGU6DQo+PiAgIC0gTWVtb3J5IGZyb20gbG93IHRvIGhp
Z2gNCj4+ICAgLSAwLzE6IE5vZGUgaWQNCj4+ICAgLSB4OiBJbnZhbGlkIG1lbW9yeSBvZiBhIG5v
ZGUNCj4+DQo+PiBXaGVuIG1tIHByb2JlcyB0aGUgbWVtb3J5IG1hcCwgd2l0aG91dCBDT05GSUdf
Tk9ERVNfU1BBTl9PVEhFUl9OT0RFUw0KPj4gY29uZmlnLCBtbSBvbmx5IGNoZWNrcyB0aGUgbWVt
b3J5IHZhbGlkaXR5IGJ1dCBub3QgdGhlIG5vZGUgaWQuDQo+PiBCZWNhdXNlIG9mIHRoYXQsIE5v
ZGUgMSBhbHNvIGRldGVjdHMgdGhlIG1lbW9yeSBmcm9tIG5vZGUgMCBhcyBiZWxvdw0KPj4gd2hl
biBpdCBzY2FucyBmcm9tIHRoZSBzdGFydCBhZGRyZXNzIHRvIHRoZSBlbmQgYWRkcmVzcyBvZiBu
b2RlIDEuDQo+Pg0KPj4gTm9kZSAwIGFkZHJlc3M6IDAwMDAgeHh4eCB4eHh4IHh4eHgNCj4+IE5v
ZGUgMSBhZGRyZXNzOiB4eHh4IDExMTEgMTExMSAxMTExDQo+Pg0KPj4gVGhpcyBsYXlvdXQgY291
bGQgb2NjdXIgb24gYW55IGFyY2hpdGVjdHVyZS4gVGhpcyBwYXRjaCBlbmFibGVzDQo+PiBDT05G
SUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUyBieSBkZWZhdWx0IGZvciBOVU1BIHRvIGZpeCB0aGlz
IGlzc3VlLg0KPiANCj4gWWVzIGl0IGNhbiBvY2N1ciBvbiBhbnkgYXJjaCBidXQgbW9zdCBzYW5l
IHBsYXRmb3JtcyBzaW1wbHkgZG8gbm90DQo+IG92ZXJsYXAgcGh5c2ljYWwgcmFuZ2VzLiBTbyBJ
IGRvIG5vdCByZWFsbHkgc2VlIGFueSByZWFzb24gdG8NCj4gdW5jb25kaXRpb25hbGx5IGVuYWJs
ZSB0aGUgY29uZmlnIGZvciBldmVyeWJvZHkuIFdoYXQgaXMgYW4gYWR2YW50YWdlPw0KPiANCg0K
QXMgSSBvYnNlcnZlZCBmcm9tIGFyY2ggZm9sZGVyLCB0aGVyZSBhcmUgOSBhcmNoIHN1cHBvcnQg
TlVNQSBjb25maWcuDQoNCi4vYXJjaC9pYTY0L0tjb25maWc6Mzg3OmNvbmZpZyBOVU1BDQouL2Fy
Y2gvcG93ZXJwYy9LY29uZmlnOjU4Mjpjb25maWcgTlVNQQ0KLi9hcmNoL3NwYXJjL0tjb25maWc6
MjgxOmNvbmZpZyBOVU1BDQouL2FyY2gvYWxwaGEvS2NvbmZpZzo1NTc6Y29uZmlnIE5VTUENCi4v
YXJjaC9zaC9tbS9LY29uZmlnOjExMjpjb25maWcgTlVNQQ0KLi9hcmNoL2FybTY0L0tjb25maWc6
ODQxOmNvbmZpZyBOVU1BDQouL2FyY2gveDg2L0tjb25maWc6MTUzMTpjb25maWcgTlVNQQ0KLi9h
cmNoL21pcHMvS2NvbmZpZzoyNjQ2OmNvbmZpZyBOVU1BDQouL2FyY2gvczM5MC9LY29uZmlnOjQ0
MTpjb25maWcgTlVNQQ0KDQpBbmQgdGhlcmUgYXJlIDUgYXJjaCBlbmFibGVzIENPTkZJR19OT0RF
U19TUEFOX09USEVSX05PREVTIHdpdGggTlVNQQ0KDQphcmNoL3Bvd2VycGMvS2NvbmZpZzo2Mzc6
Y29uZmlnIE5PREVTX1NQQU5fT1RIRVJfTk9ERVMNCmFyY2gvc3BhcmMvS2NvbmZpZzoyOTk6Y29u
ZmlnIE5PREVTX1NQQU5fT1RIRVJfTk9ERVMNCmFyY2gveDg2L0tjb25maWc6MTU3NTpjb25maWcg
Tk9ERVNfU1BBTl9PVEhFUl9OT0RFUw0KYXJjaC9zMzkwL0tjb25maWc6NDQ2OmNvbmZpZyBOT0RF
U19TUEFOX09USEVSX05PREVTDQphcmNoL2FybTY0ICh3aGljaCBJIGludGVuZGVkIHRvIGVuYWJs
ZSBpbiB0aGUgb3JpZ2luYWwgcGF0Y2gpDQoNCkl0IHdvdWxkIGJlIGdvb2QgaWYgd2UgY2FuIGVu
YWJsZSBpdCBieS1kZWZhdWx0LiBPdGhlcndpc2UsIGxldCBhcmNoIA0KZW5hYmxlcyBpdCBieSB0
aGVtLXNlbGYuIERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucz8NCg0KVGhhbmtzDQpIb2FuDQoN
Cg0K
