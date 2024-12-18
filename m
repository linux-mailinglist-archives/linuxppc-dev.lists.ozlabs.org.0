Return-Path: <linuxppc-dev+bounces-4320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB59F6818
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:19:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCwmP6CYrz2yVv;
	Thu, 19 Dec 2024 01:19:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734531573;
	cv=none; b=UcmG5RrGpWo+dsizMPrb3jXXDe8yRK/62ft4Eo0Zd60qA98ru7mxsIIdhRvR0/Sdc/lkdoHYTAQMzE+JiS4qSsdqzf0OGiQdMzI7rm+ePqbLQCYGXPFhMW/jUY8xbsHDvsqsU26BJfcvMmng2wh1zXJ98bhwMqSpwxkpzUToqwu9M9Wkf2t3i+wi2vKOtu47n8ChS1EYhQOMWOmDb/8vOcVKro/LiFqbRAxkr1EFtkdx3MkDFJCPy1FFyFMUSgeJuICzvDX4y2JSBpVrRdtzDBS71rAoDkWqhbNiQHyf+Yb53Ux3IZorR1Lb1tVAe7wr9rmBcZahyFNrize4ZBYcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734531573; c=relaxed/relaxed;
	bh=8zHQ1Dg4//9k+XLSqR6DSqLOGXztsvzlabf52WkHF2c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=A7wUb/YfRw6f/AsW2NDHmWJ4izcKUXaYqwQlzQ0fpGL9gHlUGHGX8VpcKPIWT7wHLfPDAYtLys75bzsZzPaXVlFGa3p1PVdwz0hfS9wwVurxbImpkmoAFSpxeHpHqFcSfhJUz0RRwtU/gapn/q/JSnqfAWBP7DTvKDYrHAT4dX7t3YhzXVoh32h5W7Te04mbdI8tthekF4wD8GH2bhakkrAyx5ieCgAo+4TVgjz6VBl8wSi0ONOeoWAtRBFXYgPcCgIne/DDAXobIt2n9VLR0ZS/BdsR0CeREqqT5aehUtr0mMf7stqxMi7nvvP5THQbTmIUgdwfuU9PQxR2HVH2/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbsSAWgA; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbsSAWgA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCwmL16qCz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:19:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734531570; x=1766067570;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Z5WBtuq8IpWY2gvtk2eWY2Gj8JVQZP6Grrn0KdAbvyQ=;
  b=TbsSAWgAs0h98TFLAqtNcehxn5etDuX7ipWWnm/rrExLgPpLnjb0j2Vr
   mqXm+vDavx3xTfDf4jI0pGUTFMiF7bWgjlxT3LbKTRWk3CIU99aYcbkI+
   DbTsIS8Bl+V3xgVuSdj3kdIm5JHzviGTL40xMtNj3sfItySoB98daSPMq
   wGbEYdC/ibXAZw0sidIaZL553e+0DdbEGvaTscPVRhV4LMAB9PWpiVlX7
   eX4nxE2Rpcpzsq6lPs4Z7ekInwDjz5NXR5mqC6fY3PEbGC0GnzKHs4YIi
   HR1HazwSsuEKRb3eAlYRCOjwnqnybUG4fGspBtDcQu707ZTEpSr+s6xpu
   g==;
X-CSE-ConnectionGUID: tSKO2UFDQT2XSBfRE6NQnA==
X-CSE-MsgGUID: W8rEZ1+uSe650GmejY41DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35160430"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35160430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:15:41 -0800
X-CSE-ConnectionGUID: sS4IyDwZRY+BvFIZsokNBQ==
X-CSE-MsgGUID: ClKekbI7Q4eNVN9F77pgtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="98444925"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:15:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Dec 2024 16:15:34 +0200 (EET)
To: Yazen Ghannam <yazen.ghannam@amd.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 8/8] PCI/AER: Add prefixes to printouts
In-Reply-To: <20241217215545.GB1121691@yaz-khff2.amd.com>
Message-ID: <4f5e8d07-d459-7a8e-844e-6f1b432763fe@linux.intel.com>
References: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com> <20241217135358.9345-9-ilpo.jarvinen@linux.intel.com> <20241217215545.GB1121691@yaz-khff2.amd.com>
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-497339427-1734531334=:939"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-497339427-1734531334=:939
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 17 Dec 2024, Yazen Ghannam wrote:

> On Tue, Dec 17, 2024 at 03:53:58PM +0200, Ilpo J=E4rvinen wrote:
> > Only part of the AER diagnostic printouts use "AER:" prefix because
> > they use low-level pci_printk() directly to allow selecting level.
> >=20
> > Add "AER:" prefix to lines that are printed with pci_printk().
>=20
> Can we please include the "HW_ERR" prefix also? IMO, it would make the
> kernel messages more consistent if all hardware error info had it.

While I'm not against your suggestion, it doesn't belong into this patch=20
as there are other lines beyond those touched in this patch that would=20
need to have HW_ERR as well.

I think I'll just drop this patch from this series and move it into the=20
pci_printk() series to avoid the inter-series conflict. Adding the HW_ERR=
=20
change would conflict badly with Karolina Stolarek's series so I'm not=20
sure if I want to pursue that change at this point (it's only my todo=20
list so it won't get forgotten).

--=20
 i.

--8323328-497339427-1734531334=:939--

