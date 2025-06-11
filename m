Return-Path: <linuxppc-dev+bounces-9272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0AAD4747
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 02:11:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH5fT4d1Gz30RK;
	Wed, 11 Jun 2025 10:10:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749600657;
	cv=none; b=MXMTrspflxhFt/AUL3hJ/nFteazqmyxG0tb6E1SEvOw0wMJdf3Hd2/WbviZsWILl715FC9Q+nxgHNrkPSMEk7BPYsvaUqKCx0qxgVTpdRuT44PjkMqCfi1tPvtiUnEslJuN3dihNVifuI8UOs9Le0CtGMWtmTNa+3nGa6piNXscCsY8yq+isMYj0Z1jvsT2hEV+rFS6KSfszs6rtGQhT71ZKGwg44jwPrSo9K+O+8pfDpnl9mNpYy6/qHOsYBXfiYC12uIPZLuRpatHFcolIi4DeAXtdCS94qriZzUJX2dOsHpdDlZy1dy7SmU2oLc5HJ6qPnrgFldZ7TdcyAqvZug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749600657; c=relaxed/relaxed;
	bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CL3ep2ZOsBsLd9DrwR01IJtA5EVH5lX0elv10seqKn7Aw11xYNWZ5N7jULhcxTqkBmwGP4FaoLi9MRfYFKEGEI74C1gPrMaC/F8V0thKbpkXKIOViBNMdA0DMiHXUvF4IVxLHs/zMq7Q6jw1HBfGHxxWPChaQnn+DRsaey24eWrTNHIWdSVAIXLAuwWTEp1f2kSoTGKExIhW3+qKichoq+IapKMX518P0fioZqC3/3w3+gpck/kdalPFjK/OqmjQybyY5OCP74rHsLjIXWxLTK6yQLx24xAKwSGH3K5lZjLMz/93qU51Cd+VXhiTdX4Wv03oVhOd8uktRPVyiYJPhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VvMFv8qk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3j8liaaykdi4aws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VvMFv8qk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3j8liaaykdi4aws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH5fT0vRgz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 10:10:57 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso5273454a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600655; x=1750205455; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=VvMFv8qkblXIhFWxm83j+kpcyS5WARELzolKWQHvYkKjgPbVB5fI4tQHjgEjHrLSXd
         DSLYqMb+5vG7+lqmiJ5f2t8fBSscCPhz61h1LPjRwnZVDzHAmpzLvq8Cql16rOqgAaxj
         N0FLvHzmYJwXEhkz+VGVYT02Sa0ZKng8SYcIek/jqS+8PZ0ol35hmHYJpeWRwWIJNHKM
         5NFY2WF79/ddueDPRvkC/tAy1eQBBo4TT2qxkugE4WwaRpbX8o9qSj6l+JjgsIMTxS4U
         JiGJ5JEiHTDOtjBD18P2a+EXnBJcs38Jbpk0Slf56Z5A7DWDZaU76dT1qnYo0eXK718Q
         CvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600655; x=1750205455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zss/ktKZQOB/zxYHcr8l4OJbiGy6+R3+c8NDOsBeWew=;
        b=tQVI6Csm6dGiFm3VtEB70JazwCpxRyisIciWE2MPDlPXRzye4zckltJTjfBk/zCShf
         Ei8Ah0EfYlDkPV2okoNb2hvFjM624cCjm1bzgqlFUxWeBEAXyYPtfDS1bj369qil046c
         P/aUe2Hb/nC6AuPTTbrWMNrQvVSqq+gVS9tFxYSS6PdmwuR+cjZQVRVJznPBCMYStaup
         nP4WzDEw+TPYnbqWXQNeaoVvuT9IljSX3ZJWyU60mn1OxOp3RqVggihbIpcTRAR2oktE
         ynmjb4D7AqANC6MjeZ5aaDgDcYgb2EZHxipNqtUNyzU9IWmGLzwlrzIyjIE08zUim1yn
         9m7g==
X-Forwarded-Encrypted: i=1; AJvYcCVZJS1UOla1BPx+qod4XD9bXHPlv6D0fHou5PaPGCRYryaEUSn8gDVZgtuvzv6CSTlCQxRJgkK9MIgHgyk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1Vzge69JzEioZ2Dq1VizE6ueKoyXjnqhJ25sOybAXwuJMlVHI
	uRTan/LMD/t+I7fKurv7SyPpMaazIVhDB9nKlt1fW/KXw+Y8gsCTvLgK/nwlrXWhWK8fpMO6tE+
	LYqeOzw==
X-Google-Smtp-Source: AGHT+IFPf4zAcxMmKYyJF/0q0QWOeyyNBeEfAEV8gqM1cGbYGy338sgO6izo7nZMoEiNEzX0yDZpDSCyFlg=
X-Received: from pjbpx2.prod.google.com ([2002:a17:90b:2702:b0:313:230:89ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:384d:b0:311:f30b:c21
 with SMTP id 98e67ed59e1d1-313af243a50mr1534626a91.26.1749600655513; Tue, 10
 Jun 2025 17:10:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:40 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
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
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-7-seanjc@google.com>
Subject: [PATCH 6/8] KVM: PPC: Stop adding virt/kvm to the arch include path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Don't add virt/kvm to KVM PPC's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that PPC *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when PPC support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..1a575db2666e 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
+ccflags-y := -Iarch/powerpc/kvm
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


