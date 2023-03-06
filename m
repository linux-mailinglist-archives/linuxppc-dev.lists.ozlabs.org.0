Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D296ACD7E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVp0l5sK4z3f99
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:04:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ayF7i9Dv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--dmatlack.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3qtggzagkdfo5e2ld24c8gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--dmatlack.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ayF7i9Dv;
	dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVnxn0rFqz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:02:03 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id a25-20020a056a001d1900b005e82b3dc9f4so5899109pfx.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aVeYFUAaozUOnFog0adFgmU2JgVVSGajkgl902L/1Rk=;
        b=ayF7i9DvZYu0FDkTEvY+lEZ1TzR7tFwo1A5yCyweiwEzFA0569mKnfCWbwfT1RuYoi
         aaoj0OLX7WH5Im9zuLmCg3rZNvdhl90C4a1BKpyW4x/Rubg7L9dVdsaZmtTnUT5cfTnk
         Nc1lmZ6fPheWE0NkKvZ9+Lp9C29mSi0spLczKUwC8b0qgfoe41IPITIS2c14lITxvnPM
         zhrb7ld7vwVaQdcKugb86XtsYk3weAUHE303Fxtk7OcLXuHXe96DFmN1WUOTaubuCtuP
         QQRVnUdGWrto44NaTGO0O7pKktt0pIZOJ+IqWSgMFAUkK80pJi/ziF6HAXcS1lPVrp2I
         luDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVeYFUAaozUOnFog0adFgmU2JgVVSGajkgl902L/1Rk=;
        b=48islhgIPHeyxPqINS12BvL1etRRulWEDdzO/ZqwDlfRoPq06SCHw2zLsNw4u6pdeJ
         l51FOSCHs5RKCYEGgvVNFXpb0E0k1Oxmpp1FFe2qLXjEpxAO+dhjKoYfm7uZC6OqI7Lu
         DkzcDKPJdKZIXhy5my0XO9yV5th0bi1vjSLnxOLwqA/uvAG5tNIT5cF2ZEVD4QkcEhvt
         Pvm2+msoHZfXsNjMJ+R76H2JBx1JwPyaZ6TIECE8++gN7PgJKww+/h4SIwROgznSVx3a
         rWb7VSI8i4tEyp6O99BMnU14PJuA5GRUzD2ryL1ryK4QQ9uFpvQs6hLNVXdzCFNGiRYv
         gPwQ==
X-Gm-Message-State: AO0yUKWli0ZRRJc40al/JKKjOXZXhJItoGxajI9oO8Mz0oXbvbtTCFex
	ZJgK7FvbYFWdu6+QpxZoGFHCEvgADfzzDQ==
X-Google-Smtp-Source: AK7set8bkhEjkaxKFJOK+csmU8XUtWiWxWElSO+3ptgGRXr0eXqqwcSExjspxYfl4cT7fbWwfKjZyhdLvknmjw==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:903:278d:b0:19c:1869:3558 with SMTP
 id jw13-20020a170903278d00b0019c18693558mr4672667plb.5.1678129321404; Mon, 06
 Mar 2023 11:02:01 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:53 -0800
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-2-dmatlack@google.com>
Subject: [PATCH v2 1/4] KVM: Refactor stats descriptor generation macros
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Atish Patra <atishp@atishpatra.org>, David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, J
 ames Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refactor the various KVM stats macros to reduce the amount of duplicate
