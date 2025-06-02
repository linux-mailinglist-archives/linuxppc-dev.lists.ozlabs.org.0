Return-Path: <linuxppc-dev+bounces-9074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E1ACAC77
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 12:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9qs52tl5z2yNB;
	Mon,  2 Jun 2025 20:31:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748860313;
	cv=none; b=Jd+4ueActcLlbiyQSO3UxlzLMcIa1+rSgAityh3JDIxTkiftfeZd1TZaLiKT2yp3AJcPm6pfT8Cyqothlso2jrvf6jr5GeRtFR8UwIAMU/HpnWrVMR1dg+3O8DoZMc1E4eBwaRRuJaDRH35/2B++1M+CadWzsmqO15zq6sLI+JFyElTNfLdUtc3zfcyo1Vz9Lqptu6GhHRGGS8nnPABt8EMdrF2ay7caM15NRic4vhHHzHWDTXEhbZSRmset9Zfl7rYhyG5ATnmnP+Z/MPkHI9wbg4+nPNfl/YpVmDLYmNUnhS/qrJzFJZna0fpXct/5L/xZMiY93gPgpl12pk6rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748860313; c=relaxed/relaxed;
	bh=zNGcx2ArrxJr8cIK8d0qYe5Yw20pPHTlFAddIJE8YQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+/s1a+YE0c9/81+I6guNu/lH7OXxwC/6A1fjwkCLqvJN1AzHEt8th2sSgI2yAOZ8+o37DhPKx9N5o9maWt7zIVyhxd4mWwqqRdmO3H7bCGqrPe8pC9ID7MUeulhJ+NK8yZenlM9ZzxjPavr8m3BFJQ+UmxSdOEGt8+TUKKXbcdALyfzGEgP6XFKxwISROpMEzCrckUMFFCVhowH7abAc219uLh5jdYeNFhNzbbcLevYWisRFGkYh73GLKGDdlHKBRAGjwAkMstzPvdSQrQGYuU5udVP1+FFw+lfvpzmDjFLiG48bAcWz+t/fK7QNboTBwKh36klMO+2krjY8X2Mnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BIqhjEgc; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BIqhjEgc; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BIqhjEgc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BIqhjEgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9qs41tGZz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 20:31:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748860308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zNGcx2ArrxJr8cIK8d0qYe5Yw20pPHTlFAddIJE8YQE=;
	b=BIqhjEgcyXhzr5YECzxep8f2NgNI8G81kTty+Kc/cu15MbXjk00H3FdW3F9zjm1Rip1Y1X
	8teCHTL40WAdivR3ENG4a+fd1i+K4l/15xobcNpWvwx80tpFtbSQfKBiEExT+FxK7SN/8x
	UzhdAGOzSx+Sa3aISKC+LRJcZSkSGe4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748860308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zNGcx2ArrxJr8cIK8d0qYe5Yw20pPHTlFAddIJE8YQE=;
	b=BIqhjEgcyXhzr5YECzxep8f2NgNI8G81kTty+Kc/cu15MbXjk00H3FdW3F9zjm1Rip1Y1X
	8teCHTL40WAdivR3ENG4a+fd1i+K4l/15xobcNpWvwx80tpFtbSQfKBiEExT+FxK7SN/8x
	UzhdAGOzSx+Sa3aISKC+LRJcZSkSGe4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-giuuhzAIMHOW2RO6FkcoLQ-1; Mon, 02 Jun 2025 06:31:47 -0400
X-MC-Unique: giuuhzAIMHOW2RO6FkcoLQ-1
X-Mimecast-MFC-AGG-ID: giuuhzAIMHOW2RO6FkcoLQ_1748860306
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d30992bcso11449235e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Jun 2025 03:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860306; x=1749465106;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zNGcx2ArrxJr8cIK8d0qYe5Yw20pPHTlFAddIJE8YQE=;
        b=KwgE+1GivA8tocicLzHXgQLu9B4ZQJrnoikaCyQ3mmJPgqu2uUwf3yHFx3A8aNFtTG
         YP4NNC8089cqNBLzdsxw+SC25WDG2FJriSnQMjN68T6/KTvGKTxd1RqXtHg7xmrI66Ev
         lspFPTw2um/n94QHeJh7b9j3c6YfM2huWjOlkONu2SuMegdvAL3cNSk5AI1ivDktBjwk
         pDLj+/X0jx7q6iBwN0grynThCLf2uzdchhDEJ77YjHTfgm9bYFC7i7W6P4YIW1p8uoiy
         vWaGpS+hnHsj6BnBU3sGzvnYvn0SrYjXTedXJcftFD0nKvcto2UObEQZsxl70wsvWW8n
         TiJw==
X-Forwarded-Encrypted: i=1; AJvYcCV3sfhYo8wsWoYCFgK5k3TWV85N20WC9dHxJStBKslCTw0pe77ttixVSvDn07xgm1iTrOCJKRSdfjrBWr4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybB2NqE6tD8ineb7xvwGcmyPiB3qbyXpH9ZEY3IuSSf10BF/wh
	U44c6zdMLLS8Hj6iDfG/SG4mACWy6gZEtG0YtB5MEPPkmpZyUHb1LrXWv0ommBrZfp6wFHxkNA/
	m5ormWWnluvUiuMIaJwySbAz2P54YEpxoYVaGYcWP2PZanoRyrQlRJHmHtyAcM8+TuU0=
