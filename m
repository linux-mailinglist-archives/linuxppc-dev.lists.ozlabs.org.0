Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB86B10D8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 19:15:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX0pV4bSrz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 05:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GPeTbRNi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GPeTbRNi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GPeTbRNi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GPeTbRNi;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX0nX4XwHz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 05:14:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678299241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqVUMBgLdWuWEkEiWBuCdYbN5kgycGc8p0MkzJipZw8=;
	b=GPeTbRNinbIQjNht+2WkSJvZjMljWhc3tvMCLobN+t7xTVl0036sptF60yhErT4VnZzL8u
	TWY0d7l2ZGdyKKdjVmZScWt2N6mpnNhizTIsG3QiDXWVg/aJRLUUGA3T5dwphREjcUjpu0
	OjZxZq/JVQhsNjMeEZsc4Q4970A8Org=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678299241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqVUMBgLdWuWEkEiWBuCdYbN5kgycGc8p0MkzJipZw8=;
	b=GPeTbRNinbIQjNht+2WkSJvZjMljWhc3tvMCLobN+t7xTVl0036sptF60yhErT4VnZzL8u
	TWY0d7l2ZGdyKKdjVmZScWt2N6mpnNhizTIsG3QiDXWVg/aJRLUUGA3T5dwphREjcUjpu0
	OjZxZq/JVQhsNjMeEZsc4Q4970A8Org=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-mEPAvL59OiOII3TuwdVfHg-1; Wed, 08 Mar 2023 13:14:00 -0500
X-MC-Unique: mEPAvL59OiOII3TuwdVfHg-1
Received: by mail-wm1-f69.google.com with SMTP id t1-20020a7bc3c1000000b003dfe223de49so1258059wmj.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 10:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678299239;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqVUMBgLdWuWEkEiWBuCdYbN5kgycGc8p0MkzJipZw8=;
        b=XXsEUWiT9Nod8/puGS1nhCsGuZTl8WL3GP0FVFODfvzBPTXxiocBInu0DEFDV2/Ieg
         mDnvcDDQWboLWwJwlhCm7z9mrcp5LOb2Cbon58sdGS9WgvYx8ogMUeNFsRoyMqBYwFW0
         Js05VsW7JkFiPf2J2DCiGQtEynWTvWbe0CtLqbGeVdPmKAy1Nfmzd0j8Z8OLhaNSGS+J
         7zLWw1hDqNxzH0bkJf/Qji+12K3XFHdBwPxCo5fylL01eE1p6DgyJxxX6ECftv4AkqhJ
         gZFps3zUussbb0BiODp3HxEb0PjmgXxQFdxuTunFCc9U7cm61zsSCzLJR4EMe4ZskTXW
         JXpQ==
X-Gm-Message-State: AO0yUKUWIoTiDbdwovmPQ/myRwScBSzA2BJ6H/boSjOrxrn++ay9y76Q
	dFh2ooP7CorkCp8iX7JeGnXHI2o8xWHWmNUvnz0nUcW71DSIo71ffV8aBBVQVzvISZepZJhM4Dn
	WKpx5OFEMEaP0cyPNTIIBW9omdg==
X-Received: by 2002:a05:600c:1e8d:b0:3e2:669:757 with SMTP id be13-20020a05600c1e8d00b003e206690757mr16617461wmb.10.1678299238875;
        Wed, 08 Mar 2023 10:13:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+WPqgI4NzGQjNxiuwyUBe8i9sylAhAstDgZK0opmz/cBRzcC+hzIeoGWHq+f4Os0qszuvRgQ==
X-Received: by 2002:a05:600c:1e8d:b0:3e2:669:757 with SMTP id be13-20020a05600c1e8d00b003e206690757mr16617435wmb.10.1678299238573;
        Wed, 08 Mar 2023 10:13:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:cb00:d372:1da8:9e9e:422d? (p200300cbc71bcb00d3721da89e9e422d.dip0.t-ipconnect.de. [2003:cb:c71b:cb00:d372:1da8:9e9e:422d])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c4f8400b003e20fa01a86sm201680wmq.13.2023.03.08.10.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:13:58 -0800 (PST)
Message-ID: <a5c9b925-57ac-eeab-6258-0ff9fed16af7@redhat.com>
Date: Wed, 8 Mar 2023 19:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mm: add PTE pointer parameter to
 flush_tlb_fix_spurious_fault()
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230306161548.661740-1-gerald.schaefer@linux.ibm.com>
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
Cc: linux-x86 <x86@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips <linux-mips@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, linux-power <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.03.23 17:15, Gerald Schaefer wrote:
> s390 can do more fine-grained handling of spurious TLB protection faults,
> when there also is the PTE pointer available.
> 
> Therefore, pass on the PTE pointer to flush_tlb_fix_spurious_fault() as
> an additional parameter.
> 
> This will add no functional change to other architectures, but those with
> private flush_tlb_fix_spurious_fault() implementations need to be made
> aware of the new parameter.
> 
> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

