Return-Path: <linuxppc-dev+bounces-13587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 851ECC22257
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFbX6zwWz3dx0;
	Fri, 31 Oct 2025 07:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855032;
	cv=none; b=U5zMfK2ijVNHM/mp98nvx+zh9PihZesQLZStRzHYpZPVEtdXYvaODoLvW5Mb3k8a1ZvxgHrDwZRHQiLdVT9bFKk07LzMsyK/d7UMltxLvJnXlr9sar69XkUMK8YekygLJyFgLyJb8RN+cMGHQIEdaOKkHCM/0PApiei5uZ3MgVs/wgxTZojDAuakVQ5UqcUm3bWkvYMzWanMPt7iKVFVDAdrjPqTHO7EuwUVIY0tYzgzmV2o+a7WsXjR5un2sQ9VauhOsN7kZHV0tzls8BHe+ISnrnBj6WAWyjoy6AEmEZCI+74PQPw2sNZ7F1kRhJbipBc7+ZRvawfmd7fCEMxUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855032; c=relaxed/relaxed;
	bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PzUU9hQbn44P/yElbA0UQTWbpngYzkU87qB8CYgS9a4+s2j6ZJKPFTjAJKLyhMmm5R0Oygok6AVNH2XtHpSJu1XT4LJhxj5DnhZrLnHEm0ybAa+4+Z2YNmVelmW6liCkAyFAqR8KgzSUHU5TpxU4KwFx2nLQJBnOJn6GpoUo8XNostDkIeKl9i/q1zA6C3XmWYfWxtiNSofgdbAkmALfUtxKvo9CsC3ZGzOZOiRW09SG8/6uuBF0BsDQnJFOJ/EUjmW/jZXNuG893KsNu6Gg/t7zkC9RwPAuDDjNna1ns7+sXn5qtoEPNvFTnRlL1el62RftgPPoo+Bq7TJ7TrpWog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=h43I+7EF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3nsydaqykdcepb7kg9dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=h43I+7EF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3nsydaqykdcepb7kg9dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbX1jKRz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:32 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3405e02ff45so1132798a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855031; x=1762459831; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=h43I+7EFSVaqyEF+PILVbmokfQFaOQpt/BoeIp1s9qWpR0nq/n93Ih+GZcggsYy5o/
         NpV2/+ckAgOJ3RmjF9qlz8rQ8kZ0Z2ekq5kHs8f4HllyWzftTq9WS7Qo4eUN/5UzierB
         G2K/1SsHEDHZ4nKx4zh6eeVVlUrMyRyk2gHN4FEEbQAqCB+cv/3IRdpUdpCCj3eGtSNd
         PzbDO6ulN7qA17Uwq1DdovfSqF9B1rqI0y2Wm6y812ktz6sUlis745AfNWOnIMlSRaB4
         /9IG+NkjoZVqBizPxApKqRzIdggKhNwVp7+JxahW2SFngsOYJ8PKEdlQ2H5IeE71Hzlo
         PBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855031; x=1762459831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=CLPVF0bgu9I1U3lneo0HQli3yTuuFU06hgDQOlWtThhGmjrUikS7kVydLhl+EWWqh1
         riUY981ayRU5Yu5Qyj3vYGMg62Wig15C+DzrVHJ7IGwNExsCewUESBYGeRQcf9rOUTq6
         4i4RXVG7+xCxQvaz6HVEmCv15Dkz4HPYcLNi2JRakRUuonX/whCckaOkDW7/iIrcK9ON
         OagtobsX1W7ScjeqZtvT0oLf6AWmQPvWHaIEaknatb6lh+ZsKzNt09EA5oSqDwIEdUty
         0lDpvUOLCUoq1UxXoyspXNxNsJRA5zNju/zpl11goqpCpv2OisYdDUPXuV2A29lhvvok
         8fbg==
X-Forwarded-Encrypted: i=1; AJvYcCXc0JPqdxvnEHx529ZJa4BMtoyPjXhwysu3l9Gr9syXTdO6TxOrJ9j3fnavQp4zsp4enD3r0cKmkLxWnLI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxvl8tmRbXd3upmlITB6lLF+E4cd311zWy6je49OACBRbMZEAAs
	l86LVcZJYQ62QoXQV7zCLzL6iyQc5JskCEmdXhtApu6X3ZtpfzHP7suV5ZH1guU157hdxRdCva4
	0rM4w/w==
X-Google-Smtp-Source: AGHT+IFHot6p8Ozw6sPTCEifBtpuZu56mTW8C+szZfak/MuPqOINRZqkxHegGZo0IYVURE2JpMgMqwrtO2U=
X-Received: from pjvl22.prod.google.com ([2002:a17:90a:dd96:b0:340:6aca:917f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d92:b0:340:5c38:3a56
 with SMTP id 98e67ed59e1d1-340830a3a7cmr1392650a91.37.1761855030672; Thu, 30
 Oct 2025 13:10:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:36 -0700
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
Message-ID: <20251030200951.3402865-14-seanjc@google.com>
Subject: [PATCH v4 13/28] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
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

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 658e0407eb21..db64a9e8c6a5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1725,8 +1725,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
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
2.51.1.930.gacf6e81ea2-goog


