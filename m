Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A818878B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 15:33:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hbJS5pH0zDqBt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 01:33:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=MGDRAHHw; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hYpN0pGczDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 00:26:01 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id cy12so4899798qvb.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=149vrDC6Ny5kXlZ3c9yb3Ff3i3SdoOBmg7pfld3LKGI=;
 b=MGDRAHHwM4nroOOuiUdxwzeDLPsUSxkKGB1ZBFk85k2dwJdJTHMO8PEvHSg2fVErKC
 xbyOzKDkvp5ST2WwzC+GHN4a0yqFAY4pquPxURWoEm5babHrmv41sG04VZtMii9smFBi
 npONJDDXJCv1pMi4ZyGmSrpR4itL6lpn//Whw93FEmcsdwIhQaGMygrv0IxYCF/CIf6e
 A5KYy2R78gVt9xaczD36OBsEfKo76u/YveXPSIXg1stdm9llUXaTvmmz7+djHoeqj25m
 k6WX9vZgfDVYYUp8MszMkTZpAxuWbQ5QLXn6OJXFdneBqng5r8BZ7FIMyRYxs+n/udis
 UKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=149vrDC6Ny5kXlZ3c9yb3Ff3i3SdoOBmg7pfld3LKGI=;
 b=Iem1UyN1Wdrdhigfgg2G4v84NE9Tp1Y4R2Rsw7u3OyLAeudNS1p8VoNsupjvYm6+iW
 PqGS+mDKlCY9bwEPqhTJEpeAZ2XEeU9Fa2DzbuNELEkcBSwuo13D3u3h0K8AVjBChatx
 lJV2HC7P4yJ28tyReO4qCnGrjYQTGlj5kE9enzzxmhh9roTGX6vFHSxxjpcA5vj9jDFc
 ZmqJ2NFeOT5q8eI4FNadjojqfwbgu5lkN4LhNd+KA4EGcjekURPRSKP3HsBf0o4aWqMF
 ArBAWOioYiW+IjgV4hHlACiczsLwfa52BDe3d+l8oNotT9UHpgIF9Wb7W2tcaG4SkNZx
 nt+Q==
X-Gm-Message-State: ANhLgQ0vLK4pvEPRM7/fs0JxIgosrMJd8y7fegMRWaaQl9JfKgEH4+Gc
 97HrkIOkjIOxY5k/ufWVLgGwWg==
X-Google-Smtp-Source: ADFU+vud8ckGfbpq7RFxGRUQtjLFosMM5WbNx995vqc+P+Orw+3LIFDIv/yLP5SnzTRZvkDSJttSbw==
X-Received: by 2002:a0c:bf46:: with SMTP id b6mr4911822qvj.47.1584451558143;
 Tue, 17 Mar 2020 06:25:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u77sm1882170qka.134.2020.03.17.06.25.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 06:25:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jECEH-00027w-2X; Tue, 17 Mar 2020 10:25:57 -0300
Date: Tue, 17 Mar 2020 10:25:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 08/12] docs: fix broken references to text files
Message-ID: <20200317132557.GS20941@ziepe.ca>
References: <cover.1584450500.git.mchehab+huawei@kernel.org>
 <35dcbefd50875b92aaf5b7671d4c57c50b4274fe.1584450500.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35dcbefd50875b92aaf5b7671d4c57c50b4274fe.1584450500.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Akira Yokosawa <akiyks@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, Harry Wei <harryxiyou@gmail.com>,
 Alex Shi <alex.shi@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-arch@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 kvm-ppc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Doug Ledford <dledford@redhat.com>, Alan Stern <stern@rowland.harvard.edu>,
 linux-arm-kernel@lists.infradead.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Jade Alglave <j.alglave@ucl.ac.uk>, Daniel Lustig <dlustig@nvidia.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Andrea Parri <parri.andrea@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Paul E. McKenney" <paulmck@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Luc Maranget <luc.maranget@inria.fr>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 David Howells <dhowells@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Morse <james.morse@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Marc Zyngier <maz@kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 17, 2020 at 02:10:47PM +0100, Mauro Carvalho Chehab wrote:
> Several references got broken due to txt to ReST conversion.
> 
> Several of them can be automatically fixed with:
> 
> 	scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>  Documentation/admin-guide/kernel-parameters.txt      |  2 +-
>  Documentation/memory-barriers.txt                    |  2 +-
>  Documentation/process/submit-checklist.rst           |  2 +-
>  .../translations/it_IT/process/submit-checklist.rst  |  2 +-
>  Documentation/translations/ko_KR/memory-barriers.txt |  2 +-
>  .../translations/zh_CN/filesystems/sysfs.txt         |  2 +-
>  .../translations/zh_CN/process/submit-checklist.rst  |  2 +-
>  Documentation/virt/kvm/arm/pvtime.rst                |  2 +-
>  Documentation/virt/kvm/devices/vcpu.rst              |  2 +-
>  Documentation/virt/kvm/hypercalls.rst                |  4 ++--
>  arch/powerpc/include/uapi/asm/kvm_para.h             |  2 +-
>  drivers/gpu/drm/Kconfig                              |  2 +-
>  drivers/gpu/drm/drm_ioctl.c                          |  2 +-
>  drivers/hwtracing/coresight/Kconfig                  |  2 +-
>  fs/fat/Kconfig                                       |  8 ++++----
>  fs/fuse/Kconfig                                      |  2 +-
>  fs/fuse/dev.c                                        |  2 +-
>  fs/overlayfs/Kconfig                                 |  6 +++---
>  include/linux/mm.h                                   |  4 ++--
>  include/uapi/linux/ethtool_netlink.h                 |  2 +-
>  include/uapi/rdma/rdma_user_ioctl_cmds.h             |  2 +-

For the rdma files

Acked-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
