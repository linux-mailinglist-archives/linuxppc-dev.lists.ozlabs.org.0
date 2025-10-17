Return-Path: <linuxppc-dev+bounces-12960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E34BE5EAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm521ZBZz3cnc;
	Fri, 17 Oct 2025 11:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661190;
	cv=none; b=Qo94XfFhYiqAiTg5XgSIk1A1NAqKsDxwlVlBP+zdyvnyNSIRwj1SiAIRXI3ri6C4KvB68RIi6c0jK4Oro8TS9tqm9MgdkEuZw0Q2X1gKd++bmnGFmk1D2Qf7XMLN7GrF8TQG8mBzEubGL/3AjtnwQ5zbODKsywoUwB61LBxWQkHOFfHR8i6fUxJVUUopOcT4rKHUaiGMhuLILGhqgXpsoXFVRTjTTtAvD3fh3zgZ3pebjU5sxlX1w3p3q3sqHvv56+hAzdxNjPqPFogTIHc9UsviW1u+/m8qRdGLYzS6MlgSFd0/YBiKCbo25Zb0RIvgk8k9osNVSQnQZtCowTMZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661190; c=relaxed/relaxed;
	bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZUIQBn9KGpqrtWx8flp3xaiMFWSLGA0qqiNU2R9e6K+RyfMujuisV18GCquIO+7CIjERiQTxccsHWU/dN/pk+jY9uL5PVW4YVGBRaFMjTXGKHhad47MDGEmH2VPzDUVeNUuFLVJSnk+T7KVX3P60yEt1kyvou3upEXkPNxb4Tb3bsyT5fnh5Au4b1SjzFFipriodLArygJuy2YsqnH45c1+/x0ZxXxXfluVbIYgMOvMQPniu7RYwvO8DN4AcU04E3oOh3TgACCNNMk+LLr/r3QlkN65mJYrkej1whrxso5TxVMzhtga+AJz1aTCgawlDqflqrdnlbj+9JL2duIIaNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AErZQmb7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3w47xaaykdpqoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AErZQmb7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3w47xaaykdpqoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm513jqKz3d7n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:09 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befc5bso1886095a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661188; x=1761265988; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=AErZQmb7J9X//XMAlBlSNorcTxYFOr+gHAGL/z4UA8W9XTizF50KHNkU5kGgwHyLZQ
         tglMhCC90V1n82sEtHtxfVoZ0lNF7rQrLsEEqZvswooM3p60JEwN7SYDwW6cX8twCJRu
         LsaSln9l3in4oSb0AhszVmjKa4Lj1QeDIbNeYcHmC1eZ8THT7Os16lrAWH6yhYDlbpTE
         6iAtlTPzzQfdey9fqbIgFN9zuKxA7BB7DSppo28+soA1HWhSdcUtBVIeOM6Mxo5hleUg
         kHvLLFudB+C3hdleblATh67JQZGYFk/YzSOLc5i3SrLYRRWy1rUfc6aP86NElg1FWAli
         bJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661188; x=1761265988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=S6JWiM/0hMwO5VERMYTET7yqPFacJGDDFq7Wz8L8YnnuxHVXsrYntoHhZkNHK97w2v
         uS52JSx+TFBM8GWUYfm9sD3EAN9V/ZmXumbqEyJJrq0AenUqpeu5WxFT8SR66OxBkaxu
         ElXLq8C7jthjn8LD9ZhCNdJUC5huZ7xkF3A1qhgucTA68xSZ+SV3ett9sUGzgR8EJxX/
         c3YWXfhTFAaqhrzcCyye8X1GvhzXPJEI+l6mXy6Q3LjF2SnPGHZhc0UA5uV6mu2f7dWW
         RhbYs0qzcF3U/BbZj8OJpbm0NocTF1RROhL2JHsRgwVBk4wYe9PyrN+eb6x+53DyloGK
         /oTg==
X-Forwarded-Encrypted: i=1; AJvYcCXOjahAM4OqUd9a3VUpJHQ0sHK1c2M768MfjmZQ2rwq9W+I8pXy/GIkcWeW+MrRRVRmFYnP+/VH26vXbjU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyI+kGqs1WRtV0qRWfF9XQ8ftwCztb410lkRl+2sB5klpwRQw4b
	8zRp8jwiQQR6b8X11QukEKhNnUHbpbayDycdEjhaCA37l1qcr/Vcks2B6PCJDwLQMv7unKT7q+n
	D/IxwbQ==
X-Google-Smtp-Source: AGHT+IFv5wQBYU08VlWSJ3YEyBvWx6CUl5P/6vzeOVA3OyqdlNjTdwYkeUoBdZlGjRBJoj7p6GD6I+E30lo=
X-Received: from pjbnc11.prod.google.com ([2002:a17:90b:37cb:b0:33b:caf7:2442])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8c:b0:32b:a2b9:b200
 with SMTP id 98e67ed59e1d1-33bcf87ab38mr1930441a91.13.1760661187797; Thu, 16
 Oct 2025 17:33:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:29 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
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
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-12-seanjc@google.com>
Subject: [PATCH v3 11/25] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
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
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f5cbcbf4e663..220989a1e085 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1721,8 +1721,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
-	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
+	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
+		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+			return -EIO;
+
 		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
-- 
2.51.0.858.gf9c4a03a3a-goog


