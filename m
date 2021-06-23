Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D35FC3B11BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 04:29:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8nKf4zYnz3093
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 12:29:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hwnyM257;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hwnyM257; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8nKC60Bcz2xvQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 12:29:33 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id k5so625739pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pVgZomG2N3t7+vPsHQpcHuo2uYvjcac+kMnA+YdwhkM=;
 b=hwnyM257pUoRTEmweG1loWTjYeeY8oqOMlTg88iCzlfQ2jWBeT4pg6r1QPERcIH1wx
 bkQmMRhvipG0EMJnOfr9ozaJlwa5bpeyvwFfge3UaNTW0qmd4GDvi3qamNATrmuNoZBw
 PrVp+O/WBMTPNRhU32QQeK+WSu37F8lfNUtuDS0lnR2FMfAJHEyY4LxIfwdszIqr+f0a
 ql6tQmV1+PamZm5jXAFMcJCv55k2WhVs/YUJU25rpzd5hUvtdRwN7WHS42kQfaz+FjEr
 6RvMYSPpOuxt07ATp5ZFH+UifX+R527UBJ/ZKkG+CjnAScqlnO+7SErWiTlknub+Kpha
 ZNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pVgZomG2N3t7+vPsHQpcHuo2uYvjcac+kMnA+YdwhkM=;
 b=nqAmqVE8YbfaweVGmNrWs2ZbUFr5nndimFr70SR6cldEMjpeHt6prbvcYy4p/5Fsfw
 j2CVbbgt3y3gsdXFLSICoRD0n8glDgMYiVmOESSKHyoInnAiqrlHaYFzH/XBZ+44SsNN
 LC25H3OYZZauSKCKWeG01qVEUuMq1UEY86CxrmN1DijU0mrktHVCHbw151jHxu9EG815
 zRRWAfkyudcASeBEZU0l03RqskEf2XCtZp6tZuKVgTGd8SwhwHNp/9Z/JtDm9GwJRj72
 X+35P90q+HtJLdIuwvvCCQEd0vy962rjOUH8rzDiVDqEM6Efut9aiaT5J6B+dDwAK4M1
 NNtw==
X-Gm-Message-State: AOAM532+xaJ6GQLGwtC5SaJFi1FBXiatOHD40mmjtMQN4BeLbNtYTCYM
 DJuX3DFsHqlkXj4JPYDRioGY3nMBPyk=
X-Google-Smtp-Source: ABdhPJyVRqhnJ1RQocgv3uSmlRxERx51+rk+93fK0rw/ngEDSiqBpQIWQamswAjjWkZTHRuhkhl4bg==
X-Received: by 2002:a17:90b:4b04:: with SMTP id
 lx4mr7233105pjb.54.1624415370734; 
 Tue, 22 Jun 2021 19:29:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b6sm108488pfv.35.2021.06.22.19.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:29:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: accumulate_stolen_time remove irq mask workaround
Date: Wed, 23 Jun 2021 12:29:24 +1000
Message-Id: <20210623022924.704645-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

The caller has been moved to C after irq soft-mask state has been
reconciled, and Linux irqs have been marked as disabled, so this
does not have to play games with irq internals.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/time.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index b67d93a609a2..d0308e804063 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -231,24 +231,13 @@ static u64 scan_dispatch_log(u64 stop_tb)
 void notrace accumulate_stolen_time(void)
 {
 	u64 sst, ust;
-	unsigned long save_irq_soft_mask = irq_soft_mask_return();
 	struct cpu_accounting_data *acct = &local_paca->accounting;
 
-	/* We are called early in the exception entry, before
-	 * soft/hard_enabled are sync'ed to the expected state
-	 * for the exception. We are hard disabled but the PACA
-	 * needs to reflect that so various debug stuff doesn't
-	 * complain
-	 */
-	irq_soft_mask_set(IRQS_DISABLED);
-
 	sst = scan_dispatch_log(acct->starttime_user);
 	ust = scan_dispatch_log(acct->starttime);
 	acct->stime -= sst;
 	acct->utime -= ust;
 	acct->steal_time += ust + sst;
-
-	irq_soft_mask_set(save_irq_soft_mask);
 }
 
 static inline u64 calculate_stolen_time(u64 stop_tb)
-- 
2.23.0

