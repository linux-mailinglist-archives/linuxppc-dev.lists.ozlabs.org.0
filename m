Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73A71C057C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 21:00:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cl8C0jxTzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:00:43 +1000 (AEST)
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
 header.s=20150623 header.b=ftYR3vvy; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cl5m4djPzDr9W
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 04:58:35 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id a2so5576004ejx.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VO82Y+ddPqwVbejb8yp1YADHo+TiaduERH1aUXgFNdU=;
 b=ftYR3vvy7y4XQUHnig2EWsnYgRjVl+CPW2em4ftSq034hx6ZoqSueCcso+RG9w8AGa
 w0/+YALKEw0FIaP05V+9C0XKOYuOmd59KAW1siA/r09GzwZUf48N8GmxNx1dxSbliixs
 CuBWjC2ORmo5GZgQNulH0b+ykeGy5IQzQog4ZcfdBGWxbr/kGwbKqiBi3jZCbBsGvnNW
 Q5W2E6yv533qZlcTHc6rxcPndCCEwjOVK0cZ2rz6LGVrs0kCEepYAF9z3xs1VIBjMZtf
 A5p7YNgqSxKHyCub+EuUXAZ2xuX50SSxRFhOGGuo9nNwQKHccsh0XWdv0oNDM0uH1ryy
 dbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VO82Y+ddPqwVbejb8yp1YADHo+TiaduERH1aUXgFNdU=;
 b=hKWjXib/0zABOBXj3fgLJK4+rxs2ptf4vDyAEkAuOH7LS7ZiPHKnuu8UZtNoP5Y5/7
 4w8GEVDScVqweC2+NtyJYT2T6Liqa5PQng6KxYreQ/yFFpuPUCf7FbIaDsnUCFmVArAT
 dRJ9QWT3ztdVaTCMKVcnw+oif+yB4AnE931cfXiqmnIwGpRRrHpbNu1nySJvxJNzyoCW
 qHW4SJrbdT0ZEaWVKN1jFZVPGLag0cpmCO3AvVVELRuc1lD/Kpsbqn6vmjpSE+UxjVfl
 VuGswPLMntN7wWiICKynozlrrUy4riR/qJJTUZGos7+9yS368TUB7cHf4pOrjR7hExQK
 jrAg==
X-Gm-Message-State: AGi0PuaQ6BSvveMrj1CCcYNuMRFhYyjZ+TV1XQFJhDzTmUqoandLCmYX
 EsG5Wajb5v6xlFOhMsGxmY+p+pQ4GYFiMUVdEp4bBQ==
X-Google-Smtp-Source: APiQypLtO6lmgP+/t4n/a1LprqtsF2znfD77bnYaqHJRks9KFzncsFlKVdj99iACRR541U4ie6ERYFDj3Eno6uEUPdw=
X-Received: by 2002:a17:906:855a:: with SMTP id
 h26mr4305126ejy.56.1588273108788; 
 Thu, 30 Apr 2020 11:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200430102908.10107-1-david@redhat.com>
 <20200430102908.10107-3-david@redhat.com>
 <87pnbp2dcz.fsf@x220.int.ebiederm.org>
 <1b49c3be-6e2f-57cb-96f7-f66a8f8a9380@redhat.com>
 <871ro52ary.fsf@x220.int.ebiederm.org>
 <373a6898-4020-4af1-5b3d-f827d705dd77@redhat.com>
 <875zdg26hp.fsf@x220.int.ebiederm.org>
 <b28c9e02-8cf2-33ae-646b-fe50a185738e@redhat.com>
In-Reply-To: <b28c9e02-8cf2-33ae-646b-fe50a185738e@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Apr 2020 11:58:16 -0700
Message-ID: <CAPcyv4j33bwbrFMu2L0knRGRN1RDiC5kbknMNEwo-OFmPSw47w@mail.gmail.com>
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

