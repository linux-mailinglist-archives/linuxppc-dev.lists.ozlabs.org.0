Return-Path: <linuxppc-dev+bounces-10019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD0AF0DE5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 10:25:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXCdV5qK8z30FR;
	Wed,  2 Jul 2025 18:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751444734;
	cv=none; b=imwPBUkWag92CY5IpVHfwYkWWcVyGFFXOLuWnkIcH038QywntM8X5J7eEGMXhB31VyuOeUCtyxtLyMGSMLaAnysCB2rJeotvhgj/Atakl7jFrr4P+H1wRV+dLSJrwwTIWag2on98//K17JehyJJbir4tCtP1Rh11AV5d29jt2T/RyCNalOSMFeMMSvMAS5iwQjdhN6NAyTso6TABcirJ/c2pU61OJ7ASh3gsJY8LGnigg0UqzgGxGyun7qd7RaUAYuTZnX1HBv/j+79lyCDfte749KfC9+tYuW2MCQwCPzcmF2UfVbU8WdahFdxRGKRdBziU/F1GOhLcRVLQ7cwifw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751444734; c=relaxed/relaxed;
	bh=OvDgMJR7If16brpfVPQ8a4d5ZRO1JM0Tn+iRiJR4jHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs9kmRTmwh2P3mwn/gzJcwS/pvEXp36DHxAKcp4+c7H01E/BIBtX8RmVOSwvjzNZ+wHdILGGo/v5GvK1u+CnXg84F/GBeej+zkCOWduQ9J5ZFLLCUz6/acjM/Tnx6KK2NoBPzw0OExiUa4B5reB/htytBSz6WdmO3F0npureeH6p/TK4RkbUBjrxm3RWj0WDoezg2bLFRR9hn6zLoJvETzEue3YI8PZX9YXrFRC7Tu2Fkfy3m2wZot5W+JiVNrpEQCFVPvgAQH/JCYz6o3qCrkuk40xpiSF6SkwsfkY9kMi6jL0SLyybo1NuLTYY+G6btQQDGZxcUKbRrhZhuUpyCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eILuffrf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eILuffrf; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eILuffrf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eILuffrf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXCdT4PHrz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 18:25:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751444728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OvDgMJR7If16brpfVPQ8a4d5ZRO1JM0Tn+iRiJR4jHY=;
	b=eILuffrfxP/4OvSOt84CDAdifZfymOJKyUyXIALRXP+RehsW4BC7JhesdMnBvfaMQ4i/49
	Ry/jGFOtlVmnmkBdKUcOyBMdkbxdS+14JOsvJQpmpNxqgj5sf256hKZGnWAuxAvk1DMdTr
	XWTGTVPyXXzRxUGRVj3k64NwRyus5w4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751444728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OvDgMJR7If16brpfVPQ8a4d5ZRO1JM0Tn+iRiJR4jHY=;
	b=eILuffrfxP/4OvSOt84CDAdifZfymOJKyUyXIALRXP+RehsW4BC7JhesdMnBvfaMQ4i/49
	Ry/jGFOtlVmnmkBdKUcOyBMdkbxdS+14JOsvJQpmpNxqgj5sf256hKZGnWAuxAvk1DMdTr
	XWTGTVPyXXzRxUGRVj3k64NwRyus5w4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-e8Wa08tXOdOsJUo7YppjuQ-1; Wed, 02 Jul 2025 04:25:27 -0400
X-MC-Unique: e8Wa08tXOdOsJUo7YppjuQ-1
X-Mimecast-MFC-AGG-ID: e8Wa08tXOdOsJUo7YppjuQ_1751444726
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso35273245e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 01:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751444726; x=1752049526;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OvDgMJR7If16brpfVPQ8a4d5ZRO1JM0Tn+iRiJR4jHY=;
        b=H97N6M3mIzhvovPZp3wNdu5PNzSKTGMVnCHE/2JN/aTzaCAbrinAbihXrWtpJAU34P
         j47W2+NJXrIJcMYpfkwsdhyzY2CE6zisaTML+YNoEhWNyiNNCvXAmoK9wcQLn8be1yHq
         x//VD26whrFsQ4vZ9gk54cI6t2nkucTB9NRH704ka57tu/LSAOYvC8bzYPc5rX1LrHEg
         1+l6F6letDoS3t1MBPEk2KvdT84CyGPG1LUOR5VslC/nqyBzEPj04RwJvTKQpJoIFgfp
         D5S/IxY8SJb3UouJPDS4jlTc1Zai/EVsF8IAywzzn+gR2pvgBfqDP8fTgO72lsCBw991
         cvpg==
