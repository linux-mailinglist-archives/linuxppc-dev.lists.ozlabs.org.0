Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96738173404
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 10:30:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TPQF1jngzDqtR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 20:29:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FXccaMWn; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TPN40D0FzDrJt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 20:28:02 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id a6so2161055ilc.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ms6O6aoqXDyCXwxH9N7N5sV8U4w89NRWQpK0LExlfEM=;
 b=FXccaMWnSaG0jMg7H6HCkdbL8p8OOQxMa8SDBhDGVc29je9S4xDCp1C4ZRLKg1d1tl
 6QmP632uEYwDPb09LYXW8k1MCfHcp9ICIcGF7m3HTNTZeDPpsjtwsaAngsO2s4xMFOpe
 d7ou9XgGt1XvXI9XgXeLSwrCFFmXAyKEXTpB54rI2Q0eXn9uUBYHmgpUnGIzFYN40nxD
 SrkpOBVTziW6pXZreHrM5yLP5sgzYsnCjrsI/X7SMIM8deL6GYlNBB8cWf1PtXo3rLzj
 clJPEgmSkSHdCfvLL3Q9YfwHMc6e3CJsoe4LI7Obu0ZHgrIGARHsPqnnYSVpzC7V56H6
 KV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ms6O6aoqXDyCXwxH9N7N5sV8U4w89NRWQpK0LExlfEM=;
 b=ePEeUjeZtRIXMUBnTQRSgb9mrKIxb+vyv9fxkKgVm8dzAnfzjSKi/QcdFHUqvltBpY
 3c5ilQJjIGlWOi4SvwOZERUEeGg4HL0yEecSrkbvfJe6TOjxROufefnRJYdZu1TCjhGG
 pJZUR18W/FTUSoZac8ABzYmlSMHEP5dotXPQICPLsEjD80aS+iHRvBmpNkBxaP8+R1KF
 eMdeIgcBNJH9qCosuGBXD2zvJkUk5/AApHZyO3/FxaBsLULGnlJ13P+cDHPpaoKWgE0p
 RKRC6gxWbf6kvI6fuAxVfp4heOWWCN8VRMajSCIxgODfq/pEelMNTKRURZs0iMVSqW5A
 6wrA==
X-Gm-Message-State: APjAAAVx2gkvByndL0rSOIFA1EQhNI6Jk0ecuACIucDR2bv1amNBMKcK
 /et2sONj/2rXX4goOiqsFVkPwAL2NMMKoEcvLQ==
X-Google-Smtp-Source: APXvYqyeqpzMT3XGLG6oh8NWwZD6oYsyPecjkgVdVHIkrYBvKU+3D2RpCgNbOpDRNL/DWPUIGvcOkKJEkDKzGNeHCRI=
X-Received: by 2002:a92:d090:: with SMTP id h16mr3732548ilh.78.1582882077652; 
 Fri, 28 Feb 2020 01:27:57 -0800 (PST)
MIME-Version: 1.0
References: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
 <1582869192-9284-3-git-send-email-kernelfans@gmail.com>
 <2a1906b0-6c53-4ff5-78ea-3254f8224fe4@c-s.fr>
In-Reply-To: <2a1906b0-6c53-4ff5-78ea-3254f8224fe4@c-s.fr>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Fri, 28 Feb 2020 17:27:46 +0800
Message-ID: <CAFgQCTs+zoFOzg5v1dbocSjm3--BMASLSAqSicQdPE6GUy6oGg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pseries/scm: buffer pmem's bound addr in dt for kexec
 kernel
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 2:52 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 28/02/2020 =C3=A0 06:53, Pingfan Liu a =C3=A9crit :
> > At present, plpar_hcall(H_SCM_BIND_MEM, ...) takes a very long time, so
> > if dumping to fsdax, it will take a very long time.
> >
> > Take a closer look, during the papr_scm initialization, the only
> > configuration is through drc_pmem_bind()-> plpar_hcall(H_SCM_BIND_MEM,
> > ...), which helps to set up the bound address.
> >
> > On pseries, for kexec -l/-p kernel, there is no reset of hardware, and =
this
> > step can be stepped around to save times.  So the pmem bound address ca=
n be
> > passed to the 2nd kernel through a dynamic added property "bound-addr" =
in
> > dt node 'ibm,pmemory'.
> >
> > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > To: linuxppc-dev@lists.ozlabs.org
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Cc: Oliver O'Halloran <oohall@gmail.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: kexec@lists.infradead.org
> > ---
> > note: I can not find such a pseries machine, and not finish it yet.
> > ---
> >   arch/powerpc/platforms/pseries/papr_scm.c | 32 +++++++++++++++++++++-=
---------
> >   1 file changed, 22 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/p=
latforms/pseries/papr_scm.c
> > index c2ef320..555e746 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -382,7 +382,7 @@ static int papr_scm_probe(struct platform_device *p=
dev)
> >   {
> >       struct device_node *dn =3D pdev->dev.of_node;
> >       u32 drc_index, metadata_size;
> > -     u64 blocks, block_size;
> > +     u64 blocks, block_size, bound_addr =3D 0;
> >       struct papr_scm_priv *p;
> >       const char *uuid_str;
> >       u64 uuid[2];
> > @@ -439,17 +439,29 @@ static int papr_scm_probe(struct platform_device =
*pdev)
> >       p->metadata_size =3D metadata_size;
> >       p->pdev =3D pdev;
> >
> > -     /* request the hypervisor to bind this region to somewhere in mem=
ory */
> > -     rc =3D drc_pmem_bind(p);
> > +     of_property_read_u64(dn, "bound-addr", &bound_addr);
> > +     if (bound_addr)
> > +             p->bound_addr =3D bound_addr;
> > +     else {
>
> All legs of an if/else must have { } when one leg need them, see codying
> style.
OK,
>
> > +             struct property *property;
> > +             u64 big;
> >
> > -     /* If phyp says drc memory still bound then force unbound and ret=
ry */
> > -     if (rc =3D=3D H_OVERLAP)
> > -             rc =3D drc_pmem_query_n_bind(p);
> > +             /* request the hypervisor to bind this region to somewher=
e in memory */
> > +             rc =3D drc_pmem_bind(p);
> >
> > -     if (rc !=3D H_SUCCESS) {
> > -             dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> > -             rc =3D -ENXIO;
> > -             goto err;
> > +             /* If phyp says drc memory still bound then force unbound=
 and retry */
> > +             if (rc =3D=3D H_OVERLAP)
> > +                     rc =3D drc_pmem_query_n_bind(p);
> > +
> > +             if (rc !=3D H_SUCCESS) {
> > +                     dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> > +                     rc =3D -ENXIO;
> > +                     goto err;
> > +             }
> > +             big =3D cpu_to_be64(p->bound_addr);
> > +             property =3D new_property("bound-addr", sizeof(u64), &big=
,
> > +                     NULL);
>
> Why plitting this line in two parts ? You have lines far longer above.
> In powerpc we allow lines 90 chars long.
OK, good to know it.

Thanks,
Pingfan
