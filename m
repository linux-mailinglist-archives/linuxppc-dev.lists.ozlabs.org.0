Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 653979F987
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:45:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JCpY6lcYzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 14:45:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JCM71ZlczDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 14:24:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46JCM65tstz9sP9; Wed, 28 Aug 2019 14:24:50 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b4645ffc49cfe34f67feda20c34bd7a859c78312
In-Reply-To: <a8b567c569aa521a7cf1beb061d43d79070e850c.1566492229.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: don't select ARCH_HAS_SCALED_CPUTIME on book3E
Message-Id: <46JCM65tstz9sP9@ozlabs.org>
Date: Wed, 28 Aug 2019 14:24:50 +1000 (AEST)
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

On Thu, 2019-08-22 at 16:44:05 UTC, Christophe Leroy wrote:
> Book3E doesn't have SPRN_SPURR/SPRN_PURR.
> 
> Activating ARCH_HAS_SCALED_CPUTIME is just wasting CPU time.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Link: https://github.com/linuxppc/issues/issues/171

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b4645ffc49cfe34f67feda20c34bd7a859c78312

cheers
