Return-Path: <linuxppc-dev+bounces-1999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338E998FF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTw4Sgdz3bsM;
	Fri, 11 Oct 2024 05:25:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584724;
	cv=none; b=SB8sFcgwRy78E9d36Jb2K8YsIqvKW3rIx1fSBApFlj1eXwNs3/u95H/4UZ6bAEd62vg1AoqUWvXwo0JwQv4a0PJJXdtrz2f6F6FVRNRTq1qXgPlbTcNTFC2fsX0Gji4NqFeh7ySE8zNhjKcNEKNQvBaxBRtpkTjDuAWqm+vK4I1thdnzPJpAuVnnu22Vfkmt5U3ETZU1AZMK6+sVzAlzrlv92Y16S0u/tU2HE90bTTI5R9PUAHoPtySuT9+/+eLr/a72YygHJWXfhNdNcnguoPbNHPzuFHHbVAp+Gd6ioHd7NqH8p1DwqOOfFNpgf0H3dxtDbnmZ7GmNe1ZNvYSkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584724; c=relaxed/relaxed;
	bh=RdgAxVyxp31c7WibHLiyIF43paER00mxZOAIHhsdwhk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pj11e3nOjQ31jJ310igIwoXTzcgRsvJ/SLaLj/BVVfv87qQIxqNJfKXHUhhLzDasCdm2/FfgHD07jVCN5lS27iHmOzMp9JrXSf3QqYeRUoPVi/8ijakS7/FKORykArGj7OHWXsMpuN+MenoYf7u/d4sLfQqpvp80FQsAZGxSXZ+vlVvPF5qBKP1G0WVvxzmYepkYIbrY7+rEX4wWEdNhQKnXNxKGMPudkHoK7oL+uOInF4b+AbRQuYeppJ+0Fy54c7voY9xs3gI7MwuJV8t9rWqhWlPtZA8OtaV/h8iFl9+vMcv1O+LALHX7rx6Qz9SJG2PIphT4GCZQh9/nXXNA9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LkUY/3bT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3ebwizwykdkczlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LkUY/3bT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3ebwizwykdkczlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTv5CgXz3brt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:23 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2ca4fb175so1247621a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584722; x=1729189522; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RdgAxVyxp31c7WibHLiyIF43paER00mxZOAIHhsdwhk=;
        b=LkUY/3bT5HRDHdt+pKocciMPTDAFMSJQQ8e5Or5aHB4QASp4tfeSgbF790ebtc3acZ
         xO7jpQf7XPB7ov8c6RQjM0/4kMwiRfvcsLJMrX3OOz++5btVbiwVch4mUwzm/H5jYmKo
         AtSVQzDb9WDbmZPmQfNjsZPQHXjsbkqM3WsmL7MDsoZfQ9PCnBkVbng8D9og9u23oGAg
         UdqJP3jieGs6GRNHBAzyafjdz9PRZCCwL0AVQswLnUJREiFyJsv8cS7+D/wFXaKdIPYB
         dZZojtS2Nes1Bbecede5tNyOMvgb/BJECtXhVY51mbFjjmgZbUZieHyY2DnN1/IexbIu
         kBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584722; x=1729189522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdgAxVyxp31c7WibHLiyIF43paER00mxZOAIHhsdwhk=;
        b=L6C7t4THlO7NRDspDdAvRjzM41kOLgVelPbtLk5vug+KIYQo9mRjDaOOmmpADIk3uB
         xEEzRZNmhOHSRevl1GD2szu++o70M58uA43dFQ4of1w5La6ZoYjw6rK+kCZTHDHyk8sj
         986x+zl8fYuvMA/uCkxf55Vl+IN0IqkLWxFTZdPuowPKLbRSezZGQ3XS72vWMBRwDqYi
         ygNmbzVVukuPQLXjqpfbcQbYTOI+3XyBsoepGq6h5q9XyVztH6p1GxOxMHQZKkOEc0H/
         nwVaeTpBNO1UXRmvHjT8HJl0TGyBJObnwjRMjLUIONx1FZBD6b6c72ZegcYv1kVCBlZx
         v0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWalY+zWUu3OGzfs4+3Z3B6L+r+iua6pzSNPIODARLUeR71N6lJg0JyNz4dPfjpV/6DnBj6ZHRZLID4/LU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzde0+ndpX6vaobZqfMJfWNtsls+ezzCmM55lJcI2ILNy+ABARw
	18cS+uaa8duYlPiInKRgiLHgcT35GoAHmJ5elkap1nx5wVXkxBVcmEKXfF8B4rFpmcp0UGjmnLb
	qMg==
X-Google-Smtp-Source: AGHT+IH031wjBK6zBugJiyQwbgM1S3WkZumhuZG0/47H7WWzE24O4tbIqX0eqBdD0TzKWzHgCchY3qP4ics=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9a94:b0:2e2:da81:40c1 with SMTP id
 98e67ed59e1d1-2e2f09f2280mr107a91.1.1728584720854; Thu, 10 Oct 2024 11:25:20
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:16 -0700
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
Message-ID: <20241010182427.1434605-15-seanjc@google.com>
Subject: [PATCH v13 14/85] KVM: Return ERR_SIGPENDING from hva_to_pfn() if GUP
 returns -EGAIN
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

Treat an -EAGAIN return from GUP the same as -EINTR and immediately report
to the caller that a signal is pending.  GUP only returns -EAGAIN if
the _initial_ mmap_read_lock_killable() fails, which in turn onnly fails
if a signal is pending

Note, rwsem_down_read_slowpath() actually returns -EINTR, so GUP is really
just making life harder than it needs to be.  And the call to
mmap_read_lock_killable() in the retry path returns its -errno verbatim,
i.e. GUP (and thus KVM) is already handling locking failure this way, but
only some of the time.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 17acc75990a5..ebba5d22db2d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2946,7 +2946,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 				 writable, &pfn);
 	if (npages == 1)
 		return pfn;
-	if (npages == -EINTR)
+	if (npages == -EINTR || npages == -EAGAIN)
 		return KVM_PFN_ERR_SIGPENDING;
 
 	mmap_read_lock(current->mm);
-- 
2.47.0.rc1.288.g06298d1525-goog


