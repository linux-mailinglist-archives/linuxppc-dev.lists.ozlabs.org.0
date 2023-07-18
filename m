Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A47589C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 01:55:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=fv5PAifQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5G6l0NLWz3d9Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:55:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=fv5PAifQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=33ss3zaykddaeqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Fym2yBTz30Qm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:48:48 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c5cea5773e8so6077793276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724125; x=1692316125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YutdMElGbp9P5hSkuCpmC8VJ7V3PNb+s/AjU6M3aOE8=;
        b=fv5PAifQ+IqLg5YCZqVv/8UfhbcgYKQcYF3VY0+jp+9AW0GEauEM9c/l2th/BfOtRm
         CQiXDrdFVD2W7gdnkrgGNuk1FWqnXZCui5KNHEJZNKFbYGE3o6y6cS/CRv3k2n8pR5iS
         sMPjf4zdwa9albkzvFhGKioR2FBoJS58rCVLaVO5jIXG18PShPMZQfFotlM0oiS44ak5
         wH72KK42j+tXvl9XbOo8Q688HudYyAAS7uwccxs/g6IQguY5eI+gDO5TZMYBuh3X4bOG
         jik8MJDjJL4Dv3zLF48fb1grV3qG4y91bzqSazr3bySPVvnzIDpkEov2LrTDdj61DR8b
         pWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724125; x=1692316125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YutdMElGbp9P5hSkuCpmC8VJ7V3PNb+s/AjU6M3aOE8=;
        b=PcF+gI4MDQE9w7n2aJ0BvpA467pgCMKN5MDFa7VUX/dZ/n/hsoVHw9ZfzxifQXNoW6
         ju1NuxYVT+X7wygRr2Ddi72qHK2UGVMXb5MuExEFE2txHgY1k/6dOg9zIz76Xj6LSr8E
         8+qVHt5iXhQIIGoFBeqk8aIL/qCtKxGuIOwu3dNvq7oWxeSbx1pom53p7SJWd1vK3LAg
         ovyMSU8IUnw+e04swK2lIJ/4wdmsskfxcyTIWsZJ0BbOQsJmwR7whriMwr+Y6Pj0mhi8
         +5cKH2HVEiNyghN+kBGAuDfO+ZOq08NjrMr7Rdw51WPVrbgkDHc5J8oI1pgA/r0gCE9k
         UNRg==
X-Gm-Message-State: ABy/qLaJqvsabWuGlTsamOEjoWDfaMjPqi8bDpoyNdpBIZFziStdSMdz
	Nw0K8Pg7AerrCj3Rjtb1lEcVjoyx/ng=
X-Google-Smtp-Source: APBJJlEBqRkJLxPhHZfq9dzn/bDkdLKPNX43lLfClkxec0b9fruWECEDkqvu4RpyrQH11Geekj2aMuiEVrw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ab04:0:b0:bfe:ea69:91b4 with SMTP id
 u4-20020a25ab04000000b00bfeea6991b4mr11891ybi.4.1689724125035; Tue, 18 Jul
 2023 16:48:45 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:50 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-8-seanjc@google.com>
Subject: [RFC PATCH v11 07/29] KVM: Add KVM_EXIT_MEMORY_FAULT exit
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chao Peng <chao.p.peng@linux.intel.com>

This new KVM exit allows userspace to handle memory-related errors. It
indicates an error happens in KVM at guest memory range [gpa, gpa+size).
The flags includes additional information for userspace to handle the
error. Currently bit 0 is defined as 'private memory' where '1'
indicates error happens due to private memory access and '0' indicates
error happens due to shared memory access.

When private memory is enabled, this new exit will be used for KVM to
exit to userspace for shared <-> private memory conversion in memory
encryption usage. In such usage, typically there are two kind of memory
conversions:
  - explicit conversion: happens when guest explicitly calls into KVM
    to map a range (as private or shared), KVM then exits to userspace
    to perform the map/unmap operations.
  - implicit conversion: happens in KVM page fault handler where KVM
    exits to userspace for an implicit conversion when the page is in a
    different state than requested (private or shared).

Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 22 ++++++++++++++++++++++
 include/uapi/linux/kvm.h       |  8 ++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c0ddd3035462..34d4ce66e0c8 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6700,6 +6700,28 @@ array field represents return values. The userspace should update the return
 values of SBI call before resuming the VCPU. For more details on RISC-V SBI
 spec refer, https://github.com/riscv/riscv-sbi-doc.
 
+::
+
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory;
+
+If exit reason is KVM_EXIT_MEMORY_FAULT then it indicates that the VCPU has
+encountered a memory error which is not handled by KVM kernel module and
+userspace may choose to handle it. The 'flags' field indicates the memory
+properties of the exit.
+
+ - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
+   private memory access when the bit is set. Otherwise the memory error is
+   caused by shared memory access when the bit is clear.
+
+'gpa' and 'size' indicate the memory range the error occurs at. The userspace
+may handle the error and return to KVM to retry the previous memory access.
+
 ::
 
     /* KVM_EXIT_NOTIFY */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 4d4b3de8ac55..6c6ed214b6ac 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -274,6 +274,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_RISCV_SBI        35
 #define KVM_EXIT_RISCV_CSR        36
 #define KVM_EXIT_NOTIFY           37
+#define KVM_EXIT_MEMORY_FAULT     38
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -520,6 +521,13 @@ struct kvm_run {
 #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
 			__u32 flags;
 		} notify;
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.41.0.255.g8b1d071c50-goog

