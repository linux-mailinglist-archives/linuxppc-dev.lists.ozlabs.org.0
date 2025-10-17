Return-Path: <linuxppc-dev+bounces-12971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84815BE5EEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm5N658Pz3dTR;
	Fri, 17 Oct 2025 11:33:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661208;
	cv=none; b=X47+yywvLmhDce13jP4a1SDxnZ8Bw29y+FMFucJlhX23ZOj/GYh7YZ29nFostlrjXpuH2VRGDLip0Gp+yqvnYigGXruZYzy9Phf4owJSnlK7CXgy6ZHd8RYqJvF8gUtd6AlKNz8Ll9rIERD12ZNsGWlyi7Ad8sxb9en//q3k22xM3KY6lzaF1kQcynpxM8TkIEDJ8FSCV6VvTyG5g7pUmJx/zUahTavpx+HlnYptiJCXD65dmGjbHYdwyLe+Xnkumyop8R4Hqckx4pTcxHO2rAqnbJMA1OGsfOuBSN5q4jH8f1LNVMj3BiBKr8Xs+hN8g9X0mQLHWqZb15lbMM797Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661208; c=relaxed/relaxed;
	bh=TrLSndNhbvAHaUMTALYaKuYkpgF66qtzwp89j/74SLs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TDYTwZ0kUx+inJkxsHoijfMpZ2nnhy4LDLB5o1hcp8hlDyM9b2PDToZK93QWndoZnZ0gHMxRdzkn0ZvXwYL2BrNxgg7UmsoGuttQ5AJDRmxo0+dUCC1mxUC+383uKSBbpVbmzxe9rsm6pWiWT+MDuZb4wwv7Ks+NWT6TlokKiZMRp99zWTEuMof81BGz7cTxdmvVfXBLN41R9eDRpTAkGQS155dPE3K8nzPi5BL8FXqs3ouIMRFxLNB88TtKwN3rwPGoLDkUT85x5cA6UM/hJ9dAjclkfkQyEu6fgF6PgfM7hL6pM66RVpx2/1ViRCD7+R4aBOo3yH5CiYjVZ3CdCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kFj1yEBh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=31o7xaaykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kFj1yEBh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=31o7xaaykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm5N1tCZz3dTJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:28 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befc08so3129560a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661207; x=1761266007; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TrLSndNhbvAHaUMTALYaKuYkpgF66qtzwp89j/74SLs=;
        b=kFj1yEBhr0RLInxXEhCgcj6NtNpe9y5I8APGem38okMVmDJ83WKD8m6cXMDaAhI38r
         zZV4Z7VVVq0+5/fZ6MG/qQqBl3JqcrDr5W+3PmEhWoEt3gKk+zcYarCMdpB5hl8uybqy
         kpHINVV4NMtaihv6TZBpQrmWPZhxxAc9XyzzFxsLmxMweHs7JHvxmyBHkcMFFPORunzv
         n7ye9JmCutYR3At4FxcYCYVlxgRK8lmc7P4F3c3kMr4EhJnKA8QDgGkEiwCbzLM8dx5R
         r/WFqh3hgNJT4OmSGfYGml/1eNSBmGUo4ccKhXOqs4haANhgyKpFjrz73xt9NJGurARc
         soQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661207; x=1761266007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrLSndNhbvAHaUMTALYaKuYkpgF66qtzwp89j/74SLs=;
        b=BOSpihEjzVBz5NSIskPvt75Rda4u43wGoMXpacdrskrdXgnAwruPgG5ki4yGdY92TI
         ASGiDqauHxYhHHV/FaGXTB9e/sCj647vXmt7MXO94ylFa5b0R5RdINi+zreKS5sTQQUI
         F0tk3r4E3s5EQ9Dt+NtEhshxqn3e+U5s4yYjvRFP2UI6/Rl7MaSa0ATcS90LypolYKCQ
         70ZiDc4ZR/t8ZrPvGsfyEWWYBcP3dGxLRRqqnqRtV6w/2V8MDOe7yUt1NyBYITkUJ4Uo
         +IqwqU/bCwe6IW1hNsWDAnBOGKPUVcphSdu/NWz2gt/YJTdna1ofhKgX6wGg1Q36ScCf
         34Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXPwJlp9DOogdI0s2IYPLs5BmP2CU2p6w7n72bDrI6wpERV97cDL00bsRLx38n/czkK3c1PVfP2YGmOR7k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAu8Wu2/WL7dml/ZD7iaG3bPOoGyix3kOz4Par+0cH9pZoRSvT
	3oxCmMvTPoIkuhkNqTqfmj5JofDwDs8C6c8p2EKEXXnLVRFEmGpKXeL+voxRVAzQ0YV7jjKGMB0
	TBW98/A==
