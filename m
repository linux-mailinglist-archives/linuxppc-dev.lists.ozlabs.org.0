Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD631688A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:00:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbLxK3tGPzDvWH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:00:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKYF4DvdzDshb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:37 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DbKYD1Bbyz9sWg; Wed, 10 Feb 2021 23:57:36 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKYC2HcJz9sW2; Wed, 10 Feb 2021 23:57:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210201012503.940145-1-mpe@ellerman.id.au>
References: <20210201012503.940145-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/akebono: Fix unmet dependency errors
Message-Id: <161296171938.3178259.4921214324490062203.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:34 +1100 (AEDT)
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
Cc: f.fainelli@gmail.com, rdunlap@infradead.org, yury.norov@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 1 Feb 2021 12:25:03 +1100, Michael Ellerman wrote:
> The AKEBONO config has various selects under it, including some with
> user-selectable dependencies, which means those dependencies can be
> disabled. This leads to warnings from Kconfig.
> 
> This can be seen with eg:
> 
>   $ make allnoconfig
>   $ ./scripts/config --file build~/.config -k -e CONFIG_44x -k -e CONFIG_PPC_47x -e CONFIG_AKEBONO
>   $ make olddefconfig
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/akebono: Fix unmet dependency errors
      https://git.kernel.org/powerpc/c/665d8d58761cba41147fe7e98e2ceed1cbf603a2

cheers
