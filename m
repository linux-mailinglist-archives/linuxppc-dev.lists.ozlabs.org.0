Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B36323B2615
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 06:15:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Rd33w16z3083
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 14:15:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RBtU16Sc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=stevensd@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=RBtU16Sc; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9RGL0kVyz2yWr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:59:21 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id s14so2775754pfg.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 20:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BxIaFDPbAuZHR6J/S83W0A67K8R9coNY4bId9HsipsE=;
 b=RBtU16Scd9URJKreXZFwanEfHJ1XRZJXhO4qEt4uU8YvBtSRsG8M0Msq7z7U3gBGbw
 UdDX7s8F5odJ8nqB9b8EVGbHLmPHB74/ZvZg8RK4YeZb6UMq7MIYumlvjDcfnL6WHIaV
 l3qHnUTf57CgLtDUOfr/2EStz1LFXjnziJK6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BxIaFDPbAuZHR6J/S83W0A67K8R9coNY4bId9HsipsE=;
 b=Dby/v1ExCfYWzsJxroOyu5NX/Mt65uLGml27SwrEEIBUmV+w4BmBp1yQqXI2WKEw8S
 5F+KW/rCxFSkLldjUnOFOVxkqXhib9sVeUlhMCvfNgOF4wLn9lX2mEe7iblBv7185F5N
 ooAa9NNiLGNjIV1O+I2uKEi0TdqVeahxSE69IKjiWhZ+RU4BOfiMFfcbNYVJaq8Cls0P
 lV9ZY1WxWwX94lTLwF9SKaT+sFFdCObBnnGYp7h9HyXAUR1iS5ugrlBdQuXZqPHTsM8X
 dFtfX5R17adRqgQ+2xBVoXsdXpxtG2XyUHBC0xSSiC6lpcauClkXrwLODMxbS8WMUJMw
 b3Bg==
X-Gm-Message-State: AOAM531VzbVWT6Mm5xpym/hHQhFtfINW54JYdbJH5/qH9UkNU9LdLBx6
 j4D/BPhYevSjKwEX6YnwMrQGeQ==
X-Google-Smtp-Source: ABdhPJw/0bUD4wxiHYbbe+W1J6aaPXVUUYjx3vGkULT22ezX3dEs1tG4sWixYLws/tdmOS++kmqsRg==
X-Received: by 2002:aa7:96fc:0:b029:2e9:e827:928f with SMTP id
 i28-20020aa796fc0000b02902e9e827928fmr2818805pfq.49.1624507157546; 
 Wed, 23 Jun 2021 20:59:17 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
 by smtp.gmail.com with UTF8SMTPSA id j15sm1163260pfh.194.2021.06.23.20.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 20:59:16 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
Date: Thu, 24 Jun 2021 12:57:43 +0900
Message-Id: <20210624035749.4054934-1-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Jun 2021 14:15:11 +1000
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
Cc: David Stevens <stevensd@google.com>, intel-gvt-dev@lists.freedesktop.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
follow_pte in gfn_to_pfn. However, the resolved pfns may not have
assoicated struct pages, so they should not be passed to pfn_to_page.
This series removes such calls from the x86 and arm64 secondary MMU. To
do this, this series modifies gfn_to_pfn to return a struct page in
addition to a pfn, if the hva was resolved by gup. This allows the
caller to call put_page only when necessated by gup.

This series provides a helper function that unwraps the new return type
of gfn_to_pfn to provide behavior identical to the old behavior. As I
have no hardware to test powerpc/mips changes, the function is used
there for minimally invasive changes. Additionally, as gfn_to_page and
gfn_to_pfn_cache are not integrated with mmu notifier, they cannot be
easily changed over to only use pfns.

This addresses CVE-2021-22543 on x86 and arm64.

David Stevens (6):
  KVM: x86/mmu: release audited pfns
  KVM: mmu: also return page from gfn_to_pfn
  KVM: x86/mmu: avoid struct page in MMU
  KVM: arm64/mmu: avoid struct page in MMU
  KVM: mmu: remove over-aggressive warnings
  drm/i915/gvt: use gfn_to_pfn's page instead of pfn

 arch/arm64/kvm/mmu.c                   |  42 +++++----
 arch/mips/kvm/mmu.c                    |   3 +-
 arch/powerpc/kvm/book3s.c              |   3 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |   5 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |   5 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c     |   4 +-
 arch/powerpc/kvm/e500_mmu_host.c       |   2 +-
 arch/x86/kvm/mmu/mmu.c                 |  60 ++++++------
 arch/x86/kvm/mmu/mmu_audit.c           |  13 ++-
 arch/x86/kvm/mmu/mmu_internal.h        |   3 +-
 arch/x86/kvm/mmu/paging_tmpl.h         |  36 +++++---
 arch/x86/kvm/mmu/tdp_mmu.c             |   7 +-
 arch/x86/kvm/mmu/tdp_mmu.h             |   4 +-
 arch/x86/kvm/x86.c                     |   9 +-
 drivers/gpu/drm/i915/gvt/gtt.c         |  12 ++-
 drivers/gpu/drm/i915/gvt/hypercall.h   |   3 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c       |  12 +--
 drivers/gpu/drm/i915/gvt/mpt.h         |   8 +-
 include/linux/kvm_host.h               |  27 ++++--
 include/linux/kvm_types.h              |   5 +
 virt/kvm/kvm_main.c                    | 123 +++++++++++++------------
 21 files changed, 212 insertions(+), 174 deletions(-)

-- 
2.32.0.93.g670b81a890-goog

