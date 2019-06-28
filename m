Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557D59384
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:39:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zlv83XyqzDqvg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:39:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LpuE70Nf"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZlmX6dv8zDqmb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:32 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 19so2384505pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f91B2jjCf84mMmS/DNQ/5y9K1fnDu7CzaPLcg7lvt7Q=;
 b=LpuE70NfsXD69HTpKu7KVIt/9KEIHuhlU6Yjn3m7p/OVRSy7q0A9AHnlzAFl3tGg54
 mT5/0jzxCn6iKClVI1SqPh4GC9/e5fCQWKu5A0OrkWq9Ja8mRELIq4dCSn4h7a7I455V
 g190HvkP1T36adFbXOEG26iO2JwU0m4y3NAo3V/8IZnmETu1cv0JB8xJptnb51TGslG5
 EX2V7lyImPNt7SvrrwHq02WnVNAOW5LFQJd3Ny0Qs2OkXCGdV254bIXUwPzvQdVO4TSf
 h2qKsESOdMJiYkYu5x3j0Cx8ZEuEAPOYFiVrf9Mu5wXO03Zr6iC4cEaVre9+et8OtkRh
 7VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f91B2jjCf84mMmS/DNQ/5y9K1fnDu7CzaPLcg7lvt7Q=;
 b=mz6gsL9wVt8kio2itSJd0miZmUgMvAUSmciPjAEV9fbyGbqiRJqYAD/mLy8LTGZpy3
 D/zpbJnKzgP7sMYKJtRPs8dqK0zthc7u3BuIjBoc/wkewBd8oRnpkP5vq7MtJmWL2jeE
 0BbNzo9JUcHJJlrRM5GLzFvY1N5BMs1gENTLkV+Y7KRtcnb6o/4evN4VsczptNrcNXtg
 ph/xnz0d1hSMUsdG+eonJMByzcstHNXQj04YtiI0vzpdLJ8DhO2HoTQfkr6t2fjVG9oD
 +nx2IyfFF1D4BX8cW/+XUorBpyz7ygcMWGGAvb8UCf1s5N1i7bt3g9xsXgX4hqrZWoEN
 YKag==
X-Gm-Message-State: APjAAAUhrNFNZStTwCF9+gnb/1n7KlFVGrAXCUX634B63i4xvLTpn6nm
 R2KtHUaGs4/5e9A8Eq/Ivsh7XxZz
X-Google-Smtp-Source: APXvYqxFb1uran+G3VFQFfDAeRbD0RQQBwWBntujOXLwo9dALn46uERUX5frSiK77AxF1Gvp8ovOCg==
X-Received: by 2002:a63:4f65:: with SMTP id p37mr7350827pgl.327.1561700010881; 
 Thu, 27 Jun 2019 22:33:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/13] powerpc/64s/exception: mtmsrd L=1 cleanup
Date: Fri, 28 Jun 2019 15:33:22 +1000
Message-Id: <20190628053332.22366-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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

All supported 64s CPUs support mtmsrd L=1 instruction, so a cleanup
can be made in sreset and mce handlers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c3a9cb8cdfd3..0804a86f6f28 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -882,11 +882,8 @@ EXC_COMMON_BEGIN(system_reset_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	system_reset_exception
 
-	/* This (and MCE) can be simplified with mtmsrd L=1 */
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
-	li	r0,MSR_RI
-	mfmsr	r9
-	andc	r9,r9,r0
+	li	r9,0
 	mtmsrd	r9,1
 
 	/*
@@ -1081,9 +1078,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 
 #define MACHINE_CHECK_HANDLER_WINDUP			\
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
-	li	r0,MSR_RI;				\
-	mfmsr	r9;		/* get MSR value */	\
-	andc	r9,r9,r0;				\
+	li	r9,0;					\
 	mtmsrd	r9,1;		/* Clear MSR_RI */	\
 	/* Move original SRR0 and SRR1 into the respective regs */	\
 	ld	r9,_MSR(r1);				\
-- 
2.20.1

