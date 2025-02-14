Return-Path: <linuxppc-dev+bounces-6186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC22A35D2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 12:58:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvVtN1hKYz30WY;
	Fri, 14 Feb 2025 22:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739534284;
	cv=none; b=fA0ToDEQggqBgRkxlBWgQLhxrt2QjNCJmM4srj+mFVTrm9UG3HSnX+OxYeRAAWw0UDQJ4qrTeCytZYu4103DbaSdw/wM86RHcoyBvahnbi/Tz4zdL9fg94aRz4+CKGcTW2w232wAUm7VjtxZKaPVpqN2E1YcvtnfeG2Y6QmlOurqBws3Bz1ZjxfLwNtPSIXiZ4+fgAH0pZiPEBK50Hi+7CeOll+DOFmKi1jGVku8nqctaQMWvU25KAMx5fzhGZ7HP11rRKV4i0EtME/HrwfUereo5ato3sk+XLXwhFlDjSIT0urhNxysJY2LFFWdAOQ6H6oGmKKBk3k3XIZ5ltBm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739534284; c=relaxed/relaxed;
	bh=wv6+odLhVrtodSfvWe9wdOfV0W/8+9miqmMc2nsh/LQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h7ISD4qgLonH3EHfTdOzNeI8HqhDbcI4yxXrNB2CY+o7Oj3LLcPvaKVfvd5u2ttYTbOscq9rAMZYGmVojG1D00DfBq7KWrXSVGKm7XhQepDe+CBmE4jUhHDCCfXu8aD7kNCQzJ3q+qCwADdGwSQnt9BTCvxiRxKSLtRzQoD4GC3X9G89sOsPU9GNPe+7oa8y8v4jS7cWGzGLwvmO0PGLMzQc7SEd4IIJl5i91zB8aqlSmNjbk/gOxZjg5lwch6U4ZyEBa9Xjfu7XDN1KOM+QH/UEzxwAO6Tb1PuajQG5kpbtaeQq1MAPrJy1rP3sF4hBeKKQQ78CouB7WQ9/p+CrGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TaBMJNqI; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TaBMJNqI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 14 Feb 2025 22:58:01 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvVtK5GG7z30VY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 22:58:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739534282; x=1771070282;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=FC6cHtpFmo9WG6l7crjEmz9kgRp7okbpmsc+ca1qwDk=;
  b=TaBMJNqIVdhor4VSKnaAbKD+pMdrT9lvB+OakIQ2G1AZgdWgoMCS4z4x
   Efi0quwyG1KZOsh0vO82JIGjachE2hjBqdY93+Vm7FT6iv7gmBuAR+THN
   /UCmvnjsH2/hY2FXfJZR2O7PkzC4fgax+9goIrA024VMi2jlRcvwR07Xu
   rGFLF3mQYsa2Zf7+4PfPdFZs3GHGDVKUvt+pqFe4hd6N+NvJnXNYdzIPx
   odBTX2s6AXQuLlOQYt884OyVKVs+Si9W2SyaW4+xxrloeIUaUO9Qnd8WT
   v8J4d27UM3AMlUsmfhZGb25YxmOJk3ltpiYTddBXNSHUAgmreTltHaGMu
   g==;
X-CSE-ConnectionGUID: +q0759ZnRtGqYmghZeUwzQ==
X-CSE-MsgGUID: U/f+bDlAR522x5RG1xLRnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62744503"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="62744503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:56:54 -0800
X-CSE-ConnectionGUID: Xqp4iC4HQ2KoSQIoW7voTA==
X-CSE-MsgGUID: XvTbuJ/HQlaTsnjUCVRnbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150615629"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:56:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 14 Feb 2025 13:56:47 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] PCI: Descope pci_printk() to aer_printk()
In-Reply-To: <20250213221043.GA136196@bhelgaas>
Message-ID: <91014487-c584-af8c-9810-48291a16b643@linux.intel.com>
References: <20250213221043.GA136196@bhelgaas>
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
Content-Type: multipart/mixed; BOUNDARY="8323328-1614684521-1739533222=:944"
Content-ID: <2580e7ea-ab5e-88a3-f089-e7774e6b27da@linux.intel.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1614684521-1739533222=:944
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0337222c-5138-e394-0891-fe22bb2b35e1@linux.intel.com>

On Thu, 13 Feb 2025, Bjorn Helgaas wrote:

