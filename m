Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1E0761049
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:10:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHoPiOxs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHoPiOxs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9CT91wTNz3cbF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:10:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHoPiOxs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bHoPiOxs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9CPP55grz3dCK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 20:07:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690279622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2VenSLEYb8bO0SLCRcE+DJKonVyjC0zvnrdCthKHcM=;
	b=bHoPiOxsxAARSy5E3bX73h2UHUT4rOA0Q1h3dZOHm92i6SCvf7H5xnVMxL0MBcDMphiM6j
	zkeYM6+f1G2/VAk63V0RtPxPxF6higdS+RKJfMb/vsyc9yyMBa6V4Psz43Ic1sH1pqTGUG
	DI7nZGPvMf8lOH3IriUZ0tIwq1sfGMY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690279622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2VenSLEYb8bO0SLCRcE+DJKonVyjC0zvnrdCthKHcM=;
	b=bHoPiOxsxAARSy5E3bX73h2UHUT4rOA0Q1h3dZOHm92i6SCvf7H5xnVMxL0MBcDMphiM6j
	zkeYM6+f1G2/VAk63V0RtPxPxF6higdS+RKJfMb/vsyc9yyMBa6V4Psz43Ic1sH1pqTGUG
	DI7nZGPvMf8lOH3IriUZ0tIwq1sfGMY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-4mCTO_17O9CDYgmfT3nwTA-1; Tue, 25 Jul 2023 06:07:01 -0400
X-MC-Unique: 4mCTO_17O9CDYgmfT3nwTA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3176ace3f58so287894f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690279620; x=1690884420;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2VenSLEYb8bO0SLCRcE+DJKonVyjC0zvnrdCthKHcM=;
        b=g1CeLlPHS9ZDW6vaqwLaQ8tg7q6zIdWtJGqqpdJB/y6Fn0u5sCAOvHymZBenO7MA4w
         489fQSpYZxErfOEGanKtfXcrmusf9WW3r9W7S6a1QWTh0myPsmpoEgEbd12MDai6Siq4
         9e5yJJFwTnm8YrLFNKJEki6sy7mWMRxbZCl5FWW3HVL3+jYtRFM8UezoAnInkzplyIUM
         GbPTuFjTgPzQePc4IguG/917EbSZT2YTl8LW6oiGe4ZpG+D9RyGHhaQ2yF4qHAAiYJAD
         AwVq0nXlrrKczXDNYMIfD4LiRvXt5Kst10XGLouaYZ8K6hefTld/f3F2LythaB6EcXm2
         8NYA==
X-Gm-Message-State: ABy/qLbJC4TsSvWCzTBexFz5emvpLGEzKNEtRXoRm7PMSBmUQGdCN+eE
	roUekobbeDDM5rIRqMgnitjtI1gJpVD58j7XfBaQk2HdmjbDK2GYl0neolkpA+1NQNyKuJpHGVI
	jIIycM2qnOIcNusVoC7pjWf2rIQ==
X-Received: by 2002:a05:600c:ca:b0:3fc:dd9:91fd with SMTP id u10-20020a05600c00ca00b003fc0dd991fdmr7738500wmm.40.1690279619826;
        Tue, 25 Jul 2023 03:06:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG1LVe8tJoCHQdIFIil1IEN5XwljVIHGL8eeT5YBiLU3OKnv23vz9RgYv97k5fUIjPjqNeHLA==
X-Received: by 2002:a05:600c:ca:b0:3fc:dd9:91fd with SMTP id u10-20020a05600c00ca00b003fc0dd991fdmr7738480wmm.40.1690279619503;
        Tue, 25 Jul 2023 03:06:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73f:e900:3b0d:87a6:2953:20d1? (p200300cbc73fe9003b0d87a6295320d1.dip0.t-ipconnect.de. [2003:cb:c73f:e900:3b0d:87a6:2953:20d1])
        by smtp.gmail.com with ESMTPSA id m14-20020a7bcb8e000000b003fbc9371193sm12862042wmi.13.2023.07.25.03.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:06:59 -0700 (PDT)
Message-ID: <315cc808-ab62-c133-8579-7e13010ac9c7@redhat.com>
Date: Tue, 25 Jul 2023 12:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/7] Add support for memmap on memory feature on ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
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

On 25.07.23 12:02, Aneesh Kumar K.V wrote:
> This patch series update memmap on memory feature to fall back to
> memmap allocation outside the memory block if the alignment rules are
> not met. This makes the feature more useful on architectures like
> ppc64 where alignment rules are different with 64K page size.
> 
> This patch series is dependent on dax vmemmap optimization series
> posted here
> https://lore.kernel.org/linux-mm/20230718022934.90447-1-aneesh.kumar@linux.ibm.com/
> 
> Changes from v4:
> * Use altmap.free instead of altmap.reserve
> * Address review feedback
> 
> Changes from v3:
> * Extend the module parameter memmap_on_memory to force allocation even
>    though we can waste hotplug memory.
> 
> Changes from v2:
> * Rebase to latest linus tree
> * Redo the series based on review feedback. Multiple changes to the patchset.
> 
> Changes from v1:
> * update the memblock to store vmemmap_altmap details. This is required
> so that when we remove the memory we can find the altmap details which
> is needed on some architectures.
> * rebase to latest linus tree
> 
> 
> 
> Aneesh Kumar K.V (7):
>    mm/hotplug: Simplify ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
>    mm/hotplug: Allow memmap on memory hotplug request to fallback
>    mm/hotplug: Allow architecture to override memmap on memory support
>      check
>    mm/hotplug: Support memmap_on_memory when memmap is not aligned to
>      pageblocks
>    powerpc/book3s64/memhotplug: Enable memmap on memory for radix
>    mm/hotplug: Embed vmem_altmap details in memory block
>    mm/hotplug: Enable runtime update of memmap_on_memory parameter

Nit for all patches: we use "mm/memory_hotplug" as prefix. (I somehow 
missed that earlier :D )

-- 
Cheers,

David / dhildenb

