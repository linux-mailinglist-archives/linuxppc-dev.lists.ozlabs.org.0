Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 452162A26ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 10:25:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPnZ75DHpzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 20:25:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=IG3PanUB; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IG3PanUB; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPnXb1tdQzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Nov 2020 20:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604309020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvzFTHWSHGEnWR6Ifj3GAv6gxH6+jHEcfGAXbqacOLM=;
 b=IG3PanUBjPioQMFY6/GzArSHeUQYDMALPjaiObG5V9L6Rp+nn3SIqB6YtDVks0tRjzn/hk
 jC3Kbri0cyYiQSZhXMuwqtF5c/4HUTLMB4e2lfQJQuuhmE1DNYLjZShI78glm6ckAVqvTy
 4P4lClkQPR1T49/6OEh/6eUvzscOF4M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604309020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvzFTHWSHGEnWR6Ifj3GAv6gxH6+jHEcfGAXbqacOLM=;
 b=IG3PanUBjPioQMFY6/GzArSHeUQYDMALPjaiObG5V9L6Rp+nn3SIqB6YtDVks0tRjzn/hk
 jC3Kbri0cyYiQSZhXMuwqtF5c/4HUTLMB4e2lfQJQuuhmE1DNYLjZShI78glm6ckAVqvTy
 4P4lClkQPR1T49/6OEh/6eUvzscOF4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-4rIlLjXWNA2GtVbijb8Etw-1; Mon, 02 Nov 2020 04:23:34 -0500
X-MC-Unique: 4rIlLjXWNA2GtVbijb8Etw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A23411074652;
 Mon,  2 Nov 2020 09:23:29 +0000 (UTC)
Received: from [10.36.113.163] (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC9DF21E86;
 Mon,  2 Nov 2020 09:23:21 +0000 (UTC)
Subject: Re: [PATCH v3 3/4] arch, mm: restore dependency of
 __kernel_map_pages() of DEBUG_PAGEALLOC
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-4-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8eac2aa4-114e-f981-c8f8-ad8523175cf8@redhat.com>
Date: Mon, 2 Nov 2020 10:23:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201101170815.9795-4-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>   int __init kernel_map_pages_in_pgd(pgd_t *pgd, u64 pfn, unsigned long address,
>   				   unsigned numpages, unsigned long page_flags)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 14e397f3752c..ab0ef6bd351d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2924,7 +2924,11 @@ static inline bool debug_pagealloc_enabled_static(void)
>   	return static_branch_unlikely(&_debug_pagealloc_enabled);
>   }
>   
> -#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
> +#ifdef CONFIG_DEBUG_PAGEALLOC
> +/*
> + * To support DEBUG_PAGEALLOC architecture must ensure that
> + * __kernel_map_pages() never fails

Maybe add here, that this implies mapping everything via PTEs during boot.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

