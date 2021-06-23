Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A57C33B11A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 04:16:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8n1h3S8cz3061
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 12:16:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sivuFxdz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sivuFxdz; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8n175Zrqz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 12:15:37 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so2928654pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 19:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wlf/wyio/OLQ5mTqhYc/JAFwaRR2/l/4EVH4wrPzPk=;
 b=sivuFxdzqknlPW+VqGThJhUNe0eQx0bCpZmuABjEV8/0VCsTlmmVLLt7tUNDTeudZY
 aPEgy5uYAkndRUOQSo1jo+TlU9cNaqHjW7ml8f+ycFKzUV1l6Ar8bapMGvMeCM1Lqa0Q
 IdGSOz7mAl5renv+Ju1afG0yukX5s29JM8SwAcMUXlv+PVm5z7ScQXP/1CIzaqvSHyjE
 ML/GFKE49uYvRf695PQkKp/X87ALmurU8418JR/aXNAtJ3Ixtq8rv9IM5PIIbTM0v3t9
 tAoZU7E2vQD7zBqmNQ15fJEmPnmxKq5gxBRXiokMaYjsqxEB8wqAHBkZZJlUIQjMIQdR
 DgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wlf/wyio/OLQ5mTqhYc/JAFwaRR2/l/4EVH4wrPzPk=;
 b=W7n3o2l85CVYOQ9pE3CYRon0V9YYhJqEMtTnvn90tGm0o7+sc2MK2z4ae3CBtLGzJN
 9E/lbOEXRrxbCiBv3oPrjOuLdSqAJrCIzoZYv57to6ZjP+IuKizG3NiuY2sSkKn4WRMh
 vEOelv9rZvak9xxiO0I5rOOAATOvjyhs+sfiPuam+ZLNvlp4dRlI8rO5KsOlOSkNqJo3
 +m1nMLLU2A7uzrgNWLvzRWGJOg6fJ0V/acSrYHlw4qtF/GPrGH9Fhq5XCePnH2EFdiHk
 TK8f9cZOQyrIpx9GD3DIXxf2yAb56PDJNjHL5WSnfLOsInggfqb8UNA4daLUJ1+if1KP
 UK0w==
X-Gm-Message-State: AOAM5317SwE9wib+tG7/uLRZ75lrdsOSC9DzlwIzc+nLbjAuRonEYKaJ
 8iLO+5jhWpW6g0DjV1Cd1qs2v1mcOzU=
X-Google-Smtp-Source: ABdhPJxahmjjtlFr1FmrUNsux5i21kZMQ6vaxz4I4n11p0tHKTWaQmTR0eLSBHKmxTR26gi6qVFu7w==
X-Received: by 2002:a17:90a:8b0d:: with SMTP id
 y13mr6942065pjn.14.1624414534499; 
 Tue, 22 Jun 2021 19:15:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id p4sm545179pff.148.2021.06.22.19.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:15:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries: Enable hardlockup watchdog for PowerVM
 partitions
Date: Wed, 23 Jun 2021 12:15:28 +1000
Message-Id: <20210623021528.702241-1-npiggin@gmail.com>
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

PowerVM will not arbitrarily oversubscribe or stop guests, page out the
guest kernel text to a NFS volume connected by carrier pigeon to abacus
based storage, etc., as a KVM host might. So PowerVM guests are not
likely to be killed by the hard lockup watchdog in normal operation,
even with shared processor LPARs which still get a minimum allotment of
CPU time.

Enable the hard lockup detector by default on !KVM guests, which we will
assume is PowerVM. It has been useful in finding problems on bare metal
kernels.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Fix 64e build by including kvm_guest.h

 arch/powerpc/kernel/setup_64.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e42b85e4f1aa..428058dc5114 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -33,6 +33,7 @@
 #include <linux/pgtable.h>
 
 #include <asm/debugfs.h>
+#include <asm/kvm_guest.h>
 #include <asm/io.h>
 #include <asm/kdump.h>
 #include <asm/prom.h>
@@ -939,16 +940,20 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh)
  * disable it by default. Book3S has a soft-nmi hardlockup detector based
  * on the decrementer interrupt, so it does not suffer from this problem.
  *
- * It is likely to get false positives in VM guests, so disable it there
- * by default too.
+ * It is likely to get false positives in KVM guests, so disable it there
+ * by default too. PowerVM will not stop or arbitrarily oversubscribe
+ * CPUs, but give a minimum regular allotment even with SPLPAR, so enable
+ * the detector for non-KVM guests, assume PowerVM.
  */
 static int __init disable_hardlockup_detector(void)
 {
 #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
 	hardlockup_detector_disable();
 #else
-	if (firmware_has_feature(FW_FEATURE_LPAR))
-		hardlockup_detector_disable();
+	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+		if (is_kvm_guest())
+			hardlockup_detector_disable();
+	}
 #endif
 
 	return 0;
-- 
2.23.0

