Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C6183F8A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 04:20:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48drY85wF4zDqRL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 14:20:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iisI5pTQ; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48drVj2TDyzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 14:18:04 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id a6so7567256ilc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 20:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UlfvY0oGVsaUk0r5EBLUStFO0dCFKba6JHfCchjXVtE=;
 b=iisI5pTQW0+U0Dchgm8muuNPo9HLPSBVFOfNvs4A7P51wP2lZCRekLve17gD8pKjOe
 TDPLrzjoU7K/ATEYpeIMaL2cOLzISx2uRxCRBJCx+uM9MOGAioPqxFEQkb6CVrbf5Mi5
 SLyfHBfD1rIEkDas5Dr8ux00EUOALp7X+KN7zZM/aJo3Se4KSeT76AlFp3PJNil5uYZH
 nPrxyjeGn3tpZcclxkRYJOIPgYGz5yvNPxlxHK0rX59Q1ZF54HUETV3cPH9cXqqFSzAf
 c4M0Y/ydqSKgHnz0mbUR+8XxgI855O+3feTzx0+Mj30t/VvM9yE4KkEmCFoLfRRB4jS+
 0xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UlfvY0oGVsaUk0r5EBLUStFO0dCFKba6JHfCchjXVtE=;
 b=KOSGXyE0HMAmVfoEKZSl9949zlE1TTxF4mJB6ABGQngtqsVIbstv9js7jy7v6vPWGJ
 FHG9Css7n0CdMTX0nC3x/BISyO9Kl6zVCvBlMrjU/6h8N0uv1dSt0A7n5DUXkluaSX7w
 ypYhv+KHKYvmAoEWZkMgfUwjleBN6yl/YFHEyDQFfRbA7/4Rfr72q4cmyo/XWQxmqdjt
 KO/sdbZyqYHCmpqxNwBmssq0H6vf7YNP9WhUaIgGowMo+IQVQEw03yAPSfoarDqdx97c
 tW+06clKXokaK/UHSWC3ptIP8ZzJt6MaFeDk0pDwDiEBJLz0mYK84frdWXgctnpMEdsu
 wR/Q==
X-Gm-Message-State: ANhLgQ1KlcnE6b1HKtxsbhEM7DXLsyFPlY1E5XSlt2EUauS5w1+gK/5y
 LRhjOEtY5kch9Sin939ndLByTcwaQT31pylNeZU=
X-Google-Smtp-Source: ADFU+vu/npMPeslf7IqYZQXqioZc1+z6k84PvtCoH35o2Iq7HgWM6hguSXIy1iepg5uWIADnaeAPoTRya/NpmK5XL2c=
X-Received: by 2002:a92:5c5c:: with SMTP id q89mr11620410ilb.195.1584069481227; 
 Thu, 12 Mar 2020 20:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <1582882895-3142-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-3-git-send-email-kernelfans@gmail.com>
In-Reply-To: <1583311651-29310-3-git-send-email-kernelfans@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 13 Mar 2020 14:17:50 +1100
Message-ID: <CAOSf1CG5VPasqhuVDPnm58mjgGkN7isJt_UCwdb7pwAip8K2aQ@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] pseries/scm: buffer pmem's bound addr in dt for
 kexec kernel
To: Pingfan Liu <kernelfans@gmail.com>
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
 kexec@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 4, 2020 at 7:50 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> At present, plpar_hcall(H_SCM_BIND_MEM, ...) takes a very long time, so
> if dumping to fsdax, it will take a very long time.
>
> Take a closer look, during the papr_scm initialization, the only
> configuration is through drc_pmem_bind()-> plpar_hcall(H_SCM_BIND_MEM,
> ...), which helps to set up the bound address.
>
> On pseries, for kexec -l/-p kernel, there is no reset of hardware, and this
> step can be stepped around to save times.  So the pmem bound address can be
> passed to the 2nd kernel through a dynamic added property "bound-addr" in
> dt node 'ibm,pmemory'.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: kexec@lists.infradead.org
> ---
> note: This patch has not been tested since I can not get such a pseries with pmem.
>       Please kindly to give some suggestion, thanks.

