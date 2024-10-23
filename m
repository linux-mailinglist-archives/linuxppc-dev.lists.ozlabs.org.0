Return-Path: <linuxppc-dev+bounces-2500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9B9AC196
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 10:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYMdK6Fnnz2xg3;
	Wed, 23 Oct 2024 19:28:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729672117;
	cv=none; b=g6fhVw25VNn02InkCDVEHMXfFoYlcqUWNU4L50nqvMYOteyfC1zuYNm93/Xe+3ai5k0HHSpt9D7ior64YQN+AnPtgkx7S5cYLm5Jj9t3icIUFJ9JabNO72yXLmmlxxclEI1g72U78rQhsHVGmW0Q99ql9Irq9G7gb9n0Pf2OgwhM3J4mWL1kDYCLowjNz6XwT0VcZjQPzsz2QFMGn7Xg0vU8r8hFcjOITlwEJqruk3vxS+ncAlEZYJCO7wQzkajCJwuAlAzK2gC5QI1jOeY7ZMhuz0Fw2/pqn2PSqGzpnkoBQI1OutEb72vTZBguIlvKu2ftJeMcu6LvQ75OBF0t4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729672117; c=relaxed/relaxed;
	bh=VWMTShO24cZ3fXTWK03+rhwy2wvDGwoqW/kXeVV0Um0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=atqPjweGkMZON7Bkj3FkSMKQ5wZsOSV9XiVdzF3sS7yWIbRNQJKQ/Z2bv0pf4+nwdn7OeHo8Izp4RujKxe1lzUm/6WwxOgg6Dil1TE9Rxs0ujOX/zT3qE78tLYBtShcsvWnD/ivOOSOkGpORFk54IwDI0ZNrR6PJ/+8wpRNIpjaBkZoddzN+lwtSSnUA1r5OquGiamA51YTN23X8AJqXuU5foImqtiuOHzfTbEbYar4vmkGBWEPyR9Yx5ZzoTM4gt/cBp7CiwYIRJfIvIws0KhVaaYqkZ8mv16HwiHN+hiJNqp7IJf7dVg1ogw/ZtNnoXj0EA5hBIrPWqX2NIoCMcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nd1WRl1I; dkim-atps=neutral; spf=none (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nd1WRl1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 23 Oct 2024 19:28:34 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYMdG08k8z2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 19:28:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729672114; x=1761208114;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Efmdsy7784WWboxNzcyHMI/+dAUXMhQMYCQtnPAq+7s=;
  b=nd1WRl1ILf4pRqfOgsA4JhNX1o9GwG3I2rv5LARcYaUKKIbtwL5NHFjf
   q2AO8rd7QyrwolXRpUyaUQoe7kcDPmmA0RBtfWkAWk3MwiKDpcfJWm6Q+
   +To03LR6elfrmigLFesNvGZeTw12bk1pz1ewvh8TMbbfUP3hkFWGEXxuo
   ZQYiJz6oM+++UJv0U4bCWYQ2Qr7pcR9qJTGo/6kGA6ltyWIiUQt2nBWj5
   gGP9VW2JHUfnd5wY/mSFT+oqXyHg4gNi58594K2jsn4HAS/TGgIiivLYf
   4aUVXISMS1qxjLcPR00f6sZ/iKbO02UNH4otB7euT8mKcQ2d8YICiBm/d
   A==;
X-CSE-ConnectionGUID: l2fXE9O/Rma1XBNhEdXpTA==
X-CSE-MsgGUID: m6oMJLXbQgG6DhD0uauxsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33168554"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="33168554"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 01:27:22 -0700
X-CSE-ConnectionGUID: IvumlnRqTX60gu5OpdbeWg==
X-CSE-MsgGUID: hseAE24qSLqbyZF66jw03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84939400"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 01:27:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Oct 2024 11:27:15 +0300 (EEST)
To: Bjorn Helgaas <bhelgaas@google.com>
cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 0/8] PCI: Consolidate TLP Log reading and printing
In-Reply-To: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
Message-ID: <cb44bafe-a7ec-889b-5c1c-ee8ca6c540a0@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1808313237-1729671934=:1168"
Content-ID: <cc279ec2-2c48-0171-1345-2b12ec189a87@linux.intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1808313237-1729671934=:1168
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <74b67500-5d3a-40fd-f220-927c23ad6df0@linux.intel.com>

On Fri, 13 Sep 2024, Ilpo J=E4rvinen wrote:

> This series has the remaining patches of the AER & DPC TLP Log handling
> consolidation and now includes a few minor improvements to the earlier
> accepted TLP Logging code.
>=20
> v6:
> - Preserve "AER:"/"DPC:" prefix on the printed TLP line
> - New patch to add "AER:" also  on other lines of the AER error dump

Hi Bjorn,

A small reminder this series exists.

--=20
 i.

> v5:
> - Fix build with AER=3Dy and DPC=3Dn
> - Match kerneldoc and function parameter name
>=20
> v4:
> - Added patches:
> =09- Remove EXPORT of pcie_read_tlp_log()
> =09- Moved code to pcie/tlp.c and build only with AER enabled
> =09- Match variables in prototype and function
> =09- int -> unsigned int conversion
> =09- eetlp_prefix_max into own patch
> - struct pcie_tlp_log param consistently called "log" within tlp.c
> - Moved function prototypes into drivers/pci/pci.h
> - Describe AER/DPC differences more clearly in one commit message
>=20
> v3:
> - Small rewording in a commit message
>=20
> v2:
> - Don't add EXPORT()s
> - Don't include igxbe changes
> - Don't use pr_cont() as it's incompatible with pci_err() and according
>   to Andy Shevchenko should not be used in the first place
>=20
> Ilpo J=E4rvinen (8):
>   PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
>   PCI: Move TLP Log handling to own file
>   PCI: Make pcie_read_tlp_log() signature same
>   PCI: Use unsigned int i in pcie_read_tlp_log()
>   PCI: Store # of supported End-End TLP Prefixes
>   PCI: Add TLP Prefix reading into pcie_read_tlp_log()
>   PCI: Create helper to print TLP Header and Prefix Log
>   PCI/AER: Add prefixes to printouts
>=20
>  drivers/pci/ats.c             |   2 +-
>  drivers/pci/pci.c             |  28 ---------
>  drivers/pci/pci.h             |   9 +++
>  drivers/pci/pcie/Makefile     |   2 +-
>  drivers/pci/pcie/aer.c        |  26 ++++----
>  drivers/pci/pcie/dpc.c        |  14 ++---
>  drivers/pci/pcie/tlp.c        | 109 ++++++++++++++++++++++++++++++++++
>  drivers/pci/probe.c           |  14 +++--
>  include/linux/aer.h           |   3 +-
>  include/linux/pci.h           |   2 +-
>  include/uapi/linux/pci_regs.h |   2 +
>  11 files changed, 149 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/pci/pcie/tlp.c
>=20
>=20
--8323328-1808313237-1729671934=:1168--

