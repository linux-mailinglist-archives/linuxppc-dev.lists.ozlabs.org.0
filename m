Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C418A94F1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 22:37:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C5MB1Z31zDqVL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 06:37:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="psHWRrKd"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C5H91lJKzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 06:33:39 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id k18so2934341otr.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B0w/srl7CvMR3sGmFMfU5XCGV1/r89NViS9qVVWCBSI=;
 b=psHWRrKd3x75XaBq4Qa+LS1cLPahMqjrX1Wn9mxcApv8yxQqSht7/8v5RuDSONcTl0
 ehqF6W3K8BdBMNPmHEpQENl+LP9kj1ttVSPpJsNMgb4CFrSpSHeTXJfrbNIlcP/4P2ax
 v/WYGq8gB4lM4fAbHXnXRH5vG+D6KqARROwqYsqvxa0BEXVHuSqlzyvY4cBCrpe0qGoz
 SPOArGDUJmF04uROBncNRtZ5jVqMijWggZ1TrKwCut/1onZ9d8tQoJx1S9Oj2RYVRSO9
 UDY9LRaj95qDLjn1TjoKhMj94FU49Cs6G2ne+/7PDV66Ps0ReP7phOU9Vmk0BhC4KDNz
 5niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0w/srl7CvMR3sGmFMfU5XCGV1/r89NViS9qVVWCBSI=;
 b=N2q9H3HicGjSQv5sfGPg7wCVHy7I8rLno+wR7J7KDg4lDHhBLu3xMdedWVacS9SKoS
 dFe+9T0aNbQNy+TXrEy/JYpT+GSxECPNdcb47BVyAl4MCx1YW2f2CnDhdOlW48kgSHn5
 A64sB1C5JH84CT0NsJvg+/5xHayoQcZjEX6DcUHqmbVFc8CLYr7Q/p9tMR/TSXhmv/QL
 E+GT/Kdx9DkrZkH9WFtZBQX8prYXKq61xPvJo+SpXDSaEDnklXoZ896Tafl4el6Q7zg5
 2WiYgIDZ/pNRl3rv+Rov2wD8RpztzDHt9WU7zjR7JyR7AJcnixx4OnHPy7aEbApCpLm1
 XH0A==
X-Gm-Message-State: APjAAAVB9CrK+quXOHaN2WTZpLNbZBcKxraVeR6iCSDN2wIlrCFFNmOq
 2lW4xcElceDyXQ/ld533dIftlpmkf/X2U8a6UUe1jA==
X-Google-Smtp-Source: APXvYqy9tHBQADa1qvVeSsghOJr6TWr+3Lup/KNrD2wljjZJ0t87Se7fCmBqBKSv6ZJkJN9H9FM27wQ23v9EoryQYPc=
X-Received: by 2002:a05:6830:458:: with SMTP id
 d24mr19105752otc.126.1566246817595; 
 Mon, 19 Aug 2019 13:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190809074520.27115-1-aneesh.kumar@linux.ibm.com>
 <20190809074520.27115-4-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hc_-oGMp6jGVknnYs+rmj4W1A_gFCbmAX2LFw0hsfL5g@mail.gmail.com>
 <87v9ut1vev.fsf@linux.ibm.com> <87mug5biyg.fsf@linux.ibm.com>
In-Reply-To: <87mug5biyg.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 19 Aug 2019 13:33:26 -0700
Message-ID: <CAPcyv4hTQ8iVPbOmQNHEeT9-Z6-52k4dxexq5mTr-A4cru0OkQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] mm/nvdimm: Use correct #defines instead of open
 coding
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

On Mon, Aug 19, 2019 at 2:32 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> writes:
>
> > Dan Williams <dan.j.williams@intel.com> writes:
> >
> >> On Fri, Aug 9, 2019 at 12:45 AM Aneesh Kumar K.V
> >> <aneesh.kumar@linux.ibm.com> wrote:
> >>>
> >>
>
> ...
>
> >>> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> >>> index 37e96811c2fc..c1d9be609322 100644
> >>> --- a/drivers/nvdimm/pfn_devs.c
> >>> +++ b/drivers/nvdimm/pfn_devs.c
> >>> @@ -725,7 +725,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
> >>>                  * when populating the vmemmap. This *should* be equal to
> >>>                  * PMD_SIZE for most architectures.
> >>>                  */
> >>> -               offset = ALIGN(start + SZ_8K + 64 * npfns, align) - start;
> >>> +               offset = ALIGN(start + SZ_8K + sizeof(struct page) * npfns,
> >>
> >> I'd prefer if this was not dynamic and was instead set to the maximum
> >> size of 'struct page' across all archs just to enhance cross-arch
> >> compatibility. I think that answer is '64'.
> >
> >
> > That still doesn't take care of the case where we add new elements to
> > struct page later. If we have struct page size changing across
> > architectures, we should still be ok as long as new size is less than what is
> > stored in pfn superblock? I understand the desire to keep it
> > non-dynamic. But we also need to make sure we don't reserve less space
> > when creating a new namespace on a config that got struct page size >
> > 64?
>
>
> How about
>
> libnvdimm/pfn_dev: Add a build check to make sure we notice when struct page size change
>
> When namespace is created with map device as pmem device, struct page is stored in the
> reserve block area. We need to make sure we account for the right struct page
> size while doing this. Instead of directly depending on sizeof(struct page)
> which can change based on different kernel config option, use the max struct
> page size (64) while calculating the reserve block area. This makes sure pmem
> device can be used across kernels built with different configs.
>
> If the above assumption of max struct page size change, we need to update the
> reserve block allocation space for new namespaces created.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>
> 1 file changed, 7 insertions(+)
> drivers/nvdimm/pfn_devs.c | 7 +++++++
>
> modified   drivers/nvdimm/pfn_devs.c
> @@ -722,7 +722,14 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>                  * The altmap should be padded out to the block size used
>                  * when populating the vmemmap. This *should* be equal to
>                  * PMD_SIZE for most architectures.
> +                *
> +                * Also make sure size of struct page is less than 64. We
> +                * want to make sure we use large enough size here so that
> +                * we don't have a dynamic reserve space depending on
> +                * struct page size. But we also want to make sure we notice
> +                * if we end up adding new elements to struct page.
>                  */
> +               BUILD_BUG_ON(64 < sizeof(struct page));

Looks ok to me. There are ongoing heroic efforts to make sure 'struct
page' does not grown beyond the size of cacheline. The fact that
'struct page_ext' is allocated out of line makes it safe to assume
that 'struct page' will not be growing larger in the foreseeable
future.
