Return-Path: <linuxppc-dev+bounces-14011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5DC479AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 16:43:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4v853BqTz2xqj;
	Tue, 11 Nov 2025 02:43:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762789397;
	cv=none; b=MtwrQWjP9Xgio80XsTNniBml++59pbCKzFr+TI+Ii802e9n8zc3qQvCUjHj9pyIl0VxUlrPHrvb//CrtEP4lPU2q/WGf1uZTaW8BU+TY9HX5dKBjP1t52mKXK7t25wCJVfC+3TlbaQO4OTXMktQ48guYESMwNnjIIhATwYA763d1qJAhSjyVuAiK2qyXcaovmbRwsM7kEakKbdL0ecoz/j/3yL0vB+xX0uZyh6qFN1LDAQX+fLbLD5R3p5iZL+NGLficGFjRxoEautat3t5jVXK4fSwl+hfka1apUv2s3hepXwD3T7npVjI7zOY238qeCSyFKB93vgJtJQp44I8jlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762789397; c=relaxed/relaxed;
	bh=87FfliXTeIYU4Ti4q0mlK1AlR2N3oXTPIRkcYWMY8TY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IrpLp7vzDam16ZoTE7X8gq2xJMKsapErAKPFQO9xqN/0DghFIQXTEyaZD7n43yuU545mfwkt1x9iJJaeDr/LFoKqka21J32u3o0f59ld08NDzNtDIW1HIQDyM53IbyFh1+U1KjM0BpvTNW6uPdn9ej/AC6/1UAWsrf0kzY0N4crWofExNcuUSM5JiQNoySS7ogTnUJl1JyAOj5EVB+f3TBMllOdceyha9gu0accfO453XAsBDfMv4GhnU37kdmkMj21O6LZvYd/bj8zJu4hwwvWbobVGsrfOyPUnWU13nU7PkK5+yG1Dmi1pxisbQ3vw8IA7nxrYAMLGoiMYIhVNdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=so2de+zN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3eagsaqykdlcpbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=so2de+zN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3eagsaqykdlcpbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4v835sK6z2xqZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 02:43:14 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33da21394adso3372633a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 07:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762789392; x=1763394192; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=87FfliXTeIYU4Ti4q0mlK1AlR2N3oXTPIRkcYWMY8TY=;
        b=so2de+zNZ3RhnSmfYYIThYJ6NmuNnuLNxYoIYT0PdK0Iqwvt+Z2DlYin05nF6qfySZ
         JSwBY25vQuj2B3JP/XTPh0J8DlnZX8R6okscpmuKcZ/BpXj1gfwdC7yAbN9zDGXogVIr
         mVBzJhHetN2QcaTeVGOEhSUeh2q9tjyurOYo/1yCoDTqBn2Ruu6sEp98ux4LRCjZo5DV
         73xohYPQGKAoTF6angOuZlM5q3jyn36M/aA8df6VGijKeMZRS4AGM/wjV5YFg12JTHYY
         D/LclsLw49TCqDrL0mj3ViCnIwxqNsIV8kGeuf/4r0CeuTiAWGF/4YdlmJhSQyMsTTE4
         aehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789392; x=1763394192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87FfliXTeIYU4Ti4q0mlK1AlR2N3oXTPIRkcYWMY8TY=;
        b=gBxOjTUvId52fvsguHVJfOrkkWIfSaReuseESgtIYVYT/2v8+QUhKrRkXFavPxoS0v
         ZBT6JR8ueKX0FjJm8+q1DLiwE6zjQYxfy2RCtr+092/LMAwc/wb9boQ+SCeR5t7KsRMO
         NQR4uOIfP3u7kijqU64MayNeltNyM06871F8+fUKgcFw4GWMfzOhpBCqlfGOD7HxcyrD
         5wJmJU/FbtNFJozTrGk7CzY5BQhaLXcqh0VSllntkl8OH7T2cyBFEJuEN3l3f9PnrDlM
         yBLnm4GEWFtcllAEX/iVxgj4rRNGG3F4TtiCc/Q+9sEPCxPFK19B2yJx+MqURES9OYrh
         fNsw==
X-Forwarded-Encrypted: i=1; AJvYcCUmGjRXPc6ei2bjDdjKJ+zTzk/jadphyJsecFlJC+ojIJ4VmlMbmEGwE97zdwPTFSyo8h0PBG4pDp+ZBos=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8VcWivDfVZykzFjfMAR2ho8byibpz3osh/8yr0uQMUyUuzzbC
	dDC55voW4Iru38YsygA/A66X9XLHCI+hQeVgCud1GPGg77z9s/VhggNcS71W6Z7vgYWEq1NP1BK
	jhJt5fw==
