Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9FA93DB99
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:02:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Lz2szqws;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4Yj1DcSz3dJB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Lz2szqws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=33zakzgykdboi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4M64kJqz3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:06 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc6a863751so9698355ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037984; x=1722642784; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=Lz2szqwsXKc4mwmv2oeEX9lynZljye25sx8ArLvX+DSDzWU5l7GhWDO55ySeT72ps+
         2/2GY0iioj6NpIOLyZz0QOVJHM1B8WLDYSWjiKAb81OCrFbVlLoj+yTRMrSDL2q9ix+1
         us1ySXQeSw3dk7QmmoPANPIt9zRBN8UIdTQWdYNcVIcUXB26bOw2NNqyuC9thySqkYvU
         6OzCrujFqICSNl9H6t9+C7sKBM8Rbfa2BM5ds2vn6lYTCoQ/YvmkNRkL3wgLf7otOXsP
         msyLGy9vy3OOcTuUTvuq+amx01TQWOhDpusXSzTX5GRrK25y2LDQ1CPp9bWZc3ZPYkbQ
         fN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037984; x=1722642784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8vTlhvtYFVN9mhfz5x+cQCHJ6x1sNjhm2Vdu8bZ6Vo=;
        b=OGMjUpS27QvfkbqBTHvu9JXjw+EFCkKhTfCV/to+p5gO8jrpyiPR4mWVLREJk/5M4l
         xcZJ1GRLt2KAqvPZdWrBEhzC7Bq8PJM6+OmZChEMXMve2AQR5cmjYikAEdGoEYlwBkCO
         qgIv3HNNIKlOJOoK6CPw3CiU8DutsRMAZqvaRWxguYSj9iFx7GKYL7MjpYSF6FOQdDbB
         g85nb6eGb7/DFcag0SUdn35l3DpSOIPXmOpDfyGSwOiCvSzu81stPZaeNf5bxVU2Ns83
         qMhddEw5/ngVwviMSp0Dcyt5GezbSBCNDSTc5zFfDt7dB+NAkK62F8OrhjhNXAChIOaD
         7+bA==
X-Forwarded-Encrypted: i=1; AJvYcCXyT6b/aZyo1qdLoJPAu4Vvuem4T44YqdsSJm779LvUN+kjTpjfJ41660fq6dkoPAw69Zf/6wNJLvHOUlpPOno6K5r8upj3nRr6+jWBag==
X-Gm-Message-State: AOJu0YzciX39AnyTrG6SFf0XMgfcG9+LY97GYPt994q8gcwSkluSf/Vm
	pS4vDIbKgC3vKUHKSfqLN0clFfDxONKBivI18A/fdtb7u2oRY48p6hGLbxOOnUL/wVY8/ihjW+S
	ZsA==
X-Google-Smtp-Source: AGHT+IGcvEjw3oRLgbDLJZa9I5d4JQMYDdZeA/FUbXpEzYyt5G6Xd+JdRMAKGNKsfMlLtXc62VqHMV40c8I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:234e:b0:1f6:2964:17b8 with SMTP id
 d9443c01a7336-1ff0492c71fmr137005ad.10.1722037983933; Fri, 26 Jul 2024
 16:53:03 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:22 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-14-seanjc@google.com>
Subject: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn() might sleep
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

Now that hva_to_pfn() no longer supports being called in atomic context,
move the might_sleep() annotation from hva_to_pfn_slow() to hva_to_pfn().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 84c73b4fc804..03af1a0090b1 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2807,8 +2807,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 	struct page *page;
 	int npages;
 
-	might_sleep();
-
 	if (writable)
 		*writable = write_fault;
 
@@ -2947,6 +2945,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 	kvm_pfn_t pfn;
 	int npages, r;
 
+	might_sleep();
+
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