macro code. This change also improves readability by spelling out
"CUMULATIVE", "INSTANT", and "PEAK" instead of the previous short-hands
which were less clear ("COUNTER", "ICOUNTER", and "PCOUNTER").

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/arm64/kvm/guest.c    |  14 +--
 arch/mips/kvm/mips.c      |  54 +++++------
 arch/powerpc/kvm/book3s.c |  62 ++++++------
 arch/powerpc/kvm/booke.c  |  48 ++++-----
 arch/riscv/kvm/vcpu.c     |  16 +--
 arch/s390/kvm/kvm-s390.c  | 198 +++++++++++++++++++-------------------
 arch/x86/kvm/x86.c        |  94 +++++++++---------
 include/linux/kvm_host.h  |  95 ++++++------------
 8 files changed, 272 insertions(+), 309 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 07444fa22888..890ed444c237 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -44,13 +44,13 @@ const struct kvm_stats_header kvm_vm_stats_header = {
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
-	STATS_DESC_COUNTER(VCPU, hvc_exit_stat),
-	STATS_DESC_COUNTER(VCPU, wfe_exit_stat),
-	STATS_DESC_COUNTER(VCPU, wfi_exit_stat),
-	STATS_DESC_COUNTER(VCPU, mmio_exit_user),
-	STATS_DESC_COUNTER(VCPU, mmio_exit_kernel),
-	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, exits)
+	KVM_STAT(VCPU, CUMULATIVE, NONE, hvc_exit_stat),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, wfe_exit_stat),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, wfi_exit_stat),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, mmio_exit_user),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, mmio_exit_kernel),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, signal_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exits)
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 36c8991b5d39..b7b2fa400bcf 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -53,34 +53,34 @@ const struct kvm_stats_header kvm_vm_stats_header = {
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
-	STATS_DESC_COUNTER(VCPU, wait_exits),
-	STATS_DESC_COUNTER(VCPU, cache_exits),
-	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, int_exits),
-	STATS_DESC_COUNTER(VCPU, cop_unusable_exits),
-	STATS_DESC_COUNTER(VCPU, tlbmod_exits),
-	STATS_DESC_COUNTER(VCPU, tlbmiss_ld_exits),
-	STATS_DESC_COUNTER(VCPU, tlbmiss_st_exits),
-	STATS_DESC_COUNTER(VCPU, addrerr_st_exits),
-	STATS_DESC_COUNTER(VCPU, addrerr_ld_exits),
-	STATS_DESC_COUNTER(VCPU, syscall_exits),
-	STATS_DESC_COUNTER(VCPU, resvd_inst_exits),
-	STATS_DESC_COUNTER(VCPU, break_inst_exits),
-	STATS_DESC_COUNTER(VCPU, trap_inst_exits),
-	STATS_DESC_COUNTER(VCPU, msa_fpe_exits),
-	STATS_DESC_COUNTER(VCPU, fpe_exits),
-	STATS_DESC_COUNTER(VCPU, msa_disabled_exits),
-	STATS_DESC_COUNTER(VCPU, flush_dcache_exits),
-	STATS_DESC_COUNTER(VCPU, vz_gpsi_exits),
-	STATS_DESC_COUNTER(VCPU, vz_gsfc_exits),
-	STATS_DESC_COUNTER(VCPU, vz_hc_exits),
-	STATS_DESC_COUNTER(VCPU, vz_grr_exits),
-	STATS_DESC_COUNTER(VCPU, vz_gva_exits),
-	STATS_DESC_COUNTER(VCPU, vz_ghfc_exits),
-	STATS_DESC_COUNTER(VCPU, vz_gpa_exits),
-	STATS_DESC_COUNTER(VCPU, vz_resvd_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, wait_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, cache_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, signal_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, int_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, cop_unusable_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, tlbmod_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, tlbmiss_ld_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, tlbmiss_st_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, addrerr_st_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, addrerr_ld_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, syscall_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, resvd_inst_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, break_inst_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, trap_inst_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, msa_fpe_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, fpe_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, msa_disabled_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, flush_dcache_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_gpsi_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_gsfc_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_hc_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_grr_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_gva_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_ghfc_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_gpa_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_resvd_exits),
 #ifdef CONFIG_CPU_LOONGSON64
