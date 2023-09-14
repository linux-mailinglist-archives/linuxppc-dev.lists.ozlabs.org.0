Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3767A0DE0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 21:13:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=z7eqw7NN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmn5p6Qc2z3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 05:13:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=z7eqw7NN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3d1sdzqykdaiugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmn4z4g0Nz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 05:12:18 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d818fb959f4so1324252276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 12:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694718736; x=1695323536; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYBWSie1WcKieNCkM5oJg6niwnE6sJx6iHmmYDkBNI4=;
        b=z7eqw7NN1AxTk1wPYODNA5C4tiF4c2bIaVLRy49ejtCQW/j074ZWukjEUGnlpPxvhZ
         Ow2sGjgm8LUpYDQGLfWoy2LZa+6/LHNr4+uCjUEAqo+2R1Qsf3ZcUkhx0UcsCV6XyksM
         nWE7hQBGggY7JjaJ9+EHIKKdiJJs9jK/Z7krUs5SYefJV16l5N98JlfZ7jnQbMLz3v0X
         /Xn4HvPW/QODisSVq5GPL5400dtEz8VUPskzGqB0vxn6PCt9osnou4dFuaWfZwdKpoab
         mzM/B5irsgTqe9KRoOJCI1wXz2CDCXmvZ1h3qtZEbM5ROO5kEAVYIQpKTnP6YeyuudDm
         SONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694718736; x=1695323536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYBWSie1WcKieNCkM5oJg6niwnE6sJx6iHmmYDkBNI4=;
        b=JIXG8SSpwUoTpGzZXQmtDtRW/c2sHx+tKF8lXkBThoCSNnlaZXaKwME+C3nhicr7KS
         DsUKHjAdqLGD7iucaGuCpRDmunradYqsGe4vVzzCVIo9W1+yJIkecSMUZQaHfYsq5MTs
         6wDJ6SbUSfO23g4XLkbKjurINT4o5qnpYzSwzZJyBiIJnhLEJlOhM7/wjcwLbKzt40fF
         nKxN0P/DiM1nyAqyBoq2d4OLLHy3N6kFslecSGgcEMe6lXNktHEEa1nVplMXhbdUBGkx
         +fwuwfcSKbG/qXVufuf7P+shH7biKywSpfHrO9D5XpFiJxrQf0usvuE71BuNuOyzWYuO
         2GZw==
X-Gm-Message-State: AOJu0YwsCyku7hgLlXNdtGfpNEla1MW0EYN22soROoP4nDdUAx/T3IQ7
	8Vj/BvxkfUFHXQNdcqAuwfhExV0WM2k=
X-Google-Smtp-Source: AGHT+IEbiNaBi+bbmiwHYIoXYm8wvREABvNIqLAChDCxgGMZnU/PhXOjKBEoc76witsZv+IRa9HvnC8Otog=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:bc7:0:b0:d77:fb4e:d85e with SMTP id
 190-20020a250bc7000000b00d77fb4ed85emr138869ybl.6.1694718735743; Thu, 14 Sep
 2023 12:12:15 -0700 (PDT)
Date: Thu, 14 Sep 2023 12:12:14 -0700
In-Reply-To: <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
Mime-Version: 1.0
References: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com> <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
Message-ID: <ZQNbDt6vqwC4gZmi@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Elliot Berman <quic_eberman@quicinc.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, Ackerley Tng <ackerleytng@google.com>, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 28, 2023, Elliot Berman wrote:
> I had a 3rd question that's related to how to wire the gmem up to a virtual
> machine:
> 
> I learned of a usecase to implement copy-on-write for gmem. The premise
> would be to have a "golden copy" of the memory that multiple virtual
> machines can map in as RO. If a virtual machine tries to write to those
> pages, they get copied to a virtual machine-specific page that isn't shared
> with other VMs. How do we track those pages?

The answer is going to be gunyah specific, because gmem itself isn't designed to
provide a virtualization layer ("virtual" in the virtual memory sense, not in the
virtual machine sense).  Like any other CoW implementation, the RO page would need
to be copied to a different physical page, and whatever layer translates gfns
to physical pages would need to be updated.  E.g. in gmem terms, allocate a new
gmem page/instance and update the gfn=>gmem[offset] translation in KVM/gunyah.

For VMA-based memory, that translation happens in the primary MMU, and is largely
transparent to KVM (or any other secondary MMU).  E.g. the primary MMU works with
the backing store (if necessary) to allocate a new page and do the copy, notifies
secondary MMUs, zaps the old PTE(s), and then installs the new PTE(s).  KVM/gunyah
just needs to react to the mmu_notifier event, e.g. zap secondary MMU PTEs, and
then KVM/gunyah naturally gets the new, writable page/PTE when following the host
virtual address, e.g. via gup().

The downside of eliminating the middle-man (primary MMU) from gmem is that the
"owner" (KVM or gunyah) is now responsible for these types of operations.  For some
things, e.g. page migration, it's actually easier in some ways, but for CoW it's
quite a bit more work for KVM/gunyah because KVM/gunyah now needs to do things
that were previously handled by the primary MMU.

In KVM, assuming no additional support in KVM, doing CoW would mean modifying
memslots to redirect the gfn from the RO page to the writable page.  For a variety
of reasons, that would be _extremely_ expensive in KVM, but still possible.  If
there were a strong use case for supporting CoW with KVM+gmem, then I suspect that
we'd probably implement new KVM uAPI of some form to provide reasonable performance.

But I highly doubt we'll ever do that, because one of core tenets of KVM+gmem is
to isolate guest memory from the rest of the world, and especially from host
userspace, and that just doesn't mesh well with CoW'd memory being shared across
multiple VMs.
