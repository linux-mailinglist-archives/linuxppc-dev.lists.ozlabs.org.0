Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF028617A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 16:46:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5xwz0B22zDqQP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 01:46:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=jannh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nkOVjFaa; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5xsd3ZTTzDqDF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 01:43:29 +1100 (AEDT)
Received: by mail-ej1-x643.google.com with SMTP id a3so3301874ejy.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Oct 2020 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yaN1rjyLrPsyFHJUcCMRII0CnG4UdUmiNrPeZE3+a2o=;
 b=nkOVjFaap1/yZl4CUDg4K4Ox8KSB9wy9sJrCPdFITMcuwfROhxDXnBr9RlyK9JOwM1
 VEAi9SVibNPsv71oy6nhtbqsusqW+/QiwUIyumUUh6zDmPusa/d38voD+N5QCxtT+5f/
 nCjBDNyPjCzVz7ySiHW+pDlThvHFopXt0tucDzNe3e51j5RFzbT8e7VerZ/62jYKjCVh
 y0cBmyibSPFBSvmMxoM2VWww8R5ehMlVAvmJbE7YH+sLVtXF2ZcP8ulxgyDu8nOH9oZW
 KiircQAwFxmSIXUj/e/0IYDv/uPIpHIPSX+blkBd56Qpag2B3btDwunrD7oqikY7az1J
 /dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yaN1rjyLrPsyFHJUcCMRII0CnG4UdUmiNrPeZE3+a2o=;
 b=GSbisaptG3m2UG15OQH18hR0YIeo82GHc5nlXhhrmu/RjMwNuMhpBqB8NaQOAGxhFI
 ZGMp3QXAoJJN59jPDBIhEoTkqrlpSZWHQbsqHfItn8nuNiFXjMP6Knvz7q9JNl9V2LSN
 qE9Kd1IKBM54tiQHbD1nIJOlf6cyvBLDf9DoniRaLl3TQ+zESxrJ0L2qQWAIeSrVAPoC
 YvBVp/YRYpz4QL6keXsOlGlykpPmTeZjbZrLxi4XgteyjoSR8kfPYSrih/KyD4e5wsAV
 Yduyko0fLNAnpQ6f1z5j8GqNrGdyLULHrySbUQAbRX0E9kyEm4Bn4wpupNmchJQBkw9I
 yFNA==
X-Gm-Message-State: AOAM531JezI93Vq/W2nmAoLiCxFF8CK4L1sTyVbpZ32M3aRXE+mArtC/
 k1m3nNcBGknUuvCGJwZfbA11AWTYn5zTnQqYfsgEuQ==
X-Google-Smtp-Source: ABdhPJzcK0C/z7p/R/rO2dkoBnGMVzKrffZV6M0+dNfgCx+3Vi4jT221WFvbiB0KTziaharLk7wRJUaJVTHbRe80EQQ=
X-Received: by 2002:a17:906:33c8:: with SMTP id
 w8mr3659464eja.233.1602081801820; 
 Wed, 07 Oct 2020 07:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201007073932.865218-1-jannh@google.com>
 <20201007123544.GA11433@infradead.org>
In-Reply-To: <20201007123544.GA11433@infradead.org>
From: Jann Horn <jannh@google.com>
Date: Wed, 7 Oct 2020 16:42:55 +0200
Message-ID: <CAG48ez3kjTeVtQcjQerYYRs7sX5qq3O7SU-FEaYLNXisFmAeOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
To: Christoph Hellwig <hch@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
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
Cc: Dave Kleikamp <shaggy@linux.vnet.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 kernel list <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, sparclinux@vger.kernel.org,
 Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 7, 2020 at 2:35 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Oct 07, 2020 at 09:39:31AM +0200, Jann Horn wrote:
> > diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
> > index 078608ec2e92..b1fabb97d138 100644
> > --- a/arch/powerpc/kernel/syscalls.c
> > +++ b/arch/powerpc/kernel/syscalls.c
> > @@ -43,7 +43,7 @@ static inline long do_mmap2(unsigned long addr, size_t len,
> >  {
> >       long ret = -EINVAL;
> >
> > -     if (!arch_validate_prot(prot, addr))
> > +     if (!arch_validate_prot(prot, addr, len))
>
> This call isn't under mmap lock.  I also find it rather weird as the
> generic code only calls arch_validate_prot from mprotect, only powerpc
> also calls it from mmap.
>
> This seems to go back to commit ef3d3246a0d0
> ("powerpc/mm: Add Strong Access Ordering support")

I'm _guessing_ the idea in the generic case might be that mmap()
doesn't check unknown bits in the protection flags, and therefore
maybe people wanted to avoid adding new error cases that could be
caused by random high bits being set? So while the mprotect() case
checks the flags and refuses unknown values, the mmap() code just lets
the architecture figure out which bits are actually valid to set (via
arch_calc_vm_prot_bits()) and silently ignores the rest?

And powerpc apparently decided that they do want to error out on bogus
prot values passed to their version of mmap(), and in exchange, assume
in arch_calc_vm_prot_bits() that the protection bits are valid?

powerpc's arch_validate_prot() doesn't actually need the mmap lock, so
I think this is fine-ish for now (as in, while the code is a bit
unclean, I don't think I'm making it worse, and I don't think it's
actually buggy). In theory, we could move the arch_validate_prot()
call over into the mmap guts, where we're holding the lock, and gate
it on the architecture or on some feature CONFIG that powerpc can
activate in its Kconfig. But I'm not sure whether that'd be helping or
making things worse, so when I sent this patch, I deliberately left
the powerpc stuff as-is.
