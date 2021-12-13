Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A2473330
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 18:47:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCTVd72lYz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 04:47:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sUnxZOm9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com;
 envelope-from=3eie3yqykdbe9vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=sUnxZOm9; dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCTTy3RtZz2yHj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:47:00 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id
 n19-20020a056a0007d300b004acbc929796so10501350pfu.18
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=xkL4K9dgU9RwK5048Aq2bqr9IhZdksP2KF2usWFUkl4=;
 b=sUnxZOm9PP16yJLfOGfR1jk6144eZQKgMEzbBMb40s28/4uQFZlwqa8M6WIYLu6m2Y
 StFyhsnUtuHVwdZUjymHZOlTOUssLDtb7jLmajRBCTVkZfe9pAOjG6pVlkrDB7XNkwly
 i1HTbqk0+N13j5So+SA1Iapwoe1y06pk28SwxJRTaBdHE/nEDvdA4qrlabDNB5EiQGaC
 NY5eTu3orlEUd6ORUevBLdseGCU/qoeD8rbEMYMtkfpoCdRzBclEy7QLCFgZLgMZRynN
 4ZegfKMmV/Fp4qijW4pBtc+rJn+pRX7Etk51LcAErNvgowhbEXnT+DmI7VR9wHZZc4Os
 Duow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=xkL4K9dgU9RwK5048Aq2bqr9IhZdksP2KF2usWFUkl4=;
 b=nnmd1fNIS0lgI7V+VDlsCDkTCvtWGO7FA2k1q6fUWwPTaPGYcONUAwLLCtlEAJUdDz
 +LZT0cWXL+2sIxe0h+J9pxk2BFHvei4r6EpZoFIKH04BSARtZHzAz32trBfePCAeHjGE
 8C6hLJ7PrHpIxZYRs8b1TyZ/akX/g/8SEDMtjev1rJVKmFF2aPleNUna8EKrLanWlcAs
 DOQMv3E8hEZIdMbFs4g218lztLInfkfh2alXyteiDyhcbGMTsXkC7K7cVx61X9JBCXaZ
 3UjCbdEEgiNObFKromlRJ9EZ6TjI+LEmewK+VE+kqPY1cmskuU49/xNItCRIIOuiYc7j
 XJpw==
X-Gm-Message-State: AOAM5336t0k8/x5STDA06gPILrHblfcVI7kMLLRLnsSEuOGTxUxB64Gc
 MayPRAjlrqggyxykPRoEcZXu76ohcGc=
X-Google-Smtp-Source: ABdhPJwJMNH/cGeIHI9wCwI/0nhngmeH/h3oVoFyKZeuGB5UOmWw57zBOuyEQPNvXN1GAmWFM/4habhUWW8=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90b:a16:: with SMTP id
 gg22mr968644pjb.0.1639417616924; Mon, 13 Dec 2021 09:46:56 -0800 (PST)
Date: Mon, 13 Dec 2021 17:45:56 +0000
Message-Id: <20211213174556.3871157-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH] KVM: PPC: Book3S HV P9: Use kvm_arch_vcpu_get_wait() to get
 rcuwait object
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use kvm_arch_vcpu_get_wait() to get a vCPU's rcuwait object instead of
using vcpu->wait directly in kvmhv_run_single_vcpu().  Functionally, this
is a nop as vcpu->arch.waitp is guaranteed to point at vcpu->wait.  But
that is not obvious at first glance, and a future change coming in via
the KVM tree, commit 510958e99721 ("KVM: Force PPC to define its own
rcuwait object"), will hide vcpu->wait from architectures that define
__KVM_HAVE_ARCH_WQP to prevent generic KVM from attepting to wake a vCPU
with the wrong rcuwait object.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

Compile tested only.  Carrying this in the PPC tree will avoid a build
failure due to a silent merge conflict with a change in the KVM tree.

https://lore.kernel.org/all/496ECBB3-36F3-4F07-83B2-875F683BC446@linux.vnet.ibm.com/

 arch/powerpc/kvm/book3s_hv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7986911b873c..f64e45d6c0f4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4442,6 +4442,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 			  unsigned long lpcr)
 {
+	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	struct kvm_run *run = vcpu->run;
 	int trap, r, pcpu;
 	int srcu_idx;
@@ -4588,7 +4589,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (is_kvmppc_resume_guest(r) && !kvmppc_vcpu_check_block(vcpu)) {
 		kvmppc_set_timer(vcpu);
 
-		prepare_to_rcuwait(&vcpu->wait);
+		prepare_to_rcuwait(wait);
 		for (;;) {
 			set_current_state(TASK_INTERRUPTIBLE);
 			if (signal_pending(current)) {
@@ -4605,7 +4606,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 			schedule();
 			trace_kvmppc_vcore_blocked(vc, 1);
 		}
-		finish_rcuwait(&vcpu->wait);
+		finish_rcuwait(wait);
 	}
 	vcpu->arch.ceded = 0;
 
-- 
2.34.1.173.g76aa8bc2d0-goog

