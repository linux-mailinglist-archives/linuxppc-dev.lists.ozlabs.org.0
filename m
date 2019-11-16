Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E865FF4C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 19:52:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FkqX3kdFzF3S7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2019 05:52:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="npL0W9Kg"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FknR6sBpzF4VH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 05:50:43 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id w24so10466342otk.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QoYFZW9R1d8a2jA7OF9LL6qxm9ECdf9uJSjSEMDuhDQ=;
 b=npL0W9KgorQAYQRc87V3l+lkInNdHmoUmlKoaS30Qz8h1kbbszoWt+depF0Asu7mxl
 aqcsnvAYqLcf7/ASn7KEcz1nvZT+6EhXPwSFHVsh4UhMXGm/NbCH/WT5iF83p1KwmVdU
 mQcUOdNWqu8v8GtDHZmjwOL8D9F+qoBq5eXZ7HRjT5UEiVHxHnVa+vNAWpy7kswffPO1
 bwgXM6UixEyqVPlL2Wom470LfwdUXvvP6QVfk3q/t0wJGgMcqDuZt8bh6oc9k6L3q9t2
 yW/ZV4PTuSEdqXMed4ig6v5vfF9zhU+7WSjTNI2tIeOu7n7O2Y5HJYZ4/BpCKFv8jFDa
 ni4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QoYFZW9R1d8a2jA7OF9LL6qxm9ECdf9uJSjSEMDuhDQ=;
 b=Yfwo2oNN7Py75adWEzE4kK9oQOb/7JhteVEinIEMYM4Wn1UIj7VIwhTHhqciqbwwXx
 dCSoXGFECBBl1tURFNU5aAjASu4sm3mc2uGNjJM/MbmfMDNm5WkuIDzKXGGnmIw4BXya
 RhL/5uQDa1ZJE9o9Yt2uCPRt+SNkeI8hERocC9dPK8pTWLO35pqknrsUVL1khmZOJ+C2
 GADRty7U1AExX0ET9y23HxJOrSaWOOcbSEqp5J+yt4EwfU7uES5GRU57sGBH9YwTaKGs
 A7SA5T8Yac+8Nql/DtXZics/2acY90uGP8z33zi/wvE5vvfT5ZWtaO+Tx8pjLBtOj8kt
 ZWqw==
X-Gm-Message-State: APjAAAXsr8f/6nxvmmFillQsECj9trHTuKdUpwLJ8A4zs79PXA8buWvj
 GNbAWPlUv0MthLCY0OPWfkL4IVQPmTswguwmxJGlA7i3
X-Google-Smtp-Source: APXvYqyV/cgXxJSpVo+ep5Esuuu5uBbs9hzmhs5nbRzcUIbnZl99SOr9AdH9+7qoOn5QBj9jKBAQfldWgdn4Wt7pPjc=
X-Received: by 2002:a9d:2d89:: with SMTP id g9mr2604806otb.126.1573930240792; 
 Sat, 16 Nov 2019 10:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
 <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
 <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
 <4c6e5743-663e-853b-2203-15c809965965@linux.ibm.com>
 <CAPcyv4h42_1deZDaaW1RqX0Ls+maiFO_1e=6xJuHTa3wdWvVvA@mail.gmail.com>
 <87o8xp5lo9.fsf@linux.ibm.com> <8736eohva1.fsf@linux.ibm.com>
In-Reply-To: <8736eohva1.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 16 Nov 2019 10:50:29 -0800
Message-ID: <CAPcyv4hroohsrXT1YHQB-L8ZFa2kUW+bKy03We4Mt7afeJgu3Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
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

On Sat, Nov 16, 2019 at 4:15 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
>
> Hi Dan,
>
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>
> > Dan Williams <dan.j.williams@intel.com> writes:
> >
> >> On Wed, Oct 30, 2019 at 10:35 PM Aneesh Kumar K.V
> >> <aneesh.kumar@linux.ibm.com> wrote:
> >> [..]
> >>> > True, for the pfn device and the device-dax mapping size, but I'm
> >>> > suggesting adding another instance of alignment control at the raw
> >>> > namespace level. That would need to be disconnected from the
> >>> > device-dax page mapping granularity.
> >>> >
> >>>
> >>> Can you explain what you mean by raw namespace level ? We don't have
> >>> multiple values against which we need to check the alignment of
> >>> namespace start and namespace size.
> >>>
> >>> If you can outline how and where you would like to enforce that check I
> >>> can start working on it.
> >>>
> >>
> >> What I mean is that the process of setting up a pfn namespace goes
> >> something like this in shell script form:
> >>
> >> 1/ echo $size > /sys/bus/nd/devices/$namespace/size
> >> 2/ echo $namespace > /sys/bus/nd/devices/$pfn/namespace
> >> 3/ echo $pfn_align > /sys/bus/nd/devices/$pfn/align
> >>
> >> What I'm suggesting is add an optional 0th step that does:
> >>
> >> echo $raw_align > /sys/bus/nd/devices/$namespace/align
> >>
> >> Where the raw align needs to be needs to be max($pfn_align,
> >> arch_mapping_granulariy).
> >
> >
> > I started looking at this and was wondering about userspace being aware
> > of the direct-map mapping size. We can figure that out by parsing kernel
> > log
> >
> > [    0.000000] Page orders: linear mapping = 24, virtual = 16, io = 16, vmemmap = 24
> >
> >
> > But I am not sure we want to do that. There is not set of raw_align
> > value to select. What we need to make sure is the below.
> >
> > 1) While creating a namespace we need to make sure that namespace size
> > is multiple of direct-map mapping size. If we ensure that
> > size is aligned, we should also get the namespace start to be aligned?
> >
> > 2) While initialzing a namespace by scanning label area, we need to make
> > sure every namespace in the region satisfy the above requirement. If not
> > we should mark the region disabled.
> >
> >
> >>
> >> So on powerpc where PAGE_SIZE < arch_mapping_granulariy, the following:
> >>
> >> cat /sys/bus/nd/devices/$namespace/supported_aligns
> >>
> >> ...would show the same output as:
> >>
> >> cat /sys/bus/nd/devices/$pfn/align
> >>
> >> ...but with any alignment choice less than arch_mapping_granulariy removed.
> >>
> >
> > I am not sure why we need to do that. For example: even if we have
> > direct-map mapping size as PAGE_SIZE (64K), we still should allow an user
> > mapping with hugepage size (16M)?
> >
>
>
> Considering the direct-map map size is not going to be user selectable,
> do you agree that we can skip the above step 0 configuration you
> suggested.
>
> The changes proposed in the patch series essentially does the rest.
>
> 1) It validate the size against the arch specific limit during
> namespace creation. (part of step 1)

This validation is a surprise failure to ndctl.

> 2) It also disable initializing a region if it find the size not
> correctly aligned as per the platform requirement.

There needs to be a way for the user to discover the correct alignment
that the kernel will accept.

> 3) Direct map  mapping size is different from supported_alignment for a
> namespace. The supported alignment controls what possible PAGE SIZE user want the
> namespace to be mapped to user space.

No, the namespace alignment is different than the page mapping size.
The alignment is only interpreted as a mapping size at the device-dax
level, otherwise at the raw namespace level it's just an arbitrary
alignment.

> With the above do you think the current patch series is good?

I don't think we've quite converged on a solution.
