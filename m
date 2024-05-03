Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A78BB2A2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:19:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zpvkrnWA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWJwV1cpTz3vjF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 04:19:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zpvkrnWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--dmatlack.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3rio1zggkdkckthashjrnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--dmatlack.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWJtx6vRGz3dD1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 04:17:44 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-de603db5d6aso9890695276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2024 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760262; x=1715365062; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QHXu+3wMl1x8qNonydytLIV6nGk0zgXCPmBNIKdSDOU=;
        b=zpvkrnWAZi1bNpjXMJrc+fB2TFgNySJ/iEEadoBkLZfQldjs6a097CLhdnteH5Uq52
         Wk2ZQmmOioaUvrGesPFGrWCCo02XtLRxDZXLRh6VIUjcY0bZ7qMZo4xB4XJVM2dqFRQX
         Iu4KClkduQkJb38lLiqrv+cEubQfbHtiJwGbcgk3KnGCdbfsJJOSU2fhB1zf+gvYN/u+
         FtjW6ZLqlBKOSJC9KzQkOrJxm1bZClNcJvMvuyU/OYGZQELuInkEN3zDsvSEHxXcwboD
         sA5CqDWXI2c1D3D5hUa2uAMTbV7N6tupWX7TeU80CbqqTeU3Y3YEdsGX9DhXQ2vUTdGa
         uEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760262; x=1715365062;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHXu+3wMl1x8qNonydytLIV6nGk0zgXCPmBNIKdSDOU=;
        b=CvQR20AJP3NZPufHlQxOGPuu+LHiyVrCvzRxziYaGLtCGXeqEvXyY2E7K7ul3cx8Di
         2wFO2ApHxZj09t8Ff/x5T4OJwUVyoUNB9KGh+elgsZR/QmuHofKFAQdKxbx1YFyBSSNh
         GR57gBxkKj8UEiLBlraxcm4K20q9525LL8NtkFWfL9VSjKrbdpJ3y6c0QWtRzqGdiugm
         dZqQmHcdFxtFgJWMmnfeTbENu2y7voFQar1EYxb4ZmkjZsr1R/JLrN7AQqEqrCLchf7R
         vGmalp9JAA0nm/BCN6VSP6zYgeDrXgWmQau3g2UBH63G+Mw/GExaZdoNb/sZYfmSuejk
         ogzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvsnAwyVUXO+6HbAorsdbQv96avb7FEPNqepsUczxbjHuN4P9d0CcFkdRqihyk4wKXFJj08eHXAAZEy/v1vAtTrGwI9MhKEGcDCVX5Jg==
X-Gm-Message-State: AOJu0YwNrWMnaxON8NJo8TtqG/XpWJtJvihjhrEXZeuA6wCkaxv5RgJU
	s2f8F1x8kWgNLgMjDoEL1eAP+hi/xDvygj++KdRiC7hvqGbCW3B7nF9WSEaFI7loZOmRXiIR8sx
	ovyy548wPaA==
X-Google-Smtp-Source: AGHT+IH9qLn6o/uHe9WEM8VyAqFxWSMZ3MFnxC1YcYZ+IPtGArmXDrrlLFlgmBP/HenuKUWhjozjdfJl16Pvww==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:26cc:0:b0:de4:e042:eee9 with SMTP id
 m195-20020a2526cc000000b00de4e042eee9mr1003169ybm.6.1714760262024; Fri, 03
 May 2024 11:17:42 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:33 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-3-dmatlack@google.com>
Subject: [PATCH v3 2/3] KVM: Ensure new code that references immediate_exit
 gets extra scrutiny
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ensure that any new KVM code that references immediate_exit gets extra
scrutiny by renaming it to immediate_exit__unsafe in kernel code.

All fields in struct kvm_run are subject to TOCTOU races since they are
mapped into userspace, which may be malicious or buggy. To protect KVM,
this commit introduces a new macro that appends __unsafe to field names
in struct kvm_run, hinting to developers and reviewers that accessing
this field must be done carefully.

Apply the new macro to immediate_exit, since userspace can make
immediate_exit inconsistent with vcpu->wants_to_run, i.e. accessing
immediate_exit directly could lead to unexpected bugs in the future.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/uapi/linux/kvm.h | 15 ++++++++++++++-
 virt/kvm/kvm_main.c      |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 2190adbe3002..3611ad3b9c2a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -192,11 +192,24 @@ struct kvm_xen_exit {
 /* Flags that describe what fields in emulation_failure hold valid data. */
 #define KVM_INTERNAL_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
 
+/*
+ * struct kvm_run can be modified by userspace at any time, so KVM must be
+ * careful to avoid TOCTOU bugs. In order to protect KVM, HINT_UNSAFE_IN_KVM()
+ * renames fields in struct kvm_run from <symbol> to <symbol>__unsafe when
+ * compiled into the kernel, ensuring that any use within KVM is obvious and
+ * gets extra scrutiny.
+ */
+#ifdef __KERNEL__
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol##__unsafe
+#else
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol
+#endif
+
 /* for KVM_RUN, returned by mmap(vcpu_fd, offset=0) */
 struct kvm_run {
 	/* in */
 	__u8 request_interrupt_window;
-	__u8 immediate_exit;
+	__u8 HINT_UNSAFE_IN_KVM(immediate_exit);
 	__u8 padding1[6];
 
 	/* out */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bdea5b978f80..2b29851a90bd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4425,7 +4425,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
-		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit);
+		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		vcpu->wants_to_run = false;
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

