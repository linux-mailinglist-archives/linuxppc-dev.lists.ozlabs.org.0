Return-Path: <linuxppc-dev+bounces-13125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839BBF821D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 20:43:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crh550Rd6z30V7;
	Wed, 22 Oct 2025 05:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761072200;
	cv=none; b=ZK9WRdpZl5ox0WkocbXC5kqAV1GR3JY/t5+WGjeGpQ47vJX8xZUvuwP4PJ10S7mAB2mFur1fLGgbnvGAg6IgvE/4HQnpW3x8L9MbWdx8z025XZyKqgDLQCgiF1BsFb0TQGmPzaQoBFuB2TOzz9SGR17rUuf/6oepAh4FM7xn7Mbb++lKSICg0ljr/5p40I+41etmz3x+WTKfHK7P+0iISLqYxJAN7eXkf7MJc4Nq2izbHR9Z0h42yVgTiNIbV7mOPR7sq7ToqVw5O0kWGZKFLs29pbH5COlGAspK9BRWzowLCl0PTEEpuY8/a5i2ZjgNAkfQsYfCsKq0U9BHdb6Nng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761072200; c=relaxed/relaxed;
	bh=4/1n5Qmv6fUzICSy7SJ2nfo+Y+QoRpq1dX3+wvV2FX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSLos/AMlQjjT/kfxqsxO7JMTVLJzQw5I7tmFhWqkoOHuZpmLW4pYX4pr0nF3GhzPa0yrmacx+SwFyMDRkIX57YmywmnKHj6oiMq/M3/JQx1k0n9BEw9xzR5AmP34PRZfrjrDEcs22C/AiE5qTMhYmLXqMX+0xZZuI8nhc1+/bNLoDVx/ivGayXChWFVvupJU/HcjrC0IzGL1aRoH9F0NtkF9i8ImwNUgvX9+qLYyIAItZWOPzWsaL1et0tWhXJxGxlc0jOeCT/QUvnTEBuLI2ump3+F59/hx5i91SwcI1mc6W75Ll+/r9jLL9lb2M3X9IUQcGedM4/kowfxhKUTAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgU9BbM9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgU9BbM9; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgU9BbM9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgU9BbM9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crh534Jp7z2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 05:43:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761072194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4/1n5Qmv6fUzICSy7SJ2nfo+Y+QoRpq1dX3+wvV2FX4=;
	b=TgU9BbM9VB+7stTUOY9Ycv+kx3goucFW/jFXdxctZDBCboV/d0NrDC/s9mHr3WQJCFAiLa
	AkovqnvdXygbJwvy+xqoW8X20kwJSLx3udFEnMDyslDxnw7qea7DuA5lyH01J0P860Aeeu
	vrXrbNncXUOdAe1Nqrvj7bLt4y1fwfM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761072194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4/1n5Qmv6fUzICSy7SJ2nfo+Y+QoRpq1dX3+wvV2FX4=;
	b=TgU9BbM9VB+7stTUOY9Ycv+kx3goucFW/jFXdxctZDBCboV/d0NrDC/s9mHr3WQJCFAiLa
	AkovqnvdXygbJwvy+xqoW8X20kwJSLx3udFEnMDyslDxnw7qea7DuA5lyH01J0P860Aeeu
	vrXrbNncXUOdAe1Nqrvj7bLt4y1fwfM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-Zi-iUE7-ME6dReSz9UJ2bg-1; Tue, 21 Oct 2025 14:43:12 -0400
X-MC-Unique: Zi-iUE7-ME6dReSz9UJ2bg-1
X-Mimecast-MFC-AGG-ID: Zi-iUE7-ME6dReSz9UJ2bg_1761072191
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47105bfcf15so32975725e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 11:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761072191; x=1761676991;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/1n5Qmv6fUzICSy7SJ2nfo+Y+QoRpq1dX3+wvV2FX4=;
        b=JaLXDABu+0j3B+dnClWc6IgW/fzKb3PoIrc9iIfaie8uPl6M1YcLTTUDKtppA8bjBZ
         ARmHVNhyuDMrusmX8f9yJ8iNTlFVNnV0z+QKe5e5TF7L/ZqU/ht6PPAHhpmnZXXOBWq4
         dvL9YvOX55yOzm0kpePwVOvA7G5xpirfRHq99RGpFP6Z02/S3ZSxPgfHK0WP/q9QoiGo
         RV/1CupxGDUodJqHnCMYPiD9W6uNq98Iz/G+nd2dBAJYywnq4caj2SXC6SKDP9r89NLd
         1Hmj2ydGltlho4VgwHKJExhJc1VTWZojm6NEiBiWjFBMSQ3X8TypypM3XIoT8M0jjB+X
         yvaA==
