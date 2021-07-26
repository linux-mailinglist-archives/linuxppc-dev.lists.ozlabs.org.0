Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CB3D51EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:54:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5fS4B2Pz3dml
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:54:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=T4JDfWBF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=T4JDfWBF; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Z44rBrz30Dg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:08 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so17810987pjm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kGMO3KzFWfaiWdxRFMMRg8fmrR2Jvox/ePS+dlDySeM=;
 b=T4JDfWBFUi5OWwQq4UEJXRpK2IbKJs+ukhR/hf+kauIbzD2aPqKEOVbgZhsFvBh+JX
 RUB/cueg7stI0g0lVEr44BhZ9g2exoOzev9rG4PVl9G7z99TF4FXpinMtBt0RCfYSktX
 S8ugeHUqJ8sS7HQkbyQl6Go9yuFOyKodhq17sRR62ijrc7aY4jSsgQBLehJ+sdyovj2E
 Efwt3iCTkPxucLqHM+NCszZM5/7n+NeGMl3XFJfspJfEKcYFa9w3yOaayonDWr2efAy0
 ProqW08pW75r3xoSuAu18ttes0P1GX+/yoL+fnULmsruHzLEY3CgA5GpdHGdYtBgvIEg
 6OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kGMO3KzFWfaiWdxRFMMRg8fmrR2Jvox/ePS+dlDySeM=;
 b=RLG2UpkEHMrqV215xF3OtvA76fWt30FI2n5EMrqtIXJdnjr8iQbTM6h2OWNcTwYsHV
 U4x/KCWxcrSrAm2Mw7P70tOKb5Ga+8ApzI+vZCwLsk/Z9eGksZMdxC2Jx8LlohKpW5zh
 ITffYUjD0cWJzJDLD/WcDbErUxeAPi+cUEJYexmN4UK5DlrSd+OlxO25ZY4xil5sv3fV
 N5x8syTsonZvJ7kZv+ijc94WYc6eRZ1q9L2QjtKDsgYGHxzNWVgklpbrhYQDV2t1WpO/
 TcPzamcTvVM/RsLROh0Bp6ss4dUZGPakpPJYlC7PFvnsTbsbedO2Bh70+6pA7qaM0Nts
 Du9Q==
X-Gm-Message-State: AOAM531F2gsmEw0KMp0KakY66O1Qk2ntuhARqKZaF2aC0K0E3vdyEe4N
 n3D2chlUmM/6PzKj/aV6Dss=
X-Google-Smtp-Source: ABdhPJwEJ+Et8P+gZNwFbeoqExsDuLzIlB7g/K+Y2zrsv2h1lyvvqSoiCwxddrMfMn7eS3fbGtCJ3Q==
X-Received: by 2002:a17:90b:11d4:: with SMTP id
 gv20mr15488659pjb.200.1627271466497; 
 Sun, 25 Jul 2021 20:51:06 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 09/55] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Mon, 26 Jul 2021 13:49:50 +1000
Message-Id: <20210726035036.739609-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=0,
this could help reduce needless guest exits due to leftover exceptions on
entering the guest.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h       | 2 ++
 arch/powerpc/kernel/time.c            | 1 +
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index fd09b4797fd7..69b6be617772 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -18,6 +18,8 @@
 #include <asm/vdso/timebase.h>
 
 /* time.c */
+extern u64 decrementer_max;
+
 extern unsigned long tb_ticks_per_jiffy;
 extern unsigned long tb_ticks_per_usec;
 extern unsigned long tb_ticks_per_sec;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 01df89918aa4..72d872b49167 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -89,6 +89,7 @@ static struct clocksource clocksource_timebase = {
 
 #define DECREMENTER_DEFAULT_MAX 0x7FFFFFFF
 u64 decrementer_max = DECREMENTER_DEFAULT_MAX;
+EXPORT_SYMBOL_GPL(decrementer_max); /* for KVM HDEC */
 
 static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 961b3d70483c..0ff9ddb5e7ca 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -504,7 +504,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		vc->tb_offset_applied = 0;
 	}
 
-	mtspr(SPRN_HDEC, 0x7fffffff);
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
 
 	save_clear_guest_mmu(kvm, vcpu);
 	switch_mmu_to_host(kvm, host_pidr);
-- 
2.23.0

