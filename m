Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 791621BF2FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 10:36:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CTHf0MXDzDrL2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 18:36:14 +1000 (AEST)
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
 header.s=20150623 header.b=C7NzSwQe; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CTFX2tYJzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 18:34:17 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id gr25so3973515ejb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=87dIcS/jrU3IxflLIkdtnvU4qll0iHvEZNuLGZ4o7wI=;
 b=C7NzSwQeQ8r7hb6zu0mE43nN5BVsWOZy21t9s86oMspwPoqNG+2r9QwYXMI253bkO+
 f2NXbqJEZlVUDXw2jKOJXTdMksOMSeCU/1+d1/KW3kPK6bDnIkjaV85ydvslVx7+7VaK
 H/Wy8s3jtrbog9dFPbt+U8g4F9a/kPxAFzoHfDtTpSCDud/nTiDKxbIHNOx4gDT1cWli
 scShmtfTOkTf1D6LztaDjOZAMAIUOcl9E1Ehg4s+icpPrmffJn6TfhOtMJuuVZZemCWo
 u5q8IaOdIkls7C87+V/X7frCMtH72XB/et/faVXvhnFad5uP3/TQ8BbSLNTCllAusarT
 BwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=87dIcS/jrU3IxflLIkdtnvU4qll0iHvEZNuLGZ4o7wI=;
 b=n7WxoI49414U8BxJFHL3KNmlW6EnnKcH1eNCpprujFONfcbeYqycNwEKHSbUg4rUu6
 Yd7wdV35LnyErEhUG5cae87CjFYm+FFpcmRgNchHC+5ARwEFluwNxMiCwktXlyTC1XE0
 jn/1OmWhAN6/Ii2cayf0LQhxVI4lOqP1O15vVdiuLHVNx6AwaBYkS1GI/3aLhiRoCCgp
 OCZGlW8bBJ1YkNGhOdWtk1oxuAzJY4uZdvpqqKyMyuMUlt5vE2VRXjuuS8QL5Qa4U8+9
 gM+4FODm/JLGFhniqQUT8GTPnIRUqRKSAtieduJlMjFbkWMAHRjcMiXaJTC6ZvSM3u79
 BYQQ==
X-Gm-Message-State: AGi0PuYa2SLorTJe6OCJkKVkPjRVCFO5PdE2fmpF5rka7h7giBCyv6wS
 vombHWBb8+p9nOOcQiZ6Xn148vC8JxeUH1J3WHk6oA==
X-Google-Smtp-Source: APiQypLBVztlIIHfr3wCtEt+MVa/TaJHl/O1nuNqStB0TwAKkS6wTTbCgFJlPXMDG8iI601GTPaB481cRsH+FNdImHY=
X-Received: by 2002:a17:906:7750:: with SMTP id
 o16mr1715515ejn.12.1588235651152; 
 Thu, 30 Apr 2020 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200429160803.109056-1-david@redhat.com>
 <20200429160803.109056-3-david@redhat.com>
 <a7305cd8-8b2f-1d8f-7654-ecf777c46df6@redhat.com>
 <CAPcyv4i04+QLxiOyz04_eef2DFetEFKBUmi2A4xxw9abQD8hNQ@mail.gmail.com>
 <e32522cd-31bb-e129-47a6-9ec13b570506@redhat.com>
In-Reply-To: <e32522cd-31bb-e129-47a6-9ec13b570506@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Apr 2020 01:34:00 -0700
Message-ID: <CAPcyv4gjRE23BHsBAnaVWAPUHWdenxYMUwDBnDF7UmoejmmbNQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: Introduce MHP_DRIVER_MANAGED
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
 Michal Hocko <mhocko@suse.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Baoquan He <bhe@redhat.com>, Linux MM <linux-mm@kvack.org>,
 Wei Yang <richard.weiyang@gmail.com>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 30, 2020 at 1:21 AM David Hildenbrand <david@redhat.com> wrote:
> >> Just because we decided to use some DAX memory in the current kernel as
> >> system ram, doesn't mean we should make that decision for the kexec
> >> kernel (e.g., using it as initial memory, placing kexec binaries onto
> >> it, etc.). This is also not what we would observe during a real reboot.
> >
> > Agree.
> >
> >> I can see that the "System RAM" resource will show up as child resource
> >> under the device e.g., in /proc/iomem.
> >>
> >> However, entries in /sys/firmware/memmap/ are created as "System RAM".
> >
> > True. Do you think this rename should just be limited to what type
> > /sys/firmware/memmap/ emits? I have the concern, but no proof
>
> We could split this patch into
>
> MHP_NO_FIRMWARE_MEMMAP (create firmware memmap entries)
>
> and
>
> MHP_DRIVER_MANAGED (name of the resource)
>
> See below, the latter might not be needed.
>
> > currently, that there are /proc/iomem walkers that explicitly look for
> > "System RAM", but might be thrown off by "System RAM (driver
> > managed)". I was not aware of /sys/firmware/memmap until about 5
> > minutes ago.
>
> The only two users of /proc/iomem I am aware of are kexec-tools and some
> s390x tools.
>
> kexec-tools on x86-64 uses /sys/firmware/memmap to craft the initial
> memmap, but uses /proc/iomem to
> a) Find places for kexec images
> b) Detect memory regions to dump via kdump
>
> I am not yet sure if we really need the "System RAM (driver managed)"
> part. If we can teach kexec-tools to
> a) Don't place kexec images on "System RAM" that has a parent resource
> (most likely requires kexec-tools changes)
> b) Consider for kdump "System RAM" that has a parent resource
> we might be able to avoid renaming that. (I assume that's already done)
>
> E.g., regarding virtio-mem (patch #3) I am currently also looking into
> creating a parent resource instead, like dax/kmem to avoid the rename:
>
> :/# cat /proc/iomem
> 00000000-00000fff : Reserved
> [...]
> 100000000-13fffffff : System RAM
> 140000000-33fffffff : virtio0
>   140000000-147ffffff : System RAM
>   148000000-14fffffff : System RAM
>   150000000-157ffffff : System RAM
> 340000000-303fffffff : virtio1
>   340000000-347ffffff : System RAM
> 3280000000-32ffffffff : PCI Bus 0000:00

Looks good to me if it flies with kexec-tools.
