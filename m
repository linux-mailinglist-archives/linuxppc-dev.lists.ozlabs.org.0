Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E556476F09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 11:41:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF7vx0sTRz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 21:41:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JF7vV2S9Wz2ynd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 21:41:23 +1100 (AEDT)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1mxoC2-00089d-00; Thu, 16 Dec 2021 11:40:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 5AA86C075D; Thu, 16 Dec 2021 11:40:49 +0100 (CET)
Date: Thu, 16 Dec 2021 11:40:49 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH v2 0/6] Cleanup after removal of configs
Message-ID: <20211216104049.GA10578@alpha.franken.de>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rich Felker <dalias@libc.org>, linux-doc@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-mips@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Lee Jones <lee.jones@linaro.org>,
 linux-cifs@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-cachefs@redhat.com,
 linux-arm-kernel@lists.infradead.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-power@fi.rohmeurope.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 16, 2021 at 10:44:20AM +0100, Alexandre Ghiti wrote:
> While bumping from 5.13 to 5.15, I found that a few deleted configs had
> left some pieces here and there: this patchset cleans that.
> 
> Changes in v2:
> - Rebase on top of v5.16-rc1
> - Removed patch 6 since Matti said he would take care of that
> - Added AB, RB
> 
> Alexandre Ghiti (6):
>   Documentation, arch: Remove leftovers from fscache/cachefiles
>     histograms
>   Documentation, arch: Remove leftovers from raw device
>   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
>   arch: Remove leftovers from mandatory file locking
>   Documentation, arch, fs: Remove leftovers from fscache object list
>   arch: Remove leftovers from prism54 wireless driver
> 
>  Documentation/admin-guide/cifs/usage.rst      |   7 +-
>  Documentation/admin-guide/devices.txt         |   8 +-
>  .../filesystems/caching/cachefiles.rst        |  34 -----
>  Documentation/filesystems/caching/fscache.rst | 123 +-----------------
>  arch/arm/configs/axm55xx_defconfig            |   3 -
>  arch/arm/configs/cm_x300_defconfig            |   1 -
>  arch/arm/configs/ezx_defconfig                |   1 -
>  arch/arm/configs/imote2_defconfig             |   1 -
>  arch/arm/configs/nhk8815_defconfig            |   1 -
>  arch/arm/configs/pxa_defconfig                |   1 -
>  arch/arm/configs/spear13xx_defconfig          |   1 -
>  arch/arm/configs/spear3xx_defconfig           |   1 -
>  arch/arm/configs/spear6xx_defconfig           |   1 -
>  arch/mips/configs/decstation_64_defconfig     |   1 -
>  arch/mips/configs/decstation_defconfig        |   1 -
>  arch/mips/configs/decstation_r4k_defconfig    |   1 -
>  arch/mips/configs/fuloong2e_defconfig         |   1 -
>  arch/mips/configs/ip27_defconfig              |   1 -
>  arch/mips/configs/malta_defconfig             |   1 -
>  arch/mips/configs/malta_kvm_defconfig         |   1 -
>  arch/mips/configs/malta_qemu_32r6_defconfig   |   1 -
>  arch/mips/configs/maltaaprp_defconfig         |   1 -
>  arch/mips/configs/maltasmvp_defconfig         |   1 -
>  arch/mips/configs/maltasmvp_eva_defconfig     |   1 -
>  arch/mips/configs/maltaup_defconfig           |   1 -
>  arch/mips/configs/maltaup_xpa_defconfig       |   1 -
>  arch/powerpc/configs/pmac32_defconfig         |   1 -
>  arch/powerpc/configs/ppc6xx_defconfig         |   1 -
>  arch/powerpc/configs/pseries_defconfig        |   1 -
>  arch/sh/configs/titan_defconfig               |   1 -
>  fs/fscache/object.c                           |   3 -
>  fs/fscache/proc.c                             |  12 --
>  32 files changed, 6 insertions(+), 209 deletions(-)

for the MIPS parts:

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
