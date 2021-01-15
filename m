Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5052F822B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:25:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHSjm2HCHzDsm5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:25:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q3wk078K; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRyw49snzDshK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:20 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id e9so829785plh.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XmYETZaZqWGmzBaaunziSjPFAHTbCMAk+gCMVRcLc4=;
 b=Q3wk078K41ZVZ6V8dK3+KjPxQxHt2HdGJ184KuSmt/Z9HNEaG+lg8GCofbTHCN7lNT
 tWqc5g7OXV26yXqDijAYYf3k1MJcqexmMEbsiqeFD8xURbYM34vMOb8h4Ot34Xe2Cpnj
 raKvZ8g5bRCN/mKKkyoVFd6Z/177yuqLJv0t6Z5hebWQt8KGC2dxLXsBwFuBF/rMyg2N
 q1SI4pWG1rnH4vjU/AG7/4yscwzu2Cw5HyphvAK4p0yLj9HRaNYXix7TIK+YWWnGkeWQ
 7zic+3X21754JJ+nO3ojpcUsfkH9Rx0v/2q8qXgxUEKz2d6HXljCsnMZWtxV6owCn6OB
 SBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XmYETZaZqWGmzBaaunziSjPFAHTbCMAk+gCMVRcLc4=;
 b=qwzPEnJgKnAiZ8H0AfOiMs9CrB1EupqvmBPZJMGgHvwBVPqUQwPgIML6bx7U6HrUh7
 1exkeyhkN0qGJhQGuUsM1f7iHrhR/TGhCKjHYfe+O6O+O/UD7i01aAKxm/s/gYWE8oZH
 OMZVOHrBTmJQZMGOq3KqWmUD9eiFQWpJxX6Q+id9ES9M0qVlv+yY0MdLiRGR2/0nyslq
 tgdmd6Oj8VFTgMIKaK2yMoj0UXwIeFCYHVhuC70dSdiVVvoUW9cV+HeZEifnhwW7TtCF
 zpEgNtMwvcs0UX2yXnRoe9N9hIb2lPuoGeSJroHFnnvEaZBg93NHDTM9++7MF0mTJK3r
 ilug==
X-Gm-Message-State: AOAM533hvQViJR0E50fYjAnd7Hzjemow4wTxHvjaWfTYrbuaOCI5oHMd
 RmD4NhSkP5lPdDJ9o9BcQpHvmNcC5wY=
X-Google-Smtp-Source: ABdhPJwyvdQ8PtA0lV99a9qErerrlmZsKe0IM03P7w1fxQv6tABqgKRhHd3S61bA6RhlVJ1SX1+ObQ==
X-Received: by 2002:a17:902:242:b029:dc:3baf:2033 with SMTP id
 60-20020a1709020242b02900dc3baf2033mr13473624plc.36.1610729477305; 
 Fri, 15 Jan 2021 08:51:17 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 13/39] powerpc/traps: add NOKPROBE_SYMBOL for sreset and mce
Date: Sat, 16 Jan 2021 02:49:46 +1000
Message-Id: <20210115165012.1260253-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These NMIs could fire any time including inside kprobe code, so
exclude them from kprobes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f3f6af3141ee..738370519937 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -517,6 +517,7 @@ void system_reset_exception(struct pt_regs *regs)
 
 	/* What should we do here? We could issue a shutdown or hard reset. */
 }
+NOKPROBE_SYMBOL(system_reset_exception);
 
 /*
  * I/O accesses can cause machine checks on powermacs.
@@ -843,6 +844,7 @@ void machine_check_exception(struct pt_regs *regs)
 bail:
 	if (nmi) nmi_exit();
 }
+NOKPROBE_SYMBOL(machine_check_exception);
 
 void SMIException(struct pt_regs *regs)
 {
-- 
2.23.0

