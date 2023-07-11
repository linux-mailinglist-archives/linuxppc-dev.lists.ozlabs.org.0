Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A943874EBA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 12:24:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBV64bMV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBV64bMV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0cRZ3dvKz3bnN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 20:24:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBV64bMV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SBV64bMV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0cQj0rvcz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 20:23:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689071002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=up9Wd6IlUgX+685tcIeRwIiBa7KZEfihner4D6aXUpE=;
	b=SBV64bMV/dl8Z+sGyLHl5T0O1kxQfzdHHc4Cv0hi+SSEwh5Ytd7T67yNJCYTaMeex1JGA6
	CnD4H+P/UvlBTRH3BtnAj2slHLwjEqNFSebhfV8FFpLnEwKnN1AkH8+PGfdJ2DlAxApW4T
	MMykRp8gcwvo5KFOE/c6Vm391d7d+D4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689071002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=up9Wd6IlUgX+685tcIeRwIiBa7KZEfihner4D6aXUpE=;
	b=SBV64bMV/dl8Z+sGyLHl5T0O1kxQfzdHHc4Cv0hi+SSEwh5Ytd7T67yNJCYTaMeex1JGA6
	CnD4H+P/UvlBTRH3BtnAj2slHLwjEqNFSebhfV8FFpLnEwKnN1AkH8+PGfdJ2DlAxApW4T
	MMykRp8gcwvo5KFOE/c6Vm391d7d+D4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-KzfuzVkuOCGQOsSdKR-Dyw-1; Tue, 11 Jul 2023 06:23:20 -0400
X-MC-Unique: KzfuzVkuOCGQOsSdKR-Dyw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-2f2981b8364so3291951f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689070999; x=1691662999;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=up9Wd6IlUgX+685tcIeRwIiBa7KZEfihner4D6aXUpE=;
        b=DNMBmtatJhkx/LSgsHYsq/KHgGqfNxTSd9XFqJDZopYdgsFbId5kYD/k0/TTaGFMSY
         ivVZ/AvLdx9C411Q0jxoZBJyKW72oLDx/QRepZNwtAycsOKk1VjYVoll+N7bm27p/Sq/
         9ndg563SteO6fR3zDL3kV21qI49UxbypkdcaQVssEldoT1uSJ6e7PbGSnyztN3r1jZP0
         avUynVTBfs42hm4bzlzSPVWSfgBgDppA3wITvkE/toeiniiElrvXGaz3gfRKcQy3fu8A
         ziJJ7FnIqDqTH6Ks2NBhufNYejaLTYiw7T9qZAqwPlKLxo4C3zanJ5NNQpvFlpHkdahs
         9Ymg==
X-Gm-Message-State: ABy/qLb2QKGH7l+agct4p6VDmhhe7UQjCyDeDpvcaBGTjaBneNQ0/j4Q
	6Yir2NpJCKJB72464aZ23l0mBNSgtSodtpkGFgYoARewXCoySXu4nzNFbTrZiSebs2yXjV4ox9H
	Dg73GuSjdeOveMTQ/fYQ7RDhbAQ==
X-Received: by 2002:adf:ef0e:0:b0:314:1e47:8bc2 with SMTP id e14-20020adfef0e000000b003141e478bc2mr16635779wro.0.1689070999710;
        Tue, 11 Jul 2023 03:23:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHoNQ5m+ASdMSmYWODgj0vIAuLSCLYIfL7R+h+/NTLZfVZg+5f1lWHOKvgvXm/YtBwMFpahzg==
X-Received: by 2002:adf:ef0e:0:b0:314:1e47:8bc2 with SMTP id e14-20020adfef0e000000b003141e478bc2mr16635756wro.0.1689070999380;
        Tue, 11 Jul 2023 03:23:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id o13-20020a5d684d000000b00314315071bbsm1877722wrw.38.2023.07.11.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:23:18 -0700 (PDT)
Message-ID: <d6e9f0d3-7c53-944a-2e02-33cc35d5f340@redhat.com>
Date: Tue, 11 Jul 2023 12:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/7] mm/hotplug: Allow memmap on memory hotplug request
 to fallback
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-3-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230711044834.72809-3-aneesh.kumar@linux.ibm.com>
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

> -bool mhp_supports_memmap_on_memory(unsigned long size)
> +static bool mhp_supports_memmap_on_memory(unsigned long size)
>   {
>   	unsigned long nr_vmemmap_pages = size / PAGE_SIZE;
>   	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
> @@ -1339,13 +1339,12 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>   	 * Self hosted memmap array
>   	 */
>   	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
> -		if (!mhp_supports_memmap_on_memory(size)) {
> -			ret = -EINVAL;
> -			goto error;
> +		if (mhp_supports_memmap_on_memory(size)) {
> +			mhp_altmap.free = PHYS_PFN(size);
> +			mhp_altmap.base_pfn = PHYS_PFN(start);
> +			params.altmap = &mhp_altmap;
>   		}
> -		mhp_altmap.free = PHYS_PFN(size);
> -		mhp_altmap.base_pfn = PHYS_PFN(start);
> -		params.altmap = &mhp_altmap;
> +		/* fallback to not using altmap  */
>   	}
>   
>   	/* call arch's memory hotadd */

In general, LGTM, but please extend the documentation of the parameter 
in memory_hotplug.h, stating that this is just a hint and that the core 
can decide to no do that.

-- 
Cheers,

David / dhildenb

