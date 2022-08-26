Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 584AD5A2CA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 18:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDm2K1wNrz3byL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 02:46:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dp40KwV2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FBxHiUqU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dp40KwV2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FBxHiUqU;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDm1b00FWz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 02:46:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661532366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aM/0vWRQhG6l7795J8Sv+413xc0zb7CfNl42O6VQfck=;
	b=dp40KwV2PLhBOZsanYDfu7dXGcAozEJKCU6guPAUTZdLyIJyyRP0MwSaaXWV85XjZow8t4
	lLdv3EkdqDZ0wvWRB6dkiL6RJ7uXGSDOOmhzkX7gwe9bVif78MJzBJZQUup57RwOdgZp8Z
	Tvu0M33zrxtTUW5kLPHKFD2zfUnROhk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661532367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aM/0vWRQhG6l7795J8Sv+413xc0zb7CfNl42O6VQfck=;
	b=FBxHiUqU9FVpa7Horoiw5XLQf84aODDYVcVdXQTPTBqa548PgpKeq6u5jPC7wPlIq5rwHm
	wUtmrL4APmTS/c3/qKNtaVL9Hd/jUIi4vT1fecTD1koa8ild7yJizT5pDCsE1PRPTq8jr9
	1T17Yxox02xa/7JAlfQJks3MVVr5O3c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-43w2wXlmOp-0h-gsCzeueA-1; Fri, 26 Aug 2022 12:46:05 -0400
X-MC-Unique: 43w2wXlmOp-0h-gsCzeueA-1
Received: by mail-wm1-f72.google.com with SMTP id v3-20020a1cac03000000b003a7012c430dso1566908wme.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 09:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=aM/0vWRQhG6l7795J8Sv+413xc0zb7CfNl42O6VQfck=;
        b=ISk1hs2gmnCSQ9LZQXfLTFMYiVy9QK2TWm3dQeoyY8mRle/p3h4x/EH4Nd3sbmwPa0
         2BuybVvGgfabn3nkTb0wj1uadLYepG5rT8TsbG963yXszwnmt5zb1yJWBcc8Fy4kdg9c
         AVaMZhYP0NChUSCJl69fcd7wnmxsdIAeVoGxqT0okri6vSm2t4lhQcbhtufS+eWzFFj5
         86+1HXzJCvTSW9I8CmarQH/hMYkBHpucSMmFgKiKK/LXwIpyoE58pe4VVOuLBqfqsxpP
         pJqcmLMfMahHCa3Gt35gBMDxt341haKcE8NSzggr3wj4uc6RUZ7XBBnTWk5BdBEtVDYi
         J8Eg==
X-Gm-Message-State: ACgBeo06x29A0Y96tMkVaWmm6doK+IEFRHZGQ2N7hOW2lg6Bg08u7WRi
	g20D67IV/MgyWQWJMWP/tBBOGCuhXwUj50MXE9Dv972b0PO1JFsUOsVZWPSbMgYCt2mVTJLmEsf
	B0sNId+DUdFPfHzcsXu4l/djdMw==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id f15-20020a7bcd0f000000b003a5ec59daf0mr279205wmj.13.1661532364613;
        Fri, 26 Aug 2022 09:46:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR40NbGvjbiWl5L8l+XuL5Rh4KAQqMtg/LZ8GOIke5nZFYZHD6d6ipQhIpQgrK46S3HVwjTkJA==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id f15-20020a7bcd0f000000b003a5ec59daf0mr279186wmj.13.1661532364308;
        Fri, 26 Aug 2022 09:46:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa? (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de. [2003:cb:c708:f600:abad:360:c840:33fa])
        by smtp.gmail.com with ESMTPSA id l9-20020a7bc349000000b003a5fa79007fsm162159wmj.7.2022.08.26.09.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 09:46:03 -0700 (PDT)
Message-ID: <140e7688-b66d-2f6d-fed8-e39da5045420@redhat.com>
Date: Fri, 26 Aug 2022 18:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Peter Xu <peterx@redhat.com>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
 <YwZGHyYJiJ+CGLn2@xz-m1.local> <8735dkeyyg.fsf@nvdebian.thelocal>
 <YwgFRLn43+U/hxwt@xz-m1.local> <8735dj7qwb.fsf@nvdebian.thelocal>
 <YwjZamk4n/dz+Y/M@xz-m1.local>
 <72146725-3d70-0427-50d4-165283a5a85d@redhat.com>
 <Ywjs/i4kIVlxZwpb@xz-m1.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
In-Reply-To: <Ywjs/i4kIVlxZwpb@xz-m1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Huang Ying <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26.08.22 17:55, Peter Xu wrote:
> On Fri, Aug 26, 2022 at 04:47:22PM +0200, David Hildenbrand wrote:
>>> To me anon exclusive only shows this mm exclusively owns this page. I
>>> didn't quickly figure out why that requires different handling on tlb
>>> flushs.  Did I perhaps miss something?
>>
>> GUP-fast is the magic bit, we have to make sure that we won't see new
>> GUP pins, thus the TLB flush.
>>
>> include/linux/mm.h:gup_must_unshare() contains documentation.
> 
> Hmm.. Shouldn't ptep_get_and_clear() (e.g., xchg() on x86_64) already
> guarantees that no other process/thread will see this pte anymore
> afterwards?

You could have a GUP-fast thread that just looked up the PTE and is
going to pin the page afterwards, after the ptep_get_and_clear()
returned. You'll have to wait until that thread finished.

Another user that relies on this interaction between GUP-fast and TLB
flushing is for example mm/ksm.c:write_protect_page()

There is a comment in there explaining the interaction a bit more detailed.

Maybe we'll be able to handle this differently in the future (maybe once
this turns out to be an actual performance problem). Unfortunately,
mm->write_protect_seq isn't easily usable because we'd need have to make
sure we're the exclusive writer.


For now, it's not too complicated. For PTEs:
* try_to_migrate_one() already uses ptep_clear_flush().
* try_to_unmap_one() already conditionally used ptep_clear_flush().
* migrate_vma_collect_pmd() was the one case that didn't use it already
 (and I wonder why it's different than try_to_migrate_one()).

-- 
Thanks,

David / dhildenb

