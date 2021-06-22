Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 216573B0225
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:00:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nhp6RPyz3cMt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:00:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CttVOXAE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CttVOXAE; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NfT2fByz306r
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:09 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id 69so10248264plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQJWOtbVkwPNfO/EI9YLyg8Eje9VJUdj6/oFZO50+yM=;
 b=CttVOXAEieVfIWAjlLClXAP/Yt9dIqUR+19jk3zfIdCRQ65EB9WOBwqJp7Vj3R7sjn
 9ZV/SyoEtdYKzpIGDyQR7xD7l+NMIeSx/6Waa5akn7ioeJ5s5d8ODHqLVIuctxot+HcZ
 y7qM/ZXeTrR1mLbbHyuXBqUN2gTWgjQC9IlxdZELWqYrfSWznlVZJWWPfqzLJ3OtDcz2
 ehKDO2ovDki3u3zF3AO/N+3huo71ABX7Zgjj1Sya+8yTmHa7aC0vQOynvDQNq42TAf/f
 VLboVnvjM5v/bxBbu6dWKeoUGWNKPNtwUySgO9siNAMQygSOya9dM9F5NWo1Z1BdXVBX
 a0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQJWOtbVkwPNfO/EI9YLyg8Eje9VJUdj6/oFZO50+yM=;
 b=WkUvdmt9/sqJbD6+GS/Agx8Y5XnnmnY54ron386HzbyPgljfGT3HkxCd4pmemBoetC
 5LTjPApzMG95iKrXlW3zLRAjgl4W0/BQ2EMGla+SoG3tMiMGzoraek4mDO0luk0g4ZYC
 69yA8mdkJQeUWgmIMkGXhiJ4CQ9OKVTqVyq6+Rqco0bqumqHnD9cmEWHqAdu5nsQeY5c
 v/aKhgzxu32TLzsI3Xy1dWuHMqiggi3g+o8IXak8nUfEzbKfU8znFFRF1VN0whd9XceO
 mQRhu8ANn+cImWp1T1BE7BwqhO5Els/BRUIb1RvwYblrPrDEzfbmxQ9qBQoaDiHx0zpt
 rQrA==
X-Gm-Message-State: AOAM531QoF297Q2s9XYVVt6MbhBVlzwpdh5irFN9kXEzSs0PPVU2oWHD
 V6vlIxhBO7evOhA4zENb5KJIiwVALwA=
X-Google-Smtp-Source: ABdhPJz7ui0cU6tQe5H0CFwHQ5+WG98e9YSqOP6tcADVcEZhM8JvVDHp7Q54ImYjDIG0Zp1QW5C+DQ==
X-Received: by 2002:a17:90a:8804:: with SMTP id
 s4mr3262818pjn.200.1624359486446; 
 Tue, 22 Jun 2021 03:58:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 04/43] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Tue, 22 Jun 2021 20:56:57 +1000
Message-Id: <20210622105736.633352-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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
index 98bdd96141f2..026b3c0b648c 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -89,6 +89,7 @@ static struct clocksource clocksource_timebase = {
 
 #define DECREMENTER_DEFAULT_MAX 0x7FFFFFFF
 u64 decrementer_max = DECREMENTER_DEFAULT_MAX;
+EXPORT_SYMBOL_GPL(decrementer_max); /* for KVM HDEC */
 
 static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 83f592eadcd2..63afd277c5f3 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -489,7 +489,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		vc->tb_offset_applied = 0;
 	}
 
-	mtspr(SPRN_HDEC, 0x7fffffff);
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
 
 	save_clear_guest_mmu(kvm, vcpu);
 	switch_mmu_to_host(kvm, host_pidr);
-- 
2.23.0

