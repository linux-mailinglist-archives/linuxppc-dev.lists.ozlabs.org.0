Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3E3253FA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 09:54:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcZkf4k66zDqXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZYm1nM6zDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BcZYk6tYqz9sTh; Thu, 27 Aug 2020 17:46:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 schwab@linux-m68k.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <09fc73fe9c7423c6b4cf93f93df9bb0ed8eefab5.1597994047.git.christophe.leroy@csgroup.eu>
References: <09fc73fe9c7423c6b4cf93f93df9bb0ed8eefab5.1597994047.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix module loading failure when VMALLOC_END
 is over 0xf0000000
Message-Id: <159851435980.52163.8321314974560450612.b4-ty@ellerman.id.au>
Date: Thu, 27 Aug 2020 17:46:50 +1000 (AEST)
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

On Fri, 21 Aug 2020 07:15:25 +0000 (UTC), Christophe Leroy wrote:
> In is_module_segment(), when VMALLOC_END is over 0xf0000000,
> ALIGN(VMALLOC_END, SZ_256M) has value 0.
> 
> In that case, addr >= ALIGN(VMALLOC_END, SZ_256M) is always
> true then is_module_segment() always returns false.
> 
> Use (ALIGN(VMALLOC_END, SZ_256M) - 1) which will have
> value 0xffffffff and will be suitable for the comparison.

Applied to powerpc/fixes.

[1/1] powerpc/32s: Fix module loading failure when VMALLOC_END is over 0xf0000000
      https://git.kernel.org/powerpc/c/541cebb51f3422d4f2c6cb95c1e5cc3dcc9e5021

cheers
