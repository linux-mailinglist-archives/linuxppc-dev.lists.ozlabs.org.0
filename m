Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00C1E75CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 08:16:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YDqN5WtvzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 16:16:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=N9GeVwf3; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YDnH2PPgzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 16:14:57 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh7so657997plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ApUmcu6zLI3Gx+iYpUakeFiu2F+m83/+ENrrzQ2obQI=;
 b=N9GeVwf3fLpTeeT16LMZUFqJYUjqtr+ny4e9Jo/4g/fdixqlhRsqPbApOf1ts3Rngj
 8hOqjtRX5B1EPDx+dW8/HcCQH0Z4RcM5mdkQNi85krwtnadh8NX1yCxhNr2MyOSfCNRD
 l5k3oNbbQH8IFdFTP2+STU7o7DaMyhYtJP2M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ApUmcu6zLI3Gx+iYpUakeFiu2F+m83/+ENrrzQ2obQI=;
 b=C0uhCZsa9kGXfopqfGOb6v5khAkZsy58ZGA+JW6F5gOLcQ9GD95bfriPyPfKCKdBhc
 vjHNcqNB9gT3L1CfjMa9X4ukOho5PR5OxITvRihAVKKoNv9Crh6HvePwrnAzG9a8YpE7
 0E7rW9tg5jwHMEwG5Mc7f9RXPvb/pBlNnHTegJn/tMxLMqgG3UBUcI9Me/Z6VEye/oZJ
 e0AQ2aqjGkbdoa5+Tgr9TmWOzaOly8RmPpXok9UW8yvNAuveNYifvkDGIhZxlGd0kbNy
 SaPBQizjoUU8vIi9QQJbxmrxaynSkQSRCvRFN81UrumPS09u2SddFBA9xlDuePsejNag
 Cpyw==
X-Gm-Message-State: AOAM531b2XBNRz0Gq/4O2GIs2DvQnHDVCMs/w4Jvf3Vgij9VGli2Sivq
 RiHMDkHmdixhUhfVn82CV1hJVJ5xLkSzVw==
X-Google-Smtp-Source: ABdhPJxTNYBo4rP2apRhk1CuEJ0kKRVG/SUQ93mdjr8Nc1tYyFl3uX07ftAjd3oAT38COUWuLAJpjA==
X-Received: by 2002:a17:90a:64c6:: with SMTP id
 i6mr7471837pjm.14.1590732893661; 
 Thu, 28 May 2020 23:14:53 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-55e9-59ce-4be0-c805.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:55e9:59ce:4be0:c805])
 by smtp.gmail.com with ESMTPSA id h7sm5856348pgn.60.2020.05.28.23.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 23:14:53 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com
Subject: [PATCH] powerpc/64/syscall: Disable sanitisers for C syscall
 entry/exit code
Date: Fri, 29 May 2020 16:14:46 +1000
Message-Id: <20200529061446.2773-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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
Cc: ajd@linux.ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

syzkaller is picking up a bunch of crashes that look like this:

Unrecoverable exception 380 at c00000000037ed60 (msr=8000000000001031)
Oops: Unrecoverable exception, sig: 6 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 0 PID: 874 Comm: syz-executor.0 Not tainted 5.7.0-rc7-syzkaller-00016-gb0c3ba31be3e #0
NIP:  c00000000037ed60 LR: c00000000004bac8 CTR: c000000000030990
REGS: c0000000555a7230 TRAP: 0380   Not tainted  (5.7.0-rc7-syzkaller-00016-gb0c3ba31be3e)
MSR:  8000000000001031 <SF,ME,IR,DR,LE>  CR: 48222882  XER: 20000000
CFAR: c00000000004bac4 IRQMASK: 0
GPR00: c00000000004bb68 c0000000555a74c0 c0000000024b3500 0000000000000005
GPR04: 0000000000000000 0000000000000000 c00000000004bb88 c008000000910000
GPR08: 00000000000b0000 c00000000004bac8 0000000000016000 c000000002503500
GPR12: c000000000030990 c000000003190000 00000000106a5898 00000000106a0000
GPR16: 00000000106a5890 c000000007a92000 c000000008180e00 c000000007a8f700
GPR20: c000000007a904b0 0000000010110000 c00000000259d318 5deadbeef0000100
GPR24: 5deadbeef0000122 c000000078422700 c000000009ee88b8 c000000078422778
GPR28: 0000000000000001 800000000280b033 0000000000000000 c0000000555a75a0
NIP [c00000000037ed60] __sanitizer_cov_trace_pc+0x40/0x50
LR [c00000000004bac8] interrupt_exit_kernel_prepare+0x118/0x310
Call Trace:
[c0000000555a74c0] [c00000000004bb68] interrupt_exit_kernel_prepare+0x1b8/0x310 (unreliable)
[c0000000555a7530] [c00000000000f9a8] interrupt_return+0x118/0x1c0
--- interrupt: 900 at __sanitizer_cov_trace_pc+0x0/0x50
...<random previous call chain>...

That looks like the KCOV helper accessing memory that's not safe to
access in the interrupt handling context.

Do not instrument the new syscall entry/exit code with KCOV, GCOV or
UBSAN.

Cc: Nicholas Piggin <npiggin@gmail.com>
Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

be warned: I haven't attempted to reproduce the crash yet,
nor have I been able to test that this fixes it. I will attempt to do
that soon. Logically though, it does seem like this would be a
good thing to do regardless.
---
 arch/powerpc/kernel/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 1c4385852d3d..1d443a7dc8a7 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -156,12 +156,19 @@ obj-$(CONFIG_PPC_SECVAR_SYSFS)	+= secvar-sysfs.o
 GCOV_PROFILE_prom_init.o := n
 KCOV_INSTRUMENT_prom_init.o := n
 UBSAN_SANITIZE_prom_init.o := n
+
 GCOV_PROFILE_kprobes.o := n
 KCOV_INSTRUMENT_kprobes.o := n
 UBSAN_SANITIZE_kprobes.o := n
+
 GCOV_PROFILE_kprobes-ftrace.o := n
 KCOV_INSTRUMENT_kprobes-ftrace.o := n
 UBSAN_SANITIZE_kprobes-ftrace.o := n
+
+GCOV_PROFILE_syscall_64.o := n
+KCOV_INSTRUMENT_syscall_64.o := n
+UBSAN_SANITIZE_syscall_64.o := n
+
 UBSAN_SANITIZE_vdso.o := n
 
 # Necessary for booting with kcov enabled on book3e machines
-- 
2.20.1

