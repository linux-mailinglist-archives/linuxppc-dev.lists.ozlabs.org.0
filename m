Return-Path: <linuxppc-dev+bounces-17623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJbfN6Mwp2kjfwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:04:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12F1F59C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 20:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQQFK1nLxz3bp0;
	Wed, 04 Mar 2026 06:03:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772564629;
	cv=none; b=aSzOKlpjwQmfGBi4M8kbYFLhUCxY9FiQgu5bQOksSPPFuvt3MI5chOQ5MJKR1/50xEW3HCoc8Y6RKV9SOALIEMTsP1BnIS7IT1kfH87V5BtXgAlc8vPqeRKsxJZMsUMkSARn0+38xRd7/TmwFjaTz831S3be849ZuLYERynFWMExIJRnkPpzN5i7oqKI/bF5ZeMNi2YMG8cIlLO9XpMYKPVtmYcUsxbkB3RLV/A0jG9uS42wTSQ+dAIGcdsizTzRL3091p5N8osWRR8BIPVgD8ZG3MjIAFtYndITEjCumHuD/U1eVnA20W/2JC34dPRq5O2R9/C8Vx7Jx+ms+HY5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772564629; c=relaxed/relaxed;
	bh=99DC7OhlXTRR+D72sFLb9VSn0W5lbhfdlhpUdwYerhc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mBopknS0/7UZ3ZOn5rmHvAoPMk5RUff0tGKeoo2gVFNFzlObQn19W6RH/3idSKVvcslj0nSODs0XtSLCG4ymnUvUqTyau+Hmy2EKgvrovS56YKdoTKf0/v+Z50hRUFiwrcRO4i9cKXeAi6Ng3joedUGWfZMgnRrqE4Kenj2fP7mRnMtCl/EkkSjm8autTVMPdfcQ/jO6NsFrzzTWRppa5hnZLx0hfUF1LIZKa9UBWJVTAjQb4/GB7/1za11j9ZkTcSqKd8AWQC0HozYV7yWchj7Nu9VsRWubyl7QJI7g6ewWQsQtOepTAjxGs03BpNStz2UxCHdajp9+d17iFksx4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tDS7rrCJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ktcnaqykdoiwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tDS7rrCJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ktcnaqykdoiwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQQFJ0NzHz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 06:03:47 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2ae49120e74so25767475ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 11:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772564626; x=1773169426; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=99DC7OhlXTRR+D72sFLb9VSn0W5lbhfdlhpUdwYerhc=;
        b=tDS7rrCJpfPN+RqVNm0TSnZJCuqVMjdmO/L7qJTYN55mq2VYEtwdud3CaaYhehGtSi
         YWw7zUXQY4WFFT94nqROW/KC/vGJNh5wukq29wWZRL30p5rFxrnGPLoWafv158Tzc9em
         gUPwF4dn2S3it4VyRguecIpWOpY7i5oUAdhx8O6438MvQqX5oqs/aFuWq8/IoH2SE/QS
         J7tZHbpkG19hrbf+w25PnXwX7EwkC01OuwNvKqYryl3FVTnhtUtiN9HSYEjnH0Y673jH
         clgBZ8c5HiK5UfS3kUTVnlXBMtQG3zd/LA4JvmMHp9QKf/V/1QIbs8LjqDcysLBsgLxs
         IDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772564626; x=1773169426;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99DC7OhlXTRR+D72sFLb9VSn0W5lbhfdlhpUdwYerhc=;
        b=opqvf+RilhytEy1fGCtYKN7NWHuLNHcpTcxqRjXlxMo5sCWkbvqDFWt9YRk5GRAjAo
         R8GD5y4A7YLta74W93noOQL5DAfV7ldtU3EeVHZn9pF45k5Eb/xBTHYsqSPWdS9QWatp
         HYfRvIgEi7U0M+lTLoI2+xn/Gg2g7xvqRfyUGolnE8fk1R48aQNAQF+2nUhsvIHvPqdu
         0yGCxKtmYENX8KyjEJskXgs+/CMzuOevuQkuco+ABZFRdJ+ueUqS/C+tnJOYrEAFh0s3
         qGDeUhCFQgusuTIbtq6KbUKzuhrjWwyKUgSMymtAZ3aU8595LQW48YoXHB7SKLECPqXG
         WZsA==
