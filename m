Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 460706665C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 22:43:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsh4l18Rxz3chL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:43:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CqC6QzRe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CqC6QzRe;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsh3l65Wyz3bVr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 08:42:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673473348; x=1705009348;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bcAWwGCMXT32qahjM/225JG23YMKXua4UF2lHbC3gRc=;
  b=CqC6QzReFvXYsZqBJvtKIYURzrQdilIW/0t7iwhkMHGiMqjDHZzSdrrx
   81sm4vQpGoY2WzDTIxdTFBUuvYc11isBL78k/E0hBuKW/rGQR2UQbuSIX
   PQEFctg0usqMSFhjchqXBJ04RpyDrGuKSoNvmgMbNsN63B7dQaPKspMSB
   LXRN7dGjgt8KPfRZMgp/lYs4yUuWeEHJ4Px9WbsSI2WeYIK1HcFstoFvb
   3YO3VaHOUweazDZEjbWUZmVAHRZzZVhSaRBTO8EoQDr2NFRLDViZTeqA9
   hgwCpvIx/C5LqnWylWjgn5f1RwW9XoUdCXVxitDcZaajb7G1EM1oGnXlT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303238995"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="303238995"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 13:42:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="689903563"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="689903563"
Received: from jguerber-mobl1.amr.corp.intel.com (HELO [10.209.5.105]) ([10.209.5.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 13:42:21 -0800
Message-ID: <a9126d49-6e98-956c-f4a3-699cc86d8b11@linux.intel.com>
Date: Wed, 11 Jan 2023 13:42:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
Content-Language: en-US
To: Vidya Sagar <vidyas@nvidia.com>, bhelgaas@google.com, ruscur@russell.cc,
 oohall@gmail.com, treding@nvidia.com, jonathanh@nvidia.com
References: <20230111203116.4896-1-vidyas@nvidia.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230111203116.4896-1-vidyas@nvidia.com>
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
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, vsethi@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/11/23 12:31 PM, Vidya Sagar wrote:
> As the ECRC configuration bits are part of AER registers, configure
> ECRC only if AER is natively owned by the kernel.

ecrc command line option takes "bios/on/off" as possible options. It
does not clarify whether "on/off" choices can only be used if AER is
owned by OS or it can override the ownership of ECRC configuration 
similar to pcie_ports=native option. Maybe that needs to be clarified.

> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/pci/pcie/aer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e2d8a74f83c3..730b47bdcdef 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -184,6 +184,9 @@ static int disable_ecrc_checking(struct pci_dev *dev)
>   */
>  void pcie_set_ecrc_checking(struct pci_dev *dev)
>  {
> +	if (!pcie_aer_is_native(dev))
> +		return;
> +
>  	switch (ecrc_policy) {
>  	case ECRC_POLICY_DEFAULT:
>  		return;

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
