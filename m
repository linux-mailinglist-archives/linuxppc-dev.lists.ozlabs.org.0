Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FBA2E0A9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:27:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0cZT0s3HzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:27:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cDJ2LNczDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4D0cDH6CKJz9sWm; Wed, 23 Dec 2020 00:11:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D0cDH2VQRz9sWc; Wed, 23 Dec 2020 00:11:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, masahiroy@kernel.org
In-Reply-To: <20201215032906.473460-1-mpe@ellerman.id.au>
References: <20201215032906.473460-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/boot: Fix build of dts/fsl
Message-Id: <160864266148.1929899.13857311585172845430.b4-ty@ellerman.id.au>
Date: Wed, 23 Dec 2020 00:11:27 +1100 (AEDT)
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Dec 2020 14:29:06 +1100, Michael Ellerman wrote:
> The lkp robot reported that some configs fail to build, for example
> mpc85xx_smp_defconfig, with:
> 
>   cc1: fatal error: opening output file arch/powerpc/boot/dts/fsl/.mpc8540ads.dtb.dts.tmp: No such file or directory
> 
> This bisects to:
>   cc8a51ca6f05 ("kbuild: always create directories of targets")
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/boot: Fix build of dts/fsl
      https://git.kernel.org/powerpc/c/b36f835b636908e4122f2e17310b1dbc380a3b19

cheers
