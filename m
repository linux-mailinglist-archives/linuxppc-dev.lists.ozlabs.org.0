Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30EE89FB6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fpcj2kka;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fpcj2kka;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF66t5ZP7z3dRl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fpcj2kka;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fpcj2kka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6661MnYz2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:23:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712762584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVcVKrk4PzUgF4HuIkdKngsDaWK3az1O5+iMCoeeUwY=;
	b=Fpcj2kkacXVBs91eS6FDxP4GtLk3y7UKIwgiWh7VpaHMZruCFYkpi7CLlDdRIfFwbU+oq1
	DnAANK9WcHxshTz4gkeu0mNoowpc6Vz5LE9ux59WDYZ/BeT2aGAe69Fkyg5IG1uWIIgoa0
	HOGmqzndwlk7DwID6KFJlUf2Bdt6fRw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712762584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVcVKrk4PzUgF4HuIkdKngsDaWK3az1O5+iMCoeeUwY=;
	b=Fpcj2kkacXVBs91eS6FDxP4GtLk3y7UKIwgiWh7VpaHMZruCFYkpi7CLlDdRIfFwbU+oq1
	DnAANK9WcHxshTz4gkeu0mNoowpc6Vz5LE9ux59WDYZ/BeT2aGAe69Fkyg5IG1uWIIgoa0
	HOGmqzndwlk7DwID6KFJlUf2Bdt6fRw=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-VKdI2opVMHyXSMngLl9qYA-1; Wed, 10 Apr 2024 11:23:02 -0400
X-MC-Unique: VKdI2opVMHyXSMngLl9qYA-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4daa6aaff58so3125727e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 08:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762582; x=1713367382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVcVKrk4PzUgF4HuIkdKngsDaWK3az1O5+iMCoeeUwY=;
        b=FsVvgALNrtY+ydn4M8ntYy/mIUJKPv3WqjIe68BNJ1blMbL6aKg679hZkZ95In4YFf
         bSMQ22v6WuO0Va7+ik6ScAZWhIqu3YsVwoTfMiNZP6kj5b14R6DmdHOVNAtIuCCKCgHD
         JDAmVb5q3x4Sh7efTSR2GBsHkG3f4K/ZvQRXwNvh0CRxnLGcPwS83g0oXxejVErxuZsQ
         VT2y1AKoGzlmRlFdAUxuno5XVo11qnnexa65zI9a88xoGgFQKMHwFH4DUf9aVwvspc3D
         VpZFRt87H3aW5/fk59j9jbef+B4DA5iu5Qhw85gkIH2VjvLp912ERN9mhAOXE2/v8kz/
         Ah4w==
X-Forwarded-Encrypted: i=1; AJvYcCWDj/r9qHaia+uold3yzdgk7LxObi2f23MuxcNnPeYwenLklKJFF8L8eW7Auxb9fK6Rgt6hQXaj7Yf3mVcfodNdQC3SLzpwS4xHTpSLbg==
X-Gm-Message-State: AOJu0YxYSPBmLbM/xzL4fCE8JTDJkUvUIswRLcdh6BdAokz95oAghmDh
	8ibDOSHhapkPSgHj/Vir/zQzBOxTToazxRdwfXhU6MNL8r1tfrmkXgpAHAchLbOOJXwP9FMgKK7
	7hw7YXiNo3Cmkrl1SfgFVOaqngRh0rpv9D98d8/6oDaY4P9YufAGJRRwkzFVoXTjs4rSyy4cDYv
	yFKO0JEj/tZmZI47zs+XFu+xxy2e3QkAbQA+0tpA==
X-Received: by 2002:a05:6122:180a:b0:4d4:5d86:b2d with SMTP id ay10-20020a056122180a00b004d45d860b2dmr3229326vkb.16.1712762581871;
        Wed, 10 Apr 2024 08:23:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJWo2zPN31Xwn+WhgCfznSm122A5t6DqHNfh/1O9Ip5bewsx/OT7yR409bQ3WLhcc2xiDSSP0AdARyJNyKtt4=
X-Received: by 2002:a05:6122:180a:b0:4d4:5d86:b2d with SMTP id
 ay10-20020a056122180a00b004d45d860b2dmr3229309vkb.16.1712762581508; Wed, 10
 Apr 2024 08:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240301203023.2197451-1-jsavitz@redhat.com> <87jzmduiva.fsf@kernel.org>
 <CAL1p7m5BoxFDeK0MryQCmTDCeBLN3rMLRGx3cHa6teS02wsgZw@mail.gmail.com> <CAL1p7m5VHGL+-st7zgGA9LPft6DND=qz0ifiD_ki1hLvfRv=7Q@mail.gmail.com>
In-Reply-To: <CAL1p7m5VHGL+-st7zgGA9LPft6DND=qz0ifiD_ki1hLvfRv=7Q@mail.gmail.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Wed, 10 Apr 2024 11:22:45 -0400
Message-ID: <CAL1p7m7f=b_qJrU8qea2n1+-1KzEVLMOpY9ov5fH2ZZxGrDK5A@mail.gmail.com>
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

On Mon, Apr 1, 2024 at 10:17=E2=80=AFAM Joel Savitz <jsavitz@redhat.com> wr=
ote:
>
> On Tue, Mar 26, 2024 at 12:45=E2=80=AFAM Joel Savitz <jsavitz@redhat.com>=
 wrote:
