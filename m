Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB257784583
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 17:29:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UdPc4Pft;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbcKa2io;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVYCx4RZdz3c3H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 01:29:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UdPc4Pft;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbcKa2io;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVYC42BGNz2yVc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 01:28:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692718092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7u/YZ/Wut0bLQVB3sIyShhombPvduPeoIFrUf/4TCs=;
	b=UdPc4Pft9tipryYd0mHz+CP5mHtw1szhDDDnThMMLOrsyCosvre7TGmhWB11sVjKWrIER6
	RQ6no4YTxzZstwj3dpviSeCwOs5Ah4bk5/OB5bgc/wPfDAiqt//I4P785NVXJLyOY7GMUs
	BiVbqd7k79hzFEkiEBTNjFJp2Vmd+es=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692718093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7u/YZ/Wut0bLQVB3sIyShhombPvduPeoIFrUf/4TCs=;
	b=NbcKa2ioUP+cwfxGVeJojChGhZU74aUPQl/Yhn7RSQeCqFrqdVsd4lqd4foJIe5NZgs9DE
	EBn2v7WzUXQJBPLpxm+qPwYynNxwseIkOkHWSqIwtwu3ifeL9jtRoAB2uZ+skel3WCaj1v
	HCOVGY8RREqpFwhaxbaqpj/lgOJ2SO0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-O_M8PMjbO4yigR1WEsMUgg-1; Tue, 22 Aug 2023 11:28:11 -0400
X-MC-Unique: O_M8PMjbO4yigR1WEsMUgg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fefc7845a2so3288785e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 08:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718090; x=1693322890;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7u/YZ/Wut0bLQVB3sIyShhombPvduPeoIFrUf/4TCs=;
        b=hgi/GLeYPdBYB6lp7YsobsWs3rJr5TjSzlgt/LqTOcUs6z4eY2lp1Y/ODz8Wv9XiB9
         DszotJNOO9FZ1CBGng74pt2LuPbCLIz08lo3q9rF6iMyI2yi0k/2GrDJt+iJyz72A71m
         af5204DZhwKtzd/Fto0cd62zF12oOo98r5ixNd2u1mZuGNM8a0Hbk8mJyJhQDR+Z35AF
         UhxVNzQUP7P5oi8KH/lDXaE/FiTet9RVt7ETvvkEc7+j1cszCPCCTfBLp+dWwgutJYg1
         HOp8WsH+/hsmVspa+qW0kIPqXeLH6ne2jgi4g7ZMj4vVqE1+nuHeD7KYi1mwhlzqjmLZ
         s/Ew==
X-Gm-Message-State: AOJu0YySSa6+ucwyAEvbAsgO5aJQN2ALjZISBF9qdlahgL1pYFW7btH3
	q8/UkRZfPaxjojFTp8o3pR6W1z1LY6E2iuOy1KHO9vmHTawHgd7UA/wBAQ+GMxCd66yVXlc9XnE
	ViGuoc+pO0RodkHr/ZaLEbf/BCg==
X-Received: by 2002:a5d:684b:0:b0:317:597b:9f92 with SMTP id o11-20020a5d684b000000b00317597b9f92mr7482695wrw.57.1692718089911;
        Tue, 22 Aug 2023 08:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhmcY7QpIcuWsmvQMDNEnSwssc+JVnL70SZ7OEjsgpDCceuGn/p5O/9IhA+49A189R7TloOg==
X-Received: by 2002:a5d:684b:0:b0:317:597b:9f92 with SMTP id o11-20020a5d684b000000b00317597b9f92mr7482669wrw.57.1692718089535;
        Tue, 22 Aug 2023 08:28:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:7400:83da:ebad:ba7f:c97c? (p200300cbc706740083daebadba7fc97c.dip0.t-ipconnect.de. [2003:cb:c706:7400:83da:ebad:ba7f:c97c])
        by smtp.gmail.com with ESMTPSA id d4-20020adffd84000000b003141f96ed36sm16156605wrr.0.2023.08.22.08.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 08:28:09 -0700 (PDT)
Message-ID: <ae86ecd2-08b9-1865-ad80-591cb4f4d83f@redhat.com>
Date: Tue, 22 Aug 2023 17:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
To: Jann Horn <jannh@google.com>, Hugh Dickins <hughd@google.com>
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
 <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com>
 <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com>
 <CAG48ez0S-RjAapaDiJ+oZXpn1vs9niWx54iqzusUScS-BYu0hw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAG48ez0S-RjAapaDiJ+oZXpn1vs9niWx54iqzusUScS-BYu0hw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Camp
 bell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.08.23 16:39, Jann Horn wrote:
> On Tue, Aug 22, 2023 at 4:51 AM Hugh Dickins <hughd@google.com> wrote:
>> On Mon, 21 Aug 2023, Jann Horn wrote:
>>> On Mon, Aug 21, 2023 at 9:51 PM Hugh Dickins <hughd@google.com> wrote:
>>>> Just for this case, take the pmd_lock() two steps earlier: not because
>>>> it gives any protection against this case itself, but because ptlock
>>>> nests inside it, and it's the dropping of ptlock which let the bug in.
>>>> In other cases, continue to minimize the pmd_lock() hold time.
>>>
>>> Special-casing userfaultfd like this makes me a bit uncomfortable; but
>>> I also can't find anything other than userfaultfd that would insert
>>> pages into regions that are khugepaged-compatible, so I guess this
>>> works?
>>
>> I'm as sure as I can be that it's solely because userfaultfd breaks
>> the usual rules here (and in fairness, IIRC Andrea did ask my permission
>> before making it behave that way on shmem, COWing without a source page).
>>
>> Perhaps something else will want that same behaviour in future (it's
>> tempting, but difficult to guarantee correctness); for now, it is just
>> userfaultfd (but by saying "_armed" rather than "_missing", I'm half-
>> expecting uffd to add more such exceptional modes in future).
> 
> Hm, yeah, sounds okay. (I guess we'd also run into this if we ever
> wanted to make it possible to reliably install PTE markers with
> madvise() or something like that, which might be nice for allowing
> userspace to create guard pages without unnecessary extra VMAs...)

I'm working on something similar that goes a bit further than just guard 
pages. It also installs PTE markers into page tables, inside existing 
large VMAs.

Initially, I'll only tackle anon VMAs, though.

-- 
Cheers,

David / dhildenb

