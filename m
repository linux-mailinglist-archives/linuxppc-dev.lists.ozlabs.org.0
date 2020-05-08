Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6D1CA77D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 11:47:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JQTv3bzwzDr1D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 19:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=htiYjXUw; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=GNjBE3c4; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JQQV5JRwzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 19:44:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588931053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB8B9nMZ801LTv0eYMRXac4vYEFLiAr6bD2XMw8FWro=;
 b=htiYjXUwswRotR/vYcsquxxMIGdrIncXd4mU/sOhgR5n99YpIRMuGRn+4W/4AAphq5wFH1
 R25dhS10Tnk1jDw5OwL+/UWEtm7dnUu7dEB9KYoWvjqr0aqGGLW2WRCPdCYtteXwCe8/hx
 HvniK9FzyvqWkMuEKKbLCStXvb7coC0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588931054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB8B9nMZ801LTv0eYMRXac4vYEFLiAr6bD2XMw8FWro=;
 b=GNjBE3c4v5bFjo39Aie8ESDHuCUZJV5jw4Q/QOihDAao+GzQAQRRjIWM+SBhCtNDd6w/Rd
 nIUxIrn0Z9a0dvBVW223bn20eRv5hQDdxYNAMqhjTvKNA1y/GatWfwj4KadbmidxCa76jV
 1S7kdlrkR0lROUpp6aA6bdYGcd6D49c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-uapjCmw5NG26WuLoxAALvw-1; Fri, 08 May 2020 05:44:12 -0400
X-MC-Unique: uapjCmw5NG26WuLoxAALvw-1
Received: by mail-wm1-f71.google.com with SMTP id h184so4916707wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 May 2020 02:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LB8B9nMZ801LTv0eYMRXac4vYEFLiAr6bD2XMw8FWro=;
 b=pUKS17pEEwP7kQgPA5pC7ULLuYs8cAkq348vIDJUKOh8WR8nmY50l/bmKtXuK1tv2h
 GAg+e8kz2YI2S/G+FuK7c9rM7Idk3Eo5lCefyOOkCvxv4LLH9w2tbnxqYH+PRAB+1Yui
 o8jTSqh+u0DdIWP1meAFJRLMjSZR5/mtVnbK3zvdULb823c1/Mzq1Idv6P3YsD4QFtap
 1INku0Mh1rlS8akKxKr2yXqghQHBGv2y1agN33fY36oi67MkMFzivv3YpaQY610K1tCr
 smsd8zhG9NMsxdCEGpHA02mG79cAm0TUZUiW41JYLJwUZnDna9bPUPr130781Yg4iZnv
 npMA==
X-Gm-Message-State: AGi0Pub62OW/XNX0bS3Ifrey89t87Ekt9RjmxM+S2UeUxvOdqTDwhTMW
 8uw5rue0Ti4bCZyIk+fPqo5SbnJS+n+uMzxUaZOllMyRAT9+8DB/0+MLT3050KeRgkz7Z+8Cjrr
 NSc9b3KUdECeF0M5bRwo6/Dxzow==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr1883182wrt.270.1588931049114; 
 Fri, 08 May 2020 02:44:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJgPEJmExg9Eh0dPygYqOMxDwjDrVa8N6ORETYXOWrahJgijwXVH3Zlb8oI31fLimenfgopfg==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr1883147wrt.270.1588931048748; 
 Fri, 08 May 2020 02:44:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:20ea:bae4:47a7:31db?
 ([2001:b07:6468:f312:20ea:bae4:47a7:31db])
 by smtp.gmail.com with ESMTPSA id d27sm2213073wra.30.2020.05.08.02.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 02:44:08 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To: Jonathan Adams <jwadams@google.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
 <CA+VK+GN=iDhDV2ZDJbBsxrjZ3Qoyotk_L0DvsbwDVvqrpFZ8fQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <29982969-92f6-b6d0-aeae-22edb401e3ac@redhat.com>
Date: Fri, 8 May 2020 11:44:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+VK+GN=iDhDV2ZDJbBsxrjZ3Qoyotk_L0DvsbwDVvqrpFZ8fQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
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

