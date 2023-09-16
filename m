Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A47A2CC1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:52:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZTbVZF7I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXb04dpJz3fWq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:52:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZTbVZF7I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ipcezqykdlkrdzmibfnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX7Z72W9z3dGW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:32:10 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59c0327b75dso22057247b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824329; x=1695429129; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0VtgUtus3LRehL4neqp1OYPW/02VDjf+LHA0REetHQw=;
        b=ZTbVZF7Ir+hCYerJMB5RMg94GD854MqZl9IuX2n4efYEOONyhgj5sYsKl+AXv1+6JI
         Z7kuSXPv3Nl2ru8aCjP6ysFvfyh6Qox3DE4YmFTMmtJIl8Wy/FEWWvHOONl84w081APU
         lWy/ZYPFBFzJ0pGL6sJG4nVZy5TFTlom12ha+nXnpsL8HinA/WfiJGwM2bMmLdl54Ed0
         FT0XC3FHs8A64KsEHJFn6KC+gYBR8g7/E3epGLXoIh3L83XYEXpQVAOsU64oI9ywoDlC
         3Qb9xBF9Fx9+Oe7UrTPc+DEG4sMVde61mNGqnDODPxL5Wf3pIODRh3ZXDPfK1OozmI5S
         YoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824329; x=1695429129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VtgUtus3LRehL4neqp1OYPW/02VDjf+LHA0REetHQw=;
        b=Fdm3yX1HF0CJfsoejXSxnihM3XjDLfzAw7xl8CkThvER7NiUdPRgdrIyHahLUpDmer
         enc43ah5BE5YCOiAUrjZvH4YW4sKMhfTSVvQSMe6WyJ3FX96wHaCWl56/VRgrqeryu2W
         ecCeEwfw7rgR5xjLantC/D/ur5B/4ODH0Fzntf7Ww/oHKlHhb1yWQEWGk7q2JtATvi4J
         aY4ATuMaTtk7ckvaWzFid4f3H1TjfJQgA/qY3czeaOtBm+7wzXWN2KhwjoaHFQiBUjs4
         oNHdBNvWCS1ZwMoRqlOAGq1GfBeKKHGkktJn6g89GoJQTYggGA/yHxpvtBysyrEWOop/
         R/Og==
X-Gm-Message-State: AOJu0YygplZimI/6ZCgf6Gv5YVMsQ84kR/oXBLD1TbWS2kFTEP6L6HkJ
	481y0t3O2yqz+0ZlNbsT0P/WmnhdVSI=
X-Google-Smtp-Source: AGHT+IGS7sQUeRqIzboGgj+JmfOv6SrnKFoWg2KC/khh+vzWzgZdEe9LRtHGjdK8tkWZSSHoGr6LIc8WFow=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b620:0:b0:58c:a9b4:a64c with SMTP id
 u32-20020a81b620000000b0058ca9b4a64cmr86672ywh.1.1694824328926; Fri, 15 Sep
 2023 17:32:08 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:16 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-25-seanjc@google.com>
Subject: [PATCH 24/26] powerpc/xics: Move declaration of xics_wake_cpu() out
 of kvm_ppc.h
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

xics_wake_cpu() is provided by core PPC code, not by KVM.  Move its
declaration out of kvm_ppc.h and into xics.h.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 2 --
 arch/powerpc/include/asm/xics.h    | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index b4da8514af43..72fee202d3ec 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -1072,6 +1072,4 @@ static inline ulong kvmppc_get_ea_indexed(struct kvm_vcpu *vcpu, int ra, int rb)
 	return ea;
 }
 
-extern void xics_wake_cpu(int cpu);
-
 #endif /* __POWERPC_KVM_PPC_H__ */
diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/xics.h
index 89090485bec1..17a45c022bd9 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -32,6 +32,9 @@
 extern int icp_native_init(void);
 extern void icp_native_flush_interrupt(void);
 extern void icp_native_cause_ipi_rm(int cpu);
+#ifdef CONFIG_SMP
+extern void xics_wake_cpu(int cpu);
+#endif
 #else
 static inline int icp_native_init(void) { return -ENODEV; }
 #endif
-- 
2.42.0.459.ge4e396fd5e-goog

