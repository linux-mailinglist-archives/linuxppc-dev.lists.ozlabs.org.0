Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E804D4FC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 17:52:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDw9B2pbkz30Dp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 03:52:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z70GlNfy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z70GlNfy; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDw8W51VZz2yws
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 03:52:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE7E661D04;
 Thu, 10 Mar 2022 16:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6280C340F4;
 Thu, 10 Mar 2022 16:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646931128;
 bh=ElymF9bFBBy1n24Im00MyTY3vz1EhoElO8yoHTyT2Zg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Z70GlNfyR7y91BnSVAjrftfXRydpAHUstcfbT9kmLqCpC8Xi5BIJ4bUql++NwerUQ
 mv+2o9v/HbYoXIxSh/yPNi9dU0ijzdfXyE4I1+2olecaFEXzFkvoUqSQOFMqOTrMcZ
 s5KuQfMnUoU+6nTRDN0DPraDx6M6Jtky3H4lP056kVAwQv036ELq4uZZPUKxpRRZjt
 /AihjRI1VnAnB4w/jYrsxXj3occUe+v/MobUfDePfOfl6aJYwPpH9FDEK5yy8Jxjja
 p47PJ0RyxTVJeehnyCe1dUX8/XjqL8KcBGb1bUd2fD/wWT89BjadXIe+v6QCynrBiv
 /Fl6gs1yoqCgA==
Date: Thu, 10 Mar 2022 10:52:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v8 01/14] sizes.h: Add SZ_1T macro
Message-ID: <20220310165206.GA163581@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b020d8dcedb2753a894722147a0b5de25b2ae29b.1646847561.git.christophe.leroy@csgroup.eu>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, catalin.marinas@arm.com,
 alex@ghiti.fr, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, will@kernel.org, Paul Mackerras <paulus@samba.org>,
 Bjorn Helgaas <bhelgaas@google.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Toan Le <toan@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 09, 2022 at 06:44:35PM +0100, Christophe Leroy wrote:
> Today drivers/pci/controller/pci-xgene.c defines SZ_1T
> 
> Move it into linux/sizes.h so that it can be re-used elsewhere.
> 
> Link: https://lore.kernel.org/r/575cb7164cf124c75df7cb9242ea7374733942bf.1642752946.git.christophe.leroy@csgroup.eu
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Toan Le <toan@os.amperecomputing.com>
> Cc: linux-pci@vger.kernel.org
> ---
>  This patch is already in linux-next but not in Linus' tree yet

What would you like me to do about this?  It's in linux-next, which
means it will go to Linus' tree during the next merge window.

But this is 01/14; are there other patches that I should be looking
at?  Do I need to coordinate this with other patches that depend on
it?

>  drivers/pci/controller/pci-xgene.c | 1 -
>  include/linux/sizes.h              | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
> index 0d5acbfc7143..77c1fe7e11f9 100644
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
> 2.34.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
