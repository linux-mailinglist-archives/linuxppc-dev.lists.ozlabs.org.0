Return-Path: <linuxppc-dev+bounces-8730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3D7ABD559
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:42:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rjj2wrZz3bgq;
	Tue, 20 May 2025 20:42:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747737769;
	cv=none; b=TwqQmVCLxqKti6dCFA9rIUbUMLkiWPZV/dtdtK7I9pEIN8y/dmbw0fbh1LFdJxbnEO/PwZuPM02Uooq3QbbgyPeC+lv4lT9t/1zeTZqzlCUIpqvoqHRlRyONsebiL2P7c3NNFuC0/y6o0gUODJxJrlDSCN+A20ln2jLQ+/Wo4AeJVPOVFI4ztzf7MnjhmbtsJkNSXTDWZ6dyAbNut0sDd6kAOvz/c/gspNI8hbheVboITmsfB8zOfFSFBq7pVWJcB0U9iaXrr0PZTq8MnBrdaHpoQFwkKTm3fLwNlhSKw4n67uAuSC0lWOUuApKdmvsifCnHuRx0ZaSM3TXljH2T6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747737769; c=relaxed/relaxed;
	bh=tIldzRFiE6TnDC8bctxdf/7ReyHx0EI3n6vVmPxgy7c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ahXXzf0i10VrwVxUspJKTTCZxbLzb3ED/pM+wKyfsbOGp8jzNJ1NFag/HN+oSqW2RdIJfiLkisYUhLtuHJLzZ12Gg78I3aJi/7SW6BGEuDmXD3dDuSSmtztHwE15vrFw9fO6Bmz4O5EeZDtrxjFDa4cnwnHzCnjGmgXXn164IXP4m2odIIqLih3kbgh7YjXZN5WZr+3plnXKI3KwmqSbk8oYlZLP15ADrsETkiXqHgO82rSrAvz5zsINMqJwmEYbBVF7PtnzbIFOqV+pNsuPnoD1K0eXjg8AKnYl6cyMZtTUt2L3WXh8nL2952qGaJ7mJrsvT30AIRC3rj2G7IqSBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m0AL2Y/a; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m0AL2Y/a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rjh1DTYz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:42:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737769; x=1779273769;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VVRJ0cc49ivFUcS/222ihD/X953hUY24HsmeyEvjzMI=;
  b=m0AL2Y/aFmdj8f4S2YCHq7YL6/sz4G0hed8jadruNbOeLUJHJGTKtPuF
   Tf5sP7kJs1zRiglPx9+EylsDP0pOHKxhzoc8dJp4WCEt5mRIWkHStri1C
   Bnq6qRi/MhPwX/C6aLTbO7NA80x6rJVMvYs04Dpq+G4eG2+G0qwaq15Wr
   LV7nIDIQCNmwaBzqQbI4AXlmdc30f/XhZgGONJPTzmN75AGW+k/MNta1G
   3ATUi1eqPeAITWmCmTcQL3GGrzNxwmu2U7FkHDanfQ4E28EmhlFoMO1Rw
   udkwkLMFwCzSIevU5mAleODn/Rc28a3N2AUBUna/DP/2zjqBpxhSsHy/d
   Q==;
X-CSE-ConnectionGUID: 54JAY1ODSG+d9IHANMkEgA==
X-CSE-MsgGUID: GUnAkrOYTYK+ZO1FU3v1Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="75066301"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75066301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:42:46 -0700
X-CSE-ConnectionGUID: ZBtXtbmQRgSzVNxZmPrKIQ==
X-CSE-MsgGUID: Ljl4tQ5iQpCWru7A/t3jlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144408251"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:42:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:42:36 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Martin Petersen <martin.petersen@oracle.com>, 
    Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, 
    Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, 
    Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
    Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
    Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
    Dave Jiang <dave.jiang@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 08/16] PCI/AER: Simplify pci_print_aer()
In-Reply-To: <20250519213603.1257897-9-helgaas@kernel.org>
Message-ID: <c77305f2-1117-8c7c-83e4-1036c46dbbbb@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-9-helgaas@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1668877726-1747737756=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1668877726-1747737756=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Simplify pci_print_aer() by initializing the struct aer_err_info "info"
> with a designated initializer list (it was previously initialized with
> memset()) and using pci_name().
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 40f003eca1c5..73d618354f6a 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -765,7 +765,10 @@ void pci_print_aer(struct pci_dev *dev, int aer_seve=
rity,
>  {
>  =09int layer, agent, tlp_header_valid =3D 0;
>  =09u32 status, mask;
> -=09struct aer_err_info info;
> +=09struct aer_err_info info =3D {
> +=09=09.severity =3D aer_severity,
> +=09=09.first_error =3D PCI_ERR_CAP_FEP(aer->cap_control),
> +=09};
> =20
>  =09if (aer_severity =3D=3D AER_CORRECTABLE) {
>  =09=09status =3D aer->cor_status;
> @@ -776,14 +779,11 @@ void pci_print_aer(struct pci_dev *dev, int aer_sev=
erity,
>  =09=09tlp_header_valid =3D status & AER_LOG_TLP_MASKS;
>  =09}
> =20
> -=09layer =3D AER_GET_LAYER_ERROR(aer_severity, status);
> -=09agent =3D AER_GET_AGENT(aer_severity, status);
> -
> -=09memset(&info, 0, sizeof(info));
> -=09info.severity =3D aer_severity;
>  =09info.status =3D status;
>  =09info.mask =3D mask;
> -=09info.first_error =3D PCI_ERR_CAP_FEP(aer->cap_control);
> +
> +=09layer =3D AER_GET_LAYER_ERROR(aer_severity, status);
> +=09agent =3D AER_GET_AGENT(aer_severity, status);
> =20
>  =09pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);
>  =09__aer_print_error(dev, &info);
> @@ -797,7 +797,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_sever=
ity,
>  =09if (tlp_header_valid)
>  =09=09pcie_print_tlp_log(dev, &aer->header_log, dev_fmt("  "));
> =20
> -=09trace_aer_event(dev_name(&dev->dev), (status & ~mask),
> +=09trace_aer_event(pci_name(dev), (status & ~mask),
>  =09=09=09aer_severity, tlp_header_valid, &aer->header_log);
>  }
>  EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1668877726-1747737756=:936--

