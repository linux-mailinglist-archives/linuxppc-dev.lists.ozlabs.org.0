Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A061B459F9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:56:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hyzzg3Zqdz3ddf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:55:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nGtGjUNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nGtGjUNP; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzw66P2qz2yph
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:52:54 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so2423417pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fG133+S3wyW3OfhAhVu8lqQQqqT1uod7OE8Hf9+8ids=;
 b=nGtGjUNPTWjkORWhVUZ9RYFWoVar/0215J5d9bhItOGSACLiUS39hA9OcPEPdQT2k3
 nkhoxyhoQ4KWOUijvVBhaKFR6ySvBeJ1IBGw29JbXg9xsdv3obsvuSCb2doFcVuwjVjP
 CjDvp/dBr0/JTnoJoD4yg1htjjf73yY0WHE8WJtFJQVY/jNmm4qCooaa+9cAW1vvEH5N
 jvxO3QGbIyAoaLAFI2n5mKIkShFY4+QFrGGCk4s9pl9LW0WuPrJVZSgb/bF3O+9JeK/J
 4SPCy5SYoRxNnaeby1ZnjAHmT0RkOHAGICd6Th0vT2amYhvF72ZikP/4wWEIZe2MNr8y
 lHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fG133+S3wyW3OfhAhVu8lqQQqqT1uod7OE8Hf9+8ids=;
 b=NzoVpuxQsoO0UY8zRIUis8BXoa/7PPRYrBXMpIstLMPv3rD6yY1/pZM6WQ1nhzjGId
 8jKWeLQ4q26uJMlBFjqCB3flxVzfLPKfLrvwM6SKtaTXy0GjZkqGP3lzZ5qhYMSltskD
 cs8NDlfaYP9KoaDmsh5/HVeuanlxhYws+gvhoxQdY5/m8tvY9rhx7n7rIIOX6xdSxBEr
 ws2vbricFb9dnpHx8skUluQ+c5hDfEKAuSD86SujmMvqXwSOx627Mz4E/z4kg9JgkV2+
 YrzFSgC+b85Vo6NJ86HIXqL0IteVkrObixBJThiyR7MYO+qCJ2+VQF1K/MUEQHTDm2ZK
 6g8A==
X-Gm-Message-State: AOAM533dyYzP9N5INAMtH/SQbIm4QDv1l7/mM5MqVGNcCHTyI7GpBUoN
 SRlzWDGDUTGP2BrJJYLdq7Lpya4GruBy0g==
X-Google-Smtp-Source: ABdhPJyxQJb605aX06a1eQcuLhjLG4znND1RxInEJ2QPiRp6MdGWJfTv5KtHcB0D0C2hGMaSHeXZwQ==
X-Received: by 2002:a17:902:bc8b:b0:143:caf5:4a0e with SMTP id
 bb11-20020a170902bc8b00b00143caf54a0emr5288376plb.38.1637661172750; 
 Tue, 23 Nov 2021 01:52:52 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:52:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/53] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Tue, 23 Nov 2021 19:51:43 +1000
Message-Id: <20211123095231.1036501-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
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
index 374950afec2f..2769d565f842 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -88,6 +88,7 @@ static struct clocksource clocksource_timebase = {
 
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

