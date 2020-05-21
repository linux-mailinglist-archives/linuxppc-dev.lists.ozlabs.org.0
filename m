Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FCD1DD60F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 20:36:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Sdbx34cvzDqs1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 04:35:57 +1000 (AEST)
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
 header.s=20150623 header.b=ZM0h1GWb; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SdZ75KqbzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 04:34:23 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id z5so10084846ejb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bZB73trM7JmhHu61hJTv3jHzEz2F1LugfJH/YUnVYqg=;
 b=ZM0h1GWbWile7S9kQ21W3BI/ip9+OMrHJQM/ajHArCqSOHsyg1dYmKoJFtj44pXod0
 pwCSMuGGJZy9M1T+xesSJUXoYT1fHIG2ya7bms8M042L/YvVVLZhdlhMfHiSAJvcVvl5
 wBk8KemIgKTFzuU/H/rr1Jwp7heVqhu00V0iZ/DX7nf4nTgs64/gbhC3vRrJzMNA/BRP
 lN11dlSr7OChTKcZjQ59FQuqVQYGvE1lrPSzErFh6SHR2ZrOcF5Cnh8IsvKvI/mAhbi5
 SUvSN1YJNGeE1hPBIiD1+aatRedeMSFeggTjfMlUq27TUEb16fz5ByISYIt9JRWNRtZ1
 D8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bZB73trM7JmhHu61hJTv3jHzEz2F1LugfJH/YUnVYqg=;
 b=G1bNlqziE2Dif4qBw6fG66oNC8KmOOwpWqMZZGi/NbytQzKBDxkYTsDnwtuwF/RcLF
 etOM8T/3953FBq65MtoEsJrP4jTyK8OTAsoMKitMpTKntyf4NmmmlqzmV9GV9B7DKTON
 pIjtnpQOzwOsEvUM+W8kNjRr8SwUmmQh5v0uRcianG4qcPOzFNxRWtMOPtTBX2DLT4dd
 EXq5XRspgcPsdwPP/Nps3NFxmRxeZaOEno1CtnExUdmjTOtMs13EW/i1xfUPCKjmN9HC
 /a05SfpAKcbxZG2lbddyT2ave3wcpfKO9yqwHSvCWOmUzg1MQ6uiCpeHSuu2TqQ0NNrA
 12Vw==
X-Gm-Message-State: AOAM5306wpyR57DNpC+vQiHAbNYXhRCaoLd0GwUcPj5YGRwA4WdHo8mM
 t93uekzev5VzRCo+zXMfALyKnL/3AH9rwW3aL/E2TA==
X-Google-Smtp-Source: ABdhPJwKsXh+titAh6DgDZ1r89xS/iYOoQMiDoMrFLMmmvU1QitGELpC8ydHrsAa6yiizxbaijdstcJLj1jjRajAA2w=
X-Received: by 2002:a17:906:379b:: with SMTP id
 n27mr4691961ejc.432.1590086059384; 
 Thu, 21 May 2020 11:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
 <87v9kspk3x.fsf@linux.ibm.com>
 <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
 <87d070f2vs.fsf@linux.ibm.com>
 <CAPcyv4jZhYXEmYGzqGPjPtq9ZWJNtQyszN0V0Xcv0qtByK_KCw@mail.gmail.com>
 <x49o8qh9wu5.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49o8qh9wu5.fsf@segfault.boston.devel.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 21 May 2020 11:34:08 -0700
Message-ID: <CAPcyv4hbwqrERcs4oVGOAnew0A=HRm0muoKm3+4UzZLpOF12Yw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
To: Jeff Moyer <jmoyer@redhat.com>
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mikulas Patocka <mpatocka@redhat.com>, alistair@popple.id.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 7:39 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> >> But I agree with your concern that if we have older kernel/applications
> >> that continue to use `dcbf` on future hardware we will end up
> >> having issues w.r.t powerfail consistency. The plan is what you outlined
> >> above as tighter ecosystem control. Considering we don't have a pmem
> >> device generally available, we get both kernel and userspace upgraded
> >> to use these new instructions before such a device is made available.
>
> I thought power already supported NVDIMM-N, no?  So are you saying that
> those devices will continue to work with the existing flushing and
> fencing mechanisms?
>
> > Ok, I think a compile time kernel option with a runtime override
> > satisfies my concern. Does that work for you?
>
> The compile time option only helps when running newer kernels.  I'm not
> sure how you would even begin to audit userspace applications (keep in
> mind, not every application is open source, and not every application
> uses pmdk).  I also question the merits of forcing the administrator to
> make the determination of whether all applications on the system will
> work properly.  Really, you have to rely on the vendor to tell you the
> platform is supported, and at that point, why put further hurdles in the
> way?

I'm thoroughly confused by this. I thought this was exactly the role
of a Linux distribution vendor. ISVs qualify their application on a
hardware-platform + distribution combination and the distribution owns
picking ABI defaults like CONFIG_SYSFS_DEPRECATED regardless of
whether they can guarantee that all apps are updated to the new
semantics.

The administrator is not forced, the administrator if afforded an
override in the extreme case that they find an exception to what was
qualified and need to override the distribution's compile-time choice.

>
> The decision to require different instructions on ppc is unfortunate,
> but one I'm sure we have no control over.  I don't see any merit in the
> kernel disallowing MAP_SYNC access on these platforms.  Ideally, we'd
> have some way of ensuring older kernels don't work with these new
> platforms, but I don't think that's possible.

I see disabling MAP_SYNC as the more targeted form of "ensursing older
kernels don't work.

So I guess we agree that something should break when baseline
assumptions change, we just don't yet agree on where that break should
happen?
