Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E8FE669
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 21:30:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F930387szF7cj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 07:30:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="qZU2Vvoe"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F91859qYzF7bK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 07:28:58 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id j5so10712514qtn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 12:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=8aU7kUzVAhFuhOReMRZOycjdku8AonlGhKN+nWQwEcs=;
 b=qZU2VvoePDQU3eLe9JKJNqFAfB6pW3vjODUXmQjo5SCY7s9as6Atutaf8UcbhFaGgY
 Bu6LjtDhVcOcB7+VlD0P5hvopbPa5sGsHiH8NCBG3ekUeXRRcFTDTbHuF/KZuIEC8Dj7
 ZQDpjg5kMUyglXyF3nev5ZvParg60xLU4HqVXi+QnRARSn1FyQ1s+o58po9pA+73n2c8
 IemBxZOx1v5MVGR9qr2oIRE/WjtMHXUQ7Ezj18paTbv+ZRAJoP6y67vbtn1fFz7Jddec
 noZa8y0x5ctJYNQB+qk8+8Wn+s8mvR3kzY3vCpcr6fwP2cF2JnR7LkMTiRVJ7qGTpRIB
 Wkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=8aU7kUzVAhFuhOReMRZOycjdku8AonlGhKN+nWQwEcs=;
 b=EQ0VafWNF64pQ1s3Hzt3ywHxPj2cGFGTN+1BtpO8JOgWWDWHcGDF0Q3ROZrUArj8av
 jbdEygyP1WKP41479Hm1AtgTJIk9/3vRsSrRE4hiQu6OxJLHU0E2HvHHhbcfenWmMeAu
 ui/+Jk5OzvnVQN6NPbQLdjEwlih74ACh1RnnvE27IU4GXn+27BL6MoaeCDd2T5COWFVX
 WhXD8RPyZDTgp5uhT4R4FpoghdJ6TIV9tzkbrqT/89rI41WpoCMJgNPI72jmrAnxEqqE
 DLjZiqKaVsWskUv7axIyMWHNpAHq3404aSEVMYlhTtm3kWc7PEX0C5Ebw9cTvJ/H6uHh
 FTwQ==
X-Gm-Message-State: APjAAAUJwZX9M75dpABWqZtX7qLVUn/42p1+UuUVkDgApQwj5r5ozWPD
 xDYt9hvxEBqdKihfa4PEUkKD3A==
X-Google-Smtp-Source: APXvYqzI8Ckyh+jWt6BICzxL5QtcDOjHJG1ESKe4plJopAuswGrSFa6kLgilOaxCBdmbk2Afh+Acqg==
X-Received: by 2002:ac8:1b85:: with SMTP id z5mr15773962qtj.308.1573849734811; 
 Fri, 15 Nov 2019 12:28:54 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id t16sm4583601qkm.73.2019.11.15.12.28.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Nov 2019 12:28:54 -0800 (PST)
Message-ID: <1573849732.5937.136.camel@lca.pw>
Subject: powerpc ftrace broken due to "manual merge of the ftrace tree with
 the arm64 tree"
From: Qian Cai <cai@lca.pw>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Nov 2019 15:28:52 -0500
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

# echo function >/sys/kernel/debug/tracing/current_tracer

It hangs forever with today's linux-next on powerpc. Reverted the conflict fix
[1] as below fixes the issue.

[1] https://lore.kernel.org/linux-next/20191115135357.10386fac@canb.auug.org.au/

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-
generic/vmlinux.lds.h
index 7d0d03a03d4d..a92222f79b53 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -136,29 +136,20 @@
 #endif
 
 #ifdef CONFIG_FTRACE_MCOUNT_RECORD
-/*
- * The ftrace call sites are logged to a section whose name depends on the
- * compiler option used. A given kernel image will only use one, AKA
- * FTRACE_CALLSITE_SECTION. We capture all of them here to avoid header
- * dependencies for FTRACE_CALLSITE_SECTION's definition.
- */
-/*
- * Need to also make ftrace_graph_stub point to ftrace_stub
- * so that the same stub location may have different protocols
- * and not mess up with C verifiers.
- */
-#define MCOUNT_REC()	. = ALIGN(8);				\
+#ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
+#define MCOUNT_REC()	. = ALIGN(8)				\
 			__start_mcount_loc = .;			\
-			KEEP(*(__mcount_loc))			\
 			KEEP(*(__patchable_function_entries))	\
 			__stop_mcount_loc = .;			\
 			ftrace_graph_stub = ftrace_stub;
 #else
-# ifdef CONFIG_FUNCTION_TRACER
-#  define MCOUNT_REC()	ftrace_graph_stub = ftrace_stub;
-# else
-#  define MCOUNT_REC()
-# endif
+#define MCOUNT_REC()	. = ALIGN(8);				\
+			__start_mcount_loc = .;			\
+			KEEP(*(__mcount_loc))			\
+			__stop_mcount_loc = .;
+#endif
+#else
+#define MCOUNT_REC()
 #endif
 
 #ifdef CONFIG_TRACE_BRANCH_PROFILING
