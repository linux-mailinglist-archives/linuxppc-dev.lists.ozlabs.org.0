Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D4E353ADD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:34:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCrY3FRzz3gd3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:34:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NWlVgz69;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NWlVgz69; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCYd23zpz30L2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:56 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so7073164pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1/wLv6JH1sf1fLvgZJI8q0x4TVI1vTVyQKpt0OY8xU=;
 b=NWlVgz69yj6AWGgJ6H1qkeg0I17SG6FhY6bKCuPGszzvL8bcvL/M5+2KtsT6lcNMO+
 H0it5QvZ0jh8d4zObf/uupQXBA5VK+LR/dBQO9lloi3fXMdVvpBRQJY3aumB6zYM9rpn
 /86H4PlqdyAlIWHKGnhGQMMHM0NsdJIDjOYqPsiegRzoIS4Gh3NoMhkjB010vjXdVGqF
 HiCxuw6IJEWhTDZV+rxCGC5FedTtKu34W8IKLtGFR0b83jl6eILYquxil6JFJLV8/obd
 etuJABWBuOJGTGoKp1rHhrR/Sld9tmTzx4CkvA0RqTsT4eShLtpxO9pnL/LWEsMq2W9t
 AiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S1/wLv6JH1sf1fLvgZJI8q0x4TVI1vTVyQKpt0OY8xU=;
 b=DZdR1YsPlHYlfd7G8CEcoa8BPAn4Fo1QWVVMXwmxJzKXe08k3f/QcfuO+/9jSn2BEF
 a2ENhm+CQBx8f3l2fyGk4RtCMTQWeSQlHGsvHJm2eVdzy+VE1QWv8dQHJE+fj5Qjmoz8
 g9Zn9P5S8X5H2ltSJ72hYS5x7wqumACJWNmEuSPRKfe5C8LIGmJq4ye6ExRA72NVpxnL
 lmThYb2ASyOGG0z4EO7ads3IRETjgdiLInMbqIcZivW240UkVoFlEQsKRpgBMYdwipqE
 vyuCE9Bd1adgGE5/vYif3wHD3bQuokNUqgY4SddmPu66QJd0TVkW7WPEZP4qLCDQ7W3d
 a6oQ==
X-Gm-Message-State: AOAM530T0p4YkH2iG5T5DbWjoopnCf1i01+LGP3b2DYmpttB3cYOi/Rc
 uO4kJ5KfVxPie0AXJ2GTD+o=
X-Google-Smtp-Source: ABdhPJxkEQxlb7eZ2ibgPEgugM6FftrbQed36RZUUwugq3af2SEZ/9DUcu58amm9JQIaj8nFxO/BVw==
X-Received: by 2002:a17:902:704b:b029:e9:b5e:5333 with SMTP id
 h11-20020a170902704bb02900e90b5e5333mr2890781plt.78.1617585715349; 
 Sun, 04 Apr 2021 18:21:55 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 33/48] KVM: PPC: Book3S HV P9: Improve exit timing
 accounting coverage
Date: Mon,  5 Apr 2021 11:19:33 +1000
Message-Id: <20210405011948.675354-34-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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

The C conversion caused exit timing to become a bit cramped. Expand it
to cover more of the entry and exit code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index e93d2a6456ff..44c77f907f91 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -154,6 +154,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	start_timing(vcpu, &vcpu->arch.rm_entry);
+
 	if (vc->tb_offset) {
 		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -204,8 +206,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	start_timing(vcpu, &vcpu->arch.rm_entry);
-
 	vcpu->arch.ceded = 0;
 
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
@@ -349,8 +349,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
-	end_timing(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -415,6 +413,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
+	end_timing(vcpu);
+
 	return trap;
 }
 EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.23.0

