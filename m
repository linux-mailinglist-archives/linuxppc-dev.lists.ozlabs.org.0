Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6563250F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:54:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ5s4pBsz3fQ8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:54:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cZG/TmfI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cZG/TmfI; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYyW72Y2z3d6k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:03 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id u11so3198288plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbXDPVn/6/K9PcQafkWtS0R94LJwb94j0RZ+KsMZVko=;
 b=cZG/TmfIJYP9ySL3cURRthWTojPynINIW6XqbZoJb+2omF6EgjZKQ61a8JJDuzRdnr
 x2VV63vHuuObIA/2cChPJyXmZZdlz3zssKpWwv1u+BBAa9OZ/ekPV4Z22dy4TZ7xe4Op
 RjENg68UGSrRwE+0RTXgFnQVRzkJfLx/3rgCHv/wI/fphgGFf23U+7MJcxCEvgIkQ+PH
 iKC1pb7XyL7H9L6eiCAoow9XILu+EUvmCmqRWRLjMJYTkISODOPcg9BEXkh3VKv0FwSb
 R0BI91c1vvduiIZL4dbjl2hXPCWQ2qmgPhskY0/NSBe7/Ux2aJtfIxt2KqJOldHHi/ur
 DAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbXDPVn/6/K9PcQafkWtS0R94LJwb94j0RZ+KsMZVko=;
 b=Q0Qi5arKcGfi+qW89nnpFDYLc9HkoRZFTVqVFpZfyZ8gzlE0o0n/B/ZNdWsfpoPKpT
 +itX4aoPA8j3LUv+K/LovT7Lbq6RRmiqiSuYzEHq9clygCQEhF02sAzqzTE8VzFYQAae
 THhjSVpySp8Evv1u7EsuCKI/rEMydyyrz1s5+O2sspPTqqW9JubmzmGaB7jo+38zVRD5
 2S9UP0EnJAFNWnN5yrJaFz5sOqEQ3y3u12ZGnAQCfPszKIfckA9SDrjR4DzkT0slVnzh
 rMUe35Rw/QHXa0hUQ2n1hANDYk6jJDxw17DMiGncsVy+bhG1xKMiQn/aES2ck8T15zUx
 7Szw==
X-Gm-Message-State: AOAM530xKSkS+FLlj19PXSFWDNHoVh4juNNn+BMzgZM09xaPvP89veiw
 EyoAtEmjBtWCWQZF00gxC5M=
X-Google-Smtp-Source: ABdhPJyc5gaQwKOIAt8FWXSy3UqBYnhW/0DQWRY2+1dIg+EUjt5VYmoWzjive5AP27muZzAdO2kOfA==
X-Received: by 2002:a17:90a:7f87:: with SMTP id
 m7mr3354890pjl.64.1614260881707; 
 Thu, 25 Feb 2021 05:48:01 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 17/37] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
Date: Thu, 25 Feb 2021 23:46:32 +1000
Message-Id: <20210225134652.2127648-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

LPCR[HDICE]=0 suppresses hypervisor decrementer exceptions on some
processors, so it must be enabled before HDEC is set.

Rather than set it in the host LPCR then setting HDEC, move the HDEC
update to after the guest MMU context (including LPCR) is loaded.
There shouldn't be much concern with delaying HDEC by some 10s or 100s
of nanoseconds by setting it a bit later.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d4770b222d7e..63cc92c45c5d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3490,23 +3490,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
-	/*
-	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
-	 * so set HDICE before writing HDEC.
-	 */
-	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
-	isync();
-
-	hdec = time_limit - mftb();
-	if (hdec < 0) {
-		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
-		isync();
+	tb = mftb();
+	hdec = time_limit - tb;
+	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	}
-	mtspr(SPRN_HDEC, hdec);
 
 	if (vc->tb_offset) {
-		u64 new_tb = mftb() + vc->tb_offset;
+		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
 		tb = mftb();
 		if ((tb & 0xffffff) < (new_tb & 0xffffff))
@@ -3549,6 +3539,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
-- 
2.23.0

