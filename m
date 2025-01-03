Return-Path: <linuxppc-dev+bounces-4632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26510A00878
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 12:17:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPgyR6Crzz30V3;
	Fri,  3 Jan 2025 22:17:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735903023;
	cv=none; b=eZ5TbxjphD36fVNEsLkCJgapO4W03HEisksGTr3PZcF9e9oUOM8QJUXORnUM/h4eGvS9x23k48trJO90sDdR6/GHcci+iaX5dcyfvYBElgeKC0C3gjGimnM2bhqeRP9DwTzjRZzo/XR0DYCesMM2Y/2S0ebimQxoMDivmS7jhVmYMLtclVV2DJYbmIXLA808J7bqnRKpPCm+gRtZetshu3Lt7vfmT53xJBBxj5N+kXeH2bk2u8jg0pO+XoE5gsh9qvvthB+B6HM03PdLkzdoLp0nuJA+EDGHr1rtnjOU6MMRGErsqAhCmDWq6MwMZIDlNJvNz/KrNgD2IWDjyK/2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735903023; c=relaxed/relaxed;
	bh=XHOAbo5lWTu4pmQDsBp/wxFWWLS1pgmOveb6lpLWysM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mpwL0YvWoNQa8FktIdl4Jtr2X5k0oCqeReloGtxszZABd8QP9iWxAOrFj64dmnY9wDNnHpNEdxEXJOjVnUYoxhwIj4eXX2T2YNzx9eEa7y0ogin5HbSJrpcVrcwRgWN88c826YKcSmu5zjNrgOmKrZmztsRmGl6tKwKKS04TJnj5Qo4butLWgQ9Gqpc94a1ibtb96xStRGhfLJ0ynqwjGv3EBaHMYOiupeMjoUb7DlFB058q1RerrCzHiopyJBYsQsjmXsOCaivbbuGhgzqAVBRDyi4F84g6GjlvuwBBOblSmn8rzQfcH41CBLNMkUCcN/2Qa52JagShPofGzzfVcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPgyQ2sGGz30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 22:16:59 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YPgxF4ty1z6K6JG;
	Fri,  3 Jan 2025 19:16:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 60554140C72;
	Fri,  3 Jan 2025 19:16:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 3 Jan
 2025 12:16:52 +0100
Date: Fri, 3 Jan 2025 11:16:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Atharva Tiwari <evepolonium@gmail.com>
CC: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran
	<oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI/ERR: use panic instead pci_info for device recovery
 failure in PCIe
Message-ID: <20250103111651.00007c57@huawei.com>
In-Reply-To: <20241227065253.72323-1-evepolonium@gmail.com>
References: <20241227065253.72323-1-evepolonium@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 27 Dec 2024 12:22:53 +0530
Atharva Tiwari <evepolonium@gmail.com> wrote:

> update failed in drivers/pci/pcie/err.c to 
> trigger a kernel panic instead of pci_info
> 
> Thanks
Rewrite message as described in submitting patches documentation.

Key thing here is question of 'why?'
A question was in that comment, what is your reasoning for panic being the
correct choice?

Jonathan

> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
>  drivers/pci/pcie/err.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 31090770fffc..2630b88564d8 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -271,8 +271,8 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  
>  	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
>  
> -	/* TODO: Should kernel panic here? */
> -	pci_info(bridge, "device recovery failed\n");
> +
> +	panic("Kernel Panic: %s: Device recovery failed\n", pci_name(bridge));
>  
>  	return status;
>  }