-	STATS_DESC_COUNTER(VCPU, vz_cpucfg_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, vz_cpucfg_exits),
 #endif
 };
 
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 57f4e7896d67..8a7a932961d5 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -40,8 +40,8 @@
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
-	STATS_DESC_ICOUNTER(VM, num_2M_pages),
-	STATS_DESC_ICOUNTER(VM, num_1G_pages)
+	KVM_STAT(VM, INSTANT, NONE, num_2M_pages),
+	KVM_STAT(VM, INSTANT, NONE, num_1G_pages)
 };
 
 const struct kvm_stats_header kvm_vm_stats_header = {
@@ -55,35 +55,35 @@ const struct kvm_stats_header kvm_vm_stats_header = {
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
-	STATS_DESC_COUNTER(VCPU, sum_exits),
-	STATS_DESC_COUNTER(VCPU, mmio_exits),
-	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, light_exits),
-	STATS_DESC_COUNTER(VCPU, itlb_real_miss_exits),
-	STATS_DESC_COUNTER(VCPU, itlb_virt_miss_exits),
-	STATS_DESC_COUNTER(VCPU, dtlb_real_miss_exits),
-	STATS_DESC_COUNTER(VCPU, dtlb_virt_miss_exits),
-	STATS_DESC_COUNTER(VCPU, syscall_exits),
-	STATS_DESC_COUNTER(VCPU, isi_exits),
-	STATS_DESC_COUNTER(VCPU, dsi_exits),
-	STATS_DESC_COUNTER(VCPU, emulated_inst_exits),
-	STATS_DESC_COUNTER(VCPU, dec_exits),
-	STATS_DESC_COUNTER(VCPU, ext_intr_exits),
-	STATS_DESC_COUNTER(VCPU, halt_successful_wait),
-	STATS_DESC_COUNTER(VCPU, dbell_exits),
-	STATS_DESC_COUNTER(VCPU, gdbell_exits),
-	STATS_DESC_COUNTER(VCPU, ld),
-	STATS_DESC_COUNTER(VCPU, st),
-	STATS_DESC_COUNTER(VCPU, pf_storage),
-	STATS_DESC_COUNTER(VCPU, pf_instruc),
-	STATS_DESC_COUNTER(VCPU, sp_storage),
-	STATS_DESC_COUNTER(VCPU, sp_instruc),
-	STATS_DESC_COUNTER(VCPU, queue_intr),
-	STATS_DESC_COUNTER(VCPU, ld_slow),
-	STATS_DESC_COUNTER(VCPU, st_slow),
-	STATS_DESC_COUNTER(VCPU, pthru_all),
-	STATS_DESC_COUNTER(VCPU, pthru_host),
-	STATS_DESC_COUNTER(VCPU, pthru_bad_aff)
+	KVM_STAT(VM, CUMULATIVE, NONE, sum_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, mmio_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, signal_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, light_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, itlb_real_miss_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, itlb_virt_miss_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, dtlb_real_miss_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, dtlb_virt_miss_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, syscall_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, isi_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, dsi_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, emulated_inst_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, dec_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, ext_intr_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, halt_successful_wait),
+	KVM_STAT(VM, CUMULATIVE, NONE, dbell_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, gdbell_exits),
+	KVM_STAT(VM, CUMULATIVE, NONE, ld),
+	KVM_STAT(VM, CUMULATIVE, NONE, st),
+	KVM_STAT(VM, CUMULATIVE, NONE, pf_storage),
+	KVM_STAT(VM, CUMULATIVE, NONE, pf_instruc),
+	KVM_STAT(VM, CUMULATIVE, NONE, sp_storage),
+	KVM_STAT(VM, CUMULATIVE, NONE, sp_instruc),
+	KVM_STAT(VM, CUMULATIVE, NONE, queue_intr),
+	KVM_STAT(VM, CUMULATIVE, NONE, ld_slow),
+	KVM_STAT(VM, CUMULATIVE, NONE, st_slow),
+	KVM_STAT(VM, CUMULATIVE, NONE, pthru_all),
+	KVM_STAT(VM, CUMULATIVE, NONE, pthru_host),
+	KVM_STAT(VM, CUMULATIVE, NONE, pthru_bad_aff)
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 01adffb24667..898bdd583289 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -38,8 +38,8 @@ unsigned long kvmppc_booke_handlers;
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
-	STATS_DESC_ICOUNTER(VM, num_2M_pages),
-	STATS_DESC_ICOUNTER(VM, num_1G_pages)
+	KVM_STAT(VM, INSTANT, NONE, num_2M_pages),
+	KVM_STAT(VM, INSTANT, NONE, num_1G_pages)
 };
 
 const struct kvm_stats_header kvm_vm_stats_header = {
@@ -53,28 +53,28 @@ const struct kvm_stats_header kvm_vm_stats_header = {
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
-	STATS_DESC_COUNTER(VCPU, sum_exits),
-	STATS_DESC_COUNTER(VCPU, mmio_exits),
-	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, light_exits),
-	STATS_DESC_COUNTER(VCPU, itlb_real_miss_exits),
-	STATS_DESC_COUNTER(VCPU, itlb_virt_miss_exits),
-	STATS_DESC_COUNTER(VCPU, dtlb_real_miss_exits),
-	STATS_DESC_COUNTER(VCPU, dtlb_virt_miss_exits),
-	STATS_DESC_COUNTER(VCPU, syscall_exits),
-	STATS_DESC_COUNTER(VCPU, isi_exits),
-	STATS_DESC_COUNTER(VCPU, dsi_exits),
-	STATS_DESC_COUNTER(VCPU, emulated_inst_exits),
-	STATS_DESC_COUNTER(VCPU, dec_exits),
-	STATS_DESC_COUNTER(VCPU, ext_intr_exits),
-	STATS_DESC_COUNTER(VCPU, halt_successful_wait),
-	STATS_DESC_COUNTER(VCPU, dbell_exits),
-	STATS_DESC_COUNTER(VCPU, gdbell_exits),
-	STATS_DESC_COUNTER(VCPU, ld),
-	STATS_DESC_COUNTER(VCPU, st),
-	STATS_DESC_COUNTER(VCPU, pthru_all),
-	STATS_DESC_COUNTER(VCPU, pthru_host),
-	STATS_DESC_COUNTER(VCPU, pthru_bad_aff)
+	KVM_STAT(VCPU, CUMULATIVE, NONE, sum_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, mmio_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, signal_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, light_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, itlb_real_miss_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, itlb_virt_miss_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, dtlb_real_miss_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, dtlb_virt_miss_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, syscall_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, isi_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, dsi_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, emulated_inst_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, dec_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, ext_intr_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, halt_successful_wait),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, dbell_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, gdbell_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, ld),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, st),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pthru_all),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pthru_host),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pthru_bad_aff)
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7d010b0be54e..57f57f6f5baf 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -25,14 +25,14 @@
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
-	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
-	STATS_DESC_COUNTER(VCPU, wfi_exit_stat),
-	STATS_DESC_COUNTER(VCPU, mmio_exit_user),
-	STATS_DESC_COUNTER(VCPU, mmio_exit_kernel),
-	STATS_DESC_COUNTER(VCPU, csr_exit_user),
-	STATS_DESC_COUNTER(VCPU, csr_exit_kernel),
-	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, exits)
+	KVM_STAT(VCPU, CUMULATIVE, NONE, ecall_exit_stat),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, wfi_exit_stat),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, mmio_exit_user),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, mmio_exit_kernel),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, csr_exit_user),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, csr_exit_kernel),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, signal_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exits)
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 39b36562c043..dfb3bc4d4b46 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -61,12 +61,12 @@
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
-	STATS_DESC_COUNTER(VM, inject_io),
-	STATS_DESC_COUNTER(VM, inject_float_mchk),
-	STATS_DESC_COUNTER(VM, inject_pfault_done),
-	STATS_DESC_COUNTER(VM, inject_service_signal),
-	STATS_DESC_COUNTER(VM, inject_virtio),
-	STATS_DESC_COUNTER(VM, aen_forward)
+	KVM_STAT(VM, CUMULATIVE, NONE, inject_io),
+	KVM_STAT(VM, CUMULATIVE, NONE, inject_float_mchk),
+	KVM_STAT(VM, CUMULATIVE, NONE, inject_pfault_done),
+	KVM_STAT(VM, CUMULATIVE, NONE, inject_service_signal),
+	KVM_STAT(VM, CUMULATIVE, NONE, inject_virtio),
+	KVM_STAT(VM, CUMULATIVE, NONE, aen_forward)
 };
 
 const struct kvm_stats_header kvm_vm_stats_header = {
@@ -80,99 +80,99 @@ const struct kvm_stats_header kvm_vm_stats_header = {
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
-	STATS_DESC_COUNTER(VCPU, exit_userspace),
-	STATS_DESC_COUNTER(VCPU, exit_null),
-	STATS_DESC_COUNTER(VCPU, exit_external_request),
-	STATS_DESC_COUNTER(VCPU, exit_io_request),
-	STATS_DESC_COUNTER(VCPU, exit_external_interrupt),
-	STATS_DESC_COUNTER(VCPU, exit_stop_request),
-	STATS_DESC_COUNTER(VCPU, exit_validity),
-	STATS_DESC_COUNTER(VCPU, exit_instruction),
-	STATS_DESC_COUNTER(VCPU, exit_pei),
-	STATS_DESC_COUNTER(VCPU, halt_no_poll_steal),
-	STATS_DESC_COUNTER(VCPU, instruction_lctl),
-	STATS_DESC_COUNTER(VCPU, instruction_lctlg),
-	STATS_DESC_COUNTER(VCPU, instruction_stctl),
-	STATS_DESC_COUNTER(VCPU, instruction_stctg),
-	STATS_DESC_COUNTER(VCPU, exit_program_interruption),
-	STATS_DESC_COUNTER(VCPU, exit_instr_and_program),
-	STATS_DESC_COUNTER(VCPU, exit_operation_exception),
-	STATS_DESC_COUNTER(VCPU, deliver_ckc),
-	STATS_DESC_COUNTER(VCPU, deliver_cputm),
-	STATS_DESC_COUNTER(VCPU, deliver_external_call),
-	STATS_DESC_COUNTER(VCPU, deliver_emergency_signal),
-	STATS_DESC_COUNTER(VCPU, deliver_service_signal),
-	STATS_DESC_COUNTER(VCPU, deliver_virtio),
-	STATS_DESC_COUNTER(VCPU, deliver_stop_signal),
-	STATS_DESC_COUNTER(VCPU, deliver_prefix_signal),
-	STATS_DESC_COUNTER(VCPU, deliver_restart_signal),
-	STATS_DESC_COUNTER(VCPU, deliver_program),
-	STATS_DESC_COUNTER(VCPU, deliver_io),
-	STATS_DESC_COUNTER(VCPU, deliver_machine_check),
-	STATS_DESC_COUNTER(VCPU, exit_wait_state),
-	STATS_DESC_COUNTER(VCPU, inject_ckc),
-	STATS_DESC_COUNTER(VCPU, inject_cputm),
-	STATS_DESC_COUNTER(VCPU, inject_external_call),
-	STATS_DESC_COUNTER(VCPU, inject_emergency_signal),
-	STATS_DESC_COUNTER(VCPU, inject_mchk),
-	STATS_DESC_COUNTER(VCPU, inject_pfault_init),
-	STATS_DESC_COUNTER(VCPU, inject_program),
-	STATS_DESC_COUNTER(VCPU, inject_restart),
-	STATS_DESC_COUNTER(VCPU, inject_set_prefix),
-	STATS_DESC_COUNTER(VCPU, inject_stop_signal),
-	STATS_DESC_COUNTER(VCPU, instruction_epsw),
-	STATS_DESC_COUNTER(VCPU, instruction_gs),
-	STATS_DESC_COUNTER(VCPU, instruction_io_other),
-	STATS_DESC_COUNTER(VCPU, instruction_lpsw),
-	STATS_DESC_COUNTER(VCPU, instruction_lpswe),
-	STATS_DESC_COUNTER(VCPU, instruction_pfmf),
-	STATS_DESC_COUNTER(VCPU, instruction_ptff),
-	STATS_DESC_COUNTER(VCPU, instruction_sck),
-	STATS_DESC_COUNTER(VCPU, instruction_sckpf),
-	STATS_DESC_COUNTER(VCPU, instruction_stidp),
-	STATS_DESC_COUNTER(VCPU, instruction_spx),
-	STATS_DESC_COUNTER(VCPU, instruction_stpx),
-	STATS_DESC_COUNTER(VCPU, instruction_stap),
-	STATS_DESC_COUNTER(VCPU, instruction_iske),
-	STATS_DESC_COUNTER(VCPU, instruction_ri),
-	STATS_DESC_COUNTER(VCPU, instruction_rrbe),
-	STATS_DESC_COUNTER(VCPU, instruction_sske),
-	STATS_DESC_COUNTER(VCPU, instruction_ipte_interlock),
-	STATS_DESC_COUNTER(VCPU, instruction_stsi),
-	STATS_DESC_COUNTER(VCPU, instruction_stfl),
-	STATS_DESC_COUNTER(VCPU, instruction_tb),
-	STATS_DESC_COUNTER(VCPU, instruction_tpi),
-	STATS_DESC_COUNTER(VCPU, instruction_tprot),
-	STATS_DESC_COUNTER(VCPU, instruction_tsch),
-	STATS_DESC_COUNTER(VCPU, instruction_sie),
-	STATS_DESC_COUNTER(VCPU, instruction_essa),
-	STATS_DESC_COUNTER(VCPU, instruction_sthyi),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_sense),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_sense_running),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_external_call),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_emergency),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_cond_emergency),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_start),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_stop),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_stop_store_status),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_store_status),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_store_adtl_status),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_arch),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_prefix),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_restart),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_init_cpu_reset),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_cpu_reset),
-	STATS_DESC_COUNTER(VCPU, instruction_sigp_unknown),
-	STATS_DESC_COUNTER(VCPU, instruction_diagnose_10),
-	STATS_DESC_COUNTER(VCPU, instruction_diagnose_44),
-	STATS_DESC_COUNTER(VCPU, instruction_diagnose_9c),
-	STATS_DESC_COUNTER(VCPU, diag_9c_ignored),
-	STATS_DESC_COUNTER(VCPU, diag_9c_forward),
-	STATS_DESC_COUNTER(VCPU, instruction_diagnose_258),
-	STATS_DESC_COUNTER(VCPU, instruction_diagnose_308),
-	STATS_DESC_COUNTER(VCPU, instruction_diagnose_500),
-	STATS_DESC_COUNTER(VCPU, instruction_diagnose_other),
-	STATS_DESC_COUNTER(VCPU, pfault_sync)
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_userspace),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_null),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_external_request),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_io_request),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_external_interrupt),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_stop_request),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_validity),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_instruction),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_pei),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, halt_no_poll_steal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_lctl),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_lctlg),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_stctl),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_stctg),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_program_interruption),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_instr_and_program),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_operation_exception),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_ckc),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_cputm),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_external_call),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_emergency_signal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_service_signal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_virtio),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_stop_signal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_prefix_signal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_restart_signal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_program),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_io),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, deliver_machine_check),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exit_wait_state),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_ckc),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_cputm),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_external_call),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_emergency_signal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_mchk),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_pfault_init),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_program),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_restart),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_set_prefix),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, inject_stop_signal),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_epsw),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_gs),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_io_other),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_lpsw),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_lpswe),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_pfmf),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_ptff),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sck),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sckpf),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_stidp),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_spx),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_stpx),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_stap),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_iske),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_ri),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_rrbe),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sske),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_ipte_interlock),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_stsi),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_stfl),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_tb),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_tpi),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_tprot),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_tsch),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sie),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_essa),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sthyi),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_sense),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_sense_running),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_external_call),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_emergency),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_cond_emergency),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_start),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_stop),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_stop_store_status),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_store_status),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_store_adtl_status),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_arch),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_prefix),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_restart),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_init_cpu_reset),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_cpu_reset),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_sigp_unknown),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_diagnose_10),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_diagnose_44),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_diagnose_9c),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, diag_9c_ignored),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, diag_9c_forward),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_diagnose_258),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_diagnose_308),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_diagnose_500),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, instruction_diagnose_other),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pfault_sync)
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f706621c35b8..072f5ba83170 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -233,19 +233,19 @@ EXPORT_SYMBOL_GPL(host_xss);
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS(),
-	STATS_DESC_COUNTER(VM, mmu_shadow_zapped),
-	STATS_DESC_COUNTER(VM, mmu_pte_write),
-	STATS_DESC_COUNTER(VM, mmu_pde_zapped),
-	STATS_DESC_COUNTER(VM, mmu_flooded),
-	STATS_DESC_COUNTER(VM, mmu_recycled),
-	STATS_DESC_COUNTER(VM, mmu_cache_miss),
-	STATS_DESC_ICOUNTER(VM, mmu_unsync),
-	STATS_DESC_ICOUNTER(VM, pages_4k),
-	STATS_DESC_ICOUNTER(VM, pages_2m),
-	STATS_DESC_ICOUNTER(VM, pages_1g),
-	STATS_DESC_ICOUNTER(VM, nx_lpage_splits),
-	STATS_DESC_PCOUNTER(VM, max_mmu_rmap_size),
-	STATS_DESC_PCOUNTER(VM, max_mmu_page_hash_collisions)
+	KVM_STAT(VM, CUMULATIVE, NONE, mmu_shadow_zapped),
+	KVM_STAT(VM, CUMULATIVE, NONE, mmu_pte_write),
+	KVM_STAT(VM, CUMULATIVE, NONE, mmu_pde_zapped),
+	KVM_STAT(VM, CUMULATIVE, NONE, mmu_flooded),
+	KVM_STAT(VM, CUMULATIVE, NONE, mmu_recycled),
+	KVM_STAT(VM, CUMULATIVE, NONE, mmu_cache_miss),
+	KVM_STAT(VM, INSTANT, NONE, mmu_unsync),
+	KVM_STAT(VM, INSTANT, NONE, pages_4k),
+	KVM_STAT(VM, INSTANT, NONE, pages_2m),
+	KVM_STAT(VM, INSTANT, NONE, pages_1g),
+	KVM_STAT(VM, INSTANT, NONE, nx_lpage_splits),
+	KVM_STAT(VM, PEAK, NONE, max_mmu_rmap_size),
+	KVM_STAT(VM, PEAK, NONE, max_mmu_page_hash_collisions)
 };
 
 const struct kvm_stats_header kvm_vm_stats_header = {
@@ -259,40 +259,40 @@ const struct kvm_stats_header kvm_vm_stats_header = {
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
-	STATS_DESC_COUNTER(VCPU, pf_taken),
-	STATS_DESC_COUNTER(VCPU, pf_fixed),
-	STATS_DESC_COUNTER(VCPU, pf_emulate),
-	STATS_DESC_COUNTER(VCPU, pf_spurious),
-	STATS_DESC_COUNTER(VCPU, pf_fast),
-	STATS_DESC_COUNTER(VCPU, pf_mmio_spte_created),
-	STATS_DESC_COUNTER(VCPU, pf_guest),
-	STATS_DESC_COUNTER(VCPU, tlb_flush),
-	STATS_DESC_COUNTER(VCPU, invlpg),
-	STATS_DESC_COUNTER(VCPU, exits),
-	STATS_DESC_COUNTER(VCPU, io_exits),
-	STATS_DESC_COUNTER(VCPU, mmio_exits),
-	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, irq_window_exits),
-	STATS_DESC_COUNTER(VCPU, nmi_window_exits),
-	STATS_DESC_COUNTER(VCPU, l1d_flush),
-	STATS_DESC_COUNTER(VCPU, halt_exits),
-	STATS_DESC_COUNTER(VCPU, request_irq_exits),
-	STATS_DESC_COUNTER(VCPU, irq_exits),
-	STATS_DESC_COUNTER(VCPU, host_state_reload),
-	STATS_DESC_COUNTER(VCPU, fpu_reload),
-	STATS_DESC_COUNTER(VCPU, insn_emulation),
-	STATS_DESC_COUNTER(VCPU, insn_emulation_fail),
-	STATS_DESC_COUNTER(VCPU, hypercalls),
-	STATS_DESC_COUNTER(VCPU, irq_injections),
-	STATS_DESC_COUNTER(VCPU, nmi_injections),
-	STATS_DESC_COUNTER(VCPU, req_event),
-	STATS_DESC_COUNTER(VCPU, nested_run),
-	STATS_DESC_COUNTER(VCPU, directed_yield_attempted),
-	STATS_DESC_COUNTER(VCPU, directed_yield_successful),
-	STATS_DESC_COUNTER(VCPU, preemption_reported),
-	STATS_DESC_COUNTER(VCPU, preemption_other),
-	STATS_DESC_IBOOLEAN(VCPU, guest_mode),
-	STATS_DESC_COUNTER(VCPU, notify_window_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pf_taken),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pf_fixed),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pf_emulate),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pf_spurious),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pf_fast),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pf_mmio_spte_created),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, pf_guest),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, tlb_flush),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, invlpg),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, io_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, mmio_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, signal_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, irq_window_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, nmi_window_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, l1d_flush),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, halt_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, request_irq_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, irq_exits),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, host_state_reload),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, fpu_reload),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, insn_emulation),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, insn_emulation_fail),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, hypercalls),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, irq_injections),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, nmi_injections),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, req_event),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, nested_run),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, directed_yield_attempted),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, directed_yield_successful),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, preemption_reported),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, preemption_other),
+	KVM_STAT(VCPU, INSTANT, BOOLEAN, guest_mode),
+	KVM_STAT(VCPU, CUMULATIVE, NONE, notify_window_exits),
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8ada23756b0e..02b1151c2753 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1785,80 +1785,43 @@ struct _kvm_stats_desc {
 		},							       \
 		.name = #stat,						       \
 	}
