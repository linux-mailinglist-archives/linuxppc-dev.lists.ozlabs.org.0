Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 953E9403175
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 01:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H41RR46Nqz2yV7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 09:18:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=puMEaI8X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=puMEaI8X; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H41Qj5NwRz2xtS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 09:18:03 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id z12so344711qvx.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Sep 2021 16:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6C+UtyiW8etyIzvp1bSQYtwL6nt/zyAE4orGv5NIebE=;
 b=puMEaI8X9kp7QcnZkvnzMXidvJ8oGSkYKvYc/UV/g8KQlI424kmo1dJSCv3lm39c35
 bn0OJMX3hL9Bg3gE/eOKrQWXmwT6E72nTOXHBSqrvdABa/K5y2a2GkIAtOehmWMHx7BH
 vldMocWf05mpZDnaDFKWCta5scmeM3rnytdbepdKd8641BxiQxDwYOa4TaaVQO5AZ40x
 9/rnQ6KZZTM/Ug393WL0U1xznAkrnQchQixFgqYXF4TByQayfO5k9ytxozaf7V5qfUHq
 +I/s2as/yQah+8zBfwT2bsdhxbTNS3GQ7CCZ0mWkBWrxktvwjyPgZaEVVxkNYq73Ak95
 bwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6C+UtyiW8etyIzvp1bSQYtwL6nt/zyAE4orGv5NIebE=;
 b=Yo6pfKpVNG8qM0mGsKELMwZPDGTdkOrdCIK4ETntvpvJqL/2iC5U5PE2WHLh3dmxxk
 PaQK763zunNB4jVOfytMsWYoK+2FzqQy0dBp2fu0UZkjxW+9OQyxXKM1qS+zxCZbfRmJ
 RRCzcPKZ0DLYeikLKbkiOF9Dws7ukYuieMQ+gLQW1Rw9irF0K8nXiSl3Oxt6Mi996lF3
 w/Ei4kGOwtWd9eSxU1fR3IYwoh0Y/eXwkQ5GZkkoG7ouvyY+Kpwam8M7BDPeQL4Xk49r
 xzdzl9I5eH+KqdHEhNPt/YA1+WoiaGhvxcFOa4Mf3/UuLm54Dpn9wMNaahfIsBJo1UVV
 jm6Q==
X-Gm-Message-State: AOAM530ugc6mIgEBEaNr661GWBTqLDC4g49SMQVVjf+UtGcBvdXxF+at
 H0H09DxN9xDNU4eC8HCDOS3s5PGr4fJ0k4lyE9c=
X-Google-Smtp-Source: ABdhPJyzdMj0I5Gsf1Kc4FI/9QXRITr/yhY0akNaeNEEODZjb8ejyKvGmVHwxFTs6qaL9e5qzsXJfiEMJgISbB+nHd0=
X-Received: by 2002:a0c:e04a:: with SMTP id y10mr737242qvk.14.1631056680456;
 Tue, 07 Sep 2021 16:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210907085946.21694-1-vulab@iscas.ac.cn>
 <0fa7ddfa-cd65-583e-a83f-4cbcd4e7337f@linux.ibm.com>
In-Reply-To: <0fa7ddfa-cd65-583e-a83f-4cbcd4e7337f@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 8 Sep 2021 09:17:49 +1000
Message-ID: <CAOSf1CGEAhXzqEU_-F39um8ri98r1Ww+AtsXJqZu4U7a_ODi9w@mail.gmail.com>
Subject: Re: [PATCH] pci/hotplug/pnv-php: Remove probable double put
To: Tyrel Datwyler <tyreld@linux.ibm.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Xu Wang <vulab@iscas.ac.cn>,
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 8, 2021 at 8:02 AM Tyrel Datwyler <tyreld@linux.ibm.com> wrote:
>
> On 9/7/21 1:59 AM, Xu Wang wrote:
> > Device node iterators put the previous value of the index variable,
> > so an explicit put causes a double put.
> >
> > Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> > ---
> >  drivers/pci/hotplug/pnv_php.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> > index 04565162a449..ed4d1a2c3f22 100644
> > --- a/drivers/pci/hotplug/pnv_php.c
> > +++ b/drivers/pci/hotplug/pnv_php.c
> > @@ -158,7 +158,6 @@ static void pnv_php_detach_device_nodes(struct device_node *parent)
> >       for_each_child_of_node(parent, dn) {
> >               pnv_php_detach_device_nodes(dn);
> >
> > -             of_node_put(dn);
> >               of_detach_node(dn);
>
> Are you sure this is a double put? This looks to me like its meant to drive tear
> down of the device by putting a long term reference and not the short term get
> that is part of the iterator.

Yeah, the put is there is to drop the initial ref so the node can be
released. It might be worth adding a comment.
