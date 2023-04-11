Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BA86DD244
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 07:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwZrc6m1Hz3cXX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 15:58:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jSZdo1wt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jSZdo1wt;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwZqk6Pfnz3bhJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 15:57:22 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id qa44so17181455ejc.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Apr 2023 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1681192637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GUD9yijmU2vznVIxO0uguX/ETkIRPP+R6vlejm8iH3A=;
        b=jSZdo1wtv4gzEvX4J3w0SJrZ0TKscwSVtBsZijS9j6qXePnpDefEgFR/+DsCoS2XZl
         7lxW496fDD546lH25dzDrMY38jtLXcN2hVhf54Uw6Ln8Spv0ZRGnhkb+ACjEoLIsOHuR
         keAkTDZ8rUZhccLTvCHhBAXoQNwoqQjecy4H0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681192637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUD9yijmU2vznVIxO0uguX/ETkIRPP+R6vlejm8iH3A=;
        b=yCvp3VDAqsPaW2Rc0nIeOMW9kFxm7eYsA53sJhEQYF8AZn/dHs/wn0vDGjP5XPVsgF
         73jRl3Gw86PFnIx1GvKzEb+HpIEZ3m6PBbraxh3R8GMMn0D3l+z/p345gDmEbJk08HkK
         AvGYl3FhuumvQdqvYzUGe4nJdOREVOZWsMUK0chaMaMRTovJT7AIDG85sxDLwg3bOGJQ
         IZr9fl/Mx2iue8mrG3Rav0E8HDIfIVYiyBTVuHbu7RzFA+BN2dwoyjLs9DmXx1cEH8QU
         w2L71U8a7qbNSg3JJwO+OtR0pIBniicE4JDta6oKuelsmspDLFw97+f2Tbc3E5QpvEuC
         Eq2w==
X-Gm-Message-State: AAQBX9e+XykKX6628fmfPOWpESjSNj3que3uIZ4b+fmPBwg03MGJLPp8
	nGJN0SjECvHcCI25je12q0zGnh6249gjlautqZE=
X-Google-Smtp-Source: AKy350bWIaPszbl+8ZTUlnZswNv+DDIa4V3lvErdkuyIy4DyIRrAtDIkK+ieEjR0YoCV5dlQJy9rjsxfg+2wCz4SJOU=
X-Received: by 2002:a17:907:75d9:b0:94b:28ff:9e89 with SMTP id
 jl25-20020a17090775d900b0094b28ff9e89mr1703013ejc.15.1681192636857; Mon, 10
 Apr 2023 22:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230408040020.868929-1-npiggin@gmail.com>
In-Reply-To: <20230408040020.868929-1-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Apr 2023 05:57:04 +0000
Message-ID: <CACPK8Xfw6S+pHDuWvoed=PkE7XUHme=eXoWRbLfCFKRO9w=C2w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: selftests: add powerpc support
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Apr 2023 at 04:01, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> This series adds initial KVM selftests support for powerpc
> (64-bit, BookS, radix MMU).

This means the tests won't work on power8. Perhaps you could add
something like this?

--- a/tools/testing/selftests/kvm/lib/powerpc/processor.c
+++ b/tools/testing/selftests/kvm/lib/powerpc/processor.c
@@ -33,6 +33,8 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
        vm_paddr_t prtb, pgtb;
        size_t pgd_pages;

+       TEST_REQUIRE(kvm_has_cap(KVM_CAP_PPC_MMU_RADIX));
+

>
> Since v1:
> - Update MAINTAINERS KVM PPC entry to include kvm selftests.
> - Fixes and cleanups from Sean's review including new patch 1.
> - Add 4K guest page support requiring new patch 2.
>
> Thanks,
> Nick
>
> Nicholas Piggin (4):
>   KVM: selftests: Move pgd_created check into virt_pgd_alloc
>   KVM: selftests: Add aligned guest physical page allocator
>   KVM: PPC: selftests: add support for powerpc
>   KVM: PPC: selftests: add selftests sanity tests
>
>  MAINTAINERS                                   |   2 +
>  tools/testing/selftests/kvm/Makefile          |  15 +
>  .../selftests/kvm/include/kvm_util_base.h     |  27 ++
>  .../selftests/kvm/include/powerpc/hcall.h     |  21 +
>  .../selftests/kvm/include/powerpc/ppc_asm.h   |  32 ++
>  .../selftests/kvm/include/powerpc/processor.h |  33 ++
>  .../selftests/kvm/lib/aarch64/processor.c     |   4 -
>  tools/testing/selftests/kvm/lib/guest_modes.c |   3 +
>  tools/testing/selftests/kvm/lib/kvm_util.c    |  56 ++-
>  .../selftests/kvm/lib/powerpc/handlers.S      |  93 ++++
>  .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
>  .../selftests/kvm/lib/powerpc/processor.c     | 429 ++++++++++++++++++
>  .../testing/selftests/kvm/lib/powerpc/ucall.c |  30 ++
>  .../selftests/kvm/lib/riscv/processor.c       |   4 -
>  .../selftests/kvm/lib/s390x/processor.c       |   4 -
>  .../selftests/kvm/lib/x86_64/processor.c      |   7 +-
>  tools/testing/selftests/kvm/powerpc/helpers.h |  46 ++
>  .../testing/selftests/kvm/powerpc/null_test.c | 166 +++++++
>  .../selftests/kvm/powerpc/rtas_hcall.c        | 146 ++++++
>  19 files changed, 1129 insertions(+), 34 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/powerpc/hcall.h
>  create mode 100644 tools/testing/selftests/kvm/include/powerpc/ppc_asm.h
>  create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
>  create mode 100644 tools/testing/selftests/kvm/lib/powerpc/handlers.S
>  create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.c
>  create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
>  create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
>  create mode 100644 tools/testing/selftests/kvm/powerpc/helpers.h
>  create mode 100644 tools/testing/selftests/kvm/powerpc/null_test.c
>  create mode 100644 tools/testing/selftests/kvm/powerpc/rtas_hcall.c
>
> --
> 2.40.0
>
