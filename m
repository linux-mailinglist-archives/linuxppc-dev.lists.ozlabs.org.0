Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D37DA066
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 20:28:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lDm48aq6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SHB4C53Snz3vcS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Oct 2023 05:28:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lDm48aq6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=37f87zqykda46so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH9xq0kszz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 05:22:39 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c9f973d319so23489895ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430957; x=1699035757; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=srqr8yeDZlFrvxNrVECKE5xxuDvV2cb3J0BOKhehVs4=;
        b=lDm48aq6srz593nzGY+Ljt4PPRlLqijhQChcmodOmLR/ucexW8P0Eu8CykG+AOTCe+
         Vabs1bw/nfLuA6vE6YIRnCEoWJnq+cyrd5JjUsXM8oo0W+TZGB2s1yBoffkyELcYDB7C
         tLR5T20fBs2CWIHL8ecsDIXPx+mqwJgpzRl6+gTLBqkn8+xw4zgGaKaKks7mlzef+2wi
         P46n2oIcsc5Sei6+QVvrsdeRxm9emSmB9FutvHc9iPxbgDS+Z+bfu6YfeYBfdUQMEgwD
         eRMzCZQ1qW8Ai4w0m+IlZN2Kiqj1NHYvyUN6yhWP+lvJcv5ZQE+iPBU0YLQR8PLhPped
         HFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430957; x=1699035757;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srqr8yeDZlFrvxNrVECKE5xxuDvV2cb3J0BOKhehVs4=;
        b=hPDTzO0Cr3kNFEYkGuDZ2IvkrOPJXMaWrJVD/dJItveAXN+JHq8SxHZ7wQrDEeMbYz
         wrPCpoHY+avrTzaN3Og7ZcRvYO8xuu1VnK5RqPhOnVtMDSncybXLszktzEDEMMODAlv/
         2Nix7vFygh+uKtVvAus1epV1t6XeBppxZad6w5vzoeIIUOml3lkmqls20MrYy75fIqmW
         Wfb24YCkJ2msPdm2EWQ+AP/N6UddJToPD2F6GyGwVmalabo0RUGV29cHGmlwGRP9qyTO
         uLEiCZdFW3OZmguSNG69kazZ5e8nX7lUVEXn8Xp5rFhhGQDYjhghbClOxiV/etht5i5W
         1Uxg==
X-Gm-Message-State: AOJu0YzqqeP61iYW5pNgxopw7IBjk5c7RDNpfeBFoR2vK2rOSHzb17XU
	ralvTLPzCYTKhK30+s5rcNDx4Mqemtg=
X-Google-Smtp-Source: AGHT+IEgJpE7SXSukSyCmrL3MrLSyvY8980C5XITIQh/pYBdmOorR/VvmfyRxJnTS7i/xC9oBoneiM7iOr4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:446:b0:1ca:2620:78ad with SMTP id
 iw6-20020a170903044600b001ca262078admr60815plb.8.1698430957451; Fri, 27 Oct
 2023 11:22:37 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:48 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-7-seanjc@google.com>
Subject: [PATCH v13 06/35] KVM: PPC: Return '1' unconditionally for KVM_CAP_SYNC_MMU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve
  <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Advertise that KVM's MMU is synchronized with the primary MMU for all
flavors of PPC KVM support, i.e. advertise that the MMU is synchronized
when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y but the VM is not using hypervisor
mode (a.k.a. PR VMs).  PR VMs, via kvm_unmap_gfn_range_pr(), do the right
thing for mmu_notifier invalidation events, and more tellingly, KVM
returns '1' for KVM_CAP_SYNC_MMU when CONFIG_KVM_BOOK3S_HV_POSSIBLE=n
and CONFIG_KVM_BOOK3S_PR_POSSIBLE=y, i.e. KVM already advertises a
synchronized MMU for PR VMs, just not when CONFIG_KVM_BOOK3S_HV_POSSIBLE=y.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index b0a512ede764..8d3ec483bc2b 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -635,11 +635,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #if !defined(CONFIG_MMU_NOTIFIER) || !defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 		BUILD_BUG();
 #endif
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-		r = hv_enabled;
-#else
 		r = 1;
-#endif
 		break;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	case KVM_CAP_PPC_HTAB_FD:
-- 
2.42.0.820.g83a721a137-goog

