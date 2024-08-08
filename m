Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE394C5ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 22:46:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Umw8O1jy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bnknjRSp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfzbF1S9jz2yLr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 06:46:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Umw8O1jy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bnknjRSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfzZX3kBwz2xfq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 06:45:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723149919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=18Rl4NkZJ/Sn5IqfxlHmzBxDnMO4mtO2wKlwMeZkH2Q=;
	b=Umw8O1jyp3RRhTae3+IVJMu0pj6GC99wyEmtoemyf5NF36IuO21stTE/Xm8ay8F9cHZmYG
	Fk2G/UUHY5xS3iGEqi3VHJvD/OHEKn3LY3g0/xTY4XZ7TNEEQcXuNgotbGJw693HZlGsgb
	0nSHyxD6B8JKpvRWKbFW0BqInI4kiKY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723149920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=18Rl4NkZJ/Sn5IqfxlHmzBxDnMO4mtO2wKlwMeZkH2Q=;
	b=bnknjRSph54uTMbnlGRYTqCW49A1cm8+wxlz0bkfpDjFV7lsdEIQC7kuWDVqPHAkptZzRm
	xD0wBjI6zxEoqYBHiyXxXu8mdyK1uY1+5K01Ylz4C5cfKnHYp06QirUJKTveJEvMKf28D5
	//5l5IvQM3St4Hs32cHWe19lATmisLM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-zNNxlqSuOke0cA1Lcx9FiA-1; Thu, 08 Aug 2024 16:45:16 -0400
X-MC-Unique: zNNxlqSuOke0cA1Lcx9FiA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3685a5a765fso746803f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 13:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723149915; x=1723754715;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=18Rl4NkZJ/Sn5IqfxlHmzBxDnMO4mtO2wKlwMeZkH2Q=;
        b=PZB844Bqpjs4ASMP+lZMQUY0/aNXUdddB+j5FeqRvIgrwQ7jIGhjBN+Wg9r5co7Ipa
         dMnD2VGTS738jnAVBk577LlBK4SqcKwcIsZJ5/hj7oT6bgZrqP76iDyMT19BwEDUIHqD
         7dJ5iZvml60f3iN8arUoLpzAmAwSz1QS1JTz3SYTAe5IQaeSKP/RUXsTgIr1CDJ3M+rz
         /igFwxcDjwvTXKdleOKmd666mkdTAarXbhhZGmcEOjLmzoxVGNYn16UUUQkXZgJ+m9vq
         L8yA8piBwRXuaFZ1VBx6Uxw2ELXWNK0jhxWNBhlMi6DUbo5It43WOekGU8NPsSW8Zels
         vxpw==
X-Forwarded-Encrypted: i=1; AJvYcCUh0+k6UkICK7F78mNvs1QZC+PKUziem+MA1Qz/lp+ugYe8pIhs9l7ljBVg9sCHmodLsPi3vXzXoHC2Sjw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwkAJDzatXBoLVzlFBFMCOhQ/A68LP0C5P+xBHem5jteK6+ljXj
	E/5snrqHkufJdtg+ZRvHASg2pkxk1hIRfxQB2G/nffebzpdkF+SiMt86yyvcbXa4OU+jvFXn1co
	lzOu1sKTROBKx5YuATnqQgPeKRo6Y3pDnsubLe767tcBDQo+lhsBuDewTkxEhYeg=
X-Received: by 2002:a05:6000:1843:b0:360:791c:aff2 with SMTP id ffacd0b85a97d-36d275663acmr2629358f8f.47.1723149914611;
        Thu, 08 Aug 2024 13:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNcY6csiIyW/jq0jTa3ofS8OTkmMsPtIX7Q3oQh+KW6006/qHEu9nQT+rhEGN3BsWo3C6pQ==
X-Received: by 2002:a05:6000:1843:b0:360:791c:aff2 with SMTP id ffacd0b85a97d-36d275663acmr2629345f8f.47.1723149914075;
        Thu, 08 Aug 2024 13:45:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:2a00:f151:50f1:7164:32e6? (p200300cbc7132a00f15150f1716432e6.dip0.t-ipconnect.de. [2003:cb:c713:2a00:f151:50f1:7164:32e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716cb01sm3050623f8f.36.2024.08.08.13.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 13:45:13 -0700 (PDT)
Message-ID: <93cbdc09-8c21-483f-a6a0-f70ed676ec2a@redhat.com>
Date: Thu, 8 Aug 2024 22:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] mm/x86: arch_check_zapped_pud()
To: Peter Xu <peterx@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-6-peterx@redhat.com> <878qx80xy8.ffs@tglx>
 <ZrTpD0XOUsNMM9tP@x1n>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZrTpD0XOUsNMM9tP@x1n>
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
Cc: James Houghton <jthoughton@google.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> +void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
>>> +{
>>> +	/* See note in arch_check_zapped_pte() */
>>> +	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
>>> +			pud_shstk(pud));
>>
>> Please get rid of the line break. You have 100 characters.
> 
> Coding-style.rst still tells me 80 here:
> 
>          The preferred limit on the length of a single line is 80 columns.
> 
>          Statements longer than 80 columns should be broken into sensible chunks,
>          unless exceeding 80 columns significantly increases readability and does
>          not hide information.
> 
> Maybe this just changed very recently so even not in mm-unstable?
> 
> I'll fix the two line-wrap in this patch anyway, as I figured these two
> cases even didn't hit 80..  probably because I used fill-column=75 locally..
> 
> But still I'll probably need to figure it out for other spots.  Please help
> me to justify.

My interpretation is (the doc is not completely clear to me as well, but 
checkpatch.pl hardcodes the max_line_length=100) that we can happily use 
up to 100 chars.

I also tend to stay within 80 chars, unless really reasonable. Years of 
Linux kernel hacking really taught my inner self to not do it.

Here I would agree that having the VM_WARN_ON_ONCE in a single would aid 
readability.

An example where 100 chars are likely a bad idea would be when nesting 
that deeply such that most lines start exceeding 80 chars. We should 
rather fix the code then -- like the coding style spells out :)

-- 
Cheers,

David / dhildenb

