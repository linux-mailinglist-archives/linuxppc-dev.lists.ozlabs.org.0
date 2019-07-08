Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF8618D7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:31:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hnww2qNczDqSj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hnfr6QhvzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hnfr1rqRz9sNC; Mon,  8 Jul 2019 11:19:32 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d98fc70fc139b72ae098d24fde42ad70c8ff2f81
In-Reply-To: <139368cc27b054f6fe155011dad63ef753db036e.1557824379.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 3/4] powerpc/32: define helpers to get L1 cache sizes.
Message-Id: <45hnfr1rqRz9sNC@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:32 +1000 (AEST)
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

On Tue, 2019-05-14 at 09:05:15 UTC, Christophe Leroy wrote:
> This patch defines C helpers to retrieve the size of
> cache blocks and uses them in the cacheflush functions.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d98fc70fc139b72ae098d24fde42ad70c8ff2f81

cheers