[Answering for Emanuele because he's not available until Monday]

On 07/05/20 19:45, Jonathan Adams wrote:
> This is good work.  As David Rientjes mentioned, I'm currently investigating
> a similar project, based on a google-internal debugfs-based FS we call
> "metricfs".  It's
> designed in a slightly different fashion than statsfs here is, and the
> statistics exported are
> mostly fed into our OpenTelemetry-like system.  We're motivated by
> wanting an upstreamed solution, so that we can upstream the metrics we
> create that are of general interest, and lower the overall rebasing
> burden for our tree.

Cool.  We included a public reading API exactly so that there could be
other "frontends".  I was mostly thinking of BPF as an in-tree user, but
your metricfs could definitely use the reading API.

>  - the 8/16/32/64 signed/unsigned integers seems like a wart, and the
> built-in support to grab any offset from a structure doesn't seem like
> much of an advantage. A simpler interface would be to just support an> "integer" (possibly signed/unsigned) type, which is always 64-bit, and
> allow the caller to provide a function pointer to retrieve the value,
> with one or two void *s cbargs.  Then the framework could provide an
> offset-based callback (or callbacks) similar to the existing
> functionality, and a similar one for per-CPU based statistics.  A
> second "clear" callback could be optionally provided to allow for
> statistics to be cleared, as in your current proposal.

Ok, so basically splitting get_simple_value into many separate
callbacks.  The callbacks would be in a struct like

struct stats_fs_type {
	uint64_t (*get)(struct stats_fs_value *, void *);
	void (*clear)(struct stats_fs_value *, void *);
	bool signed;
}

static uint64_t stats_fs_get_u8(struct stats_fs_value *val, void *base)
{
	return *((uint8_t *)(base + (uintptr_t)val->arg);
}

static void stats_fs_clear_u8(struct stats_fs_value *val, void *base)
{
	*((uint8_t *)(base + (uintptr_t)val->arg) = 0;
}

struct stats_fs_type stats_fs_type_u8 = {
	stats_fs_get_u8,
	stats_fs_clear_u8,
	false
};

and custom types can be defined using "&(struct stats_fs_type) {...}".

>  - Beyond the statistic's type, one *very* useful piece of metadata
> for telemetry tools is knowing whether a given statistic is
> "cumulative" (an unsigned counter which is only ever increased), as
> opposed to a floating value (like "amount of memory used").

Good idea.  Also, clearing does not make sense for a floating value, so
we can use cumulative/floating to get a default for the mode: KVM
statistics for example are mostly cumulative and mode 644, except a few
that are floating and those are all mode 444.  Therefore it makes sense
to add cumulative/floating even before outputting it as metadata.

> I'm more
> concerned with getting the statistics model and capabilities right
> from the beginning, because those are harder to adjust later.

Agreed.

> 1. Each metricfs metric can have one or two string or integer "keys".
> If these exist, they expand the metric from a single value into a
> multi-dimensional table. For example, we use this to report a hash
> table we keep of functions calling "WARN()", in a 'warnings'
> statistic:
> 
> % cat .../warnings/values
> x86_pmu_stop 1
> %
>
> Indicates that the x86_pmu_stop() function has had a WARN() fire once
> since the system was booted.  If multiple functions have fired
> WARN()s, they are listed in this table with their own counts. [1]  We
> also use these to report per-CPU counters on a CPU-by-CPU basis:
> 
> % cat .../irq_x86/NMI/values
> 0 42
> 1 18
> ... one line per cpu
> % cat .../rx_bytes/values
> lo 501360681
> eth0 1457631256

These seem like two different things.

The percpu and per-interface values are best represented as subordinate
sources, one per CPU and one per interface.  For interfaces I would just
use a separate directory, but it doesn't really make sense for CPUs.  So
if we can cater for it in the model, it's better.  For example:

- add a new argument to statsfs_create_source and statsfs_create_values
that makes it not create directories and files respectively.

- add a new "aggregate function" STATS_FS_LIST that directs the parent
to build a table of all the simple values below it

We can also add a helper statsfs_add_values_percpu that creates a new
source for each CPU, I think.

The warnings one instead is a real hash table.  It should be possible to
implement it as some kind of customized aggregation, that is implemented
in the client instead of coming from subordinate sources.  The
presentation can then just use STATS_FS_LIST.  I don't see anything in
the design that is a blocker.

> 2.  We also export some metadata about each statistic.  For example,
> the metadata for the NMI counter above looks like:
> 
> % cat .../NMI/annotations
> DESCRIPTION Non-maskable\ interrupts
> CUMULATIVE
> % cat .../NMI/fields
> cpu value
> int int
> %

Good idea.  I would prefer per-directory dot-named files for this.  For
example a hypothetical statsfs version of /proc/interrupts could be like
this:

$ cat /sys/kernel/stats/interrupts/.schema
0                                          // Name
CUMULATIVE                                 // Flags
int:int                                    // Type(s)
IR-IO-APIC    2-edge      timer            // Description
...
LOC
CUMULATIVE
int:int
Local timer interrupts
...
$ cat /sys/kernel/stats/interrupts/LOC
0 4286815
1 4151572
2 4199361
3 4229248

> 3. We have a (very few) statistics where the value itself is a string,
> usually for device statuses.

Maybe in addition to CUMULATIVE and FLOATING we can have ENUM
properties, and a table to convert those enums to strings.  Aggregation
could also be used to make a histogram out of enums in subordinate
sources, e.g.

$ cat /sys/kernel/stats/kvm/637-1/vcpu_state
running 12
uninitialized 0
halted 4

So in general I'd say the sources/values model holds up.  We certainly
want to:

- switch immediately to callbacks instead of the type constants (so that
core statsfs code only does signed/unsigned)

- add a field to distinguish cumulative and floating properties (and use
it to determine the default file mode)

- add a new argument to statsfs_create_source and statsfs_create_values
that makes it not create directories and files respectively

- add a new API to look for a statsfs_value recursively in all the
subordinate sources, and pass the source/value pair to a callback
function; and reimplement recursive aggregation and clear in terms of
this function.

> For our use cases, we generally don't both output a statistic and it's
> aggregation from the kernel; either we sum up things in the kernel
> (e.g. over a bunch of per-cpu or per-memcg counters) and only have the
> result statistic, or we expect user-space to sum up the data if it's
> interested.  The tabular form makes it pretty easy to do so (i.e. you
> can use awk(1) to sum all of the per-cpu NMI counters).

Yep, the above "not create a dentry" flag would handle the case where
you sum things up in the kernel because the more fine grained counters
would be overwhelming.

Paolo