> >
> > On Fri, Mar 8, 2024 at 5:18=E2=80=AFAM Aneesh Kumar K.V <aneesh.kumar@k=
ernel.org> wrote:
> > >
> > > Joel Savitz <jsavitz@redhat.com> writes:
> > >
> > > > On 64-bit powerpc, usage of a non-16MB-aligned value for the mem=3D=
 kernel
> > > > cmdline parameter results in a system hang at boot.
> > > >
> > > > For example, using 'mem=3D4198400K' will always reproduce this issu=
e.
> > > >
> > > > This patch fixes the problem by aligning any argument to mem=3D to =
16MB
> > > > corresponding with the large page size on powerpc.
> > > >
> > > > Fixes: 2babf5c2ec2f ("[PATCH] powerpc: Unify mem=3D handling")
> > > > Co-developed-by: Gonzalo Siero <gsierohu@redhat.com>
> > > > Signed-off-by: Gonzalo Siero <gsierohu@redhat.com>
> > > > Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> > > > ---
> > > >  arch/powerpc/kernel/prom.c | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.=
c
> > > > index 0b5878c3125b..8cd3e2445d8a 100644
> > > > --- a/arch/powerpc/kernel/prom.c
> > > > +++ b/arch/powerpc/kernel/prom.c
> > > > @@ -82,8 +82,12 @@ static int __init early_parse_mem(char *p)
> > > >  {
> > > >       if (!p)
> > > >               return 1;
> > > > -
> > > > +#ifdef CONFIG_PPC64
> > > > +     /* Align to 16 MB =3D=3D size of ppc64 large page */
> > > > +     memory_limit =3D ALIGN(memparse(p, &p), 0x1000000);
> > > > +#else
> > > >       memory_limit =3D PAGE_ALIGN(memparse(p, &p));
> > > > +#endif
> > > >       DBG("memory limit =3D 0x%llx\n", memory_limit);
> > > >
> > > >       return 0;
> > > > --
> > > > 2.43.0
> > >
> > > Can you try this change?
> > >
> > > commit 5555bc55e1aa71f545cff31e1eccdb4a2e39df84
> > > Author: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
> > > Date:   Fri Mar 8 14:45:26 2024 +0530
> > >
> > >     powerpc/mm: Align memory_limit value specified using mem=3D kerne=
l parameter
> > >
> > >     The value specified for the memory limit is used to set a restric=
tion on
> > >     memory usage. It is important to ensure that this restriction is =
within
> > >     the linear map kernel address space range. The hash page table
> > >     translation uses a 16MB page size to map the kernel linear map ad=
dress
> > >     space. htab_bolt_mapping() function aligns down the size of the r=
ange
> > >     while mapping kernel linear address space. Since the memblock lim=
it is
> > >     enforced very early during boot, before we can detect the type of=
 memory
> > >     translation (radix vs hash), we align the memory limit value spec=
ified
> > >     as a kernel parameter to 16MB. This alignment value will work for=
 both
> > >     hash and radix translations.
> > >
> > >     Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
> > >
> > > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > > index 0b5878c3125b..9bd965d35352 100644
> > > --- a/arch/powerpc/kernel/prom.c
> > > +++ b/arch/powerpc/kernel/prom.c
> > > @@ -824,8 +824,11 @@ void __init early_init_devtree(void *params)
> > >                 reserve_crashkernel();
> > >         early_reserve_mem();
> > >
> > > -       /* Ensure that total memory size is page-aligned. */
> > > -       limit =3D ALIGN(memory_limit ?: memblock_phys_mem_size(), PAG=
E_SIZE);
> > > +       if (memory_limit > memblock_phys_mem_size())
> > > +               memory_limit =3D 0;
> > > +
> > > +       /* Align down to 16 MB which is large page size with hash pag=
e translation */
> > > +       limit =3D ALIGN_DOWN(memory_limit ?: memblock_phys_mem_size()=
, SZ_16M);
> > >         memblock_enforce_memory_limit(limit);
> > >
> > >  #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_4K_PAGES)
> > > diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/pr=
om_init.c
> > > index e67effdba85c..d6410549e141 100644
> > > --- a/arch/powerpc/kernel/prom_init.c
> > > +++ b/arch/powerpc/kernel/prom_init.c
> > > @@ -817,8 +817,8 @@ static void __init early_cmdline_parse(void)
> > >                 opt +=3D 4;
> > >                 prom_memory_limit =3D prom_memparse(opt, (const char =
**)&opt);
> > >  #ifdef CONFIG_PPC64
> > > -               /* Align to 16 MB =3D=3D size of ppc64 large page */
> > > -               prom_memory_limit =3D ALIGN(prom_memory_limit, 0x1000=
000);
> > > +               /* Align down to 16 MB which is large page size with =
hash page translation */
> > > +               prom_memory_limit =3D ALIGN_DOWN(prom_memory_limit, S=
Z_16M);
> > >  #endif
> > >         }
> > >
> > >
> >
> > Sorry for the delayed reply. I just tested this patch and it fixes the
> > bug for me.
>
> Hi,
>
> Just a quick follow up on this.
>
> The above patch fixed the bug for me.
>
> How do we want to proceed?
>
> Best,
> Joel Savitz

Hi,

I haven't heard anything on this thread so I'm just sending a quick follow =
up.

Do we want to merge this

Best,
Joel Savitz

