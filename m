Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A75665542
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 08:40:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsKND0lHBz3f9x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 18:40:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RrSr59lP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsKMH3k9jz3bhW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 18:39:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RrSr59lP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NsKMB5Gm2z4wgq;
	Wed, 11 Jan 2023 18:39:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673422777;
	bh=PUC4l7Fl/CYIwqAtVD801/4BMGg7ktBI9zLEQEpluMA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RrSr59lPcKMMbBRFNah0TBy4jWHYK+OAp0ldEdZrhxHrj9fqUi3YjxqVs8D2LmUPZ
	 C6XvY25KTWziL2MY964rkXsMaCYC0kaLRdyO1ZPcRvasepS55tvcLTH3YMOvALoulu
	 njFE0TxSKQ/Yq1k2cZc7muh3oBebitI+efc8CxqPF++EiY76ZWDD69qZFL7IBjmCwN
	 CwF7c3tGuapY1S1rI/jXx8RZ+U7qRUP/CjKxu2qCOyibxWoyS26RyVxE8Q2tj9dsKM
	 4Zinmz9uTmH9JmUv4S1Ibp5MicKUwxm98ice6UaD2qrIMfx4LVxR86SSpOhUf9fXQb
	 /8QMIDCGPUvVQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: usb.c:undefined reference to `qe_immr'
In-Reply-To: <a0e325d2-a9c5-ffca-b2d6-5eea60f9ad3b@infradead.org>
References: <202301101500.pillNv6R-lkp@intel.com>
 <a0e325d2-a9c5-ffca-b2d6-5eea60f9ad3b@infradead.org>
Date: Wed, 11 Jan 2023 18:39:30 +1100
Message-ID: <87lem9h64t.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Randy Dunlap <rdunlap@infradead.org> writes:
> [adding Cc's]
>
>
> On 1/9/23 23:59, kernel test robot wrote:
>> Hi Masahiro,
>> 
>> FYI, the error/warning still remains.
>> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   5a41237ad1d4b62008f93163af1d9b1da90729d8
>> commit: 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
>> date:   8 months ago
>> config: powerpc-randconfig-r026-20230110
>> compiler: powerpc-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b4537199a4a8480b8c3ba37a2d44765ce76cd9b
>>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>         git fetch --no-tags linus master
>>         git checkout 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b
>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
>> 
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    powerpc-linux-ld: powerpc-linux-ld: DWARF error: could not find abbrev number 74
>>    drivers/soc/fsl/qe/usb.o: in function `qe_usb_clock_set':
>>>> usb.c:(.text+0x1e): undefined reference to `qe_immr'
>>>> powerpc-linux-ld: usb.c:(.text+0x2a): undefined reference to `qe_immr'
>>>> powerpc-linux-ld: usb.c:(.text+0xbc): undefined reference to `qe_setbrg'
>>>> powerpc-linux-ld: usb.c:(.text+0xca): undefined reference to `cmxgcr_lock'
>>    powerpc-linux-ld: usb.c:(.text+0xce): undefined reference to `cmxgcr_lock'
>> 
>
> .config extract:
>
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # CONFIG_QUICC_ENGINE is not set
> CONFIG_QE_USB=y
>
>
> This is caused by (drivers/soc/fsl/qe/Kconfig):
>
> config QE_USB
> 	bool
> 	default y if USB_FSL_QE
> 	help
> 	  QE USB Controller support
>
> which does not depend on QUICC_ENGINE, where the latter build provides
> the missing symbols.

So QE_USB should depend on QUICC_ENGINE no?

cheers
