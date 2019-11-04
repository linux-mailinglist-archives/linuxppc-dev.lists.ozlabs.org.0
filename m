Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A2EE9EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 21:40:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Pnd0v39zF49g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="TG8Hk1Ne"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Pjb06w4zF36y
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:37:05 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q70so18955974qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 12:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rGN1CMMcv27mrbyjqTfJtMw4/MfiXe8ZUNAjLnIfNc8=;
 b=TG8Hk1NeRC++G6+F2yPv9zRlkB5zmpjIx9ZuDUNKab/C+J6d7xxfOxxIO7eKgvsTt+
 p3r7qXvBb+Zz3r5NF9wt7yEiPQTVgxKnL+HEF2RNhT/2isit4pN3VfgQ2DIpr/R7/4Hw
 u7TwLaFjyPwmRXIFAaBFi4fpQejOEyaDwRD+BmP4qgv0NQc4ENsX+0jMxqrPG0iCiCMO
 7RWUYzK0XfILQOzslmYaqc8eKt7DtdAn4YRVb6r7EuXFpZ7WiuUUv4iKaUItPpl758jM
 1rA117djJwEsfQGPp7Z0dJc7+OtMVamSH8lioe2hkB5VkJCtZKnaAY/7jmqeoI1EBbdB
 D0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rGN1CMMcv27mrbyjqTfJtMw4/MfiXe8ZUNAjLnIfNc8=;
 b=eNNqqwEj93Mc6SeQ9uIhEg+vOUbYEf+ZnIImLvL5Yi8IJ7ZZ7aHE6YtDJyBDj3F4M8
 pgXHdFzpgHawT/d1VzmTbE4z9/UgIbbeprPgmAUKWpOUn5O0FDaKAscFgMC0sxLEVKIZ
 9sZY3refNH07ZyT7zZij4NJInpqH4/TsTTx9+zYzmG3U5Ua861JdWrDl+he5o99TebG5
 al0WZBcsRJXkNMzTdvVnDA5JaZv0I4r0D5+xr+sifdyo2CZV62omjTfBm1nU/IZSeAfg
 iXjoxJTlyiEwUcny2ifmjl36BdSEsUuUlxx2Odhf5Bi9dfiil1W4DxhyWupVyAt1mPSo
 Ug2Q==
X-Gm-Message-State: APjAAAWC0eimGN0yrGR5gnQk6Hh+4plenyo1mq6PBCmLjXj5Ib1cm+0r
 JxtzwlX1NAlTT7c6JlwquoXQeg==
X-Google-Smtp-Source: APXvYqyT2XrB8OH9lK27HX22fLNbm8bipIFqvEED+1gyXtGC25AghyQahqXSG6rV31VKukiCJdMK8w==
X-Received: by 2002:a05:620a:90a:: with SMTP id
 v10mr18785575qkv.195.1572899823664; 
 Mon, 04 Nov 2019 12:37:03 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id u189sm9293005qkd.62.2019.11.04.12.37.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Nov 2019 12:37:03 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iRj5y-0005JK-NP; Mon, 04 Nov 2019 16:37:02 -0400
Date: Mon, 4 Nov 2019 16:37:02 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191104203702.GG30938@ziepe.ca>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
 <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
 <20191104203153.GB7731@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104203153.GB7731@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 03:31:53PM -0500, Jerome Glisse wrote:
> > Note for Jason: the (a) or (b) items are talking about the vfio case, which is
> > one of the two call sites that now use pin_longterm_pages_remote(), and the
> > other one is infiniband:
> > 
> > drivers/infiniband/core/umem_odp.c:646:         npages = pin_longterm_pages_remote(owning_process, owning_mm,
> > drivers/vfio/vfio_iommu_type1.c:353:            ret = pin_longterm_pages_remote(NULL, mm, vaddr, 1,
> 
> vfio should be reverted until it can be properly implemented.
> The issue is that when you fix the implementation you might
> break vfio existing user and thus regress the kernel from user
> point of view. So i rather have the change to vfio reverted,
> i believe it was not well understood when it got upstream,
> between in my 5.4 tree it is still gup_remote not longterm.

It is clearly a bug, vfio must use LONGTERM, and does right above this
remote call:

        if (mm == current->mm) {
                ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
                                     vmas);
        } else {
                ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
                                            vmas, NULL);


I'm not even sure that it really makes any sense to build a 'if' like
that, surely just always call remote??

Jason
