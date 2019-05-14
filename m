Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B621C12D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:14:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45347c29xvzDqH2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:14:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="hhohANEL"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4534614BTqzDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:12:40 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id f4so3750341oib.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/rQm3oEyoX488IyJ+t/DcdnSheU9nuqxEV2kABn8Po=;
 b=hhohANELP/S8ZDrcbe5ySnAiD347I3u8fu2KWY8VOIA0JUoHJjU5L08w7enZz49LD1
 /+elYJmVdTy/qm720hDo8dQPJyWir62FRIQgcQnaKINF/zRhlYqf1IkBxMnsWa8oA1Dp
 3GsmnqllWqDf2p4ENWNRbufhty9e1nWx3IM7ZSzjrrSrhr+v4kZMTf9qrrgQ9MUIM1Ka
 zhfGe/anBmZbhvfYhpbG/bcdGv6vEhusZO62Dyv/jjHw7w7/I9qUU+kqo99MDVfTJDBR
 S3ktaDFfBKwcSBTKD2Btr6Q2MhNWgJNgfFVyKHddUs0hrwdhOANW0mJdYoBh0PYgHLVL
 LMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/rQm3oEyoX488IyJ+t/DcdnSheU9nuqxEV2kABn8Po=;
 b=mqSPE7zGMn8c5DPR+2bFUh/A7vgUgK08IhHoM6GgSTs5fP9IpqlhBSI3YI733ccr2f
 SBIQeDjtRNwAWX3RuWJ/5jhYQjdo9R3AycFstFJjT0eEtxtG5bJ3bJrF/ZIpxQqeQieY
 cXH4zTZCxXwg4SrCv++G+JeT9ziz3I2Dw+PpRWSYEL0QAHF21pTAV341gAm312SVRcZt
 Z3u27h7eVgHCOw2VWTUQLEP0J8kLsmDVmCH2mQahWb38CgN/KtFa0lMjneel68t2m+pF
 zk+teFCqHoN7KoBnMilnyBIFc1nQ+bQMtGlio62JvJ3d7vP7VmO68X7lGaxQQLrQa9Qn
 UXfQ==
X-Gm-Message-State: APjAAAVnonTg7i+ZMAcZrqA7ulmCGWeEyHZ08GDP4DtfIBrPScUy9wYD
 8aQqg4ybBZaaglz9zPcHbz7/3CpDkGsZ5dPPjPQStA==
X-Google-Smtp-Source: APXvYqzzfxfOpIdKcIo7DuHfJxoY0QMBgRq8Df8EJpuM7dGb/os63wJ0kQomjiwA4aTBer7zd0AQjOw5WljDWwc9Uk0=
X-Received: by 2002:aca:4208:: with SMTP id p8mr1800747oia.105.1557807157734; 
 Mon, 13 May 2019 21:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190514025604.9997-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iNgFbSq0Hqb+CStRhGWMHfXx7tL3vrDaQ95DcBBY8QCQ@mail.gmail.com>
 <f99c4f11-a43d-c2d3-ab4f-b7072d090351@linux.ibm.com>
In-Reply-To: <f99c4f11-a43d-c2d3-ab4f-b7072d090351@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 13 May 2019 21:12:26 -0700
Message-ID: <CAPcyv4gOr8SFbdtBbWhMOU-wdYuMCQ4Jn2SznGRsv6Vku97Xnw@mail.gmail.com>
Subject: Re: [PATCH] mm/nvdimm: Use correct #defines instead of opencoding
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

On Mon, May 13, 2019 at 9:05 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 5/14/19 9:28 AM, Dan Williams wrote:
> > On Mon, May 13, 2019 at 7:56 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> The nfpn related change is needed to fix the kernel message
> >>
> >> "number of pfns truncated from 2617344 to 163584"
> >>
> >> The change makes sure the nfpns stored in the superblock is right value.
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>   drivers/nvdimm/pfn_devs.c    | 6 +++---
> >>   drivers/nvdimm/region_devs.c | 8 ++++----
> >>   2 files changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> >> index 347cab166376..6751ff0296ef 100644
> >> --- a/drivers/nvdimm/pfn_devs.c
> >> +++ b/drivers/nvdimm/pfn_devs.c
> >> @@ -777,8 +777,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
> >>                   * when populating the vmemmap. This *should* be equal to
> >>                   * PMD_SIZE for most architectures.
> >>                   */
> >> -               offset = ALIGN(start + reserve + 64 * npfns,
> >> -                               max(nd_pfn->align, PMD_SIZE)) - start;
> >> +               offset = ALIGN(start + reserve + sizeof(struct page) * npfns,
> >> +                              max(nd_pfn->align, PMD_SIZE)) - start;
> >
> > No, I think we need to record the page-size into the superblock format
> > otherwise this breaks in debug builds where the struct-page size is
> > extended.
> >
> >>          } else if (nd_pfn->mode == PFN_MODE_RAM)
> >>                  offset = ALIGN(start + reserve, nd_pfn->align) - start;
> >>          else
> >> @@ -790,7 +790,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
> >>                  return -ENXIO;
> >>          }
> >>
> >> -       npfns = (size - offset - start_pad - end_trunc) / SZ_4K;
> >> +       npfns = (size - offset - start_pad - end_trunc) / PAGE_SIZE;
> >
> > Similar comment, if the page size is variable then the superblock
> > needs to explicitly account for it.
> >
>
> PAGE_SIZE is not really variable. What we can run into is the issue you
> mentioned above. The size of struct page can change which means the
> reserved space for keeping vmemmap in device may not be sufficient for
> certain kernel builds.
>
> I was planning to add another patch that fails namespace init if we
> don't have enough space to keep the struct page.
>
> Why do you suggest we need to have PAGE_SIZE as part of pfn superblock?

So that the kernel has a chance to identify cases where the superblock
it is handling was created on a system with different PAGE_SIZE
assumptions.
