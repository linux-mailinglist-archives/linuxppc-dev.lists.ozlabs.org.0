Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A74342AAA98
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 11:38:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTVwK3FrxzDr5s
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 21:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTVjy5KHjzDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Nov 2020 21:29:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4CTVjx2FzZz9sTD; Sun,  8 Nov 2020 21:29:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CTVjw5nCyz9sVD; Sun,  8 Nov 2020 21:29:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201104111742.672142-1-mpe@ellerman.id.au>
References: <20201104111742.672142-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Use asm_goto_volatile for put_user()
Message-Id: <160483134266.1400561.1749074181140263524.b4-ty@ellerman.id.au>
Date: Sun,  8 Nov 2020 21:29:40 +1100 (AEDT)
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
Cc: schwab@linux-m68k.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 4 Nov 2020 22:17:42 +1100, Michael Ellerman wrote:
> Andreas reported that commit ee0a49a6870e ("powerpc/uaccess: Switch
> __put_user_size_allowed() to __put_user_asm_goto()") broke
> CLONE_CHILD_SETTID.
> 
> Further inspection showed that the put_user() in schedule_tail() was
> missing entirely, the store not emitted by the compiler.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Use asm_goto_volatile for put_user()
      https://git.kernel.org/powerpc/c/1344a232016dbb0492be81f8517c4bf8fc1c6610

cheers
