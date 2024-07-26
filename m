Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C017C93DCB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:43:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YKv4UY15;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5Sp4m5Cz3dLH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:43:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YKv4UY15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3wzekzgykdjyi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4PT0XX8z3d8S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:09 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fda155bc43so11486655ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038107; x=1722642907; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Agw1NDopTbJHSwXqEMTAoK1oQKqohLcT4CyuwhV7hPY=;
        b=YKv4UY15MmhPWRhCFO6t5XYvd4dLu8BvJbUjbk9IIyb0Dt/hppHJ95EZV4Qq2tP/99
         qM34jWghcHMOZX0YqkfIrWfnh5+jlwiFoz19xVK9QpAVxeGEW9u9B481aP5e3uA9PdBP
         v4ku8dEXH/q7pBxbEigGB5P8zMml8k3whcRNm2liwpx6OCLCnTNaz5WwPUKoa0DRRQ55
         LnDNUelmUdi5mivsacr2U421PrvKEat3n7XlOba6jAzBZv/eurdE5178SF5HTQaCT5oQ
         NxBBK/x8VbYANQ8mAAFS7W6cH0PcibdGlwiwqcnmUw1trGvYDVkfvGIkb+hopbGgRFEf
         15ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038107; x=1722642907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Agw1NDopTbJHSwXqEMTAoK1oQKqohLcT4CyuwhV7hPY=;
        b=wUOO+YbEkN3I/Z8bRP3GvvjSJofVex/smlgd3rqWdf7MxaQ2whVL1pXKkuKOMMiWTp
         /AuvoA0leYiiLfrKIrSJAOCSLaSb2ZFOGk4s45ZmAHP4R6jXrMhGgfhHMQPoLYT2shXc
         33nqMX3m5P9WuWHc2MGP0Bppai4QRZjxdKGoPps2gOjx6eiARgpizqSpIARuiAQ7v/E8
         tT/DOjqe6qyxA1ja2KH5D5OTAU77B9+u80QyWRhCaep+JeNT7jJJIH7xBKxtsajjZLGz
         jWBh8Wg4AueCdKUWlIb3p8f3+3VOYkcWuz2Ze6v88CSf7j33ye5Ajra2R90qcdpbnKV7
         Y74A==
X-Forwarded-Encrypted: i=1; AJvYcCXrmJWdBeUlhLFkg5Y7hqDDHnWtX+diPXcNhiZTk9HOdU0Eozl6GFHyBPtJF2jMWR+EiFYGK0M3m8wtksgKqRBz0V+sA4o+6gW2AZ7z7g==
X-Gm-Message-State: AOJu0YwgR3Wxl9Lnpk5vE3buGfQfcJS2QKFLIL7CQLyRqontrWtyiz19
	hbapHHJwnfY9xEpPRdgUJe3+dmLSX6AlZw6zGNeoY8EJbNqx5BT5KNn2olkMmhAFhQ/GEs+GC8q
	jjA==
X-Google-Smtp-Source: AGHT+IHxZ9LAKt5vIHU7V05HDfJ12gC6skwH/WeW9XOXHpR7B1c0ubRWlOUtq2UiALskA4rClXraM4lFVDE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:b18d:b0:1fd:8ebf:672c with SMTP id
 d9443c01a7336-1ff047d8f61mr25415ad.3.1722038107293; Fri, 26 Jul 2024 16:55:07
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:21 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-73-seanjc@google.com>
Subject: [PATCH v12 72/84] KVM: PPC: Remove extra get_page() to fix page
 refcount leak
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

Don't manually do get_page() when patching dcbz, as gfn_to_page() gifts
the caller a reference.  I.e. doing get_page() will leak the page due to
not putting all references.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 1bdcd4ee4813..ae4757ac0848 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -652,7 +652,6 @@ static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	get_page(hpage);
 	page = kmap_atomic(hpage);
 
 	/* patch dcbz into reserved instruction, so we trap */
-- 
2.46.0.rc1.232.g9752f9e123-goog

