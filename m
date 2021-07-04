Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 818D63BAF3C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jul 2021 23:39:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJ2Jm3M3Nz309p
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 07:39:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ws1vRwQ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ws1vRwQ+; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJ2JJ1dnRz2yNx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jul 2021 07:38:53 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id j14so7453463qvu.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jul 2021 14:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=fe3J2A+vtFu4IpZ6REOdxE2omyLFSQowPGaH+N2VFXE=;
 b=Ws1vRwQ+9pUsdkHwkc6368X7KkFDfgigZHmNIz+izLp4WyuimWrTWC9/+p/mNK1Xfo
 Mk0mSpsdBHJsV3zfG/9SgBOZFMjZdaHRa62zEBa5wnWBtP0hR8f9uDr1U7twXAAh3XnM
 i1ab7BS/XH/JrIqQkkthP0t3RrHDz0jNnMkH3gJTohfCIyqDQYShgcP4cts4cGN8G89n
 kJZyLw91VPYd+Muz+Sip/fyIN2sm07i6mA0OQ64f8iL95t3TemO9pcpwbhD7beA2NzoX
 Yr2u782qoZpbY/bc6JjYGEI1n4ZxBs+VZzQwkI8JbdQOVMpU+3jlkAkcwIl0viQ1zFZF
 SMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=fe3J2A+vtFu4IpZ6REOdxE2omyLFSQowPGaH+N2VFXE=;
 b=sVyb+UNrP75s0oFqaV24nTTETNHJnC83Rp9KKGCgNHB9pis8ZP2eNQqarkZDhCNa4S
 PC31cEyeg5yMpZEwDEOaypC4uvIQxQhHKJPMS3aHZ9WEP89IPj/USGs7HGvTAFEq0Uk+
 5OZkOJiy994ZvmtzrherL9f3Ao6h2z4njSbq5wkAH3jmQTMY5t9jtUydJBJOJvRdiTfL
 O41CHf0MF4n3MujpZ2D5QTdtmkth3lmu/gwlDXe4Fb4IVXRlvYsO2wDoiKO8D4LTDWe0
 GYtxE4VHyM7srkiS4x7yqk6RjLeDsEplc9fNHRPo/Px+PAE5sgzDh9FXHvbZVeWdUxLz
 Ku2Q==
X-Gm-Message-State: AOAM532isffF9AOfSiPQiTicXsQkXzpnQyxtOcH8kkTAlg16NO5SJYne
 W7e5vV24IB7yPjyebUMMbeRIp5s2f1E=
X-Google-Smtp-Source: ABdhPJx8/p9TmuwCrVhsm7jTQcRqH/Ip8dzIHJ2eCoP5YlnEXiGUzr0RQZFYpUFuHDiOdmfC2TQnpQ==
X-Received: by 2002:ad4:4d85:: with SMTP id cv5mr10192022qvb.33.1625434726626; 
 Sun, 04 Jul 2021 14:38:46 -0700 (PDT)
Received: from bat.mindbit.ro (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca.
 [72.137.118.157])
 by smtp.gmail.com with ESMTPSA id g6sm3767433qtk.44.2021.07.04.14.38.45
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 14:38:46 -0700 (PDT)
Message-ID: <6b5327e32549860c1e6c73e5b669528bfb383df2.camel@gmail.com>
Subject: Hitting BUG_ON in do_notify_resume() with gdb and SIGTRAP
From: Radu Rendec <radu.rendec@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Sun, 04 Jul 2021 17:38:44 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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

Hi Everyone,

I'm trying to set up my (virtual) environment to test an old bug in the
PPC32 ptrace() code. I came across a completely different problem,
which seems to make gdb pretty much unusable on PPC32. I'm not sure if
this is a real kernel bug or maybe something wrong with my
configuration.

I'm running kernel 5.13 in a qemu VM with one e500mc CPU. I am running
native gdb (inside the VM) and setting a breakpoint in main() in a test
"hello world" program. Upon running the test program, I am hitting the
BUG_ON in do_notify_resume() on line 292. The kernel bug log snippet is
included below at the end of the email.

FWIW, gdb says:
Program terminated with signal SIGTRAP, Trace/breakpoint trap.
The program no longer exists.

