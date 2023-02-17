Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B607969A4CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:19:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHz8h4RNPz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:19:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H7ZJCjnV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3s_7uywykdjikgl3wa2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H7ZJCjnV;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHz1M6f9cz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 15:12:38 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id r17-20020a258291000000b008ee1c76c25dso4284874ybk.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 20:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H/GuDUROnbyTGes2XnyznN9mXaXPvxr+5www9rGuZjw=;
        b=H7ZJCjnVFcsNWTa2RG29/qsmeOGIVgu1iRjRZLzH/Okmppw4T2+P/DDHy58WBNdcLO
         PVojZBUjBg5LjGq2jrC7hXgb4zDE93b2TjmbkRijt+PL65Hcy3GZQzgEVtX7Mog9upc7
         t8VhxljQvKISaSwRRx8kwA+ZRtOHVEOCt7ujBNJnWU5lEGRUR6D5IMSsLD2wx1A7ihzs
         RNAHFB7TcVRkfy+Kew8x0stSzIp8l0Nq0TztZxKKbos0q83Boz780Kfso4O6Oe9vwb59
         zsDkMg7/13CjEN7WBjRKq4JrH3dQthNX5ytatHzVBkTCzmhRmaI9A/fqmVDEvNfE2KXn
         cdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H/GuDUROnbyTGes2XnyznN9mXaXPvxr+5www9rGuZjw=;
        b=0+DuJl96HSZ3fitoDeZ4BBxpIwtPc5SOlw839+Aoa4i8AP7cGErR/3wbSWwmMpFJvw
         Pi5g1VScGJ7/gqMm9mhBnwrPSTeyBvDl3bhU80qGhHtDN/xm5Vkyr/Vy7leMguSvif9J
         ztRfqY99a8haCJPAbjUDSScc8FxQXTBrIv8lH9Wz533cI7tvm/FGqnvBRINQbD5jUOR2
         dRnd4bMKEyOO1rCtrqkt0Kh1prvoh3JLL9Z2UhTB/3d4Z8YwhMwaXRwJK7h+wQx/saNa
         W9vQH+S0bSMt2q3ZrTCfBHu35r9/Opq94GKPKKs8MjA+EJRXWVSYF0+gtVBI3KvbF/x3
         /qng==
X-Gm-Message-State: AO0yUKUjQUDjdtpciI2K5QaHivC90up7+UQfgoMk0FjAc10QbSRkeqUZ
	QojMIWf6TwtbzhUSL3eT83xJ0IkOP5Y=
X-Google-Smtp-Source: AK7set+fTufSi1mf3NHWWE76I/+W+6rBUx1gHUmSS3v0Q9/+ecQDc4/dHySN2KHcxj5eSISsBgqTrYrEgZo=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:6fb3:61e:d31f:1ad3])
 (user=yuzhao job=sendgmr) by 2002:a05:6902:1024:b0:8fc:686c:cf87 with SMTP id
 x4-20020a056902102400b008fc686ccf87mr111670ybt.4.1676607155256; Thu, 16 Feb
 2023 20:12:35 -0800 (PST)
Date: Thu, 16 Feb 2023 21:12:25 -0700
Message-Id: <20230217041230.2417228-1-yuzhao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Subject: [PATCH mm-unstable v1 0/5] mm/kvm: lockless accessed bit harvest
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 17 Feb 2023 15:18:13 +1100
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
Cc: linux-mm@google.com, Yu Zhao <yuzhao@google.com>, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TLDR
====
This patchset RCU-protects KVM page tables and compare-and-exchanges
KVM PTEs with the accessed bit set by hardware. It significantly
improves the performance of guests when the host is under heavy
memory pressure.

ChromeOS has been using a similar approach [1] since mid 2021 and it
was proven successful on tens of millions devices.

[1] https://crrev.com/c/2987928

Overview
========
The goal of this patchset is to optimize the performance of guests
when the host memory is overcommitted. It focuses on the vast
majority of VMs that are not nested and run on hardware that sets the
accessed bit in KVM page tables.

Note that nested VMs and hardware that does not support the accessed
bit are both out of scope.

This patchset relies on two techniques, RCU and cmpxchg, to safely
test and clear the accessed bit without taking kvm->mmu_lock. The
former protects KVM page tables from being freed while the latter
clears the accessed bit atomically against both hardware and other
software page table walkers.

