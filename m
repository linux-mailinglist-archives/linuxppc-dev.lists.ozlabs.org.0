Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B388D807
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 18:25:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467w0n1C34zDqpg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.58.91; helo=7.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1197 seconds by postgrey-1.36 at bilbo;
 Thu, 15 Aug 2019 02:23:21 AEST
Received: from 7.mo178.mail-out.ovh.net (7.mo178.mail-out.ovh.net
 [46.105.58.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467vyd06PyzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 02:23:16 +1000 (AEST)
Received: from player770.ha.ovh.net (unknown [10.109.143.232])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 25A8475300
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:48:05 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 60E0C8DDB607;
 Wed, 14 Aug 2019 15:47:59 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/3] powerpc/xmon: Fix dump of XIVE interrupt under pseries
Date: Wed, 14 Aug 2019 17:47:51 +0200
Message-Id: <20190814154754.23682-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3257228433189997489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvledgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

The xmon 'dx*' commands call OPAL to query information on XIVE but
this can only be done on baremetal (PowerNV) and it crashes a pseries
machine. This little series fixes support on pseries and extend the
'dxi' command.

Thanks,

C.

Cédric Le Goater (3):
  powerpc/xmon: Check for HV mode when dumping XIVE info from OPAL
  powerpc/xive: Fix dump of XIVE interrupt under pseries
  powerpc/xmon: Add a dump of all XIVE interrupts

 arch/powerpc/include/asm/xive.h          |  2 +
 arch/powerpc/sysdev/xive/xive-internal.h |  2 +
 arch/powerpc/sysdev/xive/common.c        |  7 ++++
 arch/powerpc/sysdev/xive/native.c        | 15 +++++++
 arch/powerpc/sysdev/xive/spapr.c         | 51 ++++++++++++++++++++++++
 arch/powerpc/xmon/xmon.c                 | 50 +++++++++++++++++------
 6 files changed, 114 insertions(+), 13 deletions(-)

-- 
2.21.0

