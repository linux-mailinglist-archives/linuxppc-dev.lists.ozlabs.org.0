Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D8703D68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 21:12:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKpsr3QBBz3f8P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 05:12:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W/Z9qzmB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=W/Z9qzmB;
	dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKprx2nbmz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 05:12:00 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-ba6d024a196so4251699276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684177917; x=1686769917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEdsDznoeQ0wGPMJWBs10mMvCj7VphDqPqR+uizklHY=;
        b=W/Z9qzmBUq3bCVhP8uewmPEIaZEVYfzpzeh9YTeAKrK3sWIwtOfql71JlvN0P+P5pK
         YKy9cml02fk4SnFQ2DdWQ6w4JijHunpNA4zsiud1GYDMnfuy8RTxF/bEehOFA+aPeByE
         DTSRG2bdMMqymbgvM1f+cbSlSYq+sQANl8uMoYLlmajJ3SyWJdGVyTNcYD0Ioakieviy
         BESs3L0iPHTKfiNNq75aO8FTJdn/BYay+E8sIKUXSqB49RgAR5VB2xxzW+nwEEKofO5F
         26ssX78nNr5JZdvfN8wyMBJyb6MRO06YlrKHWh/GpY8CaWKtewkcbGK5ZJkz6FL2Wiq9
         dAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684177917; x=1686769917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEdsDznoeQ0wGPMJWBs10mMvCj7VphDqPqR+uizklHY=;
        b=dCclEfrw1StTdxdaE/j+PzTJzIp2nn1Jw1hQ4xUNI2m8YEj+E8Z1L71o5F1hx0hbpD
         Z5TA6UauWgKI6/lDRj0yGh7iNJ87YN4ZNyfmjMGhqTtGngn/Y4MViwTRouMkFS1GDtqt
         pEQJFaUAV9kDfw30RskgWlxq8+MReFpHGqyJWogBBi2FmIxV39CToHGTgtHo0B4Ttoj5
         o9VHStbNTx3KzziuzLXQK4Z2FCEO5HT0N4zYWDdNsHfg+ZYDswsfizXkO/Y7my4AGosH
         775jH8hFg3bp0/9tGd7rUPuYLzEb2C6ANRdYvfQCy5WG930THS6bn5QMhO9bQqgXWZSD
         ge5g==
X-Gm-Message-State: AC+VfDxVIvvBHOVOZEkpLwVpwWZqhlEFKF1owPbobjwHXYzsEM0AH27+
	tIyLLLiZx5n2BeHXd9mEYV+3olx8cPaRs6ji8Po=
X-Google-Smtp-Source: ACHHUZ5oDsw20tcH12/01C4i2nT6w5iAb2H6/okJg55EYYpqTgJ8h9iiRdXz2tD9egoOuSwMxk4Rmyquuvv7u/aep3U=
X-Received: by 2002:a25:2586:0:b0:ba7:809c:50de with SMTP id
 l128-20020a252586000000b00ba7809c50demr6158133ybl.38.1684177917068; Mon, 15
 May 2023 12:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-31-vishal.moola@gmail.com> <c0677d21a4b6caa2e5018af000294a974121d9e8.camel@physik.fu-berlin.de>
In-Reply-To: <c0677d21a4b6caa2e5018af000294a974121d9e8.camel@physik.fu-berlin.de>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 15 May 2023 12:11:46 -0700
Message-ID: <CAOzc2pz6y=gRcdfkQVgwRuzWeWf2Nx-UBtKnZBTs2qKJ+r7R0Q@mail.gmail.com>
Subject: Re: [PATCH v2 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 6, 2023 at 4:35=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Vishal!
>
> On Mon, 2023-05-01 at 12:28 -0700, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents. Also cleans up some spacing issues.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  arch/sh/include/asm/pgalloc.h | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgallo=
c.h
> > index a9e98233c4d4..ce2ba99dbd84 100644
> > --- a/arch/sh/include/asm/pgalloc.h
> > +++ b/arch/sh/include/asm/pgalloc.h
> > @@ -2,6 +2,7 @@
> >  #ifndef __ASM_SH_PGALLOC_H
> >  #define __ASM_SH_PGALLOC_H
> >
> > +#include <linux/mm.h>
> >  #include <asm/page.h>
> >
> >  #define __HAVE_ARCH_PMD_ALLOC_ONE
> > @@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *m=
m, pmd_t *pmd,
> >       set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
> >  }
> >
> > -#define __pte_free_tlb(tlb,pte,addr)                 \
> > -do {                                                 \
> > -     pgtable_pte_page_dtor(pte);                     \
> > -     tlb_remove_page((tlb), (pte));                  \
> > +#define __pte_free_tlb(tlb, pte, addr)                               \
> > +do {                                                         \
> > +     ptdesc_pte_dtor(page_ptdesc(pte));                      \
> > +     tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
> >  } while (0)
> >
> >  #endif /* __ASM_SH_PGALLOC_H */
>
> Looking at the patch which introduces tlb_remove_page_ptdesc() [1], it se=
ems that
> tlb_remove_page_ptdesc() already calls tlb_remove_page() with ptdesc_page=
(pt), so
> I'm not sure whether the above tlb_remove_page_ptdesc((tlb), (page_ptdesc=
(pte)))
> is correct.
>
> Shouldn't it just be tlb_remove_page_ptdesc((tlb), (pte))?

As of this patchset all implementations of __pte_free_tlb() take in a
struct page. Eventually we'll want it to be tlb_remove_page_ptdesc(tlb, pte=
),
but for now the cast is necessary here.
