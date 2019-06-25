Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E052032
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 03:01:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XnsL2MwqzDqSW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 11:00:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uPOZEtIN"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XnqB4fBMzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 10:59:00 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id r185so1484797iod.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 17:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eijI6jNI/XYlOJmQIVfeU8NRiuyfZ31x0e3i0xzAMTQ=;
 b=uPOZEtINe6UjHaY6APqBMK5gDxWN2CZrEdkif2etjCbko8kyOWHxGV/HaxMoPrINT9
 tU6uMuW89wpkU1NkkG54xV5uMY4ophFXO3ScNW/KJ9kYlT7Z821zNTBmH0XpNZaiEkq8
 O1wVek7fbA9Jy6lWBR7olIRK4aM2S8FycciekUyHc7tWG6i5JvKRgptYDPxjXHnWhZWU
 QLL2ZhKvMiYLvavwoe+FmiB5j7V5eUQmuPj6wvDJiu8VGnRnU/SEnUgX0jeI+ggbLZ5c
 kqXexhcuS+tdYJrNMRrn7ClCXqHbm2RtP0nnJ55h5CggWcP0TAqTsJ4cFgB2R0/z2Bas
 ChbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eijI6jNI/XYlOJmQIVfeU8NRiuyfZ31x0e3i0xzAMTQ=;
 b=jxc5015hI2LZyNipb+CoXfTZU+jzJZyD+2NKeuboHeb+4od3BBpmjB0Q9mePrMfO94
 PREa6xlnl6nufKXfsTpT1wyzODA8/LtveuSuP28t0vLZ2lJ4IrSfiBMwHKbVn4oTSI8o
 0yCB5xRX1gAW+0/EeI88pCyCMTw1V/hjRjga3T568rbzVG4aM1JYxHZegua4NFRXoMz+
 afDecZ+VMJW8XiheYW8XSs9jfvnHHGjfa+Tg3iwkfO4fVpxs8cdKI5MRdCe6RaKUd9qe
 RJRA+YTjTuZeKA0jLsopliIbIi9QdZ6LrQp0utUtWkp5bnMU2HDNZ2JFNRlr3nyhzpo4
 xQRQ==
X-Gm-Message-State: APjAAAU3gpXatIXOzyKTOXEuZGh1QHnt/BvErXyDcklz0svW7VbmbMoV
 4r9qt6rFiEqXXtsXTK2vBbObHyzd+hAhoNTWApcsWl47
X-Google-Smtp-Source: APXvYqxgUVzBCoxuzmcZpiTRvoG4cOLPNv8zhAToRJ9Y+7WQhLTdvAMncBok6kmaVcBAjdy8xRfEZgcvH0DW/9PNsJo=
X-Received: by 2002:a5d:9047:: with SMTP id v7mr1788433ioq.18.1561424337411;
 Mon, 24 Jun 2019 17:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190624145913.20122-1-vaibhav@linux.ibm.com>
 <20190624145913.20122-2-vaibhav@linux.ibm.com>
In-Reply-To: <20190624145913.20122-2-vaibhav@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 25 Jun 2019 10:58:45 +1000
Message-ID: <CAOSf1CGsqrRrpWQguRc+V=jqX=JoubihsOpSbCTvRzt-A5ZLZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/papr_scm: Update drc_pmem_unbind() to use
 H_SCM_UNBIND_ALL
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 1:03 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> The new hcall named H_SCM_UNBIND_ALL has been introduce that can
> unbind all the memory drc memory-blocks assigned to an lpar. This is
> more efficient than using H_SCM_UNBIND_MEM as currently we don't
> support partial unbind of drc memory-blocks.
>
> Hence this patch proposes following changes to drc_pmem_unbind():
>
>     * Update drc_pmem_unbind() to replace hcall H_SCM_UNBIND_MEM to
>       H_SCM_UNBIND_ALL.
>
>     * Update drc_pmem_unbind() to handles cases when PHYP asks the guest
>       kernel to wait for specific amount of time before retrying the
>       hcall via the 'LONG_BUSY' return value. In case it takes more
>       than 1 second to unbind the memory log a warning.

