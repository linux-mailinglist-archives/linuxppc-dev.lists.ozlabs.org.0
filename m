Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 642746A0E7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN05429QTz3cgy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 04:14:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=j3+/xNXO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=31573ywykdboi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=j3+/xNXO;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN0496YyDz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 04:14:01 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-53700262a47so94429767b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 09:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m9a3DVsbLLCiizvc2aec2wajhEpcLeonWEm+iefIJpg=;
        b=j3+/xNXOW39AcGdiBKIT1ULTMkq8kVSikEDQybzdeJTRA37B2kpy80N5M1Dei878R4
         GaXaFfuMncInfPEX5RJTGpdyozZsflbRf0Gbtl9jxACTZgei3XQt5U/WYSeMd7/i64ow
         U135uPNxlmsPv4ItCwhl7oyYE5w1QhCJKJqaOclKSAWU/aWhnoTHIOiSvrruZaqQt8na
         Uh+YugdR1H4UVdnaJ09b/cgGqLEYVq8/f44xVjwZH2YLIIBd4i/f1Jr7SEfqqKiHZfK4
         er44ZBZpMwi5PZXjKu21H2yJPHQNutcaEZjY0olLohqu9AmYfM91IghN2CDVI97loorS
         tx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9a3DVsbLLCiizvc2aec2wajhEpcLeonWEm+iefIJpg=;
        b=m+ZOmc6j2tsad+12ooql27fMqRlMmT0AUl7eWwSOgzZObzWR7p46hyX0JjVRyrV2Hy
         acS6zbn5H1u2NcTy+F3KiRhgxWxBjJy3c7napIYHPDF4EifCukhkAqK7wS3DKDIYIkHh
         J/nix6JTC2Kjo1cUPf4PT7WUvAnM0kvjfBlND2BG4VmPxgrI0tn7o8nSwGiysIoCI+es
         /8Q02uJW/hHyZKm+Q0Pn0s55NzLP6d2Bd3F3rGg7nxrGT+KQyBDrx5mMOKRf0oFwusRP
         7yLoPKL7UIpJYtiFe3VYYkEEZGs7EP6WAj+6vPqqHGA9IBQRN4AhLkoDG9//FLQUsKjw
         5Djw==
X-Gm-Message-State: AO0yUKVYFN6WCVFLQlqfFTef1VREPOiXjfbEkKmgQJgAapQQBOiO7XzS
	xgILRppdm70CVBF19DEGvs8HMS3NYnU=
X-Google-Smtp-Source: AK7set/sBYiVXprfoygydPUN0hrU35/k2bW+OOgTOU9cAUD3HKKiCHjKS7O05xDs1Rmfdd/bjv5qKqc6wMY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10c9:b0:855:fdcb:4467 with SMTP id
 w9-20020a05690210c900b00855fdcb4467mr3661788ybu.0.1677172439635; Thu, 23 Feb
 2023 09:13:59 -0800 (PST)
Date: Thu, 23 Feb 2023 09:13:58 -0800
In-Reply-To: <20230217041230.2417228-2-yuzhao@google.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-2-yuzhao@google.com>
Message-ID: <Y/ee1s3XPGa62SFV@google.com>
Subject: Re: [PATCH mm-unstable v1 1/5] mm/kvm: add mmu_notifier_test_clear_young()
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 16, 2023, Yu Zhao wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 9c60384b5ae0..1b465df4a93d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -875,6 +875,63 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
>  	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn);
>  }
>  
> +static bool kvm_test_clear_young(struct kvm *kvm, unsigned long start,
> +				 unsigned long end, unsigned long *bitmap)
> +{
> +	int i;
> +	int key;
> +	bool success = true;
> +
> +	trace_kvm_age_hva(start, end);
> +
> +	key = srcu_read_lock(&kvm->srcu);
> +
> +	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +		struct interval_tree_node *node;
> +		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
> +
> +		kvm_for_each_memslot_in_hva_range(node, slots, start, end - 1) {
> +			gfn_t lsb_gfn;
> +			unsigned long hva_start, hva_end;
> +			struct kvm_gfn_range range = {
> +				.slot = container_of(node, struct kvm_memory_slot,
> +						     hva_node[slots->node_idx]),
> +			};
> +
> +			hva_start = max(start, range.slot->userspace_addr);
> +			hva_end = min(end - 1, range.slot->userspace_addr +
> +					       range.slot->npages * PAGE_SIZE - 1);
> +
> +			range.start = hva_to_gfn_memslot(hva_start, range.slot);
> +			range.end = hva_to_gfn_memslot(hva_end, range.slot) + 1;
> +
> +			if (WARN_ON_ONCE(range.end <= range.start))
> +				continue;

Extend __kvm_handle_hva_range() instead of copy-pasting.  At a very quick glance,
I believe all that is needed is (minus sanity checks):

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d255964ec331..3296ae2cf6fa 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -544,6 +544,7 @@ struct kvm_hva_range {
        hva_handler_t handler;
        on_lock_fn_t on_lock;
        on_unlock_fn_t on_unlock;
+       bool lockless;
        bool flush_on_ret;
        bool may_block;
 };
@@ -616,7 +617,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
                        gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
                        gfn_range.slot = slot;
 
-                       if (!locked) {
+                       if (!range->lockless && !locked) {
                                locked = true;
                                KVM_MMU_LOCK(kvm);
                                if (!IS_KVM_NULL_FN(range->on_lock))

> +
> +			/* see the comments on the generic kvm_arch_has_test_clear_young() */
> +			lsb_gfn = hva_to_gfn_memslot(end - 1, range.slot);
> +
> +			success = kvm_arch_test_clear_young(kvm, &range, lsb_gfn, bitmap);
> +			if (!success)
> +				break;
> +		}
> +	}
> +
> +	srcu_read_unlock(&kvm->srcu, key);
> +
> +	return success;
> +}
