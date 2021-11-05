Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C9446237
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 11:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlxgY5hLxz30RK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.45.231; helo=8.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 338 seconds by postgrey-1.36 at boromir;
 Fri, 05 Nov 2021 21:32:25 AEDT
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net
 [46.105.45.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hlxf11s2nz3bWX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 21:32:24 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5AC4F21032;
 Fri,  5 Nov 2021 10:26:38 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 11:26:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0030e5b51ee-fe24-4d88-b4f1-ef26b7e503cd,
 ACBEE74C211706A3681C4B00B96A7A61B931BAD7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 00/11] powerpc/xive: Improve diagnostic and activate StoreEOI
 on P10 PowerNV
Date: Fri, 5 Nov 2021 11:26:25 +0100
Message-ID: <20211105102636.1016378-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 402902e2-b9a4-4c2c-9f9d-4c832b14fcfb
X-Ovh-Tracer-Id: 494833010544184285
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This series tries to improve diagnostic support in the XIVE driver. It
adds pr_debug() primitives that can be activated at run-time and changes
the debugfs xive entry to expose more information :

  /sys/kernel/debug/powerpc/xive/
    ├── eqs/
    │   ├── cpu0
    │   ├── cpu1
    │   ├── cpu2
    .   .
    │   └── cpu99
    ├── interrupts
    ├── ipis
    ├── save-restore
    └── store-eoi

It also introduces 2 new kernel parameters :

    xive.store-eoi=off   to deactivate StoreEOI at boot but it still be
    			 reactivated through sysfs.
			 
    doorbell=off         to deactivate doorbells for CPU IPIs
                         and XIVE instead

The first is a workaround in case of a FW advertising the wrong
feature. It can be used to check performance also. The second is for
PowerVM development and tests when the LP-per-thread mode is
activated. Doorbells cannot be used in that case.

Finally, it activates StoreEOI support for the PowerNV platform. OPAL
for P10 has been released and we are free to use this extension.

Thanks,

C.


Cédric Le Goater (11):
  powerpc/xive: Replace pr_devel() by pr_debug() to ease debug
  powerpc/xive: Introduce an helper to print out interrupt
    characteristics
  powerpc/xive: Activate StoreEOI on P10
  powerpc/xive: Introduce xive_core_debugfs_create()
  powerpc/xive: Change the debugfs file 'xive' into a directory
  powerpc/xive: Rename the 'cpus' debugfs file to 'ipis'
  powerpc/xive: Add a debugfs file to dump EQs
  powerpc/xive: Add a debugfs toggle for StoreEOI
  powerpc/xive: Add a kernel parameter for StoreEOI
  powerpc/xive: Add a debugfs toggle for save-restore
  powerpc/smp: Add a doorbell=off kernel parameter

 arch/powerpc/include/asm/dbell.h              |   1 +
 arch/powerpc/include/asm/opal-api.h           |   1 +
 arch/powerpc/sysdev/xive/xive-internal.h      |   1 +
 arch/powerpc/kernel/dbell.c                   |  17 ++
 arch/powerpc/platforms/powernv/smp.c          |   7 +-
 arch/powerpc/platforms/pseries/smp.c          |   3 +
 arch/powerpc/sysdev/xive/common.c             | 211 ++++++++++++------
 arch/powerpc/sysdev/xive/native.c             |   4 +-
 arch/powerpc/sysdev/xive/spapr.c              |  38 ++--
 .../admin-guide/kernel-parameters.txt         |  16 ++
 10 files changed, 209 insertions(+), 90 deletions(-)

-- 
2.31.1

