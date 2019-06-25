Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79855C63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 01:34:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YMvN15FlzDqFJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 09:34:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe52::701;
 helo=nam05-by2-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.b="PNJVSrq5"; 
 dkim-atps=neutral
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YLTX41f0zDqWf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 08:30:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector2-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR5atq9Kvn/HT6403Ciiera0O5RZONj4IbbxzbUzbhs=;
 b=PNJVSrq53wFMEcbUkb+rBKJMYatCrrSmj2MzNobtszUB5hj2Vth/b4FNoB7vT7FZwCR/QGZJTJqDVIN/tu/ioC3Ua+obMqdDp9pOyShXyQ5bA7vGx7jsqmuUW9KRCgdO9QL6kc5PuLHrhJAxoaHYc0xdCZaAFCsqHNF+JaAy+To=
Received: from DM6PR01MB4090.prod.exchangelabs.com (20.176.104.151) by
 DM6PR01MB5308.prod.exchangelabs.com (20.177.220.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 22:30:34 +0000
Received: from DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3]) by DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3%7]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 22:30:34 +0000
From: Hoan Tran OS <hoan@os.amperecomputing.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Michal
 Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador
 <osalvador@suse.de>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Alexander Duyck
 <alexander.h.duyck@linux.intel.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin"
 <hpa@zytor.com>, "David S . Miller" <davem@davemloft.net>, Heiko Carstens
 <heiko.carstens@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 5/5] s390: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Topic: [PATCH 5/5] s390: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Index: AQHVK6WaFJpFUz0LxkyiSb0RwDiB0g==
Date: Tue, 25 Jun 2019 22:30:34 +0000
Message-ID: <1561501810-25163-6-git-send-email-Hoan@os.amperecomputing.com>
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
In-Reply-To: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR22CA0052.namprd22.prod.outlook.com
 (2603:10b6:903:ae::14) To DM6PR01MB4090.prod.exchangelabs.com
 (2603:10b6:5:2a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [4.28.12.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94260bc5-6779-4195-4197-08d6f9bcbd01
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR01MB5308; 
x-ms-traffictypediagnostic: DM6PR01MB5308:
x-microsoft-antispam-prvs: <DM6PR01MB5308BE2C2C64072EBD3A384FF1E30@DM6PR01MB5308.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(1496009)(376002)(366004)(136003)(346002)(39850400004)(396003)(199004)(189003)(256004)(4326008)(53936002)(14454004)(4744005)(7736002)(52116002)(107886003)(50226002)(6486002)(81156014)(81166006)(64756008)(8936002)(66446008)(8676002)(6436002)(110136005)(26005)(5660300002)(99286004)(66946007)(73956011)(6506007)(76176011)(186003)(386003)(102836004)(66066001)(2906002)(446003)(305945005)(54906003)(2616005)(66556008)(66476007)(11346002)(316002)(476003)(6512007)(1511001)(478600001)(71190400001)(3846002)(71200400001)(7416002)(6116002)(86362001)(25786009)(68736007)(486006)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5308;
 H:DM6PR01MB4090.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GSuHyiAFzoB+d5Mz6ITaue+2ZU9Ek9+vBzZeNR8aJzm92J79Aq8uYHSjt3YK4GpsrdpH6z+4r8fVFt0I98L3jgZTKScoDtOsOg6fRsatO1urmA5ZhVV/CHZEnD/J2Y4HPRwZB1lN5GeqpU7AaKHT47kPa83tYp3sKjDFXZVGhPCPiFxElPGBqnEZy5gjFw3iR1KpjZCDheS6DvzS3ZIb6DbZSE0eZjkUwy01kWI9zGH8BHhIJ5zXs9TXqqsExXljs58PZjYm5Mo2ABlcyXIN1HdFSYTzbpvvhOYScbc6sbDvDvqiiST7uwKoy0tBO319wlKBg7mAndwf5UiaJojOe82qcZKkNqOYLs42MA21KRiYYdiCgxTRZ/O472EH7osVWXDxGKgGwsDLZpWJ10z43tiygTOQkQ0D/HLQ6OvbiAo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94260bc5-6779-4195-4197-08d6f9bcbd01
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 22:30:34.3305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5308
X-Mailman-Approved-At: Wed, 26 Jun 2019 09:22:23 +1000
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Hoan Tran OS <hoan@os.amperecomputing.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhpcyBwYXRjaCByZW1vdmVzIENPTkZJR19OT0RFU19TUEFOX09USEVSX05PREVTIGFzIGl0J3MN
CmVuYWJsZWQgYnkgZGVmYXVsdCB3aXRoIE5VTUEuDQoNClNpZ25lZC1vZmYtYnk6IEhvYW4gVHJh
biA8SG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KLS0tDQogYXJjaC9zMzkwL0tjb25maWcg
fCA4IC0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9hcmNoL3MzOTAvS2NvbmZpZyBiL2FyY2gvczM5MC9LY29uZmlnDQppbmRleCAxMDkyNDNm
Li43ODhhOGU5IDEwMDY0NA0KLS0tIGEvYXJjaC9zMzkwL0tjb25maWcNCisrKyBiL2FyY2gvczM5
MC9LY29uZmlnDQpAQCAtNDM4LDE0ICs0MzgsNiBAQCBjb25maWcgSE9UUExVR19DUFUNCiAJICBj
YW4gYmUgY29udHJvbGxlZCB0aHJvdWdoIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdSMuDQog
CSAgU2F5IE4gaWYgeW91IHdhbnQgdG8gZGlzYWJsZSBDUFUgaG90cGx1Zy4NCiANCi0jIFNvbWUg
TlVNQSBub2RlcyBoYXZlIG1lbW9yeSByYW5nZXMgdGhhdCBzcGFuDQotIyBvdGhlciBub2Rlcy4J
RXZlbiB0aG91Z2ggYSBwZm4gaXMgdmFsaWQgYW5kDQotIyBiZXR3ZWVuIGEgbm9kZSdzIHN0YXJ0
IGFuZCBlbmQgcGZucywgaXQgbWF5IG5vdA0KLSMgcmVzaWRlIG9uIHRoYXQgbm9kZS4JU2VlIG1l
bW1hcF9pbml0X3pvbmUoKQ0KLSMgZm9yIGRldGFpbHMuIDwtIFRoZXkgbWVhbnQgbWVtb3J5IGhv
bGVzIQ0KLWNvbmZpZyBOT0RFU19TUEFOX09USEVSX05PREVTDQotCWRlZl9ib29sIE5VTUENCi0N
CiBjb25maWcgTlVNQQ0KIAlib29sICJOVU1BIHN1cHBvcnQiDQogCWRlcGVuZHMgb24gU01QICYm
IFNDSEVEX1RPUE9MT0dZDQotLSANCjIuNy40DQoNCg==