A new MMU notifier API, mmu_notifier_test_clear_young(), is
introduced. It follows two design patterns: fallback and batching.
For any unsupported cases, it can optionally fall back to
mmu_notifier_ops->clear_young(). For a range of KVM PTEs, it can test
or test and clear their accessed bits according to a bitmap provided
by the caller.

This patchset only applies mmu_notifier_test_clear_young() to MGLRU.
A follow-up patchset will apply it to /proc/PID/pagemap and
/prod/PID/clear_refs.

Evaluation
==========
An existing selftest can quickly demonstrate the effectiveness of
this patchset. On a generic workstation equipped with 64 CPUs and
256GB DRAM:

  $ sudo max_guest_memory_test -c 64 -m 256 -s 256

  MGLRU      run2
  ---------------
  Before    ~600s
  After      ~50s
  Off       ~250s

  kswapd (MGLRU before)
    100.00%  balance_pgdat
      100.00%  shrink_node
        100.00%  shrink_one
          99.97%  try_to_shrink_lruvec
            99.06%  evict_folios
              97.41%  shrink_folio_list
                31.33%  folio_referenced
                  31.06%  rmap_walk_file
                    30.89%  folio_referenced_one
                      20.83%  __mmu_notifier_clear_flush_young
                        20.54%  kvm_mmu_notifier_clear_flush_young
  =>                      19.34%  _raw_write_lock

  kswapd (MGLRU after)
    100.00%  balance_pgdat
      100.00%  shrink_node
        100.00%  shrink_one
          99.97%  try_to_shrink_lruvec
            99.51%  evict_folios
              71.70%  shrink_folio_list
                7.08%  folio_referenced
                  6.78%  rmap_walk_file
                    6.72%  folio_referenced_one
                      5.60%  lru_gen_look_around
  =>                    1.53%  __mmu_notifier_test_clear_young

  kswapd (MGLRU off)
    100.00%  balance_pgdat
      100.00%  shrink_node
        99.92%  shrink_lruvec
          69.95%  shrink_folio_list
            19.35%  folio_referenced
              18.37%  rmap_walk_file
                17.88%  folio_referenced_one
                  13.20%  __mmu_notifier_clear_flush_young
                    11.64%  kvm_mmu_notifier_clear_flush_young
  =>                  9.93%  _raw_write_lock
          26.23%  shrink_active_list
            25.50%  folio_referenced
              25.35%  rmap_walk_file
                25.28%  folio_referenced_one
                  23.87%  __mmu_notifier_clear_flush_young
                    23.69%  kvm_mmu_notifier_clear_flush_young
  =>                  18.98%  _raw_write_lock

Comprehensive benchmarks are coming soon.

Yu Zhao (5):
  mm/kvm: add mmu_notifier_test_clear_young()
  kvm/x86: add kvm_arch_test_clear_young()
  kvm/arm64: add kvm_arch_test_clear_young()
  kvm/powerpc: add kvm_arch_test_clear_young()
  mm: multi-gen LRU: use mmu_notifier_test_clear_young()

 arch/arm64/include/asm/kvm_host.h       |   7 ++
 arch/arm64/include/asm/kvm_pgtable.h    |   8 ++
 arch/arm64/include/asm/stage2_pgtable.h |  43 ++++++++
 arch/arm64/kvm/arm.c                    |   1 +
 arch/arm64/kvm/hyp/pgtable.c            |  51 ++--------
 arch/arm64/kvm/mmu.c                    |  77 +++++++++++++-
 arch/powerpc/include/asm/kvm_host.h     |  18 ++++
 arch/powerpc/include/asm/kvm_ppc.h      |  14 +--
 arch/powerpc/kvm/book3s.c               |   7 ++
 arch/powerpc/kvm/book3s.h               |   2 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c  |  78 ++++++++++++++-
 arch/powerpc/kvm/book3s_hv.c            |  10 +-
 arch/x86/include/asm/kvm_host.h         |  27 +++++
 arch/x86/kvm/mmu/spte.h                 |  12 ---
 arch/x86/kvm/mmu/tdp_mmu.c              |  41 ++++++++
 include/linux/kvm_host.h                |  29 ++++++
 include/linux/mmu_notifier.h            |  40 ++++++++
 include/linux/mmzone.h                  |   6 +-
 mm/mmu_notifier.c                       |  26 +++++
 mm/rmap.c                               |   8 +-
 mm/vmscan.c                             | 127 +++++++++++++++++++++---
 virt/kvm/kvm_main.c                     |  58 +++++++++++
 22 files changed, 593 insertions(+), 97 deletions(-)

-- 
2.39.2.637.g21b0678d19-goog

