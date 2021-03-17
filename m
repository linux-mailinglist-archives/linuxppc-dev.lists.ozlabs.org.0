Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9D33E308
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 01:55:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0WsH6P48z3bqm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 11:54:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=h/SzeSMo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h/SzeSMo; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Wrt4B3vz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 11:54:38 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id y133so334323ybe.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rag/NwcuES6cMgzK6CGt4YBQ8OJVF01ItgDN4u0G3mc=;
 b=h/SzeSMohFnv4ATaBDeLnz7rgP7oTnCxhzXLJBCLg62JTuymru1CfDnC+5vDYU1GnT
 8aAlmM4YCJZYriE9fhEQhqgdUr7AYLRIRXXSV0YvdeL7ewOgGWeSVBkEMZVOhLGjD+gi
 Gk/vPv10i/SIRqnYxi4AjVuHASRfy3YO9iGWs2JiSIPUDwjbOdrO11WKNmMSbV/1XZT6
 ehu2tJVDofaP6iMfycHSfs2+slGP3GEsfTn/SAEg4AVGoZKIJBYY+LcHnWx2Km+73WVa
 tZ0f0xhHbfkZibpOx9Fu85Ztu3kgjc8Ad6HbK1oRNW2oYtankYSGCc2IM8Y6coWI8ey5
 VnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rag/NwcuES6cMgzK6CGt4YBQ8OJVF01ItgDN4u0G3mc=;
 b=OBEYf+tVcjLdSEqO511OHMydgoqi92HAqNn2I3f9CVRR1mkC8mnUe1V5mho96eMCYn
 Sk1337Jf3yPLbnZtOqNleDIZV0sjZ9IgyVAD24KkXPdSrdOV8rc1kQHQl0Zhbez9BZtH
 MbtjkxK9EPrVBugWkj6gsSRL/Mjj+yBXIBDpFyzyD+MX6UQwN9XHbiIhterM/JHya6+D
 AyvWnaIqByha9ScdHIHbMCcLZw+SZQFYjfWqL6eDGyzJSdv2HA8rgK8bMY58zXtdHeJr
 oReseRr/eFZxWyl07Mphq+FcQpFlS1GPmlAwdr/i22t07lvo0wkAD6xC7ChnAFpI8wp4
 mYew==
X-Gm-Message-State: AOAM530F1mqG3ujNiIMylmmbXm0hQqxYD1SQrmUoNwJn2rOemcwIdnMI
 v0Qu+07Eal5PDsdPrPpwqi27HiJMG1UhUaG7HUc=
X-Google-Smtp-Source: ABdhPJwR3EC+1d3ZA+SqIpvmWH0SKf8+C/24yXJk9hd8gKoXF5hEY+rn9CkVBjBvmtCGEJG7MFYxLL6IzbU+AFf4tHY=
X-Received: by 2002:a05:6902:701:: with SMTP id
 k1mr1914528ybt.342.1615942474860; 
 Tue, 16 Mar 2021 17:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-7-jniethe5@gmail.com>
 <5a848626-cd83-e4de-f64e-2a7ee082d7d7@csgroup.eu>
In-Reply-To: <5a848626-cd83-e4de-f64e-2a7ee082d7d7@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 17 Mar 2021 11:54:23 +1100
Message-ID: <CACzsE9qQtbU8BkB+X64+ruAfxhzNwMsiQa-tdLnCNpsKz12JWw@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] powerpc/mm: implement set_memory_attr()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, ajd@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, naveen.n.rao@linux.ibm.com,
 Daniel Axtens <dja@axtens.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 6:25 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 16/03/2021 =C3=A0 04:17, Jordan Niethe a =C3=A9crit :
> > From: Christophe Leroy <christophe.leroy@c-s.fr>
>
> Can you please update the whole series with my new email address: christo=
phe.leroy@csgroup.eu
Of course, I shall do that.
>
>
>
> >
> > In addition to the set_memory_xx() functions which allows to change
> > the memory attributes of not (yet) used memory regions, implement a
> > set_memory_attr() function to:
> > - set the final memory protection after init on currently used
> > kernel regions.
> > - enable/disable kernel memory regions in the scope of DEBUG_PAGEALLOC.
> >
> > Unlike the set_memory_xx() which can act in three step as the regions
> > are unused, this function must modify 'on the fly' as the kernel is
> > executing from them. At the moment only PPC32 will use it and changing
> > page attributes on the fly is not an issue.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > [ruscur: cast "data" to unsigned long instead of int]
> > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >   arch/powerpc/include/asm/set_memory.h |  2 ++
> >   arch/powerpc/mm/pageattr.c            | 33 ++++++++++++++++++++++++++=
+
> >   2 files changed, 35 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/inclu=
de/asm/set_memory.h
> > index 64011ea444b4..b040094f7920 100644
> > --- a/arch/powerpc/include/asm/set_memory.h
> > +++ b/arch/powerpc/include/asm/set_memory.h
> > @@ -29,4 +29,6 @@ static inline int set_memory_x(unsigned long addr, in=
t numpages)
> >       return change_memory_attr(addr, numpages, SET_MEMORY_X);
> >   }
> >
> > +int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot);
> > +
> >   #endif
> > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > index 2da3fbab6ff7..2fde1b195c85 100644
> > --- a/arch/powerpc/mm/pageattr.c
> > +++ b/arch/powerpc/mm/pageattr.c
> > @@ -79,3 +79,36 @@ int change_memory_attr(unsigned long addr, int numpa=
ges, long action)
> >       return apply_to_existing_page_range(&init_mm, start, sz,
> >                                           change_page_attr, (void *)act=
ion);
> >   }
> > +
> > +/*
> > + * Set the attributes of a page:
> > + *
> > + * This function is used by PPC32 at the end of init to set final kern=
el memory
> > + * protection. It includes changing the maping of the page it is execu=
ting from
> > + * and data pages it is using.
> > + */
> > +static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
> > +{
> > +     pgprot_t prot =3D __pgprot((unsigned long)data);
> > +
> > +     spin_lock(&init_mm.page_table_lock);
> > +
> > +     set_pte_at(&init_mm, addr, ptep, pte_modify(*ptep, prot));
> > +     flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +
> > +     spin_unlock(&init_mm.page_table_lock);
> > +
> > +     return 0;
> > +}
> > +
> > +int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)
> > +{
> > +     unsigned long start =3D ALIGN_DOWN(addr, PAGE_SIZE);
> > +     unsigned long sz =3D numpages * PAGE_SIZE;
> > +
> > +     if (numpages <=3D 0)
> > +             return 0;
> > +
> > +     return apply_to_existing_page_range(&init_mm, start, sz, set_page=
_attr,
> > +                                         (void *)pgprot_val(prot));
> > +}
> >
