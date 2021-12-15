Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D69476393
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 21:42:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDnHt5GdTz3bnq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 07:42:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U0/niBIg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U0/niBIg; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDnHB2yfnz3bbv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 07:42:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3911AB816C2;
 Wed, 15 Dec 2021 20:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9397CC36AE2;
 Wed, 15 Dec 2021 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639600928;
 bh=77j1aFKa3BKj9OCIas2iLnj9Txbm+/MSJFvVadJN+gc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=U0/niBIgwV0jq1JklZXB1TQnBOSGK19gh4zLFeQg0jhpgCYm5Jhtnfkj7QLn1ChUU
 n+GIjv9gqJ9euoh5GdJRV6EC+3yA8IwUxE9nDQ40ula8hxJdd+C2V5n+W53VyMrNQR
 EwmhjVwyqI8LhRGmSIWsxk8rFuhphINMmmuER2BekMJPZlgiY7G1mUPAhKFXi26aTy
 nNOU1KwR/52k9gGBOzIfMYSAP4ZYNTVleTL8wh+NuwHH7RUQ08D+wr5dyia0jJ+1My
 nknddiB2NoMQTC19/F6qyab5E7ecLzjDA3YAH8U9syQ51e0E1kjx0giXqhSZ6PNAXL
 /VYn9/NTkHWwQ==
Date: Wed, 15 Dec 2021 14:42:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] sizes.h: Add SZ_1T macro
Message-ID: <20211215204207.GA710838@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
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
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Toan Le <toan@os.amperecomputing.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 08, 2021 at 02:32:42PM +0000, Christophe Leroy wrote:
> Today drivers/pci/controller/pci-xgene.c defines SZ_1T
> 
> Move it into linux/sizes.h so that it can be re-used elsewhere.
> 
> Cc: Toan Le <toan@os.amperecomputing.com>
> Cc: linux-pci@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I guess this needs to go with the [2/2] patch, since it also uses
SZ_1T.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/controller/pci-xgene.c | 1 -
>  include/linux/sizes.h              | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
> index 56d0d50338c8..716dcab5ca47 100644
> --- a/drivers/pci/controller/pci-xgene.c
> +++ b/drivers/pci/controller/pci-xgene.c
> @@ -49,7 +49,6 @@
>  #define EN_REG				0x00000001
>  #define OB_LO_IO			0x00000002
>  #define XGENE_PCIE_DEVICEID		0xE004
> -#define SZ_1T				(SZ_1G*1024ULL)
>  #define PIPE_PHY_RATE_RD(src)		((0xc000 & (u32)(src)) >> 0xe)
>  
>  #define XGENE_V1_PCI_EXP_CAP		0x40
> diff --git a/include/linux/sizes.h b/include/linux/sizes.h
> index 1ac79bcee2bb..84aa448d8bb3 100644
> --- a/include/linux/sizes.h
> +++ b/include/linux/sizes.h
> @@ -47,6 +47,8 @@
>  #define SZ_8G				_AC(0x200000000, ULL)
>  #define SZ_16G				_AC(0x400000000, ULL)
>  #define SZ_32G				_AC(0x800000000, ULL)
> +
> +#define SZ_1T				_AC(0x10000000000, ULL)
>  #define SZ_64T				_AC(0x400000000000, ULL)
>  
>  #endif /* __LINUX_SIZES_H__ */
> -- 
> 2.33.1
