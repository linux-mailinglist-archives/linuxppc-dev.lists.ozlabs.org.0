Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1216DB728
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 01:31:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtZPx07mWz3fZh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 09:31:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g5wwO/E/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3pacwzaykdn4seanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g5wwO/E/;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtZP64Q9nz3fBd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 09:30:48 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id j2-20020a170902da8200b001a055243657so89932plx.19
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 16:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680910246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFUj6O6CB3iiBV1uvi/t8sklxmHPNBdsFm6z4ma14Yo=;
        b=g5wwO/E/km9HV/J4Uo40AnPSisucwkmavL4S1Pf4Fx0jHCk1WbKxYKFrTEZxFx6XHp
         2exvb76Kc6SS9Ds8LXjXF0I1WFqClQxCNCC6sf4daSWTnp+YpnSO2121ov5N7kOpcqib
         YCLGPirwnvPcpp/S3fo5s+vT7QnEVjcGGwmgFHFlmScqbAaLkGHrQ6ia2vS3XVAARuDd
         sMCqZDZFuZewtQIjpJWpW7S/bUTL7IiTKNWpDkyOWB4W2AE70oenj4IH+Pui3ZI77/9t
         egivxNBn8aOes50PuEtPh0HjwIwXrfmgH5cXyJJ/cO29tWSweCMf9GcheLm+s0IsbY3F
         CJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680910246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFUj6O6CB3iiBV1uvi/t8sklxmHPNBdsFm6z4ma14Yo=;
        b=OkLqVs8pngHVK1UZFdlHDSZ7oerK2XdZhBT0l276rvJZl4iYisveRq8Gv+lEp+lveD
         Sikvubm9svinQIGIExFLVXV5Fk+vfebf850AJxMu7FCgyO5fQXo2RO51RgnD0x8yiR+I
         XaT4IuObGuIx55sGjRLXfa3okGxTiUotoffD6t1o2pAuVtMpQPOh9bmRSKZnXdFM6oX0
         WQHiK6iMcXYVYgokJQX7uoXZPuYFChYnb2UJLWJia2NpyyGaZupsPM+So1e9BwO0qJ/X
         nIGJDCxgBlt7+ouvZAva813onj8CHk99t6npbVMPkFbyGHiJBDIibRxtRGKV9rVnVwM/
         z/YA==
X-Gm-Message-State: AAQBX9fznqPGcOpuPeA2k/2z6u7SmWOSFFMJ+jszyj73SSd6vGzdgEbF
	q/XTJGTnqfq2QUZpUopZA9dDFNKjsww=
X-Google-Smtp-Source: AKy350YxihhHFMNV20FoO+AQH03z9Y8GXCy5PhVvBVZ1Rdqa7VXUgXNseSxSRo6RlhR0sxbeKagnCEmAUJY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:cc01:b0:244:9909:6e60 with SMTP id
 b1-20020a17090acc0100b0024499096e60mr959943pju.3.1680910245959; Fri, 07 Apr
 2023 16:30:45 -0700 (PDT)
Date: Fri, 7 Apr 2023 16:30:44 -0700
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
Message-ID: <ZDCnpAd0fh2cKcpS@google.com>
Subject: Re: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom
 stat names
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Anup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini
  <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 06, 2023, David Matlack wrote:
> David Matlack (4):
>   KVM: Refactor stats descriptor generation macros
>   KVM: Refactor designated initializer macros for struct _kvm_stats_desc
>   KVM: Allow custom names for KVM_STAT()
>   KVM: x86: Drop union for pages_{4k,2m,1g} stats
> 
>  arch/arm64/kvm/guest.c          |  14 +--
>  arch/mips/kvm/mips.c            |  54 ++++-----
>  arch/powerpc/kvm/book3s.c       |  62 +++++-----
>  arch/powerpc/kvm/booke.c        |  48 ++++----
>  arch/riscv/kvm/vcpu.c           |  16 +--
>  arch/s390/kvm/kvm-s390.c        | 198 ++++++++++++++++----------------
>  arch/x86/include/asm/kvm_host.h |   9 +-
>  arch/x86/kvm/x86.c              |  94 +++++++--------
>  include/linux/kvm_host.h        | 179 +++++++++++------------------
>  9 files changed, 314 insertions(+), 360 deletions(-)

For the series,

Reviewed-by: Sean Christopherson <seanjc@google.com>
