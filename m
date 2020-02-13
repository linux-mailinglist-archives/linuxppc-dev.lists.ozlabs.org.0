Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C33CF15CE46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 23:45:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JWn621YjzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 09:45:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=SmXDDB05; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JWlC6MszzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 09:43:44 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id g64so7245118otb.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 14:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hY6CV+ND7e1YGXWSjo+0nHc7akywE0TMpMRwKM18M98=;
 b=SmXDDB05FgkSDjl82jr0vRzKFNDC3TzgJv9zwXei/I8lhH2nzhediAtWrWFbK9wXps
 wqfiVO9vLKiQJNvx+mp9CQFnigfPh8wsRpGBXWaHzSNrFsKci0RSWKoq+fG8mOU1ja3K
 /NCtdPzVJL3iA8WlfgAGnEM6bun1wPKuHZEjQxtkZChKXjNflJXcfsnvL1rclMTMlK6x
 gJQBCVPju+i+TEYEemIW2T1wXWG0kEK3aCPIDm7r9cls3Ljs7SmIhsmz4tCY7Narvkw4
 zbytoCGOxRXBfvQLCi0bOqRXCJxEiRUBxiMN+CtG/8LyrUCmJy9Hbtn4FVG7+NX2yDTj
 lGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hY6CV+ND7e1YGXWSjo+0nHc7akywE0TMpMRwKM18M98=;
 b=Ph+6uGG+T9+oV8OTQD9jc4G+6D1gVi80qZbX8A3VUASDFWnUwZ6R3LafUlm27jfz/W
 MD0nET8MvxjULzOtgUHC6Eykt3kbQhu0XW6kTBmA9SDnQOdKIcNly/qz3Mi52n9UIxZ1
 E/UsvjMmxN0LChNMbSe29m0AMuB+9iGUbjfKRB3L3ts9w6B3tKWHRPwMKgnqKO1HQZgn
 DrT8XHTOzVn8kHQL8ZFLWf+3iUTC/G5lNl2wzP2PrvwJLc5bYELFuf0Gw2izZmVAj3WZ
 I25aBvRxpz+Zzv0qkkYGqBhrtDMGRIR3veutMTTzOdnduJzrxaWSYsYKkWk10GyPU0SI
 +XGg==
X-Gm-Message-State: APjAAAULDUO76BzqPHo9HGmGcb5NV8LCVcaU961ammJXoYVNWPLCjpSo
 fBU/Vvw2ll+s7IaVpFZdoMpXhiZ2ZS47t3zqHmtyjw==
X-Google-Smtp-Source: APXvYqwh0QpibBwkg8wqD1qCgWrU0VARu4V8rflQRY8+mOYx9YxokcdwDNt0F3KAuE2fZ50H4DcCVvTlaEy10NTp/PU=
X-Received: by 2002:a9d:4e99:: with SMTP id v25mr15692065otk.363.1581633819941; 
 Thu, 13 Feb 2020 14:43:39 -0800 (PST)
MIME-Version: 1.0
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155490897.3343782.14216276134794923581.stgit@dwillia2-desk3.amr.corp.intel.com>
 <x49k14q5ezs.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49k14q5ezs.fsf@segfault.boston.devel.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 13 Feb 2020 14:43:28 -0800
Message-ID: <CAPcyv4hQouRNBcJ4uZ2mysr_aKstLhvUf66gRQ_3QoQNyOy72g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] libnvdimm/namespace: Enforce
 memremap_compat_align()
To: Jeff Moyer <jmoyer@redhat.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vishal L Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 13, 2020 at 1:55 PM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > The pmem driver on PowerPC crashes with the following signature when
> > instantiating misaligned namespaces that map their capacity via
> > memremap_pages().
> >
> >     BUG: Unable to handle kernel data access at 0xc001000406000000
> >     Faulting instruction address: 0xc000000000090790
> >     NIP [c000000000090790] arch_add_memory+0xc0/0x130
> >     LR [c000000000090744] arch_add_memory+0x74/0x130
> >     Call Trace:
> >      arch_add_memory+0x74/0x130 (unreliable)
> >      memremap_pages+0x74c/0xa30
> >      devm_memremap_pages+0x3c/0xa0
> >      pmem_attach_disk+0x188/0x770
> >      nvdimm_bus_probe+0xd8/0x470
> >
> > With the assumption that only memremap_pages() has alignment
> > constraints, enforce memremap_compat_align() for
> > pmem_should_map_pages(), nd_pfn, or nd_dax cases.
> >
> > Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Cc: Jeff Moyer <jmoyer@redhat.com>
> > Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Link: https://lore.kernel.org/r/158041477336.3889308.4581652885008605170.stgit@dwillia2-desk3.amr.corp.intel.com
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >  drivers/nvdimm/namespace_devs.c |   10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> > index 032dc61725ff..aff1f32fdb4f 100644
> > --- a/drivers/nvdimm/namespace_devs.c
> > +++ b/drivers/nvdimm/namespace_devs.c
> > @@ -1739,6 +1739,16 @@ struct nd_namespace_common *nvdimm_namespace_common_probe(struct device *dev)
> >               return ERR_PTR(-ENODEV);
> >       }
> >
> > +     if (pmem_should_map_pages(dev) || nd_pfn || nd_dax) {
> > +             struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
> > +             resource_size_t start = nsio->res.start;
> > +
> > +             if (!IS_ALIGNED(start | size, memremap_compat_align())) {
> > +                     dev_dbg(&ndns->dev, "misaligned, unable to map\n");
> > +                     return ERR_PTR(-EOPNOTSUPP);
> > +             }
> > +     }
> > +
> >       if (is_namespace_pmem(&ndns->dev)) {
> >               struct nd_namespace_pmem *nspm;
> >
>
> Actually, I take back my ack.  :) This prevents a previously working
> namespace from being successfully probed/setup.

Do you have a test case handy? I can see a potential gap with a
namespace that used internal padding to fix up the alignment. The goal
of this check is to catch cases that are just going to fail
devm_memremap_pages(), and the expectation is that it could not have
worked before unless it was ported from another platform, or someone
flipped the page-size switch on PowerPC.

> I thought we were only
> going to enforce the alignment for a newly created namespace?  This should
> only check whether the alignment works for the current platform.

The model is a new default 16MB alignment is enforced at creation
time, but if you need to support previously created namespaces then
you can manually trim that alignment requirement to no less than
memremap_compat_align() because that's the point at which
devm_memremap_pages() will start failing or crashing.
