Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D763D74EBA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 12:22:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ET+Q/Wyf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ET+Q/Wyf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0cPN5ZjFz301b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 20:22:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ET+Q/Wyf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ET+Q/Wyf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0cNV1Tymz30Dm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 20:21:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689070886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3CdkdlOsc3iW5ATS8hrwj2Vbpb61+JmYd2YSFneWYxY=;
	b=ET+Q/WyfvG0mTh+ptaZOt8nfuo5vLKzKbrMzIj9dx5Qbipcf0yoaAdNvw3BmXn2iNKAY9W
	ETNPG+uWns3ET9ZUUhNZM746LanLEVa9QRhmsTImos8JWYytM3xfkKfuGq75p+qMZUl1Al
	fL8Iztu6psB/7W858XKYN+r8uv4KBro=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689070886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3CdkdlOsc3iW5ATS8hrwj2Vbpb61+JmYd2YSFneWYxY=;
	b=ET+Q/WyfvG0mTh+ptaZOt8nfuo5vLKzKbrMzIj9dx5Qbipcf0yoaAdNvw3BmXn2iNKAY9W
	ETNPG+uWns3ET9ZUUhNZM746LanLEVa9QRhmsTImos8JWYytM3xfkKfuGq75p+qMZUl1Al
	fL8Iztu6psB/7W858XKYN+r8uv4KBro=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-HSpJ7ATTPHyJl5Jz_wteqQ-1; Tue, 11 Jul 2023 06:21:24 -0400
X-MC-Unique: HSpJ7ATTPHyJl5Jz_wteqQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f42bcef2acso33140705e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689070883; x=1691662883;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CdkdlOsc3iW5ATS8hrwj2Vbpb61+JmYd2YSFneWYxY=;
        b=lGSuz5nvUuLyeLlSmyKcc88DQ1l9M36qyv3GjIYDlkN8gT2lre7P0rz3WX+8JzEutB
         gj/uHUVQQ5T4kWW8s5X9ZZqJAWCUUtaoz3WxDpOs1HEBS0Dcsu8VfsLiQ5EXUhpEBT0t
         zhAY2BSwyBu5VYQY8eCh8p2qfWeBUD3oguaPZ1/bPUca7l1A170pAvhOkxGCU1JxrAg7
         MYkWdhltTa0czbnpB8d3Sj2YH69M5F8isM9dGKpMDfSXPsalN65KS0L50JrWtmFids7K
         jnJqX+1Mp2+rKD2GP1OhXtYIn6f6ZBjDOe0w4KxHknuACKuFKJJ1J5sB+wtlDGEG+Hok
         /WYw==
X-Gm-Message-State: ABy/qLbBP9114q3xDfnFiISs+hJ5/jnfsq/k9acr2wRIzbQJmldsk8sq
	iwunZCrQDUI6OR3ZgLFJNrfbSQi4Kc/cYjOrt5gSaLA3P9JZsQY5zXt9OF1qeEZeeEDajvOpty7
	d3zmc+ClBGVnOFI+rttOEpxk0SQ==
X-Received: by 2002:a1c:e915:0:b0:3fb:b5dc:dab1 with SMTP id q21-20020a1ce915000000b003fbb5dcdab1mr12747488wmc.39.1689070883572;
        Tue, 11 Jul 2023 03:21:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE2M31E1VCPbSw8pkfSZYPDyGHo4xFLwBFEG1lvc++RC35ptTSDjosBu7e0oQqdNT2XNXwtiQ==
X-Received: by 2002:a1c:e915:0:b0:3fb:b5dc:dab1 with SMTP id q21-20020a1ce915000000b003fbb5dcdab1mr12747470wmc.39.1689070883279;
        Tue, 11 Jul 2023 03:21:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b003fc0062f0f8sm2151136wmh.9.2023.07.11.03.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:21:22 -0700 (PDT)
Message-ID: <6b59462f-1cce-9a76-1dbc-7a4092634fa1@redhat.com>
Date: Tue, 11 Jul 2023 12:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 6/7] dax/kmem: Always enroll hotplugged memory for
 memmap_on_memory
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-7-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230711044834.72809-7-aneesh.kumar@linux.ibm.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Dave Jiang <dave.jiang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Huang Ying <ying.huang@intel.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.07.23 06:48, Aneesh Kumar K.V wrote:
> From: Vishal Verma <vishal.l.verma@intel.com>
> 
> With DAX memory regions originating from CXL memory expanders or
> NVDIMMs, the kmem driver may be hot-adding huge amounts of system memory
> on a system without enough 'regular' main memory to support the memmap
> for it. To avoid this, ensure that all kmem managed hotplugged memory is
> added with the MHP_MEMMAP_ON_MEMORY flag to place the memmap on the
> new memory region being hot added.
> 
> To do this, call add_memory() in chunks of memory_block_size_bytes() as
> that is a requirement for memmap_on_memory.
> 
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Huang Ying <ying.huang@intel.com>
> Signed-off-by: Vishal Verma <vishal.l.verma@intel.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---


See my feedback as reply to the original patch.

-- 
Cheers,

David / dhildenb

