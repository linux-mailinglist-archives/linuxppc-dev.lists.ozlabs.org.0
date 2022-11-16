Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0222B62BA1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:51:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC0Gc5nZnz3fLR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:51:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=f2SpOZdE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ffwll.ch (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=f2SpOZdE;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC0FV117bz3fFP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:50:37 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id gv23so10364260ejb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 02:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdwJ/650wADnRoR72oyZkQ8DiIzSWQSpq6IdxtCR+gY=;
        b=f2SpOZdEZzXCSPn0ykm1oJX1As7I6xxh5wr16pOd/kbA5OOiuO0Y4IWH35k28OjNoj
         wHiTHItpgbOeFMLRaKE+zMy2u3TZ9N8dtmICEQujo3Me7a5E74OF+31ufRLy1oYVFEA1
         T3Nbw0vHjZlr/vzIiD2dpwD9w/oFbF5Q800Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdwJ/650wADnRoR72oyZkQ8DiIzSWQSpq6IdxtCR+gY=;
        b=zhk4OoiKXdhDwjcuV+GRNyElLQ5IF1LvK+H2RosQVYmcskKAXkF+KC86eP2TNPtHE6
         IBmP44IlJySw3peK7sxWWXJ7UTIdENC/RddaycwrpYwdVb01XmTSSX8VArerd2Z01gb6
         iBcieDTFKAJA+dfqB05DZnqpG5863NtA45I++4tZCre98za69CzqFVNYfcf8jGpwKmmT
         we873yj5PD3QbUdvWk2mH8vRV+n+DKI3jbe9UHhmQQYGPU0DmaZZbSUIezhl6HAhQZHI
         R/6Fo8m+UXkHreej7eUs8tkTaaChr/gZxYqjeExrHALUff0wri6bR40YtMtxohNibKZk
         nHNg==
X-Gm-Message-State: ANoB5pkZWLi0wimhwJmSFUUJSFucdz/yiVg2Aut1TUBqUAj0xg+g99B/
	gpFSqOmxX3Obk1d63f5vtvleuw==
X-Google-Smtp-Source: AA0mqf4MgV0oW/LCUugReHUpBkpepoZ7Vy6UeNXMZ5Yjky+iNhPczOtY8K1ul1dtRtcsoxT6/N3VKQ==
X-Received: by 2002:a17:906:78e:b0:7a1:e52e:bddb with SMTP id l14-20020a170906078e00b007a1e52ebddbmr16502698ejc.685.1668595834073;
        Wed, 16 Nov 2022 02:50:34 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id jw17-20020a17090776b100b0078b1ff41f05sm6758790ejc.43.2022.11.16.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:50:33 -0800 (PST)
Date: Wed, 16 Nov 2022 11:50:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
Message-ID: <Y3TAd14jCBSKeqsL@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, Hugh Dickins <hughd@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
	linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org,
	Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-17-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-17-david@redhat.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Greg Kroah-Hartman <gregkh@linux
 foundation.org>, Oded Gabbay <ogabbay@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 11:26:55AM +0100, David Hildenbrand wrote:
> FOLL_FORCE is really only for ptrace access. According to commit
> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
> writable"), get_vaddr_frames() currently pins all pages writable as a
> workaround for issues with read-only buffers.
> 
> FOLL_FORCE, however, seems to be a legacy leftover as it predates
> commit 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are
> always writable"). Let's just remove it.
> 
> Once the read-only buffer issue has been resolved, FOLL_WRITE could
> again be set depending on the DMA direction.
> 
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Also code I looked at while looking at follow_pfn stuff

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 542dde9d2609..062e98148c53 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>  	start = untagged_addr(start);
>  
>  	ret = pin_user_pages_fast(start, nr_frames,
> -				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +				  FOLL_WRITE | FOLL_LONGTERM,
>  				  (struct page **)(vec->ptrs));
>  	if (ret > 0) {
>  		vec->got_ref = true;
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
