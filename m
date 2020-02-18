Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECB162826
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 15:29:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MNXx3g8JzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 01:29:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.65; helo=mail-wr1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MNT04hGDzDqjj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 01:26:26 +1100 (AEDT)
Received: by mail-wr1-f65.google.com with SMTP id e8so1680181wrm.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 06:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=REpDYrMDr1F8l6vs7u4Dy3bhPqgDpY15dwPo3RCkxOA=;
 b=eWbSDYQNPM1avDUtT9p3M1OjUmnfJXUCVLRdh8RdBbGrX33Ep5+PZKJ6npxof400yn
 cEqS3iUZBrJukckWgAQ4bg1y1cW1MnD1oQP3B1GS/TOtrRidAvEYFto1NeJ9UUdfIdHO
 R60ouV1wpS6aRypXBCh58d/kpMbsItr9gZlUKyCdR9PeZ03mgjPioOjD+l2nNXYNeone
 WZgrnMGeKV+Ek6j+nOfovoXaDNj6RHhEvaYQFUuPViHTgoiTRy3pbAQvmfNombP/LgPl
 GxooVBu9XrU7u7agPZ94DtfAKCpXiQm2ktMdKG3eMrkpdfu445KendGzTangcYFQpaWE
 zvpg==
X-Gm-Message-State: APjAAAU1uH/SgiW2NNa9T0Y0QHA2CLAuQNsZKsXrPvJXS+kIoXAEU8RX
 zXcY3HwCtO380LLnFRudPcw=
X-Google-Smtp-Source: APXvYqwv4AJP+4dReH+edYE8YWBQ8CSzircAin9vIvKPRhcT3a36e/EGZ5x7r18KGe2vccRwcQ52fw==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr27941784wrx.136.1582035982059; 
 Tue, 18 Feb 2020 06:26:22 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id c13sm6557632wrn.46.2020.02.18.06.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 06:26:21 -0800 (PST)
Date: Tue, 18 Feb 2020 15:26:20 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200218142620.GF4151@dhcp22.suse.cz>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
 <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
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

