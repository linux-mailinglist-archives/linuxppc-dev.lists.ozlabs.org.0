Return-Path: <linuxppc-dev+bounces-12970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07439BE5EE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:35:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm5M23Bzz3dSp;
	Fri, 17 Oct 2025 11:33:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661207;
	cv=none; b=JzOCe88qR1jhk6q7MfSvU+Br+y9kCpoGQusvq18IrjPWtpqT+6G6zjGXxeytr0gpIaQdQuQiIP5EcsqDf0W1x6HWsCrz7xw07g1vIvhts6gMvquhTm6lXRY9WNYIbY/FjqT64pc4GjPXyzC0mgH+1DpX7bCmtxm4sI2z6RL5NjvhpfOAzDusx/CZmZGMliPEjeN6A6KX31i2ct2TCziCPwTLK6SXX4CLLrJU+NhBM4mbLNzgvNsrCExNDK2YIu1LYnP4Yn4OOpeeBow4dj6XnIAccn+PkgKWL7dhjCyntQc8fj+9dqJLJVdu/hRBmewUJp9Dc7Zwg5Eflc2fOANrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661207; c=relaxed/relaxed;
	bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gVqKUhPTlwIclYDyUjkXgY2aryak+/7AcK6uhawOAuldmoWOb+c9OP24c2lddeGqroHUWV7YDTi8a5Npvnn+8KQ3IsBiM7E0U3yjvB1CElZdYUDZogd7FRdXOCSENfP1FD/toO8z2+65LJGlxathmYl/jASUwOuZDyF1trOSSV1FSrMVN0Z0TAOvyg1iSgOocOTJuhryKmXz07JSMVcNNF7Bk9PHOvwSNrlVfsQ3epeltKMOyH0dOOTFpbMLULx9Z05sbGtgvumK4l6QPTLkrl4+S4B8tX5vsB6SDJyXHZT+heugfNbeyHPW66f0PLHCDOIRH/PsHWlvYnUEt5MBZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B0zAf9vx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=31i7xaaykdaczlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B0zAf9vx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=31i7xaaykdaczlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm5L4m0Rz3dSg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:26 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1156370a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661205; x=1761266005; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=B0zAf9vx/RTOvpcfnxTepNe5XB0Ci9nI8roXgqsb4CPL325j4tJ42e2skaaa3eJTTB
         fn7Oi66tLtUtItu5Akok/+g1A9vb8PlMzNWKkqufnGep1vYXkY0DCZMuFYOSAYH+7auo
         eSuScbb8hDqNy/aXKP+EqqatCZZoaGS5Cng8wBSYScjMwoxOVQjxzMCRdVCfjxhIXU5m
         buWgL/OVaEDRzcRD5jzVgjNrwy4IO2sFbbSm3ZaZn3AWS8f4S+NMQbY9QFNzuCGjbPE/
         566Qje08coylUOzvtlxdZcM4+w7vAzcKPpSkwpVWnj91xWZr+VdV9Md+h7DAFosdP+2a
         u1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661205; x=1761266005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1uT4yQcba8Ntip8LDR4veCehne/0rON+KC3PlpYlbc=;
        b=jpvf2bhjShbt6558LXQRML/TE2+X3n6ivbHNZ03ymh8YUuwHIrWWF8dgr11zVmE4+J
         soSGzGO2ScPZPRw1G8jTIsDQwKkLghtmcxmU/TzTgf3Yxkb7kC042UCa/YB0a2K44ZMd
         DDlZSm+vMOnmt7FemzqxPlLd4jxuVEDY8mmasIfzYTyEuyZEcb4mst5Z0ddUD86MUB3H
         FYyF/nrTuBV8MScpVRTlJj3y9Vz8062qAyheNJOLnPcAFO4yvJ+AaLFDf5i8Ln/u0Fmb
         D8IMsSXGeLBhvnCoaWcqMxaMDO2nNjia8FyG75hlI05TrQAlJZRmVjsf0BzCfsLVgUrK
         dgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI9GGLJ0Bk4nqJyc+mHJR8Eh4fKF7yc2g5u8wZX7+WDi0d0lWv/YUMQTDfGQKUofEgrOTXEmWez0dVtZo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyZuHWrSXAXvlV0Oe55gKzVj5rvleBopUS/4D9loz/pe3i9fmFp
	BgpiUdK37JP4kTBctuVtEEpYMMliOgg8d5IPZ7Y5P9EXH+z7NzIG89TirNjziLdgYkYw1RTBpSF
	KQayaJw==
X-Google-Smtp-Source: AGHT+IFb3cb9XScIkfIbQA2oQID7nhqxfExRyWF6N5UGcVhE3T71y0SJP1d51io6pNMM6/KZP3XG25y1rx0=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:32e:a549:83e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d8f:b0:335:2eee:19dc
 with SMTP id 98e67ed59e1d1-33bcf8f94b6mr1826093a91.28.1760661204960; Thu, 16
 Oct 2025 17:33:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:39 -0700
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
Message-ID: <20251017003244.186495-22-seanjc@google.com>
Subject: [PATCH v3 21/25] KVM: TDX: Add tdx_get_cmd() helper to get and
 validate sub-ioctl command
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

Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
that must-be-zero fields are indeed zero.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2e2dab89c98f..d5f810435f34 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2761,20 +2761,25 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	return 0;
 }
 
+static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
+{
+	if (copy_from_user(cmd, argp, sizeof(*cmd)))
+		return -EFAULT;
+
+	if (cmd->hw_error)
+		return -EINVAL;
+
+	return 0;
+}
+
 int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 {
 	struct kvm_tdx_cmd tdx_cmd;
 	int r;
 
-	if (copy_from_user(&tdx_cmd, argp, sizeof(struct kvm_tdx_cmd)))
-		return -EFAULT;
-
-	/*
-	 * Userspace should never set hw_error. It is used to fill
-	 * hardware-defined error by the kernel.
-	 */
-	if (tdx_cmd.hw_error)
-		return -EINVAL;
+	r = tdx_get_cmd(argp, &tdx_cmd);
+	if (r)
+		return r;
 
 	mutex_lock(&kvm->lock);
 
@@ -3152,11 +3157,9 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
 
-	if (copy_from_user(&cmd, argp, sizeof(cmd)))
-		return -EFAULT;
-
-	if (cmd.hw_error)
-		return -EINVAL;
+	ret = tdx_get_cmd(argp, &cmd);
+	if (ret)
+		return ret;
 
 	switch (cmd.id) {
 	case KVM_TDX_INIT_VCPU:
-- 
2.51.0.858.gf9c4a03a3a-goog


