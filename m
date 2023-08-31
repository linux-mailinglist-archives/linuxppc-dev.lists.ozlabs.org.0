Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F378F3E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 22:21:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcCH86PQwz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 06:21:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcCFV3xPXz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 06:19:58 +1000 (AEST)
X-QQ-mid: bizesmtp80t1693513054tfheb4kk
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 01 Sep 2023 04:17:31 +0800 (CST)
X-QQ-SSF: 01200000000000907000B00A0000000
X-QQ-FEAT: zT6n3Y95oi2JZhQOJPJkow3+Z1z8O+aKI4VLH+g5LEAEDXda4seSdGQIPMUTJ
	2MqnaBQTMGrp52orgxZuFCDsSVgNcRMCmODohotYW4kejOvH3DXUcKjB+CsUWTgYLVyrqDj
	SZJZhd7AlReP2Nj/umbKaMNMutVbb0QESpSaOfm85HGE1V+fdMnh7VJVxpaqxxhljoR5biq
	gM0BiLC8BhCw60DCjSWK6PjlURr3JmPqIGJJ4ZXheCylIF5I6IIsqj1/QpCmMIWYkR+qAth
	xYNCq/tnRWcEKuYJcPXhiUqM99WMxMBj/g77TwWXASvPM94nROO5F1u1C0Z8flhZk6Zxtj4
	7eklrvxyFlOYFN2mN12a+Wc3AhH4Q==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9549962173314934248
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	tglx@linutronix.de,
	mingo@redhat.com,
	tsbogend@alpha.franken.de,
	hdegoede@redhat.com
Subject: [PATCH v1 0/3] Add dependencies of POWER_RESET for MIPS Malta, x86, and PowerMac.
Date: Fri,  1 Sep 2023 04:17:27 +0800
Message-Id: <20230831201727.3177853-1-tanyuan@tinylab.org>
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

These patches is to add dependencies of POWER_RESET for MIPS Malta, x86,
and PowerMac.

To simplify the enablement of the poweroff support, selecting the
required options for CONFIG_POWER_RESET=y may make many people
happyespecially when they are using a customized config (maybe
tinyconfigbased) for a target qemu board. Without normal poweroff
support from the kernel side, qemu will simply hang[1] there after a
'poweroff' command, which is a very bad experience for the automatical
tests.

Currently, based on tinyconfig, it is very hard to find the exact
poweroff options[2]. Some architectures' poweroff works well without
any dependence, the others' poweroff options are hidden deeply, which
make things hard.

After multiple verifications, these options have been identified as the
minimum dependencies required for poweroff to function normally.

Zhangjin and I invested a significant amount of time in searching for
the current options on these devices. We hope that this set of
patcheswill save time for others. If community like it, we will consider
adding dependencies for POWER_RESET on other devices.

---
[1]: https://lore.kernel.org/lkml/511b2f6009fb830b3f32b4be3dca99596c684fa3.1689759351.git.falcon@tinylab.org/
[2]: https://lore.kernel.org/all/983843582e52e83fba79ad45cea6c79e1f62ec6c.1690489039.git.falcon@tinylab.org/


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

