Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE487597F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 16:17:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QCgn5pm8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5dFR2TgLz3bhc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 00:17:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QCgn5pm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3wpc3zaykdeuzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5dDW3Lfhz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 00:16:59 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-262cf62e9b4so5353440a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689776216; x=1692368216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ply9vOQ7PKiPIjqcvpgXEIwEBxatqkRJB2ZRy5lS2Xc=;
        b=QCgn5pm8yPPImP/ZfLF2Ea0jJXDpcGNQ/LF2jNeNTBG71TLZwae17UnwEuo78ONGHP
         atCG9sArqHfv277Ky9HWUevcQtozR/I9rfoMFWMGzH2p/tn1UptotifJkTzwcjUzjGM4
         2mRccC+Qe6eelyvVpzgsii1Dz38eewFROpWBRyPZo22w72yv1RXU/kRjiIgbgdf4vOiO
         m+eFtOZOtzemALwYg0UpO5hPIX4qNwingmWVGWsEqCwrs8u/CIQrQXsRy9c4nWVOA7nY
         TgAf9p3r7jbBOiu0L+1TlKBrMt3e7HNn72eYqwvkzNmnIVVzm8emG5isi9/yOnMB2w1e
         eLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776216; x=1692368216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ply9vOQ7PKiPIjqcvpgXEIwEBxatqkRJB2ZRy5lS2Xc=;
        b=SbUcGs8dnDiNsLp86I3Hj9E8NoRLLquJGnWT1pDq6mgjSTkZf2zoQsUCKujNlfjdai
         e0XwC+6ed2e3+a6+UNonUHUzeAWwml/FLpf43u2zSr1lujlVowPSD+zUMGCliUdgf8+f
         GoueiqMvYCOW7CVWOb/4efwS9zqz5pvCkd0uu0RAW4ksLQJaIuhYLcIKtUZe0zkoBxSS
         2qVPga9hDNk5FV8q6wyr4AvsoPWAN659LeuhehxR/Z+rdpgi5x+8Z8/CpQiWZOsKlaok
         5OdcAAFVhO+80oo7fMIw0Pem44EF4VMq8FbyotbSmN7QlogFnAAXe+jCJQsPtkNA+pH4
         h02w==
X-Gm-Message-State: ABy/qLY03PMZL8CGoHUc14NgpFxOHBPFVX+HSyFa8pogW8nQ2GOA0sDv
	nmopZ83X3DscT6wVYkAVKI/s9SRxsg4=
X-Google-Smtp-Source: APBJJlHe5KmJdZof+vQtZ6M87xlqjK1Ejx8t4AB5DMX6de6h21FipxJ2lQkyFnlQoXRyf3eYpC2jq3S2bQ0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e542:b0:25b:f9e3:deab with SMTP id
 ei2-20020a17090ae54200b0025bf9e3deabmr136275pjb.9.1689776216142; Wed, 19 Jul
 2023 07:16:56 -0700 (PDT)
Date: Wed, 19 Jul 2023 07:16:54 -0700
In-Reply-To: <20230719075440.m3h653frqggaiusc@yy-desk-7060>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-8-seanjc@google.com>
 <20230719075440.m3h653frqggaiusc@yy-desk-7060>
Message-ID: <ZLfwVki27oLBGO6D@google.com>
Subject: Re: [RFC PATCH v11 07/29] KVM: Add KVM_EXIT_MEMORY_FAULT exit
From: Sean Christopherson <seanjc@google.com>
To: Yuan Yao <yuan.yao@linux.intel.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023, Yuan Yao wrote:
> On Tue, Jul 18, 2023 at 04:44:50PM -0700, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> > This new KVM exit allows userspace to handle memory-related errors. It
> > indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> > The flags includes additional information for userspace to handle the
> > error. Currently bit 0 is defined as 'private memory' where '1'
> > indicates error happens due to private memory access and '0' indicates
> > error happens due to shared memory access.
> 
> Now it's bit 3:

Yeah, I need to update (or write) a lot of changelogs.

> #define KVM_MEMORY_EXIT_FLAG_PRIVATE (1ULL << 3)
> 
> I remember some other attributes were introduced in v10 yet:
> 
> #define KVM_MEMORY_ATTRIBUTE_READ              (1ULL << 0)
> #define KVM_MEMORY_ATTRIBUTE_WRITE             (1ULL << 1)
> #define KVM_MEMORY_ATTRIBUTE_EXECUTE           (1ULL << 2)
> #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> 
> So KVM_MEMORY_EXIT_FLAG_PRIVATE changed to bit 3 due to above things,
> or other reason ? (Sorry I didn't follow v10 too much before).

Yep, I want to reserve space for the RWX bits.
