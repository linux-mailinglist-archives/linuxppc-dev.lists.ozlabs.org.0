Return-Path: <linuxppc-dev+bounces-5059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D414A09FF8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 02:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLRZ53zrz3cyc;
	Sat, 11 Jan 2025 12:24:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736558698;
	cv=none; b=IBDssM/m2Xyb1k4Jxw/C9sa0qk8io5mPkpU/9i9kzIht63778ngXLwDl+pLxWms1Pb42yMP/pbKmxpH33S2bou3WTk/AKcWmJypHnDwEhiLICzY7t+AZtBf6RAz1xYP/wpZCyFtAM5tEZLb/3bzvndalJl7Qjj45uUpudx7AhrXM8u1f2r1l0xjwAyGCzliUWxq96Rb3vduC7CclqcZHcDpI12GfzciZ0QzzzKMq9LzHNP2kBAjf/vkd4yN7AXSoyT51xX6xwTL/7UbAHHraDxviNMpr7Y2Ar8l4lU7ZSXuIpUIVf8oOvFyT5aMYUWkJj0PMV0bN9YeMRCo3Ggc0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736558698; c=relaxed/relaxed;
	bh=L3TyIoxqzKbU5TOqXbLBWWXwSPvFkN5kGJBIZi+nPuA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oOLt9aL1PfmBeycJKzLz7A8ZPWwly08jarHIUG8ElCMg/UfzLuOzwco8DEjlAa1UmHr3rymBJ/quwHlvnX3E7Od0SiXtjLFJ3UvQ01x59+VW4EDLsOCSbdGQDxaq/K58kxaSr9IozL8thse+CaH2TxqhXN2Wl2tIiYkyTNALVxNO+EVBegTd+OZJQz68TdkRQL2zPUJfC724C9rM1bMpsgmPvKONgPVJbRRmLMySilx5NdMCR9wEuzr7HzCbJc61TAeeHxaXmQBva7uvs/tFRpzHWFzYtMlgrscODAvUxMLSkWSS7lmuxQMZd+wI872cj9IMNdztMUmAqihBXkazzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KNQ1PLTz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3zsibzwykdeevhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KNQ1PLTz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3zsibzwykdeevhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVLRY2Zl9z3cyL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 12:24:57 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so4787843a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558694; x=1737163494; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=L3TyIoxqzKbU5TOqXbLBWWXwSPvFkN5kGJBIZi+nPuA=;
        b=KNQ1PLTzEigYZUAUEcOehwXrUR6+UWQyIaOoxZKde5i73p9StS8ASio3Nh/uOSzIhr
         kspGvxpKAH6G5GrX4HNHFJ6cKwN8stXWklePyUxqdf5u9HJWSPgGtRmJXCxv/Age+dqj
         aKxJ5D4jkFLA5HxW6T7AIb7PtvFjSttwidUPCbQzTGNQg7iW6yMvxPXDRXnFNJ0Rg6gg
         mZiy1pov8MnK7ZKEgu9sJbydkwZ31yP9xm6obK1OiYsCWJb11Hz4nVIcsWHCFQqrl6N+
         ao/8Y3QfvRH4jQyTUkVlCu9PeBMtDXDTmWRg/c7cUFBPtbT1sTw9FSfSjUrPGlNLy7qU
         xQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558694; x=1737163494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3TyIoxqzKbU5TOqXbLBWWXwSPvFkN5kGJBIZi+nPuA=;
        b=tGlQ6Tcnvp5839uhA/6ksHYYkkxUBu4DJMgqT3/pXexendcVgmR76I9pyviD8DTpz3
         cRUubh/W0rN07OT8/UkT+hWabn9CNF4HupasKz7qX0lr/KS86gB54+c3PjZvEeMs5gCk
         wQeHgd28fhsDXJwQLOjnfNCs8UBEgdVdzWd1hjTqXJYulx27zKPUYYvmKQ2PqAclm85n
         DI+7iMWNfvNYi4sT6qp302nZLKfO80yHl+5+qJB81whUvMCcFpHuOQG73qPa+OZnDo/r
         3MX2Z/2Ta7xZY2pkXIifqf+XXIWEhkExX2R+XMy+wLCXoYRu8Z4pQfRNKOaaBvxZtTIe
         CoAg==
