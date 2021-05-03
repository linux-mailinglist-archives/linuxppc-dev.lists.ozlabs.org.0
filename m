Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF817371427
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 13:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYgTj5pM8z302f
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 21:19:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vGHunZeV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vGHunZeV; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYgTC3y4cz2yYp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 21:18:39 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so5497767pjd.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukJ94CpY+SX6hhF2hPdQl5nc5uTuIyPQlCKhmK5rUkA=;
 b=vGHunZeV+h/5RYM+VPWYH8NOH3JTl8MsovWAp3GfEYwtS0yQ8b0BElsHyvOx7HoUHu
 VgnSwaf03HJsidm53SpWyAXQHOT9esRJGhAKyAb/kLOD9I8auHOIu1EMiKQGfjR4EjCE
 mEvmzfJ3bJ2Sv3HvwLGQyTJRyh0tLpb8xZ1a9jpZkMUqnkaqndmk9/TqVePH2geNGtfZ
 a/KwRR8F66TN1YFmhUDk6PrGjoxL6EPTKPaa6HNhiiJLCz4YBmHlczGeludK7VdbqH3v
 lfpI4aeSAdH2So2LuWH8J2O68Qs7OkG0YhQHub23lSs3Okp+dcw3u7nRR8y1y0ZsUisN
 gkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukJ94CpY+SX6hhF2hPdQl5nc5uTuIyPQlCKhmK5rUkA=;
 b=VgpkuakFn6FdYGt6ulj1UPlwgtPhvxq7x4jOWByrMOzImG3HiQXsVpe/0JBW+pQKIl
 oyBsI4WaKEuoL3V2U0H7BYiIV8eIykTdVLmPJZt7EnB1uZ/uy6BJX4iMaQwTW5ffevpT
 l8KqdDBQ3K1i2V1PoxgVtCoadO7ZvBOdNpk18Nc7vDeyzT+HyAw9fqOWLzCSCCD5DZFy
 Kk6kLyon2Zkh/9Q555YbN63Bn/bs7yUDhDRVVFo7asWalT+7gbEijzGfrnxfERS4lbHL
 HT+hGKm5gvdRL8s2BHmovi1nekd4ovJ/k0TAi0V4WvSMPfsQapaUznPjA306Nkqb73E5
 PKJw==
X-Gm-Message-State: AOAM531K214hcqyoaIqqfJ5/7ILPl9y1rSSgG41/xDGEC743b5c20dJ9
 KMVfnmouGL7BMeHlJB0ev4NWqFHgrEg=
X-Google-Smtp-Source: ABdhPJx4gBO9g3zEe/poM3rhr7W0jQNk3AuAhiJ++zdtfWxoQ3YELmVCNKMsDS1nmWiYeGTJl4PcHg==
X-Received: by 2002:a17:90a:7185:: with SMTP id
 i5mr30592519pjk.92.1620040716276; 
 Mon, 03 May 2021 04:18:36 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 5sm8840281pfi.43.2021.05.03.04.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:18:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Enable hardlockup watchdog for PowerVM
 partitions
Date: Mon,  3 May 2021 21:18:22 +1000
Message-Id: <20210503111822.758423-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/setup_64.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index b779d25761cf..c0e234456863 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -939,15 +939,17 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh)
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
+	if (is_kvm_guest())
 		hardlockup_detector_disable();
 #endif
 
-- 
2.23.0

