Return-Path: <linuxppc-dev+bounces-8729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CDCABD540
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 12:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1rdg4kBVz3bcy;
	Tue, 20 May 2025 20:39:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747737559;
	cv=none; b=hDOsHQwgwp3BrkTvXgoB0DzpEMkCZpoq8lrtF5XyBD33Mkhfe7yT4SpjJwzxN/HnqMDvE//by6OIio0LyrLZNmHLQSrOrKY5Eynt/jvhX4qVOU0LtlPu1Pjm9T/tmoGnr2AVXlim64153rucLbAMOGkQVK++5JBgMmS/8tWR1Ybr9cl78xUvGhU6JYymHzgcy4WmLi+hv0B3PeRCSutZCcXz66XuXqxaag762DvNmJNiQ4ThfJDjcFOyC1QVLABvgyqZpMPmz0SfKFVk+rhbcp5ydr1IFiU3L1u9Z/oRwXro+gSSkxslDhkIQo8NC9ED7Qqi6RREkP/+zg8lE8AEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747737559; c=relaxed/relaxed;
	bh=QoVFRmyIlGrrKT1Ye5SZc/0PbYgLuCBasWuOCrJ8z3o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WcfeFptKYlSxtfQO+liJmaFngFOcL7U3m6MbU1vYFctQn3QkVxEdC3q5EuNj/Nh7ufN6AAUGD2X4uM/S1rdQ7eA1r0aHmgjlBFB4Sz/TCxW1TYM6oaks4BKqoAru7+bKvZNYUCOElf8CmAlQAgFYKt0CTrAxORS472iRnCYK7atWvAO00p4ix6TR3exVkpqctynljkJ3bZ3hiqeClVisdwXIhQ5St1GoEG2NKFEiV2+28vSsaxihtwLZj7tiJxw/S5LkPZjnaUiA0Tvp0gWMpiyR0QpITFcHJ+ggSFXB5w3y7t3GXw/0idAlv0Tl7t6sQOOjWllUkHLreHBIp4MFQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NTu7MBuC; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NTu7MBuC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1rdf4dlRz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:39:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737559; x=1779273559;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mYMylA2w4ZhvLJgkA2XzwHktV/OQfBpbjS+UEenJWx8=;
  b=NTu7MBuC6QNczqxeER0MFYaaQT+DmQ07DacWfd3cYOZ26fKqPtfUhR5C
   baxdbtwFFxhE8tIyiVNSRezY7uBW74mcfg1lfAWbp2CO8Q8HepZ12xRWR
   wuxJ7o71I03oyQdd0ssXq3mo859c+iK9JbpPveGXIpoDNc66VZaJQnE01
   KQsMIMFbb6/LEO5LEEBvYdkStV6/S7SjOsWyerSI1EhSPisktzf83h4yo
   HeVBwHR+kniHRENot3kEUUY/nyna3uNL+Sv8lSK6D7GnoKC6FsK7/yfmr
   2jXQLdU0pSk3ilFoeG+Hl/U6vAYSfs1yL9Kqw1SdDAcodcnul4oXrcLKu
   A==;
X-CSE-ConnectionGUID: vTAeJ3n5RR6rN/v9uZLvEw==
X-CSE-MsgGUID: nIo1MLOZQGWZOPuSlqexYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49819625"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49819625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:39:16 -0700
X-CSE-ConnectionGUID: hll6pHgZRW2X/dz6jsfCFw==
X-CSE-MsgGUID: LFjoowSZTkSd1cwn0aN9tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140659956"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:39:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:39:06 +0300 (EEST)
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
Subject: Re: [PATCH v6 07/16] PCI/AER: Initialize aer_err_info before using
 it
In-Reply-To: <20250519213603.1257897-8-helgaas@kernel.org>
Message-ID: <0d429918-b42c-5714-ef40-ce2a9e129a6b@linux.intel.com>
References: <20250519213603.1257897-1-helgaas@kernel.org> <20250519213603.1257897-8-helgaas@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-824981395-1747737546=:936"
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-824981395-1747737546=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 May 2025, Bjorn Helgaas wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Previously the struct aer_err_info "e_info" was allocated on the stack
> without being initialized, so it contained junk except for the fields we
> explicitly set later.
>=20
> Initialize "e_info" at declaration with a designated initializer list,
> which initializes the other members to zero.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 37 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 95a4cab1d517..40f003eca1c5 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1281,7 +1281,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>  =09=09struct aer_err_source *e_src)

Unrelated to this change, these would fit on a single line.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

>  {
>  =09struct pci_dev *pdev =3D rpc->rpd;
> -=09struct aer_err_info e_info;
> +=09u32 status =3D e_src->status;
> =20
>  =09pci_rootport_aer_stats_incr(pdev, e_src);
> =20
> @@ -1289,14 +1289,13 @@ static void aer_isr_one_error(struct aer_rpc *rpc=
,
>  =09 * There is a possibility that both correctable error and
>  =09 * uncorrectable error being logged. Report correctable error first.
>  =09 */
> -=09if (e_src->status & PCI_ERR_ROOT_COR_RCV) {
> -=09=09e_info.id =3D ERR_COR_ID(e_src->id);
> -=09=09e_info.severity =3D AER_CORRECTABLE;
> -
> -=09=09if (e_src->status & PCI_ERR_ROOT_MULTI_COR_RCV)
> -=09=09=09e_info.multi_error_valid =3D 1;
> -=09=09else
> -=09=09=09e_info.multi_error_valid =3D 0;
> +=09if (status & PCI_ERR_ROOT_COR_RCV) {
> +=09=09int multi =3D status & PCI_ERR_ROOT_MULTI_COR_RCV;
> +=09=09struct aer_err_info e_info =3D {
> +=09=09=09.id =3D ERR_COR_ID(e_src->id),
> +=09=09=09.severity =3D AER_CORRECTABLE,
> +=09=09=09.multi_error_valid =3D multi ? 1 : 0,
> +=09=09};
> =20
>  =09=09if (find_source_device(pdev, &e_info)) {
>  =09=09=09aer_print_source(pdev, &e_info, "");
> @@ -1304,18 +1303,14 @@ static void aer_isr_one_error(struct aer_rpc *rpc=
,
>  =09=09}
>  =09}
> =20
> -=09if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> -=09=09e_info.id =3D ERR_UNCOR_ID(e_src->id);
> -
> -=09=09if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
> -=09=09=09e_info.severity =3D AER_FATAL;
> -=09=09else
> -=09=09=09e_info.severity =3D AER_NONFATAL;
> -
> -=09=09if (e_src->status & PCI_ERR_ROOT_MULTI_UNCOR_RCV)
> -=09=09=09e_info.multi_error_valid =3D 1;
> -=09=09else
> -=09=09=09e_info.multi_error_valid =3D 0;
> +=09if (status & PCI_ERR_ROOT_UNCOR_RCV) {
> +=09=09int fatal =3D status & PCI_ERR_ROOT_FATAL_RCV;
> +=09=09int multi =3D status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
> +=09=09struct aer_err_info e_info =3D {
> +=09=09=09.id =3D ERR_UNCOR_ID(e_src->id),
> +=09=09=09.severity =3D fatal ? AER_FATAL : AER_NONFATAL,
> +=09=09=09.multi_error_valid =3D multi ? 1 : 0,
> +=09=09};
> =20
>  =09=09if (find_source_device(pdev, &e_info)) {
>  =09=09=09aer_print_source(pdev, &e_info, "");
>=20

--=20
 i.

--8323328-824981395-1747737546=:936--

