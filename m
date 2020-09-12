Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D48852679C4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:10:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVKc1R0TzDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=d1mnMUse; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH04zF0zDqt3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:28 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c196so9227257pfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OInAC9GW/Qn15XLBfoA31qdN7XBIGKQcBMz86oeUNCI=;
 b=d1mnMUsez3jOBFoeA7qprWEYhqBNscyNUCJRSrHACM1kolvFIIVwE0oTDarfqfRRyt
 EZVqDdMOBIDrx85v7uTznjrh1+fZH1TRrnXTBVJXU5uxfzDk9SrvZpuEZ3qybLVI/4Vi
 38ppObnAfNv4LDTV+R926cyWt9vORTT60LLnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OInAC9GW/Qn15XLBfoA31qdN7XBIGKQcBMz86oeUNCI=;
 b=PvL050LiEt/hLP20+5U6cTwbH5eBis0fzS1hlkgmVWLuP8T9Lw60LZTHsxVoJ0+2xJ
 s1Rwz5u23wedTUDVUHgg0FukTj4v+Z5puhW56uJlH1sqOW9KPS6vR2/HnXUJ9qZUCkE0
 fi0uYzG0o3+celzDxRBU8W2T5uH8ijE7ahP13vd79wfZOW7CSfbpLe6pE7+gM58qyvtD
 HpcO22MbeQmJ9Ko87ewTASfDaWQVtu642lbq1aFXnrzV26DIaHYhfXj5yQ6nJSeT1nQQ
 J8+gKYH9FJhzb1wIdfPRCsUX6RXMvZoKCJzFh0TJ3c+Hxh1W4VV89p1Tl4hJDcZjaepl
 cl8A==
X-Gm-Message-State: AOAM533CDljOu1sV9MLKC76OaPkxOMgmYtt+Dsl4MggyFDAh84kClmLf
 fKC0/vVcN4+EefEuQl0/YjIsxA==
X-Google-Smtp-Source: ABdhPJyDPU6BahqLywZ5Wass8ihB9w09WdZMZEJjPIamOh7TwZSYjVn9+opdSDMO1VWUvStVtnivFw==
X-Received: by 2002:a65:5a0b:: with SMTP id y11mr4507630pgs.395.1599908905771; 
 Sat, 12 Sep 2020 04:08:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b10sm4811155pff.85.2020.09.12.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/15] selftests/seccomp: mips: Define SYSCALL_NUM_SET macro
Date: Sat, 12 Sep 2020 04:08:08 -0700
Message-Id: <20200912110820.597135-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the mips special-case in change_syscall().

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 1c83e743bfb1..02a9a6599746 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1742,6 +1742,13 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS		struct pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).regs[2]
 # define SYSCALL_SYSCALL_NUM	regs[4]
+# define SYSCALL_NUM_SET(_regs, _nr)			\
+	do {						\
+		if ((_regs).regs[2] == __NR_O32_Linux)	\
+			(_regs).regs[4] = _nr;		\
+		else					\
+			(_regs).regs[2] = _nr;		\
+	} while (0)
 # define SYSCALL_RET(_regs)	(_regs).regs[2]
 # define SYSCALL_NUM_RET_SHARE_REG
 #elif defined(__xtensa__)
@@ -1839,17 +1846,11 @@ void change_syscall(struct __test_metadata *_metadata,
 
 #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
 	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
-	defined(__xtensa__) || defined(__csky__) || defined(__sh__)
+	defined(__xtensa__) || defined(__csky__) || defined(__sh__) || \
+	defined(__mips__)
 	{
 		SYSCALL_NUM_SET(regs, syscall);
 	}
-#elif defined(__mips__)
-	{
-		if (SYSCALL_NUM(regs) == __NR_O32_Linux)
-			regs.SYSCALL_SYSCALL_NUM = syscall;
-		else
-			SYSCALL_NUM_SET(regs, syscall);
-	}
 
 #elif defined(__arm__)
 # ifndef PTRACE_SET_SYSCALL
-- 
2.25.1