Have you benchmarked how long a typical bind operation takes for very
large (1+TB) volumes? I remember it taking a while for the driver to
finish probing and I'd rather we didn't add spurious warnings. That
might have been due to the time taken to online memory rather than the
bind though.

>     * Ensure appropriate error code is returned back from the function
>       in case of an error.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h         |  2 +-
>  arch/powerpc/platforms/pseries/papr_scm.c | 37 ++++++++++++++++++++---
>  2 files changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index 463c63a9fcf1..bb56fa0f976c 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -302,7 +302,7 @@
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_QUERY_BLOCK_MEM_BINDING 0x3F4
>  #define H_SCM_QUERY_LOGICAL_MEM_BINDING 0x3F8
> -#define H_SCM_MEM_QUERY                0x3FC
> +#define H_SCM_UNBIND_ALL        0x3FC
>  #define H_SCM_BLOCK_CLEAR       0x400
>  #define MAX_HCALL_OPCODE       H_SCM_BLOCK_CLEAR

We should probably update all these to match the latest spec. Can you
do that in a separate patch?

> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 96c53b23e58f..d790e4e4ffb3 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -11,11 +11,16 @@
>  #include <linux/sched.h>
>  #include <linux/libnvdimm.h>
>  #include <linux/platform_device.h>
> +#include <linux/delay.h>
>
>  #include <asm/plpar_wrappers.h>
>
>  #define BIND_ANY_ADDR (~0ul)
>
> +/* Scope args for H_SCM_UNBIND_ALL */
> +#define H_UNBIND_SCOPE_ALL (0x1)
> +#define H_UNBIND_SCOPE_DRC (0x2)
> +
>  #define PAPR_SCM_DIMM_CMD_MASK \
>         ((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>          (1ul << ND_CMD_GET_CONFIG_DATA) | \
> @@ -78,21 +83,43 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>  {
>         unsigned long ret[PLPAR_HCALL_BUFSIZE];
>         uint64_t rc, token;
> +       unsigned long starttime;
>
>         token = 0;
>
> -       /* NB: unbind has the same retry requirements mentioned above */
> +       dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
> +
> +       /* NB: unbind_all has the same retry requirements as drc_pmem_bind() */
> +       starttime = HZ;
>         do {
> -               rc = plpar_hcall(H_SCM_UNBIND_MEM, ret, p->drc_index,
> -                               p->bound_addr, p->blocks, token);
> +               /* If this is taking too much time then log warning */
> +               if (jiffies_to_msecs(HZ - starttime) > 1000) {
> +                       dev_warn(&p->pdev->dev,
> +                                "unbind taking > 1s to complete\n");
> +                       starttime = HZ;
> +               }
> +
> +               /* Unbind of all SCM resources associated with drcIndex */
> +               rc = plpar_hcall(H_SCM_UNBIND_ALL, ret, H_UNBIND_SCOPE_DRC,
> +                                p->drc_index, token);
>                 token = ret[0];
> -               cond_resched();
> +
> +               /* Check if we are stalled for some time */
> +               if (H_IS_LONG_BUSY(rc)) {
> +                       msleep(get_longbusy_msecs(rc));
> +                       rc = H_BUSY;

> +                       token = 0;

The hypervisor should be returning a continue token if the return code
is H_BUSY or any of the H_LONG_BUSY codes. The spec says that if we
get a busy return value then we must use the continue token for the
next unbind, so why are you zeroing it here? If this is required to
make it work then it's a bug in the hypervisor.

> +               } else if (rc == H_BUSY) {
> +                       cond_resched();
> +               }
> +
>         } while (rc == H_BUSY);
>
>         if (rc)
>                 dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);

A dev_dbg() for the unbind time might be nice.

>
> -       return !!rc;
> +       return rc == H_SUCCESS ? 0 : -ENXIO;
>  }
>
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
> --
> 2.21.0
>
