Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAB637831
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 12:56:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHxL408xXz3cRW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 22:56:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Szq1aC9W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Szq1aC9W;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHxK43NW9z3cGV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 22:55:50 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id k7so1283400pll.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tFoaZJ9Zngdk5YXFm9CRQu0l0Dt7f+Q0OVbqus0B9g=;
        b=Szq1aC9Wra2IsZFqObHsGmeRI22JZDC77KB/fn/y5FDl1j/mH9t1bt2oRO2s/VsJg7
         7++YyfrZAapEEDfLW0AwNAOxQj2JqhfS2eyYXsf83BRjBsaGqzALFQUn9U/JszeJRktf
         4HqbJk+4e6lzOTNxBu3E14KsUMxicRA6V93jEnLg9JNNLXUcDSEIbwXmlHdBRVR0b9IJ
         89QLi93nA9G6E7Cy9sfDxGpbYmsM/TtKM6qMLLLbwwcP7FdsCcg8PzWXqNKRVlzBaN7s
         zesRFiiIFCpF7es4an9DB8E4QRu/X6DYVBbH4mUAbiePl2Xh9xTnkMT+Js/iC/OTZk0z
         LILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tFoaZJ9Zngdk5YXFm9CRQu0l0Dt7f+Q0OVbqus0B9g=;
        b=HbKpHJT78PPkxc0cd3Nd1ngZzjL7/8NLRK/rHxwZHsW6nqyQUEjFQ82ssGBHEqsGw9
         GGiPagl//4V+e3cLKz/RU7XmCXh4JMVIQci/OtBQ5uYwSGuSFDA9NzWW1rohwNRrAm3Q
         a7jsDRaE9TZpNvlGV1oWWpaVNEfh7yynywTQyancANTrSNgEDvkyUlMInbRgUirOTesE
         eb3jOQCU5yl4+ksacGcoWiPDNKys+Jri/4jxMgXjyy5Qfts4OM94gGkPLhPVKxTaGg+4
         7BKW6k8GXVFMxd7UU4Jyq+Q8Cu3d2m1s4muE1yos35MKpUcUyHYYEMu2bWXichZqxVKE
         A4bA==
X-Gm-Message-State: ANoB5pnYFBZgp1rmoyqtNKv7/ywdvecrGbOyvtdBp2Xp+sBLBXzmPFdX
	6GDGfIGxt5mgC61ALgJiqfqG3w==
X-Google-Smtp-Source: AA0mqf5ErK/yTLbHh6wS925owcGQFojLs0Qt5kfkDM8yW/n5AlgaTkNUM7UboZPZKsKTOdXfrMbQOA==
X-Received: by 2002:a17:902:e294:b0:17c:620f:13ac with SMTP id o20-20020a170902e29400b0017c620f13acmr16312497plc.9.1669290948065;
        Thu, 24 Nov 2022 03:55:48 -0800 (PST)
Received: from [10.255.190.159] ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b0018685257c0dsm1139212plb.58.2022.11.24.03.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 03:55:47 -0800 (PST)
Message-ID: <af5c0fb7-0de7-7ca4-4dab-16f41e1d8ec6@bytedance.com>
Date: Thu, 24 Nov 2022 19:55:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 0/9] PCI/AER: Fix and optimize usage of status clearing
 api
Content-Language: en-US
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
 <17b88750-53c2-0653-045a-dde921e37e0c@bytedance.com>
In-Reply-To: <17b88750-53c2-0653-045a-dde921e37e0c@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Ping. Gentle reminder


On 11/5/22 1:20 AM, Zhuo Chen wrote:
> Hi Bjorn, a gentle reminder.
> 
> Thanks and regards.
> 
> On 9/28/22 6:59 PM, Zhuo Chen wrote:
>> Hello.
>>
>> Here comes patch v3, which contains some fixes and optimizations of
>> aer api usage. The v1 and v2 can be found on the mailing list.
>>
>> v3:
>> - Modifications to comments proposed by Sathyanarayanan. Remove
>>    pci_aer_clear_nonfatal_status() call in NTB and improve commit log.
>>
>> v2:
>> - Modifications to comments proposed by Bjorn. Split patch into more
>>    obvious parts.
>>
>> Zhuo Chen (9):
>>    PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
>>    PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear
>>      uncorrectable error status
>>    NTB: Remove pci_aer_clear_nonfatal_status() call
>>    scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
>>    PCI/AER: Unexport pci_aer_clear_nonfatal_status()
>>    PCI/AER: Move check inside pcie_clear_device_status().
>>    PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
>>    PCI/ERR: Clear fatal error status when pci_channel_io_frozen
>>    PCI/AER: Refine status clearing process with api
>>
>>   drivers/ntb/hw/idt/ntb_hw_idt.c |  2 --
>>   drivers/pci/pci.c               |  7 +++--
>>   drivers/pci/pci.h               |  2 ++
>>   drivers/pci/pcie/aer.c          | 45 +++++++++++++++++++--------------
>>   drivers/pci/pcie/dpc.c          |  3 +--
>>   drivers/pci/pcie/err.c          | 15 ++++-------
>>   drivers/pci/pcie/portdrv_core.c |  3 +--
>>   drivers/scsi/lpfc/lpfc_attr.c   |  4 +--
>>   include/linux/aer.h             |  4 +--
>>   9 files changed, 44 insertions(+), 41 deletions(-)
>>
> 

-- 
Zhuo Chen
