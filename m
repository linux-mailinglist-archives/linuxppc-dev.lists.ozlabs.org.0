Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C6015952D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:40:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48H7n10hhyzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 03:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=c7bcfYkl; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48H7kg3TT6zDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 03:38:28 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id 77so10710765oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M14tUnXezyfTG2uEaCt6BkTSl06fwFq2KX5/xwONHmg=;
 b=c7bcfYkl865u8mwi3j6bMuxxFfAYKHZ8LGvS2XJN+oXeovoXXh0zE87RvT6/jebRbQ
 MgclVBM6iKdZ+1p5HoND1tP1lIUN/EVDKkZTI3nCW++BnCOl6u0GtnJHxk6yptq+1EhT
 VP9m4nzcGsaVObitpEUCK69e1ONIFnXbmWxAA/hYQq25ruLofoxnaY+Ril4zy43FrgLe
 +tqxbtWPG++7asb9/s4scVMdjI5hco7xN/KUaJDhUyBy9EV3CNeftd5dv1KUkeLap/e8
 zfNQzHGvduy2UqFo5TU6Vp6HQ1G4CdxcPu6krb2Wd8wr1sja20Yd+q+VE4AZvHDJFP8K
 60+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M14tUnXezyfTG2uEaCt6BkTSl06fwFq2KX5/xwONHmg=;
 b=lmuZxzAYYPiKYdophJwP32lcYEdoa8EWDUTs2DkiLqcpumgKt4cAiQwusPMc10jVLZ
 ylIN9iq9LOzoUYfQJv8tK33oS4X08Mg9K6Lf6RNccZaRCw8llhL4mDE/1mZWRwJP0tRn
 Jdrlyu5EofXsyHfKYewVp7v1AvGse39NoqQo5KglKT2SV+UajJcW8rmZ8b7U9jm2M7ml
 29vQp+uHisSXTI6TDWX1m0d/HhtvsqC/6+1Z8DS3DTOnMSqvK7Ur/6gFMhZvfdNCoxeL
 Q0DzCYxtRQ4iibjyRCFsr5O7FstO7+PJOMIAS3sA0FPaDcs0WqPTPG3nFdwiZVriUmK3
 WCKA==
X-Gm-Message-State: APjAAAW0N1d2RfvOqF4VSjf/sbccxFXZ/x0Ep07fHCfsH5jYxXUaq+u5
 pGPOMz1YALkC62yqzsvm8yK6ID63piB01VBRMb2AUufbl64=
X-Google-Smtp-Source: APXvYqz1eW5cuMmtQztw7ntDCxQDsIajXms/anTIPXYbHHRcHRJfxztteptd3GcTZryD7P5N22K/7mmiCogzhuNsTBA=
X-Received: by 2002:a9d:4e99:: with SMTP id v25mr6046728otk.363.1581439105020; 
 Tue, 11 Feb 2020 08:38:25 -0800 (PST)
MIME-Version: 1.0
References: <20200205052056.74604-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hBAk-dwO4=AT7cQm5YUwCBg0AECsZsiCjRJ_ZGWvWUAw@mail.gmail.com>
 <87y2ta8qy7.fsf@linux.ibm.com>
 <CAPcyv4hNV88FJybgoRyM=JuKgrwYaf+CLWfFWt5X3yFMrecU=Q@mail.gmail.com>
 <25eabdd9-410f-e4c3-6b0e-41a5e6daba10@linux.ibm.com>
In-Reply-To: <25eabdd9-410f-e4c3-6b0e-41a5e6daba10@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 11 Feb 2020 08:38:14 -0800
Message-ID: <CAPcyv4iFP6_jkocoyv-6zd0Y8FEYFA3Pk6brH5+_XQ9+U896wQ@mail.gmail.com>
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

On Tue, Feb 11, 2020 at 6:57 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 2/10/20 11:48 PM, Dan Williams wrote:
> > On Mon, Feb 10, 2020 at 6:20 AM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> Dan Williams <dan.j.williams@intel.com> writes:
> >>
> >>> On Tue, Feb 4, 2020 at 9:21 PM Aneesh Kumar K.V
> >>> <aneesh.kumar@linux.ibm.com> wrote:
> >>>>
> >>>> Currently, kernel shows the below values
> >>>>          "persistence_domain":"cpu_cache"
> >>>>          "persistence_domain":"memory_controller"
> >>>>          "persistence_domain":"unknown"
> >>>>
> >>>> "cpu_cache" indicates no extra instructions is needed to ensure the persistence
> >>>> of data in the pmem media on power failure.
> >>>>
> >>>> "memory_controller" indicates platform provided instructions need to be issued
> >>>
> >>> No, it does not. The only requirement implied by "memory_controller"
> >>> is global visibility outside the cpu cache. If there are special
> >>> instructions beyond that then it isn't persistent memory, at least not
> >>> pmem that is safe for dax. virtio-pmem is an example of pmem-like
> >>> memory that is not enabled for userspace flushing (MAP_SYNC disabled).
> >>>
> >>
> >> Can you explain this more? The way I was expecting the application to
> >> interpret the value was, a regular store instruction doesn't guarantee
> >> persistence if you find the "memory_controller" value for
> >> persistence_domain. Instead, we need to make sure we flush data to the
> >> controller at which point the platform will take care of the persistence in
> >> case of power loss. How we flush data to the controller will also be
> >> defined by the platform.
> >
> > If the platform requires any flush mechanism outside of the base cpu
> > ISA of cache flushes and memory barriers then MAP_SYNC needs to be
> > explicitly disabled to force the application to call fsync()/msync().
> > Then those platform specific mechanisms need to be triggered through a
> > platform-aware driver.
> >
>
>
> Agreed. I was thinking we mark the persistence_domain: "Unknown" in that
> case. virtio-pmem mark it that way.