+
 /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
 #define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
 	SCOPE##_STATS_DESC(stat, type, unit, base, exp, sz, bsz)
 
-#define STATS_DESC_CUMULATIVE(SCOPE, name, unit, base, exponent)	       \
-	STATS_DESC(SCOPE, name, KVM_STATS_TYPE_CUMULATIVE,		       \
-		unit, base, exponent, 1, 0)
-#define STATS_DESC_INSTANT(SCOPE, name, unit, base, exponent)		       \
-	STATS_DESC(SCOPE, name, KVM_STATS_TYPE_INSTANT,			       \
-		unit, base, exponent, 1, 0)
-#define STATS_DESC_PEAK(SCOPE, name, unit, base, exponent)		       \
-	STATS_DESC(SCOPE, name, KVM_STATS_TYPE_PEAK,			       \
-		unit, base, exponent, 1, 0)
-#define STATS_DESC_LINEAR_HIST(SCOPE, name, unit, base, exponent, sz, bsz)     \
-	STATS_DESC(SCOPE, name, KVM_STATS_TYPE_LINEAR_HIST,		       \
-		unit, base, exponent, sz, bsz)
-#define STATS_DESC_LOG_HIST(SCOPE, name, unit, base, exponent, sz)	       \
-	STATS_DESC(SCOPE, name, KVM_STATS_TYPE_LOG_HIST,		       \
-		unit, base, exponent, sz, 0)
-
-/* Cumulative counter, read/write */
-#define STATS_DESC_COUNTER(SCOPE, name)					       \
-	STATS_DESC_CUMULATIVE(SCOPE, name, KVM_STATS_UNIT_NONE,		       \
-		KVM_STATS_BASE_POW10, 0)
-/* Instantaneous counter, read only */
-#define STATS_DESC_ICOUNTER(SCOPE, name)				       \
-	STATS_DESC_INSTANT(SCOPE, name, KVM_STATS_UNIT_NONE,		       \
-		KVM_STATS_BASE_POW10, 0)
-/* Peak counter, read/write */
-#define STATS_DESC_PCOUNTER(SCOPE, name)				       \
-	STATS_DESC_PEAK(SCOPE, name, KVM_STATS_UNIT_NONE,		       \
-		KVM_STATS_BASE_POW10, 0)
-
-/* Instantaneous boolean value, read only */
-#define STATS_DESC_IBOOLEAN(SCOPE, name)				       \
-	STATS_DESC_INSTANT(SCOPE, name, KVM_STATS_UNIT_BOOLEAN,		       \
-		KVM_STATS_BASE_POW10, 0)
-/* Peak (sticky) boolean value, read/write */
-#define STATS_DESC_PBOOLEAN(SCOPE, name)				       \
-	STATS_DESC_PEAK(SCOPE, name, KVM_STATS_UNIT_BOOLEAN,		       \
-		KVM_STATS_BASE_POW10, 0)
-
-/* Cumulative time in nanosecond */
-#define STATS_DESC_TIME_NSEC(SCOPE, name)				       \
-	STATS_DESC_CUMULATIVE(SCOPE, name, KVM_STATS_UNIT_SECONDS,	       \
-		KVM_STATS_BASE_POW10, -9)
-/* Linear histogram for time in nanosecond */
-#define STATS_DESC_LINHIST_TIME_NSEC(SCOPE, name, sz, bsz)		       \
-	STATS_DESC_LINEAR_HIST(SCOPE, name, KVM_STATS_UNIT_SECONDS,	       \
-		KVM_STATS_BASE_POW10, -9, sz, bsz)
-/* Logarithmic histogram for time in nanosecond */
-#define STATS_DESC_LOGHIST_TIME_NSEC(SCOPE, name, sz)			       \
-	STATS_DESC_LOG_HIST(SCOPE, name, KVM_STATS_UNIT_SECONDS,	       \
-		KVM_STATS_BASE_POW10, -9, sz)
+#define KVM_STAT(SCOPE, TYPE, UNIT, _stat)				       \
+	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_##TYPE,			       \
+		   KVM_STATS_UNIT_##UNIT, KVM_STATS_BASE_POW10, 0, 1, 0)
+
+#define KVM_STAT_NSEC(SCOPE, _stat)					       \
+	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_CUMULATIVE,		       \
+		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9, 1, 0)
+
+#define KVM_HIST_NSEC(SCOPE, TYPE, _stat, _size, _bucket_size)		       \
+	STATS_DESC(VCPU_GENERIC, _stat, KVM_STATS_TYPE_##TYPE##_HIST,	       \
+		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9,	       \
+		   _size, _bucket_size)
 
 #define KVM_GENERIC_VM_STATS()						       \
