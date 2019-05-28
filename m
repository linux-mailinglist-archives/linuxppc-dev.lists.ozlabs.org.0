Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508482CF50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 21:15:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45D3TP3qVnzDqSM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 05:15:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.195; helo=mail-oi1-f195.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45D3S36QMbzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 05:14:27 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id r136so15189071oie.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 12:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ra9C7HBCeZmGUzDNrbbPmc9jzFSW6/j7KdigjwIDgtk=;
 b=en3HSOurye6WGzlBlQAJHLAH169qJrabJ7mrVykzi0cdwFHQTSkmFR+4QKDvgjQwhI
 RPQHNBSMtn+q2o1KSDN75Cu/8Bm63J5l+V4sxbraLIwQNkSfDpYazdZZNrUzERTM0/UJ
 cML3pdzk/PYHDejOcBR7qb7DT8o7ZXOe/N7+n6IkHaKZA6Kt0K7FhBBTKzenumnc9OD0
 dQRMklw+e+J3SwW0oXgI7Jog4aaSd31lpTU2GAeXfw+JW6idPdHZTIJlj5U9/woILYsH
 QumTyt9VRjaBbqMMqlSFl/w2VCX2dJlPUedplX/KWRGvC7Paf30xH0IOr3v7ROMuNMPd
 WSNw==
X-Gm-Message-State: APjAAAUGbO4hoJWdIjayG8BNjlSifjvxVAxzSORKyPfCAxlAqKbilzEJ
 uKAAEXf29bPxAAo8XtEAM5rMULwDztvjSSnblqI=
X-Google-Smtp-Source: APXvYqxY+/21+ikceKigDf2vCF64dsCjXjFUqXRAl27uAc3y6ESe7rc52NSU58+qog2Ywl8f//zJBMwMby4akZ8iCak=
X-Received: by 2002:aca:cd85:: with SMTP id d127mr3813365oig.96.1559070864332; 
 Tue, 28 May 2019 12:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUsw_jkgWfknXbpK7_yfy=S5Y0jvQe1KP3kM-LT8fFnUF5g@mail.gmail.com>
 <87tvdfp31x.fsf@concordia.ellerman.id.au>
In-Reply-To: <87tvdfp31x.fsf@concordia.ellerman.id.au>
From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 28 May 2019 21:14:12 +0200
Message-ID: <CA+7wUszCdg_xRRh_DX=wAoWnpZTyc7dG=RsiEUCYJN=p_yBX6A@mail.gmail.com>
Subject: Re: kmemleak: 1157 new suspected memory leaks (see
 /sys/kernel/debug/kmemleak)
To: Michael Ellerman <mpe@ellerman.id.au>,
 Catalin Marinas <catalin.marinas@arm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael !

Thanks for the kind help.

