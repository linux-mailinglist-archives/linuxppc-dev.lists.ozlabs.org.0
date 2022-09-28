Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 920505EE0F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 17:54:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md1K74T5Tz3c69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 01:54:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zVPtZAzw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zVPtZAzw;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md1JT4bGCz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 01:54:15 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d82so12872163pfd.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QSAEb2hPZjK1ev/lBZ3te+y9kjBYl6H9pPRLwr+M8HM=;
        b=zVPtZAzw49EHbsqZqHSTXnYA4fCJVgV0ehiFbcHyaUHvs7WCLafoa7uK8ML2BgDos4
         U3FTz1fzfHSRaG2aOZCd8/5mNO7Axa7rX0KW2D5mLDTSbLVEtkUQOx6vb/WyEcOgh4Uz
         G3MWAF5BUbXqgxQMBe6juX25LkAKPlRyvo63Wzt+Yv3rhBiZNaVmN2vC4IinqkH8thMI
         fcW+q5fTcp+dYGYs/mLBTunIT/PtRbJH+KvZjES40kJqik7SN1sR/JSsLEQ/r4w+dY53
         yZdvlKWU6xrLQVlPNbzhwy4LOQyi9Q3bXls/2CE0MyPKoxajKOawzKhM6WGhLzi7H/dw
         P2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QSAEb2hPZjK1ev/lBZ3te+y9kjBYl6H9pPRLwr+M8HM=;
        b=c2ZwW5pUQZYJTITbIp3P2pX5gE09hCdJufmwysWiTQ2fCtIDWuw7bh5EO4bkNXJxKz
         J2Se81aM1USrn2xpG15GxpFP5FDjq8H/emLaNZlfSkUSMzLTGGcLSkhl4TeHWMVGM7M4
         4Wgh3z1HVTy/5QaUgM3b0k38kB/JGDsDnqx6p7T90hNEKR8wu9ptTSXD3Jw27xtMBr/B
         tSJgYPDuRrBVOcEQNbuyeIR5ZyEXmJNaBWHif37HS7uF1Xmu88Lq8epAsq+jAVM35sxs
         pdp4Bq9gPHwoffQA7J/wfybI8auYltLLLIYxAayA1I46XHOULtR7KrTYCskGIO4pCKmG
         T1Fw==
X-Gm-Message-State: ACrzQf3NxY5pLwK/hLeNbsuHGHcuSZbqmHAEm6MOokR5ndAmG5VdtQpM
	RpZzgOqs5BQym68he/zi7Aip5g==
X-Google-Smtp-Source: AMsMyM7wU01xLNnTTslW5qPcH9U0d3210mJJyOX0dSh6iYjiDoTkBczR8AGldIXcdzIutrYwjwxMXw==
X-Received: by 2002:a63:5c07:0:b0:43f:6af:7590 with SMTP id q7-20020a635c07000000b0043f06af7590mr7563656pgb.272.1664380451650;
        Wed, 28 Sep 2022 08:54:11 -0700 (PDT)
Received: from [10.2.223.68] ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id i28-20020a056a00005c00b0053e72ed5252sm4231499pfk.42.2022.09.28.08.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:54:11 -0700 (PDT)
Message-ID: <eade28ce-97eb-ff96-e8cb-7e1c2127f77b@bytedance.com>
Date: Wed, 28 Sep 2022 23:54:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [External] Re: [PATCH v3 0/9] PCI/AER: Fix and optimize usage of
 status clearing api
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>, bhelgaas@google.com,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
 <20220928110623.b3vocoubasrshyzk@mobilestation>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <20220928110623.b3vocoubasrshyzk@mobilestation>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/28/22 7:06 PM, Serge Semin wrote:
> On Wed, Sep 28, 2022 at 06:59:37PM +0800, Zhuo Chen wrote:
>> Hello.
>>
>> Here comes patch v3, which contains some fixes and optimizations of
>> aer api usage. The v1 and v2 can be found on the mailing list.
>>
>> v3:
>> - Modifications to comments proposed by Sathyanarayanan.
> 
>> Remove
>>    pci_aer_clear_nonfatal_status() call in NTB and improve commit log.
> 
> Failed to see who has requested that...
> 
> -Sergey
> 
Hi, Sergey

Currently other vendor drivers do not clear error status in their own 
init code, I don't exactly know what is special reason for clearing 
error status during init code in ntb driver.

An evidence is in pci_aer_init(), PCI core driver has do 
pci_aer_clear_status() and pci_enable_pcie_error_reporting() in common 
process. So vendor drivers don't need to do again.

But I don't know the reason why many vendor drivers reserve 
pci_enable_pcie_error_reporting() after commit f26e58bf6f54 ("PCI/AER: 
Enable error reporting when AER is native"). Do they need to be removed?
Could Bjorn and Sathyanarayanan help look into it, thanks a lot.

Thanks.
>>
>> v2:
>> - Modifications to comments proposed by Bjorn. Split patch into more
>>    obvious parts.
>>
>> Zhuo Chen (9):
>>    PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
>>    PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear
>>      uncorrectable error status
>>    NTB: Remove pci_aer_clear_nonfatal_status() call
>>    scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
>>    PCI/AER: Unexport pci_aer_clear_nonfatal_status()
>>    PCI/AER: Move check inside pcie_clear_device_status().
>>    PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
>>    PCI/ERR: Clear fatal error status when pci_channel_io_frozen
>>    PCI/AER: Refine status clearing process with api
>>
>>   drivers/ntb/hw/idt/ntb_hw_idt.c |  2 --
>>   drivers/pci/pci.c               |  7 +++--
>>   drivers/pci/pci.h               |  2 ++
>>   drivers/pci/pcie/aer.c          | 45 +++++++++++++++++++--------------
>>   drivers/pci/pcie/dpc.c          |  3 +--
>>   drivers/pci/pcie/err.c          | 15 ++++-------
>>   drivers/pci/pcie/portdrv_core.c |  3 +--
>>   drivers/scsi/lpfc/lpfc_attr.c   |  4 +--
>>   include/linux/aer.h             |  4 +--
>>   9 files changed, 44 insertions(+), 41 deletions(-)
>>
>> -- 
>> 2.30.1 (Apple Git-130)
>>

-- 
Zhuo Chen
