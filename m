Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58777701401
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 04:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJ8v31RSCz3fQF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 12:38:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YNLxI+8p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJ8t45y0Nz3bfw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 12:37:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Wk+ym5kpqN+r2McL+81J+S8O6L6Yg4SLALm7z013ufw=; b=YNLxI+8pEZoIU8g8Iqkpm8l0sq
	pxMwCe9lvQxlpIKUCdrZD4WC3Z5SkoopIjksgYIz0uo7XHHnYZFTmwVnzJJAuIdzoiyz6CnbG5ydB
	0ONsqb4uPPZVt8Dv0XKYO1ogJMlHcacvmVpOwOJJJqJjMXxerx+mvW8NfBXc7vzEmT53WPGJO6sjx
	0JgVSGoy6b6le+YRdnNWtWcp9cNiCleF2+BhzAlrRDlLI8fHZUOs4k5FNxvx9jjvw9afqGo0IYtOL
	62Klht7dMYx1oX/WtCiWFrazXXFXNufpTOABdaafGYX/ljLzciVVxGdwzF9NlAAsVmGx94EtEDP2D
	G9xZWRRw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pxf7m-00DXnw-1B;
	Sat, 13 May 2023 02:36:46 +0000
Message-ID: <e933e663-9bf6-dd20-c55a-17a88bc86201@infradead.org>
Date: Fri, 12 May 2023 19:36:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] soc/fsl/qe: fix usb.c build errors
Content-Language: en-US
To: linux-kernel@vger.kernel.org
References: <20230410011254.25675-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230410011254.25675-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Kumar Gala <galak@kernel.crashing.org>, Leo Li <leoyang.li@nxp.com>, Qiang Zhao <qiang.zhao@nxp.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Any comments on this patch?

I am still seeing this build error.

On 4/9/23 18:12, Randy Dunlap wrote:
> Fix build errors in soc/fsl/qe/usb.c when QUICC_ENGINE is not set.
> This happens when PPC_EP88XC is set, which selects CPM1 & CPM.
> When CPM is set, USB_FSL_QE can be set without QUICC_ENGINE
> being set. When USB_FSL_QE is set, QE_USB deafults to y, which
> causes build errors when QUICC_ENGINE is not set. Making
> QE_USB depend on QUICC_ENGINE prevents QE_USB from defaulting to y.
> 
> Fixes these build errors:
> 
> drivers/soc/fsl/qe/usb.o: in function `qe_usb_clock_set':
> usb.c:(.text+0x1e): undefined reference to `qe_immr'
> powerpc-linux-ld: usb.c:(.text+0x2a): undefined reference to `qe_immr'
> powerpc-linux-ld: usb.c:(.text+0xbc): undefined reference to `qe_setbrg'
> powerpc-linux-ld: usb.c:(.text+0xca): undefined reference to `cmxgcr_lock'
> powerpc-linux-ld: usb.c:(.text+0xce): undefined reference to `cmxgcr_lock'
> 
> Fixes: 5e41486c408e ("powerpc/QE: add support for QE USB clocks routing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202301101500.pillNv6R-lkp@intel.com/
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Leo Li <leoyang.li@nxp.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Qiang Zhao <qiang.zhao@nxp.com>
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Kumar Gala <galak@kernel.crashing.org>
> ---
> v2: drop Anton Vorontsov <avorontsov@ru.mvista.com>; rebase/resend
> 
>  drivers/soc/fsl/qe/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -- a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -62,6 +62,7 @@ config QE_TDM
>  
>  config QE_USB
>  	bool
> +	depends on QUICC_ENGINE
>  	default y if USB_FSL_QE
>  	help
>  	  QE USB Controller support

-- 
~Randy
