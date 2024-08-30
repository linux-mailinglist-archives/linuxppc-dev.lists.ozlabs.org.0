Return-Path: <linuxppc-dev+bounces-816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E9F9664B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 16:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwLp21vcxz306d;
	Sat, 31 Aug 2024 00:56:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725020623;
	cv=none; b=N3oz5a/YzhBnUk8JXCs7aNSUgMZzIbxrVQcXeEXIiT/vl+/CbZoXKCNUxwx1/De2q9AjLblOCUrIbvEVzFCKRFbGB3qceNJQ6GyzjXSH8eU/L/Rga9uDtnetzJ7LsFun+OOQNOkPGhCDsLKSKpXk38zOZXqCKQACY8/qFleZwLJyiMkKjNpm/rNjfrDsWJVibJ58qdONtlXCQ4qxioOe890tbpdM7XSJzCanc6MzUjH7kOTLOjPyp1sZAK3HsaW/OiSh/xkARQndof/era7LfuGi98luFEffDUlQ9SbHXt4XXUpwEucvYtlJ3+oYpAGSdK8YF9cjIz6eb8nRAMYhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725020623; c=relaxed/relaxed;
	bh=ayxgQlzkjC5lEZzk5yqJFecSk5flKGrYF+0TOF2Qz9o=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type; b=etENElGDN+JRh4+MMPJiVx5Avhjr/GNwUGhZj+6+MdB2zZlWe/QQWcewxBokkwwzk98go3EC621P+5r6Ee2j1Ztqboi8kRqE+EOOfbygq9ksK4lnDHQG6HoXQtU5NyHeds+tIYxq2ef8xc5x62/YQrEey+frDkRUqxZM4D2Jh+wKA4tigE5Imw1ANaYNQ7uh4QQJthh0lXhr48RJDnk3Ct9if4atRANCociWw2KMQFxs3LB19IkmeGPQhvs+UxlPPXpqYISGC1kWqN7splEZJ6FEs3FE3PlXw5k/PbnuXXJzKBvDFvob7FlU4umLTPt4/xoATone9kOFRvEaEqpHaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UTHv3pyD; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UTHv3pyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwHPT4JrXz2yvw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 22:23:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725020622; x=1756556622;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cxrQeFVCyW/V+8awK9/tTd4oB2KNPfWEV4kRyotwVsU=;
  b=UTHv3pyDCKdzmcHNou45L3XPQz32boQj++djfMl0YvuVGvJotz2xtp3Q
   Mw3CBYQrunGNO6MV0LRFiq025TzOTdYJmvjs90HBI/LytG+jwAn9x+3FI
   /34RzH3lG/Ld5EEx3b5ygUq7ja5C0oWwobegqCF+JbuCT0mDrnZK6RBP5
   w8hI1gF2eAcUm44zYBlV1jPVBGsgovagOA//OxTppHaisxNmyruK2uYTg
   z49lNAlnJ0N5fOb2tGer7f+ctgZJuACiof8WRgDBibg6E6fXj6Jml5U9n
   kNNfYPU54Plv5QB4Mzp8aG9dT5wLj2nOPDvD8CHGGB93hbHyr48hZhLYF
   g==;
X-CSE-ConnectionGUID: AKzUj+QyTimUKY8F3nfqdg==
X-CSE-MsgGUID: mV6srwrvR4e2033D2jXm/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27422920"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="27422920"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 05:23:36 -0700
X-CSE-ConnectionGUID: d/hHSfZ2SOKCjMdhZ5I6EQ==
X-CSE-MsgGUID: NGJStJN1Sn6X9IfbN8Sc8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68033775"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.174])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 05:23:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Aug 2024 15:23:28 +0300 (EEST)
To: Bjorn Helgaas <bhelgaas@google.com>
cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/7] PCI: Consolidate TLP Log reading and printing
In-Reply-To: <20240514113109.6690-1-ilpo.jarvinen@linux.intel.com>
Message-ID: <076a7814-1ab9-a6a1-6b08-3f414595c6ba@linux.intel.com>
References: <20240514113109.6690-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1575701497-1725020608=:1027"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1575701497-1725020608=:1027
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 14 May 2024, Ilpo J=C3=A4rvinen wrote:

> This series has the remaining patches of the AER & DPC TLP Log handling
> consolidation and now includes a few minor improvements to the earlier
> accepted TLP Logging code.
>=20
> v5:
> - Fix build with AER=3Dy and DPC=3Dn
> - Match kerneldoc and function parameter name

Hi Bjorn,

A gentle reminder, could you take a look at this series (and perhaps also=
=20
the one which introduces the Flit mode support on top of this series).

--=20
 i.

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
> Ilpo J=C3=A4rvinen (7):
>   PCI: Don't expose pcie_read_tlp_log() outside of PCI subsystem
>   PCI: Move TLP Log handling to own file
>   PCI: Make pcie_read_tlp_log() signature same
>   PCI: Use unsigned int i in pcie_read_tlp_log()
>   PCI: Store # of supported End-End TLP Prefixes
>   PCI: Add TLP Prefix reading into pcie_read_tlp_log()
>   PCI: Create helper to print TLP Header and Prefix Log
>=20
>  drivers/pci/ats.c             |   2 +-
>  drivers/pci/pci.c             |  28 ---------
>  drivers/pci/pci.h             |   9 +++
>  drivers/pci/pcie/Makefile     |   2 +-
>  drivers/pci/pcie/aer.c        |  14 ++---
>  drivers/pci/pcie/dpc.c        |  14 ++---
>  drivers/pci/pcie/tlp.c        | 109 ++++++++++++++++++++++++++++++++++
>  drivers/pci/probe.c           |  14 +++--
>  include/linux/aer.h           |   3 +-
>  include/linux/pci.h           |   2 +-
>  include/uapi/linux/pci_regs.h |   2 +
>  11 files changed, 143 insertions(+), 56 deletions(-)
>  create mode 100644 drivers/pci/pcie/tlp.c
>=20
>=20
--8323328-1575701497-1725020608=:1027--

