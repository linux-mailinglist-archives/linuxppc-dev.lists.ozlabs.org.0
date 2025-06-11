Return-Path: <linuxppc-dev+bounces-9294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E2AD5CC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 19:01:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHX3s2JHxz307q;
	Thu, 12 Jun 2025 03:00:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749661257;
	cv=none; b=U78gAR91Jv6wSxlB6taexsj4BhbH2PCDEbKpY6srygjoP7K1/3zladk/33LAceUDWh/lJFYLpVii8OPl/davXQoteE4ySQFn0Nmstup1JpSpgydp4+jJunt7TXqZGDVA1ex0T5aGooSoYpqByill+EuxvA8eyeNtv7qMEcrr9/tMbDdIUe50ZK4YACL+JgcyxzXcfA4u+9JiOVZ6hqI8JKloc6j1wKaxhleliEp4ZWOptr32+1e2nY9QaEI25N/ISxyuhiioELnqGyxcO+KEk7gKg2G2W3wNXouc/50TtY1w6FIYJaw2fX7Lcg7zn3qYAHvgQMV4KeNN7a/BxZIwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749661257; c=relaxed/relaxed;
	bh=bu+SCGp6N2J4tAhn9AzeEjHNdObfYnCFQz6z9QyAfHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rce+8jnmGIp02jq4i0ie6h8NED0yxSiDmool4tSCFqs8Gp7ONsbbNZs2+oPsenaVbVZsSnswDetMcJl6940oQ36tF2yKvkHFqLx+rlypp4qk3FFmY0OBGDTNOIsGMQRgkf/7ekFiET14zKgaZf/SMvccAW7IxhPEDlck9pt8jcHb1hKXPmRMk7HaLC61PNou8yHLK2EpbG8pbk28B/0jgelsfkCEeVFWu8K4vw8KenCFMh6hATvvPL/285C1FvIn7I0j/0KtkxkwSmXexs24v+V12Y5griUwXd1YUlQzLRUaSXo+P/UlJFzAnCubWgDYhuJ+4U/4uZnugmCCsUXGag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4hyrQAc; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4hyrQAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHX3q6j6kz2yNG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 03:00:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 790445C0FDA;
	Wed, 11 Jun 2025 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9913C4CEE3;
	Wed, 11 Jun 2025 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749661247;
	bh=U1j6kxoyOkjl28igDCJYe1I9pHNhofmpnBeLH4TWCQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4hyrQAc8dlu8sBj0gfIHVVSY23CT2QtlWEWzvD0M2Qj2hHkJPXAttqrZi3+K4NDA
	 iw0OOgYL4nWtf1rVe8qMXcYbUvJyhcr9CIbR6CVPNEIg9wtwiEFh7K4oigJpqfFiUg
	 66BA3kLROOgmVH7/msza3brqfhI0FquXuo1AP5C5U1RGGPVLCDs+W9NeHu17xHW7rX
	 HbYYcRCh0jtU594VHerq02a3wArk7izJddstZ2Zayyh78mP6YfIiA+5ur/eYJ62kK2
	 3wd9XBinClLcxbS46XGqnXMsYngs/660tSYA3foSTNh80FHylIivcdInuU+H8c+xX9
	 Ol48rnLqpg3QA==
Date: Wed, 11 Jun 2025 22:30:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?B?5a2Z5Yip5paMX0Rpbw==?= <dio.sun@enflame-tech.com>
Cc: "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, 
	"oohall@gmail.com" <oohall@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?utf-8?B?572X5a6JX0Fu?= <an.luo@enflame-tech.com>, 
	=?utf-8?B?6IOh5reuX0Zlcm5hbmRv?= <fernando.hu@enflame-tech.com>, =?utf-8?B?5ZC055qT552/X0JpbGw=?= <bill.wu@enflame-tech.com>, 
	=?utf-8?B?546L6ZGrX1hpbg==?= <xin.wang@enflame-tech.com>
Subject: Re: [PATCH] AER: PCIE CTO recovery handle fix
Message-ID: <6gs5cvpqbbkudnlr7v57odgaxjyrare6nigrf2lkq22yljult2@z5jklzlmsdcq>
References: <BJXPR01MB0614C01A9523786117B1F1CBCEC8A@BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BJXPR01MB0614C01A9523786117B1F1CBCEC8A@BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 04, 2025 at 07:07:05AM +0000, 孙利斌_Dio wrote:
> [EXTERNAL EMAIL]
> 
> From 5fc7b1a9e0f0bcfa14068c6358019ed1e3ffc6c6 Mon Sep 17 00:00:00 2001
> From: "dio.sun" <dio.sun@enflame-tech.com>
> Date: Wed, 26 Feb 2025 08:54:49 +0000
> Subject: [PATCH] AER: PCIE CTO recovery handle fix
> 

Looks like you forwarded this patch instead of submitting directly. Please fix
it.

>  - Non-fatal PCIe CTO is reportted to PCIE RC and it will be convertted to
>    AdvNonFatalErr automatically
>  - according to PCIE SPEC 6.2.3.2.4.4 Requester with Completion Timeout(
>    If the severity of the CTO is non-fatal, and the Requester elects to
>    attempt recovery by issuing a new request, the Requester must
>    first handle the currecnt error case as an Advisory Non-Fatal Error.).
>  - Current Kernel code does nothing when receiving an AdvNonFatalErr(
>    Correctable Error) and the device driver has no chance to handle this
>    error.
>  - Under this situation, sometimes system will hang when more
>    AdvNonFatalErr coming.
> 
> Signed-off-by: dio.sun <dio.sun@enflame-tech.com>
> ---
> drivers/pci/pcie/aer.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 508474e17183..5ddc990c6f42 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1154,7 +1154,21 @@ static void aer_recover_work_func(struct work_struct *work)
>                 ghes_estatus_pool_region_free((unsigned long)entry.regs,
>                                             sizeof(struct aer_capability_regs));
> 
> -               if (entry.severity == AER_NONFATAL)
> +               if (entry.severity == AER_CORRECTABLE) {
> +                       if (entry.regs->cor_status & PCI_ERR_COR_ADV_NFAT) {
> +                               pci_err(pdev, "%04x:%02x:%02x:%x advisory non-fatal error\n",
> +                                               entry.domain, entry.bus, PCI_SLOT(entry.devfn),
> +                                               PCI_FUNC(entry.devfn));
> +                               if (entry.regs->uncor_status & PCI_ERR_UNC_COMP_TIME) {
> +                                       pci_err(pdev, "%04x:%02x:%02x:%x completion timeout\n",
> +                                                       entry.domain, entry.bus,
> +                                                       PCI_SLOT(entry.devfn),
> +                                                       PCI_FUNC(entry.devfn));
> +                                       pcie_do_recovery(pdev, pci_channel_io_frozen,
> +                                                                        aer_root_reset);
> +                               }
> +                       }

Why the error is handled in aer_recover_work_func()? This looks like only gets
triggered from ghes_handle_aer() in drivers/acpi/apei/ghes.c.

I think it should be handled in pci_aer_handle_error(). Also, the error prints
should be sneaked into aer_print_error().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

