Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A160C210339
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 07:10:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xTp323sDzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 15:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=odRJ1geK; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xTm83jFQzDqJH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 15:09:03 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id ga4so23055168ejb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 22:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsHporRflsSRBonyyCx9KMzLNZb5MKP0RDdeZPzTvew=;
 b=odRJ1geKdCr/so3QsY4B8TGj56/Srlu/ti+PE9rh3/JHMvnyVBG5rOxeHPmd2ffloP
 nEI4qJXYBdSbwZk+oh0v6Vc1MvSu/eEybSc2hrnDANuP3FLxgff7Uy+9M8coTj7uQalx
 A8kVfM3dpBpY5BjJ7t3UK7Rf4vabwOfmj3t0Xfr9qRkGjqcM7NmLtjs7J+YaQUxfayVb
 /toHGxYlIRKe+FJ+7ZjG+Y7VKEgcuzsvoLelDK0KdGXbT4PHPCh0ERdKgJY7ZvPqFNtj
 7qjw+wPxkOmiS45d82AyPBGwUgiymUrMrMgNVgYZI8D5vy1ZLxAcf/qqfPj2Nn1JHzfn
 ZIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsHporRflsSRBonyyCx9KMzLNZb5MKP0RDdeZPzTvew=;
 b=loSq9NKz/w2wxaqKM1ahW+dhESQrFb4I8cED4QNHopeDlFzu+melAbZUcBQepbbhPz
 PqnycSLdF36jUFnPpHziGiBpPU+viMj3Cf2YiCBXp75ojFrfbtHwhyLhDztdMCMJJL3K
 saKdmcaEalwy83UaFNQy4nvejX3CvHAE885DMfKT2yaIouPQVJ7gdsmBqIbc4Ag6lktM
 /VAGZsA3gz+5jvSQ1n9cY7VIttQ6w49VxDjfnBm2XMIXNoCqqrHyBM26Yx9noWELjTDU
 LB9xD4cFDZXLI9VlU5VIy/IpME8pDch9r2GkSm9R8TLcteqDEK6BH3eUzO6YrWduYQnI
 I6Fw==
X-Gm-Message-State: AOAM533z8tUxKXYG72+TSffDXUkNiWH5gPiCzAJeeIpFVQN+CuT4bMzi
 LzWRN11Ci0bhmvp1XTirGwr7fz4XgmE9Xd/HbAA9mw==
X-Google-Smtp-Source: ABdhPJwJOUTc68//QiDCG08PMgx7ieaUctYogS8mUX7/cGgUdFfY8MKvtQb1iznwXD5atkhWEeKYCcb5XLNiqxnpLPQ=
X-Received: by 2002:a17:907:20af:: with SMTP id
 pw15mr22296111ejb.204.1593580139878; 
 Tue, 30 Jun 2020 22:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-7-aneesh.kumar@linux.ibm.com>
 <20200629160940.GU21462@kitsune.suse.cz>
 <87lfk5hahc.fsf@linux.ibm.com>
 <CAPcyv4hEV=Ps=t=3qsFq3Ob1jzf=ptoZmYTDkgr8D_G0op8uvQ@mail.gmail.com>
 <20200630085413.GW21462@kitsune.suse.cz>
 <9204289b-2274-b5c1-2cd5-8ed5ce28efb4@linux.ibm.com>
 <CAPcyv4gHHjifQcLMdVgo9CyixHxe6OkCYdQ7Jfu2YB7tBqpDNg@mail.gmail.com>
 <4a7bf5c8-a5c7-4292-c7ad-89bcefd7b22d@linux.ibm.com>
In-Reply-To: <4a7bf5c8-a5c7-4292-c7ad-89bcefd7b22d@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 30 Jun 2020 22:08:48 -0700
Message-ID: <CAPcyv4jHy=jQVdfFJTN=o3=wgCeLXd3Q29e+qoMUtZDA9KWZGw@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] powerpc/pmem: Avoid the barrier in flush routines
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 30, 2020 at 8:09 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 7/1/20 1:15 AM, Dan Williams wrote:
> > On Tue, Jun 30, 2020 at 2:21 AM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> > [..]
> >>>> The bio argument isn't for range based flushing, it is for flush
> >>>> operations that need to complete asynchronously.
> >>> How does the block layer determine that the pmem device needs
> >>> asynchronous fushing?
> >>>
> >>
> >>          set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
> >>
> >> and dax_synchronous(dev)
> >
> > Yes, but I think it is overkill to have an indirect function call just
> > for a single instruction.
> >
> > How about something like this instead, to share a common pmem_wmb()
> > across x86 and powerpc.
> >
> > diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> > index 20ff30c2ab93..b14009060c83 100644
> > --- a/drivers/nvdimm/region_devs.c
> > +++ b/drivers/nvdimm/region_devs.c
> > @@ -1180,6 +1180,13 @@ int nvdimm_flush(struct nd_region *nd_region,
> > struct bio *bio)
> >   {
> >          int rc = 0;
> >
> > +       /*
> > +        * pmem_wmb() is needed to 'sfence' all previous writes such
> > +        * that they are architecturally visible for the platform buffer
> > +        * flush.
> > +        */
> > +       pmem_wmb();
> > +
> >          if (!nd_region->flush)
> >                  rc = generic_nvdimm_flush(nd_region);
> >          else {
> > @@ -1206,17 +1213,14 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
> >          idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
> >
> >          /*
> > -        * The first wmb() is needed to 'sfence' all previous writes
> > -        * such that they are architecturally visible for the platform
> > -        * buffer flush.  Note that we've already arranged for pmem
> > -        * writes to avoid the cache via memcpy_flushcache().  The final
> > -        * wmb() ensures ordering for the NVDIMM flush write.
> > +        * Note that we've already arranged for pmem writes to avoid the
> > +        * cache via memcpy_flushcache().  The final wmb() ensures
> > +        * ordering for the NVDIMM flush write.
> >           */
> > -       wmb();
>
>
> The series already convert this to pmem_wmb().
>
> >          for (i = 0; i < nd_region->ndr_mappings; i++)
> >                  if (ndrd_get_flush_wpq(ndrd, i, 0))
> >                          writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
> > -       wmb();
> > +       pmem_wmb();
>
>
> Should this be pmem_wmb()? This is ordering the above writeq() right?

Correct, this can just be wmb().

>
> >
> >          return 0;
> >   }
> >
>
> This still results in two pmem_wmb() on platforms that doesn't have
> flush_wpq. I was trying to avoid that by adding a nd_region->flush call
> back.

How about skip or exit early out of generic_nvdimm_flush if
ndrd->flush_wpq is NULL? That still saves an indirect branch at the
cost of another conditional, but that should still be worth it.
