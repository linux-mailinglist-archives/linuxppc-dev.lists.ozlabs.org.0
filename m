Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51568B4D4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 05:23:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9CnB0V1Kz3cJF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 15:23:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OwzOhebu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OwzOhebu;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9CmG5Qsnz3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 15:22:52 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id d6-20020a17090ae28600b00230aa72904fso2077790pjz.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Feb 2023 20:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DaSzq8FqzUHiUTcUMRlnptzOUkBQVIQiEEXXE3bN2Lc=;
        b=OwzOhebuvUgPtW9WCTaKUt7vxHiSOs19AobQNeAwVe11n3M9vnQvWkCh7lwxt1Kffp
         mo3/1X6Omof+ZZ2+pOq7l3eOFb6f6MJs/cTWrg9GSz/RH/EHag7MHGHDD9Ze7jGiPMPl
         ArfZ/CNRPPbczOz8sNCDL688CLtUizr4+dClmfYDhhJ9HIwYbUhmaNnKQW64uETVYWYv
         JpLqDpYxY2ZYeVCLQr5wKqoCL0YkKe8ibYztJm9RGfA0ZkTO3XiRdahLybPYjW398tw2
         NuR/U60QQGT2w2qrvMbYEjiUGdZSCNXR1sX0KnrXN5R6+TQfqO3ZMRFY/mgqwSuHcEew
         fciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaSzq8FqzUHiUTcUMRlnptzOUkBQVIQiEEXXE3bN2Lc=;
        b=ETm6Zz0HloLvwHywt4H33gDZ+8FqREZFO3fgEoM56QLOQkmS7xaQflRFE70560mS+L
         uWQDmKPL9UTvpd9gfM0L9nO4CG7i3ay1jt6GV3HPbtZIfDUgxHPIZGMPWDTE37pJ2JO/
         QqlvY+x7lKspj+Pueshv5/mYSgVb1FbMCRYTQBqEZXLG1mngO6POVAhel86WbHw96rLU
         AjANCOC2jLfPPDp5x1Uqr8Gk9vjuhDVV1vTNCswkOATp0qq5x5AQJ/UbIfPWg1kklZQw
         uiTZ8mwWtEl3uMyxdzHb+wiExUOHU5jO8pgEJXyM9UAgdKUkxD1lanDyUhQEibqN+QCh
         1OkA==
X-Gm-Message-State: AO0yUKXrdERKnvOooaUMaWRuQrhKgWu5eqkavO0ObCbKBNVygrPM7k12
	a28SZ8SJ8/q6ThvGy7Bv6VxKGm+dOys=
X-Google-Smtp-Source: AK7set+SAXL+sf6qEwnNuOzN1ySNDtQUEf1K9A4AfD7mlH6yYWvXuSpVoJbQrExT990amlOz9JA3sg==
X-Received: by 2002:a05:6a20:3d92:b0:b9:7a47:bca5 with SMTP id s18-20020a056a203d9200b000b97a47bca5mr25000739pzi.43.1675657368084;
        Sun, 05 Feb 2023 20:22:48 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.47.63])
        by smtp.gmail.com with ESMTPSA id r9-20020a63a009000000b004db2b310f95sm5116323pge.16.2023.02.05.20.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 20:22:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/interrupt: Fix interrupt exit race with security mitigation switch
Date: Mon,  6 Feb 2023 14:22:40 +1000
Message-Id: <20230206042240.92103-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The RFI and STF security mitigation options can flip the
interrupt_exit_not_reentrant static branch condition concurrently with
the interrupt exit code which tests that branch.

Interrupt exit tests this condition to set MSR[EE|RI] for exit, then
again in the case a soft-masked interrupt is found pending, to recover
the MSR so the interrupt can be replayed before attempting to exit
again. If the condition changes between these two tests, the MSR and irq
soft-mask state will become corrupted, leading to warnings and possible
crashes. For example, if the branch is initially true then false,
MSR[EE] will be 0 but PACA_IRQ_HARD_DIS clear and EE may not get
enabled, leading to warnings in irq_64.c.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
The static_branch condition should not be evaluated multiple times by
the caller when coded like this AFAIKS because if code patching is
disabled then it becomes an atomic_read of the key, and if it is enabled
then it should be done with asm volatile so the compiler should be
unable to expand it again.

Thanks,
Nick

 arch/powerpc/kernel/interrupt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index fc6631a80527..0ec1581619db 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -50,16 +50,18 @@ static inline bool exit_must_hard_disable(void)
  */
 static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 {
+	bool must_hard_disable = (exit_must_hard_disable() || !restartable);
+
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
-	if (exit_must_hard_disable() || !restartable)
+	if (must_hard_disable)
 		__hard_EE_RI_disable();
 
 #ifdef CONFIG_PPC64
 	/* This pattern matches prep_irq_for_idle */
 	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable() || !restartable) {
+		if (must_hard_disable) {
 			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 			__hard_RI_enable();
 		}
-- 
2.37.2

