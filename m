Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763B3E9597
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFCS1BRHz3bmx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:10:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GBHq1Ace;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GBHq1Ace; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2N1V5lz3cRB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:19 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id w14so4172866pjh.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kGMO3KzFWfaiWdxRFMMRg8fmrR2Jvox/ePS+dlDySeM=;
 b=GBHq1AcepfNTDrAR75+JWS/sN0/dqJ8bw/Rvp6fGzw1okqZFnlW8Qnbgt7Y6iwmIyZ
 Xt7vq6puT2R4K2uxhtFwtKq7ABnWTgYwz6CxtgDDokY1YaJA0OhHUKa6o2/BIxh07+qM
 yCpDwJ67cX6FF5PeU2Q4rHFGh1BjAk0+HhppMLUWYMVckZbZskLUl7k83JWLggiTlu/V
 Gc3DhoM0bUHyZk6hPHwrU+k6Cq1JWlSbMQmh/jpBKvGWq4TWtaXg+PgLZY84ExDUvghJ
 NFTNlbvQBx6pYdJKcJFgUZyHdcrYuuUysBq+pzApJcsQcnTwFUQubx65mOk9E28e4PlI
 9n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kGMO3KzFWfaiWdxRFMMRg8fmrR2Jvox/ePS+dlDySeM=;
 b=O9ZkvGAPN4b01N+8SyosneVmaCCCyUS2i28wRWr9yWTqVQ2jjzDrIQzUh70f+8fP02
 rSyrzXBiMXxpiiRtDjhmR83bsAeou6RLNCRznJniEiB3DWc9TgYE+Ft13NE7BcV0kXml
 OYTC3ONTYtpr8bgyjtOnTunDUcyGWgjt1pifLTMS/mrvZ9/W0WoPg3Gy5hUZbu3rFDpz
 /+a+aNQm891PMJN5sDEIG5zo2+QvbglXsxgToVOSMY3qYwpnnO1i0EN4J6LkXu82BZbz
 ScaQR9d6wOIwn72YH8F6GODtHpwXqETySR3Y2oUy/IqDr66FxCokFan2oaHlzJQxblYH
 0FRg==
X-Gm-Message-State: AOAM530gSquuIinF3DzQPLN0KhMS/C0XjaHJ1Vu7/LIbi80OMSd/PSux
 B85uLxxsA8RKt5Jhe54AEfp0mnhXcJ0=
X-Google-Smtp-Source: ABdhPJzups4vB4lpN4PHX/B6Vj+o5rtr93EsL4hB0BC1sN6/y7NvThkPJ47sQLjPnBOHYgkBnFRH7g==
X-Received: by 2002:a05:6a00:a0d:b029:38d:6310:36ab with SMTP id
 p13-20020a056a000a0db029038d631036abmr34383437pfh.34.1628697738182; 
 Wed, 11 Aug 2021 09:02:18 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 13/60] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Thu, 12 Aug 2021 02:00:47 +1000
Message-Id: <20210811160134.904987-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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

