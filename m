Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 524E2162960
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 16:26:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MPpM5107zDqTV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 02:26:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MPmH4KRmzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 02:24:47 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id a6so3366824wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 07:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WF5nuerORwTKU2LdOD06412iR6E4PQ55wctVgD1QbZA=;
 b=ODzqY9NVg+dxyBEL3bmwmkHP3gJQdgykBr8KIt7wwnack9t6O0FTdwkXJZQeqUoRJ8
 gKZRRBxvsiqkuCkHDOxZj50OFZGressymQ7jHYFmgzZtvWKMeYfvPhCTGnmSP0n1UU39
 GBkgmyqvB9zcc5IFN4Nb3zZ67EDmWQAaqZYXiZYsvg24Y4q9mJxumbKPTdfGGkMhrpNz
 2tCNilKm+k8yRQplsk1W+jasziHBbSfSdJ/yD3TvPDh091frk+QDLx2L4PIxFEwEei6p
 q7EIyHgS9C/n70uo67C2yFIA9SSt9tDzM5r4r7upiPOWokPe0OTIoOI6rdq8SdB7E55D
 3FLQ==
X-Gm-Message-State: APjAAAUSOduq18gpiiGMabhNZ1SylzfGzM3YVtg6us8ljebThMQG2+LI
 qXuk8w3DB5Hk081OW7UYCaE=
X-Google-Smtp-Source: APXvYqzpSJj6qrSybFT0mjUD/YGni0vccUWIowyCmX38SpilgquuDnPuAUh5eHHoc62hLywZ39flFw==
X-Received: by 2002:a05:600c:3d1:: with SMTP id
 z17mr3868397wmd.90.1582039483432; 
 Tue, 18 Feb 2020 07:24:43 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id b67sm3847476wmc.38.2020.02.18.07.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 07:24:42 -0800 (PST)
Date: Tue, 18 Feb 2020 16:24:41 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Cristopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200218152441.GH4151@dhcp22.suse.cz>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
 <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
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

On Tue 18-02-20 20:41:12, Sachin Sant wrote:
> 
> >> Yes, I can recreate the same problem with the patch applied on top of
> >> 5.6.0-rc2. 
> > 
> > And just to make sure. This was with http://lkml.kernel.org/r/fff0e636-4c36-ed10-281c-8cdb0687c839@virtuozzo.com
> > right?
> > 
> Yes, the same patch.
> 
> > If yes, is it possible that the specific node is somehow crippled (e.g.
> > some nodes don't have any memory and thus the allocator blows up)? In
> > other words what is the numa topology? (numactl -H)
> > 
> 
> Here is the o/p of numactl
> 
> # numactl -H
> available: 2 nodes (0-1)
> node 0 cpus:
> node 0 size: 0 MB
> node 0 free: 0 MB

OK, so what I expected. The node0 is memory less or simply not present
at all. Fun!

Anyway, I do not think it is expected that kmalloc_node just blows up
on those nodes. The page allocator simply falls back to the closest
node. Something for kmalloc maintainers I believe.

A short summary. kmalloc_node blows up when trying to allocate from a
memory less node.

> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> node 1 size: 35247 MB
> node 1 free: 30907 MB
> node distances:
> node   0   1 
>   0:  10  40 
>   1:  40  10 
> # 
> 
> Thanks
> -Sachin

-- 
Michal Hocko
SUSE Labs
