Return-Path: <linuxppc-dev+bounces-10021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79973AF0EBA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 11:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXDS94GVrz30LS;
	Wed,  2 Jul 2025 19:02:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751446953;
	cv=none; b=Y9l4Xxw1Ab1txPGPVWd+hLFECTRphwDB0xy/D5+TM8zwyut0So6KcQ1LeqjUvSAx16DLz3FKUFMwhsPf3rMal/9d1URR81WfVJHFHJCwFTK+4xOWCC5hk8xACSQjbc3HiqBD4Vf4HkL3GLB2oWecQ69QVWV1ZSwfJ1oNwcUIO54YWoiTI4xjc0hpdrNsMZJIMk87g4G9zO8BsPsk9FduFJPP7jU0EmW279O6zFORsY5vx/RBHusB5m38xyHenH1UP9KG7ac6Z+7DZhJD/fW9HlaL6wEqcKIgDArioClnoV1/ovRV3h+R++13TMzj4fBe9u5iAazUKyZzxamGYfXZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751446953; c=relaxed/relaxed;
	bh=boAaIYoMY3PoB+UV5kPDMx3wMNUIYKiXfBN5feJckdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nnq3HRlsW7EAunML1H7LIP7XK9DLpcOY61oIYQuBvu9s7rCcxBEmz1SrgqEme7Wxeubh8hdz+6n33no+/ym2gmMKYA62R+pXzmROtRJX9KE6npbKTonKBjS+D6BOWPfqqSiBiG5yUWxEl4Vk6SO0RozuTOUcMHyhyMmRkkOAfp2j9Xn8okhsB+4yIuqIrQsvogifX5mTi0C4mUk1Uos/M2Zw/zo473aBfTH8pqzhB6N7bfmon7bYWW0lsmKO1MBFTTlvdnekZkK3ACRG6zs0clR1Ry86rg84fPy20/Vn5o8PHmgvMX5GkoDRV/M8rHCbiEcg+79FaRLzZ0YajCe5gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W/LJ6t3S; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBq0Stl2; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W/LJ6t3S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBq0Stl2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXDS85S81z30FR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 19:02:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751446947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=boAaIYoMY3PoB+UV5kPDMx3wMNUIYKiXfBN5feJckdw=;
	b=W/LJ6t3S04DkcqykqSZqtONKY12VwSlVVpKCyChlx2RuotT9nkbcrSCtE4M5Z1tm0b31Tx
	nN0d2UW1ypHFjGcOzihEmX+y3n2K/JOYzG5JVUSd21aIbDPfqqf8CLH60sAU+vDmF4xBCC
	LgWe/sEtzVbQmSJqZCys/I/lW3uUgtI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751446948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=boAaIYoMY3PoB+UV5kPDMx3wMNUIYKiXfBN5feJckdw=;
	b=hBq0Stl2tymIW/9gFNBQSA0EtPVQy4QspkoTDM1497xofRrNcplS3ZdFlnKibV7M3w1K39
	qteTwI1NoCC0Z8KNK88k/tv0OfJKBkhzB7nm+XX3MCRWZTl9LZ6gMNuaP9UJfalUH4d7AH
	6fezWMRaThe+/wyD0k0hoTVMGJ8TMVU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-EsdzvpjiOW-43Afs8mjPeg-1; Wed, 02 Jul 2025 05:02:26 -0400
X-MC-Unique: EsdzvpjiOW-43Afs8mjPeg-1
X-Mimecast-MFC-AGG-ID: EsdzvpjiOW-43Afs8mjPeg_1751446945
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3b20f50da27so228301f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 02:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751446945; x=1752051745;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=boAaIYoMY3PoB+UV5kPDMx3wMNUIYKiXfBN5feJckdw=;
        b=Qk17OyPblqhy23MMhk7R8YCJDnWwSwRyP6gbNebI++OC7G1r3SA/9/OetwZCR5xz7O
         hm8xYCsYuD773RrQl9dmyLQOX4/1Q1GvF7eSf1t3wShk9KXrEEWuIn/+UdWmmk2hKgaP
         GlQvAOZ/yGD+BkLnIgSyRs+kphupe7HIdopRifX27vExWru59eRNfV8sFsHfzJY7Qwd/
         c8EcMIzpbEfOfoI5sC0/HgfyZ+pjI9Th8fk9gKyQv0Uzxh20+UCp3Iyp994W1cUn8v2x
         U1ZUKYFxRMwngBtuIZ2IAVBbO9GgHBag0ja9cpnBfvcOeP5amxL0BgqnmIHHoxCfIa/k
         g9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsSZo+BWEECF2vXAgA1CoqWky8KnzozVHKfwHW7CJ/BQBQbVHFVLqu51vNo4Gyg3oiY8qdYwj9qM3ivjo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEDXylfjfkqYyviFXPGehmMI5mfJblOUdLvfSUh04ZHMXZOyR2
	BohbA/oDvvBKgFIGvhxU0daVDJtPRBxBMZb1bTVb2aPFRNjF2XnVxTIJwkwwfMhRmqH/yvCFcIh
	VV8a356df1lpBznzQhXedYTc310NPUFuoBVXYN07tqvnPFVk0slYDQFYi2y2N1hVw6aI=
