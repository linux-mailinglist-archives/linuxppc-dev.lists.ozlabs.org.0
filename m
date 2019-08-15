Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBE8F52F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 21:57:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468cfv6FbXzDr1Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 05:57:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="xH/dL+8B"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468ccb6XKszDr0P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 05:55:05 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id b1so7555671otp.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LCurvHSsCmm+5abpD1hHi8j9syc25zepop2mZHAT1y4=;
 b=xH/dL+8B9O/zZKNIOGU6AfrXiRnIVSoM/QVzh3O/W1WrG7+QJ7zdE55DiVebnalEgC
 vTxenCv0UyCxprQskHOjZCNfO9tDnSYNYjShnRS9S8nGbAi9K84dtTK4SykQnUUY+Wfn
 QYXMsvN2m1hOdgmNxAYop02NE9UNOSHmPgM9ocDDtHoNY6B8efMYhaN+FmvESxReiDvM
 L1lyGAAsi9JZGdXWde0N9P1FrA9q6ON7cqyl6tq+dy8zpwgbVsCGO4Vmb+r6fawX2sxI
 P2VJvzDwvclquW9A7/qiiyfsNrlhpbYRN5DB7Z0t3gx+ZoBCEHi5lhlksGs8G4lvW7F9
 irfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCurvHSsCmm+5abpD1hHi8j9syc25zepop2mZHAT1y4=;
 b=hU/QqbObymClcizh9cOgN4D3kq84V7B6ozyWMSgKsl5uhkDZjR50mRmsHo1lQMV+Gf
 R1H5tJmZxR5AZ6EYzEwl557xs369ojPByH1Q3nK+91JEHlZS1mtZfShvkqRcEyUJsGRE
 ZWNfNO82xt3NPXd6w/HnjxIr+xr6B6Yp3CNFPDbfnlBAfhXuwB9pl6nlgoieguMbFAmh
 ayAQGbOo6BAdkrgjHf00m3f5uu2OAw/ZI3pgvUOJ2a3QLUxvBvpUL5NLKSAZ9bUKtOZ1
 mstQ0xK2GpFcuJXXvaPBLdLUKifPgUypZXBJBFY1N96HAWbJoSK+/KnjV5KIHXt/HxhC
 BvgQ==
X-Gm-Message-State: APjAAAU4l7/l1To2uax2K5mmr3UYZXVWtDIM9pUHZOC+2kigQxmeIAYN
 BZ5WHD+C1KiO+e+szVai80kGnLx93KviTsFWN5VrSA==
X-Google-Smtp-Source: APXvYqy1liZCgiuHpWjdJNheD/dz2N3XqsT5VgT3WadMNktE9u2Z8H3IIyr8WcBpt7CM+JZCn80RNisRK5YpkWEdAgY=
X-Received: by 2002:a05:6830:458:: with SMTP id
 d24mr4558154otc.126.1565898903272; 
 Thu, 15 Aug 2019 12:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190809074520.27115-1-aneesh.kumar@linux.ibm.com>
 <20190809074520.27115-2-aneesh.kumar@linux.ibm.com>
 <CAPcyv4jmxKPkTh0_Bbu2tRXm4vcBHonZJ6UcKrOBnPGCG2_i1A@mail.gmail.com>
In-Reply-To: <CAPcyv4jmxKPkTh0_Bbu2tRXm4vcBHonZJ6UcKrOBnPGCG2_i1A@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Aug 2019 12:54:51 -0700
Message-ID: <CAPcyv4hxo4HvtqZ-B6JG5iATo_vEAKPzO5EU5Lugs2_edEbW7Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] nvdimm: Consider probe return -EOPNOTSUPP as
 success
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
Cc: Linux MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 9:22 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> Hi Aneesh, logic looks correct but there are some cleanups I'd like to
> see and a lead-in patch that I attached.
>
> I've started prefixing nvdimm patches with:
>
>     libnvdimm/$component:
>
> ...since this patch mostly impacts the pmem driver lets prefix it
> "libnvdimm/pmem: "
>
> On Fri, Aug 9, 2019 at 12:45 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
> >
> > This patch add -EOPNOTSUPP as return from probe callback to
>
> s/This patch add/Add/
>
> No need to say "this patch" it's obviously a patch.
>
> > indicate we were not able to initialize a namespace due to pfn superblock
> > feature/version mismatch. We want to consider this a probe success so that
> > we can create new namesapce seed and there by avoid marking the failed
> > namespace as the seed namespace.
>
> Please replace usage of "we" with the exact agent involved as which
> "we" is being referred to gets confusing for the reader.
>
> i.e. "indicate that the pmem driver was not..." "The nvdimm core wants
> to consider this...".
>
> >
> > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > ---
> >  drivers/nvdimm/bus.c  |  2 +-
> >  drivers/nvdimm/pmem.c | 26 ++++++++++++++++++++++----
> >  2 files changed, 23 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> > index 798c5c4aea9c..16c35e6446a7 100644
> > --- a/drivers/nvdimm/bus.c
> > +++ b/drivers/nvdimm/bus.c
> > @@ -95,7 +95,7 @@ static int nvdimm_bus_probe(struct device *dev)
> >         rc = nd_drv->probe(dev);
> >         debug_nvdimm_unlock(dev);
> >
> > -       if (rc == 0)
> > +       if (rc == 0 || rc == -EOPNOTSUPP)
> >                 nd_region_probe_success(nvdimm_bus, dev);
>
> This now makes the nd_region_probe_success() helper obviously misnamed
> since it now wants to take actions on non-probe success. I attached a
> lead-in cleanup that you can pull into your series that renames that
> routine to nd_region_advance_seeds().
>
> When you rebase this needs a comment about why EOPNOTSUPP has special handling.
>
> >         else
> >                 nd_region_disable(nvdimm_bus, dev);
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index 4c121dd03dd9..3f498881dd28 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -490,6 +490,7 @@ static int pmem_attach_disk(struct device *dev,
> >
> >  static int nd_pmem_probe(struct device *dev)
> >  {
> > +       int ret;
> >         struct nd_namespace_common *ndns;
> >
> >         ndns = nvdimm_namespace_common_probe(dev);
> > @@ -505,12 +506,29 @@ static int nd_pmem_probe(struct device *dev)
> >         if (is_nd_pfn(dev))
> >                 return pmem_attach_disk(dev, ndns);
> >
> > -       /* if we find a valid info-block we'll come back as that personality */
> > -       if (nd_btt_probe(dev, ndns) == 0 || nd_pfn_probe(dev, ndns) == 0
> > -                       || nd_dax_probe(dev, ndns) == 0)
>
> Similar need for an updated comment here to explain the special
> translation of error codes.
>
> > +       ret = nd_btt_probe(dev, ndns);
> > +       if (ret == 0)
> >                 return -ENXIO;
> > +       else if (ret == -EOPNOTSUPP)
>
> Are there cases where the btt driver needs to return EOPNOTSUPP? I'd
> otherwise like to keep this special casing constrained to the pfn /
> dax info block cases.

In fact I think EOPNOTSUPP is only something that the device-dax case
would be concerned with because that's the only interface that
attempts to guarantee a given mapping granularity.
