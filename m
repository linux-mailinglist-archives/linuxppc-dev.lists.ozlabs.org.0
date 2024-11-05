Return-Path: <linuxppc-dev+bounces-2883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAC9BD63C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 20:56:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjfHD3ZQtz2yZS;
	Wed,  6 Nov 2024 06:56:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730836600;
	cv=none; b=mtZ9ejxV3uTq+t48VZ5GdnYEPJWHUMTzXRuUo6/22d6n+HQbHBhB5JBCRYoNZAaKxGn/TtiO8S+TMQhDyodEPj/qSfLmRvwNw+FNP6ov3e73iJSWbzhzuyVQ7HBRb1o7CSjHSWur7QrvaJMNv60+VjSJsamSIzo+rr2xcUIOeWYKZYLkUvKZsPobDY3chhcZmSJAyoU0EGUSmegsZN5ciHOIbvXWNkalhlqCq1JxqTNTaqgojyclZqF7pIFSYMJGd1yy2+mKlRHGCBKNENeYIO49PcBw3F38YlIdPWRc8VHpN+15ipiMXHafsDEqotJ1wO38UwfphNhX4O/AtaBJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730836600; c=relaxed/relaxed;
	bh=hzMiS31Q99SH+ivi/H+fLjhfNr8W/1ENyadMPU3uzYk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ah7fVUfJHanB+/9gSt2nRqfDLk12bNDsPcQOANwrBE6j/oKPtgCG0bEupV3hH7N9Ihs3V1l7lHymiumhusRAvc84mNGnSRNCGJQ+2MNuCNqQbz51GTZp+44IyRu6zsrGEW2l4wqRNqgweogGQgNdIqVYqWcEnCIR9oArd5ROVZxBMoHIOeJ1sVHLztXWJhcM4qahhulQEC5lgEfquvPAp7PwnornCNxIn8zUbXaRjELcIgT1q5Xa8rHZNBiZ/1zTuVPuviXjMmIfPxibDli/E0TRRf3zqXYpkbbjnHqJ8+l/4S/LrK3FvxkOygEjybsnepANz28slVtSvAxAOW/4Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bdsN1F9E; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bxgqzwskdegmyv3yxvo6s2qyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bdsN1F9E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--coltonlewis.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bxgqzwskdegmyv3yxvo6s2qyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--coltonlewis.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjfHB68szz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 06:56:37 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3c638cc27so113013367b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2024 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730836589; x=1731441389; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hzMiS31Q99SH+ivi/H+fLjhfNr8W/1ENyadMPU3uzYk=;
        b=bdsN1F9Eqafw5gcD7IDX52w8dQ37DEwMY2lC9M7IGFFyhgCoAL39nhnBM0WYvZgiAv
         ThcgB0Bp+slPbNzT+3WTTzjdN/PtcMGPzoaC6c1+qljEu01sZ0plUMsdhRn0hwwOR6oF
         8VS2H8lgIKxeYWxZFawesKqhFAOaN9SQ/RRi2pPEYB8TetbKcMW/PR8C2hl9j9C87jHZ
         nPY57651R12kn7Qq6xCEaEusU99E/DeOL4OJExda/2UOdzV3HQNODruboMDNd6aoAr/b
         uLIB26g/B3QJNVsWRD985fZaMst9LV8+Eg4zhNVIwwoS58/fAH3o43UVIQCMpXhg3N7C
         KzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730836589; x=1731441389;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hzMiS31Q99SH+ivi/H+fLjhfNr8W/1ENyadMPU3uzYk=;
        b=gbFo6lH/O3p7VsgUAe37zfGAOWDygqXZnViwFO0ix/8M//dP93A6reRtbFW/IEn+9m
         YT6AhKjV6+zroIQICUYuK4O+q0KXiYXt9i7yGjn0PADMY/Idt/qlZk5iFyk+wLZf7NN7
         gIvYEwtqUGT783gP45MG6uG4uKN8BHCbyZEspZuIvohQVvOWbi78Cn7cauGedlcgqQAT
         UchATZXuFbKJ+wZ3li3lUTj5UljYhaoZPLT8LVissXofZu80EJUkGm7tgaF6vZJcz1HW
         umFbj3hMSNx6qLhELF3HDx4g3qX4zps9J2Ro8WVUX0YYlI+Hg8fB9bI/omg3+xujjtBV
         bwWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwe/LKBlj1TaYkdCWY4IqUzMO0h+1GywdM4fXINSjO/CfNbuzpsx95DcksPfInhpgqhS4vtwZ9Tk9UUgM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzw5wvveSrSbuNHGskhqicBQeQPkEFcvmBPcGmYOElomHm51Jjo
	s050Qmm3qHK6huZhrPbkj9DPH47lTN+/Kux0NCG7WEBjo+ab4wDH4RuJen4tD4lkVO8CTrU/Ntq
	A8NTLPdYmhodRAJob/4ygDA==
