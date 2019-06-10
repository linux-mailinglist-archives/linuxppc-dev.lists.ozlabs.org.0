Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E83BFE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 01:32:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N8Z13zkPzDqQq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 09:32:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=radu.rendec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EidV6xiU"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N8VJ2KFBzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 09:29:27 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id m187so1880404ite.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 16:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76DfEPMtFWQ2hvV2rRpLziepRkoXuAh8kDJ8OjCUQ6U=;
 b=EidV6xiUkzkpqHEErKOPuraSgkGy1mh54jKCxRQFG7J9EQaYjlsmHVgNr5WNsKmtZ4
 ncCshTeMCJsyQeW4ywWQUrjSSFS7UYPKSXqKhlXAlSoiyneahhPRtusGDwRHyGyWUop4
 /v3yNZz5kubSZ60t+hzRZre+wjCYrc7r8xVbUvjqwx3qlzCdToy1iuBCW2kyNDIwjv93
 s/d6ETqkDm2029hz0+WTOTNNqk7Ad3GlqHgYYulmVtGX8OKnCDM0izg94Ad4tq45QWgV
 SDumwLPzjR++XHo266jR21A/prjPg8ga37aJcRQ39rNcGjJjhBRKnRASJhURPrmhJwCV
 ldxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76DfEPMtFWQ2hvV2rRpLziepRkoXuAh8kDJ8OjCUQ6U=;
 b=tC0iSH17TdYUUv2Gt3xtjM2QaRY4nf5OvNb9UQu1GAJuV20T+igkinHFNfzYF/+hr0
 WOngEJ+9w3vaJP9LsMhCYttHnxGqTQWDhnDcZ3L3I9QgZt9dB5fxzeZ0rILCzGQ+BncK
 Q97RpjtchaEZqjav2jwP2Xg66CX0+55oNgtYaTwwWBIg0qIhOFLUtLKjzSWQKr3yfIW0
 6nUz+1GJf1n5on/GlNbKNQiLrITFxfUNP+C6LW/As3OwHCzZXrKJ5jF8l6EJEA9q2Mtk
 Ra6kQT1dfkV70tuaQzIghiho+a05yKpFRUjY1nM/um5iZa8c0wF2fO9c3xu/QxInllb6
 +X8w==
X-Gm-Message-State: APjAAAVA23Tdw7VYbstPx+fDahw6VSy03CzDVvJOxeY+PfLtKAGEO/7s
 RrZsXDbcU/JtaLD4H/AzbKrkOx/B6lI=
X-Google-Smtp-Source: APXvYqxI3qpHgdTDXRTiw3KoA/G5mT7Pn1RMb8Zr/g1lBOk9ZrvEQd+B2Zo62e140i06B+20Lg+AEw==
X-Received: by 2002:a05:660c:14b:: with SMTP id
 r11mr16058372itk.44.1560209365707; 
 Mon, 10 Jun 2019 16:29:25 -0700 (PDT)
Received: from bat.kanata.rendec.net
 (CPE00fc8d79db03-CM00fc8d79db00.cpe.net.fido.ca. [72.140.67.131])
 by smtp.gmail.com with ESMTPSA id z138sm488770itc.36.2019.06.10.16.29.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 16:29:25 -0700 (PDT)
From: Radu Rendec <radu.rendec@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] PPC32: fix ptrace() access to FPU registers
Date: Mon, 10 Jun 2019 19:27:58 -0400
Message-Id: <20190610232758.19010-2-radu.rendec@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610232758.19010-1-radu.rendec@gmail.com>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
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
Cc: Oleg Nesterov <oleg@redhat.com>, Radu Rendec <radu.rendec@gmail.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch addresses several issues with ptrace() access to FPU
registers through PTRACE_PEEKUSR/PTRACE_POKEUSR.

Standard CPU registers are of course the size of the machine word on
both PPC32/PPC64, but FPU registers are always 64-bit. Because the
ptrace() can only transfer one `long` at a time with PTRACE_PEEKUSR and
PTRACE_POKEUSR, on PPC32 userspace must do two separate ptrace() calls
to access a whole FPU register.

This patch fixes the code that translates between ptrace() addresses and
indexes into (struct thread_fp_state).fpr, taking into account all cases
for both PPC32/PPC64. In the previous version, on PPC32, the index was
double the correct value, allowing memory to be accessed beyond the
register array. This had the following side effects:
* Access to all FPU registers (except for FPR0) was broken.
* PTRACE_POKEUSR could corrupt memory following the FPU register array.
  That means the remainder of thread_struct, which is by design the last
  field of task_struct. For large enough ptrace() addresses, memory
  access could go even outside task_struct, corrupting the adjacent
  task_struct.

