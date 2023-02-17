Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D285069A4E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHzKL4YBSz3fcX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:26:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=N9QazQsc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=N9QazQsc;
	dkim-atps=neutral
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHzHP4NqGz3fRf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 15:24:49 +1100 (AEDT)
Received: by mail-vs1-xe36.google.com with SMTP id d6so1931660vsv.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PJu4vps/ydzm+bD68RapcHOeOMmzQwBmAiW7NmBj0zU=;
        b=N9QazQscN5/bMrTwGxOfAtM8xQD0zg2C7V00UxsuXtYfAz5LVfV9yZkceaMx30llQS
         MbtMbGZSrDyQ8f+5wFmT5KPHG7yoVHYuRGjV/K+K1/YBzfts3DWsIWEL2wK13NHsBONL
         3WSw5YTZ0a5gR+5SW3CY0ht9ZWgZiEHmWxeYTUfbfTwp27jM0ayQIQmuMeH32n16zCMS
         LlHALD1+pwPBgt3KwWvli37N4+ulQIAdwqaKEMOyIYnaNF0PxJI5iNKryPEMJ1JxgseD
         cL+jVcKxymHBK7RZixjBM3EahjNXB2uD4wOmYf/cmuvuGiqT2+UiebhqO4obZD3C2vfh
         jyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJu4vps/ydzm+bD68RapcHOeOMmzQwBmAiW7NmBj0zU=;
        b=NCoxpJRWb1cF/wtxUAp1R0yV/mNvAeVzvfq8l330ibj9My6/284WKenhvZmPqQy8Vd
         i+N1K8N4kmYzr32RUTV5YHQ8F0ZDAlt7Z74tinfz1tCYtYU795OeW/prvV5L+ebWBoIG
         QYmuJkBlFTh7YPV3+ai200oUicxo8TWmwUrBn7O+oXLS/vfF7ZIhEeefN6AtQqNqVoM2
         EmTVoJ1pTnWLFJmIicFBRA6qt96+cNuVHi//q6LWgAeda3DvrcGcFiCOiWjiQGgJyvbk
         QvCL+GlmBa95hP77kVSvQuk/LcrXzbU0c+t9hyTIotnOHB7K3FXnu08iBOfWE6uBItZR
         EbdA==
X-Gm-Message-State: AO0yUKVXlkziIb9Z0bWBAP+zrRPvsLSu/35E5laJT6RmQmfJ9mpNBEgO
	Fih0BzCLr+yYmNX1oqe3eM2tMydgc8US3sAlgjEaeA==
X-Google-Smtp-Source: AK7set+Yem2rWelUagYff1NdlU4Jg460e39X+mAJEfXHa9zcbTd/sITo7f0UTvcIS0NfZcWWeb2tTMWiIhTxmfPdL/A=
X-Received: by 2002:a67:cf47:0:b0:411:c1a0:c787 with SMTP id
 f7-20020a67cf47000000b00411c1a0c787mr1603908vsm.26.1676607885989; Thu, 16 Feb
 2023 20:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-5-yuzhao@google.com>
In-Reply-To: <20230217041230.2417228-5-yuzhao@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 16 Feb 2023 21:24:09 -0700
Message-ID: <CAOUHufbjbaBtNQX-uSOUQEDoH9nAE0nC7L+ssoPF3WHpQuiwuw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 4/5] kvm/powerpc: add kvm_arch_test_clear_young()
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
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
> VMs that are not nested and run on hardware with Radix MMU enabled.
>
> It relies on two techniques, RCU and cmpxchg, to safely test and clear
> the accessed bit without taking the MMU lock. The former protects KVM
> page tables from being freed while the latter clears the accessed bit
> atomically against both the hardware and other software page table
> walkers.
>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h    | 18 ++++++
>  arch/powerpc/include/asm/kvm_ppc.h     | 14 +----
>  arch/powerpc/kvm/book3s.c              |  7 +++
>  arch/powerpc/kvm/book3s.h              |  2 +
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 78 +++++++++++++++++++++++++-
>  arch/powerpc/kvm/book3s_hv.c           | 10 ++--
>  6 files changed, 110 insertions(+), 19 deletions(-)

Adding Michael, Nicholas and Christophe.

I'm not sure who I should add for this patch. Can you please add any
interested parties that I've missed?

Thank you.
