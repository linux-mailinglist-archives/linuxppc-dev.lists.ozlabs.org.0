Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33723893C19
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 16:18:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVU22thM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVU22thM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7Y5X21bYz3dH8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 01:18:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVU22thM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JVU22thM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7Y4n3h0Dz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 01:17:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711981060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJRxiasyHmUKvqfQpZ1nrM5CdUFwh/nhoJJg5a06Pdg=;
	b=JVU22thMCzmseuenLau2SCUkZNf6YCWW9ePUqb5n6OmcPzSIPQKcWbEFMFR3k0dabA2FEr
	TqwP1zXcmPl5nJ6usI8vO4BDOMC0t1+gPQqmJef29DxOdgOoFFOntwvzS7W6tbJ+sUHSuY
	aoe5yXU4yyVf3RzHL73EN8/3B7VulN8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711981060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJRxiasyHmUKvqfQpZ1nrM5CdUFwh/nhoJJg5a06Pdg=;
	b=JVU22thMCzmseuenLau2SCUkZNf6YCWW9ePUqb5n6OmcPzSIPQKcWbEFMFR3k0dabA2FEr
	TqwP1zXcmPl5nJ6usI8vO4BDOMC0t1+gPQqmJef29DxOdgOoFFOntwvzS7W6tbJ+sUHSuY
	aoe5yXU4yyVf3RzHL73EN8/3B7VulN8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-3xfrZn1APIec3MCk2MW0eQ-1; Mon, 01 Apr 2024 10:17:38 -0400
X-MC-Unique: 3xfrZn1APIec3MCk2MW0eQ-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6e6a35be1b0so4902231a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Apr 2024 07:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711981058; x=1712585858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJRxiasyHmUKvqfQpZ1nrM5CdUFwh/nhoJJg5a06Pdg=;
        b=VqZjFeuqN0LPgjwU2RvDEamVhkOTfxxq2V1Z9v4gHCePCukizdbwnGy9nOMgCnjRWX
         r2AD5jcaBGKhxq6A/y+QOn0weFQv2oyZMR4YG0O/A2piLZW3fA38EutdXJsLd5hQn036
         yY9dOQESZWrcaBUWQN45CgBqKX8iqdewtGNLvwhUN0qXokWKWx9opx+MyQwW51lXk/RT
         hxyzGP0bRT0hpliV8mzFvP8+1CPpczh6oDUGxenu7ItDnlbQPOypQCBxrMkl5cdwJDXe
         lmnEuoEnrCvnfC5Q8jF6oJshlCgGaMbCEj7YJc2iQCMbGXPodW3pUyr4kKjJdY+nYG58
         5olQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdGdLuyav44m+9/PFN7yi1ZsAf2F7DDCOU4guQZ2dRK08IRyc/Kkvkt4IId7DFE3azXW8lxG9W+lzmPk/2Ah6jB4QnFgdYE2LBMhKJnw==
X-Gm-Message-State: AOJu0YwculuJNI5PR6mEkAzvrEMY0lXjO0Hqph6/Ml1d0w4wI4YR0Emv
	m9qdog+Fovqpr+PIqgZL6fQLpluj/zlIiALABuKPKgavjFdRC37ISUUB7JA/xBt7yPT7z44+4a7
	kHcQ32RtMBDa9iIb+LOLuHLyrMLlifx+hs8Az8F+T8uGIK+VKylXg1kICVwALuHOJl9fKF6eM4z
	biUx7fY+lvKKoWbelsZGG5AJ3AEq6EAROXuaurNw==
X-Received: by 2002:a05:6808:1995:b0:3c3:8517:3472 with SMTP id bj21-20020a056808199500b003c385173472mr14104556oib.41.1711981057495;
        Mon, 01 Apr 2024 07:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKAaot5gPu/xKNuoiU5ZEryU7ovco8JGNrBFL3wur8CERMVFMJ3iEOAuH9JO+iko79W/n109Mabrud3lV8ZsM=
X-Received: by 2002:a05:6808:1995:b0:3c3:8517:3472 with SMTP id
 bj21-20020a056808199500b003c385173472mr14104453oib.41.1711981055880; Mon, 01
 Apr 2024 07:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240301203023.2197451-1-jsavitz@redhat.com> <87jzmduiva.fsf@kernel.org>
 <CAL1p7m5BoxFDeK0MryQCmTDCeBLN3rMLRGx3cHa6teS02wsgZw@mail.gmail.com>
