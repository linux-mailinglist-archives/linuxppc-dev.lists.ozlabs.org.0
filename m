Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDC542134
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 07:03:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHw9544bpz3bt0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 15:03:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cr5puc8g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cr5puc8g;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHw8J2fTGz3084
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 15:02:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654664560; x=1686200560;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=hOvb8EnSwhwz1MQxZk+3Gaho/Oq120JSHbvTq7OuOuA=;
  b=Cr5puc8g04AJRklsQtmxYE62Xbw/IUM5sWwidFtArY49vfl6O3F3lt1S
   EWrs8vkmb/ceJZSI/wqYJZ5t48jFM8ycffiqo2oO6DmKObNmjR+hMMk2Q
   Ukk8Wwp3EK5fqYreJxGiMBFi4zHGP+syVv92h5AtwYkAqqPYDcCnooadJ
   O/m8w0H4duToaMcmx+TIoF2LEgxwpFT6EbFe5ugVUIVQ04v83wNH/2lKk
   0mbRCIViwdZKs00y9I5lVnFzOCKsNKlgqRAuaJobOU/MAXTtIUCN6Gyd6
   +NQmqnxrh4wLl+fCUoVb1ntShp8pVmay2JKopzX6Wt9QC/5HQT6SqdIo0
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="257228701"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="257228701"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 22:02:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="759318766"
Received: from jmferrel-mobl1.amr.corp.intel.com (HELO [10.209.73.187]) ([10.209.73.187])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 22:02:33 -0700
Message-ID: <7830b6ca-a653-867f-813e-be980bad8141@linux.intel.com>
Date: Tue, 7 Jun 2022 22:02:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH] PCI/ERR: handle disconnected devices in
 report_error_detected
To: Christoph Hellwig <hch@lst.de>, ruscur@russell.cc, oohall@gmail.com,
 bhelgaas@google.com
References: <20220601074024.3481035-1-hch@lst.de>
Content-Language: en-US
In-Reply-To: <20220601074024.3481035-1-hch@lst.de>
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
Cc: kbusch@kernel.org, linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 6/1/22 12:40 AM, Christoph Hellwig wrote:
> When a device is already unplugged by pciehp by the time that the AER
> handler is invoked, the PCIe device will lready be in the

/s/lready/already

> pci_channel_io_perm_failure state.  In that case we should simply
> return PCI_ERS_RESULT_DISCONNECT instead of trying to do a state
> transition that will fail.
> 
> Also untangle the state transition failure from the lack of methods to
> improve the debugging output in case it will happen ever again.

Otherwise, it looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>


> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/pci/pcie/err.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 0c5a143025af4..59c90d04a609a 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -55,10 +55,14 @@ static int report_error_detected(struct pci_dev *dev,
>   
>   	device_lock(&dev->dev);
>   	pdrv = dev->driver;
> -	if (!pci_dev_set_io_state(dev, state) ||
> -		!pdrv ||
> -		!pdrv->err_handler ||
> -		!pdrv->err_handler->error_detected) {
> +	if (pci_dev_is_disconnected(dev)) {
> +		vote = PCI_ERS_RESULT_DISCONNECT;
> +	} else if (!pci_dev_set_io_state(dev, state)) {
> +		pci_info(dev, "can't recover (state transition %u -> %u invalid)\n",
> +			dev->error_state, state);
> +		vote = PCI_ERS_RESULT_NONE;
> +	} else if (!pdrv || !pdrv->err_handler ||
> +		   !pdrv->err_handler->error_detected) {
>   		/*
>   		 * If any device in the subtree does not have an error_detected
>   		 * callback, PCI_ERS_RESULT_NO_AER_DRIVER prevents subsequent

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
