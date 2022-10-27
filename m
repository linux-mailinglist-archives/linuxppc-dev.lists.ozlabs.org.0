Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979260F142
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 09:40:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyczR0dNkz3cCZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 18:40:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=2ThwM1Cd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=2ThwM1Cd;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MycyT3DjTz307C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 18:39:42 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id 4so640014pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ea0hxXYFnPXaT0jl+FmZql4yNHr4Fyf6HAvktIBslno=;
        b=2ThwM1CdoeYroa+FUfTpj1Vp6/OxgPMaiL4s0FckhXA4OUMe7dceB7UU1bxyXDnuNT
         WRLa57sVacmjmOn6/3JMFN+P690O63TOweBHTnc9vTjCcsua1jCjyBEObGuG4JNkFcBX
         +X2VqROAzObgXJiUk/KP3G2MezF7+FVhsRLKfahh7SpBP5I2kkAUFIctsR2wVs0JG3vK
         4VwHwAZOftrzGJFOnvqwc+Ly/CAjReoxjQN+LPM8LImCcwKtGKGJds9D3FShYfvqiYRG
         5ukKRJWvxfdNdMk0OEOi3rMATxsR/6zvedd4U1Q16Rs72dRhSeHTQID9YYcB4VLBpaSL
         G8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea0hxXYFnPXaT0jl+FmZql4yNHr4Fyf6HAvktIBslno=;
        b=RZgJFPIxOwMuWECvS+1k6bNeJBWInA5mys+WbAApKHhc6CNL2tPR6mKDJBMnbQDmBC
         E8gIV8fWA8Ew+dPM3LHH8gPl181I6W+JmcrEmJa0zXIqemnKzQTTQWbHXUEWu2WRM1JN
         Yr1Z1jNEVvJ2XEkySeUxn25JVAfwgoGn5Hn4JVLCiD8jag5cDN/3g2I05pVnV+WJNky7
         4JAtSuudvZWVIRec3i5THHnAhUHu5Ap4CfeSGfM90/2nWC18Mg3rcp7rHAMu0m4o6lQx
         ayfaFZM+TGgDIwV8bAroeGOSXum+z9h9jFl4LYhx8NHAItKcxhlXp1RKiGmCxhseizs0
         hcHg==
X-Gm-Message-State: ACrzQf3eRMfOoH+gPW6vmNVy0QztlVaidPte9jibPG2J2tJK2RVjPduH
	sHDT4Spk/wXUulyPxsGiC93Kx8k/OKlqwg==
X-Google-Smtp-Source: AMsMyM5bFkKEzQ/H6gKUH7MQ0VVAtvEwIxKoZncGQIAFcNvoO2vHRJC/jD9FI81OF59vCOMa2psMJg==
X-Received: by 2002:a17:902:e845:b0:184:8078:be88 with SMTP id t5-20020a170902e84500b001848078be88mr47545935plg.99.1666856377744;
        Thu, 27 Oct 2022 00:39:37 -0700 (PDT)
Received: from [192.168.10.153] (ppp121-45-204-168.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.204.168])
        by smtp.gmail.com with ESMTPSA id u66-20020a627945000000b0056c814a501dsm594389pfc.10.2022.10.27.00.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 00:39:37 -0700 (PDT)
Message-ID: <737f1978-4f3c-40be-ed78-8fe525d04da8@ozlabs.ru>
Date: Thu, 27 Oct 2022 18:39:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:107.0) Gecko/20100101
 Thunderbird/107.0
Subject: Re: [PATCH kernel v2 0/3] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20220920130457.29742-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220920130457.29742-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex.williamson@redhat.com>, kvm-ppc@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael, Fred, ping?


On 20/09/2022 23:04, Alexey Kardashevskiy wrote:
> Here is another take on iommu_ops on POWER to make VFIO work
> again on POWERPC64. Tested on PPC, kudos to Fred!
> 
> The tree with all prerequisites is here:
> https://github.com/aik/linux/tree/kvm-fixes-wip
> 
> The previous discussion is here:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220707135552.3688927-1-aik@ozlabs.ru/
> https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/
> https://lore.kernel.org/all/20220714081822.3717693-3-aik@ozlabs.ru/T/
> 
> Please comment. Thanks.
> 
> 
> This is based on sha1
> ce888220d5c7 Linus Torvalds "Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi".
> 
> Please comment. Thanks.
> 
> 
> 
> Alexey Kardashevskiy (3):
>    powerpc/iommu: Add "borrowing" iommu_table_group_ops
>    powerpc/pci_64: Init pcibios subsys a bit later
>    powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>      domains
> 
>   arch/powerpc/include/asm/iommu.h          |   6 +-
>   arch/powerpc/include/asm/pci-bridge.h     |   7 +
>   arch/powerpc/platforms/pseries/pseries.h  |   4 +
>   arch/powerpc/kernel/iommu.c               | 247 +++++++++++++++++++++-
>   arch/powerpc/kernel/pci_64.c              |   2 +-
>   arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
>   arch/powerpc/platforms/pseries/iommu.c    |  27 +++
>   arch/powerpc/platforms/pseries/setup.c    |   3 +
>   drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
>   9 files changed, 334 insertions(+), 94 deletions(-)
> 

-- 
Alexey
