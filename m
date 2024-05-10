Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D10238C2497
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 14:13:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KYiWaH4H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbSTX2t1bz3cmp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 22:13:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KYiWaH4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbSSn5JCtz3cYQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 22:12:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715343178; x=1746879178;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kpZQw+P2vcgkj+W1Iz5jlQU7T5p0A1MbKo7EuUSjcAY=;
  b=KYiWaH4H8ozjpLviHvXPEH1Jq8l0J+fOrCAX6hF9aHW7R06MadmY0uDl
   9jGLyBFLpsV6LWaj/NdbqCjI1PkKoor5EzJkpJCrLR0zkDxveJ6gFFTS4
   cKBnTKJno0+ceh5DqNZNZQkPCOT7KD5Xt6hR4AFo8iJCDGW+SwL9R4u9E
   E4FXHJhvCzz0PjdNreGeEJxEJxEJOIgh5mo49kbZ236FodCZU+Ais4PsY
   fsMOdXiI3Gb3WIc4yVv7jGik7N6aPoktB/yxX/fIMD2EYIloKlQbEmU8Q
   6eCSToCYVkfunBWS/asXNyGVBjx1PNTynXHqeoHU/jS1qz+o9l/G2zpYc
   w==;
X-CSE-ConnectionGUID: pX2+qQirRpOVJVsUKbpOmQ==
X-CSE-MsgGUID: 2JDVcuRdQKOLR+yC5DXAzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33832754"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="33832754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 05:12:54 -0700
X-CSE-ConnectionGUID: 0utjR1UFRM63Xx1lpDbLTw==
X-CSE-MsgGUID: Ogl5fA/MQ0uTVQyLsYV8Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29546609"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.85])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 05:12:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 May 2024 15:12:47 +0300 (EEST)
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v4 6/7] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
In-Reply-To: <20240510100730.18805-7-ilpo.jarvinen@linux.intel.com>
Message-ID: <7d69ae9f-9d2f-2482-eaa7-d3e31037c8d1@linux.intel.com>
References: <20240510100730.18805-1-ilpo.jarvinen@linux.intel.com> <20240510100730.18805-7-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-204770702-1715343167=:1562"
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
Cc: linuxppc-dev@lists.ozlabs.org, Lukas Wunner <lukas@wunner.de>, Oliver O'Halloran <oohall@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-204770702-1715343167=:1562
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 10 May 2024, Ilpo J=C3=A4rvinen wrote:

> pcie_read_tlp_log() handles only 4 Header Log DWORDs but TLP Prefix Log
> (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
>=20
> Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> TLP Prefix Log. The relevant registers are formatted identically in AER
> and DPC Capability, but has these variations:
>=20
> a) The offsets of TLP Prefix Log registers vary.
> b) DPC RP PIO TLP Prefix Log register can be < 4 DWORDs.
>=20
> Therefore callers must pass the offset of the TLP Prefix Log register
> and the entire length to pcie_read_tlp_log() to be able to read the
> correct number of TLP Prefix DWORDs from the correct offset.
>=20
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/pci.h             |  5 +++-
>  drivers/pci/pcie/aer.c        |  4 ++-
>  drivers/pci/pcie/dpc.c        | 13 +++++-----
>  drivers/pci/pcie/tlp.c        | 47 +++++++++++++++++++++++++++++++----
>  include/linux/aer.h           |  1 +
>  include/uapi/linux/pci_regs.h |  1 +
>  6 files changed, 57 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 0e9917f8bf3f..3d9034d89be8 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -420,7 +420,10 @@ struct aer_err_info {
>  int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *=
info);
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
> =20
> -int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_lo=
g *log);
> +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> +=09=09      unsigned int tlp_len, struct pcie_tlp_log *log);
> +unsigned int aer_tlp_log_len(struct pci_dev *dev);
> +unsigned int dpc_tlp_log_len(struct pci_dev *dev);
>  #endif=09/* CONFIG_PCIEAER */
> =20
>  #ifdef CONFIG_PCIEPORTBUS
> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> index 65ac7b5d8a87..3615ca520c9a 100644
> --- a/drivers/pci/pcie/tlp.c
> +++ b/drivers/pci/pcie/tlp.c
> @@ -11,26 +11,63 @@
> =20
>  #include "../pci.h"
> =20
> +/**
> + * aer_tlp_log_len - Calculates AER Capability TLP Header/Prefix Log len=
gth
> + * @dev: PCIe device
> + *
> + * Return: TLP Header/Prefix Log length
> + */
> +unsigned int aer_tlp_log_len(struct pci_dev *dev)
> +{
> +=09return 4 + dev->eetlp_prefix_max;
> +}
> +
> +/**
> + * dpc_tlp_log_len - Calculates DPC RP PIO TLP Header/Prefix Log length
> + * @dev: PCIe device
> + *
> + * Return: TLP Header/Prefix Log length
> + */
> +unsigned int dpc_tlp_log_len(struct pci_dev *pdev)
> +{
> +=09/* Remove ImpSpec Log register from the count */
> +=09if (pdev->dpc_rp_log_size >=3D 5)

Scratch this. LKP's randconfig build seems to have caught this failing to=
=20
build when AER is enabled but DPC is not because this member doesn't exist=
=20
w/o DPC.

> +=09=09return pdev->dpc_rp_log_size - 1;
> +
> +=09return pdev->dpc_rp_log_size;
> +}


--=20
 i.

--8323328-204770702-1715343167=:1562--
