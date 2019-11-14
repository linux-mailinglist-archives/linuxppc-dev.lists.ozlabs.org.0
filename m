Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B1FC27E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:22:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGGd3MvbzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxW2LXhzF4wp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:07:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxV07nsz9sPZ; Thu, 14 Nov 2019 20:07:41 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d79fbb3a32f05a7e1cc0294b86dacdb9cc3ad7f5
In-Reply-To: <20190801225006.21952-1-chris.packham@alliedtelesis.co.nz>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, benh@kernel.crashing.org,
 paulus@samba.org, christophe.leroy@c-s.fr, malat@debian.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc: Support CMDLINE_EXTEND
Message-Id: <47DFxV07nsz9sPZ@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:41 +1100 (AEDT)
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-08-01 at 22:50:06 UTC, Chris Packham wrote:
> Bring powerpc in line with other architectures that support extending or
> overriding the bootloader provided command line.
> 
> The current behaviour is most like CMDLINE_FROM_BOOTLOADER where the
> bootloader command line is preferred but the kernel config can provide a
> fallback so CMDLINE_FROM_BOOTLOADER is the default. CMDLINE_EXTEND can
> be used to append the CMDLINE from the kernel config to the one provided
> by the bootloader.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d79fbb3a32f05a7e1cc0294b86dacdb9cc3ad7f5

cheers
