Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED12E2D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 19:05:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DcYB6DKjzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 03:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=catalin.marinas@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45DcWf404yzDqJc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 03:04:28 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D8FA341;
 Wed, 29 May 2019 10:04:27 -0700 (PDT)
Received: from mbp (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A50F23F5AF;
 Wed, 29 May 2019 10:04:26 -0700 (PDT)
Date: Wed, 29 May 2019 18:04:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mathieu Malaterre <malat@debian.org>
Subject: Re: kmemleak: 1157 new suspected memory leaks (see
 /sys/kernel/debug/kmemleak)
Message-ID: <20190529170423.3a56t7vtioznzbnx@mbp>
References: <CA+7wUsw_jkgWfknXbpK7_yfy=S5Y0jvQe1KP3kM-LT8fFnUF5g@mail.gmail.com>
 <87tvdfp31x.fsf@concordia.ellerman.id.au>
 <CA+7wUszCdg_xRRh_DX=wAoWnpZTyc7dG=RsiEUCYJN=p_yBX6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+7wUszCdg_xRRh_DX=wAoWnpZTyc7dG=RsiEUCYJN=p_yBX6A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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

On Tue, May 28, 2019 at 09:14:12PM +0200, Mathieu Malaterre wrote:
> On Tue, May 28, 2019 at 7:21 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > Mathieu Malaterre <malat@debian.org> writes:
> > > Is there a way to dump more context (somewhere in of tree
> > > flattening?). I cannot make sense of the following:
> >
> > Hmm. Not that I know of.
> >
> > Those don't look related to OF flattening/unflattening. That's just
> > sysfs setup based on the unflattened device tree.
> >
> > The allocations are happening in safe_name() AFAICS.
> >
> > int __of_add_property_sysfs(struct device_node *np, struct property *pp)
> > {
> >         ...
> >         pp->attr.attr.name = safe_name(&np->kobj, pp->name);
> >
> > And the free is in __of_sysfs_remove_bin_file():
> >
> > void __of_sysfs_remove_bin_file(struct device_node *np, struct property *prop)
> > {
> >         if (!IS_ENABLED(CONFIG_SYSFS))
> >                 return;
> >
> >         sysfs_remove_bin_file(&np->kobj, &prop->attr);
> >         kfree(prop->attr.attr.name);
> >
> 
> Right. That helped a lot !
> 
> > There is this check which could be failing leading to us not calling the
> > free at all:
> >
> > void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
> > {
> >         /* at early boot, bail here and defer setup to of_init() */
> >         if (of_kset && of_node_is_attached(np))
> >                 __of_sysfs_remove_bin_file(np, prop);
> > }
> >
> >
> > So maybe stick a printk() in there to see if you're hitting that
> > condition, eg something like:
> >
> >         if (of_kset && of_node_is_attached(np))
> >                 __of_sysfs_remove_bin_file(np, prop);
> >         else
> >                 printk("%s: leaking prop %s on node %pOF\n", __func__, prop->attr.attr.name, np);
> >
> 
> If I understand correctly those are false positive. I was first
> starting to consider using something like kmemleak_not_leak, but I
> remember that I have been using kmemleak for a couple of years now.
> Those reports starting to show up only recently.
> 
> Catalin, do you have an idea why on a non-SMP machine kmemleak reports
> leaks from:
> 
> [...]
> void __init of_core_init(void)
> {
> [...]
>  for_each_of_allnodes(np)
>     __of_attach_node_sysfs(np);

It's likely that they are false positives but usually, rather than just
adding a kmemleak_not_leak(), it's better to figure out why kmemleak
reports them. The strings allocated above through kstrdup() can't be
tracked starting with the root objects. I think for the of stuff, this
should be the of_root pointer.

Is it only with non-SMP that this happens? I can't reproduce it on arm64
to be able to dig further.

Even better if you could bisect to the commit that's causing this.

-- 
Catalin
