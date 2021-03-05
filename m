Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C132EE29
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:15:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWXD59jzz3gRH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:15:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JFn/+97G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JFn/+97G; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWM54lHXz3dXP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:01 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id o6so2192227pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KLeUPsdctybSg2LQNs7cshVt2UuNsiXHqJBvkSSAal8=;
 b=JFn/+97GXyXnDEm4h4yTjgjwYVMImuNQOP8+vVZDJ4gkPaSr9jgoLQomYKDHkdqPEc
 YPfyhU8D7V2NATin2v44YwkhCwUpXxjxsBF/NzTTqcTeeI0TevU4mSJY2tDHL9ckmvAO
 Je3mBxQMpw9/NJv0veg//jsn8p1LTU8V8gjsqUQTIuR07OgyvQ8e6h3GXM1dh/6nCgul
 YT1YMwzUWhaN68caUfNexvgSPUGYnoqF8EFYhflsL6tfrTLjYCH3NBZDrSLtdvaz4QZK
 Pv9krzHxUtVc8phbwcoun9bATGs9GTs0Ya6drVoN81eGxCGZx2wnwcAJbohQqsfGIvxZ
 OBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KLeUPsdctybSg2LQNs7cshVt2UuNsiXHqJBvkSSAal8=;
 b=ZPa0jbc1pCRpYLtzuT1+QdLdF4MSKG3LGedMKr415NrQ24sTLd+zFuEcxHsaScI0HB
 EjtRvAS9l4EWth1gfia641od/2dlh24jEZNrsO4ZtUxDEPFLQ/SputhnLOgOERBiix3D
 WdMJ+hdqpjp745vYLcauZRd/jDCtfayl+336KnAAnrixVL+8ubVvF771PuDqCrpdhMCT
 6pJFd+cODOjqaHYW2Hkm7wRfm7k02CGQoj+rtMxellCO0PXdXC9nwdVUHLc3IPnTKxcE
 qaW9sfn0aLAvb7pmstz8ocyD9cpXDXkQayV4/AQgYh65wkewNcFviZfCCLw8ySVoVr37
 uvvg==
X-Gm-Message-State: AOAM5301nCnqLHObRAiV1I8b2bla5T0/LufeJIvF/4avAE/1F5R+42Pb
 DqwRw+JSbNrGDTKUCzvJI1s=
X-Google-Smtp-Source: ABdhPJwOg6s7IBKtqWNobCU4bQx492QUr5/06k3x0MhIMP/UMbq+0XgfAza3OuPILnEHezXhRM2eWQ==
X-Received: by 2002:a17:90b:1216:: with SMTP id
 gl22mr10876391pjb.99.1614956880025; 
 Fri, 05 Mar 2021 07:08:00 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 21/41] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Sat,  6 Mar 2021 01:06:18 +1000
Message-Id: <20210305150638.2675513-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=0,
this could help reduce needless guest exits due to leftover exceptions on
entering the guest.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h | 2 ++
 arch/powerpc/kvm/book3s_hv.c    | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

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
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ffde1917ab68..24b0680f0ad7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3623,7 +3623,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		vc->tb_offset_applied = 0;
 	}
 
-	mtspr(SPRN_HDEC, 0x7fffffff);
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
-- 
2.23.0

