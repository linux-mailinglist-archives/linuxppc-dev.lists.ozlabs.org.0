Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F22771B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 14:58:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxw7y0LghzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 22:58:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxvTR4B13zDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 22:28:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BxvTP6v5zz9sTm; Thu, 24 Sep 2020 22:28:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BxvTP210sz9sTl; Thu, 24 Sep 2020 22:28:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200821103407.3362149-1-mpe@ellerman.id.au>
References: <20200821103407.3362149-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/prom_init: Check display props exist before
 enabling btext
Message-Id: <160095000035.26280.16961948456697506476.b4-ty@ellerman.id.au>
Date: Thu, 24 Sep 2020 22:28:08 +1000 (AEST)
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

On Fri, 21 Aug 2020 20:34:07 +1000, Michael Ellerman wrote:
> It's possible to enable CONFIG_PPC_EARLY_DEBUG_BOOTX for a pseries
> kernel (maybe it shouldn't be), which is then booted with qemu/slof.
> 
> But if you do that the kernel crashes in draw_byte(), with a DAR
> pointing somewhere near INT_MAX.
> 
> Adding some debug to prom_init we see that we're not able to read the
> "address" property from OF, so we're just using whatever junk value
> was on the stack.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/prom_init: Check display props exist before enabling btext
      https://git.kernel.org/powerpc/c/6c71cfcc01685ef495ca7886471a76e73446424e

cheers