X-Google-Smtp-Source: AGHT+IGBGWUmWwecmhGYPhLl5Rx6FLknwjbhIsKC3ApukPUlzu/2O7CwZGO+y90VWUKWa1HBq+25PhrJvNY=
X-Received: from pjff15.prod.google.com ([2002:a17:90b:562f:b0:33b:51fe:1a76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec8b:b0:330:6d5e:f174
 with SMTP id 98e67ed59e1d1-33bcf8ec602mr1949785a91.20.1760661206685; Thu, 16
 Oct 2025 17:33:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:40 -0700
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
Message-ID: <20251017003244.186495-23-seanjc@google.com>
Subject: [PATCH v3 22/25] KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU to
 "unlocked" vCPU ioctl
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

Handle the KVM_TDX_INIT_MEM_REGION and KVM_TDX_INIT_VCPU vCPU sub-ioctls
in the unlocked variant, i.e. outside of vcpu->mutex, in anticipation of
taking kvm->lock along with all other vCPU mutexes, at which point the
sub-ioctls _must_ start without vcpu->mutex held.

No functional change intended.

Co-developed-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  1 +
 arch/x86/kvm/vmx/main.c            |  9 +++++++
 arch/x86/kvm/vmx/tdx.c             | 42 +++++++++++++++++++++++++-----
 arch/x86/kvm/vmx/x86_ops.h         |  1 +
 arch/x86/kvm/x86.c                 |  7 +++++
 6 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index fdf178443f85..de709fb5bd76 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -128,6 +128,7 @@ KVM_X86_OP(enable_smi_window)
 KVM_X86_OP_OPTIONAL(dev_get_attr)
 KVM_X86_OP_OPTIONAL(mem_enc_ioctl)
 KVM_X86_OP_OPTIONAL(vcpu_mem_enc_ioctl)
+KVM_X86_OP_OPTIONAL(vcpu_mem_enc_unlocked_ioctl)
 KVM_X86_OP_OPTIONAL(mem_enc_register_region)
 KVM_X86_OP_OPTIONAL(mem_enc_unregister_region)
 KVM_X86_OP_OPTIONAL(vm_copy_enc_context_from)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 7e92aebd07e8..fda24da9e4e5 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1914,6 +1914,7 @@ struct kvm_x86_ops {
 	int (*dev_get_attr)(u32 group, u64 attr, u64 *val);
 	int (*mem_enc_ioctl)(struct kvm *kvm, void __user *argp);
 	int (*vcpu_mem_enc_ioctl)(struct kvm_vcpu *vcpu, void __user *argp);
+	int (*vcpu_mem_enc_unlocked_ioctl)(struct kvm_vcpu *vcpu, void __user *argp);
 	int (*mem_enc_register_region)(struct kvm *kvm, struct kvm_enc_region *argp);
 	int (*mem_enc_unregister_region)(struct kvm *kvm, struct kvm_enc_region *argp);
 	int (*vm_copy_enc_context_from)(struct kvm *kvm, unsigned int source_fd);
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 0eb2773b2ae2..a46ccd670785 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -831,6 +831,14 @@ static int vt_vcpu_mem_enc_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	return tdx_vcpu_ioctl(vcpu, argp);
 }
 
+static int vt_vcpu_mem_enc_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
+{
+	if (!is_td_vcpu(vcpu))
+		return -EINVAL;
+
+	return tdx_vcpu_unlocked_ioctl(vcpu, argp);
+}
+
 static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 				     bool is_private)
 {
@@ -1005,6 +1013,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 
 	.mem_enc_ioctl = vt_op_tdx_only(mem_enc_ioctl),
 	.vcpu_mem_enc_ioctl = vt_op_tdx_only(vcpu_mem_enc_ioctl),
+	.vcpu_mem_enc_unlocked_ioctl = vt_op_tdx_only(vcpu_mem_enc_unlocked_ioctl),
 
 	.gmem_max_mapping_level = vt_op_tdx_only(gmem_max_mapping_level)
 };
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d5f810435f34..1de5f17a7989 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3148,6 +3148,42 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	return ret;
 }
 
+int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
+{
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
+	struct kvm_tdx_cmd cmd;
+	int r;
+
+	r = tdx_get_cmd(argp, &cmd);
+	if (r)
+		return r;
+
+	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
+		return -EINVAL;
+
+	if (mutex_lock_killable(&vcpu->mutex))
+		return -EINTR;
+
+	vcpu_load(vcpu);
+
+	switch (cmd.id) {
+	case KVM_TDX_INIT_MEM_REGION:
+		r = tdx_vcpu_init_mem_region(vcpu, &cmd);
+		break;
+	case KVM_TDX_INIT_VCPU:
+		r = tdx_vcpu_init(vcpu, &cmd);
+		break;
+	default:
+		r = -ENOIOCTLCMD;
+		break;
+	}
+
+	vcpu_put(vcpu);
+
+	mutex_unlock(&vcpu->mutex);
+	return r;
+}
+
 int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
@@ -3162,12 +3198,6 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 		return ret;
 
 	switch (cmd.id) {
-	case KVM_TDX_INIT_VCPU:
-		ret = tdx_vcpu_init(vcpu, &cmd);
-		break;
-	case KVM_TDX_INIT_MEM_REGION:
-		ret = tdx_vcpu_init_mem_region(vcpu, &cmd);
-		break;
 	case KVM_TDX_GET_CPUID:
 		ret = tdx_vcpu_get_cpuid(vcpu, &cmd);
 		break;
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index 77613a44cebf..d09abeac2b56 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -148,6 +148,7 @@ int tdx_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr);
 int tdx_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr);
 
 int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp);
+int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp);
 
 void tdx_flush_tlb_current(struct kvm_vcpu *vcpu);
 void tdx_flush_tlb_all(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b85cb213a336..593fccc9cf1c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7243,6 +7243,13 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
 long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
 				  unsigned long arg)
 {
+	struct kvm_vcpu *vcpu = filp->private_data;
+	void __user *argp = (void __user *)arg;
+
+	if (ioctl == KVM_MEMORY_ENCRYPT_OP &&
+	    kvm_x86_ops.vcpu_mem_enc_unlocked_ioctl)
+		return kvm_x86_call(vcpu_mem_enc_unlocked_ioctl)(vcpu, argp);
+
 	return -ENOIOCTLCMD;
 }
 
-- 
2.51.0.858.gf9c4a03a3a-goog