X-Gm-Gg: ASbGncs1PqMnmRi654+JpthtRGUEFUBadviK4AiqhqVRIE6oIbVUbkZhVvANESGsW4H
	lI6iv+cGyEprroN8ZlI7Zv6AxfbwMDmKZlwvm2lZ4wumJKYm64cTgRim52qa1xlUMs2vbZ8uZ0G
	3+xHpyS8BMnCBbm6qCGb4NjkKsRTefwDIbX2LWxmvp1yvExyXn2z9Rfnx/S7k1dS79vJ64DXQo2
	haeDtEZnwJ8oa5FI6QdbE/Oh4bicqzzmNNgyD39jaIEjNzPUfT7+Q9+JhTHFuMvQw327nutdDU1
	K8ft9mnagkD3OHTRPCZ6qrn03XgCvA7SWr2fJtJAT/yj0XnX0CZs1nE=
X-Received: by 2002:a05:6000:4a10:b0:3a6:d95e:f39d with SMTP id ffacd0b85a97d-3b1f5de32cdmr1298327f8f.4.1751446944977;
        Wed, 02 Jul 2025 02:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqiOYXY3w17HGytPrmt/c2dKtPFnAg0d2EGsHFzi5ze2SIJjD0kNsNr+fZES4VE0BbBq1yUg==
X-Received: by 2002:a05:6000:4a10:b0:3a6:d95e:f39d with SMTP id ffacd0b85a97d-3b1f5de32cdmr1298264f8f.4.1751446944476;
        Wed, 02 Jul 2025 02:02:24 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c99sm15308587f8f.49.2025.07.02.02.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:02:23 -0700 (PDT)
Message-ID: <a6326fca-3263-418a-be3a-f60376ed5be0@redhat.com>
Date: Wed, 2 Jul 2025 11:02:21 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 23/29] mm/page-alloc: remove PageMappingFlags()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-24-david@redhat.com>
 <8ff24777-988a-4d1d-be97-e7184abfa998@lucifer.local>
 <ac8f80bb-3aec-491c-a39c-3aecb6e219b2@redhat.com>
 <d7e29c51-6826-49da-ab63-5d71a3db414f@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d7e29c51-6826-49da-ab63-5d71a3db414f@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k-Bt_BW86mTsJdxOOR8CzCGRjO_1W6Q0YwoNAdCjpu4_1751446945
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.07.25 10:49, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 09:34:41PM +0200, David Hildenbrand wrote:
>> On 01.07.25 15:02, Lorenzo Stoakes wrote:
>>> On Mon, Jun 30, 2025 at 03:00:04PM +0200, David Hildenbrand wrote:
>>>> We can now simply check for PageAnon() and remove PageMappingFlags().
>>>>
>>>> ... and while at it, use the folio instead and operate on
>>>> folio->mapping.
>>>
>>> Probably worth mentioning to be super crystal clear that this is because
>>> now it's either an anon folio or a KSM folio, both of which set the
>>> FOLIO_MAPPING_ANON flag.
>>
>> "As PageMappingFlags() now only indicates anon (incl. ksm) folios, we can
>> now simply check for PageAnon() and remove PageMappingFlags()."
> 
> Sounds good! Though the extremely nitty part of me says 'capitalise KSM' :P

Like we do so consistently with vma, pte and all the other acronyms ;)

Can do!

-- 
Cheers,

David / dhildenb


