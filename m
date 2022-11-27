Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C565C6399E2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 11:36:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKlPr5JrJz3c8V
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 21:36:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O27xJtPp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KAY1ggBj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O27xJtPp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KAY1ggBj;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKlNn3vXTz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 21:35:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669545314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/FKhEJUKr4Au5jEDV0nA39boCfv1uOAmeL78/XZzlw=;
	b=O27xJtPpaXX+WGWtRHYJetfQf0LitOuWyYASTvh9BOIc76OBbAvqAJoksVcyj8ihyyybuL
	K0BzXUXxU998BrnvTHmhdCmjqJ56s5MlltXbtXEOh8pcP8m9+etTCwEOVSMLMxVzLD+KhE
	02JICc1N+vm9jg/GhumwHtE2HYBwStg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669545315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/FKhEJUKr4Au5jEDV0nA39boCfv1uOAmeL78/XZzlw=;
	b=KAY1ggBja+xLxU+qgBSmoeX+1QRRXnyvIIrzKncszqGvUmNHx20HFOOM1hXSj16SDqXx2p
	wGiUlKpAsQLFo2n/TSrCv2ZoaLiVaX+DPLc/8zKOoAVdiyKNldV7f/GzaIlas0yf+PCk4e
	p22wLw4D791CTinA0LF6VWd6Etozys8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-sG5BGRfCOiKCwiTNpNCUlQ-1; Sun, 27 Nov 2022 05:35:13 -0500
X-MC-Unique: sG5BGRfCOiKCwiTNpNCUlQ-1
Received: by mail-wr1-f70.google.com with SMTP id p2-20020adfaa02000000b00241d7fb17d7so1297136wrd.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 02:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/FKhEJUKr4Au5jEDV0nA39boCfv1uOAmeL78/XZzlw=;
        b=zUHmINlbKBT2PdO47pUKsT8HslgOPDAQ5zM5wjQr9ZlWwnlsnFJk5EG2uNJe5G+qfM
         /BeGo2UJ95GFacUZWxIETMjFpEb9GsCNEUhwg0Gr56RESWm3oQcduotkv5C+CgF90AJT
         pU/A8JUAz7Y8ZO7XRspSD0IkMFETapA5UnR2vTvP00cYhf5Uo0rSOfMLrOnzE8UvgJkE
         KOmtDEoWd3DhuLaOBZFS24QvLBEZWHfXHT9JXvm87dacHUpM+7baFHrcsYjtThucZfYI
         5Soi8Qx1csUQiCW0Jz6KKGANuv+jGPs/G++2DS+qJ4i0HAba2j14W888m/7DFnpuMxaq
         LMvw==
X-Gm-Message-State: ANoB5pkyFPU58cDsv3RklzWLauwZ2enHddRBGkKmHsf/DHwDfpKbdqI2
	kVkOn9xJ30k1CRm65uvg9NwbKIm08dkk2PbbBPh+lqjugY3Sy5e0Ll2XYIeAeLuZEtLUSIke+L0
	ZG2wN8TIYnQtAQoR3mn+J3GDZow==
X-Received: by 2002:a05:600c:4e88:b0:3b5:477:1e80 with SMTP id f8-20020a05600c4e8800b003b504771e80mr34594851wmq.200.1669545311986;
        Sun, 27 Nov 2022 02:35:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf44zTk6J1KBaqs1seffTqR2+v9TqwwPSmjBWI2JrtJKUPaYELfhGu32bDJHUXiVwBKDfUuj3g==
X-Received: by 2002:a05:600c:4e88:b0:3b5:477:1e80 with SMTP id f8-20020a05600c4e8800b003b504771e80mr34594816wmq.200.1669545311706;
        Sun, 27 Nov 2022 02:35:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c724:dc00:5ea8:da59:8609:7da? (p200300cbc724dc005ea8da59860907da.dip0.t-ipconnect.de. [2003:cb:c724:dc00:5ea8:da59:8609:7da])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c19ca00b003c5571c27a1sm14797024wmq.32.2022.11.27.02.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 02:35:11 -0800 (PST)
Message-ID: <81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com>
Date: Sun, 27 Nov 2022 11:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-17-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
In-Reply-To: <20221116102659.70287-17-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev
 @lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16.11.22 11:26, David Hildenbrand wrote:
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
> ---
>   drivers/media/common/videobuf2/frame_vector.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 542dde9d2609..062e98148c53 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>   	start = untagged_addr(start);
>   
>   	ret = pin_user_pages_fast(start, nr_frames,
> -				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +				  FOLL_WRITE | FOLL_LONGTERM,
>   				  (struct page **)(vec->ptrs));
>   	if (ret > 0) {
>   		vec->got_ref = true;


Hi Andrew,

see the discussion at [1] regarding a conflict and how to proceed with
upstreaming. The conflict would be easy to resolve, however, also
the patch description doesn't make sense anymore with [1].


On top of mm-unstable, reverting this patch and applying [1] gives me
an updated patch:


 From 1e66c25f1467c1f1e5f275312f2c6df29308d4df Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Wed, 16 Nov 2022 11:26:55 +0100
Subject: [PATCH] mm/frame-vector: remove FOLL_FORCE usage

GUP now supports reliable R/O long-term pinning in COW mappings, such
that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
far in one corner case (DAXFS file with holes), which can be ignored
because GUP does not support long-term pinning in fsdax (see
check_vma_flags()).

Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
using FOLL_FORCE, which is really only for ptrace access.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
  drivers/media/common/videobuf2/frame_vector.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
index aad72640f055..8606fdacf5b8 100644
--- a/drivers/media/common/videobuf2/frame_vector.c
+++ b/drivers/media/common/videobuf2/frame_vector.c
@@ -41,7 +41,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames, bool write,
  	int ret_pin_user_pages_fast = 0;
  	int ret = 0;
  	int err;
-	unsigned int gup_flags = FOLL_FORCE | FOLL_LONGTERM;
+	unsigned int gup_flags = FOLL_LONGTERM;
  
  	if (nr_frames == 0)
  		return 0;
-- 
2.38.1



Please let me know how you want to proceed. Ideally, you'd pick up
[1] and apply this updated patch. Also, please tell me if I should
send this updated patch in a separate mail (e.g., as reply to this mail).


[1] https://lkml.kernel.org/r/71bdd3cf-b044-3f12-df58-7c16d5749587@xs4all.nl

-- 
Thanks,

David / dhildenb

