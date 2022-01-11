Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4710148AFAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 15:37:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYCw41ZLxz3bc4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 01:37:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXb6XlGG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXb6XlGG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EXb6XlGG; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXb6XlGG; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYCvK40bVz2yN3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 01:36:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641911814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWH4n5tZJqT8cw2gkTDGj1xvEUu3fTS/zJOrhm0MBxk=;
 b=EXb6XlGGuBaHI74ge7MYQug0Ts+VTFcnH2ZO1pjq07bEsfwNmlUbJ4h8fTWYF2xnEPM9yd
 zCaBQ2QpiHjuiz6bk9lGA9yvNGVJ6mMMfwW1DLR4hoUu7nKmq3+A4+pp/tJQndyQ6CeHLH
 r0c7aKcGxx+MLluMZoJ/7kiFb9p7R7M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641911814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWH4n5tZJqT8cw2gkTDGj1xvEUu3fTS/zJOrhm0MBxk=;
 b=EXb6XlGGuBaHI74ge7MYQug0Ts+VTFcnH2ZO1pjq07bEsfwNmlUbJ4h8fTWYF2xnEPM9yd
 zCaBQ2QpiHjuiz6bk9lGA9yvNGVJ6mMMfwW1DLR4hoUu7nKmq3+A4+pp/tJQndyQ6CeHLH
 r0c7aKcGxx+MLluMZoJ/7kiFb9p7R7M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-a-tER_DCMXyLVKSsf-d2mA-1; Tue, 11 Jan 2022 09:36:52 -0500
X-MC-Unique: a-tER_DCMXyLVKSsf-d2mA-1
Received: by mail-ed1-f70.google.com with SMTP id
 v18-20020a056402349200b003f8d3b7ee8dso13491413edc.23
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 06:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=VWH4n5tZJqT8cw2gkTDGj1xvEUu3fTS/zJOrhm0MBxk=;
 b=6xUGeyDr1TUzYXVacs6jU3BHzXHfcR+fxxtGWuI0R7hRny8kyYreiCy8duS4Pjd4V5
 huGJOhYcJvzk8itZOEtFqDauFBtp/TGgn7O0I4fRAgM6vMS3mr5GWqvSDu8BGQcooRRF
 sgJDm1h9kP/4yWJNqtbXQoNKRoVUCyojKkh2pDOtDbyi0fBFOEcMSDfMLLuMYfD2SxU8
 Tuz3TXHyvLUSS2UPJhLhYWm8IRiWMaMtHHBm9ngDwFwJTGUoVmJVJJLMypK4M1BD+Ng4
 mGAzdTir0cYWEP4kIUYBh8NkKSYkAX6pKKKvu2cV/ApVXdzDmhqX3mVX6HYbY6FvFLFt
 X9VA==
X-Gm-Message-State: AOAM531kTc2MPFTjJYyI6UeSqx2U7cbBx/Z44e+mzHvTP15f8ks/eG8L
 jRw5TI8i9O/yvTj1SvfTEXRbzm8tRlyTAYiom+uJ25DwSkVD1E2BU26BIJ0AIxCTA23cPqumqfi
 lzVwfvgbI+6r8KB55xblO/+FpNg==
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr3760632ejb.114.1641911811366; 
 Tue, 11 Jan 2022 06:36:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2qYKUaa7jdLHRpdkbMwKfB/8KP3UpvHw3b/n+6Yn4uJh0st9iWVQWQ6qy6lDX1YtAZ+HRZQ==
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr3760601ejb.114.1641911810975; 
 Tue, 11 Jan 2022 06:36:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:6800:150a:bea9:f03e:c4da?
 (p200300cbc7026800150abea9f03ec4da.dip0.t-ipconnect.de.
 [2003:cb:c702:6800:150a:bea9:f03e:c4da])
 by smtp.gmail.com with ESMTPSA id qb2sm3633062ejc.219.2022.01.11.06.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 06:36:50 -0800 (PST)
Message-ID: <21364354-83d1-5a56-378e-8ca07ccf9957@redhat.com>
Date: Tue, 11 Jan 2022 15:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20211220193419.104242-1-hbathini@linux.ibm.com>
 <20211220193419.104242-2-hbathini@linux.ibm.com>
 <e4748b18-3de3-b3f9-464a-e5cfcf9f05d4@redhat.com>
 <bc8c2655-d540-5d87-9811-054e87e84487@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/2] mm/cma: provide option to opt out from exposing pages
 on activation failure
In-Reply-To: <bc8c2655-d540-5d87-9811-054e87e84487@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: osalvador@suse.de, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.01.22 13:01, Hari Bathini wrote:
> 
> 
> On 22/12/21 12:18 am, David Hildenbrand wrote:
>> On 20.12.21 20:34, Hari Bathini wrote:
>>> Commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
>>> activation of an area fails") started exposing all pages to buddy
>>> allocator on CMA activation failure. But there can be CMA users that
>>> want to handle the reserved memory differently on CMA allocation
>>> failure. Provide an option to opt out from exposing pages to buddy
>>> for such cases.
> 
> Hi David,
> 
> Sorry, I could not get back on this sooner. I went out on vacation
> and missed this.
> .
> 
>>
>> Can you elaborate why that is important and what the target user can
>> actually do with it?
> Previously, firmware-assisted dump [1] used to reserve memory that it 
> needs for booting a capture kernel & offloading /proc/vmcore.
> This memory is reserved, basically blocked from being used by
> production kernel, to ensure kernel crash context is not lost on
> booting into a capture kernel from this memory chunk.
> 
> But [2] started using CMA instead to let the memory be used at least
> in some cases as long as this memory is not going to have kernel pages. 
> So, the intention in using CMA was to keep the memory unused if CMA
> activation fails and only let it be used for some purpose, if at all,
> if CMA activation succeeds. But [3] breaks that assumption reporting
> weird errors on vmcore captured with fadump, when CMA activation fails.
> 
> To answer the question, fadump does not want the memory to be used for
> kernel pages, if CMA activation fails...

Okay, so what you want is a reserved region, and if possible, let CMA
use that memory for other (movable allocation) purposes until you
actually need that area and free it up by using CMA. If CMA cannot use
the region because of zone issues, you just want that region to stay
reserved.

I guess the biggest different to other CMA users is that it can make use
of the memory even if not allocated via CMA -- because it's going to
make use of the the physical memory range indirectly via a HW facility,
not via any "struct page" access.


I wonder if we can make the terminology a bit clearer, the freeing part
is a bit confusing, because init_cma_reserved_pageblock() essentially
also frees pages, just to the MIGRATE_CMA lists ... what you want is to
treat it like a simple memblock allocation/reservation on error.

What about:
* cma->reserve_pages_on_error that defaults to false
* void __init cma_reserve_pages_on_error(struct cma *cma)


-- 
Thanks,

David / dhildenb

