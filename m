Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB82A1338
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:04:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JwB92HzhzDr97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:04:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="clrVBVaN"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jw574JJgzDrBv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:00:11 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id j5so5073258ioj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oVotxGebids4TFp3x/bYvSPZpIw5FaFgkOK0MmkO4Wk=;
 b=clrVBVaN5dOhL2Dw55x99zrwPG1GZcrRgBQCbTKSj7yO8cfDxnRxMtJMNuA3FBwIet
 cVagLnY/sgI9nfk0aLXMmqHQVxTKxmpeOgSM9MnO+F5y04SnTQ13W9u0b7yUTsBUEYK3
 1jN+12vMY9RSmS9DygQH6ICegK9Cm5OoTgFXazVoa9WMlEGGEqcMQ3XjwlUK8XTC6Gj/
 K5MLh0Wsl74djTzn+AFdNRm7BbGMsUK/6PKjaSz2Wc4KonV9ue66x2e+bTbc5rPsFJj+
 zwodcBU0KMiY6L33X8GAoI5TSi+eY+xyVK77hwBb+nskPJ0CRyGI0QyXjFHAKYOu0ep9
 GKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oVotxGebids4TFp3x/bYvSPZpIw5FaFgkOK0MmkO4Wk=;
 b=m6ygWvOwa2nFK9ru5AOwHagG13wGms21LbzqM8wzogJKVVhr6K6xCUT7rOM8oW7yR/
 36ZrkJuDfdfqH0fdx6uSW8dFkhuxKSMdP+zvIeK4SgYUTbOUrSX41SfRuNCzRrz8ifkE
 vWTtFWo0oI9/vZivKveQKV0IifLRDp12NkTOp8I8B91T5XdnO0XHcWjCoXQ1iAhPvGxd
 zY0CN+PRCdPdDvIDVo2h4cZEgiMBy0qdpF30Rye0+YbiMmBW0ibz9I0XbDsP2+aeublx
 8VvXqYuW6iEWI4mC7JZTLhS1V41TBY/t7uhTuNvbfHJgwPfHhtwOzNtgZqsGGBWkG18X
 e8Xg==
X-Gm-Message-State: APjAAAVgmPrkiL2K56oy8Ib4E1eCrKWgk2KkajoDBv3JoVJ1ZlzX2oeo
 7Ux2bwwo2K36CelRQkwkkxrNhimLAortNUJfz2E=
X-Google-Smtp-Source: APXvYqyRwjYAv0NhUYu0lUNiHvKgw2p/Gp8V/1Gg5hYeLOm2Rk0lZ/dSHbap7jPI6fwaxXdNzXpMKIxR5uWwkrKFh+Y=
X-Received: by 2002:a6b:6b11:: with SMTP id g17mr3869503ioc.293.1567065607875; 
 Thu, 29 Aug 2019 01:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190829063347.13966-1-aneesh.kumar@linux.ibm.com>
 <20190829063347.13966-2-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190829063347.13966-2-aneesh.kumar@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 29 Aug 2019 17:59:56 +1000
Message-ID: <CAOSf1CFuU7tCzKfYNDTe5Tut=Mz+2gL+nnvQ74y75PyrhTP7AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/nvdimm: use H_SCM_QUERY hcall on H_OVERLAP
 error
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 4:34 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Right now we force an unbind of SCM memory at drcindex on H_OVERLAP error.
> This really slows down operations like kexec where we get the H_OVERLAP
> error because we don't go through a full hypervisor re init.

Maybe we should be unbinding it on a kexec().

> H_OVERLAP error for a H_SCM_BIND_MEM hcall indicates that SCM memory at
> drc index is already bound. Since we don't specify a logical memory
> address for bind hcall, we can use the H_SCM_QUERY hcall to query
> the already bound logical address.

This is a little sketchy since we might have crashed during the
initial bind. Checking if the last block is bound to where we expect
it to be might be a good idea. If it's not where we expect it to be,
then an unbind->bind cycle is the only sane thing to do.

> Boot time difference with and without patch is:
>
> [    5.583617] IOMMU table initialized, virtual merging enabled
> [    5.603041] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Retrying bind after unbinding
> [  301.514221] papr_scm ibm,persistent-memory:ibm,pmemory@44108001: Retrying bind after unbinding
> [  340.057238] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs

Is the unbind significantly slower than a bind? Or is the region here
just massive?

> after fix
>
> [    5.101572] IOMMU table initialized, virtual merging enabled
> [    5.116984] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Querying SCM details
> [    5.117223] papr_scm ibm,persistent-memory:ibm,pmemory@44108001: Querying SCM details
> [    5.120530] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 26 ++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 220e595cb579..4b74cfe7b334 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -110,6 +110,27 @@ static void drc_pmem_unbind(struct papr_scm_priv *p)
>         return;
>  }
>
> +static int drc_pmem_query(struct papr_scm_priv *p)
> +{
> +       unsigned long ret[PLPAR_HCALL_BUFSIZE];
> +       int64_t rc;
> +
> +
> +       rc = plpar_hcall(H_SCM_QUERY_BLOCK_MEM_BINDING, ret,
> +                        p->drc_index, 0);
> +
> +       if (rc) {
> +               dev_err(&p->pdev->dev, "Failed to bind SCM");
> +               return rc;
> +       }
> +
> +       p->bound_addr = ret[0];
> +       dev_dbg(&p->pdev->dev, "bound drc 0x%x to %pR\n", p->drc_index, &p->res);
> +
> +       return 0;
> +}
> +
> +
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>                              struct nd_cmd_get_config_data_hdr *hdr)
>  {
> @@ -431,9 +452,8 @@ static int papr_scm_probe(struct platform_device *pdev)
>
>         /* If phyp says drc memory still bound then force unbound and retry */
>         if (rc == H_OVERLAP) {
> -               dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
> -               drc_pmem_unbind(p);
> -               rc = drc_pmem_bind(p);

> +               dev_warn(&pdev->dev, "Querying SCM details\n");

That's a pretty vague message. If we're going to treat leaving the
region bound over kexec() as normal then you might want to bump it
down to pr_info() or so.

> +               rc = drc_pmem_query(p);
>         }
>
>         if (rc != H_SUCCESS) {
> --
> 2.21.0
>
