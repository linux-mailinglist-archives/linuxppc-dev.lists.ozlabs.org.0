Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EC4186378
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 03:55:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ggs417qFzDqLK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 13:55:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZtU1JIgM; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ggkm4yLszDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 13:49:52 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id o127so3154459iof.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Mar 2020 19:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29bgXa0W0LHZLame8RB7q1j4LBSHlo6zwi2D8RNtALk=;
 b=ZtU1JIgMSz4DH1u9R93WTWltmr5dyzP0EXxD/vmtXqEotVUyYlxjNt8YZ/gcsGorSj
 wdpZS09Lc3la4hSMFhGXw7b2l54tsDMzc+5z5XLGKj1txjqkGzZEri3N0BgiG0PEPjoz
 Dh5va+oqwo9LgrzdKYmtv4hgKI+5iA/ISBH1RvpOHGeIaxPSJ1p/wt98sSzwicdVOv2g
 JpSFPJas7mN4ST+1+NPrdCSsTQTKTmL7dbWrk5ZYjrYvAoIhYjaoQ8ejkO3YmyLl84Az
 jgYEaJfmXYISUh382txbDWoaOUPSEvj3725LDLSjse3aK6IWWr1enhmLIkPQOHyK0WbY
 Q98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29bgXa0W0LHZLame8RB7q1j4LBSHlo6zwi2D8RNtALk=;
 b=i0k/49RS9D+Mtgc/2adnPVZPzPNrnY25erEL8t6KquTEX7vOS8FspzF1tEU/Wdojzv
 DirDuQHDZQ+P2vF0Nnphv2aoByiET9aULb49XMQ5+vimL04FaIFclfRftQzK5RDLkjfm
 Wa+P4dqTTtTzwcR9+GygXYBCICJILpwzI0pV6deYFb6KW+jC/eDGQr/2QnmOFufa/FkK
 Q6ivQ0jKAfI+xLCjchr3kHVzZiGAWKYLVIJ+AbfxmveM69s6w+Pm7ikLPpP2NUQWe49A
 b3sE0NIbAG/iFJOQ+1Uo+bKemvtIW8le5PIgX+WBMqQ4e24G6SyTgfuiE60hVAOmRyej
 TYKQ==
X-Gm-Message-State: ANhLgQ3dqBRoRkxuVZzNuJ9fzOIqmCBmlcrya91NDgqR0x7FLUWAykwV
 zsDg1K2vXgCVKWM3pnUadGZTmyhq+tCgLdiH2v9/2oU=
X-Google-Smtp-Source: ADFU+vv3kChg7yDdEFrfDKvKbYn45+E2M+OeRQEchoVQC0QNX/DMLW2TnpDXSBrEPDVTJBGVD74rCJv1CKoz2OY+4bQ=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr22490202iom.209.1584326988628; 
 Sun, 15 Mar 2020 19:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <1582882895-3142-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-3-git-send-email-kernelfans@gmail.com>
 <CAOSf1CG5VPasqhuVDPnm58mjgGkN7isJt_UCwdb7pwAip8K2aQ@mail.gmail.com>
In-Reply-To: <CAOSf1CG5VPasqhuVDPnm58mjgGkN7isJt_UCwdb7pwAip8K2aQ@mail.gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 16 Mar 2020 10:49:37 +0800
Message-ID: <CAFgQCTvVAwm9pzEPaxWwcWHu268R8+uVoUrh+KEshuVYN3Modg@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] pseries/scm: buffer pmem's bound addr in dt for
 kexec kernel
To: "Oliver O'Halloran" <oohall@gmail.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Appreciate for your kind review. And I have some comment as below.

