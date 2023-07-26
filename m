Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD5076406D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 22:23:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=eM8gatpI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB51t2y5Gz3cJ8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 06:23:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=eM8gatpI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3gidbzaykdlmlxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB50z6PR4z2yVF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 06:22:26 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d1ebc896bd7so142437276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690402944; x=1691007744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wk8YN2z9DygnTN7wIkQ/drKhQeRLfAOWaFSkpwIJ9VA=;
        b=eM8gatpIFAPsVcHsvCyPq5hyC8MsN3TVlS3mNniSEUN+A8XGjxiS8F6dC4aFmL513/
         OKqKBd4JNqQZqMKS0xCiGe+t5AXNUTDm2VuHrYqk4zFosWdPFjPIB6URfw5vd93IMKdx
         lKXXLluLhbwl+YjfsuqRPKzKU2+mG/aerZ1RHkgGlaQ2XngSQ4QWGzUzw8Bk02VhX6BY
         iemdbo75Y0mm9KaGC6Z479jAT6buL5FMFb75fU2ROzDvErIFsnjLxci0m6st5PC1U67q
         6FdRgc7HGPP7DF/FaK/f0cWfoJ+ZjAfbcmtP5i/qUasNowuJ11SfJCK8qdGxq6HB8Y5C
         RWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690402944; x=1691007744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wk8YN2z9DygnTN7wIkQ/drKhQeRLfAOWaFSkpwIJ9VA=;
        b=l02Jo6muOR7xT4BTZLN4CTnhx8Yks76zzQ/Hb/jNUEHc94rcSMaZQzMZJz2ys+OxNP
         EcgSAifgvDmdbmwtRP5Jj6CaosVWT53cvt34XwyDDZuSHLwgShxsNLUxnrbmwDm+csB6
         oSj1+jaUtOKLRA1eBGBL173L/3tHuMV7njsm20N2tMK/opPvBHLzmfpWkbpDWbC82wKQ
         VLB0rjGqtu2l9ydGIIEar/msCg1Ln0veE6udF+rL9wg81v5p5gx/2yzlq4yNfsWQ/ONO
         I3ujA1z4erwCtYvKnd9dPLr4l8ao15ehUGw3J95v3mv6phcSz0g46NsBkTTj3kK01MzO
         wbow==
X-Gm-Message-State: ABy/qLa4izWX7/6rZwo6/Llvu1+OuAsgblatS5grKjGFulRLdmhqz/7j
	ES0jHSU0Ai8kF+3rpcE8SIPrY0Dj1y0=
X-Google-Smtp-Source: APBJJlHa4e7bNU/FXY+wuV4M+6WYSA4uQsVmjVu+paqFG49PZpexPl+XQpMgzwVCSNNiruIZErv3dNdZQXc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:cf48:0:b0:d06:1a77:7d2 with SMTP id
 f69-20020a25cf48000000b00d061a7707d2mr18632ybg.13.1690402944082; Wed, 26 Jul
 2023 13:22:24 -0700 (PDT)
Date: Wed, 26 Jul 2023 13:22:22 -0700
In-Reply-To: <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-2-seanjc@google.com>
 <711f74d6-fe15-6bd4-a9b9-c4f178d95bf3@redhat.com>
Message-ID: <ZMGAfvzEkVphWPdZ@google.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-s
 ecurity-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023, Paolo Bonzini wrote:
> On 7/19/23 01:44, Sean Christopherson wrote:
> > +	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
> > +	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));
> 
> I think these should be static assertions near the definition of the
> structs.  However another possibility is to remove 'raw' and just assign the
> whole union.

Duh, and use a named union.  I think when I first proposed this I forgot that
a single value would be passed between kvm_hva_range *and* kvm_gfn_range, and so
created an anonymous union without thinking about the impliciations.

A named union is _much_ cleaner.  I'll post a complete version of the below
snippet as a standalone non-RFC patch.

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d3ac7720da9..9125d0ab642d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,11 +256,15 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+union kvm_mmu_notifier_arg {
+       pte_t pte;
+};
+
 struct kvm_gfn_range {
        struct kvm_memory_slot *slot;
        gfn_t start;
        gfn_t end;
-       pte_t pte;
+       union kvm_mmu_notifier_arg arg;
        bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dfbaafbe3a00..f84ef9399aee 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -526,7 +526,7 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 struct kvm_hva_range {
        unsigned long start;
        unsigned long end;
-       pte_t pte;
+       union kvm_mmu_notifier_arg arg;
        hva_handler_t handler;
        on_lock_fn_t on_lock;
        on_unlock_fn_t on_unlock;
@@ -547,6 +547,8 @@ static void kvm_null_fn(void)
 }
 #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
 
+static const union kvm_mmu_notifier_arg KVM_NO_ARG;
+
 /* Iterate over each memslot intersecting [start, last] (inclusive) range */
 #define kvm_for_each_memslot_in_hva_range(node, slots, start, last)         \
        for (node = interval_tree_iter_first(&slots->hva_tree, start, last); \
@@ -591,7 +593,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
                         * bother making these conditional (to avoid writes on
                         * the second or later invocation of the handler).
                         */
-                       gfn_range.pte = range->pte;
+                       gfn_range.arg = range->arg;
                        gfn_range.may_block = range->may_block;
 
                        /*

