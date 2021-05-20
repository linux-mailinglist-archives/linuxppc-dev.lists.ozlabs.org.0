Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27C38AAE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm6jd3kftz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 21:20:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N5ToKNps;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N5ToKNps; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm6hg1XsFz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 21:19:44 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id i5so11660686pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N7OYMJiK3ph+My346s3yNKbIir7x4BD1SgUZTOlPYxY=;
 b=N5ToKNpsxJk1uNpehJvRRdI7vYCgYKH/tOruYcqB7W6ItqhD5tRkgoty9EzYNqzPl6
 WppTyG/1BTYE6E7LDQcdJxtH2e17vyT3/ALQHMeplW0h8HSLAEUb7htd7OOm5u5nbScz
 Ftpjbc813Q3NG6SCGH8vUiN2gnClhuxgkRwLgiMgW+whndI9v9H2a8xAowbsCIu2NcUt
 5WCpdpcr3AsNkISw8OxgDv7fCAGpRFHXnsxfh+y/B8o06MerRwUKx+V8Ko9Hf1sqmHny
 sTPvxDXs8YIiCHOjFBCvKJD7W+Ce1RugUbnVFHgjWLIVqcVzj5vhpQzY45/ycrE0POGC
 aW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N7OYMJiK3ph+My346s3yNKbIir7x4BD1SgUZTOlPYxY=;
 b=fKYYqMrINCQ0u3iSoL+xQjWDUoBOlra0wyDeWEbL/6p9g5oCMP0gW73KIN4AWSUDV+
 uw3kMPawyLtliCar11hRhMnZYVb3q4UO6iXA5ewRwbUpFUpALE4SUeGIQRx2hH0ZC7dv
 38Ie9QSxRdrFBaEeDLbWBYQ6n8UkkolWI0319JmRK6o/Hc+FsAx6xY5Y8ByO+NeQBIN7
 9GiQxFHD4wQIz/yH65BAqXvUkSY4zp+meXQl6p/2pHg3zpijThIOl48VAjZdSdyQHyDD
 lPhyxEXDyjAxlhR+bUbetb45LFrVbMgITG6oYFBfF5uRjPuBSIC7MYndPw7UaL20M4S+
 kYXA==
X-Gm-Message-State: AOAM530tF+ryEzUdqPU7tWHxSsuP1mWP24ttgbeFmdUcm84h+d2jpNQQ
 490Lq0zo4Gh/jAD0X0gXZWKao46nspM=
X-Google-Smtp-Source: ABdhPJx79VA7WovDXVxMGOe865EQdfYMlYVGZOKwUXR2J8sURHglehNkwrfZYuA3dp8OnUhHhiWHzQ==
X-Received: by 2002:a63:4553:: with SMTP id u19mr4074473pgk.323.1621509580883; 
 Thu, 20 May 2021 04:19:40 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id y24sm1856310pfn.81.2021.05.20.04.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:19:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s/syscall: Use pt_regs.trap to distinguish
 syscall ABI difference between sc and scv syscalls
Date: Thu, 20 May 2021 21:19:30 +1000
Message-Id: <20210520111931.2597127-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>, "Dmitry V. Levin" <ldv@altlinux.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sc and scv 0 system calls have different ABI conventions, and
ptracers need to know which system call type is being used if it wants
to look at the syscall registers.

Document that pt_regs.trap can be used for this, and fix one in-tree user
to work with scv 0 syscalls.

Fixes: 7fa95f9adaee ("powerpc/64s: system call support for scv/rfscv instructions")
Reported-by: "Dmitry V. Levin" <ldv@altlinux.org>
Suggested-by: "Dmitry V. Levin" <ldv@altlinux.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/powerpc/syscall64-abi.rst       | 10 +++++++
 tools/testing/selftests/seccomp/seccomp_bpf.c | 27 ++++++++++++-------
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/Documentation/powerpc/syscall64-abi.rst b/Documentation/powerpc/syscall64-abi.rst
index dabee3729e5a..56490c4c0c07 100644
--- a/Documentation/powerpc/syscall64-abi.rst
+++ b/Documentation/powerpc/syscall64-abi.rst
@@ -109,6 +109,16 @@ auxiliary vector.
 
 scv 0 syscalls will always behave as PPC_FEATURE2_HTM_NOSC.
 
+ptrace
+------
+When ptracing system calls (PTRACE_SYSCALL), the pt_regs.trap value contains
+the system call type that can be used to distinguish between sc and scv 0
+system calls, and the different register conventions can be accounted for.
+
+If the value of (pt_regs.trap & 0xfff0) is 0xc00 then the system call was
+performed with the sc instruction, if it is 0x3000 then the system call was
+performed with the scv 0 instruction.
+
 vsyscall
 ========
 
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 98c3b647f54d..e3d5c77a8612 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1753,16 +1753,25 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define SYSCALL_RET_SET(_regs, _val)				\
 	do {							\
 		typeof(_val) _result = (_val);			\
-		/*						\
-		 * A syscall error is signaled by CR0 SO bit	\
-		 * and the code is stored as a positive value.	\
-		 */						\
-		if (_result < 0) {				\
-			SYSCALL_RET(_regs) = -_result;		\
-			(_regs).ccr |= 0x10000000;		\
-		} else {					\
+		if ((_regs.trap & 0xfff0) == 0x3000) {		\
+			/*					\
+			 * scv 0 system call uses -ve result	\
+			 * for error, so no need to adjust.	\
+			 */					\
 			SYSCALL_RET(_regs) = _result;		\
-			(_regs).ccr &= ~0x10000000;		\
+		} else {					\
+			/*					\
+			 * A syscall error is signaled by the	\
+			 * CR0 SO bit and the code is stored as	\
+			 * a positive value.			\
+			 */					\
+			if (_result < 0) {			\
+				SYSCALL_RET(_regs) = -_result;	\
+				(_regs).ccr |= 0x10000000;	\
+			} else {				\
+				SYSCALL_RET(_regs) = _result;	\
+				(_regs).ccr &= ~0x10000000;	\
+			}					\
 		}						\
 	} while (0)
 # define SYSCALL_RET_SET_ON_PTRACE_EXIT
-- 
2.23.0

