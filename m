Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F33A0834
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:17:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G073B2zp1z3bty
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 10:17:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=osmrq6EE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=osmrq6EE; dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G072k1hmMz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 10:17:01 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id z1so22361106ils.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 17:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=Q7umJMxlcORXR8DXG5jeDR7TIw3EETGwHHTK3QtzcYo=;
 b=osmrq6EEKAmwXGO/ag5dY9/jajOyVwQXpRNKs8GMHVHuhmDzAL9cVQjwcfNeyNcXn0
 IohPl1F9egwLhobBY44FPD/W6IiYAVhBueN86+qrXveAZpBrolRQFIR5hVqStziJ/4SZ
 5uHkK9+YdImOVE0mM6m1zByJgRl/z/ykAruJ4QatYWyWL0/P4djpnlS2vMtRmmb4GmAo
 GFPwNrcvpN2oBBq92E6StvD+uYSaj1yGsKY9VnC5mJ+WRtKLog6bLjjKAHxIy8wXIKLF
 WlGinZaID9doaVmdBN2Sxji2g0zpq/MUuB0Nx5ngndjKogYUKmhYFUzertPiODPt2AN+
 WMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=Q7umJMxlcORXR8DXG5jeDR7TIw3EETGwHHTK3QtzcYo=;
 b=bZwHzSP6/Ao5ARMSnd75i0GRwvPwsz7kXsZ5HHaIKdZk6HAeNGrM6Rttt7z2hhUPlw
 nGgfthAkd/oveXyAOnjCr/9CrZETx/K6DytV5mTT4I5it3ifplN6tBNznJdusWUjrCpe
 aCWL4akFArg+Ok6OmFX6e30S+uvOyGKEhH/s61QYx0ZIQe26vaC6+GzmvwAg0FvGhzyW
 w56jIQ558ntvUNGTcwJHvz0T85/2tHMqeWxoOZmcuzV5SwUVZDe7MoNqnFF6RIfu6oIl
 9MX9l272kFLPaPRSnm4PaZxQ5nOedTuUJXI+8r9B4IwlcXDLiV0Vz/+yqkBvmUwPlk6p
 p8Ww==
X-Gm-Message-State: AOAM5329LJfH2UIMAxAr0gwi97czAYKlkYd+CodN4mGe0dHdVwqlnGya
 mCYGEpfCqfHOiKY2E92nUPQtx4PCaoKBiFbLag==
X-Received: by 2002:a05:6638:210d:: with SMTP id
 n13mt23313954jaj.7.1623197817102; 
 Tue, 08 Jun 2021 17:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210608103359.84907-1-kernelfans@gmail.com>
In-Reply-To: <20210608103359.84907-1-kernelfans@gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Wed, 9 Jun 2021 08:16:46 +0800
Message-ID: <CAFgQCTvM7NJSxXbOC7XoKzZwEsWcL2hRupvtsYA=Fi4um9rVCw@mail.gmail.com>
Subject: Re: [PATCH] crash_core,
 vmcoreinfo: Append 'SECTION_SIZE_BITS' to vmcoreinfo
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Baoquan He <bhe@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Boris Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, k-hagio-ab@nec.com,
 James Morse <james.morse@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Dave Anderson <anderson@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Correct mail address of Kazuhito

On Tue, Jun 8, 2021 at 6:34 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> As mentioned in kernel commit 1d50e5d0c505 ("crash_core, vmcoreinfo:
> Append 'MAX_PHYSMEM_BITS' to vmcoreinfo"), SECTION_SIZE_BITS in the
> formula:
>     #define SECTIONS_SHIFT    (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
>
> Besides SECTIONS_SHIFT, SECTION_SIZE_BITS is also used to calculate
> PAGES_PER_SECTION in makedumpfile just like kernel.
>
> Unfortunately, this arch-dependent macro SECTION_SIZE_BITS changes, e.g.
> recently in kernel commit f0b13ee23241 ("arm64/sparsemem: reduce
> SECTION_SIZE_BITS"). But user space wants a stable interface to get this
> info. Such info is impossible to be deduced from a crashdump vmcore.
> Hence append SECTION_SIZE_BITS to vmcoreinfo.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Boris Petkov <bp@alien8.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: James Morse <james.morse@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Dave Anderson <anderson@redhat.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kexec@lists.infradead.org
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  kernel/crash_core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 825284baaf46..684a6061a13a 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -464,6 +464,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>         VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
>         VMCOREINFO_STRUCT_SIZE(mem_section);
>         VMCOREINFO_OFFSET(mem_section, section_mem_map);
> +       VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
>         VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
>  #endif
>         VMCOREINFO_STRUCT_SIZE(page);
> --
> 2.29.2
>
