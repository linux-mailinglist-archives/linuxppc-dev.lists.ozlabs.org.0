Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0DC7589EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 02:09:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=xEjga5Lw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5GQh3pyHz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 10:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=xEjga5Lw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3-is3zaykde07tp2yrv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5FzJ14L3z3c5W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:49:16 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c64521ac8d6so5471098276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724154; x=1692316154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JHyOFUOJNrHCsG8hxo3NWWS2w8rJ24DtuKIoDCRGyag=;
        b=xEjga5LwPPSSdY8SIx3jyoncD3GGf3WPGooyrkM0KnahhnaL4mCb4YwQt0GO0HS22c
         NEcfXNGBndDk4nsku/Y91YS1hHA5MX/cUUC80CuRLM1bK9lLy4VQpDRd1Xi2xWiJI6o1
         9/UCIe7gQuFQ2+gvKJ9C6ii8/xbm2jFSze0SQ3v0PRjd1NOqJPDidQ7wUtuL19wRUrTE
         yGaIkqqRPEKiBe0hyG7ZRrXgE8SEXgjc2KYKv831pMLCu06jrX+LffHvzIu5EPSPB+OK
         JqyI7fhSc4r9xeqc00aXehzDSyLGCvqUsUwXUuUYEMMNJQvdcAepZR51lMeVVKDz3MhJ
         Gd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724154; x=1692316154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHyOFUOJNrHCsG8hxo3NWWS2w8rJ24DtuKIoDCRGyag=;
        b=V6EbbdeuIf95D1Xo8zPFA4mUDBnt58Ek7ZhVnxhokz+6e0alCtpuTp7S/ux/adNTfX
         VsW0hecXwh8/iLAC/ITeG0vghRhlhmiYJz+PWG9gW9dZjw4AC9+EUsvVVytUB5m2wTHC
         xP5GFhefWLIFu9JkEOzwVPDPXXeDJ+ng3LnIQReFvV8YysuTHETs9BUOYIUm0mj+SEfh
         ++5KWQwqEiCAI7My+YbyDWu5HkBRHu8SZq9/u8+/dnIXpaCWTneUmkDP+QQgnbWGgx/K
         LP7niuhtr8luDRqUSSugUfmLLSvuqu6Fd+HML7F9z+4iTskLf+B1pA5KbQXM0qecq81A
         lVhw==
X-Gm-Message-State: ABy/qLYlwNZHxQ/4OsuDTyFNVcTzMqQP5cNN6iywryn8wUxeYAXo7MQb
	F7oTbsemQzjULTYinV4W73A1BMT2o9Y=
X-Google-Smtp-Source: APBJJlG18o++4c+4o8gvKjis+x9wRH2pDI/AJGKQKbbl3lcmVj0vggAD6gv2GfLwBQuIOlyc9qDjI+M6sT4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:a021:0:b0:cf2:9e82:a5b5 with SMTP id
 x30-20020a25a021000000b00cf29e82a5b5mr7746ybh.8.1689724154115; Tue, 18 Jul
 2023 16:49:14 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:05 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-23-seanjc@google.com>
Subject: [RFC PATCH v11 22/29] KVM: selftests: Add helpers to do
 KVM_HC_MAP_GPA_RANGE hypercalls (x86)
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

From: Vishal Annapurve <vannapurve@google.com>

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
[sean: drop shared/private helpers (let tests specify flags)]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86_64/processor.h      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index aa434c8f19c5..8857143d400a 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -15,6 +15,7 @@
 #include <asm/msr-index.h>
 #include <asm/prctl.h>
 
+#include <linux/kvm_para.h>
 #include <linux/stringify.h>
 
 #include "../kvm_util.h"
@@ -1166,6 +1167,20 @@ uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
 uint64_t __xen_hypercall(uint64_t nr, uint64_t a0, void *a1);
 void xen_hypercall(uint64_t nr, uint64_t a0, void *a1);
 
+static inline uint64_t __kvm_hypercall_map_gpa_range(uint64_t gpa,
+						     uint64_t size, uint64_t flags)
+{
+	return kvm_hypercall(KVM_HC_MAP_GPA_RANGE, gpa, size >> PAGE_SHIFT, flags, 0);
+}
+
+static inline void kvm_hypercall_map_gpa_range(uint64_t gpa, uint64_t size,
+					       uint64_t flags)
+{
+	uint64_t ret = __kvm_hypercall_map_gpa_range(gpa, size, flags);
+
+	GUEST_ASSERT_1(!ret, ret);
+}
+
 void __vm_xsave_require_permission(uint64_t xfeature, const char *name);
 
 #define vm_xsave_require_permission(xfeature)	\
-- 
2.41.0.255.g8b1d071c50-goog

