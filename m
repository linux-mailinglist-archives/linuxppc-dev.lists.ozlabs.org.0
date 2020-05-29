Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9A1E74E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 06:34:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YBY658NKzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 14:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YBKc1GSXzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 14:24:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49YBKb2VVkz9sT6; Fri, 29 May 2020 14:24:17 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 17bc43367fc2a720400d21c745db641c654c1e6b
In-Reply-To: <fe952112c29bf6a0a2778c9e6bbb4f4afd2c4258.1587143308.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com,
 segher@kernel.crashing.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 2/2] powerpc/uaccess: Implement unsafe_copy_to_user()
 as a simple loop
Message-Id: <49YBKb2VVkz9sT6@ozlabs.org>
Date: Fri, 29 May 2020 14:24:17 +1000 (AEST)
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

On Fri, 2020-04-17 at 17:08:52 UTC, Christophe Leroy wrote:
> At the time being, unsafe_copy_to_user() is based on
> raw_copy_to_user() which calls __copy_tofrom_user().
> 
> __copy_tofrom_user() is a big optimised function to copy big amount
> of data. It aligns destinations to cache line in order to use
> dcbz instruction.
> 
> Today unsafe_copy_to_user() is called only from filldir().
> It is used to mainly copy small amount of data like filenames,
> so __copy_tofrom_user() is not fit.
> 
> Also, unsafe_copy_to_user() is used within user_access_begin/end
> sections. In those section, it is preferable to not call functions.
> 
> Rewrite unsafe_copy_to_user() as a macro that uses __put_user_goto().
> We first perform a loop of long, then we finish with necessary
> complements.
> 
> unsafe_copy_to_user() might be used in the near future to copy
> fixed-size data, like pt_regs structs during signal processing.
> Having it as a macro allows GCC to optimise it for instead when
> it knows the size in advance, it can unloop loops, drop complements
> when the size is a multiple of longs, etc ...
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc topic/uaccess-ppc, thanks.

https://git.kernel.org/powerpc/c/17bc43367fc2a720400d21c745db641c654c1e6b

cheers
