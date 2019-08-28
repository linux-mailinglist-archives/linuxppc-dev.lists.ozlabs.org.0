Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091F9F980
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:41:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JCkH04mZzDr39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 14:41:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JCM6242HzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 14:24:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46JCM570Xkz9sP6; Wed, 28 Aug 2019 14:24:49 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c691b4b83b6a348f7b9d13c36916e73c2e1d85e4
In-Reply-To: <d60ce8dd3a383c7adbfc322bf1d53d81724a6000.1566311636.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, segher@kernel.crashing.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/3] powerpc: rewrite LOAD_REG_IMMEDIATE() as an
 intelligent macro
Message-Id: <46JCM570Xkz9sP6@ozlabs.org>
Date: Wed, 28 Aug 2019 14:24:49 +1000 (AEST)
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

On Tue, 2019-08-20 at 14:34:12 UTC, Christophe Leroy wrote:
> Today LOAD_REG_IMMEDIATE() is a basic #define which loads all
> parts on a value into a register, including the parts that are NUL.
> 
> This means always 2 instructions on PPC32 and always 5 instructions
> on PPC64. And those instructions cannot run in parallele as they are
> updating the same register.
> 
> Ex: LOAD_REG_IMMEDIATE(r1,THREAD_SIZE) in head_64.S results in:
> 
> 3c 20 00 00     lis     r1,0
> 60 21 00 00     ori     r1,r1,0
> 78 21 07 c6     rldicr  r1,r1,32,31
> 64 21 00 00     oris    r1,r1,0
> 60 21 40 00     ori     r1,r1,16384
> 
> Rewrite LOAD_REG_IMMEDIATE() with GAS macro in order to skip
> the parts that are NUL.
> 
> Rename existing LOAD_REG_IMMEDIATE() as LOAD_REG_IMMEDIATE_SYM()
> and use that one for loading value of symbols which are not known
> at compile time.
> 
> Now LOAD_REG_IMMEDIATE(r1,THREAD_SIZE) in head_64.S results in:
> 
> 38 20 40 00     li      r1,16384
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c691b4b83b6a348f7b9d13c36916e73c2e1d85e4

cheers
