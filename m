Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC998736FA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 13:53:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Rz0HWKH6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqXR01sLYz3dXT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 23:53:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Rz0HWKH6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqXQH44pZz3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 23:52:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709729536; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=vAd18UMTC+H+2qmCwd/zJ/rEA4cX+MeF1ID88VDxGUg=;
	b=Rz0HWKH6NNXumxL1omexdqc/HtpzlF93YfwH/smsxuRrTMF816UbxFv+T3opvjSrhu+DwhC3VXnwhmsClQ1zBARLFEKRWv+u86h/Zit5lgUS46IzyOTmhYP4g1AZi7bSVBS3BzkJebKJsPKXc5f9vxORtnFf0leyr5WU/naM0s4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W1xhgEY_1709729532;
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W1xhgEY_1709729532)
          by smtp.aliyun-inc.com;
          Wed, 06 Mar 2024 20:52:13 +0800
From: Bitao Hu <yaoma@linux.alibaba.com>
To: dianders@chromium.org,
	tglx@linutronix.de,
	liusong@linux.alibaba.com,
	akpm@linux-foundation.org,
	pmladek@suse.com,
	kernelfans@gmail.com,
	deller@gmx.de,
	npiggin@gmail.com,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	jan.kiszka@siemens.com
Subject: [PATCHv12 0/4] *** Detect interrupt storm in softlockup ***
Date: Wed,  6 Mar 2024 20:52:04 +0800
Message-Id: <20240306125208.71803-1-yaoma@linux.alibaba.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, guys.
I have implemented a low-overhead method for detecting interrupt
storm in softlockup. Please review it, all comments are welcome.

Changes from v11 to v12:

- From Douglas and Thomas, add a new kconfig knob save memory when
the softlock detector code is not enabled.

- Adjust the order of the patches; patch #1 and patch #2 are related
to genirq, while patch #3 and patch #4 are related to watchdog/softlockup,
making the dependency relationships clearer.

- Add the 'Reviewed-by' tag of Douglas.

Changes from v10 to v11:

- Only patch #2 and patch #3 have been changed.

- Add comments to explain each field of 'struct irqstat' in patch #2.

- Split the inner summation logic out of kstat_irqs() and encapsulate
it into kstat_irqs_desc() in patch #3.

- Adopt Thomas's change log for patch #3.

- Add the 'Reviewed-by' tag of Liu Song.

Changes from v9 to v10:

- The two patches related to 'watchdog/softlockup' remain unchanged.

- The majority of the work related to 'genirq' is contributed by
Thomas, indicated by adding 'Originally-by' tag. And I'd like to
express my gratitude for Thomas's contributions and guidance here.

- Adopt Thomas's change log for the snapshot mechanism for interrupt
statistics.

- Split unrelated change in patch #2 into a separate patch #3.

Changes from v8 to v9:

- Patch #1 remains unchanged.

- From Thomas Gleixner, split patch #2 into two patches. Interrupt
infrastructure first and then the actual usage site in the
watchdog code.

Changes from v7 to v8:

- From Thomas Gleixner, implement statistics within the interrupt
core code and provide sensible interfaces for the watchdog code.

- Patch #1 remains unchanged. Patch #2 has significant changes
based on Thomas's suggestions, which is why I have removed
Liu Song and Douglas's Reviewed-by from patch #2. Please review
it again, and all comments are welcome.

Changes from v6 to v7:

- Remove "READ_ONCE" in "start_counting_irqs"

- Replace the hard-coded 5 with "NUM_SAMPLE_PERIODS" macro in
"set_sample_period".

- Add empty lines to help with reading the code.

- Remove the branch that processes IRQs where "counts_diff = 0".

- Add the Reviewed-by of Liu Song and Douglas.

Changes from v5 to v6:

- Use "./scripts/checkpatch.pl --strict" to get a few extra
style nits and fix them.

- Squash patch #3 into patch #1, and wrapp the help text to
80 columns.

- Sort existing headers alphabetically in watchdog.c

- Drop "softlockup_hardirq_cpus", just read "hardirq_counts"
and see if it's non-NULL.

- Store "nr_irqs" in a local variable.

- Simplify the calculation of "cpu_diff".

Changes from v4 to v5:

- Rearranging variable placement to make code look neater.

Changes from v3 to v4:

- Renaming some variable and function names to make the code logic
more readable.

- Change the code location to avoid predeclaring.

- Just swap rather than a double loop in tabulate_irq_count.

- Since nr_irqs has the potential to grow at runtime, bounds-check
logic has been implemented.

- Add SOFTLOCKUP_DETECTOR_INTR_STORM Kconfig knob.

Changes from v2 to v3:

- From Liu Song, using enum instead of macro for cpu_stats, shortening
the name 'idx_to_stat' to 'stats', adding 'get_16bit_precesion' instead
of using right shift operations, and using 'struct irq_counts'.

- From kernel robot test, using '__this_cpu_read' and '__this_cpu_write'
instead of accessing to an per-cpu array directly, in order to avoid
this warning.
'sparse: incorrect type in initializer (different modifiers)'

Changes from v1 to v2:

- From Douglas, optimize the memory of cpustats. With the maximum number
of CPUs, that's now this.
2 * 8192 * 4 + 1 * 8192 * 5 * 4 + 1 * 8192 = 237,568 bytes.

- From Liu Song, refactor the code format and add necessary comments.

- From Douglas, use interrupt counts instead of interrupt time to
determine the cause of softlockup.

- Remove the cmdline parameter added in PATCHv1.
Bitao Hu (4):
  genirq: Provide a snapshot mechanism for interrupt statistics
  genirq: Avoid summation loops for /proc/interrupts
  watchdog/softlockup: low-overhead detection of interrupt storm
  watchdog/softlockup: report the most frequent interrupts

 arch/mips/dec/setup.c                |   2 +-
 arch/parisc/kernel/smp.c             |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c |   2 +-
 include/linux/irqdesc.h              |  16 +-
 include/linux/kernel_stat.h          |   8 +
 kernel/irq/Kconfig                   |   4 +
 kernel/irq/internals.h               |   4 +-
 kernel/irq/irqdesc.c                 |  54 +++++--
 kernel/irq/proc.c                    |   9 +-
 kernel/watchdog.c                    | 213 ++++++++++++++++++++++++++-
 lib/Kconfig.debug                    |  14 ++
 scripts/gdb/linux/interrupts.py      |   6 +-
 12 files changed, 302 insertions(+), 32 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

