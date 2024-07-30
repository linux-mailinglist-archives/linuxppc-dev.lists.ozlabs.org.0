Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D7942186
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 22:22:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UTBE2NvW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYRVC4mkyz3d8Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 06:22:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UTBE2NvW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3w0upzgykdnig2yb704cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYRTX233Tz3cjX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 06:21:50 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso197183a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722370908; x=1722975708; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo0MEBygX1JypWEaHf/k6xfxdkehMYQ1A9Hdq1FNmkM=;
        b=UTBE2NvWaq1kcLmxOvohyEdbRcPOD4+x4aKArvWAjoPXJxLpE/jpOTOncqDeTySmZ7
         oc7YOp0ELgnb/044v41LWGvc507VNKEBXapD1yLGzhff3qENM2iM83U4O+GEAf7m82xh
         O38NcaAb2np2k038zi6ywiPvZiQC6k+NjLZbPTJn5kWSHBXJ4B7cFTk/i9gtjoIXxdOd
         2NON1+/7O9WBIp15iW3At0XU/HbbVrZL79k3DeJxysrLLg5vyraNV5GnWXVh921RTJqe
         1E2eEWDG6RkI9vxN6ezxge11KAZHIa1AlwLfFZkra0s5AOP/gGQoCZxPr37sC28GUIJe
         krrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722370908; x=1722975708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lo0MEBygX1JypWEaHf/k6xfxdkehMYQ1A9Hdq1FNmkM=;
        b=OTk9UdGUEuouA6QpsGGC0Rf1dmGZNN+79eO8q1ASEQq5nuPJxSMAacj8KJn9KZRSV4
         dPApkLMVZoiHY7D774EO4puSexGPZLQnmhuYmZuFQOEKGOktljOQrSWCftEwh9xRvj5i
         4SoX4Vqdz1sH4sO5hEgkfTXqXM9Y6mafsctYCYdFI3L6K47ZNi00w/uYKFG1peRXplj6
         VqLZSd10+Z0la/bswHubMEKY8K+c+vNVpCutGfwZCIx9FcfE7XoNuO687Wf7v5iLNkan
         rmSwV5pgeUzNfIg9WcUhPVfur9nxOcPVCBAicQP2x8Z5JHPIAzpq5euzaFry868lShTo
         5LgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt/A5H42lrcmtgVKaezTlvOIBRoF176GUQgdpP9h7yVqtedf9kfDog1jUXYnV6/9ukLS1PNDDBU2yNSf5Vm9vPiGkq/qdhSaDGzejZMg==
X-Gm-Message-State: AOJu0Yyvtx7L50x3t+XfAPguSJqL263iI5UGKTH8eU0ysJl6FRnt/pZb
	sv/lLNQSn2n07Yuvo2I/8eAxfEHEkg7MxFXup4ts9w18p0dVtij4gTvya7N82X0HEqEclGh3m59
	j/w==
X-Google-Smtp-Source: AGHT+IFRxL1KATidTTKhi0tYZI3Y5cQGXURHMsVQzSWYAdVw9bcIrYssZFg0WYN1ZfdRJ6uqRn8d2puX7Kc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ca8b:b0:2cf:93dc:112d with SMTP id
 98e67ed59e1d1-2cfcab4fa5emr42966a91.4.1722370907896; Tue, 30 Jul 2024
 13:21:47 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:21:46 -0700
In-Reply-To: <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-85-seanjc@google.com>
 <992c4a07-fb84-42d8-93b3-96fb3a12c8e0@redhat.com>
Message-ID: <ZqlLWl0R1p41CS0O@google.com>
Subject: Re: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns
 that have a "struct page"
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:52, Sean Christopherson wrote:
> > Now that KVM no longer relies on an ugly heuristic to find its struct page
> > references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
> > pfns, remove KVM's hack to elevate the refcount for pfns that happen to
> > have a valid struct page.  In addition to removing a long-standing wart
> > in KVM, this allows KVM to map non-refcounted struct page memory into the
> > guest, e.g. for exposing GPU TTM buffers to KVM guests.
> 
> Feel free to leave it to me for later, but there are more cleanups that
> can be made, given how simple kvm_resolve_pfn() is now:

I'll revisit kvm_resolve_pfn(), Maxim also wasn't a fan of a similar helper that
existed in v11.

> Also, check_user_page_hwpoison() should not be needed anymore, probably
> not since commit 234b239bea39 ("kvm: Faults which trigger IO release the
> mmap_sem", 2014-09-24) removed get_user_pages_fast() from hva_to_pfn_slow().

Ha, I *knew* this sounded familiar.  Past me apparently came to the same
conclusion[*], though I wrongly suspected a memory leak and promptly forgot to
ever send a patch.  I'll tack one on this time around.

[*] https://lore.kernel.org/all/ZGKC9fHoE+kDs0ar@google.com

> The only way that you could get a poisoned page without returning -EHWPOISON,
> is if FOLL_HWPOISON was not passed.  But even without these patches,
> the cases are:
> - npages == 0, then you must have FOLL_NOWAIT and you'd not use
>   check_user_page_hwpoison()
> - npages == 1 or npages == -EHWPOISON, all good
> - npages == -EAGAIN from mmap_read_lock_killable() - should handle that like -EINTR
> - everything else including -EFAULT can go downt the vma_lookup() path, because
> npages < 0 means we went through hva_to_pfn_slow() which uses FOLL_HWPOISON
> 
> This means that you can simply have
> 
> 	if (npages == -EHWPOISON)
> 		return KVM_PFN_ERR_HWPOISON;
> 
> before the mmap_read_lock() line.  You may either sneak this at the beginning
> of the series or leave it for later.
> 
> Paolo
> 
