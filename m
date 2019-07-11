Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2466239
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 01:27:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lC0C10FszDql8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 09:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.74.135;
 helo=nam01-bn3-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.b="ZTvaGg4y"; dkim-atps=neutral
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740135.outbound.protection.outlook.com [40.107.74.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lBxp25TmzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 09:25:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ts6L8iLdOURp8b9hazYgG2uO0Xw6IDj8MpvvOFuz4kKBismBdl9r0KTooSN4anHm/eBPGsAnOdJ56JdDCseXvTP5Av8bj4BkYQtRqjks4zt3SLYl1rdXLqkoMfrxKicwo2QFlKOVpOBwlotIqVQ1dXur84D3gfkP3dTNwJZiPZjk3/FBrc7+ZPH8+qrE6hP23NBn2M/mDk2LgorSbNQbKZgxaP+ebMFK2PfmJywIJA47227WckZxtXQNcbCuK7G6k89lHp6CGYmfqJX8LZ9De4EUXG0Zj3PGh7FFormcYfOSkjMuqEecxVKwyDaP6+Ppb++thXzeyAxkZkr9b1jhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xULxKrwm/DZUk8Kcvcen9hZoezlHQR4cyK84iGsY8ZY=;
 b=hqRlh6qKsH4+CajtYrm7ZHmJwnM/SPVgYw0tVK0YwaDt+Mx8e/ZZNmG027PnNnqZoJQpDaTTqrOrsqqPyonEAez/OQ+CDBmWvFdShfJtj/tDRviwdj1qBb6lpYCHmuAM7QXTEBvBATZLCzLMwZ2Avjwx7JcNykT/AoJT7q++LjOOhpD/Flf90G047hjXizWlql5yuMz2YFF0PAc7mKviML7F6K/iDOUx5cykmD2OsKvJOwZPtn87ayzv+zV4OPjhifNNEFGgWbn2BhOMjydVwiKiQpNHENWXPmXiG90bm4+5D7b8qtvQDmVrbbiUAH+CSq/ZxJfYMagKrb0ogfbHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=os.amperecomputing.com;dmarc=pass action=none
 header.from=os.amperecomputing.com;dkim=pass
 header.d=os.amperecomputing.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xULxKrwm/DZUk8Kcvcen9hZoezlHQR4cyK84iGsY8ZY=;
 b=ZTvaGg4yvmBsUMWLWTgr/fJWYWY5FDRZXzMIodPPFSejtCyuJVM538sQU7Pes1yrn5i9QbVxDWZmPfudPuh/jrZOr4ZKPfhJ3qwmKu7AqCJ7ILxklZEO86dBZrr4FR0mC4ZO9BbFguRKO36lxkmfNuoXrx/jVhD1KqPmJqxV3ZI=
Received: from BYAPR01MB4085.prod.exchangelabs.com (52.135.237.22) by
 BYAPR01MB5557.prod.exchangelabs.com (20.179.88.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 23:25:44 +0000
Received: from BYAPR01MB4085.prod.exchangelabs.com
 ([fe80::9dbb:1b4c:bace:ef80]) by BYAPR01MB4085.prod.exchangelabs.com
 ([fe80::9dbb:1b4c:bace:ef80%7]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 23:25:44 +0000
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
Subject: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default
 for NUMA
Thread-Topic: [PATCH v2 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Thread-Index: AQHVOD/24o0J5njgPEqkosNO5sbs8Q==
Date: Thu, 11 Jul 2019 23:25:44 +0000
Message-ID: <1562887528-5896-1-git-send-email-Hoan@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR19CA0045.namprd19.prod.outlook.com
 (2603:10b6:903:103::31) To BYAPR01MB4085.prod.exchangelabs.com
 (2603:10b6:a03:56::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [4.28.12.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35488193-dd56-4657-ba35-08d706571887
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR01MB5557; 
x-ms-traffictypediagnostic: BYAPR01MB5557:
x-microsoft-antispam-prvs: <BYAPR01MB5557DB615599B0BCAFAAF8C8F1F30@BYAPR01MB5557.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(189003)(199004)(52116002)(66476007)(66556008)(66946007)(64756008)(66446008)(14454004)(5660300002)(1511001)(6506007)(386003)(71190400001)(71200400001)(6436002)(53936002)(66066001)(102836004)(25786009)(68736007)(6512007)(86362001)(3846002)(14444005)(2616005)(186003)(81166006)(26005)(2906002)(478600001)(4326008)(6486002)(7736002)(305945005)(54906003)(8936002)(110136005)(7416002)(6116002)(99286004)(476003)(316002)(8676002)(107886003)(81156014)(486006)(256004)(50226002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR01MB5557;
 H:BYAPR01MB4085.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LaK2A6JxGVhN9BP+NPmg4P7C+zX5H8qaEDrDEH1OTjGQyXaBI5hT6402K1LX9xPmNoq5oazMmY5arw0GLdnB8GENa/z7AO8Fs7GZtGflMJ4K0wNWFA+m0N0Mz3nNlsTCTmI7tEHP/Lt4+fjddSbZqgAAB9tWq9DpoCpY37T9KsWkEjIECCTtd0s9UQbEi6LvJL5mDutuWokU8Dqx2ATzmqbVFkAGuPjikJIfg/waU+JNVOjIrJS4u+qv3sZGOEZj8wDk1k+y81I6mT56n1mFVvGPwPz5y1CngGy1IBplFtE5Or4yI/J+qkstT0b147auTth+wsUDMPHhdxTnqGw8qnOuBqTJLkWoROmKArfnOr6ICga33jlPOOyiOcsxABVWVCkKVVATxbPp2vHVAeBoa0pIKIea2AicjYztHzcutgQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35488193-dd56-4657-ba35-08d706571887
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 23:25:44.3751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hoan@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5557
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

In NUMA layout which nodes have memory ranges that span across other nodes,
the mm driver can detect the memory node id incorrectly.

For example, with layout below
Node 0 address: 0000 xxxx 0000 xxxx
Node 1 address: xxxx 1111 xxxx 1111

Note:
 - Memory from low to high
 - 0/1: Node id
 - x: Invalid memory of a node

When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
config, mm only checks the memory validity but not the node id.
Because of that, Node 1 also detects the memory from node 0 as below
when it scans from the start address to the end address of node 1.

Node 0 address: 0000 xxxx xxxx xxxx
Node 1 address: xxxx 1111 1111 1111

This layout could occur on any architecture. This patch enables
CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA to fix this issue.

V2:
 * Revise the patch description

Hoan Tran (5):
  mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA
  powerpc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
  x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
  sparc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
  s390: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES

 arch/powerpc/Kconfig | 9 ---------
 arch/s390/Kconfig    | 8 --------
 arch/sparc/Kconfig   | 9 ---------
 arch/x86/Kconfig     | 9 ---------
 mm/page_alloc.c      | 2 +-
 5 files changed, 1 insertion(+), 36 deletions(-)

--=20
2.7.4

