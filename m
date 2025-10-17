Return-Path: <linuxppc-dev+bounces-12957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AF4BE5E8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm4w5jhkz3cns;
	Fri, 17 Oct 2025 11:33:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661184;
	cv=none; b=HEhz/rALUpN7FsuaabpbQQ1XqbZYJYB9TGDVU+BOa9wRpiRgUfPQx19mGlooje4LNNSdHdfM0uRyX9f/hRLxuBN3WfrnjKMovJBwp85H060l8jxYhGZofzi2TcW/y+eM0iZVUNOCenjP/3tUHG3UAqP6UjTvWyTH6Jui9xaEF5hylaB3cGpOnA2xTbO/KAd8vHciWGaybf3OdrqAMvRf3sZZwxbSwQ5kv6cQ6gG2+7Gj4XK5kMK25DvhH++zzb631A9rJMS2j/b6/gXDlmh+Ih58ExisiJqV3L+48fGliI4xZyv1fcMX2dMiqmO4K0v5qymmtZPx4IDoCfEU3j6PLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661184; c=relaxed/relaxed;
	bh=EknCUbF2LHWm0fNDNjp+CKNXYZwTUTGxAjt6VludIpM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dse+fX11qnvvZJRP7Hz0lmkicBS6SJw8TtPW/mR5K4A5j4IOS9WNuwcv8Rtgv7CGhbolV0g27HAxiVunLBZn+Ldp8kISKIr0ZZ9uTTLalhon9GBM/YbW/6QNJA+6bTds5rnLjtEM6NfJdmoc5tlzi437/R89GrWRP4hTfnh3yfm93Knle+BC5Ktp9KRomVkHh/T3umCQxo40EsWsSTGemSn3y20cKazhrkGCmvizuS3LEOwVKtLvr3vmrsSHhRtYUH3Ivn+P++LLUSaq9rEpniJuUgLIECf2nJTrmLv8Pkc86d/lBpJdEr1si4SAKXvmUcKMTJeEEwZchmr2GYiKbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TCnGGgms; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3vo7xaaykdo8jvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TCnGGgms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3vo7xaaykdo8jvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm4w1Spsz3cnc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:04 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so2396285a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661183; x=1761265983; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EknCUbF2LHWm0fNDNjp+CKNXYZwTUTGxAjt6VludIpM=;
        b=TCnGGgmsdGJe/7KoGJVTf5Z2UwEBOjC+MqhX0ebf3Ip57XFsKztGYmB0F8/9uilx/r
         snYWWOMPPZep3RWL4uSfTL/w9fnfQvJfSLmH5ZD5OvANZsUbuZkLr1ec0sZACiZvVF1H
         kr4yfstOASDHHxSY4rpOZkHRFSOqPLyMZ1V5KR5Yq/ddGunNQVL15iM1aFkAaZKYQsKQ
         tP1RoJoY/xCjMIj6K/Wo/DbDib2T0KAUipbVAfx7ugTdRkC09y+k20ZgNZXXuf5pNAuz
         UTtAjAokrqIphPqYKp9hYk7CE6pbI3T+orCk+eMHk0+qvieHuNCKfu/JyOvKvJ5jPwbY
         HV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661183; x=1761265983;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EknCUbF2LHWm0fNDNjp+CKNXYZwTUTGxAjt6VludIpM=;
        b=gz3I5dZKxw/VLuh4h46nqk6R/efTtVY5/uCQ5tcIKMMS1ICE6oXLyj5Ki8WE6UGUKz
         CBC3Yu3/y6lbbKQehyPy7AG0zw8wTooWw24rj3bZPMieK6FtIKtp7QABn2Hc/wmOvz8o
         v2anFqTBMScabFxGlbaz/lVdMwlv9Okwmvwg7hohmy5IW3fOBoOmnWWVOHHOPmygfa9s
         8NZOa21VssEFFLP8hHHH350Fje+dH3OpO36cXEhtwnTJzXjZBn/LL4+u7aYAA+nYs3mL
         IF2dS903/zbQ7zteycHAMcw5pTkwcwBDkrm73X4gi3877jLjG/IUCJyj2uqcxJS0DGY+
         2P4A==
X-Forwarded-Encrypted: i=1; AJvYcCWYq34ncfyfEwI1pU0ebfAQAIHjn12kCAz5BDYGm1F9E0n7IxvMtgjkLQYrM4a1ohql/6jwHpor/8N6yDg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnxYN8GwnEUBB64fLbxA2qkcPR86ZF0afw0zNYLF7BcsiSCH4C
	7LYyugz2Oe5nyYRkWuzPHUoC/gZbu7BGIsNzJPo5VQhCmVZqVR/s4+iN6XFaAHH+mx58PKNY+/m
	4iNX37Q==
X-Google-Smtp-Source: AGHT+IHp0VFuMyv8iYOF0K3G5i6Db3pbnaDLGLxvBIGhE/qWOYmJanCMeHz3uAv5TWFd0pF3pAUnMoqPNCg=
X-Received: from pjuy20.prod.google.com ([2002:a17:90a:d714:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44c:b0:336:9dcf:ed14
 with SMTP id 98e67ed59e1d1-33bcf8e3b0emr1878293a91.23.1760661182616; Thu, 16
 Oct 2025 17:33:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:26 -0700
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
Message-ID: <20251017003244.186495-9-seanjc@google.com>
Subject: [PATCH v3 08/25] KVM: TDX: Return -EIO, not -EINVAL, on a
 KVM_BUG_ON() condition
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

Return -EIO when a KVM_BUG_ON() is tripped, as KVM's ABI is to return -EIO
when a VM has been killed due to a KVM bug, not -EINVAL.  Note, many (all?)
of the affected paths never propagate the error code to userspace, i.e.
this is about internal consistency more than anything else.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c3bae6b96dc4..c242d73b6a7b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1621,7 +1621,7 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
 	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
 	atomic64_inc(&kvm_tdx->nr_premapped);
@@ -1635,7 +1635,7 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
@@ -1658,10 +1658,10 @@ static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	if (KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * When zapping private page, write lock is held. So no race condition
@@ -1846,7 +1846,7 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	 * and slot move/deletion.
 	 */
 	if (KVM_BUG_ON(is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * The HKID assigned to this TD was already freed and cache was
@@ -1867,7 +1867,7 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * there can't be anything populated in the private EPT.
 	 */
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
-- 
2.51.0.858.gf9c4a03a3a-goog


