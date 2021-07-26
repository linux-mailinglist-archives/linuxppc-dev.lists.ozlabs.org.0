Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87923D520E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5pV63Vmz3dh5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:01:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IoOAmkNr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IoOAmkNr; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Zp4Bycz30MF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:46 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so17812441pjm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VyGXv1qn0uoS5eA7BXzADizNISqN4ZTKzrUeAY//9w=;
 b=IoOAmkNrLBRNWr3ilu/SFJPoljfPjGQJCKRHtxFDUFSada09gMtmFGAOSihQ2WsX/m
 Ryz9vUvSkidgc4ZYqw/dJSTvBoiMIDb/IW3dTCou4f2i19wGaN4GHwYDkZknpWlsbcdQ
 Tb/mZJ5HLNkzvzwqz7C75ZWyCipmIn9Ok1NcT7+UQvrYQAk4/n6k5ieEvZfCNO8Sx85x
 v6GZyHcQJ9awqVBqsYK4E3Rkgctd9rTch0GHD4jhAt8odBtXGUHyPJlf6az5ys+iCByR
 4xAyBQuAlRSe6kBfAHuzgR89DdRQSaPIrku7EnaGDDZ+FGsHZVI7ZzGcluhBycJLB6qL
 2aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VyGXv1qn0uoS5eA7BXzADizNISqN4ZTKzrUeAY//9w=;
 b=t7nGUjbOaPA7vcim3SgbC7SuWYIhoRmazz7IhFQMldP+ZpEJ+hjyJ1Rw42qf8ZndnD
 //P/tXk56A/5XNMHhoHp/+nnJGxPX8ij6f7tCpbfPBsHjS9n+P/VnhdizNuamgd23SMM
 hxIXFJRxOFANvl1PVW1zuEsmhsXUpxNzWs6n0h136/eqD5WehK4agkzq5TCbVk3TkbFx
 CKjZRqTJFxn5EtpeGlZYm6SUvrG8tvv8kexZ5DhsthagvrObkhbgYZ0R1tP8ljfDn4Ck
 KtTwPA99OlaBbyOlc3q9/mRmoEDl9M7ZmM9iFMxrgC6dYvCdjx5oFpvfETnM6YyDlkfr
 HnTg==
X-Gm-Message-State: AOAM531ha/iTnOp1ZIHhimIFLAq7mklZzKN/wq4L8YDfbhajGP/iXDzr
 Jhz1EwHtz0SFhp7z/w8pFhw=
X-Google-Smtp-Source: ABdhPJyyepy2WnT5E3LdywhsJvWyzOZZkZDfMg020dcPBKUi6Vq51xKSXDckbl76dj55YUhmPjVPww==
X-Received: by 2002:a17:90a:8410:: with SMTP id
 j16mr15415744pjn.111.1627271504109; 
 Sun, 25 Jul 2021 20:51:44 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 25/55] KVM: PPC: Book3S HV P9: Add kvmppc_stop_thread to
 match kvmppc_start_thread
Date: Mon, 26 Jul 2021 13:50:06 +1000
Message-Id: <20210726035036.739609-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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

Small cleanup makes it a bit easier to match up entry and exit
operations.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7654235c1507..4d757e4904c4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3045,6 +3045,13 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
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
@@ -4260,8 +4267,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		dec = (s32) dec;
 	tb = mftb();
 	vcpu->arch.dec_expires = dec + tb;
-	vcpu->cpu = -1;
-	vcpu->arch.thread_cpu = -1;
 
 	store_spr_state(vcpu);
 
@@ -4733,6 +4738,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	guest_exit_irqoff();
 
+	kvmppc_stop_thread(vcpu);
+
 	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
-- 
2.23.0