On Tue, May 28, 2019 at 7:21 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Mathieu Malaterre <malat@debian.org> writes:
> > Hi there,
> >
> > Is there a way to dump more context (somewhere in of tree
> > flattening?). I cannot make sense of the following:
>
> Hmm. Not that I know of.
>
> Those don't look related to OF flattening/unflattening. That's just
> sysfs setup based on the unflattened device tree.
>
> The allocations are happening in safe_name() AFAICS.
>
> int __of_add_property_sysfs(struct device_node *np, struct property *pp)
> {
>         ...
>         pp->attr.attr.name = safe_name(&np->kobj, pp->name);
>
> And the free is in __of_sysfs_remove_bin_file():
>
> void __of_sysfs_remove_bin_file(struct device_node *np, struct property *prop)
> {
>         if (!IS_ENABLED(CONFIG_SYSFS))
>                 return;
>
>         sysfs_remove_bin_file(&np->kobj, &prop->attr);
>         kfree(prop->attr.attr.name);
>

Right. That helped a lot !

> There is this check which could be failing leading to us not calling the
> free at all:
>
> void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
> {
>         /* at early boot, bail here and defer setup to of_init() */
>         if (of_kset && of_node_is_attached(np))
>                 __of_sysfs_remove_bin_file(np, prop);
> }
>
>
> So maybe stick a printk() in there to see if you're hitting that
> condition, eg something like:
>
>         if (of_kset && of_node_is_attached(np))
>                 __of_sysfs_remove_bin_file(np, prop);
>         else
>                 printk("%s: leaking prop %s on node %pOF\n", __func__, prop->attr.attr.name, np);
>

If I understand correctly those are false positive. I was first
starting to consider using something like kmemleak_not_leak, but I
remember that I have been using kmemleak for a couple of years now.
Those reports starting to show up only recently.

Catalin, do you have an idea why on a non-SMP machine kmemleak reports
leaks from:

[...]
void __init of_core_init(void)
{
[...]
 for_each_of_allnodes(np)
    __of_attach_node_sysfs(np);



> cheers
>
> > kmemleak: 1157 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> >
> > Where:
> >
> > # head -40 /sys/kernel/debug/kmemleak
> > unreferenced object 0xdf44d180 (size 8):
> >   comm "swapper", pid 1, jiffies 4294892297 (age 4766.460s)
> >   hex dump (first 8 bytes):
> >     62 61 73 65 00 00 00 00                          base....
> >   backtrace:
> >     [<0ca59825>] kstrdup+0x4c/0xb8
> >     [<c8a79377>] kobject_set_name_vargs+0x34/0xc8
> >     [<661b4c86>] kobject_add+0x78/0x120
> >     [<c1416f27>] __of_attach_node_sysfs+0xa0/0x14c
> >     [<2a143d10>] of_core_init+0x90/0x114
> >     [<a353d0e1>] driver_init+0x30/0x48
> >     [<84ed01b1>] kernel_init_freeable+0xfc/0x3fc
> >     [<dc60f815>] kernel_init+0x20/0x110
> >     [<faa1c5b0>] ret_from_kernel_thread+0x14/0x1c
> > unreferenced object 0xdf44d178 (size 8):
> >   comm "swapper", pid 1, jiffies 4294892297 (age 4766.460s)
> >   hex dump (first 8 bytes):
> >     6d 6f 64 65 6c 00 97 c8                          model...
> >   backtrace:
> >     [<0ca59825>] kstrdup+0x4c/0xb8
> >     [<0eeb0a3b>] __of_add_property_sysfs+0x88/0x12c
> >     [<f6c64af0>] __of_attach_node_sysfs+0xcc/0x14c
> >     [<2a143d10>] of_core_init+0x90/0x114
> >     [<a353d0e1>] driver_init+0x30/0x48
> >     [<84ed01b1>] kernel_init_freeable+0xfc/0x3fc
> >     [<dc60f815>] kernel_init+0x20/0x110
> >     [<faa1c5b0>] ret_from_kernel_thread+0x14/0x1c
> > unreferenced object 0xdf4021e0 (size 16):
> >   comm "swapper", pid 1, jiffies 4294892297 (age 4766.460s)
> >   hex dump (first 16 bytes):
> >     63 6f 6d 70 61 74 69 62 6c 65 00 01 00 00 00 00  compatible......
> >   backtrace:
> >     [<0ca59825>] kstrdup+0x4c/0xb8
> >     [<0eeb0a3b>] __of_add_property_sysfs+0x88/0x12c
> >     [<f6c64af0>] __of_attach_node_sysfs+0xcc/0x14c
> >     [<2a143d10>] of_core_init+0x90/0x114
> >     [<a353d0e1>] driver_init+0x30/0x48
> >     [<84ed01b1>] kernel_init_freeable+0xfc/0x3fc
> >     [<dc60f815>] kernel_init+0x20/0x110
> >     [<faa1c5b0>] ret_from_kernel_thread+0x14/0x1c
