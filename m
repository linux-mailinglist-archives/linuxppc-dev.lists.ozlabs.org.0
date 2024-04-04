Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127789846B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:52:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O9L1o1Jz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9H2z6vhnz3vYy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 20:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O9L1o1Jz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9H2F5yf8z2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 20:51:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712224295; x=1743760295;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QXkkR+15Nk+Hzti1dm3lVDSpnwBTvtUHwgacoad2c0Q=;
  b=O9L1o1JzzRpiwwCHlR4M3GPsaGAiyitxwMjK8tXv7fenm3rOeSP3MzFS
   lH85Yd9NROxGrjMpo/KY1LiC9xJme198jWjF3X/yiA01tNtR61fn20SQ1
   VbkG24LvsxiOjbziuOBwwh4orPDCbh1pV8to5pn54NFQlrbgg29eG+c+U
   FauRkremGgGjA92WCGpcxHV2PlbV/w3IxGuSrrhHkhOeYrRH1pcelxRjg
   +LSyxhEXgGmZAlxxgoc+vH7N5r6AVsjA99dNg3m9mM7Xym1WGybM6RHFQ
   KyZCizAbkt4ejRUfjMTPLYR3aaludI5dZDUTCYwzQb4TDY1EXHn1bTDCV
   A==;
X-CSE-ConnectionGUID: RGd/k8o0SwadXobyyFTj5A==
X-CSE-MsgGUID: Aiul8mvpQqy05FD9y3650Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7393835"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7393835"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 02:51:30 -0700
X-CSE-ConnectionGUID: ZygVWsUXSny15fRqkdCyjw==
X-CSE-MsgGUID: 42Z4lqgpT3m7ucWMfJP/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19186529"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.26])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 02:51:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 4 Apr 2024 12:51:20 +0300 (EEST)
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 1/2] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
In-Reply-To: <Zg50P2JcpvO8S-a7@wunner.de>
Message-ID: <cc4f4e53-22d3-b5b0-bc9d-3156bfec6652@linux.intel.com>
References: <20240403100206.4403-1-ilpo.jarvinen@linux.intel.com> <20240403100206.4403-2-ilpo.jarvinen@linux.intel.com> <Zg50P2JcpvO8S-a7@wunner.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-71238506-1712224280=:2725"
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
Cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-71238506-1712224280=:2725
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 4 Apr 2024, Lukas Wunner wrote:

> On Wed, Apr 03, 2024 at 01:02:05PM +0300, Ilpo J=E4rvinen wrote:
> > pcie_read_tlp_log() handles only 4 TLP Header Log DWORDs but TLP Prefix
> > Log (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> >=20
> > Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> > TLP Prefix Log. The layout of relevant registers in AER and DPC
> > Capability is not identical but the offsets of TLP Header Log and TLP
>                 ^^^           ^^^
> Somehow this doesn't seem to make sense.  Is the "not" perhaps wrong here=
?

Hi Lukas,

How about changing it into plural and adding a comma:

The layouts of relevant registers in AER and DPC Capabilities are not=20
identical, but ...

Does that sound better?

> > Prefix Log vary so the callers must pass the offsets to
> > pcie_read_tlp_log().


--=20
 i.

--8323328-71238506-1712224280=:2725--
