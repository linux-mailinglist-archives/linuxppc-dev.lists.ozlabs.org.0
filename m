Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DA5771819
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 03:52:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gzYuJskH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJzpF1w3Jz3cgQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 11:52:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gzYuJskH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJzgl0Nvtz30fS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 11:46:26 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc6bfc4b58so2000395ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Aug 2023 18:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691372784; x=1691977584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k716AKBGPPiBg7nc38NPn1eea1ReVoCHAR5Xzy8mJno=;
        b=gzYuJskHw0rGDD8hXtUp6/IClyoWCb0F89X8JPS+3PIHp6zuu0p6snEAnp+krvk9O+
         sJnLXvMYOKwNSlg3/7pQSo0TMgscu2cKbhXzLyHTPmat0zNs+VKgLPDMmyYEEYBhWun8
         z9tfRi35dGb/xwapmJkiPfmhuyme17dflcdn01q5zqso7xsyotHzcN/q16cL94CuQYTd
         wY4DKVlsdb356sNw3MUd0vi274C0ehi+tmwaikGbLEBayTB1PL1EL/PiwtB6qo8B14SJ
         GGdhCNvFC5A0JC5pdMetgX3Uy0EDW0R63PnbTTjJfp8fn0Qiv6rmj9+tz5E9sMg0+ny+
         Zc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691372784; x=1691977584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k716AKBGPPiBg7nc38NPn1eea1ReVoCHAR5Xzy8mJno=;
        b=dVCcmb1tuMOn2CZNkQ1UrYSkPIrAZtES6dQsybL+0zFgtSbF8/6tSEVkFjAHCbwIHk
         Dt3H+Z8wrjKs/n6yV6ZOrU18nP4wfonLE0j2IhOKNBqj1bqNORjDFKrHwPSW6Ps9Glg5
         cYZtLdvpeUqBNi0mfk8mxMq35uhMDc9CZ3EnCerBtYBVbFgIxmvUQvp0D7ZsgPpcJYHf
         BldEOm/dGbG3rScHkLNLecrW/CfFYzjNZaY4B3c142bC2IJwbL3SV/ut7Nk8/djajVdh
         IfyjgJR06MWPX4aXh240rd9c+joVDvIBeDggX711cDp1T11Y7sIsRWBgqyJ+cMg9hdhF
         MnLA==
X-Gm-Message-State: AOJu0YySXoz6VTQUXp7/0eU04DoVD15Gk6I9m+FrZQP4buoKIT7h2+Qt
	qCrw8p5wN5ObThdWH7/tgKN1SxzgAVPXfg==
X-Google-Smtp-Source: AGHT+IHb9f9NUHGyYwDiG2xvmh9kcJ0YcayWIanVSg4dxjmN/uLPdip/kOMv3/nzaDaFXPOhrHo2fw==
X-Received: by 2002:a17:902:a711:b0:1b8:72b2:fd3b with SMTP id w17-20020a170902a71100b001b872b2fd3bmr5483012plq.54.1691372784224;
        Sun, 06 Aug 2023 18:46:24 -0700 (PDT)
Received: from pwon.ibmuc.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.gmail.com with ESMTPSA id jk16-20020a170903331000b001b9e0918b0asm5485139plb.169.2023.08.06.18.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 18:46:23 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
Date: Mon,  7 Aug 2023 11:45:51 +1000
Message-Id: <20230807014553.1168699-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230807014553.1168699-1-jniethe5@gmail.com>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LPID register is 32 bits long. The host keeps the lpids for each
guest in an unsigned word struct kvm_arch. Currently, LPIDs are already
limited by mmu_lpid_bits and KVM_MAX_NESTED_GUESTS_SHIFT.

The nestedv2 API returns a 64 bit "Guest ID" to be used be the L1 host
for each L2 guest. This value is used as an lpid, e.g. it is the
parameter used by H_RPT_INVALIDATE. To minimize needless special casing
it makes sense to keep this "Guest ID" in struct kvm_arch::lpid.

This means that struct kvm_arch::lpid is too small so prepare for this
and make it an unsigned long. This is not a problem for the KVM-HV and
nestedv1 cases as their lpid values are already limited to valid ranges
so in those contexts the lpid can be used as an unsigned word safely as
needed.

In the PAPR, the H_RPT_INVALIDATE pid/lpid parameter is already
specified as an unsigned long so change pseries_rpt_invalidate() to
match that.  Update the callers of pseries_rpt_invalidate() to also take
an unsigned long if they take an lpid value.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v3:
  - New to series
