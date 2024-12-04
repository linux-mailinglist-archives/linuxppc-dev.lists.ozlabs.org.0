Return-Path: <linuxppc-dev+bounces-3783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A56079E3690
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 10:28:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3BzV2Ct6z30W6;
	Wed,  4 Dec 2024 20:28:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733304534;
	cv=none; b=nKX2qFVrmWmYDgmi5EQKiLnzhXHHmeIgOZLvSGdQP1d+8uUUz72xrxPKyFfkXhpmd7lmYRvwq8ZaFktkrFHb7vnO2PCQiRryeBriL+8cdEqoTJJvs+wfzIsS+xZwnHmJ8qQEYTxoX9WaX4yjExpNUH3TtW4tg+iDk8NOg51udxt6CFKdbuacQNADQVuRd6miECyG7KEXpTQCDdDCXVFSI5CfvSp/GP2fqHVYOXFyF3jNQuk08RAVmT8HH7iy+OiC7WLK5QwhXUruj6nAvPGbxwdXqN0Flm92J0l18Ongn75Ta1FkzsOOKlOCsJ25sSMbvsSLrOJH4y30TSPIugGUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733304534; c=relaxed/relaxed;
	bh=AXkcsNssBDIkoyIUFa6gbYj8t92+fIKYw2rEYcDaoyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=El38z8KS/mr2KHHfR0fp26QLQ8DrXeO3HX3CbFQC8DTR4mJWE3sYU3A4X9SkVSLak+6+BOhJTR3d1zIlXCret/PTsHhCVa2OrxrPCUbRfFdd1TOVxgef/tCcyPIDC0v5StWfJplW3pHSrlTF5S2sIUdM9OKXVBWez2FJaEUyRn8dJxbqu7+RpeEF6NjxHwB07Y1qlpmMo2FLDDEQF+nXohS725+ofQ70Xx/cdHQ6+Q0ci8peKYQT0tjNTEMC/t4y1PDzKapclSo+yuYtGhXmbiWr/isUa2RO94d7XjEiEb/pDpB8Ry8J6blLQBR3jDT2GycyhiB1V0zRYVcFO/CP2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=foD8HlJX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=foD8HlJX; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=foD8HlJX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=foD8HlJX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3BzS3HdRz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 20:28:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733304527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AXkcsNssBDIkoyIUFa6gbYj8t92+fIKYw2rEYcDaoyk=;
	b=foD8HlJXXm9yuN05BAHhfyam3e0cySYnBa/Sv0oC3EWA87FQTesyQjmo41SdqRGnFDUp1l
	qYNpMAh/Ycx61MQ/fTSW0M6phWjpEe1Qxxk++1UrLqGJ9x3sbaa45J58tieq9H6Zq6ChDc
	P9sJK0zu+eEfqZPjKqzcMvV/TNy/328=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733304527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AXkcsNssBDIkoyIUFa6gbYj8t92+fIKYw2rEYcDaoyk=;
	b=foD8HlJXXm9yuN05BAHhfyam3e0cySYnBa/Sv0oC3EWA87FQTesyQjmo41SdqRGnFDUp1l
	qYNpMAh/Ycx61MQ/fTSW0M6phWjpEe1Qxxk++1UrLqGJ9x3sbaa45J58tieq9H6Zq6ChDc
	P9sJK0zu+eEfqZPjKqzcMvV/TNy/328=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-xIwg9biHOna2A4F4Un7cnQ-1; Wed, 04 Dec 2024 04:28:43 -0500
X-MC-Unique: xIwg9biHOna2A4F4Un7cnQ-1
X-Mimecast-MFC-AGG-ID: xIwg9biHOna2A4F4Un7cnQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4349cbf726cso48383065e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2024 01:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304522; x=1733909322;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AXkcsNssBDIkoyIUFa6gbYj8t92+fIKYw2rEYcDaoyk=;
        b=iiVBRJNsNmYVxzZ4+lMihBpdlAsGwWkBK5r2Yj5OliAIpW2G8jqQHjDqaTzlpiiAH8
         3ALjcAY/l7n3Snn4tFR6GGFJABPDaSHYLLgfboVYMtCRwTeiKFzTcAe2xx2GA858XMko
         aZUSdi4A0Mlyig2+rdmTRhLbESsgq10dMvdgMgF2UTFwqIdI1RSQ70vVNsBjo5DH5ra2
         8Qt9WRyC4qijPYnlip6l12twEQIILpu4XVqf/5MXnjGZv92glvnx6r9DwPI9J6864tMB
         excMNf8P5JokHAL0HoBgOmEVRN6lnuOu84kPh1OvJs9qJfZuUXlTWeHoXLpN1bmQD3ls
         9Phw==
X-Forwarded-Encrypted: i=1; AJvYcCVAw3Crlaje9M7wuhnoiCCm88pis79oN5jjwFp1mxPk/TSDggThxdH8/u20n8lHBQ58nNbbGbyjbRZKwcQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzd+dwqj7tn5QtET8+9GdG9OHQqaTAE3iaDP1KHxHFqc+0Gcrwg
	gTvrqXB91Xs7fBmRNSshSDWceholcplcChx/dJlOrT05O6b6g7bHrSH65Wqb9w0SYmdynP3ChkU
	xOccCNR86UWCStMf8N3mKyWaHWaTcFEIZCRKlqNJRbuFZ0WTItdh7BSKKlLHznpM=
