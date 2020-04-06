Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90819F3C6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:45:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wnHV3nRWzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:45:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H73+pt7B; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wnFq2HnJzDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:43:43 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id g15so14116578ilj.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2BZ8kYXiM1BuTjCJPDJWq064ZRhtYcG64ceYL8l4ZHI=;
 b=H73+pt7BbqZdfpJ4kn3Pz3eASUQ7E5K5n+u66xAH7oKU9x7IgwRKopHEYLN767ajR/
 JkMwOzBwNM0r+bDxpTVBuKpdc1ICpyVg7WK9BY73ENYPloSGUB+E3WaWzD7yepBQnXGP
 eMSixej2ld7yfU5izyuXLdJnoWuWxJ9aLdQ/yJLXLJKqhtt82tSOHZfEBBi+G01dNLoH
 LD0xGohfeYyXYVStttxxd6hR0nnDBz1qoQSq7rFfY4WfcIUmgO6MGmgNbNN5HoTt+3m3
 r4b+DP3TC/ED9tfLdWnZlrjVKt3iyLcULgbb8I+zm/gU+NX3Ob27ytnUb1TyiQDHGjnQ
 5THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2BZ8kYXiM1BuTjCJPDJWq064ZRhtYcG64ceYL8l4ZHI=;
 b=qJIKsEsfUA3t5mu2CR4h/Fr75YAZn3cqaSj5FrhIfmjiEwjLC3CHhEAtONUtfHXf5B
 qdPy6siqnuzC0dMV9aBZfXO89UkoG5Pt2T8+b5iCChx8CjxV9xhUNCLQ+izKqloxWtl0
 t4Vn1dhyuTtu4BYs1GlcUHTnYAWvSnTNAQ0MFcX++PMtVKw+IJ7ZiPBr1nYG4n5emVr0
 vsXLvZ9OQY2CcZbJFdGCCzHy8ShMMmCMn1nIttnOudnLO0SdK2EEoI/w/2LH8yn95KM2
 KLVc/8RSJ9gS0eIvZEnEWGPo/5cKsn9t28Sb85214FOMpdxVu5sctrJuYdu+3kGYsmQ1
 GNUQ==
X-Gm-Message-State: AGi0Pub/fNLMj2U5pkFCw/7LXX2rb/9U0j8QkMh9LtEb9NhP+VnnMt1I
 thzeva7usxgJLKK7sL0d53/QlSeKB6gOJKfM8wQ=
X-Google-Smtp-Source: APiQypJyrlEDFj+pXJzHS3MWEdJ04ArtFK1ZoHOVPrqWHQHCzochugDXZMIBGthwFew57upW4dM31ZUO7Ew7VgwzFYE=
X-Received: by 2002:a92:83ca:: with SMTP id p71mr19104698ilk.278.1586169820155; 
 Mon, 06 Apr 2020 03:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200406093944.4174-1-hqjagain@gmail.com>
 <87eet0sy79.fsf@mpe.ellerman.id.au>
In-Reply-To: <87eet0sy79.fsf@mpe.ellerman.id.au>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Mon, 6 Apr 2020 18:43:27 +0800
Message-ID: <CAJRQjoeTYg6NnxwvXusU6fdOFOmOiceokYJZQ23-0YQo_yqZ5w@mail.gmail.com>
Subject: Re: [PATCH v4] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Markus Elfring <Markus.Elfring@web.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 6:30 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Qiujun Huang <hqjagain@gmail.com> writes:
> > Here needs a NULL check as kzalloc may fail returning NULL.
> >
> > Issue was found by coccinelle.
> > Generated by: scripts/coccinelle/null/kmerr.cocci
> >
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
> >
> > ---
>
> Thanks for putting up with all the review comments :)
>
> But I think this should actually be two patches now.
>
> The first patch should change the goto after
> of_property_read_u64_array() into a return and drop the redundant
> assignments.
>
> Then the second patch can add the NULL check for attr.

Get that, I'll separate them.

>
> cheers
>
> > v3->v4:
> >       Added the information about coccinelle script.
> >       Added change log.
> >       Added Oliver's Reviewed-by.
> > v2->v3:
> >       Removed redundant assignment to 'attr' and 'name'.
> > v1->v2:
> >       Just return -ENOMEM if attr is NULL.
> > ---
> >  arch/powerpc/platforms/powernv/opal.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> > index 2b3dfd0b6cdd..908d749bcef5 100644
> > --- a/arch/powerpc/platforms/powernv/opal.c
> > +++ b/arch/powerpc/platforms/powernv/opal.c
> > @@ -801,16 +801,19 @@ static ssize_t export_attr_read(struct file *fp, struct kobject *kobj,
> >  static int opal_add_one_export(struct kobject *parent, const char *export_name,
> >                              struct device_node *np, const char *prop_name)
> >  {
> > -     struct bin_attribute *attr = NULL;
> > -     const char *name = NULL;
> > +     struct bin_attribute *attr;
> > +     const char *name;
> >       u64 vals[2];
> >       int rc;
> >
> >       rc = of_property_read_u64_array(np, prop_name, &vals[0], 2);
> >       if (rc)
> > -             goto out;
> > +             return rc;
> >
> >       attr = kzalloc(sizeof(*attr), GFP_KERNEL);
> > +     if (!attr)
> > +             return -ENOMEM;
> > +
> >       name = kstrdup(export_name, GFP_KERNEL);
> >       if (!name) {
> >               rc = -ENOMEM;
> > --
> > 2.17.1