In-Reply-To: <CAL1p7m5BoxFDeK0MryQCmTDCeBLN3rMLRGx3cHa6teS02wsgZw@mail.gmail.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Mon, 1 Apr 2024 10:17:19 -0400
Message-ID: <CAL1p7m5VHGL+-st7zgGA9LPft6DND=qz0ifiD_ki1hLvfRv=7Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 26, 2024 at 12:45=E2=80=AFAM Joel Savitz <jsavitz@redhat.com> w=
rote:
>
> On Fri, Mar 8, 2024 at 5:18=E2=80=AFAM Aneesh Kumar K.V <aneesh.kumar@ker=
nel.org> wrote:
> >
> > Joel Savitz <jsavitz@redhat.com> writes:
> >
> > > On 64-bit powerpc, usage of a non-16MB-aligned value for the mem=3D k=
ernel
> > > cmdline parameter results in a system hang at boot.
> > >
> > > For example, using 'mem=3D4198400K' will always reproduce this issue.
> > >
> > > This patch fixes the problem by aligning any argument to mem=3D to 16=
MB
> > > corresponding with the large page size on powerpc.
> > >
> > > Fixes: 2babf5c2ec2f ("[PATCH] powerpc: Unify mem=3D handling")
> > > Co-developed-by: Gonzalo Siero <gsierohu@redhat.com>
> > > Signed-off-by: Gonzalo Siero <gsierohu@redhat.com>
> > > Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> > > ---
> > >  arch/powerpc/kernel/prom.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > > index 0b5878c3125b..8cd3e2445d8a 100644
> > > --- a/arch/powerpc/kernel/prom.c
> > > +++ b/arch/powerpc/kernel/prom.c
> > > @@ -82,8 +82,12 @@ static int __init early_parse_mem(char *p)
> > >  {
> > >       if (!p)
> > >               return 1;
> > > -
> > > +#ifdef CONFIG_PPC64
> > > +     /* Align to 16 MB =3D=3D size of ppc64 large page */
> > > +     memory_limit =3D ALIGN(memparse(p, &p), 0x1000000);
> > > +#else
> > >       memory_limit =3D PAGE_ALIGN(memparse(p, &p));
> > > +#endif
> > >       DBG("memory limit =3D 0x%llx\n", memory_limit);
> > >
> > >       return 0;
> > > --
> > > 2.43.0
> >
> > Can you try this change?
> >
> > commit 5555bc55e1aa71f545cff31e1eccdb4a2e39df84
> > Author: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
> > Date:   Fri Mar 8 14:45:26 2024 +0530
> >
> >     powerpc/mm: Align memory_limit value specified using mem=3D kernel =
parameter
> >
> >     The value specified for the memory limit is used to set a restricti=
on on
> >     memory usage. It is important to ensure that this restriction is wi=
thin
> >     the linear map kernel address space range. The hash page table
> >     translation uses a 16MB page size to map the kernel linear map addr=
ess
> >     space. htab_bolt_mapping() function aligns down the size of the ran=
ge
> >     while mapping kernel linear address space. Since the memblock limit=
 is
> >     enforced very early during boot, before we can detect the type of m=
emory
> >     translation (radix vs hash), we align the memory limit value specif=
ied
> >     as a kernel parameter to 16MB. This alignment value will work for b=
oth
> >     hash and radix translations.
> >
> >     Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
> >
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 0b5878c3125b..9bd965d35352 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -824,8 +824,11 @@ void __init early_init_devtree(void *params)
> >                 reserve_crashkernel();
> >         early_reserve_mem();
> >
> > -       /* Ensure that total memory size is page-aligned. */
> > -       limit =3D ALIGN(memory_limit ?: memblock_phys_mem_size(), PAGE_=
SIZE);
> > +       if (memory_limit > memblock_phys_mem_size())
> > +               memory_limit =3D 0;
> > +
> > +       /* Align down to 16 MB which is large page size with hash page =
translation */
> > +       limit =3D ALIGN_DOWN(memory_limit ?: memblock_phys_mem_size(), =
SZ_16M);
> >         memblock_enforce_memory_limit(limit);
> >
> >  #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_4K_PAGES)
> > diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom=
_init.c
> > index e67effdba85c..d6410549e141 100644
> > --- a/arch/powerpc/kernel/prom_init.c
> > +++ b/arch/powerpc/kernel/prom_init.c
> > @@ -817,8 +817,8 @@ static void __init early_cmdline_parse(void)
> >                 opt +=3D 4;
> >                 prom_memory_limit =3D prom_memparse(opt, (const char **=
)&opt);
> >  #ifdef CONFIG_PPC64
> > -               /* Align to 16 MB =3D=3D size of ppc64 large page */
> > -               prom_memory_limit =3D ALIGN(prom_memory_limit, 0x100000=
0);
> > +               /* Align down to 16 MB which is large page size with ha=
sh page translation */
> > +               prom_memory_limit =3D ALIGN_DOWN(prom_memory_limit, SZ_=
16M);
> >  #endif
> >         }
> >
> >
>
> Sorry for the delayed reply. I just tested this patch and it fixes the
> bug for me.

Hi,

Just a quick follow up on this.

The above patch fixed the bug for me.

How do we want to proceed?

Best,
Joel Savitz

