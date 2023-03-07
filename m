Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5D6AD37C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 01:52:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxk70LdLz3bjj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 11:52:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=muySL/Vh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=muySL/Vh;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxjD2gJGz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:51:40 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id ce7so7049743pfb.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 16:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112; t=1678150297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wsioy8YQ3ef0OYXv0f7Vnj0EbcAmvBSGfdorprLbJW4=;
        b=muySL/VhVKsYAWt04ZF9CGXG6QTc6kss3k6hWPN+YONdDLxY+5fKCqpCpwsJh5bi9W
         JoeIL7rOVrgLgtgZltzKJSzd+sY9hDcfRRcTBqlxVBp/QMHMCyMFpKiAY1IrmY1TOPyX
         IFGKXJ9s50VLQfgiQKdIKkAvw5WyNjE44HIm/FQ0SN7JUVlD3bxztPdcyzj2+zF2SRsm
         X8f4nscd/PPw3FCqDo2cjR1SyE0DRKDYgxumcjrwR5GSWdAD2vteiS4lzh1QSqXZUw1r
         VWDrBgSMyeCIdWusyZfMHtAvmq26OSpWHz0gSJP77GFiCk7drT5vdR6k9PG1+54tVuVr
         eIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678150297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wsioy8YQ3ef0OYXv0f7Vnj0EbcAmvBSGfdorprLbJW4=;
        b=lGGAiVkHivNV6jYEhJU80KbsiBzt/pRyxizl8KiUV8t+TcfL/c+Jow1Q2Ty2U1sS+8
         vYg8xolO9RQU7yHXnUFORpz/UsY2dWgUDGxvklTgUCurw7RHJqRN9xhlGC+ccXHyz4Cb
         lM2MIIYj4ewzfXDJohfCXx3sZmmVP6IMJHjRtFFOkT7cEBUxdKleotznTcrnpjJeNG+9
         tDAeBGFZTQrzgeiC/NKnJS/eel2xTrz+5fT1tkpokc7fGF0E3mkrL0hjaCFHw1P+zi8p
         TZBTrkUAit5EH/FGYXS/j41CInj+tesOv55JHSNbQ6A7CTlCtq0BqIMWXiAYWUTzu14E
         dAbA==
X-Gm-Message-State: AO0yUKXugtU6ytiHJV33I7mw6mHJev6Fa1JT2D0cQ4+t7r+HC8lq6LrF
	rwMTKoTiSgzhXYKcHEykjiNiag==
X-Google-Smtp-Source: AK7set+uFltOs1KHmf9btICVwkCk7dCtXIeaSLBg5SFcZ+fSVx0nzri/1pV4bqayxV2ChQKguhCCIA==
X-Received: by 2002:a62:5251:0:b0:619:b116:d1f5 with SMTP id g78-20020a625251000000b00619b116d1f5mr8597698pfb.7.1678150297304;
        Mon, 06 Mar 2023 16:51:37 -0800 (PST)
Received: from [192.168.10.153] (ppp118-208-169-253.cbr-trn-nor-bras39.tpg.internode.on.net. [118.208.169.253])
        by smtp.gmail.com with ESMTPSA id v15-20020a62a50f000000b005b02ddd852dsm6992618pfm.142.2023.03.06.16.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 16:51:36 -0800 (PST)
Message-ID: <04c9ac5e-cd1b-034a-2c97-01a376e9564c@ozlabs.ru>
Date: Tue, 7 Mar 2023 11:51:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:108.0) Gecko/20100101
 Thunderbird/108.0
Subject: Re: [PATCH v2 0/4] Reenable VFIO support on POWER systems
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
 <20230306164607.1455ee81.alex.williamson@redhat.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20230306164607.1455ee81.alex.williamson@redhat.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/03/2023 10:46, Alex Williamson wrote:
> On Mon, 6 Mar 2023 11:29:53 -0600 (CST)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
> 
>> This patch series reenables VFIO support on POWER systems.  It
>> is based on Alexey Kardashevskiys's patch series, rebased and
>> successfully tested under QEMU with a Marvell PCIe SATA controller
>> on a POWER9 Blackbird host.
>>
>> Alexey Kardashevskiy (3):
>>    powerpc/iommu: Add "borrowing" iommu_table_group_ops
>>    powerpc/pci_64: Init pcibios subsys a bit later
>>    powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>>      domains
>>
>> Timothy Pearson (1):
>>    Add myself to MAINTAINERS for Power VFIO support
>>
>>   MAINTAINERS                               |   5 +
>>   arch/powerpc/include/asm/iommu.h          |   6 +-
>>   arch/powerpc/include/asm/pci-bridge.h     |   7 +
>>   arch/powerpc/kernel/iommu.c               | 246 +++++++++++++++++++++-
>>   arch/powerpc/kernel/pci_64.c              |   2 +-
>>   arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
>>   arch/powerpc/platforms/pseries/iommu.c    |  27 +++
>>   arch/powerpc/platforms/pseries/pseries.h  |   4 +
>>   arch/powerpc/platforms/pseries/setup.c    |   3 +
>>   drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
>>   10 files changed, 338 insertions(+), 94 deletions(-)
>>
> 
> For vfio and MAINTAINERS portions,
> 
> Acked-by: Alex Williamson <alex.williamson@redhat.com>
> 
> I'll note though that spapr_tce_take_ownership() looks like it copied a
> bug from the old tce_iommu_take_ownership() where tbl and tbl->it_map
> are tested before calling iommu_take_ownership() but not in the unwind
> loop, ie. tables we might have skipped on setup are unconditionally
> released on unwind.  Thanks,


Ah, true, a bug. Thanks for pointing out.


-- 
Alexey
