Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E977E94B17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 18:59:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C0X26VSRzDqsr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 02:59:30 +1000 (AEST)
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
 header.i=@intel-com.20150623.gappssmtp.com header.b="W8kT6Fr/"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C0Ty0XnlzDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 02:57:35 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id g17so2316239otl.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pJz5TWO3HqyvAXE4n+BERy8lXD9ov5MYFtm7ShaG7iE=;
 b=W8kT6Fr/sEKxeSab1zBTk5JmxeNrMn3Y1y9/NC6skSJLvVLBpW2ELhqcqg2h/if0uo
 0e8cjTy1LAF1Gp91oUKURmAqKMUXzQV99WjzHQAckRWlWwZydwlX4OAE7w5BXV4Gck6w
 GiAIVZOWzO9pzIRCQsQGroFmdMWbCV+OXwt4Dr3D/b8p/Qgjbg1z1NnBqPE5Th27Iwbb
 i338YQEJW6ag0i7lkkgY8YnQ7DkrhkfUCVp03brb7sfSpLA7e1XuEBndRU1OztKXhSBQ
 fsd5RglSvHSgc9joGVk9HozoM7cGL+u/Hfjrw8aAZuNaWmcC4QRxznSAAWCjivAlSDZc
 DXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJz5TWO3HqyvAXE4n+BERy8lXD9ov5MYFtm7ShaG7iE=;
 b=XuPgY3gCH9gp4Yjy++CiDaTsX9OBU+4zJDbqXGzEd9KBOEKcg7+pYGv5sqsNQjFU/i
 mxrST7w0hT9nUBvkE3myBHTp1+mQ/u5focLsCAJ83H5vmnbjmK1/8KqadS0Y3MT4aLW1
 YxGN2g1Dw+x1bR0/v+3VVuhanLemkIQENYF6r2PQ1BVjRqZ+K1WHUgEPops0ekuZe3jQ
 KB6kMUvy7xbYAoQNzdYVhxbd/AZvU6keCHM27L96+8pC7sR799Nsk96GyJkZRAexHaTS
 niSsJxRu1VKjWY9RWA2Vi2ZAygpwHqEUMrpcOtlh1sXYM6INtS5pQyrRofgBe7OrCyfJ
 3Yiw==
X-Gm-Message-State: APjAAAV6bHHtGU/6se3Ekkm84ZM3tO2ZEo6xWsQ6p88tvpdQ++clReZN
 pgSKRjSN0AU+BAV9HCh4gEtEDDdSvPuVGLMeriZPLw==
X-Google-Smtp-Source: APXvYqxvT1ZhKsDRbIwEX3IPiYRXr1CqtbSoNIsXLF0FOsAY+MiDfaUIE2LkS31VaEmcuGd2KBhyxsoTwTJiAVryN6M=
X-Received: by 2002:a9d:6b96:: with SMTP id b22mr19649081otq.363.1566233849670; 
 Mon, 19 Aug 2019 09:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190809074520.27115-1-aneesh.kumar@linux.ibm.com>
 <20190809074520.27115-2-aneesh.kumar@linux.ibm.com>
 <CAPcyv4jmxKPkTh0_Bbu2tRXm4vcBHonZJ6UcKrOBnPGCG2_i1A@mail.gmail.com>
 <CAPcyv4hxo4HvtqZ-B6JG5iATo_vEAKPzO5EU5Lugs2_edEbW7Q@mail.gmail.com>
 <87y2zp1vph.fsf@linux.ibm.com>
In-Reply-To: <87y2zp1vph.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 19 Aug 2019 09:57:17 -0700
Message-ID: <CAPcyv4hWpFs6Q8VM35ip+DQ4thhzu6gaGxpdtkkMvj=xYb+eag@mail.gmail.com>
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

