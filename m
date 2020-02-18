Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A451625DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 13:00:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MKCx21q0zDqDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MK6s2G40zDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 22:55:32 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id m10so2038287wmc.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 03:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PU0rlEqd+hj6PVfkEyqNzbK7/cpZu827/vl+/upqLt4=;
 b=Cyo9yQblnZiMpaI5RH7qNwJFqByyUmkdV+eA0axaCcX23e/KwJy/94DGsg/TEDEocT
 VcI14euX+oLQQ+KjUQLICJ55W2yqHTYhyeBu3ObHeR1eMa+zHZoWUX4COfw4tbGyg29N
 Pcv2g+9PkU1fC6AO5Bq+2h4IVhbc9pde9P1xlfQCR4TAzpvhirlnHyHBnaRtPsxAF27/
 oxlujK2G0aVvvKlnkJ4WaRFdsc5VgwJEIsm2h8TF4gWtoiKVdOXXoH1FGL5qT8xGJtkZ
 V591v5UH2YZ65Dt5fTUG0FDoiWb/E4V7Ti3sDXsOJd4BPhHy1KuO4H8BJzse7DPJwFJR
 f4Ng==
X-Gm-Message-State: APjAAAXVceuYxUOsiEwwUj1qPLQn52nUX6wyEFXomT9UPYiGyLb73//N
 2mMHwnVVvfRoIB2f/85Gt+8=
X-Google-Smtp-Source: APXvYqzqsONanXYpROP2CPwt/PfCtYs1SfVIMM+IVOB512AIjL4OfaEPBLWybhwmqdgpeeWhGEqbhw==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr2811448wmc.52.1582026927075; 
 Tue, 18 Feb 2020 03:55:27 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id t131sm3363783wmb.13.2020.02.18.03.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 03:55:26 -0800 (PST)
Date: Tue, 18 Feb 2020 12:55:25 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200218115525.GD4151@dhcp22.suse.cz>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
 <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
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
Cc: Kirill Tkhai <ktkhai@virtuozzo.com>, linuxppc-dev@lists.ozlabs.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 18-02-20 17:10:47, Sachin Sant wrote:
> 
> >> could you please test your boot with original patch from here:
> >> 
> >> https://patchwork.kernel.org/patch/11360007/
> > 
> > After you tried the above patch instead of the problem patch,
> > do one more test and apply the below on current linux-next.
> > Please, say which of the patches makes your kernel bootable again.
> > 
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 63bb6a2aab81..7b9b48dcbc60 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -334,7 +334,7 @@ static int memcg_expand_one_shrinker_map(struct mem_cgroup *memcg,
> > 		if (!old)
> > 			return 0;
> > 
> > -		new = kvmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
> > +		new = kmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
> > 		if (!new)
> > 			return -ENOMEM;
> > 
> > @@ -378,7 +378,7 @@ static int memcg_alloc_shrinker_maps(struct mem_cgroup *memcg)
> > 	mutex_lock(&memcg_shrinker_map_mutex);
> > 	size = memcg_shrinker_map_size;
> > 	for_each_node(nid) {
> > -		map = kvzalloc_node(sizeof(*map) + size, GFP_KERNEL, nid);
> > +		map = kzalloc_node(sizeof(*map) + size, GFP_KERNEL, nid);
> > 		if (!map) {
> > 			memcg_free_shrinker_maps(memcg);
> > 			ret = -ENOMEM;
> 
> With this incremental patch applied on top of current linux-next, machine fails to boot

Your calltrace points to a standard system call path. I do not see any
reason why that commit should cause any problems. Do you see the
same when applying the patch you managed to bisect to on top of Linus
tree? Just to rule out any other potential problems in linux-next?
This all smells like a corrupted slab allocator. Which allocator do
you use?

> [    8.868433] BUG: Kernel NULL pointer dereference on read at 0x000073b0
> [    8.868439] Faulting instruction address: 0xc0000000003d55f4
> [    8.868444] Oops: Kernel access of bad area, sig: 11 [#1]
> [    8.868449] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    8.868453] Modules linked in:
> [    8.868458] CPU: 18 PID: 1 Comm: systemd Not tainted 5.6.0-rc2-next-20200218-autotest+ #4
> [    8.868463] NIP:  c0000000003d55f4 LR: c0000000003d5b94 CTR: 0000000000000000
> [    8.868468] REGS: c0000008b3783710 TRAP: 0300   Not tainted  (5.6.0-rc2-next-20200218-autotest+)
> [    8.868474] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004844  XER: 00000000
> [    8.868481] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1 
> [    8.868481] GPR00: c0000000003d5b94 c0000008b37839a0 c00000000155d400 c0000008b301f500 
> [    8.868481] GPR04: 0000000000000dc0 0000000000000002 c0000000003fee38 c0000008bb298620 
> [    8.868481] GPR08: 00000008ba1f0000 0000000000000001 0000000000000000 0000000000000000 
> [    8.868481] GPR12: 0000000024004844 c00000001ec54200 0000000000000000 0000000000000000 
> [    8.868481] GPR16: c0000008a1a60048 c000000001595898 c000000001750c18 0000000000000002 
> [    8.868481] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 5deadbeef0000122 
> [    8.868481] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 c0000000003fee38 
> [    8.868481] GPR28: c0000008b301f500 c0000008bb298620 0000000000000000 c00c000002286d00 
> [    8.868529] NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
> [    8.868534] LR [c0000000003d5b94] __slab_alloc+0x34/0x60
> [    8.868538] Call Trace:
> [    8.868541] [c0000008b37839a0] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
> [    8.868547] [c0000008b3783a80] [c0000000003d5b94] __slab_alloc+0x34/0x60
> [    8.868553] [c0000008b3783ab0] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
> [    8.868559] [c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
> [    8.868565] [c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
> [    8.868571] [c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
> [    8.868577] [c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
> [    8.868583] [c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
> [    8.868589] [c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
> [    8.868594] [c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
> [    8.868601] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
> [    8.868605] Instruction dump:
> [    8.868608] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088 
> [    8.868615] 3ea2000c 3ab57070 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a 
> [    8.868623] ---[ end trace f9b8e3c36493f430 ]---
> [    8.870690] 
> [    9.870701] Kernel panic - not syncing: Fatal exception
> 
> Thanks
> -Sachin

-- 
Michal Hocko
SUSE Labs
