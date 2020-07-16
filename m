Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E2B2223EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:31:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wBR3xR9zDr3R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPm0YG2zDql9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:55:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPg1xcLz9sTk; Thu, 16 Jul 2020 22:55:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, corbet@lwn.net,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <261923c075d1cb49d02493685e8585d4ea2a5197.1593698951.git.christophe.leroy@csgroup.eu>
References: <261923c075d1cb49d02493685e8585d4ea2a5197.1593698951.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] docs: powerpc: Clarify book3s/32 MMU families
Message-Id: <159490400710.3805857.5851125255446308712.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:50 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2 Jul 2020 14:09:21 +0000 (UTC), Christophe Leroy wrote:
> Documentation wrongly tells that book3s/32 CPU have hash MMU.
> 
> 603 and e300 core only have software loaded TLB.
> 
> 755, 7450 family and e600 core have both hash MMU and software loaded
> TLB. This can be selected by setting a bit in HID2 (755) or
> HID0 (others). At the time being this is not supported by the kernel.
> 
> [...]

Applied to powerpc/next.

[1/1] docs: powerpc: Clarify book3s/32 MMU families
      https://git.kernel.org/powerpc/c/7d38f089731fe129a49e254028caec6f05420f18

cheers
