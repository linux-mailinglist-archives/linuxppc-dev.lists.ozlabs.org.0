Return-Path: <linuxppc-dev+bounces-13596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E9C2227B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:13:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFc05z3fz3fCk;
	Fri, 31 Oct 2025 07:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855056;
	cv=none; b=P3TXKDayHBaPlTo4zr5Fh70P9PLv135qKGSALSjOcm4zZOURqoPm0MI8W78/tZ6gmbkDisFGCFRtOO6bKsJqX4uGCL7NZh4ufopQQXHe5gkHvjZRhbNQLNQxc7CrB8Yp7NAYjGEPA2y4a/E8iCBwwNliAFAhT1Y0e4BLvg5xyJOO7n/bYhBGaxlCfwvjqseCkHGflrfRoMz2YaO+N7Tm/CJ4X945o+IMH474LNqhMzNFclpmNaY216PFMCS3chjxe7pOAO+ZFg7feRTYiJbb714Ie9H36Zk39tsEmOe6Cq8VsExdZOkErMeckSLsy40jYIx89+yswQd8y0EVYaDiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855056; c=relaxed/relaxed;
	bh=HfwppzbkJFTqc1oDUhl9YAWd2H/Ydo3ViOcPjYsyqPw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j5Q1bCnaF/qPCHGY7GEQ89LY/BY2hPLYbBtrI3WeGNXEDPpmbaLDa4msAbO1Ji1dHKBKvZM0fv6ja2ScEsLpPUX9yyw8MFYFu0+7JVks+nMBTz4t667JDnmeOiNCDctJSe72lTDb9FbgkSaE8272flmCdY36l0gINiDN/9j2cLW231rrDGNx9jjd3o3oG4EU6Ij1N9DcNdgGPU8mg1GWrex0VUV4QEkz+ea/Zg7tzJ/jVKiiiRf4YCCqybok5Jazyxi2OFKu5XmBa+oKdxlvhaxZKW1SWpzRFTPZMRgyWMrZn5M+tKo/GF5DmpZqrc4uSxpWFYG5xN6gIfccBOe0ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4dzG8lpE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3tsydaqykddknzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4dzG8lpE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3tsydaqykddknzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFc01mTKz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:56 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33d75897745so3866575a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855055; x=1762459855; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HfwppzbkJFTqc1oDUhl9YAWd2H/Ydo3ViOcPjYsyqPw=;
        b=4dzG8lpEY8jHN3XlOYBu0NNRE28LrpCrmHUz6TRPIcWcUpw566BEjRE8D/sqi+lAMX
         X9iFwKrax7ipihhEw6qa0KBDd1gOqj2UH03kGdhnDG6YdNHktZgrz3AGZa0OiV1NzYOi
         01Y4CXcIx52VR8I4VkhmgKvIXa4NqiSeebcrCWOWVQ820st7zAdBC7VvXwjbaizDb4TF
         GxX8yxiv3QWuVYfFRLLbTadggTDEpsI4UJNecy2BdTy5QJv8bmMAEP1cD0F4DfzYc3bp
         5sa7EaBBDIVVnjNXQTZFJwuBOZvu01eC5qMwy9rVez+ZLU/2gxxshIHgR3/m7gG5qfdd
         WhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855055; x=1762459855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfwppzbkJFTqc1oDUhl9YAWd2H/Ydo3ViOcPjYsyqPw=;
        b=IyURTB3W+brfXLC2Qp0ver+w7aDBGcFG4wcOMKfpk+qRqINLzTwmkl6Nkg4xd8WsNC
         G2+Zd6oH92jE9ModMKWh3jYdbojlk7/QTgkA35OR7HH+tfgIMBWrRGVJPAUiTH2udpx6
         p+xRdU0Dlkay2AAiYR0huViLls2oZp63K7EmbMLgYXf/z196DB5ftSUHiW50/FDgbxp4
         nFWLxxKh1ySB8K5ZEcAi2egJJ/hU1K4nPSStLeUHtTA3mdz/PUCC4fxrRnVnbae480Xp
         9AS3Y3INfQ1cQ7rbnrPzmbkJHfV9HmzZXicg5+lHuLyG4HvX6drCx/wPiWI1wg1G8TxE
         B9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU8EaH4FWMJYooxIqEBe71IBYEQUjoUQoRSal8GOc4DxTKVulqDsjp5JIWdRamtm+lG7NO8Wm1I7RwIMdc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/6hoyEvN3kOnyKfL3HmXwD2ssozP2H8FBgNcMvmzKZu0TXtMn
	UGOw6mZLcO8CucbT+WkryZ1++GhIOCFfiSPOV9Agc1UI/mb01SEX4JWKlN1A/jgzTR5ovFb2LPQ
	9L+UDHA==
X-Google-Smtp-Source: AGHT+IFgv0+NgL48Cma0Y79QUzd7lRP+/FCxQ0tZkUpinDRTeLAklkWHALMXu+tHUB2W7Y9sxKQZz0IMk4g=
X-Received: from pjbbt9.prod.google.com ([2002:a17:90a:f009:b0:340:7770:2e30])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f82:b0:32e:a5ae:d00
 with SMTP id 98e67ed59e1d1-34082fc7b43mr1201499a91.13.1761855054620; Thu, 30
 Oct 2025 13:10:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:45 -0700
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
Message-ID: <20251030200951.3402865-23-seanjc@google.com>
Subject: [PATCH v4 22/28] KVM: TDX: Add tdx_get_cmd() helper to get and
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a helper to copy a kvm_tdx_cmd structure from userspace and verify
that must-be-zero fields are indeed zero.

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 97632fc6b520..390c934562c1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2782,20 +2782,29 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	return 0;
 }
 
+static int tdx_get_cmd(void __user *argp, struct kvm_tdx_cmd *cmd)
+{
+	if (copy_from_user(cmd, argp, sizeof(*cmd)))
+		return -EFAULT;
+
+	/*
+	 * Userspace should never set hw_error.  KVM writes hw_error to report
+	 * hardware-defined error back to userspace.
+	 */
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
 
@@ -3171,11 +3180,9 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
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
2.51.1.930.gacf6e81ea2-goog


