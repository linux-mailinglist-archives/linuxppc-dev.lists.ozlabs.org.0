Return-Path: <linuxppc-dev+bounces-8721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C9ABD39F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 11:40:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1qLK3Svqz2yqq;
	Tue, 20 May 2025 19:40:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747734057;
	cv=none; b=Jb4NNKMXsZPgY45JhOONl0qNNSC64TVTl/EmcKZsLjTsU8p9E8AdbFi4bwD/lAkN2VXFBFv9OY1G4q3KrvYwSNmgdEOyLIhIneRaheeMNauuRenX0WhyocBnGozk2xqTlAEXTJJ5sGx0aJ+oCzAz/N5nOusU0HhAuWl1wR9W8YSysumqYNgE9GA5lUXzDZLW0RPpmXuECPhN7MGVzB/t9XFQfLzdyTzBocWbYwQbeGk4oJPN0gUJ1fyo5f06I+P4vPLIVxasfoMqFl3dcN+5ZO3ZBNNd2hhBQ3rOcHmupO/f/ZYLFQr8uAYFfvhI73ixWiwlrRke7KJuf2TeO5Srww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747734057; c=relaxed/relaxed;
	bh=r3f/3Yibbqs2sfhxRxZCtehmBUIser3fFjj/XLAifA0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YgBNZFNmf0Mbv43Lm1fXJ96iLtl0wszv16eLjyDapbmlgTZ+0WPY/ZMyTZZ2WVDoO77qSXRL7E5Vwfqp+2wbZFgkVXN62epdUd1MRbjM6wrudTvkr/1hKMXwY+lV03USqFUfTbChdipE72/JcgqHJZyG9IB1PQ0h7nDAYr7BOFLoYAFmc44vUnmtJ7lWzVPUaL1vPMrOPQe/dffeWpiDlCivPWCKMV27k1yiHaZYqhrvWv3VXiSKQViMRNtgxzdPpm4aWCPqSzFC142DiW0lkqOb+b6Ew6illqA36tbCl7z7DBJZwppsO2VD2c52PLM1uLVGR4VZKauaazqC/EN6yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DKg6lmtT; dkim-atps=neutral; spf=none (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DKg6lmtT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 20 May 2025 19:40:54 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1qLG5glqz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 19:40:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747734056; x=1779270056;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=u/A3R66/AiZgaNe8EdDX++XVMrmF2Eqz2dGvezybjTw=;
  b=DKg6lmtThXNQxdu+BvJol0s4DvqLSy28XHO3s/L/Q5bBhfTtpnW7Jhs/
   VAGGv6SZnqqfpbxk5zE+HVged2dKtGk6XJGhirR23h8Ug1uTrysm6vHzV
   OlV79otRBfxvQJOKU2HxcmdS+WWuNTUmg2s0E4hMO4IsSkL+S32NBBp5f
   Z8YJRfZ0tjT9PgUuBZeOk/E73QgM5rJCiTsUFIctt3T5LyBRvuCoZHml0
   /nuMeuFUPRmzV8SzzXWD5C2vATGBkrMmEOOT9iHZoD0czpoTFA8FPUrUr
   Q2FIVL6mQQ+ve2vgBbF6WgXmkJOK3TCr9nMdmI7TTluDS6q3h4hMxdTbd
   w==;
X-CSE-ConnectionGUID: UegER5aBQjaZBOPbFqHBfA==
X-CSE-MsgGUID: DUEvcmNyRhaCZlz27Bl+Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="59888053"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="59888053"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:39:31 -0700
X-CSE-ConnectionGUID: JcBi3AQcSYOXwRfGd83kXA==
X-CSE-MsgGUID: xPtR0gzgQ7eMCAxgxUDKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139671159"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:39:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 12:39:18 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 01/16] PCI/DPC: Initialize aer_err_info before using
 it
In-Reply-To: <20250519213603.1257897-2-helgaas@kernel.org>
Message-ID: <218ec0eb-93a9-ba14-ea6b-742d0d274b84@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-2-helgaas@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Previously the struct aer_err_info "info" was allocated on the stack
> without being initialized, so it contained junk except for the fields we
> explicitly set later.
> 
> Initialize "info" at declaration so it starts as all zeroes.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/dpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index df42f15c9829..fe7719238456 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>  void dpc_process_error(struct pci_dev *pdev)
>  {
>  	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> -	struct aer_err_info info;
> +	struct aer_err_info info = { 0 };

= {}; is enough to initialize it, no need to add those zeros.

>  
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> 

-- 
 i.


