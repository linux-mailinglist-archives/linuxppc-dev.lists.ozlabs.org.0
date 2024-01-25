Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C483C14E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 12:51:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X6WylXzj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLK0T4wxCz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 22:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X6WylXzj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLJzd3W44z3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 22:50:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F023761A9F;
	Thu, 25 Jan 2024 11:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4A2C433F1;
	Thu, 25 Jan 2024 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706183416;
	bh=OLqrdqbXvIR0UuWSVtJeWV2wrixPPGG6nq5eurBXFlY=;
	h=From:To:Cc:Subject:Date:From;
	b=X6WylXzj+0eXgeYGqDvSE7JqvTobFI2jRdaOWf/g1jmpeH+yxxh84/PPu+jqB7EKx
	 Mt1HZ1VaibP3Y3mRroZbRjSTsnRO6N30YlT0coDC2NrBJKr+XYvnUj+a6pgZs2Crju
	 qmJw4P8vK8Cj7vwmph5TBbz3ymfoNOay6UD0y2CA4QmKb+VEVIkVntyMkfDuUUJq9m
	 46DA9/XXh55Qyq4jsXSOZLfjqF99GiXCvsFfjV1hOI+UkOVufKCHWEK4Dw+EPp/cGo
	 gxeRBWdyfPIxKASNrzZ/MfmoJGcXxBml9YaOqWq7IBUkEEmkbiPNZc3eNkkuoea3ns
	 XKQc/0sA30gWw==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Set LR to a non-NULL value in task pt_regs on scv entry
Date: Thu, 25 Jan 2024 17:12:28 +0530
Message-ID: <20240125114228.353257-1-naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: "Nysal Jan K.A" <nysal@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nysal reported that userspace backtraces are missing in offcputime bcc
tool. As an example:
    $ sudo ./bcc/tools/offcputime.py -uU
    Tracing off-CPU time (us) of user threads by user stack... Hit Ctrl-C to end.

    ^C
	write
	-                python (9107)
	    8

	write
	-                sudo (9105)
	    9

	mmap
	-                python (9107)
	    16

	clock_nanosleep
	-                multipathd (697)
	    3001604

The offcputime bcc tool attaches a bpf program to a kprobe on
finish_task_switch(), which is usually hit on a syscall from userspace.
With the switch to system call vectored, we zero out LR value in user
pt_regs on syscall entry. BPF uses perf callchain infrastructure for
capturing stack traces, and this stores LR as the second entry in the
stack trace. Since this is NULL, userspace unwinders assume that there
are no further entries resulting in a truncated userspace stack trace.

Rather than fixing all userspace unwinders to ignore/skip past the
second entry, store NIP as LR so that there continues to be a valid,
though duplicate entry.

With this change:
    $ sudo ./bcc/tools/offcputime.py -uU
    Tracing off-CPU time (us) of user threads by user stack... Hit Ctrl-C to end.

    ^C
	write
	write
	[unknown]
	[unknown]
	[unknown]
	[unknown]
	[unknown]
	PyObject_VectorcallMethod
	[unknown]
	[unknown]
	PyObject_CallOneArg
	PyFile_WriteObject
	PyFile_WriteString
	[unknown]
	[unknown]
	PyObject_Vectorcall
	_PyEval_EvalFrameDefault
	PyEval_EvalCode
	[unknown]
	[unknown]
	[unknown]
	_PyRun_SimpleFileObject
	_PyRun_AnyFileObject
	Py_RunMain
	[unknown]
	Py_BytesMain
	[unknown]
	__libc_start_main
	-                python (1293)
	    7

	write
	write
	[unknown]
	sudo_ev_loop_v1
	sudo_ev_dispatch_v1
	[unknown]
	[unknown]
	[unknown]
	[unknown]
	__libc_start_main
	-                sudo (1291)
	    7

	syscall
	syscall
	bpf_open_perf_buffer_opts
	[unknown]
	[unknown]
	[unknown]
	[unknown]
	_PyObject_MakeTpCall
	PyObject_Vectorcall
	_PyEval_EvalFrameDefault
	PyEval_EvalCode
	[unknown]
	[unknown]
	[unknown]
	_PyRun_SimpleFileObject
	_PyRun_AnyFileObject
	Py_RunMain
	[unknown]
	Py_BytesMain
	[unknown]
	__libc_start_main
	-                python (1293)
	    11

	clock_nanosleep
	clock_nanosleep
	nanosleep
	sleep
	[unknown]
	[unknown]
	__clone
	-                multipathd (698)
	    3001661

Reported-by: Nysal Jan K.A <nysal@linux.ibm.com>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/interrupt_64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index bd863702d812..5cf3758a19d3 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -53,6 +53,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	ld	r1,PACAKSAVE(r13)
 	std	r10,0(r1)
 	std	r11,_NIP(r1)
+	std	r11,_LINK(r1)
 	std	r12,_MSR(r1)
 	std	r0,GPR0(r1)
 	std	r10,GPR1(r1)
@@ -70,7 +71,6 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	std	r9,GPR13(r1)
 	SAVE_NVGPRS(r1)
 	std	r11,_XER(r1)
-	std	r11,_LINK(r1)
 	std	r11,_CTR(r1)
 
 	li	r11,\trapnr

base-commit: 414e92af226ede4935509b0b5e041810c92e003f
-- 
2.43.0

