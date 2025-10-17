Return-Path: <linuxppc-dev+bounces-12972-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0ACBE5EF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm5Q561rz3dV3;
	Fri, 17 Oct 2025 11:33:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661210;
	cv=none; b=kVbmA15CTu9fgA38G+L8KA9/jK298hLAASp5jRUwQWqGTUMF2mLeyaFfL0dRwvu38sZwJQRdWd407TXkmA5XHu72R6a8GiBkCJmxie7CiljtVsF5b6DkkurKqOdYRwwf6qj9A8gdqIE2lwqtTEZkGBDUstQhwRlhfgxlcPb+6zzcm+CCYvBk6RT6Kb2VG24j558Q8/mSUbz/HahlKuXvGAgGAuRHvB65oNssadOvfepZzP+pHhLMSucDd2ZUMiqRyn+XZHI3xs6aFZ1Rho7xH9a1FeTBA73zQS6A1fAX/AyVSfjUYaLc/bjVDf8qd/QQXqjERXSUT/Qmk7g3kKHCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661210; c=relaxed/relaxed;
	bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T9lqDQMtEY/QGcVxI+XcQxTvD0OMVuhf3Nhi42g/aWCx1U0WDCSkDmV22zgY2QcFmPA/nUpz7XUy0WuVoFfP6b56Vgwcf66bnhGCzdvHnNcX063J4KjwShlQjRIwpiU6iLcn6Rs+fdXeJLvUO5OX4w9QAtxducAsWMXwAVaazE2YO54PKpT/cSK8GjLSf5ecjt3hN367CzJzBsi1GivKcF7ujeMCcbk6KQ+cPHw0VZjoetoCy0Fl3VaEW1Qr6pIcQ9xgJJl3WhgTXtI8jE1OA1UG/uOjlTMmgVyDSk7L4fJx4i4dInwdfLcdY94kS4Q3SKYWWF97Sv6X4DRevvD2gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A+D3sQ5B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=32i7xaaykdas3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A+D3sQ5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=32i7xaaykdas3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm5Q0jdyz3dTJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:30 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1124882a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661208; x=1761266008; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=A+D3sQ5BXGziR02Wra7MHahm2hT52LgLzKpYvwiGs/LQSkRzauzSwLv3nFreS9K5c9
         Zu/eEo/kTCtRETPpVX0VNOZSoVgqOyMzwZGts+88oKjMApkhBPgbpYPNaujHSBjhWp4I
         cThkgRgG3XUeX1jW9V4NlQIcC7rF9Y/0M3pgHLbO/0kGAk4e8uANoqQA/C9Ecms+1iqq
         S2xJo8fMvkyL2klTFDG6c/ZY0uhJzdQsI51WMaDuIAfE3yJzQTf8wcljvLt9UpUHlYM7
         d94wVrUdDyNLzPlNhhnExd4cmwzBtUwsJwOkRguPTMbom/j8AXhp8ecOS6ynLvx4Vvjh
         4aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661208; x=1761266008;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt3hJyWBrmkcLCPNC82mbSgwC8RUxvI14lDVp9rMNK8=;
        b=kp4ZfecofqTp/UrTKxptIfoBmbDqVTDxquhDBDrpw3Ay+dINsuanbRMrACfCGkmXxq
         HkEryhbTGQILDhhHu5gm1hxAy3ELK3Vqe2ZdRs9qZy3xV3UCbdjLdFEU/ZF2CYmERD3Z
         Eae9r23AkAer3w8mIqYeVYyfq+BOiOxwWrF7EkdTylXT/U07iztYsF35zJXOOxYZO4ZO
         gSMG1zgvJdyqZLsV+4TUwBltUEl7J6KX+uk3Nwye3vhQvmftgzEdXavNEJcf7y1heh94
         iWyquTaZh8+Drc28nKXBjGmW/ARtt8fRS9Q76GAXht2nrJ8X9n2F1aTfy5ra8aek4J3D
         mA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGRrkO6BfVMMOtiiKcPIFfYv1l9c5mGA3Gg13pOp5B/4XYbBhZOlB1xxcVG5Cg4XRqZXOPywbywecRTmc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxzqzLtM/Vw9vYUsnb8X0pGonKSJDqt8UbNJYaVD3/B9cZYRiL
	DJj4IUafj8lAKv/bDSWJXy4g95hqVxe8yzZ0iiSOGg90qUmPvpth4eg8DdKbE84rrjRkQUGYIcH
	fTcPrXA==
X-Google-Smtp-Source: AGHT+IHg17I+MrCPzq5TEoO4O1fEv/5Rea+bFeeHOFAKW3+uW2v4jsY6m0H6q4wWDO+YA+zfXcJHtbyRmvo=
X-Received: from pjot19.prod.google.com ([2002:a17:90a:9513:b0:323:25d2:22db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38c7:b0:335:2747:a9b3
 with SMTP id 98e67ed59e1d1-33bcf90e717mr1807890a91.32.1760661208480; Thu, 16
 Oct 2025 17:33:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:41 -0700
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
Message-ID: <20251017003244.186495-24-seanjc@google.com>
Subject: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
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

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1de5f17a7989..84b5fe654c99 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2781,7 +2781,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2794,15 +2794,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
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
2.51.0.858.gf9c4a03a3a-goog


