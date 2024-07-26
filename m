Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86B93DC20
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:15:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PhdzYq9K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4rp1l4Hz3dHj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PhdzYq9K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3bzekzgykdeiwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Ms6Db6z3dWk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:45 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-66b3b4415c7so6711607b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038024; x=1722642824; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bC28fbRseb42Ch2zMqBFWEix5TOk22ZdgToO+ip0K/0=;
        b=PhdzYq9KV0cYn2jU1sMmcbjCGX4PeYzCFB82kIiTBL2VPp64c1ZormQYIufTnCLtp/
         mR07QjRKXClqjx7c1ehPNNZsC095Xj5FsA6rcZJuy0UlD+PEsUf0/FPh/Iu0hbM0wKn6
         mT2Z+QXKlAdAaGOuLCGQLz0rgp8HaNxlxJ4dolaY5uS2KdU50GLIMau/jil343YXThG6
         N2u/bEcB7Un95fiK7t6VT8M81z7w+Lfd9A4xM8lNiIgLcAURsmtDn4cgORUUtzk52dPg
         +fK/k9JwKsEO/3oE6tGZq3B3QyliBpSuBoYb69PYs2gb+RGdUVVQMuOL/ivE59zldOcB
         V0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038024; x=1722642824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC28fbRseb42Ch2zMqBFWEix5TOk22ZdgToO+ip0K/0=;
        b=GnEImN3ygF0oQ4mXiQXQjHbhg6vyjOuLyrLqeTVKxLHYkgZ12VeglE7BwGaRUN0BL9
         xmMBVEKcCU6+a32kM1FON2Om1q7/PJ2dGY7mJixPgNmPn6RF3YKRV/v0yJpRyrvzke45
         W+AxUcjtBOqW3EfHZuJrL5rOCv/yqcCIQ3gLrk9j/au5aPYCsvs388qCtyc4Lx5LD8BQ
         ay0l+cABe9Ownu2EWmFKEHa8n3C8vLEW5ahdFwwS+nVxoSdBk3qqeEhicBsNEMcbaNum
         c9LT366wxS/6j6yF7Xb1QVNs0PZKmKHrcNHq9pBSBgvrwzNb/zHAMYxKTTbjtLNZT0ty
         bXtA==
X-Forwarded-Encrypted: i=1; AJvYcCUVU+lN/sEoz7MisxFM272CljhDBvbdR0EdcwOHtZwQmfIiqEp5Nm/XV9DvwyheGH0VCcC3BaH6rLSfXWfx7JFiQDlGPv34kPaX1twQ9Q==
X-Gm-Message-State: AOJu0YwJNjQX39woc+7fdF3dMniogSO8j6G1z800W5naSpqEAX7+jfgF
	gy7xHXGYj4ESUF0y04xG166atz0x5Pn6IRqCOdj6uXegV1s0GkmVR2akaZHzS3JtN3P8++2ShMa
	fqw==
X-Google-Smtp-Source: AGHT+IFe6CawsiHghHJz6goDA5MI5OiaYSIvtgnV/oY+y/tLOOW/H4O66kyosfEcqs3UQ2nQeG3uHH/jimU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:181d:b0:e03:5144:1d48 with SMTP id
 3f1490d57ef6-e0b5452490amr2050276.11.1722038023813; Fri, 26 Jul 2024 16:53:43
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:41 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-33-seanjc@google.com>
Subject: [PATCH v12 32/84] KVM: Get writable mapping for __kvm_vcpu_map() only
 when necessary
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

When creating a memory map for read, don't request a writable pfn from the
primary MMU.  While creating read-only mappings can be theoretically slower,
as they don't play nice with fast GUP due to the need to break CoW before
mapping the underlying PFN, practically speaking, creating a mapping isn't
a super hot path, and getting a writable mapping for reading is weird and
confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a46c7bf1f902..a28479629488 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3142,7 +3142,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 	struct kvm_follow_pfn kfp = {
 		.slot = gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn = gfn,
-		.flags = FOLL_WRITE,
+		.flags = writable ? FOLL_WRITE : 0,
 		.refcounted_page = &map->pinned_page,
 		.pin = true,
 	};
-- 
2.46.0.rc1.232.g9752f9e123-goog

