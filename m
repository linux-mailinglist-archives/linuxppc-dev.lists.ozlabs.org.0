Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 374791A3E64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 04:40:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z2LP280YzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 12:40:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=sergey.senozhatsky@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AVSNgz0e; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z2Jb75bDzDrBZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 12:38:52 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t4so210174plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 19:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cm3qEVUblIBWQEP7R8pxH+eUa0WNyfWiM9J7eM+Fwmk=;
 b=AVSNgz0eR/mu36t1jtB1pHxzPsuhsLJ5Dgmcn/9c7jPOTV+CNdcyL0zkXP7nLHQzQV
 A10fzku8OWDIGvjGdvgdeH+jWjXzrllDIeVhKdprzXhQynX714rs3Td/tjGR+coEL5Aw
 9O9rN2XFZJ5QvZNpH7rO2zchnfDG/1aaYCeqb4UwllljqxtOrpvrRcKDBEk9COBYQQFO
 1jJAN0Hms3ovic+Bal9KAkQ1W5BRhoTGfKl7mwDWNfIHMcC8IP7152Er0GK1ixcZQijG
 71dIgnkhRybaZPDMrOAJ7jaWMDsjZpbv/oC14bGuigw82SaeZ2oRTYvVKah0eRNKXHb0
 NEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cm3qEVUblIBWQEP7R8pxH+eUa0WNyfWiM9J7eM+Fwmk=;
 b=fNTPullcENZZCcI5XbkgAlyIjdZrxMMZiyp/LXw/SfmL9JqPFvbHUPNx5g/2I0s/0O
 +PAd6mznJEyoUG10VwNhOQdYUdrINIBYNCC0l3YRDCTfUxIhlgrW45rC5ZDxNGczFapt
 dNMpFFQORCES1MPC6WBdeQkWhe/543JmPs20QpV2et1vWCo4L+7g2xwFKEMSleC393Z/
 4/SR/xLEEa2MheHk5uyq39wePZpzjylVxU7eb9wVj7vdMmMydmWt9MqtMhcqXKeDHVUf
 a/ce7cylzxZM2aZoCcwT60znnCsFJKVB/O5pC1kvMdf56V2A7HynPaDVb5RrmxIWRt66
 UVbw==
X-Gm-Message-State: AGi0PuaiyIvDIGRqEkFPpsT2yVItDyWiUROFqZ7ySx1arqHOR48g9niB
 L8BwE9ffUR4nM6SepOo17CY=
X-Google-Smtp-Source: APiQypJUNzW2Kf/YisQ7Gm6MjGoHraf0uboGBOm6Ai9D7kmeIiXDGo0t/+GLEITvv65wjz5MhoeSGg==
X-Received: by 2002:a17:90a:628c:: with SMTP id
 d12mr2775900pjj.53.1586486329072; 
 Thu, 09 Apr 2020 19:38:49 -0700 (PDT)
Received: from localhost (181.56.30.125.dy.iij4u.or.jp. [125.30.56.181])
 by smtp.gmail.com with ESMTPSA id f4sm456109pjm.9.2020.04.09.19.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 19:38:48 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Fri, 10 Apr 2020 11:38:45 +0900
To: Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200410023845.GA2354@jagdpanzerIV.localdomain>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <20200409160826.GC247701@google.com>
 <20200409165030.GG20713@hirez.programming.kicks-ass.net>
 <20200409170813.GD247701@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409170813.GD247701@google.com>
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
Cc: linux-hyperv@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 David Airlie <airlied@linux.ie>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Daniel Vetter <daniel@ffwll.ch>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (20/04/09 10:08), Minchan Kim wrote:
> > > Even though I don't know how many usecase we have using zsmalloc as
> > > module(I heard only once by dumb reason), it could affect existing
> > > users. Thus, please include concrete explanation in the patch to
> > > justify when the complain occurs.
> > 
> > The justification is 'we can unexport functions that have no sane reason
> > of being exported in the first place'.
> > 
> > The Changelog pretty much says that.
> 
> Okay, I hope there is no affected user since this patch.
> If there are someone, they need to provide sane reason why they want
> to have zsmalloc as module.

I'm one of those who use zsmalloc as a module - mainly because I use zram
as a compressing general purpose block device, not as a swap device.
I create zram0, mkfs, mount, checkout and compile code, once done -
umount, rmmod. This reduces the number of writes to SSD. Some people use
tmpfs, but zram device(-s) can be much larger in size. That's a niche use
case and I'm not against the patch.

	-ss
