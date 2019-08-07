Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC28437C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 06:54:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463K1K5bdMzDrG2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 14:54:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="peG6h4cs"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463Jzg26dtzDqws
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 14:53:12 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id n5so99342434otk.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 21:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CpPIyvnKFWkuaLYcVpqDki1olWa07+gbL5ANQ9lHac=;
 b=peG6h4csqre45VhS+zD6MYcwYNk5HUeEqpbTFKlRVdPbpFw4X4ZCXJYHTjFVDLOtht
 RoN+lhMGgMtx3PKrIxjSzzfpOJPKV0ueUfGDu+OIGxQW+7so2ilek8xkgJ82Ipd1ijGw
 d0+ylJGG42kWhRW6VShBCYWd/p83y36oDxEyFPTKQIFmgNmnE+8M+pfDEXArysGMcABy
 DwMTL7bED7wKIUALO6OLmRFKcpd6Ew+WleYDNC7UXBkrzs2R3PIuOIKax7o+8mdp7oAm
 0aT0xr4ZlpzLEGuFAI2/SDTsEhLSUfpt4IfroKo6tnFlsyP0h4piF81YDWTeMmFRJicX
 LtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CpPIyvnKFWkuaLYcVpqDki1olWa07+gbL5ANQ9lHac=;
 b=MW03DzfDRiket7qcb+FzebvMhrcDIeoxI4sZRr2YiuIMnwSQKXkDx3R7oSdUvtxVbv
 hI/uS2WC5oXIQio5jvQOV3aL2C87gOZxuJXBNqRH43tma8oU8qNAJSN94C/nUuHyct/q
 SVfE/1wL/XqnJjccBPxGFU5WwUTqo7dRnUBqb0i0PsmeW0sib4Gs05Co5Fr0Gb+sA6lI
 PRA3NPQFBznNuX6uN7YI8276hp4E6C4KB0ZxLgEfYt9YVaQcPnug4EVWXZMt+rqYEfLq
 VXoqTa/gO7v5N/+Zui6gGZBA22RqpWdDwVpe8EzarR5/6tbtipxmhsY/z8INwjEzBwCK
 AePw==
X-Gm-Message-State: APjAAAUgDpIMUam3pvOSy1SXk4g9GZEV/ehDSOZxq0uSJgYZySmokWMK
 lkK0XHNzyn+ngKkhIrCy0UoYeb+pcwe9F1N67Gheog==
X-Google-Smtp-Source: APXvYqw/J4KuoAhA+kSxUrBlU+W9n6v9nDVZqYvsp3MaYhj2HB7qQ5b5es8BCtv4fonyj8HLIBgBwbHMBjfP4P0GIxQ=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr6568561otk.363.1565153588793; 
 Tue, 06 Aug 2019 21:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190807040029.11344-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4haXOjn7K-HgPV_WLqbfqRQbbiq=LvLt5Ue=OPAaBWN6A@mail.gmail.com>
 <c99ecdad-e9de-cd76-1601-841de35602a0@linux.ibm.com>
In-Reply-To: <c99ecdad-e9de-cd76-1601-841de35602a0@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 6 Aug 2019 21:52:57 -0700
Message-ID: <CAPcyv4ia5F73Qd0FyOWkHAUGoXrPFFQwA-R3DNXb0mGyOS5fgQ@mail.gmail.com>
Subject: Re: [PATCH] nvdimm/of_pmem: Provide a unique name for bus provider
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 6, 2019 at 9:17 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 8/7/19 9:43 AM, Dan Williams wrote:
> > On Tue, Aug 6, 2019 at 9:00 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> ndctl utility requires the ndbus to have unique names. If not while
> >> enumerating the bus in userspace it drops bus with similar names.
> >> This results in us not listing devices beneath the bus.
> >
> > It does?
> >
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>   drivers/nvdimm/of_pmem.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
> >> index a0c8dcfa0bf9..97187d6c0bdb 100644
> >> --- a/drivers/nvdimm/of_pmem.c
> >> +++ b/drivers/nvdimm/of_pmem.c
> >> @@ -42,7 +42,7 @@ static int of_pmem_region_probe(struct platform_device *pdev)
> >>                  return -ENOMEM;
> >>
> >>          priv->bus_desc.attr_groups = bus_attr_groups;
> >> -       priv->bus_desc.provider_name = "of_pmem";
> >> +       priv->bus_desc.provider_name = kstrdup(pdev->name, GFP_KERNEL);
> >
> > This looks ok to me to address support for older ndctl binaries, but
> > I'd like to also fix the ndctl bug that makes non-unique provider
> > names fail.
> >
>
> 0462269ab121d323a016874ebdd42217f2911ee7 (ndctl: provide a method to
> invalidate the bus list)
>
> This hunk does the filtering.
>
> @@ -928,6 +929,14 @@ static int add_bus(void *parent, int id, const char
> *ctl_base)
>                 goto err_read;
>         bus->buf_len = strlen(bus->bus_path) + 50;
>
> +       ndctl_bus_foreach(ctx, bus_dup)
> +               if (strcmp(ndctl_bus_get_provider(bus_dup),
> +                                       ndctl_bus_get_provider(bus)) == 0) {
> +                       free_bus(bus, NULL);
> +                       free(path);
> +                       return 1;
> +               }
> +

Yup, that's broken, does this incremental fix work?

diff --git a/ndctl/lib/libndctl.c b/ndctl/lib/libndctl.c
index 4d9cc7e29c6b..6596f94edef8 100644
--- a/ndctl/lib/libndctl.c
+++ b/ndctl/lib/libndctl.c
@@ -889,7 +889,9 @@ static void *add_bus(void *parent, int id, const
char *ctl_base)

        ndctl_bus_foreach(ctx, bus_dup)
                if (strcmp(ndctl_bus_get_provider(bus_dup),
-                                       ndctl_bus_get_provider(bus)) == 0) {
+                                       ndctl_bus_get_provider(bus)) == 0
+                               && strcmp(ndctl_bus_get_devname(bus_dup),
+                                       ndctl_bus_get_devname(bus)) == 0) {
                        free_bus(bus, NULL);
                        free(path);
                        return bus_dup;