X-Google-Smtp-Source: AGHT+IGCeubudBZvDHKVyK9hoysogwq8Oy8BphtTGtN9ESDHF0Oe45MlIu4/byZXs6BbgdCbpbF4nba1Gh+JSm/9sQ==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fa18])
 (user=coltonlewis job=sendgmr) by 2002:a25:b28e:0:b0:e29:6df8:ef58 with SMTP
 id 3f1490d57ef6-e3087a5bd64mr143088276.4.1730836589136; Tue, 05 Nov 2024
 11:56:29 -0800 (PST)
Date: Tue,  5 Nov 2024 19:55:57 +0000
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241105195603.2317483-1-coltonlewis@google.com>
Subject: [PATCH v6 0/5] Correct perf sampling with Guest VMs
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

v6:
* Apply all Reviewed-by and Acked-by trailers from previous versions
* Rebase to v6.12-rc6

v5:
https://lore.kernel.org/all/20240920174740.781614-1-coltonlewis@google.com/

v4:
https://lore.kernel.org/kvm/20240919190750.4163977-1-coltonlewis@google.com/

v3:
https://lore.kernel.org/kvm/20240912205133.4171576-1-coltonlewis@google.com/

v2:
https://lore.kernel.org/kvm/20240911222433.3415301-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvm/20240904204133.1442132-1-coltonlewis@google.com/

This series cleans up perf recording around guest events and improves
the accuracy of the resulting perf reports.

Perf was incorrectly counting any PMU overflow interrupt that occurred
while a VCPU was loaded as a guest event even when the events were not
truely guest events. This lead to much less accurate and useful perf
recordings.

See as an example the below reports of `perf record
dirty_log_perf_test -m 2 -v 4` before and after the series on ARM64.

Without series:

Samples: 15K of event 'instructions', Event count (approx.): 31830580924
Overhead  Command          Shared Object        Symbol
  54.54%  dirty_log_perf_  dirty_log_perf_test  [.] run_test
   5.39%  dirty_log_perf_  dirty_log_perf_test  [.] vcpu_worker
   0.89%  dirty_log_perf_  [kernel.vmlinux]     [k] release_pages
   0.70%  dirty_log_perf_  [kernel.vmlinux]     [k] free_pcppages_bulk
   0.62%  dirty_log_perf_  dirty_log_perf_test  [.] userspace_mem_region_find
   0.49%  dirty_log_perf_  dirty_log_perf_test  [.] sparsebit_is_set
   0.46%  dirty_log_perf_  dirty_log_perf_test  [.] _virt_pg_map
   0.46%  dirty_log_perf_  dirty_log_perf_test  [.] node_add
   0.37%  dirty_log_perf_  dirty_log_perf_test  [.] node_reduce
   0.35%  dirty_log_perf_  [kernel.vmlinux]     [k] free_unref_page_commit
   0.33%  dirty_log_perf_  [kernel.vmlinux]     [k] __kvm_pgtable_walk
   0.31%  dirty_log_perf_  [kernel.vmlinux]     [k] stage2_attr_walker
   0.29%  dirty_log_perf_  [kernel.vmlinux]     [k] unmap_page_range
   0.29%  dirty_log_perf_  dirty_log_perf_test  [.] test_assert
   0.26%  dirty_log_perf_  [kernel.vmlinux]     [k] __mod_memcg_lruvec_state
   0.24%  dirty_log_perf_  [kernel.vmlinux]     [k] kvm_s2_put_page

