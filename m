Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDB32EDBC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:07:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWL91cmkz3dHt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:07:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tEWMQODO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tEWMQODO; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWKk4W3xz3cRW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:06:49 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id a188so2349921pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pkcONn56D2Mm+GoxIkcwdWy3Ms5ne9fpUPMk0kiPOGs=;
 b=tEWMQODOKUE2whWEhf8QmpnVK3TKPjT6z2z0kZBYJqwd8bnbRAF3QAEqcgMGsww/b+
 o/1bV2XY+Vb+Li/JE3vp/1mnW1XnfPFqW9kbIRVoojUVcu0F9fYK/RBngQUkH7zoanr8
 HS32No3AZtlaFYVjE4Z9ls+AjX/KIEusIFASR+vJ2LTJcUWLE/3o1lplFTMpOVXvNHxj
 qfBFhBl1J00juC56NjgUETw0Z5J9CC3HQSQ1TShTL7sYE/PtF1KzXCBucHoGl5qnpFkm
 f3N9IyI8l+vwQ0Sslhl80Sbi+R9ri0gpJ7d9eDhp0SfmI/iQ6pH6cac70tBl0jB9EjeY
 aTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pkcONn56D2Mm+GoxIkcwdWy3Ms5ne9fpUPMk0kiPOGs=;
 b=EKPUHwkOGxk+36KC+YxUB8rQNaQYYHztQgkzG3veNlvzDh/B8Zm6c28gcYoTQBu0zk
 /l3EgUhrUIwq+ZIog8mOco2G0pM3aSk+CxeBIm9szP7/6pdya989z46uvgXD8N4vgurp
 HzFoatqW1r8k9d/HpGSmeYjj1ec38rRij4uRgtZ1D45JGNOBOsm7KuCi66d335geGQNU
 DEJ0+VztP9m7+C56NUGmHxvmNd/rWZTLIW9lFMto604FfJjqRO8jCrRY6iCA9Nttsj28
 esxgWq99OMOQsvdLyXnBv6g3txFOTXWZmrl+RFJRUwLQTgC+CpiTweBHmR+ifl0bPZBI
 iM7g==
X-Gm-Message-State: AOAM532omEMRHwsHtLioChbvKGMbkOR6VqNiPGHZgCI5EHEKWouWy/nE
 Mn10ae2cddHxbLr274nDTuw=
X-Google-Smtp-Source: ABdhPJxvwK+koxUEUZuwV/9oTxYi3V97O7AoUGIaSNg33mY2+8PXgtpWq0OQnaa+Di4nBiEgFsYI+A==
X-Received: by 2002:a63:1725:: with SMTP id x37mr9122053pgl.48.1614956806181; 
 Fri, 05 Mar 2021 07:06:46 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:06:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 00/41] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Date: Sat,  6 Mar 2021 01:05:57 +1000
Message-Id: <20210305150638.2675513-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This tidies up things, and fixes a few corner cases and unfinished
"XXX:" bits. The major one being "bad host interrupt" detection and
handling (taking a MCE/SRESET while switching into guest regs) which
was missing previously from the new P9 path.

Adds a few new patches and makes some changes for issues noticed
by reviewers (thank you).

Thanks,
Nick

Nicholas Piggin (41):
  KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
  KVM: PPC: Book3S HV: Prevent radix guests from setting LPCR[TC]
  KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
  KVM: PPC: Book3S HV: remove unused kvmppc_h_protect argument
  KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n default hcalls
  powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
  powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
  KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
  KVM: PPC: Book3S 64: move KVM interrupt entry to a common entry point
  KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
  KVM: PPC: Book3S 64: add hcall interrupt handler
  KVM: PPC: Book3S 64: Move hcall early register setup to KVM
  KVM: PPC: Book3S 64: Move interrupt early register setup to KVM
  KVM: PPC: Book3S 64: move bad_host_intr check to HV handler
  KVM: PPC: Book3S 64: Minimise hcall handler calling convention
    differences
  KVM: PPC: Book3S HV P9: Move radix MMU switching instructions together
  KVM: PPC: Book3S HV P9: implement kvmppc_xive_pull_vcpu in C
  KVM: PPC: Book3S HV P9: Move xive vcpu context management into
    kvmhv_p9_guest_entry
  KVM: PPC: Book3S HV P9: Stop handling hcalls in real-mode in the P9
    path
  KVM: PPC: Book3S HV P9: Move setting HDEC after switching to guest
    LPCR
  KVM: PPC: Book3S HV P9: Use large decrementer for HDEC
  KVM: PPC: Book3S HV P9: Use host timer accounting to avoid decrementer
    read   
  KVM: PPC: Book3S HV P9: Reduce mftb per guest entry/exit
  powerpc: add set_dec_or_work API for safely updating decrementer
  KVM: PPC: Book3S HV P9: Reduce irq_work vs guest decrementer races
  KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C
  KVM: PPC: Book3S HV P9: inline kvmhv_load_hv_regs_and_go into
    __kvmhv_vcpu_entry_p9
  KVM: PPC: Book3S HV P9: Read machine check registers while MSR[RI] is
    0
  KVM: PPC: Book3S HV P9: Improve exit timing accounting coverage
  KVM: PPC: Book3S HV P9: Move SPR loading after expiry time check
  KVM: PPC: Book3S HV P9: Add helpers for OS SPR handling
  KVM: PPC: Book3S HV P9: Switch to guest MMU context as late as
    possible
  KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling
    MMU
  KVM: PPC: Book3S HV: Remove support for dependent threads mode on P9
  KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path
  KVM: PPC: Book3S HV P9: Allow all P9 processors to enable nested HV
  KVM: PPC: Book3S HV: small pseries_do_hcall cleanup
  KVM: PPC: Book3S HV: add virtual mode handlers for HPT hcalls and page
    faults
  KVM: PPC: Book3S HV P9: implement hash guest support
  KVM: PPC: Book3S HV P9: implement hash host / hash guest support
  KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path

 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/exception-64s.h  |  13 +
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/include/asm/kvm_host.h       |   1 -
 arch/powerpc/include/asm/kvm_ppc.h        |  10 +-
 arch/powerpc/include/asm/mmu_context.h    |   6 -
 arch/powerpc/include/asm/time.h           |  16 +
 arch/powerpc/kernel/exceptions-64s.S      | 262 ++-------
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kernel/time.c                |  21 +-
 arch/powerpc/kvm/Makefile                 |   6 +
 arch/powerpc/kvm/book3s_64_entry.S        | 368 ++++++++++++
 arch/powerpc/kvm/book3s_hv.c              | 669 +++++++++++-----------
 arch/powerpc/kvm/book3s_hv_builtin.c      |   6 +
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 519 +++++++++++++++++
 arch/powerpc/kvm/book3s_hv_interrupts.S   |   9 +-
 arch/powerpc/kvm/book3s_hv_nested.c       |  10 +-
 arch/powerpc/kvm/book3s_hv_ras.c          |   2 +
 arch/powerpc/kvm/book3s_hv_rm_mmu.c       |  15 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 625 +-------------------
 arch/powerpc/kvm/book3s_segment.S         |   7 +
 arch/powerpc/kvm/book3s_xive.c            |  91 +++
 arch/powerpc/mm/book3s64/radix_pgtable.c  |  27 +-
 arch/powerpc/mm/book3s64/radix_tlb.c      |  46 --
 arch/powerpc/mm/mmu_context.c             |   4 +-
 arch/powerpc/platforms/powernv/idle.c     |  52 +-
 27 files changed, 1506 insertions(+), 1298 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

-- 
2.23.0

