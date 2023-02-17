Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D669A4D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 05:24:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHzH92fnGz3fYR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:24:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=guZJ0aqV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=guZJ0aqV;
	dkim-atps=neutral
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHzBY2dpLz3fRR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 15:20:36 +1100 (AEDT)
Received: by mail-vs1-xe33.google.com with SMTP id h10so4295729vsu.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 20:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EzJhoV3HmsUkNrfCb9SHGhf85+7gyTZEICckTTZh/aE=;
        b=guZJ0aqVsAObTjuj7XNytr+ADm4zAmp5kFomgta8H/V9agYhSTr6o1f5t6byBbQtNR
         LCahRg6zjHEs07Oc7PqjYUY/tAINKb6gCSN9SVVK1qv9xw3hIb0Lxv+hTjQxq2Dw515d
         YW8A97ln7/4+it2hWhQ+3h52ky8N9GgenEovFel6wIha3BRl6oiiTJWxaNnVSqqzZ5w7
         1EIkoExQzX+JQZiH1bjKl3VX3fzQM6zWgqS4n8HJiKZXfc6EP1cQInYk5aOULHFKvaee
         kU0uis/PgBthxAf5wR7/pAc24CoQ71uLazQep8X2hP8EbEgS5NpqiJEJCFkMqOBKm1zv
         Hrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzJhoV3HmsUkNrfCb9SHGhf85+7gyTZEICckTTZh/aE=;
        b=cPmbo9TjFHCO1wSP4ZaDXIVlUaqF+yGT/Tcl7XNyZyX9uG5dYDPaAbJZdgGScexYst
         AhUKIazcYx6umd7Sc3nO08+bK/rbBdoePESv4JUl9eQ69clH6kHAJJ7GMsLdmLm6015b
         nkfkhh5+bNXUcet8b1FAlBfI1amZXNu8nkUDkAmPywD1E/NQf4jqiTxBMh3+k5QzeCRO
         Dnd9kjIuwVykClFkuU3mxCHKsL8EJb2x7EyMpY3FJjT6kftTpkXT1Tz2RAD0XFFO0fp6
         6LBI7PFWhrvwRrNs+ua1Al/PWGgh5lraQWCaXC0gQeUGJp9+KKvG99nQDmZf6rvPqljw
         vrgA==
X-Gm-Message-State: AO0yUKVdqZ5PkC+726rsCDsTZXpw766yiGTve1dyTioptE2x5XJ97RUk
	ePBt6iZzLJXiAwTuYDq25OdmuXUFd2kGBayFMF/zwg==
X-Google-Smtp-Source: AK7set/C7m3gRJtF2smsD9KrApMl+5if6kuQRwt+IEmk635RYBoR+6RvbwCDqKIob+I+QiZWOyrqu86cui6jAk+Etew=
X-Received: by 2002:a67:cf47:0:b0:411:c1a0:c787 with SMTP id
 f7-20020a67cf47000000b00411c1a0c787mr1602398vsm.26.1676607632191; Thu, 16 Feb
 2023 20:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-3-yuzhao@google.com>
In-Reply-To: <20230217041230.2417228-3-yuzhao@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 16 Feb 2023 21:19:55 -0700
Message-ID: <CAOUHufYsiFx=AqnZ6gDCjEHq4cN6XVXF6fPRvGpaXJbbmvoCPQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 2/5] kvm/x86: add kvm_arch_test_clear_young()
To: Sean Christopherson <seanjc@google.com>, David Matlack <dmatlack@google.com>
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
> VMs that are not nested and run on hardware that sets the accessed bit
> in TDP MMU page tables.
>
> It relies on two techniques, RCU and cmpxchg, to safely test and clear
> the accessed bit without taking the MMU lock. The former protects KVM
> page tables from being freed while the latter clears the accessed bit
> atomically against both the hardware and other software page table
> walkers.
>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 27 ++++++++++++++++++++++
>  arch/x86/kvm/mmu/spte.h         | 12 ----------
>  arch/x86/kvm/mmu/tdp_mmu.c      | 41 +++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+), 12 deletions(-)

Adding Sean and David.

Can you please add other interested parties that I've missed?

Thanks.
