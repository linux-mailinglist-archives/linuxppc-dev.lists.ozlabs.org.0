Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60371501FBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 02:44:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kfczr35Gwz3bdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 10:44:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bZwTwRaS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3xl9yygykdl8xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=bZwTwRaS; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfcyb6RnRz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 10:43:50 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id
 l6-20020a637006000000b003811a27370aso3490445pgc.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 17:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=WHJorEYqdPsyoiS8LBeb1G8S4S7kzQkyLWZGD9aUrjs=;
 b=bZwTwRaSjFo3UIyEnG1Se3GCFh+RY6IvOG3VlupdDpfNfI6GX6hkJeLI81eGmOGX6G
 1cHm7fTg8TqH04RjFv10Of5DvAYAHAM8tiEPrQRiuCNBDJRSzCUDQUG0BMRWHtD+LdNa
 OXpZzAre9wRSs/2YHv0GHmqXz+Pqefc9fuZxtMcl8GYafBb9wbzvPCjbT/nzQhtpz2Wn
 fyyyAL63cPcu44vOIB0qfBetcyUX/9l8dZ2b05Q4AfOcPl4SLNf/Fbj41CZv9b/yvg1F
 Aer1piomJTMTT3b0SNhbaUMWvPS5/iUeOlL+Pvad6lLyGugPdHlz8JZmH21Rl+8vgLjA
 mBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=WHJorEYqdPsyoiS8LBeb1G8S4S7kzQkyLWZGD9aUrjs=;
 b=zEFQl1wVgm1ixPDavtweYFu6YHkeeAf2t/MuhjRtNPiyGWY1nWuW1sUs80FmU+NOlC
 ACj1WXKvmLlXe6rsdoRoUlcqm9PA6zQ+6L1J6yz00gkZ1lFuSfzj822TZpv0EC1JCDzO
 Li+lOeOeEniSp4BcEUGcw4H4s5zfHn6CzGrUJdUb8a7SrT2hQcxcREqaz7KsFXkujSJH
 iHa8LCVVdQ/N5bOeEzS1Jy2lo/o/2mHOsp1AWsaonZeDIrNVQ2nj8aeq+ChVMadZO4RC
 x5SEjXiDgO0jltlxN7GxlG2DZ5k+e/zaRzurRQ3Ym19v7ekfDEZv2PsGfz/7sBf8SLBQ
 fkeg==
X-Gm-Message-State: AOAM532qS5KV2DxF4FzeyDb9cSRV4d5zOQEZZYkOvn8isSuYykI+EZs9
 GGL4oe0VrLWmi8teCQu/aZLanZpq6tU=
X-Google-Smtp-Source: ABdhPJzt0tscL0kcshOCrjwd8G3ruQcGXCkqq7xMYex2fkXBeIa/R8tC7xq7T2RAxBd1S9ySsMfZwzJ54UU=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4b84:b0:1cb:6cf5:d2ff
 with SMTP id
 lr4-20020a17090b4b8400b001cb6cf5d2ffmr1311935pjb.41.1649983428416; Thu, 14
 Apr 2022 17:43:48 -0700 (PDT)
Date: Fri, 15 Apr 2022 00:43:41 +0000
In-Reply-To: <20220415004343.2203171-1-seanjc@google.com>
Message-Id: <20220415004343.2203171-2-seanjc@google.com>
Mime-Version: 1.0
References: <20220415004343.2203171-1-seanjc@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH 1/3] KVM: x86: Don't re-acquire SRCU lock in
 complete_emulated_io()
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't re-acquire SRCU in complete_emulated_io() now that KVM acquires the
lock in kvm_arch_vcpu_ioctl_run().  More importantly, don't overwrite
vcpu->srcu_idx.  If the index acquired by complete_emulated_io() differs
from the one acquired by kvm_arch_vcpu_ioctl_run(), KVM will effectively
leak a lock and hang if/when synchronize_srcu() is invoked for the
relevant grace period.

Fixes: 8d25b7beca7e ("KVM: x86: pull kvm->srcu read-side to kvm_arch_vcpu_ioctl_run")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ab336f7c82e4..f35fe09de59d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10450,12 +10450,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 
 static inline int complete_emulated_io(struct kvm_vcpu *vcpu)
 {
-	int r;
-
-	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
-	r = kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
-	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
-	return r;
+	return kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
 }
 
 static int complete_emulated_pio(struct kvm_vcpu *vcpu)
-- 
2.36.0.rc0.470.gd361397f0d-goog