X-Gm-Gg: ASbGnct341AzlfF407BzyyhPzFosAv5J1E6IWlGWZX3tFx43nJHC7J6FnA2lGjTbeg1
	dMECQ4vJG+NHf/4aoff4PLfSsfHPJSWfxfohQf9MG4OwOXlOteue9YRKY8QIblC6VrrVKN6YOls
	tu/rsx6fCd0Wm6kT0l5HrK7HEUa/l6nhufwWTgVJ5yDCxcCUNAf2lQ/zG+eGyFojn2P/iybF6y0
	Tifa2lRqPvRtC2SJ6Gl/Tz2bn96TlXA7cw+g9Ll4Q3ePmrNIx/1Y4sAFoJAPwBNfw+veIMu4PIk
	YFD7Fs0xLwgRwqhMx15p/A17n0F0DR8rXGrZmDwJNbdNFCk5CVEqFVoBEXTMlygew2E+1L62Vtz
	mkg==
X-Received: by 2002:a05:600c:3554:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-434d09b0020mr48636905e9.6.1733304522268;
        Wed, 04 Dec 2024 01:28:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEujwNpRBwluk2zpQ1Yet+Ecjg4bwyX/zVe4UezRqTVJMMizFZiaTPX/p8MoKgtkYxHhiPB0g==
X-Received: by 2002:a05:600c:3554:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-434d09b0020mr48636675e9.6.1733304521850;
        Wed, 04 Dec 2024 01:28:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:e100:38d6:8aa1:11b0:a20a? (p200300cbc70be10038d68aa111b0a20a.dip0.t-ipconnect.de. [2003:cb:c70b:e100:38d6:8aa1:11b0:a20a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5307400sm17785025e9.38.2024.12.04.01.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 01:28:41 -0800 (PST)
Message-ID: <cee06baa-8561-4be3-8f5c-ca453f58950b@redhat.com>
Date: Wed, 4 Dec 2024 10:28:39 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the
 alloc_contig_range() gfp flags mess
To: Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Zi Yan <ziy@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
 <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
 <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
 <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
 <d736f1c0-343e-4031-88ba-3b33b73dbeba@redhat.com>
 <Z1AaC5Hj2RV_5FDD@localhost.localdomain>
 <15096b27-6f27-45fc-8a8b-de781a9c42a5@suse.cz>
 <Z1AdotZfAJG-zVZX@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z1AdotZfAJG-zVZX@localhost.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V5wg9_hbDXktfggWuxQV4leOA5cwEqHKbDM8hHunDSU_1733304522
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 04.12.24 10:15, Oscar Salvador wrote:
> On Wed, Dec 04, 2024 at 10:03:28AM +0100, Vlastimil Babka wrote:
>> On 12/4/24 09:59, Oscar Salvador wrote:
>>> On Tue, Dec 03, 2024 at 08:19:02PM +0100, David Hildenbrand wrote:
>>>> It was always set using "GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL",
>>>> and I removed the same flag combination in #2 from memory offline code, and
>>>> we do have the exact same thing in do_migrate_range() in
>>>> mm/memory_hotplug.c.
>>>>
>>>> We should investigate if__GFP_HARDWALL is the right thing to use here, and
>>>> if we can get rid of that by switching to GFP_KERNEL in all these places.
>>>
>>> Why would not we want __GFP_HARDWALL set?
>>> Without it, we could potentially migrate the page to a node which is not
>>> part of the cpuset of the task that originally allocated it, thus violating the
>>> policy? Is not that a problem?
>>
>> The task doing the alloc_contig_range() will likely not be the same task as
>> the one that originally allocated the page, so its policy would be
>> different, no? So even with __GFP_HARDWALL we might be already migrating
>> outside the original tasks's constraint? Am I missing something?
> 
> Yes, that is right, I thought we derive the policy from the old page
> somehow when migrating it, but reading the code does not seem to be the
> case.
> 
> Looking at prepare_alloc_pages(), if !ac->nodemask, which would be the
> case here, we would get the policy from the current task
> (alloc_contig_range()) when cpusets are enabled.
> 
> So yes, I am a bit puzzled why __GFP_HARDWALL was chosen in the first
> place.

I suspect because "GFP_USER" felt like the appropriate thing to do.

Before:

commit f90b1d2f1aaaa40c6519a32e69615edc25bb97d5
Author: Paul Jackson <pj@sgi.com>
Date:   Tue Sep 6 15:18:10 2005 -0700

     [PATCH] cpusets: new __GFP_HARDWALL flag

     Add another GFP flag: __GFP_HARDWALL.


GFP_USER  and GFP_KERNEL were the same thing. But memory 
offlining/alloc_contig were added later.

-- 
Cheers,

David / dhildenb