I also added a pr_info() to do_notify_resume() just to see how much
different 'regs' and 'current->thread.regs' are. Surprisingly, they are
just 0x30 apart: regs=c7955f10 cur=c7955f40. Also, 'current' seems to
be OK (pid and comm are consistent with the test program).

If I'm not missing something, the 'regs' pointer that is eventually
passed to do_notify_resume() is calculated in interrupt_return() by
adding STACK_FRAME_OVERHEAD (defined to 112) to the value of r1. That
means all registers are saved on the stack before entering the
interrupt handler and, upon returning, a pointer to the register
structure is calculated from the stack pointer. Either the offset
itself is wrong, or the stack pointer is off by 0x30.

This is as far as I have gone. Hopefully this rings a bell to someone
who is familiar with that part of the code and has a better
understanding of PPC32 interrupt handling in general.

Last but not least, my configuration is fairly standard. I'm using the
powerpc-e500mc--glibc--bleeding-edge-2020.08-1 toolchain from Bootlin
to compile everything (kernel and user-space). The qemu version is
5.2.0 (Fedora 34) and the user-space is a small Busybox based rootfs
that I built using Buildroot 2021.05. The gdb version is 9.2.

regs=c7955f10 cur=c7955f40 pid=138 comm=test
------------[ cut here ]------------
kernel BUG at arch/powerpc/kernel/signal.c:296!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
Modules linked in:
CPU: 0 PID: 138 Comm: test Not tainted 5.13.0-dirty #3
NIP:  c0009694 LR: c0009694 CTR: c065f540
REGS: c7955dc0 TRAP: 0700   Not tainted  (5.13.0-dirty)
MSR:  00028002 <CE,EE>  CR: 28000282  XER: 20000000

GPR00: c0009694 c7955e80 c7145100 0000002c dfbdc3d4 dfbe5d24 00000027 dfbdc3d8 
GPR08: c0ffe988 00000000 00000000 00000000 22000282 00000000 00000000 b7fe17b4 
GPR16: 00000000 b7ffd588 b7ffe8b8 b7ffee10 b7fff214 b7ffdf40 b7fff208 bffff858 
GPR24: bffff970 b7fff130 00000001 bffff960 c7955f10 00000800 c7145100 00000102 
NIP [c0009694] do_notify_resume+0x314/0x320
LR [c0009694] do_notify_resume+0x314/0x320
Call Trace:
[c7955e80] [c0009694] do_notify_resume+0x314/0x320 (unreliable)
[c7955ee0] [c0010b94] interrupt_exit_user_prepare+0x94/0xc0
[c7955f00] [c00151e8] interrupt_return+0x14/0x13c
--- interrupt: 7d8 at 0xb7fc3714
NIP:  b7fc3714 LR: b7fc3714 CTR: 00000003
REGS: c7955f10 TRAP: 07d8   Not tainted  (5.13.0-dirty)
MSR:  1002d002 <CE,EE,PR,ME>  CR: 22000284  XER: 00000000

GPR00: b7fc3584 bffff850 00000000 00000000 00000000 00000000 000000a0 6474e552 
GPR08: b7fbe0d4 00000001 b7fff230 bffff850 b7fc36d8 00000000 00000000 b7fe17b4 
GPR16: 00000000 b7ffd588 b7ffe8b8 b7ffee10 b7fff214 b7ffdf40 b7fff208 bffff858 
GPR24: bffff970 b7fff130 00000001 bffff960 b7fff2b0 b7ffd5f0 b7ffe8a8 bffff850 
NIP [b7fc3714] 0xb7fc3714
LR [b7fc3714] 0xb7fc3714
--- interrupt: 7d8
Instruction dump:
4bffff04 7c0802a6 93a10054 90010064 93c10058 48b95369 80c20398 3c60c0dc 
7f84e378 38e204b0 3863ce30 4809d819 <0fe00000> 60000000 60000000 3d20c0ff 
---[ end trace 065671519ba3d526 ]---

Note: the BUG() line is slightly different because I had made this
small change to print the pointers:

diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 9ded046edb0e..57ea6e500a6f 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -289,7 +289,12 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 		klp_update_patch_state(current);
 
 	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-		BUG_ON(regs != current->thread.regs);
+		if (regs != current->thread.regs) {
+			pr_info("regs=%px cur=%px pid=%d comm=%s\n",
+				regs, current->thread.regs,
+				current->pid, current->comm);
+			BUG();
+		}
 		do_signal(current);
 	}
 