On Mon, Aug 19, 2019 at 12:07 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Tue, Aug 13, 2019 at 9:22 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >>
> >> Hi Aneesh, logic looks correct but there are some cleanups I'd like to
> >> see and a lead-in patch that I attached.
> >>
> >> I've started prefixing nvdimm patches with:
> >>
> >>     libnvdimm/$component:
> >>
> >> ...since this patch mostly impacts the pmem driver lets prefix it
> >> "libnvdimm/pmem: "
> >>
> >> On Fri, Aug 9, 2019 at 12:45 AM Aneesh Kumar K.V
> >> <aneesh.kumar@linux.ibm.com> wrote:
> >> >
> >> > This patch add -EOPNOTSUPP as return from probe callback to
> >>
> >> s/This patch add/Add/
> >>
> >> No need to say "this patch" it's obviously a patch.
> >>
> >> > indicate we were not able to initialize a namespace due to pfn superblock
> >> > feature/version mismatch. We want to consider this a probe success so that
> >> > we can create new namesapce seed and there by avoid marking the failed
> >> > namespace as the seed namespace.
> >>
> >> Please replace usage of "we" with the exact agent involved as which
> >> "we" is being referred to gets confusing for the reader.
> >>
> >> i.e. "indicate that the pmem driver was not..." "The nvdimm core wants
> >> to consider this...".
> >>
> >> >
> >> > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> > ---
> >> >  drivers/nvdimm/bus.c  |  2 +-
> >> >  drivers/nvdimm/pmem.c | 26 ++++++++++++++++++++++----
> >> >  2 files changed, 23 insertions(+), 5 deletions(-)
> >> >
> >> > diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> >> > index 798c5c4aea9c..16c35e6446a7 100644
> >> > --- a/drivers/nvdimm/bus.c
> >> > +++ b/drivers/nvdimm/bus.c
> >> > @@ -95,7 +95,7 @@ static int nvdimm_bus_probe(struct device *dev)
> >> >         rc = nd_drv->probe(dev);
> >> >         debug_nvdimm_unlock(dev);
> >> >
> >> > -       if (rc == 0)
> >> > +       if (rc == 0 || rc == -EOPNOTSUPP)
> >> >                 nd_region_probe_success(nvdimm_bus, dev);
> >>
> >> This now makes the nd_region_probe_success() helper obviously misnamed
> >> since it now wants to take actions on non-probe success. I attached a
> >> lead-in cleanup that you can pull into your series that renames that
> >> routine to nd_region_advance_seeds().
> >>
> >> When you rebase this needs a comment about why EOPNOTSUPP has special handling.
> >>
> >> >         else
> >> >                 nd_region_disable(nvdimm_bus, dev);
> >> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> >> > index 4c121dd03dd9..3f498881dd28 100644
> >> > --- a/drivers/nvdimm/pmem.c
> >> > +++ b/drivers/nvdimm/pmem.c
> >> > @@ -490,6 +490,7 @@ static int pmem_attach_disk(struct device *dev,
> >> >
> >> >  static int nd_pmem_probe(struct device *dev)
> >> >  {
> >> > +       int ret;
> >> >         struct nd_namespace_common *ndns;
> >> >
> >> >         ndns = nvdimm_namespace_common_probe(dev);
> >> > @@ -505,12 +506,29 @@ static int nd_pmem_probe(struct device *dev)
> >> >         if (is_nd_pfn(dev))
> >> >                 return pmem_attach_disk(dev, ndns);
> >> >
> >> > -       /* if we find a valid info-block we'll come back as that personality */
> >> > -       if (nd_btt_probe(dev, ndns) == 0 || nd_pfn_probe(dev, ndns) == 0
> >> > -                       || nd_dax_probe(dev, ndns) == 0)
> >>
> >> Similar need for an updated comment here to explain the special
> >> translation of error codes.
> >>
> >> > +       ret = nd_btt_probe(dev, ndns);
> >> > +       if (ret == 0)
> >> >                 return -ENXIO;
> >> > +       else if (ret == -EOPNOTSUPP)
> >>
> >> Are there cases where the btt driver needs to return EOPNOTSUPP? I'd
> >> otherwise like to keep this special casing constrained to the pfn /
> >> dax info block cases.
> >
> > In fact I think EOPNOTSUPP is only something that the device-dax case
> > would be concerned with because that's the only interface that
> > attempts to guarantee a given mapping granularity.
>
> We need to do similar error handling w.r.t fsdax when the pfn superblock
> indicates different PAGE_SIZE and struct page size?

Only in the case where PAGE_SIZE is less than the pfn superblock page
size, the memmap is stored on pmem, and the reservation is too small.
Otherwise the PAGE_SIZE difference does not matter in practice for the
fsdax case... unless I'm overlooking another failure case?

> I don't think btt
> needs to support EOPNOTSUPP. But we can keep it for consistency?

That's not a sufficient argument in my mind. The comment about why
EOPNOTSUPP is treated specially should have a note about the known
usages, and since there is no BTT case for it lets leave it out.
