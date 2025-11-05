Return-Path: <linuxppc-dev+bounces-13782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E09A3C33F21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 05:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1XsD5MCKz3btd;
	Wed,  5 Nov 2025 15:48:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762318128;
	cv=none; b=IVAwy2pfjt5HO7eC8E74KiDtJipbFQMNsLpAevkCu5ivH3+04J0psa145oazi7ZQ4Onr2j7FVJCs5unhdPRexHSX749Nr+ae+UGe+YDp/vLFYVYOLNuHagSHJEiI5nRIMJjp7LuCP3BDyF7i/4rG1vVx7m9ad8mnArI3DgH9vU1rkRnPVKO0dNxS7sh7WxuFPToIsDABhj5ov244uBCC+/nCddzotirJ3j5kt1jivRYv/I34m/A23y2iIMyp0vx5bDjVbrrx7+nSV9BA6sBtXgwSrf1BbEPtSv1+1ZDGdB5jPueo8WDagolU8Clnfj/5XtLxADAdSQPj5slI3l/3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762318128; c=relaxed/relaxed;
	bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=XiZhwXKIFgRxivIrzMWGmYSBK2lV6w0HONu/pTw/edvNWQS1vAE7ZrJyRvaw2yCupd6VxQY1+CyATpr875uItMlfHmOBCeJgQlbPmJm+bBijyKSX28kJZfOH/u0EPGYbhfgQiXTsF2NEi/jQZhx1QNArJJzhItg2TWUwSpYLf6PccRvxJWiCHjKu593E5HNZLTQgCmY6pDanifGB+ccu5MscE8G8paKc4AUNWQdn0afo55ux9p2bKTOTzpqk0VfV/km8kcHfOrBYA9o21PDd4TlEdwvEb+jsxVq85TeJbjNyPCrgzmAcIlHUq3uTchH2j13gBX81oMDeBNTblw/vgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C2QJTwec; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C2QJTwec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1XsC320Zz30M0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 15:48:46 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b679450ecb6so4749479a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 20:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762318123; x=1762922923; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=;
        b=C2QJTwecx9BkMbgyfmCW5DWstZtXwdQR7b2dRY9IViwwFx7lVCajS57N+nhgWGHm7j
         TXW5nBUTkFdXyUEyRuo0WCMHdi8bhKyD/cSYpOqvJOJdAW6JIckbamC99lqr4kev12MF
         2kUWHNd/yN1EC7P/278V5WRr3uGgFT1EyokvxPb9qkR3CPsHT93Kdj7dRFRCE9Si7AqF
         bXs9SNUxplrLS2vlYsXE3ZWmmOWNHLWlH7L3RC/ejG6VP3lBUMbktFYMyF2dYmoNxMxh
         nImd84axMvvoIrvHd0CRoRcpn5D4IUZTLqkrITtSLWk/2VR53L2meh/4Rd3b0UCq7BgF
         A+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762318123; x=1762922923;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=;
        b=iEIfBqIutztMV5hVQT1BaeJ7tMhfTN/EZkCMl2LrGz68SDrSNypI3FdWr4wkul8U5+
         J8eUqrIWXne70DEcABftqf9Y7vNEO8u+/F3Jd31Is1ZOIglCfeh7bBPNgHBvKRt7CUas
         a+glRpETAZUceOao2dEp/vu0pXqqkDGoRveYCDlR8YJ1Ad1085k5TxknbSmonDbhrMwu
         z6yoGFA3cgHQ1WvjViB5h7fiLHIcfnC4L+F+wb2CVdxZ5dOLTWV2Y4ITLCjZE70HA6lO
         tRsRWGDFqAswOck6hn/UuUgO18/NQmucOACVQQbTyNraHhSLCRWvHBPfTwkG28Lw8yMM
         +oPA==
X-Forwarded-Encrypted: i=1; AJvYcCVVKC0H/8B/GMckClqQEJVAuTfPXC6DNcWXCxrMOq3tBrgRFrWvAp15weMnXpN+1WN5U0s8DkMkAqwBO1Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxl+lgwjWnIxIvkOgSyDwesShnAhXKDSKgW8bem7yGHUSA435a/
	Kduw7fTF3pKJDUsKd/pVAT98XDUR0zxbvDeHszWewVAKfgHgVsF13Vw+