With series:

Samples: 15K of event 'instructions', Event count (approx.): 31830580924
Samples: 15K of event 'instructions', Event count (approx.): 30898031385
Overhead  Command          Shared Object        Symbol
  54.05%  dirty_log_perf_  dirty_log_perf_test  [.] run_test
   5.48%  dirty_log_perf_  [kernel.kallsyms]    [k] kvm_arch_vcpu_ioctl_run
   4.70%  dirty_log_perf_  dirty_log_perf_test  [.] vcpu_worker
   3.11%  dirty_log_perf_  [kernel.kallsyms]    [k] kvm_handle_guest_abort
   2.24%  dirty_log_perf_  [kernel.kallsyms]    [k] up_read
   1.98%  dirty_log_perf_  [kernel.kallsyms]    [k] __kvm_tlb_flush_vmid_ipa_nsh
   1.97%  dirty_log_perf_  [kernel.kallsyms]    [k] __pi_clear_page
   1.30%  dirty_log_perf_  [kernel.kallsyms]    [k] down_read
   1.13%  dirty_log_perf_  [kernel.kallsyms]    [k] release_pages
   1.12%  dirty_log_perf_  [kernel.kallsyms]    [k] __kvm_pgtable_walk
   1.08%  dirty_log_perf_  [kernel.kallsyms]    [k] folio_batch_move_lru
   1.06%  dirty_log_perf_  [kernel.kallsyms]    [k] __srcu_read_lock
   1.03%  dirty_log_perf_  [kernel.kallsyms]    [k] get_page_from_freelist
   1.01%  dirty_log_perf_  [kernel.kallsyms]    [k] __pte_offset_map_lock
   0.82%  dirty_log_perf_  [kernel.kallsyms]    [k] handle_mm_fault
   0.74%  dirty_log_perf_  [kernel.kallsyms]    [k] mas_state_walk

Colton Lewis (5):
  arm: perf: Drop unused functions
  perf: Hoist perf_instruction_pointer() and perf_misc_flags()
  powerpc: perf: Use perf_arch_instruction_pointer()
  x86: perf: Refactor misc flag assignments
  perf: Correct perf sampling with guest VMs

 arch/arm/include/asm/perf_event.h            |  7 ---
 arch/arm/kernel/perf_callchain.c             | 17 -------
 arch/arm64/include/asm/perf_event.h          |  4 --
 arch/arm64/kernel/perf_callchain.c           | 28 ------------
 arch/powerpc/include/asm/perf_event_server.h |  6 +--
 arch/powerpc/perf/callchain.c                |  2 +-
 arch/powerpc/perf/callchain_32.c             |  2 +-
 arch/powerpc/perf/callchain_64.c             |  2 +-
 arch/powerpc/perf/core-book3s.c              |  4 +-
 arch/s390/include/asm/perf_event.h           |  6 +--
 arch/s390/kernel/perf_event.c                |  4 +-
 arch/x86/events/core.c                       | 47 +++++++++++---------
 arch/x86/include/asm/perf_event.h            | 12 ++---
 include/linux/perf_event.h                   | 26 +++++++++--
 kernel/events/core.c                         | 27 ++++++++++-
 15 files changed, 95 insertions(+), 99 deletions(-)


base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
--
2.47.0.199.ga7371fff76-goog

