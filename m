Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3337B31F4A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 06:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhfxm24qkz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 16:18:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=mCUCsWcN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=mCUCsWcN; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhfxL0D5qz30Gc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 16:18:27 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id b8so2702191plh.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 21:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dOSKkRk/bzqzj43v5P9ak3HT+jUMbvevUBEbWD/wiYc=;
 b=mCUCsWcN8EJvFt0JHWA9xAhHK9agA73CiOuRUp0P8McEzqnyBhYK4kgTGDgTJtMy9i
 1TRAaJ89XPH0H7e2GlnzVaf9wXoEJSx1IF1goGU8GSDYmhgYwl4ewX4uu0bFxcvEEuOE
 YgZUl8I7QqOMeM/xrkfkLScBRWM6pW19lfi30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dOSKkRk/bzqzj43v5P9ak3HT+jUMbvevUBEbWD/wiYc=;
 b=t0DVDqbbJ5RNXfLhqzk7ttBsjfL7q8rD9p65w3GNDidIwHcrCJQazcTNNxWMrxdcrc
 yKqP7NUlvYuSzlv7r9tjA1TpHhFVqLM6iE2SQ4EalmSFvOx8IDLXIgOfnUoGxd7KXxD7
 MWocM/dADYg6j0gsmXGXcGD1+9+L2sznhi8yEfX2W4cFWdk3EDd5HR3WLB8AvzbXzYQR
 QdFtfp6e3QPp6fdrZkz/g/jWIkIb5Agy7Xg8mD1wSk+3EHa6qTrNb4EUOCByVvYJ+u1Z
 5gVV5dl1vIftI8iR+wIXYZ6M20ZaM2yZDSx3Jj1KhMeNOvl2k+K0dn5CwN0tJ11Xuzf7
 5uHA==
X-Gm-Message-State: AOAM531LXp+KZm0r6gbVycotn1tXnCAIyNiW1SiN5GkCzWq/celifwFp
 82jS0itB/j7gEdzzBS1X1VoFcQ==
X-Google-Smtp-Source: ABdhPJzqRyzbsmPJm7JLbxU9H49OdN0ac/604fQ1hGBxAeDc5TDke5FrpPWfyXkola5Oo9V4dERBBw==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id
 a14mr1696085pju.196.1613711902856; 
 Thu, 18 Feb 2021 21:18:22 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id o9sm8081438pfp.21.2021.02.18.21.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 21:18:22 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] KVM: PPC: Book3S 64: move KVM interrupt entry to
 a common entry point
In-Reply-To: <20210202030313.3509446-2-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-2-npiggin@gmail.com>
Date: Fri, 19 Feb 2021 16:18:19 +1100
Message-ID: <87o8ggab50.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -0,0 +1,34 @@
> +#include <asm/cache.h>
> +#include <asm/ppc_asm.h>
> +#include <asm/kvm_asm.h>
> +#include <asm/reg.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/kvm_book3s_asm.h>
> +
> +/*
> + * We come here from the first-level interrupt handlers.
> + */
> +.global	kvmppc_interrupt
> +.balign IFETCH_ALIGN_BYTES
> +kvmppc_interrupt:
> +	/*
> +	 * Register contents:

Clearly r9 contains some data at this point, and I think it's guest r9
because of what you say later on in
book3s_hv_rmhandlers.S::kvmppc_interrupt_hv. Is that right? Should that
be documented in this comment as well?

> +	 * R12		= (guest CR << 32) | interrupt vector
> +	 * R13		= PACA
> +	 * guest R12 saved in shadow VCPU SCRATCH0
> +	 * guest R13 saved in SPRN_SCRATCH0
> +	 */
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	std	r9, HSTATE_SCRATCH2(r13)
> +	lbz	r9, HSTATE_IN_GUEST(r13)
> +	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
> +	beq	kvmppc_bad_host_intr
> +#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> +	cmpwi	r9, KVM_GUEST_MODE_GUEST
> +	ld	r9, HSTATE_SCRATCH2(r13)
> +	beq	kvmppc_interrupt_pr
> +#endif
> +	b	kvmppc_interrupt_hv
> +#else
> +	b	kvmppc_interrupt_pr
> +#endif

Apart from that I had a look and convinced myself that the code will
behave the same as before. On that basis:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
