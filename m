Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0352057
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 03:25:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XpPK3WJkzDqGW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 11:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d4jnojcN"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XpMg6PlxzDq63
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 11:23:43 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id w25so657469ioc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 18:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vwUvKxXGRWl3fqmIX2VuGpqzVn8mxDBYkphC5dNoq9w=;
 b=d4jnojcNNc47khK9WrfxHN/Kjjppkp3B5789Vmz0p4eIh4UC9pNlAw1isRTb80pFlb
 geA2R4qLuVsJgQFmQNUL4LEkZNEm8jEsjMe8TEnas4OumWW4j0OelVmFH+zlrLJZAeGj
 pfiVyOSYY4LV+dNBQYggkbWJj04s0mr8Dyu5e9TbeaOPR3XhdTBEjTAbh6oNQSsXb+05
 DQ+ZS9Qxm/NPxPHbGAAo4/94mHqEbo+xBfHAAjX7ZfzyXkJ860vM3sPn7bQp3YsRfzJW
 JVvxY0kY+MrH138LicjOvb4eBNBQGLMDYsmirq72uqLHD2tk25q3yMkiHKRIn16RyxUJ
 JNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vwUvKxXGRWl3fqmIX2VuGpqzVn8mxDBYkphC5dNoq9w=;
 b=h+w+O8coTo3cjPS3bqKztz9FhosYjhRftzZhcRWOwY+uPvfOXQdes16GN/rgZtzde+
 cVwICVjJXdAZsjtRcyOJ1KSn5F/CuKkFdZ06KgbPKeHkPHnvxeC/wH/rF5222bdIRAoZ
 cm8+oBlvsVG64mUppmGXh7y/uumJg0f4D+9o3TJaxqPJiYwJlh6ZMQ7FyzUHhzZhW6Rd
 Wy20HPvITleU2HnBN5Kgavw1OPufSHfzidrMX+SNlbXY7jbiQF6ikI7EIXuL+iUqrloj
 1SttEuZWOYIzbJdhm0C5OcF1U4fWYSpiVSc4u1ISWhcDX4Y6MaakLPJHo9S8IaTTHNRs
 553Q==
X-Gm-Message-State: APjAAAWHihimLGV0Ceu6vySlKvnUrnPbRO7jan2eSPQccqApgmTiu4wK
 Isoy8fwx6mKR8UbgugrOXwVSLulXfyWXrWqJltk=
X-Google-Smtp-Source: APXvYqyZ91I+LQCdZ241kLdjonI/D3ZSf5FpqYkqBJdVxj4j/Euz5DhU0F9GHQLLNUEnm5oT8Pipyya4Gha0rbpsLOU=
X-Received: by 2002:a05:6602:22cc:: with SMTP id
 e12mr39266628ioe.192.1561425821135; 
 Mon, 24 Jun 2019 18:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190624145913.20122-1-vaibhav@linux.ibm.com>
 <20190624145913.20122-3-vaibhav@linux.ibm.com>
In-Reply-To: <20190624145913.20122-3-vaibhav@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 25 Jun 2019 11:23:29 +1000
Message-ID: <CAOSf1CE4SjuiyYkMgER2-Ndp50dbUmVjfhiGM-sX9ySVPkH3ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Force a scm-unbind if initial
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

On Tue, Jun 25, 2019 at 12:59 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> In some cases initial bind of scm memory for an lpar can fail if
> previously it wasn't released using a scm-unbind hcall. This situation
> can arise due to panic of the previous kernel or forced lpar reset. In
> such cases the H_SCM_BIND_MEM return a H_OVERLAP error.

What is a forced lpar reset? fadump?

> To mitigate such cases the patch updates drc_pmem_bind() to force a
> call to drc_pmem_unbind() in case the initial bind of scm memory fails
> with H_OVERLAP error. In case scm-bind operation again fails after the
> forced scm-unbind then we follow the existing error path.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index d790e4e4ffb3..049d7927c0a4 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -44,19 +44,26 @@ struct papr_scm_priv {
>         struct nd_interleave_set nd_set;
>  };

> +/* Forward declaration */
pointless comment.

> +static int drc_pmem_unbind(struct papr_scm_priv *);
>
>  static int drc_pmem_bind(struct papr_scm_priv *p)
>  {
>         unsigned long ret[PLPAR_HCALL_BUFSIZE];
>         uint64_t rc, token;
> -       uint64_t saved = 0;
> +       uint64_t saved;
> +       bool tried_unbind = false;

nit: kernel style uses reverse christmas tree declarations, so this should be:

unsigned long ret[PLPAR_HCALL_BUFSIZE];
bool tried_unbind = false;
uint64_t rc, token;
uint64_t saved;

Come to think of it rc should probably be signed since the hcall
return codes are negative. I'm surprised that's not causing a warning
since we use %lld to print rc rather than %llu.

> +       dev_dbg(&p->pdev->dev, "bind drc %x\n", p->drc_index);
>         /*
>          * When the hypervisor cannot map all the requested memory in a single
>          * hcall it returns H_BUSY and we call again with the token until
>          * we get H_SUCCESS. Aborting the retry loop before getting H_SUCCESS
>          * leave the system in an undefined state, so we wait.
>          */
> +retry:
>         token = 0;
> +       saved = 0;
>
>         do {
>                 rc = plpar_hcall(H_SCM_BIND_MEM, ret, p->drc_index, 0,
> @@ -68,8 +75,18 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>         } while (rc == H_BUSY);
>
>         if (rc) {
> -               dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
> -               return -ENXIO;

> +               /* retry after unbinding */
> +               if (rc == H_OVERLAP &&  !tried_unbind) {
> +                       dev_warn(&p->pdev->dev, "Un-binding and retrying\n");
> +                       /* Try unbind and ignore any errors */
> +                       tried_unbind = true;
> +                       drc_pmem_unbind(p);
> +                       goto retry;

I think It'd be cleaner if we put the unbind-and-retry logic into the
probe function, e.g:

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
b/arch/powerpc/platforms/pseries/papr_scm.c
index 96c53b23e58f..d113779fc27c 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -316,6 +316,14 @@ static int papr_scm_probe(struct platform_device *pdev)

        /* request the hypervisor to bind this region to somewhere in memory */
        rc = drc_pmem_bind(p);
+       if (rc == -EBUSY) {
+               /*
+                * If we kexec()ed the previous kernel might have left the DRC
+                * bound in memory. Unbind it and try again.
+                */
+               drc_pmem_unbind(p);
+               rc = drc_pmem_bind(p);
+       }
        if (rc)
                goto err;

Up to you though.
