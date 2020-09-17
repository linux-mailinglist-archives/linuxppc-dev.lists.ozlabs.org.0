Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A861226DA73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:39:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsZkJ6BbNzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:39:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSQ00mZzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSP52cjz9sTs; Thu, 17 Sep 2020 21:27:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <94ba5a5138f99522e1562dbcdb38d31aa790dc89.1599216721.git.christophe.leroy@csgroup.eu>
References: <94ba5a5138f99522e1562dbcdb38d31aa790dc89.1599216721.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/uaccess: Switch __put_user_size_allowed() to
 __put_user_asm_goto()
Message-Id: <160034201413.3339803.2260455102175755865.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:17 +1000 (AEST)
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

On Fri, 4 Sep 2020 11:01:30 +0000 (UTC), Christophe Leroy wrote:
> __put_user_asm_goto() provides more flexibility to GCC and avoids using
> a local variable to tell if the write succeeded or not.
> GCC can then avoid implementing a cmp in the fast path.
> 
> See the difference for a small function like the PPC64 version of
> save_general_regs() in arch/powerpc/kernel/signal_32.c:
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/uaccess: Switch __put_user_size_allowed() to __put_user_asm_goto()
      https://git.kernel.org/powerpc/c/ee0a49a6870ea75e25b4d4984c1bb6b3b7c65f2b
[2/3] powerpc/uaccess: Switch __patch_instruction() to __put_user_asm_goto()
      https://git.kernel.org/powerpc/c/e64ac41ab0c510b3f85199a585eb886cad92fb19
[3/3] powerpc/uaccess: Remove __put_user_asm() and __put_user_asm2()
      https://git.kernel.org/powerpc/c/7fdf966bed155b214f4f1f9b67825a40b2e9b998

cheers
