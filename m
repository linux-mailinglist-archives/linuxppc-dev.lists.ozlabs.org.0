Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CEC456887
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 04:17:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwMKV4Wkvz3c72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 14:17:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TTamx8W0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TTamx8W0; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwMJp6C0bz2yXc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 14:16:40 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 206so2352924pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 19:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NmKk8bOUhnAOj8m/UKP24fzkUYK+snNNLKFYgIajHSg=;
 b=TTamx8W0ue5q/J5USPNMMTTvSe8b3xDKOZUA1i5miY6FVzIKwwajxhIB7Eeh/GpWhG
 0Ysi2THPUj3xb8sXwM73iP5Ur6vmiIxLK9GK1CX0vL+wIVYGhLRJORSrr2x+3emO7lDt
 fBwjhheNfGw31tKwBu5NupwS9wZE0QDt7e+qaXDEM5bjEujJT6DjeJTPPTzFR8QegBrB
 c9yQznT+fVj3AzXTcbN7hGy5UtpB6Jvi5WnTxgGh5baNPZfMYa/mfbcPjS8kiX582u73
 HlDUeQMS0iZvVQyVQVB2uvTe5/bhHyJYnAPgywsKPo1idf+LwNebGeEZtdcQgc+VnFjT
 zEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NmKk8bOUhnAOj8m/UKP24fzkUYK+snNNLKFYgIajHSg=;
 b=xM3+I+j2o79zO+J2ZvP2jf4rot3qVj911/tBnJ3ZRckfm+aDLpVc4Sz0ptno6ESdaZ
 dVI+angXXrR000GVjQFCUjq8D/gu8D1QLPNt8IB+Wmt/asqyjJ2d0/pVJgmSNgwFSyjD
 ehBChGOGo1qz6gBJtVSMEWtiqYydPXeLG95zXNxJ4R7RC+jlEWl3FkVpx78zjv3A1pZ0
 2STVPcisSxnkAsAreMfs12R/QVf35dOI6LZcINIGtGr/bTPNhUsHEo8C9ion+qsrfxMG
 4GQ4HWv4jT4CcuKn+i0s41qjWmKwFl0OGBBM0uDrTJW7D6CbHYCS/ycMQNuUyfsG4XA3
 gpaQ==
X-Gm-Message-State: AOAM532Lwj/7U9YRIdEV85GLFqzH0qLOloIoUdH/X01ySP/n/arCX37D
 LKWKFMGYfXqKDFN2Q0peVkDYPGJRWOJ/oA==
X-Google-Smtp-Source: ABdhPJxf1cIJyWB8anXQJJg5zfoUaEoUZnOzgdWBtmprNT1qiU6IeI60i0FfKS+PIB8G/1S/vvRzew==
X-Received: by 2002:a63:85c6:: with SMTP id
 u189mr14736940pgd.377.1637291796213; 
 Thu, 18 Nov 2021 19:16:36 -0800 (PST)
Received: from bobo.ibm.com (60-240-2-228.tpgi.com.au. [60.240.2.228])
 by smtp.gmail.com with ESMTPSA id k91sm817128pja.19.2021.11.18.19.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 19:16:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] KVM: PPC: Book3S HV: Prevent POWER7/8 TLB flush flushing
 SLB
Date: Fri, 19 Nov 2021 13:16:27 +1000
Message-Id: <20211119031627.577853-1-npiggin@gmail.com>
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

The POWER9 ERAT flush instruction is a SLBIA with IH=7, which is a
reserved value on POWER7/8. On POWER8 this invalidates the SLB entries
above index 0, similarly to SLBIA IH=0.

If the SLB entries are invalidated, and then the guest is bypassed, the
host SLB does not get re-loaded, so the bolted entries above 0 will be
lost. This can result in kernel stack access causing a SLB fault.

Kernel stack access causing a SLB fault was responsible for the infamous
mega bug (search "Fix SLB reload bug"). Although since commit
48e7b7695745 ("powerpc/64s/hash: Convert SLB miss handlers to C") that
starts using the kernel stack in the SLB miss handler, it might only
result in an infinite loop of SLB faults. In any case it's a bug.

Fix this by only executing the instruction on >= POWER9 where IH=7 is
defined not to invalidate the SLB. POWER7/8 don't require this ERAT
flush.

Fixes: 5008711259201 ("KVM: PPC: Book3S HV: Invalidate ERAT when flushing guest TLB entries")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index fcf4760a3a0e..70b7a8f97153 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -695,6 +695,7 @@ static void flush_guest_tlb(struct kvm *kvm)
 				       "r" (0) : "memory");
 		}
 		asm volatile("ptesync": : :"memory");
+		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
 		asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST : : :"memory");
 	} else {
 		for (set = 0; set < kvm->arch.tlb_sets; ++set) {
@@ -705,7 +706,9 @@ static void flush_guest_tlb(struct kvm *kvm)
 			rb += PPC_BIT(51);	/* increment set number */
 		}
 		asm volatile("ptesync": : :"memory");
-		asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT : : :"memory");
+		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
+			asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT : : :"memory");
 	}
 }
 
-- 
2.23.0

