Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C51D3872
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 19:38:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NJfj32zTzDqdn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 03:38:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=jwadams@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mPqdiSif; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NJcL69xQzDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 03:36:16 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id w18so4119210ilm.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=laayNMnmOVsy26th4W6U6fTp63iOfmzV8Vb77JU5OjI=;
 b=mPqdiSifcuRBMG5EPyS7l9qsCIzwPKTczEG9bPI/UiTe4KjZsr4TADsF5d4qN1I1+b
 UfC2tsMTtkz5tmVqI35Wx7fsq4ykek5JDOB/S27rZXnr77VBWjBaW2LPOGc3uxHaj59w
 xKPZFquBPsORRYOCxrZi72WmXGJVEJw95smneUGO0yc11Atjg5j6uWGpcQFiyBqwDWvc
 kApY9nSz0fg6GONFTPMTXBezB5H3IebBMs8n2/7xOyq4nhd8a+KkQOsedcSxmsgKqPb3
 9/V6g72Jvw6Me4QKQZq9eWjrpZRKoK6iCygdJcgPyyrI2XIJ8EQUjPYoUS2eh9LWNR/o
 aObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=laayNMnmOVsy26th4W6U6fTp63iOfmzV8Vb77JU5OjI=;
 b=so3HVWAR8Rbw/qLc4ZXoLyVO70Vab+VO4/PYNIEteySPKorm6CAXAi6dpgU5+eQWFa
 /JI5BOPtYMk5WAcs9OvlTSYL0dlKirlfCpBD5MlhnBassUuy7v63i0J5gddOpS6dO6Lh
 dmHkRapfzfiaLtpFHDhhYz2lc6+UpIqQSQpusua+4Kqok7d33R4KyzT3RywV9yIhWubH
 0C72Yd8S1yq1I/N+IvHgXeGQ8Q+fnF+hNuT0cIzD8aIPBfzcWOm2ytx4QcytTb+Ff4L+
 32HcA4DIoSiOE4DjD6oqNy1rTvdlya6NQl92NXFicR4SRDuxO2W+CQ/vfQ/GjOGh9CHJ
 ayvQ==
X-Gm-Message-State: AOAM531YDneTYHBiBwY97Xjn13wjReAwYTKBJxcicbFKP5wjTzbv2b7b
 KX9JlOJAhD6nh2L/7QdEdn4F+9ih3xkhM1R7yFJq
X-Google-Smtp-Source: ABdhPJz0ppakynZnDNr1oGJklp9r+6+UsPiLnLzitHvsOzAq27IiH+96KfmBDqX4cg4cxp48dbrbcuA9lHjM0QZWX7k=
X-Received: by 2002:a92:4a0d:: with SMTP id m13mr5529000ilf.98.1589477772346; 
 Thu, 14 May 2020 10:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200504110344.17560-1-eesposit@redhat.com>
 <CA+VK+GN=iDhDV2ZDJbBsxrjZ3Qoyotk_L0DvsbwDVvqrpFZ8fQ@mail.gmail.com>
 <29982969-92f6-b6d0-aeae-22edb401e3ac@redhat.com>
 <CA+VK+GOccmwVov9Fx1eMZkzivBduWRuoyAuCRtjMfM4LemRkgw@mail.gmail.com>
 <fe21094c-bdb0-b802-482e-72bc17e5232a@redhat.com>
In-Reply-To: <fe21094c-bdb0-b802-482e-72bc17e5232a@redhat.com>
From: Jonathan Adams <jwadams@google.com>
Date: Thu, 14 May 2020 10:35:35 -0700
Message-ID: <CA+VK+GOnVK23X+J-VVWUK6VVpkeVOvsmQAw=HAf89h_ksYM9Rg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 11, 2020 at 10:34 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Hi Jonathan, I think the remaining sticky point is this one:

Apologies it took a couple days for me to respond; I wanted to finish
evaluating our current usage to make sure I had a full picture; I'll
summarize our state at the bottom.

