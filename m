Return-Path: <linuxppc-dev+bounces-13598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 182FFC22284
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:13:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFc60V5gz3fFq;
	Fri, 31 Oct 2025 07:11:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855061;
	cv=none; b=XhLEgLfKveNeF8UhiqjkrUYiAflfmnAVCxY0AO635l931CZQJsycENpHUkU3jWFuAl65KMPTtruMcpKBhWs38swYWblUZRtLUyNOPGA6FNTM1PaH23bBJCO/M8+YaGqd1Ee2Da/bmQFkB1onGM2/z4xfBM7FlFfdxKyi4QV58w62U3KFmeGXe3G3LpPDIeMe6GAmmgPjv0z6Dc8jZbrLJmo6PD9Zmhc5s5uIlDh078vUKJxYpPbmRqmGDhzYLMe1M2RM3KdG8B3ZsK3V4w8lKusmCNmI8zLRRkfjf4FjsxynZmNbkQ8tzz365BT2L+dnIxI6BYnH4Ja8Bs557HbFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855061; c=relaxed/relaxed;
	bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ogrZejk+qB+msRz7/esQ08/VXPfD56ILORkxVcSOAW36nxckg2ZUB9Fw+q7Igl7g2SXVVDj0PHXB3MqrRKo5UABCZLiQw0A5L9HyeoQn/5gusEWyn9ef9flaqGrfXPF37gmHOrHTZBZi4Vu1JI7mqw7fNe5OawVxN+b+gXfvaBR/Qx8Dx9Y0AeD1lWchnzczIhJuW7VmK0ClyZJUnpnS5JEknodNkk0R4hb/kGOPD2uyTBqYKPj5BAW4XwR2IixcZbbnIX9RfxLJcKY7MzQLsCsX9fq1NyvNQ0nzOsbO2sF7D1MDaYigtM72Ef49FXhOYIC4BzJicfmTlEpoW63jtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jGuZQ/Rn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3u8ydaqykdd4xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jGuZQ/Rn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3u8ydaqykdd4xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFc53LNzz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:11:01 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7a675fbd71eso2043881b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855060; x=1762459860; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=jGuZQ/RnKHNvBk/8ek/MrV0cQvseBGGMuugF7d/Zf62eWU7cLl3kdksjmvbATpPgLq
         VsE5SL9WNO/9LOf5+ykp0kLFXorpF2Egj6gtBKAH10GhOe9myZlFE7Ws12ZhwJ30KNEw
         xUzFeD9Es6EEpPQJQJ9gh1OdR7n1uwuBZbJ0HeZVppQh99PwjBKGJ1DWMIQf7JefU5XF
         LmQwUDg6cObwa7xZAXI3zQaM+6VsUz47qWb+wX2eFfEOHab4HS3zS6oF7yfktViEjQTC
         ui/0DzP1veL3gJ3McfpK4fSiAai32QYBbQwE/rUg3ESiCJq+8rL9AA2EJu3HNGF1Qo5W
         i1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855060; x=1762459860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=ZTSpRAxzJ9xH9+/eJZIsUXXVdoTKNWKG+3yMYrraMUzuIUj57KvERyV8hUa0kJmC+o
         VAv9tMLyICtF2hia9YyIr7cGOgjJ9MAFAuTRmNkgaUXsNSmaI/ZxIJ2OeOMgjJBZcNTf
         IsBRE72kRVHiqk8hRxHJIFgvB/dpcZaiQ9DvNtsc5ZYRyaTnCxflmSkrn76z4AVedFhv
         Fi108fP4DXP+XQ+J808oryv36dBk9PUKnUmyzDDHO/9dUBJ9HztqlAd1pgpQYbE2lbxw
         nFvPAA/YZCV/to8/UosnVqwLJi/HpZv8rSxSh/RXiZfH+g674xIJhWNrQFiAQ/i9swsx
         2pnA==
X-Forwarded-Encrypted: i=1; AJvYcCU5H0SAqI+q3/J0QsBK0ukNHQXjHmx7iGFxBo42g+MosTJEZwmoGOfaRGzYuUQ33yXSrrjkJicxG0LVaMc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZOEdGnxo4itB8OLFopnNez6/v12u+YU3msgLX8YaQCntZZiMV
	+81wT0w61ZCVPreEuQn6CWKlil6xzMIwtnAfuOPLRSlFJInIC2+sEgUEJ2OT1iJGaEYcwDEsHe8
	f8D8poQ==
X-Google-Smtp-Source: AGHT+IE4oqFNhFQQZr1IyqSPUxhZWizKY8+4h3k61YypjXkX/4HyRwAM2GyKD7DH49xWshMyjNqw52ssRLY=
X-Received: from pfbgi4.prod.google.com ([2002:a05:6a00:63c4:b0:793:b157:af42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2283:b0:7a2:721b:adb6
 with SMTP id d2e1a72fcca58-7a77a9cb11amr747302b3a.28.1761855059275; Thu, 30
 Oct 2025 13:10:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:47 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-25-seanjc@google.com>
Subject: [PATCH v4 24/28] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d6f40a481487..037429964fd7 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2806,7 +2806,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2819,15 +2819,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.1.930.gacf6e81ea2-goog


