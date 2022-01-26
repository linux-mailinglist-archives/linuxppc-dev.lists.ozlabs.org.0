Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D3849C85C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 12:11:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkLdd06Lgz30NC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 22:11:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e6nLFKE/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e6nLFKE/; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkLcz4Jr1z2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 22:11:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643195475; x=1674731475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AZ52GxZm2Eq1pzG9AHFhzbjqb/WlLIS9HlqJiBwFpBE=;
 b=e6nLFKE/ULgvPsj6r3QCIUawmh2l8qGgL+IrnlLjhPwnOTG+gdP0QHfU
 4G9rO7xcopN7Q8Ofmu3ixHlPeS7wu8VAH4RDHi/A9VWh43vavYMbdpQRQ
 IgW7evwIPlJPWQ4jy1vyfeawDOFin4Yhhzpdl/F6BOQAixURasoyt89s7
 Dyb3isD39Bpd/DW4IzwEM8MgdY1Fcwy3TEY0Ah3kUh2UGWHvg59qe+Vac
 3W6U/ZWBXhIgi4yAXdZKqCqNIxzuxIXSHdqGwBQAQdh35cCE8r9zDl2YN
 8r5QIVTjq1xhpaKKquwy7wbpOx2NCvndnN+TEyApvenGGi4rdIkKj6tAB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246473441"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="246473441"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 03:10:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="624802639"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 03:10:06 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 26 Jan 2022 13:10:03 +0200
Date: Wed, 26 Jan 2022 13:10:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 2/2] PCI/DPC: Disable DPC when link is in L2/L3 ready, L2
 and L3 state
Message-ID: <YfEsC94BvFwd5MLy@lahna>
References: <20220126071853.1940111-1-kai.heng.feng@canonical.com>
 <20220126071853.1940111-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126071853.1940111-2-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jan 26, 2022 at 03:18:52PM +0800, Kai-Heng Feng wrote:
> Since TLP and DLLP transmission is disabled for a Link in L2/L3 Ready,
> L2 and L3, and DPC depends on AER, so also disable DPC here.

Here too I think it is good to mention that the DPC "service" never
implemented the PM hooks in the first place

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

One minor comment below, but other than that looks good,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> ---
>  drivers/pci/pcie/dpc.c | 61 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 3e9afee02e8d1..9585c10b7c577 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -343,13 +343,34 @@ void pci_dpc_init(struct pci_dev *pdev)
>  	}
>  }
>  
> +static void dpc_enable(struct pcie_device *dev)
> +{
> +	struct pci_dev *pdev = dev->port;
> +	u16 ctl;
> +
> +	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> +

Drop the empty line here.

> +	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
> +	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +}
> +
> +static void dpc_disable(struct pcie_device *dev)
> +{
> +	struct pci_dev *pdev = dev->port;
> +	u16 ctl;
> +
> +	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> +	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> +	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +}
