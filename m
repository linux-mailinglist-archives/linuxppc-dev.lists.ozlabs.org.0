Return-Path: <linuxppc-dev+bounces-12402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C0B877A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 02:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSYQ70MC7z30Qk;
	Fri, 19 Sep 2025 10:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758241998;
	cv=none; b=QNDDzb0O3haaewAA0Z15j8y2/fH50EfzAMzYtzZji6MgnwXYnkoy3LY24ifEz0W5H76bFYxI8H4eHMeLkEAIOcR9qrQv+vN/4uoFEqlnjS5r9+VsIM8zdGosrtAO4Na1+wUP6uzTPbY31F9/rdu+7JMI5P2xYFtpRUgzBD9QRJvX1yW+VZBPc8cKV//iP1GeGcpFX5iVug3GnNGBW9TJEFQttC+Gw1GRoZFfUDo731xnOVw2WmO+raL5UXRnxeqmAwNvmKdeij+683PI8Rlgbv3XU5Nt3m4lxMfcob3+fKsZGuKCoRzFbF4YWJBI6XRSyynYiCdVqKUJi0/vbdVU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758241998; c=relaxed/relaxed;
	bh=G1cGeGaHWP255DyHLqElEz4ZozH/AyhNkucTFTu+Syc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=neITihPiXdJkrO1vmjBg4jOrXi/xw0AbIpiJ23ft1I5EsA9UozsBlse/fFudiRMI041fX/c+ma5KJggQLcEf0z8adVPLzcnNOD2kY9rzxFhj/PeZHiRsk88nANUvmkySBKD0QXG1s9PzUdD1H2O2ay1S544gl8o9Y5gMEmKi28QWGqGlvTWZFR5lqfdmI0ysHeeSxmv1ZkzNk/SnrIC3HMmeOhKKuMB7t0MlbaPmTZfxJ2uSdcd+VrHG7BGhKPdpKVEnhkcHjVymMhOSuQJYGFWXb/ldmlZDx90+gMxoUYCJg8o8334gY7Fr1aLNSJuB2bs9CXY1nWgsmKNxLff/tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OHmsgyC7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3yatmaaykdjie0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OHmsgyC7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3yatmaaykdjie0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSYQ54mZsz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 10:33:17 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b5515a1f5b8so418803a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758241994; x=1758846794; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1cGeGaHWP255DyHLqElEz4ZozH/AyhNkucTFTu+Syc=;
        b=OHmsgyC7fBb5D+SlkUMPnchCwegsIM29Oef2rthI6numkaIwydxEfJhOCG0bbTEk4W
         DgoSKhKuqOoV8f31SpS5+4Z3UjW8qZWSXgKHZhFZr5hoPlANIvNgqkchDX8FnkE8PmA/
         u1tP89dY4Olxa1tKfI6Z/WkRI/BKK9C4OxUeMU3FeagR8ndqu5Hj/49lWo4x8nrQNWui
         58xZkhAIazEiA6KY88uKOIOdjiHUVFIJj/Rvh6ETmTBNm7evHdDduEISN7tDOYsTrnwb
         K4Pq6RrA0QVmYe4gowQ5q+yuoJYnSNgPgVgOYzQz8Oyx20K+ILTWS6QRvT1L7JVOkslR
         iCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758241994; x=1758846794;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1cGeGaHWP255DyHLqElEz4ZozH/AyhNkucTFTu+Syc=;
        b=xABcMmdrkBP+EwqRUYGNsn5dlsEbSNMDJyTsMRYhJ+KSXCpNIWtys7Qsm4rVvcFLQA
         rxynLDpIYdVdsHJoVPqN698LrKi22kECRha4cajlB2U0mwTE0g5a9Sfiks7R86hSaLoG
         9rh/33hRP8D774ICeCzbro0y2FEoDmsBHGIEdoHZmdTPzx/Y0lG2npZwptvq25wbf3cS
         7+JXeBJOgFxVuY91qNJOY/KnKA926s1eBYkM0UhQxntGYc9bpvY/EbXVAqc9CkFre/Am
         LLoqEmLA2J997C3jNxr6LjPLLAX4TnJ3sQeZFVufx2lUl5yp43yMOcyEeyp9w+G578C+
         aktg==
