Return-Path: <linuxppc-dev+bounces-14866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1942CCC3BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 15:17:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXCRl1frtz2xrM;
	Fri, 19 Dec 2025 01:17:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766067459;
	cv=none; b=arLu2XLmRSUue6ozrSBKf8O8K2r2/8P/mHXpGug5UEpFWpTbF7W1brLn9qTNFgsdmCSpXgpgYDuJFz9GjWt6qZ9aE7718Hqjld89qmMwYZjgsnI0VA5gmU7fPhfMZYNmP2dEeYKLa5W3Pdvkp9RVmhjRDaHqfKzvN4X7nEEbWIvye9tWnymOU5xJpDdY6IVvDTWPvEHeaOk0t8+KNZcMN/G7koDGFzU9W5383BKL03bU4STdr97UW7Qanf4YaX8TyeslKfcLtHGwrD+TlnrW+lwiDfOSdS+TgsLIlUxwt2C1HHauZ26MBysLC5Dv1BwS848me5O7cAPemck55tY+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766067459; c=relaxed/relaxed;
	bh=fXzxKl4n/8RvMAsuC5o0CHJyqBCSHbh1Hg5d0ZUuzDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GWkBm8q0ot7BUXPv7DmVwrltu+7flrrj6NlC1WXjY5tScb+ERne7i7JUHc9d8F74tnOztWrTrhDEkb0F8KRXISwfySFI31iMqRxBKaxmH1cPnGUS2Dw+K/XadG3Z1vDYSNDeTuOrtNUTnyrxPgEeqfFce2VfFOhqAkj0f+s5IcMX0HAKsLrd8Op7TgYdfk6/5j876+TrSwHuOrU/bQNsYQfA2NfOqkmfnwlIeSCrH8aPL7YlRw6mqlL8kZBSqWLzOPq0ZVMQ6JauPNmNNlalOpvFq37kct9T5jKdTyE9dllLfvnCyyS+RD9v2h0wN91pkcBcSqK5EHimbXMQAPJHTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KCtayaKS; dkim-atps=neutral; spf=pass (client-ip=74.125.224.50; helo=mail-yx1-f50.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KCtayaKS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=74.125.224.50; helo=mail-yx1-f50.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXCRj03rVz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 01:17:36 +1100 (AEDT)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64475c16a11so775971d50.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766067393; x=1766672193; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXzxKl4n/8RvMAsuC5o0CHJyqBCSHbh1Hg5d0ZUuzDk=;
        b=KCtayaKS3nVPYHupOEQNu2a/gig4yO5I/3UdXvXe2CMzodQv/nZ33Lb3YEoDYPRHoG
         nwK0xarpzRdqp2F0NWX0gUOVFs61HIxjhXe4qvWEM7Ds+9Xbf1ixTSiors+UgTTbJD/0
         Nt1yskHd0/+pl7BhszsKtq5KVAWm58sUQ7qTLv3qQY4zXos2rdfL/YpqKAdkBywW+Y5g
         YvtvHxyOwHR5bWnG0cvF2J03OCIcxI1WmtYSffgBO7jM3YhS2Re0ijMvJc6uyVQ+XpEZ
         ffFcujlJMLdfIcMPG7D1SUs+wcDobv+0z5BTC0a18Y6CPIPohY+dOnuG+yUocg5cxU2u
         P//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766067393; x=1766672193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXzxKl4n/8RvMAsuC5o0CHJyqBCSHbh1Hg5d0ZUuzDk=;
        b=ZGUIST6Pk5RdTsAiFppQzUrdqG92vn8+1ClJ9vaLprpBrnEp8KGnnZKVe80ftP3L+B
         XmjegRX20/wYIWZ17LcVebXlJFUrquYVxZ6CNsPw8iWC0Xwf3mSF8l6qRZZq6yjbbY4l
         1xGgtYYi0pziAE1s2MDjlDtrCCkcYwmPV/lqHHTV5jbyJOUWeSa0FLKBXlWk6QLplTlY
         rXe9fI4iDmmul/tJLjkSRHtBJ+OiCOt4qEemXaeyHkexxKflcXfH/4EHdfT6YwI4qwan
         qTlB8i1C/ftlIWwEPnTfOrpEUa3dd6JmKFX7kiJNAmp8oIuiEBbQFxXD9CfUWTUcED8Q
         MF5A==
X-Forwarded-Encrypted: i=1; AJvYcCVwFsz7uRR0VpDmsxFN3Tny2rt6vOGyaA2950qkhTCmH2qfw2ET0yNTt9s+IIfYJ1NZFugpU8F5XNThtVY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwP4E7Fk+cWqbule0ms2prpccd16b1A1fORssh3fSEwfUsV6wND
	NOIRoWbvQoldpX8E4fi5Lfcy1hmsg54SjgQnrhkgu/YpRO5u2TYcpmaH
X-Gm-Gg: AY/fxX5P0omal9jW42de4/GuzfAlaZR2x9y/vUitD+rQftVNmrI9/Rc32+l261/BoyW
	PN9JijOkNaw51JMLmbyIfruQot0u934GsKfOMdnOwAaj6VSTMfiWelwk8zVwbCXUkg8TE4bJJo9
	wqwq4aukPV9abP4uclPMZsLA6ste7164GGiZ5nf/PABmsiWbSLs/Gsn9rOHRb8A0FK1Vc0qhtmt
	TfOrYIKGALJItf5AranqTL5wMlSJJBnp0hWYjrDfjA0NU6j94CVFzvHI680ZW+5S+0KnCuzqLOa
	3/yqx4vIbqy4WFqYg2uWcOIWpoaWqUJP3WSrd8F+EtaA4+AcgqM3TsdiGSFRO9do7AOqNAM9YUA
	1bjpSsNwmC0pqmEiICUEuORgcs8If5mOZzNyVNdCGk9EMg84cr/qurc88OyjVtvplKMja1/jf6X
	nAFgRsrscK3TNhY4KKIXThDA094CpNXuFTGOI6lQ==
X-Google-Smtp-Source: AGHT+IHiyiDMA9Ch4dS+LVHDAxXzncC3LuoMgD0ZQuZ+G9ON0TWb1O0iMOdyZnWTo8KMI06Ox9pplg==
X-Received: by 2002:a05:690e:4086:b0:645:5a9f:8002 with SMTP id 956f58d0204a3-6455a9f836bmr15444591d50.6.1766067392483;
        Thu, 18 Dec 2025 06:16:32 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fa72b48efsm8363757b3.51.2025.12.18.06.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 06:16:31 -0800 (PST)
Message-ID: <4249e49a-c91a-4e9c-92c1-79c272627540@gmail.com>
Date: Thu, 18 Dec 2025 22:16:05 +0800
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
Subject: Re: [RFC PATCH 1/2] mm/pgtable: use ptdesc for pmd_huge_pte
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, alexs@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Thomas Huth <thuth@redhat.com>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Magnus Lindholm <linmag7@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20251214065546.156209-1-alexs@kernel.org>
 <52e2c1eb-67cf-41ee-9088-760fb6258153@gmail.com>
 <ee42b057-b2d1-4a61-a6b0-39f81f78a918@kernel.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <ee42b057-b2d1-4a61-a6b0-39f81f78a918@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_BL_SPAMCOP_NET,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/12/18 18:01, David Hildenbrand (Red Hat) wrote:
> On 12/15/25 01:53, Alex Shi wrote:
>>
>>
>> On 2025/12/14 14:55, alexs@kernel.org wrote:
>>> From: Alex Shi<alexs@kernel.org>
>>>
>>> 'pmd_huge_pte' are pgtable variables, but used 'pgtable->lru'
>>> instead of pgtable->pt_list in pgtable_trans_huge_deposit/withdraw
>>> functions, That's a bit weird.
>>>
>>> So let's convert the pgtable_t to precise 'struct ptdesc *' for
>>> ptdesc->pmd_huge_pte, and mm->pmd_huge_pte, then convert function
>>> pgtable_trans_huge_deposit() to use correct ptdesc.
>>>
>>> This convertion works for most of arch, but failed on s390/sparc/powerpc
>>> since they use 'pte_t *' as pgtable_t. Is there any suggestion for these
>>> archs? If we could have a solution, we may remove the pgtable_t for 
>>> other
>>> archs.
>>
>> If s390/sparc/powerpc can't align pgtable_t with others, we have to keep
>> the pgtable_t to bridge different types. But we could take step to
>> change pgtable_t as 'struct ptdesc *' in other archs. That could
>> simplify and clarify related code too, isn't it?
> 
> Not sure. s390 and friends squeeze multiple actual page tables into a 
> single page and that single page has a single ptdesc.
> 
> I was rather hoping that we can make the code more consistent by making 
> everybody just point at the start of the page table? (that is, make it 
> consistent for all, not use ptdesc for some and pte_t * for others)
> 

Got it. That would be great if owners of these archs like to work on this.

Thanks
Alex

