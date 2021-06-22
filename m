Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE3D3B0295
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8P3S2Vmrz3h5G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:16:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GTHYUMdC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GTHYUMdC; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NhB1nYPz3cCw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:38 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id d12so2208983pgd.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUzv02m3WyQdws3Qgp4amAHiWiokFDfVHQvCWRmFqHM=;
 b=GTHYUMdCyOF1KQqSl0K5jEm5GzzKLvbO1X/yqE+rBjTWMdlPvvwl3uuRz52Idcf7h4
 a6LpRSQEcw5mzC6xtKvzimEzNRFTzjR3j/3lMz+EHPqIl2W//ykkZZTnw2dh6Xl/XRZH
 pl9rYK2/70slHq9n/cHMhXYXmITBkridNE7/wFTEdJ35zZn2KqS0sIqXy6TYZm9TloGY
 WDmG0yYQfK8lmh+R02KKWOz1P00878mwLcZB74atHbNONKETQAxTtS0iiOjAEEd9Qg1W
 sOyImA0i7gp9tw303kBikAVOpbT8Fm0oDeHZ8I72sGW3Ahxy4UX2nEXSvKc98//vFVb4
 UWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vUzv02m3WyQdws3Qgp4amAHiWiokFDfVHQvCWRmFqHM=;
 b=cwrQhcJu7pHynWioM7zK+xPvkAwTB72hakIHA0814z02r9J5cuQLy5wvHvIjfMCRel
 Ixi2Pec/0P0qcm+JalK9fpDyJl24ill/123LEJC9mupj/vNeg/SqfAiKQge88sAQhlD8
 T80aHs0H7yUlZpZqE8EOx+fnq817CCbUkRn876tEOlY6ufUJzsVtU9h2eJREJJtXgDhv
 8zQMYyzNwKQJ5zfNyZLRoKYBdeN2XQcI+GTW1eJBC7OIB099ltlMUDAhkCs1Ldc/gNyJ
 NHMjq7cDLqq5gvbps2Qw4wCNASFGlui7Yz5ZpRGGcTDgjW3SHLHsBxVmVM6fgh5MxsQ/
 hlXQ==
X-Gm-Message-State: AOAM533c0kOk9AQCG662u/q1km/V0cKV0CpebJigchXKxrf6Lq6Tda6n
 A5l6HSeYAMERgRvAWQ6OJtQ=
X-Google-Smtp-Source: ABdhPJyNHd+Vi+MtEDpSPdqHCS54Wj74xSL4OhiaTOxGBLdAYM8yfNqMf9XAYT9hRkaLejYTFH8oEA==
X-Received: by 2002:a63:530a:: with SMTP id h10mr3254202pgb.98.1624359574955; 
 Tue, 22 Jun 2021 03:59:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 41/43] KVM: PPC: Book3S HV Nested: Avoid extra mftb() in
 nested entry
Date: Tue, 22 Jun 2021 20:57:34 +1000
Message-Id: <20210622105736.633352-42-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mftb() is expensive and one can be avoided on nested guest dispatch.

If the time checking code distinguishes between the L0 timer and the
nested HV timer, then both can be tested in the same place with the
same mftb() value.

This also nicely illustrates the relationship between the L0 and nested
HV timers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_asm.h  |  1 +
 arch/powerpc/kvm/book3s_hv.c        | 12 ++++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c |  5 -----
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index fbbf3cec92e9..d68d71987d5c 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -79,6 +79,7 @@
 #define BOOK3S_INTERRUPT_FP_UNAVAIL	0x800
 #define BOOK3S_INTERRUPT_DECREMENTER	0x900
 #define BOOK3S_INTERRUPT_HV_DECREMENTER	0x980
+#define BOOK3S_INTERRUPT_NESTED_HV_DECREMENTER	0x1980
 #define BOOK3S_INTERRUPT_DOORBELL	0xa00
 #define BOOK3S_INTERRUPT_SYSCALL	0xc00
 #define BOOK3S_INTERRUPT_TRACE		0xd00
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 9d8277a4c829..7cb9e87b50b7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1410,6 +1410,10 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	run->ready_for_interrupt_injection = 1;
 	switch (vcpu->arch.trap) {
 	/* We're good on these - the host merely wanted to get our attention */
+	case BOOK3S_INTERRUPT_NESTED_HV_DECREMENTER:
+		WARN_ON_ONCE(1); /* Should never happen */
+		vcpu->arch.trap = BOOK3S_INTERRUPT_HV_DECREMENTER;
+		fallthrough;
 	case BOOK3S_INTERRUPT_HV_DECREMENTER:
 		vcpu->stat.dec_exits++;
 		r = RESUME_GUEST;
@@ -1737,6 +1741,12 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		vcpu->stat.ext_intr_exits++;
 		r = RESUME_GUEST;
 		break;
+	/* These need to go to the nested HV */
+	case BOOK3S_INTERRUPT_NESTED_HV_DECREMENTER:
+		vcpu->arch.trap = BOOK3S_INTERRUPT_HV_DECREMENTER;
+		vcpu->stat.dec_exits++;
+		r = RESUME_HOST;
+		break;
 	/* SR/HMI/PMI are HV interrupts that host has handled. Resume guest.*/
 	case BOOK3S_INTERRUPT_HMI:
 	case BOOK3S_INTERRUPT_PERFMON:
@@ -3855,6 +3865,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 	if (next_timer < time_limit)
 		time_limit = next_timer;
+	else if (*tb >= time_limit) /* nested time limit */
+		return BOOK3S_INTERRUPT_NESTED_HV_DECREMENTER;
 
 	vcpu->arch.ceded = 0;
 
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 5a534f7924f2..a92808a927ff 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -361,11 +361,6 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.ret = RESUME_GUEST;
 	vcpu->arch.trap = 0;
 	do {
-		if (mftb() >= hdec_exp) {
-			vcpu->arch.trap = BOOK3S_INTERRUPT_HV_DECREMENTER;
-			r = RESUME_HOST;
-			break;
-		}
 		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, l2_hv.lpcr);
 	} while (is_kvmppc_resume_guest(r));
 
-- 
2.23.0