> On 11/05/20 19:02, Jonathan Adams wrote:
> > I think I'd characterize this slightly differently; we have a set of
> > statistics which are essentially "in parallel":
> >
> >   - a variety of statistics, N CPUs they're available for, or
> >   - a variety of statistics, N interfaces they're available for.
> >   - a variety of statistics, N kvm object they're available for.
> >
> > Recreating a parallel hierarchy of statistics any time we add/subtract
> > a CPU or interface seems like a lot of overhead.  Perhaps a better
> > model would be some sort of "parameter enumn" (naming is hard;
> > parameter set?), so when a CPU/network interface/etc is added you'd
> > add its ID to the "CPUs" we know about, and at removal time you'd
> > take it out; it would have an associated cbarg for the value getting
> > callback.
> >
> >> Yep, the above "not create a dentry" flag would handle the case where
> >> you sum things up in the kernel because the more fine grained counters
> >> would be overwhelming.
> >
> > nodnod; or the callback could handle the sum itself.
>
> In general for statsfs we took a more explicit approach where each
> addend in a sum is a separate stats_fs_source.  In this version of the
> patches it's also a directory, but we'll take your feedback and add both
> the ability to hide directories (first) and to list values (second).
>
> So, in the cases of interfaces and KVM objects I would prefer to keep
> each addend separate.

This just feels like a lot of churn just to add a statistic or object;
in your model, every time a KVM or VCPU is created, you create the N
statistics, leading to N*M total objects.  As I was imagining it,
you'd have:

    A 'parameter enum' which maps names to object pointers and
    A set of statistics which map a statfs path to {callback, cbarg,
zero or more parameter enums}

So adding a new KVM VCPU would just be "add an object to the KVM's
VCPU parameter enum", and removing it would be the opposite, and a
couple callbacks could handle basically all of the stats.   The only
tricky part would be making sure the parameter enum value
create/destroy and the callback calls are coordinated correctly.

If you wanted stats for a particular VCPU, we could mark the overall
directory as "include subdirs for VCPU parameter", and you'd
automatically get one directory per VCPU, with the same set of stats
in it, constrained to the single VCPU.  I could also imagine having an
".agg_sum/{stata,statb,...}" to report using the aggregations you
have, or a mode to say "stats in this directory are sums over the
following VCPU parameter".

> For CPUs that however would be pretty bad.  Many subsystems might
> accumulate stats percpu for performance reason, which would then be
> exposed as the sum (usually).  So yeah, native handling of percpu values
> makes sense.  I think it should fit naturally into the same custom
> aggregation framework as hash table keys, we'll see if there's any devil
> in the details.
>
> Core kernel stats such as /proc/interrupts or /proc/stat are the
> exception here, since individual per-CPU values can be vital for
> debugging.  For those, creating a source per stat, possibly on-the-fly
> at hotplug/hot-unplug time because NR_CPUS can be huge, would still be
> my preferred way to do it.

Our metricfs has basically two modes: report all per-CPU values (for
the IPI counts etc; you pass a callback which takes a 'int cpu'
argument) or a callback that sums over CPUs and reports the full
value.  It also seems hard to have any subsystem with a per-CPU stat
having to install a hotplug callback to add/remove statistics.

In my model, a "CPU" parameter enum which is automatically kept
up-to-date is probably sufficient for the "report all per-CPU values".

Does this make sense to you?  I realize that this is a significant
change to the model y'all are starting with; I'm willing to do the
work to flesh it out.

Thanks for your time,
- Jonathan

P.S.  Here's a summary of the types of statistics we use in metricfs
in google, to give a little context:

- integer values (single value per stat, source also a single value);
a couple of these are boolean values exported as '0' or '1'.
- per-CPU integer values, reported as a <cpuid, value> table
- per-CPU integer values, summed and reported as an aggregate
- single-value values, keys related to objects:
    - many per-device (disk, network, etc) integer stats
    - some per-device string data (version strings, UUIDs, and
occasional statuses.)
- a few histograms (usually counts by duration ranges)
- the "function name" to count for the WARN statistic I mentioned.
- A single statistic with two keys (for livepatch statistics; the
value is the livepatch status as a string)

Most of the stats with keys are "complete" (every key has a value),
but there are several examples of statistics where only some of the
possible keys have values, or (e.g. for networking statistics) only
the keys visible to the reading process (e.g. in its namespaces) are
included.
