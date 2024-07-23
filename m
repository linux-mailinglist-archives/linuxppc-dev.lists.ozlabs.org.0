Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5E93A1E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 15:47:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e6crJgEc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSz456wzbz3dTN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 23:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e6crJgEc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=fabio.m.de.francesco@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 23 Jul 2024 23:47:11 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSz3M1gllz3cWW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 23:47:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721742431; x=1753278431;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GJawiRDWacobpNsLTELbipOx4l8u61/Poa79VGwoK4g=;
  b=e6crJgEc5XIT1DtDgAAlEK/JJYYVW9z1dC8d0JadIqmbuw9M4Hp/Xjrc
   n8TgT+IAe0+OIRcQB5cYasuKQ27cWBsNVt3rLWCKgur/K0iQF3abUaK6R
   25Q0eX4iXg08KU0OB8g7AAj7SGQtMoZ2F6lbNYZlJd2eq/y9josOd1/l8
   SSqk2KwX0UNI5LcHLVbvjlA2HraAk5hCQ0dvYnyEUJVdn0HENQXjGwE8R
   PwpZdGnyX0d9nvGti740QOKfVwtuaHioDY41lN4xftoi89t8+MGBwjE9s
   xvyHDfiBYhjKsstR5zaySst3lY0swkdGhpmhClbjICtZ6KdqHSLx4/aKT
   w==;
X-CSE-ConnectionGUID: +ZdcWewQTMKodxQHCnDcEA==
X-CSE-MsgGUID: T4Gu2AvnT+yrgyRP+kixUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="36810249"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="36810249"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 06:46:00 -0700
X-CSE-ConnectionGUID: YOBOcrmKRVaTsgZ21wdhpw==
X-CSE-MsgGUID: u8/jMZjETKGQ2/IzyrueZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="57083836"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fdefranc-mobl3.localnet) ([10.245.246.100])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 06:45:58 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 0/2] Make ELOG log and trace consistently with GHES
Date: Tue, 23 Jul 2024 15:43:45 +0200
Message-ID: <2737053.vuYhMxLoTh@fdefranc-mobl3>
In-Reply-To: <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
References: <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday, May 27, 2024 4:43:39=E2=80=AFPM GMT+2 Fabio M. De Francesco wrot=
e:
> When Firmware First is enabled, BIOS handles errors first and then it
> makes them available to the kernel via the Common Platform Error Record
> (CPER) sections (UEFI 2.10 Appendix N). Linux parses the CPER sections
> via one of two similar paths, either ELOG or GHES.
>=20
> Currently, ELOG and GHES show some inconsistencies in how they print to
> the kernel log as well as in how they report to userspace via trace
> events.
>=20
> Make the two mentioned paths act similarly for what relates to logging
> and tracing.

Gentle ping.
Thanks,

=46abio

> --- Changes for v1 ---
>=20
> 	- Drop the RFC prefix and restart from PATCH v1
> 	- Drop patch 3/3 because a discussion on it has not yet been
> 	  settled
> 	- Drop namespacing in export of pci_print_aer while() (Dan)
> 	- Don't use '#ifdef' in *.c files (Dan)
> 	- Drop a reference on pdev after operation is complete (Dan)
> 	- Don't log an error message if pdev is NULL (Dan)
>=20
> --- Changes for RFC v2 ---
> =09
> 	- 0/3: rework the subject line and the letter.
>         - 1/3: no changes.
>         - 2/3: trace CPER PCIe Section only if CONFIG_ACPI_APEI_PCIEAER
>           is defined; the kernel test robot reported the use of two
>           undefined symbols because the test for the config option was
>           missing; rewrite the subject line and part of commit message.
>         - 3/3: no changes.
>=20
> Fabio M. De Francesco (2):
>   ACPI: extlog: Trace CPER Non-standard Section Body
>   ACPI: extlog: Trace CPER PCI Express Error Section
>=20
>  drivers/acpi/acpi_extlog.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/pci/pcie/aer.c     |  2 +-
>  include/linux/aer.h        |  9 ++++++---
>  3 files changed, 42 insertions(+), 4 deletions(-)
>=20
>=20




