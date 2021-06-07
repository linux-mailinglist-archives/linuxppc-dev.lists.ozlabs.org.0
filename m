Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28639EA3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 01:38:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzVDM71gTz3bxy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 09:38:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iNvzQgQa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iNvzQgQa; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzVCT24wbz2xfx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 09:37:23 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id q25so14296089pfh.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 16:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykLFcK2LoxGfjoebG0xxB7A3F0ZqbVKg91Rb/oevwTk=;
 b=iNvzQgQaOpYJe7eBhX4JiwppQZ96ldQ1sNqJuTbvjJWLWhYoko/3ZmPiQM+PR1kPs+
 OmN4Xn80dudi2b3xyp7kPEp0kRBph5XuSOl5SYbotSZA+LGZh2k9NyVDrU29bTSZKmXC
 GF51skAekhcBp49rnfjoD6BmAUwIGBgnuCBqjxd6S2YMzQKp3a+0rSXlsstoQyp60gpr
 tHgVgbjPiLP8yw6oFBTTKEcwHIu4GyBxb5iyRu0RTkZsu71j6DO9DhBJTMsg3mCtUF21
 Ly56lqNKwZW92kCBkhCqP0P76kFgFMxz27sGnpfpnNc550wPDHqBb59UYjI5C5/lVnbg
 X3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykLFcK2LoxGfjoebG0xxB7A3F0ZqbVKg91Rb/oevwTk=;
 b=TZtGB9/UDdh+dJzr95U+gmkivo/FnIGl/b93tnoP7u04S49eJZdmEbwSlYuho/rFkv
 zT5Ff72mLAcpaddE4rOuqxX5Ml5hcddbTEXSnaZIcw/6Vu/xKmYBe45GmBoQ1VudS2zw
 sqhlsF7DVZoSVzsclgJJ84X1Hea8tBjPHmqbqRZlKge4EVjW/efOFDbOhsQ2ejgKlr8K
 bGp6IOeoEVKQhnZvPoSFi+h8XIu9dOgehp6FO1d9Fn5SmgwB/qevFXGvDQ9tg7Q7PCBI
 438J98iY9Mx6m1/bdE0KNLI0v6z3Od5nvOoyrnBewoe6IC+RcJOVx6UzjEIOBX7YdNQk
 TL6w==
X-Gm-Message-State: AOAM532e/kAsw9s+xB7VTUKyDJ2AFfPdsZBBn9wzOJDP+4GzRJyOFUjs
 MUWepmhNLewNrUWGFNT6R5Ve3UG7Q5E=
X-Google-Smtp-Source: ABdhPJymhVzaHqqTu4o9AcB0VgWacS+kfwbLmQHwBuio6WMq1ZX6gUzisSTudB3R+lLQujW4kRe2WQ==
X-Received: by 2002:aa7:9491:0:b029:2ed:2787:be36 with SMTP id
 z17-20020aa794910000b02902ed2787be36mr12344668pfk.43.1623109037830; 
 Mon, 07 Jun 2021 16:37:17 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id j5sm7450679pgl.70.2021.06.07.16.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 16:37:17 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] selftests/powerpc: Add missing clobbered register to to
 ptrace TM tests
Date: Tue,  8 Jun 2021 09:37:08 +1000
Message-Id: <20210607233709.941102-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA v3.1 removes TM but includes a synthetic implementation for
backwards compatibility.  With this implementation,  the tests
ptrace-tm-spd-gpr and ptrace-tm-gpr should never be able to make any
forward progress and eventually should be killed by the timeout.
Instead on a P10 running in P9 mode, ptrace_tm_gpr fails like so:

test: ptrace_tm_gpr
tags: git_version:unknown
Starting the child
...
...
GPR[27]: 1 Expected: 2
GPR[28]: 1 Expected: 2
GPR[29]: 1 Expected: 2
GPR[30]: 1 Expected: 2
GPR[31]: 1 Expected: 2
[FAIL] Test FAILED on line 98
failure: ptrace_tm_gpr
selftests:  ptrace-tm-gpr [FAIL]

The problem is in the inline assembly of the child. r0 is loaded with a
value in the child's transaction abort handler but this register is not
included in the clobbers list.  This means it is possible that this
statement:
	cptr[1] = 0;
which is meant to signal the parent to wait may actually use the value
placed into r0 by the inline assembly incorrectly signal the parent to
continue.

By inspection the same problem is present in ptrace-tm-spd-gpr.

Adding r0 to the clobbbers list makes the test fail correctly via a
timeout on a P10 running in P8/P9 compatibility mode.

Suggested-by: Michael Neuling <mikey@neuling.org>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c     | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
index 82f7bdc2e5e6..7df7100a29be 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
@@ -57,7 +57,7 @@ void tm_gpr(void)
 		: [gpr_1]"i"(GPR_1), [gpr_2]"i"(GPR_2),
 		[sprn_texasr] "i" (SPRN_TEXASR), [flt_1] "b" (&a),
 		[flt_2] "b" (&b), [cptr1] "b" (&cptr[1])
-		: "memory", "r7", "r8", "r9", "r10",
+		: "memory", "r0", "r7", "r8", "r9", "r10",
 		"r11", "r12", "r13", "r14", "r15", "r16",
 		"r17", "r18", "r19", "r20", "r21", "r22",
 		"r23", "r24", "r25", "r26", "r27", "r28",
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
index ad65be6e8e85..8706bea5d015 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
@@ -65,7 +65,7 @@ void tm_spd_gpr(void)
 		: [gpr_1]"i"(GPR_1), [gpr_2]"i"(GPR_2), [gpr_4]"i"(GPR_4),
 		[sprn_texasr] "i" (SPRN_TEXASR), [flt_1] "b" (&a),
 		[flt_4] "b" (&d)
-		: "memory", "r5", "r6", "r7",
+		: "memory", "r0", "r5", "r6", "r7",
 		"r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
 		"r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
 		"r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31"
-- 
2.25.1

