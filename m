Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3872785A8F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 17:30:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Tiv9LHSY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tdp1n14jYz3cLV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 03:30:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Tiv9LHSY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tdnmp70xWz2xPV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 03:19:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1708359569; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=5PwNPGoMJ7CW08mOs+1ZY9zWs2CVp91wKkFaBXXx+ns=;
	b=Tiv9LHSYQMInJjK13CCEastnstz+wON8g5OAWgY8ky4RbD/ZYJAocAjPsdkuDQeQmhZbOygbE9IqzNOm9ozkYpbyrUuh+34GITr6ioC63ky+X4Vwrz4/Gw0LlaF73GPEVBrk9obBTMf6yGMOGf7O69O0X58GFjksPQZrh0k0jZY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W0tz6l._1708359563;
Received: from localhost.localdomain(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W0tz6l._1708359563)
          by smtp.aliyun-inc.com;
          Tue, 20 Feb 2024 00:19:25 +0800
From: Bitao Hu <yaoma@linux.alibaba.com>
To: tglx@linutronix.de,
	dianders@chromium.org,
	pmladek@suse.com,
	akpm@linux-foundation.org,
	kernelfans@gmail.com,
	liusong@linux.alibaba.com,
	deller@gmx.de,
	npiggin@gmail.com,
	jan.kiszka@siemens.com,
	kbingham@kernel.org
Subject: [PATCHv8 0/2] *** Detect interrupt storm in softlockup ***
Date: Tue, 20 Feb 2024 00:19:18 +0800
Message-Id: <20240219161920.15752-1-yaoma@linux.alibaba.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Feb 2024 03:29:33 +1100
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
Cc: linux-parisc@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Bitao Hu <yaoma@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, guys.
I have implemented a low-overhead method for detecting interrupt
storm in softlockup. Please review it, all comments are welcome.

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


Bitao Hu (2):
  watchdog/softlockup: low-overhead detection of interrupt
  watchdog/softlockup: report the most frequent interrupts

 arch/mips/dec/setup.c                |   2 +-
 arch/parisc/kernel/smp.c             |   2 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c |   2 +-
 include/linux/irqdesc.h              |   9 +-
 include/linux/kernel_stat.h          |   4 +
 kernel/irq/internals.h               |   2 +-
 kernel/irq/irqdesc.c                 |  34 ++++-
 kernel/irq/proc.c                    |   9 +-
 kernel/watchdog.c                    | 213 ++++++++++++++++++++++++++-
 lib/Kconfig.debug                    |  13 ++
 scripts/gdb/linux/interrupts.py      |   6 +-
 11 files changed, 269 insertions(+), 27 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