X-Forwarded-Encrypted: i=1; AJvYcCXog+6ZfYJonDui3qruU+iiSdZxb9CwbFKSQUsXtIntwyWKlLbS2s0o9PTarZ/WuRnTrCB8HJB9zFTN86U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4SFzxCG5TAxwI+VWTpwaUsQ6ETwywotKpbfRgq+6b4Qtxpyl7
	BKRxWdU6TL5goBHnxJ5EmMaRTFlmixL8ookfmoNLR8w/m/mTxqOInPqt43bkkBXBkpXHBILADpa
	qsGInCHrx1CXzmZiTCTWa+5Y1tLM9FFTJAsqKjIHPp0n4x/FIYta/wpkbEhCq4y8wFjA=
X-Gm-Gg: ASbGnctuGRDLbuXYj/e6ncnThrddCs23fvMPtT0NbSWxKpxvM6Rc8B+8m8VJBW7DRWr
	YssLduXrMgF3ZU//5rppTtVB1bdZoMFDtW8mUvguavATa8H10A4XNHYyIia7aoljyA/uE9WRx4y
	M1576Z44GQB3DfDk7ohH5apRZgr5ZiqEe2mG/h2w9VdgI65RRaov1B06sASrvGb+nlvQc0+UEJu
	4/eg4jiSGS2jWJzsHAVrN8y2O6xK7vAuN91dvTkAIofIYtQa4tZ6L5VM01/onRgQzqySVdgwg+o
	wKa5C4G2dAapcqqmxUbLv5JEtHgaYUqS2lKHE3KfFiXQN9bygPL8/zKOsfzwKFPBMMUcz9aoQi7
	uZo+zvBZpTo6h2zEmKamSgnjAAFi4nqKJ1/6+l+HcqvqhTUGgdF2bUnWHggAfsuf46n2qzg/roA
	C4QRvvwHeT+yR7a5364XE5dwmdsS8=
X-Received: by 2002:a05:600c:444d:b0:471:15bb:ad7f with SMTP id 5b1f17b1804b1-471178b04cfmr118237635e9.17.1761072191201;
        Tue, 21 Oct 2025 11:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF48PaGIZJJ8yDfzibDZrtRJ8BYf6TIUYzgr5nqD6RJbRA6dQ/xlt74jqHg+pveBdy6E8oUw==
X-Received: by 2002:a05:600c:444d:b0:471:15bb:ad7f with SMTP id 5b1f17b1804b1-471178b04cfmr118237325e9.17.1761072190791;
        Tue, 21 Oct 2025 11:43:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c438caeesm4880295e9.18.2025.10.21.11.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 11:43:10 -0700 (PDT)
Message-ID: <5e35a398-af4e-4c54-9285-4202da08f456@redhat.com>
Date: Tue, 21 Oct 2025 20:43:08 +0200
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
Subject: Re: [PATCH v1 20/23] mm/kconfig: make BALLOON_COMPACTION depend on
 MIGRATION
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
 <20251021150040.498160-4-david@redhat.com>
 <3ba11b0c-818f-41d5-8885-038c7e0133f5@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <3ba11b0c-818f-41d5-8885-038c7e0133f5@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o2Vbq8TAmJqxDLYPpdpyuh1-476lNV1e6wE2-dcaYNM_1761072191
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 21.10.25 19:13, Randy Dunlap wrote:
> 
> 
> On 10/21/25 8:00 AM, David Hildenbrand wrote:
>> Migration support for balloon memory depends on MIGRATION not
>> COMPACTION. Compaction is simply another user of page migration.
>>
>> The last dependency on compaction.c was effectively removed with
>> commit 3d388584d599 ("mm: convert "movable" flag in page->mapping to a
>> page flag"). Ever since, everything for handling movable_ops page
>> migration resides in core migration code.
>>
>> So let's change the dependency and adjust the description +
>> help text.
>>
>> We'll rename BALLOON_COMPACTION separately next.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/Kconfig | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index e47321051d765..3aff4d05a2d8c 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -599,17 +599,14 @@ config MEMORY_BALLOON
>>   #
>>   # support for memory balloon compaction
>>   config BALLOON_COMPACTION
>> -	bool "Allow for balloon memory compaction/migration"
>> +	bool "Allow for balloon memory migration"
>>   	default y
>> -	depends on COMPACTION && MEMORY_BALLOON
>> -	help
>> -	  Memory fragmentation introduced by ballooning might reduce
>> -	  significantly the number of 2MB contiguous memory blocks that can be
>> -	  used within a guest, thus imposing performance penalties associated
>> -	  with the reduced number of transparent huge pages that could be used
>> -	  by the guest workload. Allowing the compaction & migration for memory
>> -	  pages enlisted as being part of memory balloon devices avoids the
>> -	  scenario aforementioned and helps improving memory defragmentation.
>> +	depends on MIGRATION && MEMORY_BALLOON
>> +	help
>> +	  Allow for migration of pages inflated in a memory balloon such that
>> +	  they can be allocated from memory areas only available for movable
>> +	  allocations (e.g., ZONE_MOVABLE, CMA) and such that they can get
> 
> nit:
> s/get/be/

Thanks!

-- 
Cheers

David / dhildenb


