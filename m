Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D95923BFF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 13:03:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WTeYbF90;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hzX7/nzn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD0Px4DRBz3ftj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 21:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WTeYbF90;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hzX7/nzn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD0PG16tPz3frP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 21:02:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719918154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UL8IHyEAzzEhuqWUqFBrX1hYRvB3a6Us/wF14KpIMm8=;
	b=WTeYbF9045mnI4qmZ70HoC6XOPbyBODdDkWMWh4X+1PylHyF1ud8xoEe9WDY7c1utM93zp
	vpKw6wSbFIVrzKaKlwuETOixoN1mCnKH2vOrYqxN0V2h8Ipi/DU3WH8d21vKB6/o4d1nwU
	rpaH/B/1P0cRBTc95+CEVQTPFT/ZDuw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719918155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UL8IHyEAzzEhuqWUqFBrX1hYRvB3a6Us/wF14KpIMm8=;
	b=hzX7/nznnaa+6+t+kwpn1SRFfbISdXmhfNui/Ta4DJAUzE9yJQQApcAfs+6IIhhyMjnZFu
	9K5cTFAlZhzIQ2UuoanS/64zZ0rTGkdKgrmd4eMPDn1bHm02nZEGou8fp2R1dSf9EndlEb
	XaGueMoPXfYPpQ4vWtoZkdBZmKwYYcc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-tRwEv0elMNuwBe-CZC34QA-1; Tue, 02 Jul 2024 07:02:32 -0400
X-MC-Unique: tRwEv0elMNuwBe-CZC34QA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-363edbfc61dso2150195f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2024 04:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918151; x=1720522951;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UL8IHyEAzzEhuqWUqFBrX1hYRvB3a6Us/wF14KpIMm8=;
        b=eng+pmoCK4ZQtlyyCFV36/PBqvLml3Pf5uv8TUEI3AkjsTs/+TsveD5k942B1xk2uh
         4rHG8S6hkx//FLN7wATAzrLbuVA91ipKYUKc0rnJF/F+JhjgfZRhQrFKUXP9vZ39VmlB
         dG/BI9b+qIpV5sz0qo0TdEqACFJEA7D4Jxi1quFmBg+KbcptKyJ3IcL1lx+i9KczCQbq
         GrsNGeTJyzDwWllix5AV1XLVpP0QSa/GgJ6o2LHKSCimFjcTY97hUfHd6EnCX9pbLS8o
         R+eLXwQE9kZ3QdWBAmZEsd9JcMLSCe1dDNzpDH+KCAir2u5G4biJ13vQpvjoTA6weItl
         Up5g==
X-Forwarded-Encrypted: i=1; AJvYcCUnBWuBa1+rBuCF+ap3ZN+fzn1Sn8BXOSaLPOltznLhavXBhmeEkYFAnJJ0Z1jK7jtpYJbOOU6CfV8AeZUPkUOU90NXbsWz794cQBCaYA==
X-Gm-Message-State: AOJu0Ywc1kwoYGzhg4vlyGxUFsl64d9LwqI1YTWJATLDVhXfulrxiq6w
	zX/Qb714alDr5A+w0sSgzLYw4ea2/LjcSlcV+gtd6LiIshB1R3zRQMHObId8GWOMWOPFjvi86W0
	4wEqONx/Bq9n6iENuTirU6TUFLiWnLM3i7g+6T21e2LAz4y+6yuDYbJHWNaaVnWg=
X-Received: by 2002:a05:6000:1bd1:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36775725c29mr5279859f8f.56.1719918151422;
        Tue, 02 Jul 2024 04:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsWBU7bpbDTnWN0KIwHats8EvGUXSpFzRTluYA8doiuhAlqNN/TYVapDq2HAfSv1xUm1Jzhg==
