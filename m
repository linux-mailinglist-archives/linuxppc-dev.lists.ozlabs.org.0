Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8389D6172AD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jrR32DSz3fHv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:33:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Fhq9PEIX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3c_tiywykdk4gsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Fhq9PEIX;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXG0PgCz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:41 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 69-20020a250548000000b006cc9d755afaso343422ybf.16
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jjwuYM33wa0dwVWFlLHKwYhVaHzm2FgiCKOfn+QDNQ4=;
        b=Fhq9PEIX8LJQUbJ64jTN1JvSF4aDYgMhxvOWYGX1iAWoV/lvAdG5LOXuNivkfQWmaN
         XoYRELj0iLXTcGUgDHg9R/bhGsJRvY0Qx7IEF0y4w7dFOPQtmSUB+O6PUVY8/MhozQfF
         AX6SYnVZgv9nJGu4JJBc65UftCLAjC1MJHk1aUCf2yILUXt8A+rMwOgyzW8jvMWXgkl0
         LgkleUhB3pCNMAS+BVFzOjuYh6vlw9PADZ2etUZ8fiuYZCiK9hkRPf6dczcVLTjo6nqb
         SNGwaGeIsaxofOZxTFjiZYanOv3dUMmT9VRhi3xCUQ51Z2IYrlwrIcc2Hbem0XHCdIi2
         UM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjwuYM33wa0dwVWFlLHKwYhVaHzm2FgiCKOfn+QDNQ4=;
        b=VwnMRj7EWiUbT//Vzk/OnxV6ecrTbcp3H3QRSKHehoiEx/MaJeE3r/AOkoDQGPiImr
         QXi9n9LPBZWOBMVhZqETHtN2og6Py+A4HfB3nafDeBG5fPTxFqJSh5QAtDA8wh0MJ8mg
         dNwQEZLijJEwXM3HFrsC8JjAVe/Rtiiq4UOHScuXgA/zVklK+X4mJRte3+QX7NoK4EfC
         Rcw98usGBm0BuSJ/KqQ02sw6k4SBIAdgahgYRBWtimpm2AUofxtTDb2IPbalRooo8y+3
         xJryL5fWpa6W6R0w4vCTEjoS98Uyath17rZ+QX+t45BdSqzK7fvVS7aoXImP7bc+T6V1
         AJcQ==
X-Gm-Message-State: ACrzQf1tV2xj8KyTKIbq5ym4u0kRTFUPNTljqE9Lrd2e3GlysJFXVcSK
	VSkGwwOsfVxy6K7u2D88dlBVw4UgKs8=
X-Google-Smtp-Source: AMsMyM6G8+cpsdlQ24WmBjSm0uN0SQ0FUjj6LFQ9PdnISN+9XlJSF9tKC3IM7fcpwDmLrOspg5L0a2rB188=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e695:0:b0:6cb:895b:5a35 with SMTP id
 d143-20020a25e695000000b006cb895b5a35mr25441755ybh.573.1667431179587; Wed, 02
 Nov 2022 16:19:39 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:42 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-16-seanjc@google.com>
Subject: [PATCH 15/44] KVM: arm64: Free hypervisor allocations if vector slot
 init fails
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Teardown hypervisor mode if vector slot setup fails in order to avoid
leaking any allocations done by init_hyp_mode().

Fixes: b881cdce77b4 ("KVM: arm64: Allocate hyp vectors statically")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0c328af064dd..73644def7780 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2232,18 +2232,18 @@ int kvm_arch_init(void *opaque)
 	err = kvm_init_vector_slots();
 	if (err) {
 		kvm_err("Cannot initialise vector slots\n");
-		goto out_err;
-	}
-
-	err = init_subsystems();
-	if (err)
 		goto out_hyp;
+	}
+
+	err = init_subsystems();
+	if (err)
+		goto out_subs;
 
 	if (!in_hyp_mode) {
 		err = finalize_hyp_mode();
 		if (err) {
 			kvm_err("Failed to finalize Hyp protection\n");
-			goto out_hyp;
+			goto out_subs;
 		}
 	}
 
@@ -2257,8 +2257,9 @@ int kvm_arch_init(void *opaque)
 
 	return 0;
 
-out_hyp:
+out_subs:
 	hyp_cpu_pm_exit();
+out_hyp:
 	if (!in_hyp_mode)
 		teardown_hyp_mode();
 out_err:
-- 
2.38.1.431.g37b22c650d-goog

