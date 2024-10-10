Return-Path: <linuxppc-dev+bounces-2043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBB999057
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWl1bG2z3cPK;
	Fri, 11 Oct 2024 05:26:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584819;
	cv=none; b=WNKkN2vGd22XWL1P/HYpC0BqaReWYh3104v5MziI3q9lqGiQkqsiuYiLTtBD35SayTBQ4R5PoKoFf2k9nqnrKL6hDl8N7sbnQuB2dlop9C4mH+o16a2eHlMOziPFYYUUEkqsPj/5V4/Ysy0jiFQ4GM7GTFxckIzfaXDwu7q3aNKStLmUtvfM4d1O9xof5+a1fc2ejAjYo4lWLbsHHwCXWLO9bkdvhDu2rSBXmLq2GzIEcMkW1wRJ7oEAd/zN1MLbRweBL+yBNMPMAfrlsSmZnLqajMtXEbgIhKi7ajFhTwh6TjPE3p13zcHZqx4LYInLtEjUJ9b8ILhxzPyG0ILGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584819; c=relaxed/relaxed;
	bh=h7pIaRprT8i6iodquNsVL5vPZSNT9KsZLdIQsfz/EL8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SR2bfd9fPmiizqdDLQpj1OMmPxbN0NTP61W09gONTVisU7dZXZ5k4zJ34bCGmDJFh+mlJbabLNDcKrcgmHQ773S/lQ3O7WbjROlGfOLAMNhVVBgilysIyaseK+wRwB3+mggAqbiU2+BJ8kZjvbqHOtn40RCochogoA/n85nri+tI/tquaDLiNIvejYN3TGYRh2TySP3NAvTSdrpLp6HhDOEYQaEnvVt5u8AChvBc0eB7o9COxAo5YM8UiX3Q7b6EozwmCZkIh4sMa0S+Q3yp7zUo25vFFoPKZ7A4V2rYyMOZZw+5CyS+FHAlvlReHXvpiLFXGoncvJC5INooZpyjCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x29yGpU3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cbwizwykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x29yGpU3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cbwizwykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWk1ZMHz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:58 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28eea1074dso1984129276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584816; x=1729189616; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h7pIaRprT8i6iodquNsVL5vPZSNT9KsZLdIQsfz/EL8=;
        b=x29yGpU3WndXRab5XBJyMdsbKKiiaYvwKkK0CGRVVPJsHi/2HX1f84q/fFXDMsr9Id
         Dphy3zqnCdDBHDtHlh/2HaJA1QVVcWbrZvSHOO65JpIux/mqU6j++rkOmHNg5GVKKB9n
         NHAyWssj+83sSRFxKvbkVjF/TGckOMnZiP+Kf9wpnRrSSjh4C4ZE779TLulop+aaaaYm
         1VpOb6xi7OywOGg9vskU15Jth1wvb3+I0YQaoPWKHYdXdNqkYh989R4LCoT5kdTdbeJK
         Ydzdmf8bEzYI7Czjjb4MAKJ/ZZFuIXh7jAL9lSuyrm1vkwcXShRSJupflaDRRnK2FKtM
         aMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584816; x=1729189616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7pIaRprT8i6iodquNsVL5vPZSNT9KsZLdIQsfz/EL8=;
        b=oo5N4auGugjqNDc58Jr9soMZ+bsIldtFoZBn4r7sJLRR5qU7ZsuBu2kzkoahCDRd3u
         4oyzugPL0/+hCJYThvn/6AKwn7NGIcPBWIknCDd45CG9RfamucIeCQ7Ob6jxhC5/f8YD
         nZl7sKiyZQuKj1ZSFpJdRkkpU9B0XXRmBMh0X3v/RspPX1X+ZvMfe8340j0V9Jq/vwDc
         wLOekvBI4ocTxscrYObJlMAswsSWILyL7XMfD061c61Jf9UStwzSb3OCXBS3ezBItRDJ
         uuvlGkR3kDn7TQ6ShJcNQolPf6Fs8N560bgAK9hJdiVifOxSA8p799duAZM1uH0k9fCt
         OjYg==
X-Forwarded-Encrypted: i=1; AJvYcCXTT9ozdYb/Rq/4ewzsU7pGNImiDxhL0/RgSEbVZVJxLVKAU9RFvtnTNN8iQ2UL7g+0BQ+cphIOo8pXhH4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yya3vsV/tv4Cpipc6ogpWaEHVinmzBjGdvWPYunzaGThoOy8yKA
	5Zk07ZcjJxQGeiSO/Fl5WKFl9pVBEFgPynARTEX7UnRcMnXOTNXVZIhAF/vE+JIKBZIgkEwtk8L
	DJw==
X-Google-Smtp-Source: AGHT+IER2ThMFqRrPlrH2YqE2Mm6yZZ3YtFM0VnOojG5BgkcM2HHrRnMjpl0ZvMfhTqewlD6nF2BR0rNKwA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:c45:0:b0:e0b:f69b:da30 with SMTP id
 3f1490d57ef6-e28fe41d0e6mr89144276.9.1728584816073; Thu, 10 Oct 2024 11:26:56
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:00 -0700
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
Message-ID: <20241010182427.1434605-59-seanjc@google.com>
Subject: [PATCH v13 58/85] KVM: RISC-V: Mark "struct page" pfns accessed
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that RISC-V can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.  Marking pages accessed
outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
outside of mmu_lock can make filesystems unhappy (see the link below).
Do both under mmu_lock to minimize the chances of doing the wrong thing in
the future.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 06aa5a0d056d..2e9aee518142 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -682,11 +682,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 out_unlock:
 	if ((!ret || ret == -EEXIST) && writable)
-		kvm_set_pfn_dirty(hfn);
+		kvm_release_pfn_dirty(hfn);
+	else
+		kvm_release_pfn_clean(hfn);
 
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(hfn);
-	kvm_release_pfn_clean(hfn);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog


