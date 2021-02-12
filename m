Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8237431978E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:41:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcF752JC6zDx04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:41:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf92YJ7zDwlq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:20:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf85CMnz9sVt; Fri, 12 Feb 2021 11:20:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210210130804.3190952-1-mpe@ellerman.id.au>
References: <20210210130804.3190952-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc/83xx: Fix build error when CONFIG_PCI=n
Message-Id: <161308905035.3606979.9092922959917653953.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:20:00 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Feb 2021 00:08:02 +1100, Michael Ellerman wrote:
> As reported by lkp:
> 
>   arch/powerpc/platforms/83xx/km83xx.c:183:19: error: 'mpc83xx_setup_pci' undeclared here (not in a function)
>      183 |  .discover_phbs = mpc83xx_setup_pci,
> 	 |                   ^~~~~~~~~~~~~~~~~
> 	 |                   mpc83xx_setup_arch
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/83xx: Fix build error when CONFIG_PCI=n
      https://git.kernel.org/powerpc/c/5c47c44f157f408c862b144bbd1d1e161a521aa2
[2/3] powerpc/mm/64s: Fix no previous prototype warning
      https://git.kernel.org/powerpc/c/2bb421a3d93601aa81bc39af7aac7280303e0761
[3/3] powerpc/amigaone: Make amigaone_discover_phbs() static
      https://git.kernel.org/powerpc/c/f30520c64f290589e91461d7326b497c23e7f5fd

cheers
