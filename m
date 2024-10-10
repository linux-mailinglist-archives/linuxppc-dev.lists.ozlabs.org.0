Return-Path: <linuxppc-dev+bounces-2048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F231A999061
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWw2Mtsz3cQm;
	Fri, 11 Oct 2024 05:27:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584828;
	cv=none; b=Xx5pwfzRkyn8HCtHxZ8b3Hk4bKdizRaBQFHvr7UB0ZisCPg31fIEGrDbbESKUwe31F8vDkmUISo1pf1B5GKyQ3hWZaM0Nvnmst9G+4mX9GXdjzrOfMs4d+LkK/u890uVX4FYLV3R1bJvZZzy8OCKNhKGCv50vKgFnZcO4ay8Cf61j3FdFS60wYK1jLakbaEXg2Nt49SgRPpK+ElaCu6OL+BOHRmFvaOoMjwxqTuSDrc5RfK9LIekLTaMpig4aLcVJ1fBHjwILMudcwJq7ag/AElGztRWdYyNz/DR7f6Iv4O5uQdHeExjs76ORRs+H9LXUWGA/UqZBbfush3Ku+6R3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584828; c=relaxed/relaxed;
	bh=I+2gp5vLlKRJWMtv7YF+IvP9h9YjJXEpCIK4AMigCis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RujYAXwff03cFGCefsbrK9J9tLCf/C1jtltaNOrXLBPwPQeE2vZ9ZNF8s5qHi5u0rjcbIApMaYEZM4jor8upgSQ7OsK3Tr5BlHRV/4hsFAMCSyTzvWeSk7Le/U/DLnwOJgUoeicpgCCGcjNdFKQiN/7Ci1aDQBvybgB2NCivvQBOWs32+bUnemJ9aTeEz4U0qXcxePKkk+YiMoYM09JZrlqcamJpP1GVJoW0PqKfQ3k6fPC7rgyyYf6Pcg3Vyi+KGFATEVdUcxYlp2RxxR7aPLw7lpxekZCmho2ZQzecHRpAC3N0TxWxATA3wzp0ieD01FKDqctGu4Imc8HeEH0f/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=31NX/W+m; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3erwizwykdbiaws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=31NX/W+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3erwizwykdbiaws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWv32HRz3cPW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:07 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7e6af43d0c5so1109389a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584826; x=1729189626; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I+2gp5vLlKRJWMtv7YF+IvP9h9YjJXEpCIK4AMigCis=;
        b=31NX/W+mpaG/8XpZkX7jWdct0sL6DpudYh751h5T3Zyyd36scAptAWOd5jfVTf1+fy
         /ntS6rsjfLeBDJpRNy71RO0CY0TqCNJRTNgPMh4iB51ip/ZKjRL8SFaDqbBSNBpKvJ01
         uE7mllQJp11hPDYp7QM6sNNXSt/LwTvlyrH/STdNHwjH/pMCl8P5ROn+FotUl+9ngetU
         3RVmBG40K8XsZSvz+R++yhuWGuvTBHUu1PY89IUlJqFVACXkgHxgq+H10OuPOtSEB7I1
         DH838fqZcqRBZJuzItPhO5m1xjPzfEZODLRytloyuKG/NSr7sJnorswDJnmzXTAL4kqg
         BNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584826; x=1729189626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+2gp5vLlKRJWMtv7YF+IvP9h9YjJXEpCIK4AMigCis=;
        b=StgqF55iw7XqqRM8V+YdQrmW3lPEFoMiVE56EkvXJKKJFtcwmFPfyjEcvBOeS7Nr1+
         uJEMZBqVHnCJGhu+pnqgWPZg0luGHMXVlC+r9+/UKpcvhNdm5+HYGk2fbarB4px4AK9y
         OrH7khNLl0WQuehuAs8x60JFG5EjELSPf8JpUT8CvIoRR4HFA2ckpRCmB3LNPJB+E3NE
         ueGpc+IQJFSluNop9ViLHf6AZbIVkJB2Y5qHev3u5YtaYmbDme5li99OjFzJNXRY+HuR
         QAe1lLxajGRsO4+vN3lv9BQJBQo030nIBwvjw0zQ4LLxlR3cyXegpu+S7+lLNZW+24xb
         EPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRQUJffTd6AAq3a6zGTcxLI8GwuNB2XcbCCiY0DIdjGtovjtO9yPhdBzBCtCrdebrDuKYv7rSgtKODdns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwZ0OOUy/WW66YbyFFt9hChPRr/zh8GXGr585etwzgoDaJSOZvf
	C3lEz44PTNPmXNsrFT6MdEnI9Ixlqge4b+440wRKIkikECn7S+2rn/A/szEv4D98SQ4L8tywVci
	W7Q==
X-Google-Smtp-Source: AGHT+IEBzxfSdV5URAWtipQSxApJSdWqJAcjcFibIBQs32g4G2eVPMYjVJgo5zFwBPuTEySHq4oumcdrCOE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:e546:0:b0:684:6543:719 with SMTP id
 41be03b00d2f7-7ea535307afmr40a12.4.1728584825522; Thu, 10 Oct 2024 11:27:05
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:05 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-64-seanjc@google.com>
Subject: [PATCH v13 63/85] KVM: PPC: Book3S: Mark "struct page" pfns
 dirty/accessed after installing PTE
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mark pages/folios dirty/accessed after installing a PTE, and more
specifically after acquiring mmu_lock and checking for an mmu_notifier
invalidation.  Marking a page/folio dirty after it has been written back
can make some filesystems unhappy (backing KVM guests will such filesystem
files is uncommon, and the race is minuscule, hence the lack of complaints).
See the link below for details.

This will also allow converting Book3S to kvm_release_faultin_page(),
which requires that mmu_lock be held (for the aforementioned reason).

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index bc6a381b5346..d0e4f7bbdc3d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -121,13 +121,10 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	vpn = hpt_vpn(orig_pte->eaddr, map->host_vsid, MMU_SEGSIZE_256M);
 
-	kvm_set_pfn_accessed(pfn);
 	if (!orig_pte->may_write || !writable)
 		rflags |= PP_RXRX;
-	else {
+	else
 		mark_page_dirty(vcpu->kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
-	}
 
 	if (!orig_pte->may_execute)
 		rflags |= HPTE_R_N;
@@ -202,8 +199,11 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	}
 
 out_unlock:
+	if (!orig_pte->may_write || !writable)
+		kvm_release_pfn_clean(pfn);
+	else
+		kvm_release_pfn_dirty(pfn);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_release_pfn_clean(pfn);
 	if (cpte)
 		kvmppc_mmu_hpte_cache_free(cpte);
 
-- 
2.47.0.rc1.288.g06298d1525-goog


