Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E37497C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 10:56:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XYv01TEf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XYv01TEf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxVkf1gYBz3bw9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 18:56:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XYv01TEf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XYv01TEf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxVgc5RMTz3c5V
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 18:53:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688633624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81qkwHowwcAcqm6FlMHXXHq0va4tVmVRF/nlPZhKaVo=;
	b=XYv01TEft/2tvD0V9mmOseyLixlgWsIO6577TovaL/IoG/UpBTfsuVBWtlfss/3xwihkfW
	VSrHEqdF3Be3icbCitez3ZHPaFzbxixQ8zsGUmFLcKFm3s4YzSckdo3yuFjYUhN39vX6t6
	jYDvUQRbTpkBathJg9BFhONshNPVukQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688633624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=81qkwHowwcAcqm6FlMHXXHq0va4tVmVRF/nlPZhKaVo=;
	b=XYv01TEft/2tvD0V9mmOseyLixlgWsIO6577TovaL/IoG/UpBTfsuVBWtlfss/3xwihkfW
	VSrHEqdF3Be3icbCitez3ZHPaFzbxixQ8zsGUmFLcKFm3s4YzSckdo3yuFjYUhN39vX6t6
	jYDvUQRbTpkBathJg9BFhONshNPVukQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-VCrIQ1NLPxG_hn9loMq3ww-1; Thu, 06 Jul 2023 04:53:42 -0400
X-MC-Unique: VCrIQ1NLPxG_hn9loMq3ww-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b6e73c6da6so4812741fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 01:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688633621; x=1691225621;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81qkwHowwcAcqm6FlMHXXHq0va4tVmVRF/nlPZhKaVo=;
        b=d4U0Zr+1OLo6nHrlTgZKJLGxO7kLNrnu28CeFX3A8s+KEC6sfc2hSG3tssn9/G4q2y
         Fep8nRgFPBN7ER64GRPUBTQWjYdYOBZBWzh8wbwEVHjVcfwBgN/7oNWhybF9os9owPLr
         1rzSPtpd2VfQ8U/Qbg2DJDbBXDCZkriVbEJEICtOYPEhpSFCpHmow3ikMBGqd3LEYMiI
         SLsyl9kW4fOQHUpIarYNxPYh8CBUcbZpY7UdLcHkHP80nh8sro8c2AmGiOT3JdavIv+/
         YE4k2faoBSClQLemzmQiKixWg3DTHT33puCq05kJJkd9z3NhgYC6zzRelXnxU743MCj6
         6U5g==
X-Gm-Message-State: ABy/qLbCI6tozl6jEWiaoa007RUMJHwW9xfc4NI4ckaNpzbADI8SGdqO
	o3JC/EO/p+J6T0h0l5ecpEFwlRFUKyACF/aSK2V2/7dKIbuI07CznXQSgR9xHbm5KDit9WifaPw
	gjDt4IAhheJHmDiP8b9Dmjv83eg==
X-Received: by 2002:a05:6512:10c3:b0:4fb:89cd:9616 with SMTP id k3-20020a05651210c300b004fb89cd9616mr1155469lfg.0.1688633621303;
        Thu, 06 Jul 2023 01:53:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFn0LChzFLfH/50rYWYE0ovWOJVay0UrM+WH26hzPUG5tAX2N+T2RqjZX3zZr5NXTAsdUU47Q==
X-Received: by 2002:a05:6512:10c3:b0:4fb:89cd:9616 with SMTP id k3-20020a05651210c300b004fb89cd9616mr1155456lfg.0.1688633620944;
        Thu, 06 Jul 2023 01:53:40 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id t19-20020a7bc3d3000000b003fb739d27aesm4438255wmj.35.2023.07.06.01.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 01:53:40 -0700 (PDT)
Message-ID: <136fb8f1-55b1-8fcf-2ab6-18b81a6f149e@redhat.com>
Date: Thu, 6 Jul 2023 10:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/5] mm/hotplug: Simplify
 ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE kconfig
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-5-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230706085041.826340-5-aneesh.kumar@linux.ibm.com>
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

On 06.07.23 10:50, Aneesh Kumar K.V wrote:
> Instead of adding menu entry with all supported architectures, add
> mm/Kconfig variable and select the same from supported architectures.
> 
> No functional change in this patch.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/arm64/Kconfig | 4 +---
>   arch/x86/Kconfig   | 4 +---
>   mm/Kconfig         | 3 +++
>   3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7856c3a3e35a..7e5985c018f8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -78,6 +78,7 @@ config ARM64
>   	select ARCH_INLINE_SPIN_UNLOCK_IRQ if !PREEMPTION
>   	select ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE if !PREEMPTION
>   	select ARCH_KEEP_MEMBLOCK
> +	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>   	select ARCH_USE_CMPXCHG_LOCKREF
>   	select ARCH_USE_GNU_PROPERTY
>   	select ARCH_USE_MEMTEST
> @@ -346,9 +347,6 @@ config GENERIC_CSUM
>   config GENERIC_CALIBRATE_DELAY
>   	def_bool y
>   
> -config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
> -	def_bool y
> -
>   config SMP
>   	def_bool y
>   
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 78224aa76409..d0258e92a8af 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -102,6 +102,7 @@ config X86
>   	select ARCH_HAS_DEBUG_WX
>   	select ARCH_HAS_ZONE_DMA_SET if EXPERT
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>   	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
>   	select ARCH_MIGHT_HAVE_PC_PARPORT
>   	select ARCH_MIGHT_HAVE_PC_SERIO
> @@ -2610,9 +2611,6 @@ config ARCH_HAS_ADD_PAGES
>   	def_bool y
>   	depends on ARCH_ENABLE_MEMORY_HOTPLUG
>   
> -config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
> -	def_bool y
> -
>   menu "Power management and ACPI options"
>   
>   config ARCH_HIBERNATION_HEADER
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 923bd35f81f2..2f9d28fee75d 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -570,6 +570,9 @@ config MHP_MEMMAP_ON_MEMORY
>   	depends on MEMORY_HOTPLUG && SPARSEMEM_VMEMMAP
>   	depends on ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>   
> +config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
> +       bool
> +
>   endif # MEMORY_HOTPLUG
>   
>   # Heavily threaded applications may benefit from splitting the mm-wide

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

