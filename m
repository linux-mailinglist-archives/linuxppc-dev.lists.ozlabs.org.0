Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD7712887E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 11:10:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47g1b55w82zDqwM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 21:10:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=leon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="C5VL6ejr"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47g1Xy3gPMzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 21:08:50 +1100 (AEDT)
Received: from localhost (unknown [5.29.147.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A0D0206EC;
 Sat, 21 Dec 2019 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576922927;
 bh=9acaA/8fKn1399pza9UZM74CCEP9IQOiAcwxAFB8uv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C5VL6ejrikwv/fPR/5hW1vC5g7ZxqQArLHZI9V0Acv45zpCoEu7KVSUG363aSOh1d
 8mWTxU92Mkz/MNea4rOvwk4lPkm3QVmugiAJmAPtyzW4ix2JAMqI4I9mKaT4oTHqTx
 danVQGmjzaX4h7HmaTFOuro/EjXVdeZW+yY0HmyE=
Date: Sat, 21 Dec 2019 12:08:43 +0200
From: Leon Romanovsky <leon@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
Message-ID: <20191221100843.GB13335@unreal>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca> <20191220182939.GA10944@unreal>
 <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1001a5fc-a71d-9c0f-1090-546c4913d8a2@nvidia.com>
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
 Maor Gottlieb <maorg@mellanox.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

On Fri, Dec 20, 2019 at 03:54:55PM -0800, John Hubbard wrote:
> On 12/20/19 10:29 AM, Leon Romanovsky wrote:
> ...
> >> $ ./build.sh
> >> $ build/bin/run_tests.py
> >>
> >> If you get things that far I think Leon can get a reproduction for you
> >
> > I'm not so optimistic about that.
> >
>
> OK, I'm going to proceed for now on the assumption that I've got an overflow
> problem that happens when huge pages are pinned. If I can get more information,
> great, otherwise it's probably enough.
>
> One thing: for your repro, if you know the huge page size, and the system
> page size for that case, that would really help. Also the number of pins per
> page, more or less, that you'd expect. Because Jason says that only 2M huge
> pages are used...
>
> Because the other possibility is that the refcount really is going negative,
> likely due to a mismatched pin/unpin somehow.
>
> If there's not an obvious repro case available, but you do have one (is it easy
> to repro, though?), then *if* you have the time, I could point you to a github
> branch that reduces GUP_PIN_COUNTING_BIAS by, say, 4x, by applying this:

I'll see what I can do this Sunday.

>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bb44c4d2ada7..8526fd03b978 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1077,7 +1077,7 @@ static inline void put_page(struct page *page)
>   * get_user_pages and page_mkclean and other calls that race to set up page
>   * table entries.
>   */
> -#define GUP_PIN_COUNTING_BIAS (1U << 10)
> +#define GUP_PIN_COUNTING_BIAS (1U << 8)
>
>  void unpin_user_page(struct page *page);
>  void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
>
> If that fails to repro, then we would be zeroing in on the root cause.
>
> The branch is here (I just tested it and it seems healthy):
>
> git@github.com:johnhubbard/linux.git  pin_user_pages_tracking_v11_with_diags
>
>
>
> thanks,
> --
> John Hubbard
> NVIDIA
