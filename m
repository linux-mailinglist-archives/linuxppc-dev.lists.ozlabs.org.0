Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE86619E60
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:21:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3nVV2gVxz3cQl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:21:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uAw80S9v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uAw80S9v;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nTW1NJHz3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:21:00 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso5089595pjc.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OczEUwDaDCJagzs0QtMr8aHYN/ko8ymZX7lVummJVOs=;
        b=uAw80S9vBEJp3aHojoMEpA/68sS1rwm2/DWeE+ULXnA6VihFLM1tIcWa71PfRN9kBY
         0Dv2ncNI3cIHP1goXyeXZom0/uBfoDaO30ASdZEL4aGfHRhvJUIMCG8nrQlvfooqmoJO
         hUAuGLtFkFgLnDesYbOIb/h2RG1W4Vfgffao9TGfEveZhdIZofkxgjiB9PJaysiRvxez
         qh27EMHRn8B9dhv5bFV0Gj3bOcrEvWTaLB9Ua8Lz3QnnrjBVMODvXVdUSprTVXviQ9hj
         D+qpWlXKArSY4d+JaCwNiIRypZgFLSZR3fDUcNuaeyz///hny0BZ0cHpkYlDAwWb4Z7k
         HJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OczEUwDaDCJagzs0QtMr8aHYN/ko8ymZX7lVummJVOs=;
        b=mQP7/9NMGPWhNSSML1FFN17uEDtU2r4VYinvavWvSBbpc7VkC3eUTy1hbpGHrpSW7p
         mevUX4iv79UBpEFgBHnfS1vpo6VXCov47HrRf0zkEde7AFDZAPDclYi/BiVcT6S2CA9e
         0IbN9BS22iWgh8oLgHDb9kPMTmQSAmfxeKte5f1N5uz0japVthlUCABNLeC6OdjBjR06
         3HevNjXuwIJDqsR/YCbubQ9NitOecUh8j6YGdNpOIwJCPny+H+2rAqr36wK0oFOaWOP2
         rs+A4l5n9482RfNsuuWjbM8cYYZ8oj5AqHVVCaQRJpyMulFH7UsLOZZW0aukH4T6ESEF
         6Reg==
X-Gm-Message-State: ACrzQf0y4vx5w6uPfvfz6p4ViuL8ZoI3238CqONvrrKKeYW8941ejG9l
	7a/VLsks5pQuSvOpUsqp44JxxQ==
X-Google-Smtp-Source: AMsMyM7qXmb1tKLbXoG2RN7MYH+OBDKZmahcKO3ZgUlIGFzbY77VBHGSlWccWa4sVOHz9dNTYKbNgg==
X-Received: by 2002:a17:90a:6045:b0:212:fe9a:5792 with SMTP id h5-20020a17090a604500b00212fe9a5792mr53370678pjm.178.1667582458816;
        Fri, 04 Nov 2022 10:20:58 -0700 (PDT)
Received: from [10.255.167.72] ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id x16-20020aa79a50000000b0056e0ff577edsm2990000pfj.43.2022.11.04.10.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 10:20:58 -0700 (PDT)
Message-ID: <17b88750-53c2-0653-045a-dde921e37e0c@bytedance.com>
Date: Sat, 5 Nov 2022 01:20:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 0/9] PCI/AER: Fix and optimize usage of status clearing
 api
To: Bjorn Helgaas <helgaas@kernel.org>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
Content-Language: en-US
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn, a gentle reminder.

Thanks and regards.

On 9/28/22 6:59 PM, Zhuo Chen wrote:
> Hello.
> 
> Here comes patch v3, which contains some fixes and optimizations of
> aer api usage. The v1 and v2 can be found on the mailing list.
> 
> v3:
> - Modifications to comments proposed by Sathyanarayanan. Remove
>    pci_aer_clear_nonfatal_status() call in NTB and improve commit log.
> 
> v2:
> - Modifications to comments proposed by Bjorn. Split patch into more
>    obvious parts.
> 
> Zhuo Chen (9):
>    PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
>    PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear
>      uncorrectable error status
>    NTB: Remove pci_aer_clear_nonfatal_status() call
>    scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
>    PCI/AER: Unexport pci_aer_clear_nonfatal_status()
>    PCI/AER: Move check inside pcie_clear_device_status().
>    PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
>    PCI/ERR: Clear fatal error status when pci_channel_io_frozen
>    PCI/AER: Refine status clearing process with api
> 
>   drivers/ntb/hw/idt/ntb_hw_idt.c |  2 --
>   drivers/pci/pci.c               |  7 +++--
>   drivers/pci/pci.h               |  2 ++
>   drivers/pci/pcie/aer.c          | 45 +++++++++++++++++++--------------
>   drivers/pci/pcie/dpc.c          |  3 +--
>   drivers/pci/pcie/err.c          | 15 ++++-------
>   drivers/pci/pcie/portdrv_core.c |  3 +--
>   drivers/scsi/lpfc/lpfc_attr.c   |  4 +--
>   include/linux/aer.h             |  4 +--
>   9 files changed, 44 insertions(+), 41 deletions(-)
> 

-- 
Zhuo Chen
