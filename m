Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16441228CBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:37:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBFQD1yFSzDqlc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:37:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20150623.gappssmtp.com
 header.i=@dabbelt-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=p+44Z+4/; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBFNb53LpzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 09:36:30 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id z5so207481pgb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 16:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4/y9Kml4kEgPy1nuHtQbnnn9hcon0j83gAhPQ/a7NVI=;
 b=p+44Z+4/ckHHF+GAQ4A2skbeyMPVgmukHh3fOKGwTQemnwSJ6GxWjmD7CZ9Tw+uoJe
 GrUYmrFsqB+Hxkn7XtjCnb3UIrgRDrYn351sxhMdvuu4nXXNBn+qXFhFVl67IbZhW/Uu
 pRFAxMYa06+em/bBZD0yxobDqZsaNeeyw2g4ArOeEsHrhQN0KddMoF7MB2BKEIGtTJcy
 Jn+T+wIhbtgRqr8e1vInERFXLi6qwBfiacu3vAtXQ5F2bwo26NHVG0utrKaT49FR+mls
 iSrY01VlGtHRpaIjgBftwYPk40xsrwfXm20K9WwRb/Y4HrOgsQjLMe7fxj5f3vvq/s3T
 WLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4/y9Kml4kEgPy1nuHtQbnnn9hcon0j83gAhPQ/a7NVI=;
 b=ahqlyt8khP7vEBukQyzO22Fz87kY0ETJBbWRhYXHLL3zpVvD0jxcLGSZrkfxItjlCR
 SlW1jK3O+ZKFKcii5C/NkzOu+Ye+yquL/q4pU3aJLi0cKCpg0K1kCEqrE0sRqVr/Bcw+
 tD5oQGVh7iM/Ejmhv4u7BiYpENN98XfohY64Td/XBwTFnveKAtZ2Ab7XtEBCgSkoKow1
 +bFlKeCYKJEyaapenxSwS71Io1P/MLn0G1ze8E9IYf7QaA2qGPvJ+ELHCirodKHWeqEl
 yX2MSHKKBURykAmiSxxz0D5TcxU3UdSv9rjoO3Ikeq6IBGZ4Ou2e+fB61wO0+qJo1YJQ
 fTWQ==
X-Gm-Message-State: AOAM5322szVtZwuSLUv+kct5RzsvIDusmBrhXZnE1K2fqC9kIfwdwRnb
 cXDtU7cnHBS4jCQ1I4uJLb0l9w==
X-Google-Smtp-Source: ABdhPJzB67n3W2mkqzOSwKaM1AJtP/MeBDuysfieMDV8LWATOje0NdcZ9GK0r2Z3+Gk+qzhNM2jtKw==
X-Received: by 2002:a62:8782:: with SMTP id
 i124mr26134197pfe.267.1595374587183; 
 Tue, 21 Jul 2020 16:36:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d24sm4115944pjx.36.2020.07.21.16.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 16:36:26 -0700 (PDT)
Date: Tue, 21 Jul 2020 16:36:26 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 16:36:24 PDT (-0700)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
In-Reply-To: <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: benh@kernel.crashing.org
Message-ID: <mhng-4b49d09a-0267-4879-849f-30c24f26e2c3@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-mm@kvack.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Jul 2020 16:11:02 PDT (-0700), benh@kernel.crashing.org wrote:
> On Tue, 2020-07-21 at 14:36 -0400, Alex Ghiti wrote:
>> > > I guess I don't understand why this is necessary at all.
>> > > Specifically: why
>> > > can't we just relocate the kernel within the linear map?  That would
>> > > let the
>> > > bootloader put the kernel wherever it wants, modulo the physical
>> > > memory size we
>> > > support.  We'd need to handle the regions that are coupled to the
>> > > kernel's
>> > > execution address, but we could just put them in an explicit memory
>> > > region
>> > > which is what we should probably be doing anyway.
>> >
>> > Virtual relocation in the linear mapping requires to move the kernel
>> > physically too. Zong implemented this physical move in its KASLR RFC
>> > patchset, which is cumbersome since finding an available physical spot
>> > is harder than just selecting a virtual range in the vmalloc range.
>> >
>> > In addition, having the kernel mapping in the linear mapping prevents
>> > the use of hugepage for the linear mapping resulting in performance loss
>> > (at least for the GB that encompasses the kernel).
>> >
>> > Why do you find this "ugly" ? The vmalloc region is just a bunch of
>> > available virtual addresses to whatever purpose we want, and as noted by
>> > Zong, arm64 uses the same scheme.
>
> I don't get it :-)
>
> At least on powerpc we move the kernel in the linear mapping and it
> works fine with huge pages, what is your problem there ? You rely on
> punching small-page size holes in there ?

That was my original suggestion, and I'm not actually sure it's invalid.  It
would mean that both the kernel's physical and virtual addresses are set by the
bootloader, which may or may not be workable if we want to have an sv48+sv39
kernel.  My initial approach to sv48+sv39 kernels would be to just throw away
the sv39 memory on sv48 kernels, which would preserve the linear map but mean
that there is no single physical address that's accessible for both.  That
would require some coordination between the bootloader and the kernel as to
where it should be loaded, but maybe there's a better way to design the linear
map.  Right now we have a bunch of unwritten rules about where things need to
be loaded, which is a recipe for disaster.

We could copy the kernel around, but I'm not sure I really like that idea.  We
do zero the BSS right now, so it's not like we entirely rely on the bootloader
to set up the kernel image, but with the hart race boot scheme we have right
now we'd at least need to leave a stub sitting around.  Maybe we just throw
away SBI v0.1, though, that's why we called it all legacy in the first place.

My bigger worry is that anything that involves running the kernel at arbitrary
virtual addresses means we need a PIC kernel, which means every global symbol
needs an indirection.  That's probably not so bad for shared libraries, but the
kernel has a lot of global symbols.  PLT references probably aren't so scary,
as we have an incoherent instruction cache so the virtual function predictor
isn't that hard to build, but making all global data accesses GOT-relative
seems like a disaster for performance.  This fixed-VA thing really just exists
so we don't have to be full-on PIC.

In theory I think we could just get away with pretending that medany is PIC,
which I believe works as long as the data and text offset stays constant, you
you don't have any symbols between 2GiB and -2GiB (as those may stay fixed,
even in medany), and you deal with GP accordingly (which should work itself out
in the current startup code).  We rely on this for some of the early boot code
(and will soon for kexec), but that's a very controlled code base and we've
already had some issues.  I'd be much more comfortable adding an explicit
semi-PIC code model, as I tend to miss something when doing these sorts of
things and then we could at least add it to the GCC test runs and guarantee it
actually works.  Not really sure I want to deal with that, though.  It would,
however, be the only way to get random virtual addresses during kernel
execution.

> At least in the old days, there were a number of assumptions that
> the kernel text/data/bss resides in the linear mapping.

Ya, it terrified me as well.  Alex says arm64 puts the kernel in the vmalloc
region, so assuming that's the case it must be possible.  I didn't get that
from reading the arm64 port (I guess it's no secret that pretty much all I do
is copy their code)

> If you change that you need to ensure that it's still physically
> contiguous and you'll have to tweak __va and __pa, which might induce
> extra overhead.

I'm operating under the assumption that we don't want to add an additional load
to virt2phys conversions.  arm64 bends over backwards to avoid the load, and
I'm assuming they have a reason for doing so.  Of course, if we're PIC then
maybe performance just doesn't matter, but I'm not sure I want to just give up.
Distros will probably build the sv48+sv39 kernels as soon as they show up, even
if there's no sv48 hardware for a while.
