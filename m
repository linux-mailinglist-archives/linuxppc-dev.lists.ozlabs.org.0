Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EA74E365
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:20:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Idsyt7x2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0NNQ2PZwz3c27
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Idsyt7x2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 11 Jul 2023 11:19:52 AEST
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0NMX15Q1z2xq7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 11:19:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689038392; x=1720574392;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5Jk3aIBS+9PB9JIDXm4r6oO/JZ67Qw3aGXU4GHLUXdk=;
  b=Idsyt7x2A/K11c5i/ipe0vgai4XSg95AMiPJSDTnP+3YXkw1IOFGkrxA
   Q2TvW3biUqsvbXpr+U6YMCLK2iytwYFKftsOby8KEB2T6xSViWciW/Emm
   WjAlRRqV0dwmd2sdh54+VzDl1H0rjeoWp2yT2CwT4WcU/EWk7kwsByXJ3
   Hz+eTQX26QyT0Lq/EqBuz6avkQJhnraWASLOqz+XvRQL5rronmP4Iq4JH
   Glb79C1hVf22+KXjDlLwdCbjtgI9OoviYi+8dj7NYyh5GjIALbnoxX478
   7X7LIBYzyVbb20dZ2mMF/OKlL2ZcADGHqc7mY9GryiX88NK2E5I7P+TNP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="364536238"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364536238"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 18:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="714997660"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="714997660"
Received: from csalvo-mobl1.amr.corp.intel.com (HELO [10.209.61.210]) ([10.209.61.210])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 18:18:25 -0700
Message-ID: <6bf0dfc7-b865-343b-4f2a-7624f3178541@linux.intel.com>
Date: Mon, 10 Jul 2023 18:18:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] PCI/AER: Remove/unexport error reporting
 enable/disable
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20230710232136.233034-1-helgaas@kernel.org>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230710232136.233034-1-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/10/23 4:21 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> pci_disable_pcie_error_reporting() is unused; remove it.
> pci_enable_pcie_error_reporting() is used only inside aer.c; make it
> static.

Looks fine to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

> 
> Bjorn Helgaas (2):
>   PCI/AER: Drop unused pci_disable_pcie_error_reporting()
>   PCI/AER: Unexport pci_enable_pcie_error_reporting()
> 
>  drivers/pci/pcie/aer.c | 15 +--------------
>  include/linux/aer.h    | 11 -----------
>  2 files changed, 1 insertion(+), 25 deletions(-)
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