X-Gm-Message-State: AOJu0YyfyK6TPQrMkiU5UUumnXn5hx/Tq0MmVkQurVkL4i6jsNAjiF8x
	M6p6aCueJJg8WCPQkHU/7JN82lPxMDvIokK458/i33+oJMcjzM/9aNjpTdWkaSWmBaPzB5hqEFF
	TFb+M/g==
X-Received: from plkz9.prod.google.com ([2002:a17:902:7089:b0:2ae:3bca:37a0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f705:b0:2ae:6887:5c2c
 with SMTP id d9443c01a7336-2ae68876411mr2958095ad.50.1772564625724; Tue, 03
 Mar 2026 11:03:45 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  3 Mar 2026 11:03:39 -0800
In-Reply-To: <20260303190339.974325-1-seanjc@google.com>
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
References: <20260303190339.974325-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303190339.974325-3-seanjc@google.com>
Subject: [PATCH 2/2] KVM: PPC: e500: Rip out "struct tlbe_ref"
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 0C12F1F59C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17623-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,m:seanjc@google.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[seanjc@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Complete the ~13 year journey started by commit 47bf379742bf
("kvm/ppc/e500: eliminate tlb_refs"), and actually remove "struct
tlbe_ref".

No functional change intended (verified disassembly of e500_mmu.o and
e500_mmu_host.o is identical before and after).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500.h          |  6 +--
 arch/powerpc/kvm/e500_mmu_host.c | 91 +++++++++++++++-----------------
 2 files changed, 45 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/kvm/e500.h b/arch/powerpc/kvm/e500.h
index f9acf866c709..e4469ad73a2e 100644
--- a/arch/powerpc/kvm/e500.h
+++ b/arch/powerpc/kvm/e500.h
@@ -39,15 +39,11 @@ enum vcpu_ftr {
 /* bits [6-5] MAS2_X1 and MAS2_X0 and [4-0] bits for WIMGE */
 #define E500_TLB_MAS2_ATTR	(0x7f)
 
-struct tlbe_ref {
+struct tlbe_priv {
 	kvm_pfn_t pfn;		/* valid only for TLB0, except briefly */
 	unsigned int flags;	/* E500_TLB_* */
 };
 
-struct tlbe_priv {
-	struct tlbe_ref ref;
-};
-
 #ifdef CONFIG_KVM_E500V2
 struct vcpu_id_table;
 #endif
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 06caf8bbbe2b..37e0d3d9e244 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -189,16 +189,16 @@ void inval_gtlbe_on_host(struct kvmppc_vcpu_e500 *vcpu_e500, int tlbsel,
 {
 	struct kvm_book3e_206_tlb_entry *gtlbe =
 		get_entry(vcpu_e500, tlbsel, esel);
-	struct tlbe_ref *ref = &vcpu_e500->gtlb_priv[tlbsel][esel].ref;
+	struct tlbe_priv *tlbe = &vcpu_e500->gtlb_priv[tlbsel][esel];
 
 	/* Don't bother with unmapped entries */
-	if (!(ref->flags & E500_TLB_VALID)) {
-		WARN(ref->flags & (E500_TLB_BITMAP | E500_TLB_TLB0),
-		     "%s: flags %x\n", __func__, ref->flags);
+	if (!(tlbe->flags & E500_TLB_VALID)) {
+		WARN(tlbe->flags & (E500_TLB_BITMAP | E500_TLB_TLB0),
+		     "%s: flags %x\n", __func__, tlbe->flags);
 		WARN_ON(tlbsel == 1 && vcpu_e500->g2h_tlb1_map[esel]);
 	}
 
-	if (tlbsel == 1 && ref->flags & E500_TLB_BITMAP) {
+	if (tlbsel == 1 && tlbe->flags & E500_TLB_BITMAP) {
 		u64 tmp = vcpu_e500->g2h_tlb1_map[esel];
 		int hw_tlb_indx;
 		unsigned long flags;
@@ -216,28 +216,28 @@ void inval_gtlbe_on_host(struct kvmppc_vcpu_e500 *vcpu_e500, int tlbsel,
 		}
 		mb();
 		vcpu_e500->g2h_tlb1_map[esel] = 0;
-		ref->flags &= ~(E500_TLB_BITMAP | E500_TLB_VALID);
+		tlbe->flags &= ~(E500_TLB_BITMAP | E500_TLB_VALID);
 		local_irq_restore(flags);
 	}
 
-	if (tlbsel == 1 && ref->flags & E500_TLB_TLB0) {
+	if (tlbsel == 1 && tlbe->flags & E500_TLB_TLB0) {
 		/*
 		 * TLB1 entry is backed by 4k pages. This should happen
 		 * rarely and is not worth optimizing. Invalidate everything.
 		 */
 		kvmppc_e500_tlbil_all(vcpu_e500);
-		ref->flags &= ~(E500_TLB_TLB0 | E500_TLB_VALID);
+		tlbe->flags &= ~(E500_TLB_TLB0 | E500_TLB_VALID);
 	}
 
 	/*
 	 * If TLB entry is still valid then it's a TLB0 entry, and thus
 	 * backed by at most one host tlbe per shadow pid
 	 */
-	if (ref->flags & E500_TLB_VALID)
+	if (tlbe->flags & E500_TLB_VALID)
 		kvmppc_e500_tlbil_one(vcpu_e500, gtlbe);
 
 	/* Mark the TLB as not backed by the host anymore */
-	ref->flags = 0;
+	tlbe->flags = 0;
 }
 
 static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
@@ -245,26 +245,26 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
-					 struct kvm_book3e_206_tlb_entry *gtlbe,
-					 kvm_pfn_t pfn, unsigned int wimg,
-					 bool writable)
+static inline void kvmppc_e500_tlbe_setup(struct tlbe_priv *tlbe,
+					  struct kvm_book3e_206_tlb_entry *gtlbe,
+					  kvm_pfn_t pfn, unsigned int wimg,
+					  bool writable)
 {
-	ref->pfn = pfn;
-	ref->flags = E500_TLB_VALID;
+	tlbe->pfn = pfn;
+	tlbe->flags = E500_TLB_VALID;
 	if (writable)
-		ref->flags |= E500_TLB_WRITABLE;
+		tlbe->flags |= E500_TLB_WRITABLE;
 
 	/* Use guest supplied MAS2_G and MAS2_E */
-	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
+	tlbe->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
 }
 
-static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
+static inline void kvmppc_e500_tlbe_release(struct tlbe_priv *tlbe)
 {
-	if (ref->flags & E500_TLB_VALID) {
+	if (tlbe->flags & E500_TLB_VALID) {
 		/* FIXME: don't log bogus pfn for TLB1 */
-		trace_kvm_booke206_ref_release(ref->pfn, ref->flags);
-		ref->flags = 0;
+		trace_kvm_booke206_ref_release(tlbe->pfn, tlbe->flags);
+		tlbe->flags = 0;
 	}
 }
 
@@ -284,11 +284,8 @@ static void clear_tlb_privs(struct kvmppc_vcpu_e500 *vcpu_e500)
 	int i;
 
 	for (tlbsel = 0; tlbsel <= 1; tlbsel++) {
-		for (i = 0; i < vcpu_e500->gtlb_params[tlbsel].entries; i++) {
-			struct tlbe_ref *ref =
-				&vcpu_e500->gtlb_priv[tlbsel][i].ref;
-			kvmppc_e500_ref_release(ref);
-		}
+		for (i = 0; i < vcpu_e500->gtlb_params[tlbsel].entries; i++)
+			kvmppc_e500_tlbe_release(&vcpu_e500->gtlb_priv[tlbsel][i]);
 	}
 }
 
@@ -304,18 +301,18 @@ void kvmppc_core_flush_tlb(struct kvm_vcpu *vcpu)
 static void kvmppc_e500_setup_stlbe(
 	struct kvm_vcpu *vcpu,
 	struct kvm_book3e_206_tlb_entry *gtlbe,
-	int tsize, struct tlbe_ref *ref, u64 gvaddr,
+	int tsize, struct tlbe_priv *tlbe, u64 gvaddr,
 	struct kvm_book3e_206_tlb_entry *stlbe)
 {
-	kvm_pfn_t pfn = ref->pfn;
+	kvm_pfn_t pfn = tlbe->pfn;
 	u32 pr = vcpu->arch.shared->msr & MSR_PR;
-	bool writable = !!(ref->flags & E500_TLB_WRITABLE);
+	bool writable = !!(tlbe->flags & E500_TLB_WRITABLE);
 
-	BUG_ON(!(ref->flags & E500_TLB_VALID));
+	BUG_ON(!(tlbe->flags & E500_TLB_VALID));
 
 	/* Force IPROT=0 for all guest mappings. */
 	stlbe->mas1 = MAS1_TSIZE(tsize) | get_tlb_sts(gtlbe) | MAS1_VALID;
-	stlbe->mas2 = (gvaddr & MAS2_EPN) | (ref->flags & E500_TLB_MAS2_ATTR);
+	stlbe->mas2 = (gvaddr & MAS2_EPN) | (tlbe->flags & E500_TLB_MAS2_ATTR);
 	stlbe->mas7_3 = ((u64)pfn << PAGE_SHIFT) |
 			e500_shadow_mas3_attrib(gtlbe->mas7_3, writable, pr);
 }
@@ -323,7 +320,7 @@ static void kvmppc_e500_setup_stlbe(
 static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	u64 gvaddr, gfn_t gfn, struct kvm_book3e_206_tlb_entry *gtlbe,
 	int tlbsel, struct kvm_book3e_206_tlb_entry *stlbe,
-	struct tlbe_ref *ref)
+	struct tlbe_priv *tlbe)
 {
 	struct kvm_memory_slot *slot;
 	unsigned int psize;
@@ -455,9 +452,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, writable);
+	kvmppc_e500_tlbe_setup(tlbe, gtlbe, pfn, wimg, writable);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
-				ref, gvaddr, stlbe);
+				tlbe, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
 
 	/* Clear i-cache for new pages */
@@ -474,17 +471,17 @@ static int kvmppc_e500_tlb0_map(struct kvmppc_vcpu_e500 *vcpu_e500, int esel,
 				struct kvm_book3e_206_tlb_entry *stlbe)
 {
 	struct kvm_book3e_206_tlb_entry *gtlbe;
-	struct tlbe_ref *ref;
+	struct tlbe_priv *tlbe;
 	int stlbsel = 0;
 	int sesel = 0;
 	int r;
 
 	gtlbe = get_entry(vcpu_e500, 0, esel);
-	ref = &vcpu_e500->gtlb_priv[0][esel].ref;
+	tlbe = &vcpu_e500->gtlb_priv[0][esel];
 
 	r = kvmppc_e500_shadow_map(vcpu_e500, get_tlb_eaddr(gtlbe),
 			get_tlb_raddr(gtlbe) >> PAGE_SHIFT,
-			gtlbe, 0, stlbe, ref);
+			gtlbe, 0, stlbe, tlbe);
 	if (r)
 		return r;
 
@@ -494,7 +491,7 @@ static int kvmppc_e500_tlb0_map(struct kvmppc_vcpu_e500 *vcpu_e500, int esel,
 }
 
 static int kvmppc_e500_tlb1_map_tlb1(struct kvmppc_vcpu_e500 *vcpu_e500,
-				     struct tlbe_ref *ref,
+				     struct tlbe_priv *tlbe,
 				     int esel)
 {
 	unsigned int sesel = vcpu_e500->host_tlb1_nv++;
@@ -507,10 +504,10 @@ static int kvmppc_e500_tlb1_map_tlb1(struct kvmppc_vcpu_e500 *vcpu_e500,
 		vcpu_e500->g2h_tlb1_map[idx] &= ~(1ULL << sesel);
 	}
 
-	vcpu_e500->gtlb_priv[1][esel].ref.flags |= E500_TLB_BITMAP;
+	vcpu_e500->gtlb_priv[1][esel].flags |= E500_TLB_BITMAP;
 	vcpu_e500->g2h_tlb1_map[esel] |= (u64)1 << sesel;
 	vcpu_e500->h2g_tlb1_rmap[sesel] = esel + 1;
-	WARN_ON(!(ref->flags & E500_TLB_VALID));
+	WARN_ON(!(tlbe->flags & E500_TLB_VALID));
 
 	return sesel;
 }
@@ -522,24 +519,24 @@ static int kvmppc_e500_tlb1_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		u64 gvaddr, gfn_t gfn, struct kvm_book3e_206_tlb_entry *gtlbe,
 		struct kvm_book3e_206_tlb_entry *stlbe, int esel)
 {
-	struct tlbe_ref *ref = &vcpu_e500->gtlb_priv[1][esel].ref;
+	struct tlbe_priv *tlbe = &vcpu_e500->gtlb_priv[1][esel];
 	int sesel;
 	int r;
 
 	r = kvmppc_e500_shadow_map(vcpu_e500, gvaddr, gfn, gtlbe, 1, stlbe,
-				   ref);
+				   tlbe);
 	if (r)
 		return r;
 
 	/* Use TLB0 when we can only map a page with 4k */
 	if (get_tlb_tsize(stlbe) == BOOK3E_PAGESZ_4K) {
-		vcpu_e500->gtlb_priv[1][esel].ref.flags |= E500_TLB_TLB0;
+		vcpu_e500->gtlb_priv[1][esel].flags |= E500_TLB_TLB0;
 		write_stlbe(vcpu_e500, gtlbe, stlbe, 0, 0);
 		return 0;
 	}
 
 	/* Otherwise map into TLB1 */
-	sesel = kvmppc_e500_tlb1_map_tlb1(vcpu_e500, ref, esel);
+	sesel = kvmppc_e500_tlb1_map_tlb1(vcpu_e500, tlbe, esel);
 	write_stlbe(vcpu_e500, gtlbe, stlbe, 1, sesel);
 
 	return 0;
@@ -561,11 +558,11 @@ void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 eaddr, gpa_t gpaddr,
 		priv = &vcpu_e500->gtlb_priv[tlbsel][esel];
 
 		/* Triggers after clear_tlb_privs or on initial mapping */
-		if (!(priv->ref.flags & E500_TLB_VALID)) {
+		if (!(priv->flags & E500_TLB_VALID)) {
 			kvmppc_e500_tlb0_map(vcpu_e500, esel, &stlbe);
 		} else {
 			kvmppc_e500_setup_stlbe(vcpu, gtlbe, BOOK3E_PAGESZ_4K,
-						&priv->ref, eaddr, &stlbe);
+						priv, eaddr, &stlbe);
 			write_stlbe(vcpu_e500, gtlbe, &stlbe, 0, 0);
 		}
 		break;
-- 
2.53.0.473.g4a7958ca14-goog


