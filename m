Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E41362C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 01:29:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wpJJ52sszDqc1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 09:29:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.7.50; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=jgg@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="hn6dY7g7";
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wpGl43p5zDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 09:28:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMqWUI2G/ksOaJmStmpjJCrxAv/NkatFY6m2td/HHaE=;
 b=hn6dY7g7Ps9UCNFhsY1boaR3VUt/n7cy460xSr+3PAwdvL0zzHqQ1JbPNoK8xhKIV2fM+mF+b7Lq4bRKmrTmlqXa0MQKyc5mU59HdywJ4/6f5aKrNIC6S9GV+PucrqLLkRecvIbiXz3M3c+bGZSCH5Fym7aWjP0NVQ7utHKg1pk=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3357.eurprd05.prod.outlook.com (10.170.238.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 23:28:22 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::711b:c0d6:eece:f044]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::711b:c0d6:eece:f044%5]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 23:28:22 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Subject: Re: [PATCH] mm: add account_locked_vm utility function
Thread-Topic: [PATCH] mm: add account_locked_vm utility function
Thread-Index: AQHVAe2ZLngO8JYpNki+X4vS/Cz1vqZaC+sA
Date: Fri, 3 May 2019 23:28:22 +0000
Message-ID: <20190503232818.GA5182@mellanox.com>
References: <20190503201629.20512-1-daniel.m.jordan@oracle.com>
In-Reply-To: <20190503201629.20512-1-daniel.m.jordan@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:208:d4::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [65.119.211.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbafa94b-6447-4be8-56b3-08d6d01f0818
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3357; 
x-ms-traffictypediagnostic: VI1PR05MB3357:
x-microsoft-antispam-prvs: <VI1PR05MB33578A2BC54EF9B341D8F7FDCF350@VI1PR05MB3357.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(186003)(8936002)(6916009)(53936002)(11346002)(446003)(316002)(2906002)(2616005)(6246003)(386003)(7736002)(305945005)(6506007)(26005)(66946007)(66446008)(1076003)(33656002)(5660300002)(66476007)(66556008)(64756008)(73956011)(15650500001)(4326008)(102836004)(81156014)(36756003)(25786009)(3846002)(6116002)(99286004)(6486002)(66066001)(86362001)(52116002)(7416002)(14454004)(6436002)(486006)(68736007)(71200400001)(54906003)(476003)(229853002)(71190400001)(6512007)(81166006)(76176011)(14444005)(478600001)(256004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3357;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9MggK/iMBpnv+TQWX1Y6xFTS5HHusO1C0bnxQyn7vZkFZN8dPKUOJIgFo1LMg2KiSdlVm3+U697HF0tSDf0Y17UeKgOKYd8UFLsizzRP7FxW4JzMD7jl4Wnj7gtZHqG6M7RigUH1tIHPMa48M/V3ENKTCWYrrNqKODknwq2+en4Y44Cdn50yhM8stLsiKRDaE40HKhXlMlxzDgtgyJE0UgPHQ1oW2z2MlzBhdBQlLg54fr/TNvn8Z8xOOmjwVb9FYypHcfiKt83xiQO6SwqPhMK49lWiFmgh7561E55Wqv4nDpj7YIn6c9UxWwMI/dpwqVvXnsoKUfNRXxCGgj9ouQIm5UEH0rhZPqvhfHoOEyfqkLEXCCXuo+9/QYi7kmvytl85Kgih04VuzfSUJgFA/DQJYi2wupIPY1g136PN0ss=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6BC684B50DAD6D4A8D031B0B8F7E32C4@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbafa94b-6447-4be8-56b3-08d6d01f0818
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 23:28:22.2133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3357
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
Cc: Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Alan Tull <atull@kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Steve Sistare <steven.sistare@oracle.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Lameter <cl@linux.com>, Wu Hao <hao.wu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2019 at 01:16:30PM -0700, Daniel Jordan wrote:
> locked_vm accounting is done roughly the same way in five places, so
> unify them in a helper.  Standardize the debug prints, which vary
> slightly.  Error codes stay the same, so user-visible behavior does too.
>=20
> Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
> Cc: Alan Tull <atull@kernel.org>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: Jason Gunthorpe <jgg@mellanox.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Moritz Fischer <mdf@kernel.org>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Steve Sistare <steven.sistare@oracle.com>
> Cc: Wu Hao <hao.wu@intel.com>
> Cc: linux-mm@kvack.org
> Cc: kvm@vger.kernel.org
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-fpga@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>=20
> Based on v5.1-rc7.  Tested with the vfio type1 driver.  Any feedback
> welcome.
>=20
> Andrew, this one patch replaces these six from [1]:
>=20
>     mm-change-locked_vms-type-from-unsigned-long-to-atomic64_t.patch
>     vfio-type1-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     vfio-spapr_tce-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     fpga-dlf-afu-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     kvm-book3s-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>     powerpc-mmu-drop-mmap_sem-now-that-locked_vm-is-atomic.patch
>=20
> That series converts locked_vm to an atomic, but on closer inspection cau=
ses at
> least one accounting race in mremap, and fixing it just for this type
> conversion came with too much ugly in the core mm to justify, especially =
when
> the right long-term fix is making these drivers use pinned_vm instead.

Did we ever decide what to do here? Should all these drivers be
switched to pinned_vm anyhow?

Jason
