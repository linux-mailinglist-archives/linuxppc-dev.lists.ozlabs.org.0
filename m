Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA956FEA4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 05:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGyPF66zpz3fYK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 13:41:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rviiAWub;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rviiAWub;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGyNL2H4mz3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 13:40:49 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-55b7630a736so121577207b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 20:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683776446; x=1686368446;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENej4jeIUZxBD8VRbCOiI8elHKtxPPI57IP2BPex2w8=;
        b=rviiAWub81WZaaPcAMwIMpPx+RM5d7a1hQGcoQ8Eqv2OqKv43ouIJ6GM0Wqm5MKw19
         LlfJ3mauLEKM4EJ7ZB4sOpgDUGoN5Ak/+OXf8SHKvg8BrrIQ8mj26P/t+9KKCmZeNAR3
         c3aByxh2kGch+WNujk2ErjRPhOnwQeT92JRc5DBl9JJAmmzq7/qiNEJWuS0m7V9Devz8
         0Vopapo7pIiPZPd8xIHbRWy7CL2RdDqu7m1Q6FJFKKBLqxrFd0oOXOuWSyJ5b+ZPMXeF
         OsW+3BbBiu8BwYCTIqJ9f3bU46zyRenionGejcnHG/apa36HhsSJADojKmBj7efm6f3a
         MOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683776446; x=1686368446;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENej4jeIUZxBD8VRbCOiI8elHKtxPPI57IP2BPex2w8=;
        b=eBLWrARxpxxaVkHdbwE39V7E3Hgf6xLiBXyyH7Kzs1b//dMQHyOlRHw3/lY3ic0TJ+
         BLKMoeD7KCo6fKOKxMMeLhjv+DGrGVfgpXPTQvc5Vvnny6F1YO6lplLMwvpr8lqIZW1m
         BxKcZONEGxxSWN8KVX3yLDZWQj6Ky/c8ROtZJ6evU0eH5A534CUwfuloy4R7tkmhazRN
         B27Z/chenp2k+3g6ISvT0Rqml704b+ophfPsKm0VZsFmGv0QPeffoITlQhWZ3ArJgGJa
         yzU1/L1hiFPf6BJhVhsiX/sv/lxXQrFUd/DcjM/0od2XMU/V2I60IxQHiwghgM0YMEbH
         SkkA==
X-Gm-Message-State: AC+VfDw5j0R0Ln32pkJRIQZgv44oXfpr8g/8Fi3sI5O8f6uCulTTJMPE
	ZwlJWz+bfOg/o7kMhJ3fGE27VA==
X-Google-Smtp-Source: ACHHUZ7h//pElwTWDcmRkblmnEL8tpIvH3DpaXFnfKmYUIesZtUkvvAepMEKFrx4IKpikCPoidpc1g==
X-Received: by 2002:a81:8702:0:b0:560:bb81:6468 with SMTP id x2-20020a818702000000b00560bb816468mr6471997ywf.23.1683776445583;
        Wed, 10 May 2023 20:40:45 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id g138-20020a815290000000b0054629ed8300sm4571040ywb.80.2023.05.10.20.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 20:40:45 -0700 (PDT)
Date: Wed, 10 May 2023 20:40:41 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 01/23] arm: allow pte_offset_map[_lock]() to fail
In-Reply-To: <ZFup/fG50MPFF979@casper.infradead.org>
Message-ID: <b9dc75bf-b13c-37ba-6c16-9fc163703dd@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <5011977-d876-6a24-a3fc-c7e6a02877b8@google.com> <ZFup/fG50MPFF979@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@mo
 nstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 May 2023, Matthew Wilcox wrote:
> On Tue, May 09, 2023 at 09:42:44PM -0700, Hugh Dickins wrote:
> > diff --git a/arch/arm/lib/uaccess_with_memcpy.c b/arch/arm/lib/uaccess_with_memcpy.c
> > index e4c2677cc1e9..2f6163f05e93 100644
> > --- a/arch/arm/lib/uaccess_with_memcpy.c
> > +++ b/arch/arm/lib/uaccess_with_memcpy.c
> > @@ -74,6 +74,9 @@ pin_page_for_write(const void __user *_addr, pte_t **ptep, spinlock_t **ptlp)
> >  		return 0;
> >  
> >  	pte = pte_offset_map_lock(current->mm, pmd, addr, &ptl);
> > +	if (unlikely(!pte))
> > +		return 0;
> 
> Failing seems like the wrong thig to do if we transitioned from a PTE
> to PMD here?  Looks to me like we should goto a new label right after
> the 'pmd = pmd_offset(pud, addr);', no?

I'm pretty sure it's right as is; but probably more by luck than care -
I do not think I studied this code as closely as you have now made me do;
and it's clear that this is a piece of code where rare transient issues
could come up, and must be handled correctly.  Thank you for making me
look again.

The key is in the callers of pin_page_for_write(): __copy_to_user_memcpy()
and __clear_user_memset().  They're doing "while (!pin_page_for_write())"
loops - they hope for the fast path of getting pte_lock or pmd_lock on
the page, and doing a __memcpy() or __memset() to the user address; but
if anything goes "wrong", a __put_user() to fault in the page (or fail)
then pin_page_for_write() again.

"if (unlikely(!pte)) return 0" says that the expected fast path did not
succeed, so please __put_user() and have another go.

It is somewhere I could have done a "goto again", but that would be
superfluous when it's already designed that way at the outer level.

Hugh
