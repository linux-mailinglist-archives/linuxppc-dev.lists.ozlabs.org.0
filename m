Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 858C47EA59
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 04:32:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460B4y16HXzDqvj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 12:32:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460B0l5bJ4zDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 460B0l4cPHz9s7T; Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 460B0l4BJFz9sND; Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7db57e77586744af46c8bbf8f831bb2b941b7afc
In-Reply-To: <20190730141917.21817-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/spe: Mark expected switch fall-throughs
Message-Id: <460B0l4BJFz9sND@ozlabs.org>
Date: Fri,  2 Aug 2019 12:28:23 +1000 (AEST)
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
Cc: gustavo@embeddedor.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-07-30 at 14:19:17 UTC, Michael Ellerman wrote:
> Mark switch cases where we are expecting to fall through.
> 
> Fixes errors such as below, seen with mpc85xx_defconfig:
> 
>   arch/powerpc/kernel/align.c: In function 'emulate_spe':
>   arch/powerpc/kernel/align.c:178:8: error: this statement may fall through
>     ret |= __get_user_inatomic(temp.v[3], p++);
>         ^~
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc fixes.

https://git.kernel.org/powerpc/c/7db57e77586744af46c8bbf8f831bb2b941b7afc

cheers
