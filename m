Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B271309F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 01:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QShWF3VXRz3fFy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 09:50:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Y62V38pt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3curxzaykdogiejrkyqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Y62V38pt;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QShNg5P3Sz3c8V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 09:44:51 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-ba2b9ecfadaso2800724276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144689; x=1687736689;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bguo3hUZaLYxse9v+ik+MX3ufqUdHR10jXNpIhPD3cE=;
        b=Y62V38pt3Kf7P9M2YivEC5661SUHDQjGPJeLNpi65nB4y+p3TsqoRR0z/9AOIr1Kjf
         gl3yg0EBv9UJcyGGhkoV+eP5nxHHEckaVjNM+WV0ph8y6N8NKNrOoxejQzf6xVLF0GNF
         CMPzW7iyFKrk0I+YLOBH1dB2cwpR8z8XT9p+1tlyni+H85cDXJGB/ZGkaiDpbVC82/o/
         GKwW1qcFloQI+vCY/C+X0I8xbKAWwMlWN0KpQsh6osmLARaX2g1tNlgMEbkEwKadQaPu
         8s3poXNR7qoLyRgjp4108zRCziAP6oNak8GIUn6lV7gRCswVoQjlt0PKr+oTkaiyWyY0
         Ciug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144689; x=1687736689;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bguo3hUZaLYxse9v+ik+MX3ufqUdHR10jXNpIhPD3cE=;
        b=aUG9rFuaCsUUKORaccYm2MSWU005SbDvgC1LK99MBCf25dpFsXQiJFJurStft/iuo9
         0Fr879fFZ+5iNeTQSDSSO/vzILFUb/QzFgZcJ+cEWjDAGkoxW0BWlKUM6z+yc5j2kOQJ
         wBWhNBlFs0xU3I805KW+j/uM5H4XLS09q2MA8YXVNoeF4FZal/gBOqsEfyDbXSo/hGFM
         o5BRGJWdbe6HeNtmfISIz93xd+q8WhUVBN2JOwHU2yHcWfD8VkfD3HBPE6S4sQQ+tXMn
         QFRGvob1swKSEBnCt5BT2QahF3jToS0tJDodne9szJZNjHJ35sEZaqKb9RWdWbOpqmsC
         lbWw==
X-Gm-Message-State: AC+VfDw3eFsoT6oWPOcdR3jgk6bQdrEwCY+ccPNdjrMMEm+wtxoAadzE
	dMngvnob44N//ul3mwR07N+DiBT9q0c=
X-Google-Smtp-Source: ACHHUZ72Yke0umLVJsAYBjLDCmB2C1ZbHNslgBIJrMfaEGzX80HaCkEwKhsoBR2khvT0ady9wDj4p4x/v3M=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a25:3cb:0:b0:ba8:337a:d8a3 with SMTP id
 194-20020a2503cb000000b00ba8337ad8a3mr1807757ybd.11.1685144689141; Fri, 26
 May 2023 16:44:49 -0700 (PDT)
Date: Fri, 26 May 2023 17:44:31 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230526234435.662652-7-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 06/10] kvm/powerpc: make radix page tables RCU safe
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-ke
 rnel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM page tables are currently not RCU safe against remapping, i.e.,
kvmppc_unmap_free_pmd_entry_table() et al. The previous
mmu_notifier_ops members rely on kvm->mmu_lock to synchronize with
that operation.

However, the new mmu_notifier_ops member test_clear_young() provides
a fast path that does not take kvm->mmu_lock. To implement
kvm_arch_test_clear_young() for that path, orphan page tables need to
be freed by RCU.

Unmapping, specifically kvm_unmap_radix(), does not free page tables,
hence not a concern.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 461307b89c3a..3b65b3b11041 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1469,13 +1469,15 @@ int kvmppc_radix_init(void)
 {
 	unsigned long size = sizeof(void *) << RADIX_PTE_INDEX_SIZE;
 
-	kvm_pte_cache = kmem_cache_create("kvm-pte", size, size, 0, pte_ctor);
+	kvm_pte_cache = kmem_cache_create("kvm-pte", size, size,
+					  SLAB_TYPESAFE_BY_RCU, pte_ctor);
 	if (!kvm_pte_cache)
 		return -ENOMEM;
 
 	size = sizeof(void *) << RADIX_PMD_INDEX_SIZE;
 
-	kvm_pmd_cache = kmem_cache_create("kvm-pmd", size, size, 0, pmd_ctor);
+	kvm_pmd_cache = kmem_cache_create("kvm-pmd", size, size,
+					  SLAB_TYPESAFE_BY_RCU, pmd_ctor);
 	if (!kvm_pmd_cache) {
 		kmem_cache_destroy(kvm_pte_cache);
 		return -ENOMEM;
-- 
2.41.0.rc0.172.g3f132b7071-goog

