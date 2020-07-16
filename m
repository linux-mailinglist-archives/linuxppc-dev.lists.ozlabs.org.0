Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86877222450
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:53:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6whd17BCzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:53:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQ16Z4szDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPv5kPyz9sVP; Thu, 16 Jul 2020 22:56:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <natechancellor@gmail.com>
In-Reply-To: <20200624035920.835571-1-natechancellor@gmail.com>
References: <20200624035920.835571-1-natechancellor@gmail.com>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
Message-Id: <159490400429.3805857.14182608515747263467.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:03 +1000 (AEST)
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
Cc: Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jun 2020 20:59:20 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> arch/powerpc/boot/main.c:107:18: warning: array comparison always
> evaluates to a constant [-Wtautological-compare]
>         if (_initrd_end > _initrd_start) {
>                         ^
> arch/powerpc/boot/main.c:155:20: warning: array comparison always
> evaluates to a constant [-Wtautological-compare]
>         if (_esm_blob_end <= _esm_blob_start)
>                           ^
> 2 warnings generated.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/boot: Use address-of operator on section symbols
      https://git.kernel.org/powerpc/c/df4232d96e724d09e54a623362f9f610727f059f

cheers
