Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E91D013D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 23:49:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MBKm49RQzDqrX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 07:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qQsMGlpx; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MBHv12yHzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 07:48:08 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id g16so11735568qtp.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 14:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgpxXurEcy9zZtLcodFISaUMHDUu4yvx13d5eZk7VhE=;
 b=qQsMGlpxbjrua6TZPluaYWlJ0vC0Gut7ZDPZk+tR7FRTEV1pu6b36VlouDfqdyGdo5
 pgyqfrupoXbujMOF5KCyMqw2EyNFdaol7rULyQS50DzMxXn8JTJRe8bgVPoIa/jyh0lI
 5wiOjf3TmDVXGeW34jsFHWYXeccZ2NjASZYNTfNP49fGe/XEdhdSekdIexOQ9RXYV+XW
 6KzSGY9InBMx/onm3lpFUTEUIjeT14ACLw0gsg7tc76IMOh+rJnu+KJuBDExFO8LR0wG
 of2M6PRFbpcLx4rMufuHw5+L+HBoBUcrJk5HmCu6h6dYZAKxn5GEvmYnzeYFDhzYaGUC
 SOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgpxXurEcy9zZtLcodFISaUMHDUu4yvx13d5eZk7VhE=;
 b=X0EfxlPk382rfIZSPW+VdpWah7cjpViC6g7cXV2j9afMxBeiuSWAp1ARBquEKRIsEE
 ekFFHv/glP7+Yu0vDC3m5Uu+/j2P16bj7AUExMqtLb5bNtjl+Wi8kGMANLxRUoU2VDuu
 GucGkAgmFt8IxAcwQyqS9o9ZazoV38FVdtU1EppFfTm/gZbVjeHHMR4itGPlCoWD7zRJ
 QBFq1Z89m/ytjD8My/nA8XpjOPuSn6xS1qc/fOKMIU+xIuOg1U+scbZxMB+TkPHXR2lI
 ircpJY86wNzL03bDanUp0vQEz1xtiQ9efxOts3YKKXIPY22+KZBOlOxPGhodj+rexJDR
 MHCA==
X-Gm-Message-State: AOAM533xWu2ZqAUBMaFpd3WRuIezjIvd4ttEY4rL8jimGEoP4scwAnHa
 r6ShdMI1BxNpIf3JfnSB3CM=
X-Google-Smtp-Source: ABdhPJz+pO2glId38WZUN+1XOagFJOgZwVOZnE0/nwZz7kCir7nYtmKwi1rdCbWjp93JNGygefHeQg==
X-Received: by 2002:ac8:7947:: with SMTP id r7mr1467325qtt.180.1589320084128; 
 Tue, 12 May 2020 14:48:04 -0700 (PDT)
Received: from LeoBras.aus.stglabs.ibm.com
 (179-125-143-209.dynamic.desktop.com.br. [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id d57sm700550qta.51.2020.05.12.14.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:48:03 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>, Enrico Weigelt <info@metux.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leonardo Bras <leobras.c@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 1/1] powerpc/crash: Use NMI context for printk when
 starting to crash
Date: Tue, 12 May 2020 18:45:35 -0300
Message-Id: <20200512214533.93878-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, if printk lock (logbuf_lock) is held by other thread during
crash, there is a chance of deadlocking the crash on next printk, and
blocking a possibly desired kdump.

At the start of default_machine_crash_shutdown, make printk enter
NMI context, as it will use per-cpu buffers to store the message,
and avoid locking logbuf_lock.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

---
Changes since v1:
- Added in-code comment explaining the need of context change
- Function moved to the start of default_machine_crash_shutdown,
  to avoid locking any printk on crashing routine.
- Title was 'Use NMI context for printk after crashing other CPUs'

---
 arch/powerpc/kexec/crash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index d488311efab1..c9a889880214 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -311,6 +311,9 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	unsigned int i;
 	int (*old_handler)(struct pt_regs *regs);
 
+	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
+	printk_nmi_enter();
+
 	/*
 	 * This function is only called after the system
 	 * has panicked or is otherwise in a critical state.
-- 
2.25.4

