Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3831F33FB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:16:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0HV5wDhzDqCw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:16:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFL2VK5zDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFK005lz9sTq; Tue,  9 Jun 2020 15:29:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Michael Neuling <mikey@neuling.org>
In-Reply-To: <20200519043009.3081885-1-mikey@neuling.org>
References: <20200519043009.3081885-1-mikey@neuling.org>
Subject: Re: [PATCH] powerpc/configs: Add LIBNVDIMM to ppc64_defconfig
Message-Id: <159168034589.1381411.979939231170896851.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:08 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 19 May 2020 14:30:09 +1000, Michael Neuling wrote:
> This gives us OF_PMEM which is useful in mambo.
> 
> This adds 153K to the text of ppc64le_defconfig which 0.8% of the
> total text.
> 
>   LIBNVDIMM text     data    bss     dec      hex
>   Without   18574833 5518150 1539240 25632223 1871ddf
>   With      18727834 5546206 1539368 25813408 189e1a0

Applied to powerpc/next.

[1/1] powerpc/configs: Add LIBNVDIMM to ppc64_defconfig
      https://git.kernel.org/powerpc/c/08b1add150a8863665676d0ac9c3ad2d34b2540c

cheers
