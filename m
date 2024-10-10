Return-Path: <linuxppc-dev+bounces-2029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5A99903C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdW60gjKz3cH9;
	Fri, 11 Oct 2024 05:26:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584786;
	cv=none; b=jZ7R+D9JktzCI4/UVPlw9CvB0p2p/BQKLIa129BIMS5qVUb4YVL8ANTHscorZdpYcGr63RYtA6a6QXZab3YMWhSDBOnYBP1uga0Bu2EYyRcaAqQB4GOsw2jb3TX+RX2uqrr5UrItAC+S6xxmCyEYj7i/Mgq3WzRRDDeoMYnldNnPcGo+G1XlzL7tKR7NPKsaC94bhGG5GYj3mOY8tvzmP5urmagNReW3IzLD7xJ+ve5jc6boFSy6wCx1gzTmYG+WI0mqLsTsBEPQ2mCtwCGQRNgHvCyFA1N1NLYfOTlGmO7iL9AI4Sb2twjFm7nfL0ANPByYdxbG9q0VZbUG4kBsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584786; c=relaxed/relaxed;
	bh=O48RmE1hmLPs0qNEdPIh+k/rpCPu+e8A6GC4+tMXVMw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A3hlum4JYqwGlig4HaaZ8pyLgdm9bDI+HRc5CQ3oU5V3tXFEI8BUoRSVNexh+apeGzqYtC44vlB6LHqNWiGC/7Y6HTc6cCPhAH/d+E3fDd0PS38SGuBezxXjVDhRra4eNt8LiAlKrmjlo7X/o7IEILhW3wbRG4QiCwQZU9p42sxyCt9R4cZVF7/KLaDNM2aFBjIowGk8LZjxhiSWPPNXOakdRp2muKkHjABvJ6dYm4Fuhm3e0Tv6jSeA0w7fDFhpQaj12k6cn4JleQCvSkSK30F7mwrIMoC6v3+AdpvWdRI3YQoN4yTXGjd/8ZdeU3IOUjw8VnN9AzDVRvwfBUd7Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4dklKbAj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3txwizwykdoyamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4dklKbAj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3txwizwykdoyamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdW51WWTz3cH7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:25 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-6818fa37eecso1273912a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584784; x=1729189584; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O48RmE1hmLPs0qNEdPIh+k/rpCPu+e8A6GC4+tMXVMw=;
        b=4dklKbAj0Ugnpc6gJCyCo6LJO1wDDEgzH2NF9epwiGZs3KrQnjZq2G20EbomqNqmXl
         jdg26XH2E000RRKr9IwcKlJWo1q7xOBLzuYfAqSCHjh3hvCoHgAhxr4GX+ZPEBu3v4xH
         mlLBisy8JASXzhcKxtmFfdksFYBx6k4ApppNcrm6XEpuJBzYhdCzuhKWHOXGD57owZ1w
         GBNK/jA4GijQQk2W2geg7VJ/1Z/0AZlAZ/B2VsPrSuSr9CaHPM0XlHFihQbXinPb8L2D
         JoWFP0pH+Ex+fQlATOkzkLqXF7UbgWwgNlsCMNasOqrLqKEkf8cLbQVLr2nSisYz/LQM
         m7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584784; x=1729189584;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O48RmE1hmLPs0qNEdPIh+k/rpCPu+e8A6GC4+tMXVMw=;
        b=DYniiDb3hdp8s8YW8+osydQNQPkqAAsIr5H98p7yEfJRJ6RWV/IHWSrPTUabhrVfjT
         kBcZMxDllw6nztmQsqQA3mtkAoDYQqSA8DIDPIIVgALNxWJOqhIgl7ajCQ87sNCeJbnB
         1b+sjoEnskW9MhmMDs8XXjxtoOdNLJXBuxay9+NWzTJt/ZJ3S+y1V+X4BGdZRNecdxT2
         P24lixiWadvX91o+kSnxqcftX2v/71Dck+odsLzcnhK+otm9hJuRUbj2CGYDUxv9x8ER
         5OzMCHIn7RA2/KB52VN+8wGZZ0wGOw9ApW5tFD4p57MgcQhM5kFzUeKf9p8HKpw1IwN3
         qeQg==
X-Forwarded-Encrypted: i=1; AJvYcCXm8f96jRPHuiVG4j6Kwigmqk9x+/mx5/sMuWNbYJBBUbmNkXDE67T+E2aA2ac0kTSsQxd57sNDjLes0a0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywf+nmFU/noWkL9TWGkxzR6HBvtRr+Gv0kv7ba1aIytw63eoek/
	NGSxoW9vMW/oFR9ybxFE7OCC2Tl+BxGXKp8G4oE1dFn9Re9Tsqsc2/4L2AwgG5hYdirgXk6cymx
	65A==
X-Google-Smtp-Source: AGHT+IGY3J0AFIsOlJbVDrqn6majLeEUOkcp3LAakwsbgSwDXT3SnAGgA9L20idMLdLGQvBeoRsHZDJxo50=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:2445:0:b0:75d:16f9:c075 with SMTP id
 41be03b00d2f7-7ea5359cd2amr19a12.9.1728584783356; Thu, 10 Oct 2024 11:26:23
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:46 -0700
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
Message-ID: <20241010182427.1434605-45-seanjc@google.com>
Subject: [PATCH v13 44/85] KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Convert KVM x86 to use the recently introduced __kvm_faultin_pfn().
Opportunstically capture the refcounted_page grabbed by KVM for use in
future changes.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 ++++++++++----
 arch/x86/kvm/mmu/mmu_internal.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f730870887dd..2e2076287aaf 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4416,11 +4416,14 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_v=
cpu *vcpu,
 static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 				 struct kvm_page_fault *fault)
 {
+	unsigned int foll =3D fault->write ? FOLL_WRITE : 0;
+
 	if (fault->is_private)
 		return kvm_mmu_faultin_pfn_private(vcpu, fault);
=20
-	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
-					  fault->write, &fault->map_writable);
+	foll |=3D FOLL_NOWAIT;
+	fault->pfn =3D __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
=20
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4447,8 +4450,11 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vc=
pu,
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
-					  fault->write, &fault->map_writable);
+	foll |=3D FOLL_INTERRUPTIBLE;
+	foll &=3D ~FOLL_NOWAIT;
+	fault->pfn =3D __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
+
 	return RET_PF_CONTINUE;
 }
=20
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_interna=
l.h
index 59e600f6ff9d..fabbea504a69 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -238,6 +238,7 @@ struct kvm_page_fault {
 	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	struct page *refcounted_page;
 	bool map_writable;
=20
 	/*
--=20
2.47.0.rc1.288.g06298d1525-goog


