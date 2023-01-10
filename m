Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C54663D84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 11:07:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrmhM4LxNz3cdf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 21:07:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FjX/cF0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FjX/cF0Z;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrmgL0lGbz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 21:06:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hkg2NF58mMfnZ01WouKNjrkGZFARgMHBNH8c8RZ8560=; b=FjX/cF0ZLjVsiUhRGuhCw+3beY
	f0DwVktOUL0eaknOsBwXXT0aDE3UgkqujtLuPX5ypS5WE1el3QsrKHP0UuHdJmKwy6DFzghQS5Vns
	8037eO26AezKY0KJYFrQ3GjZJADAZwYmbUXGdjSh2cokJyzB8UY3S5l3AL2J4sQD2XI7cEC6ajw6x
	MWGIIh5HJwS79xaE0APWyLr2MRx5gbJF6CaY5aMIkmDXlr4GE5mTgGLQQYNfINN/OhvWZVRiJ+G68
	XyNVkERdwsSGnHHkf9xRLpx5WTxyHY8DUZFMl5S13pg8affJ5m7P0/r6VZmXXwU1V6D11Xi1Bfmrn
	8u3iG+8g==;
Received: from [2601:1c2:d80:3110::a2e7]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBWA-006Gjw-Gr; Tue, 10 Jan 2023 10:06:06 +0000
Message-ID: <a0e325d2-a9c5-ffca-b2d6-5eea60f9ad3b@infradead.org>
Date: Tue, 10 Jan 2023 02:06:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: usb.c:undefined reference to `qe_immr'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
References: <202301101500.pillNv6R-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202301101500.pillNv6R-lkp@intel.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, oe-kbuild-all@lists.linux.dev, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[adding Cc's]


On 1/9/23 23:59, kernel test robot wrote:
> Hi Masahiro,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   5a41237ad1d4b62008f93163af1d9b1da90729d8
> commit: 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
> date:   8 months ago
> config: powerpc-randconfig-r026-20230110
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b4537199a4a8480b8c3ba37a2d44765ce76cd9b
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    powerpc-linux-ld: powerpc-linux-ld: DWARF error: could not find abbrev number 74
>    drivers/soc/fsl/qe/usb.o: in function `qe_usb_clock_set':
>>> usb.c:(.text+0x1e): undefined reference to `qe_immr'
>>> powerpc-linux-ld: usb.c:(.text+0x2a): undefined reference to `qe_immr'
>>> powerpc-linux-ld: usb.c:(.text+0xbc): undefined reference to `qe_setbrg'
>>> powerpc-linux-ld: usb.c:(.text+0xca): undefined reference to `cmxgcr_lock'
>    powerpc-linux-ld: usb.c:(.text+0xce): undefined reference to `cmxgcr_lock'
> 

.config extract:

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_QE_USB=y


This is caused by (drivers/soc/fsl/qe/Kconfig):

config QE_USB
	bool
	default y if USB_FSL_QE
	help
	  QE USB Controller support

which does not depend on QUICC_ENGINE, where the latter build provides
the missing symbols.

drivers/usb/gadget/udc/Kconfig:

config USB_FSL_QE
	tristate "Freescale QE/CPM USB Device Controller"
	depends on FSL_SOC && (QUICC_ENGINE || CPM)
	depends on !64BIT || BROKEN

CPM is set but QUICC_ENGINE is not set (by CONFIG_PPC_EP88XC=y).


I don't know of a good fix for this build error.

-- 
~Randy
