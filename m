Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1698043C09E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 05:14:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfDM56m3Hz3c54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 14:14:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.56;
 helo=out30-56.freemail.mail.aliyun.com;
 envelope-from=yun.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfDLb4DbDz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 14:14:15 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R901e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=30; SR=0; TI=SMTPD_---0UtqDHde_1635304435; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UtqDHde_1635304435) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 27 Oct 2021 11:13:56 +0800
To: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Subject: [PATCH v7 0/2] fix & prevent the missing preemption disabling
Message-ID: <ecd56129-faed-3b30-5552-7fa1e09bc408@linux.alibaba.com>
Date: Wed, 27 Oct 2021 11:13:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The testing show that perf_ftrace_function_call() are using smp_processor_id()
with preemption enabled, all the checking on CPU could be wrong after preemption.

As Peter point out, the section between ftrace_test_recursion_trylock/unlock()
pair require the preemption to be disabled as 'Documentation/trace/ftrace-uses.rst'
explained, but currently the work is done outside of the helpers.

And since the internal using of trace_test_and_set_recursion()
and trace_clear_recursion() also require preemption to be disabled, we
can just merge the logical together.

Patch 1/2 will make sure preemption disabled when recursion lock succeed,
patch 2/2 will do smp_processor_id() checking after trylock() to address the
issue.

v1: https://lore.kernel.org/all/8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com/
v2: https://lore.kernel.org/all/b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com/
v3: https://lore.kernel.org/all/609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com/
V4: https://lore.kernel.org/all/32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com/
V5: https://lore.kernel.org/all/3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com/
V6: https://lore.kernel.org/all/df8e9b3e-504c-635d-4e92-99cdf9f05479@linux.alibaba.com/

Michael Wang (2):
  ftrace: disable preemption when recursion locked
  ftrace: do CPU checking after preemption disabled

 arch/csky/kernel/probes/ftrace.c     |  2 --
 arch/parisc/kernel/ftrace.c          |  2 --
 arch/powerpc/kernel/kprobes-ftrace.c |  2 --
 arch/riscv/kernel/probes/ftrace.c    |  2 --
 arch/x86/kernel/kprobes/ftrace.c     |  2 --
 include/linux/trace_recursion.h      | 11 ++++++++++-
 kernel/livepatch/patch.c             | 13 +++++++------
 kernel/trace/ftrace.c                | 15 +++++----------
 kernel/trace/trace_event_perf.c      |  6 +++---
 kernel/trace/trace_functions.c       |  5 -----
 10 files changed, 25 insertions(+), 35 deletions(-)

-- 
1.8.3.1

