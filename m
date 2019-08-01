Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B920C7DA1B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 13:18:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45znpm4Zl9zDqvy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 21:18:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="0uAllgOd"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45znn34hqbzDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 21:16:53 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r1so33876887pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Aug 2019 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCmmwD53XttWvxo3IyfDIXHfbZJtgpbW8gfsweTknQc=;
 b=0uAllgOd6kBw6ydG0LOlEdzT8HhfNVHijvtKG/DJAKmh+Ahcx68Hk05yuOv4XOrs40
 jqnH0GMVIg8KgVvyeGR2Xm44RoKS3NCABjLy/90mHgOjBt4AWHxS5U3+bIpC1he1YaQJ
 ZfGnd7kKldsR9VHN4mJ79sMMaReLmO5IlmiejD+f5dqPEZV25xXxtz0RZIMdtZhlNOG/
 neFpPMPUkG6ipY5zL+6c9O2YRZqQGhz2B1y7adqBIbJ3CxezaQgNbNd5s6Vs9B/8GCmq
 HQYx4yCaxd2pobRlTS45onlA8nOnH+KDhofOv/VYOV1aXVStKOJWQhv+aasXxUVQk4IV
 OLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCmmwD53XttWvxo3IyfDIXHfbZJtgpbW8gfsweTknQc=;
 b=ko8r/z01bKlXkm7+iV0er4bUBvoAg3uMU6TEQP+igHg4LGWaTspMhbblRroEu4Ynbx
 rkVjfTdj7gNy55gYKk5eT6PJawz0RHjlcZ6goDki/doie3QooQyR/pBpsF+EJPt3LVky
 cHEZ8MJhzvKnTc1GpsDYhUpfQZMNxa7+KE6o42opbqGlRwuUwg3ycPlH+r4s81wDZtsp
 F37i8AKEx25vRtrOtGNjF8GDHl8Fb8HdbwMA6hl+N/6K8ZpSWBOpHs29nLbtPOAPvLTj
 8/Uywx2G2huQC3VmIAOyiwMehztl0OGTc5BN51iQFbxqRJPZlRy10u5uxiZ8rtjzTVP5
 zzTA==
X-Gm-Message-State: APjAAAWrMiL81zgU+ZlaOkm0PD5J7rJqfGhfBcJdMY80BgZJhrS1TK/Z
 fcrgFxR0C2T39shdznqXUd0GkFbcUBM=
X-Google-Smtp-Source: APXvYqxL4Zif0AesqFhfVC+nQDAm4y5JMfJQoKlxckCrbXJArYXH3uOvKoaxU9VBAbaGj5HS+4vcsw==
X-Received: by 2002:a63:2447:: with SMTP id k68mr5774653pgk.219.1564658209474; 
 Thu, 01 Aug 2019 04:16:49 -0700 (PDT)
Received: from santosiv.in.ibm.com.com
 ([2401:4900:3314:9120:4451:7c8a:5ea5:454d])
 by smtp.gmail.com with ESMTPSA id a3sm76922371pfl.145.2019.08.01.04.16.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 04:16:48 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/mce: Schedule work from irq_work
Date: Thu,  1 Aug 2019 16:46:25 +0530
Message-Id: <20190801111625.18063-1-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

schedule_work() cannot be called from MCE exception context as MCE can
interrupt even in interrupt disabled context.

fixes: 733e4a4c ("powerpc/mce: hookup memory_failure for UE errors")
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/kernel/mce.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b18df633eae9..0ab6fa7cbbbb 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -144,7 +144,6 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		if (phys_addr != ULONG_MAX) {
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
-			machine_check_ue_event(mce);
 		}
 	}
 	return;
@@ -275,8 +274,7 @@ static void machine_process_ue_event(struct work_struct *work)
 	}
 }
 /*
- * process pending MCE event from the mce event queue. This function will be
- * called during syscall exit.
+ * process pending MCE event from the mce event queue.
  */
 static void machine_check_process_queued_event(struct irq_work *work)
 {
@@ -292,6 +290,10 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	while (__this_cpu_read(mce_queue_count) > 0) {
 		index = __this_cpu_read(mce_queue_count) - 1;
 		evt = this_cpu_ptr(&mce_event_queue[index]);
+
+		if (evt->error_type == MCE_ERROR_TYPE_UE)
+			machine_check_ue_event(evt);
+
 		machine_check_print_event_info(evt, false, false);
 		__this_cpu_dec(mce_queue_count);
 	}
-- 
2.20.1

