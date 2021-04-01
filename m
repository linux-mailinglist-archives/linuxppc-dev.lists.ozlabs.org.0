Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B93515FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6DF5nSfz3g0k
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:14:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hjJLJ58x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hjJLJ58x; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6122l6Vz3cG4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:54 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so3235919pjc.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AnRl8WcjklbuN1r+S8ezp+J4WnoJSRYIUkLRybU4A+c=;
 b=hjJLJ58xCqw2n9W1fAgQE1ENpJtJC7yCoPw5A0p2EBEuhBjewx3PWPMaLnqpY98jt6
 4WkKuIOarNHMQ1EgYxvWLc60OmRhOx2AoOcezeYukUj8tQQHxIPLENXiFA/3urOPxLAC
 CHfv38uht2lfOp0LvCE4phMrcfCKJKWAVCq8UM/AEt7vyUmc3xlk6GcnPOtnYeus9D7j
 na87EpL7T/L51RQ5B9+xZ93Y9W08GyJOljilv1j8tMAEh6O0v10MLq3xf4s6Tr3gq95r
 tCZ6WMl4vdXHjnT+VGq8Y+PxKqzcJ5y9dYMcLK6cgjSQOQkAF/XAVISTjNeGsJi0JNRd
 qLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AnRl8WcjklbuN1r+S8ezp+J4WnoJSRYIUkLRybU4A+c=;
 b=ncAsQMswdq3CaCcdfJneMpLJgFoD7oBhiZhP9nsydr9NMc5Hr9u0khsQbmQ2fF6lh2
 GCy6XcIjk6FZPH6QJl16w9PoIXCTd/vqI8dT9UXK3r0ESUKaiww2zf0+rQUIBW4oVfmG
 xc7Kpa/gb8CqMWFE7cjHoYwem1hRPqy68kVAOU+9JiU+tH7Yo/QqibR9JbDQFsntETO6
 VXHXpaJs57f0FH90JcuC0nTgWIlO0ksHkU2jrtRdQc091RtX5cv+cFwwv+mFcHfqXQ/A
 zhJxFKJV/hCW2IR+AJ2IyMe+dqdd0tcI11MDtrdRy6kVpqcanFXgbMwXh/dSujLuBxm0
 erUQ==
X-Gm-Message-State: AOAM533uXQc3nsMGmR/IASXDKDkSmUSrQMeJR/LOgMv8CA20Yd7LwlRq
 rOD9Ny/eKfxlV2oUv8zFO192ryOuNt0=
X-Google-Smtp-Source: ABdhPJzWqS+fN/xNOWDjumhfmHUsxgAtzyt4D9N40suRo2G0aQuekZDB9ZNXHBOdbMAMNbbncGPFtQ==
X-Received: by 2002:a17:902:a415:b029:e7:137b:ef9c with SMTP id
 p21-20020a170902a415b02900e7137bef9cmr8184075plq.28.1617289492221; 
 Thu, 01 Apr 2021 08:04:52 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 24/48] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Fri,  2 Apr 2021 01:03:01 +1000
Message-Id: <20210401150325.442125-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/time.h | 2 ++
 arch/powerpc/kernel/time.c      | 1 +
 arch/powerpc/kvm/book3s_hv.c    | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8dd3cdb25338..68d94711811e 100644
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
index b67d93a609a2..fc42594c8223 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -89,6 +89,7 @@ static struct clocksource clocksource_timebase = {
 
 #define DECREMENTER_DEFAULT_MAX 0x7FFFFFFF
 u64 decrementer_max = DECREMENTER_DEFAULT_MAX;
+EXPORT_SYMBOL_GPL(decrementer_max); /* for KVM HDEC */
 
 static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c249f77ea08c..7afa2e7a2867 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3669,7 +3669,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		vc->tb_offset_applied = 0;
 	}
 
-	mtspr(SPRN_HDEC, 0x7fffffff);
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
-- 
2.23.0

