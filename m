Return-Path: <linuxppc-dev+bounces-12952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85162BE5E76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm4l6KyGz3cg1;
	Fri, 17 Oct 2025 11:32:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661175;
	cv=none; b=UkxQYRr+eJp1H/+Mhpr7HSAE3zJ24hTIZykWRWG26J40n23SDc9dySG2KMeTW1Ye5+6tvBPSGsIk+KwQMNbMEbXz4vAoYaykyngtWBpMP+SWd9jgm3VWa2u5w4LZRQ1cIjuKve0B+C+F25CvXjapmuxikTnV6pw4i0fXDx6Zm2e0Toz+Kg56ephvmg/hrppctA51QEtFlPYohvhxUklH6DOGKm0lfgWnu4pMEEvtOYtOaf3NY8w2NMsdrqRY7OjrQhsdmHZsLFzH1jWCcSiO/oCYbRYH6t2ukDXSw0ZXTpvseIcx/jF4Mff6qMkxlapcQ90Knv5HNCFm3B/fd+VjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661175; c=relaxed/relaxed;
	bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j1QIPZT/tr3pEHVGBYUrW16k89fGroE5Mpl3TCSn4l0a/EITFbBLkpXak2b+iPTEJtU1h31ACdTHWCKXyaRionbde2yn6Ikw3VOF0f2mielMhavwYMi5CWNzkx4q35DuNut1SoftluNqj5KU6KUu0ZLIwGXiJ0FXswqF9LGOCFWJWt2rJONIh9+xsWdlKi/zfi+7fRtwwLE5bb698MkBBGmeIv30RDsmpvmQetPCV/0ZDGHGRE2V1V7x5p1K8gA+P1xj1AAKb0FV0i4XC2qo59KBCaD2TBK5haEnhXzUDnu0ASu/i0wkWC5+hMxJVVcN085kHlmsoDyuYVmwt0mWlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FKuV8P29; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ty7xaaykdoyamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FKuV8P29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ty7xaaykdoyamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm4l1wp6z3cfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:32:55 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-336b646768eso1548151a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661174; x=1761265974; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=;
        b=FKuV8P29IyYAQOTMEE9tMsT4sFy1QbRlWi5a2OEvyaaZtGTz3kVuurxeUIfcBC3QRQ
         /o4Q+XiwDMavGMFSgRoq4W0LA5kDJGKKDzx6q9J3ifoNoghTAfa8QlinFoSH4jlJBwMO
         wBh8R2k3/c5yCkUBf14gMtRgr1uhDngqWz19szlf5oopfyQH7TwVzp+q07xf4cHfxjhC
         sqH995y9hJ3wKyadCZye8RNV92pZc91r2Y37BDJbLF+W4mmomOgucOZUBvhDr+Wt3R6b
         T5DZuDALAm+dsR+I6LI4IQdq0ODoPsrXO7KnOrF/t89jpd3bLftihnUqApn40/BfkQxK
         1r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661174; x=1761265974;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=;
        b=kYQHIr7P8FExEt8tIsuishECcr0CI5OAmmh3bfO2kyF+oT3Mw1PmR7+A88eh4iuNFB
         5N/TKO1utlTYsEOlB54j4ZVB2pAFRe5SB1JP+CgdqTMItZrdcBbHGDuDzPj16k/HbR5G
         xowRbxngqDbMwmEGuOnBbbuj+GDZFYqG3p8wlGPB2LbcoGpljDbJ6Q8PNCSNkf+h0RVG
         J+JvmE9RfoxJmuPLLaiO00v8ALVwfvEcpBt1zaTf1q4CN8CnCxPbuHI8sca0npC397xu
         K5YzzUgg4qdsXvgz2ltPyDPvmxdgejtlEJH4rPsn4+ghgG7Y6oTNaoR4FIN0rRGmF3ea
         vNOw==
