Return-Path: <linuxppc-dev+bounces-2040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E1999050
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWc44D5z3cNP;
	Fri, 11 Oct 2024 05:26:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584812;
	cv=none; b=SYpws92QSgidBfmRQakR5LzYBSEjDcyrfzbDBht6EzXMyGT7b4LP7UjMFwUVuEh1AhQjlVKrp8noJCSjZVD0OG4gFgZgKPsdoE9+P+Vci77Wv9FJ5OdjxLurPHbU8Yf15djB6Sj+m6m0K1eCwcfcwIC8uocSL9yGNjuakz2BpaeWY4Ssp3wwZclAyJbTOMXsjxOnQzRF8kOUUdsuay800g2KxR6J+NeSRjAE4ErBn+7VCYW3qX57QRg7fxitmTOavt5BaBwogX46YeAf4UdGiGpmUQYUqBvMEbllzy/W90RAGMPpMTXJ8inVEVpoKeJgoXzmHv5YHYUDTJUOt2ZiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584812; c=relaxed/relaxed;
	bh=K6YUqJX41UvLftiTjNafBx3/10X+6KBTIzQjXduU2xw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V/grwSdh//CqKyA+rjdgtsUMMX7z8N0VT4NIxT1hNo9OUi3OczYBGhyiDxiodUT04HgnjS1blwXvbJtwA1fTMbCLAZwzHHG4u7fiuVAipH2hG//uVmBOAl1iTzHpzjfUNk98/tAWOtVnPmwqyfLn5QSQUmWhOoxpkPMsVnrcWWu79P3h96lYRpWXz0WjqvY9tC/cn+GBYnBEF+iatOSvsRUINvO4+mvODRAIpGTc0Xf44Yjuj8oW60hpmB6hfPy2h8k9Hu6BkngfLkIQ9TDOlR748okmHAEsqtPZjW58p02k8LDBsC1BspehrSC31wIgXJbd2TwcoeSlc5i4MdFjdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TiKI0tMv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3arwizwykdaiugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TiKI0tMv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3arwizwykdaiugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWb4sPpz3cN4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:51 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e019ab268so1589447b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584810; x=1729189610; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=K6YUqJX41UvLftiTjNafBx3/10X+6KBTIzQjXduU2xw=;
        b=TiKI0tMv9/ocx7tTQtEe5NneIU6lOim7h0mKpPCy/09L3g5wsXEL/o3O4krHXDF49g
         NVN25CNqkQ5ZSO85A5yiFD571EPCMFBKK63m6EjCzu/+2k39WCHKrTnu1q9wOsUnkhlV
         CX/paI7dYrxbA4Yt0ZwfmBda9RaAVAQwkwbP5yUcrY0mD5+ulvq/zsOrRPh0bkm78Q9t
         fruztVKXP5F5V1cuvdMFAmGVye1rKsDpVtK1uy3kSwm9Cv0qEK9lOa138/3X2i2ZfCkQ
         N3mBxLRdQlHAAO+94/8Eztu8YTZ8LPdIU2ShM2tpVA+WxV2YvNJ6B7NAsi0TP9Adk+h/
         biUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584810; x=1729189610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6YUqJX41UvLftiTjNafBx3/10X+6KBTIzQjXduU2xw=;
        b=ssN75Bd5XJWRF2Cjfft9f7Uj9L8qAdIM1nlu+KhtQmD7/kUxxWL9Jjs7cJTh5c0fSK
         vj7AAcap4UNJTjrwrCw+U416snBZvpc9h78spk71XuHRJfrDVToB00azahS9JzUzW8h6
         RDEk4ITTM/XOT1pVOgN5ENi1u/x7Ib82YXz3buiE55nMc7zbHTxalfDPhyWHjUO0TwGW
         paLTL0poBxG9uwJp7NMGt3J/0qyUbeB9K66aHcCsW5xq6oImGcR5+9YJ691eKlPQ+Puw
         QsqJ2NOAByEAsXojjPGCmqfy7lCb8N91e5DMIBFit/+YXBS3GUSeU1GnVG1djkf2xuMe
         dahw==
X-Forwarded-Encrypted: i=1; AJvYcCVK4M7rQnYNp+aMj4BLVzcjaO6S6yhyt3rS/3ek11QwdPHf4o4riMP47CkFrqEFfGrNAtyfgKDvZ68sRUk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxjp+mouviTQrwpex2h12GMcqDrE0TUFBGj5Th61rdxfgRWWV4K
	f0hvA4ub2ft95PioLB4KXTfaWKcpWLGlTDLtIxpOPPLUgZa95i6avh0q9zoNO/L17ANd8KY1hlO
	VCw==
X-Google-Smtp-Source: AGHT+IEO1ECBC98fGvB+GRqYHAQaBdxJcqvY9DmP3QI4gZm0KdOyij1fLmFl0bPXgfvra8JJdQe8JNFxBHM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:9199:b0:71e:1e8:e337 with SMTP id
 d2e1a72fcca58-71e1dbe467fmr8496b3a.4.1728584809106; Thu, 10 Oct 2024 11:26:49
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:57 -0700
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
Message-ID: <20241010182427.1434605-56-seanjc@google.com>
Subject: [PATCH v13 55/85] KVM: arm64: Mark "struct page" pfns accessed/dirty
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
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RISK_FREE,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

While scary sounding, practically speaking the worst case scenario is that
KVM would trigger this WARN in filemap_unaccount_folio():

        /*
         * At this point folio must be either written or cleaned by
         * truncate.  Dirty folio here signals a bug and loss of
         * unwritten data - on ordinary filesystems.
         *
         * But it's harmless on in-memory filesystems like tmpfs; and can
         * occur when a driver which did get_user_pages() sets page dirty
         * before putting it, while the inode is being finally evicted.
         *
         * Below fixes dirty accounting after removing the folio entirely
         * but leaves the dirty flag set: it has no effect for truncated
         * folio and anyway will be cleared before returning folio to
         * buddy allocator.
         */
        if (WARN_ON_ONCE(folio_test_dirty(folio) &&
                         mapping_can_writeback(mapping)))
                folio_account_cleaned(folio, inode_to_wb(mapping->host));

KVM won't actually write memory because the stage-2 mappings are protected
by the mmu_notifier, i.e. there is no risk of loss of data, even if the
VM were backed by memory that needs writeback.

See the link below for additional details.

This will also allow converting arm64 to kvm_release_faultin_page(), which
requires that mmu_lock be held (for the aforementioned reason).

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index dd221587fcca..ecc6c2b56c43 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1692,15 +1692,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	}
 
 out_unlock:
+	if (writable && !ret)
+		kvm_release_pfn_dirty(pfn);
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
2.47.0.rc1.288.g06298d1525-goog


