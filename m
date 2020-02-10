Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FD15822A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 19:20:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GZ2x5jlzzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 05:20:41 +1100 (AEDT)
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
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=d+3c2VIO; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GZ0z0w1zzDq9H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 05:18:52 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id a15so7349500otf.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 10:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sChepdk/YRCs175rH+BlGbDcDcJGkfdLslqExTb4U1g=;
 b=d+3c2VIOvcKpD1iC4w32tg1QuhpLzU51h/HM6XcbN433+JUsDqFG2Qx0edoUXCFafr
 jfWxRFfRvg56AaKAiVzr+eGt/v+rqb8/x1bGPk2Sj+igIx6Yk6Y5mGrgE0Fkia/mC10o
 0WJnXETrkVxIArvWeTLJCo57ea8AlILEl7EjWKMkzbyLmkSJVmSAenV0z4a0Ro9/Dnmv
 RsVv7iUNI/Dywc8nlEpHL4+pe5UDByGU6RrDf5jw96fUvGrVlohdShByE7KcXD/cxHCa
 dYrMXaE2hAiAoENR22SpbnL3IKy9UGXpwNaK9+avYdM8rYve36W+4uQttpacr+XZIb4h
 kyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sChepdk/YRCs175rH+BlGbDcDcJGkfdLslqExTb4U1g=;
 b=h2/gus4zD1syPDgYhtbHX5we9Alz5mmoy1cuQHkB8DPtl1C5j9eLj9j94Pdo8Mpvpr
 APMUVRyno2rWx5Wpej+r9bf2Azhlctkg7zsID9N3NvQvDAawzkMsrP/oy17FGplEtevt
 +DiZIIrA+xwsWbinHt/UzzZa8I2/g3wt4k6mIirIzQLQUwYMtft9QhFcI4USl3h2q47v
 EGXcQpuC5X2wXNQOquaIfniHgCEMQYPcJzpsp5Jd+aRMzvMTVxzn22UQTNZRovq2jkdp
 SZd9in2zbU+U6m7oyVDY8rhI10BbeYZqmt/8nr7I6dMv6wU6TiZWd9Y60WmWLAOUYZPr
 r9IQ==
X-Gm-Message-State: APjAAAW2aTYthtcSgtSN/Xlmoad7asCP7psnjVz7PiByUIUFjKyZfmUL
 cVgw9guNbAC02c48t0YO/3j57pK3mamKPosFGsVwSZSj
X-Google-Smtp-Source: APXvYqw5dqlbFTDvCEPFe2LoGhASJEseZ0YYyWL4QJ9Xa9w78JPVLSL/kfwVyCTB+RCGG1wYY0Truua6n8OTOyd8Tb0=
X-Received: by 2002:a9d:1284:: with SMTP id g4mr1983799otg.207.1581358729382; 
 Mon, 10 Feb 2020 10:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20200205052056.74604-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hBAk-dwO4=AT7cQm5YUwCBg0AECsZsiCjRJ_ZGWvWUAw@mail.gmail.com>
 <87y2ta8qy7.fsf@linux.ibm.com>
In-Reply-To: <87y2ta8qy7.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 10 Feb 2020 10:18:38 -0800
Message-ID: <CAPcyv4hNV88FJybgoRyM=JuKgrwYaf+CLWfFWt5X3yFMrecU=Q@mail.gmail.com>
Subject: Re: [PATCH v2] libnvdimm: Update persistence domain value for of_pmem
 and papr_scm device
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

On Mon, Feb 10, 2020 at 6:20 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Tue, Feb 4, 2020 at 9:21 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> Currently, kernel shows the below values
> >>         "persistence_domain":"cpu_cache"
> >>         "persistence_domain":"memory_controller"
> >>         "persistence_domain":"unknown"
> >>
> >> "cpu_cache" indicates no extra instructions is needed to ensure the persistence
> >> of data in the pmem media on power failure.
> >>
> >> "memory_controller" indicates platform provided instructions need to be issued
> >
> > No, it does not. The only requirement implied by "memory_controller"
> > is global visibility outside the cpu cache. If there are special
> > instructions beyond that then it isn't persistent memory, at least not
> > pmem that is safe for dax. virtio-pmem is an example of pmem-like
> > memory that is not enabled for userspace flushing (MAP_SYNC disabled).
> >
>
> Can you explain this more? The way I was expecting the application to
> interpret the value was, a regular store instruction doesn't guarantee
> persistence if you find the "memory_controller" value for
> persistence_domain. Instead, we need to make sure we flush data to the
> controller at which point the platform will take care of the persistence in
> case of power loss. How we flush data to the controller will also be
> defined by the platform.

