Return-Path: <linuxppc-dev+bounces-6439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF0A4315B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 00:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1yL20ylkz30MZ;
	Tue, 25 Feb 2025 10:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740441354;
	cv=none; b=OuyEoZXjfOb8BMFNbig0E4TSsMTXsnU7JhG7TiLYaXggDoZmCGD83HxvykRsOZJEpQCrBYyoWsWr6uc39ELhK0Oeq01qdBJqZKPqnUwjVAtCRPY2qjolKx5Ky8xuwy91fLjOPbFy7O27YIZUEhXnRZ2YqjgBa2WnQePe8A9+KOGApKk0LCA2Gu3OWJn8aNro7ZbMeCbkdHVFBCsDhYwE3VEei3PXrQ2ARoF4tFNhdE1S6sXa6MhV23PDPQF3IcE6V5nJAAm937Z6gwQ9HCKgGFGVXAXAV4TjMTVvZUhvuHqljSXPVyO5++qd4x1wxLZ0fON5LYhd4aHiJpcccNp3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740441354; c=relaxed/relaxed;
	bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M8GDmgd3jlU1cavseILyoc8R71O034vJSEmj1yaPaPF2zPpwbdNnp5FXf1QAPXEpFSh4SGe+uncyMPPTMtiO8Oan8MYayopISSS48Ff9hPikA+RkJrb42vTwG2eYBKVV8ZHBzAxpZTry1X2VxTafWUKJE+ZWXQzPhC83It3qCdvdiXRD4pQ6Ft9ni/fJzDqgM9Wsm4/axE3WvoUmDvx5LI5l0pvu7b1UTeAUnC40rZcSwCBllirxwlGS85TYTWkwWvaDw5U0Zr3kATkNhDkNDP5s7XSZrtmhvEgpO7kCJZhuZcgslRegm2PHzHjkCG9BYacbFw6cprXNt9kQrLgTDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2AgSOno9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3bge9zwykde07tp2yrv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2AgSOno9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3bge9zwykde07tp2yrv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1yL1271Pz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 10:55:52 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-220fff23644so34907375ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 15:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441350; x=1741046150; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=;
        b=2AgSOno9CbpPIHPmgHXBJ+77UxhPwvT6o1c3dtHogLEF3uQc7VdmRc+cUyomKi74JU
         yKXNHbzJPpPMkFEEc9vD9HN22tpPylxTZNZXb4HBMjAr0yeEg0jxZgiitGiURH6e5e7Y
         TT8jVzjCUdfHRGHlBazO5/UuPduMnk3OUiutE2X7ivVF7LCZfva0Z8erGjR3l0cbSZfk
         DxLeiQjfifp8M8ATYatFqrFoVRV8vYM7HhqvGNBKhl4Gg6pI6Qma8KeK4nHX5QRJhbJq
         a07/4l8Q1I/MZm/GRmwg3jiqaDI0DtU8EvTqQzzSK9JiojZJS2MC0ZJ1RMVY/gTHi28v
         GKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441350; x=1741046150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=;
        b=Q0A2Vfv1t6QWAdQJdLtsZrD76RxulZQpI925ac9z3wQf2G9aiZv7JXyn6eSCMwX7Uq
         QNBJ5QrDjpmq+a468fCIMfKZsNpVb/nSnzAX3xsSqRMhexTt+MxybufDw9a1SND8rpxb
         QlPkJRafD9b4OdO2pIs0NiyQdyWd8EhWOeLa6N+T4loa4s4qAhCiABaTkeq34Z6EVRXE
         uD0lkPIZewAjwhSaJwLVUSeLakGuAYoen9VOPoj1Bzz001UUh64ECB/WPQlMYvmjU9oc
         V8T201K04JVKIW7N9WnB2U7vU436yGLfLQ7+T1sAyuNYe4dIuaEdTHFZKUwDif1M6Izv
         FAGA==
X-Forwarded-Encrypted: i=1; AJvYcCUGy9vE79LWUmQNlKOxskb7jiCEfBl40SDhHPUus893Z484C7GgIB+XzOhHgcvVTJ/lLXT4FZ98uacSGEM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6HucyEPr3rbhtO31Nb/1oDypLQ/Y++xFiJx0HvI6m341t7zfZ
	SAaHPY7gsP6x5Euv6Xz/wuGDEGcaoD2ggwGM5Cqul5IfZ7NdLUXH2UsPsVvyrP27TYeAxLaMsZo
	rfA==
X-Google-Smtp-Source: AGHT+IGsyGC9C+MeujnUnW2nPba4jsQ7IgXXOkNko0b7VAiFOZ5bP8OY6ummej4/xlJQLwWUr2RcXaF45Ig=
X-Received: from pjbse14.prod.google.com ([2002:a17:90b:518e:b0:2ef:78ff:bc3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f8d:b0:220:d81d:f521
 with SMTP id d9443c01a7336-22307e72198mr15100345ad.51.1740441350608; Mon, 24
 Feb 2025 15:55:50 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:38 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
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
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-4-seanjc@google.com>
Subject: [PATCH 3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
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
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

After freeing a vCPU, assert that it is no longer reachable, and that
kvm_get_vcpu() doesn't return garbage or a pointer to some other vCPU.
While KVM obviously shouldn't be attempting to access a freed vCPU, it's
all too easy for KVM to make a VM-wide request, e.g. via KVM_BUG_ON() or
kvm_flush_remote_tlbs().

Alternatively, KVM could short-circuit problematic paths if the VM's
refcount has gone to zero, e.g. in kvm_make_all_cpus_request(), or KVM
could try disallow making global requests during teardown.  But given that
deleting the vCPU from the array Just Works, adding logic to the requests
path is unnecessary, and trying to make requests illegal during teardown
would be a fool's errand.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 201c14ff476f..991e8111e88b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -489,6 +489,14 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_vcpu_destroy(vcpu);
 		xa_erase(&kvm->vcpu_array, i);
+
+		/*
+		 * Assert that the vCPU isn't visible in any way, to ensure KVM
+		 * doesn't trigger a use-after-free if destroying vCPUs results
+		 * in VM-wide request, e.g. to flush remote TLBs when tearing
+		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
+		 */
+		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
 	}
 
 	atomic_set(&kvm->online_vcpus, 0);
-- 
2.48.1.658.g4767266eb4-goog