---
 arch/powerpc/include/asm/kvm_book3s.h     | 10 +++++-----
 arch/powerpc/include/asm/kvm_book3s_64.h  |  2 +-
 arch/powerpc/include/asm/kvm_host.h       |  2 +-
 arch/powerpc/include/asm/plpar_wrappers.h |  4 ++--
 arch/powerpc/kvm/book3s_64_mmu_hv.c       |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c    | 22 +++++++++++-----------
 arch/powerpc/kvm/book3s_hv_nested.c       |  4 ++--
 arch/powerpc/kvm/book3s_xive.c            |  4 ++--
 8 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 1a7e837ea2d5..98d4870ec4b3 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -191,14 +191,14 @@ extern int kvmppc_mmu_radix_translate_table(struct kvm_vcpu *vcpu, gva_t eaddr,
 extern int kvmppc_mmu_radix_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 			struct kvmppc_pte *gpte, bool data, bool iswrite);
 extern void kvmppc_radix_tlbie_page(struct kvm *kvm, unsigned long addr,
-				    unsigned int pshift, unsigned int lpid);
+				    unsigned int pshift, unsigned long lpid);
 extern void kvmppc_unmap_pte(struct kvm *kvm, pte_t *pte, unsigned long gpa,
 			unsigned int shift,
 			const struct kvm_memory_slot *memslot,
-			unsigned int lpid);
+			unsigned long lpid);
 extern bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested,
 				    bool writing, unsigned long gpa,
-				    unsigned int lpid);
+				    unsigned long lpid);
 extern int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 				unsigned long gpa,
 				struct kvm_memory_slot *memslot,
@@ -207,7 +207,7 @@ extern int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 extern int kvmppc_init_vm_radix(struct kvm *kvm);
 extern void kvmppc_free_radix(struct kvm *kvm);
 extern void kvmppc_free_pgtable_radix(struct kvm *kvm, pgd_t *pgd,
-				      unsigned int lpid);
+				      unsigned long lpid);
 extern int kvmppc_radix_init(void);
 extern void kvmppc_radix_exit(void);
 extern void kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
@@ -300,7 +300,7 @@ void kvmhv_nested_exit(void);
 void kvmhv_vm_nested_init(struct kvm *kvm);
 long kvmhv_set_partition_table(struct kvm_vcpu *vcpu);
 long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu);
-void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1);
+void kvmhv_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1);
 void kvmhv_release_all_nested(struct kvm *kvm);
 long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
 long kvmhv_do_nested_tlbie(struct kvm_vcpu *vcpu);
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index d49065af08e9..9fc3ad3990f7 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -624,7 +624,7 @@ static inline void copy_to_checkpoint(struct kvm_vcpu *vcpu)
 
 extern int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 			     unsigned long gpa, unsigned int level,
