Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09BD4DA0FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 18:15:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ0R02W8Pz30KZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 04:15:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google header.b=hQkHI/A3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=ebadger@purestorage.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=purestorage.com header.i=@purestorage.com
 header.a=rsa-sha256 header.s=google header.b=hQkHI/A3; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ0Q26K0bz30Fs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 04:14:32 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id q11so16744670pln.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xgus+7qmbSJ9nJIqIcIxl/J+AKyxRbFiTCWjU46hP/c=;
 b=hQkHI/A3LRXnPnAlt7EGrixwAoVxbfQnxHbS174svfz/cEFEWbHmIrVQ+n9av6Z9lF
 CxmZ6608U+o2fZKbzJ0PpnteN5mTfDaXyRii/kkF4qaoKtqPYuAs6wtQiDmOBt/2ZAM5
 WBJt87LUxcPe/6tI2cP92k7ist6mx/DTYf5Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xgus+7qmbSJ9nJIqIcIxl/J+AKyxRbFiTCWjU46hP/c=;
 b=DHmXuwBPye8Z6yck0ulGaF61yWb0SSswdinnNuhC/sv3775ubjvqPRpBcADWtuhDiy
 BWsE4NVuAdjFcklzMSz7N9GRA9ve+X+x58TJJbwviflv4ZpaLix5SB7VE0BwP2Bi8476
 MImJhO7QpsUsiwXgyka2sD/3zUGqBvMPEvq7vJ+vk2cOpNwNlEhbMnMabRVw2FgFRG4B
 awEdDD4UcdGWn46jFVAqxfsCWJbLQnJw3PPcCT9MXNz0f+FVPFoNyJtPoiNgCuGSj5lW
 NC/5srDNPHCb9DiXWudsfzC4JyShdTcfVL6dx/kXOKsNSVQbxT4BnIKunwiYcTlTUN6C
 MEjg==
X-Gm-Message-State: AOAM530frW48aD89qpajy1l4nSqyhQUihkkKSDLOvRjhvRn/mF5MbpRs
 T71P3YadBdws4KY1fT4lP2ibow==
X-Google-Smtp-Source: ABdhPJyLaWXVpyvW4Mh3z0KkiQQ80MjXoNmNJlknK49fD5o3TURQH1gKAkjamZe2Af4tq/7vXjdNFQ==
X-Received: by 2002:a17:902:cccf:b0:14e:eb44:40a1 with SMTP id
 z15-20020a170902cccf00b0014eeb4440a1mr29427014ple.111.1647364469225; 
 Tue, 15 Mar 2022 10:14:29 -0700 (PDT)
Received: from ebps (cpe-75-80-179-40.san.res.rr.com. [75.80.179.40])
 by smtp.gmail.com with ESMTPSA id
 mw7-20020a17090b4d0700b001b8baf6b6f5sm3909768pjb.50.2022.03.15.10.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 10:14:28 -0700 (PDT)
Date: Tue, 15 Mar 2022 10:14:25 -0700
From: Eric Badger <ebadger@purestorage.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2] PCI/AER: Handle Multi UnCorrectable/Correctable
 errors properly
Message-ID: <20220315171425.GA1521135@ebps>
References: <20220315050842.120063-1-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315050842.120063-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebadger@purestorage.com, Oliver OHalloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 15, 2022 at 05:08:42AM +0000, Kuppuswamy Sathyanarayanan wrote:
> This error can be reproduced by making following changes to the
> aer_irq() function and by executing the given test commands.
> 
>  static irqreturn_t aer_irq(int irq, void *context)
>          struct aer_err_source e_src = {};
> 
>          pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS,
> 				&e_src.status);
>  +       pci_dbg(pdev->port, "Root Error Status: %04x\n",
>  +		e_src.status);
>          if (!(e_src.status & AER_ERR_STATUS_MASK))
>                  return IRQ_NONE;
> 
>  +       mdelay(5000);
> 
>  # Prep injection data for a correctable error.
>  $ cd /sys/kernel/debug/apei/einj
>  $ echo 0x00000040 > error_type
>  $ echo 0x4 > flags
>  $ echo 0x891000 > param4
> 
>  # Root Error Status is initially clear
>  $ setpci -s <Dev ID> ECAP0001+0x30.w
>  0000
> 
>  # Inject one error
>  $ echo 1 > error_inject
> 
>  # Interrupt received
>  pcieport <Dev ID>: AER: Root Error Status 0001
> 
>  # Inject another error (within 5 seconds)
>  $ echo 1 > error_inject
> 
>  # No interrupt received, but "multiple ERR_COR" is now set
>  $ setpci -s <Dev ID> ECAP0001+0x30.w
>  0003
> 
>  # Wait for a while, then clear ERR_COR. A new interrupt immediately
>    fires.
>  $ setpci -s <Dev ID> ECAP0001+0x30.w=0x1
>  pcieport <Dev ID>: AER: Root Error Status 0002
> 
> Currently, the above issue has been only reproduced in the ICL server
> platform.
> 
> [Eric: proposed reproducing steps]

Hmm, this differs from the procedure I described on v1, and I don't
think will work as described here.

Eric