X-Received: by 2002:a05:6000:1bd1:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36775725c29mr5279833f8f.56.1719918150932;
        Tue, 02 Jul 2024 04:02:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c739:2400:78ac:64bb:a39e:2578? (p200300cbc739240078ac64bba39e2578.dip0.t-ipconnect.de. [2003:cb:c739:2400:78ac:64bb:a39e:2578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678aa3caccsm676393f8f.35.2024.07.02.04.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 04:02:30 -0700 (PDT)
Message-ID: <0b549ff0-b0b6-4fc8-aa6f-0d76157575b3@redhat.com>
Date: Tue, 2 Jul 2024 13:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] huge_memory: Allow mappings of PUD sized pages
To: Alistair Popple <apopple@nvidia.com>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
 <bd332b0d3971b03152b3541f97470817c5147b51.1719386613.git-series.apopple@nvidia.com>
 <cf572c69-a754-4d41-b9c4-7a079b25b3c3@redhat.com>
 <874j98gjfg.fsf@nvdebian.thelocal>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <874j98gjfg.fsf@nvdebian.thelocal>
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, linux-doc@vger.kernel.org, djwong@kernel.org, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, logang@deltatee.com, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.07.24 12:19, Alistair Popple wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 27.06.24 02:54, Alistair Popple wrote:
>>> Currently DAX folio/page reference counts are managed differently to
>>> normal pages. To allow these to be managed the same as normal pages
>>> introduce dax_insert_pfn_pud. This will map the entire PUD-sized folio
>>> and take references as it would for a normally mapped page.
>>> This is distinct from the current mechanism, vmf_insert_pfn_pud,
>>> which
>>> simply inserts a special devmap PUD entry into the page table without
>>> holding a reference to the page for the mapping.
>>
>> Do we really have to involve mapcounts/rmap for daxfs pages at this
>> point? Or is this only "to make it look more like other pages" ?
> 
> The aim of the series is make FS DAX and other ZONE_DEVICE pages look
> like other pages, at least with regards to the way they are refcounted.
> 
> At the moment they are not refcounted - instead their refcounts are
> basically statically initialised to one and there are all these special
> cases and functions requiring magic PTE bits (pXX_devmap) to do the
> special DAX reference counting. This then adds some cruft to manage
> pgmap references and to catch the 2->1 page refcount transition. All
> this just goes away if we manage the page references the same as other
> pages (and indeed we already manage DEVICE_PRIVATE and COHERENT pages
> the same as normal pages).
> 
> So I think to make this work we at least need the mapcounts.
> 

We only really need the mapcounts if we intend to do something like 
folio_mapcount() == folio_ref_count() to detect unexpected folio 
references, and if we have to have things like folio_mapped() working. 
For now that was not required, that's why I am asking.

Background also being that in a distant future folios will be decoupled 
more from other compound pages, and only folios (or "struct anon_folio" 
/ "struct file_folio") would even have mapcounts.

For example, most stuff we map (and refcount!) via vm_insert_page() 
really must stop involving mapcounts. These won't be "ordinary" 
mapcount-tracked folios in the future, they are simply some refcounted 
pages some ordinary driver allocated.

For FS-DAX, if we'll be using the same "struct file_folio" approach as 
for ordinary pageache memory, then this is the right thing to do here.


>> I'm asking this because:
>>
>> (A) We don't support mixing PUD+PMD mappings yet. I have plans to change
>>      that in the future, but for now you can only map using a single PUD
>>      or by PTEs. I suspect that's good enoug for now for dax fs?
> 
> Yep, that's all we support.
> 
>> (B) As long as we have subpage mapcounts, this prevents vmemmap
>>      optimizations [1]. Is that only used for device-dax for now and are
>>      there no plans to make use of that for fs-dax?
> 
> I don't have any plans to. This is purely focussed on refcounting pages
> "like normal" so we can get rid of all the DAX special casing.
> 
>> (C) We managed without so far :)
> 
> Indeed, although Christoph has asked repeatedly ([1], [2] and likely
> others) that this gets fixed and I finally got sick of it coming up
> everytime I need to touch something with ZONE_DEVICE pages :)
> 
> Also it removes the need for people to understand the special DAX page
> recounting scheme and ends up removing a bunch of cruft as a bonus:
> 
>   59 files changed, 485 insertions(+), 869 deletions(-)

I'm not challenging the refcounting scheme. I'm purely asking about 
mapcount handling, which is something related but different.

> 
> And that's before I clean up all the pgmap reference handling. It also
> removes the pXX_trans_huge and pXX_leaf distinction. So we managed, but
> things could be better IMHO.
> 

Again, all nice things.

>> Having that said, with folio->_large_mapcount things like
>> folio_mapcount() are no longer terribly slow once we weould PTE-map a
>> PUD-sized folio.
>>
>> Also, all ZONE_DEVICE pages should currently be marked PG_reserved,
>> translating to "don't touch the memmap". I think we might want to
>> tackle that first.

Missed to add a pointer to [2].

> 
> Ok. I'm keen to get this series finished and I don't quite get the
> connection here, what needs to change there?

include/linux/page-flags.h

"PG_reserved is set for special pages. The "struct page" of such a page 
should in general not be touched (e.g. set dirty) except by its owner. 
Pages marked as PG_reserved include:

...

- Device memory (e.g. PMEM, DAX, HMM)
"

I think we already entered that domain with other ZONE_DEVICE pages 
being returned from vm_normal_folio(), unfortunately. But that really 
must be cleaned up for these pages to not look special anymore.

Agreed that it likely is something that is not blocking this series.

-- 
Cheers,

David / dhildenb