X-Gm-Message-State: AOJu0YzF8uxatHLBpevghoJv9LP0YGR7Ss61NF6lGlGGBC2EVwVX4ve5
	fOFsSkwenURRAqunrl7wr6VSgjQYWaWkEYfqZZaSpL/z+bNB8b5wrpbYsLZ3Jij79dPDX1KkhZY
	4G/6xqQ==
X-Google-Smtp-Source: AGHT+IHhyh8RoFNFrbu7IWcTsJ8pGyYjiNB6Kv85S1lDZyDd2mWZEdW+4zL3DWhvxw7SMmsA++3rAzK4CyQ=
X-Received: from pjv14.prod.google.com ([2002:a17:90b:564e:b0:32d:69b3:b7b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:5491:b0:251:9f29:453e
 with SMTP id adf61e73a8af0-2926e840fc8mr2025266637.39.1758241993727; Thu, 18
 Sep 2025 17:33:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Sep 2025 17:32:58 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250919003303.1355064-1-seanjc@google.com>
Subject: [PATCH v2 0/5] KVM: Export KVM-internal symbols for sub-modules only
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use the newfangled EXPORT_SYMBOL_FOR_MODULES() along with some macro
shenanigans to export KVM-internal symbols if and only if KVM has one or
more sub-modules, and only for those sub-modules, e.g. x86's kvm-amd.ko
and/or kvm-intel.ko.

Patch 5 gives KVM x86 the full treatment.  If anyone wants to tackle PPC,
it should be doable to restrict KVM PPC's exports as well.

Based on kvm-x86.  My plan is to take this through the KVM x86 tree as there's
an annoying conflict with an in-flight patch, and except for the vfio-ap
change that's been acked, PPC is the only other architecture that's at all
affected, and KVM PPC is maintained separately.

v2:
 - Omit the x86 patch, for now.
 - Drop "GPL" from KVM's macro to match EXPORT_SYMBOL_FOR_MODULES. [Vlastimil]

v1: https://lkml.kernel.org/r/20250729174238.593070-1-seanjc%40google.com

Sean Christopherson (5):
  KVM: s390/vfio-ap: Use kvm_is_gpa_in_memslot() instead of open coded
    equivalent
  KVM: Export KVM-internal symbols for sub-modules only
  KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c
  KVM: x86: Drop pointless exports of kvm_arch_xxx() hooks
  KVM: x86: Export KVM-internal symbols for sub-modules only

 arch/powerpc/include/asm/kvm_types.h |  15 ++
 arch/s390/include/asm/kvm_host.h     |   2 +
 arch/s390/kvm/priv.c                 |   8 +
 arch/x86/include/asm/kvm_host.h      |   3 -
 arch/x86/include/asm/kvm_types.h     |  10 ++
 arch/x86/kvm/cpuid.c                 |  10 +-
 arch/x86/kvm/hyperv.c                |   4 +-
 arch/x86/kvm/irq.c                   |  34 +----
 arch/x86/kvm/kvm_onhyperv.c          |   6 +-
 arch/x86/kvm/lapic.c                 |  71 ++++++---
 arch/x86/kvm/lapic.h                 |   4 +-
 arch/x86/kvm/mmu/mmu.c               |  36 ++---
 arch/x86/kvm/mmu/spte.c              |  10 +-
 arch/x86/kvm/mmu/tdp_mmu.c           |   2 +-
 arch/x86/kvm/pmu.c                   |  10 +-
 arch/x86/kvm/smm.c                   |   2 +-
 arch/x86/kvm/x86.c                   | 219 +++++++++++++--------------
 drivers/s390/crypto/vfio_ap_ops.c    |   2 +-
 include/linux/kvm_types.h            |  25 ++-
 virt/kvm/eventfd.c                   |   2 +-
 virt/kvm/guest_memfd.c               |   4 +-
 virt/kvm/kvm_main.c                  | 128 ++++++++--------
 22 files changed, 324 insertions(+), 283 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kvm_types.h


base-commit: c8fbf7ceb2ae3f64b0c377c8c21f6df577a13eb4
-- 
2.51.0.470.ga7dc726c21-goog


