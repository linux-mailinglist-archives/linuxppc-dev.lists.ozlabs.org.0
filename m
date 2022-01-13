Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998148D3A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 09:31:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZHj20dyCz3bTn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 19:31:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ih9NgMRg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ih9NgMRg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ih9NgMRg; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ih9NgMRg; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZHhG1yLZz2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 19:31:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642062661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXCFcj3n+7ZELibrybMDe0RwtJDN8j7oGmTCl7zcp9I=;
 b=Ih9NgMRg9gtiMo0hoyo14cgw5B1mC4nSldTKug1y2qNOfXB3IyVJ6KURKKnutY1QNoqQBn
 yYjhXhFLsk0xftyjkkV6H5a+ivOnE3/vq26w6FBhQNjOgPwpmGanfyhCBm/FpKa/sY4+69
 00FgeLa+cE7IMOAC625Bqvrhraf4hjA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642062661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXCFcj3n+7ZELibrybMDe0RwtJDN8j7oGmTCl7zcp9I=;
 b=Ih9NgMRg9gtiMo0hoyo14cgw5B1mC4nSldTKug1y2qNOfXB3IyVJ6KURKKnutY1QNoqQBn
 yYjhXhFLsk0xftyjkkV6H5a+ivOnE3/vq26w6FBhQNjOgPwpmGanfyhCBm/FpKa/sY4+69
 00FgeLa+cE7IMOAC625Bqvrhraf4hjA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-M6SbeA6RNJyAt42w5iOSOw-1; Thu, 13 Jan 2022 03:31:00 -0500
X-MC-Unique: M6SbeA6RNJyAt42w5iOSOw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so4702685edz.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 00:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BXCFcj3n+7ZELibrybMDe0RwtJDN8j7oGmTCl7zcp9I=;
 b=2q5CSwlA68MWVd8t1AmLrhRBFDMTMvWa2yQPsP6oIoaBpCMQLGWRK5FwoMCpB+9y8q
 wPcQm08gvPQdXb84dACZeui3YNKID3uK4pjubCVNEp3MBvUu556tpeTEqdRunIg9eHod
 vDZk2tSW52qfjYEGKKxqU0B7dyufzaTDFzqAGBujfvxAeI5JzKALy23D70KdbEk01MTx
 QVEgC7jcXVx6eYFAkCAYcJHUHq6XzBT/ICJOYgWGrgP0SSC6E7nipkblS4sGlJMmEokR
 uljuyxCcgNBnl8FnGJ8RlhfS8m66ak20kcCYLLpIO4rkuJ577H6BfC2+qFYrLt1uYz6s
 kuTw==
X-Gm-Message-State: AOAM532G8cZIPSz7PgIszrQ6A03LL8KsToiI+Tek8yC0X81JxsYNn+gf
 4qMiou9+E5GWhrYz+Z6c+8WbkCPa4L1AD75po61FzNwNh7t3NYnY77wmpiXyFapGlKkK6Fceiav
 28bLkjkfzae3JBebb/OM8lrDezg==
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr3248166edo.115.1642062659046; 
 Thu, 13 Jan 2022 00:30:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzknkb0xmTbboqwce/Zfcc3Db5EA9gSCZZ5tOrVgsVBtO9pQMBahULvIX+JAUEWAGOmoFHug==
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr3248157edo.115.1642062658895; 
 Thu, 13 Jan 2022 00:30:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id bg20sm34970ejb.59.2022.01.13.00.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 00:30:58 -0800 (PST)
Message-ID: <debd11c4-4a7a-e650-7bc6-965d58ef95cf@redhat.com>
Date: Thu, 13 Jan 2022 09:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] mm/cma: provide option to opt out from exposing
 pages on activation failure
To: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20220112193340.149020-1-hbathini@linux.ibm.com>
 <20220112193340.149020-2-hbathini@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112193340.149020-2-hbathini@linux.ibm.com>
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
Cc: mike.kravetz@oracle.com, mahesh@linux.ibm.com, sourabhjain@linux.ibm.com,
 osalvador@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +{
> +	if (!cma)
> +		return;

Do we really need that check for NULL?

> +
> +	cma->reserve_pages_on_error = true;
> +}
> +
>  /**
>   * cma_init_reserved_mem() - create custom contiguous area from reserved memory
>   * @base: Base address of the reserved area
> @@ -204,6 +214,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>  	cma->base_pfn = PFN_DOWN(base);
>  	cma->count = size >> PAGE_SHIFT;
>  	cma->order_per_bit = order_per_bit;
> +	cma->reserve_pages_on_error = false;

I think you can drop that; should already be initialized to 0.


Apart from that

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

