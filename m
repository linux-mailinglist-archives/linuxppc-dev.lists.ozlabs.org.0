Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A471C1C8E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 20:04:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DKsL0zMmzDrQb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 04:04:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=wrpJY141; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DKqg4QCWzDrNP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 04:03:25 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id a2so8135666ejx.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 May 2020 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VjEvuT69fuKhyGG06CN4lqi4R0WHnRT6LOTJYOtlwM=;
 b=wrpJY141RNMC3/SZK5H0aRw4NlCI+ZaY1VPwPmaCsEUsigMEzJQ39dnvypn/oA5GKr
 hkOoMUpFwNJ0R8aX383yEXVYduWK4O6zsbkpNwTXRf9hzKRgR/+FgDvXMBkWaOzGtMFi
 2MiTQrsspiRcD7wO/FwjNkwHIwQmMcLL0HQ03X1HL0Y8/rKlYdsstb+DNVktFHT5jsKE
 NDHid8BRNBnBb+zkN6VO6gbqAyJcZEk7ndFw+/YH44qjBpOokB34pjwEHCkf4xQZaemp
 5XFEZkqe8z71d8R4MF9ACZcMNSJ1a9SJieowN5h314WG5Iu4YToa5MJqggcxdBUKMwbM
 RE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VjEvuT69fuKhyGG06CN4lqi4R0WHnRT6LOTJYOtlwM=;
 b=Mdd9XvDb7/3wEkgipeBP1AUgGjh/2cSy6kVJay0z8kwV3whCA0CkUlqgWWm6asoBdS
 HVsW1e1tRUlo6AMf0fl26DR8qcEeY2PQmNlG+K3jkY/l4EnwD1WtG3jbQKBvxllLeaWz
 oZuX+P6Hg+bon4sDZhSkm1Xtu2DlBBq5oCiaBh/h0ybDCHeSh+7CgkoA1hIoPIGnq+W2
 mbuaddVt9G/1ffuFjYWYaFbIYukrs4X9p18R6Pc6vLKp9Sb+asg6IPFGn2ULiZjOXJax
 wtKiKiIH+DIfPY43Sw7R4/VY07ppKHCy2hEEPwnuXk04e4ZyUadPu4bpuFp96OeK6Ftp
 wwyA==
X-Gm-Message-State: AGi0PuZPWIvAPfgOUNQHnhOgibnx9rSH3iN+HVScxGSkGeb67R218zTr
 8e3RlqgZsVFYN7f4WDDDzJAG4a+y2uG29/+TwhGopQ==
X-Google-Smtp-Source: APiQypJcoCxtc0ammAwXG/EYhkx9tuC4S2HKq973vyjprCVeujwW3ylCf8/X33dvWjefi0dkm6VKzYSFjEpO9Yj13DM=
X-Received: by 2002:a17:906:eb90:: with SMTP id
 mh16mr4393729ejb.201.1588356202537; 
 Fri, 01 May 2020 11:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
 <87pnbp2dcz.fsf@x220.int.ebiederm.org>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
 <871ro52ary.fsf@x220.int.ebiederm.org>
 <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com>
 <875zdg26hp.fsf@x220.int.ebiederm.org>
 <b28c9e02-8cf2-33ae-646b-fe50a185738e@redhat.com>
 <20200430152403.e0d6da5eb1cad06411ac6d46@linux-foundation.org>
 <5c908ec3-9495-531e-9291-cbab24f292d6@redhat.com>
 <CAPcyv4j=YKnr1HW4OhAmpzbuKjtfP7FdAn4-V7uA=b-Tcpfu+A@mail.gmail.com>
 <2d019c11-a478-9d70-abd5-4fd2ebf4bc1d@redhat.com>
 <CAPcyv4iOqS0Wbfa2KPfE1axQFGXoRB4mmPRP__Lmqpw6Qpr_ig@mail.gmail.com>
 <62dd4ce2-86cc-5b85-734f-ec8766528a1b@redhat.com>
 <0169e822-a6cc-1543-88ed-2a85d95ffb93@redhat.com>
