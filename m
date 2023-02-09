Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 635BE690B77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:15:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJn621cqz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:15:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YzYv5Lu+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YzYv5Lu+;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PC7Rk1NHrz3f4X
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 18:15:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hOwPtrFr9W1RAetj4yw8lS4WGxzVY9WeB5xiD+rtLZk=; b=YzYv5Lu+GhnsQWcrh/P3dNn99Y
	kFFn/VTStVzrVt7izdrqqcFl3XXWJTiUSU7zkMNSHLZccvHB/fdFfsSF2G3d9l6tM8mZkGWrqFoL+
	zV70haeTAUkVk/rmntIAjBbeTETDQ9gynZkiS5FkcxD5ysQrDwctOiqgUEqy0Xc8jqVEGJ0uWfK0f
	t2HqZ/A6Oxx0EJl+SAADCmwyxjMuktOo75CIMUWNmk83r+Z+8eyEK1uwZEhembDTSx9i7ostc00tO
	/jouGLzfxYzc3+YcINRJIpim6ul86T5PcNwp2g7wUJajkYggQ+pjUyATSgrXOBG/P/NTAUzC9nrO4
	AJo7w9JQ==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ189-000LPt-4s; Thu, 09 Feb 2023 07:14:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/24 v2] Documentation: correct lots of spelling errors (series 1)
Date: Wed,  8 Feb 2023 23:13:36 -0800
Message-Id: <20230209071400.31476-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Feb 2023 01:15:07 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, keyrings@vger.kernel.org, live-patching@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>, Alexander Gordeev <agordeev@linux.ibm.com>, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Steffen Klassert <steffen.klassert@secunet.com>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Paul Moore <paul@paul-moore.com>, linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-xtensa@
 linux-xtensa.org, Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>, Henrik Rydberg <rydberg@bitmath.org>, Russell King <linux@armlinux.org.uk>, Daniel Jordan <daniel.m.jordan@oracle.com>, Ingo Molnar <mingo@redhat.com>, linux-input@vger.kernel.org, coresight@lists.linaro.org, "Serge E. Hallyn" <serge@hallyn.com>, Petr Mladek <pmladek@suse.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-block@vger.kernel.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Reinette Chatre <reinette.chatre@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-sgx@vger
 .kernel.org, Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>, Karsten Keil <isdn@linux-pingi.de>, Jonas Bonn <jonas@southpole.se>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-mm@kvack.org, netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Jarkko Sakkinen <jarkko@kernel.org>, linux-trace-devel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, linux-crypto@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Correct many spelling errors in Documentation/ as reported by codespell.

Maintainers of specific kernel subsystems are only Cc-ed on their
respective patches, not the entire series.

These patches are based on linux-next-20230209.


 [PATCH 01/24] Documentation: arm: correct spelling
 [PATCH 02/24] Documentation: block: correct spelling
 [PATCH 03/24] Documentation: core-api: correct spelling
 [PATCH 04/24] Documentation: fault-injection: correct spelling
 [PATCH 05/24] Documentation: fb: correct spelling
 [PATCH 06/24] Documentation: features: correct spelling
 [PATCH 07/24] Documentation: input: correct spelling
 [PATCH 08/24] Documentation: isdn: correct spelling
 [PATCH 09/24] Documentation: livepatch: correct spelling
 [PATCH 10/24] Documentation: locking: correct spelling
 [PATCH 11/24] Documentation: mm: correct spelling
 [PATCH 12/24] Documentation: openrisc: correct spelling
 [PATCH 13/24] Documentation: PCI: correct spelling
 [PATCH 14/24] Documentation: powerpc: correct spelling
 [PATCH 15/24] Documentation: s390: correct spelling
 [PATCH 16/24] Documentation: scheduler: correct spelling
 [PATCH 17/24] Documentation: security: correct spelling
 [PATCH 18/24] Documentation: timers: correct spelling
 [PATCH 19/24] Documentation: tools/rtla: correct spelling
 [PATCH 20/24] Documentation: trace/rv: correct spelling
 [PATCH 21/24] Documentation: trace: correct spelling
 [PATCH 22/24] Documentation: w1: correct spelling
 [PATCH 23/24] Documentation: x86: correct spelling
 [PATCH 24/24] Documentation: xtensa: correct spelling


