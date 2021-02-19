Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0431F520
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:37:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhhh10cknz3cGV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:37:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JGGcOeTK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JGGcOeTK; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhhfj677Cz3bPJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:35:57 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d13so2833180plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 22:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b8gwQXsU+oWm28rWdq4cNryrpKLXUAViiB3s2Y4xHIk=;
 b=JGGcOeTKnBFT8mdrOzezl8KdS+W2Y9fxPzHT8b9PZtf7WN3xHO+pu3TQmlzYsuhJGZ
 GNOEPVoDpysQfKnDilHFe4n/EpvZS/UhT1tmbJ5K+VW/Y6+Khgd1/Brak2Alaz8Xsfru
 lp+G9+sjHE4EfPr/1P5huLTM93TgoEqfoLbefh6F4K44LVvCMWL/E9fQYJn8ZxAgoH3m
 kP4L0SBxw6XjrZ8g0UtajAGfDr4PyHl2VKJfaUE3/vC7cAdn7dwpyUCFll/A8yZ4R5YM
 EL74mRwhE9LzahQuHrYMVfbgHYO9KI6Mt6wlhC7Bbqi/gUCN0z3p3TGLvLuQpMFCmpC1
 xayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b8gwQXsU+oWm28rWdq4cNryrpKLXUAViiB3s2Y4xHIk=;
 b=HfIvVtVDAif3789BpO/ZkqsuoXHNry55JMx2Y/Cjq29ySn7saJ3v4l+hhmpwYhKn5I
 F34677jyhnOVUSzV8/mV810eMQCWe4bBxjWRmUJ2U8A8rXBlmWfqdRhWJKT1L9kUrYV3
 qjVwg5dqCjmYB6M1EA+lvyXUnI1xEGl/1NQKCsQwdoQa1+4I6lqugCxIOaTJ/9qD1bRb
 +N9wfgVmvQ9E7oSqTebV+TREOduUA+H1n0gFV/YO1IALF0nWzFaUQqHFdWOUUhahRVbM
 N4Wm46YPnzeeE/G16DEAILxwjKiG+fwBLManhOMcO53fFE2aMYgy15F/l0laXAxovuGU
 1KIQ==
X-Gm-Message-State: AOAM531RAc3FAoUFmk3VUo95sjVcGeckW4BUrtuIWktoyyUt/paWEXmw
 EOVG+sqDJTLVHoZuTrmu3DU=
X-Google-Smtp-Source: ABdhPJzbHn2NIZSJiZIEFBV8d3q56GiFJlDdhuTXN4418Ep//sYUNuK+itG627a4aUwec0c82QICBA==
X-Received: by 2002:a17:90a:9f96:: with SMTP id
 o22mr7612271pjp.119.1613716556076; 
 Thu, 18 Feb 2021 22:35:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id v16sm7813099pfu.76.2021.02.18.22.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:35:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 02/13] powerpc/64s: remove KVM SKIP test from instruction
 breakpoint handler
Date: Fri, 19 Feb 2021 16:35:31 +1000
Message-Id: <20210219063542.1425130-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219063542.1425130-1-npiggin@gmail.com>
References: <20210219063542.1425130-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code being executed in KVM_GUEST_MODE_SKIP is hypervisor code with
MSR[IR]=0, so the faults of concern are the d-side ones caused by access
to guest context by the hypervisor.

Instruction breakpoint interrupts are not a concern here. It's unlikely
any good would come of causing breaks in this code, but skipping the
instruction that caused it won't help matters (e.g., skip the mtmsr that
sets MSR[DR]=0 or clears KVM_GUEST_MODE_SKIP).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5d0ad3b38e90..5bc689a546ae 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2597,7 +2597,6 @@ EXC_VIRT_NONE(0x5200, 0x100)
 INT_DEFINE_BEGIN(instruction_breakpoint)
 	IVEC=0x1300
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
-	IKVM_SKIP=1
 	IKVM_REAL=1
 #endif
 INT_DEFINE_END(instruction_breakpoint)
-- 
2.23.0