I would say the driver requirement case is persistence_domain "None",
not "Unknown". I.e. the platform provides no mechanism to flush data
to the persistence domain on power loss, it's back to typical storage
semantics.

>
>
> >>
> >>
> >>>> as per documented sequence to make sure data get flushed so that it is
> >>>> guaranteed to be on pmem media in case of system power loss.
> >>>>
> >>>> Based on the above use memory_controller for non volatile regions on ppc64.
> >>>>
> >>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >>>> ---
> >>>>   arch/powerpc/platforms/pseries/papr_scm.c | 7 ++++++-
> >>>>   drivers/nvdimm/of_pmem.c                  | 4 +++-
> >>>>   include/linux/libnvdimm.h                 | 1 -
> >>>>   3 files changed, 9 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> >>>> index 7525635a8536..ffcd0d7a867c 100644
> >>>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >>>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >>>> @@ -359,8 +359,13 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
> >>>>
> >>>>          if (p->is_volatile)
> >>>>                  p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
> >>>> -       else
> >>>> +       else {
> >>>> +               /*
> >>>> +                * We need to flush things correctly to guarantee persistance
> >>>> +                */
> >>>
> >>> There are never guarantees. If you're going to comment what does
> >>> software need to flush, and how?
> >>
> >> Can you explain why you say there are never guarantees? If you follow the platform
> >> recommended instruction sequence to flush data, we can be sure of data
> >> persistence in the pmem media.
> >
> > Because storage can always fail. You can reduce risk, but never
> > eliminate it. This is similar to SSDs that use latent capacitance to
> > flush their write caches on driver power loss. Even if the application
> > successfully flushes its writes to buffers that are protected by that
> > capacitance that power source can still (and in practice does) fail.
> >
>
> ok guarantee is not the right term there. Can we say
>
> /* We need to flush tings correctly to ensure persistence */

The definition of the "memory_controller" persistence domain is: "the
platform takes care to flush writes to media once they are globally
visible outside the cache".

>
>
> What I was trying to understand/clarify was the detail an application
> can infer looking at the value of persistence_domain ?
>
> Do you agree that below can be inferred from the "memory_controller"
> value of persistence_domain
>
> 1) Application needs to use cache flush instructions and that ensures
> data is persistent across power failure.
>
>
> Or are you suggesting that application should not infer any of those
> details looking at persistence_domain value? If so what is the purpose
> of exporting that attribute?

The way the patch was worded I thought it was referring to an explicit
mechanism outside cpu cache flushes, i.e. a mechanism that required a
driver call.

>
>
> >>
> >>
> >>>
> >>>> +               set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
> >>>>                  p->region = nvdimm_pmem_region_create(p->bus, &ndr_desc);
> >>>> +       }
> >>>>          if (!p->region) {
> >>>>                  dev_err(dev, "Error registering region %pR from %pOF\n",
> >>>>                                  ndr_desc.res, p->dn);
> >>>> diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
> >>>> index 8224d1431ea9..6826a274a1f1 100644
> >>>> --- a/drivers/nvdimm/of_pmem.c
> >>>> +++ b/drivers/nvdimm/of_pmem.c
> >>>> @@ -62,8 +62,10 @@ static int of_pmem_region_probe(struct platform_device *pdev)
> >>>>
> >>>>                  if (is_volatile)
> >>>>                          region = nvdimm_volatile_region_create(bus, &ndr_desc);
> >>>> -               else
> >>>> +               else {
> >>>> +                       set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
> >>>>                          region = nvdimm_pmem_region_create(bus, &ndr_desc);
> >>>> +               }
> >>>>
> >>>>                  if (!region)
> >>>>                          dev_warn(&pdev->dev, "Unable to register region %pR from %pOF\n",
> >>>> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> >>>> index 0f366706b0aa..771d888a5ed7 100644
> >>>> --- a/include/linux/libnvdimm.h
> >>>> +++ b/include/linux/libnvdimm.h
> >>>> @@ -54,7 +54,6 @@ enum {
> >>>>          /*
> >>>>           * Platform provides mechanisms to automatically flush outstanding
> >>>>           * write data from memory controler to pmem on system power loss.
> >>>> -        * (ADR)
> >>>
> >>> I'd rather not delete critical terminology for a developer / platform
> >>> owner to be able to consult documentation, or their vendor. Can you
> >>> instead add the PowerPC equivalent term for this capability? I.e. list
> >>> (x86: ADR PowerPC: foo ...).
> >>
> >> Power ISA doesn't clearly call out what mechanism will be used to ensure
> >> that a load following power loss will return the previously flushed
> >> data. Hence there is no description of details like Asynchronous DRAM
> >> Refresh. Only details specified is with respect to flush sequence that ensures
> >> that a load following power loss will return the value stored.
> >
> > What is this "flush sequence"?
> >
>
> cpu cache flush instructions "dcbf; hwsync"

Looks good, as long as the flush mechanism is defined by the cpu ISA
then MAP_SYNC is viable.
