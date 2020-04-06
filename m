Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D119F72F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:48:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wsMX0jgLzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:48:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrQ63VYHzDr6L
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:06:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48wrQ549ZWz9sRY; Mon,  6 Apr 2020 23:06:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48wrQ51vFHz9sSJ; Mon,  6 Apr 2020 23:06:04 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6ba4a2d3591039aea1cb45c7c42262d26351a2fa
In-Reply-To: <20200403095656.3772005-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Always build the tm-poison test 64-bit
Message-Id: <48wrQ51vFHz9sSJ@ozlabs.org>
Date: Mon,  6 Apr 2020 23:06:04 +1000 (AEST)
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
Cc: gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-04-03 at 09:56:56 UTC, Michael Ellerman wrote:
> The tm-poison test includes inline asm which is 64-bit only, so the
> test must be built 64-bit in order to work.
> 
> Otherwise it fails, eg:
>   # file tm-poison
>   tm-poison: ELF 32-bit MSB executable, PowerPC or cisco 4500, version 1 (SYSV) ...
>   # ./tm-poison
>   test: tm_poison_test
>   Unknown value 0x1fff71150 leaked into f31!
>   Unknown value 0x1fff710c0 leaked into vr31!
>   failure: tm_poison_test
> 
> Fixes: a003365cab64 ("powerpc/tm: Add tm-poison test")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/6ba4a2d3591039aea1cb45c7c42262d26351a2fa

cheers
