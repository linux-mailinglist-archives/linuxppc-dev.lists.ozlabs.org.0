Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E465C69A4DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:25:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHzJK5rQpz3fSf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:25:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tJA35Ofv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tJA35Ofv;
	dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHzDJ1854z3f6C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 15:22:07 +1100 (AEDT)
Received: by mail-vs1-xe2a.google.com with SMTP id d6so1926982vsv.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 20:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DmQBbpAu6B0uYYhxH30aHdK9UMmXNgVHX14jvNOggZk=;
        b=tJA35Ofvs7OhFLQM4OAO9pyzBvthd1pHbKdaGQcRJ3YavWvQaShc7aTkBnKhHNN/qf
         71V0DM19hvtEjOHUzjLR2745KsM8dlyMKcd01CcQ+FwFzC7/bE1MPLr0cth7zPVN5t84
         xXJakn3yMkVRExor1tx6+hTzGcDc9X7aMCvaIxvranghfxdnSmz++u5JcY376v30Pvve
         cbEsgeTf3k8MLOzEzpPng3PoJj+Ma95D9fTXhjgzq7h+2JupaecZZY1EoqYZmXBd2Gl2
         pokR2z1r2mqfRnRHTWASeUWMVLlt4NHNRc3gZ0KfBJzISW6RhMZlmTLJmVp6kSJ54cKK
         2BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmQBbpAu6B0uYYhxH30aHdK9UMmXNgVHX14jvNOggZk=;
        b=3IvSLEMIgXxnN/ebIg/Hnnc6vugy1dQuIzeOebkFuvi0XsW5afo/BcqoRzw+8JMT0t
         K6BDpE78jtjKVQx6RbccABxxso/7rKuAc+tl4DzCJMRZ1NMNYvViTsiCwds2A2pbL0uL
         B3F4BT/LyTAUrzfZpDl0O9srSsQQszNcGPXDxCyT5Il/hGsoXZeJWpb0JMVKZDcUGczK
         f0hltdKYeWdtvWz/qVzIvHSXA0h01EbfVw/HUqsj3qYBiSIrufSPx+bO7/1CB/H5tHvk
         uaMoT3p6ZuTLKyOjJNpjR30lrAGucXod2EPTt6K2FrFiAYaR8s3wvUq6S+AV9q+zpc2f
         7LOg==
X-Gm-Message-State: AO0yUKWEACsn+KTg5305YsrK1wlaIej2xGrXWZ9Pcz4XRqu9CNmB+aYo
	mFRtloTe2c9gqf/dxDiKbHaQBSk799jz6ipgd7lbVQ==
X-Google-Smtp-Source: AK7set8pOdWfIt69LFD7Klja37MX4Y0B4AgeZGxYGFzE3TmHzaA3GYFi17QwE/R0IT0jJksQbazWrQ2EJ3TyMlpGcMk=
X-Received: by 2002:a67:cf47:0:b0:411:c1a0:c787 with SMTP id
 f7-20020a67cf47000000b00411c1a0c787mr1602974vsm.26.1676607724287; Thu, 16 Feb
 2023 20:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-4-yuzhao@google.com>
In-Reply-To: <20230217041230.2417228-4-yuzhao@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 16 Feb 2023 21:21:28 -0700
Message-ID: <CAOUHufYSx-edDVCZSauOzwOJG6Av0++0TFT4ko8qWq7vLi_mjw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 3/5] kvm/arm64: add kvm_arch_test_clear_young()
To: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 16, 2023 at 9:12 PM Yu Zhao <yuzhao@google.com> wrote:
>
> This patch adds kvm_arch_test_clear_young() for the vast majority of
> VMs that are not pKVM and run on hardware that sets the accessed bit
> in KVM page tables.
>
> It relies on two techniques, RCU and cmpxchg, to safely test and clear
> the accessed bit without taking the MMU lock. The former protects KVM
> page tables from being freed while the latter clears the accessed bit
> atomically against both the hardware and other software page table
> walkers.
>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h       |  7 +++
>  arch/arm64/include/asm/kvm_pgtable.h    |  8 +++
>  arch/arm64/include/asm/stage2_pgtable.h | 43 ++++++++++++++
>  arch/arm64/kvm/arm.c                    |  1 +
>  arch/arm64/kvm/hyp/pgtable.c            | 51 ++--------------
>  arch/arm64/kvm/mmu.c                    | 77 ++++++++++++++++++++++++-
>  6 files changed, 141 insertions(+), 46 deletions(-)

Adding Marc and Will.

Can you please add other interested parties that I've missed?

Thanks.