On Fri, Mar 13, 2020 at 11:18 AM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> On Wed, Mar 4, 2020 at 7:50 PM Pingfan Liu <kernelfans@gmail.com> wrote:
> >
> > At present, plpar_hcall(H_SCM_BIND_MEM, ...) takes a very long time, so
> > if dumping to fsdax, it will take a very long time.
> >
> > Take a closer look, during the papr_scm initialization, the only
> > configuration is through drc_pmem_bind()-> plpar_hcall(H_SCM_BIND_MEM,
> > ...), which helps to set up the bound address.
> >
> > On pseries, for kexec -l/-p kernel, there is no reset of hardware, and this
> > step can be stepped around to save times.  So the pmem bound address can be
> > passed to the 2nd kernel through a dynamic added property "bound-addr" in
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
> > Cc: Andrew Donnellan <ajd@linux.ibm.com>
> > Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: kexec@lists.infradead.org
> > ---
> > note: This patch has not been tested since I can not get such a pseries with pmem.
> >       Please kindly to give some suggestion, thanks.
>
> There was some qemu patches to implement the Hcall interface floating
> around a while ago. I'm not sure they ever made it into upstream qemu
> though.
Unfortunately, it does not appear in latest qemu code. I think
probably virt-pmem has achieved the same feature.
>
> > ---
> >  arch/powerpc/platforms/pseries/of_helpers.c |  1 +
> >  arch/powerpc/platforms/pseries/papr_scm.c   | 33 ++++++++++++++++++++---------
> >  drivers/of/base.c                           |  1 +
> >  3 files changed, 25 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/of_helpers.c b/arch/powerpc/platforms/pseries/of_helpers.c
> > index 1022e0f..2c7bab4 100644
> > --- a/arch/powerpc/platforms/pseries/of_helpers.c
> > +++ b/arch/powerpc/platforms/pseries/of_helpers.c
> > @@ -34,6 +34,7 @@ struct property *new_property(const char *name, const int length,
> >         kfree(new);
> >         return NULL;
> >  }
> > +EXPORT_SYMBOL(new_property);
> >
> >  /**
> >   * pseries_of_derive_parent - basically like dirname(1)
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> > index 0b4467e..54ae903 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/delay.h>
> >
> >  #include <asm/plpar_wrappers.h>
> > +#include "of_helpers.h"
> >
> >  #define BIND_ANY_ADDR (~0ul)
> >
> > @@ -383,7 +384,7 @@ static int papr_scm_probe(struct platform_device *pdev)
> >  {
> >         struct device_node *dn = pdev->dev.of_node;
> >         u32 drc_index, metadata_size;
> > -       u64 blocks, block_size;
> > +       u64 blocks, block_size, bound_addr = 0;
> >         struct papr_scm_priv *p;
> >         const char *uuid_str;
> >         u64 uuid[2];
> > @@ -440,17 +441,29 @@ static int papr_scm_probe(struct platform_device *pdev)
> >         p->metadata_size = metadata_size;
> >         p->pdev = pdev;
> >
> > -       /* request the hypervisor to bind this region to somewhere in memory */
> > -       rc = drc_pmem_bind(p);
> > +       of_property_read_u64(dn, "bound-addr", &bound_addr);
> > +       if (bound_addr) {
> > +               p->bound_addr = bound_addr;
> > +       } else {
> > +               struct property *property;
> > +               u64 big;
> >
> > -       /* If phyp says drc memory still bound then force unbound and retry */
> > -       if (rc == H_OVERLAP)
> > -               rc = drc_pmem_query_n_bind(p);
> > +               /* request the hypervisor to bind this region to somewhere in memory */
> > +               rc = drc_pmem_bind(p);
> >
> > -       if (rc != H_SUCCESS) {
> > -               dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> > -               rc = -ENXIO;
> > -               goto err;
> > +               /* If phyp says drc memory still bound then force unbound and retry */
> > +               if (rc == H_OVERLAP)
> > +                       rc = drc_pmem_query_n_bind(p);
> > +
> > +               if (rc != H_SUCCESS) {
> > +                       dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> > +                       rc = -ENXIO;
> > +                       goto err;
> > +               }
> > +               big = cpu_to_be64(p->bound_addr);
> > +               property = new_property("bound-addr", sizeof(u64), (const unsigned char *)&big,
> > +                       NULL);
>
> That should probably be "linux,bound-addr"
OK, thanks for suggestion.
>
> The other thing that stands out to me is that you aren't removing the
Yes, you are right. I will fix it in V2.
> property when the region is unbound. As a general rule I'd prefer we
> didn't hack the DT at runtime, but if we are going to then we should
> make sure we're not putting anything wrong in there.
Actually, the dynamically building of DT is widely used by "kexec -l".

The pre-condition for the hacked method is that the bound pmem-addr
will not change. And on pseries, during kexec -l/-p, a machine reset
will not be invoked, so the bound address should be changed.

Thanks,
Pingfan
[...]
