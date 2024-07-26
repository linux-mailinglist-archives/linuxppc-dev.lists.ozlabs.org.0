Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894793DC94
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:30:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tAGgzHhl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5BM1zPGz3dVS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:30:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tAGgzHhl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3ndekzgykdg8frnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Nk5798z3dng
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:30 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70eab26e146so1297582b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038069; x=1722642869; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp8vWxWuEfoTun4nd23rTIy8nVqGGlQS/g8lo8vNdQg=;
        b=tAGgzHhlzw8dvRdXFIHBottpmHJcFxazsnv4xieWubvgJ3CUemipwClFxoa1IS8q5k
         R7bRR6anHrQG4kf7chTQ3OLnXRilYuZ1KiKStXhVc7shqVzb+QlfDkQ519oAWSRejnOI
         R6wEXo3iIgJJ6WqPn+3sGwdwLQ1/hvLHu3n2LMQ87nd3Tl2GS+O2jvHn3HmCp0blfZpS
         m9BoK4s4+bPZWxNI+WhEM11aChUFTHEUgmS8Va2+FDBSsePP7v1dPxdXKl85Qy85RLXy
         L01WsBYIo/43Is8LO8wGgjMS5wxVfipwOMEaHwviEvIfS9MPCTxpSzVSeeDQC7ghq6KA
         et3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038069; x=1722642869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tp8vWxWuEfoTun4nd23rTIy8nVqGGlQS/g8lo8vNdQg=;
        b=gGm0ooW/6xiYmiZ4ucW9z2A4saPTjq7yI1l+EX1KnrrfMHC2SVVDK2jAIrOoZH76EP
         1eVZm9LQ12dyXf1Dcum9dq5pdaUe/PRfDdrxySuCGrjc3fXolTEv7w53e96zY8zeeXmf
         gU+EKFIy3nDpIARBWjV784z0ArrnA5bbVAgoUyPEjN1qHSxH1iBOlXvKipQPPT3QlG9c
         X/4pNyhR2D8HueGclSFotL0gLQMCVpToC7ZIsESWJfAUcPvXwc63GXqEmR7YQNdUy/56
         mvTRkrjxfM+qSBKsyPqn5uUXn0nKR6ixy/YtOK7jpXloulHHEbKe+yLXLF/KG6FPOTNL
         2qSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX62LrWLyOJ1QCQO+fBqPRknXnlFNM46mEWw9RJ0Pxt6Ff1MQRU5JgiumNDyM1v3dWDCRBoaj6rr6qQVdEEaT2WlSzGn4GOyROetgdfig==
X-Gm-Message-State: AOJu0YxvMoXwzGW971FvxXKQlFrvoodGkIEYfQseJCbE4XxRi6ivxfDE
	INv4cC+Tv84QNY1qDMWsnOJpGfGUljp4rFthTwqEUcWSQ1Aa329GjszvchbT5X0NmQDxy6cRNu1
	JuQ==
X-Google-Smtp-Source: AGHT+IGdEcu09Hin88e0jkC1IJzP1gp2m8bzTdpaUdhQIiML2lxsNf415Y84GaeMaBcBrlwhHWl3MjBIRUQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f1c:b0:706:71b3:d7cf with SMTP id
 d2e1a72fcca58-70ece926b55mr9310b3a.0.1722038068878; Fri, 26 Jul 2024 16:54:28
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:03 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-55-seanjc@google.com>
Subject: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns accessed/dirty
 before dropping mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).  See the link below
for details.

This will also allow converting arm64 to kvm_release_faultin_page(), which
requires that mmu_lock be held (for the aforementioned reason).

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 22ee37360c4e..ce13c3d884d5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	}
 
 out_unlock:
+	if (writable && !ret)
+		kvm_set_pfn_dirty(pfn);
+	else
+		kvm_release_pfn_clean(pfn);
+
 	read_unlock(&kvm->mmu_lock);
 
 	/* Mark the page dirty only if the fault is handled successfully */
-	if (writable && !ret) {
-		kvm_set_pfn_dirty(pfn);
+	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
-	}
 
-	kvm_release_pfn_clean(pfn);
 	return ret != -EAGAIN ? ret : 0;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