On Thu, Apr 30, 2020 at 11:44 AM David Hildenbrand <david@redhat.com> wrote:
>
>  >>> If the class of memory is different then please by all means let's mark
> >>> it differently in struct resource so everyone knows it is different.
> >>> But that difference needs to be more than hotplug.
> >>>
> >>> That difference needs to be the hypervisor loaned us memory and might
> >>> take it back at any time, or this memory is persistent and so it has
> >>> these different characteristics so don't use it as ordinary ram.
> >>
> >> Yes, and I think kmem took an excellent approach of explicitly putting
> >> that "System RAM" into a resource hierarchy. That "System RAM" won't
> >> show up as a root node under /proc/iomem (see patch #3), which already
> >> results in kexec-tools to treat it in a special way. I am thinking about
> >> doing the same for virtio-mem.
> >
> > Reading this and your patch cover letters again my concern is that
> > the justification seems to be letting the tail wag the dog.
> >
> > You want kexec-tools to behave in a certain way so you are changing the
> > kernel.
> >
> > Rather it should be change the kernel to clearly reflect reality and if
> > you can get away without a change to kexec-tools that is a bonus.
> >
>
> Right, because user space has to have a way to figure out what to do.
>
> But talking about the firmware memmap, indicating something via a "raw
> firmware-provided memory map", that is not actually in the "raw
> firmware-provided memory map" feels wrong to me. (below)
>
>
> >>> That information is also useful to other people looking at the system
> >>> and seeing what is going on.
> >>>
> >>> Just please don't muddle the concepts, or assume that whatever subset of
> >>> hotplug memory you are dealing with is the only subset.
> >>
> >> I can certainly rephrase the subject/description/comment, stating that
> >> this is not to be used for ordinary hotplugged DIMMs - only when the
> >> device driver is under control to decide what to do with that memory -
> >> especially when kexec'ing.
> >>
> >> (previously, I called this flag MHP_DRIVER_MANAGED, but I think
> >> MHP_NO_FIRMWARE_MEMMAP is clearer, we just need a better description)
> >>
> >> Would that make it clearer?
> >
> > I am not certain, but Andrew Morton deliberately added that
> > firmware_map_add_hotplug call.  Which means that there is a reason
> > for putting hotplugged memory in the firmware map.
> >
> > So the justification needs to take that reason into account.  The
> > justification can not be it is hotplugged therefore it should not belong
> > in the firmware memory map.  Unless you can show that
> > firmware_map_add_hotplug that was actually a bug and should be removed.
> > But as it has been that way since 2010 that seems like a long shot.
> >
> > So my question is what is right for the firmware map?
>
> We have documentation for that since 2008. Andrews patch is from 2010.
>
> Documentation/ABI/testing/sysfs-firmware-memmap
>
> It clearly talks about "raw firmware-provided memory map" and why the
> interface was introduced at all ("on most architectures that
> firmware-provided memory map is modified afterwards by the kernel itself").
>
> >
> > Why does the firmware map support hotplug entries?
>
> I assume:
>
> The firmware memmap was added primarily for x86-64 kexec (and still, is
> mostly used on x86-64 only IIRC). There, we had ACPI hotplug. When DIMMs
> get hotplugged on real HW, they get added to e820. Same applies to
> memory added via HyperV balloon (unless memory is unplugged via
> ballooning and you reboot ... the the e820 is changed as well). I assume
> we wanted to be able to reflect that, to make kexec look like a real reboot.

I can at least say that this breakdown makes sense to me. Traditional
memory hotplug results in permanent change to the raw firmware memory
map reported by the host at next reboot. These device-driver-owned
memory regions really want a hotplug policy per-kernel boot instance
and should fall back to the default reserved state at reboot (kexec or
otherwise). When I say hotplug-policy I mean whether the current
kernel wants to treat the device range as System RAM or leave it as
device-managed. The intent is that the follow-on kernel needs to
re-decide the device policy.

>
> This worked for a while. Then came dax/kmem. Now comes virtio-mem.
>