-			     unsigned long mmu_seq, unsigned int lpid,
+			     unsigned long mmu_seq, unsigned long lpid,
 			     unsigned long *rmapp, struct rmap_nested **n_rmap);
 extern void kvmhv_insert_nest_rmap(struct kvm *kvm, unsigned long *rmapp,
 				   struct rmap_nested **n_rmap);
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 14ee0dece853..67dd3e749cac 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -276,7 +276,7 @@ struct kvm_resize_hpt;
 #define KVMPPC_SECURE_INIT_ABORT 0x4 /* H_SVM_INIT_ABORT issued */
 
 struct kvm_arch {
-	unsigned int lpid;
+	unsigned long lpid;
 	unsigned int smt_mode;		/* # vcpus per virtual core */
 	unsigned int emul_smt_mode;	/* emualted SMT mode, on P9 */
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 8239c0af5eb2..efd9b8b7fb8f 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -354,7 +354,7 @@ static inline long plpar_get_cpu_characteristics(struct h_cpu_char_result *p)
  * error recovery of killing the process/guest will be eventually
  * needed.
  */
-static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 type,
+static inline long pseries_rpt_invalidate(unsigned long pid, u64 target, u64 type,
 					  u64 page_sizes, u64 start, u64 end)
 {
 	long rc;
@@ -400,7 +400,7 @@ static inline long plpar_pte_read_4(unsigned long flags, unsigned long ptex,
 	return 0;
 }
 
-static inline long pseries_rpt_invalidate(u32 pid, u64 target, u64 type,
+static inline long pseries_rpt_invalidate(unsigned long pid, u64 target, u64 type,
 					  u64 page_sizes, u64 start, u64 end)
 {
 	return 0;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 738f2ecbe9b9..01ad8fe96184 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -121,7 +121,7 @@ void kvmppc_set_hpt(struct kvm *kvm, struct kvm_hpt_info *info)
 	kvm->arch.sdr1 = __pa(info->virt) | (info->order - 18);
 
 	pr_debug("KVM guest htab at %lx (order %ld), LPID %x\n",
-		 info->virt, (long)info->order, kvm->arch.lpid);
+		 info->virt, (long)info->order, (unsigned int)kvm->arch.lpid);
 }
 
 int kvmppc_alloc_reset_hpt(struct kvm *kvm, int order)
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index ab646f59afd7..0470abd0a9c1 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -308,7 +308,7 @@ int kvmppc_mmu_radix_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 }
 
 void kvmppc_radix_tlbie_page(struct kvm *kvm, unsigned long addr,
-			     unsigned int pshift, unsigned int lpid)
+			     unsigned int pshift, unsigned long lpid)
 {
 	unsigned long psize = PAGE_SIZE;
 	int psi;
@@ -345,7 +345,7 @@ void kvmppc_radix_tlbie_page(struct kvm *kvm, unsigned long addr,
 		pr_err("KVM: TLB page invalidation hcall failed, rc=%ld\n", rc);
 }
 
-static void kvmppc_radix_flush_pwc(struct kvm *kvm, unsigned int lpid)
+static void kvmppc_radix_flush_pwc(struct kvm *kvm, unsigned long lpid)
 {
 	long rc;
 
@@ -418,7 +418,7 @@ static void kvmppc_pmd_free(pmd_t *pmdp)
 void kvmppc_unmap_pte(struct kvm *kvm, pte_t *pte, unsigned long gpa,
 		      unsigned int shift,
 		      const struct kvm_memory_slot *memslot,
-		      unsigned int lpid)
+		      unsigned long lpid)
 
 {
 	unsigned long old;
@@ -469,7 +469,7 @@ void kvmppc_unmap_pte(struct kvm *kvm, pte_t *pte, unsigned long gpa,
  * (or 4kB) mappings (of sub-pages of the same 2MB page).
  */
 static void kvmppc_unmap_free_pte(struct kvm *kvm, pte_t *pte, bool full,
-				  unsigned int lpid)
+				  unsigned long lpid)
 {
 	if (full) {
 		memset(pte, 0, sizeof(long) << RADIX_PTE_INDEX_SIZE);
@@ -490,7 +490,7 @@ static void kvmppc_unmap_free_pte(struct kvm *kvm, pte_t *pte, bool full,
 }
 
 static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
-				  unsigned int lpid)
+				  unsigned long lpid)
 {
 	unsigned long im;
 	pmd_t *p = pmd;
@@ -519,7 +519,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
 }
 
 static void kvmppc_unmap_free_pud(struct kvm *kvm, pud_t *pud,
-				  unsigned int lpid)
+				  unsigned long lpid)
 {
 	unsigned long iu;
 	pud_t *p = pud;
@@ -540,7 +540,7 @@ static void kvmppc_unmap_free_pud(struct kvm *kvm, pud_t *pud,
 	pud_free(kvm->mm, pud);
 }
 
-void kvmppc_free_pgtable_radix(struct kvm *kvm, pgd_t *pgd, unsigned int lpid)
+void kvmppc_free_pgtable_radix(struct kvm *kvm, pgd_t *pgd, unsigned long lpid)
 {
 	unsigned long ig;
 
@@ -567,7 +567,7 @@ void kvmppc_free_radix(struct kvm *kvm)
 }
 
 static void kvmppc_unmap_free_pmd_entry_table(struct kvm *kvm, pmd_t *pmd,
-					unsigned long gpa, unsigned int lpid)
+					unsigned long gpa, unsigned long lpid)
 {
 	pte_t *pte = pte_offset_kernel(pmd, 0);
 
@@ -583,7 +583,7 @@ static void kvmppc_unmap_free_pmd_entry_table(struct kvm *kvm, pmd_t *pmd,
 }
 
 static void kvmppc_unmap_free_pud_entry_table(struct kvm *kvm, pud_t *pud,
-					unsigned long gpa, unsigned int lpid)
+					unsigned long gpa, unsigned long lpid)
 {
 	pmd_t *pmd = pmd_offset(pud, 0);
 
@@ -609,7 +609,7 @@ static void kvmppc_unmap_free_pud_entry_table(struct kvm *kvm, pud_t *pud,
 
 int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		      unsigned long gpa, unsigned int level,
-		      unsigned long mmu_seq, unsigned int lpid,
+		      unsigned long mmu_seq, unsigned long lpid,
 		      unsigned long *rmapp, struct rmap_nested **n_rmap)
 {
 	pgd_t *pgd;
@@ -786,7 +786,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 }
 
 bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested, bool writing,
-			     unsigned long gpa, unsigned int lpid)
+			     unsigned long gpa, unsigned long lpid)
 {
 	unsigned long pgflags;
 	unsigned int shift;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 377d0b4a05ee..20490dd4708f 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -478,7 +478,7 @@ void kvmhv_nested_exit(void)
 	}
 }
 
-static void kvmhv_flush_lpid(unsigned int lpid)
+static void kvmhv_flush_lpid(unsigned long lpid)
 {
 	long rc;
 
@@ -500,7 +500,7 @@ static void kvmhv_flush_lpid(unsigned int lpid)
 		pr_err("KVM: TLB LPID invalidation hcall failed, rc=%ld\n", rc);
 }
 
-void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1)
+void kvmhv_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1)
 {
 	if (!kvmhv_on_pseries()) {
 		mmu_partition_table_set_entry(lpid, dw0, dw1, true);
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 4adff4f1896d..229f0a1ffdd4 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -886,10 +886,10 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
 
 	if (single_escalation)
 		name = kasprintf(GFP_KERNEL, "kvm-%d-%d",
-				 vcpu->kvm->arch.lpid, xc->server_num);
+				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num);
 	else
 		name = kasprintf(GFP_KERNEL, "kvm-%d-%d-%d",
-				 vcpu->kvm->arch.lpid, xc->server_num, prio);
+				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num, prio);
 	if (!name) {
 		pr_err("Failed to allocate escalation irq name for queue %d of VCPU %d\n",
 		       prio, xc->server_num);
-- 
2.39.3

