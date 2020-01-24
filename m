Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E30148DC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 19:27:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48470q5DdnzDqfV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 05:27:39 +1100 (AEDT)
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
 header.s=20150623 header.b=YU2azlWv; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4846zC3Y06zDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2020 05:26:13 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id r27so2524567otc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8o++U1OmXpf2JE6b6QRiJ0bOENUzj7zTAOxMX0rWlok=;
 b=YU2azlWvgcA7FOt8vcFjC6cHg3FCwutokUVpbsMDptk7DpseCRgMvu9HKVvALhWPyy
 ICSg+RfNl/vtaUMoUBOpcHeLwfHHLY1gu2KwfL+zL45prxQStNJG6rKaEQsXpDoCoz9M
 ki9vrsHd1GnU7eMN/n4GSC2eWmjn/fAD+nG5uMseEgFAjt4upSOjIRFZconsqIGhPsYg
 UT+nwvRjsFWBVx2zYlTKqolmzat1Cl5zwi8dzrOtme0BkwdDZ9FVwrlOzcLl/uMBiZXS
 HUGhAOh1JC7nr4yR1TJpekgyKsHIttDAP1Xcx5H3zBCkmmCw8Gu1JCEGHU5CwmJ3+8kU
 QP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8o++U1OmXpf2JE6b6QRiJ0bOENUzj7zTAOxMX0rWlok=;
 b=k47mlw+bFGz56Vj/hVGlDMMf56s6WzqBHO+L4YmFPkAYkQ9srLRmqGy6jIxdFSd2jM
 iJgavih4TguWO6K3eLvDQP++rm2iUt14Ws58EGUEzLfuOxiJrSxoS7MwNDYSdnOldo6J
 Kev77WTMNchbiCoDHj19WzQDcJP1s59j/TD90XlDZMX4zWm/+DKDP1oYkh61khY95Gqv
 JgqcfdaCBTZFnE2PEP5DQn3YQRKa3j/8nehhG4T/aoQg9xKrDsVCESFr4miiEaGzc3qe
 YPBZ3WC1xz4VuPstBhQZQ26tkYrpV8ulWO2XP1gRz8urOEgMMZZAPiWwlXqWD6/lF75c
 Dr3g==
X-Gm-Message-State: APjAAAXgKJQsjaiWoCLJGgCZsco0JsPOZC0sEB/oXngALrIDwMJ7Mh/f
 viDGbRpZN7fTdBuJNtQ5rVFnG1GuMIhpp7wwH2ZVjg==
X-Google-Smtp-Source: APXvYqykgaY5Iw/3p878fhnSLc22PkG7WoQ+Y/sslWkhJ7Odm93sCb9/yxa3uTZg6M/q45CXWPp/DPa6eHPCz4PJUaY=
X-Received: by 2002:a9d:4e99:: with SMTP id v25mr3806090otk.363.1579890370532; 
 Fri, 24 Jan 2020 10:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20200120140749.69549-1-aneesh.kumar@linux.ibm.com>
 <20200120140749.69549-2-aneesh.kumar@linux.ibm.com>
 <CAPcyv4jcZhQcKr=0OGWc1aZb0OQ1ws2edd-LZMR-EJ_Z2174Sg@mail.gmail.com>
 <5fd11235-5f26-b10a-140f-ef24214c85b1@linux.ibm.com>
 <CAPcyv4jP3S0h9vUVVU16ipeauXyaW3qxUdridagA4SNJ1UW+Vw@mail.gmail.com>
 <cb71528e-0ea9-cb56-6b51-ae7a5231ad54@linux.ibm.com>
In-Reply-To: <cb71528e-0ea9-cb56-6b51-ae7a5231ad54@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 24 Jan 2020 10:25:59 -0800
Message-ID: <CAPcyv4jPBfhC4t5+e2gxhzKfaLdQi_qTKfLEcXdo-MjTA5a+aw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] libnvdimm/namespace: Make namespace size
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
Cc: Vishal L Verma <vishal.l.verma@intel.com>, jmoyer <jmoyer@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 24, 2020 at 9:07 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 1/24/20 10:15 PM, Dan Williams wrote:
> > On Thu, Jan 23, 2020 at 11:34 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> On 1/24/20 11:27 AM, Dan Williams wrote:
> >>> On Mon, Jan 20, 2020 at 6:08 AM Aneesh Kumar K.V
> >>>
> >>
> >> ....
> >>
> >>>>
> >>>> +unsigned long arch_namespace_map_size(void)
> >>>> +{
> >>>> +       return PAGE_SIZE;
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(arch_namespace_map_size);
> >>>> +
> >>>> +
> >>>>    static void __cpa_flush_all(void *arg)
> >>>>    {
> >>>>           unsigned long cache = (unsigned long)arg;
> >>>> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> >>>> index 9df091bd30ba..a3476dbd2656 100644
> >>>> --- a/include/linux/libnvdimm.h
> >>>> +++ b/include/linux/libnvdimm.h
> >>>> @@ -284,4 +284,5 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
> >>>>    }
> >>>>    #endif
> >>>>
> >>>> +unsigned long arch_namespace_map_size(void);
> >>>
> >>> This property is more generic than the nvdimm namespace mapping size,
> >>> it's more the fundamental remap granularity that the architecture
> >>> supports. So I would expect this to be defined in core header files.
> >>> Something like:
> >>>
> >>> diff --git a/include/linux/io.h b/include/linux/io.h
> >>> index a59834bc0a11..58b3b2091dbb 100644
> >>> --- a/include/linux/io.h
> >>> +++ b/include/linux/io.h
> >>> @@ -155,6 +155,13 @@ enum {
> >>>    void *memremap(resource_size_t offset, size_t size, unsigned long flags);
> >>>    void memunmap(void *addr);
> >>>
> >>> +#ifndef memremap_min_align
> >>> +static inline unsigned int memremap_min_align(void)
> >>> +{
> >>> +       return PAGE_SIZE;
> >>> +}
> >>> +#endif
> >>> +
> >>
> >>
> >> Should that be memremap_pages_min_align()?
> >
> > No, and on second look it needs to be a common value that results in
> > properly aligned / sized namespaces across architectures.
> >
> > What would it take for Power to make it's minimum mapping granularity
> > SUBSECTION_SIZE? The minute that the minimum alignment changes across
> > architectures we lose compatibility.
> >
> > The namespaces need to be sized such that the mode can be changed freely.
> >
>
> Linux on ppc64 with hash translation use just one page size for direct
> mapping and that is 16MB.

Ok, I think this means that the dream of SUBSECTION_SIZE being the
minimum compat alignment is dead, or at least a dream deferred.

Let's do this, change the name of this function to:

    memremap_compat_align()

...and define it to be the max() of all the alignment constraints that
the arch may require through either memremap(), or memremap_pages().
Then, teach ndctl to make its default alignment compatible by default,
16MiB, with an override to allow namespace creation with the current
architecture's memremap_compat_align(), exported via sysfs, if it
happens to be less then 16MiB. Finally, cross our fingers and hope
that Power remains the only arch that violates the SUBSECTION_SIZE
minimum value for memremap_compat_align().
