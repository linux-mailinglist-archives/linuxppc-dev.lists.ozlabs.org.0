Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B38201DA055
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 21:02:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RQHn6H1xzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 05:02:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=eNKiZqD0; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RQDR1HFkzDr2l
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 04:59:46 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id yc10so166879ejb.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 11:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MmeCE2rNLbyTWV0xi9uw/p7FZOlCO9sFDmL+q409Ck0=;
 b=eNKiZqD0vS2pR3tIJYsN12i9G1IVXbuerFMfQCRENKtoh5ZvGgP0XiPS6ml0NCK07P
 EOplW9dBqXQL91BtIfiZQRZV3HmJlk8LTt7tSC5DuVqB6SNCf8BnLT+wQOZ1cbhuaqLh
 HL113jfQAu0wbHAAf6xDGxMUhC/fjgiCc/aLfIWfC8HllajjXk9B1y52JEELCZPThJnG
 wLKmZ+9e7jQ924QlMz0g7jP5yDBsckqLajGqzUnzSfvZ81PskoLOqwaRyVeu1ZI60auR
 ppGcjLdTKV8fsA7Syaz4Z5ek0zp89+yuPCwsDjYSthf2ZMtJ70fZnvMYnbGK3N555e65
 uFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MmeCE2rNLbyTWV0xi9uw/p7FZOlCO9sFDmL+q409Ck0=;
 b=nc+dfhMPiotwWnghhYF2Ud3mYiKDuFZJLvsXjCCHUGQXB7WURD8CmQR8YJDqFAyC9j
 MyES5CamwmeOOsE0QU490z886fu2d8FE+WYcFOTfkPHTIdYUZajzQG8dMmpUXfrmA71O
 LaO4zWz7Me8WkM2tlNxV6moFvlb1JZ65+2t4Fv4fgINsk50793o6OXBQMRlExVKiASpa
 tHpmtUvXGnpEaKq/ntI7Lkqsh7CHAOg7sSBeXYoFaSERhDCzzWry0ruKn/X3fm7jj/jg
 1JYjh1AWwlLNblxc4W0zuTFS4v0k4AQyIhfmrxpvH7NVKZDYdUnecmQd9eeZlcYL27Zm
 jzHA==
X-Gm-Message-State: AOAM532YHfyG0EtfUjZc0IqZBa8o5JO59bBlwLPYAoWX2LT9tmJNojGy
 i/HJL9F2Rcs2JOZgRn+m2JrkSktsSbJBbtzyMjdo9Q==
X-Google-Smtp-Source: ABdhPJyyvelSDTZhXRqUnGw6DaM8Owg0RToFl89XRs5sJg99jrP5k72QLw9t7cVYey5hGbkZfQdBwxPfAynowjdKeCE=
X-Received: by 2002:a17:906:fb0e:: with SMTP id
 lz14mr554066ejb.237.1589914781961; 
 Tue, 19 May 2020 11:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
 <87v9kspk3x.fsf@linux.ibm.com>
 <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
 <87d070f2vs.fsf@linux.ibm.com>
In-Reply-To: <87d070f2vs.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 19 May 2020 11:59:30 -0700
Message-ID: <CAPcyv4jZhYXEmYGzqGPjPtq9ZWJNtQyszN0V0Xcv0qtByK_KCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
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
Cc: alistair@popple.id.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 6:53 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Mon, May 18, 2020 at 10:30 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
>
> ...
>
> >> Applications using new instructions will behave as expected when running
> >> on P8 and P9. Only future hardware will differentiate between 'dcbf' and
> >> 'dcbfps'
> >
> > Right, this is the problem. Applications using new instructions behave
> > as expected, the kernel has been shipping of_pmem and papr_scm for
> > several cycles now, you're saying that the DAX applications written
> > against those platforms are going to be broken on P8 and P9?
>
> The expecation is that both kernel and userspace would get upgraded to
> use the new instruction before actual persistent memory devices are
> made available.
>
> >
> >> > I'm thinking the kernel
> >> > should go as far as to disable DAX operation by default on new
> >> > hardware until userspace asserts that it is prepared to switch to the
> >> > new implementation. Is there any other way to ensure the forward
> >> > compatibility of deployed ppc64 DAX applications?
> >>
> >> AFAIU there is no released persistent memory hardware on ppc64 platform
> >> and we need to make sure before applications get enabled to use these
> >> persistent memory devices, they should switch to use the new
> >> instruction?
> >
> > Right, I want the kernel to offer some level of safety here because
> > everything you are describing sounds like a flag day conversion. Am I
> > misreading? Is there some other gate that prevents existing users of
> > of_pmem and papr_scm from having their expectations violated when
> > running on P8 / P9 hardware? Maybe there's tighter ecosystem control
> > that I'm just not familiar with, I'm only going off the fact that the
> > kernel has shipped a non-zero number of NVDIMM drivers that build with
> > ARCH=ppc64 for several cycles.
>
> If we are looking at adding changes to kernel that will prevent a kernel
> from running on newer hardware in a specific case, we could as well take
> the changes to get the kernel use the newer instructions right?

Oh, no, I'm not talking about stopping the kernel from running. I'm
simply recommending that support for MAP_SYNC mappings (userspace
managed flushing) be disabled by default on PPC with either a
compile-time or run-time default to assert that userspace has been
audited for legacy applications or that the platform owner is
otherwise willing to take the risk.

> But I agree with your concern that if we have older kernel/applications
> that continue to use `dcbf` on future hardware we will end up
> having issues w.r.t powerfail consistency. The plan is what you outlined
> above as tighter ecosystem control. Considering we don't have a pmem
> device generally available, we get both kernel and userspace upgraded
> to use these new instructions before such a device is made available.

Ok, I think a compile time kernel option with a runtime override
satisfies my concern. Does that work for you?
