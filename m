Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBB56E0D3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 14:10:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pxz1C3gYkz3fRV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 22:10:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20221208.gappssmtp.com header.i=@ozlabs-ru.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=x3vx9Uo1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20221208.gappssmtp.com header.i=@ozlabs-ru.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=x3vx9Uo1;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pxz0J1Z4cz3fBF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 22:09:33 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-246fdb97191so247486a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 05:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20221208.gappssmtp.com; s=20221208; t=1681387770; x=1683979770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fC7swCqsGSVufMz0OK23aCUiXDDf/Z3zzgbfOWg5le8=;
        b=x3vx9Uo1rrzHddyhS+Ef+EuNqHBsOCAlNvJHJNluECyCUQuB4Vlvar1HUbh7xVFxW+
         f974NDZu+MrmT0zvzITq1/HTGIr1eXXlVjuI9fifbL0LWfa40Fd7WWd2bJILbG+Oah+n
         iHcNLw+hb29itvIl2rN/6DLkveIrEZfQ5KhIO0A+Ci7xUuw5UZE9eCpY6pQytFfh3mHY
         ptDqRa8kSKcUH2M7qxRrNwuZUMo8lljnvjoZA5RKh/yakL2Fx8cxDykXY6RtfLAWZ6gN
         HavOzWcCryPvT7PtDq2FDHT8qMUnVtm3SrKXPij4bKpeXTO4oEgdUkmd8NHBXIsLl1Nx
         0Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681387770; x=1683979770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fC7swCqsGSVufMz0OK23aCUiXDDf/Z3zzgbfOWg5le8=;
        b=T1goKM0bIy3ty3HlkIs8ZowQpxFQX2XfY1++tAdGxeKVmRNS+5l/xX+7fWly87eGL7
         IhBjSXYs6fD9epFA2CKWoz9jTbeki+eLsHyoueB5FYNHMs79BzzVqRMgcPvX7CR+Nyyl
         CalVk3d898eyfBoJPKpEsA1S/MtTF/N6sBNm46wYnEDhiud6/1+Gc9swN8ot17f2xKJd
         iBlLAgG5dWiPvf7nu4I8WsKG1XvMmEKbZCmJ+F5zFTCgRx9W+Qy42oofWFNP+p4+M45M
         ylsgW7PF2ZYJ03umXrI+iEDv10qxd1MyEBz22iESkH9sdIGU+wB9d0aAf3kZ+SaIoOQN
         wQww==
X-Gm-Message-State: AAQBX9cCkKGSEqzxhGRZwIv/P3iscA5w8oGi/KqpIwvl1pzcMUGhCeEg
	dEnB9VXgfTlq0NNVGxrePUUrwA==
X-Google-Smtp-Source: AKy350ZCF3nJLzyOo/4fodCdTblbeeVhBN/n9MvGBg3lmPySenM5YKV7BN2lNGhcody9LlFr4Vwenw==
X-Received: by 2002:a05:6a00:1a4d:b0:63b:1bc7:c703 with SMTP id h13-20020a056a001a4d00b0063b1bc7c703mr3290601pfv.10.1681387770184;
        Thu, 13 Apr 2023 05:09:30 -0700 (PDT)
Received: from [192.168.10.153] (ppp118-208-169-253.cbr-trn-nor-bras39.tpg.internode.on.net. [118.208.169.253])
        by smtp.gmail.com with ESMTPSA id t26-20020aa7939a000000b0063b54ccc123sm870148pfe.196.2023.04.13.05.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 05:09:29 -0700 (PDT)
Message-ID: <2a80cb20-0c9f-2d0c-e951-c4f005f3e4b3@ozlabs.ru>
Date: Thu, 13 Apr 2023 22:09:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:108.0) Gecko/20100101
 Thunderbird/108.0
Subject: Re: Probing nvme disks fails on Upstream kernels on powerpc Maxconfig
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <20230323095333.GI1005120@linux.vnet.ibm.com>
 <906d4d0e-b487-00a5-9399-7d1edc5e20a4@leemhuis.info>
 <87bkk2khl0.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87bkk2khl0.fsf@mpe.ellerman.id.au>
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
Cc: sachinp@linux.vnet.ibm.com, Linux kernel regressions list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/04/2023 15:45, Michael Ellerman wrote:
> "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> writes:
>> [CCing the regression list, as it should be in the loop for regressions:
>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>>
>> On 23.03.23 10:53, Srikar Dronamraju wrote:
>>>
>>> I am unable to boot upstream kernels from v5.16 to the latest upstream
>>> kernel on a maxconfig system. (Machine config details given below)
>>>
>>> At boot, we see a series of messages like the below.
>>>
>>> dracut-initqueue[13917]: Warning: dracut-initqueue: timeout, still waiting for following initqueue hooks:
>>> dracut-initqueue[13917]: Warning: /lib/dracut/hooks/initqueue/finished/devexists-\x2fdev\x2fdisk\x2fby-uuid\x2f93dc0767-18aa-467f-afa7-5b4e9c13108a.sh: "if ! grep -q After=remote-fs-pre.target /run/systemd/generator/systemd-cryptsetup@*.service 2>/dev/null; then
>>> dracut-initqueue[13917]:     [ -e "/dev/disk/by-uuid/93dc0767-18aa-467f-afa7-5b4e9c13108a" ]
>>> dracut-initqueue[13917]: fi"
>>
>> Alexey, did you look into this? This is apparently caused by a commit of
>> yours (see quoted part below) that Michael applied. Looks like it fell
>> through the cracks from here, but maybe I'm missing something.
> 
> Unfortunately Alexey is not working at IBM any more, so he won't have
> access to any hardware to debug/test this.
> 
> Srikar are you debugging this? If not we'll have to find someone else to
> look at it.

Has this been fixed and I missed cc:? Anyway, without the full log, I 
still see it is a huge guest so chances are the guest could not map all 
RAM so instead it uses the biggest possible DDW with 2M pages. If that's 
the case, this might help it:

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 614af78b3695..996acf245ae5 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -906,7 +906,7 @@ void *iommu_alloc_coherent(struct device *dev, 
struct iommu_table *tbl,
         unsigned int nio_pages, io_order;
         struct page *page;

-       size = PAGE_ALIGN(size);
+       size = _ALIGN(size, IOMMU_PAGE_SIZE(tbl));
         order = get_order(size);

         /*
@@ -949,10 +949,9 @@ void iommu_free_coherent(struct iommu_table *tbl, 
size_t size,
         if (tbl) {
                 unsigned int nio_pages;

-               size = PAGE_ALIGN(size);
+               size = _ALIGN(size, IOMMU_PAGE_SIZE(tbl));
                 nio_pages = size >> tbl->it_page_shift;
                 iommu_free(tbl, dma_handle, nio_pages);
-               size = PAGE_ALIGN(size);
                 free_pages((unsigned long)vaddr, get_order(size));
         }


And there may be other places where PAGE_SIZE is used instead of 
IOMMU_PAGE_SIZE(tbl). Thanks,


-- 
Alexey
