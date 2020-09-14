Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA26E26977A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 23:13:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqzcX4MM3zDqQW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 07:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqzXV2PQXzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 07:10:16 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id E1E596192E8D;
 Mon, 14 Sep 2020 23:10:09 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 14 Sep
 2020 23:10:08 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006021c09b0-42e0-4a5b-a777-5bfb7f5a8969,
 D669A8CAADBA69FE96853FFB68FF36F34E8DD5E5) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/7] powerpc: Fix a few W=1 compile warnings
Date: Mon, 14 Sep 2020 23:10:00 +0200
Message-ID: <20200914211007.2285999-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d7fd643f-d40c-4316-b2f7-b58d7d4c3f2e
X-Ovh-Tracer-Id: 15866462963657640928
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Here is a small contribution improving compile with W=1.	

Thanks,

C.

Changes in v2:

 - Better commit logs
 - Reworked early_reserve_mem() in prom
 - Remove if statement in sstep

Cédric Le Goater (7):
  powerpc/sysfs: Remove unused 'err' variable in
    sysfs_create_dscr_default()
  powerpc/prom: Introduce early_reserve_mem_old()
  powerpc/sstep: Remove empty if statement checking for invalid form
  powerpc/xive: Make debug routines static
  powerpc/powernv/pci: Remove unused variable 'parent' in
    pnv_ioda_configure_pe()
  powerpc/perf: Remove unused variable 'target' in
    trace_imc_event_init()
  powerpc/32: Declare stack_overflow_exception() prototype

 arch/powerpc/include/asm/asm-prototypes.h |  1 +
 arch/powerpc/kernel/prom.c                | 37 ++++++++++++-----------
 arch/powerpc/kernel/sysfs.c               |  3 +-
 arch/powerpc/lib/sstep.c                  |  9 ++++--
 arch/powerpc/perf/imc-pmu.c               |  3 --
 arch/powerpc/platforms/powernv/pci-ioda.c |  8 -----
 arch/powerpc/sysdev/xive/common.c         |  4 +--
 7 files changed, 30 insertions(+), 35 deletions(-)

-- 
2.25.4

