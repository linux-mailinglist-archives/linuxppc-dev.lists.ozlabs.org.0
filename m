Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B2C3454D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:17:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D4p0Fgkz3dX5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:17:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HuOsbnzo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HuOsbnzo; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cny6fBxz3c50
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:54 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id h3so12525359pfr.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Bs7XHUMbIVuw7QkJEX6gwpyVXR4AO2//Bxh2Wns9Vc=;
 b=HuOsbnzoWSo5wPcaNBAbd+S9V/AFZxTBfRCDdRl4NHB7haqnRXMZaQG/K5jaj/mTcN
 SNWFCa7wjXWXp3DTyRMrC0cdsQWPduJbtDImFxC+5RXR1jTM3kXEHVRV+jfUq50M9zfW
 THWSbSeSCuOXbq4ANET5KlfbSODBAok8bLrlGWPoOxBsaFM6qX4OhQbixjaBm0Na+izH
 1lbxKVzc9IE3OyI9DLRfDOKaVQAmzURLpXriqj2vBkrgqtjW5BksVbPSsTv3PEJ7UAR9
 XTYIivrYDYZxryHUUFAg9jkkeXqj/9ig2sOaw7T/RbhdKQe3+uWYoJ6kuWvVFt86ergV
 K2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Bs7XHUMbIVuw7QkJEX6gwpyVXR4AO2//Bxh2Wns9Vc=;
 b=PuDYUVip5zHKNijSQtKrHsSp4mKVZA4LGm0EXjPSntLThIDIGJM8C4xjBH/LAL5jJs
 GZdpDmxWlYaFuoVcK+fskqsU1M1OR6jjMloq2elVAwR8cGIc4GwxpzEzHavm/iTSI9lc
 wU59oT6G+QXYRAiVkwig7CoBA1TDnEFuu+z/lxK/KF3KduBZim4EyqNMtiRPi+yq4lf5
 ziUDBd9HtZRk6TApfnyoCmAh4GQldmvyoMW/iI5G8FYr8mtE4EJ68DKQ+r6WXl4EuM4p
 yD04OUw+u9c9rdK0DYwLyEf9TUJpgusiuW9vU/xr4fztjupFTeQ6ryvWIgXQoLx083sx
 NPdA==
X-Gm-Message-State: AOAM530Aiy7QfdlyJhC7tU3hAKEsV+qlPdPWymzTAHAngFkUEmLnS2Ew
 OZpnQCSAJJZaZeYcTsboa18=
X-Google-Smtp-Source: ABdhPJy9ia9LiBiNlH+5PtjdyP/GaYHOKYdX4afOPn6Zs/CGfDOOVAW6b2TeBm2rMl/CoOxQDmQlLw==
X-Received: by 2002:a62:2a8b:0:b029:21c:3016:3a9f with SMTP id
 q133-20020a622a8b0000b029021c30163a9fmr1565590pfq.38.1616461492867; 
 Mon, 22 Mar 2021 18:04:52 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 32/46] KVM: PPC: Book3S HV P9: Improve exit timing
 accounting coverage
Date: Tue, 23 Mar 2021 11:02:51 +1000
Message-Id: <20210323010305.1045293-33-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
index a7e5628ac36c..4058a325a7f0 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -159,6 +159,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	start_timing(vcpu, &vcpu->arch.rm_entry);
+
 	if (vc->tb_offset) {
 		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -209,8 +211,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	start_timing(vcpu, &vcpu->arch.rm_entry);
-
 	vcpu->arch.ceded = 0;
 
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
@@ -354,8 +354,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
-	end_timing(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -420,6 +418,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
+	end_timing(vcpu);
+
 	return trap;
 }
 EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.23.0

