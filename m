Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC01145D59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 21:53:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482yLB41y7zDqVV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 07:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=KTTat97k; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482yJ170DWzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 07:51:44 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id 59so603206otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sIoRmzHYTdpp+dqkgtOBAN7ncVHrjk3h+URxl69sPsU=;
 b=KTTat97kNuZvEUjvtDsTDzjPFUlG4KFZhZl+L6EC2PUatXH7uO7Fwgd4s6J58cZhN5
 gFfWgSMR9b8GP4PDwfSvlZvOzvYU7a8/5bet4UUOtnOoJDkm3Z2dEBjnwzrocD017Rf4
 Fi2e7cyAJ7RFuyunUhht5zqTEOrcAgKo8OuGKuibOv6MaxPQI6yH2gj1cQL4WVe9JLVb
 9suPZhEO9ZuVE+dk4q7RjQzz3bYS71BwsbbExkx8V/pfSsmMhU+Bm7J8DfdFJ7XNpM1K
 jE32TDYypZKfW0hhy389pFV0hc9k9hp2LMRDf2xco+fNCjphLs7c5CjBg9cy3okaphV1
 T2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sIoRmzHYTdpp+dqkgtOBAN7ncVHrjk3h+URxl69sPsU=;
 b=O5jSSYdeakkHlVO1AOymx72MFYgolF1lwIfkB3bys/9svtO6+PvzWoHGU0+3PAnsbr
 xhOADCQyjjiPGYNQlc/0ehfI8IhkthHAbK2DTRT6CHfYdJnt9AIeLsjOAZnzDIbwyDVn
 eg8Ih6GoEieDUGLSyAGxDcJ7Q48up5/VhCv7ZpyIPcyQT+i/PC/En+lpbpdEKvtjnoql
 NJxoidghPibAhOlxXqc4gnW5vd5qfDarPth9BaxG2/BjU8FZ/wJ11sh9KQ68nnK63GkF
 zgRAn3PKikdXeV30D40r4bqPDce4WF7A9rtcdCzusL81l0nqwWWGz3eOBKMuwl0hGHei
 hCtg==
X-Gm-Message-State: APjAAAV9Hb2RiAY60k1Zby4E6grFXcfdZRmx40hDj7iJp/8lJ7fI4ZFg
 bLJfo58YWZdQSktYEb/cYGqVA4H52VmhnIrAdVjwMQ==
X-Google-Smtp-Source: APXvYqw6v4/RiaBhyLB4WHjODSz1dAkLJtJwJGKbGaMd/yQZSfCSqgwxWgXkA77oncy7GPixkDTN6S48x5VwRtTkUVA=
X-Received: by 2002:a05:6830:4d9:: with SMTP id
 s25mr8907122otd.171.1579726300916; 
 Wed, 22 Jan 2020 12:51:40 -0800 (PST)
MIME-Version: 1.0
References: <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
 <20200121120714.GJ29276@dhcp22.suse.cz>
 <a29b49b9-28ad-44fa-6c0b-90cd43902f29@redhat.com>
 <20200122104230.GU29276@dhcp22.suse.cz>
 <98b6c208-b4dd-9052-43f6-543068c649cc@redhat.com>
 <816ddd66-c90b-76f1-f4a0-72fe41263edd@redhat.com>
 <20200122164618.GY29276@dhcp22.suse.cz>
 <626d344e-8243-c161-cd07-ed1276eba73d@redhat.com>
 <20200122183809.GB29276@dhcp22.suse.cz>
 <f35cbe9e-b8bf-127e-698f-d08972d30614@redhat.com>
 <20200122190903.GD29276@dhcp22.suse.cz>
In-Reply-To: <20200122190903.GD29276@dhcp22.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 22 Jan 2020 12:51:28 -0800
Message-ID: <CAPcyv4hrEKHFnPQwzU+NCNhC2Hfqxd440XbsxsHf4f6RhquJFQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
To: Michal Hocko <mhocko@kernel.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 David Hildenbrand <david@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 22, 2020 at 11:09 AM Michal Hocko <mhocko@kernel.org> wrote:
>
> On Wed 22-01-20 19:46:15, David Hildenbrand wrote:
> > On 22.01.20 19:38, Michal Hocko wrote:
> [...]
> > > How exactly is check + offline more optimal then offline which makes
> > > check as its first step? I will get to your later points after this is
> > > clarified.
> >
> > Scanning (almost) lockless is more efficient than bouncing back and
> > forth with the device_hotplug_lock, mem_hotplug_lock, cpu_hotplug_lock
> > and zone locks - as far as I understand.
>
> All but the zone lock shouldn't be really contended and as such
> shouldn't cause any troubles. zone->lock really depends on the page
> allocator usage of course. But as soon as we have a contention then it
> is just more likely that the result is less reliable.
>
> I would be also really curious about how much actual time could be saved
> by this - some real numbers - because hotplug operations shouldn't
> happen so often that this would stand out. At least that is my
> understanding.
>
> > And as far as I understood, that was the whole reason of the original
> > commit.
>
> Well, I have my doubts but it might be just me and I might be wrong. My
> experience from a large part of the memory hotplug functionality is that
> it was driven by a good intention but without a due diligence to think
> behind the most obvious usecase. Having a removable flag on the memblock
> sounds like a neat idea of course. But an inherently racy flag is just
> borderline useful.
>
> Anyway, I will stop at this moment and wait for real usecases.

...that and practical numbers showing that optimizing an interface
that can at best give rough estimate answers is worth the code change.
