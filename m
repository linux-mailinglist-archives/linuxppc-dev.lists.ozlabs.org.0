Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36020BB39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:15:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqRt44d4zDqkd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:15:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3b2t2xg4kakyhxktjgtnommotymuumrk.ius@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=IYUk8Yqg; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqJX6v1lzDr0p
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:09:29 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id o34so7445069pgm.18
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9cJ18y40uUPYFZL7TN4SHcIdjwmkZDveAIhoXIvPo38=;
 b=IYUk8YqgZgCYajUvAr7+TZpYM4MMks4ME5jJR4NVadGy4ZU8CwXELvDm9bauUFB3L6
 MUcT96gdSqW5+5z/avFny8BX08RC9p8Y5njsdOPASFhovoAmh4OpguPdJDLxPdDlL8wH
 sp8gBQ6KdTpddWyZpEu6zGrsSRpgYbXbK7x4cCxZRVANzDO3EjonaRvSwY1PXJroQJmj
 8ohKF8v+doy8LmpsmkdBSyq0EG3AEnmmfRs0Rb2q8rpSFPq3YC+AUHyHeWkgoGopcbJn
 nBDwB0rz8Ui93SdomCLrCW+Ku6Fjn0SFklLb+6i/vy36pSSNMv/TbI0f696FLOb/W9s8
 ZqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9cJ18y40uUPYFZL7TN4SHcIdjwmkZDveAIhoXIvPo38=;
 b=PBMARAqq0jWHli/+MAyCd8NPm/FVxbWJAC9PCTEtSYXSzLz+ySvVxpTYl14fFskq25
 3SS6i7y+r6nEy5KqCAZuGgzJm2hUPIucynn4P3BnxOnemsKQARTyLocBKOUVSUmkXm/6
 9e1ei86IRHcTJpB7GKhAHUPxzX0+gftKrKIt+4vr3CKpE8SQBW1Ln/g/fbyjVf8I+tbw
 RjsE7YWuN90lbRAPt/nkTSXbn8tNP00WPvCi8o72Y6wBOV2dZ7gIDmkIFwZpq7MUO2M1
 36GvTEr8y5FMH4F46Dfvxz2zBSnDO2+QCO8trxRiv5gPVaJL17hlOKkqeQ4UFbAsjHHP
 lQJA==
X-Gm-Message-State: AOAM532z9Jt/HR1ntl0O2Z10L6vVLIh4FAG3jNr62Mo+fVaxsf/4Xh09
 HZH/6flwILnLdpH50jIpBIJCy3PtVuPHa3JqPavHBg==
X-Google-Smtp-Source: ABdhPJzjvOtIhOG1aOdqb6LPRxa8gBDRx7iYFD1jkF8voJyCoykf8S53mwqKxZn9IwZNUt+dngOweMijabbbSnkBKS6K4A==
X-Received: by 2002:a17:90a:70c6:: with SMTP id
 a6mr5043991pjm.16.1593205767469; 
 Fri, 26 Jun 2020 14:09:27 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:07 -0700
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
Message-Id: <20200626210917.358969-3-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 02/12] arch: arm64: add linker section for KUnit test suites
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org, 
 alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com, 
 akpm@linux-foundation.org, rppt@linux.ibm.com, frowand.list@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, monstr@monstr.eu, 
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, 
 chris@zankel.net, jcmvbkbc@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-doc@vger.kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 mcgrof@kernel.org, linux-kselftest@vger.kernel.org, logang@deltatee.com,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a linker section to arm64 where KUnit can put references to its test
suites. This patch is an early step in transitioning to dispatching all
KUnit tests from a centralized executor rather than having each as its
own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/arm64/kernel/vmlinux.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 6827da7f3aa54..a1cae9cc655d7 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -181,6 +181,9 @@ SECTIONS
 		INIT_RAM_FS
 		*(.init.rodata.* .init.bss)	/* from the EFI stub */
 	}
+	.kunit_test_suites : {
+		KUNIT_TEST_SUITES
+	}
 	.exit.data : {
 		EXIT_DATA
 	}
-- 
2.27.0.212.ge8ba1cc988-goog