X-Gm-Gg: ASbGncsJfWSM7Yb6X3slrp6vK31YA3ZPiD99xuVxCIbaXfp00cIptvJGodkKSuNnoJv
	LT2YgzWkJwIeww26L3+zK/8tAcW4GqqsNC8lVXY4LhOseaiAX0gnZTzCRNuhEx/9T5/aDLyeMB3
	Q00/7M1AijUIxXorkcrPM9L0BMANuSOdcEp8C2gVMsTBWSD2ndW7DDlF+/qgMJf6OwDcU/iupgF
	AAHKFQURxyZqiLFO+FIS43J8p+pBhy1+L4zQ9HaaPooXbrB1rLA+hPGWN2Pc4F4+RC9sQTTaRpH
	3w+MQdqgOBYMWXVjThfHZGLPIHOqLzve4B7m/S6+H5224Bq23p8KqEgR0NTR/UMGlTtIOYmd/Ea
	gq/MHSAmE8QV5jROey35F9JnXQUwkZeiG4/EV1nc=
X-Received: by 2002:a05:600c:4e48:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-4511ee14c08mr77083285e9.16.1748860305798;
        Mon, 02 Jun 2025 03:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4lrvLwHaEWScY/8IOL/Tuots8CWM7YWfHJfcP7R1yvYuRofYdh+DhIzzTEbvoU5wPzbYr8A==
X-Received: by 2002:a05:600c:4e48:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-4511ee14c08mr77082755e9.16.1748860305291;
        Mon, 02 Jun 2025 03:31:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm118287075e9.1.2025.06.02.03.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 03:31:44 -0700 (PDT)
Message-ID: <13ea6653-d33d-4f76-88c8-a17f9989d069@redhat.com>
Date: Mon, 2 Jun 2025 12:31:43 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] mm: Remove pXX_devmap page table bit and pfn_t type
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: agn-D_zh0L4SujqN3NwQWBd9zQEhy7MLOZ20Vx8jSaI_1748860306
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.05.25 08:32, Alistair Popple wrote:
> Changes from v2 of the RFC[1]:
> 
>   - My ZONE_DEVICE refcount series has been merged as commit 7851bf649d42 (Patch series
>     "fs/dax: Fix ZONE_DEVICE page reference counts", v9.) which is included in
>     v6.15 so have rebased on top of that.
> 
>   - No major changes required for the rebase other than fixing up a new user of
>     the pfn_t type (intel_th).
> 
>   - As a reminder the main benefit of this series is it frees up a PTE bit
>     (pte_devmap).
> 
>   - This may be a bit late to consider for inclusion in v6.16 unless it can get
>     some more reviews before the merge window closes. I don't think missing v6.16
>     is a huge issue though.
> 
>   - This passed xfstests for a XFS filesystem with DAX enabled on my system and
>     as many of the ndctl tests that pass on my system without it.
> 
> Changes for v2:
> 
>   - This is an update to my previous RFC[2] removing just pfn_t rebased
>     on today's mm-unstable which includes my ZONE_DEVICE refcounting
>     clean-up.
> 
>   - The removal of the devmap PTE bit and associated infrastructure was
>     dropped from that series so I have rolled it into this series.
> 
>   - Logically this series makes sense to me, but the dropping of devmap
>     is wide ranging and touches some areas I'm less familiar with so
>     would definitely appreciate any review comments there.
> 
> [1] - https://lore.kernel.org/linux-mm/cover.95ff0627bc727f2bae44bea4c00ad7a83fbbcfac.1739941374.git-series.apopple@nvidia.com/
> [2] - https://lore.kernel.org/linux-mm/cover.a7cdeffaaa366a10c65e2e7544285059cc5d55a4.1736299058.git-series.apopple@nvidia.com/
> 
> All users of dax now require a ZONE_DEVICE page which is properly
> refcounted. This means there is no longer any need for the PFN_DEV, PFN_MAP
> and PFN_SPECIAL flags. Furthermore the PFN_SG_CHAIN and PFN_SG_LAST flags
> never appear to have been used. It is therefore possible to remove the
> pfn_t type and replace any usage with raw pfns.
> 
> The remaining users of PFN_DEV have simply passed this to
> vmf_insert_mixed() to create pte_devmap() mappings. It is unclear why this
> was the case but presumably to ensure vm_normal_page() does not return
> these pages. These users can be trivially converted to raw pfns and
> creating a pXX_special() mapping to ensure vm_normal_page() still doesn't
> return these pages.
> 
> Now that there are no users of PFN_DEV we can remove the devmap page table
> bit and all associated functions and macros, freeing up a software page
> table bit.
> 

$ git grep FS_DAX_LIMITED
fs/Kconfig:     depends on ZONE_DEVICE || FS_DAX_LIMITED
fs/Kconfig:config FS_DAX_LIMITED
fs/dax.c:       if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
fs/dax.c:       if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
fs/dax.c:       if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
include/linux/pfn_t.h: * PFN_SPECIAL - for CONFIG_FS_DAX_LIMITED builds 
to allow XIP, but not
mm/memremap.c:          if (IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {

Can we remove that? Especially the interaction with PFN_SPECIAL looks 
concerning.

-- 
Cheers,

David / dhildenb


