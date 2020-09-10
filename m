Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BD26524C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:14:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnWq15CkRzDqkC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:14:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnWYx3629zDqh3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:02:59 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id B2650603F5F3;
 Thu, 10 Sep 2020 23:02:53 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Sep
 2020 23:02:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d4c8401b-9bff-41b3-a517-02ceadfe2a05,
 8FE11AEDAF16247B821E16C08928A26F58BE1972) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/7] powerpc: Fix a few W=1 compile warnings
Date: Thu, 10 Sep 2020 23:02:43 +0200
Message-ID: <20200910210250.1962595-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f4e652df-ca7c-43ad-8e2c-213c1f6b9d6d
X-Ovh-Tracer-Id: 10699708292865297373
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Here is a small contribution on improving compile with W=1.	

Thanks,

C.

Cédric Le Goater (7):
  powerpc/sysfs: Fix W=1 compile warning
  powerpc/prom: Fix W=1 compile warning
  powerpc/sstep: Fix W=1 compile warning
  powerpc/xive: Fix W=1 compile warning
  powerpc/powernv/pci: Fix W=1 compile warning
  powerpc/perf: Fix W=1 compile warning
  powerpc/32: Fix W=1 compile warning

 arch/powerpc/include/asm/asm-prototypes.h |  1 +
 arch/powerpc/kernel/prom.c                | 51 ++++++++++++-----------
 arch/powerpc/kernel/sysfs.c               |  3 +-
 arch/powerpc/lib/sstep.c                  |  3 +-
 arch/powerpc/perf/imc-pmu.c               |  3 --
 arch/powerpc/platforms/powernv/pci-ioda.c |  8 ----
 arch/powerpc/sysdev/xive/common.c         |  4 +-
 7 files changed, 32 insertions(+), 41 deletions(-)

-- 
2.25.4