There was some qemu patches to implement the Hcall interface floating
around a while ago. I'm not sure they ever made it into upstream qemu
though.

> ---
>  arch/powerpc/platforms/pseries/of_helpers.c |  1 +
>  arch/powerpc/platforms/pseries/papr_scm.c   | 33 ++++++++++++++++++++---------
>  drivers/of/base.c                           |  1 +
>  3 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/of_helpers.c b/arch/powerpc/platforms/pseries/of_helpers.c
> index 1022e0f..2c7bab4 100644
> --- a/arch/powerpc/platforms/pseries/of_helpers.c
> +++ b/arch/powerpc/platforms/pseries/of_helpers.c
> @@ -34,6 +34,7 @@ struct property *new_property(const char *name, const int length,
>         kfree(new);
>         return NULL;
>  }
> +EXPORT_SYMBOL(new_property);
>
>  /**
>   * pseries_of_derive_parent - basically like dirname(1)
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0b4467e..54ae903 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -14,6 +14,7 @@
>  #include <linux/delay.h>
>
>  #include <asm/plpar_wrappers.h>
> +#include "of_helpers.h"
>
>  #define BIND_ANY_ADDR (~0ul)
>
> @@ -383,7 +384,7 @@ static int papr_scm_probe(struct platform_device *pdev)
>  {
>         struct device_node *dn = pdev->dev.of_node;
>         u32 drc_index, metadata_size;
> -       u64 blocks, block_size;
> +       u64 blocks, block_size, bound_addr = 0;
>         struct papr_scm_priv *p;
>         const char *uuid_str;
>         u64 uuid[2];
> @@ -440,17 +441,29 @@ static int papr_scm_probe(struct platform_device *pdev)
>         p->metadata_size = metadata_size;
>         p->pdev = pdev;
>
> -       /* request the hypervisor to bind this region to somewhere in memory */
> -       rc = drc_pmem_bind(p);
> +       of_property_read_u64(dn, "bound-addr", &bound_addr);
> +       if (bound_addr) {
> +               p->bound_addr = bound_addr;
> +       } else {
> +               struct property *property;
> +               u64 big;
>
> -       /* If phyp says drc memory still bound then force unbound and retry */
> -       if (rc == H_OVERLAP)
> -               rc = drc_pmem_query_n_bind(p);
> +               /* request the hypervisor to bind this region to somewhere in memory */
> +               rc = drc_pmem_bind(p);
>
> -       if (rc != H_SUCCESS) {
> -               dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> -               rc = -ENXIO;
> -               goto err;
> +               /* If phyp says drc memory still bound then force unbound and retry */
> +               if (rc == H_OVERLAP)
> +                       rc = drc_pmem_query_n_bind(p);
> +
> +               if (rc != H_SUCCESS) {
> +                       dev_err(&p->pdev->dev, "bind err: %d\n", rc);
> +                       rc = -ENXIO;
> +                       goto err;
> +               }
> +               big = cpu_to_be64(p->bound_addr);
> +               property = new_property("bound-addr", sizeof(u64), (const unsigned char *)&big,
> +                       NULL);

That should probably be "linux,bound-addr"

The other thing that stands out to me is that you aren't removing the
property when the region is unbound. As a general rule I'd prefer we
didn't hack the DT at runtime, but if we are going to then we should
make sure we're not putting anything wrong in there.

> +               of_add_property(dn, property);
>         }
>
>         /* setup the resource for the newly bound range */
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ae03b12..602d2a9 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1817,6 +1817,7 @@ int of_add_property(struct device_node *np, struct property *prop)
>
>         return rc;
>  }
> +EXPORT_SYMBOL_GPL(of_add_property);
>
>  int __of_remove_property(struct device_node *np, struct property *prop)
>  {
> --
> 2.7.5
>
