Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A60782D5B45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:09:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsDl13STbzDqhN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:09:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXl0MzNzDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXk02sKz9sXP; Thu, 10 Dec 2020 22:29:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <822833ce3dc10634339818f7d1ab616edf63b0c6.1603041883.git.christophe.leroy@csgroup.eu>
References: <822833ce3dc10634339818f7d1ab616edf63b0c6.1603041883.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] powerpc/44x: Don't support 440 when CONFIG_PPC_47x
 is set
Message-Id: <160756607162.1313423.10915542444729443523.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:54 +1100 (AEDT)
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

On Sun, 18 Oct 2020 17:25:17 +0000 (UTC), Christophe Leroy wrote:
> As stated in platform/44x/Kconfig, CONFIG_PPC_47x is not
> compatible with 440 and 460 variants.
> 
> This is confirmed in asm/cache.h as L1_CACHE_SHIFT is different
> for 47x, meaning a kernel built for 47x will not run correctly
> on a 440.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/44x: Don't support 440 when CONFIG_PPC_47x is set
      https://git.kernel.org/powerpc/c/8b8319b181fd9d6821703fef1228b4dcde613a16
[2/2] powerpc/44x: Don't support 47x code and non 47x code at the same time
      https://git.kernel.org/powerpc/c/1f69aa0b89240653fdf708aada6a3d968447cce7

cheers
