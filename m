Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA98C76104E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:11:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W43QyLcg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W43QyLcg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9CVG5YSpz3cp0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:11:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W43QyLcg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W43QyLcg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9CRr6snLz3dg8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:09:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690279749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SNXGmFxRnqmLKduKCutCSEqITPsC6EnMPmnNMtGpqA=;
	b=W43QyLcgBqAfeaAfSSAC7yrhFvuXlt30WnIh7rDSr/4LKS3uvqHm1UYspyrI7B5WPbh/sk
	lkNEVfXl28X7RXH97COKd9E0pc7bcgpNl1nB8ZhJmquK7RVT9XpgJauGKA+5xuhm/qj26y
	yazwMlKAvgIuwswVjJmnMf77OW5efp0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690279749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SNXGmFxRnqmLKduKCutCSEqITPsC6EnMPmnNMtGpqA=;
	b=W43QyLcgBqAfeaAfSSAC7yrhFvuXlt30WnIh7rDSr/4LKS3uvqHm1UYspyrI7B5WPbh/sk
	lkNEVfXl28X7RXH97COKd9E0pc7bcgpNl1nB8ZhJmquK7RVT9XpgJauGKA+5xuhm/qj26y
	yazwMlKAvgIuwswVjJmnMf77OW5efp0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-hWB-TnnbPsio4viib3I7eQ-1; Tue, 25 Jul 2023 06:09:07 -0400
X-MC-Unique: hWB-TnnbPsio4viib3I7eQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b701c82e83so41961701fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690279746; x=1690884546;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SNXGmFxRnqmLKduKCutCSEqITPsC6EnMPmnNMtGpqA=;
        b=EHtcFiw3ITY8sKJe2M9f59iaax4cn59oMRp+kfUgOxp+jt9k0KAxepwFXP4KehfTgH
         gXpqTvtx9ETVrLj6tbN4BQBcVOGMal8wSDVAggBmdnZnMXKXKTJe5K6M7Q1IgmQA3oLj
         3FsQEiXnLEpvf3S4FRhXrZGmqo0yGiQQ/fjk+77c99TWnlZA1fCgetFM7cieUFUnQ62A
         WV+kplhCNsQzt9BmORQcMws3hDBuMXJMeKA9mGYrv3EJON7UK0xOO36S9qzURVqYuMEh
         QBw2Kx8+612KOGLf7Q1KyWIzDZYnqnzg2Mqk3nW7yaw7xmtF0Qq5S19QupEfe3EVQ9TC
         fDHQ==
X-Gm-Message-State: ABy/qLY6VjVewVag2HOx3mc7ok/4bue4vyqviXRmhCJUBQcb0A1bnd/d
	P9y4KbJ+2X5uYwwy2Ki0+lPhgGknYzoGU2+fVoLvuK2hSr9N6n7Dy/59zxb0iKawIhZwMh1Wtes
	98rl1eL7458deazZ9Ln0/hW0DcQ==
X-Received: by 2002:a2e:9b18:0:b0:2b4:737c:e316 with SMTP id u24-20020a2e9b18000000b002b4737ce316mr8290986lji.14.1690279746246;
        Tue, 25 Jul 2023 03:09:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFQODdJ2pJSJgBtgDO5NoCJ1Mp9aVOPiqr5L/+ITahpdOn6uSBK5VHpmuqnyfazcSnPfTGJgw==
X-Received: by 2002:a2e:9b18:0:b0:2b4:737c:e316 with SMTP id u24-20020a2e9b18000000b002b4737ce316mr8290951lji.14.1690279745665;
        Tue, 25 Jul 2023 03:09:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73f:e900:3b0d:87a6:2953:20d1? (p200300cbc73fe9003b0d87a6295320d1.dip0.t-ipconnect.de. [2003:cb:c73f:e900:3b0d:87a6:2953:20d1])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003fbd597bccesm15341720wmd.41.2023.07.25.03.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:09:05 -0700 (PDT)
Message-ID: <7a711faf-0e26-2a3c-eb9e-5b0084ff3810@redhat.com>
Date: Tue, 25 Jul 2023 12:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 5/7] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-6-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230725100212.531277-6-aneesh.kumar@linux.ibm.com>
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>   #endif /* CONFIG_PPC64 */
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 9c62c2c3b3d0..1447509357a7 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -617,6 +617,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   
>   static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   {
> +	mhp_t mhp_flags = MHP_NONE | MHP_MEMMAP_ON_MEMORY;

MHP_NONE is a placeholder, so no need for that and ...

>   	unsigned long block_sz;
>   	int nid, rc;
>   
> @@ -637,7 +638,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   		nid = first_online_node;
>   
>   	/* Add the memory */
> -	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_NONE);
> +	rc = __add_memory(nid, lmb->base_addr, block_sz, mhp_flags);
... this becomes

	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_MEMMAP_ON_MEMORY);

With that

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

