Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEDA47C485
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 18:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJN626GjZz3c83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 04:01:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dEgydiYr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dEgydiYr; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJN5N6JwPz2y7Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 04:01:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B70EB817AF;
 Tue, 21 Dec 2021 17:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5408C36AE8;
 Tue, 21 Dec 2021 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106066;
 bh=7d8LhHNqF8chXHYwnQCba3+BVf9M2vb5t0LpTpOXl3I=;
 h=From:To:Cc:Subject:Date:From;
 b=dEgydiYrKTv4MoEpX8HEQPqxS6hcDAYv3fewK7fRHlYo1CHlD/jbRbllFF0F8kZJR
 7Ol7HU29iOHWoMgGNtsqJUJCM5S4W0bgP/zIGIS5hDslGvSBAcnMkOveiGKJ3RC9in
 phVRHxd7jJND527OgA3JMqshWfpLFVLj3H6JoZQlMlYklclMYaZz0Kb7LD+CmhEWua
 uKrgpIgE7bEmoNRS3EL88iGk+rcBxqSBw196mkCKvdSsMMYIldXUa3jUAkYsmHra4o
 ZYOiY88ri24LqnBH+ncTH+nICWwBRbCrgyo/8AjbwLlOdXvXLXKKZdbHKtkvqkpvAZ
 +r/YN5cJ3971w==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Subject: [PATCH 0/8] sched: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:49 +0800
Message-Id: <20211221170057.2637763-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-s390@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.or,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux, now. Delete in include/linux/sched.h
and arch's include/asm. This would confuse people who are
implementing the COMPAT feature for architecture.

Guo Ren (8):
  sched: Remove unused TASK_SIZE_OF
  sched: x86: Remove unused TASK_SIZE_OF
  sched: sparc: Remove unused TASK_SIZE_OF
  sched: powerpc: Remove unused TASK_SIZE_OF
  sched: s390: Remove unused TASK_SIZE_OF
  sched: parisc: Remove unused TASK_SIZE_OF
  sched: arm64: Remove unused TASK_SIZE_OF
  sched: mips: Remove unused TASK_SIZE_OF

 arch/arm64/include/asm/processor.h      | 2 --
 arch/mips/include/asm/processor.h       | 3 ---
 arch/parisc/include/asm/processor.h     | 3 +--
 arch/powerpc/include/asm/task_size_64.h | 6 ++----
 arch/s390/include/asm/processor.h       | 3 +--
 arch/sparc/include/asm/processor_64.h   | 3 ---
 arch/x86/include/asm/page_64_types.h    | 2 --
 include/linux/sched.h                   | 4 ----
 8 files changed, 4 insertions(+), 22 deletions(-)

-- 
2.25.1

