Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D216120AB88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 06:56:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPjQ4psKzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 14:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTb2mWKzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTX1xB3z9sT6; Fri, 26 Jun 2020 14:45:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: benh@kernel.crashing.org, paulus@samba.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, christophe.leroy@c-s.fr,
 mpe@ellerman.id.au
In-Reply-To: <20200611224220.25066-1-chris.packham@alliedtelesis.co.nz>
References: <20200611224220.25066-1-chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3 0/2] powerpc: CMDLINE config cleanup
Message-Id: <159314672616.1150869.14723126983856405829.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:45:51 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Jun 2020 10:42:18 +1200, Chris Packham wrote:
> This series cleans up the config options related to the boot command line.
> 
> Chris Packham (2):
>   powerpc: Remove inaccessible CMDLINE default
>   powerpc: configs: remove CMDLINE_BOOL
> 
>  arch/powerpc/Kconfig                           | 6 +-----
>  arch/powerpc/configs/44x/akebono_defconfig     | 2 --
>  arch/powerpc/configs/44x/arches_defconfig      | 2 --
>  arch/powerpc/configs/44x/bamboo_defconfig      | 2 --
>  arch/powerpc/configs/44x/bluestone_defconfig   | 2 --
>  arch/powerpc/configs/44x/canyonlands_defconfig | 2 --
>  arch/powerpc/configs/44x/currituck_defconfig   | 2 --
>  arch/powerpc/configs/44x/eiger_defconfig       | 2 --
>  arch/powerpc/configs/44x/fsp2_defconfig        | 1 -
>  arch/powerpc/configs/44x/icon_defconfig        | 2 --
>  arch/powerpc/configs/44x/iss476-smp_defconfig  | 1 -
>  arch/powerpc/configs/44x/katmai_defconfig      | 2 --
>  arch/powerpc/configs/44x/rainier_defconfig     | 2 --
>  arch/powerpc/configs/44x/redwood_defconfig     | 2 --
>  arch/powerpc/configs/44x/sam440ep_defconfig    | 2 --
>  arch/powerpc/configs/44x/sequoia_defconfig     | 2 --
>  arch/powerpc/configs/44x/taishan_defconfig     | 2 --
>  arch/powerpc/configs/44x/warp_defconfig        | 1 -
>  arch/powerpc/configs/holly_defconfig           | 1 -
>  arch/powerpc/configs/mvme5100_defconfig        | 3 +--
>  arch/powerpc/configs/ps3_defconfig             | 2 --
>  arch/powerpc/configs/skiroot_defconfig         | 1 -
>  arch/powerpc/configs/storcenter_defconfig      | 1 -
>  23 files changed, 2 insertions(+), 43 deletions(-)

Applied to powerpc/next.

[1/2] powerpc: Remove inaccessible CMDLINE default
      https://git.kernel.org/powerpc/c/f134a7cef1d7de45fab028a945b7f34c615718e1
[2/2] powerpc/configs: Remove CMDLINE_BOOL
      https://git.kernel.org/powerpc/c/0488d32530ecff973c40f2592a6eab2907d0a5cc

cheers
