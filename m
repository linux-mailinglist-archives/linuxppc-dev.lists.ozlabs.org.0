Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FA877F1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 12:35:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SicJji/I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtZTd2sK7z3dk2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:35:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SicJji/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtZSt6C9Bz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 22:35:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710156911; x=1741692911;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pYF/44sGUvtGohJefbieCblrNnn6V9de0G2M8//jghE=;
  b=SicJji/IWRqpWfKqO+7DvVw8ngH5cLg8/ZCzLseHQ2ju4EkuDBFGhjvy
   j/EnJ/TPUT0/otSoJ0bsgbrvtaE9WhcLmTIWmWImP5l2DC7Dlno2bLpGX
   ooWXaWFgJc+RXS8h6SYZi3ZVXLdCuhAl427t/FNHBpQx5urXHjvnqfO7+
   ZzBtejKA+FccsjuiPWTRuokBq9QMrbLoaSXJ4YY8J/wfkhXQKMbpfFN54
   SmuIGB3mlULgKRmz4Q74l7xw68p1OXG9Lp5Ap/e4FrLDxUeAWtFdVo0M7
   /rsjTFru06t7e3Lw64KsxHkoBUGcx0XaKdeX8KALlUtsyiXlevSIj4YCo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656311"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 04:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15784787"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.201])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 04:34:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 Mar 2024 13:34:54 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 0/4] PCI: Consolidate TLP Log reading and printing
In-Reply-To: <20240308213107.GA700934@bhelgaas>
Message-ID: <cc3f6a32-a00d-3c68-bc89-c042d238e7fe@linux.intel.com>
References: <20240308213107.GA700934@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-141571146-1710156894=:1142"
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linux-efi@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Paolo Abeni <pabeni@redhat.com>, linux-pci@vger.kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Netdev <netdev@vger.kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>, Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, intel-wired-lan@lists.osuosl.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-141571146-1710156894=:1142
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 8 Mar 2024, Bjorn Helgaas wrote:

> On Tue, Feb 06, 2024 at 03:57:13PM +0200, Ilpo J=C3=A4rvinen wrote:
> > This series consolidates AER & DPC TLP Log handling code. Helpers are
> > added for reading and printing the TLP Log and the format is made to
> > include E-E Prefixes in both cases (previously only one DPC RP PIO
> > displayed the E-E Prefixes).
> >=20
> > I'd appreciate if people familiar with ixgbe could check the error
> > handling conversion within the driver is correct.
> >=20
> > Ilpo J=C3=A4rvinen (4):
> >   PCI/AER: Cleanup register variable
> >   PCI: Generalize TLP Header Log reading
>=20
> I applied these first two to pci/aer for v6.9, thanks, these are all
> nice improvements!
>=20
> I postponed the ixgbe part for now because I think we should get an
> ack from those maintainers or just send it to them since it subtly
> changes the error and device removal checking there.

Okay, I'll make sure they're separated properly for the remaining patches=
=20
(I was already planning on doing that separation and posting v2 to avoid=20
their input blocking the changed but you beat me to it).

> >   PCI: Add TLP Prefix reading into pcie_read_tlp_log()
> >   PCI: Create helper to print TLP Header and Prefix Log
>=20
> I'll respond to these with some minor comments.

Did you forget to send those comments?


--=20
 i.

--8323328-141571146-1710156894=:1142--
