Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B16D63C6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 15:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrTd11lc4z3f3y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 23:48:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YhmCImWg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YhmCImWg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YhmCImWg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YhmCImWg;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrTc61vLmz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 23:48:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680616082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsTIZUaOt4/p51daq2PZX1n16o1nkazviHKpSzXwqxo=;
	b=YhmCImWgyH1oTFbmb2X1DxdAwli7ivxE8jb3CvClzX9cZHmx8R33CMxyaQuPSlD0ISpoX0
	2aQqcwt+eAmnuxlWihBgJSmeppoWjD9XTHi3/nuO/umFMHV8UYHvsxjRJjEz/29mb/y0V2
	zw9KSAG81pJuyzGSFPUilIskzS+C9xU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680616082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsTIZUaOt4/p51daq2PZX1n16o1nkazviHKpSzXwqxo=;
	b=YhmCImWgyH1oTFbmb2X1DxdAwli7ivxE8jb3CvClzX9cZHmx8R33CMxyaQuPSlD0ISpoX0
	2aQqcwt+eAmnuxlWihBgJSmeppoWjD9XTHi3/nuO/umFMHV8UYHvsxjRJjEz/29mb/y0V2
	zw9KSAG81pJuyzGSFPUilIskzS+C9xU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-bjkNTa1NOkOG6gzIJj3G3Q-1; Tue, 04 Apr 2023 09:48:00 -0400
X-MC-Unique: bjkNTa1NOkOG6gzIJj3G3Q-1
Received: by mail-wr1-f70.google.com with SMTP id t9-20020adfba49000000b002dd3986083bso3732091wrg.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 06:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680616079;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsTIZUaOt4/p51daq2PZX1n16o1nkazviHKpSzXwqxo=;
        b=vjpZY3RLa1iPfPdUEd4I++k9OITBJoqxDyc+S2vmxXwHut9hj45ZQ/EPe1yC+ffhwP
         UZFUzQ+1+ZRqWuwiV56gxh3o3oWQ5YiDqOpNZsubO4n+2DMlleSbeV3vfh34ppyfOs/h
         pO4jO6wi5rVXMRQIfYau6ak8nuI1qULdUe0GUdNzh+qnu6w4DeCFmDRJ5y7RhIA05XMq
         7ydZIt9EpOrD+CPf2M0gMyt6wVJaisdTFnhwnGiqpmyTbTrNDqGBNeWeW057rx7r2hep
         znGU0tPUR7xiiCBBOJiO3ZQZRXGgU8JDEH5e3eXdLDngJbB+5gSlDu4qGBZI4qj4mL3I
         Whjw==
X-Gm-Message-State: AAQBX9ewrU3tFsn3UdetyMYzZlVm+pzQd8Ee/vOE0lO4gML4s5+KD+wN
	txGWNipa/U7eRinEB1Nrc4cT71moyNxJ2+zHzOWa9WdeeVoQuXF7T8n5SmpoWOB/6V776uKnE+r
	cTnMXrHlNEThjV66GDQjH29iviA==
X-Received: by 2002:a5d:4d11:0:b0:2ce:9819:1c1e with SMTP id z17-20020a5d4d11000000b002ce98191c1emr1783374wrt.30.1680616079631;
        Tue, 04 Apr 2023 06:47:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bmtLhdkOTL49G5hyyIR/dGwEI3AOPEAjf+veEKXRQyea3PV+FawQK0/io3jdVH76JN5ImpWw==
X-Received: by 2002:a5d:4d11:0:b0:2ce:9819:1c1e with SMTP id z17-20020a5d4d11000000b002ce98191c1emr1783320wrt.30.1680616079268;
        Tue, 04 Apr 2023 06:47:59 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:b600:e63:6c3b:7b5d:f439? (p200300cbc709b6000e636c3b7b5df439.dip0.t-ipconnect.de. [2003:cb:c709:b600:e63:6c3b:7b5d:f439])
        by smtp.gmail.com with ESMTPSA id d7-20020adfe2c7000000b002d419f661d6sm12391832wrj.82.2023.04.04.06.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 06:47:58 -0700 (PDT)
Message-ID: <78a31392-8f9b-9705-918a-24edb650f395@redhat.com>
Date: Tue, 4 Apr 2023 15:47:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] arch: Introduce ARCH_HAS_CPUMASK_BITS
To: Yair Podemsky <ypodemsk@redhat.com>, linux@armlinux.org.uk,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, will@kernel.org,
 aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, peterz@infradead.org,
 arnd@arndb.de, keescook@chromium.org, paulmck@kernel.org,
 jpoimboe@kernel.org, samitolvanen@google.com, frederic@kernel.org,
 ardb@kernel.org, juerg.haefliger@canonical.com, rmk+kernel@armlinux.org.uk,
 geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org,
 sebastian.reichel@collabora.com, nick.hawkins@hpe.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 mtosatti@redhat.com, vschneid@redhat.com, dhildenb@redhat.com
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-2-ypodemsk@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230404134224.137038-2-ypodemsk@redhat.com>
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
Cc: alougovs@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04.04.23 15:42, Yair Podemsky wrote:
> Some architectures set and maintain the mm_cpumask bits when loading
> or removing process from cpu.
> This Kconfig will mark those to allow different behavior between
> kernels that maintain the mm_cpumask and those that do not.
> 

I was wondering if we should do something along the lines of:

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 0722859c3647..1f5c15d8e8ed 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -767,11 +767,13 @@ struct mm_struct {
  #endif /* CONFIG_LRU_GEN */
         } __randomize_layout;

+#ifdef CONFIG_MM_CPUMASK
         /*
          * The mm_cpumask needs to be at the end of mm_struct, because it
          * is dynamically sized based on nr_cpu_ids.
          */
         unsigned long cpu_bitmap[];
+#endif
  };

But that would, of course, require additional changes to make it 
compile. What concerns me a bit is that we have in mm/rmap.c a 
mm_cpumask() usage. But it's glued to 
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH ... shaky.

At least if we would properly fence it, there would be no
accidental abuse anymore.


> Signed-off-by: Yair Podemsky <ypodemsk@redhat.com>
> ---
>   arch/Kconfig         | 8 ++++++++
>   arch/arm/Kconfig     | 1 +
>   arch/powerpc/Kconfig | 1 +
>   arch/s390/Kconfig    | 1 +
>   arch/sparc/Kconfig   | 1 +
>   arch/x86/Kconfig     | 1 +

As Valentin says, there are other architectures that do the same.

-- 
Thanks,

David / dhildenb

