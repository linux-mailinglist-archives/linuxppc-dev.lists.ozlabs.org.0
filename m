Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD08B44AB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 08:59:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FeQG2alu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FeQG2alu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VRL6s2SFGz3cW3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 16:59:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FeQG2alu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FeQG2alu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VRL641B5Rz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 16:58:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714201112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WaayyB5+KIq70nS1uvbPulsfWrN99w7sHvHilb0dDfw=;
	b=FeQG2aluHLJF9R0uzeeRljzCF95ea68n5uPmEzqBeV9Wv+8MySqJxb40OCYOgBLWPx8fIn
	wERsgyQ85hzW+OMupugLDpz1UJpSLFVW68xpAPYA59Wwe9j49lv4GJ9xHh8LxRMZwoUX7K
	GjlkJrA31XJKybjmS7i3zN79VHZRRSI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714201112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WaayyB5+KIq70nS1uvbPulsfWrN99w7sHvHilb0dDfw=;
	b=FeQG2aluHLJF9R0uzeeRljzCF95ea68n5uPmEzqBeV9Wv+8MySqJxb40OCYOgBLWPx8fIn
	wERsgyQ85hzW+OMupugLDpz1UJpSLFVW68xpAPYA59Wwe9j49lv4GJ9xHh8LxRMZwoUX7K
	GjlkJrA31XJKybjmS7i3zN79VHZRRSI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-HXbrK-kZMFS3_wNIwoVqMA-1; Sat, 27 Apr 2024 02:58:30 -0400
X-MC-Unique: HXbrK-kZMFS3_wNIwoVqMA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2df7b174b87so9071781fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 23:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714201108; x=1714805908;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WaayyB5+KIq70nS1uvbPulsfWrN99w7sHvHilb0dDfw=;
        b=W8FthLC2mDce9nKhbHV/VS8rxaH3kfHyom2HHbaV19tPahRY0+pUIU3OjS5rSJukAu
         c6AwqO61LxDSow7Mnc54HljlfP6TInSvTQOJN5hMHg0LkHFoCe6cqfkGRxJgW3ui/MCE
         9l9l7iiJFNIQNkmk2RdVES8j4LL/Iq9v3lEpJ0HXp7H4z/mPeQgnzxn47cXG0Y30vvOQ
         PmyfI2jW+k0GxefVD42UhYS13rhcfCektmyqq0JUTN0tuue+TMHeqesUFnkPT/5JXXGK
         gfh2T4xenMHQxhEgjSF6+sLLMgUqZZL/HKx+l6Un41x2hFrRplIPtWWgpeV6O2gpmp/D
         Tojw==
X-Forwarded-Encrypted: i=1; AJvYcCW6YPXSqyAgQ/Y/8PKW23kB6Zp2cNSBrPDRFa7+dCcAC3dhR4ZJZ6dSH7nC6Rl9pKvCs8e+Ztn0j72teAregzwAWCig3dqOP+KvMhsQuQ==
X-Gm-Message-State: AOJu0Yw7hbEJ7WdtraFIaFTGPhQWAO7GN/StQy3KAg4dbhywE855qSVb
	btvzXl9OmkcunhAfq1X7URZSqnycGaHf/abdLgiOEfXgZwFCRHb6sJDMH/HBndOAOZBMKA0xVzg
	d4AkRyfnxAax9g3J1YOcA1QGNiqZCgZe9sDRAtYnbozE0fhXTo95yaJ1X0PspWLk=
X-Received: by 2002:a2e:b05a:0:b0:2d7:1a30:e881 with SMTP id d26-20020a2eb05a000000b002d71a30e881mr2669438ljl.12.1714201108508;
        Fri, 26 Apr 2024 23:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV7CVKxHNJ2Tho7t1H+f7+YxLYlrHEqtgE9fAP/Lf/BXSoGK0VQ6f5eOXpT5KJ+va9EthlOQ==
X-Received: by 2002:a2e:b05a:0:b0:2d7:1a30:e881 with SMTP id d26-20020a2eb05a000000b002d71a30e881mr2669415ljl.12.1714201108080;
        Fri, 26 Apr 2024 23:58:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:9c00:2aaa:88a4:e41d:65ba? (p200300cbc7319c002aaa88a4e41d65ba.dip0.t-ipconnect.de. [2003:cb:c731:9c00:2aaa:88a4:e41d:65ba])
        by smtp.gmail.com with ESMTPSA id bd12-20020a05600c1f0c00b0041b6f63f42esm6081579wmb.48.2024.04.26.23.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 23:58:27 -0700 (PDT)
Message-ID: <0a9ebdaa-9346-49f4-b568-d0dce72d3108@redhat.com>
Date: Sat, 27 Apr 2024 08:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
To: Peter Xu <peterx@redhat.com>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com> <Ziuv2jLY1wgBITiP@x1n>
 <ZivScN8-Uoi9eye8@x1n> <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
 <Ziwal-SucIye3hPM@x1n> <fb3bd167-748a-4548-a94f-9194443c0bc3@redhat.com>
 <ZiwjhkTTRG1ZjyLf@x1n>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZiwjhkTTRG1ZjyLf@x1n>
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26.04.24 23:58, Peter Xu wrote:
> On Fri, Apr 26, 2024 at 11:33:08PM +0200, David Hildenbrand wrote:
>> I raised this topic in the past, and IMHO we either (a) never should have
>> added COW support; or (b) added COW support by using ordinary anonymous
>> memory (hey, partial mappings of hugetlb pages! ;) ).
>>
>> After all, COW is an optimization to speed up fork and defer copying. It
>> relies on memory overcommit, but that doesn't really apply to hugetlb, so we
>> fake it ...
> 
> Good summary.
> 
>>
>> One easy ABI break I had in mind was to simply *not* allow COW-sharing of
>> anon hugetlb folios; for example, simply don't copy the page into the child.
>> Chances are there are not really a lot of child processes that would fail
>> ... but likely we would break *something*. So there is no easy way out :(
> 
> Right, not easy.  The thing is this is one spot out of many of the
> specialties, it also may or may not be worthwhile to have dedicated time
> while nobody yet has a problem with it.  It might be easier to start with
> v2, even though that's also hard to nail everything properly - the
> challenge can come from different angles.
> 
> Thanks for the sharings, helpful.  I'll go ahead with the Power fix on
> hugepd putting this aside.

Yes, hopefully we already do have a test case for that. When writing 
gup_longterm.c I was more focusing on memfd vs. ordinary file systems 
("filesystem type") than how it's mapped into the page tables.

> 
> I hope that before the end of this year, whatever I'll fix can go away, by
> removing hugepd completely from Linux.  For now that may or may not be as
> smooth, so we'd better still fix it.

Crossing fingers, I'm annoyed whenever I stumble over it :)

-- 
Cheers,

David / dhildenb

