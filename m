Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBAA2679E6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:16:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVSV0CSWzDqnR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:16:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=S5Lz8j1V; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH03nHbzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:27 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id t14so8187736pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7i0gIW6ZVxe0Kz2oWVVjX2+xeMrxrMhOBimrxOQ4qek=;
 b=S5Lz8j1V+5MDhgIyUtO7Zuk5BIcx/fBEtHJ2uWE1T7i7NSSd7E5LmNCEC6ozr4kpjk
 NQGZhu80esKFrAatPhTFWLyQP2ihxEW1whGoQ8gIlktjuON8UyQm5Ypv2kMvHF8Y5Zyv
 VlZRUx6tzeRSyjNHg7sA1nyP3jA7Nlxc868Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7i0gIW6ZVxe0Kz2oWVVjX2+xeMrxrMhOBimrxOQ4qek=;
 b=l6Oq2GBKHaz+MsQUUywXPwY3KR3ei2NETe5aa8her5b0udJ81Q95ou+b5AHyzomltn
 5cdaayKOpohj05F4t/h3VyQ/NM1wLcfInqPPPWYeiXb5GJoIWQMDP/UPLMLfI21p1VLn
 197LLEZ3NKNuZocp0q0n0zjNcPHW1noLbTr5lkkCYiEnVFGskWW0gmqXG3AGl/byTBuh
 Bh1SIGcvu1DfgesZJ+oS4vXxvGPb6pvVyJgVHCcWxu9XmukWJlJ7ETvilxDS0crtXZR1
 qboKT/tjETaLQytdlMsrtdDT0DUAC18qALzCrm/jNXsRJrzefSywSEVwHSgQ4ZtcZa2A
 Ip9g==
X-Gm-Message-State: AOAM530KhI9l33paJY8uVtbX/axje/Kn6y+ldcD2Z6tswnMLEde4kKeo
 xXmD+aYd+W0kJfDe71Bgju3A0A==
X-Google-Smtp-Source: ABdhPJxMdaGZtbhZDV4yoH9fFgwi/E8qseSTjQ9A8Z/0tOX4x9EdzEbqtsscycxXkFKecHmw+zbWwg==
X-Received: by 2002:a63:5e01:: with SMTP id s1mr58767pgb.421.1599908905027;
 Sat, 12 Sep 2020 04:08:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id mp3sm4063276pjb.33.2020.09.12.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/15] selftests/seccomp: Provide generic syscall setting macro
Date: Sat, 12 Sep 2020 04:08:07 -0700
Message-Id: <20200912110820.597135-3-keescook@chromium.org>
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

In order to avoid "#ifdef"s in the main function bodies, create a new
macro, SYSCALL_NUM_SET(), where arch-specific logic can live.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index fef15080b575..1c83e743bfb1 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1760,6 +1760,17 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # error "Do not know how to find your architecture's registers and syscalls"
 #endif
 
+/*
+ * Most architectures can change the syscall by just updating the
+ * associated register. This is the default if not defined above.
+ */
+#ifndef SYSCALL_NUM_SET
+# define SYSCALL_NUM_SET(_regs, _nr)		\
+	do {					\
+		SYSCALL_NUM(_regs) = (_nr);	\
+	} while (0)
+#endif
+
 /* When the syscall return can't be changed, stub out the tests for it. */
 #ifdef SYSCALL_NUM_RET_SHARE_REG
 # define EXPECT_SYSCALL_RETURN(val, action)	EXPECT_EQ(-1, action)
@@ -1830,14 +1841,14 @@ void change_syscall(struct __test_metadata *_metadata,
 	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
 	defined(__xtensa__) || defined(__csky__) || defined(__sh__)
 	{
-		SYSCALL_NUM(regs) = syscall;
+		SYSCALL_NUM_SET(regs, syscall);
 	}
 #elif defined(__mips__)
 	{
 		if (SYSCALL_NUM(regs) == __NR_O32_Linux)
 			regs.SYSCALL_SYSCALL_NUM = syscall;
 		else
-			SYSCALL_NUM(regs) = syscall;
+			SYSCALL_NUM_SET(regs, syscall);
 	}
 
 #elif defined(__arm__)
-- 
2.25.1

