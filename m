Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 185AC886E56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 15:17:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S34L26FY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1PYC6PrYz3vqy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 01:17:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S34L26FY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1PXQ6bXXz3vbv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 01:16:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711117015; x=1742653015;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2KeOzt6+e2pFDwhqfLnCeh7Ap5am70wfBW1us6UaZEk=;
  b=S34L26FYiS7RQVc4Nhddk8T6DFT7zTv1KJWPvOl3nePg9vfAsogdBA1N
   gVg5clvP8B7HjRl1wv/8TKjNxgBo3K0BYOLLLhslGjpOatM5aqOBoNgkq
   5yFaQsKHnzyNs7QsNKXGi/37TbtLTyW/OYlwQUNp8fj1bpGeMmZTUcak+
   0Qf5JZ3Sl5AZlr/Kr7imLDG81mQx/6BBrnRTWtzpok5SuRPla5v/EHG8g
   pBpJg1uwuOprX78gBiqbJ+kYUb2SvSZLylzfGD7LpZONw7rbJcTF0pWFS
   +izDNd9eapzVjuTwU5kVO55/2AMToS8lU8C3tDQkJ1aHp0REYjMwDlKmB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5994965"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="5994965"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 07:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="15352468"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.18])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 07:16:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 Mar 2024 16:16:37 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 0/4] PCI: Consolidate TLP Log reading and printing
In-Reply-To: <cc3f6a32-a00d-3c68-bc89-c042d238e7fe@linux.intel.com>
Message-ID: <771bb522-c4eb-b515-e315-6ad1c622cbd9@linux.intel.com>
References: <20240308213107.GA700934@bhelgaas> <cc3f6a32-a00d-3c68-bc89-c042d238e7fe@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-20305305-1711116997=:1115"
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linux-efi@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Tony Luck <tony.luck@intel.com>, Paolo Abeni <pabeni@redhat.com>, linux-pci@vger.kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Netdev <netdev@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Jakub Kicinski <kuba@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>, intel-wired-lan@lists.osuosl.org, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-20305305-1711116997=:1115
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 11 Mar 2024, Ilpo J=C3=A4rvinen wrote:

> On Fri, 8 Mar 2024, Bjorn Helgaas wrote:
>=20
> > On Tue, Feb 06, 2024 at 03:57:13PM +0200, Ilpo J=C3=A4rvinen wrote:
> > > This series consolidates AER & DPC TLP Log handling code. Helpers are
> > > added for reading and printing the TLP Log and the format is made to
> > > include E-E Prefixes in both cases (previously only one DPC RP PIO
> > > displayed the E-E Prefixes).
> > >=20
> > > I'd appreciate if people familiar with ixgbe could check the error
> > > handling conversion within the driver is correct.
> > >=20
> > > Ilpo J=C3=A4rvinen (4):
> > >   PCI/AER: Cleanup register variable
> > >   PCI: Generalize TLP Header Log reading
> >=20
> > I applied these first two to pci/aer for v6.9, thanks, these are all
> > nice improvements!
> >=20
> > I postponed the ixgbe part for now because I think we should get an
> > ack from those maintainers or just send it to them since it subtly
> > changes the error and device removal checking there.
>=20
> Okay, I'll make sure they're separated properly for the remaining patches=
=20
> (I was already planning on doing that separation and posting v2 to avoid=
=20
> their input blocking the changed but you beat me to it).
>=20
> > >   PCI: Add TLP Prefix reading into pcie_read_tlp_log()
> > >   PCI: Create helper to print TLP Header and Prefix Log
> >=20
> > I'll respond to these with some minor comments.
>=20
> Did you forget to send those comments?

Ping.

I still haven't received those comments for patches 3 & 4.

--=20
 i.

--8323328-20305305-1711116997=:1115--