X-Gm-Gg: ASbGncu9aeJ90U46590n3slKl5f03DHUVJJuVBlHcOUZ+cJDcPWgFBeFyeNLx/LEai+
	1fgo8GjZIATf3Bxunab8QB+iQiAUg03bYIFgQyX6GzSS4Mx4q/DziPeKgo9m8CaSf0WEnknPD4g
	xwMLRzecWsYGZUmEY01DXK5MJakMfF8FCBTdQHnOVvmfc0XJ7BLbZDeGbfLjgC5wgFstx15dHcq
	dEoHcgfpIxODEg/2dAqiu9nOVuHh+mESgSvo/2gAuAUbcKjUDqmUWizlp472uk64xnkAOPu+Ba4
	N9+38xJF0orTgSwQAwiwqaxCHGECJM/dpLF8xXmmGqINq37G39gfVdP6+rR8LUqpAMQAbVaZkKi
	gyqDYShHXZhU+EVY4gsl883EUY9MQ5edogB2wfUgZfNKsTaaWCH5Jjk4Qu0kqz2C0RvGOJg==
X-Google-Smtp-Source: AGHT+IEGT+eOgR9ydzqm23BJtuNpA3RB5HWaj5Ha9KjzqVJ/S6kqSTkQbIaWCHaOF+SdxbuTbYvUtA==
X-Received: by 2002:a05:6a20:7483:b0:34e:63bd:81c1 with SMTP id adf61e73a8af0-34f839f5a57mr2604485637.3.1762318122822;
        Tue, 04 Nov 2025 20:48:42 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6824811sm4742988b3a.64.2025.11.04.20.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 20:48:42 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
In-Reply-To: <20251029100909.3381140-6-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 10:10:33 +0530
Message-ID: <87o6ph3xdq.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-6-kevin.brodsky@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Architectures currently opt in for implementing lazy_mmu helpers by
> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
>
> In preparation for introducing a generic lazy_mmu layer that will
> require storage in task_struct, let's switch to a cleaner approach:
> instead of defining a macro, select a CONFIG option.
>
> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
> arch select it when it implements lazy_mmu helpers.
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
> relies on the new CONFIG instead.
>
> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
> selected. This creates some complications in arch/x86/boot/, because
> a few files manually undefine PARAVIRT* options. As a result
> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
> breaks the build as <linux/pgtable.h> only defines them if
> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
> way out of this - let's just undefine that new CONFIG too.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/Kconfig                                 | 1 +
>  arch/arm64/include/asm/pgtable.h                   | 1 -
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>  arch/powerpc/platforms/Kconfig.cputype             | 1 +
>  arch/sparc/Kconfig                                 | 1 +
>  arch/sparc/include/asm/tlbflush_64.h               | 2 --
>  arch/x86/Kconfig                                   | 1 +
>  arch/x86/boot/compressed/misc.h                    | 1 +
>  arch/x86/boot/startup/sme.c                        | 1 +
>  arch/x86/include/asm/paravirt.h                    | 1 -
>  include/linux/pgtable.h                            | 2 +-
>  mm/Kconfig                                         | 3 +++
>  12 files changed, 10 insertions(+), 7 deletions(-)

Maybe we can add this to ... ?

Documentation/features/vm/lazy_mmu/arch-support.txt

#
# Feature name:          lazy_mmu mode
#         Kconfig:       ARCH_HAS_LAZY_MMU_MODE
#         description:   arch supports arch_{enter|flush|leave}_lazy_mmu_mode()
#
    -----------------------
    |         arch |status|
    -----------------------
    |       arm64: |  ok  |
    |     powerpc: |  ok  |
    |       sparc: |  ok  |
    |         x86: |  ok  |
    -----------------------


As for this patch, the changes are mostly straight forward around the
configs part. This looks good to me. Please feel free to add: 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