X-Forwarded-Encrypted: i=1; AJvYcCVDZtTGJ2vrp4ONutJkWVHxUcbCymL9c0OlAQ2rrUc3J1EH/Q80tJBJpHBN7/R/Fy72JNjdVWuRmlutBRQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxO/RrAC9w6awqF0aTuy6exgDqnalt40RXVz6uy0n8SE+6t6vCg
	Cko57NCCvV5CUjX3PvAQUTgKFZmqhgyfjreUIVrdOFzKVjmVDI7AAhnNlbhU0PNPi/OpghvPSvl
	OJfW/HxVVYvCgrxHWtFFbEhRUtGUBxWO7x+VMLcpYVx7QqkBJ4uMhLrJLkU60XMsPKDw=
X-Gm-Gg: ASbGncsqvC5KY96e9EOAzPp5P5rNTui6buAgWzd0RQdoksYRzSRuO8FI4CIRGXr6OcT
	UIc0J2A7veOS6OiYtX+jcayD3oqFo9vZixyVfEH7jgwT88qNE0SmmSJ41BCZ3ouf5cBG6WARRE2
	rpHzFCtHkWJfnJm5crHMzc52upua35XUM7HMICxy7Y3vPPDf+tcHfH2gl2rsBTtul4I0TODLfJ+
	EQAvWx9gkIq+wOLl3mEvPViVFFat1TVdcyeVStYCroa8sfCa4MxNCadhQl4Yr0SXrvgAvF6yGKC
	ErNe1OX2H+EPqa+Ii6JUVVeQH/d6ofevjzKHxAXqdkcWY3CH0I7wWkw=
X-Received: by 2002:a05:600c:c0dc:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-454a3c610camr13188545e9.14.1751444725805;
        Wed, 02 Jul 2025 01:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOJzOQgdPny8RvF9/NZMstcP4GmeGcDGHKxjBeQFmtTXoydP6Z6ks24gXdPezTJYYrWauOEA==
X-Received: by 2002:a05:600c:c0dc:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-454a3c610camr13187545e9.14.1751444725107;
        Wed, 02 Jul 2025 01:25:25 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm194158805e9.27.2025.07.02.01.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 01:25:24 -0700 (PDT)
Message-ID: <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
Date: Wed, 2 Jul 2025 10:25:22 +0200
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
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _BYG1DjNqzSPlhFeUCgcp0fNRx0garP7v1Ystd7FLKs_1751444726
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.07.25 10:11, Sergey Senozhatsky wrote:
> On (25/06/30 14:59), David Hildenbrand wrote:
> [..]
>>   static int zs_page_migrate(struct page *newpage, struct page *page,
>> @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>>   	unsigned long old_obj, new_obj;
>>   	unsigned int obj_idx;
>>   
>> +	/*
>> +	 * TODO: nothing prevents a zspage from getting destroyed while
>> +	 * isolated: we should disallow that and defer it.
>> +	 */
> 
> Can you elaborate?

We can only free a zspage in free_zspage() while the page is locked.

After we isolated a zspage page for migration (under page lock!), we 
drop the lock again, to retake the lock when trying to migrate it.

That means, there is a window where a zspage can be freed although the 
page is isolated for migration.

While we currently keep that working (as far as I can see), in the 
future we want to remove that support from the core.

So what probably needs to be done is, checking in free_zspage(), whether 
the page is isolated. If isolated, defer freeing to the 
putback/migration call.

That way, it will be clear who the current owner of an object is 
(isolation makes mm core the owner, while putback returns ownership), 
and prepare for some pages to be migrated to have a permanently frozen 
refcount (esp PageOffline pages without any refcount).

-- 
Cheers,

David / dhildenb


