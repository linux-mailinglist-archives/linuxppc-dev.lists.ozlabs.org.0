Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18E3B0259
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:06:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NrK20xyz3fWs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:06:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nXsy7rDk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nXsy7rDk; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ng92xjrz3bvC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:45 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id k5so11868030pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0dmCYsk3isHrWBVd9EbNCHjQXM1SSzoE2891T24aTQ=;
 b=nXsy7rDk+i6FzKBhv/WpWQ0dGfEcplkfWDd5Dl6bCyN0GAe5EXq4QSZ1RwE1gOyAMo
 HkOmwiNd6zvcuVOt+tJnU2ZrD63n38CKoxMXkdsyfzZfTRwzJIAvQqNAPkZ5nsQRsdXQ
 fbeUQAiCIZgdA2389cACDgck2PO0v8Z4Z0PBs0VVcIH/d+xAJ59YzmGocNyYajrHA/HO
 o+qYtXZ/wclvkouhaq9rWayTKjlnHY0B0ZNnYzPIGVEK/DRXeuenQmx4I0lXZUqpfuU1
 sGmCgsIGj6xqoUdABIjW8jaBW28zGOMDlKUgSV4XsgkkwPEKvxgk4zxTNYZFxViWiLNC
 2oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0dmCYsk3isHrWBVd9EbNCHjQXM1SSzoE2891T24aTQ=;
 b=BiJpcDP/1+eDgxIULwsBXCNfOxKmzdSkCcoCTWdfYYSZZbYTlz9OGXhhaVw6J/hd63
 MZI+2nTDRZejgdOaovBYw+RB7DqF+B5PVkn3lxmFoMJUIV9KlHvQLrpx51eBzHUnz368
 Cjdq0bpdX3oLPYXh2hqe0tgjMvOuW81sA/s72LXoyTt77qdKTYiTjBbtRBypqN0aHZIl
 ZceE5OQj3hexQhsKgifgFHArvQaOfjuGq4aKPVMpFyhk+RwgcNMsJpRB4PNOXdtQyKLW
 43O+RyIxPeM3IGuNRLaMUQoGKy73gxcNu6GyehnyXKSLrvCa4D49ot7oz5MgMpaOjEYf
 GtaQ==
X-Gm-Message-State: AOAM530BEo0pgsO7JKNcVEzdMFyLMvarzl/l+JdkhKvkcJVKhheoT1Ju
 qVY3/Kw04iBWJmUvxNBDQVk=
X-Google-Smtp-Source: ABdhPJw8xCm9//WytbwWWoOvZMoOdUfSDCugUNHUkbclbRRNYp+rsOgAWV4rphMV891Z4K06wEQtkg==
X-Received: by 2002:a17:90a:5998:: with SMTP id
 l24mr3205269pji.169.1624359522112; 
 Tue, 22 Jun 2021 03:58:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 19/43] KVM: PPC: Book3S HV P9: Add kvmppc_stop_thread to
 match kvmppc_start_thread
Date: Tue, 22 Jun 2021 20:57:12 +1000
Message-Id: <20210622105736.633352-20-npiggin@gmail.com>
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

Small cleanup makes it a bit easier to match up entry and exit
operations.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b8b0695a9312..86c85e303a6d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2948,6 +2948,13 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
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
@@ -4154,8 +4161,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		dec = (s32) dec;
 	tb = mftb();
 	vcpu->arch.dec_expires = dec + tb;
-	vcpu->cpu = -1;
-	vcpu->arch.thread_cpu = -1;
 
 	store_spr_state(vcpu);
 
@@ -4627,6 +4632,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	guest_exit_irqoff();
 
+	kvmppc_stop_thread(vcpu);
+
 	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
-- 
2.23.0

