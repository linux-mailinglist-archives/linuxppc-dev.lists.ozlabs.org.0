Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C655C4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 01:29:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YMn06Cr1zDqXY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 09:29:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.72.105;
 helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.b="lZ8VSb+R"; 
 dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720105.outbound.protection.outlook.com [40.107.72.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YLTM4VNLzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 08:30:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector2-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVMc1UvwzKEYE/uLj7StVif5ifxT2J9wxzTXdXD1F5g=;
 b=lZ8VSb+RlLhoQEdmcWBtzVpl91C+xJpmRZ3YnIFQy/Gg0/LqeoygD5tWE7fZYR5e0dJIhT1wJ8x72TAJeRFVlbuLa0BFbDaX4AOCo83OUZgdd83jIha2in5OTCZgaI7kYdkhk7S/j5sn5l8HgSG1poMGiWgw+/Nt0XgJDxOiZUU=
Received: from DM6PR01MB4090.prod.exchangelabs.com (20.176.104.151) by
 DM6PR01MB5308.prod.exchangelabs.com (20.177.220.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 22:30:27 +0000
Received: from DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3]) by DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3%7]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 22:30:27 +0000
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
Subject: [PATCH 2/5] powerpc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
Thread-Topic: [PATCH 2/5] powerpc: Kconfig: Remove
 CONFIG_NODES_SPAN_OTHER_NODES
Thread-Index: AQHVK6WWTJnZANKxsE2KcscKAErIBA==
Date: Tue, 25 Jun 2019 22:30:27 +0000
Message-ID: <1561501810-25163-3-git-send-email-Hoan@os.amperecomputing.com>
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
x-ms-office365-filtering-correlation-id: 5ba6e1f1-3d1a-4307-0689-08d6f9bcb8d1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR01MB5308; 
x-ms-traffictypediagnostic: DM6PR01MB5308:
x-microsoft-antispam-prvs: <DM6PR01MB53081BACDA24CE140BB588A7F1E30@DM6PR01MB5308.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(39840400004)(346002)(396003)(199004)(189003)(256004)(4326008)(53936002)(14454004)(4744005)(7736002)(52116002)(107886003)(50226002)(6486002)(81156014)(81166006)(64756008)(8936002)(66446008)(8676002)(6436002)(110136005)(26005)(5660300002)(99286004)(66946007)(73956011)(6506007)(76176011)(186003)(386003)(102836004)(66066001)(2906002)(446003)(305945005)(54906003)(2616005)(66556008)(66476007)(11346002)(316002)(476003)(6512007)(1511001)(478600001)(71190400001)(3846002)(71200400001)(7416002)(6116002)(86362001)(25786009)(68736007)(486006)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5308;
 H:DM6PR01MB4090.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sjRg2QAGNGTrgP8oiMR923tMhaplwfXVDB1SA44RzwpON4n9z07p4wuhQ/JA4QNhCUviGQrlU3GaqRNmshivxqx/fwDoWLjraFvXbtY2mhaj1v1I+HfSc286Cxx5Z703q8ZCdJe4CWzjFtQ9UZaEoWa/MuTBZmUdxlHhuYLxoA5PJsGj0YDh+vdmve4Y4EsL4POA6eqZpC/YbVy3yY7qn69FNbj/agNKXv0xPOUg4wjw8t/UULsy+TTeDzkG5oOv8B3Tt6Bd39lbp6kEpUVYQisS9p7eZb5kZ6eR+hEwt/MweqGR1ZLsEZ791VFk/4RDEUAqmfEjQD2j6lZF1esrkf5KVYpS10VIZVOe+zJ/OUWDP6NflXIzVeNthMn3rUct7wmA01TAHZ0syw/FHPrpHYv+ndgVXuKR/PQquZAQKGY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba6e1f1-3d1a-4307-0689-08d6f9bcb8d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 22:30:27.2766 (UTC)
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
biA8SG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KLS0tDQogYXJjaC9wb3dlcnBjL0tjb25m
aWcgfCA5IC0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KaW5k
ZXggOGMxYzYzNi4uYmRkZThiYyAxMDA2NDQNCi0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQor
KysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KQEAgLTYyOSwxNSArNjI5LDYgQEAgY29uZmlnIEFS
Q0hfTUVNT1JZX1BST0JFDQogCWRlZl9ib29sIHkNCiAJZGVwZW5kcyBvbiBNRU1PUllfSE9UUExV
Rw0KIA0KLSMgU29tZSBOVU1BIG5vZGVzIGhhdmUgbWVtb3J5IHJhbmdlcyB0aGF0IHNwYW4NCi0j
IG90aGVyIG5vZGVzLiAgRXZlbiB0aG91Z2ggYSBwZm4gaXMgdmFsaWQgYW5kDQotIyBiZXR3ZWVu
IGEgbm9kZSdzIHN0YXJ0IGFuZCBlbmQgcGZucywgaXQgbWF5IG5vdA0KLSMgcmVzaWRlIG9uIHRo
YXQgbm9kZS4gIFNlZSBtZW1tYXBfaW5pdF96b25lKCkNCi0jIGZvciBkZXRhaWxzLg0KLWNvbmZp
ZyBOT0RFU19TUEFOX09USEVSX05PREVTDQotCWRlZl9ib29sIHkNCi0JZGVwZW5kcyBvbiBORUVE
X01VTFRJUExFX05PREVTDQotDQogY29uZmlnIFNUREJJTlVUSUxTDQogCWJvb2wgIlVzaW5nIHN0
YW5kYXJkIGJpbnV0aWxzIHNldHRpbmdzIg0KIAlkZXBlbmRzIG9uIDQ0eA0KLS0gDQoyLjcuNA0K
DQo=
