Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D0459FB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:03:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz07w2b4dz3fFS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:03:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pqFDDuxw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pqFDDuxw; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzwc2MDLz305j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:20 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id u11so16613333plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5NvYTmz9A1ncsZ2kD8oVfNWdQlg9hHK3aBDKA+0jrQ=;
 b=pqFDDuxw42hlD+3s/czD5qazGoFAZj+jLtDc+I9dHtlDd2uFwO5laLVDfbWVA6vxRJ
 tOEgBWSaVigU5tEe2PJUpfMOsYge2vJo99v0nAmKxQfYQS2ELWH0iEL52kp8syBQWGt2
 SatRFuk9513i1g87t/a4Y0AJsHJzYY3hD+wpE9wfRmYh30ysF5ZV60UH4WktVRAeXk5t
 31jMHbULm+nB7BDhz0tSa+4JElvGkSIbtnCF7i1+Qd44Zcrjxh/GC0a14H4iBiH+ZJC2
 1FuPNzpvl5Mie2ZfvvdTcP2NNJPrUuZ6W4TqAKBt5///TBcrcpxh5XmV5gtWD6f+G9Pf
 C91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5NvYTmz9A1ncsZ2kD8oVfNWdQlg9hHK3aBDKA+0jrQ=;
 b=djkPjBeKSDJaWbbV4xN9wywBxVs2Jqj3sZWJB/hktwPfKiSAuL39p1+UAqazwQ1IOB
 ye8NFczPpcanQoeqJmfeUKRRJvZpvyctSW4mVF3JSjL6VWaas9i3XoNvdZC3QEeSY6WN
 qBcg8Q+9YbhnuHSA0uAPr7cm4s3Dq9F3fBLmyzNmJiZy+jtb+tktoS5cwGqsQ2BcfvD+
 GPEvQ+ns1PVoqGWWoXUPPYrEmt4aRR4IjBPB8orKENKYMjlzsx1J8kX+uoY2PLC5DKek
 cCiPxfu/hrBRSCjw92d4BCPC/qcEyS8eprEJ13okx1sGjJXDD11ci8wxsY3uLLKmYWxR
 tFHQ==
X-Gm-Message-State: AOAM530euaflZgai0NlamTygYDlkMIHYQdViqWLQHpvUTLeC1giEsxRm
 rUIE+EGl3TNPKrw2hcAbc014z8uysRgvVw==
X-Google-Smtp-Source: ABdhPJy776xqYeSqY+nbKizT2D+Gj2SlLv/FFPRypU+JCbZDXTjIRTI7u/O0dotflyW8dAeoJ75w4g==
X-Received: by 2002:a17:90a:4212:: with SMTP id
 o18mr1288979pjg.154.1637661198501; 
 Tue, 23 Nov 2021 01:53:18 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 16/53] KVM: PPC: Book3S HV P9: Factor out yield_count
 increment
Date: Tue, 23 Nov 2021 19:51:54 +1000
Message-Id: <20211123095231.1036501-17-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Factor duplicated code into a helper function.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e66ce7a19ac6..bbaf018dcb67 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4131,6 +4131,16 @@ static inline bool hcall_is_xics(unsigned long req)
 		req == H_IPOLL || req == H_XIRR || req == H_XIRR_X;
 }
 
+static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
+{
+	struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
+	if (lp) {
+		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
+		lp->yield_count = cpu_to_be32(yield_count);
+		vcpu->arch.vpa.dirty = 1;
+	}
+}
+
 /*
  * Guest entry for POWER9 and later CPUs.
  */
@@ -4159,12 +4169,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 1;
 	vc->in_guest = 1;
 
-	if (vcpu->arch.vpa.pinned_addr) {
-		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
-		lp->yield_count = cpu_to_be32(yield_count);
-		vcpu->arch.vpa.dirty = 1;
-	}
+	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (cpu_has_feature(CPU_FTR_TM) ||
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
@@ -4292,12 +4297,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
 		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
 
-	if (vcpu->arch.vpa.pinned_addr) {
-		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
-		lp->yield_count = cpu_to_be32(yield_count);
-		vcpu->arch.vpa.dirty = 1;
-	}
+	vcpu_vpa_increment_dispatch(vcpu);
 
 	switch_pmu_to_host(vcpu, &host_os_sprs);
 
-- 
2.23.0

