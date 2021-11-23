Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0544459FBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:06:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0Ch4mVkz3cR4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:06:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a7IE+KQW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a7IE+KQW; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzwq4Bcxz3cB2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:31 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id iq11so16153858pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZfCRwkYyosuxbgf1BsHWUIbp8VBVn8OZCtY1mpU6Its=;
 b=a7IE+KQWtGSlMRIIeOhbazH6QrM9z0pWKsqeNfRggJQD22JJoMhcAw62MU8yhfJ0JK
 6EdG3aF2C+uN7e/qps2OYe53UrEJ4r57EXe6bt/a6Fpc/elFFIi9kI7IokzDcfGpRQFE
 xEhw2S7h0Rvy20trEMaiThcoo/+2TBwRNIzRArxaER7AfRhGrfseO0OpvR1Q+r69GdzM
 X4gVH6jmBpbzexR4Wmpww/1fsd12AZqxNYngwVpQ5d75QeIe+kapfpsWaM+GKcH0sTKm
 EDVB9nAW7btS/AC3alTLpmoXp9g1wNXp1A95fsldm1qXBsxGLbkawyVa3qfAYpBDDkt4
 m2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfCRwkYyosuxbgf1BsHWUIbp8VBVn8OZCtY1mpU6Its=;
 b=Lfen06ZIeHafJ1LdrE5BeLV7WnI2kTBAsCSMiAUjfX243Bozk/6i5cH8aKggK7cxlJ
 7kUfLoeoSstuJ3RR+lXS0maQAZ7BPH30do66EQbfUwzIz+8xp62vOHdb79esBsJAyq0L
 zH1rf238U7PBhAYxH/b3uxTurV6E9SkFqwXiO3I1RrF5EJdjabETtEmN1ZcOjH47TgnV
 dNiNOcS8CBED2Gw9PsfEJJgnW9vYfcmqoR+wDJaBkrZbGlPNcOboP6IjGXuR1QPpJA9/
 IVkUDEV+pxCzN44z32QacCK+wTfdyrgK2tEnhHUi2IKkDXVeCfl0p/FWsvlObYRWoldT
 Nqqg==
X-Gm-Message-State: AOAM532eNrwCBpY4V3uAqiMM21eymL+JzRhIWxTOY2NvyfvzsazQPzFt
 a29PIRvnRM/c5TYs7bA6g4mOiTimNWkl2w==
X-Google-Smtp-Source: ABdhPJxAZkpukW8QWTveyH2+h3eF1llC9NMvm8Imm/2VYfsMo4MWs3h+hD+ZTPbu37c70EGtRyGz1w==
X-Received: by 2002:a17:90a:df01:: with SMTP id
 gp1mr1333280pjb.28.1637661209703; 
 Tue, 23 Nov 2021 01:53:29 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 21/53] KVM: PPC: Book3S HV P9: Add kvmppc_stop_thread to
 match kvmppc_start_thread
Date: Tue, 23 Nov 2021 19:51:59 +1000
Message-Id: <20211123095231.1036501-22-npiggin@gmail.com>
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

Small cleanup makes it a bit easier to match up entry and exit
operations.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6b0689589e13..d326e6a20abd 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3070,6 +3070,13 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
 		kvmppc_ipi_thread(cpu);
 }
 
+/* Old path does this in asm */
+static void kvmppc_stop_thread(struct kvm_vcpu *vcpu)
+{
+	vcpu->cpu = -1;
+	vcpu->arch.thread_cpu = -1;
+}
+
 static void kvmppc_wait_for_nap(int n_threads)
 {
 	int cpu = smp_processor_id();
@@ -4310,8 +4317,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		dec = (s32) dec;
 	tb = mftb();
 	vcpu->arch.dec_expires = dec + tb;
-	vcpu->cpu = -1;
-	vcpu->arch.thread_cpu = -1;
 
 	store_spr_state(vcpu);
 
@@ -4808,6 +4813,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 	vtime_account_guest_exit();
 
+	kvmppc_stop_thread(vcpu);
+
 	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
-- 
2.23.0

