Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EB2679EA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:21:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVYh3YdSzDr2K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:21:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NBsYM7ZA; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH40d1YzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:32 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id e4so2146670pln.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3J7MvYoMlaGuN7yVMKkag28LdGQJPgP1WxJ8QtPQoM=;
 b=NBsYM7ZA2xLFPsW+g7xI4uSwuLDS/YWZe+CQs99zby4BiS/UEXeHTutTwxGWe10Faq
 zzVCCULcwcPrx0x8pINH9GHfop8YFq0UHshiMj1cEQVNWRo/v0Oq8echAAh0+52Z5GP7
 wfbnSgaZL/7rVN29Eg/pgrrlbaulEtSUQQPAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3J7MvYoMlaGuN7yVMKkag28LdGQJPgP1WxJ8QtPQoM=;
 b=c8TcHWz7V/hlVZzpZvmEgW1+VkBeCIOXtg7unrK/VNh//qt2F3qJi2o08WQjLDY7mD
 7YQIYuPYrEP0jdeM+E4bk9akiU004mA/gkO/U1zL6dDrLH1mwVBavURWdq3Gp2zP8hF6
 cNS38/tRWS1AZbj0Vfixe2NxNOfrZJazEW/P+ftyM0N0KGN2U7RGPbbQGlAJwbU6Pd+N
 uUW6BobX22/nm1B6zzSOQhn1DJWvAjrL5foGnYKws3bC43u+nBLQJA0Kq7HrHUtqwKd3
 YWxRIrWfqFJjUAd/cA9aqB8W2igqVSJo36zeypJ/Q0qlvFrd1h4IHoMkcHl3FPXAnWO6
 5IkA==
X-Gm-Message-State: AOAM533HTC5ESBMNxIBwp6KXTXDO1a02pGOj3ur5tofO6mb5o2cY+mrx
 kjq7O6y8DbRkkzy1/0IVNYTo+Q==
X-Google-Smtp-Source: ABdhPJxRa+Y7Ek+ZNrL34mW+RpQ1PjHNb9p3FQvoVqIwzTgKyuIG7orY4wHGc9z3T0PDW9rOmddhZQ==
X-Received: by 2002:a17:902:9303:: with SMTP id
 bc3mr6163396plb.170.1599908909019; 
 Sat, 12 Sep 2020 04:08:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z11sm5125838pfc.181.2020.09.12.04.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/15] selftests/seccomp: mips: Remove O32-specific macro
Date: Sat, 12 Sep 2020 04:08:11 -0700
Message-Id: <20200912110820.597135-7-keescook@chromium.org>
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

Instead of having the mips O32 macro special-cased, pull the logic into
the SYSCALL_NUM() macro. Additionally include the ABI headers, since
these appear to have been missing, leaving __NR_O32_Linux undefined.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index cfa606d96086..aa1c224371d1 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1756,9 +1756,19 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define SYSCALL_RET(_regs)	(_regs).gprs[2]
 # define SYSCALL_NUM_RET_SHARE_REG
 #elif defined(__mips__)
+# include <asm/unistd_nr_n32.h>
+# include <asm/unistd_nr_n64.h>
+# include <asm/unistd_nr_o32.h>
 # define ARCH_REGS		struct pt_regs
-# define SYSCALL_NUM(_regs)	(_regs).regs[2]
-# define SYSCALL_SYSCALL_NUM	regs[4]
+# define SYSCALL_NUM(_regs)				\
+	({						\
+		typeof((_regs).regs[2]) _nr;		\
+		if ((_regs).regs[2] == __NR_O32_Linux)	\
+			_nr = (_regs).regs[4];		\
+		else					\
+			_nr = (_regs).regs[2];		\
+		_nr;					\
+	})
 # define SYSCALL_NUM_SET(_regs, _nr)			\
 	do {						\
 		if ((_regs).regs[2] == __NR_O32_Linux)	\
@@ -1838,10 +1848,6 @@ int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 	}
 #endif
 
-#if defined(__mips__)
-	if (SYSCALL_NUM(regs) == __NR_O32_Linux)
-		return regs.SYSCALL_SYSCALL_NUM;
-#endif
 	return SYSCALL_NUM(regs);
 }
 
-- 
2.25.1