-	STATS_DESC_COUNTER(VM_GENERIC, remote_tlb_flush),		       \
-	STATS_DESC_COUNTER(VM_GENERIC, remote_tlb_flush_requests)
+	KVM_STAT(VM_GENERIC, CUMULATIVE, NONE, remote_tlb_flush),	       \
+	KVM_STAT(VM_GENERIC, CUMULATIVE, NONE, remote_tlb_flush_requests)
+
+#define KVM_HALT_POLL_HIST(_stat)					       \
+	KVM_HIST_NSEC(VCPU_GENERIC, LOG, _stat, HALT_POLL_HIST_COUNT, 0)
 
 #define KVM_GENERIC_VCPU_STATS()					       \
-	STATS_DESC_COUNTER(VCPU_GENERIC, halt_successful_poll),		       \
-	STATS_DESC_COUNTER(VCPU_GENERIC, halt_attempted_poll),		       \
-	STATS_DESC_COUNTER(VCPU_GENERIC, halt_poll_invalid),		       \
-	STATS_DESC_COUNTER(VCPU_GENERIC, halt_wakeup),			       \
-	STATS_DESC_TIME_NSEC(VCPU_GENERIC, halt_poll_success_ns),	       \
-	STATS_DESC_TIME_NSEC(VCPU_GENERIC, halt_poll_fail_ns),		       \
-	STATS_DESC_TIME_NSEC(VCPU_GENERIC, halt_wait_ns),		       \
-	STATS_DESC_LOGHIST_TIME_NSEC(VCPU_GENERIC, halt_poll_success_hist,     \
-			HALT_POLL_HIST_COUNT),				       \
-	STATS_DESC_LOGHIST_TIME_NSEC(VCPU_GENERIC, halt_poll_fail_hist,	       \
-			HALT_POLL_HIST_COUNT),				       \
-	STATS_DESC_LOGHIST_TIME_NSEC(VCPU_GENERIC, halt_wait_hist,	       \
-			HALT_POLL_HIST_COUNT),				       \
-	STATS_DESC_IBOOLEAN(VCPU_GENERIC, blocking)
+	KVM_STAT(VCPU_GENERIC, CUMULATIVE, NONE, halt_successful_poll),	       \
+	KVM_STAT(VCPU_GENERIC, CUMULATIVE, NONE, halt_attempted_poll),	       \
+	KVM_STAT(VCPU_GENERIC, CUMULATIVE, NONE, halt_poll_invalid),	       \
+	KVM_STAT(VCPU_GENERIC, CUMULATIVE, NONE, halt_wakeup),		       \
+	KVM_STAT_NSEC(VCPU_GENERIC, halt_poll_success_ns),		       \
+	KVM_STAT_NSEC(VCPU_GENERIC, halt_poll_fail_ns),			       \
+	KVM_STAT_NSEC(VCPU_GENERIC, halt_wait_ns),			       \
+	KVM_HALT_POLL_HIST(halt_poll_success_hist),			       \
+	KVM_HALT_POLL_HIST(halt_poll_fail_hist),			       \
+	KVM_HALT_POLL_HIST(halt_wait_hist),				       \
+	KVM_STAT(VCPU_GENERIC, INSTANT, BOOLEAN, blocking)
 
 extern struct dentry *kvm_debugfs_dir;
 
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

