Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFDE5EDB2A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mctxk3nqNz3fYf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:07:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OZ0Q7JmM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OZ0Q7JmM;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MctwR281Kz3fSN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:06:30 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id a8so19786787lff.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ORb9sERSxMIv63iY+ckgWmXixVq6oKHLVhNgSaE2Ouo=;
        b=OZ0Q7JmMWDkTXmGsaWHP4llTAtzRToP5F5/dVmXLLkBcuJI63vOWSy90xyHt6Fq4ji
         VN7Hf8EHcqsj3ocRrDb9N3A6fkCcX/509Uo4VC/BqMDhY87kM+5DZXgwpRMu1EX90dLh
         0suF3LUJFha/80A1QHoMhdrkjLqCVo5fY/8ScHpEl4YZ57h8BogjDUDKYzcBqE5QJNdE
         xGyIkjD6MRkgmjRO/wLG5HN1FKBSNLVsZquXd2ffMqeTM6YhPEIfBhih9YFItk8IBCl6
         NaAfoIerSUV3Xr0kxYYCxnFWLorEETJmPhRQg5yMFWbLvsXBoeq8qvSgjPZ+2OlOpP+/
         MQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ORb9sERSxMIv63iY+ckgWmXixVq6oKHLVhNgSaE2Ouo=;
        b=cnFs2eeBZScJ81C4WgIApoqjWCxuNHsxgJy73mQh52saZOWfbIA5ppsu/W4qiV/23h
         Ela+j6/mA98TKhbBVTjm1N/k6AWN9rIAy/jtXUaZvN3bIyDqXhx8Rkp84hC0CciX6m/k
         tNfVlbENOCvbUC+DCNHSrXpeP8tQqMmkhiZd/g690+ImI20lcSrhcDcNpm9jLXnVzikD
         0IbuaXr8jPZlY5pOLPQOBQyRIeD3Yiib0MwEkaE/T9QldRhMSCCFEy8l2OKfdUW94J3o
         OS+r0BtbX9Ofm4CKrXoAegLPVcBKXfz3JwU0xVncyFJDaa51WGUdjVn/va6uday6FeJS
         FX/A==
X-Gm-Message-State: ACrzQf3IjB9p+LB8za7kNWBtZZ2fL/sm+b89vOkIiyobYAJRk+5Qpxma
	xhMAqCY1hrshEovy+MILTwY=
X-Google-Smtp-Source: AMsMyM4Dsy7g1ZA0z4B1Nrghs6PGyvITa8I/TiMTO6bSdlOIf8bjZ3vWDOaFkQ0AJceR/C7OBO/dHg==
X-Received: by 2002:a05:6512:3d87:b0:499:f2b6:7021 with SMTP id k7-20020a0565123d8700b00499f2b67021mr12387564lfv.103.1664363186093;
        Wed, 28 Sep 2022 04:06:26 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id m16-20020a056512115000b0048a9e18ae67sm446279lfg.84.2022.09.28.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 04:06:25 -0700 (PDT)
Date: Wed, 28 Sep 2022 14:06:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH v3 0/9] PCI/AER: Fix and optimize usage of status
 clearing api
Message-ID: <20220928110623.b3vocoubasrshyzk@mobilestation>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 28, 2022 at 06:59:37PM +0800, Zhuo Chen wrote:
> Hello.
> 
> Here comes patch v3, which contains some fixes and optimizations of
> aer api usage. The v1 and v2 can be found on the mailing list.
> 
> v3:
> - Modifications to comments proposed by Sathyanarayanan.

> Remove
>   pci_aer_clear_nonfatal_status() call in NTB and improve commit log. 

Failed to see who has requested that...

-Sergey

> 
> v2:
> - Modifications to comments proposed by Bjorn. Split patch into more
>   obvious parts.
> 
> Zhuo Chen (9):
>   PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
>   PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear
>     uncorrectable error status
>   NTB: Remove pci_aer_clear_nonfatal_status() call
>   scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
>   PCI/AER: Unexport pci_aer_clear_nonfatal_status()
>   PCI/AER: Move check inside pcie_clear_device_status().
>   PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
>   PCI/ERR: Clear fatal error status when pci_channel_io_frozen
>   PCI/AER: Refine status clearing process with api
> 
>  drivers/ntb/hw/idt/ntb_hw_idt.c |  2 --
>  drivers/pci/pci.c               |  7 +++--
>  drivers/pci/pci.h               |  2 ++
>  drivers/pci/pcie/aer.c          | 45 +++++++++++++++++++--------------
>  drivers/pci/pcie/dpc.c          |  3 +--
>  drivers/pci/pcie/err.c          | 15 ++++-------
>  drivers/pci/pcie/portdrv_core.c |  3 +--
>  drivers/scsi/lpfc/lpfc_attr.c   |  4 +--
>  include/linux/aer.h             |  4 +--
>  9 files changed, 44 insertions(+), 41 deletions(-)
> 
> -- 
> 2.30.1 (Apple Git-130)
> 
