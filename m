Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1FB7869C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:13:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PiabMMQh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbRw61BBz3fHG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:13:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PiabMMQh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbHk2Zdtz3dDQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:05:54 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a7f4f7a8easo3008793b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692864289; x=1693469089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5EE+UzoRngnjehf25g1txAUD7jFYvBFO8xVG5NUnepk=;
        b=PiabMMQhe9y2vUBAt7h+ntRdrItXl5XEmXNUAkQzHdz/5Usah2vUewJPe1DxJjyMoj
         MPwJ8vBC0PRuHBzkM99uP/8pDt3bKa4MMVAyZvrVMT5+kHkXevDD6Xbkw9rXNNage966
         g+94vbQfs3rPzxqPbviDDzoC4v8GyCo9zgfVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864289; x=1693469089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EE+UzoRngnjehf25g1txAUD7jFYvBFO8xVG5NUnepk=;
        b=TzZ7EV6K8Z0ScObWG3SyG3KjKqmcbMCYytUO+tt9ELbmO9iDO5jlNmdRn/g9iZe8rO
         efRu6VBK7gNYgXUpSVU8aL4af10i89xbDiNDEHLGI2cU+ODJg9VZzj+Di4epK8Thizwv
         pPDjrsXutCldtoB1GXX4ZheXoJwPpQOE/LN3TTG9DADOR6jLnPzjn1uj/xu/UkvKIDOo
         xqA6OfZvQhzm4AxRmejrqBdKpxVtkJL2oS8QR8cvhpLhTQDTESC+thxCV0XkQirZnITq
         K6qtknuyoi7oU/ICclI22wBssHcX5LPoNeh4lTvLTD29oyFJB1DMlLErwB1Btk8uFOFB
         RY6Q==
X-Gm-Message-State: AOJu0YyTIw8RcPLoMYOF/fXGGRWrWnhevQeT0UW8mySFBTEeSBwceMLe
	b8vX+W+5bsR9+RYAqU7pocleHA==
X-Google-Smtp-Source: AGHT+IHkBcWKFj3+pW5fuuiWfLnbD3ta+ABypKF47WzCDkfdw67HWPAGK/Ns2WRoKXuxgQGkt6DXAw==
X-Received: by 2002:a05:6358:720c:b0:13c:c84b:88bb with SMTP id h12-20020a056358720c00b0013cc84b88bbmr2497118rwa.27.1692864289233;
        Thu, 24 Aug 2023 01:04:49 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:515:8b2a:90c3:b79e])
        by smtp.gmail.com with UTF8SMTPSA id a18-20020aa78652000000b00666e649ca46sm7014327pfo.101.2023.08.24.01.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:04:48 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v8 0/8] KVM: allow mapping non-refcounted pages
Date: Thu, 24 Aug 2023 17:04:00 +0900
Message-ID: <20230824080408.2933205-1-stevensd@google.com>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, David Stevens <stevensd@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

This patch series adds support for mapping VM_IO and VM_PFNMAP memory
that is backed by struct pages that aren't currently being refcounted
(e.g. tail pages of non-compound higher order allocations) into the
guest.

Our use case is virtio-gpu blob resources [1], which directly map host
graphics buffers into the guest as "vram" for the virtio-gpu device.
This feature currently does not work on systems using the amdgpu driver,
as that driver allocates non-compound higher order pages via
ttm_pool_alloc_page.

First, this series replaces the __gfn_to_pfn_memslot API with a more
extensible __kvm_faultin_pfn API. The updated API rearranges
__gfn_to_pfn_memslot's args into a struct and where possible packs the
bool arguments into a FOLL_ flags argument. The refactoring changes do
not change any behavior, except as noted in the PPC change.

When introduced in the refactoring, __kvm_faultin_pfn implies FOLL_GET
to preserve existing behavior. From there, the API is made to support
mapping non-refcounted pages by respecting the FOLL_GET flag.

This series only adds support for non-refcounted pages to the x86 MMU.
Other MMUs can likely be updated without too much difficulty, but it is
not needed at this point. Updating other parts of KVM (e.g. pfncache) is
not straightforward [2].

[1]
https://patchwork.kernel.org/project/dri-devel/cover/20200814024000.2485-1-gurchetansingh@chromium.org/
[2] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/

v7 -> v8:
 - Set access bits before releasing mmu_lock.
 - Pass FOLL_GET on 32-bit x86 or !tdp_enabled.
 - Refactor FOLL_GET handling, add kvm_follow_refcounted_pfn helper.
 - Set refcounted bit on >4k pages.
 - Add comments and apply formatting suggestions.
 - rebase on kvm next branch.
v6 -> v7:
 - Replace __gfn_to_pfn_memslot with a more flexible __kvm_faultin_pfn,
   and extend that API to support non-refcounted pages.
v5 -> v6:
 - rebase on kvm next branch
 - rename gfn_to_pfn_page to gfn_to_pfn_noref
 - fix uninitialized outparam in error case of __kvm_faultin_pfn
 - add kvm_release_pfn_noref_clean for releasing pfn/page pair
v4 -> v5:
 - rebase on kvm next branch again
v3 -> v4:
 - rebase on kvm next branch again
 - Add some more context to a comment in ensure_pfn_ref
v2 -> v3:
 - rebase on kvm next branch
v1 -> v2:
 - Introduce new gfn_to_pfn_page functions instead of modifying the
   behavior of existing gfn_to_pfn functions, to make the change less
   invasive.
 - Drop changes to mmu_audit.c
 - Include Nicholas Piggin's patch to avoid corrupting refcount in the
   follow_pte case, and use it in depreciated gfn_to_pfn functions.
 - Rebase on kvm/next

David Stevens (7):
  KVM: mmu: Introduce __kvm_follow_pfn function
  KVM: mmu: Make __kvm_follow_pfn not imply FOLL_GET
  KVM: x86/mmu: Migrate to __kvm_follow_pfn
  KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
  KVM: arm64: Migrate to __kvm_follow_pfn
  KVM: PPC: Migrate to __kvm_follow_pfn
  KVM: mmu: remove __gfn_to_pfn_memslot

Sean Christopherson (1):
  KVM: Assert that a page's refcount is elevated when marking
    accessed/dirty

 arch/arm64/kvm/mmu.c                   |  25 +--
 arch/powerpc/include/asm/kvm_book3s.h  |   2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  38 ++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  50 +++---
 arch/powerpc/kvm/book3s_hv_nested.c    |   4 +-
 arch/x86/kvm/mmu/mmu.c                 |  94 +++++++---
 arch/x86/kvm/mmu/mmu_internal.h        |   1 +
 arch/x86/kvm/mmu/paging_tmpl.h         |   8 +-
 arch/x86/kvm/mmu/spte.c                |   4 +-
 arch/x86/kvm/mmu/spte.h                |  12 +-
 arch/x86/kvm/mmu/tdp_mmu.c             |  22 ++-
 include/linux/kvm_host.h               |  26 +++
 virt/kvm/kvm_main.c                    | 231 ++++++++++++++-----------
 virt/kvm/kvm_mm.h                      |   3 +-
 virt/kvm/pfncache.c                    |  10 +-
 15 files changed, 316 insertions(+), 214 deletions(-)

-- 
2.42.0.rc1.204.g551eb34607-goog