In-Reply-To: <0169e822-a6cc-1543-88ed-2a85d95ffb93@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 1 May 2020 11:03:11 -0700
Message-ID: <CAPcyv4jGnR_fPtpKBC1rD2KRcT88bTkhqnTMmuwuc+f9Dwrz1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
To: David Hildenbrand <david@redhat.com>
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
Cc: virtio-dev@lists.oasis-open.org, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Linux MM <linux-mm@kvack.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 1, 2020 at 10:51 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 01.05.20 19:45, David Hildenbrand wrote:
> > On 01.05.20 19:39, Dan Williams wrote:
> >> On Fri, May 1, 2020 at 10:21 AM David Hildenbrand <david@redhat.com> wrote:
> >>>
> >>> On 01.05.20 18:56, Dan Williams wrote:
> >>>> On Fri, May 1, 2020 at 2:34 AM David Hildenbrand <david@redhat.com> wrote:
> >>>>>
> >>>>> On 01.05.20 00:24, Andrew Morton wrote:
> >>>>>> On Thu, 30 Apr 2020 20:43:39 +0200 David Hildenbrand <david@redhat.com> wrote:
> >>>>>>
> >>>>>>>>
> >>>>>>>> Why does the firmware map support hotplug entries?
> >>>>>>>
> >>>>>>> I assume:
> >>>>>>>
> >>>>>>> The firmware memmap was added primarily for x86-64 kexec (and still, is
> >>>>>>> mostly used on x86-64 only IIRC). There, we had ACPI hotplug. When DIMMs
> >>>>>>> get hotplugged on real HW, they get added to e820. Same applies to
> >>>>>>> memory added via HyperV balloon (unless memory is unplugged via
> >>>>>>> ballooning and you reboot ... the the e820 is changed as well). I assume
> >>>>>>> we wanted to be able to reflect that, to make kexec look like a real reboot.
> >>>>>>>
> >>>>>>> This worked for a while. Then came dax/kmem. Now comes virtio-mem.
> >>>>>>>
> >>>>>>>
> >>>>>>> But I assume only Andrew can enlighten us.
> >>>>>>>
> >>>>>>> @Andrew, any guidance here? Should we really add all memory to the
> >>>>>>> firmware memmap, even if this contradicts with the existing
> >>>>>>> documentation? (especially, if the actual firmware memmap will *not*
> >>>>>>> contain that memory after a reboot)
> >>>>>>
> >>>>>> For some reason that patch is misattributed - it was authored by
> >>>>>> Shaohui Zheng <shaohui.zheng@intel.com>, who hasn't been heard from in
> >>>>>> a decade.  I looked through the email discussion from that time and I'm
> >>>>>> not seeing anything useful.  But I wasn't able to locate Dave Hansen's
> >>>>>> review comments.
> >>>>>
> >>>>> Okay, thanks for checking. I think the documentation from 2008 is pretty
> >>>>> clear what has to be done here. I will add some of these details to the
> >>>>> patch description.
> >>>>>
> >>>>> Also, now that I know that esp. kexec-tools already don't consider
> >>>>> dax/kmem memory properly (memory will not get dumped via kdump) and
> >>>>> won't really suffer from a name change in /proc/iomem, I will go back to
> >>>>> the MHP_DRIVER_MANAGED approach and
> >>>>> 1. Don't create firmware memmap entries
> >>>>> 2. Name the resource "System RAM (driver managed)"
> >>>>> 3. Flag the resource via something like IORESOURCE_MEM_DRIVER_MANAGED.
> >>>>>
> >>>>> This way, kernel users and user space can figure out that this memory
> >>>>> has different semantics and handle it accordingly - I think that was
> >>>>> what Eric was asking for.
> >>>>>
> >>>>> Of course, open for suggestions.
> >>>>
> >>>> I'm still more of a fan of this being communicated by "System RAM"
> >>>
> >>> I was mentioning somewhere in this thread that "System RAM" inside a
> >>> hierarchy (like dax/kmem) will already be basically ignored by
> >>> kexec-tools. So, placing it inside a hierarchy already makes it look
> >>> special already.
> >>>
> >>> But after all, as we have to change kexec-tools either way, we can
> >>> directly go ahead and flag it properly as special (in case there will
> >>> ever be other cases where we could no longer distinguish it).
> >>>
> >>>> being parented especially because that tells you something about how
> >>>> the memory is driver-managed and which mechanism might be in play.
> >>>
> >>> The could be communicated to some degree via the resource hierarchy.
> >>>
> >>> E.g.,
> >>>
> >>>             [root@localhost ~]# cat /proc/iomem
> >>>             ...
> >>>             140000000-33fffffff : Persistent Memory
> >>>               140000000-1481fffff : namespace0.0
> >>>               150000000-33fffffff : dax0.0
> >>>                 150000000-33fffffff : System RAM (driver managed)
> >>>
> >>> vs.
> >>>
> >>>            :/# cat /proc/iomem
> >>>             [...]
> >>>             140000000-333ffffff : virtio-mem (virtio0)
> >>>               140000000-147ffffff : System RAM (driver managed)
> >>>               148000000-14fffffff : System RAM (driver managed)
> >>>               150000000-157ffffff : System RAM (driver managed)
> >>>
> >>> Good enough for my taste.
> >>>
> >>>> What about adding an optional /sys/firmware/memmap/X/parent attribute.
> >>>
> >>> I really don't want any firmware memmap entries for something that is
> >>> not part of the firmware provided memmap. In addition,
> >>> /sys/firmware/memmap/ is still a fairly x86_64 specific thing. Only mips
> >>> and two arm configs enable it at all.
> >>>
> >>> So, IMHO, /sys/firmware/memmap/ is definitely not the way to go.
> >>
> >> I think that's a policy decision and policy decisions do not belong in
> >> the kernel. Give the tooling the opportunity to decide whether System
> >> RAM stays that way over a kexec. The parenthetical reference otherwise
> >> looks out of place to me in the /proc/iomem output. What makes it
> >> "driver managed" is how the kernel handles it, not how the kernel
> >> names it.
> >
> > At least, virtio-mem is different. It really *has to be handled* by the
> > driver. This is not a policy. It's how it works.

...but that's not necessarily how dax/kmem works.

> >
>
> Oh, and I don't see why "System RAM (driver managed)" would hinder any
> policy in user case to still do what it thinks is the right thing to do
> (e.g., for dax).
>
> "System RAM (driver managed)" would mean: Memory is not part of the raw
> firmware memmap. It was detected and added by a driver. Handle with
> care, this is special.

Oh, no, I was more reacting to your, "don't update
/sys/firmware/memmap for the (driver managed) range" choice as being a
policy decision. It otherwise feels to me "System RAM (driver
managed)" adds confusion for casual users of /proc/iomem and for clued
in tools they have the parent association to decide policy.
