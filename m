Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD63F686A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 11:17:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479qgv10XWzF6CX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 21:17:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xs4all.nl (client-ip=194.109.24.26;
 helo=lb2-smtp-cloud9.xs4all.net; envelope-from=hverkuil@xs4all.nl;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xs4all.nl
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479qbL49YTzF4ns
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 21:13:34 +1100 (AEDT)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud9.xs4all.net with ESMTPA
 id TkCAiNAD3QBsYTkCDi1SAO; Sun, 10 Nov 2019 11:11:50 +0100
Subject: Re: [PATCH v2 13/18] media/v4l2-core: pin_longterm_pages (FOLL_PIN)
 and put_user_page() conversion
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-14-jhubbard@nvidia.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6d21391e-01c4-0605-0d0d-15f574cc3ed4@xs4all.nl>
Date: Sun, 10 Nov 2019 11:11:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-14-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFSTukyJqfxV4HrGGQ0j5/iKKr13OkEzy05WqAOfOSWrg/qEYKz7zmsSLuZTQBp28yCz+dvkf6VRv+kw027uNzPdnpP1TG1MNl/DxEey7uZK5/xalM5y
 5mek2ggN11NHCI9OB51pAxH9HazB5AMpcNYWMTjkyDZlvUJtbfWW4ZUZq85nxiyCH9Wkwv75NaxcyvTMitOA+o4+U5rJjg8sA8gvfV9NbRRVFg3M6alu0IKv
 kyfdjDFwuG4F6JKpbt9v3E049Xx0YF8ppWdgVnIjGfusfyNaLb+90K4NGhzfPU11L+2UeV4HzuHSmBSjFWbsZNO99HRrZoUYxfZil98flfM0I4Tl92e2ZZ6T
 oLNGV585kbb26i0UwqgRbX0qClJpOQIX8JPemeIZHsAISH4A6EIzai79YkaAZrrdJDqsHcU/g5pBk7M+m8f1h0UhG93G+VP07un/zdrM5krNUgUcOHqWl6c8
 yg5UitZLkuZJeoj3AZIHtptGajhOljPiqFe3qrME7yIGvxpfurp6646fJOQdrdhgQ99ZW5ZVLjxCYcB39QCEQQpm6CL4XMXAsAilPNdyDqQvU26KgyC+BY4C
 EfgFzK7XJbQ28t/ACJ7DTyyH14NWDMPJXEZyBEirCE+SenjaNpo1ArEbqixnm5RCT+dULYmvp/soWFNQsgosWPukS+PH1BUonrmmMVLsT7pZ55bv6EkNWDl4
 9ypHPyVuYZBeyd/QB3263NKtG9W94IRv7gkIMIXqe+gaZqosCCZGLoQ/R3NrX+UELfTllPBXIEjGQ6GcqW4vDLnC6e5LObzBu95S05AVd/j5Z489creqnOqz
 al1X+EBLb7SCFjH5bT0l7XPwxsPFls2nYnNC2VvjaojW5EGzj+P9FMGrDMXQYA5CwZYMR9jVieofsVzZROWuyWgzGX0IWmVMrVJ+O9Cd6w+r38l2u6VzMDO3
 vrKP72jlsDujiCNkz8SZOuEiycTOpqK7FnQXWC0vHy8ZQ5kE+5U3ZOrlf3bE5a7YMuwWWgEf1wyekRKSE5FPwRln1aFBkEu6RfHldiY5r6mScJHM0Hmz3L1G
 jmpevDng1F0dM0khzD8Rn/xNHOQmjygIoT2XjmtiT+xp1E4E+mkPp1qzmYUhF73no8Ws5q3/bDKWOdGuUrZQjRZdQtb3gNeBRaDBFMdPnfgT4QkU99ovX9La
 0JO93Bw0hzkTQPZYGAQEEyZ5mT+kT8y0hQD80773+KE9/qHPFnhe80tvkU1RdNM3L33ptC7eREOqMAmdRO6tk0ZlucAIUVw5MRfKAm2acO9sl5to+l22CFB1
 ACY3IoeSiNIkXxalh1O2DqvLWJh0AapBIq9krEjBZouKIfbQ+FRgwsFcvPJZJS2eW70SQX+omUmZZ5xpSWDV1lpAjnprcaVW+xX7OhGfCCj2gQOCd9Q=
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/3/19 10:18 PM, John Hubbard wrote:
> 1. Change v4l2 from get_user_pages(FOLL_LONGTERM), to
> pin_longterm_pages(), which sets both FOLL_LONGTERM and FOLL_PIN.
> 
> 2. Because all FOLL_PIN-acquired pages must be released via
> put_user_page(), also convert the put_page() call over to
> put_user_pages_dirty_lock().
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Looks good, thanks!

	Hans


> ---
>  drivers/media/v4l2-core/videobuf-dma-sg.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
> index 28262190c3ab..9b9c5b37bf59 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-sg.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
> @@ -183,12 +183,12 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
>  	dprintk(1, "init user [0x%lx+0x%lx => %d pages]\n",
>  		data, size, dma->nr_pages);
>  
> -	err = get_user_pages(data & PAGE_MASK, dma->nr_pages,
> -			     flags | FOLL_LONGTERM, dma->pages, NULL);
> +	err = pin_longterm_pages(data & PAGE_MASK, dma->nr_pages,
> +				 flags, dma->pages, NULL);
>  
>  	if (err != dma->nr_pages) {
>  		dma->nr_pages = (err >= 0) ? err : 0;
> -		dprintk(1, "get_user_pages: err=%d [%d]\n", err,
> +		dprintk(1, "pin_longterm_pages: err=%d [%d]\n", err,
>  			dma->nr_pages);
>  		return err < 0 ? err : -EINVAL;
>  	}
> @@ -349,11 +349,8 @@ int videobuf_dma_free(struct videobuf_dmabuf *dma)
>  	BUG_ON(dma->sglen);
>  
>  	if (dma->pages) {
> -		for (i = 0; i < dma->nr_pages; i++) {
> -			if (dma->direction == DMA_FROM_DEVICE)
> -				set_page_dirty_lock(dma->pages[i]);
> -			put_page(dma->pages[i]);
> -		}
> +		put_user_pages_dirty_lock(dma->pages, dma->nr_pages,
> +					  dma->direction == DMA_FROM_DEVICE);
>  		kfree(dma->pages);
>  		dma->pages = NULL;
>  	}
> 