X-Google-Smtp-Source: AGHT+IGU2QqcHJOpKVyUh8wnC6DXg/rmfR5MmGRMoX3raYINDU0h+4Ytj4+FRCcbgxWr/CiKwQo1uRnxIsY=
X-Received: from pjbdw16.prod.google.com ([2002:a17:90b:950:b0:343:6849:31ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a10:b0:341:124f:474f
 with SMTP id 98e67ed59e1d1-3436cd0c3e9mr10428985a91.32.1762789392114; Mon, 10
 Nov 2025 07:43:12 -0800 (PST)
Date: Mon, 10 Nov 2025 07:37:29 -0800
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
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <176278827443.918905.17609380057567446021.b4-ty@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 30 Oct 2025 13:09:23 -0700, Sean Christopherson wrote:
> Non-x86 folks, as with v3, patches 1 and 2 are likely the only thing of
> interest here.  They make kvm_arch_vcpu_async_ioctl() mandatory and then
> rename it to kvm_arch_vcpu_unlocked_ioctl().
> 
> As for the x86 side...
> 
> Clean up the TDX post-populate paths (and many tangentially related paths) to
> address locking issues between gmem and TDX's post-populate hook[*], and
> within KVM itself (KVM doesn't ensure full mutual exclusivity between paths
> that for all intents and purposes the TDX-Module requires to be serialized).
> 
> [...]

Applied to kvm-x86 tdx, with fixups for the various typos.  Thanks for all the
reviews and testing!

Other KVM arch maintainers, please holler if you want a stable tag for the
kvm_arch_vcpu_async_ioctl() changes (they're based directly on v6.18-rc4).

[01/28] KVM: Make support for kvm_arch_vcpu_async_ioctl() mandatory
        https://github.com/kvm-x86/linux/commit/0a0da3f92118
[02/28] KVM: Rename kvm_arch_vcpu_async_ioctl() to kvm_arch_vcpu_unlocked_ioctl()
        https://github.com/kvm-x86/linux/commit/50efc2340a59
[03/28] KVM: TDX: Drop PROVE_MMU=y sanity check on to-be-populated mappings
        https://github.com/kvm-x86/linux/commit/5294a4b93e07
[04/28] KVM: x86/mmu: Add dedicated API to map guest_memfd pfn into TDP MMU
        https://github.com/kvm-x86/linux/commit/3ab3283dbb2c
[05/28] KVM: x86/mmu: WARN if KVM attempts to map into an invalid TDP MMU root
        https://github.com/kvm-x86/linux/commit/c1f173fb3389
[06/28] Revert "KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"
        https://github.com/kvm-x86/linux/commit/fe7413e39810
[07/28] KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
        https://github.com/kvm-x86/linux/commit/6de2fb089bb2
[08/28] KVM: TDX: Drop superfluous page pinning in S-EPT management
        https://github.com/kvm-x86/linux/commit/ce7b5695397b
[09/28] KVM: TDX: Return -EIO, not -EINVAL, on a KVM_BUG_ON() condition
        https://github.com/kvm-x86/linux/commit/e6348c90dda9
[10/28] KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
        https://github.com/kvm-x86/linux/commit/b836503300dc
[11/28] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
        https://github.com/kvm-x86/linux/commit/7139c8606505
[12/28] KVM: TDX: WARN if mirror SPTE doesn't have full RWX when creating S-EPT mapping
        https://github.com/kvm-x86/linux/commit/b9d5cf6de0b6
[13/28] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
        https://github.com/kvm-x86/linux/commit/24adff397052
[14/28] KVM: TDX: Use atomic64_dec_return() instead of a poor equivalent
        https://github.com/kvm-x86/linux/commit/af96d5452e5e
[15/28] KVM: TDX: Fold tdx_mem_page_record_premap_cnt() into its sole caller
        https://github.com/kvm-x86/linux/commit/b4b2b6eda5af
[16/28] KVM: TDX: ADD pages to the TD image while populating mirror EPT entries
        https://github.com/kvm-x86/linux/commit/6b5b71ffabf9
[17/28] KVM: TDX: Fold tdx_sept_zap_private_spte() into tdx_sept_remove_private_spte()
        https://github.com/kvm-x86/linux/commit/14c9938619be
[18/28] KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error() into TDX_BUG_ON()
        https://github.com/kvm-x86/linux/commit/597d7068702f
[19/28] KVM: TDX: Derive error argument names from the local variable names
        https://github.com/kvm-x86/linux/commit/55560b6be5bc
[20/28] KVM: TDX: Assert that mmu_lock is held for write when removing S-EPT entries
        https://github.com/kvm-x86/linux/commit/2ff14116982c
[21/28] KVM: TDX: Add macro to retry SEAMCALLs when forcing vCPUs out of guest
        https://github.com/kvm-x86/linux/commit/3d626ce5a8cc
[22/28] KVM: TDX: Add tdx_get_cmd() helper to get and validate sub-ioctl command
        https://github.com/kvm-x86/linux/commit/59d5c1ed6df2
[23/28] KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU to "unlocked" vCPU ioctl
        https://github.com/kvm-x86/linux/commit/94428e3ba325
[24/28] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
        https://github.com/kvm-x86/linux/commit/0b76e827b29d
[25/28] KVM: TDX: Don't copy "cmd" back to userspace for KVM_TDX_CAPABILITIES
        https://github.com/kvm-x86/linux/commit/f26061fe2c25
[26/28] KVM: TDX: Guard VM state transitions with "all" the locks
        https://github.com/kvm-x86/linux/commit/15945e9ec195
[27/28] KVM: TDX: Bug the VM if extending the initial measurement fails
        https://github.com/kvm-x86/linux/commit/ad44aa4c5d3f
[28/28] KVM: TDX: Fix list_add corruption during vcpu_load()
        https://github.com/kvm-x86/linux/commit/1e3a825c9ec9

--
https://github.com/kvm-x86/linux/tree/next

