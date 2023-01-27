Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42567DE7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 08:27:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P38Kq41qhz3fH0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 18:27:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BHL2yK0m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BHL2yK0m;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P37KH70lWz2yZv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 17:41:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=u92ZIG8NeiReqULUpJ3dTyWf+uSNhJCKYYthA6vycZI=; b=BHL2yK0mIJr+KABpOGeA+u3Rl4
	B7i2Rbbg1zsJ5XUcinksH8hUB+n5okYbng9loY48Tjyofjk8OiUG4xkeaXAWl27DOJNOXqOxncMab
	MYR6RasB+6kB7NBxI5Ptdqc1xJnRvtvJMJgoTVl3e6o9pKE2P3FDcHqx+Z9F/gvv9fPUr/g6wVmk2
	9Dc/EI24A/yOAoVs8mO3i8ly6BVPoqaTkISl0X1f71XCb1dbLyrGH9wWZnJIw2IzLOYM27mAEX1GD
	Se8srjkBYH4HkNZB0oYO6bGYGUHrSz2Oe6l41n4L6/KLtiiYAz/bal9B0+Qc6rEeLWb2YaS+NqC6y
	f2ChDZSQ==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLIPB-00DM0u-Dt; Fri, 27 Jan 2023 06:40:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/35] Documentation: correct lots of spelling errors (series 1)
Date: Thu, 26 Jan 2023 22:39:30 -0800
Message-Id: <20230127064005.1558-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Jan 2023 18:26:42 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Juri Lelli <juri.lelli@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Pavel Machek <pavel@ucw.cz>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Evgeniy Polyakov <zbr@ioremap.net>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-sgx@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-spi@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
  linux-doc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, keyrings@vger.kernel.org, linux-i2c@vger.kernel.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-trace-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Daniel Jordan <daniel.m.jordan@oracle.com>, linux-crypto@vger.kernel.org, linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, isdn4lin
 ux@listserv.isdn4linux.de, linux-input@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>, Fenghua Yu <fenghua.yu@intel.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-fbdev@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, target-devel@vger.kernel.org, bpf@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>, linux-mm@kvack.org, linux-trace-devel@vger.kernel.org, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, linux-leds@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, linux-scsi@vger.kernel.org, Marc Zyngier <maz@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <
 mingo@redhat.com>, Jonas Bonn <jonas@southpole.se>, Heiko Carstens <hca@linux.ibm.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-block@vger.kernel.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, openrisc@lists.librecores.org, Josh Poimboeuf <jpoimboe@kernel.org>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-security-module@vger.kernel.org, Daniel Bristot de Oliveira <bristot@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Correct many spelling errors in Documentation/ as reported by codespell.

Maintainers of specific kernel subsystems are only Cc-ed on their
respective patches, not the entire series. [if all goes well]

