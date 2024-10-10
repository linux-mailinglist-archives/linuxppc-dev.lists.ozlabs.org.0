Return-Path: <linuxppc-dev+bounces-2056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9ED999073
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:32:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXF1xhDz3cRF;
	Fri, 11 Oct 2024 05:27:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584845;
	cv=none; b=dN9J+L1HdkFsP3qTBi3dVAO25DwKvGwYGLkZ6Jra70gOqwycxJC6qKcMuGpmJLWXEsrD0tyf8XVV838N6x2P6baBARqXtitEuwdNPzCD0zShNA0/BbWXfnJMOm2rqnuy3U1oBD92iU/OgtG4xbP6aduKtbw5ts/Jo3hi6LllY5lxjqZLELykbBJ0u3MkNAWLnSjGc8tz3gj7wYpqLP4T5jAx5c8cYivE9uykh5CJhw6oS9Lv8SXqYNNkDAJ0O4A8B8dhFbypuPDbuKVlAEhc6adiAh8AmNg81xQb62ruDDrBkma/KyH9dhgpTNveP0Ms/go4yMuARt1Ky3Ca+fVQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584845; c=relaxed/relaxed;
	bh=OZ/c8QPJoSxQXGCWT5aWp1nMy1t7EEzE7+N8fqq+BFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LQksYxEQjy5FXld3eWI9zJ87ISLZkJq5W7GcJCd8dSewarGLjNvRsk/JL0H+hEsfXWP299zpWgr3yw7OCYS00uX22yXwQNSQWKDOmmf+aKpZM6gU6FMPwc389vyrNAm+0l2DVjkCYu7HQdJI2kW5NuhA4sWT8Sl1LW10oye0gGCfG18WCNsuEUib8wQ77wjF7yPhdikUGQapXRW1SwuPkMVyGpO1v4LZmkk7139o+79dReC56XuXE4wxFjUfFRWQmjv+JZdFmEZInDbo0/N00yvQ+QuVjexy45U4xYk8CTxmvO3/ozItLCUEYDR4B2F8ppoBGYkvWD6Y0Z6QGFFQdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gVcc18K1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ihwizwykdcmrd9mibfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gVcc18K1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3ihwizwykdcmrd9mibfnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXD26Tfz3cSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:24 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2906efc0eeso1521931276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584842; x=1729189642; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ/c8QPJoSxQXGCWT5aWp1nMy1t7EEzE7+N8fqq+BFY=;
        b=gVcc18K1666r/p2mKYJAGEpqOEGSUaFPkOBaTBZHtffG00eARXyKfhO9k9KUC1zA8E
         h34n1oO0aJ38eQqN/5b9R92x40FB4ZJlbkciVbVCZyiHCD58CjfcvbJgmn8R2aKgt2KV
         7WiI43tfs7IN+XGIXADAVBeMoC9fVDLM4qMcYB8yyvXHSNN5Pj1m9oQJvpwB7SeISdXp
         jtKA8Ui23/ORJsnRs4l7mXNdHqyW3vJUQAamus28ef5FpklOeIcndjgVLQsu24BdfgCr
         O3UhM8fUnaqNGYyzfNGnXPknyJwOd9F01eWGyHl+i/TXjGseOJDw97n8pqVT3U/5kLQv
         gpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584842; x=1729189642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ/c8QPJoSxQXGCWT5aWp1nMy1t7EEzE7+N8fqq+BFY=;
        b=BTOiOBhEm6VbuS2spsxg5KtgU2uU4QuW5LqNNY/DbgC+MdY5fs1Nnv36bQhI0wqRvy
         ReAVO/nJkjbJXDsaQljbRgqsSMzN6yWlGkpQEHUAzzkk5GYBVKZa7tokdoZp/VEOfE4l
         dsxsnmSVlNhTFDojLWkcxyCQfheIxK+MwgFSK7Y7xK+M2FnFNm6CenkEZRfIerUBVsb/
         L5r5k6rOqrNCj374xRNNzyOGcZBJJOJsSd9Eca0OiGJcnMKLi/uZDLw7xbnR5njfCwYI
         InECf7CjM/483QNzxxqPuvPIQYlMFiwUidRMxQ6ABYyeBsm28iSxAwV2JOq1ivtFLVka
         tV7A==
X-Forwarded-Encrypted: i=1; AJvYcCWmO1lawFjih8EO/ZgrZ86zPHBTOSjgaKfq9BgJefHBxpVp4w68TnUb04XapUnUZpD8liiDoJGCmqmgsn8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzz2RNlqEr4nze9DG3/rGL3/plg7JPdpbF4pSmejDnRS31xW6lb
	RkxZtYJeu292ytkHQaZvr8GSCL3lmCHWAVZ2JwePLAv27Aouw0w+pGHM3NCnOeqm87/LlmDfku+
	oWQ==
X-Google-Smtp-Source: AGHT+IHhD+Vk6TwFIS5v8fA24SNPRWU4vCcQM+1g+zVw6L+6pfrMpIdoNti+PehtHCeQDGmk8Jps/9lQ5Ek=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:d30a:0:b0:e28:fe07:9cc1 with SMTP id
 3f1490d57ef6-e28fe4a3a81mr68085276.3.1728584842321; Thu, 10 Oct 2024 11:27:22
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:13 -0700
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
Message-ID: <20241010182427.1434605-72-seanjc@google.com>
Subject: [PATCH v13 71/85] KVM: MIPS: Mark "struct page" pfns accessed prior
 to dropping mmu_lock
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
so that MIPS can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index f1e4b618ec6d..69463ab24d97 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -634,10 +634,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-
-	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
-	kvm_set_pfn_accessed(pfn);
+
+	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.47.0.rc1.288.g06298d1525-goog


