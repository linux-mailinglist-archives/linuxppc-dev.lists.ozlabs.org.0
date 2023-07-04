Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1D746B22
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 09:52:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRVBIQCr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFPg3h8hz3bhr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:52:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cRVBIQCr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFNm6NhQz2yxK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 17:51:34 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b89600a37fso9263775ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 00:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688457091; x=1691049091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMukUmhg9wLAu2yBqM0oINI7mMwOTLZl3bN36SrnOr8=;
        b=cRVBIQCrKObRhmaLXecoUVxQsUHCjiJKYZ0ly8h6tFMoM0eLgUDXUWJk32DqnCxO+f
         tGeGpE33VlCPoiqMfjSqd6S3tJ2TvTeLl7h0DUrokBmx8zDNIpVXhbzzzMGHZ5biNSav
         y2d2OuhDSSGEvEXqc+mGYPELnmc8pkr1vb3j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457091; x=1691049091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMukUmhg9wLAu2yBqM0oINI7mMwOTLZl3bN36SrnOr8=;
        b=h0fCWYqddutCqzjh8JeSRtnL63Iw+rbY8BYGSffICWt6mVyZOAyjCmuME2Fl0i4xW1
         E2qtJ+D7vO5jxcGb8ARTvZdoou2eE7p2ihAVj7djiNuMo39GSaIRm6lSFVB2vozmQl+s
         rhsLpb5PWPreZGhQ9Urd78mYwwcBCyolWr2WPMQaY3QMI5RJPCr3dD3dPQB10l+RNDfC
         jncb/5OgcwaO8/RMLGWQ8sF9Zh55qiyG1yLzTF2ETZYseP3mbzQ/awjnP+AtTElkOfz5
         UycN6OLMh60Gxsy8/QjLnJhIAUiy0U+xqK8jcUE9Z2cExN4yv1hEgwBQJp5PrJvMBEd1
         tcvw==
X-Gm-Message-State: ABy/qLaMd9K3bdgmuyKSYekWhqBWgnAItmgr9O6rv4fP9/zl8P0lKgjc
	4br2fFO5W+4nQSfaIC6PEnYZkw==
X-Google-Smtp-Source: APBJJlEctDgwHsY+S2P2fswARZSXKXk3Zs/xgfXsJF16vV890y1gz4uktViIaSV118r4sHxFU5Z0xA==
X-Received: by 2002:a17:902:820a:b0:1b8:a720:f513 with SMTP id x10-20020a170902820a00b001b8a720f513mr310386pln.30.1688457091501;
        Tue, 04 Jul 2023 00:51:31 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a11b:bff7:d8ae:bb0])
        by smtp.gmail.com with UTF8SMTPSA id ix14-20020a170902f80e00b001b80b583092sm13758539plb.210.2023.07.04.00.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:51:31 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v7 0/8] KVM: allow mapping non-refcounted pages
Date: Tue,  4 Jul 2023 16:50:45 +0900
Message-ID: <20230704075054.3344915-1-stevensd@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, David Stevens <stevensd@chromium.org>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
  KVM: Introduce __kvm_follow_pfn function
  KVM: Make __kvm_follow_pfn not imply FOLL_GET
  KVM: x86/mmu: Migrate to __kvm_follow_pfn
  KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
  KVM: arm64: Migrate to __kvm_follow_pfn
  KVM: PPC: Migrate to __kvm_follow_pfn
  KVM: remove __gfn_to_pfn_memslot

Sean Christopherson (1):
  KVM: Assert that a page's refcount is elevated when marking
    accessed/dirty

 arch/arm64/kvm/mmu.c                   |  25 +--
 arch/powerpc/include/asm/kvm_book3s.h  |   2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  38 ++---
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  50 +++---
 arch/powerpc/kvm/book3s_hv_nested.c    |   4 +-
 arch/x86/kvm/mmu/mmu.c                 |  77 ++++++---
 arch/x86/kvm/mmu/mmu_internal.h        |   1 +
 arch/x86/kvm/mmu/paging_tmpl.h         |   9 +-
 arch/x86/kvm/mmu/spte.c                |   4 +-
 arch/x86/kvm/mmu/spte.h                |  12 +-
 arch/x86/kvm/mmu/tdp_mmu.c             |  22 +--
 include/linux/kvm_host.h               |  26 +++
 virt/kvm/kvm_main.c                    | 210 +++++++++++++------------
 virt/kvm/kvm_mm.h                      |   3 +-
 virt/kvm/pfncache.c                    |   8 +-
 15 files changed, 282 insertions(+), 209 deletions(-)

-- 
2.41.0.255.g8b1d071c50-goog

