Return-Path: <linuxppc-dev+bounces-863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81473968285
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 10:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy2gD1PZhz2xH9;
	Mon,  2 Sep 2024 18:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725267400;
	cv=none; b=kK1cZQHYR5DbpQ5yvpcSrttQQ85XPFpIqvamfNyVy0aZJyBk/cF7b/8YMVsAHg/jIUivn916QPt2UOAKAJH2+LYNSUdMRfMiRsE3TFbKnbtdHON/ao2iQvZwDcsM5J8GzEzQH/fWqP7gDoezTM13arJq9b4nsO8awuvDkrQGBWoBPEex9gccz2oYSXFmYrprr5A3a0auEZnt5ui7JmDuX8gqyjdTdSF7ULeM+ZRquZl0poRN+k1ox+YVkSJ7STV/qrfW3Jr435GL6CiaK5TSl5tXInaoJscdz+9LF1PA+o7xFpxxg30MR+5XBY/WdtFHHec/hjKmaCSmYz7jAhXlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725267400; c=relaxed/relaxed;
	bh=LfF3KeynC9sZLbgUnP2jKMumdR02uRRJTldDSGFHy9s=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Autocrypt:Organization:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding; b=jtulYxIKkEKNBf0JFCX8GOHvwtpER+mbl+ZneWgPkYvqexgZAic+ODtxWuas8Z5mT/CJmWJdW52e+jJCUso3gz2q82YcQzvJ/atEMCCAiHDHrnyX9nkiofaZj2ZxjRPN4WTbG2HHn+atQqC9UVDftiww+Xtbo+vO71FPkj9NX/rwl7pu+I2SoRuRwmJN8A0UWb4nPW++7CQJ0qJvDI6qR15VmmiKBfDIMYTUhfoYVgOiazy55UlYMoIXskyf6RTJxZh4QUkn4f2LBcqXYLOXgTxWAC/CbGdSuloViT99ov0bcPQCpK+t7fiaspmmha4rxU7/h9M2n4lx5ns3hZGb+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQZVVxry; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wp6qdjHF; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQZVVxry;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wp6qdjHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy2gC2sxLz2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 18:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725267393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LfF3KeynC9sZLbgUnP2jKMumdR02uRRJTldDSGFHy9s=;
	b=dQZVVxryB9oMpTNMP+gmJvK2/vg6s4i989DUFoBQmZQ4TNnZoAf8w/5F0rNTWoCsoy8lGk
	wgF5HpqltPmxgP5UCdb8IgfGejRyVtak5p2VluAPHfi34YkJQrSaQQohoO5IsGxcWJYqX7
	cvk/NdAQG5xR/r9xR/p9GDQ3nbEGxks=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725267394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LfF3KeynC9sZLbgUnP2jKMumdR02uRRJTldDSGFHy9s=;
	b=Wp6qdjHFRm2nNGcTPWFZQc6RjdKXLzig2k7STGjyGW6P8PQcTkMQ9KFxYUmBxBTg9aQLB1
	K3vRHs+evn7IsO+ApSdGuC0Mizuiev3a7o27UwZO8ROBGPFoeTp2mH9AUs58Cocy56aCDC
	g+EXdiV1Wlh6PQzJxSbTbrdcp/ujmgA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-yBX8Czx-NESaigbaCQ8jJw-1; Mon, 02 Sep 2024 04:56:30 -0400
X-MC-Unique: yBX8Czx-NESaigbaCQ8jJw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37496a7daf2so2753026f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2024 01:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725267389; x=1725872189;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LfF3KeynC9sZLbgUnP2jKMumdR02uRRJTldDSGFHy9s=;
        b=wu4tgfdQReL8ldytv5SdDuhC3G9hUQ8vt6gnDzlQojAQrqzgZp68TCwL5h5DZiCsv2
         dWy+HXZWwZSx6OYx1obzEnSc1SrXmneOEpNT77Op8rWdpVKgOYj9YE1rFP2mBsQdDkMy
         W+RXtJNV4avhm/RZx9E/RKkjlVhvmv8aZBgvkVxlOHo5uUvRXRjgkA8pWYcY4y5afBpL
         LlJbKVqyXbEybeYPeXjxfiuP3mj3c3EH/VQsSgQxk4TC71wIHEHzqG+Pe3n1Mn85KzzF
         87LQvmLjjIuKbyxh3phXI8shTncNVLYvcG1acIJo9FVFruE/zdpm4T+oJm/a4JPPyeUH
         lh2g==
