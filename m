Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 844211E87AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 21:24:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YZJG3KqfzDqVm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 05:24:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rdJ82H+b; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YZGB2mD1zDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 05:22:40 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id z5so3168775ejb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9X2RhbHpvQQWdJgG+rpDfMX39zeo7wJFaELQ6KhPm6M=;
 b=rdJ82H+bjX2Gv9A+KMnS2QDMaBvm3JPGpNwdOyKF8paQeibljoeRq8ZqbW5tTPLUnR
 mZpJpiohWBlp8+JSqCs8MK2tQRTQkyaXmf5UohRXwoGKD5FyEC2qMQemf6ZTKESEPSKW
 BgzaWyARf377pTXaDvoZytFxTSNnK+I7hyzQjT5jWSZkmMN6Vjxb7rMHZd08H5EqUHQw
 mntFhUIGIVTuat8+CiRektwy/DRc6nR/68pJqTL95f1qEd+tty0FjQa5WnxywS42tNah
 9ZW49t+DOSaZSOVr2K04KrdHe4v1e0kOrhG7pafH5z2MY5BZu4B7aTiAIU6OugV5TbD+
 eWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9X2RhbHpvQQWdJgG+rpDfMX39zeo7wJFaELQ6KhPm6M=;
 b=SpckSZvwS/5p0T/cat7xO4Wztd5843IC8ZiUTuBoKvw5/8NNmv9p0igVGa3Wo6R3MI
 nb/EBrgmnLNLhJvC9QImV91f1XvyLSeG/pTkTs/IW/lxn9gbB5d63ALGnogtjKmdUkcj
 XYDfRvgeevcUQ/pYHLsKJG3iQkVhle1buDIOJmDBy/Inc2mB2IftGwd27hOiXVo+CZYp
 jA6UvYHK9Ds4z96G/Sm8bmcJiBhzdAbfvdxQExL5t1jWIj5FyS4qLPMU+WQQq/jqf/mr
 0EHdchyfbcpihk1koNJ/kaktfq/mhOEdKQyrTeRtJOzki9BnabuIK9keq9ad7OlUg1QQ
 pjmg==
X-Gm-Message-State: AOAM531ruOWKykWYqEIvYg198lgcpInMSID0zBQhIWsXQ0amPb5KA793
 Ch95zb5U/ZcJk/t19uYW2iOfKo5lwrTQYbx5y0EqKw==
X-Google-Smtp-Source: ABdhPJzum/mYcTnGeuqk7gwPNlvHhhq3mfr+YHecVR28MHiifUQfUZlTNj0oRorKQAVZCIu2WSWtv7TSFR0Mfot8Enc=
X-Received: by 2002:a17:906:f745:: with SMTP id
 jp5mr9489606ejb.440.1590780154704; 
 Fri, 29 May 2020 12:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
In-Reply-To: <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 29 May 2020 12:22:23 -0700
Message-ID: <CAPcyv4jrss3dFcCOar3JTFnuN0_pgFNtBPiJzUdKxtiax6pPgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 jack@suse.de, Jeff Moyer <jmoyer@redhat.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 29, 2020 at 3:55 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 5/29/20 3:22 PM, Jan Kara wrote:
> > Hi!
> >
> > On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
> >> Thanks Michal. I also missed Jeff in this email thread.
> >
> > And I think you'll also need some of the sched maintainers for the prct=
l
> > bits...
> >
> >> On 5/29/20 3:03 PM, Michal Such=C3=A1nek wrote:
> >>> Adding Jan
> >>>
> >>> On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
> >>>> With POWER10, architecture is adding new pmem flush and sync instruc=
tions.
> >>>> The kernel should prevent the usage of MAP_SYNC if applications are =
not using
> >>>> the new instructions on newer hardware.
> >>>>
> >>>> This patch adds a prctl option MAP_SYNC_ENABLE that can be used to e=
nable
> >>>> the usage of MAP_SYNC. The kernel config option is added to allow th=
e user
> >>>> to control whether MAP_SYNC should be enabled by default or not.
> >>>>
> >>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > ...
> >>>> diff --git a/kernel/fork.c b/kernel/fork.c
> >>>> index 8c700f881d92..d5a9a363e81e 100644
> >>>> --- a/kernel/fork.c
> >>>> +++ b/kernel/fork.c
> >>>> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmli=
st_lock);
> >>>>    static unsigned long default_dump_filter =3D MMF_DUMP_FILTER_DEFA=
ULT;
> >>>> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
> >>>> +unsigned long default_map_sync_mask =3D MMF_DISABLE_MAP_SYNC_MASK;
> >>>> +#else
> >>>> +unsigned long default_map_sync_mask =3D 0;
> >>>> +#endif
> >>>> +
> >
> > I'm not sure CONFIG is really the right approach here. For a distro tha=
t would
> > basically mean to disable MAP_SYNC for all PPC kernels unless applicati=
on
> > explicitly uses the right prctl. Shouldn't we rather initialize
> > default_map_sync_mask on boot based on whether the CPU we run on requir=
es
> > new flush instructions or not? Otherwise the patch looks sensible.
> >
>
> yes that is correct. We ideally want to deny MAP_SYNC only w.r.t
> POWER10. But on a virtualized platform there is no easy way to detect
> that. We could ideally hook this into the nvdimm driver where we look at
> the new compat string ibm,persistent-memory-v2 and then disable MAP_SYNC
> if we find a device with the specific value.
>
> BTW with the recent changes I posted for the nvdimm driver, older kernel
> won't initialize persistent memory device on newer hardware. Newer
> hardware will present the device to OS with a different device tree
> compat string.
>
> My expectation  w.r.t this patch was, Distro would want to  mark
> CONFIG_ARCH_MAP_SYNC_DISABLE=3Dn based on the different application
> certification.  Otherwise application will have to end up calling the
> prctl(MMF_DISABLE_MAP_SYNC, 0) any way. If that is the case, should this
> be dependent on P10?
>
> With that I am wondering should we even have this patch? Can we expect
> userspace get updated to use new instruction?.
>
> With ppc64 we never had a real persistent memory device available for
> end user to try. The available persistent memory stack was using vPMEM
> which was presented as a volatile memory region for which there is no
> need to use any of the flush instructions. We could safely assume that
> as we get applications certified/verified for working with pmem device
> on ppc64, they would all be using the new instructions?

I think prctl is the wrong interface for this. I was thinking a sysfs
interface along the same lines as /sys/block/pmemX/dax/write_cache.
That attribute is toggling DAXDEV_WRITE_CACHE for the determination of
whether the platform or the kernel needs to handle cache flushing
relative to power loss. A similar attribute can be established for
DAXDEV_SYNC, it would simply default to off based on a configuration
time policy, but be dynamically changeable at runtime via sysfs.

These flags are device properties that affect the kernel and
userspace's handling of persistence.
