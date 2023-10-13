Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324E17C8EB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 23:04:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hyOkyV3i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6fBl0gKlz3cbx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 08:04:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hyOkyV3i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6f9q51pxz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 08:03:25 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d9ac31cb051so2412165276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 14:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697231000; x=1697835800; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=hyOkyV3iQ+iqCtc9Ia9ogb8ySsoZxo7DE/DC8cHOnHEmXznDYBDnesLqaaZ8CfPJV6
         9VcLS8NJRE8fjVCxeZ0Eh04e/e+/VznFZEKbVQ9/bNhL1Q5FNG2irOMVoMayQ1DPJ5lB
         ++YNxNj/lBGmRhilJOufImzBr7keXSb4pjgW1okOfM6Zuy+qSPZBVfKb3YkMpHIhUOKW
         P8U1cjJ4CZBeFlI6Rra3AknWjZ3Oh/IP344oCRRS17ubckNgWV5Yx+6GM8FCmpQ05RTR
         qEf9aZVSouvApPaOXBQLkq/JdkK5CD+ZzBe4HuUw074fJYPmxLVta4CI+C7oACFoJo+r
         fmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231000; x=1697835800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=kJ/2N7EZ67WRHjzv+d3CwUCGMIvT5Z4o9ABGguCL/JQ3q73l8QcmyAabOx/jt1qVlw
         ANZxW1w6NSSuOax3Yk4qw3FNpyyeCD5j8ViFw2L+tmFcu+8CIiu+2nMqgMYS99DblMlo
         DfP5xpdL0L5ubAiwGvGvZ29k5WeEyGi0nr3iOJT64OjG87Y8L7J0Z6J+aE5DBTNJUUYp
         /Fa0xsl5Cvuh6wENdoWZjO5UyUn/giQ+13pcL3K+LbJCcnVG/kxqNMGSKcuhAuAEupkT
         Uo5Dv1QoKzFnkzvF0WF4i6at78DaonBTrCgrnHO/PdY59Y3tB52Ffi894uijE9/HEk2T
         FVgw==
X-Gm-Message-State: AOJu0YwCcZDYMJnL816MInio1NtadYQCduBPlhPKr5c8pJNeD4oT5fh/
	/TDVsM+oudN/NAGBcbHn9ZD99wJvfaN6XJPYTWc=
X-Google-Smtp-Source: AGHT+IHWHj9ILTPWExZ8ekeA0/ryyRW0ZV6k5VhEVnOo+k5EpZsvEbKt/nom23K7vTTS2zHZvjjk2tEmm58T8MLLm1U=
X-Received: by 2002:a5b:64d:0:b0:d9b:3b3e:5a07 with SMTP id
 o13-20020a5b064d000000b00d9b3b3e5a07mr2004058ybq.5.1697230999223; Fri, 13 Oct
 2023 14:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230807230513.102486-1-vishal.moola@gmail.com>
 <20230807230513.102486-15-vishal.moola@gmail.com> <20231012072505.6160-A-hca@linux.ibm.com>
In-Reply-To: <20231012072505.6160-A-hca@linux.ibm.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Fri, 13 Oct 2023 14:03:08 -0700
Message-ID: <CAOzc2px-SFSnmjcPriiB3cm1fNj3+YC8S0VSp4t1QvDR0f4E2A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v9 14/31] s390: Convert various pgalloc
 functions to use ptdescs
To: Heiko Carstens <hca@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023 at 12:25=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com>=
 wrote:
>
> On Mon, Aug 07, 2023 at 04:04:56PM -0700, Vishal Moola (Oracle) wrote:
> > As part of the conversions to replace pgtable constructor/destructors w=
ith
> > ptdesc equivalents, convert various page table functions to use ptdescs=
.
> >
> > Some of the functions use the *get*page*() helper functions. Convert
> > these to use pagetable_alloc() and ptdesc_address() instead to help
> > standardize page tables further.
> >
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  arch/s390/include/asm/pgalloc.h |   4 +-
> >  arch/s390/include/asm/tlb.h     |   4 +-
> >  arch/s390/mm/pgalloc.c          | 128 ++++++++++++++++----------------
> >  3 files changed, 69 insertions(+), 67 deletions(-)
> ...
> > diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> > index d7374add7820..07fc660a24aa 100644
> > --- a/arch/s390/mm/pgalloc.c
> > +++ b/arch/s390/mm/pgalloc.c
> ...
> > @@ -488,16 +486,20 @@ static void base_pgt_free(unsigned long *table)
> >  static unsigned long *base_crst_alloc(unsigned long val)
> >  {
> >       unsigned long *table;
> > +     struct ptdesc *ptdesc;
> >
> > -     table =3D (unsigned long *)__get_free_pages(GFP_KERNEL, CRST_ALLO=
C_ORDER);
> > -     if (table)
> > -             crst_table_init(table, val);
> > +     ptdesc =3D pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, CRST_ALLO=
C_ORDER);
>
> I guess I must miss something, but what is the reason to mask out
> __GFP_HIGHMEM here? It is not part of GFP_KERNEL, nor does s390 support
> HIGHMEM.

You're not missing anything.

This was replacing __get_free_pages() which also doesn't support HIGHMEM,
so I had that in to ensure a non-HIGHMEM allocation in case a
passed-in gfp_flags
had it set. In hindsight since we're just passing in the GFP flags
directly here, we don't
actually need to mask out GFP_HIGHMEM.
