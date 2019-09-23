Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC96BAD01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 06:16:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46c9xb5PqGzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 14:16:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nwaSJ039"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46c9vj5yJ0zDqDF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 14:14:55 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id b136so30168550iof.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2019 21:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxlkri8iTZ6op1DPH/fdxCtEyWTUyMc8H/zzMN3y2h0=;
 b=nwaSJ039kb6cjx1GbqduqvZnzrpVIpR+qy1Ssd1FslfHstWd5ikR5tUI5AtmKWqt7Q
 nt+7cMcVUsNozeDq45PhVDYbmxzsfwrkLoitaSwU7P9UHGnxElJwKdeP2+3Wqkg0yz/a
 Ziib94fDIqmOh18/XNvS8eukpRF2tUP3XdSfz++YdhUp7LEQyNezpMTHeplXYjcma/2P
 4MfJ4y+XXQOqN/KBwx3C5DeAXtm80aPRhwH9Bllrf1lTxwthITP9n0ne/2AX1a4WaMv+
 q3Klh9013I9CQ9zSJAHK0N+GGcFVx4F1T2uhRSv7EAkjHkvhzmTQ8N11kyWh7pLRh70u
 1+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxlkri8iTZ6op1DPH/fdxCtEyWTUyMc8H/zzMN3y2h0=;
 b=InYF2k0NgNSxK0hucgxK3IbHbZRrrlwZKZExwMHuv5JzIiZajoUh6tuFsqW1gAM8fF
 tLyjO1DvSoxy0rlWcQ4f5+6APZG0l9U4n4ulm7ydrtNzijnjb2j/RGaW+LAYORQzM5qz
 ATDcix4IKkK1kjRWU8n7IVyjPDhTW5EUi3tfd5GFUGx+s2Ip4Tv+WdcqarKmLQNfO6wo
 lGHs0skutx1TmVuOVOkHiQEQjlBpu3SGID+Rep0sSIpNh4XgVNR+VBYGom5Ei7JO9Z4q
 r32VctdUYSHVIjCPNfkEP/gotHpTkTWyZGQ9+3h1uG0hLB1mjVKwxLnZBlkZtak9Rc7M
 o4yw==
X-Gm-Message-State: APjAAAUPnAHsbfgkMbYucl5lJOezIAG8flQpNWz9h+qz9JB1pc5Z1enx
 8EH3wrsl2g7ithQjFtPOWp8RUetJ3Ls1Ys1NTrb6EjE=
X-Google-Smtp-Source: APXvYqw6HXqqqaJ6Ox6sSGQo69D1cLH81IStZrnvANht5v3jq0a24ntUUozA3mIqhEy0eJdlOtkAIYlp7HGTe/2azdI=
X-Received: by 2002:a05:6638:294:: with SMTP id
 c20mr33929106jaq.77.1569212091683; 
 Sun, 22 Sep 2019 21:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <1568256617-14030-1-git-send-email-kernelfans@gmail.com>
 <CAFgQCTvKpPEP1UywcGcC2Mo4mzzZR+ff7M3L9QN_U+hfk31ijQ@mail.gmail.com>
 <87a7b1x303.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a7b1x303.fsf@mpe.ellerman.id.au>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 23 Sep 2019 12:14:40 +0800
Message-ID: <CAFgQCTu4eU4xXOqgySmdZhOW-FtgoAFhVbvVHakWGY7k+9JwKA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/crashkernel: take mem option into account
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 18, 2019 at 7:23 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Pingfan Liu <kernelfans@gmail.com> writes:
> > Cc Kexec list. And keep the original content.
> >
> > On Thu, Sep 12, 2019 at 10:50 AM Pingfan Liu <kernelfans@gmail.com> wrote:
> >>
> >> 'mem=" option is an easy way to put high pressure on memory during some
> >> test. Hence in stead of total mem, the effective usable memory size
>                ^                          ^
>                instead                    "actual" would be clearer
>
> I think adding: "after applying the memory limit"
>
> would help here.
>
> >> should be considered when reserving mem for crashkernel. Otherwise
> >> the boot up may experience oom issue.
>                               ^
>                               OOM
> >>
> >> E.g passing
> >> crashkernel="2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G", and
> >> mem=5G on a 256G machine.
>
> Spelling out the behaviour before and after would help here, eg:
>
> .. "would reserve 4G prior to the change and 512M afterward."
>
Thanks for kindly review. I will update the commit based on your suggestion.
>
> >> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> >> Cc: Hari Bathini <hbathini@linux.ibm.com>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> To: linuxppc-dev@lists.ozlabs.org
> >> ---
> >> v1 -> v2: fix the printk info about the total mem
> >>  arch/powerpc/kernel/machine_kexec.c | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
> >> index c4ed328..eec96dc 100644
> >> --- a/arch/powerpc/kernel/machine_kexec.c
> >> +++ b/arch/powerpc/kernel/machine_kexec.c
> >> @@ -114,11 +114,12 @@ void machine_kexec(struct kimage *image)
> >>
> >>  void __init reserve_crashkernel(void)
> >>  {
> >> -       unsigned long long crash_size, crash_base;
> >> +       unsigned long long crash_size, crash_base, total_mem_sz;
> >>         int ret;
> >>
> >> +       total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
> >>         /* use common parsing */
> >> -       ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> >> +       ret = parse_crashkernel(boot_command_line, total_mem_sz,
> >>                         &crash_size, &crash_base);
>
> I think this change makes sense. But we have multiple arches that
> implement similar logic, and I wonder if we should keep them all the
> same.
>
> eg:
>
>   arch/arm/kernel/setup.c:                ret = parse_crashkernel(boot_command_line, total_mem,
>   arch/arm64/mm/init.c:                   ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>   arch/ia64/kernel/setup.c:               ret = parse_crashkernel(boot_command_line, total,
>   arch/mips/kernel/setup.c:               ret = parse_crashkernel(boot_command_line, total_mem,
>   arch/powerpc/kernel/fadump.c:           ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>   arch/powerpc/kernel/machine_kexec.c:    ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>   arch/s390/kernel/setup.c:               rc = parse_crashkernel(boot_command_line, memory_end, &crash_size,
>   arch/sh/kernel/machine_kexec.c:         ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>   arch/x86/kernel/setup.c:                ret = parse_crashkernel(boot_command_line, total_mem, &crash_size, &crash_base);
>
>
> From a quick glance most of them don't seem to take the memory limit
> into account.
>
> So I guess the question is do we want all arches to implement the same
> behaviour or do we think it doesn't matter if they differ in details
> like this?

On powerpc, the current code make fadump/kdump a higher priority than
"mem=" option, as the notes in fadump_reserve_mem() says
"
        /*
         * Calculate the memory boundary.
         * If memory_limit is less than actual memory boundary then reserve
         * the memory for fadump beyond the memory_limit and adjust the
         * memory_limit accordingly, so that the running kernel can run with
         * specified memory_limit.
         */
"

While on other archs, they pack "mem=" info into memblock before
calling memblock_phys_mem_size(). So when parse_crashkernel() calls
memblock_phys_mem_size(), the "mem=" takes effect.

E.g for x86 in arch/x86/kernel/e820.c
static int __init parse_memopt(char *p)
{
...
e820__range_remove(mem_size, ULLONG_MAX - mem_size, E820_TYPE_RAM, 1);
// this pack the "mem=" info into e820, and is finally feed to
memblock
}

Thanks,
Pingfan
