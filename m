Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D655F77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 05:26:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YT2Z3rJCzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 13:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PcmKyoL0"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YT0w4q7QzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 13:24:46 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id m24so1899666ioo.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 20:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RFVV/GZBFi5Z35yAzLLpG00t2/wHBYPcJXuWxXp87bA=;
 b=PcmKyoL0B1rtAMXy+vOAar5cDGqzelaKNIE+GvVOflymg0N45VSWWYBbR0ZJA5ijFh
 bCl/B6uiYU2tBw7iv5ELE2p6FAo+48uTI5hcKU2R9qP+lYtgUiFHiePcip27y1Yeh2LT
 zuzE1xylvZw7wFaK0Oi+XDKaNtDxvXI7rLzoHzxJ8QJGRkkn8Fj7uR/JBsH6ljNLC068
 JHlAauIgcGDmNER4eRZBsE8KwtTPSpAl7E0g/R7/41UP4cgzrdMskdRKRR80pTuAQ6x8
 S0xBvwtDN5OLKQKHTJpEf8Q2S2wSvO3vdVTYvSQp2VFHpXfa5kpESFooZkoHL7aBtgsn
 h23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RFVV/GZBFi5Z35yAzLLpG00t2/wHBYPcJXuWxXp87bA=;
 b=jwuhORl9t0CwGyAv2ODs6K8LUT6uWZnqfYpYynT3NwWXi4nannZflG2sodZlPY1PDB
 /cFxGAqWcc+HQ2Ad/0KYoAlLtP1jtQsIlSsfite8cIA7+Lw50DuiTnBr8/wi1Nr034P4
 MrUsJbtmI8ZrYQoDOQ/bYzfswdm/jInZ/K/UAPdow7apc3BjdD3XUWYdj6v05c9zMzyN
 bsEBOc3NPrjutTGD/5s8RDsRqqOSimt3xKdzruahDcsyA3qi3LFjNfeZa6iMVYN5zVYF
 lAaZfZt+iXOlqQf04cpU1rk9idDLhauxIJF3/Q//lu9HTBwFfO4copj3HmwaxH5YrTNv
 RIiA==
X-Gm-Message-State: APjAAAXi18NOzs3T6aZ2eXU6X5Y2CWu9q2syjWzuLllZpVo1rYzb6eyJ
 AbWWqZoDZxXo2CFe9DYf8rM+hvqaBuhJ8trtO/nGQw==
X-Google-Smtp-Source: APXvYqzC2SI7+I8F//e9knNpgD/J5W3gIuvdTtJOcO56VitAeil58nQdvZjqVGoWLmjDtJzRFLn6+r2WEunGpX2b8nI=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr2455412iop.293.1561519483184; 
 Tue, 25 Jun 2019 20:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190625122709.11846-1-vaibhav@linux.ibm.com>
 <20190625122709.11846-4-vaibhav@linux.ibm.com>
In-Reply-To: <20190625122709.11846-4-vaibhav@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 26 Jun 2019 13:24:32 +1000
Message-ID: <CAOSf1CF81NS8E9WQJo+bWWzg8BdovWXKpURXqHarz8tt+XOiTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
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

On Tue, Jun 25, 2019 at 10:27 PM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> In some cases initial bind of scm memory for an lpar can fail if
> previously it wasn't released using a scm-unbind hcall. This situation
> can arise due to panic of the previous kernel or forced lpar
> fadump. In such cases the H_SCM_BIND_MEM return a H_OVERLAP error.
>
> To mitigate such cases the patch updates papr_scm_probe() to force a
> call to drc_pmem_unbind() in case the initial bind of scm memory fails
> with EBUSY error. In case scm-bind operation again fails after the
> forced scm-unbind then we follow the existing error path. We also
> update drc_pmem_bind() to handle the H_OVERLAP error returned by phyp
> and indicate it as a EBUSY error back to the caller.
>
> Suggested-by: "Oliver O'Halloran" <oohall@gmail.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
>
> v2:
> * Moved the retry code from drc_pmem_bind() to papr_scm_probe()
>   [Oliver]
> * Changed the type of variable 'rc' in drc_pmem_bind() to
>   int64_t. [Oliver]
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index a4e1674bb15c..2c90cbe88313 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -43,8 +43,9 @@ struct papr_scm_priv {
>  static int drc_pmem_bind(struct papr_scm_priv *p)
>  {
>         unsigned long ret[PLPAR_HCALL_BUFSIZE];
> -       uint64_t rc, token;
>         uint64_t saved = 0;
> +       uint64_t token;
> +       int64_t rc;
>
>         /*
>          * When the hypervisor cannot map all the requested memory in a single
> @@ -64,6 +65,10 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>         } while (rc == H_BUSY);
>
>         if (rc) {
> +               /* H_OVERLAP needs a separate error path */
> +               if (rc == H_OVERLAP)
> +                       return -EBUSY;
> +
>                 dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
>                 return -ENXIO;
>         }
> @@ -331,6 +336,14 @@ static int papr_scm_probe(struct platform_device *pdev)
>
>         /* request the hypervisor to bind this region to somewhere in memory */
>         rc = drc_pmem_bind(p);
> +
> +       /* If phyp reports drc memory still bound the force unbound and retry */

"the force" should be "then force"?

> +       if (rc == -EBUSY) {
> +               dev_warn(&pdev->dev, "Retrying bind after unbinding\n");


Looks good otherwise,

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
