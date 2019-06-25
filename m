Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134155C3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 01:25:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YMhz0y5czDqZP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 09:25:39 +1000 (AEST)
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
 header.i=@amperemail.onmicrosoft.com header.b="Rl/Q2B6B"; 
 dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720105.outbound.protection.outlook.com [40.107.72.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YLTK3L1nzDqWf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 08:30:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector2-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3rqni2+BLAWAkiseDRe74ptX2Ks3iYXUV0ZtHgUjrU=;
 b=Rl/Q2B6BOJG/TkTKCuTvKS9PnTIms5jlnCSKlNJViSOyYTR0d7HNFJKbBSVsSYLtMkSGiOsVS3mBoLv9iHKCSXds5zA3AsiZ28xPJaeRxWgIWJiinHC/EHHCMnCqTeugbnthjhkOS4rK++ELOGHkH6Ue5IJYSkScbD06F/qfJkA=
Received: from DM6PR01MB4090.prod.exchangelabs.com (20.176.104.151) by
 DM6PR01MB5308.prod.exchangelabs.com (20.177.220.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 22:30:22 +0000
Received: from DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3]) by DM6PR01MB4090.prod.exchangelabs.com
 ([fe80::f0f2:16e1:1db7:ccb3%7]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 22:30:22 +0000
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
Subject: [PATCH 0/5] Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA
Thread-Topic: [PATCH 0/5] Enable CONFIG_NODES_SPAN_OTHER_NODES by default for
 NUMA
Thread-Index: AQHVK6WT5IKFNhd5LECqV06L4uyCQA==
Date: Tue, 25 Jun 2019 22:30:22 +0000
Message-ID: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
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
x-ms-office365-filtering-correlation-id: 8a4e6c9e-b057-4523-802f-08d6f9bcb5ad
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR01MB5308; 
x-ms-traffictypediagnostic: DM6PR01MB5308:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR01MB530847C909F7927B6CFFC24BF1E30@DM6PR01MB5308.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(39840400004)(346002)(396003)(199004)(189003)(256004)(4326008)(53936002)(14454004)(4744005)(7736002)(52116002)(107886003)(50226002)(6486002)(6306002)(81156014)(81166006)(64756008)(8936002)(66446008)(8676002)(6436002)(110136005)(26005)(5660300002)(99286004)(66946007)(73956011)(6506007)(186003)(386003)(102836004)(66066001)(2906002)(305945005)(54906003)(2616005)(66556008)(66476007)(316002)(476003)(6512007)(1511001)(478600001)(71190400001)(3846002)(71200400001)(7416002)(6116002)(86362001)(25786009)(966005)(68736007)(486006)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5308;
 H:DM6PR01MB4090.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uUWyWIO3XYl/IvqhGgKh6nTelMB7NlG3U9P+7t/Fzet3DEau2Tp6RQicm9gCc0BEfOUGRD7LUZH+rG+CXt4x3s6NDcAOOZZV8Pq43tM6Wa0M8effNoHH13mDx3vEFWBKtoQdMSIF+RqUFM5nA1Gr6TcOU9hZwjc/TtU05ojcgkxryqgFALIFwgHH+28HH71OBd01tDTpXmKrBDjqmudCSddlB3eSnGu2kYQPT5c7Own1/wiIp3A9rdNQGIH9UVFfLK5MiNVwWbybI7FemNcIXkUEk7WjktOMEfB9S+vX2H/oeuwSlWx8OT0VLgfsBO6qKojsyBJz8ieZioaIZzXp7pazfx1vlA3nnBxrwo9+fclLsCYkfvodEjli3BCfNpIEK8103V8p33PbjGXN/xgbH2swQSa/7HoIyvvkyEbEuhk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4e6c9e-b057-4523-802f-08d6f9bcb5ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 22:30:22.4354 (UTC)
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

VGhpcyBwYXRjaCBzZXQgZW5hYmxlcyBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUyBieSBk
ZWZhdWx0DQpmb3IgTlVNQS4NCg0KVGhlIG9yaWdpbmFsIHBhdGNoIFsxXQ0KWzFdIGFybTY0OiBL
Y29uZmlnOiBFbmFibGUgTk9ERVNfU1BBTl9PVEhFUl9OT0RFUyBjb25maWcgZm9yIE5VTUENCmh0
dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2FybS1rZXJuZWwvbXNnNzM3MzA2Lmh0bWwNCg0K
SG9hbiBUcmFuICg1KToNCiAgbW06IEVuYWJsZSBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RF
UyBieSBkZWZhdWx0IGZvciBOVU1BDQogIHBvd2VycGM6IEtjb25maWc6IFJlbW92ZSBDT05GSUdf
Tk9ERVNfU1BBTl9PVEhFUl9OT0RFUw0KICB4ODY6IEtjb25maWc6IFJlbW92ZSBDT05GSUdfTk9E
RVNfU1BBTl9PVEhFUl9OT0RFUw0KICBzcGFyYzogS2NvbmZpZzogUmVtb3ZlIENPTkZJR19OT0RF
U19TUEFOX09USEVSX05PREVTDQogIHMzOTA6IEtjb25maWc6IFJlbW92ZSBDT05GSUdfTk9ERVNf
U1BBTl9PVEhFUl9OT0RFUw0KDQogYXJjaC9wb3dlcnBjL0tjb25maWcgfCA5IC0tLS0tLS0tLQ0K
IGFyY2gvczM5MC9LY29uZmlnICAgIHwgOCAtLS0tLS0tLQ0KIGFyY2gvc3BhcmMvS2NvbmZpZyAg
IHwgOSAtLS0tLS0tLS0NCiBhcmNoL3g4Ni9LY29uZmlnICAgICB8IDkgLS0tLS0tLS0tDQogbW0v
cGFnZV9hbGxvYy5jICAgICAgfCAyICstDQogNSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMzYgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi43LjQNCg0K
