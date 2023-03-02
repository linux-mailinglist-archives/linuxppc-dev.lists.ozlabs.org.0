Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377406A7E21
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:42:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PS5k505N7z3f3t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 20:42:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGBTkKOG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGBTkKOG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGBTkKOG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KGBTkKOG;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS5hb1M95z3f92
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 20:41:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677750074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Hjvoc1rI0mNChL06OP2EkJBsd0IDPnqcUCuNFEfHkQ=;
	b=KGBTkKOGax1pq/vs64yu32LKj+IfzWcD7KPLs+ytKvLvgLrOFbFHDkbDM+9CDiZvAI0NdV
	ZvG5sSOnl3zyWGV/jGS3+WJJK3lzXYehIVTggDMKRHvpcIvp62JwyPKzNWEUVFpfiICJ/F
	La/FzUoYb2Ss86JQlK7pCuJLDISWFQQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677750074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Hjvoc1rI0mNChL06OP2EkJBsd0IDPnqcUCuNFEfHkQ=;
	b=KGBTkKOGax1pq/vs64yu32LKj+IfzWcD7KPLs+ytKvLvgLrOFbFHDkbDM+9CDiZvAI0NdV
	ZvG5sSOnl3zyWGV/jGS3+WJJK3lzXYehIVTggDMKRHvpcIvp62JwyPKzNWEUVFpfiICJ/F
	La/FzUoYb2Ss86JQlK7pCuJLDISWFQQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619--kxoIiu5MkqTEgxligLdQg-1; Thu, 02 Mar 2023 04:41:13 -0500
X-MC-Unique: -kxoIiu5MkqTEgxligLdQg-1
Received: by mail-wr1-f71.google.com with SMTP id bh3-20020a05600005c300b002c70d6e2014so3105245wrb.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 01:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Hjvoc1rI0mNChL06OP2EkJBsd0IDPnqcUCuNFEfHkQ=;
        b=AqZjCe+M5NZWrOvKtJ1BRsH5ubmAjniGQuXYZJrPIn5NWhARoSnYTPMGYPTTROLuKJ
         h8Ujl9IzmR2+2uMKyW5Ilc2dBSpb4Jr6OHF3+kJ4TTVIQoRx6gs9s2kugNDORWTOgykm
         CVir2YmrS40LJ6j3/XRYicQgle7JoPiN3ubXPFZaudHLktMIOQVCuL+8JhQZb53N5Smr
         erGPeXtan98BZKGVsq+y9Ji/ggn3hq0wFglQXBV6GkkkttXLd1o//FZc0kBI+QgWn8GK
         FNVbaM0bJEsicdOcqAjL4MAEV7l1KSiLRouTkYfg+mZ4icMxfUjDoMofldNwxFGgmG5A
         8Xbw==
X-Gm-Message-State: AO0yUKWaI9+zz+WKsRP4c3EWuXDgkoazUwJu/AnHP/1UW0v8JaSZ2+cW
	VlG3WkC0w/+vDl84/JDLVqhrLQW/4JPFZWzjGYKlcqtGeFeDk2j+R48CRaMFXYgdXWXiN94YTjZ
	OPYYlH0gWXqD0SC7Wb715K5quHA==
X-Received: by 2002:a05:600c:3c81:b0:3df:fcbd:3159 with SMTP id bg1-20020a05600c3c8100b003dffcbd3159mr976044wmb.3.1677750072249;
        Thu, 02 Mar 2023 01:41:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+m2jCmZxrs/r4qdIoc1nGJTJq70PHpt6bJcgP4GAdRKd8i5kpDUdOX8h35tBt+ePXnjDguwA==
X-Received: by 2002:a05:600c:3c81:b0:3df:fcbd:3159 with SMTP id bg1-20020a05600c3c8100b003dffcbd3159mr976010wmb.3.1677750071838;
        Thu, 02 Mar 2023 01:41:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b? (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de. [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
        by smtp.gmail.com with ESMTPSA id d20-20020a1c7314000000b003eafc47eb09sm2127748wmb.43.2023.03.02.01.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:41:11 -0800 (PST)
Message-ID: <31a88065-063a-727e-52fd-9fbc7d17fb5c@redhat.com>
Date: Thu, 2 Mar 2023 10:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/1] mm/nommu: remove unnecessary VMA locking
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20230301190457.1498985-1-surenb@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230301190457.1498985-1-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, 
 tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01.03.23 20:04, Suren Baghdasaryan wrote:
> Since CONFIG_PER_VMA_LOCK depends on CONFIG_MMU, the changes in nommu
> are not needed. Remove them.
> 
> Fixes: bad94decd6a4 ("mm: write-lock VMAs before removing them from VMA tree")
> Reported-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Link: https://lore.kernel.org/all/Y%2F8CJQGNuMUTdLwP@localhost/
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
> Fix cleanly applies over mm-unstable, SHA in "Fixes" is from that tree.
> 
>   mm/nommu.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 2ab162d773e2..57ba243c6a37 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -588,7 +588,6 @@ static int delete_vma_from_mm(struct vm_area_struct *vma)
>   		       current->pid);
>   		return -ENOMEM;
>   	}
> -	vma_start_write(vma);
>   	cleanup_vma_from_mm(vma);
>   
>   	/* remove from the MM's tree and list */
> @@ -1520,10 +1519,6 @@ void exit_mmap(struct mm_struct *mm)
>   	 */
>   	mmap_write_lock(mm);
>   	for_each_vma(vmi, vma) {
> -		/*
> -		 * No need to lock VMA because this is the only mm user and no
> -		 * page fault handled can race with it.
> -		 */
>   		cleanup_vma_from_mm(vma);
>   		delete_vma(mm, vma);
>   		cond_resched();

So, i assume this should be squashed.

Reviewed-by: David Hildenbrand <david@redhat.com>


Just a general comment: usually, if review of the original series is 
still going on, it makes a lot more sense to raise such things in the 
original series so the author can fixup while things are still in 
mm-unstable. Once the series is in mm-stable, it's a different story. In 
that case, it is usually good to have the mail subjects be something 
like  "[PATCH mm-stable 1/1] ...".

-- 
Thanks,

David / dhildenb