X-Forwarded-Encrypted: i=1; AJvYcCUo70BfeivO++4HJg3CCC2tsRPNgN7DUYLCGp9cLYD5Kmx33hnILLvaXPVE13KyUUKqZiYf5FoF01NKVMQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHC941SP0PHMrXY2cnGUNymk59IwftZ8iZvAM4sOjZJNhXSyxR
	ZDNAzpz3ZqE72SUd7QcIsPm0VAKkAdE/Dhh7V8RD/Ex1H+TicE+6YSULZcEZgktKV8b8bCR8yQG
	nkA==
X-Google-Smtp-Source: AGHT+IHQFtnrz9Qz4G4DVM+w+HCWHLq9SWFcOY5MsmF5EmSUkf18xpdPguK9lOowTA48c954eXDA8ByTfJE=
X-Received: from pfld20.prod.google.com ([2002:a05:6a00:1994:b0:728:b3dd:ba8c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:114e:b0:728:f337:a721
 with SMTP id d2e1a72fcca58-72d21f29214mr17702842b3a.7.1736558694264; Fri, 10
 Jan 2025 17:24:54 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Jan 2025 17:24:46 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
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
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-2-seanjc@google.com>
Subject: [PATCH 1/5] KVM: x86: Document that KVM_EXIT_HYPERCALL requires completion
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Update KVM's documentation to call out that KVM_EXIT_HYPERCALL requires
userspace to do KVM_RUN before state save/restore, so that KVM can skip
the hypercall instruction, otherwise resuming the vCPU after restore will
restart the instruction and potentially lead to a spurious MAP_GPA_RANGE.

Fixes: 0dbb11230437 ("KVM: X86: Introduce KVM_HC_MAP_GPA_RANGE hypercall")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 39 +++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 454c2aaa155e..c92c8d4e8779 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6615,13 +6615,29 @@ The 'data' member contains, in its first 'len' bytes, the value as it would
 appear if the VCPU performed a load or store of the appropriate width directly
 to the byte array.
 
+It is strongly recommended that userspace use ``KVM_EXIT_IO`` (x86) or
+``KVM_EXIT_MMIO`` (all except s390) to implement functionality that
+requires a guest to interact with host userspace.
+
+.. note:: KVM_EXIT_IO is significantly faster than KVM_EXIT_MMIO.
+
+		/* KVM_EXIT_HYPERCALL */
+		struct {
+			__u64 nr;
+			__u64 args[6];
+			__u64 ret;
+			__u64 flags;
+		} hypercall;
+
+
 .. note::
 
       For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN,
-      KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR the corresponding
-      operations are complete (and guest state is consistent) only after userspace
-      has re-entered the kernel with KVM_RUN.  The kernel side will first finish
-      incomplete operations and then check for pending signals.
+      KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR, KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL
+      the corresponding operations are complete (and guest state is consistent)
+      only after userspace has re-entered the kernel with KVM_RUN.  The kernel
+      side will first finish incomplete operations and then check for pending
+      signals.
 
       The pending state of the operation is not preserved in state which is
       visible to userspace, thus userspace should ensure that the operation is
@@ -6632,21 +6648,6 @@ to the byte array.
 
 ::
 
-		/* KVM_EXIT_HYPERCALL */
-		struct {
-			__u64 nr;
-			__u64 args[6];
-			__u64 ret;
-			__u64 flags;
-		} hypercall;
-
-
-It is strongly recommended that userspace use ``KVM_EXIT_IO`` (x86) or
-``KVM_EXIT_MMIO`` (all except s390) to implement functionality that
-requires a guest to interact with host userspace.
-
-.. note:: KVM_EXIT_IO is significantly faster than KVM_EXIT_MMIO.
-
 For arm64:
 ----------
 
-- 
2.47.1.613.gc27f4b7a9f-goog