> On Mon, Dec 16, 2024 at 06:10:12PM +0200, Ilpo J=E4rvinen wrote:
> > include/linux/pci.h provides low-level pci_printk() interface that is
> > only used by AER because it needs to print the same message with
> > different levels depending on the error severity. No other PCI code
> > uses that functionality and calls pci_<level>() logging functions
> > directly with the appropriate level.
> >=20
> > Descope pci_printk() into AER as aer_printk().
> >=20
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> I applied this patch by itself on pci/aer for v6.15.
>=20
> We also have some work-in-progress on rate limiting errors, which
> might conflict, but this is simple and shouldn't be hard to reconcile.
>=20
> > ---
> >  drivers/pci/pcie/aer.c | 10 +++++++---
> >  include/linux/pci.h    |  3 ---
> >  2 files changed, 7 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 80c5ba8d8296..bfc6b94dad4d 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -17,6 +17,7 @@
> > =20
> >  #include <linux/bitops.h>
> >  #include <linux/cper.h>
> > +#include <linux/dev_printk.h>
> >  #include <linux/pci.h>
> >  #include <linux/pci-acpi.h>
> >  #include <linux/sched.h>
> > @@ -35,6 +36,9 @@
> >  #include "../pci.h"
> >  #include "portdrv.h"
> > =20
> > +#define aer_printk(level, pdev, fmt, arg...) \
> > +=09dev_printk(level, &(pdev)->dev, fmt, ##arg)
> > +
> >  #define AER_ERROR_SOURCES_MAX=09=09128
> > =20
> >  #define AER_MAX_TYPEOF_COR_ERRS=09=0916=09/* as per PCI_ERR_COR_STATUS=
 */
> > @@ -692,7 +696,7 @@ static void __aer_print_error(struct pci_dev *dev,
> >  =09=09if (!errmsg)
> >  =09=09=09errmsg =3D "Unknown Error Bit";
> > =20
> > -=09=09pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
> > +=09=09aer_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
> >  =09=09=09=09info->first_error =3D=3D i ? " (First)" : "");
> >  =09}
> >  =09pci_dev_aer_stats_incr(dev, info);
> > @@ -715,11 +719,11 @@ void aer_print_error(struct pci_dev *dev, struct =
aer_err_info *info)
> > =20
> >  =09level =3D (info->severity =3D=3D AER_CORRECTABLE) ? KERN_WARNING : =
KERN_ERR;
> > =20
> > -=09pci_printk(level, dev, "PCIe Bus Error: severity=3D%s, type=3D%s, (=
%s)\n",
> > +=09aer_printk(level, dev, "PCIe Bus Error: severity=3D%s, type=3D%s, (=
%s)\n",
> >  =09=09   aer_error_severity_string[info->severity],
> >  =09=09   aer_error_layer[layer], aer_agent_string[agent]);
> > =20
> > -=09pci_printk(level, dev, "  device [%04x:%04x] error status/mask=3D%0=
8x/%08x\n",
> > +=09aer_printk(level, dev, "  device [%04x:%04x] error status/mask=3D%0=
8x/%08x\n",
> >  =09=09   dev->vendor, dev->device, info->status, info->mask);
> > =20
> >  =09__aer_print_error(dev, info);
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index db9b47ce3eef..02d23e795915 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -2685,9 +2685,6 @@ void pci_uevent_ers(struct pci_dev *pdev, enum  p=
ci_ers_result err_type);
> > =20
> >  #include <linux/dma-mapping.h>
> > =20
> > -#define pci_printk(level, pdev, fmt, arg...) \
> > -=09dev_printk(level, &(pdev)->dev, fmt, ##arg)

Both shpchp and aer do use pci_printk() before this series (it seems LKP=20
has also catched it already).

If you split this series into different branches, this removal of=20
pci_printk() has to be postponed until the next kernel release (fine for=20
me if that's what you want to do, just remove this part from this patch=20
and perhaps adjust the commit message to say it's to prepare for removal=20
of the pci_printk()).

> >  #define pci_emerg(pdev, fmt, arg...)=09dev_emerg(&(pdev)->dev, fmt, ##=
arg)
> >  #define pci_alert(pdev, fmt, arg...)=09dev_alert(&(pdev)->dev, fmt, ##=
arg)
> >  #define pci_crit(pdev, fmt, arg...)=09dev_crit(&(pdev)->dev, fmt, ##ar=
g)

--=20
 i.
--8323328-1614684521-1739533222=:944--

