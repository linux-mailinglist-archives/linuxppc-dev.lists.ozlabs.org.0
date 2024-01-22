Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B4836303
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 13:21:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iA1Tz6Ti;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJTps3lkRz3c5Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 23:21:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iA1Tz6Ti;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJTnz2xRxz3bbt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 23:20:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705926039; x=1737462039;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Fst93YHEkoTT1MXwK0wHemZAw7gr0g5iyr/F8HZnIIM=;
  b=iA1Tz6TiC/D5BAzm0tujjiEBo89nDi/PIRZ8cd3dQRs8wvtlKMPE+grG
   QDb5s9tuOaQt+3talLjTIQ9/4WEDAOoi7+KtnLWBNDmzjA0w7QAq6qpl5
   SGbFLcx/25RsmIPersz9F4QuEK2Ut8+cKCWUZQ7n1doZpnQ/BkLFftFV8
   vie6rpYEHqrvd/Kbr0AyVu5mphyAdjpcuCCynpRDGl/eLQN5WtlB+ssCO
   Ybgjgon0FCpqtHYek/RD1sBLrvs0lJmpiwUn3Fqg0BKqJebovrHcYnElO
   cHghA5QdlDLzJwRGCqSzhTCNC+PvPQiqaqenoUKWjb1qEX6jiSG919DBM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432355873"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="432355873"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 04:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="958720646"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="958720646"
Received: from avulfx-mobl1.ger.corp.intel.com (HELO localhost) ([10.94.249.150])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 04:20:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 22 Jan 2024 14:20:25 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 1/1] PCI/DPC: Fix TLP Prefix register reading offset
In-Reply-To: <20240119225923.GA191511@bhelgaas>
Message-ID: <ad91677a-cce3-03fe-c826-12f8d44e3466@linux.intel.com>
References: <20240119225923.GA191511@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1542941559-1705925767=:994"
Content-ID: <c10c0ccc-5b18-b509-a91c-8375ff8673c8@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Keith Busch <kbusch@kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Dongdong Liu <liudongdong3@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1542941559-1705925767=:994
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <ac85c081-d4f5-e715-905e-e955db4eb39c@linux.intel.com>

On Fri, 19 Jan 2024, Bjorn Helgaas wrote:

> On Thu, Jan 18, 2024 at 01:08:15PM +0200, Ilpo J=E4rvinen wrote:
> > The TLP Prefix Log Register consists of multiple DWORDs (PCIe r6.1 sec
> > 7.9.14.13) but the loop in dpc_process_rp_pio_error() keeps reading
> > from the first DWORD. Add the iteration count based offset calculation
> > into the config read.
>=20
> So IIUC the user-visible bug is that we print only the first PIO TLP
> Prefix (duplicated several times), and we never print the second,
> third, etc Prefixes, right?

Yes.

> I wish we could print them all in a single pci_err(), as we do for the
> TLP Header Log, instead of dribbling them out one by one.

I've also done some work towards consolidating AER and DPC TLP=20
Header/Prefix Log handling which is when I found this bug (the reading=20
side is already done but printing is still pending).

> > Fixes: f20c4ea49ec4 ("PCI/DPC: Add eDPC support")
> > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.
--8323328-1542941559-1705925767=:994--
