Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC53E95C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:17:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFN63YWnz3fYR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:17:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Oga2Xv/c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Oga2Xv/c; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2y2zDbz3cJR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:50 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so10309023pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QqPmgr/sGr5j1zDNMnH53gsmq1i0Fa0vOmXvGCg74L4=;
 b=Oga2Xv/cYKmKt+7qubqKM3fMNcJU24OXsL9KjiqLqi0tF9gDQJqkR5UCarU6Ys2Asl
 Yd+RkuDpGdHGrj4WtMGCQ1UjNAeb9KvlFQYybusL0jtuDX1pY+/0Kfp9FOpFV8OjuEjH
 g4njjLDRuvVhPEHu+K/8DqgAze4cTvbZKJ2yYutvIce3+hKlJpCa7SugTq0fGHqUtRHf
 9qU8ypjya/shZM3RMKgwDiLzCKgl98gH/CNd9Qj1O1xYW29Gg06AvCoS9Bghksz7bfHI
 TWA9e9Jn0UOpasAlC530YmDUgNDxxYMDtgThop6GLcy1TUzLoso1yKZD23MijgLiQcwu
 SjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QqPmgr/sGr5j1zDNMnH53gsmq1i0Fa0vOmXvGCg74L4=;
 b=T5vErfCSgUrWkiuGxsn89XL4P1guCOLOTKFxXXz3lxuqhMkeKKsc44oskej0CEl1i0
 7mRxHHCT+w3Gf6GOd4AHpl/WLutyn4m9JiLWIq/zedbOlJ2sV8PgF7JaH75/o3qIFSCj
 B2XxfLYKWFUY37IgB1mzVmMpr6aE9pmoRPLrMOebjilDUDryubO3Na4IkIRt4D3BmJ8q
 HKbt3HKrrc2PnvLgMluRaAq/WF4pcPFOT0Qi9hkmm/rbQ2IqApwI6blcoOmcpiravdxt
 O+oCp+n+UgMvVXgvqQRoyURQA2/56lhvxtrMVwOrH1jHu+PSwGPBBKPxTkRcMFwJTn+D
 ziUw==
X-Gm-Message-State: AOAM531rD8AregJbobDICOvENsJbZFqMITgodCVuTMHfQ7INQ0LdUb29
 kdjw2ScqIsb8C3szkI9lDZsoPoQrpVM=
X-Google-Smtp-Source: ABdhPJyEilrPW7asJOvFeaFex2/BT3EDl9ATGVLj6BS67i90hGQjqkAIxNbcmDCowWQj7LwcesqaMg==
X-Received: by 2002:a17:90a:db44:: with SMTP id
 u4mr11278276pjx.180.1628697768491; 
 Wed, 11 Aug 2021 09:02:48 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 24/60] KVM: PPC: Book3S HV P9: Factor out yield_count
 increment
Date: Thu, 12 Aug 2021 02:00:58 +1000
Message-Id: <20210811160134.904987-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
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
index 9ff7e3ea70f9..fa12a3efeeb2 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4117,6 +4117,16 @@ static inline bool hcall_is_xics(unsigned long req)
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
@@ -4145,12 +4155,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4278,12 +4283,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

