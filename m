Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0648D3A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 09:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZHjq6CgNz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 19:32:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QqtHQ0QD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uy/fdy5w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QqtHQ0QD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uy/fdy5w; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZHhY4cJ2z30MF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 19:31:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642062682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRMp76mFg9q4hpmUn7hTtol/yCxPg3MrW75Gj4rZv+M=;
 b=QqtHQ0QDyxeen1GYzxfCXpqJMnIe3XsnovTptipKThotZRv7zg2vkGj/gAEwpFkgje7QAn
 6qdL3t1lRF2icCNh7v7u2CNDnz2d+kz0D3TxZxlPqTszDra5lwcWYKA+psaWHe48Dh1pp2
 JCZf/NzY2Davoc+aRkibd/WSro3U1BM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642062683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRMp76mFg9q4hpmUn7hTtol/yCxPg3MrW75Gj4rZv+M=;
 b=Uy/fdy5wtiyNOE/MPe6/QVtzo+0yaG51WDypyvPf6I5+RDr2dRxFMFVaattEgGKb2MvVkW
 mRmZEPSouEg4qt528SOh+hXHSoBSE4wFnmqggf0FDC7XfDEudD5pmmKh8EhBRqLcnFNri3
 ngTMa9knSuYieX6UY7Stb8CZIYQf8gU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-IN2Nay_4N_iZrSBID1L3IA-1; Thu, 13 Jan 2022 03:31:19 -0500
X-MC-Unique: IN2Nay_4N_iZrSBID1L3IA-1
Received: by mail-ed1-f71.google.com with SMTP id
 v18-20020a056402349200b003f8d3b7ee8dso4640088edc.23
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 00:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RRMp76mFg9q4hpmUn7hTtol/yCxPg3MrW75Gj4rZv+M=;
 b=Z0Dh2ztwA1lvXyb4epa3U7HcMduGGUztO+zWGAkihsF4rLXKLsfTRbHpHEFcc1FsaZ
 Thl9+E+fXQlK715XkjJ8eIqSc4UQ+nXsANCLFsJ3gUyILRPLYsKiLomIMr+4/mdJu9LT
 XmD2b5mCKIoxVZj/IAdjBY/dslLn6++HCgunM9a5CDcXL1wSXNs3vvDjnu1pQHhUKdpL
 1phwfktuK6YP8Sq7xfwOfSoSP1GjzzYB8sTIHVgZW2sF6DgpwE3OlvXjo3q4mys5VAtB
 W/8fdADLVm1qIGi9gMYg9ILv37VojTI4aOS87Z5jLTEMxTIzBaI6G8THlt+yECw6s2Nr
 cs3g==
X-Gm-Message-State: AOAM533ZYk/mjGYEIJgXJHOuG0ybqfruRZ6qkEOH0JXzCh44X3mBSq3g
 4BY7/i6xLjT+ijAxTvA6LyjQii3UlERxnBXowJPn5FqibKvI5bn0qy6bxxsQuSnwrbDE5oR1yz5
 P/yhcoP/Cl220Cwh2QnNAg5X3Qg==
X-Received: by 2002:a17:907:60cd:: with SMTP id
 hv13mr712754ejc.302.1642062678300; 
 Thu, 13 Jan 2022 00:31:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOuJplODgSWOQxlS8L/0RtWiFMVOaFi8EnbnnDbKREaPe/vpIMjII+vEeD+Vudo0OV4INEgg==
X-Received: by 2002:a17:907:60cd:: with SMTP id
 hv13mr712742ejc.302.1642062678071; 
 Thu, 13 Jan 2022 00:31:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id hs32sm611210ejc.180.2022.01.13.00.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 00:31:17 -0800 (PST)
Message-ID: <81b7f3e5-2350-0aee-918b-b63980354d96@redhat.com>
Date: Thu, 13 Jan 2022 09:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] powerpc/fadump: opt out from freeing pages on cma
 activation failure
To: Hari Bathini <hbathini@linux.ibm.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20220112193340.149020-1-hbathini@linux.ibm.com>
 <20220112193340.149020-3-hbathini@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112193340.149020-3-hbathini@linux.ibm.com>
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

On 12.01.22 20:33, Hari Bathini wrote:
> With commit a4e92ce8e4c8 ("powerpc/fadump: Reservationless firmware
> assisted dump"), Linux kernel's Contiguous Memory Allocator (CMA)
> based reservation was introduced in fadump. That change was aimed at
> using CMA to let applications utilize the memory reserved for fadump
> while blocking it from being used for kernel pages. The assumption
> was, even if CMA activation fails for whatever reason, the memory
> still remains reserved to avoid it from being used for kernel pages.
> But commit 072355c1cf2d ("mm/cma: expose all pages to the buddy if
> activation of an area fails") breaks this assumption as it started
> exposing all pages to buddy allocator on CMA activation failure.
> It led to warning messages like below while running crash-utility
> on vmcore of a kernel having above two commits:
> 
>   crash: seek error: kernel virtual address: <from reserved region>
> 
> To fix this problem, opt out from exposing pages to buddy allocator
> on CMA activation failure for fadump reserved memory.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index b7ceb041743c..82058b52e34a 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -112,6 +112,12 @@ static int __init fadump_cma_init(void)
>  		return 1;
>  	}
>  
> +	/*
> +	 *  If CMA activation fails, keep the pages reserved, instead of
> +	 *  exposing them to buddy allocator. Same as 'fadump=nocma' case.
> +	 */
> +	cma_reserve_pages_on_error(fadump_cma);
> +
>  	/*
>  	 * So we now have successfully initialized cma area for fadump.
>  	 */

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

