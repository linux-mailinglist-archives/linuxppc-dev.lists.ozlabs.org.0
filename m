Return-Path: <linuxppc-dev+bounces-8822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C394ABF0D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2RsY0TPsz3bx5;
	Wed, 21 May 2025 20:06:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747822001;
	cv=none; b=gZEpM/ZHx2zAq0ZreBVP7YXzIQZkUPPaT4Bgy3sRLc7X1voyf7e9WZyxb3SNPs9BXROE/KHcdUV0ZErqfL4Dlq7gy+ZNq3IlYfX3PlQ7R/z0vUJAUdRtRgKZmpxzPBlBUjROY8KC2zUEwEAarlQ3R7BRRsnIkrMQejJtDfgGSs1oyNYLS6tgxEroJZhewQO+CILLC/2KKht/JjEgEm8Sn+H9NlKKi8SQImOn0TFsoeEe6+svs1pXFi48IG4k7pOrFwKLEpqsECNFqtwA+6P6biCK2B3Z1w/64fb+Od2qqJvFY90vmjzv3hrr/ub7rL8ctzKtgdBntq/CxS2S6Ssb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747822001; c=relaxed/relaxed;
	bh=psRFWI/mb3e+jiTX0nEQFEbfyBPby6kWTXSB9PMOq+k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nTTEaKse0bkT2QvrRHbIp8hKqFbQoVR4SufpzjEyMsZDHX+MwNYr+LYdk40tWnVI/7tj64QaLU5RJO3Acb+579IesQ6iR00xr9gxN3rEQ6LR30cIWrewZKwy4atuLAsWQmdm6gwEoEAqd1RfxKrDsBWqu3Lnf6169Gt/1MHSXPJOKEitZESoIpgPoJv64/EHBujHh26z25QkNKimjAzcm0zGiTxSvi3Gu6DgIoGPlzas7WkRq6da2LGnQKsmM3tR9qMqzj5Im8eMC5aqSvTAsbpAlonH2W96da1aB99sDVftzCwSmrWggHLwln5jFyVuycIeR0l3IMe25OwpSTWSrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eMdo8miD; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eMdo8miD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2RsX0cjMz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:06:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747822000; x=1779358000;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/66uzKbD2Pt/moi6vCnG0yTy0xxQ1qdjvrWSrTVybq4=;
  b=eMdo8miDbE9/Kq0xTa6QzjQYcjg6WToOhg7SPOzv/GlpYXytZbSop4jf
   y5UxNr4ZTFp27fZGRK+inQ+yAB7/QS8bI7DtxEJ/2dojL6yHnVjKxrEcI
   nm16hsvGhTz673M010BJuJrJWfhrGjxK/gFy/K/bkAVbTV8tsA+aMeLCg
   WujKxbdXioaJeQmaJVDDjLwCQ9L6N8+BdvXn3qunTVAGVsEOMmi2wAzif
   DGTAVCx2+QIru+O0eoF9+v9jV0k+eT+4opE7D/q/pgP7TspXCudU1sNm2
   oOjsxlYIF7VESCqRwImtaH55jF/ehJoi18EsUT4XvAqdi9bbffyLWsGsX
   Q==;
X-CSE-ConnectionGUID: bA/N6kXERaKTZHfBJGwbAg==
X-CSE-MsgGUID: 1+c6mqJOSLKHSBxleYCZgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49851714"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49851714"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:06:37 -0700
X-CSE-ConnectionGUID: F28VW0UoT6e7arA1XbwwQg==
X-CSE-MsgGUID: yzbKDZP+SmGyofNmWssABQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141053400"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:06:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 13:06:25 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    Weinan Liu <wnliu@google.com>, 
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
    linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 01/17] PCI/DPC: Initialize aer_err_info before using
 it
In-Reply-To: <20250520215047.1350603-2-helgaas@kernel.org>
Message-ID: <b74260bc-9991-1590-91e1-97e77ae0fa41@linux.intel.com>
References: <20250520215047.1350603-1-helgaas@kernel.org> <20250520215047.1350603-2-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-302389236-1747821985=:946"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-302389236-1747821985=:946
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Previously the struct aer_err_info "info" was allocated on the stack
> without being initialized, so it contained junk except for the fields we
> explicitly set later.
>=20
> Initialize "info" at declaration so it starts as all zeros.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux=
=2Eintel.com>
> ---
>  drivers/pci/pcie/dpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index df42f15c9829..3daaf61c79c9 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -258,7 +258,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_=
dev *dev,
>  void dpc_process_error(struct pci_dev *pdev)
>  {
>  =09u16 cap =3D pdev->dpc_cap, status, source, reason, ext_reason;
> -=09struct aer_err_info info;
> +=09struct aer_err_info info =3D {};
> =20
>  =09pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>  =09pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
>=20

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-302389236-1747821985=:946--