These patches are based on linux-next-20230125.


 [PATCH 01/35] Documentation: arm64: correct spelling
 [PATCH 02/35] Documentation: arm: correct spelling
 [PATCH 03/35] Documentation: block: correct spelling
 [PATCH 04/35] Documentation: bpf: correct spelling
 [PATCH 05/35] Documentation: core-api: correct spelling
 [PATCH 06/35] Documentation: fault-injection: correct spelling
 [PATCH 07/35] Documentation: fb: correct spelling
 [PATCH 08/35] Documentation: features: correct spelling
 [PATCH 09/35] Documentation: firmware-guide/acpi: correct spelling
 [PATCH 10/35] Documentation: hid: correct spelling
 [PATCH 11/35] Documentation: i2c: correct spelling
 [PATCH 12/35] Documentation: input: correct spelling
 [PATCH 13/35] Documentation: isdn: correct spelling
 [PATCH 14/35] Documentation: leds: correct spelling
 [PATCH 15/35] Documentation: litmus-tests: correct spelling
 [PATCH 16/35] Documentation: livepatch: correct spelling
 [PATCH 17/35] Documentation: locking: correct spelling
 [PATCH 18/35] Documentation: mm: correct spelling
 [PATCH 19/35] Documentation: openrisc: correct spelling
 [PATCH 20/35] Documentation: PCI: correct spelling
 [PATCH 21/35] Documentation: powerpc: correct spelling
 [PATCH 22/35] Documentation: power: correct spelling
 [PATCH 23/35] Documentation: s390: correct spelling
 [PATCH 24/35] Documentation: scheduler: correct spelling
 [PATCH 25/35] Documentation: security: correct spelling
 [PATCH 26/35] Documentation: sound: correct spelling
 [PATCH 27/35] Documentation: spi: correct spelling
 [PATCH 28/35] Documentation: target: correct spelling
 [PATCH 29/35] Documentation: timers: correct spelling
 [PATCH 30/35] Documentation: tools/rtla: correct spelling
 [PATCH 31/35] Documentation: trace: correct spelling
 [PATCH 32/35] Documentation: usb: correct spelling
 [PATCH 33/35] Documentation: w1: correct spelling
 [PATCH 34/35] Documentation: x86: correct spelling
 [PATCH 35/35] Documentation: xtensa: correct spelling


 Documentation/PCI/endpoint/pci-vntb-howto.rst                    |    2 -
 Documentation/PCI/msi-howto.rst                                  |    2 -
 Documentation/arm/arm.rst                                        |    2 -
 Documentation/arm/ixp4xx.rst                                     |    4 +-
 Documentation/arm/keystone/knav-qmss.rst                         |    2 -
 Documentation/arm/stm32/stm32-dma-mdma-chaining.rst              |    6 +--
 Documentation/arm/sunxi/clocks.rst                               |    2 -
 Documentation/arm/swp_emulation.rst                              |    2 -
 Documentation/arm/tcm.rst                                        |    2 -
 Documentation/arm/vlocks.rst                                     |    2 -
 Documentation/arm64/booting.rst                                  |    2 -
 Documentation/arm64/elf_hwcaps.rst                               |    2 -
 Documentation/arm64/sve.rst                                      |    4 +-
 Documentation/block/data-integrity.rst                           |    2 -
 Documentation/bpf/libbpf/libbpf_naming_convention.rst            |    6 +--
 Documentation/bpf/map_xskmap.rst                                 |    2 -
 Documentation/bpf/ringbuf.rst                                    |    4 +-
 Documentation/bpf/verifier.rst                                   |    2 -
 Documentation/core-api/packing.rst                               |    2 -
 Documentation/core-api/padata.rst                                |    2 -
 Documentation/fault-injection/fault-injection.rst                |    2 -
 Documentation/fb/sm712fb.rst                                     |    2 -
 Documentation/fb/sstfb.rst                                       |    2 -
 Documentation/features/core/thread-info-in-task/arch-support.txt |    2 -
 Documentation/firmware-guide/acpi/acpi-lid.rst                   |    2 -
 Documentation/firmware-guide/acpi/namespace.rst                  |    2 -
 Documentation/hid/hid-alps.rst                                   |    2 -
 Documentation/hid/hid-bpf.rst                                    |    2 -
 Documentation/hid/hiddev.rst                                     |    2 -
 Documentation/hid/hidraw.rst                                     |    2 -
 Documentation/hid/intel-ish-hid.rst                              |    2 -
 Documentation/i2c/gpio-fault-injection.rst                       |    2 -
 Documentation/i2c/smbus-protocol.rst                             |    2 -
 Documentation/input/devices/iforce-protocol.rst                  |    2 -
 Documentation/input/multi-touch-protocol.rst                     |    2 -
 Documentation/isdn/interface_capi.rst                            |    2 -
 Documentation/isdn/m_isdn.rst                                    |    2 -
 Documentation/leds/leds-qcom-lpg.rst                             |    4 +-
 Documentation/litmus-tests/README                                |    2 -
 Documentation/livepatch/reliable-stacktrace.rst                  |    2 -
 Documentation/locking/lockdep-design.rst                         |    4 +-
 Documentation/locking/locktorture.rst                            |    2 -
 Documentation/locking/locktypes.rst                              |    2 -
 Documentation/locking/preempt-locking.rst                        |    2 -
 Documentation/mm/hmm.rst                                         |    4 +-
 Documentation/mm/hwpoison.rst                                    |    2 -
 Documentation/openrisc/openrisc_port.rst                         |    4 +-
 Documentation/power/suspend-and-interrupts.rst                   |    2 -
 Documentation/powerpc/kasan.txt                                  |    2 -
 Documentation/powerpc/papr_hcalls.rst                            |    2 -
 Documentation/powerpc/qe_firmware.rst                            |    4 +-
 Documentation/powerpc/vas-api.rst                                |    4 +-
 Documentation/s390/pci.rst                                       |    4 +-
 Documentation/s390/vfio-ccw.rst                                  |    2 -
 Documentation/scheduler/sched-bwc.rst                            |    2 -
 Documentation/scheduler/sched-energy.rst                         |    4 +-
 Documentation/security/digsig.rst                                |    4 +-
 Documentation/security/keys/core.rst                             |    2 -
 Documentation/security/secrets/coco.rst                          |    2 -
 Documentation/sound/alsa-configuration.rst                       |    8 ++--
 Documentation/sound/cards/audigy-mixer.rst                       |    2 -
 Documentation/sound/cards/maya44.rst                             |    2 -
 Documentation/sound/cards/sb-live-mixer.rst                      |    2 -
 Documentation/sound/designs/jack-controls.rst                    |    2 -
 Documentation/sound/designs/seq-oss.rst                          |    2 -
 Documentation/sound/hd-audio/notes.rst                           |    2 -
 Documentation/spi/pxa2xx.rst                                     |   12 +++---
 Documentation/spi/spi-lm70llp.rst                                |    2 -
 Documentation/spi/spi-summary.rst                                |    2 -
 Documentation/target/tcmu-design.rst                             |    2 -
 Documentation/timers/hrtimers.rst                                |    2 -
 Documentation/tools/rtla/rtla-timerlat-top.rst                   |    2 -
 Documentation/trace/coresight/coresight-etm4x-reference.rst      |    2 -
 Documentation/trace/events.rst                                   |    6 +--
 Documentation/trace/fprobe.rst                                   |    2 -
 Documentation/trace/ftrace-uses.rst                              |    2 -
 Documentation/trace/hwlat_detector.rst                           |    2 -
 Documentation/trace/rv/runtime-verification.rst                  |    2 -
 Documentation/trace/uprobetracer.rst                             |    2 -
 Documentation/usb/chipidea.rst                                   |   19 +++++-----
 Documentation/usb/gadget-testing.rst                             |    2 -
 Documentation/usb/mass-storage.rst                               |    2 -
 Documentation/w1/w1-netlink.rst                                  |    2 -
 Documentation/x86/boot.rst                                       |    2 -
 Documentation/x86/buslock.rst                                    |    2 -
 Documentation/x86/mds.rst                                        |    2 -
 Documentation/x86/resctrl.rst                                    |    2 -
 Documentation/x86/sgx.rst                                        |    2 -
 Documentation/xtensa/atomctl.rst                                 |    2 -
 89 files changed, 124 insertions(+), 123 deletions(-)


Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Vladimir Oltean <olteanv@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Karsten Keil <isdn@linux-pingi.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
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
Cc: Len Brown <len.brown@intel.com>
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
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

Cc: alsa-devel@alsa-project.org
Cc: coresight@lists.linaro.org
Cc: bpf@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: isdn4linux@listserv.isdn4linux.de
Cc: keyrings@vger.kernel.org
Cc: linux-acpi@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-sgx@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-trace-devel@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: live-patching@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: target-devel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: openrisc@lists.librecores.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
