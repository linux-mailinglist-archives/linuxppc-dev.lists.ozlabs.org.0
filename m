Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D3101A89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 08:54:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HJ4L3m2mzDqTM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 18:54:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=prabhakar.pkin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sifSK6MU"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HGGl1bS4zDqYK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:32:59 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id 1so21893047iou.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 22:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=NXaQYQk0g4GZrnX0H+C5/sQj56d3X20l4tE5DHhQOrA=;
 b=sifSK6MU7G+EcqYvJSuSa2S3hMP9SB6t7e29d7KHAyYYgBX4YqD7x0RtWHSqj7x64T
 UCnhKrr5Oiz+XULwu7eB1ZzOI6VyeAHiAbd+ovtLWxxuyjZjQERBAwrzjvdoMJrtvL2X
 OuCAUcEOqMXV21HuTt3LYU4PJ7a9/zwV0cPSFw8iKelRg6k0kRED6h1IpqHOT34kW5Dv
 V+F06IQt2Mi5Kauqgd6BFTTPOuzVSntsEr/Hz/LVi2r7g9MduWF7OaGr1l12AxH8Pw4y
 IkHXTj8+xHCrm+IKudRyf5hLWkkP4WKgN+znsqikOz7kNlhe0ebhtZo0RHJwK0BSQojS
 kitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=NXaQYQk0g4GZrnX0H+C5/sQj56d3X20l4tE5DHhQOrA=;
 b=Cn3SCpYmUKrjiWcn7rmGXNUZptY3RdQf7itS0OAJ6PMaUhxCfxBEd8SPUvg8v9t3P+
 NuxWogdg/l4k63dwtJ1fSV1J4gGqXwaPZeCT1IEVpiuRVBpDF/bXBPNqKcCvH27diJYO
 FW00f/koIQ0NK934q3pkBdJy2MT4GuOgtYKcC9ZUOZ9dIWSqJh5FjBhsAl/W6V6bpThZ
 e5nxnuM2UKOsAs2K2YdNMOOIzAVSS53RtEk8qEfo/65mcY37xpfSCXNUwLPLthGuUd0x
 gr5WUYk0PlF1T7dJ1OHxvHTNWy1mBnNpomjzX17pmcguEKVgLXhI5mna+ixTTOY6J0Qt
 rWzw==
X-Gm-Message-State: APjAAAUeP1ZFlZzEPAn4UpESumEx+OxPKy7hlOYUozauP2r1kjkI9mJi
 2vZSMfJXDhlWed2ur9MYjmrhi9aPKXHXojdJVq4=
X-Google-Smtp-Source: APXvYqxsiN2r32tu6Vr3FT387ecd9RsbnxXZTJSYF8E4DcxZPX/OBCeKQumlgww/wRDUDEfuWrt3IfZaSkRqJ6CTjKM=
X-Received: by 2002:a02:b48:: with SMTP id 69mr17013960jad.25.1574145177173;
 Mon, 18 Nov 2019 22:32:57 -0800 (PST)
MIME-Version: 1.0
References: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
 <20191113063858.GE22427@linaro.org>
 <CACi5LpP54d9DKW63G5W6X4euBjAm2NwkHOiM01dB7g8d60s=4w@mail.gmail.com>
 <20191115015959.GI22427@linaro.org>
In-Reply-To: <20191115015959.GI22427@linaro.org>
From: Prabhakar Kushwaha <prabhakar.pkin@gmail.com>
Date: Tue, 19 Nov 2019 12:02:46 +0530
Message-ID: <CAJ2QiJJOSspLKRh+jRB_o0o9nmeAsiFKzxGJ8R0pYPRM4iptmw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Bhupesh Sharma <bhsharma@redhat.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>, 
 Boris Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, James Morse <james.morse@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Steve Capper <steve.capper@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Dave Anderson <anderson@redhat.com>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 kexec mailing list <kexec@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 19 Nov 2019 18:35:41 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Akashi,

On Fri, Nov 15, 2019 at 7:29 AM AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:
>
> Bhupesh,
>
> On Fri, Nov 15, 2019 at 01:24:17AM +0530, Bhupesh Sharma wrote:
> > Hi Akashi,
> >
> > On Wed, Nov 13, 2019 at 12:11 PM AKASHI Takahiro
> > <takahiro.akashi@linaro.org> wrote:
> > >
> > > Hi Bhupesh,
> > >
> > > Do you have a corresponding patch for userspace tools,
> > > including crash util and/or makedumpfile?
> > > Otherwise, we can't verify that a generated core file is
> > > correctly handled.
> >
> > Sure. I am still working on the crash-utility related changes, but you
> > can find the makedumpfile changes I posted a couple of days ago here
> > (see [0]) and the github link for the makedumpfile changes can be seen
> > via [1].
> >
> > I will post the crash-util changes shortly as well.
> > Thanks for having a look at the same.
>
> Thank you.
> I have tested my kdump patch with a hacked version of crash
> where VA_BITS_ACTUAL is calculated from tcr_el1_t1sz in vmcoreinfo.
>

I also did hack to calculate VA_BITS_ACTUAL is calculated from
tcr_el1_t1sz in vmcoreinfo. Now i am getting error same as mentioned
by you in other thread last month.
https://www.mail-archive.com/crash-utility@redhat.com/msg07385.html

how this error was overcome?

I am using
 - crashkernel: https://github.com/crash-utility/crash.git  commit:
babd7ae62d4e8fd6f93fd30b88040d9376522aa3
and
 - Linux: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
commit: af42d3466bdc8f39806b26f593604fdc54140bcb

--pk