If the platform requires any flush mechanism outside of the base cpu
ISA of cache flushes and memory barriers then MAP_SYNC needs to be
explicitly disabled to force the application to call fsync()/msync().
Then those platform specific mechanisms need to be triggered through a
platform-aware driver.

>
>
> >> as per documented sequence to make sure data get flushed so that it is
> >> guaranteed to be on pmem media in case of system power loss.
> >>
> >> Based on the above use memory_controller for non volatile regions on ppc64.
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  arch/powerpc/platforms/pseries/papr_scm.c | 7 ++++++-
> >>  drivers/nvdimm/of_pmem.c                  | 4 +++-
> >>  include/linux/libnvdimm.h                 | 1 -
> >>  3 files changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> >> index 7525635a8536..ffcd0d7a867c 100644
> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >> @@ -359,8 +359,13 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
> >>
> >>         if (p->is_volatile)
> >>                 p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
> >> -       else
> >> +       else {
> >> +               /*
> >> +                * We need to flush things correctly to guarantee persistance
> >> +                */
> >
> > There are never guarantees. If you're going to comment what does
> > software need to flush, and how?
>
> Can you explain why you say there are never guarantees? If you follow the platform
> recommended instruction sequence to flush data, we can be sure of data
> persistence in the pmem media.

Because storage can always fail. You can reduce risk, but never
eliminate it. This is similar to SSDs that use latent capacitance to
flush their write caches on driver power loss. Even if the application
successfully flushes its writes to buffers that are protected by that
capacitance that power source can still (and in practice does) fail.

>
>
> >
> >> +               set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
> >>                 p->region = nvdimm_pmem_region_create(p->bus, &ndr_desc);
> >> +       }
> >>         if (!p->region) {
> >>                 dev_err(dev, "Error registering region %pR from %pOF\n",
> >>                                 ndr_desc.res, p->dn);
> >> diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
> >> index 8224d1431ea9..6826a274a1f1 100644
> >> --- a/drivers/nvdimm/of_pmem.c
> >> +++ b/drivers/nvdimm/of_pmem.c
> >> @@ -62,8 +62,10 @@ static int of_pmem_region_probe(struct platform_device *pdev)
> >>
> >>                 if (is_volatile)
> >>                         region = nvdimm_volatile_region_create(bus, &ndr_desc);
> >> -               else
> >> +               else {
> >> +                       set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
> >>                         region = nvdimm_pmem_region_create(bus, &ndr_desc);
> >> +               }
> >>
> >>                 if (!region)
> >>                         dev_warn(&pdev->dev, "Unable to register region %pR from %pOF\n",
> >> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> >> index 0f366706b0aa..771d888a5ed7 100644
> >> --- a/include/linux/libnvdimm.h
> >> +++ b/include/linux/libnvdimm.h
> >> @@ -54,7 +54,6 @@ enum {
> >>         /*
> >>          * Platform provides mechanisms to automatically flush outstanding
> >>          * write data from memory controler to pmem on system power loss.
> >> -        * (ADR)
> >
> > I'd rather not delete critical terminology for a developer / platform
> > owner to be able to consult documentation, or their vendor. Can you
> > instead add the PowerPC equivalent term for this capability? I.e. list
> > (x86: ADR PowerPC: foo ...).
>
> Power ISA doesn't clearly call out what mechanism will be used to ensure
> that a load following power loss will return the previously flushed
> data. Hence there is no description of details like Asynchronous DRAM
> Refresh. Only details specified is with respect to flush sequence that ensures
> that a load following power loss will return the value stored.

What is this "flush sequence"?