Note that gdb (which is probably the most frequent user of ptrace() with
PTRACE_PEEKUSR/PTRACE_POKEUSR) seems to always read/write all FPU
registers whenever a traced task stops.

Signed-off-by: Radu Rendec <radu.rendec@gmail.com>
---
 arch/powerpc/kernel/ptrace.c | 85 ++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index 684b0b315c32..060e5ed0fad9 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -2991,69 +2991,88 @@ long arch_ptrace(struct task_struct *child, long request,
 	switch (request) {
 	/* read the word at location addr in the USER area. */
 	case PTRACE_PEEKUSR: {
-		unsigned long index, tmp;
+		unsigned long index, fpidx, tmp = 0;
 
 		ret = -EIO;
 		/* convert to index and check */
+		index = addr / sizeof(long);
+		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR))
+			break;
 #ifdef CONFIG_PPC32
-		index = addr >> 2;
-		if ((addr & 3) || (index > PT_FPSCR)
-		    || (child->thread.regs == NULL))
-#else
-		index = addr >> 3;
-		if ((addr & 7) || (index > PT_FPSCR))
-#endif
+		if (child->thread.regs == NULL)
 			break;
+#endif
 
 		CHECK_FULL_REGS(child->thread.regs);
 		if (index < PT_FPR0) {
 			ret = ptrace_get_reg(child, (int) index, &tmp);
 			if (ret)
 				break;
-		} else {
-			unsigned int fpidx = index - PT_FPR0;
+			goto out_peekusr;
+		}
 
-			flush_fp_to_thread(child);
-			if (fpidx < (PT_FPSCR - PT_FPR0))
-				memcpy(&tmp, &child->thread.TS_FPR(fpidx),
-				       sizeof(long));
-			else
-				tmp = child->thread.fp_state.fpscr;
+		flush_fp_to_thread(child);
+#ifdef CONFIG_PPC32
+		if (index == PT_FPSCR - 1)
+			/* corner case for PPC32; do nothing */
+			goto out_peekusr;
+#endif
+		if (index == PT_FPSCR) {
+			tmp = child->thread.fp_state.fpscr;
+			goto out_peekusr;
 		}
+		/*
+		 * FPR is always 64-bit; on PPC32, userspace does two 32-bit
+		 * accesses. Add bit2 to allow accessing the upper half on
+		 * 32-bit; on 64-bit, bit2 is always 0 (we validate it above).
+		 */
+		fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
+		memcpy(&tmp, (void *)&child->thread.TS_FPR(fpidx) + (addr & 4),
+			sizeof(long));
+out_peekusr:
 		ret = put_user(tmp, datalp);
 		break;
 	}
 
 	/* write the word at location addr in the USER area */
 	case PTRACE_POKEUSR: {
-		unsigned long index;
+		unsigned long index, fpidx;
 
 		ret = -EIO;
 		/* convert to index and check */
+		index = addr / sizeof(long);
+		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR))
+			break;
 #ifdef CONFIG_PPC32
-		index = addr >> 2;
-		if ((addr & 3) || (index > PT_FPSCR)
-		    || (child->thread.regs == NULL))
-#else
-		index = addr >> 3;
-		if ((addr & 7) || (index > PT_FPSCR))
-#endif
+		if (child->thread.regs == NULL)
 			break;
+#endif
 
 		CHECK_FULL_REGS(child->thread.regs);
 		if (index < PT_FPR0) {
 			ret = ptrace_put_reg(child, index, data);
-		} else {
-			unsigned int fpidx = index - PT_FPR0;
+			break;
+		}
 
-			flush_fp_to_thread(child);
-			if (fpidx < (PT_FPSCR - PT_FPR0))
-				memcpy(&child->thread.TS_FPR(fpidx), &data,
-				       sizeof(long));
-			else
-				child->thread.fp_state.fpscr = data;
-			ret = 0;
+		ret = 0;
+		flush_fp_to_thread(child);
+#ifdef CONFIG_PPC32
+		if (index == PT_FPSCR - 1)
+			/* corner case for PPC32; do nothing */
+			break;
+#endif
+		if (index == PT_FPSCR) {
+			child->thread.fp_state.fpscr = data;
+			break;
 		}
+		/*
+		 * FPR is always 64-bit; on PPC32, userspace does two 32-bit
+		 * accesses. Add bit2 to allow accessing the upper half on
+		 * 32-bit; on 64-bit, bit2 is always 0 (we validate it above).
+		 */
+		fpidx = (addr - PT_FPR0 * sizeof(long)) / 8;
+		memcpy((void *)&child->thread.TS_FPR(fpidx) + (addr & 4),
+			&data, sizeof(long));
 		break;
 	}
 
-- 
2.20.1

