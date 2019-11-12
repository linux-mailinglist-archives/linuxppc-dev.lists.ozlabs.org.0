Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9919F9B1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 21:46:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CKXY6yJbzF5f6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 07:46:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ia/Hl3Z1"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CKTW4CF5zF3K0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 07:43:43 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id o11so21270782qtr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 12:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kGcjnenI+EnnAHWMcItB24mxm55INky4C94Ykv4geg4=;
 b=Ia/Hl3Z1HOGYiq6KoluUd9uZCGKzwQBgBr5JQ7I5KyZEUZP07fiLx9egiGiglXV9yp
 zwduhp53vyEcd290QPaERf3wZ21mOf61BVNQbg6GVzWjLkWaYtjFFrAZ/kB/sX/TsV0O
 Cqh6vZK9nd1Vig8r0syQpzeADiWtdjhU8C1qoZqr93PSItmh35/j4piNjOHcIgDaKDz3
 2BaPDGhVa8atEOsvR55GHtOxdcr+RnZlO25xW0gJoiJutB0sYZDed0fX6gxPxoxhf5Zl
 1FXBtMQo3iHNaStug4eqwxrgV4Z4sqg89JFN5ijz+6oI5UdbjHNjva//V05ajuQKORqi
 pELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kGcjnenI+EnnAHWMcItB24mxm55INky4C94Ykv4geg4=;
 b=K7xnHXYSP6kWkcpGLzPDPtZO4/QNPdeMGvFkxXuafyv3ELFkHRmNyVp16he/jKuoTH
 m0HO7UNeTkHeEdXiy4SAE2Fp8J4K8rFYQ4qPEHqn41HlgBz0aIAWyQKlPevlxhm/I8s8
 bK75YTwJIZbR6/1WQ3STgoPb82PVI0WHs3edaGC9uyqkrY2NytnokvcpppHoayDXCmg/
 vUUOMGg66UqTueOYfWVaILqA6szR/7JHdebkWSmL0AWihzkvq24cPFOVLIrL3kVDlwG8
 LGW54XCnYps6cRH0ASKCelEet0WIqpWRfazSZkJUebpscSsiLa4L0CUJvWz/dkVp+caY
 9VqQ==
X-Gm-Message-State: APjAAAWIQYqE2b0dGG3M1lX+TOI87fJxdd3XPDMhOG3Y89YO1oGkjfVm
 cn5+84Yt+X81nkINv3jBWaGXuw==
X-Google-Smtp-Source: APXvYqyV99P4cYBxqwR0yk0Vl7NSO/G/hGYwr7orI5pSazTDzznvIwLj5yKe4F2N3m9e7NI6fV/HBQ==
X-Received: by 2002:ac8:1ba5:: with SMTP id z34mr33733259qtj.162.1573591419675; 
 Tue, 12 Nov 2019 12:43:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id u22sm10020470qtb.59.2019.11.12.12.43.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:43:39 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUd0k-00046s-Fb; Tue, 12 Nov 2019 16:43:38 -0400
Date: Tue, 12 Nov 2019 16:43:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191112204338.GE5584@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112000700.3455038-9-jhubbard@nvidia.com>
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
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 04:06:45PM -0800, John Hubbard wrote:
> As it says in the updated comment in gup.c: current FOLL_LONGTERM
> behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
> FS DAX check requirement on vmas.
> 
> However, the corresponding restriction in get_user_pages_remote() was
> slightly stricter than is actually required: it forbade all
> FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
> that do not set the "locked" arg.
> 
> Update the code and comments accordingly, and update the VFIO caller
> to take advantage of this, fixing a bug as a result: the VFIO caller
> is logically a FOLL_LONGTERM user.
> 
> Thanks to Jason Gunthorpe for pointing out a clean way to fix this.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 30 +++++++++++++-----------------
>  mm/gup.c                        | 13 ++++++++-----
>  2 files changed, 21 insertions(+), 22 deletions(-)

This matches what I thought, but I think DanW should check it too, and
the vfio users should test..

> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index d864277ea16f..017689b7c32b 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -348,24 +348,20 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
>  		flags |= FOLL_WRITE;
>  
>  	down_read(&mm->mmap_sem);
> -	if (mm == current->mm) {
> -		ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
> -				     vmas);
> -	} else {
> -		ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
> -					    vmas, NULL);
> -		/*
> -		 * The lifetime of a vaddr_get_pfn() page pin is
> -		 * userspace-controlled. In the fs-dax case this could
> -		 * lead to indefinite stalls in filesystem operations.
> -		 * Disallow attempts to pin fs-dax pages via this
> -		 * interface.
> -		 */
> -		if (ret > 0 && vma_is_fsdax(vmas[0])) {
> -			ret = -EOPNOTSUPP;
> -			put_page(page[0]);
> -		}
> +	ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> +				    page, vmas, NULL);
> +	/*
> +	 * The lifetime of a vaddr_get_pfn() page pin is
> +	 * userspace-controlled. In the fs-dax case this could
> +	 * lead to indefinite stalls in filesystem operations.
> +	 * Disallow attempts to pin fs-dax pages via this
> +	 * interface.
> +	 */
> +	if (ret > 0 && vma_is_fsdax(vmas[0])) {
> +		ret = -EOPNOTSUPP;
> +		put_page(page[0]);
>  	}

AFAIK this chunk is redundant now as it is some hack to emulate
FOLL_LONGTERM? So vmas can be deleted too.

Also unclear why this function has this:

        up_read(&mm->mmap_sem);

        if (ret == 1) {
                *pfn = page_to_pfn(page[0]);
                return 0;
        }

        down_read(&mm->mmap_sem);

Jason
