Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F84578F746
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 04:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcMmR1V94z3c2L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 12:43:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcMlt0xbkz2yVm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 12:43:16 +1000 (AEST)
X-QQ-mid: bizesmtp74t1693536160toaj6r1k
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Sep 2023 10:42:37 +0800 (CST)
X-QQ-SSF: 01200000000000907000000A0000000
X-QQ-FEAT: Q4gfBD3K7t8LHx8FTZT7R0pzOr2xQ6PVUi1NqX923gFepa7VKzyhODmAnf/j0
	FFzWi/HfxQmD+/itG5KD65p28ioecp5k/AJ+x1vHkVpR/b5F0y7QQvib9awrU1wl1sKPmgR
	DGcWYU0UGPPOFXS0wtLkBVDtTntXGwDgSJYX2GGowmoGMr6K4cFE9c9WYMhLDQQfrnqjY4F
	Zz2mRZtdE0ujBac9ry3WNOT8lOQbTUrLOs6YLl9H9jMnB89w1yfbN+4wILm134/jMTdE/k0
	gEvzTPdgjWMiPXf+dfGlNIRjeKO3tZEQZmPMyn5OocSfuJPkfkpla+lAgDMxG5FeEuR626H
	Pz0sgpL5DCfb6CCkwJ452J6ANiL5/P1yKGEH0dvVSFZT1JEi58=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14128962257822734387
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mingo@redhat.com,
	tsbogend@alpha.franken.de,
	hdegoede@redhat.com
Subject: [PATCH v2 0/3] Add dependencies of POWER_RESET for MIPS Malta, x86, and PowerMac
Date: Fri,  1 Sep 2023 10:42:36 +0800
Message-Id: <cover.1693535514.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux@weissschuh.net, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu, Yuan Tan <tanyuan@tinylab.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These patches are to add dependencies of POWER_RESET for MIPS Malta, x86,
and PowerMac.

I am really sorry I forget to use --thread in v1[1] as I stayed up too
late. So here I am resending v2 patch with a mirror fix and
consolidating them into a thread.

To simplify the enablement of the poweroff support, selecting the
required options for CONFIG_POWER_RESET=y may make many people happy
especially when they are using a customized config (maybe tinyconfig
based) for a target qemu board. Without normal poweroff support from the
kernel side, qemu will simply hang[2] there after a 'poweroff' command,
which is a very bad experience for the automatical tests.

Currently, based on tinyconfig, it is very hard to find the exact
poweroff options[3]. Some architectures' poweroff works well without
any dependence, the others' poweroff options are hidden deeply, which
make things hard.

After multiple verifications, these options have been identified as the
minimum dependencies required for poweroff to function normally.

Zhangjin and I invested a significant amount of time in searching for
the current options on these devices. We hope that this set of patches
will save time for others. If community like it, we will consider adding
dependencies for POWER_RESET on other devices.

---
[1]: https://lore.kernel.org/lkml/20230831201727.3177853-1-tanyuan@tinylab.org/
[2]: https://lore.kernel.org/lkml/511b2f6009fb830b3f32b4be3dca99596c684fa3.1689759351.git.falcon@tinylab.org/
[3]: https://lore.kernel.org/all/983843582e52e83fba79ad45cea6c79e1f62ec6c.1690489039.git.falcon@tinylab.org/

---
Changes since v1:
- Fix the mistake of using spaces instead of tabs in kconfig.

Yuan Tan (3):
  kconfig: add dependencies of POWER_RESET for mips malta
  kconfig: add dependencies of POWER_RESET for x86
  kconfig: add dependencies of POWER_RESET for PowerMac

 arch/mips/Kconfig                       | 3 +++
 arch/powerpc/platforms/powermac/Kconfig | 1 +
 arch/x86/Kconfig                        | 2 ++
 3 files changed, 6 insertions(+)

-- 
2.34.1