X-Forwarded-Encrypted: i=1; AJvYcCVmSf/eN162Bz/9VXnhehJ81LJV50eAPNqbCHBKVSjDRuYqMAo9D/xZk6HgzuwftTDut8Zy1LBCALVqYPE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw2q1PW4R7RaEc6fHM5HJDEvqrTdQrw4vocETp97aG9wWSFE5Ea
	HyNj4x+HGjonYQLr/3axbP6m6msprUWM4x2HnrHel69wzODN4MtRvziEWKyX8XktycZIAXPBNGf
	zm51dxtGwnRpHC7hhq2cs2BghOX19Cvuk2xb7JCZyvbr5VPK4+OjtP+ZaMZFYZGk=
X-Received: by 2002:adf:e452:0:b0:374:ba7b:42af with SMTP id ffacd0b85a97d-374ba7b434dmr4372627f8f.26.1725267389506;
        Mon, 02 Sep 2024 01:56:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4sDToXZ9iQK2Utdqm24ufRZ+5W5OXr8AgS3H0PwzzxL8rRkjavgydF0LfAh+ynJv8zMPifw==
X-Received: by 2002:adf:e452:0:b0:374:ba7b:42af with SMTP id ffacd0b85a97d-374ba7b434dmr4372598f8f.26.1725267388554;
        Mon, 02 Sep 2024 01:56:28 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374cd32fa01sm1307043f8f.85.2024.09.02.01.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 01:56:28 -0700 (PDT)
Message-ID: <861d448c-ce1d-4b74-87eb-9b211dfebbb1@redhat.com>
Date: Mon, 2 Sep 2024 10:56:27 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-um@lists.infradead.org, kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
 <ZtVbrM4rQsGFJo_t@telecaster>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZtVbrM4rQsGFJo_t@telecaster>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.09.24 08:31, Omar Sandoval wrote:
> On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
>>
>>
>> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
>>> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: Omar Sandoval <osandov@fb.com>
>>>
>>> Hi,
>>>
>>> I hit a case where copy_to_kernel_nofault() will fault (lol): if the
>>> destination address is in userspace and x86 Supervisor Mode Access
>>> Prevention is enabled. Patch 2 has the details and the fix. Patch 1
>>> renames a helper function so that its use in patch 2 makes more sense.
>>> If the rename is too intrusive, I can drop it.
>>
>> The name of the function is "copy_to_kernel". If the destination is a user
>> address, it is not a copy to kernel but a copy to user and you already have
>> the function copy_to_user() for that. copy_to_user() properly handles SMAP.
> 
> I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
> arbitrary address, and I want it to return an error instead of crashing
> if the address is not a valid kernel address. As far as I can tell, that
> is the whole point of copy_to_kernel_nofault().

The thing is that you (well, KDB) triggers something that would be 
considered a real BUG when triggered from "ordinary" (non-debugging) code.

But now I am confused: "if the destination address is in userspace" does 
not really make sense in the context of KDB, no?

   [15]kdb> mm 0 1234
   [   94.652476] BUG: kernel NULL pointer dereference, address: 
0000000000000000

Why is address 0 in "user space"? "Which" user space?

Isn't the problem here that KDB lets you blindly write to any 
non-existing memory address?


Likely it should do some proper filtering like we do in fs/proc/kcore.c:

Take a look at the KCORE_RAM case where we make sure the page exists, is 
online and may be accessed. Only then, we trigger a 
copy_from_kernel_nofault(). Note that the KCORE_USER is a corner case 
only for some special thingies on x86 (vsyscall), and can be ignored for 
our case here.

-- 
Cheers,

David / dhildenb