X-Forwarded-Encrypted: i=1; AJvYcCUHlkeNkdZRsH54jcQHAzPJZRolaZlR1gjxWSJ/iqBVhd5FEa0Pdj0IgUGx9DmaMLDWbwKHB/qqD5bk/hw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyk0LEiHdcS5JFxYeF2qHNYk2x69b6ooEFxu7A0dzOjC8RotH5B
	pd02tRTxQnOmVGB3A6rp5m8x0xj9o3YVIWzXp1sOQ7zJsZX86lQkkbofGC6xTC+kCOKxSU9bAVV
	2tg7JAQ==
X-Google-Smtp-Source: AGHT+IGBsD40M1TCHpceHuTvrzQu31EsWCpow7sShvAnQiEKP0H9VSo9B6k/+Ftt8wsphMd8FgX3xhZLFrA=
X-Received: from pjop7.prod.google.com ([2002:a17:90a:9307:b0:33b:aa58:175c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fd0:b0:32d:601d:f718
 with SMTP id 98e67ed59e1d1-33bcf8f9c16mr1675095a91.31.1760661173675; Thu, 16
 Oct 2025 17:32:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:21 -0700
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
Message-ID: <20251017003244.186495-4-seanjc@google.com>
Subject: [PATCH v3 03/25] KVM: TDX: Drop PROVE_MMU=y sanity check on
 to-be-populated mappings
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

Drop TDX's sanity check that a mirror EPT mapping isn't zapped between
creating said mapping and doing TDH.MEM.PAGE.ADD, as the check is
simultaneously superfluous and incomplete.  Per commit 2608f1057601
("KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"), the
justification for introducing kvm_tdp_mmu_gpa_is_mapped() was to check
that the target gfn was pre-populated, with a link that points to this
snippet:

 : > One small question:
 : >
 : > What if the memory region passed to KVM_TDX_INIT_MEM_REGION hasn't been pre-
 : > populated?  If we want to make KVM_TDX_INIT_MEM_REGION work with these regions,
 : > then we still need to do the real map.  Or we can make KVM_TDX_INIT_MEM_REGION
 : > return error when it finds the region hasn't been pre-populated?
 :
 : Return an error.  I don't love the idea of bleeding so many TDX details into
 : userspace, but I'm pretty sure that ship sailed a long, long time ago.

But that justification makes little sense for the final code, as the check
on nr_premapped after TDH.MEM.PAGE.ADD will detect and return an error if
KVM attempted to zap a S-EPT entry (tdx_sept_zap_private_spte() will fail
on TDH.MEM.RANGE.BLOCK due lack of a valid S-EPT entry).  And as evidenced
by the "is mapped?" code being guarded with CONFIG_KVM_PROVE_MMU=y, KVM is
NOT relying on the check for general correctness.

The sanity check is also incomplete in the sense that mmu_lock is dropped
between the check and TDH.MEM.PAGE.ADD, i.e. will only detect KVM bugs that
zap SPTEs in a very specific window (note, this also applies to the check
on nr_premapped).

Removing the sanity check will allow removing kvm_tdp_mmu_gpa_is_mapped(),
which has no business being exposed to vendor code, and more importantly
will pave the way for eliminating the "pre-map" approach entirely in favor
of doing TDH.MEM.PAGE.ADD under mmu_lock.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 326db9b9c567..4c3014befe9f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3181,20 +3181,6 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret < 0)
 		goto out;
 
-	/*
-	 * The private mem cannot be zapped after kvm_tdp_map_page()
-	 * because all paths are covered by slots_lock and the
-	 * filemap invalidate lock.  Check that they are indeed enough.
-	 */
-	if (IS_ENABLED(CONFIG_KVM_PROVE_MMU)) {
-		scoped_guard(read_lock, &kvm->mmu_lock) {
-			if (KVM_BUG_ON(!kvm_tdp_mmu_gpa_is_mapped(vcpu, gpa), kvm)) {
-				ret = -EIO;
-				goto out;
-			}
-		}
-	}
-
 	ret = 0;
 	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
 			       src_page, &entry, &level_state);
-- 
2.51.0.858.gf9c4a03a3a-goog


