Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039C5B1E5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:16:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNflt0L4wz3bcw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:16:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NZfAgQyi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NZfAgQyi;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNflD3hBCz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:16:06 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id o2-20020a17090a9f8200b0020025a22208so2334822pjp.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fzntS4WX1i90+5q+5N/CxBpfx0CbxwrAKxxx53N9RCA=;
        b=NZfAgQyi4Wy1ApL1CUKUBDdsjHk6n2SyraNpkDyjniA4LhqZA7+G50YXAWcZx+9Nim
         Ll+dKQak3Mq+Y9A9ogLUH0H4tzs/P8RreSPvZitH6EmFUpe4UsHvwu7lqMA4+XkIxVbY
         l5y7WNgBBBprX0efPH0cRFJ7o1Dwayxqsd//b1V6uzmDuH9K+zXFJqh8+w1rqgcAj4Uu
         0CTn+I/dmlvPUxyA29La5iQt/sgBpoQZNCwtYVMZf0avCNLPM481EfpKCRN5RIbZcZVN
         ARfAHHOv5EgcGEJ6mp03s7IinWePMTDoae8VkWu6gB65aaMpcbX0z7TvdNbSjwYY6Fy4
         6XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fzntS4WX1i90+5q+5N/CxBpfx0CbxwrAKxxx53N9RCA=;
        b=MF0udbg1X+x0YMpEuR25CKOfaqCy1uB7TBEjpwFkGcDZJKtigXqrENR0KToB8vACje
         S9JB8S9pO+eCQ6OUx+gXHnPzNl3CG930UJx9C7ELHEoRiKhrJwsQb3cM6Izwnym9WhHz
         ph0niAX+wXDwsUSmLem0IBGlllrQb99VgovFe2Rav3+WdlkJHg1MDTffSmPACgz3yY7e
         i+gMmVUNU8Dka6pQgTk6jW5QZ/BNdZhiOQ5V9Rtpr/X7Isgg5xevYUyMpuTYkmOFceBk
         nK/i8picgFasIvu/C3SLySSxy6bkAmDzXbdi9dc7SQ4Qm6qxWw5tNcBUr7NzitIuqwCN
         r/aw==
X-Gm-Message-State: ACgBeo1UTTZ34W8KQhnCkOhG0LfwanqjqUpwr0QdHR9nw+AqxsOEvgG7
	wezb/5X2MvWvPP/hosCfqvdvGF/U3MSvqQ==
X-Google-Smtp-Source: AA6agR4TaaxdBYjYnRGis443VV3TAgkjbyC1WBG6bwP9QFLruX5qw47U0GOFmYOqKiS+PdoH3OrQ8w==
X-Received: by 2002:a17:903:1ce:b0:16e:f510:6666 with SMTP id e14-20020a17090301ce00b0016ef5106666mr8816709plh.158.1662642962651;
        Thu, 08 Sep 2022 06:16:02 -0700 (PDT)
Received: from bobo.ibm.com ([193.114.109.49])
        by smtp.gmail.com with ESMTPSA id m6-20020a6562c6000000b0041c49af8156sm12836166pgv.6.2022.09.08.06.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:16:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64/interrupt: Fix false warning in context tracking due to idle state
Date: Thu,  8 Sep 2022 23:15:55 +1000
Message-Id: <20220908131555.4079624-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 171476775d32 ("context_tracking: Convert state to atomic_t")
added a CONTEXT_IDLE state which can be encountered by interrupts from
kernel mode in the idle thread, causing a false positive warning.

Fixes: 171476775d32 ("context_tracking: Convert state to atomic_t")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 8069dbc4b8d1..b61555e30c7c 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -195,7 +195,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 		 * so avoid recursion.
 		 */
 		if (TRAP(regs) != INTERRUPT_PROGRAM) {
-			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+			CT_WARN_ON(ct_state() != CONTEXT_KERNEL &&
+				   ct_state() != CONTEXT_IDLE);
 			if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 				BUG_ON(is_implicit_soft_masked(regs));
 		}
-- 
2.37.2

