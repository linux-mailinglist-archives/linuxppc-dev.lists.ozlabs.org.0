Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B572732EDF6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWPY5HcMz3f4d
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:10:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ueRkePuv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ueRkePuv; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWL92Fshz3dLM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:13 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id fu20so2029568pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/9pLvHjgsuLCE6pHCPiCdL1oBObGuiPVVUyPiGkWZU=;
 b=ueRkePuvqOezhSuwk/Ngsf9NT32sJ20qRbVioCWiJZJGbtfAP4zSuVZu0a3qwwE2Ni
 3PyVllKl9JUr8CAMd2q18ybLjua8QblZGFVTo9laatS9uL1eb+qUqN8kxOdCu1sK3hS/
 MGzW6t7FN1HrStwbkVfSqSgb7PFWaOlhtLBqgbTkqB9g5IeGyp56vIa0DO846/nEn1hl
 3QnJuFDpNFceWF3wdfPJP+8EFCT+pak9RutnT05Wr8q3xu8oyVbFIfMxhz/FgKIO2ihK
 EVExM7Jg4+6e6aXKHs1qTpzhpMwMgiL0cIYx+JZD+u58fxoJkeekJSCl5x95h37LPf0F
 llNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/9pLvHjgsuLCE6pHCPiCdL1oBObGuiPVVUyPiGkWZU=;
 b=KxmKAuaNNEswLDhL7wtojoOPZcy5zpAM4RImr54wrk4dNQSQr9qDL5CcTfbwgkUHjR
 SWCC9EfPWb6p3dIq7CmBul6rpDihsZmcm9LYo88ptO2YpmdJ4efojeDfPtfsvqRK4sd3
 jygDtr/PNNj46nyhkDM4SBdBT69nf3llbLLjXUO33V81dzVUZ+pzwm2aLX3wicnzukze
 Vqf51Y/cy31Tron1+njPY1i/V6ewFl8wWlA0IjCb1ZfpUD7lmhw2I0VJeheYO/8WhGqh
 vdaq31EPDNW/hcREODnpBw43uZ/0HBKcLfUBcUiIGwd4vFF82sIKHARzm0Fc2EsUfZ4x
 GidQ==
X-Gm-Message-State: AOAM531pIjWGpNcEj/q9u3mKnLmWPPH6Gsybka2jrh1UOX8YZNfUiT61
 3Kbf19pkGJWJ7Cs46Nlx9R0=
X-Google-Smtp-Source: ABdhPJyGfRrSfR4JvRpTQwHxApWefn7VHhJj5tBlCD623Uy/vrh8l4AdA0O6qs1tiVwrz+GS2lWK2g==
X-Received: by 2002:a17:902:9b93:b029:e0:a40b:cbd7 with SMTP id
 y19-20020a1709029b93b02900e0a40bcbd7mr8885799plp.16.1614956831173; 
 Fri, 05 Mar 2021 07:07:11 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 07/41] powerpc/64s: remove KVM SKIP test from instruction
 breakpoint handler
Date: Sat,  6 Mar 2021 01:06:04 +1000
Message-Id: <20210305150638.2675513-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
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

Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a027600beeb1..0097e0676ed7 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2553,7 +2553,6 @@ EXC_VIRT_NONE(0x5200, 0x100)
 INT_DEFINE_BEGIN(instruction_breakpoint)
 	IVEC=0x1300
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
-	IKVM_SKIP=1
 	IKVM_REAL=1
 #endif
 INT_DEFINE_END(instruction_breakpoint)
-- 
2.23.0