On Tue 18-02-20 19:30:33, Sachin Sant wrote:
> 
> 
> > On 18-Feb-2020, at 5:25 PM, Michal Hocko <mhocko@kernel.org> wrote:
> > 
> > On Tue 18-02-20 17:10:47, Sachin Sant wrote:
> >> 
> >>>> could you please test your boot with original patch from here:
> >>>> 
> >>>> https://patchwork.kernel.org/patch/11360007/
> >>> 
> >>> After you tried the above patch instead of the problem patch,
> >>> do one more test and apply the below on current linux-next.
> >>> Please, say which of the patches makes your kernel bootable again.
> >>> 
> >>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> >>> index 63bb6a2aab81..7b9b48dcbc60 100644
> >>> --- a/mm/memcontrol.c
> >>> +++ b/mm/memcontrol.c
> >>> @@ -334,7 +334,7 @@ static int memcg_expand_one_shrinker_map(struct mem_cgroup *memcg,
> >>> 		if (!old)
> >>> 			return 0;
> >>> 
> >>> -		new = kvmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
> >>> +		new = kmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
> >>> 		if (!new)
> >>> 			return -ENOMEM;
> >>> 
> >>> @@ -378,7 +378,7 @@ static int memcg_alloc_shrinker_maps(struct mem_cgroup *memcg)
> >>> 	mutex_lock(&memcg_shrinker_map_mutex);
> >>> 	size = memcg_shrinker_map_size;
> >>> 	for_each_node(nid) {
> >>> -		map = kvzalloc_node(sizeof(*map) + size, GFP_KERNEL, nid);
> >>> +		map = kzalloc_node(sizeof(*map) + size, GFP_KERNEL, nid);
> >>> 		if (!map) {
> >>> 			memcg_free_shrinker_maps(memcg);
> >>> 			ret = -ENOMEM;
> >> 
> >> With this incremental patch applied on top of current linux-next, machine fails to boot
> > 
> > Your calltrace points to a standard system call path. I do not see any
> > reason why that commit should cause any problems. Do you see the
> > same when applying the patch you managed to bisect to on top of Linus
> > tree? Just to rule out any other potential problems in linux-next?
> 
> Yes, I can recreate the same problem with the patch applied on top of
> 5.6.0-rc2. 

And just to make sure. This was with http://lkml.kernel.org/r/fff0e636-4c36-ed10-281c-8cdb0687c839@virtuozzo.com
right?

If yes, is it possible that the specific node is somehow crippled (e.g.
some nodes don't have any memory and thus the allocator blows up)? In
other words what is the numa topology? (numactl -H)

> CONFIG_SLUB is enabled in my case. I have attached the .config.
> The LPAR has 34GB of memory allocated.
> 
> [    8.766078] BUG: Kernel NULL pointer dereference on read at 0x000073b0
> [    8.766083] Faulting instruction address: 0xc0000000003d38a4
> [    8.766089] Oops: Kernel access of bad area, sig: 11 [#1]
> [    8.766093] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    8.766098] Modules linked in:
> [    8.766103] CPU: 12 PID: 1 Comm: systemd Not tainted 5.6.0-rc2-autotest+ #2
> [    8.766107] NIP:  c0000000003d38a4 LR: c0000000003d3e44 CTR: 0000000000000000
> [    8.766113] REGS: c0000008b37836e0 TRAP: 0300   Not tainted  (5.6.0-rc2-autotest+)
> [    8.766118] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004844  XER: 00000000
> [    8.766125] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1 
> [    8.766125] GPR00: c0000000003d3e44 c0000008b3783970 c00000000155d500 c0000008b301f500 
> [    8.766125] GPR04: 0000000000000dc0 0000000000000002 c0000000003443f8 c0000008bac98620 
> [    8.766125] GPR08: 00000008b9bf0000 0000000000000001 0000000000000000 0000000000000000 
> [    8.766125] GPR12: 0000000024004844 c00000001ec5d200 0000000000000000 0000000000000000 
> [    8.766125] GPR16: c000000007be2048 c000000001595818 c000000001750c98 0000000000000002 
> [    8.766125] GPR20: c000000001750ca8 c000000001624470 0000000fffffffe0 5deadbeef0000122 
> [    8.766125] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 c0000000003443f8 
> [    8.766125] GPR28: c0000008b301f500 c0000008bac98620 0000000000000000 c00c000002286fc0 
> [    8.766172] NIP [c0000000003d38a4] ___slab_alloc+0x1f4/0x760
> [    8.766177] LR [c0000000003d3e44] __slab_alloc+0x34/0x60
> [    8.766181] Call Trace:
> [    8.766184] [c0000008b3783970] [c0000000003d39e4] ___slab_alloc+0x334/0x760 (unreliable)
> [    8.766191] [c0000008b3783a50] [c0000000003d3e44] __slab_alloc+0x34/0x60
> [    8.766196] [c0000008b3783a80] [c0000000003d5250] __kmalloc_node+0x110/0x490
> [    8.766203] [c0000008b3783b00] [c0000000003443f8] kvmalloc_node+0x58/0x110
> [    8.766208] [c0000008b3783b40] [c0000000003fcf58] mem_cgroup_css_online+0x108/0x270
> [    8.766215] [c0000008b3783ba0] [c000000000236078] online_css+0x48/0xd0
> [    8.766220] [c0000008b3783bd0] [c00000000023eebc] cgroup_apply_control_enable+0x2ec/0x4d0
> [    8.766226] [c0000008b3783cb0] [c000000000242728] cgroup_mkdir+0x228/0x5f0
> [    8.766232] [c0000008b3783d20] [c00000000051ab48] kernfs_iop_mkdir+0xb8/0x170
> [    8.766238] [c0000008b3783d50] [c00000000043a7c0] vfs_mkdir+0x110/0x230
> [    8.766243] [c0000008b3783da0] [c00000000043e8a0] do_mkdirat+0xb0/0x1a0
> [    8.766249] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
> [    8.766253] Instruction dump:
> [    8.766257] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088 
> [    8.766264] 3ea2000c 3ab56f70 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a 
> [    8.766271] ---[ end trace d651c32e3d9219fb ]---
> [    8.768347] 
> [    9.768359] Kernel panic - not syncing: Fatal exception
> 
> Thanks
> -Sachin
> 



-- 
Michal Hocko
SUSE Labs