diffstat:
 Documentation/PCI/endpoint/pci-vntb-howto.rst                    |    2 +-
 Documentation/PCI/msi-howto.rst                                  |    2 +-
 Documentation/arm/arm.rst                                        |    2 +-
 Documentation/arm/ixp4xx.rst                                     |    4 ++--
 Documentation/arm/keystone/knav-qmss.rst                         |    2 +-
 Documentation/arm/stm32/stm32-dma-mdma-chaining.rst              |    6 +++---
 Documentation/arm/sunxi/clocks.rst                               |    2 +-
 Documentation/arm/swp_emulation.rst                              |    2 +-
 Documentation/arm/tcm.rst                                        |    2 +-
 Documentation/arm/vlocks.rst                                     |    2 +-
 Documentation/block/data-integrity.rst                           |    2 +-
 Documentation/core-api/packing.rst                               |    2 +-
 Documentation/core-api/padata.rst                                |    2 +-
 Documentation/fault-injection/fault-injection.rst                |    2 +-
 Documentation/fb/sm712fb.rst                                     |    2 +-
 Documentation/fb/sstfb.rst                                       |    2 +-
 Documentation/features/core/thread-info-in-task/arch-support.txt |    2 +-
 Documentation/input/devices/iforce-protocol.rst                  |    2 +-
 Documentation/input/multi-touch-protocol.rst                     |    2 +-
 Documentation/isdn/interface_capi.rst                            |    2 +-
 Documentation/isdn/m_isdn.rst                                    |    2 +-
 Documentation/livepatch/reliable-stacktrace.rst                  |    2 +-
 Documentation/locking/lockdep-design.rst                         |    4 ++--
 Documentation/locking/locktorture.rst                            |    2 +-
 Documentation/locking/locktypes.rst                              |    2 +-
 Documentation/locking/preempt-locking.rst                        |    2 +-
 Documentation/mm/hmm.rst                                         |    4 ++--
 Documentation/mm/hwpoison.rst                                    |    2 +-
 Documentation/openrisc/openrisc_port.rst                         |    4 ++--
 Documentation/power/suspend-and-interrupts.rst                   |    2 +-
 Documentation/powerpc/kasan.txt                                  |    2 +-
 Documentation/powerpc/papr_hcalls.rst                            |    2 +-
 Documentation/powerpc/qe_firmware.rst                            |    4 ++--
 Documentation/powerpc/vas-api.rst                                |    4 ++--
 Documentation/s390/pci.rst                                       |    4 ++--
 Documentation/s390/vfio-ccw.rst                                  |    2 +-
 Documentation/scheduler/sched-bwc.rst                            |    2 +-
 Documentation/scheduler/sched-energy.rst                         |    4 ++--
 Documentation/security/digsig.rst                                |    4 ++--
 Documentation/security/keys/core.rst                             |    2 +-
 Documentation/security/secrets/coco.rst                          |    2 +-
 Documentation/timers/hrtimers.rst                                |    2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                   |    2 +-
 Documentation/trace/coresight/coresight-etm4x-reference.rst      |    2 +-
 Documentation/trace/events.rst                                   |    6 +++---
 Documentation/trace/fprobe.rst                                   |    2 +-
 Documentation/trace/ftrace-uses.rst                              |    2 +-
 Documentation/trace/hwlat_detector.rst                           |    2 +-
 Documentation/trace/rv/runtime-verification.rst                  |    2 +-
 Documentation/trace/uprobetracer.rst                             |    2 +-
 Documentation/w1/w1-netlink.rst                                  |    2 +-
 Documentation/x86/boot.rst                                       |    2 +-
 Documentation/x86/buslock.rst                                    |    2 +-
 Documentation/x86/mds.rst                                        |    2 +-
 Documentation/x86/resctrl.rst                                    |    2 +-
 Documentation/x86/sgx.rst                                        |    2 +-
 Documentation/xtensa/atomctl.rst                                 |    2 +-
 57 files changed, 70 insertions(+), 70 deletions(-)


Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Vladimir Oltean <olteanv@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Helge Deller <deller@gmx.de>
?Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Karsten Keil <isdn@linux-pingi.de>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>

Cc: coresight@lists.linaro.org
Cc: dri-devel@lists.freedesktop.org
Cc: keyrings@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-sgx@vger.kernel.org
Cc: linux-trace-devel@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: live-patching@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: openrisc@lists.librecores.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
