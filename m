Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB631156B51
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 17:14:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48FvHG4zCkzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 03:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=meAEp81q; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FvFg5sSfzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 03:12:37 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id q81so6956924oig.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Feb 2020 08:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvMojplJbmxwO1iOJeURmK+oFSfZngPcvYQJtCKHfW8=;
 b=meAEp81qSJVz7dXt4UnLtZry9PtoQbUBOr3GJLAIh4q5m8drJxQZ4Oz+ZMA5ur4PUC
 UdPdIf23+nN+1egnGk9fUuGOgUTAt8iIUDfU6C1x9447AJt6qIQJrRrolp30PMIUXib1
 YJdPJEjgBFr4wXpJhf5X0cmk/kohH2hx2ChcQbAa5VVfFEQ60Up89qZpEzJu2g/5xDsK
 DoG44ea5PKfE6Yzr6PhaNcLC0lu7Rw5gew+hKlwSAlv3auEIBw7RhLbVGULmgSVOqJy7
 W+MlNa8J3WNhrFIy9Krgcr0kiBjk8Nt3EA7DlS/aKCaygpuRKK3pVQmBYHKZK2w+du5l
 4ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvMojplJbmxwO1iOJeURmK+oFSfZngPcvYQJtCKHfW8=;
 b=PvFSdnB9JxqZjCgE7tJ/DCEef1pWl62mGZbSNgs8DfNZ1Y19mZ4T/lgsAbYVEjUQSc
 h/hbfJygZmxq02Ig7q3snx43E0qoId+U+73Um+egJc6X3A7GM94Cs+0Kyqcls6is9Ua6
 MNgcPExdI3HrELMEYdiJ3dco4zXO2u3OJfHPFhSLHdNbMYUxUwu7sEJXFB2Kzj0RnyR8
 7G++E4aB9m0MeRgK0EW349/Lj64ZZYD2r6s1/X+/lz0puEWlynLw68e1NiZj8RUGALRH
 5t2aKXiS+HE9oZQwjHZ/R4fy1rxW7DurQrR0CqUbLBLeSBq7Ji5UP0CzglRF3QAmEhsS
 /yyA==
X-Gm-Message-State: APjAAAW3SksyGhGw9BnoXLEK6Rmgb5Ki5Wcb0Emoi4FFFlVVp28wERnc
 I5df0Pce5p55MyVJpjktouk4GUiEJkPLKUr4EZ/IZWyg
X-Google-Smtp-Source: APXvYqwyEPi/dOmLjoXvgsgsmTkdL5NLyztYKH9eYBnWSndT/W/QfwtIhs+bu1bO2GnpffymtYHL9+iyQAVJ8EJwt98=
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr8576458oij.0.1581264754089; 
 Sun, 09 Feb 2020 08:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20200205052056.74604-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200205052056.74604-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 9 Feb 2020 08:12:22 -0800
Message-ID: <CAPcyv4hBAk-dwO4=AT7cQm5YUwCBg0AECsZsiCjRJ_ZGWvWUAw@mail.gmail.com>
Subject: Re: [PATCH v2] libnvdimm: Update persistence domain value for of_pmem
 and papr_scm device
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
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 4, 2020 at 9:21 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Currently, kernel shows the below values
>         "persistence_domain":"cpu_cache"
>         "persistence_domain":"memory_controller"
>         "persistence_domain":"unknown"
>
> "cpu_cache" indicates no extra instructions is needed to ensure the persistence
> of data in the pmem media on power failure.
>
> "memory_controller" indicates platform provided instructions need to be issued

No, it does not. The only requirement implied by "memory_controller"
is global visibility outside the cpu cache. If there are special
instructions beyond that then it isn't persistent memory, at least not
pmem that is safe for dax. virtio-pmem is an example of pmem-like
memory that is not enabled for userspace flushing (MAP_SYNC disabled).

> as per documented sequence to make sure data get flushed so that it is
> guaranteed to be on pmem media in case of system power loss.
>
> Based on the above use memory_controller for non volatile regions on ppc64.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 7 ++++++-
>  drivers/nvdimm/of_pmem.c                  | 4 +++-
>  include/linux/libnvdimm.h                 | 1 -
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 7525635a8536..ffcd0d7a867c 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -359,8 +359,13 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>
>         if (p->is_volatile)
>                 p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
> -       else
> +       else {
> +               /*
> +                * We need to flush things correctly to guarantee persistance
> +                */

There are never guarantees. If you're going to comment what does
software need to flush, and how?

> +               set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
>                 p->region = nvdimm_pmem_region_create(p->bus, &ndr_desc);
> +       }
>         if (!p->region) {
>                 dev_err(dev, "Error registering region %pR from %pOF\n",
>                                 ndr_desc.res, p->dn);
> diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
> index 8224d1431ea9..6826a274a1f1 100644
> --- a/drivers/nvdimm/of_pmem.c
> +++ b/drivers/nvdimm/of_pmem.c
> @@ -62,8 +62,10 @@ static int of_pmem_region_probe(struct platform_device *pdev)
>
>                 if (is_volatile)
>                         region = nvdimm_volatile_region_create(bus, &ndr_desc);
> -               else
> +               else {
> +                       set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
>                         region = nvdimm_pmem_region_create(bus, &ndr_desc);
> +               }
>
>                 if (!region)
>                         dev_warn(&pdev->dev, "Unable to register region %pR from %pOF\n",
> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> index 0f366706b0aa..771d888a5ed7 100644
> --- a/include/linux/libnvdimm.h
> +++ b/include/linux/libnvdimm.h
> @@ -54,7 +54,6 @@ enum {
>         /*
>          * Platform provides mechanisms to automatically flush outstanding
>          * write data from memory controler to pmem on system power loss.
> -        * (ADR)

I'd rather not delete critical terminology for a developer / platform
owner to be able to consult documentation, or their vendor. Can you
instead add the PowerPC equivalent term for this capability? I.e. list
(x86: ADR PowerPC: foo ...).
